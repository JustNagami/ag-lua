return {
	Play318301001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 318301001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play318301002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "STblack"

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
				local var_4_5 = arg_1_1.bgs_.STblack

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
					if iter_4_0 ~= "STblack" then
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
			local var_4_23 = 0.533333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.8
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_4_story_firework", "bgm_activity_2_4_story_firework", "bgm_activity_2_4_story_firework.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.75

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

				local var_4_33 = arg_1_1:GetWordFromCfg(318301001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 30
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
	Play318301002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 318301002
		arg_7_1.duration_ = 5.7

		local var_7_0 = {
			zh = 4.066666666666,
			ja = 5.7
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
				arg_7_0:Play318301003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "K11g"

			if arg_7_1.bgs_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(arg_7_1.paintGo_)

				var_10_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_10_0)
				var_10_1.name = var_10_0
				var_10_1.transform.parent = arg_7_1.stage_.transform
				var_10_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.bgs_[var_10_0] = var_10_1
			end

			local var_10_2 = 0

			if var_10_2 < arg_7_1.time_ and arg_7_1.time_ <= var_10_2 + arg_10_0 then
				local var_10_3 = manager.ui.mainCamera.transform.localPosition
				local var_10_4 = Vector3.New(0, 0, 10) + Vector3.New(var_10_3.x, var_10_3.y, 0)
				local var_10_5 = arg_7_1.bgs_.K11g

				var_10_5.transform.localPosition = var_10_4
				var_10_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_10_6 = var_10_5:GetComponent("SpriteRenderer")

				if var_10_6 and var_10_6.sprite then
					local var_10_7 = (var_10_5.transform.localPosition - var_10_3).z
					local var_10_8 = manager.ui.mainCameraCom_
					local var_10_9 = 2 * var_10_7 * Mathf.Tan(var_10_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_10_10 = var_10_9 * var_10_8.aspect
					local var_10_11 = var_10_6.sprite.bounds.size.x
					local var_10_12 = var_10_6.sprite.bounds.size.y
					local var_10_13 = var_10_10 / var_10_11
					local var_10_14 = var_10_9 / var_10_12
					local var_10_15 = var_10_14 < var_10_13 and var_10_13 or var_10_14

					var_10_5.transform.localScale = Vector3.New(var_10_15, var_10_15, 0)
				end

				for iter_10_0, iter_10_1 in pairs(arg_7_1.bgs_) do
					if iter_10_0 ~= "K11g" then
						iter_10_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 then
				arg_7_1.mask_.enabled = true
				arg_7_1.mask_.raycastTarget = true

				arg_7_1:SetGaussion(false)
			end

			local var_10_17 = 2

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17
				local var_10_19 = Color.New(0, 0, 0)

				var_10_19.a = Mathf.Lerp(1, 0, var_10_18)
				arg_7_1.mask_.color = var_10_19
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 then
				local var_10_20 = Color.New(0, 0, 0)
				local var_10_21 = 0

				arg_7_1.mask_.enabled = false
				var_10_20.a = var_10_21
				arg_7_1.mask_.color = var_10_20
			end

			local var_10_22 = "1049ui_story"

			if arg_7_1.actors_[var_10_22] == nil then
				local var_10_23 = Object.Instantiate(Asset.Load("Char/" .. var_10_22), arg_7_1.stage_.transform)

				var_10_23.name = var_10_22
				var_10_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_22] = var_10_23

				local var_10_24 = var_10_23:GetComponentInChildren(typeof(CharacterEffect))

				var_10_24.enabled = true

				local var_10_25 = GameObjectTools.GetOrAddComponent(var_10_23, typeof(DynamicBoneHelper))

				if var_10_25 then
					var_10_25:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_24.transform, false)

				arg_7_1.var_[var_10_22 .. "Animator"] = var_10_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_22 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_22 .. "LipSync"] = var_10_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_26 = arg_7_1.actors_["1049ui_story"].transform
			local var_10_27 = 1.8

			if var_10_27 < arg_7_1.time_ and arg_7_1.time_ <= var_10_27 + arg_10_0 then
				arg_7_1.var_.moveOldPos1049ui_story = var_10_26.localPosition
			end

			local var_10_28 = 0.001

			if var_10_27 <= arg_7_1.time_ and arg_7_1.time_ < var_10_27 + var_10_28 then
				local var_10_29 = (arg_7_1.time_ - var_10_27) / var_10_28
				local var_10_30 = Vector3.New(0, -1.2, -6)

				var_10_26.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1049ui_story, var_10_30, var_10_29)

				local var_10_31 = manager.ui.mainCamera.transform.position - var_10_26.position

				var_10_26.forward = Vector3.New(var_10_31.x, var_10_31.y, var_10_31.z)

				local var_10_32 = var_10_26.localEulerAngles

				var_10_32.z = 0
				var_10_32.x = 0
				var_10_26.localEulerAngles = var_10_32
			end

			if arg_7_1.time_ >= var_10_27 + var_10_28 and arg_7_1.time_ < var_10_27 + var_10_28 + arg_10_0 then
				var_10_26.localPosition = Vector3.New(0, -1.2, -6)

				local var_10_33 = manager.ui.mainCamera.transform.position - var_10_26.position

				var_10_26.forward = Vector3.New(var_10_33.x, var_10_33.y, var_10_33.z)

				local var_10_34 = var_10_26.localEulerAngles

				var_10_34.z = 0
				var_10_34.x = 0
				var_10_26.localEulerAngles = var_10_34
			end

			local var_10_35 = arg_7_1.actors_["1049ui_story"]
			local var_10_36 = 1.8

			if var_10_36 < arg_7_1.time_ and arg_7_1.time_ <= var_10_36 + arg_10_0 and arg_7_1.var_.characterEffect1049ui_story == nil then
				arg_7_1.var_.characterEffect1049ui_story = var_10_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_37 = 0.200000002980232

			if var_10_36 <= arg_7_1.time_ and arg_7_1.time_ < var_10_36 + var_10_37 then
				local var_10_38 = (arg_7_1.time_ - var_10_36) / var_10_37

				if arg_7_1.var_.characterEffect1049ui_story then
					arg_7_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_36 + var_10_37 and arg_7_1.time_ < var_10_36 + var_10_37 + arg_10_0 and arg_7_1.var_.characterEffect1049ui_story then
				arg_7_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_10_39 = 1.8

			if var_10_39 < arg_7_1.time_ and arg_7_1.time_ <= var_10_39 + arg_10_0 then
				arg_7_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_10_40 = 1.8

			if var_10_40 < arg_7_1.time_ and arg_7_1.time_ <= var_10_40 + arg_10_0 then
				arg_7_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_7_1.frameCnt_ <= 1 then
				arg_7_1.dialog_:SetActive(false)
			end

			local var_10_41 = 2
			local var_10_42 = 0.25

			if var_10_41 < arg_7_1.time_ and arg_7_1.time_ <= var_10_41 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0

				arg_7_1.dialog_:SetActive(true)

				local var_10_43 = LeanTween.value(arg_7_1.dialog_, 0, 1, 0.3)

				var_10_43:setOnUpdate(LuaHelper.FloatAction(function(arg_11_0)
					arg_7_1.dialogCg_.alpha = arg_11_0
				end))
				var_10_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_7_1.dialog_)
					var_10_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_7_1.duration_ = arg_7_1.duration_ + 0.3

				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_44 = arg_7_1:FormatText(StoryNameCfg[562].name)

				arg_7_1.leftNameTxt_.text = var_10_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_45 = arg_7_1:GetWordFromCfg(318301002)
				local var_10_46 = arg_7_1:FormatText(var_10_45.content)

				arg_7_1.text_.text = var_10_46

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_47 = 10
				local var_10_48 = utf8.len(var_10_46)
				local var_10_49 = var_10_47 <= 0 and var_10_42 or var_10_42 * (var_10_48 / var_10_47)

				if var_10_49 > 0 and var_10_42 < var_10_49 then
					arg_7_1.talkMaxDuration = var_10_49
					var_10_41 = var_10_41 + 0.3

					if var_10_49 + var_10_41 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_49 + var_10_41
					end
				end

				arg_7_1.text_.text = var_10_46
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301002", "story_v_out_318301.awb") ~= 0 then
					local var_10_50 = manager.audio:GetVoiceLength("story_v_out_318301", "318301002", "story_v_out_318301.awb") / 1000

					if var_10_50 + var_10_41 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_50 + var_10_41
					end

					if var_10_45.prefab_name ~= "" and arg_7_1.actors_[var_10_45.prefab_name] ~= nil then
						local var_10_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_45.prefab_name].transform, "story_v_out_318301", "318301002", "story_v_out_318301.awb")

						arg_7_1:RecordAudio("318301002", var_10_51)
						arg_7_1:RecordAudio("318301002", var_10_51)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_318301", "318301002", "story_v_out_318301.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_318301", "318301002", "story_v_out_318301.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_52 = var_10_41 + 0.3
			local var_10_53 = math.max(var_10_42, arg_7_1.talkMaxDuration)

			if var_10_52 <= arg_7_1.time_ and arg_7_1.time_ < var_10_52 + var_10_53 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_52) / var_10_53

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_52 + var_10_53 and arg_7_1.time_ < var_10_52 + var_10_53 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play318301003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 318301003
		arg_13_1.duration_ = 15.1

		local var_13_0 = {
			zh = 7.7,
			ja = 15.1
		}
		local var_13_1 = manager.audio:GetLocalizationFlag()

		if var_13_0[var_13_1] ~= nil then
			arg_13_1.duration_ = var_13_0[var_13_1]
		end

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play318301004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.625

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[562].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(318301003)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 25
				local var_16_6 = utf8.len(var_16_4)
				local var_16_7 = var_16_5 <= 0 and var_16_1 or var_16_1 * (var_16_6 / var_16_5)

				if var_16_7 > 0 and var_16_1 < var_16_7 then
					arg_13_1.talkMaxDuration = var_16_7

					if var_16_7 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_7 + var_16_0
					end
				end

				arg_13_1.text_.text = var_16_4
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301003", "story_v_out_318301.awb") ~= 0 then
					local var_16_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301003", "story_v_out_318301.awb") / 1000

					if var_16_8 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_8 + var_16_0
					end

					if var_16_3.prefab_name ~= "" and arg_13_1.actors_[var_16_3.prefab_name] ~= nil then
						local var_16_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_3.prefab_name].transform, "story_v_out_318301", "318301003", "story_v_out_318301.awb")

						arg_13_1:RecordAudio("318301003", var_16_9)
						arg_13_1:RecordAudio("318301003", var_16_9)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_318301", "318301003", "story_v_out_318301.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_318301", "318301003", "story_v_out_318301.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_10 = math.max(var_16_1, arg_13_1.talkMaxDuration)

			if var_16_0 <= arg_13_1.time_ and arg_13_1.time_ < var_16_0 + var_16_10 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_0) / var_16_10

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_0 + var_16_10 and arg_13_1.time_ < var_16_0 + var_16_10 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play318301004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 318301004
		arg_17_1.duration_ = 5.233

		local var_17_0 = {
			zh = 3.766,
			ja = 5.233
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play318301005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = "1199ui_story"

			if arg_17_1.actors_[var_20_0] == nil then
				local var_20_1 = Object.Instantiate(Asset.Load("Char/" .. var_20_0), arg_17_1.stage_.transform)

				var_20_1.name = var_20_0
				var_20_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_17_1.actors_[var_20_0] = var_20_1

				local var_20_2 = var_20_1:GetComponentInChildren(typeof(CharacterEffect))

				var_20_2.enabled = true

				local var_20_3 = GameObjectTools.GetOrAddComponent(var_20_1, typeof(DynamicBoneHelper))

				if var_20_3 then
					var_20_3:EnableDynamicBone(false)
				end

				arg_17_1:ShowWeapon(var_20_2.transform, false)

				arg_17_1.var_[var_20_0 .. "Animator"] = var_20_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_17_1.var_[var_20_0 .. "Animator"].applyRootMotion = true
				arg_17_1.var_[var_20_0 .. "LipSync"] = var_20_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_20_4 = arg_17_1.actors_["1199ui_story"].transform
			local var_20_5 = 0

			if var_20_5 < arg_17_1.time_ and arg_17_1.time_ <= var_20_5 + arg_20_0 then
				arg_17_1.var_.moveOldPos1199ui_story = var_20_4.localPosition
			end

			local var_20_6 = 0.001

			if var_20_5 <= arg_17_1.time_ and arg_17_1.time_ < var_20_5 + var_20_6 then
				local var_20_7 = (arg_17_1.time_ - var_20_5) / var_20_6
				local var_20_8 = Vector3.New(0, -1.08, -5.9)

				var_20_4.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1199ui_story, var_20_8, var_20_7)

				local var_20_9 = manager.ui.mainCamera.transform.position - var_20_4.position

				var_20_4.forward = Vector3.New(var_20_9.x, var_20_9.y, var_20_9.z)

				local var_20_10 = var_20_4.localEulerAngles

				var_20_10.z = 0
				var_20_10.x = 0
				var_20_4.localEulerAngles = var_20_10
			end

			if arg_17_1.time_ >= var_20_5 + var_20_6 and arg_17_1.time_ < var_20_5 + var_20_6 + arg_20_0 then
				var_20_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_20_11 = manager.ui.mainCamera.transform.position - var_20_4.position

				var_20_4.forward = Vector3.New(var_20_11.x, var_20_11.y, var_20_11.z)

				local var_20_12 = var_20_4.localEulerAngles

				var_20_12.z = 0
				var_20_12.x = 0
				var_20_4.localEulerAngles = var_20_12
			end

			local var_20_13 = arg_17_1.actors_["1199ui_story"]
			local var_20_14 = 0

			if var_20_14 < arg_17_1.time_ and arg_17_1.time_ <= var_20_14 + arg_20_0 and arg_17_1.var_.characterEffect1199ui_story == nil then
				arg_17_1.var_.characterEffect1199ui_story = var_20_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_15 = 0.200000002980232

			if var_20_14 <= arg_17_1.time_ and arg_17_1.time_ < var_20_14 + var_20_15 then
				local var_20_16 = (arg_17_1.time_ - var_20_14) / var_20_15

				if arg_17_1.var_.characterEffect1199ui_story then
					arg_17_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_17_1.time_ >= var_20_14 + var_20_15 and arg_17_1.time_ < var_20_14 + var_20_15 + arg_20_0 and arg_17_1.var_.characterEffect1199ui_story then
				arg_17_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_20_17 = 0

			if var_20_17 < arg_17_1.time_ and arg_17_1.time_ <= var_20_17 + arg_20_0 then
				arg_17_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action3_1")
			end

			local var_20_18 = 0

			if var_20_18 < arg_17_1.time_ and arg_17_1.time_ <= var_20_18 + arg_20_0 then
				arg_17_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_20_19 = arg_17_1.actors_["1049ui_story"].transform
			local var_20_20 = 0

			if var_20_20 < arg_17_1.time_ and arg_17_1.time_ <= var_20_20 + arg_20_0 then
				arg_17_1.var_.moveOldPos1049ui_story = var_20_19.localPosition
			end

			local var_20_21 = 0.001

			if var_20_20 <= arg_17_1.time_ and arg_17_1.time_ < var_20_20 + var_20_21 then
				local var_20_22 = (arg_17_1.time_ - var_20_20) / var_20_21
				local var_20_23 = Vector3.New(0, 100, 0)

				var_20_19.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1049ui_story, var_20_23, var_20_22)

				local var_20_24 = manager.ui.mainCamera.transform.position - var_20_19.position

				var_20_19.forward = Vector3.New(var_20_24.x, var_20_24.y, var_20_24.z)

				local var_20_25 = var_20_19.localEulerAngles

				var_20_25.z = 0
				var_20_25.x = 0
				var_20_19.localEulerAngles = var_20_25
			end

			if arg_17_1.time_ >= var_20_20 + var_20_21 and arg_17_1.time_ < var_20_20 + var_20_21 + arg_20_0 then
				var_20_19.localPosition = Vector3.New(0, 100, 0)

				local var_20_26 = manager.ui.mainCamera.transform.position - var_20_19.position

				var_20_19.forward = Vector3.New(var_20_26.x, var_20_26.y, var_20_26.z)

				local var_20_27 = var_20_19.localEulerAngles

				var_20_27.z = 0
				var_20_27.x = 0
				var_20_19.localEulerAngles = var_20_27
			end

			local var_20_28 = arg_17_1.actors_["1049ui_story"]
			local var_20_29 = 0

			if var_20_29 < arg_17_1.time_ and arg_17_1.time_ <= var_20_29 + arg_20_0 and arg_17_1.var_.characterEffect1049ui_story == nil then
				arg_17_1.var_.characterEffect1049ui_story = var_20_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_30 = 0.200000002980232

			if var_20_29 <= arg_17_1.time_ and arg_17_1.time_ < var_20_29 + var_20_30 then
				local var_20_31 = (arg_17_1.time_ - var_20_29) / var_20_30

				if arg_17_1.var_.characterEffect1049ui_story then
					local var_20_32 = Mathf.Lerp(0, 0.5, var_20_31)

					arg_17_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_17_1.var_.characterEffect1049ui_story.fillRatio = var_20_32
				end
			end

			if arg_17_1.time_ >= var_20_29 + var_20_30 and arg_17_1.time_ < var_20_29 + var_20_30 + arg_20_0 and arg_17_1.var_.characterEffect1049ui_story then
				local var_20_33 = 0.5

				arg_17_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_17_1.var_.characterEffect1049ui_story.fillRatio = var_20_33
			end

			local var_20_34 = 0
			local var_20_35 = 0.275

			if var_20_34 < arg_17_1.time_ and arg_17_1.time_ <= var_20_34 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_36 = arg_17_1:FormatText(StoryNameCfg[84].name)

				arg_17_1.leftNameTxt_.text = var_20_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_37 = arg_17_1:GetWordFromCfg(318301004)
				local var_20_38 = arg_17_1:FormatText(var_20_37.content)

				arg_17_1.text_.text = var_20_38

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_39 = 11
				local var_20_40 = utf8.len(var_20_38)
				local var_20_41 = var_20_39 <= 0 and var_20_35 or var_20_35 * (var_20_40 / var_20_39)

				if var_20_41 > 0 and var_20_35 < var_20_41 then
					arg_17_1.talkMaxDuration = var_20_41

					if var_20_41 + var_20_34 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_41 + var_20_34
					end
				end

				arg_17_1.text_.text = var_20_38
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301004", "story_v_out_318301.awb") ~= 0 then
					local var_20_42 = manager.audio:GetVoiceLength("story_v_out_318301", "318301004", "story_v_out_318301.awb") / 1000

					if var_20_42 + var_20_34 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_42 + var_20_34
					end

					if var_20_37.prefab_name ~= "" and arg_17_1.actors_[var_20_37.prefab_name] ~= nil then
						local var_20_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_37.prefab_name].transform, "story_v_out_318301", "318301004", "story_v_out_318301.awb")

						arg_17_1:RecordAudio("318301004", var_20_43)
						arg_17_1:RecordAudio("318301004", var_20_43)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_318301", "318301004", "story_v_out_318301.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_318301", "318301004", "story_v_out_318301.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_44 = math.max(var_20_35, arg_17_1.talkMaxDuration)

			if var_20_34 <= arg_17_1.time_ and arg_17_1.time_ < var_20_34 + var_20_44 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_34) / var_20_44

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_34 + var_20_44 and arg_17_1.time_ < var_20_34 + var_20_44 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play318301005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 318301005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play318301006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1199ui_story"].transform
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1.var_.moveOldPos1199ui_story = var_24_0.localPosition
			end

			local var_24_2 = 0.001

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2
				local var_24_4 = Vector3.New(0, 100, 0)

				var_24_0.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos1199ui_story, var_24_4, var_24_3)

				local var_24_5 = manager.ui.mainCamera.transform.position - var_24_0.position

				var_24_0.forward = Vector3.New(var_24_5.x, var_24_5.y, var_24_5.z)

				local var_24_6 = var_24_0.localEulerAngles

				var_24_6.z = 0
				var_24_6.x = 0
				var_24_0.localEulerAngles = var_24_6
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 then
				var_24_0.localPosition = Vector3.New(0, 100, 0)

				local var_24_7 = manager.ui.mainCamera.transform.position - var_24_0.position

				var_24_0.forward = Vector3.New(var_24_7.x, var_24_7.y, var_24_7.z)

				local var_24_8 = var_24_0.localEulerAngles

				var_24_8.z = 0
				var_24_8.x = 0
				var_24_0.localEulerAngles = var_24_8
			end

			local var_24_9 = arg_21_1.actors_["1199ui_story"]
			local var_24_10 = 0

			if var_24_10 < arg_21_1.time_ and arg_21_1.time_ <= var_24_10 + arg_24_0 and arg_21_1.var_.characterEffect1199ui_story == nil then
				arg_21_1.var_.characterEffect1199ui_story = var_24_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_11 = 0.200000002980232

			if var_24_10 <= arg_21_1.time_ and arg_21_1.time_ < var_24_10 + var_24_11 then
				local var_24_12 = (arg_21_1.time_ - var_24_10) / var_24_11

				if arg_21_1.var_.characterEffect1199ui_story then
					local var_24_13 = Mathf.Lerp(0, 0.5, var_24_12)

					arg_21_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_21_1.var_.characterEffect1199ui_story.fillRatio = var_24_13
				end
			end

			if arg_21_1.time_ >= var_24_10 + var_24_11 and arg_21_1.time_ < var_24_10 + var_24_11 + arg_24_0 and arg_21_1.var_.characterEffect1199ui_story then
				local var_24_14 = 0.5

				arg_21_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_21_1.var_.characterEffect1199ui_story.fillRatio = var_24_14
			end

			local var_24_15 = 0
			local var_24_16 = 0.6

			if var_24_15 < arg_21_1.time_ and arg_21_1.time_ <= var_24_15 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_17 = arg_21_1:GetWordFromCfg(318301005)
				local var_24_18 = arg_21_1:FormatText(var_24_17.content)

				arg_21_1.text_.text = var_24_18

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_19 = 24
				local var_24_20 = utf8.len(var_24_18)
				local var_24_21 = var_24_19 <= 0 and var_24_16 or var_24_16 * (var_24_20 / var_24_19)

				if var_24_21 > 0 and var_24_16 < var_24_21 then
					arg_21_1.talkMaxDuration = var_24_21

					if var_24_21 + var_24_15 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_21 + var_24_15
					end
				end

				arg_21_1.text_.text = var_24_18
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_22 = math.max(var_24_16, arg_21_1.talkMaxDuration)

			if var_24_15 <= arg_21_1.time_ and arg_21_1.time_ < var_24_15 + var_24_22 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_15) / var_24_22

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_15 + var_24_22 and arg_21_1.time_ < var_24_15 + var_24_22 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play318301006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 318301006
		arg_25_1.duration_ = 3.166

		local var_25_0 = {
			zh = 3,
			ja = 3.166
		}
		local var_25_1 = manager.audio:GetLocalizationFlag()

		if var_25_0[var_25_1] ~= nil then
			arg_25_1.duration_ = var_25_0[var_25_1]
		end

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play318301007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1049ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos1049ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0, -1.2, -6)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1049ui_story, var_28_4, var_28_3)

				local var_28_5 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_5.x, var_28_5.y, var_28_5.z)

				local var_28_6 = var_28_0.localEulerAngles

				var_28_6.z = 0
				var_28_6.x = 0
				var_28_0.localEulerAngles = var_28_6
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_28_7 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_7.x, var_28_7.y, var_28_7.z)

				local var_28_8 = var_28_0.localEulerAngles

				var_28_8.z = 0
				var_28_8.x = 0
				var_28_0.localEulerAngles = var_28_8
			end

			local var_28_9 = arg_25_1.actors_["1049ui_story"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and arg_25_1.var_.characterEffect1049ui_story == nil then
				arg_25_1.var_.characterEffect1049ui_story = var_28_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_11 = 0.200000002980232

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.characterEffect1049ui_story then
					arg_25_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and arg_25_1.var_.characterEffect1049ui_story then
				arg_25_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_28_13 = 0

			if var_28_13 < arg_25_1.time_ and arg_25_1.time_ <= var_28_13 + arg_28_0 then
				arg_25_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_28_14 = 0

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				arg_25_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_28_15 = 0
			local var_28_16 = 0.325

			if var_28_15 < arg_25_1.time_ and arg_25_1.time_ <= var_28_15 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_17 = arg_25_1:FormatText(StoryNameCfg[562].name)

				arg_25_1.leftNameTxt_.text = var_28_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_18 = arg_25_1:GetWordFromCfg(318301006)
				local var_28_19 = arg_25_1:FormatText(var_28_18.content)

				arg_25_1.text_.text = var_28_19

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_20 = 13
				local var_28_21 = utf8.len(var_28_19)
				local var_28_22 = var_28_20 <= 0 and var_28_16 or var_28_16 * (var_28_21 / var_28_20)

				if var_28_22 > 0 and var_28_16 < var_28_22 then
					arg_25_1.talkMaxDuration = var_28_22

					if var_28_22 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_22 + var_28_15
					end
				end

				arg_25_1.text_.text = var_28_19
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301006", "story_v_out_318301.awb") ~= 0 then
					local var_28_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301006", "story_v_out_318301.awb") / 1000

					if var_28_23 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_23 + var_28_15
					end

					if var_28_18.prefab_name ~= "" and arg_25_1.actors_[var_28_18.prefab_name] ~= nil then
						local var_28_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_18.prefab_name].transform, "story_v_out_318301", "318301006", "story_v_out_318301.awb")

						arg_25_1:RecordAudio("318301006", var_28_24)
						arg_25_1:RecordAudio("318301006", var_28_24)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_318301", "318301006", "story_v_out_318301.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_318301", "318301006", "story_v_out_318301.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_25 = math.max(var_28_16, arg_25_1.talkMaxDuration)

			if var_28_15 <= arg_25_1.time_ and arg_25_1.time_ < var_28_15 + var_28_25 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_15) / var_28_25

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_15 + var_28_25 and arg_25_1.time_ < var_28_15 + var_28_25 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play318301007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 318301007
		arg_29_1.duration_ = 3.3

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play318301008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1199ui_story"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos1199ui_story = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(0, -1.08, -5.9)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1199ui_story, var_32_4, var_32_3)

				local var_32_5 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_5.x, var_32_5.y, var_32_5.z)

				local var_32_6 = var_32_0.localEulerAngles

				var_32_6.z = 0
				var_32_6.x = 0
				var_32_0.localEulerAngles = var_32_6
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_32_7 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_7.x, var_32_7.y, var_32_7.z)

				local var_32_8 = var_32_0.localEulerAngles

				var_32_8.z = 0
				var_32_8.x = 0
				var_32_0.localEulerAngles = var_32_8
			end

			local var_32_9 = arg_29_1.actors_["1199ui_story"]
			local var_32_10 = 0

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 and arg_29_1.var_.characterEffect1199ui_story == nil then
				arg_29_1.var_.characterEffect1199ui_story = var_32_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_11 = 0.200000002980232

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_11 then
				local var_32_12 = (arg_29_1.time_ - var_32_10) / var_32_11

				if arg_29_1.var_.characterEffect1199ui_story then
					arg_29_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_10 + var_32_11 and arg_29_1.time_ < var_32_10 + var_32_11 + arg_32_0 and arg_29_1.var_.characterEffect1199ui_story then
				arg_29_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_32_13 = 0

			if var_32_13 < arg_29_1.time_ and arg_29_1.time_ <= var_32_13 + arg_32_0 then
				arg_29_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action3_2")
			end

			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 then
				arg_29_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_32_15 = arg_29_1.actors_["1049ui_story"].transform
			local var_32_16 = 0

			if var_32_16 < arg_29_1.time_ and arg_29_1.time_ <= var_32_16 + arg_32_0 then
				arg_29_1.var_.moveOldPos1049ui_story = var_32_15.localPosition
			end

			local var_32_17 = 0.001

			if var_32_16 <= arg_29_1.time_ and arg_29_1.time_ < var_32_16 + var_32_17 then
				local var_32_18 = (arg_29_1.time_ - var_32_16) / var_32_17
				local var_32_19 = Vector3.New(0, 100, 0)

				var_32_15.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1049ui_story, var_32_19, var_32_18)

				local var_32_20 = manager.ui.mainCamera.transform.position - var_32_15.position

				var_32_15.forward = Vector3.New(var_32_20.x, var_32_20.y, var_32_20.z)

				local var_32_21 = var_32_15.localEulerAngles

				var_32_21.z = 0
				var_32_21.x = 0
				var_32_15.localEulerAngles = var_32_21
			end

			if arg_29_1.time_ >= var_32_16 + var_32_17 and arg_29_1.time_ < var_32_16 + var_32_17 + arg_32_0 then
				var_32_15.localPosition = Vector3.New(0, 100, 0)

				local var_32_22 = manager.ui.mainCamera.transform.position - var_32_15.position

				var_32_15.forward = Vector3.New(var_32_22.x, var_32_22.y, var_32_22.z)

				local var_32_23 = var_32_15.localEulerAngles

				var_32_23.z = 0
				var_32_23.x = 0
				var_32_15.localEulerAngles = var_32_23
			end

			local var_32_24 = arg_29_1.actors_["1049ui_story"]
			local var_32_25 = 0

			if var_32_25 < arg_29_1.time_ and arg_29_1.time_ <= var_32_25 + arg_32_0 and arg_29_1.var_.characterEffect1049ui_story == nil then
				arg_29_1.var_.characterEffect1049ui_story = var_32_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_26 = 0.200000002980232

			if var_32_25 <= arg_29_1.time_ and arg_29_1.time_ < var_32_25 + var_32_26 then
				local var_32_27 = (arg_29_1.time_ - var_32_25) / var_32_26

				if arg_29_1.var_.characterEffect1049ui_story then
					local var_32_28 = Mathf.Lerp(0, 0.5, var_32_27)

					arg_29_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_29_1.var_.characterEffect1049ui_story.fillRatio = var_32_28
				end
			end

			if arg_29_1.time_ >= var_32_25 + var_32_26 and arg_29_1.time_ < var_32_25 + var_32_26 + arg_32_0 and arg_29_1.var_.characterEffect1049ui_story then
				local var_32_29 = 0.5

				arg_29_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_29_1.var_.characterEffect1049ui_story.fillRatio = var_32_29
			end

			local var_32_30 = 0
			local var_32_31 = 0.225

			if var_32_30 < arg_29_1.time_ and arg_29_1.time_ <= var_32_30 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_32 = arg_29_1:FormatText(StoryNameCfg[84].name)

				arg_29_1.leftNameTxt_.text = var_32_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_33 = arg_29_1:GetWordFromCfg(318301007)
				local var_32_34 = arg_29_1:FormatText(var_32_33.content)

				arg_29_1.text_.text = var_32_34

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_35 = 9
				local var_32_36 = utf8.len(var_32_34)
				local var_32_37 = var_32_35 <= 0 and var_32_31 or var_32_31 * (var_32_36 / var_32_35)

				if var_32_37 > 0 and var_32_31 < var_32_37 then
					arg_29_1.talkMaxDuration = var_32_37

					if var_32_37 + var_32_30 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_37 + var_32_30
					end
				end

				arg_29_1.text_.text = var_32_34
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301007", "story_v_out_318301.awb") ~= 0 then
					local var_32_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301007", "story_v_out_318301.awb") / 1000

					if var_32_38 + var_32_30 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_38 + var_32_30
					end

					if var_32_33.prefab_name ~= "" and arg_29_1.actors_[var_32_33.prefab_name] ~= nil then
						local var_32_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_33.prefab_name].transform, "story_v_out_318301", "318301007", "story_v_out_318301.awb")

						arg_29_1:RecordAudio("318301007", var_32_39)
						arg_29_1:RecordAudio("318301007", var_32_39)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_318301", "318301007", "story_v_out_318301.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_318301", "318301007", "story_v_out_318301.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_40 = math.max(var_32_31, arg_29_1.talkMaxDuration)

			if var_32_30 <= arg_29_1.time_ and arg_29_1.time_ < var_32_30 + var_32_40 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_30) / var_32_40

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_30 + var_32_40 and arg_29_1.time_ < var_32_30 + var_32_40 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play318301008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 318301008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play318301009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1199ui_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos1199ui_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(0, 100, 0)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1199ui_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0, 100, 0)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = arg_33_1.actors_["1199ui_story"]
			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 and arg_33_1.var_.characterEffect1199ui_story == nil then
				arg_33_1.var_.characterEffect1199ui_story = var_36_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_11 = 0.200000002980232

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_11 then
				local var_36_12 = (arg_33_1.time_ - var_36_10) / var_36_11

				if arg_33_1.var_.characterEffect1199ui_story then
					local var_36_13 = Mathf.Lerp(0, 0.5, var_36_12)

					arg_33_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1199ui_story.fillRatio = var_36_13
				end
			end

			if arg_33_1.time_ >= var_36_10 + var_36_11 and arg_33_1.time_ < var_36_10 + var_36_11 + arg_36_0 and arg_33_1.var_.characterEffect1199ui_story then
				local var_36_14 = 0.5

				arg_33_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1199ui_story.fillRatio = var_36_14
			end

			local var_36_15 = 0
			local var_36_16 = 1.275

			if var_36_15 < arg_33_1.time_ and arg_33_1.time_ <= var_36_15 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_17 = arg_33_1:GetWordFromCfg(318301008)
				local var_36_18 = arg_33_1:FormatText(var_36_17.content)

				arg_33_1.text_.text = var_36_18

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_19 = 51
				local var_36_20 = utf8.len(var_36_18)
				local var_36_21 = var_36_19 <= 0 and var_36_16 or var_36_16 * (var_36_20 / var_36_19)

				if var_36_21 > 0 and var_36_16 < var_36_21 then
					arg_33_1.talkMaxDuration = var_36_21

					if var_36_21 + var_36_15 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_21 + var_36_15
					end
				end

				arg_33_1.text_.text = var_36_18
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_22 = math.max(var_36_16, arg_33_1.talkMaxDuration)

			if var_36_15 <= arg_33_1.time_ and arg_33_1.time_ < var_36_15 + var_36_22 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_15) / var_36_22

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_15 + var_36_22 and arg_33_1.time_ < var_36_15 + var_36_22 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play318301009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 318301009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play318301010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.8

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_2 = arg_37_1:GetWordFromCfg(318301009)
				local var_40_3 = arg_37_1:FormatText(var_40_2.content)

				arg_37_1.text_.text = var_40_3

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_4 = 32
				local var_40_5 = utf8.len(var_40_3)
				local var_40_6 = var_40_4 <= 0 and var_40_1 or var_40_1 * (var_40_5 / var_40_4)

				if var_40_6 > 0 and var_40_1 < var_40_6 then
					arg_37_1.talkMaxDuration = var_40_6

					if var_40_6 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_6 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_3
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_7 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_7 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_7

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_7 and arg_37_1.time_ < var_40_0 + var_40_7 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play318301010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 318301010
		arg_41_1.duration_ = 4.833

		local var_41_0 = {
			zh = 3.766,
			ja = 4.833
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
				arg_41_0:Play318301011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1199ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1199ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(0, -1.08, -5.9)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1199ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = arg_41_1.actors_["1199ui_story"]
			local var_44_10 = 0

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 and arg_41_1.var_.characterEffect1199ui_story == nil then
				arg_41_1.var_.characterEffect1199ui_story = var_44_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_11 = 0.200000002980232

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_11 then
				local var_44_12 = (arg_41_1.time_ - var_44_10) / var_44_11

				if arg_41_1.var_.characterEffect1199ui_story then
					arg_41_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_10 + var_44_11 and arg_41_1.time_ < var_44_10 + var_44_11 + arg_44_0 and arg_41_1.var_.characterEffect1199ui_story then
				arg_41_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_44_13 = 0

			if var_44_13 < arg_41_1.time_ and arg_41_1.time_ <= var_44_13 + arg_44_0 then
				arg_41_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_44_15 = 0
			local var_44_16 = 0.225

			if var_44_15 < arg_41_1.time_ and arg_41_1.time_ <= var_44_15 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_17 = arg_41_1:FormatText(StoryNameCfg[84].name)

				arg_41_1.leftNameTxt_.text = var_44_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_18 = arg_41_1:GetWordFromCfg(318301010)
				local var_44_19 = arg_41_1:FormatText(var_44_18.content)

				arg_41_1.text_.text = var_44_19

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_20 = 9
				local var_44_21 = utf8.len(var_44_19)
				local var_44_22 = var_44_20 <= 0 and var_44_16 or var_44_16 * (var_44_21 / var_44_20)

				if var_44_22 > 0 and var_44_16 < var_44_22 then
					arg_41_1.talkMaxDuration = var_44_22

					if var_44_22 + var_44_15 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_22 + var_44_15
					end
				end

				arg_41_1.text_.text = var_44_19
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301010", "story_v_out_318301.awb") ~= 0 then
					local var_44_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301010", "story_v_out_318301.awb") / 1000

					if var_44_23 + var_44_15 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_23 + var_44_15
					end

					if var_44_18.prefab_name ~= "" and arg_41_1.actors_[var_44_18.prefab_name] ~= nil then
						local var_44_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_18.prefab_name].transform, "story_v_out_318301", "318301010", "story_v_out_318301.awb")

						arg_41_1:RecordAudio("318301010", var_44_24)
						arg_41_1:RecordAudio("318301010", var_44_24)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_318301", "318301010", "story_v_out_318301.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_318301", "318301010", "story_v_out_318301.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_25 = math.max(var_44_16, arg_41_1.talkMaxDuration)

			if var_44_15 <= arg_41_1.time_ and arg_41_1.time_ < var_44_15 + var_44_25 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_15) / var_44_25

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_15 + var_44_25 and arg_41_1.time_ < var_44_15 + var_44_25 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play318301011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 318301011
		arg_45_1.duration_ = 2.933

		local var_45_0 = {
			zh = 1.999999999999,
			ja = 2.933
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
				arg_45_0:Play318301012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_48_2 = 0
			local var_48_3 = 0.125

			if var_48_2 < arg_45_1.time_ and arg_45_1.time_ <= var_48_2 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_4 = arg_45_1:FormatText(StoryNameCfg[84].name)

				arg_45_1.leftNameTxt_.text = var_48_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_5 = arg_45_1:GetWordFromCfg(318301011)
				local var_48_6 = arg_45_1:FormatText(var_48_5.content)

				arg_45_1.text_.text = var_48_6

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_7 = 5
				local var_48_8 = utf8.len(var_48_6)
				local var_48_9 = var_48_7 <= 0 and var_48_3 or var_48_3 * (var_48_8 / var_48_7)

				if var_48_9 > 0 and var_48_3 < var_48_9 then
					arg_45_1.talkMaxDuration = var_48_9

					if var_48_9 + var_48_2 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_9 + var_48_2
					end
				end

				arg_45_1.text_.text = var_48_6
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301011", "story_v_out_318301.awb") ~= 0 then
					local var_48_10 = manager.audio:GetVoiceLength("story_v_out_318301", "318301011", "story_v_out_318301.awb") / 1000

					if var_48_10 + var_48_2 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_10 + var_48_2
					end

					if var_48_5.prefab_name ~= "" and arg_45_1.actors_[var_48_5.prefab_name] ~= nil then
						local var_48_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_5.prefab_name].transform, "story_v_out_318301", "318301011", "story_v_out_318301.awb")

						arg_45_1:RecordAudio("318301011", var_48_11)
						arg_45_1:RecordAudio("318301011", var_48_11)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_318301", "318301011", "story_v_out_318301.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_318301", "318301011", "story_v_out_318301.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_12 = math.max(var_48_3, arg_45_1.talkMaxDuration)

			if var_48_2 <= arg_45_1.time_ and arg_45_1.time_ < var_48_2 + var_48_12 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_2) / var_48_12

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_2 + var_48_12 and arg_45_1.time_ < var_48_2 + var_48_12 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play318301012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 318301012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play318301013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1199ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1199ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(0, 100, 0)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1199ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, 100, 0)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = arg_49_1.actors_["1199ui_story"]
			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 and arg_49_1.var_.characterEffect1199ui_story == nil then
				arg_49_1.var_.characterEffect1199ui_story = var_52_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_11 = 0.200000002980232

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_11 then
				local var_52_12 = (arg_49_1.time_ - var_52_10) / var_52_11

				if arg_49_1.var_.characterEffect1199ui_story then
					local var_52_13 = Mathf.Lerp(0, 0.5, var_52_12)

					arg_49_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1199ui_story.fillRatio = var_52_13
				end
			end

			if arg_49_1.time_ >= var_52_10 + var_52_11 and arg_49_1.time_ < var_52_10 + var_52_11 + arg_52_0 and arg_49_1.var_.characterEffect1199ui_story then
				local var_52_14 = 0.5

				arg_49_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1199ui_story.fillRatio = var_52_14
			end

			local var_52_15 = 0
			local var_52_16 = 0.7

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_17 = arg_49_1:GetWordFromCfg(318301012)
				local var_52_18 = arg_49_1:FormatText(var_52_17.content)

				arg_49_1.text_.text = var_52_18

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_19 = 28
				local var_52_20 = utf8.len(var_52_18)
				local var_52_21 = var_52_19 <= 0 and var_52_16 or var_52_16 * (var_52_20 / var_52_19)

				if var_52_21 > 0 and var_52_16 < var_52_21 then
					arg_49_1.talkMaxDuration = var_52_21

					if var_52_21 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_21 + var_52_15
					end
				end

				arg_49_1.text_.text = var_52_18
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_22 = math.max(var_52_16, arg_49_1.talkMaxDuration)

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_22 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_15) / var_52_22

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_15 + var_52_22 and arg_49_1.time_ < var_52_15 + var_52_22 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play318301013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 318301013
		arg_53_1.duration_ = 3.3

		local var_53_0 = {
			zh = 1.4,
			ja = 3.3
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
				arg_53_0:Play318301014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1049ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos1049ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0, -1.2, -6)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1049ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = arg_53_1.actors_["1049ui_story"]
			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 and arg_53_1.var_.characterEffect1049ui_story == nil then
				arg_53_1.var_.characterEffect1049ui_story = var_56_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_11 = 0.200000002980232

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_11 then
				local var_56_12 = (arg_53_1.time_ - var_56_10) / var_56_11

				if arg_53_1.var_.characterEffect1049ui_story then
					arg_53_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_10 + var_56_11 and arg_53_1.time_ < var_56_10 + var_56_11 + arg_56_0 and arg_53_1.var_.characterEffect1049ui_story then
				arg_53_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_56_13 = 0

			if var_56_13 < arg_53_1.time_ and arg_53_1.time_ <= var_56_13 + arg_56_0 then
				arg_53_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_56_14 = 0

			if var_56_14 < arg_53_1.time_ and arg_53_1.time_ <= var_56_14 + arg_56_0 then
				arg_53_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_15 = 0
			local var_56_16 = 0.15

			if var_56_15 < arg_53_1.time_ and arg_53_1.time_ <= var_56_15 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_17 = arg_53_1:FormatText(StoryNameCfg[562].name)

				arg_53_1.leftNameTxt_.text = var_56_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_18 = arg_53_1:GetWordFromCfg(318301013)
				local var_56_19 = arg_53_1:FormatText(var_56_18.content)

				arg_53_1.text_.text = var_56_19

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_20 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301013", "story_v_out_318301.awb") ~= 0 then
					local var_56_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301013", "story_v_out_318301.awb") / 1000

					if var_56_23 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_15
					end

					if var_56_18.prefab_name ~= "" and arg_53_1.actors_[var_56_18.prefab_name] ~= nil then
						local var_56_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_18.prefab_name].transform, "story_v_out_318301", "318301013", "story_v_out_318301.awb")

						arg_53_1:RecordAudio("318301013", var_56_24)
						arg_53_1:RecordAudio("318301013", var_56_24)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_318301", "318301013", "story_v_out_318301.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_318301", "318301013", "story_v_out_318301.awb")
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
	Play318301014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 318301014
		arg_57_1.duration_ = 3.1

		local var_57_0 = {
			zh = 1.999999999999,
			ja = 3.1
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
				arg_57_0:Play318301015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1199ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos1199ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0, -1.08, -5.9)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1199ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["1199ui_story"]
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect1199ui_story == nil then
				arg_57_1.var_.characterEffect1199ui_story = var_60_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_11 = 0.200000002980232

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_11 then
				local var_60_12 = (arg_57_1.time_ - var_60_10) / var_60_11

				if arg_57_1.var_.characterEffect1199ui_story then
					arg_57_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 and arg_57_1.var_.characterEffect1199ui_story then
				arg_57_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_60_13 = 0

			if var_60_13 < arg_57_1.time_ and arg_57_1.time_ <= var_60_13 + arg_60_0 then
				arg_57_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action3_1")
			end

			local var_60_14 = 0

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 then
				arg_57_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_60_15 = arg_57_1.actors_["1049ui_story"].transform
			local var_60_16 = 0

			if var_60_16 < arg_57_1.time_ and arg_57_1.time_ <= var_60_16 + arg_60_0 then
				arg_57_1.var_.moveOldPos1049ui_story = var_60_15.localPosition
			end

			local var_60_17 = 0.001

			if var_60_16 <= arg_57_1.time_ and arg_57_1.time_ < var_60_16 + var_60_17 then
				local var_60_18 = (arg_57_1.time_ - var_60_16) / var_60_17
				local var_60_19 = Vector3.New(0, 100, 0)

				var_60_15.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1049ui_story, var_60_19, var_60_18)

				local var_60_20 = manager.ui.mainCamera.transform.position - var_60_15.position

				var_60_15.forward = Vector3.New(var_60_20.x, var_60_20.y, var_60_20.z)

				local var_60_21 = var_60_15.localEulerAngles

				var_60_21.z = 0
				var_60_21.x = 0
				var_60_15.localEulerAngles = var_60_21
			end

			if arg_57_1.time_ >= var_60_16 + var_60_17 and arg_57_1.time_ < var_60_16 + var_60_17 + arg_60_0 then
				var_60_15.localPosition = Vector3.New(0, 100, 0)

				local var_60_22 = manager.ui.mainCamera.transform.position - var_60_15.position

				var_60_15.forward = Vector3.New(var_60_22.x, var_60_22.y, var_60_22.z)

				local var_60_23 = var_60_15.localEulerAngles

				var_60_23.z = 0
				var_60_23.x = 0
				var_60_15.localEulerAngles = var_60_23
			end

			local var_60_24 = arg_57_1.actors_["1049ui_story"]
			local var_60_25 = 0

			if var_60_25 < arg_57_1.time_ and arg_57_1.time_ <= var_60_25 + arg_60_0 and arg_57_1.var_.characterEffect1049ui_story == nil then
				arg_57_1.var_.characterEffect1049ui_story = var_60_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_26 = 0.200000002980232

			if var_60_25 <= arg_57_1.time_ and arg_57_1.time_ < var_60_25 + var_60_26 then
				local var_60_27 = (arg_57_1.time_ - var_60_25) / var_60_26

				if arg_57_1.var_.characterEffect1049ui_story then
					local var_60_28 = Mathf.Lerp(0, 0.5, var_60_27)

					arg_57_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1049ui_story.fillRatio = var_60_28
				end
			end

			if arg_57_1.time_ >= var_60_25 + var_60_26 and arg_57_1.time_ < var_60_25 + var_60_26 + arg_60_0 and arg_57_1.var_.characterEffect1049ui_story then
				local var_60_29 = 0.5

				arg_57_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1049ui_story.fillRatio = var_60_29
			end

			local var_60_30 = 0
			local var_60_31 = 0.175

			if var_60_30 < arg_57_1.time_ and arg_57_1.time_ <= var_60_30 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_32 = arg_57_1:FormatText(StoryNameCfg[84].name)

				arg_57_1.leftNameTxt_.text = var_60_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_33 = arg_57_1:GetWordFromCfg(318301014)
				local var_60_34 = arg_57_1:FormatText(var_60_33.content)

				arg_57_1.text_.text = var_60_34

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_35 = 7
				local var_60_36 = utf8.len(var_60_34)
				local var_60_37 = var_60_35 <= 0 and var_60_31 or var_60_31 * (var_60_36 / var_60_35)

				if var_60_37 > 0 and var_60_31 < var_60_37 then
					arg_57_1.talkMaxDuration = var_60_37

					if var_60_37 + var_60_30 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_37 + var_60_30
					end
				end

				arg_57_1.text_.text = var_60_34
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301014", "story_v_out_318301.awb") ~= 0 then
					local var_60_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301014", "story_v_out_318301.awb") / 1000

					if var_60_38 + var_60_30 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_38 + var_60_30
					end

					if var_60_33.prefab_name ~= "" and arg_57_1.actors_[var_60_33.prefab_name] ~= nil then
						local var_60_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_33.prefab_name].transform, "story_v_out_318301", "318301014", "story_v_out_318301.awb")

						arg_57_1:RecordAudio("318301014", var_60_39)
						arg_57_1:RecordAudio("318301014", var_60_39)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_318301", "318301014", "story_v_out_318301.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_318301", "318301014", "story_v_out_318301.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_40 = math.max(var_60_31, arg_57_1.talkMaxDuration)

			if var_60_30 <= arg_57_1.time_ and arg_57_1.time_ < var_60_30 + var_60_40 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_30) / var_60_40

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_30 + var_60_40 and arg_57_1.time_ < var_60_30 + var_60_40 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play318301015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 318301015
		arg_61_1.duration_ = 5.433

		local var_61_0 = {
			zh = 4.7,
			ja = 5.433
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
				arg_61_0:Play318301016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1049ui_story"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos1049ui_story = var_64_0.localPosition
			end

			local var_64_2 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2
				local var_64_4 = Vector3.New(0, -1.2, -6)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1049ui_story, var_64_4, var_64_3)

				local var_64_5 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_5.x, var_64_5.y, var_64_5.z)

				local var_64_6 = var_64_0.localEulerAngles

				var_64_6.z = 0
				var_64_6.x = 0
				var_64_0.localEulerAngles = var_64_6
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_64_7 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_7.x, var_64_7.y, var_64_7.z)

				local var_64_8 = var_64_0.localEulerAngles

				var_64_8.z = 0
				var_64_8.x = 0
				var_64_0.localEulerAngles = var_64_8
			end

			local var_64_9 = arg_61_1.actors_["1049ui_story"]
			local var_64_10 = 0

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 and arg_61_1.var_.characterEffect1049ui_story == nil then
				arg_61_1.var_.characterEffect1049ui_story = var_64_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_11 = 0.200000002980232

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_11 then
				local var_64_12 = (arg_61_1.time_ - var_64_10) / var_64_11

				if arg_61_1.var_.characterEffect1049ui_story then
					arg_61_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_10 + var_64_11 and arg_61_1.time_ < var_64_10 + var_64_11 + arg_64_0 and arg_61_1.var_.characterEffect1049ui_story then
				arg_61_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_64_13 = 0

			if var_64_13 < arg_61_1.time_ and arg_61_1.time_ <= var_64_13 + arg_64_0 then
				arg_61_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 then
				arg_61_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_64_15 = arg_61_1.actors_["1199ui_story"].transform
			local var_64_16 = 0

			if var_64_16 < arg_61_1.time_ and arg_61_1.time_ <= var_64_16 + arg_64_0 then
				arg_61_1.var_.moveOldPos1199ui_story = var_64_15.localPosition
			end

			local var_64_17 = 0.001

			if var_64_16 <= arg_61_1.time_ and arg_61_1.time_ < var_64_16 + var_64_17 then
				local var_64_18 = (arg_61_1.time_ - var_64_16) / var_64_17
				local var_64_19 = Vector3.New(0, 100, 0)

				var_64_15.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1199ui_story, var_64_19, var_64_18)

				local var_64_20 = manager.ui.mainCamera.transform.position - var_64_15.position

				var_64_15.forward = Vector3.New(var_64_20.x, var_64_20.y, var_64_20.z)

				local var_64_21 = var_64_15.localEulerAngles

				var_64_21.z = 0
				var_64_21.x = 0
				var_64_15.localEulerAngles = var_64_21
			end

			if arg_61_1.time_ >= var_64_16 + var_64_17 and arg_61_1.time_ < var_64_16 + var_64_17 + arg_64_0 then
				var_64_15.localPosition = Vector3.New(0, 100, 0)

				local var_64_22 = manager.ui.mainCamera.transform.position - var_64_15.position

				var_64_15.forward = Vector3.New(var_64_22.x, var_64_22.y, var_64_22.z)

				local var_64_23 = var_64_15.localEulerAngles

				var_64_23.z = 0
				var_64_23.x = 0
				var_64_15.localEulerAngles = var_64_23
			end

			local var_64_24 = arg_61_1.actors_["1199ui_story"]
			local var_64_25 = 0

			if var_64_25 < arg_61_1.time_ and arg_61_1.time_ <= var_64_25 + arg_64_0 and arg_61_1.var_.characterEffect1199ui_story == nil then
				arg_61_1.var_.characterEffect1199ui_story = var_64_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_26 = 0.200000002980232

			if var_64_25 <= arg_61_1.time_ and arg_61_1.time_ < var_64_25 + var_64_26 then
				local var_64_27 = (arg_61_1.time_ - var_64_25) / var_64_26

				if arg_61_1.var_.characterEffect1199ui_story then
					local var_64_28 = Mathf.Lerp(0, 0.5, var_64_27)

					arg_61_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1199ui_story.fillRatio = var_64_28
				end
			end

			if arg_61_1.time_ >= var_64_25 + var_64_26 and arg_61_1.time_ < var_64_25 + var_64_26 + arg_64_0 and arg_61_1.var_.characterEffect1199ui_story then
				local var_64_29 = 0.5

				arg_61_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1199ui_story.fillRatio = var_64_29
			end

			local var_64_30 = 0
			local var_64_31 = 0.25

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_32 = arg_61_1:FormatText(StoryNameCfg[562].name)

				arg_61_1.leftNameTxt_.text = var_64_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_33 = arg_61_1:GetWordFromCfg(318301015)
				local var_64_34 = arg_61_1:FormatText(var_64_33.content)

				arg_61_1.text_.text = var_64_34

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_35 = 10
				local var_64_36 = utf8.len(var_64_34)
				local var_64_37 = var_64_35 <= 0 and var_64_31 or var_64_31 * (var_64_36 / var_64_35)

				if var_64_37 > 0 and var_64_31 < var_64_37 then
					arg_61_1.talkMaxDuration = var_64_37

					if var_64_37 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_37 + var_64_30
					end
				end

				arg_61_1.text_.text = var_64_34
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301015", "story_v_out_318301.awb") ~= 0 then
					local var_64_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301015", "story_v_out_318301.awb") / 1000

					if var_64_38 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_38 + var_64_30
					end

					if var_64_33.prefab_name ~= "" and arg_61_1.actors_[var_64_33.prefab_name] ~= nil then
						local var_64_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_33.prefab_name].transform, "story_v_out_318301", "318301015", "story_v_out_318301.awb")

						arg_61_1:RecordAudio("318301015", var_64_39)
						arg_61_1:RecordAudio("318301015", var_64_39)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_318301", "318301015", "story_v_out_318301.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_318301", "318301015", "story_v_out_318301.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_40 = math.max(var_64_31, arg_61_1.talkMaxDuration)

			if var_64_30 <= arg_61_1.time_ and arg_61_1.time_ < var_64_30 + var_64_40 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_30) / var_64_40

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_30 + var_64_40 and arg_61_1.time_ < var_64_30 + var_64_40 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play318301016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 318301016
		arg_65_1.duration_ = 3.733

		local var_65_0 = {
			zh = 3.733,
			ja = 2.5
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
				arg_65_0:Play318301017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1199ui_story"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos1199ui_story = var_68_0.localPosition
			end

			local var_68_2 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2
				local var_68_4 = Vector3.New(0, -1.08, -5.9)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1199ui_story, var_68_4, var_68_3)

				local var_68_5 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_5.x, var_68_5.y, var_68_5.z)

				local var_68_6 = var_68_0.localEulerAngles

				var_68_6.z = 0
				var_68_6.x = 0
				var_68_0.localEulerAngles = var_68_6
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_68_7 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_7.x, var_68_7.y, var_68_7.z)

				local var_68_8 = var_68_0.localEulerAngles

				var_68_8.z = 0
				var_68_8.x = 0
				var_68_0.localEulerAngles = var_68_8
			end

			local var_68_9 = arg_65_1.actors_["1199ui_story"]
			local var_68_10 = 0

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 and arg_65_1.var_.characterEffect1199ui_story == nil then
				arg_65_1.var_.characterEffect1199ui_story = var_68_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_11 = 0.200000002980232

			if var_68_10 <= arg_65_1.time_ and arg_65_1.time_ < var_68_10 + var_68_11 then
				local var_68_12 = (arg_65_1.time_ - var_68_10) / var_68_11

				if arg_65_1.var_.characterEffect1199ui_story then
					arg_65_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_10 + var_68_11 and arg_65_1.time_ < var_68_10 + var_68_11 + arg_68_0 and arg_65_1.var_.characterEffect1199ui_story then
				arg_65_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_68_13 = 0

			if var_68_13 < arg_65_1.time_ and arg_65_1.time_ <= var_68_13 + arg_68_0 then
				arg_65_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_68_14 = 0

			if var_68_14 < arg_65_1.time_ and arg_65_1.time_ <= var_68_14 + arg_68_0 then
				arg_65_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_68_15 = arg_65_1.actors_["1049ui_story"].transform
			local var_68_16 = 0

			if var_68_16 < arg_65_1.time_ and arg_65_1.time_ <= var_68_16 + arg_68_0 then
				arg_65_1.var_.moveOldPos1049ui_story = var_68_15.localPosition
			end

			local var_68_17 = 0.001

			if var_68_16 <= arg_65_1.time_ and arg_65_1.time_ < var_68_16 + var_68_17 then
				local var_68_18 = (arg_65_1.time_ - var_68_16) / var_68_17
				local var_68_19 = Vector3.New(0, 100, 0)

				var_68_15.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1049ui_story, var_68_19, var_68_18)

				local var_68_20 = manager.ui.mainCamera.transform.position - var_68_15.position

				var_68_15.forward = Vector3.New(var_68_20.x, var_68_20.y, var_68_20.z)

				local var_68_21 = var_68_15.localEulerAngles

				var_68_21.z = 0
				var_68_21.x = 0
				var_68_15.localEulerAngles = var_68_21
			end

			if arg_65_1.time_ >= var_68_16 + var_68_17 and arg_65_1.time_ < var_68_16 + var_68_17 + arg_68_0 then
				var_68_15.localPosition = Vector3.New(0, 100, 0)

				local var_68_22 = manager.ui.mainCamera.transform.position - var_68_15.position

				var_68_15.forward = Vector3.New(var_68_22.x, var_68_22.y, var_68_22.z)

				local var_68_23 = var_68_15.localEulerAngles

				var_68_23.z = 0
				var_68_23.x = 0
				var_68_15.localEulerAngles = var_68_23
			end

			local var_68_24 = arg_65_1.actors_["1049ui_story"]
			local var_68_25 = 0

			if var_68_25 < arg_65_1.time_ and arg_65_1.time_ <= var_68_25 + arg_68_0 and arg_65_1.var_.characterEffect1049ui_story == nil then
				arg_65_1.var_.characterEffect1049ui_story = var_68_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_26 = 0.200000002980232

			if var_68_25 <= arg_65_1.time_ and arg_65_1.time_ < var_68_25 + var_68_26 then
				local var_68_27 = (arg_65_1.time_ - var_68_25) / var_68_26

				if arg_65_1.var_.characterEffect1049ui_story then
					local var_68_28 = Mathf.Lerp(0, 0.5, var_68_27)

					arg_65_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1049ui_story.fillRatio = var_68_28
				end
			end

			if arg_65_1.time_ >= var_68_25 + var_68_26 and arg_65_1.time_ < var_68_25 + var_68_26 + arg_68_0 and arg_65_1.var_.characterEffect1049ui_story then
				local var_68_29 = 0.5

				arg_65_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1049ui_story.fillRatio = var_68_29
			end

			local var_68_30 = 0
			local var_68_31 = 0.275

			if var_68_30 < arg_65_1.time_ and arg_65_1.time_ <= var_68_30 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_32 = arg_65_1:FormatText(StoryNameCfg[84].name)

				arg_65_1.leftNameTxt_.text = var_68_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_33 = arg_65_1:GetWordFromCfg(318301016)
				local var_68_34 = arg_65_1:FormatText(var_68_33.content)

				arg_65_1.text_.text = var_68_34

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_35 = 11
				local var_68_36 = utf8.len(var_68_34)
				local var_68_37 = var_68_35 <= 0 and var_68_31 or var_68_31 * (var_68_36 / var_68_35)

				if var_68_37 > 0 and var_68_31 < var_68_37 then
					arg_65_1.talkMaxDuration = var_68_37

					if var_68_37 + var_68_30 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_37 + var_68_30
					end
				end

				arg_65_1.text_.text = var_68_34
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301016", "story_v_out_318301.awb") ~= 0 then
					local var_68_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301016", "story_v_out_318301.awb") / 1000

					if var_68_38 + var_68_30 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_38 + var_68_30
					end

					if var_68_33.prefab_name ~= "" and arg_65_1.actors_[var_68_33.prefab_name] ~= nil then
						local var_68_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_33.prefab_name].transform, "story_v_out_318301", "318301016", "story_v_out_318301.awb")

						arg_65_1:RecordAudio("318301016", var_68_39)
						arg_65_1:RecordAudio("318301016", var_68_39)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_318301", "318301016", "story_v_out_318301.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_318301", "318301016", "story_v_out_318301.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_40 = math.max(var_68_31, arg_65_1.talkMaxDuration)

			if var_68_30 <= arg_65_1.time_ and arg_65_1.time_ < var_68_30 + var_68_40 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_30) / var_68_40

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_30 + var_68_40 and arg_65_1.time_ < var_68_30 + var_68_40 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play318301017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 318301017
		arg_69_1.duration_ = 9

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play318301018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "K13f"

			if arg_69_1.bgs_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(arg_69_1.paintGo_)

				var_72_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_72_0)
				var_72_1.name = var_72_0
				var_72_1.transform.parent = arg_69_1.stage_.transform
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.bgs_[var_72_0] = var_72_1
			end

			local var_72_2 = 2

			if var_72_2 < arg_69_1.time_ and arg_69_1.time_ <= var_72_2 + arg_72_0 then
				local var_72_3 = manager.ui.mainCamera.transform.localPosition
				local var_72_4 = Vector3.New(0, 0, 10) + Vector3.New(var_72_3.x, var_72_3.y, 0)
				local var_72_5 = arg_69_1.bgs_.K13f

				var_72_5.transform.localPosition = var_72_4
				var_72_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_72_6 = var_72_5:GetComponent("SpriteRenderer")

				if var_72_6 and var_72_6.sprite then
					local var_72_7 = (var_72_5.transform.localPosition - var_72_3).z
					local var_72_8 = manager.ui.mainCameraCom_
					local var_72_9 = 2 * var_72_7 * Mathf.Tan(var_72_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_72_10 = var_72_9 * var_72_8.aspect
					local var_72_11 = var_72_6.sprite.bounds.size.x
					local var_72_12 = var_72_6.sprite.bounds.size.y
					local var_72_13 = var_72_10 / var_72_11
					local var_72_14 = var_72_9 / var_72_12
					local var_72_15 = var_72_14 < var_72_13 and var_72_13 or var_72_14

					var_72_5.transform.localScale = Vector3.New(var_72_15, var_72_15, 0)
				end

				for iter_72_0, iter_72_1 in pairs(arg_69_1.bgs_) do
					if iter_72_0 ~= "K13f" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_16 = 0

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_17 = 2

			if var_72_16 <= arg_69_1.time_ and arg_69_1.time_ < var_72_16 + var_72_17 then
				local var_72_18 = (arg_69_1.time_ - var_72_16) / var_72_17
				local var_72_19 = Color.New(0, 0, 0)

				var_72_19.a = Mathf.Lerp(0, 1, var_72_18)
				arg_69_1.mask_.color = var_72_19
			end

			if arg_69_1.time_ >= var_72_16 + var_72_17 and arg_69_1.time_ < var_72_16 + var_72_17 + arg_72_0 then
				local var_72_20 = Color.New(0, 0, 0)

				var_72_20.a = 1
				arg_69_1.mask_.color = var_72_20
			end

			local var_72_21 = 2

			if var_72_21 < arg_69_1.time_ and arg_69_1.time_ <= var_72_21 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_22 = 2

			if var_72_21 <= arg_69_1.time_ and arg_69_1.time_ < var_72_21 + var_72_22 then
				local var_72_23 = (arg_69_1.time_ - var_72_21) / var_72_22
				local var_72_24 = Color.New(0, 0, 0)

				var_72_24.a = Mathf.Lerp(1, 0, var_72_23)
				arg_69_1.mask_.color = var_72_24
			end

			if arg_69_1.time_ >= var_72_21 + var_72_22 and arg_69_1.time_ < var_72_21 + var_72_22 + arg_72_0 then
				local var_72_25 = Color.New(0, 0, 0)
				local var_72_26 = 0

				arg_69_1.mask_.enabled = false
				var_72_25.a = var_72_26
				arg_69_1.mask_.color = var_72_25
			end

			local var_72_27 = arg_69_1.actors_["1199ui_story"].transform
			local var_72_28 = 1.96599999815226

			if var_72_28 < arg_69_1.time_ and arg_69_1.time_ <= var_72_28 + arg_72_0 then
				arg_69_1.var_.moveOldPos1199ui_story = var_72_27.localPosition
			end

			local var_72_29 = 0.001

			if var_72_28 <= arg_69_1.time_ and arg_69_1.time_ < var_72_28 + var_72_29 then
				local var_72_30 = (arg_69_1.time_ - var_72_28) / var_72_29
				local var_72_31 = Vector3.New(0, 100, 0)

				var_72_27.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1199ui_story, var_72_31, var_72_30)

				local var_72_32 = manager.ui.mainCamera.transform.position - var_72_27.position

				var_72_27.forward = Vector3.New(var_72_32.x, var_72_32.y, var_72_32.z)

				local var_72_33 = var_72_27.localEulerAngles

				var_72_33.z = 0
				var_72_33.x = 0
				var_72_27.localEulerAngles = var_72_33
			end

			if arg_69_1.time_ >= var_72_28 + var_72_29 and arg_69_1.time_ < var_72_28 + var_72_29 + arg_72_0 then
				var_72_27.localPosition = Vector3.New(0, 100, 0)

				local var_72_34 = manager.ui.mainCamera.transform.position - var_72_27.position

				var_72_27.forward = Vector3.New(var_72_34.x, var_72_34.y, var_72_34.z)

				local var_72_35 = var_72_27.localEulerAngles

				var_72_35.z = 0
				var_72_35.x = 0
				var_72_27.localEulerAngles = var_72_35
			end

			local var_72_36 = arg_69_1.actors_["1199ui_story"]
			local var_72_37 = 1.96599999815226

			if var_72_37 < arg_69_1.time_ and arg_69_1.time_ <= var_72_37 + arg_72_0 and arg_69_1.var_.characterEffect1199ui_story == nil then
				arg_69_1.var_.characterEffect1199ui_story = var_72_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_38 = 0.034000001847744

			if var_72_37 <= arg_69_1.time_ and arg_69_1.time_ < var_72_37 + var_72_38 then
				local var_72_39 = (arg_69_1.time_ - var_72_37) / var_72_38

				if arg_69_1.var_.characterEffect1199ui_story then
					local var_72_40 = Mathf.Lerp(0, 0.5, var_72_39)

					arg_69_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1199ui_story.fillRatio = var_72_40
				end
			end

			if arg_69_1.time_ >= var_72_37 + var_72_38 and arg_69_1.time_ < var_72_37 + var_72_38 + arg_72_0 and arg_69_1.var_.characterEffect1199ui_story then
				local var_72_41 = 0.5

				arg_69_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1199ui_story.fillRatio = var_72_41
			end

			if arg_69_1.frameCnt_ <= 1 then
				arg_69_1.dialog_:SetActive(false)
			end

			local var_72_42 = 4
			local var_72_43 = 0.925

			if var_72_42 < arg_69_1.time_ and arg_69_1.time_ <= var_72_42 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_44 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_44:setOnUpdate(LuaHelper.FloatAction(function(arg_73_0)
					arg_69_1.dialogCg_.alpha = arg_73_0
				end))
				var_72_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_45 = arg_69_1:GetWordFromCfg(318301017)
				local var_72_46 = arg_69_1:FormatText(var_72_45.content)

				arg_69_1.text_.text = var_72_46

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_47 = 37
				local var_72_48 = utf8.len(var_72_46)
				local var_72_49 = var_72_47 <= 0 and var_72_43 or var_72_43 * (var_72_48 / var_72_47)

				if var_72_49 > 0 and var_72_43 < var_72_49 then
					arg_69_1.talkMaxDuration = var_72_49
					var_72_42 = var_72_42 + 0.3

					if var_72_49 + var_72_42 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_49 + var_72_42
					end
				end

				arg_69_1.text_.text = var_72_46
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_50 = var_72_42 + 0.3
			local var_72_51 = math.max(var_72_43, arg_69_1.talkMaxDuration)

			if var_72_50 <= arg_69_1.time_ and arg_69_1.time_ < var_72_50 + var_72_51 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_50) / var_72_51

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_50 + var_72_51 and arg_69_1.time_ < var_72_50 + var_72_51 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play318301018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 318301018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play318301019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.7

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(318301018)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 28
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play318301019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 318301019
		arg_79_1.duration_ = 4.833

		local var_79_0 = {
			zh = 4.833,
			ja = 3.5
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
				arg_79_0:Play318301020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = "1093ui_story"

			if arg_79_1.actors_[var_82_0] == nil then
				local var_82_1 = Object.Instantiate(Asset.Load("Char/" .. var_82_0), arg_79_1.stage_.transform)

				var_82_1.name = var_82_0
				var_82_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_79_1.actors_[var_82_0] = var_82_1

				local var_82_2 = var_82_1:GetComponentInChildren(typeof(CharacterEffect))

				var_82_2.enabled = true

				local var_82_3 = GameObjectTools.GetOrAddComponent(var_82_1, typeof(DynamicBoneHelper))

				if var_82_3 then
					var_82_3:EnableDynamicBone(false)
				end

				arg_79_1:ShowWeapon(var_82_2.transform, false)

				arg_79_1.var_[var_82_0 .. "Animator"] = var_82_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_79_1.var_[var_82_0 .. "Animator"].applyRootMotion = true
				arg_79_1.var_[var_82_0 .. "LipSync"] = var_82_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_82_4 = arg_79_1.actors_["1093ui_story"].transform
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.var_.moveOldPos1093ui_story = var_82_4.localPosition
			end

			local var_82_6 = 0.001

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6
				local var_82_8 = Vector3.New(0, -1.11, -5.88)

				var_82_4.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1093ui_story, var_82_8, var_82_7)

				local var_82_9 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_9.x, var_82_9.y, var_82_9.z)

				local var_82_10 = var_82_4.localEulerAngles

				var_82_10.z = 0
				var_82_10.x = 0
				var_82_4.localEulerAngles = var_82_10
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 then
				var_82_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_4.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_4.localEulerAngles = var_82_12
			end

			local var_82_13 = arg_79_1.actors_["1093ui_story"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story == nil then
				arg_79_1.var_.characterEffect1093ui_story = var_82_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_15 = 0.200000002980232

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15

				if arg_79_1.var_.characterEffect1093ui_story then
					arg_79_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story then
				arg_79_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_82_17 = 0

			if var_82_17 < arg_79_1.time_ and arg_79_1.time_ <= var_82_17 + arg_82_0 then
				arg_79_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_82_18 = 0

			if var_82_18 < arg_79_1.time_ and arg_79_1.time_ <= var_82_18 + arg_82_0 then
				arg_79_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_82_19 = 0
			local var_82_20 = 0.5

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[73].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(318301019)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 20
				local var_82_25 = utf8.len(var_82_23)
				local var_82_26 = var_82_24 <= 0 and var_82_20 or var_82_20 * (var_82_25 / var_82_24)

				if var_82_26 > 0 and var_82_20 < var_82_26 then
					arg_79_1.talkMaxDuration = var_82_26

					if var_82_26 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_26 + var_82_19
					end
				end

				arg_79_1.text_.text = var_82_23
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301019", "story_v_out_318301.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_318301", "318301019", "story_v_out_318301.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_318301", "318301019", "story_v_out_318301.awb")

						arg_79_1:RecordAudio("318301019", var_82_28)
						arg_79_1:RecordAudio("318301019", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_318301", "318301019", "story_v_out_318301.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_318301", "318301019", "story_v_out_318301.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_29 = math.max(var_82_20, arg_79_1.talkMaxDuration)

			if var_82_19 <= arg_79_1.time_ and arg_79_1.time_ < var_82_19 + var_82_29 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_19) / var_82_29

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_19 + var_82_29 and arg_79_1.time_ < var_82_19 + var_82_29 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play318301020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 318301020
		arg_83_1.duration_ = 8.4

		local var_83_0 = {
			zh = 7.366,
			ja = 8.4
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
				arg_83_0:Play318301021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.825

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[73].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(318301020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 33
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301020", "story_v_out_318301.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301020", "story_v_out_318301.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_318301", "318301020", "story_v_out_318301.awb")

						arg_83_1:RecordAudio("318301020", var_86_9)
						arg_83_1:RecordAudio("318301020", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_318301", "318301020", "story_v_out_318301.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_318301", "318301020", "story_v_out_318301.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play318301021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 318301021
		arg_87_1.duration_ = 6

		local var_87_0 = {
			zh = 4.7,
			ja = 6
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
				arg_87_0:Play318301022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.45

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[73].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(318301021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 18
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301021", "story_v_out_318301.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301021", "story_v_out_318301.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_318301", "318301021", "story_v_out_318301.awb")

						arg_87_1:RecordAudio("318301021", var_90_9)
						arg_87_1:RecordAudio("318301021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_318301", "318301021", "story_v_out_318301.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_318301", "318301021", "story_v_out_318301.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play318301022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 318301022
		arg_91_1.duration_ = 3.533

		local var_91_0 = {
			zh = 3.533,
			ja = 2.3
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
				arg_91_0:Play318301023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = "1055ui_story"

			if arg_91_1.actors_[var_94_0] == nil then
				local var_94_1 = Object.Instantiate(Asset.Load("Char/" .. var_94_0), arg_91_1.stage_.transform)

				var_94_1.name = var_94_0
				var_94_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.actors_[var_94_0] = var_94_1

				local var_94_2 = var_94_1:GetComponentInChildren(typeof(CharacterEffect))

				var_94_2.enabled = true

				local var_94_3 = GameObjectTools.GetOrAddComponent(var_94_1, typeof(DynamicBoneHelper))

				if var_94_3 then
					var_94_3:EnableDynamicBone(false)
				end

				arg_91_1:ShowWeapon(var_94_2.transform, false)

				arg_91_1.var_[var_94_0 .. "Animator"] = var_94_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_91_1.var_[var_94_0 .. "Animator"].applyRootMotion = true
				arg_91_1.var_[var_94_0 .. "LipSync"] = var_94_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_94_4 = arg_91_1.actors_["1055ui_story"].transform
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.var_.moveOldPos1055ui_story = var_94_4.localPosition
			end

			local var_94_6 = 0.001

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6
				local var_94_8 = Vector3.New(0, -0.965, -6.2)

				var_94_4.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1055ui_story, var_94_8, var_94_7)

				local var_94_9 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_9.x, var_94_9.y, var_94_9.z)

				local var_94_10 = var_94_4.localEulerAngles

				var_94_10.z = 0
				var_94_10.x = 0
				var_94_4.localEulerAngles = var_94_10
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 then
				var_94_4.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_94_11 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_11.x, var_94_11.y, var_94_11.z)

				local var_94_12 = var_94_4.localEulerAngles

				var_94_12.z = 0
				var_94_12.x = 0
				var_94_4.localEulerAngles = var_94_12
			end

			local var_94_13 = arg_91_1.actors_["1055ui_story"]
			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 and arg_91_1.var_.characterEffect1055ui_story == nil then
				arg_91_1.var_.characterEffect1055ui_story = var_94_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_15 = 0.200000002980232

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_15 then
				local var_94_16 = (arg_91_1.time_ - var_94_14) / var_94_15

				if arg_91_1.var_.characterEffect1055ui_story then
					arg_91_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_14 + var_94_15 and arg_91_1.time_ < var_94_14 + var_94_15 + arg_94_0 and arg_91_1.var_.characterEffect1055ui_story then
				arg_91_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_94_17 = 0

			if var_94_17 < arg_91_1.time_ and arg_91_1.time_ <= var_94_17 + arg_94_0 then
				arg_91_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action2_1")
			end

			local var_94_18 = 0

			if var_94_18 < arg_91_1.time_ and arg_91_1.time_ <= var_94_18 + arg_94_0 then
				arg_91_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_94_19 = arg_91_1.actors_["1093ui_story"].transform
			local var_94_20 = 0

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.var_.moveOldPos1093ui_story = var_94_19.localPosition
			end

			local var_94_21 = 0.001

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_21 then
				local var_94_22 = (arg_91_1.time_ - var_94_20) / var_94_21
				local var_94_23 = Vector3.New(0, 100, 0)

				var_94_19.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1093ui_story, var_94_23, var_94_22)

				local var_94_24 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_24.x, var_94_24.y, var_94_24.z)

				local var_94_25 = var_94_19.localEulerAngles

				var_94_25.z = 0
				var_94_25.x = 0
				var_94_19.localEulerAngles = var_94_25
			end

			if arg_91_1.time_ >= var_94_20 + var_94_21 and arg_91_1.time_ < var_94_20 + var_94_21 + arg_94_0 then
				var_94_19.localPosition = Vector3.New(0, 100, 0)

				local var_94_26 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_26.x, var_94_26.y, var_94_26.z)

				local var_94_27 = var_94_19.localEulerAngles

				var_94_27.z = 0
				var_94_27.x = 0
				var_94_19.localEulerAngles = var_94_27
			end

			local var_94_28 = arg_91_1.actors_["1093ui_story"]
			local var_94_29 = 0

			if var_94_29 < arg_91_1.time_ and arg_91_1.time_ <= var_94_29 + arg_94_0 and arg_91_1.var_.characterEffect1093ui_story == nil then
				arg_91_1.var_.characterEffect1093ui_story = var_94_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_30 = 0.200000002980232

			if var_94_29 <= arg_91_1.time_ and arg_91_1.time_ < var_94_29 + var_94_30 then
				local var_94_31 = (arg_91_1.time_ - var_94_29) / var_94_30

				if arg_91_1.var_.characterEffect1093ui_story then
					local var_94_32 = Mathf.Lerp(0, 0.5, var_94_31)

					arg_91_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1093ui_story.fillRatio = var_94_32
				end
			end

			if arg_91_1.time_ >= var_94_29 + var_94_30 and arg_91_1.time_ < var_94_29 + var_94_30 + arg_94_0 and arg_91_1.var_.characterEffect1093ui_story then
				local var_94_33 = 0.5

				arg_91_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1093ui_story.fillRatio = var_94_33
			end

			local var_94_34 = 0
			local var_94_35 = 0.35

			if var_94_34 < arg_91_1.time_ and arg_91_1.time_ <= var_94_34 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_36 = arg_91_1:FormatText(StoryNameCfg[481].name)

				arg_91_1.leftNameTxt_.text = var_94_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_37 = arg_91_1:GetWordFromCfg(318301022)
				local var_94_38 = arg_91_1:FormatText(var_94_37.content)

				arg_91_1.text_.text = var_94_38

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_39 = 14
				local var_94_40 = utf8.len(var_94_38)
				local var_94_41 = var_94_39 <= 0 and var_94_35 or var_94_35 * (var_94_40 / var_94_39)

				if var_94_41 > 0 and var_94_35 < var_94_41 then
					arg_91_1.talkMaxDuration = var_94_41

					if var_94_41 + var_94_34 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_41 + var_94_34
					end
				end

				arg_91_1.text_.text = var_94_38
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301022", "story_v_out_318301.awb") ~= 0 then
					local var_94_42 = manager.audio:GetVoiceLength("story_v_out_318301", "318301022", "story_v_out_318301.awb") / 1000

					if var_94_42 + var_94_34 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_42 + var_94_34
					end

					if var_94_37.prefab_name ~= "" and arg_91_1.actors_[var_94_37.prefab_name] ~= nil then
						local var_94_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_37.prefab_name].transform, "story_v_out_318301", "318301022", "story_v_out_318301.awb")

						arg_91_1:RecordAudio("318301022", var_94_43)
						arg_91_1:RecordAudio("318301022", var_94_43)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_318301", "318301022", "story_v_out_318301.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_318301", "318301022", "story_v_out_318301.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_44 = math.max(var_94_35, arg_91_1.talkMaxDuration)

			if var_94_34 <= arg_91_1.time_ and arg_91_1.time_ < var_94_34 + var_94_44 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_34) / var_94_44

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_34 + var_94_44 and arg_91_1.time_ < var_94_34 + var_94_44 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play318301023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 318301023
		arg_95_1.duration_ = 3.9

		local var_95_0 = {
			zh = 3.333,
			ja = 3.9
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
				arg_95_0:Play318301024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = "1150ui_story"

			if arg_95_1.actors_[var_98_0] == nil then
				local var_98_1 = Object.Instantiate(Asset.Load("Char/" .. var_98_0), arg_95_1.stage_.transform)

				var_98_1.name = var_98_0
				var_98_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_95_1.actors_[var_98_0] = var_98_1

				local var_98_2 = var_98_1:GetComponentInChildren(typeof(CharacterEffect))

				var_98_2.enabled = true

				local var_98_3 = GameObjectTools.GetOrAddComponent(var_98_1, typeof(DynamicBoneHelper))

				if var_98_3 then
					var_98_3:EnableDynamicBone(false)
				end

				arg_95_1:ShowWeapon(var_98_2.transform, false)

				arg_95_1.var_[var_98_0 .. "Animator"] = var_98_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_95_1.var_[var_98_0 .. "Animator"].applyRootMotion = true
				arg_95_1.var_[var_98_0 .. "LipSync"] = var_98_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_98_4 = arg_95_1.actors_["1150ui_story"].transform
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 then
				arg_95_1.var_.moveOldPos1150ui_story = var_98_4.localPosition
			end

			local var_98_6 = 0.001

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6
				local var_98_8 = Vector3.New(0, -1.01, -6.2)

				var_98_4.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1150ui_story, var_98_8, var_98_7)

				local var_98_9 = manager.ui.mainCamera.transform.position - var_98_4.position

				var_98_4.forward = Vector3.New(var_98_9.x, var_98_9.y, var_98_9.z)

				local var_98_10 = var_98_4.localEulerAngles

				var_98_10.z = 0
				var_98_10.x = 0
				var_98_4.localEulerAngles = var_98_10
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 then
				var_98_4.localPosition = Vector3.New(0, -1.01, -6.2)

				local var_98_11 = manager.ui.mainCamera.transform.position - var_98_4.position

				var_98_4.forward = Vector3.New(var_98_11.x, var_98_11.y, var_98_11.z)

				local var_98_12 = var_98_4.localEulerAngles

				var_98_12.z = 0
				var_98_12.x = 0
				var_98_4.localEulerAngles = var_98_12
			end

			local var_98_13 = arg_95_1.actors_["1150ui_story"]
			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 and arg_95_1.var_.characterEffect1150ui_story == nil then
				arg_95_1.var_.characterEffect1150ui_story = var_98_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_15 = 0.200000002980232

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_15 then
				local var_98_16 = (arg_95_1.time_ - var_98_14) / var_98_15

				if arg_95_1.var_.characterEffect1150ui_story then
					arg_95_1.var_.characterEffect1150ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_14 + var_98_15 and arg_95_1.time_ < var_98_14 + var_98_15 + arg_98_0 and arg_95_1.var_.characterEffect1150ui_story then
				arg_95_1.var_.characterEffect1150ui_story.fillFlat = false
			end

			local var_98_17 = 0

			if var_98_17 < arg_95_1.time_ and arg_95_1.time_ <= var_98_17 + arg_98_0 then
				arg_95_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_98_18 = 0

			if var_98_18 < arg_95_1.time_ and arg_95_1.time_ <= var_98_18 + arg_98_0 then
				arg_95_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/story1150/story1150action/1150action1_1")
			end

			local var_98_19 = arg_95_1.actors_["1055ui_story"].transform
			local var_98_20 = 0

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				arg_95_1.var_.moveOldPos1055ui_story = var_98_19.localPosition
			end

			local var_98_21 = 0.001

			if var_98_20 <= arg_95_1.time_ and arg_95_1.time_ < var_98_20 + var_98_21 then
				local var_98_22 = (arg_95_1.time_ - var_98_20) / var_98_21
				local var_98_23 = Vector3.New(0, 100, 0)

				var_98_19.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1055ui_story, var_98_23, var_98_22)

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

			local var_98_28 = arg_95_1.actors_["1055ui_story"]
			local var_98_29 = 0

			if var_98_29 < arg_95_1.time_ and arg_95_1.time_ <= var_98_29 + arg_98_0 and arg_95_1.var_.characterEffect1055ui_story == nil then
				arg_95_1.var_.characterEffect1055ui_story = var_98_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_30 = 0.200000002980232

			if var_98_29 <= arg_95_1.time_ and arg_95_1.time_ < var_98_29 + var_98_30 then
				local var_98_31 = (arg_95_1.time_ - var_98_29) / var_98_30

				if arg_95_1.var_.characterEffect1055ui_story then
					local var_98_32 = Mathf.Lerp(0, 0.5, var_98_31)

					arg_95_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1055ui_story.fillRatio = var_98_32
				end
			end

			if arg_95_1.time_ >= var_98_29 + var_98_30 and arg_95_1.time_ < var_98_29 + var_98_30 + arg_98_0 and arg_95_1.var_.characterEffect1055ui_story then
				local var_98_33 = 0.5

				arg_95_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1055ui_story.fillRatio = var_98_33
			end

			local var_98_34 = 0
			local var_98_35 = 0.35

			if var_98_34 < arg_95_1.time_ and arg_95_1.time_ <= var_98_34 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_36 = arg_95_1:FormatText(StoryNameCfg[74].name)

				arg_95_1.leftNameTxt_.text = var_98_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_37 = arg_95_1:GetWordFromCfg(318301023)
				local var_98_38 = arg_95_1:FormatText(var_98_37.content)

				arg_95_1.text_.text = var_98_38

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_39 = 14
				local var_98_40 = utf8.len(var_98_38)
				local var_98_41 = var_98_39 <= 0 and var_98_35 or var_98_35 * (var_98_40 / var_98_39)

				if var_98_41 > 0 and var_98_35 < var_98_41 then
					arg_95_1.talkMaxDuration = var_98_41

					if var_98_41 + var_98_34 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_41 + var_98_34
					end
				end

				arg_95_1.text_.text = var_98_38
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301023", "story_v_out_318301.awb") ~= 0 then
					local var_98_42 = manager.audio:GetVoiceLength("story_v_out_318301", "318301023", "story_v_out_318301.awb") / 1000

					if var_98_42 + var_98_34 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_42 + var_98_34
					end

					if var_98_37.prefab_name ~= "" and arg_95_1.actors_[var_98_37.prefab_name] ~= nil then
						local var_98_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_37.prefab_name].transform, "story_v_out_318301", "318301023", "story_v_out_318301.awb")

						arg_95_1:RecordAudio("318301023", var_98_43)
						arg_95_1:RecordAudio("318301023", var_98_43)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_318301", "318301023", "story_v_out_318301.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_318301", "318301023", "story_v_out_318301.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_44 = math.max(var_98_35, arg_95_1.talkMaxDuration)

			if var_98_34 <= arg_95_1.time_ and arg_95_1.time_ < var_98_34 + var_98_44 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_34) / var_98_44

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_34 + var_98_44 and arg_95_1.time_ < var_98_34 + var_98_44 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play318301024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 318301024
		arg_99_1.duration_ = 5.7

		local var_99_0 = {
			zh = 3.233,
			ja = 5.7
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
				arg_99_0:Play318301025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1093ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1093ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, -1.11, -5.88)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1093ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1093ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1093ui_story == nil then
				arg_99_1.var_.characterEffect1093ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1093ui_story then
					arg_99_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1093ui_story then
				arg_99_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = arg_99_1.actors_["1150ui_story"].transform
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1.var_.moveOldPos1150ui_story = var_102_15.localPosition
			end

			local var_102_17 = 0.001

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17
				local var_102_19 = Vector3.New(0, 100, 0)

				var_102_15.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1150ui_story, var_102_19, var_102_18)

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

			local var_102_24 = arg_99_1.actors_["1150ui_story"]
			local var_102_25 = 0

			if var_102_25 < arg_99_1.time_ and arg_99_1.time_ <= var_102_25 + arg_102_0 and arg_99_1.var_.characterEffect1150ui_story == nil then
				arg_99_1.var_.characterEffect1150ui_story = var_102_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_26 = 0.200000002980232

			if var_102_25 <= arg_99_1.time_ and arg_99_1.time_ < var_102_25 + var_102_26 then
				local var_102_27 = (arg_99_1.time_ - var_102_25) / var_102_26

				if arg_99_1.var_.characterEffect1150ui_story then
					local var_102_28 = Mathf.Lerp(0, 0.5, var_102_27)

					arg_99_1.var_.characterEffect1150ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1150ui_story.fillRatio = var_102_28
				end
			end

			if arg_99_1.time_ >= var_102_25 + var_102_26 and arg_99_1.time_ < var_102_25 + var_102_26 + arg_102_0 and arg_99_1.var_.characterEffect1150ui_story then
				local var_102_29 = 0.5

				arg_99_1.var_.characterEffect1150ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1150ui_story.fillRatio = var_102_29
			end

			local var_102_30 = 0
			local var_102_31 = 0.275

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_32 = arg_99_1:FormatText(StoryNameCfg[73].name)

				arg_99_1.leftNameTxt_.text = var_102_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_33 = arg_99_1:GetWordFromCfg(318301024)
				local var_102_34 = arg_99_1:FormatText(var_102_33.content)

				arg_99_1.text_.text = var_102_34

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_35 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301024", "story_v_out_318301.awb") ~= 0 then
					local var_102_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301024", "story_v_out_318301.awb") / 1000

					if var_102_38 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_38 + var_102_30
					end

					if var_102_33.prefab_name ~= "" and arg_99_1.actors_[var_102_33.prefab_name] ~= nil then
						local var_102_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_33.prefab_name].transform, "story_v_out_318301", "318301024", "story_v_out_318301.awb")

						arg_99_1:RecordAudio("318301024", var_102_39)
						arg_99_1:RecordAudio("318301024", var_102_39)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_318301", "318301024", "story_v_out_318301.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_318301", "318301024", "story_v_out_318301.awb")
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
	Play318301025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 318301025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play318301026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1093ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1093ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 100, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1093ui_story, var_106_4, var_106_3)

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

			local var_106_9 = arg_103_1.actors_["1093ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1093ui_story == nil then
				arg_103_1.var_.characterEffect1093ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1093ui_story then
					local var_106_13 = Mathf.Lerp(0, 0.5, var_106_12)

					arg_103_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1093ui_story.fillRatio = var_106_13
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1093ui_story then
				local var_106_14 = 0.5

				arg_103_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1093ui_story.fillRatio = var_106_14
			end

			local var_106_15 = 0
			local var_106_16 = 0.625

			if var_106_15 < arg_103_1.time_ and arg_103_1.time_ <= var_106_15 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_17 = arg_103_1:GetWordFromCfg(318301025)
				local var_106_18 = arg_103_1:FormatText(var_106_17.content)

				arg_103_1.text_.text = var_106_18

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_19 = 25
				local var_106_20 = utf8.len(var_106_18)
				local var_106_21 = var_106_19 <= 0 and var_106_16 or var_106_16 * (var_106_20 / var_106_19)

				if var_106_21 > 0 and var_106_16 < var_106_21 then
					arg_103_1.talkMaxDuration = var_106_21

					if var_106_21 + var_106_15 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_21 + var_106_15
					end
				end

				arg_103_1.text_.text = var_106_18
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_22 = math.max(var_106_16, arg_103_1.talkMaxDuration)

			if var_106_15 <= arg_103_1.time_ and arg_103_1.time_ < var_106_15 + var_106_22 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_15) / var_106_22

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_15 + var_106_22 and arg_103_1.time_ < var_106_15 + var_106_22 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play318301026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 318301026
		arg_107_1.duration_ = 2.466

		local var_107_0 = {
			zh = 1.2,
			ja = 2.466
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
				arg_107_0:Play318301027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1093ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1093ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, -1.11, -5.88)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1093ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1093ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1093ui_story == nil then
				arg_107_1.var_.characterEffect1093ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1093ui_story then
					arg_107_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1093ui_story then
				arg_107_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_15 = 0
			local var_110_16 = 0.1

			if var_110_15 < arg_107_1.time_ and arg_107_1.time_ <= var_110_15 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_17 = arg_107_1:FormatText(StoryNameCfg[73].name)

				arg_107_1.leftNameTxt_.text = var_110_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_18 = arg_107_1:GetWordFromCfg(318301026)
				local var_110_19 = arg_107_1:FormatText(var_110_18.content)

				arg_107_1.text_.text = var_110_19

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_20 = 4
				local var_110_21 = utf8.len(var_110_19)
				local var_110_22 = var_110_20 <= 0 and var_110_16 or var_110_16 * (var_110_21 / var_110_20)

				if var_110_22 > 0 and var_110_16 < var_110_22 then
					arg_107_1.talkMaxDuration = var_110_22

					if var_110_22 + var_110_15 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_22 + var_110_15
					end
				end

				arg_107_1.text_.text = var_110_19
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301026", "story_v_out_318301.awb") ~= 0 then
					local var_110_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301026", "story_v_out_318301.awb") / 1000

					if var_110_23 + var_110_15 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_23 + var_110_15
					end

					if var_110_18.prefab_name ~= "" and arg_107_1.actors_[var_110_18.prefab_name] ~= nil then
						local var_110_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_18.prefab_name].transform, "story_v_out_318301", "318301026", "story_v_out_318301.awb")

						arg_107_1:RecordAudio("318301026", var_110_24)
						arg_107_1:RecordAudio("318301026", var_110_24)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_318301", "318301026", "story_v_out_318301.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_318301", "318301026", "story_v_out_318301.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_25 = math.max(var_110_16, arg_107_1.talkMaxDuration)

			if var_110_15 <= arg_107_1.time_ and arg_107_1.time_ < var_110_15 + var_110_25 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_15) / var_110_25

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_15 + var_110_25 and arg_107_1.time_ < var_110_15 + var_110_25 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play318301027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 318301027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play318301028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1093ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1093ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(0, 100, 0)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1093ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, 100, 0)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = arg_111_1.actors_["1093ui_story"]
			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1093ui_story == nil then
				arg_111_1.var_.characterEffect1093ui_story = var_114_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_11 = 0.200000002980232

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_10) / var_114_11

				if arg_111_1.var_.characterEffect1093ui_story then
					local var_114_13 = Mathf.Lerp(0, 0.5, var_114_12)

					arg_111_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1093ui_story.fillRatio = var_114_13
				end
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 and arg_111_1.var_.characterEffect1093ui_story then
				local var_114_14 = 0.5

				arg_111_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1093ui_story.fillRatio = var_114_14
			end

			local var_114_15 = 0
			local var_114_16 = 0.425

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_17 = arg_111_1:FormatText(StoryNameCfg[7].name)

				arg_111_1.leftNameTxt_.text = var_114_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_18 = arg_111_1:GetWordFromCfg(318301027)
				local var_114_19 = arg_111_1:FormatText(var_114_18.content)

				arg_111_1.text_.text = var_114_19

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_20 = 17
				local var_114_21 = utf8.len(var_114_19)
				local var_114_22 = var_114_20 <= 0 and var_114_16 or var_114_16 * (var_114_21 / var_114_20)

				if var_114_22 > 0 and var_114_16 < var_114_22 then
					arg_111_1.talkMaxDuration = var_114_22

					if var_114_22 + var_114_15 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_22 + var_114_15
					end
				end

				arg_111_1.text_.text = var_114_19
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_23 = math.max(var_114_16, arg_111_1.talkMaxDuration)

			if var_114_15 <= arg_111_1.time_ and arg_111_1.time_ < var_114_15 + var_114_23 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_15) / var_114_23

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_15 + var_114_23 and arg_111_1.time_ < var_114_15 + var_114_23 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play318301028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 318301028
		arg_115_1.duration_ = 9.333

		local var_115_0 = {
			zh = 6.1,
			ja = 9.333
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
				arg_115_0:Play318301029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1199ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1199ui_story = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(0, -1.08, -5.9)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1199ui_story, var_118_4, var_118_3)

				local var_118_5 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_5.x, var_118_5.y, var_118_5.z)

				local var_118_6 = var_118_0.localEulerAngles

				var_118_6.z = 0
				var_118_6.x = 0
				var_118_0.localEulerAngles = var_118_6
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_118_7 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_7.x, var_118_7.y, var_118_7.z)

				local var_118_8 = var_118_0.localEulerAngles

				var_118_8.z = 0
				var_118_8.x = 0
				var_118_0.localEulerAngles = var_118_8
			end

			local var_118_9 = arg_115_1.actors_["1199ui_story"]
			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 and arg_115_1.var_.characterEffect1199ui_story == nil then
				arg_115_1.var_.characterEffect1199ui_story = var_118_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_11 = 0.200000002980232

			if var_118_10 <= arg_115_1.time_ and arg_115_1.time_ < var_118_10 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_10) / var_118_11

				if arg_115_1.var_.characterEffect1199ui_story then
					arg_115_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_10 + var_118_11 and arg_115_1.time_ < var_118_10 + var_118_11 + arg_118_0 and arg_115_1.var_.characterEffect1199ui_story then
				arg_115_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				arg_115_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_118_15 = 0
			local var_118_16 = 0.625

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_17 = arg_115_1:FormatText(StoryNameCfg[84].name)

				arg_115_1.leftNameTxt_.text = var_118_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_18 = arg_115_1:GetWordFromCfg(318301028)
				local var_118_19 = arg_115_1:FormatText(var_118_18.content)

				arg_115_1.text_.text = var_118_19

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_20 = 25
				local var_118_21 = utf8.len(var_118_19)
				local var_118_22 = var_118_20 <= 0 and var_118_16 or var_118_16 * (var_118_21 / var_118_20)

				if var_118_22 > 0 and var_118_16 < var_118_22 then
					arg_115_1.talkMaxDuration = var_118_22

					if var_118_22 + var_118_15 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_22 + var_118_15
					end
				end

				arg_115_1.text_.text = var_118_19
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301028", "story_v_out_318301.awb") ~= 0 then
					local var_118_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301028", "story_v_out_318301.awb") / 1000

					if var_118_23 + var_118_15 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_23 + var_118_15
					end

					if var_118_18.prefab_name ~= "" and arg_115_1.actors_[var_118_18.prefab_name] ~= nil then
						local var_118_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_18.prefab_name].transform, "story_v_out_318301", "318301028", "story_v_out_318301.awb")

						arg_115_1:RecordAudio("318301028", var_118_24)
						arg_115_1:RecordAudio("318301028", var_118_24)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_318301", "318301028", "story_v_out_318301.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_318301", "318301028", "story_v_out_318301.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_25 = math.max(var_118_16, arg_115_1.talkMaxDuration)

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_25 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_15) / var_118_25

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_15 + var_118_25 and arg_115_1.time_ < var_118_15 + var_118_25 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play318301029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 318301029
		arg_119_1.duration_ = 5.533

		local var_119_0 = {
			zh = 1.999999999999,
			ja = 5.533
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
				arg_119_0:Play318301030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1150ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1150ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, -1.01, -6.2)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1150ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -1.01, -6.2)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1150ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1150ui_story == nil then
				arg_119_1.var_.characterEffect1150ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1150ui_story then
					arg_119_1.var_.characterEffect1150ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1150ui_story then
				arg_119_1.var_.characterEffect1150ui_story.fillFlat = false
			end

			local var_122_13 = 0

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/story1150/story1150action/1150action5_1")
			end

			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_122_15 = arg_119_1.actors_["1199ui_story"].transform
			local var_122_16 = 0

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.var_.moveOldPos1199ui_story = var_122_15.localPosition
			end

			local var_122_17 = 0.001

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17
				local var_122_19 = Vector3.New(0, 100, 0)

				var_122_15.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1199ui_story, var_122_19, var_122_18)

				local var_122_20 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_20.x, var_122_20.y, var_122_20.z)

				local var_122_21 = var_122_15.localEulerAngles

				var_122_21.z = 0
				var_122_21.x = 0
				var_122_15.localEulerAngles = var_122_21
			end

			if arg_119_1.time_ >= var_122_16 + var_122_17 and arg_119_1.time_ < var_122_16 + var_122_17 + arg_122_0 then
				var_122_15.localPosition = Vector3.New(0, 100, 0)

				local var_122_22 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_22.x, var_122_22.y, var_122_22.z)

				local var_122_23 = var_122_15.localEulerAngles

				var_122_23.z = 0
				var_122_23.x = 0
				var_122_15.localEulerAngles = var_122_23
			end

			local var_122_24 = arg_119_1.actors_["1199ui_story"]
			local var_122_25 = 0

			if var_122_25 < arg_119_1.time_ and arg_119_1.time_ <= var_122_25 + arg_122_0 and arg_119_1.var_.characterEffect1199ui_story == nil then
				arg_119_1.var_.characterEffect1199ui_story = var_122_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_26 = 0.200000002980232

			if var_122_25 <= arg_119_1.time_ and arg_119_1.time_ < var_122_25 + var_122_26 then
				local var_122_27 = (arg_119_1.time_ - var_122_25) / var_122_26

				if arg_119_1.var_.characterEffect1199ui_story then
					local var_122_28 = Mathf.Lerp(0, 0.5, var_122_27)

					arg_119_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1199ui_story.fillRatio = var_122_28
				end
			end

			if arg_119_1.time_ >= var_122_25 + var_122_26 and arg_119_1.time_ < var_122_25 + var_122_26 + arg_122_0 and arg_119_1.var_.characterEffect1199ui_story then
				local var_122_29 = 0.5

				arg_119_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1199ui_story.fillRatio = var_122_29
			end

			local var_122_30 = 0
			local var_122_31 = 0.2

			if var_122_30 < arg_119_1.time_ and arg_119_1.time_ <= var_122_30 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_32 = arg_119_1:FormatText(StoryNameCfg[74].name)

				arg_119_1.leftNameTxt_.text = var_122_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_33 = arg_119_1:GetWordFromCfg(318301029)
				local var_122_34 = arg_119_1:FormatText(var_122_33.content)

				arg_119_1.text_.text = var_122_34

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_35 = 8
				local var_122_36 = utf8.len(var_122_34)
				local var_122_37 = var_122_35 <= 0 and var_122_31 or var_122_31 * (var_122_36 / var_122_35)

				if var_122_37 > 0 and var_122_31 < var_122_37 then
					arg_119_1.talkMaxDuration = var_122_37

					if var_122_37 + var_122_30 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_37 + var_122_30
					end
				end

				arg_119_1.text_.text = var_122_34
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301029", "story_v_out_318301.awb") ~= 0 then
					local var_122_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301029", "story_v_out_318301.awb") / 1000

					if var_122_38 + var_122_30 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_38 + var_122_30
					end

					if var_122_33.prefab_name ~= "" and arg_119_1.actors_[var_122_33.prefab_name] ~= nil then
						local var_122_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_33.prefab_name].transform, "story_v_out_318301", "318301029", "story_v_out_318301.awb")

						arg_119_1:RecordAudio("318301029", var_122_39)
						arg_119_1:RecordAudio("318301029", var_122_39)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_318301", "318301029", "story_v_out_318301.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_318301", "318301029", "story_v_out_318301.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_40 = math.max(var_122_31, arg_119_1.talkMaxDuration)

			if var_122_30 <= arg_119_1.time_ and arg_119_1.time_ < var_122_30 + var_122_40 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_30) / var_122_40

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_30 + var_122_40 and arg_119_1.time_ < var_122_30 + var_122_40 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play318301030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 318301030
		arg_123_1.duration_ = 7

		local var_123_0 = {
			zh = 7,
			ja = 4.033
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
				arg_123_0:Play318301031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1199ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1199ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, -1.08, -5.9)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1199ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["1199ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect1199ui_story == nil then
				arg_123_1.var_.characterEffect1199ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect1199ui_story then
					arg_123_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect1199ui_story then
				arg_123_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_15 = arg_123_1.actors_["1150ui_story"].transform
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.var_.moveOldPos1150ui_story = var_126_15.localPosition
			end

			local var_126_17 = 0.001

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Vector3.New(0, 100, 0)

				var_126_15.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1150ui_story, var_126_19, var_126_18)

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

			local var_126_24 = arg_123_1.actors_["1150ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect1150ui_story == nil then
				arg_123_1.var_.characterEffect1150ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.200000002980232

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect1150ui_story then
					local var_126_28 = Mathf.Lerp(0, 0.5, var_126_27)

					arg_123_1.var_.characterEffect1150ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1150ui_story.fillRatio = var_126_28
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect1150ui_story then
				local var_126_29 = 0.5

				arg_123_1.var_.characterEffect1150ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1150ui_story.fillRatio = var_126_29
			end

			local var_126_30 = 0
			local var_126_31 = 0.6

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_32 = arg_123_1:FormatText(StoryNameCfg[84].name)

				arg_123_1.leftNameTxt_.text = var_126_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_33 = arg_123_1:GetWordFromCfg(318301030)
				local var_126_34 = arg_123_1:FormatText(var_126_33.content)

				arg_123_1.text_.text = var_126_34

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_35 = 24
				local var_126_36 = utf8.len(var_126_34)
				local var_126_37 = var_126_35 <= 0 and var_126_31 or var_126_31 * (var_126_36 / var_126_35)

				if var_126_37 > 0 and var_126_31 < var_126_37 then
					arg_123_1.talkMaxDuration = var_126_37

					if var_126_37 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_37 + var_126_30
					end
				end

				arg_123_1.text_.text = var_126_34
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301030", "story_v_out_318301.awb") ~= 0 then
					local var_126_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301030", "story_v_out_318301.awb") / 1000

					if var_126_38 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_38 + var_126_30
					end

					if var_126_33.prefab_name ~= "" and arg_123_1.actors_[var_126_33.prefab_name] ~= nil then
						local var_126_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_33.prefab_name].transform, "story_v_out_318301", "318301030", "story_v_out_318301.awb")

						arg_123_1:RecordAudio("318301030", var_126_39)
						arg_123_1:RecordAudio("318301030", var_126_39)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_318301", "318301030", "story_v_out_318301.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_318301", "318301030", "story_v_out_318301.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_40 = math.max(var_126_31, arg_123_1.talkMaxDuration)

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_40 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_30) / var_126_40

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_30 + var_126_40 and arg_123_1.time_ < var_126_30 + var_126_40 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play318301031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 318301031
		arg_127_1.duration_ = 2.833

		local var_127_0 = {
			zh = 2.833,
			ja = 2.633
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
				arg_127_0:Play318301032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1093ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1093ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, -1.11, -5.88)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1093ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1093ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect1093ui_story == nil then
				arg_127_1.var_.characterEffect1093ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect1093ui_story then
					arg_127_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect1093ui_story then
				arg_127_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_130_15 = arg_127_1.actors_["1199ui_story"].transform
			local var_130_16 = 0

			if var_130_16 < arg_127_1.time_ and arg_127_1.time_ <= var_130_16 + arg_130_0 then
				arg_127_1.var_.moveOldPos1199ui_story = var_130_15.localPosition
			end

			local var_130_17 = 0.001

			if var_130_16 <= arg_127_1.time_ and arg_127_1.time_ < var_130_16 + var_130_17 then
				local var_130_18 = (arg_127_1.time_ - var_130_16) / var_130_17
				local var_130_19 = Vector3.New(0, 100, 0)

				var_130_15.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1199ui_story, var_130_19, var_130_18)

				local var_130_20 = manager.ui.mainCamera.transform.position - var_130_15.position

				var_130_15.forward = Vector3.New(var_130_20.x, var_130_20.y, var_130_20.z)

				local var_130_21 = var_130_15.localEulerAngles

				var_130_21.z = 0
				var_130_21.x = 0
				var_130_15.localEulerAngles = var_130_21
			end

			if arg_127_1.time_ >= var_130_16 + var_130_17 and arg_127_1.time_ < var_130_16 + var_130_17 + arg_130_0 then
				var_130_15.localPosition = Vector3.New(0, 100, 0)

				local var_130_22 = manager.ui.mainCamera.transform.position - var_130_15.position

				var_130_15.forward = Vector3.New(var_130_22.x, var_130_22.y, var_130_22.z)

				local var_130_23 = var_130_15.localEulerAngles

				var_130_23.z = 0
				var_130_23.x = 0
				var_130_15.localEulerAngles = var_130_23
			end

			local var_130_24 = arg_127_1.actors_["1199ui_story"]
			local var_130_25 = 0

			if var_130_25 < arg_127_1.time_ and arg_127_1.time_ <= var_130_25 + arg_130_0 and arg_127_1.var_.characterEffect1199ui_story == nil then
				arg_127_1.var_.characterEffect1199ui_story = var_130_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_26 = 0.200000002980232

			if var_130_25 <= arg_127_1.time_ and arg_127_1.time_ < var_130_25 + var_130_26 then
				local var_130_27 = (arg_127_1.time_ - var_130_25) / var_130_26

				if arg_127_1.var_.characterEffect1199ui_story then
					local var_130_28 = Mathf.Lerp(0, 0.5, var_130_27)

					arg_127_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1199ui_story.fillRatio = var_130_28
				end
			end

			if arg_127_1.time_ >= var_130_25 + var_130_26 and arg_127_1.time_ < var_130_25 + var_130_26 + arg_130_0 and arg_127_1.var_.characterEffect1199ui_story then
				local var_130_29 = 0.5

				arg_127_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1199ui_story.fillRatio = var_130_29
			end

			local var_130_30 = 0
			local var_130_31 = 0.25

			if var_130_30 < arg_127_1.time_ and arg_127_1.time_ <= var_130_30 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_32 = arg_127_1:FormatText(StoryNameCfg[73].name)

				arg_127_1.leftNameTxt_.text = var_130_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_33 = arg_127_1:GetWordFromCfg(318301031)
				local var_130_34 = arg_127_1:FormatText(var_130_33.content)

				arg_127_1.text_.text = var_130_34

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_35 = 10
				local var_130_36 = utf8.len(var_130_34)
				local var_130_37 = var_130_35 <= 0 and var_130_31 or var_130_31 * (var_130_36 / var_130_35)

				if var_130_37 > 0 and var_130_31 < var_130_37 then
					arg_127_1.talkMaxDuration = var_130_37

					if var_130_37 + var_130_30 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_37 + var_130_30
					end
				end

				arg_127_1.text_.text = var_130_34
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301031", "story_v_out_318301.awb") ~= 0 then
					local var_130_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301031", "story_v_out_318301.awb") / 1000

					if var_130_38 + var_130_30 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_38 + var_130_30
					end

					if var_130_33.prefab_name ~= "" and arg_127_1.actors_[var_130_33.prefab_name] ~= nil then
						local var_130_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_33.prefab_name].transform, "story_v_out_318301", "318301031", "story_v_out_318301.awb")

						arg_127_1:RecordAudio("318301031", var_130_39)
						arg_127_1:RecordAudio("318301031", var_130_39)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_318301", "318301031", "story_v_out_318301.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_318301", "318301031", "story_v_out_318301.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_40 = math.max(var_130_31, arg_127_1.talkMaxDuration)

			if var_130_30 <= arg_127_1.time_ and arg_127_1.time_ < var_130_30 + var_130_40 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_30) / var_130_40

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_30 + var_130_40 and arg_127_1.time_ < var_130_30 + var_130_40 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play318301032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 318301032
		arg_131_1.duration_ = 3.3

		local var_131_0 = {
			zh = 1.999999999999,
			ja = 3.3
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
				arg_131_0:Play318301033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1199ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos1199ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, -1.08, -5.9)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1199ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["1199ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect1199ui_story == nil then
				arg_131_1.var_.characterEffect1199ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect1199ui_story then
					arg_131_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect1199ui_story then
				arg_131_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_134_15 = arg_131_1.actors_["1093ui_story"].transform
			local var_134_16 = 0

			if var_134_16 < arg_131_1.time_ and arg_131_1.time_ <= var_134_16 + arg_134_0 then
				arg_131_1.var_.moveOldPos1093ui_story = var_134_15.localPosition
			end

			local var_134_17 = 0.001

			if var_134_16 <= arg_131_1.time_ and arg_131_1.time_ < var_134_16 + var_134_17 then
				local var_134_18 = (arg_131_1.time_ - var_134_16) / var_134_17
				local var_134_19 = Vector3.New(0, 100, 0)

				var_134_15.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1093ui_story, var_134_19, var_134_18)

				local var_134_20 = manager.ui.mainCamera.transform.position - var_134_15.position

				var_134_15.forward = Vector3.New(var_134_20.x, var_134_20.y, var_134_20.z)

				local var_134_21 = var_134_15.localEulerAngles

				var_134_21.z = 0
				var_134_21.x = 0
				var_134_15.localEulerAngles = var_134_21
			end

			if arg_131_1.time_ >= var_134_16 + var_134_17 and arg_131_1.time_ < var_134_16 + var_134_17 + arg_134_0 then
				var_134_15.localPosition = Vector3.New(0, 100, 0)

				local var_134_22 = manager.ui.mainCamera.transform.position - var_134_15.position

				var_134_15.forward = Vector3.New(var_134_22.x, var_134_22.y, var_134_22.z)

				local var_134_23 = var_134_15.localEulerAngles

				var_134_23.z = 0
				var_134_23.x = 0
				var_134_15.localEulerAngles = var_134_23
			end

			local var_134_24 = arg_131_1.actors_["1093ui_story"]
			local var_134_25 = 0

			if var_134_25 < arg_131_1.time_ and arg_131_1.time_ <= var_134_25 + arg_134_0 and arg_131_1.var_.characterEffect1093ui_story == nil then
				arg_131_1.var_.characterEffect1093ui_story = var_134_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_26 = 0.200000002980232

			if var_134_25 <= arg_131_1.time_ and arg_131_1.time_ < var_134_25 + var_134_26 then
				local var_134_27 = (arg_131_1.time_ - var_134_25) / var_134_26

				if arg_131_1.var_.characterEffect1093ui_story then
					local var_134_28 = Mathf.Lerp(0, 0.5, var_134_27)

					arg_131_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1093ui_story.fillRatio = var_134_28
				end
			end

			if arg_131_1.time_ >= var_134_25 + var_134_26 and arg_131_1.time_ < var_134_25 + var_134_26 + arg_134_0 and arg_131_1.var_.characterEffect1093ui_story then
				local var_134_29 = 0.5

				arg_131_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1093ui_story.fillRatio = var_134_29
			end

			local var_134_30 = 0
			local var_134_31 = 0.15

			if var_134_30 < arg_131_1.time_ and arg_131_1.time_ <= var_134_30 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_32 = arg_131_1:FormatText(StoryNameCfg[84].name)

				arg_131_1.leftNameTxt_.text = var_134_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_33 = arg_131_1:GetWordFromCfg(318301032)
				local var_134_34 = arg_131_1:FormatText(var_134_33.content)

				arg_131_1.text_.text = var_134_34

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_35 = 6
				local var_134_36 = utf8.len(var_134_34)
				local var_134_37 = var_134_35 <= 0 and var_134_31 or var_134_31 * (var_134_36 / var_134_35)

				if var_134_37 > 0 and var_134_31 < var_134_37 then
					arg_131_1.talkMaxDuration = var_134_37

					if var_134_37 + var_134_30 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_37 + var_134_30
					end
				end

				arg_131_1.text_.text = var_134_34
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301032", "story_v_out_318301.awb") ~= 0 then
					local var_134_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301032", "story_v_out_318301.awb") / 1000

					if var_134_38 + var_134_30 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_38 + var_134_30
					end

					if var_134_33.prefab_name ~= "" and arg_131_1.actors_[var_134_33.prefab_name] ~= nil then
						local var_134_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_33.prefab_name].transform, "story_v_out_318301", "318301032", "story_v_out_318301.awb")

						arg_131_1:RecordAudio("318301032", var_134_39)
						arg_131_1:RecordAudio("318301032", var_134_39)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_318301", "318301032", "story_v_out_318301.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_318301", "318301032", "story_v_out_318301.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_40 = math.max(var_134_31, arg_131_1.talkMaxDuration)

			if var_134_30 <= arg_131_1.time_ and arg_131_1.time_ < var_134_30 + var_134_40 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_30) / var_134_40

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_30 + var_134_40 and arg_131_1.time_ < var_134_30 + var_134_40 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play318301033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 318301033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play318301034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1199ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1199ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, 100, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1199ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, 100, 0)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["1199ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1199ui_story == nil then
				arg_135_1.var_.characterEffect1199ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect1199ui_story then
					local var_138_13 = Mathf.Lerp(0, 0.5, var_138_12)

					arg_135_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1199ui_story.fillRatio = var_138_13
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect1199ui_story then
				local var_138_14 = 0.5

				arg_135_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1199ui_story.fillRatio = var_138_14
			end

			local var_138_15 = 0
			local var_138_16 = 0.825

			if var_138_15 < arg_135_1.time_ and arg_135_1.time_ <= var_138_15 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_17 = arg_135_1:GetWordFromCfg(318301033)
				local var_138_18 = arg_135_1:FormatText(var_138_17.content)

				arg_135_1.text_.text = var_138_18

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_19 = 33
				local var_138_20 = utf8.len(var_138_18)
				local var_138_21 = var_138_19 <= 0 and var_138_16 or var_138_16 * (var_138_20 / var_138_19)

				if var_138_21 > 0 and var_138_16 < var_138_21 then
					arg_135_1.talkMaxDuration = var_138_21

					if var_138_21 + var_138_15 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_15
					end
				end

				arg_135_1.text_.text = var_138_18
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_16, arg_135_1.talkMaxDuration)

			if var_138_15 <= arg_135_1.time_ and arg_135_1.time_ < var_138_15 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_15) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_15 + var_138_22 and arg_135_1.time_ < var_138_15 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play318301034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 318301034
		arg_139_1.duration_ = 2.766

		local var_139_0 = {
			zh = 2.6,
			ja = 2.766
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
				arg_139_0:Play318301035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1199ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1199ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, -1.08, -5.9)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1199ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1199ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1199ui_story == nil then
				arg_139_1.var_.characterEffect1199ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1199ui_story then
					arg_139_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1199ui_story then
				arg_139_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_142_13 = 0

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_142_15 = 0
			local var_142_16 = 0.175

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_17 = arg_139_1:FormatText(StoryNameCfg[84].name)

				arg_139_1.leftNameTxt_.text = var_142_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_18 = arg_139_1:GetWordFromCfg(318301034)
				local var_142_19 = arg_139_1:FormatText(var_142_18.content)

				arg_139_1.text_.text = var_142_19

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_20 = 7
				local var_142_21 = utf8.len(var_142_19)
				local var_142_22 = var_142_20 <= 0 and var_142_16 or var_142_16 * (var_142_21 / var_142_20)

				if var_142_22 > 0 and var_142_16 < var_142_22 then
					arg_139_1.talkMaxDuration = var_142_22

					if var_142_22 + var_142_15 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_22 + var_142_15
					end
				end

				arg_139_1.text_.text = var_142_19
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301034", "story_v_out_318301.awb") ~= 0 then
					local var_142_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301034", "story_v_out_318301.awb") / 1000

					if var_142_23 + var_142_15 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_23 + var_142_15
					end

					if var_142_18.prefab_name ~= "" and arg_139_1.actors_[var_142_18.prefab_name] ~= nil then
						local var_142_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_18.prefab_name].transform, "story_v_out_318301", "318301034", "story_v_out_318301.awb")

						arg_139_1:RecordAudio("318301034", var_142_24)
						arg_139_1:RecordAudio("318301034", var_142_24)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_318301", "318301034", "story_v_out_318301.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_318301", "318301034", "story_v_out_318301.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_25 = math.max(var_142_16, arg_139_1.talkMaxDuration)

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_25 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_15) / var_142_25

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_15 + var_142_25 and arg_139_1.time_ < var_142_15 + var_142_25 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play318301035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 318301035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play318301036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1199ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1199ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, 100, 0)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1199ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, 100, 0)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["1199ui_story"]
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 and arg_143_1.var_.characterEffect1199ui_story == nil then
				arg_143_1.var_.characterEffect1199ui_story = var_146_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_11 = 0.200000002980232

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11

				if arg_143_1.var_.characterEffect1199ui_story then
					local var_146_13 = Mathf.Lerp(0, 0.5, var_146_12)

					arg_143_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1199ui_story.fillRatio = var_146_13
				end
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 and arg_143_1.var_.characterEffect1199ui_story then
				local var_146_14 = 0.5

				arg_143_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1199ui_story.fillRatio = var_146_14
			end

			local var_146_15 = 0
			local var_146_16 = 0.475

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_17 = arg_143_1:FormatText(StoryNameCfg[7].name)

				arg_143_1.leftNameTxt_.text = var_146_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_18 = arg_143_1:GetWordFromCfg(318301035)
				local var_146_19 = arg_143_1:FormatText(var_146_18.content)

				arg_143_1.text_.text = var_146_19

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_20 = 19
				local var_146_21 = utf8.len(var_146_19)
				local var_146_22 = var_146_20 <= 0 and var_146_16 or var_146_16 * (var_146_21 / var_146_20)

				if var_146_22 > 0 and var_146_16 < var_146_22 then
					arg_143_1.talkMaxDuration = var_146_22

					if var_146_22 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_22 + var_146_15
					end
				end

				arg_143_1.text_.text = var_146_19
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_23 = math.max(var_146_16, arg_143_1.talkMaxDuration)

			if var_146_15 <= arg_143_1.time_ and arg_143_1.time_ < var_146_15 + var_146_23 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_15) / var_146_23

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_15 + var_146_23 and arg_143_1.time_ < var_146_15 + var_146_23 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play318301036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 318301036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play318301037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.7

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[7].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(318301036)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 28
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_8 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_8 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_8

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_8 and arg_147_1.time_ < var_150_0 + var_150_8 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play318301037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 318301037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play318301038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.7

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

				local var_154_2 = arg_151_1:GetWordFromCfg(318301037)
				local var_154_3 = arg_151_1:FormatText(var_154_2.content)

				arg_151_1.text_.text = var_154_3

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_4 = 28
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
	Play318301038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 318301038
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play318301039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.05

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[7].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(318301038)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 42
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_8 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_8 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_8

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_8 and arg_155_1.time_ < var_158_0 + var_158_8 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play318301039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 318301039
		arg_159_1.duration_ = 2.1

		local var_159_0 = {
			zh = 1.999999999999,
			ja = 2.1
		}
		local var_159_1 = manager.audio:GetLocalizationFlag()

		if var_159_0[var_159_1] ~= nil then
			arg_159_1.duration_ = var_159_0[var_159_1]
		end

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play318301040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1150ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1150ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(0, -1.01, -6.2)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1150ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, -1.01, -6.2)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["1150ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect1150ui_story == nil then
				arg_159_1.var_.characterEffect1150ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect1150ui_story then
					arg_159_1.var_.characterEffect1150ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect1150ui_story then
				arg_159_1.var_.characterEffect1150ui_story.fillFlat = false
			end

			local var_162_13 = 0

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/story1150/story1150action/1150action1_1")
			end

			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 then
				arg_159_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_162_15 = 0
			local var_162_16 = 0.05

			if var_162_15 < arg_159_1.time_ and arg_159_1.time_ <= var_162_15 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_17 = arg_159_1:FormatText(StoryNameCfg[74].name)

				arg_159_1.leftNameTxt_.text = var_162_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_18 = arg_159_1:GetWordFromCfg(318301039)
				local var_162_19 = arg_159_1:FormatText(var_162_18.content)

				arg_159_1.text_.text = var_162_19

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_20 = 2
				local var_162_21 = utf8.len(var_162_19)
				local var_162_22 = var_162_20 <= 0 and var_162_16 or var_162_16 * (var_162_21 / var_162_20)

				if var_162_22 > 0 and var_162_16 < var_162_22 then
					arg_159_1.talkMaxDuration = var_162_22

					if var_162_22 + var_162_15 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_22 + var_162_15
					end
				end

				arg_159_1.text_.text = var_162_19
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301039", "story_v_out_318301.awb") ~= 0 then
					local var_162_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301039", "story_v_out_318301.awb") / 1000

					if var_162_23 + var_162_15 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_23 + var_162_15
					end

					if var_162_18.prefab_name ~= "" and arg_159_1.actors_[var_162_18.prefab_name] ~= nil then
						local var_162_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_18.prefab_name].transform, "story_v_out_318301", "318301039", "story_v_out_318301.awb")

						arg_159_1:RecordAudio("318301039", var_162_24)
						arg_159_1:RecordAudio("318301039", var_162_24)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_318301", "318301039", "story_v_out_318301.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_318301", "318301039", "story_v_out_318301.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_25 = math.max(var_162_16, arg_159_1.talkMaxDuration)

			if var_162_15 <= arg_159_1.time_ and arg_159_1.time_ < var_162_15 + var_162_25 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_15) / var_162_25

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_15 + var_162_25 and arg_159_1.time_ < var_162_15 + var_162_25 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play318301040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 318301040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play318301041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1150ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1150ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, 100, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1150ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, 100, 0)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["1150ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect1150ui_story == nil then
				arg_163_1.var_.characterEffect1150ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect1150ui_story then
					local var_166_13 = Mathf.Lerp(0, 0.5, var_166_12)

					arg_163_1.var_.characterEffect1150ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1150ui_story.fillRatio = var_166_13
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect1150ui_story then
				local var_166_14 = 0.5

				arg_163_1.var_.characterEffect1150ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1150ui_story.fillRatio = var_166_14
			end

			local var_166_15 = 0
			local var_166_16 = 0.25

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_17 = arg_163_1:FormatText(StoryNameCfg[7].name)

				arg_163_1.leftNameTxt_.text = var_166_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_18 = arg_163_1:GetWordFromCfg(318301040)
				local var_166_19 = arg_163_1:FormatText(var_166_18.content)

				arg_163_1.text_.text = var_166_19

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_20 = 10
				local var_166_21 = utf8.len(var_166_19)
				local var_166_22 = var_166_20 <= 0 and var_166_16 or var_166_16 * (var_166_21 / var_166_20)

				if var_166_22 > 0 and var_166_16 < var_166_22 then
					arg_163_1.talkMaxDuration = var_166_22

					if var_166_22 + var_166_15 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_22 + var_166_15
					end
				end

				arg_163_1.text_.text = var_166_19
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_23 = math.max(var_166_16, arg_163_1.talkMaxDuration)

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_23 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_15) / var_166_23

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_15 + var_166_23 and arg_163_1.time_ < var_166_15 + var_166_23 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play318301041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 318301041
		arg_167_1.duration_ = 8.7

		local var_167_0 = {
			zh = 8.5,
			ja = 8.7
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
				arg_167_0:Play318301042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1093ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1093ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, -1.11, -5.88)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1093ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1093ui_story"]
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 and arg_167_1.var_.characterEffect1093ui_story == nil then
				arg_167_1.var_.characterEffect1093ui_story = var_170_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_11 = 0.200000002980232

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11

				if arg_167_1.var_.characterEffect1093ui_story then
					arg_167_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1093ui_story then
				arg_167_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_170_13 = 0

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				arg_167_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_170_15 = 0
			local var_170_16 = 0.975

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_17 = arg_167_1:FormatText(StoryNameCfg[73].name)

				arg_167_1.leftNameTxt_.text = var_170_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_18 = arg_167_1:GetWordFromCfg(318301041)
				local var_170_19 = arg_167_1:FormatText(var_170_18.content)

				arg_167_1.text_.text = var_170_19

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_20 = 39
				local var_170_21 = utf8.len(var_170_19)
				local var_170_22 = var_170_20 <= 0 and var_170_16 or var_170_16 * (var_170_21 / var_170_20)

				if var_170_22 > 0 and var_170_16 < var_170_22 then
					arg_167_1.talkMaxDuration = var_170_22

					if var_170_22 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_22 + var_170_15
					end
				end

				arg_167_1.text_.text = var_170_19
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301041", "story_v_out_318301.awb") ~= 0 then
					local var_170_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301041", "story_v_out_318301.awb") / 1000

					if var_170_23 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_23 + var_170_15
					end

					if var_170_18.prefab_name ~= "" and arg_167_1.actors_[var_170_18.prefab_name] ~= nil then
						local var_170_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_18.prefab_name].transform, "story_v_out_318301", "318301041", "story_v_out_318301.awb")

						arg_167_1:RecordAudio("318301041", var_170_24)
						arg_167_1:RecordAudio("318301041", var_170_24)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_318301", "318301041", "story_v_out_318301.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_318301", "318301041", "story_v_out_318301.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_25 = math.max(var_170_16, arg_167_1.talkMaxDuration)

			if var_170_15 <= arg_167_1.time_ and arg_167_1.time_ < var_170_15 + var_170_25 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_15) / var_170_25

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_15 + var_170_25 and arg_167_1.time_ < var_170_15 + var_170_25 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play318301042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 318301042
		arg_171_1.duration_ = 1.999999999999

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play318301043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1150ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1150ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, -1.01, -6.2)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1150ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, -1.01, -6.2)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["1150ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect1150ui_story == nil then
				arg_171_1.var_.characterEffect1150ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect1150ui_story then
					arg_171_1.var_.characterEffect1150ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect1150ui_story then
				arg_171_1.var_.characterEffect1150ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_14 = arg_171_1.actors_["1093ui_story"].transform
			local var_174_15 = 0

			if var_174_15 < arg_171_1.time_ and arg_171_1.time_ <= var_174_15 + arg_174_0 then
				arg_171_1.var_.moveOldPos1093ui_story = var_174_14.localPosition
			end

			local var_174_16 = 0.001

			if var_174_15 <= arg_171_1.time_ and arg_171_1.time_ < var_174_15 + var_174_16 then
				local var_174_17 = (arg_171_1.time_ - var_174_15) / var_174_16
				local var_174_18 = Vector3.New(0, 100, 0)

				var_174_14.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1093ui_story, var_174_18, var_174_17)

				local var_174_19 = manager.ui.mainCamera.transform.position - var_174_14.position

				var_174_14.forward = Vector3.New(var_174_19.x, var_174_19.y, var_174_19.z)

				local var_174_20 = var_174_14.localEulerAngles

				var_174_20.z = 0
				var_174_20.x = 0
				var_174_14.localEulerAngles = var_174_20
			end

			if arg_171_1.time_ >= var_174_15 + var_174_16 and arg_171_1.time_ < var_174_15 + var_174_16 + arg_174_0 then
				var_174_14.localPosition = Vector3.New(0, 100, 0)

				local var_174_21 = manager.ui.mainCamera.transform.position - var_174_14.position

				var_174_14.forward = Vector3.New(var_174_21.x, var_174_21.y, var_174_21.z)

				local var_174_22 = var_174_14.localEulerAngles

				var_174_22.z = 0
				var_174_22.x = 0
				var_174_14.localEulerAngles = var_174_22
			end

			local var_174_23 = arg_171_1.actors_["1093ui_story"]
			local var_174_24 = 0

			if var_174_24 < arg_171_1.time_ and arg_171_1.time_ <= var_174_24 + arg_174_0 and arg_171_1.var_.characterEffect1093ui_story == nil then
				arg_171_1.var_.characterEffect1093ui_story = var_174_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_25 = 0.200000002980232

			if var_174_24 <= arg_171_1.time_ and arg_171_1.time_ < var_174_24 + var_174_25 then
				local var_174_26 = (arg_171_1.time_ - var_174_24) / var_174_25

				if arg_171_1.var_.characterEffect1093ui_story then
					local var_174_27 = Mathf.Lerp(0, 0.5, var_174_26)

					arg_171_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1093ui_story.fillRatio = var_174_27
				end
			end

			if arg_171_1.time_ >= var_174_24 + var_174_25 and arg_171_1.time_ < var_174_24 + var_174_25 + arg_174_0 and arg_171_1.var_.characterEffect1093ui_story then
				local var_174_28 = 0.5

				arg_171_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1093ui_story.fillRatio = var_174_28
			end

			local var_174_29 = 0
			local var_174_30 = 0.1

			if var_174_29 < arg_171_1.time_ and arg_171_1.time_ <= var_174_29 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_31 = arg_171_1:FormatText(StoryNameCfg[74].name)

				arg_171_1.leftNameTxt_.text = var_174_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_32 = arg_171_1:GetWordFromCfg(318301042)
				local var_174_33 = arg_171_1:FormatText(var_174_32.content)

				arg_171_1.text_.text = var_174_33

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_34 = 4
				local var_174_35 = utf8.len(var_174_33)
				local var_174_36 = var_174_34 <= 0 and var_174_30 or var_174_30 * (var_174_35 / var_174_34)

				if var_174_36 > 0 and var_174_30 < var_174_36 then
					arg_171_1.talkMaxDuration = var_174_36

					if var_174_36 + var_174_29 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_36 + var_174_29
					end
				end

				arg_171_1.text_.text = var_174_33
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301042", "story_v_out_318301.awb") ~= 0 then
					local var_174_37 = manager.audio:GetVoiceLength("story_v_out_318301", "318301042", "story_v_out_318301.awb") / 1000

					if var_174_37 + var_174_29 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_37 + var_174_29
					end

					if var_174_32.prefab_name ~= "" and arg_171_1.actors_[var_174_32.prefab_name] ~= nil then
						local var_174_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_32.prefab_name].transform, "story_v_out_318301", "318301042", "story_v_out_318301.awb")

						arg_171_1:RecordAudio("318301042", var_174_38)
						arg_171_1:RecordAudio("318301042", var_174_38)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_318301", "318301042", "story_v_out_318301.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_318301", "318301042", "story_v_out_318301.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_39 = math.max(var_174_30, arg_171_1.talkMaxDuration)

			if var_174_29 <= arg_171_1.time_ and arg_171_1.time_ < var_174_29 + var_174_39 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_29) / var_174_39

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_29 + var_174_39 and arg_171_1.time_ < var_174_29 + var_174_39 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play318301043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 318301043
		arg_175_1.duration_ = 6.1

		local var_175_0 = {
			zh = 4.966,
			ja = 6.1
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
				arg_175_0:Play318301044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1199ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1199ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, -1.08, -5.9)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1199ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1199ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1199ui_story == nil then
				arg_175_1.var_.characterEffect1199ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1199ui_story then
					arg_175_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1199ui_story then
				arg_175_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_178_13 = 0

			if var_178_13 < arg_175_1.time_ and arg_175_1.time_ <= var_178_13 + arg_178_0 then
				arg_175_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				arg_175_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_178_15 = arg_175_1.actors_["1150ui_story"].transform
			local var_178_16 = 0

			if var_178_16 < arg_175_1.time_ and arg_175_1.time_ <= var_178_16 + arg_178_0 then
				arg_175_1.var_.moveOldPos1150ui_story = var_178_15.localPosition
			end

			local var_178_17 = 0.001

			if var_178_16 <= arg_175_1.time_ and arg_175_1.time_ < var_178_16 + var_178_17 then
				local var_178_18 = (arg_175_1.time_ - var_178_16) / var_178_17
				local var_178_19 = Vector3.New(0, 100, 0)

				var_178_15.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1150ui_story, var_178_19, var_178_18)

				local var_178_20 = manager.ui.mainCamera.transform.position - var_178_15.position

				var_178_15.forward = Vector3.New(var_178_20.x, var_178_20.y, var_178_20.z)

				local var_178_21 = var_178_15.localEulerAngles

				var_178_21.z = 0
				var_178_21.x = 0
				var_178_15.localEulerAngles = var_178_21
			end

			if arg_175_1.time_ >= var_178_16 + var_178_17 and arg_175_1.time_ < var_178_16 + var_178_17 + arg_178_0 then
				var_178_15.localPosition = Vector3.New(0, 100, 0)

				local var_178_22 = manager.ui.mainCamera.transform.position - var_178_15.position

				var_178_15.forward = Vector3.New(var_178_22.x, var_178_22.y, var_178_22.z)

				local var_178_23 = var_178_15.localEulerAngles

				var_178_23.z = 0
				var_178_23.x = 0
				var_178_15.localEulerAngles = var_178_23
			end

			local var_178_24 = arg_175_1.actors_["1150ui_story"]
			local var_178_25 = 0

			if var_178_25 < arg_175_1.time_ and arg_175_1.time_ <= var_178_25 + arg_178_0 and arg_175_1.var_.characterEffect1150ui_story == nil then
				arg_175_1.var_.characterEffect1150ui_story = var_178_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_26 = 0.200000002980232

			if var_178_25 <= arg_175_1.time_ and arg_175_1.time_ < var_178_25 + var_178_26 then
				local var_178_27 = (arg_175_1.time_ - var_178_25) / var_178_26

				if arg_175_1.var_.characterEffect1150ui_story then
					local var_178_28 = Mathf.Lerp(0, 0.5, var_178_27)

					arg_175_1.var_.characterEffect1150ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1150ui_story.fillRatio = var_178_28
				end
			end

			if arg_175_1.time_ >= var_178_25 + var_178_26 and arg_175_1.time_ < var_178_25 + var_178_26 + arg_178_0 and arg_175_1.var_.characterEffect1150ui_story then
				local var_178_29 = 0.5

				arg_175_1.var_.characterEffect1150ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1150ui_story.fillRatio = var_178_29
			end

			local var_178_30 = 0
			local var_178_31 = 0.475

			if var_178_30 < arg_175_1.time_ and arg_175_1.time_ <= var_178_30 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_32 = arg_175_1:FormatText(StoryNameCfg[84].name)

				arg_175_1.leftNameTxt_.text = var_178_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_33 = arg_175_1:GetWordFromCfg(318301043)
				local var_178_34 = arg_175_1:FormatText(var_178_33.content)

				arg_175_1.text_.text = var_178_34

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_35 = 19
				local var_178_36 = utf8.len(var_178_34)
				local var_178_37 = var_178_35 <= 0 and var_178_31 or var_178_31 * (var_178_36 / var_178_35)

				if var_178_37 > 0 and var_178_31 < var_178_37 then
					arg_175_1.talkMaxDuration = var_178_37

					if var_178_37 + var_178_30 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_37 + var_178_30
					end
				end

				arg_175_1.text_.text = var_178_34
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301043", "story_v_out_318301.awb") ~= 0 then
					local var_178_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301043", "story_v_out_318301.awb") / 1000

					if var_178_38 + var_178_30 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_38 + var_178_30
					end

					if var_178_33.prefab_name ~= "" and arg_175_1.actors_[var_178_33.prefab_name] ~= nil then
						local var_178_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_33.prefab_name].transform, "story_v_out_318301", "318301043", "story_v_out_318301.awb")

						arg_175_1:RecordAudio("318301043", var_178_39)
						arg_175_1:RecordAudio("318301043", var_178_39)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_318301", "318301043", "story_v_out_318301.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_318301", "318301043", "story_v_out_318301.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_40 = math.max(var_178_31, arg_175_1.talkMaxDuration)

			if var_178_30 <= arg_175_1.time_ and arg_175_1.time_ < var_178_30 + var_178_40 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_30) / var_178_40

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_30 + var_178_40 and arg_175_1.time_ < var_178_30 + var_178_40 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play318301044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 318301044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play318301045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1199ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1199ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, 100, 0)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1199ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, 100, 0)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1199ui_story"]
			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1199ui_story == nil then
				arg_179_1.var_.characterEffect1199ui_story = var_182_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_11 = 0.200000002980232

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11

				if arg_179_1.var_.characterEffect1199ui_story then
					local var_182_13 = Mathf.Lerp(0, 0.5, var_182_12)

					arg_179_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1199ui_story.fillRatio = var_182_13
				end
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1199ui_story then
				local var_182_14 = 0.5

				arg_179_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1199ui_story.fillRatio = var_182_14
			end

			local var_182_15 = 0
			local var_182_16 = 0.6

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_17 = arg_179_1:GetWordFromCfg(318301044)
				local var_182_18 = arg_179_1:FormatText(var_182_17.content)

				arg_179_1.text_.text = var_182_18

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_19 = 24
				local var_182_20 = utf8.len(var_182_18)
				local var_182_21 = var_182_19 <= 0 and var_182_16 or var_182_16 * (var_182_20 / var_182_19)

				if var_182_21 > 0 and var_182_16 < var_182_21 then
					arg_179_1.talkMaxDuration = var_182_21

					if var_182_21 + var_182_15 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_21 + var_182_15
					end
				end

				arg_179_1.text_.text = var_182_18
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_22 = math.max(var_182_16, arg_179_1.talkMaxDuration)

			if var_182_15 <= arg_179_1.time_ and arg_179_1.time_ < var_182_15 + var_182_22 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_15) / var_182_22

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_15 + var_182_22 and arg_179_1.time_ < var_182_15 + var_182_22 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play318301045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 318301045
		arg_183_1.duration_ = 3.6

		local var_183_0 = {
			zh = 1.999999999999,
			ja = 3.6
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
				arg_183_0:Play318301046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1150ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1150ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(0, -1.01, -6.2)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1150ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(0, -1.01, -6.2)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["1150ui_story"]
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 and arg_183_1.var_.characterEffect1150ui_story == nil then
				arg_183_1.var_.characterEffect1150ui_story = var_186_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_11 = 0.200000002980232

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11

				if arg_183_1.var_.characterEffect1150ui_story then
					arg_183_1.var_.characterEffect1150ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 and arg_183_1.var_.characterEffect1150ui_story then
				arg_183_1.var_.characterEffect1150ui_story.fillFlat = false
			end

			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/story1150/story1150action/1150action5_1")
			end

			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 then
				arg_183_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_186_15 = 0
			local var_186_16 = 0.125

			if var_186_15 < arg_183_1.time_ and arg_183_1.time_ <= var_186_15 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_17 = arg_183_1:FormatText(StoryNameCfg[74].name)

				arg_183_1.leftNameTxt_.text = var_186_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_18 = arg_183_1:GetWordFromCfg(318301045)
				local var_186_19 = arg_183_1:FormatText(var_186_18.content)

				arg_183_1.text_.text = var_186_19

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_20 = 5
				local var_186_21 = utf8.len(var_186_19)
				local var_186_22 = var_186_20 <= 0 and var_186_16 or var_186_16 * (var_186_21 / var_186_20)

				if var_186_22 > 0 and var_186_16 < var_186_22 then
					arg_183_1.talkMaxDuration = var_186_22

					if var_186_22 + var_186_15 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_22 + var_186_15
					end
				end

				arg_183_1.text_.text = var_186_19
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301045", "story_v_out_318301.awb") ~= 0 then
					local var_186_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301045", "story_v_out_318301.awb") / 1000

					if var_186_23 + var_186_15 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_23 + var_186_15
					end

					if var_186_18.prefab_name ~= "" and arg_183_1.actors_[var_186_18.prefab_name] ~= nil then
						local var_186_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_18.prefab_name].transform, "story_v_out_318301", "318301045", "story_v_out_318301.awb")

						arg_183_1:RecordAudio("318301045", var_186_24)
						arg_183_1:RecordAudio("318301045", var_186_24)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_318301", "318301045", "story_v_out_318301.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_318301", "318301045", "story_v_out_318301.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_25 = math.max(var_186_16, arg_183_1.talkMaxDuration)

			if var_186_15 <= arg_183_1.time_ and arg_183_1.time_ < var_186_15 + var_186_25 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_15) / var_186_25

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_15 + var_186_25 and arg_183_1.time_ < var_186_15 + var_186_25 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play318301046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 318301046
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play318301047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1150ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1150ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0, 100, 0)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1150ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, 100, 0)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1150ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect1150ui_story == nil then
				arg_187_1.var_.characterEffect1150ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.200000002980232

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect1150ui_story then
					local var_190_13 = Mathf.Lerp(0, 0.5, var_190_12)

					arg_187_1.var_.characterEffect1150ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1150ui_story.fillRatio = var_190_13
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1150ui_story then
				local var_190_14 = 0.5

				arg_187_1.var_.characterEffect1150ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1150ui_story.fillRatio = var_190_14
			end

			local var_190_15 = 0
			local var_190_16 = 0.575

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_17 = arg_187_1:FormatText(StoryNameCfg[7].name)

				arg_187_1.leftNameTxt_.text = var_190_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_18 = arg_187_1:GetWordFromCfg(318301046)
				local var_190_19 = arg_187_1:FormatText(var_190_18.content)

				arg_187_1.text_.text = var_190_19

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_20 = 23
				local var_190_21 = utf8.len(var_190_19)
				local var_190_22 = var_190_20 <= 0 and var_190_16 or var_190_16 * (var_190_21 / var_190_20)

				if var_190_22 > 0 and var_190_16 < var_190_22 then
					arg_187_1.talkMaxDuration = var_190_22

					if var_190_22 + var_190_15 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_22 + var_190_15
					end
				end

				arg_187_1.text_.text = var_190_19
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_23 = math.max(var_190_16, arg_187_1.talkMaxDuration)

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_23 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_15) / var_190_23

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_15 + var_190_23 and arg_187_1.time_ < var_190_15 + var_190_23 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play318301047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 318301047
		arg_191_1.duration_ = 2.866

		local var_191_0 = {
			zh = 2.866,
			ja = 2.333
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play318301048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1055ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1055ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0, -0.965, -6.2)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1055ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["1055ui_story"]
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 and arg_191_1.var_.characterEffect1055ui_story == nil then
				arg_191_1.var_.characterEffect1055ui_story = var_194_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_11 = 0.200000002980232

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11

				if arg_191_1.var_.characterEffect1055ui_story then
					arg_191_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 and arg_191_1.var_.characterEffect1055ui_story then
				arg_191_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_194_13 = 0

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				arg_191_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_194_15 = 0
			local var_194_16 = 0.275

			if var_194_15 < arg_191_1.time_ and arg_191_1.time_ <= var_194_15 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_17 = arg_191_1:FormatText(StoryNameCfg[481].name)

				arg_191_1.leftNameTxt_.text = var_194_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_18 = arg_191_1:GetWordFromCfg(318301047)
				local var_194_19 = arg_191_1:FormatText(var_194_18.content)

				arg_191_1.text_.text = var_194_19

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_20 = 11
				local var_194_21 = utf8.len(var_194_19)
				local var_194_22 = var_194_20 <= 0 and var_194_16 or var_194_16 * (var_194_21 / var_194_20)

				if var_194_22 > 0 and var_194_16 < var_194_22 then
					arg_191_1.talkMaxDuration = var_194_22

					if var_194_22 + var_194_15 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_22 + var_194_15
					end
				end

				arg_191_1.text_.text = var_194_19
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301047", "story_v_out_318301.awb") ~= 0 then
					local var_194_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301047", "story_v_out_318301.awb") / 1000

					if var_194_23 + var_194_15 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_23 + var_194_15
					end

					if var_194_18.prefab_name ~= "" and arg_191_1.actors_[var_194_18.prefab_name] ~= nil then
						local var_194_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_18.prefab_name].transform, "story_v_out_318301", "318301047", "story_v_out_318301.awb")

						arg_191_1:RecordAudio("318301047", var_194_24)
						arg_191_1:RecordAudio("318301047", var_194_24)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_318301", "318301047", "story_v_out_318301.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_318301", "318301047", "story_v_out_318301.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_25 = math.max(var_194_16, arg_191_1.talkMaxDuration)

			if var_194_15 <= arg_191_1.time_ and arg_191_1.time_ < var_194_15 + var_194_25 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_15) / var_194_25

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_15 + var_194_25 and arg_191_1.time_ < var_194_15 + var_194_25 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play318301048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 318301048
		arg_195_1.duration_ = 3.9

		local var_195_0 = {
			zh = 3.833,
			ja = 3.9
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
				arg_195_0:Play318301049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1093ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1093ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0, -1.11, -5.88)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1093ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["1093ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect1093ui_story == nil then
				arg_195_1.var_.characterEffect1093ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.200000002980232

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect1093ui_story then
					arg_195_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect1093ui_story then
				arg_195_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_198_13 = 0

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action468")
			end

			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_198_15 = arg_195_1.actors_["1055ui_story"].transform
			local var_198_16 = 0

			if var_198_16 < arg_195_1.time_ and arg_195_1.time_ <= var_198_16 + arg_198_0 then
				arg_195_1.var_.moveOldPos1055ui_story = var_198_15.localPosition
			end

			local var_198_17 = 0.001

			if var_198_16 <= arg_195_1.time_ and arg_195_1.time_ < var_198_16 + var_198_17 then
				local var_198_18 = (arg_195_1.time_ - var_198_16) / var_198_17
				local var_198_19 = Vector3.New(0, 100, 0)

				var_198_15.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1055ui_story, var_198_19, var_198_18)

				local var_198_20 = manager.ui.mainCamera.transform.position - var_198_15.position

				var_198_15.forward = Vector3.New(var_198_20.x, var_198_20.y, var_198_20.z)

				local var_198_21 = var_198_15.localEulerAngles

				var_198_21.z = 0
				var_198_21.x = 0
				var_198_15.localEulerAngles = var_198_21
			end

			if arg_195_1.time_ >= var_198_16 + var_198_17 and arg_195_1.time_ < var_198_16 + var_198_17 + arg_198_0 then
				var_198_15.localPosition = Vector3.New(0, 100, 0)

				local var_198_22 = manager.ui.mainCamera.transform.position - var_198_15.position

				var_198_15.forward = Vector3.New(var_198_22.x, var_198_22.y, var_198_22.z)

				local var_198_23 = var_198_15.localEulerAngles

				var_198_23.z = 0
				var_198_23.x = 0
				var_198_15.localEulerAngles = var_198_23
			end

			local var_198_24 = arg_195_1.actors_["1055ui_story"]
			local var_198_25 = 0

			if var_198_25 < arg_195_1.time_ and arg_195_1.time_ <= var_198_25 + arg_198_0 and arg_195_1.var_.characterEffect1055ui_story == nil then
				arg_195_1.var_.characterEffect1055ui_story = var_198_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_26 = 0.200000002980232

			if var_198_25 <= arg_195_1.time_ and arg_195_1.time_ < var_198_25 + var_198_26 then
				local var_198_27 = (arg_195_1.time_ - var_198_25) / var_198_26

				if arg_195_1.var_.characterEffect1055ui_story then
					local var_198_28 = Mathf.Lerp(0, 0.5, var_198_27)

					arg_195_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1055ui_story.fillRatio = var_198_28
				end
			end

			if arg_195_1.time_ >= var_198_25 + var_198_26 and arg_195_1.time_ < var_198_25 + var_198_26 + arg_198_0 and arg_195_1.var_.characterEffect1055ui_story then
				local var_198_29 = 0.5

				arg_195_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1055ui_story.fillRatio = var_198_29
			end

			local var_198_30 = 0
			local var_198_31 = 0.425

			if var_198_30 < arg_195_1.time_ and arg_195_1.time_ <= var_198_30 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_32 = arg_195_1:FormatText(StoryNameCfg[73].name)

				arg_195_1.leftNameTxt_.text = var_198_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_33 = arg_195_1:GetWordFromCfg(318301048)
				local var_198_34 = arg_195_1:FormatText(var_198_33.content)

				arg_195_1.text_.text = var_198_34

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_35 = 17
				local var_198_36 = utf8.len(var_198_34)
				local var_198_37 = var_198_35 <= 0 and var_198_31 or var_198_31 * (var_198_36 / var_198_35)

				if var_198_37 > 0 and var_198_31 < var_198_37 then
					arg_195_1.talkMaxDuration = var_198_37

					if var_198_37 + var_198_30 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_37 + var_198_30
					end
				end

				arg_195_1.text_.text = var_198_34
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301048", "story_v_out_318301.awb") ~= 0 then
					local var_198_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301048", "story_v_out_318301.awb") / 1000

					if var_198_38 + var_198_30 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_38 + var_198_30
					end

					if var_198_33.prefab_name ~= "" and arg_195_1.actors_[var_198_33.prefab_name] ~= nil then
						local var_198_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_33.prefab_name].transform, "story_v_out_318301", "318301048", "story_v_out_318301.awb")

						arg_195_1:RecordAudio("318301048", var_198_39)
						arg_195_1:RecordAudio("318301048", var_198_39)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_318301", "318301048", "story_v_out_318301.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_318301", "318301048", "story_v_out_318301.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_40 = math.max(var_198_31, arg_195_1.talkMaxDuration)

			if var_198_30 <= arg_195_1.time_ and arg_195_1.time_ < var_198_30 + var_198_40 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_30) / var_198_40

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_30 + var_198_40 and arg_195_1.time_ < var_198_30 + var_198_40 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play318301049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 318301049
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play318301050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1093ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1093ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(0, 100, 0)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1093ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, 100, 0)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = arg_199_1.actors_["1093ui_story"]
			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 and arg_199_1.var_.characterEffect1093ui_story == nil then
				arg_199_1.var_.characterEffect1093ui_story = var_202_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_11 = 0.200000002980232

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_10) / var_202_11

				if arg_199_1.var_.characterEffect1093ui_story then
					local var_202_13 = Mathf.Lerp(0, 0.5, var_202_12)

					arg_199_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1093ui_story.fillRatio = var_202_13
				end
			end

			if arg_199_1.time_ >= var_202_10 + var_202_11 and arg_199_1.time_ < var_202_10 + var_202_11 + arg_202_0 and arg_199_1.var_.characterEffect1093ui_story then
				local var_202_14 = 0.5

				arg_199_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1093ui_story.fillRatio = var_202_14
			end

			local var_202_15 = 0
			local var_202_16 = 0.65

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_17 = arg_199_1:GetWordFromCfg(318301049)
				local var_202_18 = arg_199_1:FormatText(var_202_17.content)

				arg_199_1.text_.text = var_202_18

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_19 = 26
				local var_202_20 = utf8.len(var_202_18)
				local var_202_21 = var_202_19 <= 0 and var_202_16 or var_202_16 * (var_202_20 / var_202_19)

				if var_202_21 > 0 and var_202_16 < var_202_21 then
					arg_199_1.talkMaxDuration = var_202_21

					if var_202_21 + var_202_15 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_21 + var_202_15
					end
				end

				arg_199_1.text_.text = var_202_18
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_22 = math.max(var_202_16, arg_199_1.talkMaxDuration)

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_22 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_15) / var_202_22

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_15 + var_202_22 and arg_199_1.time_ < var_202_15 + var_202_22 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play318301050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 318301050
		arg_203_1.duration_ = 2.9

		local var_203_0 = {
			zh = 2.9,
			ja = 2.066
		}
		local var_203_1 = manager.audio:GetLocalizationFlag()

		if var_203_0[var_203_1] ~= nil then
			arg_203_1.duration_ = var_203_0[var_203_1]
		end

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play318301051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1093ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1093ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, -1.11, -5.88)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1093ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = arg_203_1.actors_["1093ui_story"]
			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 and arg_203_1.var_.characterEffect1093ui_story == nil then
				arg_203_1.var_.characterEffect1093ui_story = var_206_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_11 = 0.200000002980232

			if var_206_10 <= arg_203_1.time_ and arg_203_1.time_ < var_206_10 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_10) / var_206_11

				if arg_203_1.var_.characterEffect1093ui_story then
					arg_203_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_10 + var_206_11 and arg_203_1.time_ < var_206_10 + var_206_11 + arg_206_0 and arg_203_1.var_.characterEffect1093ui_story then
				arg_203_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action8_2")
			end

			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_206_15 = 0
			local var_206_16 = 0.25

			if var_206_15 < arg_203_1.time_ and arg_203_1.time_ <= var_206_15 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_17 = arg_203_1:FormatText(StoryNameCfg[73].name)

				arg_203_1.leftNameTxt_.text = var_206_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_18 = arg_203_1:GetWordFromCfg(318301050)
				local var_206_19 = arg_203_1:FormatText(var_206_18.content)

				arg_203_1.text_.text = var_206_19

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_20 = 10
				local var_206_21 = utf8.len(var_206_19)
				local var_206_22 = var_206_20 <= 0 and var_206_16 or var_206_16 * (var_206_21 / var_206_20)

				if var_206_22 > 0 and var_206_16 < var_206_22 then
					arg_203_1.talkMaxDuration = var_206_22

					if var_206_22 + var_206_15 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_22 + var_206_15
					end
				end

				arg_203_1.text_.text = var_206_19
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301050", "story_v_out_318301.awb") ~= 0 then
					local var_206_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301050", "story_v_out_318301.awb") / 1000

					if var_206_23 + var_206_15 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_23 + var_206_15
					end

					if var_206_18.prefab_name ~= "" and arg_203_1.actors_[var_206_18.prefab_name] ~= nil then
						local var_206_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_18.prefab_name].transform, "story_v_out_318301", "318301050", "story_v_out_318301.awb")

						arg_203_1:RecordAudio("318301050", var_206_24)
						arg_203_1:RecordAudio("318301050", var_206_24)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_318301", "318301050", "story_v_out_318301.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_318301", "318301050", "story_v_out_318301.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_25 = math.max(var_206_16, arg_203_1.talkMaxDuration)

			if var_206_15 <= arg_203_1.time_ and arg_203_1.time_ < var_206_15 + var_206_25 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_15) / var_206_25

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_15 + var_206_25 and arg_203_1.time_ < var_206_15 + var_206_25 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play318301051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 318301051
		arg_207_1.duration_ = 5.333

		local var_207_0 = {
			zh = 3.633,
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
				arg_207_0:Play318301052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1150ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1150ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(0, -1.01, -6.2)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1150ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -1.01, -6.2)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["1150ui_story"]
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect1150ui_story == nil then
				arg_207_1.var_.characterEffect1150ui_story = var_210_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_11 = 0.200000002980232

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11

				if arg_207_1.var_.characterEffect1150ui_story then
					arg_207_1.var_.characterEffect1150ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 and arg_207_1.var_.characterEffect1150ui_story then
				arg_207_1.var_.characterEffect1150ui_story.fillFlat = false
			end

			local var_210_13 = 0

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/story1150/story1150action/1150action1_1")
			end

			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				arg_207_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_210_15 = arg_207_1.actors_["1093ui_story"].transform
			local var_210_16 = 0

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 then
				arg_207_1.var_.moveOldPos1093ui_story = var_210_15.localPosition
			end

			local var_210_17 = 0.001

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_17 then
				local var_210_18 = (arg_207_1.time_ - var_210_16) / var_210_17
				local var_210_19 = Vector3.New(0, 100, 0)

				var_210_15.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1093ui_story, var_210_19, var_210_18)

				local var_210_20 = manager.ui.mainCamera.transform.position - var_210_15.position

				var_210_15.forward = Vector3.New(var_210_20.x, var_210_20.y, var_210_20.z)

				local var_210_21 = var_210_15.localEulerAngles

				var_210_21.z = 0
				var_210_21.x = 0
				var_210_15.localEulerAngles = var_210_21
			end

			if arg_207_1.time_ >= var_210_16 + var_210_17 and arg_207_1.time_ < var_210_16 + var_210_17 + arg_210_0 then
				var_210_15.localPosition = Vector3.New(0, 100, 0)

				local var_210_22 = manager.ui.mainCamera.transform.position - var_210_15.position

				var_210_15.forward = Vector3.New(var_210_22.x, var_210_22.y, var_210_22.z)

				local var_210_23 = var_210_15.localEulerAngles

				var_210_23.z = 0
				var_210_23.x = 0
				var_210_15.localEulerAngles = var_210_23
			end

			local var_210_24 = arg_207_1.actors_["1093ui_story"]
			local var_210_25 = 0

			if var_210_25 < arg_207_1.time_ and arg_207_1.time_ <= var_210_25 + arg_210_0 and arg_207_1.var_.characterEffect1093ui_story == nil then
				arg_207_1.var_.characterEffect1093ui_story = var_210_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_26 = 0.200000002980232

			if var_210_25 <= arg_207_1.time_ and arg_207_1.time_ < var_210_25 + var_210_26 then
				local var_210_27 = (arg_207_1.time_ - var_210_25) / var_210_26

				if arg_207_1.var_.characterEffect1093ui_story then
					local var_210_28 = Mathf.Lerp(0, 0.5, var_210_27)

					arg_207_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1093ui_story.fillRatio = var_210_28
				end
			end

			if arg_207_1.time_ >= var_210_25 + var_210_26 and arg_207_1.time_ < var_210_25 + var_210_26 + arg_210_0 and arg_207_1.var_.characterEffect1093ui_story then
				local var_210_29 = 0.5

				arg_207_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1093ui_story.fillRatio = var_210_29
			end

			local var_210_30 = 0
			local var_210_31 = 0.45

			if var_210_30 < arg_207_1.time_ and arg_207_1.time_ <= var_210_30 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_32 = arg_207_1:FormatText(StoryNameCfg[74].name)

				arg_207_1.leftNameTxt_.text = var_210_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_33 = arg_207_1:GetWordFromCfg(318301051)
				local var_210_34 = arg_207_1:FormatText(var_210_33.content)

				arg_207_1.text_.text = var_210_34

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_35 = 18
				local var_210_36 = utf8.len(var_210_34)
				local var_210_37 = var_210_35 <= 0 and var_210_31 or var_210_31 * (var_210_36 / var_210_35)

				if var_210_37 > 0 and var_210_31 < var_210_37 then
					arg_207_1.talkMaxDuration = var_210_37

					if var_210_37 + var_210_30 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_37 + var_210_30
					end
				end

				arg_207_1.text_.text = var_210_34
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301051", "story_v_out_318301.awb") ~= 0 then
					local var_210_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301051", "story_v_out_318301.awb") / 1000

					if var_210_38 + var_210_30 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_38 + var_210_30
					end

					if var_210_33.prefab_name ~= "" and arg_207_1.actors_[var_210_33.prefab_name] ~= nil then
						local var_210_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_33.prefab_name].transform, "story_v_out_318301", "318301051", "story_v_out_318301.awb")

						arg_207_1:RecordAudio("318301051", var_210_39)
						arg_207_1:RecordAudio("318301051", var_210_39)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_318301", "318301051", "story_v_out_318301.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_318301", "318301051", "story_v_out_318301.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_40 = math.max(var_210_31, arg_207_1.talkMaxDuration)

			if var_210_30 <= arg_207_1.time_ and arg_207_1.time_ < var_210_30 + var_210_40 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_30) / var_210_40

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_30 + var_210_40 and arg_207_1.time_ < var_210_30 + var_210_40 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play318301052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 318301052
		arg_211_1.duration_ = 3.966

		local var_211_0 = {
			zh = 3.6,
			ja = 3.966
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
				arg_211_0:Play318301053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1055ui_story"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1055ui_story = var_214_0.localPosition
			end

			local var_214_2 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2
				local var_214_4 = Vector3.New(0, -0.965, -6.2)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1055ui_story, var_214_4, var_214_3)

				local var_214_5 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_5.x, var_214_5.y, var_214_5.z)

				local var_214_6 = var_214_0.localEulerAngles

				var_214_6.z = 0
				var_214_6.x = 0
				var_214_0.localEulerAngles = var_214_6
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_214_7 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_7.x, var_214_7.y, var_214_7.z)

				local var_214_8 = var_214_0.localEulerAngles

				var_214_8.z = 0
				var_214_8.x = 0
				var_214_0.localEulerAngles = var_214_8
			end

			local var_214_9 = arg_211_1.actors_["1055ui_story"]
			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 and arg_211_1.var_.characterEffect1055ui_story == nil then
				arg_211_1.var_.characterEffect1055ui_story = var_214_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_11 = 0.200000002980232

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_11 then
				local var_214_12 = (arg_211_1.time_ - var_214_10) / var_214_11

				if arg_211_1.var_.characterEffect1055ui_story then
					arg_211_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_10 + var_214_11 and arg_211_1.time_ < var_214_10 + var_214_11 + arg_214_0 and arg_211_1.var_.characterEffect1055ui_story then
				arg_211_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_214_13 = 0

			if var_214_13 < arg_211_1.time_ and arg_211_1.time_ <= var_214_13 + arg_214_0 then
				arg_211_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				arg_211_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_214_15 = arg_211_1.actors_["1150ui_story"].transform
			local var_214_16 = 0

			if var_214_16 < arg_211_1.time_ and arg_211_1.time_ <= var_214_16 + arg_214_0 then
				arg_211_1.var_.moveOldPos1150ui_story = var_214_15.localPosition
			end

			local var_214_17 = 0.001

			if var_214_16 <= arg_211_1.time_ and arg_211_1.time_ < var_214_16 + var_214_17 then
				local var_214_18 = (arg_211_1.time_ - var_214_16) / var_214_17
				local var_214_19 = Vector3.New(0, 100, 0)

				var_214_15.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1150ui_story, var_214_19, var_214_18)

				local var_214_20 = manager.ui.mainCamera.transform.position - var_214_15.position

				var_214_15.forward = Vector3.New(var_214_20.x, var_214_20.y, var_214_20.z)

				local var_214_21 = var_214_15.localEulerAngles

				var_214_21.z = 0
				var_214_21.x = 0
				var_214_15.localEulerAngles = var_214_21
			end

			if arg_211_1.time_ >= var_214_16 + var_214_17 and arg_211_1.time_ < var_214_16 + var_214_17 + arg_214_0 then
				var_214_15.localPosition = Vector3.New(0, 100, 0)

				local var_214_22 = manager.ui.mainCamera.transform.position - var_214_15.position

				var_214_15.forward = Vector3.New(var_214_22.x, var_214_22.y, var_214_22.z)

				local var_214_23 = var_214_15.localEulerAngles

				var_214_23.z = 0
				var_214_23.x = 0
				var_214_15.localEulerAngles = var_214_23
			end

			local var_214_24 = arg_211_1.actors_["1150ui_story"]
			local var_214_25 = 0

			if var_214_25 < arg_211_1.time_ and arg_211_1.time_ <= var_214_25 + arg_214_0 and arg_211_1.var_.characterEffect1150ui_story == nil then
				arg_211_1.var_.characterEffect1150ui_story = var_214_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_26 = 0.200000002980232

			if var_214_25 <= arg_211_1.time_ and arg_211_1.time_ < var_214_25 + var_214_26 then
				local var_214_27 = (arg_211_1.time_ - var_214_25) / var_214_26

				if arg_211_1.var_.characterEffect1150ui_story then
					local var_214_28 = Mathf.Lerp(0, 0.5, var_214_27)

					arg_211_1.var_.characterEffect1150ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1150ui_story.fillRatio = var_214_28
				end
			end

			if arg_211_1.time_ >= var_214_25 + var_214_26 and arg_211_1.time_ < var_214_25 + var_214_26 + arg_214_0 and arg_211_1.var_.characterEffect1150ui_story then
				local var_214_29 = 0.5

				arg_211_1.var_.characterEffect1150ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1150ui_story.fillRatio = var_214_29
			end

			local var_214_30 = 0
			local var_214_31 = 0.3

			if var_214_30 < arg_211_1.time_ and arg_211_1.time_ <= var_214_30 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_32 = arg_211_1:FormatText(StoryNameCfg[481].name)

				arg_211_1.leftNameTxt_.text = var_214_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_33 = arg_211_1:GetWordFromCfg(318301052)
				local var_214_34 = arg_211_1:FormatText(var_214_33.content)

				arg_211_1.text_.text = var_214_34

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_35 = 12
				local var_214_36 = utf8.len(var_214_34)
				local var_214_37 = var_214_35 <= 0 and var_214_31 or var_214_31 * (var_214_36 / var_214_35)

				if var_214_37 > 0 and var_214_31 < var_214_37 then
					arg_211_1.talkMaxDuration = var_214_37

					if var_214_37 + var_214_30 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_37 + var_214_30
					end
				end

				arg_211_1.text_.text = var_214_34
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301052", "story_v_out_318301.awb") ~= 0 then
					local var_214_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301052", "story_v_out_318301.awb") / 1000

					if var_214_38 + var_214_30 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_38 + var_214_30
					end

					if var_214_33.prefab_name ~= "" and arg_211_1.actors_[var_214_33.prefab_name] ~= nil then
						local var_214_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_33.prefab_name].transform, "story_v_out_318301", "318301052", "story_v_out_318301.awb")

						arg_211_1:RecordAudio("318301052", var_214_39)
						arg_211_1:RecordAudio("318301052", var_214_39)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_318301", "318301052", "story_v_out_318301.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_318301", "318301052", "story_v_out_318301.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_40 = math.max(var_214_31, arg_211_1.talkMaxDuration)

			if var_214_30 <= arg_211_1.time_ and arg_211_1.time_ < var_214_30 + var_214_40 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_30) / var_214_40

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_30 + var_214_40 and arg_211_1.time_ < var_214_30 + var_214_40 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play318301053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 318301053
		arg_215_1.duration_ = 13.5

		local var_215_0 = {
			zh = 6.333,
			ja = 13.5
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
				arg_215_0:Play318301054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1093ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1093ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(0, -1.11, -5.88)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1093ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = arg_215_1.actors_["1093ui_story"]
			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 and arg_215_1.var_.characterEffect1093ui_story == nil then
				arg_215_1.var_.characterEffect1093ui_story = var_218_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_11 = 0.200000002980232

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_11 then
				local var_218_12 = (arg_215_1.time_ - var_218_10) / var_218_11

				if arg_215_1.var_.characterEffect1093ui_story then
					arg_215_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_10 + var_218_11 and arg_215_1.time_ < var_218_10 + var_218_11 + arg_218_0 and arg_215_1.var_.characterEffect1093ui_story then
				arg_215_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_218_13 = 0

			if var_218_13 < arg_215_1.time_ and arg_215_1.time_ <= var_218_13 + arg_218_0 then
				arg_215_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_218_14 = 0

			if var_218_14 < arg_215_1.time_ and arg_215_1.time_ <= var_218_14 + arg_218_0 then
				arg_215_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_218_15 = arg_215_1.actors_["1055ui_story"].transform
			local var_218_16 = 0

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 then
				arg_215_1.var_.moveOldPos1055ui_story = var_218_15.localPosition
			end

			local var_218_17 = 0.001

			if var_218_16 <= arg_215_1.time_ and arg_215_1.time_ < var_218_16 + var_218_17 then
				local var_218_18 = (arg_215_1.time_ - var_218_16) / var_218_17
				local var_218_19 = Vector3.New(0, 100, 0)

				var_218_15.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1055ui_story, var_218_19, var_218_18)

				local var_218_20 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_20.x, var_218_20.y, var_218_20.z)

				local var_218_21 = var_218_15.localEulerAngles

				var_218_21.z = 0
				var_218_21.x = 0
				var_218_15.localEulerAngles = var_218_21
			end

			if arg_215_1.time_ >= var_218_16 + var_218_17 and arg_215_1.time_ < var_218_16 + var_218_17 + arg_218_0 then
				var_218_15.localPosition = Vector3.New(0, 100, 0)

				local var_218_22 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_22.x, var_218_22.y, var_218_22.z)

				local var_218_23 = var_218_15.localEulerAngles

				var_218_23.z = 0
				var_218_23.x = 0
				var_218_15.localEulerAngles = var_218_23
			end

			local var_218_24 = arg_215_1.actors_["1055ui_story"]
			local var_218_25 = 0

			if var_218_25 < arg_215_1.time_ and arg_215_1.time_ <= var_218_25 + arg_218_0 and arg_215_1.var_.characterEffect1055ui_story == nil then
				arg_215_1.var_.characterEffect1055ui_story = var_218_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_26 = 0.200000002980232

			if var_218_25 <= arg_215_1.time_ and arg_215_1.time_ < var_218_25 + var_218_26 then
				local var_218_27 = (arg_215_1.time_ - var_218_25) / var_218_26

				if arg_215_1.var_.characterEffect1055ui_story then
					local var_218_28 = Mathf.Lerp(0, 0.5, var_218_27)

					arg_215_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1055ui_story.fillRatio = var_218_28
				end
			end

			if arg_215_1.time_ >= var_218_25 + var_218_26 and arg_215_1.time_ < var_218_25 + var_218_26 + arg_218_0 and arg_215_1.var_.characterEffect1055ui_story then
				local var_218_29 = 0.5

				arg_215_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1055ui_story.fillRatio = var_218_29
			end

			local var_218_30 = 0
			local var_218_31 = 0.625

			if var_218_30 < arg_215_1.time_ and arg_215_1.time_ <= var_218_30 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_32 = arg_215_1:FormatText(StoryNameCfg[73].name)

				arg_215_1.leftNameTxt_.text = var_218_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_33 = arg_215_1:GetWordFromCfg(318301053)
				local var_218_34 = arg_215_1:FormatText(var_218_33.content)

				arg_215_1.text_.text = var_218_34

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_35 = 25
				local var_218_36 = utf8.len(var_218_34)
				local var_218_37 = var_218_35 <= 0 and var_218_31 or var_218_31 * (var_218_36 / var_218_35)

				if var_218_37 > 0 and var_218_31 < var_218_37 then
					arg_215_1.talkMaxDuration = var_218_37

					if var_218_37 + var_218_30 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_37 + var_218_30
					end
				end

				arg_215_1.text_.text = var_218_34
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301053", "story_v_out_318301.awb") ~= 0 then
					local var_218_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301053", "story_v_out_318301.awb") / 1000

					if var_218_38 + var_218_30 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_38 + var_218_30
					end

					if var_218_33.prefab_name ~= "" and arg_215_1.actors_[var_218_33.prefab_name] ~= nil then
						local var_218_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_33.prefab_name].transform, "story_v_out_318301", "318301053", "story_v_out_318301.awb")

						arg_215_1:RecordAudio("318301053", var_218_39)
						arg_215_1:RecordAudio("318301053", var_218_39)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_318301", "318301053", "story_v_out_318301.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_318301", "318301053", "story_v_out_318301.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_40 = math.max(var_218_31, arg_215_1.talkMaxDuration)

			if var_218_30 <= arg_215_1.time_ and arg_215_1.time_ < var_218_30 + var_218_40 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_30) / var_218_40

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_30 + var_218_40 and arg_215_1.time_ < var_218_30 + var_218_40 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play318301054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 318301054
		arg_219_1.duration_ = 8.633

		local var_219_0 = {
			zh = 6.033,
			ja = 8.633
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
				arg_219_0:Play318301055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1055ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1055ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(0, -0.965, -6.2)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1055ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["1055ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect1055ui_story == nil then
				arg_219_1.var_.characterEffect1055ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect1055ui_story then
					arg_219_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and arg_219_1.var_.characterEffect1055ui_story then
				arg_219_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_222_13 = 0

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_222_15 = arg_219_1.actors_["1093ui_story"].transform
			local var_222_16 = 0

			if var_222_16 < arg_219_1.time_ and arg_219_1.time_ <= var_222_16 + arg_222_0 then
				arg_219_1.var_.moveOldPos1093ui_story = var_222_15.localPosition
			end

			local var_222_17 = 0.001

			if var_222_16 <= arg_219_1.time_ and arg_219_1.time_ < var_222_16 + var_222_17 then
				local var_222_18 = (arg_219_1.time_ - var_222_16) / var_222_17
				local var_222_19 = Vector3.New(0, 100, 0)

				var_222_15.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1093ui_story, var_222_19, var_222_18)

				local var_222_20 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_20.x, var_222_20.y, var_222_20.z)

				local var_222_21 = var_222_15.localEulerAngles

				var_222_21.z = 0
				var_222_21.x = 0
				var_222_15.localEulerAngles = var_222_21
			end

			if arg_219_1.time_ >= var_222_16 + var_222_17 and arg_219_1.time_ < var_222_16 + var_222_17 + arg_222_0 then
				var_222_15.localPosition = Vector3.New(0, 100, 0)

				local var_222_22 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_22.x, var_222_22.y, var_222_22.z)

				local var_222_23 = var_222_15.localEulerAngles

				var_222_23.z = 0
				var_222_23.x = 0
				var_222_15.localEulerAngles = var_222_23
			end

			local var_222_24 = arg_219_1.actors_["1093ui_story"]
			local var_222_25 = 0

			if var_222_25 < arg_219_1.time_ and arg_219_1.time_ <= var_222_25 + arg_222_0 and arg_219_1.var_.characterEffect1093ui_story == nil then
				arg_219_1.var_.characterEffect1093ui_story = var_222_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_26 = 0.200000002980232

			if var_222_25 <= arg_219_1.time_ and arg_219_1.time_ < var_222_25 + var_222_26 then
				local var_222_27 = (arg_219_1.time_ - var_222_25) / var_222_26

				if arg_219_1.var_.characterEffect1093ui_story then
					local var_222_28 = Mathf.Lerp(0, 0.5, var_222_27)

					arg_219_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1093ui_story.fillRatio = var_222_28
				end
			end

			if arg_219_1.time_ >= var_222_25 + var_222_26 and arg_219_1.time_ < var_222_25 + var_222_26 + arg_222_0 and arg_219_1.var_.characterEffect1093ui_story then
				local var_222_29 = 0.5

				arg_219_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1093ui_story.fillRatio = var_222_29
			end

			local var_222_30 = 0
			local var_222_31 = 0.55

			if var_222_30 < arg_219_1.time_ and arg_219_1.time_ <= var_222_30 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_32 = arg_219_1:FormatText(StoryNameCfg[481].name)

				arg_219_1.leftNameTxt_.text = var_222_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_33 = arg_219_1:GetWordFromCfg(318301054)
				local var_222_34 = arg_219_1:FormatText(var_222_33.content)

				arg_219_1.text_.text = var_222_34

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_35 = 22
				local var_222_36 = utf8.len(var_222_34)
				local var_222_37 = var_222_35 <= 0 and var_222_31 or var_222_31 * (var_222_36 / var_222_35)

				if var_222_37 > 0 and var_222_31 < var_222_37 then
					arg_219_1.talkMaxDuration = var_222_37

					if var_222_37 + var_222_30 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_37 + var_222_30
					end
				end

				arg_219_1.text_.text = var_222_34
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301054", "story_v_out_318301.awb") ~= 0 then
					local var_222_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301054", "story_v_out_318301.awb") / 1000

					if var_222_38 + var_222_30 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_38 + var_222_30
					end

					if var_222_33.prefab_name ~= "" and arg_219_1.actors_[var_222_33.prefab_name] ~= nil then
						local var_222_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_33.prefab_name].transform, "story_v_out_318301", "318301054", "story_v_out_318301.awb")

						arg_219_1:RecordAudio("318301054", var_222_39)
						arg_219_1:RecordAudio("318301054", var_222_39)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_318301", "318301054", "story_v_out_318301.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_318301", "318301054", "story_v_out_318301.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_40 = math.max(var_222_31, arg_219_1.talkMaxDuration)

			if var_222_30 <= arg_219_1.time_ and arg_219_1.time_ < var_222_30 + var_222_40 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_30) / var_222_40

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_30 + var_222_40 and arg_219_1.time_ < var_222_30 + var_222_40 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play318301055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 318301055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play318301056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1055ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1055ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0, 100, 0)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1055ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, 100, 0)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = arg_223_1.actors_["1055ui_story"]
			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 and arg_223_1.var_.characterEffect1055ui_story == nil then
				arg_223_1.var_.characterEffect1055ui_story = var_226_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_11 = 0.200000002980232

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_10) / var_226_11

				if arg_223_1.var_.characterEffect1055ui_story then
					local var_226_13 = Mathf.Lerp(0, 0.5, var_226_12)

					arg_223_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1055ui_story.fillRatio = var_226_13
				end
			end

			if arg_223_1.time_ >= var_226_10 + var_226_11 and arg_223_1.time_ < var_226_10 + var_226_11 + arg_226_0 and arg_223_1.var_.characterEffect1055ui_story then
				local var_226_14 = 0.5

				arg_223_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1055ui_story.fillRatio = var_226_14
			end

			local var_226_15 = 0
			local var_226_16 = 0.65

			if var_226_15 < arg_223_1.time_ and arg_223_1.time_ <= var_226_15 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_17 = arg_223_1:GetWordFromCfg(318301055)
				local var_226_18 = arg_223_1:FormatText(var_226_17.content)

				arg_223_1.text_.text = var_226_18

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_19 = 26
				local var_226_20 = utf8.len(var_226_18)
				local var_226_21 = var_226_19 <= 0 and var_226_16 or var_226_16 * (var_226_20 / var_226_19)

				if var_226_21 > 0 and var_226_16 < var_226_21 then
					arg_223_1.talkMaxDuration = var_226_21

					if var_226_21 + var_226_15 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_21 + var_226_15
					end
				end

				arg_223_1.text_.text = var_226_18
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_22 = math.max(var_226_16, arg_223_1.talkMaxDuration)

			if var_226_15 <= arg_223_1.time_ and arg_223_1.time_ < var_226_15 + var_226_22 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_15) / var_226_22

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_15 + var_226_22 and arg_223_1.time_ < var_226_15 + var_226_22 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play318301056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 318301056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play318301057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.65

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[7].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(318301056)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 26
				local var_230_6 = utf8.len(var_230_4)
				local var_230_7 = var_230_5 <= 0 and var_230_1 or var_230_1 * (var_230_6 / var_230_5)

				if var_230_7 > 0 and var_230_1 < var_230_7 then
					arg_227_1.talkMaxDuration = var_230_7

					if var_230_7 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_7 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_4
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_8 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_8 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_8

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_8 and arg_227_1.time_ < var_230_0 + var_230_8 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play318301057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 318301057
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play318301058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.425

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[7].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(318301057)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 17
				local var_234_6 = utf8.len(var_234_4)
				local var_234_7 = var_234_5 <= 0 and var_234_1 or var_234_1 * (var_234_6 / var_234_5)

				if var_234_7 > 0 and var_234_1 < var_234_7 then
					arg_231_1.talkMaxDuration = var_234_7

					if var_234_7 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_7 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_4
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_8 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_8 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_8

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_8 and arg_231_1.time_ < var_234_0 + var_234_8 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play318301058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 318301058
		arg_235_1.duration_ = 2.433

		local var_235_0 = {
			zh = 1.466,
			ja = 2.433
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
				arg_235_0:Play318301059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1093ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1093ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(0, -1.11, -5.88)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1093ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["1093ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and arg_235_1.var_.characterEffect1093ui_story == nil then
				arg_235_1.var_.characterEffect1093ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect1093ui_story then
					arg_235_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect1093ui_story then
				arg_235_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_238_13 = 0

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_238_15 = 0
			local var_238_16 = 0.125

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_17 = arg_235_1:FormatText(StoryNameCfg[73].name)

				arg_235_1.leftNameTxt_.text = var_238_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_18 = arg_235_1:GetWordFromCfg(318301058)
				local var_238_19 = arg_235_1:FormatText(var_238_18.content)

				arg_235_1.text_.text = var_238_19

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_20 = 5
				local var_238_21 = utf8.len(var_238_19)
				local var_238_22 = var_238_20 <= 0 and var_238_16 or var_238_16 * (var_238_21 / var_238_20)

				if var_238_22 > 0 and var_238_16 < var_238_22 then
					arg_235_1.talkMaxDuration = var_238_22

					if var_238_22 + var_238_15 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_22 + var_238_15
					end
				end

				arg_235_1.text_.text = var_238_19
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301058", "story_v_out_318301.awb") ~= 0 then
					local var_238_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301058", "story_v_out_318301.awb") / 1000

					if var_238_23 + var_238_15 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_23 + var_238_15
					end

					if var_238_18.prefab_name ~= "" and arg_235_1.actors_[var_238_18.prefab_name] ~= nil then
						local var_238_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_18.prefab_name].transform, "story_v_out_318301", "318301058", "story_v_out_318301.awb")

						arg_235_1:RecordAudio("318301058", var_238_24)
						arg_235_1:RecordAudio("318301058", var_238_24)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_318301", "318301058", "story_v_out_318301.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_318301", "318301058", "story_v_out_318301.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_25 = math.max(var_238_16, arg_235_1.talkMaxDuration)

			if var_238_15 <= arg_235_1.time_ and arg_235_1.time_ < var_238_15 + var_238_25 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_15) / var_238_25

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_15 + var_238_25 and arg_235_1.time_ < var_238_15 + var_238_25 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play318301059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 318301059
		arg_239_1.duration_ = 4.8

		local var_239_0 = {
			zh = 2.666,
			ja = 4.8
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
				arg_239_0:Play318301060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1093ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1093ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(0, -1.11, -5.88)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1093ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["1093ui_story"]
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 and arg_239_1.var_.characterEffect1093ui_story == nil then
				arg_239_1.var_.characterEffect1093ui_story = var_242_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_11 = 0.200000002980232

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11

				if arg_239_1.var_.characterEffect1093ui_story then
					arg_239_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect1093ui_story then
				arg_239_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_242_13 = 0

			if var_242_13 < arg_239_1.time_ and arg_239_1.time_ <= var_242_13 + arg_242_0 then
				arg_239_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_15 = 0
			local var_242_16 = 0.35

			if var_242_15 < arg_239_1.time_ and arg_239_1.time_ <= var_242_15 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_17 = arg_239_1:FormatText(StoryNameCfg[73].name)

				arg_239_1.leftNameTxt_.text = var_242_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_18 = arg_239_1:GetWordFromCfg(318301059)
				local var_242_19 = arg_239_1:FormatText(var_242_18.content)

				arg_239_1.text_.text = var_242_19

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_20 = 14
				local var_242_21 = utf8.len(var_242_19)
				local var_242_22 = var_242_20 <= 0 and var_242_16 or var_242_16 * (var_242_21 / var_242_20)

				if var_242_22 > 0 and var_242_16 < var_242_22 then
					arg_239_1.talkMaxDuration = var_242_22

					if var_242_22 + var_242_15 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_22 + var_242_15
					end
				end

				arg_239_1.text_.text = var_242_19
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301059", "story_v_out_318301.awb") ~= 0 then
					local var_242_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301059", "story_v_out_318301.awb") / 1000

					if var_242_23 + var_242_15 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_23 + var_242_15
					end

					if var_242_18.prefab_name ~= "" and arg_239_1.actors_[var_242_18.prefab_name] ~= nil then
						local var_242_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_18.prefab_name].transform, "story_v_out_318301", "318301059", "story_v_out_318301.awb")

						arg_239_1:RecordAudio("318301059", var_242_24)
						arg_239_1:RecordAudio("318301059", var_242_24)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_318301", "318301059", "story_v_out_318301.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_318301", "318301059", "story_v_out_318301.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_25 = math.max(var_242_16, arg_239_1.talkMaxDuration)

			if var_242_15 <= arg_239_1.time_ and arg_239_1.time_ < var_242_15 + var_242_25 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_15) / var_242_25

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_15 + var_242_25 and arg_239_1.time_ < var_242_15 + var_242_25 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play318301060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 318301060
		arg_243_1.duration_ = 7

		local var_243_0 = {
			zh = 7,
			ja = 6.366
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
				arg_243_0:Play318301061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.75

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[73].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(318301060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 30
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_1 or var_246_1 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_1 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301060", "story_v_out_318301.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301060", "story_v_out_318301.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_318301", "318301060", "story_v_out_318301.awb")

						arg_243_1:RecordAudio("318301060", var_246_9)
						arg_243_1:RecordAudio("318301060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_318301", "318301060", "story_v_out_318301.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_318301", "318301060", "story_v_out_318301.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_10 and arg_243_1.time_ < var_246_0 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play318301061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 318301061
		arg_247_1.duration_ = 5.6

		local var_247_0 = {
			zh = 4.5,
			ja = 5.6
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
				arg_247_0:Play318301062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1150ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1150ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(0, -1.01, -6.2)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1150ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, -1.01, -6.2)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = arg_247_1.actors_["1150ui_story"]
			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 and arg_247_1.var_.characterEffect1150ui_story == nil then
				arg_247_1.var_.characterEffect1150ui_story = var_250_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_11 = 0.200000002980232

			if var_250_10 <= arg_247_1.time_ and arg_247_1.time_ < var_250_10 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_10) / var_250_11

				if arg_247_1.var_.characterEffect1150ui_story then
					arg_247_1.var_.characterEffect1150ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_10 + var_250_11 and arg_247_1.time_ < var_250_10 + var_250_11 + arg_250_0 and arg_247_1.var_.characterEffect1150ui_story then
				arg_247_1.var_.characterEffect1150ui_story.fillFlat = false
			end

			local var_250_13 = 0

			if var_250_13 < arg_247_1.time_ and arg_247_1.time_ <= var_250_13 + arg_250_0 then
				arg_247_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/story1150/story1150action/1150action1_1")
			end

			local var_250_14 = 0

			if var_250_14 < arg_247_1.time_ and arg_247_1.time_ <= var_250_14 + arg_250_0 then
				arg_247_1:PlayTimeline("1150ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_250_15 = arg_247_1.actors_["1093ui_story"].transform
			local var_250_16 = 0

			if var_250_16 < arg_247_1.time_ and arg_247_1.time_ <= var_250_16 + arg_250_0 then
				arg_247_1.var_.moveOldPos1093ui_story = var_250_15.localPosition
			end

			local var_250_17 = 0.001

			if var_250_16 <= arg_247_1.time_ and arg_247_1.time_ < var_250_16 + var_250_17 then
				local var_250_18 = (arg_247_1.time_ - var_250_16) / var_250_17
				local var_250_19 = Vector3.New(0, 100, 0)

				var_250_15.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1093ui_story, var_250_19, var_250_18)

				local var_250_20 = manager.ui.mainCamera.transform.position - var_250_15.position

				var_250_15.forward = Vector3.New(var_250_20.x, var_250_20.y, var_250_20.z)

				local var_250_21 = var_250_15.localEulerAngles

				var_250_21.z = 0
				var_250_21.x = 0
				var_250_15.localEulerAngles = var_250_21
			end

			if arg_247_1.time_ >= var_250_16 + var_250_17 and arg_247_1.time_ < var_250_16 + var_250_17 + arg_250_0 then
				var_250_15.localPosition = Vector3.New(0, 100, 0)

				local var_250_22 = manager.ui.mainCamera.transform.position - var_250_15.position

				var_250_15.forward = Vector3.New(var_250_22.x, var_250_22.y, var_250_22.z)

				local var_250_23 = var_250_15.localEulerAngles

				var_250_23.z = 0
				var_250_23.x = 0
				var_250_15.localEulerAngles = var_250_23
			end

			local var_250_24 = arg_247_1.actors_["1093ui_story"]
			local var_250_25 = 0

			if var_250_25 < arg_247_1.time_ and arg_247_1.time_ <= var_250_25 + arg_250_0 and arg_247_1.var_.characterEffect1093ui_story == nil then
				arg_247_1.var_.characterEffect1093ui_story = var_250_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_26 = 0.200000002980232

			if var_250_25 <= arg_247_1.time_ and arg_247_1.time_ < var_250_25 + var_250_26 then
				local var_250_27 = (arg_247_1.time_ - var_250_25) / var_250_26

				if arg_247_1.var_.characterEffect1093ui_story then
					local var_250_28 = Mathf.Lerp(0, 0.5, var_250_27)

					arg_247_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1093ui_story.fillRatio = var_250_28
				end
			end

			if arg_247_1.time_ >= var_250_25 + var_250_26 and arg_247_1.time_ < var_250_25 + var_250_26 + arg_250_0 and arg_247_1.var_.characterEffect1093ui_story then
				local var_250_29 = 0.5

				arg_247_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1093ui_story.fillRatio = var_250_29
			end

			local var_250_30 = 0
			local var_250_31 = 0.525

			if var_250_30 < arg_247_1.time_ and arg_247_1.time_ <= var_250_30 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_32 = arg_247_1:FormatText(StoryNameCfg[74].name)

				arg_247_1.leftNameTxt_.text = var_250_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_33 = arg_247_1:GetWordFromCfg(318301061)
				local var_250_34 = arg_247_1:FormatText(var_250_33.content)

				arg_247_1.text_.text = var_250_34

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_35 = 21
				local var_250_36 = utf8.len(var_250_34)
				local var_250_37 = var_250_35 <= 0 and var_250_31 or var_250_31 * (var_250_36 / var_250_35)

				if var_250_37 > 0 and var_250_31 < var_250_37 then
					arg_247_1.talkMaxDuration = var_250_37

					if var_250_37 + var_250_30 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_37 + var_250_30
					end
				end

				arg_247_1.text_.text = var_250_34
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301061", "story_v_out_318301.awb") ~= 0 then
					local var_250_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301061", "story_v_out_318301.awb") / 1000

					if var_250_38 + var_250_30 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_38 + var_250_30
					end

					if var_250_33.prefab_name ~= "" and arg_247_1.actors_[var_250_33.prefab_name] ~= nil then
						local var_250_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_33.prefab_name].transform, "story_v_out_318301", "318301061", "story_v_out_318301.awb")

						arg_247_1:RecordAudio("318301061", var_250_39)
						arg_247_1:RecordAudio("318301061", var_250_39)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_318301", "318301061", "story_v_out_318301.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_318301", "318301061", "story_v_out_318301.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_40 = math.max(var_250_31, arg_247_1.talkMaxDuration)

			if var_250_30 <= arg_247_1.time_ and arg_247_1.time_ < var_250_30 + var_250_40 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_30) / var_250_40

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_30 + var_250_40 and arg_247_1.time_ < var_250_30 + var_250_40 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play318301062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 318301062
		arg_251_1.duration_ = 3.1

		local var_251_0 = {
			zh = 3.1,
			ja = 2.666
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
				arg_251_0:Play318301063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1093ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1093ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(0, -1.11, -5.88)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1093ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["1093ui_story"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and arg_251_1.var_.characterEffect1093ui_story == nil then
				arg_251_1.var_.characterEffect1093ui_story = var_254_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_11 = 0.200000002980232

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.characterEffect1093ui_story then
					arg_251_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and arg_251_1.var_.characterEffect1093ui_story then
				arg_251_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_1")
			end

			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 then
				arg_251_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_254_15 = arg_251_1.actors_["1150ui_story"].transform
			local var_254_16 = 0

			if var_254_16 < arg_251_1.time_ and arg_251_1.time_ <= var_254_16 + arg_254_0 then
				arg_251_1.var_.moveOldPos1150ui_story = var_254_15.localPosition
			end

			local var_254_17 = 0.001

			if var_254_16 <= arg_251_1.time_ and arg_251_1.time_ < var_254_16 + var_254_17 then
				local var_254_18 = (arg_251_1.time_ - var_254_16) / var_254_17
				local var_254_19 = Vector3.New(0, 100, 0)

				var_254_15.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1150ui_story, var_254_19, var_254_18)

				local var_254_20 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_20.x, var_254_20.y, var_254_20.z)

				local var_254_21 = var_254_15.localEulerAngles

				var_254_21.z = 0
				var_254_21.x = 0
				var_254_15.localEulerAngles = var_254_21
			end

			if arg_251_1.time_ >= var_254_16 + var_254_17 and arg_251_1.time_ < var_254_16 + var_254_17 + arg_254_0 then
				var_254_15.localPosition = Vector3.New(0, 100, 0)

				local var_254_22 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_22.x, var_254_22.y, var_254_22.z)

				local var_254_23 = var_254_15.localEulerAngles

				var_254_23.z = 0
				var_254_23.x = 0
				var_254_15.localEulerAngles = var_254_23
			end

			local var_254_24 = arg_251_1.actors_["1150ui_story"]
			local var_254_25 = 0

			if var_254_25 < arg_251_1.time_ and arg_251_1.time_ <= var_254_25 + arg_254_0 and arg_251_1.var_.characterEffect1150ui_story == nil then
				arg_251_1.var_.characterEffect1150ui_story = var_254_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_26 = 0.200000002980232

			if var_254_25 <= arg_251_1.time_ and arg_251_1.time_ < var_254_25 + var_254_26 then
				local var_254_27 = (arg_251_1.time_ - var_254_25) / var_254_26

				if arg_251_1.var_.characterEffect1150ui_story then
					local var_254_28 = Mathf.Lerp(0, 0.5, var_254_27)

					arg_251_1.var_.characterEffect1150ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1150ui_story.fillRatio = var_254_28
				end
			end

			if arg_251_1.time_ >= var_254_25 + var_254_26 and arg_251_1.time_ < var_254_25 + var_254_26 + arg_254_0 and arg_251_1.var_.characterEffect1150ui_story then
				local var_254_29 = 0.5

				arg_251_1.var_.characterEffect1150ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1150ui_story.fillRatio = var_254_29
			end

			local var_254_30 = 0
			local var_254_31 = 0.2

			if var_254_30 < arg_251_1.time_ and arg_251_1.time_ <= var_254_30 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_32 = arg_251_1:FormatText(StoryNameCfg[73].name)

				arg_251_1.leftNameTxt_.text = var_254_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_33 = arg_251_1:GetWordFromCfg(318301062)
				local var_254_34 = arg_251_1:FormatText(var_254_33.content)

				arg_251_1.text_.text = var_254_34

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_35 = 8
				local var_254_36 = utf8.len(var_254_34)
				local var_254_37 = var_254_35 <= 0 and var_254_31 or var_254_31 * (var_254_36 / var_254_35)

				if var_254_37 > 0 and var_254_31 < var_254_37 then
					arg_251_1.talkMaxDuration = var_254_37

					if var_254_37 + var_254_30 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_37 + var_254_30
					end
				end

				arg_251_1.text_.text = var_254_34
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301062", "story_v_out_318301.awb") ~= 0 then
					local var_254_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301062", "story_v_out_318301.awb") / 1000

					if var_254_38 + var_254_30 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_38 + var_254_30
					end

					if var_254_33.prefab_name ~= "" and arg_251_1.actors_[var_254_33.prefab_name] ~= nil then
						local var_254_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_33.prefab_name].transform, "story_v_out_318301", "318301062", "story_v_out_318301.awb")

						arg_251_1:RecordAudio("318301062", var_254_39)
						arg_251_1:RecordAudio("318301062", var_254_39)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_318301", "318301062", "story_v_out_318301.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_318301", "318301062", "story_v_out_318301.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_40 = math.max(var_254_31, arg_251_1.talkMaxDuration)

			if var_254_30 <= arg_251_1.time_ and arg_251_1.time_ < var_254_30 + var_254_40 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_30) / var_254_40

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_30 + var_254_40 and arg_251_1.time_ < var_254_30 + var_254_40 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play318301063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 318301063
		arg_255_1.duration_ = 9

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play318301064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = "K13g"

			if arg_255_1.bgs_[var_258_0] == nil then
				local var_258_1 = Object.Instantiate(arg_255_1.paintGo_)

				var_258_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_258_0)
				var_258_1.name = var_258_0
				var_258_1.transform.parent = arg_255_1.stage_.transform
				var_258_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_255_1.bgs_[var_258_0] = var_258_1
			end

			local var_258_2 = 2

			if var_258_2 < arg_255_1.time_ and arg_255_1.time_ <= var_258_2 + arg_258_0 then
				local var_258_3 = manager.ui.mainCamera.transform.localPosition
				local var_258_4 = Vector3.New(0, 0, 10) + Vector3.New(var_258_3.x, var_258_3.y, 0)
				local var_258_5 = arg_255_1.bgs_.K13g

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
					if iter_258_0 ~= "K13g" then
						iter_258_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_258_16 = 0

			if var_258_16 < arg_255_1.time_ and arg_255_1.time_ <= var_258_16 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_17 = 2

			if var_258_16 <= arg_255_1.time_ and arg_255_1.time_ < var_258_16 + var_258_17 then
				local var_258_18 = (arg_255_1.time_ - var_258_16) / var_258_17
				local var_258_19 = Color.New(0, 0, 0)

				var_258_19.a = Mathf.Lerp(0, 1, var_258_18)
				arg_255_1.mask_.color = var_258_19
			end

			if arg_255_1.time_ >= var_258_16 + var_258_17 and arg_255_1.time_ < var_258_16 + var_258_17 + arg_258_0 then
				local var_258_20 = Color.New(0, 0, 0)

				var_258_20.a = 1
				arg_255_1.mask_.color = var_258_20
			end

			local var_258_21 = 2

			if var_258_21 < arg_255_1.time_ and arg_255_1.time_ <= var_258_21 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_22 = 2

			if var_258_21 <= arg_255_1.time_ and arg_255_1.time_ < var_258_21 + var_258_22 then
				local var_258_23 = (arg_255_1.time_ - var_258_21) / var_258_22
				local var_258_24 = Color.New(0, 0, 0)

				var_258_24.a = Mathf.Lerp(1, 0, var_258_23)
				arg_255_1.mask_.color = var_258_24
			end

			if arg_255_1.time_ >= var_258_21 + var_258_22 and arg_255_1.time_ < var_258_21 + var_258_22 + arg_258_0 then
				local var_258_25 = Color.New(0, 0, 0)
				local var_258_26 = 0

				arg_255_1.mask_.enabled = false
				var_258_25.a = var_258_26
				arg_255_1.mask_.color = var_258_25
			end

			local var_258_27 = arg_255_1.actors_["1093ui_story"].transform
			local var_258_28 = 1.96599999815226

			if var_258_28 < arg_255_1.time_ and arg_255_1.time_ <= var_258_28 + arg_258_0 then
				arg_255_1.var_.moveOldPos1093ui_story = var_258_27.localPosition
			end

			local var_258_29 = 0.001

			if var_258_28 <= arg_255_1.time_ and arg_255_1.time_ < var_258_28 + var_258_29 then
				local var_258_30 = (arg_255_1.time_ - var_258_28) / var_258_29
				local var_258_31 = Vector3.New(0, 100, 0)

				var_258_27.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1093ui_story, var_258_31, var_258_30)

				local var_258_32 = manager.ui.mainCamera.transform.position - var_258_27.position

				var_258_27.forward = Vector3.New(var_258_32.x, var_258_32.y, var_258_32.z)

				local var_258_33 = var_258_27.localEulerAngles

				var_258_33.z = 0
				var_258_33.x = 0
				var_258_27.localEulerAngles = var_258_33
			end

			if arg_255_1.time_ >= var_258_28 + var_258_29 and arg_255_1.time_ < var_258_28 + var_258_29 + arg_258_0 then
				var_258_27.localPosition = Vector3.New(0, 100, 0)

				local var_258_34 = manager.ui.mainCamera.transform.position - var_258_27.position

				var_258_27.forward = Vector3.New(var_258_34.x, var_258_34.y, var_258_34.z)

				local var_258_35 = var_258_27.localEulerAngles

				var_258_35.z = 0
				var_258_35.x = 0
				var_258_27.localEulerAngles = var_258_35
			end

			local var_258_36 = arg_255_1.actors_["1093ui_story"]
			local var_258_37 = 1.96599999815226

			if var_258_37 < arg_255_1.time_ and arg_255_1.time_ <= var_258_37 + arg_258_0 and arg_255_1.var_.characterEffect1093ui_story == nil then
				arg_255_1.var_.characterEffect1093ui_story = var_258_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_38 = 0.034000001847744

			if var_258_37 <= arg_255_1.time_ and arg_255_1.time_ < var_258_37 + var_258_38 then
				local var_258_39 = (arg_255_1.time_ - var_258_37) / var_258_38

				if arg_255_1.var_.characterEffect1093ui_story then
					local var_258_40 = Mathf.Lerp(0, 0.5, var_258_39)

					arg_255_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1093ui_story.fillRatio = var_258_40
				end
			end

			if arg_255_1.time_ >= var_258_37 + var_258_38 and arg_255_1.time_ < var_258_37 + var_258_38 + arg_258_0 and arg_255_1.var_.characterEffect1093ui_story then
				local var_258_41 = 0.5

				arg_255_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1093ui_story.fillRatio = var_258_41
			end

			if arg_255_1.frameCnt_ <= 1 then
				arg_255_1.dialog_:SetActive(false)
			end

			local var_258_42 = 4
			local var_258_43 = 0.625

			if var_258_42 < arg_255_1.time_ and arg_255_1.time_ <= var_258_42 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0

				arg_255_1.dialog_:SetActive(true)

				local var_258_44 = LeanTween.value(arg_255_1.dialog_, 0, 1, 0.3)

				var_258_44:setOnUpdate(LuaHelper.FloatAction(function(arg_259_0)
					arg_255_1.dialogCg_.alpha = arg_259_0
				end))
				var_258_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_255_1.dialog_)
					var_258_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_255_1.duration_ = arg_255_1.duration_ + 0.3

				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_45 = arg_255_1:GetWordFromCfg(318301063)
				local var_258_46 = arg_255_1:FormatText(var_258_45.content)

				arg_255_1.text_.text = var_258_46

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_47 = 25
				local var_258_48 = utf8.len(var_258_46)
				local var_258_49 = var_258_47 <= 0 and var_258_43 or var_258_43 * (var_258_48 / var_258_47)

				if var_258_49 > 0 and var_258_43 < var_258_49 then
					arg_255_1.talkMaxDuration = var_258_49
					var_258_42 = var_258_42 + 0.3

					if var_258_49 + var_258_42 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_49 + var_258_42
					end
				end

				arg_255_1.text_.text = var_258_46
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_50 = var_258_42 + 0.3
			local var_258_51 = math.max(var_258_43, arg_255_1.talkMaxDuration)

			if var_258_50 <= arg_255_1.time_ and arg_255_1.time_ < var_258_50 + var_258_51 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_50) / var_258_51

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_50 + var_258_51 and arg_255_1.time_ < var_258_50 + var_258_51 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play318301064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 318301064
		arg_261_1.duration_ = 1.966

		local var_261_0 = {
			zh = 1.633,
			ja = 1.966
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play318301065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1093ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos1093ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0, -1.11, -5.88)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1093ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = arg_261_1.actors_["1093ui_story"]
			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 and arg_261_1.var_.characterEffect1093ui_story == nil then
				arg_261_1.var_.characterEffect1093ui_story = var_264_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_11 = 0.200000002980232

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_11 then
				local var_264_12 = (arg_261_1.time_ - var_264_10) / var_264_11

				if arg_261_1.var_.characterEffect1093ui_story then
					arg_261_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_10 + var_264_11 and arg_261_1.time_ < var_264_10 + var_264_11 + arg_264_0 and arg_261_1.var_.characterEffect1093ui_story then
				arg_261_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_264_13 = 0

			if var_264_13 < arg_261_1.time_ and arg_261_1.time_ <= var_264_13 + arg_264_0 then
				arg_261_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_264_14 = 0

			if var_264_14 < arg_261_1.time_ and arg_261_1.time_ <= var_264_14 + arg_264_0 then
				arg_261_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_264_15 = 0
			local var_264_16 = 0.175

			if var_264_15 < arg_261_1.time_ and arg_261_1.time_ <= var_264_15 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_17 = arg_261_1:FormatText(StoryNameCfg[73].name)

				arg_261_1.leftNameTxt_.text = var_264_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_18 = arg_261_1:GetWordFromCfg(318301064)
				local var_264_19 = arg_261_1:FormatText(var_264_18.content)

				arg_261_1.text_.text = var_264_19

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_20 = 7
				local var_264_21 = utf8.len(var_264_19)
				local var_264_22 = var_264_20 <= 0 and var_264_16 or var_264_16 * (var_264_21 / var_264_20)

				if var_264_22 > 0 and var_264_16 < var_264_22 then
					arg_261_1.talkMaxDuration = var_264_22

					if var_264_22 + var_264_15 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_22 + var_264_15
					end
				end

				arg_261_1.text_.text = var_264_19
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301064", "story_v_out_318301.awb") ~= 0 then
					local var_264_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301064", "story_v_out_318301.awb") / 1000

					if var_264_23 + var_264_15 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_23 + var_264_15
					end

					if var_264_18.prefab_name ~= "" and arg_261_1.actors_[var_264_18.prefab_name] ~= nil then
						local var_264_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_18.prefab_name].transform, "story_v_out_318301", "318301064", "story_v_out_318301.awb")

						arg_261_1:RecordAudio("318301064", var_264_24)
						arg_261_1:RecordAudio("318301064", var_264_24)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_318301", "318301064", "story_v_out_318301.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_318301", "318301064", "story_v_out_318301.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_25 = math.max(var_264_16, arg_261_1.talkMaxDuration)

			if var_264_15 <= arg_261_1.time_ and arg_261_1.time_ < var_264_15 + var_264_25 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_15) / var_264_25

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_15 + var_264_25 and arg_261_1.time_ < var_264_15 + var_264_25 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play318301065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 318301065
		arg_265_1.duration_ = 5.1

		local var_265_0 = {
			zh = 4.3,
			ja = 5.1
		}
		local var_265_1 = manager.audio:GetLocalizationFlag()

		if var_265_0[var_265_1] ~= nil then
			arg_265_1.duration_ = var_265_0[var_265_1]
		end

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play318301066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.45

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[73].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(318301065)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 18
				local var_268_6 = utf8.len(var_268_4)
				local var_268_7 = var_268_5 <= 0 and var_268_1 or var_268_1 * (var_268_6 / var_268_5)

				if var_268_7 > 0 and var_268_1 < var_268_7 then
					arg_265_1.talkMaxDuration = var_268_7

					if var_268_7 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_7 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_4
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301065", "story_v_out_318301.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301065", "story_v_out_318301.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_318301", "318301065", "story_v_out_318301.awb")

						arg_265_1:RecordAudio("318301065", var_268_9)
						arg_265_1:RecordAudio("318301065", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_318301", "318301065", "story_v_out_318301.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_318301", "318301065", "story_v_out_318301.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_10 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_10 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_10

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_10 and arg_265_1.time_ < var_268_0 + var_268_10 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play318301066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 318301066
		arg_269_1.duration_ = 2.8

		local var_269_0 = {
			zh = 2.533,
			ja = 2.8
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
				arg_269_0:Play318301067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = "1015ui_story"

			if arg_269_1.actors_[var_272_0] == nil then
				local var_272_1 = Object.Instantiate(Asset.Load("Char/" .. var_272_0), arg_269_1.stage_.transform)

				var_272_1.name = var_272_0
				var_272_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_269_1.actors_[var_272_0] = var_272_1

				local var_272_2 = var_272_1:GetComponentInChildren(typeof(CharacterEffect))

				var_272_2.enabled = true

				local var_272_3 = GameObjectTools.GetOrAddComponent(var_272_1, typeof(DynamicBoneHelper))

				if var_272_3 then
					var_272_3:EnableDynamicBone(false)
				end

				arg_269_1:ShowWeapon(var_272_2.transform, false)

				arg_269_1.var_[var_272_0 .. "Animator"] = var_272_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_269_1.var_[var_272_0 .. "Animator"].applyRootMotion = true
				arg_269_1.var_[var_272_0 .. "LipSync"] = var_272_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_272_4 = arg_269_1.actors_["1015ui_story"].transform
			local var_272_5 = 0

			if var_272_5 < arg_269_1.time_ and arg_269_1.time_ <= var_272_5 + arg_272_0 then
				arg_269_1.var_.moveOldPos1015ui_story = var_272_4.localPosition
			end

			local var_272_6 = 0.001

			if var_272_5 <= arg_269_1.time_ and arg_269_1.time_ < var_272_5 + var_272_6 then
				local var_272_7 = (arg_269_1.time_ - var_272_5) / var_272_6
				local var_272_8 = Vector3.New(0, -1.15, -6.2)

				var_272_4.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1015ui_story, var_272_8, var_272_7)

				local var_272_9 = manager.ui.mainCamera.transform.position - var_272_4.position

				var_272_4.forward = Vector3.New(var_272_9.x, var_272_9.y, var_272_9.z)

				local var_272_10 = var_272_4.localEulerAngles

				var_272_10.z = 0
				var_272_10.x = 0
				var_272_4.localEulerAngles = var_272_10
			end

			if arg_269_1.time_ >= var_272_5 + var_272_6 and arg_269_1.time_ < var_272_5 + var_272_6 + arg_272_0 then
				var_272_4.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_272_11 = manager.ui.mainCamera.transform.position - var_272_4.position

				var_272_4.forward = Vector3.New(var_272_11.x, var_272_11.y, var_272_11.z)

				local var_272_12 = var_272_4.localEulerAngles

				var_272_12.z = 0
				var_272_12.x = 0
				var_272_4.localEulerAngles = var_272_12
			end

			local var_272_13 = arg_269_1.actors_["1015ui_story"]
			local var_272_14 = 0

			if var_272_14 < arg_269_1.time_ and arg_269_1.time_ <= var_272_14 + arg_272_0 and arg_269_1.var_.characterEffect1015ui_story == nil then
				arg_269_1.var_.characterEffect1015ui_story = var_272_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_15 = 0.200000002980232

			if var_272_14 <= arg_269_1.time_ and arg_269_1.time_ < var_272_14 + var_272_15 then
				local var_272_16 = (arg_269_1.time_ - var_272_14) / var_272_15

				if arg_269_1.var_.characterEffect1015ui_story then
					arg_269_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_14 + var_272_15 and arg_269_1.time_ < var_272_14 + var_272_15 + arg_272_0 and arg_269_1.var_.characterEffect1015ui_story then
				arg_269_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_272_17 = 0

			if var_272_17 < arg_269_1.time_ and arg_269_1.time_ <= var_272_17 + arg_272_0 then
				arg_269_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_272_18 = 0

			if var_272_18 < arg_269_1.time_ and arg_269_1.time_ <= var_272_18 + arg_272_0 then
				arg_269_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_272_19 = arg_269_1.actors_["1093ui_story"].transform
			local var_272_20 = 0

			if var_272_20 < arg_269_1.time_ and arg_269_1.time_ <= var_272_20 + arg_272_0 then
				arg_269_1.var_.moveOldPos1093ui_story = var_272_19.localPosition
			end

			local var_272_21 = 0.001

			if var_272_20 <= arg_269_1.time_ and arg_269_1.time_ < var_272_20 + var_272_21 then
				local var_272_22 = (arg_269_1.time_ - var_272_20) / var_272_21
				local var_272_23 = Vector3.New(0, 100, 0)

				var_272_19.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1093ui_story, var_272_23, var_272_22)

				local var_272_24 = manager.ui.mainCamera.transform.position - var_272_19.position

				var_272_19.forward = Vector3.New(var_272_24.x, var_272_24.y, var_272_24.z)

				local var_272_25 = var_272_19.localEulerAngles

				var_272_25.z = 0
				var_272_25.x = 0
				var_272_19.localEulerAngles = var_272_25
			end

			if arg_269_1.time_ >= var_272_20 + var_272_21 and arg_269_1.time_ < var_272_20 + var_272_21 + arg_272_0 then
				var_272_19.localPosition = Vector3.New(0, 100, 0)

				local var_272_26 = manager.ui.mainCamera.transform.position - var_272_19.position

				var_272_19.forward = Vector3.New(var_272_26.x, var_272_26.y, var_272_26.z)

				local var_272_27 = var_272_19.localEulerAngles

				var_272_27.z = 0
				var_272_27.x = 0
				var_272_19.localEulerAngles = var_272_27
			end

			local var_272_28 = arg_269_1.actors_["1093ui_story"]
			local var_272_29 = 0

			if var_272_29 < arg_269_1.time_ and arg_269_1.time_ <= var_272_29 + arg_272_0 and arg_269_1.var_.characterEffect1093ui_story == nil then
				arg_269_1.var_.characterEffect1093ui_story = var_272_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_30 = 0.200000002980232

			if var_272_29 <= arg_269_1.time_ and arg_269_1.time_ < var_272_29 + var_272_30 then
				local var_272_31 = (arg_269_1.time_ - var_272_29) / var_272_30

				if arg_269_1.var_.characterEffect1093ui_story then
					local var_272_32 = Mathf.Lerp(0, 0.5, var_272_31)

					arg_269_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1093ui_story.fillRatio = var_272_32
				end
			end

			if arg_269_1.time_ >= var_272_29 + var_272_30 and arg_269_1.time_ < var_272_29 + var_272_30 + arg_272_0 and arg_269_1.var_.characterEffect1093ui_story then
				local var_272_33 = 0.5

				arg_269_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1093ui_story.fillRatio = var_272_33
			end

			local var_272_34 = 0
			local var_272_35 = 0.375

			if var_272_34 < arg_269_1.time_ and arg_269_1.time_ <= var_272_34 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_36 = arg_269_1:FormatText(StoryNameCfg[479].name)

				arg_269_1.leftNameTxt_.text = var_272_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_37 = arg_269_1:GetWordFromCfg(318301066)
				local var_272_38 = arg_269_1:FormatText(var_272_37.content)

				arg_269_1.text_.text = var_272_38

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_39 = 15
				local var_272_40 = utf8.len(var_272_38)
				local var_272_41 = var_272_39 <= 0 and var_272_35 or var_272_35 * (var_272_40 / var_272_39)

				if var_272_41 > 0 and var_272_35 < var_272_41 then
					arg_269_1.talkMaxDuration = var_272_41

					if var_272_41 + var_272_34 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_41 + var_272_34
					end
				end

				arg_269_1.text_.text = var_272_38
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301066", "story_v_out_318301.awb") ~= 0 then
					local var_272_42 = manager.audio:GetVoiceLength("story_v_out_318301", "318301066", "story_v_out_318301.awb") / 1000

					if var_272_42 + var_272_34 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_42 + var_272_34
					end

					if var_272_37.prefab_name ~= "" and arg_269_1.actors_[var_272_37.prefab_name] ~= nil then
						local var_272_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_37.prefab_name].transform, "story_v_out_318301", "318301066", "story_v_out_318301.awb")

						arg_269_1:RecordAudio("318301066", var_272_43)
						arg_269_1:RecordAudio("318301066", var_272_43)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_318301", "318301066", "story_v_out_318301.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_318301", "318301066", "story_v_out_318301.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_44 = math.max(var_272_35, arg_269_1.talkMaxDuration)

			if var_272_34 <= arg_269_1.time_ and arg_269_1.time_ < var_272_34 + var_272_44 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_34) / var_272_44

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_34 + var_272_44 and arg_269_1.time_ < var_272_34 + var_272_44 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play318301067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 318301067
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play318301068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1015ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1015ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(0, 100, 0)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1015ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(0, 100, 0)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["1015ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect1015ui_story == nil then
				arg_273_1.var_.characterEffect1015ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.200000002980232

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect1015ui_story then
					local var_276_13 = Mathf.Lerp(0, 0.5, var_276_12)

					arg_273_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1015ui_story.fillRatio = var_276_13
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect1015ui_story then
				local var_276_14 = 0.5

				arg_273_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1015ui_story.fillRatio = var_276_14
			end

			local var_276_15 = 0
			local var_276_16 = 0.775

			if var_276_15 < arg_273_1.time_ and arg_273_1.time_ <= var_276_15 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_17 = arg_273_1:GetWordFromCfg(318301067)
				local var_276_18 = arg_273_1:FormatText(var_276_17.content)

				arg_273_1.text_.text = var_276_18

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_19 = 31
				local var_276_20 = utf8.len(var_276_18)
				local var_276_21 = var_276_19 <= 0 and var_276_16 or var_276_16 * (var_276_20 / var_276_19)

				if var_276_21 > 0 and var_276_16 < var_276_21 then
					arg_273_1.talkMaxDuration = var_276_21

					if var_276_21 + var_276_15 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_21 + var_276_15
					end
				end

				arg_273_1.text_.text = var_276_18
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_22 = math.max(var_276_16, arg_273_1.talkMaxDuration)

			if var_276_15 <= arg_273_1.time_ and arg_273_1.time_ < var_276_15 + var_276_22 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_15) / var_276_22

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_15 + var_276_22 and arg_273_1.time_ < var_276_15 + var_276_22 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play318301068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 318301068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play318301069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.925

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_2 = arg_277_1:GetWordFromCfg(318301068)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 37
				local var_280_5 = utf8.len(var_280_3)
				local var_280_6 = var_280_4 <= 0 and var_280_1 or var_280_1 * (var_280_5 / var_280_4)

				if var_280_6 > 0 and var_280_1 < var_280_6 then
					arg_277_1.talkMaxDuration = var_280_6

					if var_280_6 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_6 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_3
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_7 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_7 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_7

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_7 and arg_277_1.time_ < var_280_0 + var_280_7 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play318301069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 318301069
		arg_281_1.duration_ = 3.9

		local var_281_0 = {
			zh = 3.9,
			ja = 3.066
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play318301070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = manager.ui.mainCamera.transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.shakeOldPos = var_284_0.localPosition
			end

			local var_284_2 = 0.6

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / 0.066
				local var_284_4, var_284_5 = math.modf(var_284_3)

				var_284_0.localPosition = Vector3.New(var_284_5 * 0.13, var_284_5 * 0.13, var_284_5 * 0.13) + arg_281_1.var_.shakeOldPos
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = arg_281_1.var_.shakeOldPos
			end

			local var_284_6 = 0

			if var_284_6 < arg_281_1.time_ and arg_281_1.time_ <= var_284_6 + arg_284_0 then
				arg_281_1.allBtn_.enabled = false
			end

			local var_284_7 = 0.6

			if arg_281_1.time_ >= var_284_6 + var_284_7 and arg_281_1.time_ < var_284_6 + var_284_7 + arg_284_0 then
				arg_281_1.allBtn_.enabled = true
			end

			local var_284_8 = 0
			local var_284_9 = 0.175

			if var_284_8 < arg_281_1.time_ and arg_281_1.time_ <= var_284_8 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_10 = arg_281_1:FormatText(StoryNameCfg[479].name)

				arg_281_1.leftNameTxt_.text = var_284_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, true)
				arg_281_1.iconController_:SetSelectedState("hero")

				arg_281_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1015")

				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_11 = arg_281_1:GetWordFromCfg(318301069)
				local var_284_12 = arg_281_1:FormatText(var_284_11.content)

				arg_281_1.text_.text = var_284_12

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_13 = 7
				local var_284_14 = utf8.len(var_284_12)
				local var_284_15 = var_284_13 <= 0 and var_284_9 or var_284_9 * (var_284_14 / var_284_13)

				if var_284_15 > 0 and var_284_9 < var_284_15 then
					arg_281_1.talkMaxDuration = var_284_15

					if var_284_15 + var_284_8 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_15 + var_284_8
					end
				end

				arg_281_1.text_.text = var_284_12
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301069", "story_v_out_318301.awb") ~= 0 then
					local var_284_16 = manager.audio:GetVoiceLength("story_v_out_318301", "318301069", "story_v_out_318301.awb") / 1000

					if var_284_16 + var_284_8 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_16 + var_284_8
					end

					if var_284_11.prefab_name ~= "" and arg_281_1.actors_[var_284_11.prefab_name] ~= nil then
						local var_284_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_11.prefab_name].transform, "story_v_out_318301", "318301069", "story_v_out_318301.awb")

						arg_281_1:RecordAudio("318301069", var_284_17)
						arg_281_1:RecordAudio("318301069", var_284_17)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_318301", "318301069", "story_v_out_318301.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_318301", "318301069", "story_v_out_318301.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_18 = math.max(var_284_9, arg_281_1.talkMaxDuration)

			if var_284_8 <= arg_281_1.time_ and arg_281_1.time_ < var_284_8 + var_284_18 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_8) / var_284_18

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_8 + var_284_18 and arg_281_1.time_ < var_284_8 + var_284_18 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play318301070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 318301070
		arg_285_1.duration_ = 4.366

		local var_285_0 = {
			zh = 4.366,
			ja = 3.4
		}
		local var_285_1 = manager.audio:GetLocalizationFlag()

		if var_285_0[var_285_1] ~= nil then
			arg_285_1.duration_ = var_285_0[var_285_1]
		end

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play318301071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1093ui_story"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos1093ui_story = var_288_0.localPosition
			end

			local var_288_2 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2
				local var_288_4 = Vector3.New(0, -1.11, -5.88)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1093ui_story, var_288_4, var_288_3)

				local var_288_5 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_5.x, var_288_5.y, var_288_5.z)

				local var_288_6 = var_288_0.localEulerAngles

				var_288_6.z = 0
				var_288_6.x = 0
				var_288_0.localEulerAngles = var_288_6
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_288_7 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_7.x, var_288_7.y, var_288_7.z)

				local var_288_8 = var_288_0.localEulerAngles

				var_288_8.z = 0
				var_288_8.x = 0
				var_288_0.localEulerAngles = var_288_8
			end

			local var_288_9 = arg_285_1.actors_["1093ui_story"]
			local var_288_10 = 0

			if var_288_10 < arg_285_1.time_ and arg_285_1.time_ <= var_288_10 + arg_288_0 and arg_285_1.var_.characterEffect1093ui_story == nil then
				arg_285_1.var_.characterEffect1093ui_story = var_288_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_11 = 0.200000002980232

			if var_288_10 <= arg_285_1.time_ and arg_285_1.time_ < var_288_10 + var_288_11 then
				local var_288_12 = (arg_285_1.time_ - var_288_10) / var_288_11

				if arg_285_1.var_.characterEffect1093ui_story then
					arg_285_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_285_1.time_ >= var_288_10 + var_288_11 and arg_285_1.time_ < var_288_10 + var_288_11 + arg_288_0 and arg_285_1.var_.characterEffect1093ui_story then
				arg_285_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_288_13 = 0

			if var_288_13 < arg_285_1.time_ and arg_285_1.time_ <= var_288_13 + arg_288_0 then
				arg_285_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_288_14 = 0

			if var_288_14 < arg_285_1.time_ and arg_285_1.time_ <= var_288_14 + arg_288_0 then
				arg_285_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_288_15 = arg_285_1.actors_["1015ui_story"].transform
			local var_288_16 = 0

			if var_288_16 < arg_285_1.time_ and arg_285_1.time_ <= var_288_16 + arg_288_0 then
				arg_285_1.var_.moveOldPos1015ui_story = var_288_15.localPosition
			end

			local var_288_17 = 0.001

			if var_288_16 <= arg_285_1.time_ and arg_285_1.time_ < var_288_16 + var_288_17 then
				local var_288_18 = (arg_285_1.time_ - var_288_16) / var_288_17
				local var_288_19 = Vector3.New(0, 100, 0)

				var_288_15.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1015ui_story, var_288_19, var_288_18)

				local var_288_20 = manager.ui.mainCamera.transform.position - var_288_15.position

				var_288_15.forward = Vector3.New(var_288_20.x, var_288_20.y, var_288_20.z)

				local var_288_21 = var_288_15.localEulerAngles

				var_288_21.z = 0
				var_288_21.x = 0
				var_288_15.localEulerAngles = var_288_21
			end

			if arg_285_1.time_ >= var_288_16 + var_288_17 and arg_285_1.time_ < var_288_16 + var_288_17 + arg_288_0 then
				var_288_15.localPosition = Vector3.New(0, 100, 0)

				local var_288_22 = manager.ui.mainCamera.transform.position - var_288_15.position

				var_288_15.forward = Vector3.New(var_288_22.x, var_288_22.y, var_288_22.z)

				local var_288_23 = var_288_15.localEulerAngles

				var_288_23.z = 0
				var_288_23.x = 0
				var_288_15.localEulerAngles = var_288_23
			end

			local var_288_24 = arg_285_1.actors_["1015ui_story"]
			local var_288_25 = 0

			if var_288_25 < arg_285_1.time_ and arg_285_1.time_ <= var_288_25 + arg_288_0 and arg_285_1.var_.characterEffect1015ui_story == nil then
				arg_285_1.var_.characterEffect1015ui_story = var_288_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_26 = 0.200000002980232

			if var_288_25 <= arg_285_1.time_ and arg_285_1.time_ < var_288_25 + var_288_26 then
				local var_288_27 = (arg_285_1.time_ - var_288_25) / var_288_26

				if arg_285_1.var_.characterEffect1015ui_story then
					local var_288_28 = Mathf.Lerp(0, 0.5, var_288_27)

					arg_285_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1015ui_story.fillRatio = var_288_28
				end
			end

			if arg_285_1.time_ >= var_288_25 + var_288_26 and arg_285_1.time_ < var_288_25 + var_288_26 + arg_288_0 and arg_285_1.var_.characterEffect1015ui_story then
				local var_288_29 = 0.5

				arg_285_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1015ui_story.fillRatio = var_288_29
			end

			local var_288_30 = 0
			local var_288_31 = 0.55

			if var_288_30 < arg_285_1.time_ and arg_285_1.time_ <= var_288_30 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_32 = arg_285_1:FormatText(StoryNameCfg[73].name)

				arg_285_1.leftNameTxt_.text = var_288_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_33 = arg_285_1:GetWordFromCfg(318301070)
				local var_288_34 = arg_285_1:FormatText(var_288_33.content)

				arg_285_1.text_.text = var_288_34

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_35 = 22
				local var_288_36 = utf8.len(var_288_34)
				local var_288_37 = var_288_35 <= 0 and var_288_31 or var_288_31 * (var_288_36 / var_288_35)

				if var_288_37 > 0 and var_288_31 < var_288_37 then
					arg_285_1.talkMaxDuration = var_288_37

					if var_288_37 + var_288_30 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_37 + var_288_30
					end
				end

				arg_285_1.text_.text = var_288_34
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301070", "story_v_out_318301.awb") ~= 0 then
					local var_288_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301070", "story_v_out_318301.awb") / 1000

					if var_288_38 + var_288_30 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_38 + var_288_30
					end

					if var_288_33.prefab_name ~= "" and arg_285_1.actors_[var_288_33.prefab_name] ~= nil then
						local var_288_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_33.prefab_name].transform, "story_v_out_318301", "318301070", "story_v_out_318301.awb")

						arg_285_1:RecordAudio("318301070", var_288_39)
						arg_285_1:RecordAudio("318301070", var_288_39)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_318301", "318301070", "story_v_out_318301.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_318301", "318301070", "story_v_out_318301.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_40 = math.max(var_288_31, arg_285_1.talkMaxDuration)

			if var_288_30 <= arg_285_1.time_ and arg_285_1.time_ < var_288_30 + var_288_40 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_30) / var_288_40

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_30 + var_288_40 and arg_285_1.time_ < var_288_30 + var_288_40 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play318301071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 318301071
		arg_289_1.duration_ = 5.233

		local var_289_0 = {
			zh = 3.266,
			ja = 5.233
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
				arg_289_0:Play318301072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.375

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[73].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(318301071)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301071", "story_v_out_318301.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301071", "story_v_out_318301.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_318301", "318301071", "story_v_out_318301.awb")

						arg_289_1:RecordAudio("318301071", var_292_9)
						arg_289_1:RecordAudio("318301071", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_318301", "318301071", "story_v_out_318301.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_318301", "318301071", "story_v_out_318301.awb")
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
	Play318301072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 318301072
		arg_293_1.duration_ = 3

		local var_293_0 = {
			zh = 2.166,
			ja = 3
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
				arg_293_0:Play318301073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1015ui_story"].transform
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.moveOldPos1015ui_story = var_296_0.localPosition
			end

			local var_296_2 = 0.001

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2
				local var_296_4 = Vector3.New(0, -1.15, -6.2)

				var_296_0.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1015ui_story, var_296_4, var_296_3)

				local var_296_5 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_5.x, var_296_5.y, var_296_5.z)

				local var_296_6 = var_296_0.localEulerAngles

				var_296_6.z = 0
				var_296_6.x = 0
				var_296_0.localEulerAngles = var_296_6
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 then
				var_296_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_296_7 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_7.x, var_296_7.y, var_296_7.z)

				local var_296_8 = var_296_0.localEulerAngles

				var_296_8.z = 0
				var_296_8.x = 0
				var_296_0.localEulerAngles = var_296_8
			end

			local var_296_9 = arg_293_1.actors_["1015ui_story"]
			local var_296_10 = 0

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 and arg_293_1.var_.characterEffect1015ui_story == nil then
				arg_293_1.var_.characterEffect1015ui_story = var_296_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_11 = 0.200000002980232

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_11 then
				local var_296_12 = (arg_293_1.time_ - var_296_10) / var_296_11

				if arg_293_1.var_.characterEffect1015ui_story then
					arg_293_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_10 + var_296_11 and arg_293_1.time_ < var_296_10 + var_296_11 + arg_296_0 and arg_293_1.var_.characterEffect1015ui_story then
				arg_293_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_296_13 = 0

			if var_296_13 < arg_293_1.time_ and arg_293_1.time_ <= var_296_13 + arg_296_0 then
				arg_293_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_296_15 = arg_293_1.actors_["1093ui_story"].transform
			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 then
				arg_293_1.var_.moveOldPos1093ui_story = var_296_15.localPosition
			end

			local var_296_17 = 0.001

			if var_296_16 <= arg_293_1.time_ and arg_293_1.time_ < var_296_16 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_16) / var_296_17
				local var_296_19 = Vector3.New(0, 100, 0)

				var_296_15.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1093ui_story, var_296_19, var_296_18)

				local var_296_20 = manager.ui.mainCamera.transform.position - var_296_15.position

				var_296_15.forward = Vector3.New(var_296_20.x, var_296_20.y, var_296_20.z)

				local var_296_21 = var_296_15.localEulerAngles

				var_296_21.z = 0
				var_296_21.x = 0
				var_296_15.localEulerAngles = var_296_21
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 then
				var_296_15.localPosition = Vector3.New(0, 100, 0)

				local var_296_22 = manager.ui.mainCamera.transform.position - var_296_15.position

				var_296_15.forward = Vector3.New(var_296_22.x, var_296_22.y, var_296_22.z)

				local var_296_23 = var_296_15.localEulerAngles

				var_296_23.z = 0
				var_296_23.x = 0
				var_296_15.localEulerAngles = var_296_23
			end

			local var_296_24 = arg_293_1.actors_["1093ui_story"]
			local var_296_25 = 0

			if var_296_25 < arg_293_1.time_ and arg_293_1.time_ <= var_296_25 + arg_296_0 and arg_293_1.var_.characterEffect1093ui_story == nil then
				arg_293_1.var_.characterEffect1093ui_story = var_296_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_26 = 0.200000002980232

			if var_296_25 <= arg_293_1.time_ and arg_293_1.time_ < var_296_25 + var_296_26 then
				local var_296_27 = (arg_293_1.time_ - var_296_25) / var_296_26

				if arg_293_1.var_.characterEffect1093ui_story then
					local var_296_28 = Mathf.Lerp(0, 0.5, var_296_27)

					arg_293_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_293_1.var_.characterEffect1093ui_story.fillRatio = var_296_28
				end
			end

			if arg_293_1.time_ >= var_296_25 + var_296_26 and arg_293_1.time_ < var_296_25 + var_296_26 + arg_296_0 and arg_293_1.var_.characterEffect1093ui_story then
				local var_296_29 = 0.5

				arg_293_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_293_1.var_.characterEffect1093ui_story.fillRatio = var_296_29
			end

			local var_296_30 = 0
			local var_296_31 = 0.1

			if var_296_30 < arg_293_1.time_ and arg_293_1.time_ <= var_296_30 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_32 = arg_293_1:FormatText(StoryNameCfg[479].name)

				arg_293_1.leftNameTxt_.text = var_296_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_33 = arg_293_1:GetWordFromCfg(318301072)
				local var_296_34 = arg_293_1:FormatText(var_296_33.content)

				arg_293_1.text_.text = var_296_34

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_35 = 4
				local var_296_36 = utf8.len(var_296_34)
				local var_296_37 = var_296_35 <= 0 and var_296_31 or var_296_31 * (var_296_36 / var_296_35)

				if var_296_37 > 0 and var_296_31 < var_296_37 then
					arg_293_1.talkMaxDuration = var_296_37

					if var_296_37 + var_296_30 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_37 + var_296_30
					end
				end

				arg_293_1.text_.text = var_296_34
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301072", "story_v_out_318301.awb") ~= 0 then
					local var_296_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301072", "story_v_out_318301.awb") / 1000

					if var_296_38 + var_296_30 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_38 + var_296_30
					end

					if var_296_33.prefab_name ~= "" and arg_293_1.actors_[var_296_33.prefab_name] ~= nil then
						local var_296_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_33.prefab_name].transform, "story_v_out_318301", "318301072", "story_v_out_318301.awb")

						arg_293_1:RecordAudio("318301072", var_296_39)
						arg_293_1:RecordAudio("318301072", var_296_39)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_318301", "318301072", "story_v_out_318301.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_318301", "318301072", "story_v_out_318301.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_40 = math.max(var_296_31, arg_293_1.talkMaxDuration)

			if var_296_30 <= arg_293_1.time_ and arg_293_1.time_ < var_296_30 + var_296_40 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_30) / var_296_40

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_30 + var_296_40 and arg_293_1.time_ < var_296_30 + var_296_40 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play318301073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 318301073
		arg_297_1.duration_ = 3.133

		local var_297_0 = {
			zh = 3.133,
			ja = 2.1
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
				arg_297_0:Play318301074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.325

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[479].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(318301073)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301073", "story_v_out_318301.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301073", "story_v_out_318301.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_318301", "318301073", "story_v_out_318301.awb")

						arg_297_1:RecordAudio("318301073", var_300_9)
						arg_297_1:RecordAudio("318301073", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_318301", "318301073", "story_v_out_318301.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_318301", "318301073", "story_v_out_318301.awb")
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
	Play318301074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 318301074
		arg_301_1.duration_ = 5.033

		local var_301_0 = {
			zh = 3.9,
			ja = 5.033
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
				arg_301_0:Play318301075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1093ui_story"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1093ui_story = var_304_0.localPosition
			end

			local var_304_2 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2
				local var_304_4 = Vector3.New(0, -1.11, -5.88)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1093ui_story, var_304_4, var_304_3)

				local var_304_5 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_5.x, var_304_5.y, var_304_5.z)

				local var_304_6 = var_304_0.localEulerAngles

				var_304_6.z = 0
				var_304_6.x = 0
				var_304_0.localEulerAngles = var_304_6
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_304_7 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_7.x, var_304_7.y, var_304_7.z)

				local var_304_8 = var_304_0.localEulerAngles

				var_304_8.z = 0
				var_304_8.x = 0
				var_304_0.localEulerAngles = var_304_8
			end

			local var_304_9 = arg_301_1.actors_["1093ui_story"]
			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 and arg_301_1.var_.characterEffect1093ui_story == nil then
				arg_301_1.var_.characterEffect1093ui_story = var_304_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_11 = 0.200000002980232

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_10) / var_304_11

				if arg_301_1.var_.characterEffect1093ui_story then
					arg_301_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_10 + var_304_11 and arg_301_1.time_ < var_304_10 + var_304_11 + arg_304_0 and arg_301_1.var_.characterEffect1093ui_story then
				arg_301_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_304_15 = arg_301_1.actors_["1015ui_story"].transform
			local var_304_16 = 0

			if var_304_16 < arg_301_1.time_ and arg_301_1.time_ <= var_304_16 + arg_304_0 then
				arg_301_1.var_.moveOldPos1015ui_story = var_304_15.localPosition
			end

			local var_304_17 = 0.001

			if var_304_16 <= arg_301_1.time_ and arg_301_1.time_ < var_304_16 + var_304_17 then
				local var_304_18 = (arg_301_1.time_ - var_304_16) / var_304_17
				local var_304_19 = Vector3.New(0, 100, 0)

				var_304_15.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1015ui_story, var_304_19, var_304_18)

				local var_304_20 = manager.ui.mainCamera.transform.position - var_304_15.position

				var_304_15.forward = Vector3.New(var_304_20.x, var_304_20.y, var_304_20.z)

				local var_304_21 = var_304_15.localEulerAngles

				var_304_21.z = 0
				var_304_21.x = 0
				var_304_15.localEulerAngles = var_304_21
			end

			if arg_301_1.time_ >= var_304_16 + var_304_17 and arg_301_1.time_ < var_304_16 + var_304_17 + arg_304_0 then
				var_304_15.localPosition = Vector3.New(0, 100, 0)

				local var_304_22 = manager.ui.mainCamera.transform.position - var_304_15.position

				var_304_15.forward = Vector3.New(var_304_22.x, var_304_22.y, var_304_22.z)

				local var_304_23 = var_304_15.localEulerAngles

				var_304_23.z = 0
				var_304_23.x = 0
				var_304_15.localEulerAngles = var_304_23
			end

			local var_304_24 = arg_301_1.actors_["1015ui_story"]
			local var_304_25 = 0

			if var_304_25 < arg_301_1.time_ and arg_301_1.time_ <= var_304_25 + arg_304_0 and arg_301_1.var_.characterEffect1015ui_story == nil then
				arg_301_1.var_.characterEffect1015ui_story = var_304_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_26 = 0.200000002980232

			if var_304_25 <= arg_301_1.time_ and arg_301_1.time_ < var_304_25 + var_304_26 then
				local var_304_27 = (arg_301_1.time_ - var_304_25) / var_304_26

				if arg_301_1.var_.characterEffect1015ui_story then
					local var_304_28 = Mathf.Lerp(0, 0.5, var_304_27)

					arg_301_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1015ui_story.fillRatio = var_304_28
				end
			end

			if arg_301_1.time_ >= var_304_25 + var_304_26 and arg_301_1.time_ < var_304_25 + var_304_26 + arg_304_0 and arg_301_1.var_.characterEffect1015ui_story then
				local var_304_29 = 0.5

				arg_301_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1015ui_story.fillRatio = var_304_29
			end

			local var_304_30 = 0
			local var_304_31 = 0.45

			if var_304_30 < arg_301_1.time_ and arg_301_1.time_ <= var_304_30 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_32 = arg_301_1:FormatText(StoryNameCfg[73].name)

				arg_301_1.leftNameTxt_.text = var_304_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_33 = arg_301_1:GetWordFromCfg(318301074)
				local var_304_34 = arg_301_1:FormatText(var_304_33.content)

				arg_301_1.text_.text = var_304_34

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_35 = 18
				local var_304_36 = utf8.len(var_304_34)
				local var_304_37 = var_304_35 <= 0 and var_304_31 or var_304_31 * (var_304_36 / var_304_35)

				if var_304_37 > 0 and var_304_31 < var_304_37 then
					arg_301_1.talkMaxDuration = var_304_37

					if var_304_37 + var_304_30 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_37 + var_304_30
					end
				end

				arg_301_1.text_.text = var_304_34
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301074", "story_v_out_318301.awb") ~= 0 then
					local var_304_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301074", "story_v_out_318301.awb") / 1000

					if var_304_38 + var_304_30 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_38 + var_304_30
					end

					if var_304_33.prefab_name ~= "" and arg_301_1.actors_[var_304_33.prefab_name] ~= nil then
						local var_304_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_33.prefab_name].transform, "story_v_out_318301", "318301074", "story_v_out_318301.awb")

						arg_301_1:RecordAudio("318301074", var_304_39)
						arg_301_1:RecordAudio("318301074", var_304_39)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_318301", "318301074", "story_v_out_318301.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_318301", "318301074", "story_v_out_318301.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_40 = math.max(var_304_31, arg_301_1.talkMaxDuration)

			if var_304_30 <= arg_301_1.time_ and arg_301_1.time_ < var_304_30 + var_304_40 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_30) / var_304_40

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_30 + var_304_40 and arg_301_1.time_ < var_304_30 + var_304_40 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play318301075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 318301075
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play318301076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1093ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1093ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(0, 100, 0)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1093ui_story, var_308_4, var_308_3)

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

			local var_308_9 = arg_305_1.actors_["1093ui_story"]
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 and arg_305_1.var_.characterEffect1093ui_story == nil then
				arg_305_1.var_.characterEffect1093ui_story = var_308_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_11 = 0.200000002980232

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11

				if arg_305_1.var_.characterEffect1093ui_story then
					local var_308_13 = Mathf.Lerp(0, 0.5, var_308_12)

					arg_305_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_305_1.var_.characterEffect1093ui_story.fillRatio = var_308_13
				end
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 and arg_305_1.var_.characterEffect1093ui_story then
				local var_308_14 = 0.5

				arg_305_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_305_1.var_.characterEffect1093ui_story.fillRatio = var_308_14
			end

			local var_308_15 = 0
			local var_308_16 = 0.575

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

				local var_308_17 = arg_305_1:GetWordFromCfg(318301075)
				local var_308_18 = arg_305_1:FormatText(var_308_17.content)

				arg_305_1.text_.text = var_308_18

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_19 = 23
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
	Play318301076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 318301076
		arg_309_1.duration_ = 5.266

		local var_309_0 = {
			zh = 5.266,
			ja = 5
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
				arg_309_0:Play318301077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1093ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1093ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0, -1.11, -5.88)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1093ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1093ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect1093ui_story == nil then
				arg_309_1.var_.characterEffect1093ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect1093ui_story then
					arg_309_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect1093ui_story then
				arg_309_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_312_13 = 0
			local var_312_14 = 0.6

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_15 = arg_309_1:FormatText(StoryNameCfg[73].name)

				arg_309_1.leftNameTxt_.text = var_312_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_16 = arg_309_1:GetWordFromCfg(318301076)
				local var_312_17 = arg_309_1:FormatText(var_312_16.content)

				arg_309_1.text_.text = var_312_17

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_18 = 24
				local var_312_19 = utf8.len(var_312_17)
				local var_312_20 = var_312_18 <= 0 and var_312_14 or var_312_14 * (var_312_19 / var_312_18)

				if var_312_20 > 0 and var_312_14 < var_312_20 then
					arg_309_1.talkMaxDuration = var_312_20

					if var_312_20 + var_312_13 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_20 + var_312_13
					end
				end

				arg_309_1.text_.text = var_312_17
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301076", "story_v_out_318301.awb") ~= 0 then
					local var_312_21 = manager.audio:GetVoiceLength("story_v_out_318301", "318301076", "story_v_out_318301.awb") / 1000

					if var_312_21 + var_312_13 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_21 + var_312_13
					end

					if var_312_16.prefab_name ~= "" and arg_309_1.actors_[var_312_16.prefab_name] ~= nil then
						local var_312_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_16.prefab_name].transform, "story_v_out_318301", "318301076", "story_v_out_318301.awb")

						arg_309_1:RecordAudio("318301076", var_312_22)
						arg_309_1:RecordAudio("318301076", var_312_22)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_318301", "318301076", "story_v_out_318301.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_318301", "318301076", "story_v_out_318301.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_23 = math.max(var_312_14, arg_309_1.talkMaxDuration)

			if var_312_13 <= arg_309_1.time_ and arg_309_1.time_ < var_312_13 + var_312_23 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_13) / var_312_23

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_13 + var_312_23 and arg_309_1.time_ < var_312_13 + var_312_23 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play318301077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 318301077
		arg_313_1.duration_ = 4.766

		local var_313_0 = {
			zh = 4.766,
			ja = 2.966
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play318301078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.55

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[73].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(318301077)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301077", "story_v_out_318301.awb") ~= 0 then
					local var_316_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301077", "story_v_out_318301.awb") / 1000

					if var_316_8 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_8 + var_316_0
					end

					if var_316_3.prefab_name ~= "" and arg_313_1.actors_[var_316_3.prefab_name] ~= nil then
						local var_316_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_3.prefab_name].transform, "story_v_out_318301", "318301077", "story_v_out_318301.awb")

						arg_313_1:RecordAudio("318301077", var_316_9)
						arg_313_1:RecordAudio("318301077", var_316_9)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_318301", "318301077", "story_v_out_318301.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_318301", "318301077", "story_v_out_318301.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_10 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_10 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_10

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_10 and arg_313_1.time_ < var_316_0 + var_316_10 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play318301078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 318301078
		arg_317_1.duration_ = 4.2

		local var_317_0 = {
			zh = 2.4,
			ja = 4.2
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
				arg_317_0:Play318301079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_320_1 = 0
			local var_320_2 = 0.275

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_3 = arg_317_1:FormatText(StoryNameCfg[73].name)

				arg_317_1.leftNameTxt_.text = var_320_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_4 = arg_317_1:GetWordFromCfg(318301078)
				local var_320_5 = arg_317_1:FormatText(var_320_4.content)

				arg_317_1.text_.text = var_320_5

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_6 = 11
				local var_320_7 = utf8.len(var_320_5)
				local var_320_8 = var_320_6 <= 0 and var_320_2 or var_320_2 * (var_320_7 / var_320_6)

				if var_320_8 > 0 and var_320_2 < var_320_8 then
					arg_317_1.talkMaxDuration = var_320_8

					if var_320_8 + var_320_1 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_8 + var_320_1
					end
				end

				arg_317_1.text_.text = var_320_5
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301078", "story_v_out_318301.awb") ~= 0 then
					local var_320_9 = manager.audio:GetVoiceLength("story_v_out_318301", "318301078", "story_v_out_318301.awb") / 1000

					if var_320_9 + var_320_1 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_9 + var_320_1
					end

					if var_320_4.prefab_name ~= "" and arg_317_1.actors_[var_320_4.prefab_name] ~= nil then
						local var_320_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_4.prefab_name].transform, "story_v_out_318301", "318301078", "story_v_out_318301.awb")

						arg_317_1:RecordAudio("318301078", var_320_10)
						arg_317_1:RecordAudio("318301078", var_320_10)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_318301", "318301078", "story_v_out_318301.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_318301", "318301078", "story_v_out_318301.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_11 = math.max(var_320_2, arg_317_1.talkMaxDuration)

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_11 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_1) / var_320_11

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_1 + var_320_11 and arg_317_1.time_ < var_320_1 + var_320_11 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play318301079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 318301079
		arg_321_1.duration_ = 5.7

		local var_321_0 = {
			zh = 5.7,
			ja = 4.7
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
				arg_321_0:Play318301080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1015ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1015ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(0, -1.15, -6.2)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1015ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = arg_321_1.actors_["1015ui_story"]
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 and arg_321_1.var_.characterEffect1015ui_story == nil then
				arg_321_1.var_.characterEffect1015ui_story = var_324_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_11 = 0.200000002980232

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / var_324_11

				if arg_321_1.var_.characterEffect1015ui_story then
					arg_321_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 and arg_321_1.var_.characterEffect1015ui_story then
				arg_321_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_324_13 = 0

			if var_324_13 < arg_321_1.time_ and arg_321_1.time_ <= var_324_13 + arg_324_0 then
				arg_321_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 then
				arg_321_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_324_15 = arg_321_1.actors_["1093ui_story"].transform
			local var_324_16 = 0

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 then
				arg_321_1.var_.moveOldPos1093ui_story = var_324_15.localPosition
			end

			local var_324_17 = 0.001

			if var_324_16 <= arg_321_1.time_ and arg_321_1.time_ < var_324_16 + var_324_17 then
				local var_324_18 = (arg_321_1.time_ - var_324_16) / var_324_17
				local var_324_19 = Vector3.New(0, 100, 0)

				var_324_15.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1093ui_story, var_324_19, var_324_18)

				local var_324_20 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_20.x, var_324_20.y, var_324_20.z)

				local var_324_21 = var_324_15.localEulerAngles

				var_324_21.z = 0
				var_324_21.x = 0
				var_324_15.localEulerAngles = var_324_21
			end

			if arg_321_1.time_ >= var_324_16 + var_324_17 and arg_321_1.time_ < var_324_16 + var_324_17 + arg_324_0 then
				var_324_15.localPosition = Vector3.New(0, 100, 0)

				local var_324_22 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_22.x, var_324_22.y, var_324_22.z)

				local var_324_23 = var_324_15.localEulerAngles

				var_324_23.z = 0
				var_324_23.x = 0
				var_324_15.localEulerAngles = var_324_23
			end

			local var_324_24 = arg_321_1.actors_["1093ui_story"]
			local var_324_25 = 0

			if var_324_25 < arg_321_1.time_ and arg_321_1.time_ <= var_324_25 + arg_324_0 and arg_321_1.var_.characterEffect1093ui_story == nil then
				arg_321_1.var_.characterEffect1093ui_story = var_324_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_26 = 0.200000002980232

			if var_324_25 <= arg_321_1.time_ and arg_321_1.time_ < var_324_25 + var_324_26 then
				local var_324_27 = (arg_321_1.time_ - var_324_25) / var_324_26

				if arg_321_1.var_.characterEffect1093ui_story then
					local var_324_28 = Mathf.Lerp(0, 0.5, var_324_27)

					arg_321_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1093ui_story.fillRatio = var_324_28
				end
			end

			if arg_321_1.time_ >= var_324_25 + var_324_26 and arg_321_1.time_ < var_324_25 + var_324_26 + arg_324_0 and arg_321_1.var_.characterEffect1093ui_story then
				local var_324_29 = 0.5

				arg_321_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1093ui_story.fillRatio = var_324_29
			end

			local var_324_30 = 0
			local var_324_31 = 0.525

			if var_324_30 < arg_321_1.time_ and arg_321_1.time_ <= var_324_30 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_32 = arg_321_1:FormatText(StoryNameCfg[479].name)

				arg_321_1.leftNameTxt_.text = var_324_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_33 = arg_321_1:GetWordFromCfg(318301079)
				local var_324_34 = arg_321_1:FormatText(var_324_33.content)

				arg_321_1.text_.text = var_324_34

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_35 = 21
				local var_324_36 = utf8.len(var_324_34)
				local var_324_37 = var_324_35 <= 0 and var_324_31 or var_324_31 * (var_324_36 / var_324_35)

				if var_324_37 > 0 and var_324_31 < var_324_37 then
					arg_321_1.talkMaxDuration = var_324_37

					if var_324_37 + var_324_30 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_37 + var_324_30
					end
				end

				arg_321_1.text_.text = var_324_34
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301079", "story_v_out_318301.awb") ~= 0 then
					local var_324_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301079", "story_v_out_318301.awb") / 1000

					if var_324_38 + var_324_30 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_38 + var_324_30
					end

					if var_324_33.prefab_name ~= "" and arg_321_1.actors_[var_324_33.prefab_name] ~= nil then
						local var_324_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_33.prefab_name].transform, "story_v_out_318301", "318301079", "story_v_out_318301.awb")

						arg_321_1:RecordAudio("318301079", var_324_39)
						arg_321_1:RecordAudio("318301079", var_324_39)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_318301", "318301079", "story_v_out_318301.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_318301", "318301079", "story_v_out_318301.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_40 = math.max(var_324_31, arg_321_1.talkMaxDuration)

			if var_324_30 <= arg_321_1.time_ and arg_321_1.time_ < var_324_30 + var_324_40 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_30) / var_324_40

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_30 + var_324_40 and arg_321_1.time_ < var_324_30 + var_324_40 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play318301080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 318301080
		arg_325_1.duration_ = 6

		local var_325_0 = {
			zh = 4.3,
			ja = 6
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
				arg_325_0:Play318301081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1093ui_story"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos1093ui_story = var_328_0.localPosition
			end

			local var_328_2 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2
				local var_328_4 = Vector3.New(0, -1.11, -5.88)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1093ui_story, var_328_4, var_328_3)

				local var_328_5 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_5.x, var_328_5.y, var_328_5.z)

				local var_328_6 = var_328_0.localEulerAngles

				var_328_6.z = 0
				var_328_6.x = 0
				var_328_0.localEulerAngles = var_328_6
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_328_7 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_7.x, var_328_7.y, var_328_7.z)

				local var_328_8 = var_328_0.localEulerAngles

				var_328_8.z = 0
				var_328_8.x = 0
				var_328_0.localEulerAngles = var_328_8
			end

			local var_328_9 = arg_325_1.actors_["1093ui_story"]
			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 and arg_325_1.var_.characterEffect1093ui_story == nil then
				arg_325_1.var_.characterEffect1093ui_story = var_328_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_11 = 0.200000002980232

			if var_328_10 <= arg_325_1.time_ and arg_325_1.time_ < var_328_10 + var_328_11 then
				local var_328_12 = (arg_325_1.time_ - var_328_10) / var_328_11

				if arg_325_1.var_.characterEffect1093ui_story then
					arg_325_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_10 + var_328_11 and arg_325_1.time_ < var_328_10 + var_328_11 + arg_328_0 and arg_325_1.var_.characterEffect1093ui_story then
				arg_325_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_328_13 = 0

			if var_328_13 < arg_325_1.time_ and arg_325_1.time_ <= var_328_13 + arg_328_0 then
				arg_325_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_328_14 = 0

			if var_328_14 < arg_325_1.time_ and arg_325_1.time_ <= var_328_14 + arg_328_0 then
				arg_325_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_328_15 = arg_325_1.actors_["1015ui_story"].transform
			local var_328_16 = 0

			if var_328_16 < arg_325_1.time_ and arg_325_1.time_ <= var_328_16 + arg_328_0 then
				arg_325_1.var_.moveOldPos1015ui_story = var_328_15.localPosition
			end

			local var_328_17 = 0.001

			if var_328_16 <= arg_325_1.time_ and arg_325_1.time_ < var_328_16 + var_328_17 then
				local var_328_18 = (arg_325_1.time_ - var_328_16) / var_328_17
				local var_328_19 = Vector3.New(0, 100, 0)

				var_328_15.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1015ui_story, var_328_19, var_328_18)

				local var_328_20 = manager.ui.mainCamera.transform.position - var_328_15.position

				var_328_15.forward = Vector3.New(var_328_20.x, var_328_20.y, var_328_20.z)

				local var_328_21 = var_328_15.localEulerAngles

				var_328_21.z = 0
				var_328_21.x = 0
				var_328_15.localEulerAngles = var_328_21
			end

			if arg_325_1.time_ >= var_328_16 + var_328_17 and arg_325_1.time_ < var_328_16 + var_328_17 + arg_328_0 then
				var_328_15.localPosition = Vector3.New(0, 100, 0)

				local var_328_22 = manager.ui.mainCamera.transform.position - var_328_15.position

				var_328_15.forward = Vector3.New(var_328_22.x, var_328_22.y, var_328_22.z)

				local var_328_23 = var_328_15.localEulerAngles

				var_328_23.z = 0
				var_328_23.x = 0
				var_328_15.localEulerAngles = var_328_23
			end

			local var_328_24 = arg_325_1.actors_["1015ui_story"]
			local var_328_25 = 0

			if var_328_25 < arg_325_1.time_ and arg_325_1.time_ <= var_328_25 + arg_328_0 and arg_325_1.var_.characterEffect1015ui_story == nil then
				arg_325_1.var_.characterEffect1015ui_story = var_328_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_26 = 0.200000002980232

			if var_328_25 <= arg_325_1.time_ and arg_325_1.time_ < var_328_25 + var_328_26 then
				local var_328_27 = (arg_325_1.time_ - var_328_25) / var_328_26

				if arg_325_1.var_.characterEffect1015ui_story then
					local var_328_28 = Mathf.Lerp(0, 0.5, var_328_27)

					arg_325_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1015ui_story.fillRatio = var_328_28
				end
			end

			if arg_325_1.time_ >= var_328_25 + var_328_26 and arg_325_1.time_ < var_328_25 + var_328_26 + arg_328_0 and arg_325_1.var_.characterEffect1015ui_story then
				local var_328_29 = 0.5

				arg_325_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1015ui_story.fillRatio = var_328_29
			end

			local var_328_30 = 0
			local var_328_31 = 0.475

			if var_328_30 < arg_325_1.time_ and arg_325_1.time_ <= var_328_30 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_32 = arg_325_1:FormatText(StoryNameCfg[73].name)

				arg_325_1.leftNameTxt_.text = var_328_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_33 = arg_325_1:GetWordFromCfg(318301080)
				local var_328_34 = arg_325_1:FormatText(var_328_33.content)

				arg_325_1.text_.text = var_328_34

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_35 = 19
				local var_328_36 = utf8.len(var_328_34)
				local var_328_37 = var_328_35 <= 0 and var_328_31 or var_328_31 * (var_328_36 / var_328_35)

				if var_328_37 > 0 and var_328_31 < var_328_37 then
					arg_325_1.talkMaxDuration = var_328_37

					if var_328_37 + var_328_30 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_37 + var_328_30
					end
				end

				arg_325_1.text_.text = var_328_34
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301080", "story_v_out_318301.awb") ~= 0 then
					local var_328_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301080", "story_v_out_318301.awb") / 1000

					if var_328_38 + var_328_30 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_38 + var_328_30
					end

					if var_328_33.prefab_name ~= "" and arg_325_1.actors_[var_328_33.prefab_name] ~= nil then
						local var_328_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_33.prefab_name].transform, "story_v_out_318301", "318301080", "story_v_out_318301.awb")

						arg_325_1:RecordAudio("318301080", var_328_39)
						arg_325_1:RecordAudio("318301080", var_328_39)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_318301", "318301080", "story_v_out_318301.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_318301", "318301080", "story_v_out_318301.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_40 = math.max(var_328_31, arg_325_1.talkMaxDuration)

			if var_328_30 <= arg_325_1.time_ and arg_325_1.time_ < var_328_30 + var_328_40 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_30) / var_328_40

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_30 + var_328_40 and arg_325_1.time_ < var_328_30 + var_328_40 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play318301081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 318301081
		arg_329_1.duration_ = 9

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play318301082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = "ST06"

			if arg_329_1.bgs_[var_332_0] == nil then
				local var_332_1 = Object.Instantiate(arg_329_1.paintGo_)

				var_332_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_332_0)
				var_332_1.name = var_332_0
				var_332_1.transform.parent = arg_329_1.stage_.transform
				var_332_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_329_1.bgs_[var_332_0] = var_332_1
			end

			local var_332_2 = 2

			if var_332_2 < arg_329_1.time_ and arg_329_1.time_ <= var_332_2 + arg_332_0 then
				local var_332_3 = manager.ui.mainCamera.transform.localPosition
				local var_332_4 = Vector3.New(0, 0, 10) + Vector3.New(var_332_3.x, var_332_3.y, 0)
				local var_332_5 = arg_329_1.bgs_.ST06

				var_332_5.transform.localPosition = var_332_4
				var_332_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_332_6 = var_332_5:GetComponent("SpriteRenderer")

				if var_332_6 and var_332_6.sprite then
					local var_332_7 = (var_332_5.transform.localPosition - var_332_3).z
					local var_332_8 = manager.ui.mainCameraCom_
					local var_332_9 = 2 * var_332_7 * Mathf.Tan(var_332_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_332_10 = var_332_9 * var_332_8.aspect
					local var_332_11 = var_332_6.sprite.bounds.size.x
					local var_332_12 = var_332_6.sprite.bounds.size.y
					local var_332_13 = var_332_10 / var_332_11
					local var_332_14 = var_332_9 / var_332_12
					local var_332_15 = var_332_14 < var_332_13 and var_332_13 or var_332_14

					var_332_5.transform.localScale = Vector3.New(var_332_15, var_332_15, 0)
				end

				for iter_332_0, iter_332_1 in pairs(arg_329_1.bgs_) do
					if iter_332_0 ~= "ST06" then
						iter_332_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 then
				arg_329_1.mask_.enabled = true
				arg_329_1.mask_.raycastTarget = true

				arg_329_1:SetGaussion(false)
			end

			local var_332_17 = 2

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17
				local var_332_19 = Color.New(0, 0, 0)

				var_332_19.a = Mathf.Lerp(0, 1, var_332_18)
				arg_329_1.mask_.color = var_332_19
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 then
				local var_332_20 = Color.New(0, 0, 0)

				var_332_20.a = 1
				arg_329_1.mask_.color = var_332_20
			end

			local var_332_21 = 2

			if var_332_21 < arg_329_1.time_ and arg_329_1.time_ <= var_332_21 + arg_332_0 then
				arg_329_1.mask_.enabled = true
				arg_329_1.mask_.raycastTarget = true

				arg_329_1:SetGaussion(false)
			end

			local var_332_22 = 2

			if var_332_21 <= arg_329_1.time_ and arg_329_1.time_ < var_332_21 + var_332_22 then
				local var_332_23 = (arg_329_1.time_ - var_332_21) / var_332_22
				local var_332_24 = Color.New(0, 0, 0)

				var_332_24.a = Mathf.Lerp(1, 0, var_332_23)
				arg_329_1.mask_.color = var_332_24
			end

			if arg_329_1.time_ >= var_332_21 + var_332_22 and arg_329_1.time_ < var_332_21 + var_332_22 + arg_332_0 then
				local var_332_25 = Color.New(0, 0, 0)
				local var_332_26 = 0

				arg_329_1.mask_.enabled = false
				var_332_25.a = var_332_26
				arg_329_1.mask_.color = var_332_25
			end

			local var_332_27 = arg_329_1.actors_["1093ui_story"].transform
			local var_332_28 = 1.96599999815226

			if var_332_28 < arg_329_1.time_ and arg_329_1.time_ <= var_332_28 + arg_332_0 then
				arg_329_1.var_.moveOldPos1093ui_story = var_332_27.localPosition
			end

			local var_332_29 = 0.001

			if var_332_28 <= arg_329_1.time_ and arg_329_1.time_ < var_332_28 + var_332_29 then
				local var_332_30 = (arg_329_1.time_ - var_332_28) / var_332_29
				local var_332_31 = Vector3.New(0, 100, 0)

				var_332_27.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1093ui_story, var_332_31, var_332_30)

				local var_332_32 = manager.ui.mainCamera.transform.position - var_332_27.position

				var_332_27.forward = Vector3.New(var_332_32.x, var_332_32.y, var_332_32.z)

				local var_332_33 = var_332_27.localEulerAngles

				var_332_33.z = 0
				var_332_33.x = 0
				var_332_27.localEulerAngles = var_332_33
			end

			if arg_329_1.time_ >= var_332_28 + var_332_29 and arg_329_1.time_ < var_332_28 + var_332_29 + arg_332_0 then
				var_332_27.localPosition = Vector3.New(0, 100, 0)

				local var_332_34 = manager.ui.mainCamera.transform.position - var_332_27.position

				var_332_27.forward = Vector3.New(var_332_34.x, var_332_34.y, var_332_34.z)

				local var_332_35 = var_332_27.localEulerAngles

				var_332_35.z = 0
				var_332_35.x = 0
				var_332_27.localEulerAngles = var_332_35
			end

			local var_332_36 = arg_329_1.actors_["1093ui_story"]
			local var_332_37 = 1.96599999815226

			if var_332_37 < arg_329_1.time_ and arg_329_1.time_ <= var_332_37 + arg_332_0 and arg_329_1.var_.characterEffect1093ui_story == nil then
				arg_329_1.var_.characterEffect1093ui_story = var_332_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_38 = 0.034000001847744

			if var_332_37 <= arg_329_1.time_ and arg_329_1.time_ < var_332_37 + var_332_38 then
				local var_332_39 = (arg_329_1.time_ - var_332_37) / var_332_38

				if arg_329_1.var_.characterEffect1093ui_story then
					local var_332_40 = Mathf.Lerp(0, 0.5, var_332_39)

					arg_329_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1093ui_story.fillRatio = var_332_40
				end
			end

			if arg_329_1.time_ >= var_332_37 + var_332_38 and arg_329_1.time_ < var_332_37 + var_332_38 + arg_332_0 and arg_329_1.var_.characterEffect1093ui_story then
				local var_332_41 = 0.5

				arg_329_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1093ui_story.fillRatio = var_332_41
			end

			if arg_329_1.frameCnt_ <= 1 then
				arg_329_1.dialog_:SetActive(false)
			end

			local var_332_42 = 4
			local var_332_43 = 0.9

			if var_332_42 < arg_329_1.time_ and arg_329_1.time_ <= var_332_42 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0

				arg_329_1.dialog_:SetActive(true)

				local var_332_44 = LeanTween.value(arg_329_1.dialog_, 0, 1, 0.3)

				var_332_44:setOnUpdate(LuaHelper.FloatAction(function(arg_333_0)
					arg_329_1.dialogCg_.alpha = arg_333_0
				end))
				var_332_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_329_1.dialog_)
					var_332_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_329_1.duration_ = arg_329_1.duration_ + 0.3

				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_45 = arg_329_1:GetWordFromCfg(318301081)
				local var_332_46 = arg_329_1:FormatText(var_332_45.content)

				arg_329_1.text_.text = var_332_46

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_47 = 36
				local var_332_48 = utf8.len(var_332_46)
				local var_332_49 = var_332_47 <= 0 and var_332_43 or var_332_43 * (var_332_48 / var_332_47)

				if var_332_49 > 0 and var_332_43 < var_332_49 then
					arg_329_1.talkMaxDuration = var_332_49
					var_332_42 = var_332_42 + 0.3

					if var_332_49 + var_332_42 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_49 + var_332_42
					end
				end

				arg_329_1.text_.text = var_332_46
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_50 = var_332_42 + 0.3
			local var_332_51 = math.max(var_332_43, arg_329_1.talkMaxDuration)

			if var_332_50 <= arg_329_1.time_ and arg_329_1.time_ < var_332_50 + var_332_51 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_50) / var_332_51

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_50 + var_332_51 and arg_329_1.time_ < var_332_50 + var_332_51 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play318301082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 318301082
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play318301083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 1.225

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

				local var_338_2 = arg_335_1:GetWordFromCfg(318301082)
				local var_338_3 = arg_335_1:FormatText(var_338_2.content)

				arg_335_1.text_.text = var_338_3

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_4 = 49
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
	Play318301083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 318301083
		arg_339_1.duration_ = 4.433

		local var_339_0 = {
			zh = 3.633,
			ja = 4.433
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
				arg_339_0:Play318301084(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1049ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1049ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0, -1.2, -6)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1049ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1049ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect1049ui_story == nil then
				arg_339_1.var_.characterEffect1049ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1049ui_story then
					arg_339_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect1049ui_story then
				arg_339_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_15 = 0
			local var_342_16 = 0.2

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[562].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(318301083)
				local var_342_19 = arg_339_1:FormatText(var_342_18.content)

				arg_339_1.text_.text = var_342_19

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_20 = 8
				local var_342_21 = utf8.len(var_342_19)
				local var_342_22 = var_342_20 <= 0 and var_342_16 or var_342_16 * (var_342_21 / var_342_20)

				if var_342_22 > 0 and var_342_16 < var_342_22 then
					arg_339_1.talkMaxDuration = var_342_22

					if var_342_22 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_22 + var_342_15
					end
				end

				arg_339_1.text_.text = var_342_19
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301083", "story_v_out_318301.awb") ~= 0 then
					local var_342_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301083", "story_v_out_318301.awb") / 1000

					if var_342_23 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_23 + var_342_15
					end

					if var_342_18.prefab_name ~= "" and arg_339_1.actors_[var_342_18.prefab_name] ~= nil then
						local var_342_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_18.prefab_name].transform, "story_v_out_318301", "318301083", "story_v_out_318301.awb")

						arg_339_1:RecordAudio("318301083", var_342_24)
						arg_339_1:RecordAudio("318301083", var_342_24)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_318301", "318301083", "story_v_out_318301.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_318301", "318301083", "story_v_out_318301.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_25 = math.max(var_342_16, arg_339_1.talkMaxDuration)

			if var_342_15 <= arg_339_1.time_ and arg_339_1.time_ < var_342_15 + var_342_25 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_15) / var_342_25

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_15 + var_342_25 and arg_339_1.time_ < var_342_15 + var_342_25 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play318301084 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 318301084
		arg_343_1.duration_ = 4.433

		local var_343_0 = {
			zh = 3.166,
			ja = 4.433
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
				arg_343_0:Play318301085(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = "10053ui_story"

			if arg_343_1.actors_[var_346_0] == nil then
				local var_346_1 = Object.Instantiate(Asset.Load("Char/" .. var_346_0), arg_343_1.stage_.transform)

				var_346_1.name = var_346_0
				var_346_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_343_1.actors_[var_346_0] = var_346_1

				local var_346_2 = var_346_1:GetComponentInChildren(typeof(CharacterEffect))

				var_346_2.enabled = true

				local var_346_3 = GameObjectTools.GetOrAddComponent(var_346_1, typeof(DynamicBoneHelper))

				if var_346_3 then
					var_346_3:EnableDynamicBone(false)
				end

				arg_343_1:ShowWeapon(var_346_2.transform, false)

				arg_343_1.var_[var_346_0 .. "Animator"] = var_346_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_343_1.var_[var_346_0 .. "Animator"].applyRootMotion = true
				arg_343_1.var_[var_346_0 .. "LipSync"] = var_346_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_346_4 = arg_343_1.actors_["10053ui_story"].transform
			local var_346_5 = 0

			if var_346_5 < arg_343_1.time_ and arg_343_1.time_ <= var_346_5 + arg_346_0 then
				arg_343_1.var_.moveOldPos10053ui_story = var_346_4.localPosition
			end

			local var_346_6 = 0.001

			if var_346_5 <= arg_343_1.time_ and arg_343_1.time_ < var_346_5 + var_346_6 then
				local var_346_7 = (arg_343_1.time_ - var_346_5) / var_346_6
				local var_346_8 = Vector3.New(0, -1.12, -5.99)

				var_346_4.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos10053ui_story, var_346_8, var_346_7)

				local var_346_9 = manager.ui.mainCamera.transform.position - var_346_4.position

				var_346_4.forward = Vector3.New(var_346_9.x, var_346_9.y, var_346_9.z)

				local var_346_10 = var_346_4.localEulerAngles

				var_346_10.z = 0
				var_346_10.x = 0
				var_346_4.localEulerAngles = var_346_10
			end

			if arg_343_1.time_ >= var_346_5 + var_346_6 and arg_343_1.time_ < var_346_5 + var_346_6 + arg_346_0 then
				var_346_4.localPosition = Vector3.New(0, -1.12, -5.99)

				local var_346_11 = manager.ui.mainCamera.transform.position - var_346_4.position

				var_346_4.forward = Vector3.New(var_346_11.x, var_346_11.y, var_346_11.z)

				local var_346_12 = var_346_4.localEulerAngles

				var_346_12.z = 0
				var_346_12.x = 0
				var_346_4.localEulerAngles = var_346_12
			end

			local var_346_13 = arg_343_1.actors_["10053ui_story"]
			local var_346_14 = 0

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 and arg_343_1.var_.characterEffect10053ui_story == nil then
				arg_343_1.var_.characterEffect10053ui_story = var_346_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_15 = 0.200000002980232

			if var_346_14 <= arg_343_1.time_ and arg_343_1.time_ < var_346_14 + var_346_15 then
				local var_346_16 = (arg_343_1.time_ - var_346_14) / var_346_15

				if arg_343_1.var_.characterEffect10053ui_story then
					arg_343_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_14 + var_346_15 and arg_343_1.time_ < var_346_14 + var_346_15 + arg_346_0 and arg_343_1.var_.characterEffect10053ui_story then
				arg_343_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_346_17 = 0

			if var_346_17 < arg_343_1.time_ and arg_343_1.time_ <= var_346_17 + arg_346_0 then
				arg_343_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_346_18 = 0

			if var_346_18 < arg_343_1.time_ and arg_343_1.time_ <= var_346_18 + arg_346_0 then
				arg_343_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_346_19 = arg_343_1.actors_["1049ui_story"].transform
			local var_346_20 = 0

			if var_346_20 < arg_343_1.time_ and arg_343_1.time_ <= var_346_20 + arg_346_0 then
				arg_343_1.var_.moveOldPos1049ui_story = var_346_19.localPosition
			end

			local var_346_21 = 0.001

			if var_346_20 <= arg_343_1.time_ and arg_343_1.time_ < var_346_20 + var_346_21 then
				local var_346_22 = (arg_343_1.time_ - var_346_20) / var_346_21
				local var_346_23 = Vector3.New(0, 100, 0)

				var_346_19.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1049ui_story, var_346_23, var_346_22)

				local var_346_24 = manager.ui.mainCamera.transform.position - var_346_19.position

				var_346_19.forward = Vector3.New(var_346_24.x, var_346_24.y, var_346_24.z)

				local var_346_25 = var_346_19.localEulerAngles

				var_346_25.z = 0
				var_346_25.x = 0
				var_346_19.localEulerAngles = var_346_25
			end

			if arg_343_1.time_ >= var_346_20 + var_346_21 and arg_343_1.time_ < var_346_20 + var_346_21 + arg_346_0 then
				var_346_19.localPosition = Vector3.New(0, 100, 0)

				local var_346_26 = manager.ui.mainCamera.transform.position - var_346_19.position

				var_346_19.forward = Vector3.New(var_346_26.x, var_346_26.y, var_346_26.z)

				local var_346_27 = var_346_19.localEulerAngles

				var_346_27.z = 0
				var_346_27.x = 0
				var_346_19.localEulerAngles = var_346_27
			end

			local var_346_28 = arg_343_1.actors_["1049ui_story"]
			local var_346_29 = 0

			if var_346_29 < arg_343_1.time_ and arg_343_1.time_ <= var_346_29 + arg_346_0 and arg_343_1.var_.characterEffect1049ui_story == nil then
				arg_343_1.var_.characterEffect1049ui_story = var_346_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_30 = 0.200000002980232

			if var_346_29 <= arg_343_1.time_ and arg_343_1.time_ < var_346_29 + var_346_30 then
				local var_346_31 = (arg_343_1.time_ - var_346_29) / var_346_30

				if arg_343_1.var_.characterEffect1049ui_story then
					local var_346_32 = Mathf.Lerp(0, 0.5, var_346_31)

					arg_343_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1049ui_story.fillRatio = var_346_32
				end
			end

			if arg_343_1.time_ >= var_346_29 + var_346_30 and arg_343_1.time_ < var_346_29 + var_346_30 + arg_346_0 and arg_343_1.var_.characterEffect1049ui_story then
				local var_346_33 = 0.5

				arg_343_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1049ui_story.fillRatio = var_346_33
			end

			local var_346_34 = 0
			local var_346_35 = 0.325

			if var_346_34 < arg_343_1.time_ and arg_343_1.time_ <= var_346_34 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_36 = arg_343_1:FormatText(StoryNameCfg[477].name)

				arg_343_1.leftNameTxt_.text = var_346_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_37 = arg_343_1:GetWordFromCfg(318301084)
				local var_346_38 = arg_343_1:FormatText(var_346_37.content)

				arg_343_1.text_.text = var_346_38

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_39 = 13
				local var_346_40 = utf8.len(var_346_38)
				local var_346_41 = var_346_39 <= 0 and var_346_35 or var_346_35 * (var_346_40 / var_346_39)

				if var_346_41 > 0 and var_346_35 < var_346_41 then
					arg_343_1.talkMaxDuration = var_346_41

					if var_346_41 + var_346_34 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_41 + var_346_34
					end
				end

				arg_343_1.text_.text = var_346_38
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301084", "story_v_out_318301.awb") ~= 0 then
					local var_346_42 = manager.audio:GetVoiceLength("story_v_out_318301", "318301084", "story_v_out_318301.awb") / 1000

					if var_346_42 + var_346_34 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_42 + var_346_34
					end

					if var_346_37.prefab_name ~= "" and arg_343_1.actors_[var_346_37.prefab_name] ~= nil then
						local var_346_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_37.prefab_name].transform, "story_v_out_318301", "318301084", "story_v_out_318301.awb")

						arg_343_1:RecordAudio("318301084", var_346_43)
						arg_343_1:RecordAudio("318301084", var_346_43)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_318301", "318301084", "story_v_out_318301.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_318301", "318301084", "story_v_out_318301.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_44 = math.max(var_346_35, arg_343_1.talkMaxDuration)

			if var_346_34 <= arg_343_1.time_ and arg_343_1.time_ < var_346_34 + var_346_44 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_34) / var_346_44

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_34 + var_346_44 and arg_343_1.time_ < var_346_34 + var_346_44 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play318301085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 318301085
		arg_347_1.duration_ = 5.933

		local var_347_0 = {
			zh = 4.233,
			ja = 5.933
		}
		local var_347_1 = manager.audio:GetLocalizationFlag()

		if var_347_0[var_347_1] ~= nil then
			arg_347_1.duration_ = var_347_0[var_347_1]
		end

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play318301086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1049ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos1049ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(0, -1.2, -6)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1049ui_story, var_350_4, var_350_3)

				local var_350_5 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_5.x, var_350_5.y, var_350_5.z)

				local var_350_6 = var_350_0.localEulerAngles

				var_350_6.z = 0
				var_350_6.x = 0
				var_350_0.localEulerAngles = var_350_6
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_350_7 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_7.x, var_350_7.y, var_350_7.z)

				local var_350_8 = var_350_0.localEulerAngles

				var_350_8.z = 0
				var_350_8.x = 0
				var_350_0.localEulerAngles = var_350_8
			end

			local var_350_9 = arg_347_1.actors_["1049ui_story"]
			local var_350_10 = 0

			if var_350_10 < arg_347_1.time_ and arg_347_1.time_ <= var_350_10 + arg_350_0 and arg_347_1.var_.characterEffect1049ui_story == nil then
				arg_347_1.var_.characterEffect1049ui_story = var_350_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_11 = 0.200000002980232

			if var_350_10 <= arg_347_1.time_ and arg_347_1.time_ < var_350_10 + var_350_11 then
				local var_350_12 = (arg_347_1.time_ - var_350_10) / var_350_11

				if arg_347_1.var_.characterEffect1049ui_story then
					arg_347_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_10 + var_350_11 and arg_347_1.time_ < var_350_10 + var_350_11 + arg_350_0 and arg_347_1.var_.characterEffect1049ui_story then
				arg_347_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_350_13 = 0

			if var_350_13 < arg_347_1.time_ and arg_347_1.time_ <= var_350_13 + arg_350_0 then
				arg_347_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_350_14 = 0

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 then
				arg_347_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_350_15 = arg_347_1.actors_["10053ui_story"].transform
			local var_350_16 = 0

			if var_350_16 < arg_347_1.time_ and arg_347_1.time_ <= var_350_16 + arg_350_0 then
				arg_347_1.var_.moveOldPos10053ui_story = var_350_15.localPosition
			end

			local var_350_17 = 0.001

			if var_350_16 <= arg_347_1.time_ and arg_347_1.time_ < var_350_16 + var_350_17 then
				local var_350_18 = (arg_347_1.time_ - var_350_16) / var_350_17
				local var_350_19 = Vector3.New(0, 100, 0)

				var_350_15.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos10053ui_story, var_350_19, var_350_18)

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

			local var_350_24 = arg_347_1.actors_["10053ui_story"]
			local var_350_25 = 0

			if var_350_25 < arg_347_1.time_ and arg_347_1.time_ <= var_350_25 + arg_350_0 and arg_347_1.var_.characterEffect10053ui_story == nil then
				arg_347_1.var_.characterEffect10053ui_story = var_350_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_26 = 0.200000002980232

			if var_350_25 <= arg_347_1.time_ and arg_347_1.time_ < var_350_25 + var_350_26 then
				local var_350_27 = (arg_347_1.time_ - var_350_25) / var_350_26

				if arg_347_1.var_.characterEffect10053ui_story then
					local var_350_28 = Mathf.Lerp(0, 0.5, var_350_27)

					arg_347_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_347_1.var_.characterEffect10053ui_story.fillRatio = var_350_28
				end
			end

			if arg_347_1.time_ >= var_350_25 + var_350_26 and arg_347_1.time_ < var_350_25 + var_350_26 + arg_350_0 and arg_347_1.var_.characterEffect10053ui_story then
				local var_350_29 = 0.5

				arg_347_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_347_1.var_.characterEffect10053ui_story.fillRatio = var_350_29
			end

			local var_350_30 = 0
			local var_350_31 = 0.5

			if var_350_30 < arg_347_1.time_ and arg_347_1.time_ <= var_350_30 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_32 = arg_347_1:FormatText(StoryNameCfg[562].name)

				arg_347_1.leftNameTxt_.text = var_350_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_33 = arg_347_1:GetWordFromCfg(318301085)
				local var_350_34 = arg_347_1:FormatText(var_350_33.content)

				arg_347_1.text_.text = var_350_34

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_35 = 20
				local var_350_36 = utf8.len(var_350_34)
				local var_350_37 = var_350_35 <= 0 and var_350_31 or var_350_31 * (var_350_36 / var_350_35)

				if var_350_37 > 0 and var_350_31 < var_350_37 then
					arg_347_1.talkMaxDuration = var_350_37

					if var_350_37 + var_350_30 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_37 + var_350_30
					end
				end

				arg_347_1.text_.text = var_350_34
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301085", "story_v_out_318301.awb") ~= 0 then
					local var_350_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301085", "story_v_out_318301.awb") / 1000

					if var_350_38 + var_350_30 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_38 + var_350_30
					end

					if var_350_33.prefab_name ~= "" and arg_347_1.actors_[var_350_33.prefab_name] ~= nil then
						local var_350_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_33.prefab_name].transform, "story_v_out_318301", "318301085", "story_v_out_318301.awb")

						arg_347_1:RecordAudio("318301085", var_350_39)
						arg_347_1:RecordAudio("318301085", var_350_39)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_318301", "318301085", "story_v_out_318301.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_318301", "318301085", "story_v_out_318301.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_40 = math.max(var_350_31, arg_347_1.talkMaxDuration)

			if var_350_30 <= arg_347_1.time_ and arg_347_1.time_ < var_350_30 + var_350_40 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_30) / var_350_40

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_30 + var_350_40 and arg_347_1.time_ < var_350_30 + var_350_40 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play318301086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 318301086
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play318301087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1049ui_story"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1049ui_story = var_354_0.localPosition
			end

			local var_354_2 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(0, 100, 0)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1049ui_story, var_354_4, var_354_3)

				local var_354_5 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_5.x, var_354_5.y, var_354_5.z)

				local var_354_6 = var_354_0.localEulerAngles

				var_354_6.z = 0
				var_354_6.x = 0
				var_354_0.localEulerAngles = var_354_6
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0, 100, 0)

				local var_354_7 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_7.x, var_354_7.y, var_354_7.z)

				local var_354_8 = var_354_0.localEulerAngles

				var_354_8.z = 0
				var_354_8.x = 0
				var_354_0.localEulerAngles = var_354_8
			end

			local var_354_9 = arg_351_1.actors_["1049ui_story"]
			local var_354_10 = 0

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 and arg_351_1.var_.characterEffect1049ui_story == nil then
				arg_351_1.var_.characterEffect1049ui_story = var_354_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_11 = 0.200000002980232

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_11 then
				local var_354_12 = (arg_351_1.time_ - var_354_10) / var_354_11

				if arg_351_1.var_.characterEffect1049ui_story then
					local var_354_13 = Mathf.Lerp(0, 0.5, var_354_12)

					arg_351_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1049ui_story.fillRatio = var_354_13
				end
			end

			if arg_351_1.time_ >= var_354_10 + var_354_11 and arg_351_1.time_ < var_354_10 + var_354_11 + arg_354_0 and arg_351_1.var_.characterEffect1049ui_story then
				local var_354_14 = 0.5

				arg_351_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1049ui_story.fillRatio = var_354_14
			end

			local var_354_15 = 0
			local var_354_16 = 1.75

			if var_354_15 < arg_351_1.time_ and arg_351_1.time_ <= var_354_15 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_17 = arg_351_1:GetWordFromCfg(318301086)
				local var_354_18 = arg_351_1:FormatText(var_354_17.content)

				arg_351_1.text_.text = var_354_18

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_19 = 70
				local var_354_20 = utf8.len(var_354_18)
				local var_354_21 = var_354_19 <= 0 and var_354_16 or var_354_16 * (var_354_20 / var_354_19)

				if var_354_21 > 0 and var_354_16 < var_354_21 then
					arg_351_1.talkMaxDuration = var_354_21

					if var_354_21 + var_354_15 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_21 + var_354_15
					end
				end

				arg_351_1.text_.text = var_354_18
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_22 = math.max(var_354_16, arg_351_1.talkMaxDuration)

			if var_354_15 <= arg_351_1.time_ and arg_351_1.time_ < var_354_15 + var_354_22 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_15) / var_354_22

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_15 + var_354_22 and arg_351_1.time_ < var_354_15 + var_354_22 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play318301087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 318301087
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play318301088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.825

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_2 = arg_355_1:FormatText(StoryNameCfg[7].name)

				arg_355_1.leftNameTxt_.text = var_358_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_3 = arg_355_1:GetWordFromCfg(318301087)
				local var_358_4 = arg_355_1:FormatText(var_358_3.content)

				arg_355_1.text_.text = var_358_4

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_5 = 33
				local var_358_6 = utf8.len(var_358_4)
				local var_358_7 = var_358_5 <= 0 and var_358_1 or var_358_1 * (var_358_6 / var_358_5)

				if var_358_7 > 0 and var_358_1 < var_358_7 then
					arg_355_1.talkMaxDuration = var_358_7

					if var_358_7 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_7 + var_358_0
					end
				end

				arg_355_1.text_.text = var_358_4
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_8 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_8 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_8

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_8 and arg_355_1.time_ < var_358_0 + var_358_8 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play318301088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 318301088
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play318301089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.775

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[7].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(318301088)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 31
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
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_8 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_8 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_8

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_8 and arg_359_1.time_ < var_362_0 + var_362_8 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play318301089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 318301089
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play318301090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0
			local var_366_1 = 0.725

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_2 = arg_363_1:FormatText(StoryNameCfg[7].name)

				arg_363_1.leftNameTxt_.text = var_366_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_3 = arg_363_1:GetWordFromCfg(318301089)
				local var_366_4 = arg_363_1:FormatText(var_366_3.content)

				arg_363_1.text_.text = var_366_4

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_5 = 29
				local var_366_6 = utf8.len(var_366_4)
				local var_366_7 = var_366_5 <= 0 and var_366_1 or var_366_1 * (var_366_6 / var_366_5)

				if var_366_7 > 0 and var_366_1 < var_366_7 then
					arg_363_1.talkMaxDuration = var_366_7

					if var_366_7 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_7 + var_366_0
					end
				end

				arg_363_1.text_.text = var_366_4
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_8 = math.max(var_366_1, arg_363_1.talkMaxDuration)

			if var_366_0 <= arg_363_1.time_ and arg_363_1.time_ < var_366_0 + var_366_8 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_0) / var_366_8

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_0 + var_366_8 and arg_363_1.time_ < var_366_0 + var_366_8 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play318301090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 318301090
		arg_367_1.duration_ = 3.4

		local var_367_0 = {
			zh = 3.4,
			ja = 2.5
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play318301091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["10053ui_story"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos10053ui_story = var_370_0.localPosition
			end

			local var_370_2 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2
				local var_370_4 = Vector3.New(0, -1.12, -5.99)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos10053ui_story, var_370_4, var_370_3)

				local var_370_5 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_5.x, var_370_5.y, var_370_5.z)

				local var_370_6 = var_370_0.localEulerAngles

				var_370_6.z = 0
				var_370_6.x = 0
				var_370_0.localEulerAngles = var_370_6
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(0, -1.12, -5.99)

				local var_370_7 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_7.x, var_370_7.y, var_370_7.z)

				local var_370_8 = var_370_0.localEulerAngles

				var_370_8.z = 0
				var_370_8.x = 0
				var_370_0.localEulerAngles = var_370_8
			end

			local var_370_9 = arg_367_1.actors_["10053ui_story"]
			local var_370_10 = 0

			if var_370_10 < arg_367_1.time_ and arg_367_1.time_ <= var_370_10 + arg_370_0 and arg_367_1.var_.characterEffect10053ui_story == nil then
				arg_367_1.var_.characterEffect10053ui_story = var_370_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_11 = 0.200000002980232

			if var_370_10 <= arg_367_1.time_ and arg_367_1.time_ < var_370_10 + var_370_11 then
				local var_370_12 = (arg_367_1.time_ - var_370_10) / var_370_11

				if arg_367_1.var_.characterEffect10053ui_story then
					arg_367_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_367_1.time_ >= var_370_10 + var_370_11 and arg_367_1.time_ < var_370_10 + var_370_11 + arg_370_0 and arg_367_1.var_.characterEffect10053ui_story then
				arg_367_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_370_13 = 0

			if var_370_13 < arg_367_1.time_ and arg_367_1.time_ <= var_370_13 + arg_370_0 then
				arg_367_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_370_14 = 0

			if var_370_14 < arg_367_1.time_ and arg_367_1.time_ <= var_370_14 + arg_370_0 then
				arg_367_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_370_15 = 0
			local var_370_16 = 0.275

			if var_370_15 < arg_367_1.time_ and arg_367_1.time_ <= var_370_15 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_17 = arg_367_1:FormatText(StoryNameCfg[477].name)

				arg_367_1.leftNameTxt_.text = var_370_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_18 = arg_367_1:GetWordFromCfg(318301090)
				local var_370_19 = arg_367_1:FormatText(var_370_18.content)

				arg_367_1.text_.text = var_370_19

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_20 = 11
				local var_370_21 = utf8.len(var_370_19)
				local var_370_22 = var_370_20 <= 0 and var_370_16 or var_370_16 * (var_370_21 / var_370_20)

				if var_370_22 > 0 and var_370_16 < var_370_22 then
					arg_367_1.talkMaxDuration = var_370_22

					if var_370_22 + var_370_15 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_22 + var_370_15
					end
				end

				arg_367_1.text_.text = var_370_19
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301090", "story_v_out_318301.awb") ~= 0 then
					local var_370_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301090", "story_v_out_318301.awb") / 1000

					if var_370_23 + var_370_15 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_23 + var_370_15
					end

					if var_370_18.prefab_name ~= "" and arg_367_1.actors_[var_370_18.prefab_name] ~= nil then
						local var_370_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_18.prefab_name].transform, "story_v_out_318301", "318301090", "story_v_out_318301.awb")

						arg_367_1:RecordAudio("318301090", var_370_24)
						arg_367_1:RecordAudio("318301090", var_370_24)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_318301", "318301090", "story_v_out_318301.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_318301", "318301090", "story_v_out_318301.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_25 = math.max(var_370_16, arg_367_1.talkMaxDuration)

			if var_370_15 <= arg_367_1.time_ and arg_367_1.time_ < var_370_15 + var_370_25 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_15) / var_370_25

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_15 + var_370_25 and arg_367_1.time_ < var_370_15 + var_370_25 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play318301091 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 318301091
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play318301092(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["10053ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos10053ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0, 100, 0)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos10053ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0, 100, 0)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = arg_371_1.actors_["10053ui_story"]
			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 and arg_371_1.var_.characterEffect10053ui_story == nil then
				arg_371_1.var_.characterEffect10053ui_story = var_374_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_11 = 0.200000002980232

			if var_374_10 <= arg_371_1.time_ and arg_371_1.time_ < var_374_10 + var_374_11 then
				local var_374_12 = (arg_371_1.time_ - var_374_10) / var_374_11

				if arg_371_1.var_.characterEffect10053ui_story then
					local var_374_13 = Mathf.Lerp(0, 0.5, var_374_12)

					arg_371_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_371_1.var_.characterEffect10053ui_story.fillRatio = var_374_13
				end
			end

			if arg_371_1.time_ >= var_374_10 + var_374_11 and arg_371_1.time_ < var_374_10 + var_374_11 + arg_374_0 and arg_371_1.var_.characterEffect10053ui_story then
				local var_374_14 = 0.5

				arg_371_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_371_1.var_.characterEffect10053ui_story.fillRatio = var_374_14
			end

			local var_374_15 = 0
			local var_374_16 = 0.875

			if var_374_15 < arg_371_1.time_ and arg_371_1.time_ <= var_374_15 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_17 = arg_371_1:GetWordFromCfg(318301091)
				local var_374_18 = arg_371_1:FormatText(var_374_17.content)

				arg_371_1.text_.text = var_374_18

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_19 = 35
				local var_374_20 = utf8.len(var_374_18)
				local var_374_21 = var_374_19 <= 0 and var_374_16 or var_374_16 * (var_374_20 / var_374_19)

				if var_374_21 > 0 and var_374_16 < var_374_21 then
					arg_371_1.talkMaxDuration = var_374_21

					if var_374_21 + var_374_15 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_21 + var_374_15
					end
				end

				arg_371_1.text_.text = var_374_18
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_22 = math.max(var_374_16, arg_371_1.talkMaxDuration)

			if var_374_15 <= arg_371_1.time_ and arg_371_1.time_ < var_374_15 + var_374_22 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_15) / var_374_22

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_15 + var_374_22 and arg_371_1.time_ < var_374_15 + var_374_22 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play318301092 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 318301092
		arg_375_1.duration_ = 10.066

		local var_375_0 = {
			zh = 5.2,
			ja = 10.066
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play318301093(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1049ui_story"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos1049ui_story = var_378_0.localPosition
			end

			local var_378_2 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2
				local var_378_4 = Vector3.New(0, -1.2, -6)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1049ui_story, var_378_4, var_378_3)

				local var_378_5 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_5.x, var_378_5.y, var_378_5.z)

				local var_378_6 = var_378_0.localEulerAngles

				var_378_6.z = 0
				var_378_6.x = 0
				var_378_0.localEulerAngles = var_378_6
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_378_7 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_7.x, var_378_7.y, var_378_7.z)

				local var_378_8 = var_378_0.localEulerAngles

				var_378_8.z = 0
				var_378_8.x = 0
				var_378_0.localEulerAngles = var_378_8
			end

			local var_378_9 = arg_375_1.actors_["1049ui_story"]
			local var_378_10 = 0

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 and arg_375_1.var_.characterEffect1049ui_story == nil then
				arg_375_1.var_.characterEffect1049ui_story = var_378_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_11 = 0.200000002980232

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_11 then
				local var_378_12 = (arg_375_1.time_ - var_378_10) / var_378_11

				if arg_375_1.var_.characterEffect1049ui_story then
					arg_375_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_10 + var_378_11 and arg_375_1.time_ < var_378_10 + var_378_11 + arg_378_0 and arg_375_1.var_.characterEffect1049ui_story then
				arg_375_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_378_13 = 0

			if var_378_13 < arg_375_1.time_ and arg_375_1.time_ <= var_378_13 + arg_378_0 then
				arg_375_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				arg_375_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_378_15 = 0
			local var_378_16 = 0.45

			if var_378_15 < arg_375_1.time_ and arg_375_1.time_ <= var_378_15 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_17 = arg_375_1:FormatText(StoryNameCfg[562].name)

				arg_375_1.leftNameTxt_.text = var_378_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_18 = arg_375_1:GetWordFromCfg(318301092)
				local var_378_19 = arg_375_1:FormatText(var_378_18.content)

				arg_375_1.text_.text = var_378_19

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_20 = 18
				local var_378_21 = utf8.len(var_378_19)
				local var_378_22 = var_378_20 <= 0 and var_378_16 or var_378_16 * (var_378_21 / var_378_20)

				if var_378_22 > 0 and var_378_16 < var_378_22 then
					arg_375_1.talkMaxDuration = var_378_22

					if var_378_22 + var_378_15 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_22 + var_378_15
					end
				end

				arg_375_1.text_.text = var_378_19
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301092", "story_v_out_318301.awb") ~= 0 then
					local var_378_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301092", "story_v_out_318301.awb") / 1000

					if var_378_23 + var_378_15 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_23 + var_378_15
					end

					if var_378_18.prefab_name ~= "" and arg_375_1.actors_[var_378_18.prefab_name] ~= nil then
						local var_378_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_18.prefab_name].transform, "story_v_out_318301", "318301092", "story_v_out_318301.awb")

						arg_375_1:RecordAudio("318301092", var_378_24)
						arg_375_1:RecordAudio("318301092", var_378_24)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_318301", "318301092", "story_v_out_318301.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_318301", "318301092", "story_v_out_318301.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_25 = math.max(var_378_16, arg_375_1.talkMaxDuration)

			if var_378_15 <= arg_375_1.time_ and arg_375_1.time_ < var_378_15 + var_378_25 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_15) / var_378_25

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_15 + var_378_25 and arg_375_1.time_ < var_378_15 + var_378_25 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play318301093 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 318301093
		arg_379_1.duration_ = 5.4

		local var_379_0 = {
			zh = 5.4,
			ja = 4.266
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
				arg_379_0:Play318301094(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0
			local var_382_1 = 0.475

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_2 = arg_379_1:FormatText(StoryNameCfg[562].name)

				arg_379_1.leftNameTxt_.text = var_382_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_3 = arg_379_1:GetWordFromCfg(318301093)
				local var_382_4 = arg_379_1:FormatText(var_382_3.content)

				arg_379_1.text_.text = var_382_4

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_5 = 19
				local var_382_6 = utf8.len(var_382_4)
				local var_382_7 = var_382_5 <= 0 and var_382_1 or var_382_1 * (var_382_6 / var_382_5)

				if var_382_7 > 0 and var_382_1 < var_382_7 then
					arg_379_1.talkMaxDuration = var_382_7

					if var_382_7 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_7 + var_382_0
					end
				end

				arg_379_1.text_.text = var_382_4
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301093", "story_v_out_318301.awb") ~= 0 then
					local var_382_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301093", "story_v_out_318301.awb") / 1000

					if var_382_8 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_8 + var_382_0
					end

					if var_382_3.prefab_name ~= "" and arg_379_1.actors_[var_382_3.prefab_name] ~= nil then
						local var_382_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_3.prefab_name].transform, "story_v_out_318301", "318301093", "story_v_out_318301.awb")

						arg_379_1:RecordAudio("318301093", var_382_9)
						arg_379_1:RecordAudio("318301093", var_382_9)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_318301", "318301093", "story_v_out_318301.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_318301", "318301093", "story_v_out_318301.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_10 = math.max(var_382_1, arg_379_1.talkMaxDuration)

			if var_382_0 <= arg_379_1.time_ and arg_379_1.time_ < var_382_0 + var_382_10 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_0) / var_382_10

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_0 + var_382_10 and arg_379_1.time_ < var_382_0 + var_382_10 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play318301094 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 318301094
		arg_383_1.duration_ = 9

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play318301095(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = "K02f"

			if arg_383_1.bgs_[var_386_0] == nil then
				local var_386_1 = Object.Instantiate(arg_383_1.paintGo_)

				var_386_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_386_0)
				var_386_1.name = var_386_0
				var_386_1.transform.parent = arg_383_1.stage_.transform
				var_386_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_383_1.bgs_[var_386_0] = var_386_1
			end

			local var_386_2 = 2

			if var_386_2 < arg_383_1.time_ and arg_383_1.time_ <= var_386_2 + arg_386_0 then
				local var_386_3 = manager.ui.mainCamera.transform.localPosition
				local var_386_4 = Vector3.New(0, 0, 10) + Vector3.New(var_386_3.x, var_386_3.y, 0)
				local var_386_5 = arg_383_1.bgs_.K02f

				var_386_5.transform.localPosition = var_386_4
				var_386_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_386_6 = var_386_5:GetComponent("SpriteRenderer")

				if var_386_6 and var_386_6.sprite then
					local var_386_7 = (var_386_5.transform.localPosition - var_386_3).z
					local var_386_8 = manager.ui.mainCameraCom_
					local var_386_9 = 2 * var_386_7 * Mathf.Tan(var_386_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_386_10 = var_386_9 * var_386_8.aspect
					local var_386_11 = var_386_6.sprite.bounds.size.x
					local var_386_12 = var_386_6.sprite.bounds.size.y
					local var_386_13 = var_386_10 / var_386_11
					local var_386_14 = var_386_9 / var_386_12
					local var_386_15 = var_386_14 < var_386_13 and var_386_13 or var_386_14

					var_386_5.transform.localScale = Vector3.New(var_386_15, var_386_15, 0)
				end

				for iter_386_0, iter_386_1 in pairs(arg_383_1.bgs_) do
					if iter_386_0 ~= "K02f" then
						iter_386_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_386_16 = 0

			if var_386_16 < arg_383_1.time_ and arg_383_1.time_ <= var_386_16 + arg_386_0 then
				arg_383_1.mask_.enabled = true
				arg_383_1.mask_.raycastTarget = true

				arg_383_1:SetGaussion(false)
			end

			local var_386_17 = 2

			if var_386_16 <= arg_383_1.time_ and arg_383_1.time_ < var_386_16 + var_386_17 then
				local var_386_18 = (arg_383_1.time_ - var_386_16) / var_386_17
				local var_386_19 = Color.New(0, 0, 0)

				var_386_19.a = Mathf.Lerp(0, 1, var_386_18)
				arg_383_1.mask_.color = var_386_19
			end

			if arg_383_1.time_ >= var_386_16 + var_386_17 and arg_383_1.time_ < var_386_16 + var_386_17 + arg_386_0 then
				local var_386_20 = Color.New(0, 0, 0)

				var_386_20.a = 1
				arg_383_1.mask_.color = var_386_20
			end

			local var_386_21 = 2

			if var_386_21 < arg_383_1.time_ and arg_383_1.time_ <= var_386_21 + arg_386_0 then
				arg_383_1.mask_.enabled = true
				arg_383_1.mask_.raycastTarget = true

				arg_383_1:SetGaussion(false)
			end

			local var_386_22 = 2

			if var_386_21 <= arg_383_1.time_ and arg_383_1.time_ < var_386_21 + var_386_22 then
				local var_386_23 = (arg_383_1.time_ - var_386_21) / var_386_22
				local var_386_24 = Color.New(0, 0, 0)

				var_386_24.a = Mathf.Lerp(1, 0, var_386_23)
				arg_383_1.mask_.color = var_386_24
			end

			if arg_383_1.time_ >= var_386_21 + var_386_22 and arg_383_1.time_ < var_386_21 + var_386_22 + arg_386_0 then
				local var_386_25 = Color.New(0, 0, 0)
				local var_386_26 = 0

				arg_383_1.mask_.enabled = false
				var_386_25.a = var_386_26
				arg_383_1.mask_.color = var_386_25
			end

			local var_386_27 = arg_383_1.actors_["1049ui_story"].transform
			local var_386_28 = 1.96599999815226

			if var_386_28 < arg_383_1.time_ and arg_383_1.time_ <= var_386_28 + arg_386_0 then
				arg_383_1.var_.moveOldPos1049ui_story = var_386_27.localPosition
			end

			local var_386_29 = 0.001

			if var_386_28 <= arg_383_1.time_ and arg_383_1.time_ < var_386_28 + var_386_29 then
				local var_386_30 = (arg_383_1.time_ - var_386_28) / var_386_29
				local var_386_31 = Vector3.New(0, 100, 0)

				var_386_27.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1049ui_story, var_386_31, var_386_30)

				local var_386_32 = manager.ui.mainCamera.transform.position - var_386_27.position

				var_386_27.forward = Vector3.New(var_386_32.x, var_386_32.y, var_386_32.z)

				local var_386_33 = var_386_27.localEulerAngles

				var_386_33.z = 0
				var_386_33.x = 0
				var_386_27.localEulerAngles = var_386_33
			end

			if arg_383_1.time_ >= var_386_28 + var_386_29 and arg_383_1.time_ < var_386_28 + var_386_29 + arg_386_0 then
				var_386_27.localPosition = Vector3.New(0, 100, 0)

				local var_386_34 = manager.ui.mainCamera.transform.position - var_386_27.position

				var_386_27.forward = Vector3.New(var_386_34.x, var_386_34.y, var_386_34.z)

				local var_386_35 = var_386_27.localEulerAngles

				var_386_35.z = 0
				var_386_35.x = 0
				var_386_27.localEulerAngles = var_386_35
			end

			local var_386_36 = arg_383_1.actors_["1049ui_story"]
			local var_386_37 = 1.96599999815226

			if var_386_37 < arg_383_1.time_ and arg_383_1.time_ <= var_386_37 + arg_386_0 and arg_383_1.var_.characterEffect1049ui_story == nil then
				arg_383_1.var_.characterEffect1049ui_story = var_386_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_38 = 0.0166666666666667

			if var_386_37 <= arg_383_1.time_ and arg_383_1.time_ < var_386_37 + var_386_38 then
				local var_386_39 = (arg_383_1.time_ - var_386_37) / var_386_38

				if arg_383_1.var_.characterEffect1049ui_story then
					local var_386_40 = Mathf.Lerp(0, 0.5, var_386_39)

					arg_383_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_383_1.var_.characterEffect1049ui_story.fillRatio = var_386_40
				end
			end

			if arg_383_1.time_ >= var_386_37 + var_386_38 and arg_383_1.time_ < var_386_37 + var_386_38 + arg_386_0 and arg_383_1.var_.characterEffect1049ui_story then
				local var_386_41 = 0.5

				arg_383_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_383_1.var_.characterEffect1049ui_story.fillRatio = var_386_41
			end

			if arg_383_1.frameCnt_ <= 1 then
				arg_383_1.dialog_:SetActive(false)
			end

			local var_386_42 = 4
			local var_386_43 = 0.5

			if var_386_42 < arg_383_1.time_ and arg_383_1.time_ <= var_386_42 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0

				arg_383_1.dialog_:SetActive(true)

				local var_386_44 = LeanTween.value(arg_383_1.dialog_, 0, 1, 0.3)

				var_386_44:setOnUpdate(LuaHelper.FloatAction(function(arg_387_0)
					arg_383_1.dialogCg_.alpha = arg_387_0
				end))
				var_386_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_383_1.dialog_)
					var_386_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_383_1.duration_ = arg_383_1.duration_ + 0.3

				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_45 = arg_383_1:GetWordFromCfg(318301094)
				local var_386_46 = arg_383_1:FormatText(var_386_45.content)

				arg_383_1.text_.text = var_386_46

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_47 = 20
				local var_386_48 = utf8.len(var_386_46)
				local var_386_49 = var_386_47 <= 0 and var_386_43 or var_386_43 * (var_386_48 / var_386_47)

				if var_386_49 > 0 and var_386_43 < var_386_49 then
					arg_383_1.talkMaxDuration = var_386_49
					var_386_42 = var_386_42 + 0.3

					if var_386_49 + var_386_42 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_49 + var_386_42
					end
				end

				arg_383_1.text_.text = var_386_46
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_50 = var_386_42 + 0.3
			local var_386_51 = math.max(var_386_43, arg_383_1.talkMaxDuration)

			if var_386_50 <= arg_383_1.time_ and arg_383_1.time_ < var_386_50 + var_386_51 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_50) / var_386_51

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_50 + var_386_51 and arg_383_1.time_ < var_386_50 + var_386_51 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play318301095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 318301095
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play318301096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 0.35

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, false)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_2 = arg_389_1:GetWordFromCfg(318301095)
				local var_392_3 = arg_389_1:FormatText(var_392_2.content)

				arg_389_1.text_.text = var_392_3

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_4 = 14
				local var_392_5 = utf8.len(var_392_3)
				local var_392_6 = var_392_4 <= 0 and var_392_1 or var_392_1 * (var_392_5 / var_392_4)

				if var_392_6 > 0 and var_392_1 < var_392_6 then
					arg_389_1.talkMaxDuration = var_392_6

					if var_392_6 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_6 + var_392_0
					end
				end

				arg_389_1.text_.text = var_392_3
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_7 = math.max(var_392_1, arg_389_1.talkMaxDuration)

			if var_392_0 <= arg_389_1.time_ and arg_389_1.time_ < var_392_0 + var_392_7 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_0) / var_392_7

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_0 + var_392_7 and arg_389_1.time_ < var_392_0 + var_392_7 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play318301096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 318301096
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play318301097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 0.825

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, false)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_2 = arg_393_1:GetWordFromCfg(318301096)
				local var_396_3 = arg_393_1:FormatText(var_396_2.content)

				arg_393_1.text_.text = var_396_3

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_4 = 33
				local var_396_5 = utf8.len(var_396_3)
				local var_396_6 = var_396_4 <= 0 and var_396_1 or var_396_1 * (var_396_5 / var_396_4)

				if var_396_6 > 0 and var_396_1 < var_396_6 then
					arg_393_1.talkMaxDuration = var_396_6

					if var_396_6 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_6 + var_396_0
					end
				end

				arg_393_1.text_.text = var_396_3
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_7 = math.max(var_396_1, arg_393_1.talkMaxDuration)

			if var_396_0 <= arg_393_1.time_ and arg_393_1.time_ < var_396_0 + var_396_7 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_0) / var_396_7

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_0 + var_396_7 and arg_393_1.time_ < var_396_0 + var_396_7 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play318301097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 318301097
		arg_397_1.duration_ = 2.533

		local var_397_0 = {
			zh = 2.5,
			ja = 2.533
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
				arg_397_0:Play318301098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = "1058ui_story"

			if arg_397_1.actors_[var_400_0] == nil then
				local var_400_1 = Object.Instantiate(Asset.Load("Char/" .. var_400_0), arg_397_1.stage_.transform)

				var_400_1.name = var_400_0
				var_400_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_397_1.actors_[var_400_0] = var_400_1

				local var_400_2 = var_400_1:GetComponentInChildren(typeof(CharacterEffect))

				var_400_2.enabled = true

				local var_400_3 = GameObjectTools.GetOrAddComponent(var_400_1, typeof(DynamicBoneHelper))

				if var_400_3 then
					var_400_3:EnableDynamicBone(false)
				end

				arg_397_1:ShowWeapon(var_400_2.transform, false)

				arg_397_1.var_[var_400_0 .. "Animator"] = var_400_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_397_1.var_[var_400_0 .. "Animator"].applyRootMotion = true
				arg_397_1.var_[var_400_0 .. "LipSync"] = var_400_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_400_4 = arg_397_1.actors_["1058ui_story"].transform
			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 then
				arg_397_1.var_.moveOldPos1058ui_story = var_400_4.localPosition
			end

			local var_400_6 = 0.001

			if var_400_5 <= arg_397_1.time_ and arg_397_1.time_ < var_400_5 + var_400_6 then
				local var_400_7 = (arg_397_1.time_ - var_400_5) / var_400_6
				local var_400_8 = Vector3.New(0, -0.95, -5.88)

				var_400_4.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1058ui_story, var_400_8, var_400_7)

				local var_400_9 = manager.ui.mainCamera.transform.position - var_400_4.position

				var_400_4.forward = Vector3.New(var_400_9.x, var_400_9.y, var_400_9.z)

				local var_400_10 = var_400_4.localEulerAngles

				var_400_10.z = 0
				var_400_10.x = 0
				var_400_4.localEulerAngles = var_400_10
			end

			if arg_397_1.time_ >= var_400_5 + var_400_6 and arg_397_1.time_ < var_400_5 + var_400_6 + arg_400_0 then
				var_400_4.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_400_11 = manager.ui.mainCamera.transform.position - var_400_4.position

				var_400_4.forward = Vector3.New(var_400_11.x, var_400_11.y, var_400_11.z)

				local var_400_12 = var_400_4.localEulerAngles

				var_400_12.z = 0
				var_400_12.x = 0
				var_400_4.localEulerAngles = var_400_12
			end

			local var_400_13 = arg_397_1.actors_["1058ui_story"]
			local var_400_14 = 0

			if var_400_14 < arg_397_1.time_ and arg_397_1.time_ <= var_400_14 + arg_400_0 and arg_397_1.var_.characterEffect1058ui_story == nil then
				arg_397_1.var_.characterEffect1058ui_story = var_400_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_15 = 0.200000002980232

			if var_400_14 <= arg_397_1.time_ and arg_397_1.time_ < var_400_14 + var_400_15 then
				local var_400_16 = (arg_397_1.time_ - var_400_14) / var_400_15

				if arg_397_1.var_.characterEffect1058ui_story then
					arg_397_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_14 + var_400_15 and arg_397_1.time_ < var_400_14 + var_400_15 + arg_400_0 and arg_397_1.var_.characterEffect1058ui_story then
				arg_397_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_400_17 = 0

			if var_400_17 < arg_397_1.time_ and arg_397_1.time_ <= var_400_17 + arg_400_0 then
				arg_397_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_400_18 = 0

			if var_400_18 < arg_397_1.time_ and arg_397_1.time_ <= var_400_18 + arg_400_0 then
				arg_397_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_400_19 = 0
			local var_400_20 = 0.225

			if var_400_19 < arg_397_1.time_ and arg_397_1.time_ <= var_400_19 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_21 = arg_397_1:FormatText(StoryNameCfg[92].name)

				arg_397_1.leftNameTxt_.text = var_400_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_22 = arg_397_1:GetWordFromCfg(318301097)
				local var_400_23 = arg_397_1:FormatText(var_400_22.content)

				arg_397_1.text_.text = var_400_23

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_24 = 9
				local var_400_25 = utf8.len(var_400_23)
				local var_400_26 = var_400_24 <= 0 and var_400_20 or var_400_20 * (var_400_25 / var_400_24)

				if var_400_26 > 0 and var_400_20 < var_400_26 then
					arg_397_1.talkMaxDuration = var_400_26

					if var_400_26 + var_400_19 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_26 + var_400_19
					end
				end

				arg_397_1.text_.text = var_400_23
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301097", "story_v_out_318301.awb") ~= 0 then
					local var_400_27 = manager.audio:GetVoiceLength("story_v_out_318301", "318301097", "story_v_out_318301.awb") / 1000

					if var_400_27 + var_400_19 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_27 + var_400_19
					end

					if var_400_22.prefab_name ~= "" and arg_397_1.actors_[var_400_22.prefab_name] ~= nil then
						local var_400_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_22.prefab_name].transform, "story_v_out_318301", "318301097", "story_v_out_318301.awb")

						arg_397_1:RecordAudio("318301097", var_400_28)
						arg_397_1:RecordAudio("318301097", var_400_28)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_318301", "318301097", "story_v_out_318301.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_318301", "318301097", "story_v_out_318301.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_29 = math.max(var_400_20, arg_397_1.talkMaxDuration)

			if var_400_19 <= arg_397_1.time_ and arg_397_1.time_ < var_400_19 + var_400_29 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_19) / var_400_29

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_19 + var_400_29 and arg_397_1.time_ < var_400_19 + var_400_29 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play318301098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 318301098
		arg_401_1.duration_ = 6.5

		local var_401_0 = {
			zh = 4.8,
			ja = 6.5
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
				arg_401_0:Play318301099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1058ui_story"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1058ui_story = var_404_0.localPosition
			end

			local var_404_2 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2
				local var_404_4 = Vector3.New(0, -0.95, -5.88)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1058ui_story, var_404_4, var_404_3)

				local var_404_5 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_5.x, var_404_5.y, var_404_5.z)

				local var_404_6 = var_404_0.localEulerAngles

				var_404_6.z = 0
				var_404_6.x = 0
				var_404_0.localEulerAngles = var_404_6
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_404_7 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_7.x, var_404_7.y, var_404_7.z)

				local var_404_8 = var_404_0.localEulerAngles

				var_404_8.z = 0
				var_404_8.x = 0
				var_404_0.localEulerAngles = var_404_8
			end

			local var_404_9 = arg_401_1.actors_["1058ui_story"]
			local var_404_10 = 0

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 and arg_401_1.var_.characterEffect1058ui_story == nil then
				arg_401_1.var_.characterEffect1058ui_story = var_404_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_11 = 0.200000002980232

			if var_404_10 <= arg_401_1.time_ and arg_401_1.time_ < var_404_10 + var_404_11 then
				local var_404_12 = (arg_401_1.time_ - var_404_10) / var_404_11

				if arg_401_1.var_.characterEffect1058ui_story then
					arg_401_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_10 + var_404_11 and arg_401_1.time_ < var_404_10 + var_404_11 + arg_404_0 and arg_401_1.var_.characterEffect1058ui_story then
				arg_401_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_404_13 = 0

			if var_404_13 < arg_401_1.time_ and arg_401_1.time_ <= var_404_13 + arg_404_0 then
				arg_401_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action2_1")
			end

			local var_404_14 = 0

			if var_404_14 < arg_401_1.time_ and arg_401_1.time_ <= var_404_14 + arg_404_0 then
				arg_401_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_404_15 = 0
			local var_404_16 = 0.5

			if var_404_15 < arg_401_1.time_ and arg_401_1.time_ <= var_404_15 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_17 = arg_401_1:FormatText(StoryNameCfg[92].name)

				arg_401_1.leftNameTxt_.text = var_404_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_18 = arg_401_1:GetWordFromCfg(318301098)
				local var_404_19 = arg_401_1:FormatText(var_404_18.content)

				arg_401_1.text_.text = var_404_19

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_20 = 20
				local var_404_21 = utf8.len(var_404_19)
				local var_404_22 = var_404_20 <= 0 and var_404_16 or var_404_16 * (var_404_21 / var_404_20)

				if var_404_22 > 0 and var_404_16 < var_404_22 then
					arg_401_1.talkMaxDuration = var_404_22

					if var_404_22 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_22 + var_404_15
					end
				end

				arg_401_1.text_.text = var_404_19
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301098", "story_v_out_318301.awb") ~= 0 then
					local var_404_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301098", "story_v_out_318301.awb") / 1000

					if var_404_23 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_23 + var_404_15
					end

					if var_404_18.prefab_name ~= "" and arg_401_1.actors_[var_404_18.prefab_name] ~= nil then
						local var_404_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_18.prefab_name].transform, "story_v_out_318301", "318301098", "story_v_out_318301.awb")

						arg_401_1:RecordAudio("318301098", var_404_24)
						arg_401_1:RecordAudio("318301098", var_404_24)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_318301", "318301098", "story_v_out_318301.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_318301", "318301098", "story_v_out_318301.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_25 = math.max(var_404_16, arg_401_1.talkMaxDuration)

			if var_404_15 <= arg_401_1.time_ and arg_401_1.time_ < var_404_15 + var_404_25 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_15) / var_404_25

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_15 + var_404_25 and arg_401_1.time_ < var_404_15 + var_404_25 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play318301099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 318301099
		arg_405_1.duration_ = 3.7

		local var_405_0 = {
			zh = 3.6,
			ja = 3.7
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
				arg_405_0:Play318301100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action2_2")
			end

			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_408_2 = 0
			local var_408_3 = 0.4

			if var_408_2 < arg_405_1.time_ and arg_405_1.time_ <= var_408_2 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_4 = arg_405_1:FormatText(StoryNameCfg[92].name)

				arg_405_1.leftNameTxt_.text = var_408_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_5 = arg_405_1:GetWordFromCfg(318301099)
				local var_408_6 = arg_405_1:FormatText(var_408_5.content)

				arg_405_1.text_.text = var_408_6

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_7 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301099", "story_v_out_318301.awb") ~= 0 then
					local var_408_10 = manager.audio:GetVoiceLength("story_v_out_318301", "318301099", "story_v_out_318301.awb") / 1000

					if var_408_10 + var_408_2 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_10 + var_408_2
					end

					if var_408_5.prefab_name ~= "" and arg_405_1.actors_[var_408_5.prefab_name] ~= nil then
						local var_408_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_5.prefab_name].transform, "story_v_out_318301", "318301099", "story_v_out_318301.awb")

						arg_405_1:RecordAudio("318301099", var_408_11)
						arg_405_1:RecordAudio("318301099", var_408_11)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_318301", "318301099", "story_v_out_318301.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_318301", "318301099", "story_v_out_318301.awb")
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
	Play318301100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 318301100
		arg_409_1.duration_ = 5

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play318301101(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1058ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1058ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(0, 100, 0)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1058ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, 100, 0)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["1058ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect1058ui_story == nil then
				arg_409_1.var_.characterEffect1058ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect1058ui_story then
					local var_412_13 = Mathf.Lerp(0, 0.5, var_412_12)

					arg_409_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1058ui_story.fillRatio = var_412_13
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect1058ui_story then
				local var_412_14 = 0.5

				arg_409_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1058ui_story.fillRatio = var_412_14
			end

			local var_412_15 = 0
			local var_412_16 = 0.875

			if var_412_15 < arg_409_1.time_ and arg_409_1.time_ <= var_412_15 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, false)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_17 = arg_409_1:GetWordFromCfg(318301100)
				local var_412_18 = arg_409_1:FormatText(var_412_17.content)

				arg_409_1.text_.text = var_412_18

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_19 = 35
				local var_412_20 = utf8.len(var_412_18)
				local var_412_21 = var_412_19 <= 0 and var_412_16 or var_412_16 * (var_412_20 / var_412_19)

				if var_412_21 > 0 and var_412_16 < var_412_21 then
					arg_409_1.talkMaxDuration = var_412_21

					if var_412_21 + var_412_15 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_21 + var_412_15
					end
				end

				arg_409_1.text_.text = var_412_18
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)
				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_22 = math.max(var_412_16, arg_409_1.talkMaxDuration)

			if var_412_15 <= arg_409_1.time_ and arg_409_1.time_ < var_412_15 + var_412_22 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_15) / var_412_22

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_15 + var_412_22 and arg_409_1.time_ < var_412_15 + var_412_22 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play318301101 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 318301101
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play318301102(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0
			local var_416_1 = 0.875

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, false)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_2 = arg_413_1:GetWordFromCfg(318301101)
				local var_416_3 = arg_413_1:FormatText(var_416_2.content)

				arg_413_1.text_.text = var_416_3

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_4 = 35
				local var_416_5 = utf8.len(var_416_3)
				local var_416_6 = var_416_4 <= 0 and var_416_1 or var_416_1 * (var_416_5 / var_416_4)

				if var_416_6 > 0 and var_416_1 < var_416_6 then
					arg_413_1.talkMaxDuration = var_416_6

					if var_416_6 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_6 + var_416_0
					end
				end

				arg_413_1.text_.text = var_416_3
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_7 = math.max(var_416_1, arg_413_1.talkMaxDuration)

			if var_416_0 <= arg_413_1.time_ and arg_413_1.time_ < var_416_0 + var_416_7 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_0) / var_416_7

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_0 + var_416_7 and arg_413_1.time_ < var_416_0 + var_416_7 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play318301102 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 318301102
		arg_417_1.duration_ = 1.999999999999

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play318301103(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1058ui_story"].transform
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.var_.moveOldPos1058ui_story = var_420_0.localPosition
			end

			local var_420_2 = 0.001

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2
				local var_420_4 = Vector3.New(0, -0.95, -5.88)

				var_420_0.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1058ui_story, var_420_4, var_420_3)

				local var_420_5 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_5.x, var_420_5.y, var_420_5.z)

				local var_420_6 = var_420_0.localEulerAngles

				var_420_6.z = 0
				var_420_6.x = 0
				var_420_0.localEulerAngles = var_420_6
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 then
				var_420_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_420_7 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_7.x, var_420_7.y, var_420_7.z)

				local var_420_8 = var_420_0.localEulerAngles

				var_420_8.z = 0
				var_420_8.x = 0
				var_420_0.localEulerAngles = var_420_8
			end

			local var_420_9 = arg_417_1.actors_["1058ui_story"]
			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 and arg_417_1.var_.characterEffect1058ui_story == nil then
				arg_417_1.var_.characterEffect1058ui_story = var_420_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_11 = 0.200000002980232

			if var_420_10 <= arg_417_1.time_ and arg_417_1.time_ < var_420_10 + var_420_11 then
				local var_420_12 = (arg_417_1.time_ - var_420_10) / var_420_11

				if arg_417_1.var_.characterEffect1058ui_story then
					arg_417_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_10 + var_420_11 and arg_417_1.time_ < var_420_10 + var_420_11 + arg_420_0 and arg_417_1.var_.characterEffect1058ui_story then
				arg_417_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_420_13 = 0

			if var_420_13 < arg_417_1.time_ and arg_417_1.time_ <= var_420_13 + arg_420_0 then
				arg_417_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_420_14 = 0

			if var_420_14 < arg_417_1.time_ and arg_417_1.time_ <= var_420_14 + arg_420_0 then
				arg_417_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_420_15 = 0
			local var_420_16 = 0.125

			if var_420_15 < arg_417_1.time_ and arg_417_1.time_ <= var_420_15 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_17 = arg_417_1:FormatText(StoryNameCfg[92].name)

				arg_417_1.leftNameTxt_.text = var_420_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_18 = arg_417_1:GetWordFromCfg(318301102)
				local var_420_19 = arg_417_1:FormatText(var_420_18.content)

				arg_417_1.text_.text = var_420_19

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_20 = 5
				local var_420_21 = utf8.len(var_420_19)
				local var_420_22 = var_420_20 <= 0 and var_420_16 or var_420_16 * (var_420_21 / var_420_20)

				if var_420_22 > 0 and var_420_16 < var_420_22 then
					arg_417_1.talkMaxDuration = var_420_22

					if var_420_22 + var_420_15 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_22 + var_420_15
					end
				end

				arg_417_1.text_.text = var_420_19
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301102", "story_v_out_318301.awb") ~= 0 then
					local var_420_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301102", "story_v_out_318301.awb") / 1000

					if var_420_23 + var_420_15 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_23 + var_420_15
					end

					if var_420_18.prefab_name ~= "" and arg_417_1.actors_[var_420_18.prefab_name] ~= nil then
						local var_420_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_18.prefab_name].transform, "story_v_out_318301", "318301102", "story_v_out_318301.awb")

						arg_417_1:RecordAudio("318301102", var_420_24)
						arg_417_1:RecordAudio("318301102", var_420_24)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_318301", "318301102", "story_v_out_318301.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_318301", "318301102", "story_v_out_318301.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_25 = math.max(var_420_16, arg_417_1.talkMaxDuration)

			if var_420_15 <= arg_417_1.time_ and arg_417_1.time_ < var_420_15 + var_420_25 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_15) / var_420_25

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_15 + var_420_25 and arg_417_1.time_ < var_420_15 + var_420_25 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play318301103 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 318301103
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play318301104(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1058ui_story"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos1058ui_story = var_424_0.localPosition
			end

			local var_424_2 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2
				local var_424_4 = Vector3.New(0, 100, 0)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1058ui_story, var_424_4, var_424_3)

				local var_424_5 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_5.x, var_424_5.y, var_424_5.z)

				local var_424_6 = var_424_0.localEulerAngles

				var_424_6.z = 0
				var_424_6.x = 0
				var_424_0.localEulerAngles = var_424_6
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(0, 100, 0)

				local var_424_7 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_7.x, var_424_7.y, var_424_7.z)

				local var_424_8 = var_424_0.localEulerAngles

				var_424_8.z = 0
				var_424_8.x = 0
				var_424_0.localEulerAngles = var_424_8
			end

			local var_424_9 = arg_421_1.actors_["1058ui_story"]
			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 and arg_421_1.var_.characterEffect1058ui_story == nil then
				arg_421_1.var_.characterEffect1058ui_story = var_424_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_11 = 0.200000002980232

			if var_424_10 <= arg_421_1.time_ and arg_421_1.time_ < var_424_10 + var_424_11 then
				local var_424_12 = (arg_421_1.time_ - var_424_10) / var_424_11

				if arg_421_1.var_.characterEffect1058ui_story then
					local var_424_13 = Mathf.Lerp(0, 0.5, var_424_12)

					arg_421_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1058ui_story.fillRatio = var_424_13
				end
			end

			if arg_421_1.time_ >= var_424_10 + var_424_11 and arg_421_1.time_ < var_424_10 + var_424_11 + arg_424_0 and arg_421_1.var_.characterEffect1058ui_story then
				local var_424_14 = 0.5

				arg_421_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1058ui_story.fillRatio = var_424_14
			end

			local var_424_15 = 0
			local var_424_16 = 0.575

			if var_424_15 < arg_421_1.time_ and arg_421_1.time_ <= var_424_15 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_17 = arg_421_1:GetWordFromCfg(318301103)
				local var_424_18 = arg_421_1:FormatText(var_424_17.content)

				arg_421_1.text_.text = var_424_18

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_19 = 23
				local var_424_20 = utf8.len(var_424_18)
				local var_424_21 = var_424_19 <= 0 and var_424_16 or var_424_16 * (var_424_20 / var_424_19)

				if var_424_21 > 0 and var_424_16 < var_424_21 then
					arg_421_1.talkMaxDuration = var_424_21

					if var_424_21 + var_424_15 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_21 + var_424_15
					end
				end

				arg_421_1.text_.text = var_424_18
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_22 = math.max(var_424_16, arg_421_1.talkMaxDuration)

			if var_424_15 <= arg_421_1.time_ and arg_421_1.time_ < var_424_15 + var_424_22 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_15) / var_424_22

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_15 + var_424_22 and arg_421_1.time_ < var_424_15 + var_424_22 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play318301104 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 318301104
		arg_425_1.duration_ = 2.7

		local var_425_0 = {
			zh = 2.6,
			ja = 2.7
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
				arg_425_0:Play318301105(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1058ui_story"].transform
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				arg_425_1.var_.moveOldPos1058ui_story = var_428_0.localPosition
			end

			local var_428_2 = 0.001

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2
				local var_428_4 = Vector3.New(0, -0.95, -5.88)

				var_428_0.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1058ui_story, var_428_4, var_428_3)

				local var_428_5 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_5.x, var_428_5.y, var_428_5.z)

				local var_428_6 = var_428_0.localEulerAngles

				var_428_6.z = 0
				var_428_6.x = 0
				var_428_0.localEulerAngles = var_428_6
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 then
				var_428_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_428_7 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_7.x, var_428_7.y, var_428_7.z)

				local var_428_8 = var_428_0.localEulerAngles

				var_428_8.z = 0
				var_428_8.x = 0
				var_428_0.localEulerAngles = var_428_8
			end

			local var_428_9 = arg_425_1.actors_["1058ui_story"]
			local var_428_10 = 0

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 and arg_425_1.var_.characterEffect1058ui_story == nil then
				arg_425_1.var_.characterEffect1058ui_story = var_428_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_11 = 0.200000002980232

			if var_428_10 <= arg_425_1.time_ and arg_425_1.time_ < var_428_10 + var_428_11 then
				local var_428_12 = (arg_425_1.time_ - var_428_10) / var_428_11

				if arg_425_1.var_.characterEffect1058ui_story then
					arg_425_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_10 + var_428_11 and arg_425_1.time_ < var_428_10 + var_428_11 + arg_428_0 and arg_425_1.var_.characterEffect1058ui_story then
				arg_425_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_428_13 = 0

			if var_428_13 < arg_425_1.time_ and arg_425_1.time_ <= var_428_13 + arg_428_0 then
				arg_425_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_428_14 = 0

			if var_428_14 < arg_425_1.time_ and arg_425_1.time_ <= var_428_14 + arg_428_0 then
				arg_425_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_428_15 = 0
			local var_428_16 = 0.175

			if var_428_15 < arg_425_1.time_ and arg_425_1.time_ <= var_428_15 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_17 = arg_425_1:FormatText(StoryNameCfg[92].name)

				arg_425_1.leftNameTxt_.text = var_428_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_18 = arg_425_1:GetWordFromCfg(318301104)
				local var_428_19 = arg_425_1:FormatText(var_428_18.content)

				arg_425_1.text_.text = var_428_19

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_20 = 7
				local var_428_21 = utf8.len(var_428_19)
				local var_428_22 = var_428_20 <= 0 and var_428_16 or var_428_16 * (var_428_21 / var_428_20)

				if var_428_22 > 0 and var_428_16 < var_428_22 then
					arg_425_1.talkMaxDuration = var_428_22

					if var_428_22 + var_428_15 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_22 + var_428_15
					end
				end

				arg_425_1.text_.text = var_428_19
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301104", "story_v_out_318301.awb") ~= 0 then
					local var_428_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301104", "story_v_out_318301.awb") / 1000

					if var_428_23 + var_428_15 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_23 + var_428_15
					end

					if var_428_18.prefab_name ~= "" and arg_425_1.actors_[var_428_18.prefab_name] ~= nil then
						local var_428_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_18.prefab_name].transform, "story_v_out_318301", "318301104", "story_v_out_318301.awb")

						arg_425_1:RecordAudio("318301104", var_428_24)
						arg_425_1:RecordAudio("318301104", var_428_24)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_318301", "318301104", "story_v_out_318301.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_318301", "318301104", "story_v_out_318301.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_25 = math.max(var_428_16, arg_425_1.talkMaxDuration)

			if var_428_15 <= arg_425_1.time_ and arg_425_1.time_ < var_428_15 + var_428_25 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_15) / var_428_25

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_15 + var_428_25 and arg_425_1.time_ < var_428_15 + var_428_25 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play318301105 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 318301105
		arg_429_1.duration_ = 9

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play318301106(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = "K06g"

			if arg_429_1.bgs_[var_432_0] == nil then
				local var_432_1 = Object.Instantiate(arg_429_1.paintGo_)

				var_432_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_432_0)
				var_432_1.name = var_432_0
				var_432_1.transform.parent = arg_429_1.stage_.transform
				var_432_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_429_1.bgs_[var_432_0] = var_432_1
			end

			local var_432_2 = 2

			if var_432_2 < arg_429_1.time_ and arg_429_1.time_ <= var_432_2 + arg_432_0 then
				local var_432_3 = manager.ui.mainCamera.transform.localPosition
				local var_432_4 = Vector3.New(0, 0, 10) + Vector3.New(var_432_3.x, var_432_3.y, 0)
				local var_432_5 = arg_429_1.bgs_.K06g

				var_432_5.transform.localPosition = var_432_4
				var_432_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_432_6 = var_432_5:GetComponent("SpriteRenderer")

				if var_432_6 and var_432_6.sprite then
					local var_432_7 = (var_432_5.transform.localPosition - var_432_3).z
					local var_432_8 = manager.ui.mainCameraCom_
					local var_432_9 = 2 * var_432_7 * Mathf.Tan(var_432_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_432_10 = var_432_9 * var_432_8.aspect
					local var_432_11 = var_432_6.sprite.bounds.size.x
					local var_432_12 = var_432_6.sprite.bounds.size.y
					local var_432_13 = var_432_10 / var_432_11
					local var_432_14 = var_432_9 / var_432_12
					local var_432_15 = var_432_14 < var_432_13 and var_432_13 or var_432_14

					var_432_5.transform.localScale = Vector3.New(var_432_15, var_432_15, 0)
				end

				for iter_432_0, iter_432_1 in pairs(arg_429_1.bgs_) do
					if iter_432_0 ~= "K06g" then
						iter_432_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_432_16 = 0

			if var_432_16 < arg_429_1.time_ and arg_429_1.time_ <= var_432_16 + arg_432_0 then
				arg_429_1.mask_.enabled = true
				arg_429_1.mask_.raycastTarget = true

				arg_429_1:SetGaussion(false)
			end

			local var_432_17 = 2

			if var_432_16 <= arg_429_1.time_ and arg_429_1.time_ < var_432_16 + var_432_17 then
				local var_432_18 = (arg_429_1.time_ - var_432_16) / var_432_17
				local var_432_19 = Color.New(0, 0, 0)

				var_432_19.a = Mathf.Lerp(0, 1, var_432_18)
				arg_429_1.mask_.color = var_432_19
			end

			if arg_429_1.time_ >= var_432_16 + var_432_17 and arg_429_1.time_ < var_432_16 + var_432_17 + arg_432_0 then
				local var_432_20 = Color.New(0, 0, 0)

				var_432_20.a = 1
				arg_429_1.mask_.color = var_432_20
			end

			local var_432_21 = 2

			if var_432_21 < arg_429_1.time_ and arg_429_1.time_ <= var_432_21 + arg_432_0 then
				arg_429_1.mask_.enabled = true
				arg_429_1.mask_.raycastTarget = true

				arg_429_1:SetGaussion(false)
			end

			local var_432_22 = 2

			if var_432_21 <= arg_429_1.time_ and arg_429_1.time_ < var_432_21 + var_432_22 then
				local var_432_23 = (arg_429_1.time_ - var_432_21) / var_432_22
				local var_432_24 = Color.New(0, 0, 0)

				var_432_24.a = Mathf.Lerp(1, 0, var_432_23)
				arg_429_1.mask_.color = var_432_24
			end

			if arg_429_1.time_ >= var_432_21 + var_432_22 and arg_429_1.time_ < var_432_21 + var_432_22 + arg_432_0 then
				local var_432_25 = Color.New(0, 0, 0)
				local var_432_26 = 0

				arg_429_1.mask_.enabled = false
				var_432_25.a = var_432_26
				arg_429_1.mask_.color = var_432_25
			end

			local var_432_27 = arg_429_1.actors_["1058ui_story"].transform
			local var_432_28 = 1.96599999815226

			if var_432_28 < arg_429_1.time_ and arg_429_1.time_ <= var_432_28 + arg_432_0 then
				arg_429_1.var_.moveOldPos1058ui_story = var_432_27.localPosition
			end

			local var_432_29 = 0.001

			if var_432_28 <= arg_429_1.time_ and arg_429_1.time_ < var_432_28 + var_432_29 then
				local var_432_30 = (arg_429_1.time_ - var_432_28) / var_432_29
				local var_432_31 = Vector3.New(0, 100, 0)

				var_432_27.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1058ui_story, var_432_31, var_432_30)

				local var_432_32 = manager.ui.mainCamera.transform.position - var_432_27.position

				var_432_27.forward = Vector3.New(var_432_32.x, var_432_32.y, var_432_32.z)

				local var_432_33 = var_432_27.localEulerAngles

				var_432_33.z = 0
				var_432_33.x = 0
				var_432_27.localEulerAngles = var_432_33
			end

			if arg_429_1.time_ >= var_432_28 + var_432_29 and arg_429_1.time_ < var_432_28 + var_432_29 + arg_432_0 then
				var_432_27.localPosition = Vector3.New(0, 100, 0)

				local var_432_34 = manager.ui.mainCamera.transform.position - var_432_27.position

				var_432_27.forward = Vector3.New(var_432_34.x, var_432_34.y, var_432_34.z)

				local var_432_35 = var_432_27.localEulerAngles

				var_432_35.z = 0
				var_432_35.x = 0
				var_432_27.localEulerAngles = var_432_35
			end

			local var_432_36 = arg_429_1.actors_["1058ui_story"]
			local var_432_37 = 1.96599999815226

			if var_432_37 < arg_429_1.time_ and arg_429_1.time_ <= var_432_37 + arg_432_0 and arg_429_1.var_.characterEffect1058ui_story == nil then
				arg_429_1.var_.characterEffect1058ui_story = var_432_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_38 = 0.034000001847744

			if var_432_37 <= arg_429_1.time_ and arg_429_1.time_ < var_432_37 + var_432_38 then
				local var_432_39 = (arg_429_1.time_ - var_432_37) / var_432_38

				if arg_429_1.var_.characterEffect1058ui_story then
					local var_432_40 = Mathf.Lerp(0, 0.5, var_432_39)

					arg_429_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1058ui_story.fillRatio = var_432_40
				end
			end

			if arg_429_1.time_ >= var_432_37 + var_432_38 and arg_429_1.time_ < var_432_37 + var_432_38 + arg_432_0 and arg_429_1.var_.characterEffect1058ui_story then
				local var_432_41 = 0.5

				arg_429_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1058ui_story.fillRatio = var_432_41
			end

			local var_432_42 = 3.23333333333333
			local var_432_43 = 1

			if var_432_42 < arg_429_1.time_ and arg_429_1.time_ <= var_432_42 + arg_432_0 then
				local var_432_44 = "play"
				local var_432_45 = "effect"

				arg_429_1:AudioAction(var_432_44, var_432_45, "se_story_221_00", "se_story_221_00_firework_loop", "")
			end

			if arg_429_1.frameCnt_ <= 1 then
				arg_429_1.dialog_:SetActive(false)
			end

			local var_432_46 = 4
			local var_432_47 = 1.35

			if var_432_46 < arg_429_1.time_ and arg_429_1.time_ <= var_432_46 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0

				arg_429_1.dialog_:SetActive(true)

				local var_432_48 = LeanTween.value(arg_429_1.dialog_, 0, 1, 0.3)

				var_432_48:setOnUpdate(LuaHelper.FloatAction(function(arg_433_0)
					arg_429_1.dialogCg_.alpha = arg_433_0
				end))
				var_432_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_429_1.dialog_)
					var_432_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_429_1.duration_ = arg_429_1.duration_ + 0.3

				SetActive(arg_429_1.leftNameGo_, false)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_49 = arg_429_1:GetWordFromCfg(318301105)
				local var_432_50 = arg_429_1:FormatText(var_432_49.content)

				arg_429_1.text_.text = var_432_50

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_51 = 54
				local var_432_52 = utf8.len(var_432_50)
				local var_432_53 = var_432_51 <= 0 and var_432_47 or var_432_47 * (var_432_52 / var_432_51)

				if var_432_53 > 0 and var_432_47 < var_432_53 then
					arg_429_1.talkMaxDuration = var_432_53
					var_432_46 = var_432_46 + 0.3

					if var_432_53 + var_432_46 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_53 + var_432_46
					end
				end

				arg_429_1.text_.text = var_432_50
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_54 = var_432_46 + 0.3
			local var_432_55 = math.max(var_432_47, arg_429_1.talkMaxDuration)

			if var_432_54 <= arg_429_1.time_ and arg_429_1.time_ < var_432_54 + var_432_55 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_54) / var_432_55

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_54 + var_432_55 and arg_429_1.time_ < var_432_54 + var_432_55 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play318301106 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 318301106
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play318301107(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.533333333333333

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				local var_438_2 = "play"
				local var_438_3 = "effect"

				arg_435_1:AudioAction(var_438_2, var_438_3, "se_story_221_00", "se_story_221_00_firework", "")
			end

			local var_438_4 = 0
			local var_438_5 = 0.775

			if var_438_4 < arg_435_1.time_ and arg_435_1.time_ <= var_438_4 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_6 = arg_435_1:GetWordFromCfg(318301106)
				local var_438_7 = arg_435_1:FormatText(var_438_6.content)

				arg_435_1.text_.text = var_438_7

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_8 = 31
				local var_438_9 = utf8.len(var_438_7)
				local var_438_10 = var_438_8 <= 0 and var_438_5 or var_438_5 * (var_438_9 / var_438_8)

				if var_438_10 > 0 and var_438_5 < var_438_10 then
					arg_435_1.talkMaxDuration = var_438_10

					if var_438_10 + var_438_4 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_10 + var_438_4
					end
				end

				arg_435_1.text_.text = var_438_7
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_11 = math.max(var_438_5, arg_435_1.talkMaxDuration)

			if var_438_4 <= arg_435_1.time_ and arg_435_1.time_ < var_438_4 + var_438_11 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_4) / var_438_11

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_4 + var_438_11 and arg_435_1.time_ < var_438_4 + var_438_11 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play318301107 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 318301107
		arg_439_1.duration_ = 4.7

		local var_439_0 = {
			zh = 3.2,
			ja = 4.7
		}
		local var_439_1 = manager.audio:GetLocalizationFlag()

		if var_439_0[var_439_1] ~= nil then
			arg_439_1.duration_ = var_439_0[var_439_1]
		end

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play318301108(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1055ui_story"].transform
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1.var_.moveOldPos1055ui_story = var_442_0.localPosition
			end

			local var_442_2 = 0.001

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2
				local var_442_4 = Vector3.New(0, -0.965, -6.2)

				var_442_0.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1055ui_story, var_442_4, var_442_3)

				local var_442_5 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_5.x, var_442_5.y, var_442_5.z)

				local var_442_6 = var_442_0.localEulerAngles

				var_442_6.z = 0
				var_442_6.x = 0
				var_442_0.localEulerAngles = var_442_6
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 then
				var_442_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_442_7 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_7.x, var_442_7.y, var_442_7.z)

				local var_442_8 = var_442_0.localEulerAngles

				var_442_8.z = 0
				var_442_8.x = 0
				var_442_0.localEulerAngles = var_442_8
			end

			local var_442_9 = arg_439_1.actors_["1055ui_story"]
			local var_442_10 = 0

			if var_442_10 < arg_439_1.time_ and arg_439_1.time_ <= var_442_10 + arg_442_0 and arg_439_1.var_.characterEffect1055ui_story == nil then
				arg_439_1.var_.characterEffect1055ui_story = var_442_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_11 = 0.200000002980232

			if var_442_10 <= arg_439_1.time_ and arg_439_1.time_ < var_442_10 + var_442_11 then
				local var_442_12 = (arg_439_1.time_ - var_442_10) / var_442_11

				if arg_439_1.var_.characterEffect1055ui_story then
					arg_439_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_10 + var_442_11 and arg_439_1.time_ < var_442_10 + var_442_11 + arg_442_0 and arg_439_1.var_.characterEffect1055ui_story then
				arg_439_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_442_13 = 0

			if var_442_13 < arg_439_1.time_ and arg_439_1.time_ <= var_442_13 + arg_442_0 then
				arg_439_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_442_14 = 0

			if var_442_14 < arg_439_1.time_ and arg_439_1.time_ <= var_442_14 + arg_442_0 then
				arg_439_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_442_15 = 0
			local var_442_16 = 0.4

			if var_442_15 < arg_439_1.time_ and arg_439_1.time_ <= var_442_15 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_17 = arg_439_1:FormatText(StoryNameCfg[481].name)

				arg_439_1.leftNameTxt_.text = var_442_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_18 = arg_439_1:GetWordFromCfg(318301107)
				local var_442_19 = arg_439_1:FormatText(var_442_18.content)

				arg_439_1.text_.text = var_442_19

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_20 = 16
				local var_442_21 = utf8.len(var_442_19)
				local var_442_22 = var_442_20 <= 0 and var_442_16 or var_442_16 * (var_442_21 / var_442_20)

				if var_442_22 > 0 and var_442_16 < var_442_22 then
					arg_439_1.talkMaxDuration = var_442_22

					if var_442_22 + var_442_15 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_22 + var_442_15
					end
				end

				arg_439_1.text_.text = var_442_19
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301107", "story_v_out_318301.awb") ~= 0 then
					local var_442_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301107", "story_v_out_318301.awb") / 1000

					if var_442_23 + var_442_15 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_23 + var_442_15
					end

					if var_442_18.prefab_name ~= "" and arg_439_1.actors_[var_442_18.prefab_name] ~= nil then
						local var_442_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_18.prefab_name].transform, "story_v_out_318301", "318301107", "story_v_out_318301.awb")

						arg_439_1:RecordAudio("318301107", var_442_24)
						arg_439_1:RecordAudio("318301107", var_442_24)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_318301", "318301107", "story_v_out_318301.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_318301", "318301107", "story_v_out_318301.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_25 = math.max(var_442_16, arg_439_1.talkMaxDuration)

			if var_442_15 <= arg_439_1.time_ and arg_439_1.time_ < var_442_15 + var_442_25 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_15) / var_442_25

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_15 + var_442_25 and arg_439_1.time_ < var_442_15 + var_442_25 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play318301108 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 318301108
		arg_443_1.duration_ = 5.466

		local var_443_0 = {
			zh = 5.466,
			ja = 2.9
		}
		local var_443_1 = manager.audio:GetLocalizationFlag()

		if var_443_0[var_443_1] ~= nil then
			arg_443_1.duration_ = var_443_0[var_443_1]
		end

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play318301109(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_446_2 = 0
			local var_446_3 = 0.45

			if var_446_2 < arg_443_1.time_ and arg_443_1.time_ <= var_446_2 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_4 = arg_443_1:FormatText(StoryNameCfg[481].name)

				arg_443_1.leftNameTxt_.text = var_446_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_5 = arg_443_1:GetWordFromCfg(318301108)
				local var_446_6 = arg_443_1:FormatText(var_446_5.content)

				arg_443_1.text_.text = var_446_6

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_7 = 18
				local var_446_8 = utf8.len(var_446_6)
				local var_446_9 = var_446_7 <= 0 and var_446_3 or var_446_3 * (var_446_8 / var_446_7)

				if var_446_9 > 0 and var_446_3 < var_446_9 then
					arg_443_1.talkMaxDuration = var_446_9

					if var_446_9 + var_446_2 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_9 + var_446_2
					end
				end

				arg_443_1.text_.text = var_446_6
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301108", "story_v_out_318301.awb") ~= 0 then
					local var_446_10 = manager.audio:GetVoiceLength("story_v_out_318301", "318301108", "story_v_out_318301.awb") / 1000

					if var_446_10 + var_446_2 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_10 + var_446_2
					end

					if var_446_5.prefab_name ~= "" and arg_443_1.actors_[var_446_5.prefab_name] ~= nil then
						local var_446_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_5.prefab_name].transform, "story_v_out_318301", "318301108", "story_v_out_318301.awb")

						arg_443_1:RecordAudio("318301108", var_446_11)
						arg_443_1:RecordAudio("318301108", var_446_11)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_318301", "318301108", "story_v_out_318301.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_318301", "318301108", "story_v_out_318301.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_12 = math.max(var_446_3, arg_443_1.talkMaxDuration)

			if var_446_2 <= arg_443_1.time_ and arg_443_1.time_ < var_446_2 + var_446_12 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_2) / var_446_12

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_2 + var_446_12 and arg_443_1.time_ < var_446_2 + var_446_12 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play318301109 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 318301109
		arg_447_1.duration_ = 2.933

		local var_447_0 = {
			zh = 2.933,
			ja = 2.366
		}
		local var_447_1 = manager.audio:GetLocalizationFlag()

		if var_447_0[var_447_1] ~= nil then
			arg_447_1.duration_ = var_447_0[var_447_1]
		end

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play318301110(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["1049ui_story"].transform
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				arg_447_1.var_.moveOldPos1049ui_story = var_450_0.localPosition
			end

			local var_450_2 = 0.001

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2
				local var_450_4 = Vector3.New(0, -1.2, -6)

				var_450_0.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos1049ui_story, var_450_4, var_450_3)

				local var_450_5 = manager.ui.mainCamera.transform.position - var_450_0.position

				var_450_0.forward = Vector3.New(var_450_5.x, var_450_5.y, var_450_5.z)

				local var_450_6 = var_450_0.localEulerAngles

				var_450_6.z = 0
				var_450_6.x = 0
				var_450_0.localEulerAngles = var_450_6
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 then
				var_450_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_450_7 = manager.ui.mainCamera.transform.position - var_450_0.position

				var_450_0.forward = Vector3.New(var_450_7.x, var_450_7.y, var_450_7.z)

				local var_450_8 = var_450_0.localEulerAngles

				var_450_8.z = 0
				var_450_8.x = 0
				var_450_0.localEulerAngles = var_450_8
			end

			local var_450_9 = arg_447_1.actors_["1049ui_story"]
			local var_450_10 = 0

			if var_450_10 < arg_447_1.time_ and arg_447_1.time_ <= var_450_10 + arg_450_0 and arg_447_1.var_.characterEffect1049ui_story == nil then
				arg_447_1.var_.characterEffect1049ui_story = var_450_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_11 = 0.200000002980232

			if var_450_10 <= arg_447_1.time_ and arg_447_1.time_ < var_450_10 + var_450_11 then
				local var_450_12 = (arg_447_1.time_ - var_450_10) / var_450_11

				if arg_447_1.var_.characterEffect1049ui_story then
					arg_447_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_447_1.time_ >= var_450_10 + var_450_11 and arg_447_1.time_ < var_450_10 + var_450_11 + arg_450_0 and arg_447_1.var_.characterEffect1049ui_story then
				arg_447_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_450_13 = 0

			if var_450_13 < arg_447_1.time_ and arg_447_1.time_ <= var_450_13 + arg_450_0 then
				arg_447_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_450_14 = 0

			if var_450_14 < arg_447_1.time_ and arg_447_1.time_ <= var_450_14 + arg_450_0 then
				arg_447_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_450_15 = arg_447_1.actors_["1055ui_story"].transform
			local var_450_16 = 0

			if var_450_16 < arg_447_1.time_ and arg_447_1.time_ <= var_450_16 + arg_450_0 then
				arg_447_1.var_.moveOldPos1055ui_story = var_450_15.localPosition
			end

			local var_450_17 = 0.001

			if var_450_16 <= arg_447_1.time_ and arg_447_1.time_ < var_450_16 + var_450_17 then
				local var_450_18 = (arg_447_1.time_ - var_450_16) / var_450_17
				local var_450_19 = Vector3.New(0, 100, 0)

				var_450_15.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos1055ui_story, var_450_19, var_450_18)

				local var_450_20 = manager.ui.mainCamera.transform.position - var_450_15.position

				var_450_15.forward = Vector3.New(var_450_20.x, var_450_20.y, var_450_20.z)

				local var_450_21 = var_450_15.localEulerAngles

				var_450_21.z = 0
				var_450_21.x = 0
				var_450_15.localEulerAngles = var_450_21
			end

			if arg_447_1.time_ >= var_450_16 + var_450_17 and arg_447_1.time_ < var_450_16 + var_450_17 + arg_450_0 then
				var_450_15.localPosition = Vector3.New(0, 100, 0)

				local var_450_22 = manager.ui.mainCamera.transform.position - var_450_15.position

				var_450_15.forward = Vector3.New(var_450_22.x, var_450_22.y, var_450_22.z)

				local var_450_23 = var_450_15.localEulerAngles

				var_450_23.z = 0
				var_450_23.x = 0
				var_450_15.localEulerAngles = var_450_23
			end

			local var_450_24 = arg_447_1.actors_["1055ui_story"]
			local var_450_25 = 0

			if var_450_25 < arg_447_1.time_ and arg_447_1.time_ <= var_450_25 + arg_450_0 and arg_447_1.var_.characterEffect1055ui_story == nil then
				arg_447_1.var_.characterEffect1055ui_story = var_450_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_26 = 0.200000002980232

			if var_450_25 <= arg_447_1.time_ and arg_447_1.time_ < var_450_25 + var_450_26 then
				local var_450_27 = (arg_447_1.time_ - var_450_25) / var_450_26

				if arg_447_1.var_.characterEffect1055ui_story then
					local var_450_28 = Mathf.Lerp(0, 0.5, var_450_27)

					arg_447_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_447_1.var_.characterEffect1055ui_story.fillRatio = var_450_28
				end
			end

			if arg_447_1.time_ >= var_450_25 + var_450_26 and arg_447_1.time_ < var_450_25 + var_450_26 + arg_450_0 and arg_447_1.var_.characterEffect1055ui_story then
				local var_450_29 = 0.5

				arg_447_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_447_1.var_.characterEffect1055ui_story.fillRatio = var_450_29
			end

			local var_450_30 = 0
			local var_450_31 = 0.175

			if var_450_30 < arg_447_1.time_ and arg_447_1.time_ <= var_450_30 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_32 = arg_447_1:FormatText(StoryNameCfg[562].name)

				arg_447_1.leftNameTxt_.text = var_450_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_33 = arg_447_1:GetWordFromCfg(318301109)
				local var_450_34 = arg_447_1:FormatText(var_450_33.content)

				arg_447_1.text_.text = var_450_34

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_35 = 7
				local var_450_36 = utf8.len(var_450_34)
				local var_450_37 = var_450_35 <= 0 and var_450_31 or var_450_31 * (var_450_36 / var_450_35)

				if var_450_37 > 0 and var_450_31 < var_450_37 then
					arg_447_1.talkMaxDuration = var_450_37

					if var_450_37 + var_450_30 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_37 + var_450_30
					end
				end

				arg_447_1.text_.text = var_450_34
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301109", "story_v_out_318301.awb") ~= 0 then
					local var_450_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301109", "story_v_out_318301.awb") / 1000

					if var_450_38 + var_450_30 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_38 + var_450_30
					end

					if var_450_33.prefab_name ~= "" and arg_447_1.actors_[var_450_33.prefab_name] ~= nil then
						local var_450_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_33.prefab_name].transform, "story_v_out_318301", "318301109", "story_v_out_318301.awb")

						arg_447_1:RecordAudio("318301109", var_450_39)
						arg_447_1:RecordAudio("318301109", var_450_39)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_318301", "318301109", "story_v_out_318301.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_318301", "318301109", "story_v_out_318301.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_40 = math.max(var_450_31, arg_447_1.talkMaxDuration)

			if var_450_30 <= arg_447_1.time_ and arg_447_1.time_ < var_450_30 + var_450_40 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_30) / var_450_40

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_30 + var_450_40 and arg_447_1.time_ < var_450_30 + var_450_40 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play318301110 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 318301110
		arg_451_1.duration_ = 3.9

		local var_451_0 = {
			zh = 3.433,
			ja = 3.9
		}
		local var_451_1 = manager.audio:GetLocalizationFlag()

		if var_451_0[var_451_1] ~= nil then
			arg_451_1.duration_ = var_451_0[var_451_1]
		end

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play318301111(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_454_2 = 0
			local var_454_3 = 0.325

			if var_454_2 < arg_451_1.time_ and arg_451_1.time_ <= var_454_2 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_4 = arg_451_1:FormatText(StoryNameCfg[562].name)

				arg_451_1.leftNameTxt_.text = var_454_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_5 = arg_451_1:GetWordFromCfg(318301110)
				local var_454_6 = arg_451_1:FormatText(var_454_5.content)

				arg_451_1.text_.text = var_454_6

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_7 = 13
				local var_454_8 = utf8.len(var_454_6)
				local var_454_9 = var_454_7 <= 0 and var_454_3 or var_454_3 * (var_454_8 / var_454_7)

				if var_454_9 > 0 and var_454_3 < var_454_9 then
					arg_451_1.talkMaxDuration = var_454_9

					if var_454_9 + var_454_2 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_9 + var_454_2
					end
				end

				arg_451_1.text_.text = var_454_6
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301110", "story_v_out_318301.awb") ~= 0 then
					local var_454_10 = manager.audio:GetVoiceLength("story_v_out_318301", "318301110", "story_v_out_318301.awb") / 1000

					if var_454_10 + var_454_2 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_10 + var_454_2
					end

					if var_454_5.prefab_name ~= "" and arg_451_1.actors_[var_454_5.prefab_name] ~= nil then
						local var_454_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_5.prefab_name].transform, "story_v_out_318301", "318301110", "story_v_out_318301.awb")

						arg_451_1:RecordAudio("318301110", var_454_11)
						arg_451_1:RecordAudio("318301110", var_454_11)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_318301", "318301110", "story_v_out_318301.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_318301", "318301110", "story_v_out_318301.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_12 = math.max(var_454_3, arg_451_1.talkMaxDuration)

			if var_454_2 <= arg_451_1.time_ and arg_451_1.time_ < var_454_2 + var_454_12 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_2) / var_454_12

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_2 + var_454_12 and arg_451_1.time_ < var_454_2 + var_454_12 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play318301111 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 318301111
		arg_455_1.duration_ = 6.8

		local var_455_0 = {
			zh = 6.8,
			ja = 3.3
		}
		local var_455_1 = manager.audio:GetLocalizationFlag()

		if var_455_0[var_455_1] ~= nil then
			arg_455_1.duration_ = var_455_0[var_455_1]
		end

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play318301112(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				arg_455_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_458_2 = 0
			local var_458_3 = 0.475

			if var_458_2 < arg_455_1.time_ and arg_455_1.time_ <= var_458_2 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_4 = arg_455_1:FormatText(StoryNameCfg[562].name)

				arg_455_1.leftNameTxt_.text = var_458_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_5 = arg_455_1:GetWordFromCfg(318301111)
				local var_458_6 = arg_455_1:FormatText(var_458_5.content)

				arg_455_1.text_.text = var_458_6

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_7 = 19
				local var_458_8 = utf8.len(var_458_6)
				local var_458_9 = var_458_7 <= 0 and var_458_3 or var_458_3 * (var_458_8 / var_458_7)

				if var_458_9 > 0 and var_458_3 < var_458_9 then
					arg_455_1.talkMaxDuration = var_458_9

					if var_458_9 + var_458_2 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_9 + var_458_2
					end
				end

				arg_455_1.text_.text = var_458_6
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301111", "story_v_out_318301.awb") ~= 0 then
					local var_458_10 = manager.audio:GetVoiceLength("story_v_out_318301", "318301111", "story_v_out_318301.awb") / 1000

					if var_458_10 + var_458_2 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_10 + var_458_2
					end

					if var_458_5.prefab_name ~= "" and arg_455_1.actors_[var_458_5.prefab_name] ~= nil then
						local var_458_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_5.prefab_name].transform, "story_v_out_318301", "318301111", "story_v_out_318301.awb")

						arg_455_1:RecordAudio("318301111", var_458_11)
						arg_455_1:RecordAudio("318301111", var_458_11)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_out_318301", "318301111", "story_v_out_318301.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_out_318301", "318301111", "story_v_out_318301.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_12 = math.max(var_458_3, arg_455_1.talkMaxDuration)

			if var_458_2 <= arg_455_1.time_ and arg_455_1.time_ < var_458_2 + var_458_12 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_2) / var_458_12

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_2 + var_458_12 and arg_455_1.time_ < var_458_2 + var_458_12 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play318301112 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 318301112
		arg_459_1.duration_ = 0.999999999999

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"

			SetActive(arg_459_1.choicesGo_, true)

			for iter_460_0, iter_460_1 in ipairs(arg_459_1.choices_) do
				local var_460_0 = iter_460_0 <= 2

				SetActive(iter_460_1.go, var_460_0)
			end

			arg_459_1.choices_[1].txt.text = arg_459_1:FormatText(StoryChoiceCfg[690].name)
			arg_459_1.choices_[2].txt.text = arg_459_1:FormatText(StoryChoiceCfg[691].name)
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play318301113(arg_459_1)
			end

			if arg_461_0 == 2 then
				arg_459_0:Play318301113(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1049ui_story"].transform
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.var_.moveOldPos1049ui_story = var_462_0.localPosition
			end

			local var_462_2 = 0.001

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2
				local var_462_4 = Vector3.New(0, -1.2, -6)

				var_462_0.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos1049ui_story, var_462_4, var_462_3)

				local var_462_5 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_5.x, var_462_5.y, var_462_5.z)

				local var_462_6 = var_462_0.localEulerAngles

				var_462_6.z = 0
				var_462_6.x = 0
				var_462_0.localEulerAngles = var_462_6
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 then
				var_462_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_462_7 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_7.x, var_462_7.y, var_462_7.z)

				local var_462_8 = var_462_0.localEulerAngles

				var_462_8.z = 0
				var_462_8.x = 0
				var_462_0.localEulerAngles = var_462_8
			end

			local var_462_9 = arg_459_1.actors_["1049ui_story"]
			local var_462_10 = 0

			if var_462_10 < arg_459_1.time_ and arg_459_1.time_ <= var_462_10 + arg_462_0 and arg_459_1.var_.characterEffect1049ui_story == nil then
				arg_459_1.var_.characterEffect1049ui_story = var_462_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_11 = 0.200000002980232

			if var_462_10 <= arg_459_1.time_ and arg_459_1.time_ < var_462_10 + var_462_11 then
				local var_462_12 = (arg_459_1.time_ - var_462_10) / var_462_11

				if arg_459_1.var_.characterEffect1049ui_story then
					local var_462_13 = Mathf.Lerp(0, 0.5, var_462_12)

					arg_459_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_459_1.var_.characterEffect1049ui_story.fillRatio = var_462_13
				end
			end

			if arg_459_1.time_ >= var_462_10 + var_462_11 and arg_459_1.time_ < var_462_10 + var_462_11 + arg_462_0 and arg_459_1.var_.characterEffect1049ui_story then
				local var_462_14 = 0.5

				arg_459_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_459_1.var_.characterEffect1049ui_story.fillRatio = var_462_14
			end

			local var_462_15 = 0

			if var_462_15 < arg_459_1.time_ and arg_459_1.time_ <= var_462_15 + arg_462_0 then
				arg_459_1.allBtn_.enabled = false
			end

			local var_462_16 = 0.5

			if arg_459_1.time_ >= var_462_15 + var_462_16 and arg_459_1.time_ < var_462_15 + var_462_16 + arg_462_0 then
				arg_459_1.allBtn_.enabled = true
			end
		end
	end,
	Play318301113 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 318301113
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play318301114(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0
			local var_466_1 = 0.925

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, false)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_2 = arg_463_1:GetWordFromCfg(318301113)
				local var_466_3 = arg_463_1:FormatText(var_466_2.content)

				arg_463_1.text_.text = var_466_3

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_4 = 37
				local var_466_5 = utf8.len(var_466_3)
				local var_466_6 = var_466_4 <= 0 and var_466_1 or var_466_1 * (var_466_5 / var_466_4)

				if var_466_6 > 0 and var_466_1 < var_466_6 then
					arg_463_1.talkMaxDuration = var_466_6

					if var_466_6 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_6 + var_466_0
					end
				end

				arg_463_1.text_.text = var_466_3
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_7 = math.max(var_466_1, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_7 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_0) / var_466_7

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_7 and arg_463_1.time_ < var_466_0 + var_466_7 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play318301114 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 318301114
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play318301115(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.375

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, false)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_2 = arg_467_1:GetWordFromCfg(318301114)
				local var_470_3 = arg_467_1:FormatText(var_470_2.content)

				arg_467_1.text_.text = var_470_3

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_4 = 15
				local var_470_5 = utf8.len(var_470_3)
				local var_470_6 = var_470_4 <= 0 and var_470_1 or var_470_1 * (var_470_5 / var_470_4)

				if var_470_6 > 0 and var_470_1 < var_470_6 then
					arg_467_1.talkMaxDuration = var_470_6

					if var_470_6 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_6 + var_470_0
					end
				end

				arg_467_1.text_.text = var_470_3
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_7 = math.max(var_470_1, arg_467_1.talkMaxDuration)

			if var_470_0 <= arg_467_1.time_ and arg_467_1.time_ < var_470_0 + var_470_7 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_0) / var_470_7

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_0 + var_470_7 and arg_467_1.time_ < var_470_0 + var_470_7 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play318301115 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 318301115
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play318301116(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 0.475

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_2 = arg_471_1:FormatText(StoryNameCfg[7].name)

				arg_471_1.leftNameTxt_.text = var_474_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_3 = arg_471_1:GetWordFromCfg(318301115)
				local var_474_4 = arg_471_1:FormatText(var_474_3.content)

				arg_471_1.text_.text = var_474_4

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_5 = 19
				local var_474_6 = utf8.len(var_474_4)
				local var_474_7 = var_474_5 <= 0 and var_474_1 or var_474_1 * (var_474_6 / var_474_5)

				if var_474_7 > 0 and var_474_1 < var_474_7 then
					arg_471_1.talkMaxDuration = var_474_7

					if var_474_7 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_7 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_4
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_8 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_8 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_8

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_8 and arg_471_1.time_ < var_474_0 + var_474_8 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play318301116 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 318301116
		arg_475_1.duration_ = 5.7

		local var_475_0 = {
			zh = 2.3,
			ja = 5.7
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play318301117(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1055ui_story"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos1055ui_story = var_478_0.localPosition
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, -0.965, -6.2)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1055ui_story, var_478_4, var_478_3)

				local var_478_5 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_5.x, var_478_5.y, var_478_5.z)

				local var_478_6 = var_478_0.localEulerAngles

				var_478_6.z = 0
				var_478_6.x = 0
				var_478_0.localEulerAngles = var_478_6
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_478_7 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_7.x, var_478_7.y, var_478_7.z)

				local var_478_8 = var_478_0.localEulerAngles

				var_478_8.z = 0
				var_478_8.x = 0
				var_478_0.localEulerAngles = var_478_8
			end

			local var_478_9 = arg_475_1.actors_["1055ui_story"]
			local var_478_10 = 0

			if var_478_10 < arg_475_1.time_ and arg_475_1.time_ <= var_478_10 + arg_478_0 and arg_475_1.var_.characterEffect1055ui_story == nil then
				arg_475_1.var_.characterEffect1055ui_story = var_478_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_11 = 0.200000002980232

			if var_478_10 <= arg_475_1.time_ and arg_475_1.time_ < var_478_10 + var_478_11 then
				local var_478_12 = (arg_475_1.time_ - var_478_10) / var_478_11

				if arg_475_1.var_.characterEffect1055ui_story then
					arg_475_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_475_1.time_ >= var_478_10 + var_478_11 and arg_475_1.time_ < var_478_10 + var_478_11 + arg_478_0 and arg_475_1.var_.characterEffect1055ui_story then
				arg_475_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_478_13 = 0

			if var_478_13 < arg_475_1.time_ and arg_475_1.time_ <= var_478_13 + arg_478_0 then
				arg_475_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_478_14 = 0

			if var_478_14 < arg_475_1.time_ and arg_475_1.time_ <= var_478_14 + arg_478_0 then
				arg_475_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_478_15 = arg_475_1.actors_["1049ui_story"].transform
			local var_478_16 = 0

			if var_478_16 < arg_475_1.time_ and arg_475_1.time_ <= var_478_16 + arg_478_0 then
				arg_475_1.var_.moveOldPos1049ui_story = var_478_15.localPosition
			end

			local var_478_17 = 0.001

			if var_478_16 <= arg_475_1.time_ and arg_475_1.time_ < var_478_16 + var_478_17 then
				local var_478_18 = (arg_475_1.time_ - var_478_16) / var_478_17
				local var_478_19 = Vector3.New(0, 100, 0)

				var_478_15.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1049ui_story, var_478_19, var_478_18)

				local var_478_20 = manager.ui.mainCamera.transform.position - var_478_15.position

				var_478_15.forward = Vector3.New(var_478_20.x, var_478_20.y, var_478_20.z)

				local var_478_21 = var_478_15.localEulerAngles

				var_478_21.z = 0
				var_478_21.x = 0
				var_478_15.localEulerAngles = var_478_21
			end

			if arg_475_1.time_ >= var_478_16 + var_478_17 and arg_475_1.time_ < var_478_16 + var_478_17 + arg_478_0 then
				var_478_15.localPosition = Vector3.New(0, 100, 0)

				local var_478_22 = manager.ui.mainCamera.transform.position - var_478_15.position

				var_478_15.forward = Vector3.New(var_478_22.x, var_478_22.y, var_478_22.z)

				local var_478_23 = var_478_15.localEulerAngles

				var_478_23.z = 0
				var_478_23.x = 0
				var_478_15.localEulerAngles = var_478_23
			end

			local var_478_24 = 0
			local var_478_25 = 0.275

			if var_478_24 < arg_475_1.time_ and arg_475_1.time_ <= var_478_24 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_26 = arg_475_1:FormatText(StoryNameCfg[481].name)

				arg_475_1.leftNameTxt_.text = var_478_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_27 = arg_475_1:GetWordFromCfg(318301116)
				local var_478_28 = arg_475_1:FormatText(var_478_27.content)

				arg_475_1.text_.text = var_478_28

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_29 = 11
				local var_478_30 = utf8.len(var_478_28)
				local var_478_31 = var_478_29 <= 0 and var_478_25 or var_478_25 * (var_478_30 / var_478_29)

				if var_478_31 > 0 and var_478_25 < var_478_31 then
					arg_475_1.talkMaxDuration = var_478_31

					if var_478_31 + var_478_24 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_31 + var_478_24
					end
				end

				arg_475_1.text_.text = var_478_28
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301116", "story_v_out_318301.awb") ~= 0 then
					local var_478_32 = manager.audio:GetVoiceLength("story_v_out_318301", "318301116", "story_v_out_318301.awb") / 1000

					if var_478_32 + var_478_24 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_32 + var_478_24
					end

					if var_478_27.prefab_name ~= "" and arg_475_1.actors_[var_478_27.prefab_name] ~= nil then
						local var_478_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_27.prefab_name].transform, "story_v_out_318301", "318301116", "story_v_out_318301.awb")

						arg_475_1:RecordAudio("318301116", var_478_33)
						arg_475_1:RecordAudio("318301116", var_478_33)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_318301", "318301116", "story_v_out_318301.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_318301", "318301116", "story_v_out_318301.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_34 = math.max(var_478_25, arg_475_1.talkMaxDuration)

			if var_478_24 <= arg_475_1.time_ and arg_475_1.time_ < var_478_24 + var_478_34 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_24) / var_478_34

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_24 + var_478_34 and arg_475_1.time_ < var_478_24 + var_478_34 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play318301117 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 318301117
		arg_479_1.duration_ = 10.9

		local var_479_0 = {
			zh = 7.866,
			ja = 10.9
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play318301118(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = "K07g"

			if arg_479_1.bgs_[var_482_0] == nil then
				local var_482_1 = Object.Instantiate(arg_479_1.paintGo_)

				var_482_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_482_0)
				var_482_1.name = var_482_0
				var_482_1.transform.parent = arg_479_1.stage_.transform
				var_482_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_479_1.bgs_[var_482_0] = var_482_1
			end

			local var_482_2 = 2

			if var_482_2 < arg_479_1.time_ and arg_479_1.time_ <= var_482_2 + arg_482_0 then
				local var_482_3 = manager.ui.mainCamera.transform.localPosition
				local var_482_4 = Vector3.New(0, 0, 10) + Vector3.New(var_482_3.x, var_482_3.y, 0)
				local var_482_5 = arg_479_1.bgs_.K07g

				var_482_5.transform.localPosition = var_482_4
				var_482_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_482_6 = var_482_5:GetComponent("SpriteRenderer")

				if var_482_6 and var_482_6.sprite then
					local var_482_7 = (var_482_5.transform.localPosition - var_482_3).z
					local var_482_8 = manager.ui.mainCameraCom_
					local var_482_9 = 2 * var_482_7 * Mathf.Tan(var_482_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_482_10 = var_482_9 * var_482_8.aspect
					local var_482_11 = var_482_6.sprite.bounds.size.x
					local var_482_12 = var_482_6.sprite.bounds.size.y
					local var_482_13 = var_482_10 / var_482_11
					local var_482_14 = var_482_9 / var_482_12
					local var_482_15 = var_482_14 < var_482_13 and var_482_13 or var_482_14

					var_482_5.transform.localScale = Vector3.New(var_482_15, var_482_15, 0)
				end

				for iter_482_0, iter_482_1 in pairs(arg_479_1.bgs_) do
					if iter_482_0 ~= "K07g" then
						iter_482_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_482_16 = 0

			if var_482_16 < arg_479_1.time_ and arg_479_1.time_ <= var_482_16 + arg_482_0 then
				arg_479_1.mask_.enabled = true
				arg_479_1.mask_.raycastTarget = true

				arg_479_1:SetGaussion(false)
			end

			local var_482_17 = 2

			if var_482_16 <= arg_479_1.time_ and arg_479_1.time_ < var_482_16 + var_482_17 then
				local var_482_18 = (arg_479_1.time_ - var_482_16) / var_482_17
				local var_482_19 = Color.New(0, 0, 0)

				var_482_19.a = Mathf.Lerp(0, 1, var_482_18)
				arg_479_1.mask_.color = var_482_19
			end

			if arg_479_1.time_ >= var_482_16 + var_482_17 and arg_479_1.time_ < var_482_16 + var_482_17 + arg_482_0 then
				local var_482_20 = Color.New(0, 0, 0)

				var_482_20.a = 1
				arg_479_1.mask_.color = var_482_20
			end

			local var_482_21 = 2

			if var_482_21 < arg_479_1.time_ and arg_479_1.time_ <= var_482_21 + arg_482_0 then
				arg_479_1.mask_.enabled = true
				arg_479_1.mask_.raycastTarget = true

				arg_479_1:SetGaussion(false)
			end

			local var_482_22 = 2

			if var_482_21 <= arg_479_1.time_ and arg_479_1.time_ < var_482_21 + var_482_22 then
				local var_482_23 = (arg_479_1.time_ - var_482_21) / var_482_22
				local var_482_24 = Color.New(0, 0, 0)

				var_482_24.a = Mathf.Lerp(1, 0, var_482_23)
				arg_479_1.mask_.color = var_482_24
			end

			if arg_479_1.time_ >= var_482_21 + var_482_22 and arg_479_1.time_ < var_482_21 + var_482_22 + arg_482_0 then
				local var_482_25 = Color.New(0, 0, 0)
				local var_482_26 = 0

				arg_479_1.mask_.enabled = false
				var_482_25.a = var_482_26
				arg_479_1.mask_.color = var_482_25
			end

			local var_482_27 = arg_479_1.actors_["1015ui_story"].transform
			local var_482_28 = 1.96599999815226

			if var_482_28 < arg_479_1.time_ and arg_479_1.time_ <= var_482_28 + arg_482_0 then
				arg_479_1.var_.moveOldPos1015ui_story = var_482_27.localPosition
			end

			local var_482_29 = 0.001

			if var_482_28 <= arg_479_1.time_ and arg_479_1.time_ < var_482_28 + var_482_29 then
				local var_482_30 = (arg_479_1.time_ - var_482_28) / var_482_29
				local var_482_31 = Vector3.New(0, -1.15, -6.2)

				var_482_27.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1015ui_story, var_482_31, var_482_30)

				local var_482_32 = manager.ui.mainCamera.transform.position - var_482_27.position

				var_482_27.forward = Vector3.New(var_482_32.x, var_482_32.y, var_482_32.z)

				local var_482_33 = var_482_27.localEulerAngles

				var_482_33.z = 0
				var_482_33.x = 0
				var_482_27.localEulerAngles = var_482_33
			end

			if arg_479_1.time_ >= var_482_28 + var_482_29 and arg_479_1.time_ < var_482_28 + var_482_29 + arg_482_0 then
				var_482_27.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_482_34 = manager.ui.mainCamera.transform.position - var_482_27.position

				var_482_27.forward = Vector3.New(var_482_34.x, var_482_34.y, var_482_34.z)

				local var_482_35 = var_482_27.localEulerAngles

				var_482_35.z = 0
				var_482_35.x = 0
				var_482_27.localEulerAngles = var_482_35
			end

			local var_482_36 = arg_479_1.actors_["1015ui_story"]
			local var_482_37 = 3.9

			if var_482_37 < arg_479_1.time_ and arg_479_1.time_ <= var_482_37 + arg_482_0 and arg_479_1.var_.characterEffect1015ui_story == nil then
				arg_479_1.var_.characterEffect1015ui_story = var_482_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_38 = 0.200000002980232

			if var_482_37 <= arg_479_1.time_ and arg_479_1.time_ < var_482_37 + var_482_38 then
				local var_482_39 = (arg_479_1.time_ - var_482_37) / var_482_38

				if arg_479_1.var_.characterEffect1015ui_story then
					arg_479_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_37 + var_482_38 and arg_479_1.time_ < var_482_37 + var_482_38 + arg_482_0 and arg_479_1.var_.characterEffect1015ui_story then
				arg_479_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_482_40 = 3.9

			if var_482_40 < arg_479_1.time_ and arg_479_1.time_ <= var_482_40 + arg_482_0 then
				arg_479_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_482_41 = 3.9

			if var_482_41 < arg_479_1.time_ and arg_479_1.time_ <= var_482_41 + arg_482_0 then
				arg_479_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_482_42 = arg_479_1.actors_["1055ui_story"].transform
			local var_482_43 = 1.96599999815226

			if var_482_43 < arg_479_1.time_ and arg_479_1.time_ <= var_482_43 + arg_482_0 then
				arg_479_1.var_.moveOldPos1055ui_story = var_482_42.localPosition
			end

			local var_482_44 = 0.001

			if var_482_43 <= arg_479_1.time_ and arg_479_1.time_ < var_482_43 + var_482_44 then
				local var_482_45 = (arg_479_1.time_ - var_482_43) / var_482_44
				local var_482_46 = Vector3.New(0, 100, 0)

				var_482_42.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1055ui_story, var_482_46, var_482_45)

				local var_482_47 = manager.ui.mainCamera.transform.position - var_482_42.position

				var_482_42.forward = Vector3.New(var_482_47.x, var_482_47.y, var_482_47.z)

				local var_482_48 = var_482_42.localEulerAngles

				var_482_48.z = 0
				var_482_48.x = 0
				var_482_42.localEulerAngles = var_482_48
			end

			if arg_479_1.time_ >= var_482_43 + var_482_44 and arg_479_1.time_ < var_482_43 + var_482_44 + arg_482_0 then
				var_482_42.localPosition = Vector3.New(0, 100, 0)

				local var_482_49 = manager.ui.mainCamera.transform.position - var_482_42.position

				var_482_42.forward = Vector3.New(var_482_49.x, var_482_49.y, var_482_49.z)

				local var_482_50 = var_482_42.localEulerAngles

				var_482_50.z = 0
				var_482_50.x = 0
				var_482_42.localEulerAngles = var_482_50
			end

			local var_482_51 = 0
			local var_482_52 = 1

			if var_482_51 < arg_479_1.time_ and arg_479_1.time_ <= var_482_51 + arg_482_0 then
				local var_482_53 = "stop"
				local var_482_54 = "effect"

				arg_479_1:AudioAction(var_482_53, var_482_54, "se_story_221_00", "se_story_221_00_firework_loop", "")
			end

			if arg_479_1.frameCnt_ <= 1 then
				arg_479_1.dialog_:SetActive(false)
			end

			local var_482_55 = 4
			local var_482_56 = 0.45

			if var_482_55 < arg_479_1.time_ and arg_479_1.time_ <= var_482_55 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0

				arg_479_1.dialog_:SetActive(true)

				local var_482_57 = LeanTween.value(arg_479_1.dialog_, 0, 1, 0.3)

				var_482_57:setOnUpdate(LuaHelper.FloatAction(function(arg_483_0)
					arg_479_1.dialogCg_.alpha = arg_483_0
				end))
				var_482_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_479_1.dialog_)
					var_482_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_479_1.duration_ = arg_479_1.duration_ + 0.3

				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_58 = arg_479_1:FormatText(StoryNameCfg[479].name)

				arg_479_1.leftNameTxt_.text = var_482_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_59 = arg_479_1:GetWordFromCfg(318301117)
				local var_482_60 = arg_479_1:FormatText(var_482_59.content)

				arg_479_1.text_.text = var_482_60

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_61 = 18
				local var_482_62 = utf8.len(var_482_60)
				local var_482_63 = var_482_61 <= 0 and var_482_56 or var_482_56 * (var_482_62 / var_482_61)

				if var_482_63 > 0 and var_482_56 < var_482_63 then
					arg_479_1.talkMaxDuration = var_482_63
					var_482_55 = var_482_55 + 0.3

					if var_482_63 + var_482_55 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_63 + var_482_55
					end
				end

				arg_479_1.text_.text = var_482_60
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301117", "story_v_out_318301.awb") ~= 0 then
					local var_482_64 = manager.audio:GetVoiceLength("story_v_out_318301", "318301117", "story_v_out_318301.awb") / 1000

					if var_482_64 + var_482_55 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_64 + var_482_55
					end

					if var_482_59.prefab_name ~= "" and arg_479_1.actors_[var_482_59.prefab_name] ~= nil then
						local var_482_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_59.prefab_name].transform, "story_v_out_318301", "318301117", "story_v_out_318301.awb")

						arg_479_1:RecordAudio("318301117", var_482_65)
						arg_479_1:RecordAudio("318301117", var_482_65)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_318301", "318301117", "story_v_out_318301.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_318301", "318301117", "story_v_out_318301.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_66 = var_482_55 + 0.3
			local var_482_67 = math.max(var_482_56, arg_479_1.talkMaxDuration)

			if var_482_66 <= arg_479_1.time_ and arg_479_1.time_ < var_482_66 + var_482_67 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_66) / var_482_67

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_66 + var_482_67 and arg_479_1.time_ < var_482_66 + var_482_67 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play318301118 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 318301118
		arg_485_1.duration_ = 7.866

		local var_485_0 = {
			zh = 6.433,
			ja = 7.866
		}
		local var_485_1 = manager.audio:GetLocalizationFlag()

		if var_485_0[var_485_1] ~= nil then
			arg_485_1.duration_ = var_485_0[var_485_1]
		end

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play318301119(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = "10014ui_story"

			if arg_485_1.actors_[var_488_0] == nil then
				local var_488_1 = Object.Instantiate(Asset.Load("Char/" .. var_488_0), arg_485_1.stage_.transform)

				var_488_1.name = var_488_0
				var_488_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_485_1.actors_[var_488_0] = var_488_1

				local var_488_2 = var_488_1:GetComponentInChildren(typeof(CharacterEffect))

				var_488_2.enabled = true

				local var_488_3 = GameObjectTools.GetOrAddComponent(var_488_1, typeof(DynamicBoneHelper))

				if var_488_3 then
					var_488_3:EnableDynamicBone(false)
				end

				arg_485_1:ShowWeapon(var_488_2.transform, false)

				arg_485_1.var_[var_488_0 .. "Animator"] = var_488_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_485_1.var_[var_488_0 .. "Animator"].applyRootMotion = true
				arg_485_1.var_[var_488_0 .. "LipSync"] = var_488_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_488_4 = arg_485_1.actors_["10014ui_story"].transform
			local var_488_5 = 0

			if var_488_5 < arg_485_1.time_ and arg_485_1.time_ <= var_488_5 + arg_488_0 then
				arg_485_1.var_.moveOldPos10014ui_story = var_488_4.localPosition
			end

			local var_488_6 = 0.001

			if var_488_5 <= arg_485_1.time_ and arg_485_1.time_ < var_488_5 + var_488_6 then
				local var_488_7 = (arg_485_1.time_ - var_488_5) / var_488_6
				local var_488_8 = Vector3.New(0, -1.06, -6.2)

				var_488_4.localPosition = Vector3.Lerp(arg_485_1.var_.moveOldPos10014ui_story, var_488_8, var_488_7)

				local var_488_9 = manager.ui.mainCamera.transform.position - var_488_4.position

				var_488_4.forward = Vector3.New(var_488_9.x, var_488_9.y, var_488_9.z)

				local var_488_10 = var_488_4.localEulerAngles

				var_488_10.z = 0
				var_488_10.x = 0
				var_488_4.localEulerAngles = var_488_10
			end

			if arg_485_1.time_ >= var_488_5 + var_488_6 and arg_485_1.time_ < var_488_5 + var_488_6 + arg_488_0 then
				var_488_4.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_488_11 = manager.ui.mainCamera.transform.position - var_488_4.position

				var_488_4.forward = Vector3.New(var_488_11.x, var_488_11.y, var_488_11.z)

				local var_488_12 = var_488_4.localEulerAngles

				var_488_12.z = 0
				var_488_12.x = 0
				var_488_4.localEulerAngles = var_488_12
			end

			local var_488_13 = arg_485_1.actors_["10014ui_story"]
			local var_488_14 = 0

			if var_488_14 < arg_485_1.time_ and arg_485_1.time_ <= var_488_14 + arg_488_0 and arg_485_1.var_.characterEffect10014ui_story == nil then
				arg_485_1.var_.characterEffect10014ui_story = var_488_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_15 = 0.200000002980232

			if var_488_14 <= arg_485_1.time_ and arg_485_1.time_ < var_488_14 + var_488_15 then
				local var_488_16 = (arg_485_1.time_ - var_488_14) / var_488_15

				if arg_485_1.var_.characterEffect10014ui_story then
					arg_485_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_485_1.time_ >= var_488_14 + var_488_15 and arg_485_1.time_ < var_488_14 + var_488_15 + arg_488_0 and arg_485_1.var_.characterEffect10014ui_story then
				arg_485_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_488_17 = 0

			if var_488_17 < arg_485_1.time_ and arg_485_1.time_ <= var_488_17 + arg_488_0 then
				arg_485_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_488_18 = 0

			if var_488_18 < arg_485_1.time_ and arg_485_1.time_ <= var_488_18 + arg_488_0 then
				arg_485_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_488_19 = arg_485_1.actors_["1015ui_story"].transform
			local var_488_20 = 0

			if var_488_20 < arg_485_1.time_ and arg_485_1.time_ <= var_488_20 + arg_488_0 then
				arg_485_1.var_.moveOldPos1015ui_story = var_488_19.localPosition
			end

			local var_488_21 = 0.001

			if var_488_20 <= arg_485_1.time_ and arg_485_1.time_ < var_488_20 + var_488_21 then
				local var_488_22 = (arg_485_1.time_ - var_488_20) / var_488_21
				local var_488_23 = Vector3.New(0, 100, 0)

				var_488_19.localPosition = Vector3.Lerp(arg_485_1.var_.moveOldPos1015ui_story, var_488_23, var_488_22)

				local var_488_24 = manager.ui.mainCamera.transform.position - var_488_19.position

				var_488_19.forward = Vector3.New(var_488_24.x, var_488_24.y, var_488_24.z)

				local var_488_25 = var_488_19.localEulerAngles

				var_488_25.z = 0
				var_488_25.x = 0
				var_488_19.localEulerAngles = var_488_25
			end

			if arg_485_1.time_ >= var_488_20 + var_488_21 and arg_485_1.time_ < var_488_20 + var_488_21 + arg_488_0 then
				var_488_19.localPosition = Vector3.New(0, 100, 0)

				local var_488_26 = manager.ui.mainCamera.transform.position - var_488_19.position

				var_488_19.forward = Vector3.New(var_488_26.x, var_488_26.y, var_488_26.z)

				local var_488_27 = var_488_19.localEulerAngles

				var_488_27.z = 0
				var_488_27.x = 0
				var_488_19.localEulerAngles = var_488_27
			end

			local var_488_28 = arg_485_1.actors_["1015ui_story"]
			local var_488_29 = 0

			if var_488_29 < arg_485_1.time_ and arg_485_1.time_ <= var_488_29 + arg_488_0 and arg_485_1.var_.characterEffect1015ui_story == nil then
				arg_485_1.var_.characterEffect1015ui_story = var_488_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_30 = 0.200000002980232

			if var_488_29 <= arg_485_1.time_ and arg_485_1.time_ < var_488_29 + var_488_30 then
				local var_488_31 = (arg_485_1.time_ - var_488_29) / var_488_30

				if arg_485_1.var_.characterEffect1015ui_story then
					local var_488_32 = Mathf.Lerp(0, 0.5, var_488_31)

					arg_485_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_485_1.var_.characterEffect1015ui_story.fillRatio = var_488_32
				end
			end

			if arg_485_1.time_ >= var_488_29 + var_488_30 and arg_485_1.time_ < var_488_29 + var_488_30 + arg_488_0 and arg_485_1.var_.characterEffect1015ui_story then
				local var_488_33 = 0.5

				arg_485_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_485_1.var_.characterEffect1015ui_story.fillRatio = var_488_33
			end

			local var_488_34 = arg_485_1.actors_["10014ui_story"]
			local var_488_35 = 0

			if var_488_35 < arg_485_1.time_ and arg_485_1.time_ <= var_488_35 + arg_488_0 then
				if arg_485_1.var_.characterEffect10014ui_story == nil then
					arg_485_1.var_.characterEffect10014ui_story = var_488_34:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_488_36 = arg_485_1.var_.characterEffect10014ui_story

				var_488_36.imageEffect:turnOff()

				var_488_36.interferenceEffect.enabled = true
				var_488_36.interferenceEffect.noise = 0.01
				var_488_36.interferenceEffect.simTimeScale = 1
				var_488_36.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_488_37 = arg_485_1.actors_["10014ui_story"]
			local var_488_38 = 0
			local var_488_39 = 0.5

			if var_488_38 < arg_485_1.time_ and arg_485_1.time_ <= var_488_38 + arg_488_0 then
				if arg_485_1.var_.characterEffect10014ui_story == nil then
					arg_485_1.var_.characterEffect10014ui_story = var_488_37:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_485_1.var_.characterEffect10014ui_story.imageEffect:turnOn(false)
			end

			local var_488_40 = 0
			local var_488_41 = 0.8

			if var_488_40 < arg_485_1.time_ and arg_485_1.time_ <= var_488_40 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_42 = arg_485_1:FormatText(StoryNameCfg[264].name)

				arg_485_1.leftNameTxt_.text = var_488_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_43 = arg_485_1:GetWordFromCfg(318301118)
				local var_488_44 = arg_485_1:FormatText(var_488_43.content)

				arg_485_1.text_.text = var_488_44

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_45 = 32
				local var_488_46 = utf8.len(var_488_44)
				local var_488_47 = var_488_45 <= 0 and var_488_41 or var_488_41 * (var_488_46 / var_488_45)

				if var_488_47 > 0 and var_488_41 < var_488_47 then
					arg_485_1.talkMaxDuration = var_488_47

					if var_488_47 + var_488_40 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_47 + var_488_40
					end
				end

				arg_485_1.text_.text = var_488_44
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301118", "story_v_out_318301.awb") ~= 0 then
					local var_488_48 = manager.audio:GetVoiceLength("story_v_out_318301", "318301118", "story_v_out_318301.awb") / 1000

					if var_488_48 + var_488_40 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_48 + var_488_40
					end

					if var_488_43.prefab_name ~= "" and arg_485_1.actors_[var_488_43.prefab_name] ~= nil then
						local var_488_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_43.prefab_name].transform, "story_v_out_318301", "318301118", "story_v_out_318301.awb")

						arg_485_1:RecordAudio("318301118", var_488_49)
						arg_485_1:RecordAudio("318301118", var_488_49)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_318301", "318301118", "story_v_out_318301.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_318301", "318301118", "story_v_out_318301.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_50 = math.max(var_488_41, arg_485_1.talkMaxDuration)

			if var_488_40 <= arg_485_1.time_ and arg_485_1.time_ < var_488_40 + var_488_50 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_40) / var_488_50

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_40 + var_488_50 and arg_485_1.time_ < var_488_40 + var_488_50 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play318301119 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 318301119
		arg_489_1.duration_ = 6.9

		local var_489_0 = {
			zh = 4.633,
			ja = 6.9
		}
		local var_489_1 = manager.audio:GetLocalizationFlag()

		if var_489_0[var_489_1] ~= nil then
			arg_489_1.duration_ = var_489_0[var_489_1]
		end

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play318301120(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["1015ui_story"].transform
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 then
				arg_489_1.var_.moveOldPos1015ui_story = var_492_0.localPosition
			end

			local var_492_2 = 0.001

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2
				local var_492_4 = Vector3.New(0, -1.15, -6.2)

				var_492_0.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos1015ui_story, var_492_4, var_492_3)

				local var_492_5 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_5.x, var_492_5.y, var_492_5.z)

				local var_492_6 = var_492_0.localEulerAngles

				var_492_6.z = 0
				var_492_6.x = 0
				var_492_0.localEulerAngles = var_492_6
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 then
				var_492_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_492_7 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_7.x, var_492_7.y, var_492_7.z)

				local var_492_8 = var_492_0.localEulerAngles

				var_492_8.z = 0
				var_492_8.x = 0
				var_492_0.localEulerAngles = var_492_8
			end

			local var_492_9 = arg_489_1.actors_["1015ui_story"]
			local var_492_10 = 0

			if var_492_10 < arg_489_1.time_ and arg_489_1.time_ <= var_492_10 + arg_492_0 and arg_489_1.var_.characterEffect1015ui_story == nil then
				arg_489_1.var_.characterEffect1015ui_story = var_492_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_11 = 0.200000002980232

			if var_492_10 <= arg_489_1.time_ and arg_489_1.time_ < var_492_10 + var_492_11 then
				local var_492_12 = (arg_489_1.time_ - var_492_10) / var_492_11

				if arg_489_1.var_.characterEffect1015ui_story then
					arg_489_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_489_1.time_ >= var_492_10 + var_492_11 and arg_489_1.time_ < var_492_10 + var_492_11 + arg_492_0 and arg_489_1.var_.characterEffect1015ui_story then
				arg_489_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_492_13 = 0

			if var_492_13 < arg_489_1.time_ and arg_489_1.time_ <= var_492_13 + arg_492_0 then
				arg_489_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_492_14 = 0

			if var_492_14 < arg_489_1.time_ and arg_489_1.time_ <= var_492_14 + arg_492_0 then
				arg_489_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_492_15 = arg_489_1.actors_["10014ui_story"].transform
			local var_492_16 = 0

			if var_492_16 < arg_489_1.time_ and arg_489_1.time_ <= var_492_16 + arg_492_0 then
				arg_489_1.var_.moveOldPos10014ui_story = var_492_15.localPosition
			end

			local var_492_17 = 0.001

			if var_492_16 <= arg_489_1.time_ and arg_489_1.time_ < var_492_16 + var_492_17 then
				local var_492_18 = (arg_489_1.time_ - var_492_16) / var_492_17
				local var_492_19 = Vector3.New(0, 100, 0)

				var_492_15.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos10014ui_story, var_492_19, var_492_18)

				local var_492_20 = manager.ui.mainCamera.transform.position - var_492_15.position

				var_492_15.forward = Vector3.New(var_492_20.x, var_492_20.y, var_492_20.z)

				local var_492_21 = var_492_15.localEulerAngles

				var_492_21.z = 0
				var_492_21.x = 0
				var_492_15.localEulerAngles = var_492_21
			end

			if arg_489_1.time_ >= var_492_16 + var_492_17 and arg_489_1.time_ < var_492_16 + var_492_17 + arg_492_0 then
				var_492_15.localPosition = Vector3.New(0, 100, 0)

				local var_492_22 = manager.ui.mainCamera.transform.position - var_492_15.position

				var_492_15.forward = Vector3.New(var_492_22.x, var_492_22.y, var_492_22.z)

				local var_492_23 = var_492_15.localEulerAngles

				var_492_23.z = 0
				var_492_23.x = 0
				var_492_15.localEulerAngles = var_492_23
			end

			local var_492_24 = arg_489_1.actors_["10014ui_story"]
			local var_492_25 = 0

			if var_492_25 < arg_489_1.time_ and arg_489_1.time_ <= var_492_25 + arg_492_0 and arg_489_1.var_.characterEffect10014ui_story == nil then
				arg_489_1.var_.characterEffect10014ui_story = var_492_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_26 = 0.200000002980232

			if var_492_25 <= arg_489_1.time_ and arg_489_1.time_ < var_492_25 + var_492_26 then
				local var_492_27 = (arg_489_1.time_ - var_492_25) / var_492_26

				if arg_489_1.var_.characterEffect10014ui_story then
					local var_492_28 = Mathf.Lerp(0, 0.5, var_492_27)

					arg_489_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_489_1.var_.characterEffect10014ui_story.fillRatio = var_492_28
				end
			end

			if arg_489_1.time_ >= var_492_25 + var_492_26 and arg_489_1.time_ < var_492_25 + var_492_26 + arg_492_0 and arg_489_1.var_.characterEffect10014ui_story then
				local var_492_29 = 0.5

				arg_489_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_489_1.var_.characterEffect10014ui_story.fillRatio = var_492_29
			end

			local var_492_30 = 0
			local var_492_31 = 0.475

			if var_492_30 < arg_489_1.time_ and arg_489_1.time_ <= var_492_30 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_32 = arg_489_1:FormatText(StoryNameCfg[479].name)

				arg_489_1.leftNameTxt_.text = var_492_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_33 = arg_489_1:GetWordFromCfg(318301119)
				local var_492_34 = arg_489_1:FormatText(var_492_33.content)

				arg_489_1.text_.text = var_492_34

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_35 = 19
				local var_492_36 = utf8.len(var_492_34)
				local var_492_37 = var_492_35 <= 0 and var_492_31 or var_492_31 * (var_492_36 / var_492_35)

				if var_492_37 > 0 and var_492_31 < var_492_37 then
					arg_489_1.talkMaxDuration = var_492_37

					if var_492_37 + var_492_30 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_37 + var_492_30
					end
				end

				arg_489_1.text_.text = var_492_34
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301119", "story_v_out_318301.awb") ~= 0 then
					local var_492_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301119", "story_v_out_318301.awb") / 1000

					if var_492_38 + var_492_30 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_38 + var_492_30
					end

					if var_492_33.prefab_name ~= "" and arg_489_1.actors_[var_492_33.prefab_name] ~= nil then
						local var_492_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_33.prefab_name].transform, "story_v_out_318301", "318301119", "story_v_out_318301.awb")

						arg_489_1:RecordAudio("318301119", var_492_39)
						arg_489_1:RecordAudio("318301119", var_492_39)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_out_318301", "318301119", "story_v_out_318301.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_out_318301", "318301119", "story_v_out_318301.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_40 = math.max(var_492_31, arg_489_1.talkMaxDuration)

			if var_492_30 <= arg_489_1.time_ and arg_489_1.time_ < var_492_30 + var_492_40 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_30) / var_492_40

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_30 + var_492_40 and arg_489_1.time_ < var_492_30 + var_492_40 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play318301120 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 318301120
		arg_493_1.duration_ = 7.9

		local var_493_0 = {
			zh = 7.4,
			ja = 7.9
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
				arg_493_0:Play318301121(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0
			local var_496_1 = 0.85

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_2 = arg_493_1:FormatText(StoryNameCfg[479].name)

				arg_493_1.leftNameTxt_.text = var_496_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_3 = arg_493_1:GetWordFromCfg(318301120)
				local var_496_4 = arg_493_1:FormatText(var_496_3.content)

				arg_493_1.text_.text = var_496_4

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301120", "story_v_out_318301.awb") ~= 0 then
					local var_496_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301120", "story_v_out_318301.awb") / 1000

					if var_496_8 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_8 + var_496_0
					end

					if var_496_3.prefab_name ~= "" and arg_493_1.actors_[var_496_3.prefab_name] ~= nil then
						local var_496_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_3.prefab_name].transform, "story_v_out_318301", "318301120", "story_v_out_318301.awb")

						arg_493_1:RecordAudio("318301120", var_496_9)
						arg_493_1:RecordAudio("318301120", var_496_9)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_out_318301", "318301120", "story_v_out_318301.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_out_318301", "318301120", "story_v_out_318301.awb")
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
	Play318301121 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 318301121
		arg_497_1.duration_ = 7.8

		local var_497_0 = {
			zh = 4.633,
			ja = 7.8
		}
		local var_497_1 = manager.audio:GetLocalizationFlag()

		if var_497_0[var_497_1] ~= nil then
			arg_497_1.duration_ = var_497_0[var_497_1]
		end

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play318301122(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["10014ui_story"].transform
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 then
				arg_497_1.var_.moveOldPos10014ui_story = var_500_0.localPosition
			end

			local var_500_2 = 0.001

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_2 then
				local var_500_3 = (arg_497_1.time_ - var_500_1) / var_500_2
				local var_500_4 = Vector3.New(0, -1.06, -6.2)

				var_500_0.localPosition = Vector3.Lerp(arg_497_1.var_.moveOldPos10014ui_story, var_500_4, var_500_3)

				local var_500_5 = manager.ui.mainCamera.transform.position - var_500_0.position

				var_500_0.forward = Vector3.New(var_500_5.x, var_500_5.y, var_500_5.z)

				local var_500_6 = var_500_0.localEulerAngles

				var_500_6.z = 0
				var_500_6.x = 0
				var_500_0.localEulerAngles = var_500_6
			end

			if arg_497_1.time_ >= var_500_1 + var_500_2 and arg_497_1.time_ < var_500_1 + var_500_2 + arg_500_0 then
				var_500_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_500_7 = manager.ui.mainCamera.transform.position - var_500_0.position

				var_500_0.forward = Vector3.New(var_500_7.x, var_500_7.y, var_500_7.z)

				local var_500_8 = var_500_0.localEulerAngles

				var_500_8.z = 0
				var_500_8.x = 0
				var_500_0.localEulerAngles = var_500_8
			end

			local var_500_9 = arg_497_1.actors_["10014ui_story"]
			local var_500_10 = 0

			if var_500_10 < arg_497_1.time_ and arg_497_1.time_ <= var_500_10 + arg_500_0 and arg_497_1.var_.characterEffect10014ui_story == nil then
				arg_497_1.var_.characterEffect10014ui_story = var_500_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_11 = 0.200000002980232

			if var_500_10 <= arg_497_1.time_ and arg_497_1.time_ < var_500_10 + var_500_11 then
				local var_500_12 = (arg_497_1.time_ - var_500_10) / var_500_11

				if arg_497_1.var_.characterEffect10014ui_story then
					arg_497_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_497_1.time_ >= var_500_10 + var_500_11 and arg_497_1.time_ < var_500_10 + var_500_11 + arg_500_0 and arg_497_1.var_.characterEffect10014ui_story then
				arg_497_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_500_13 = 0

			if var_500_13 < arg_497_1.time_ and arg_497_1.time_ <= var_500_13 + arg_500_0 then
				arg_497_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_500_14 = 0

			if var_500_14 < arg_497_1.time_ and arg_497_1.time_ <= var_500_14 + arg_500_0 then
				arg_497_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_500_15 = arg_497_1.actors_["1015ui_story"].transform
			local var_500_16 = 0

			if var_500_16 < arg_497_1.time_ and arg_497_1.time_ <= var_500_16 + arg_500_0 then
				arg_497_1.var_.moveOldPos1015ui_story = var_500_15.localPosition
			end

			local var_500_17 = 0.001

			if var_500_16 <= arg_497_1.time_ and arg_497_1.time_ < var_500_16 + var_500_17 then
				local var_500_18 = (arg_497_1.time_ - var_500_16) / var_500_17
				local var_500_19 = Vector3.New(0, 100, 0)

				var_500_15.localPosition = Vector3.Lerp(arg_497_1.var_.moveOldPos1015ui_story, var_500_19, var_500_18)

				local var_500_20 = manager.ui.mainCamera.transform.position - var_500_15.position

				var_500_15.forward = Vector3.New(var_500_20.x, var_500_20.y, var_500_20.z)

				local var_500_21 = var_500_15.localEulerAngles

				var_500_21.z = 0
				var_500_21.x = 0
				var_500_15.localEulerAngles = var_500_21
			end

			if arg_497_1.time_ >= var_500_16 + var_500_17 and arg_497_1.time_ < var_500_16 + var_500_17 + arg_500_0 then
				var_500_15.localPosition = Vector3.New(0, 100, 0)

				local var_500_22 = manager.ui.mainCamera.transform.position - var_500_15.position

				var_500_15.forward = Vector3.New(var_500_22.x, var_500_22.y, var_500_22.z)

				local var_500_23 = var_500_15.localEulerAngles

				var_500_23.z = 0
				var_500_23.x = 0
				var_500_15.localEulerAngles = var_500_23
			end

			local var_500_24 = arg_497_1.actors_["1015ui_story"]
			local var_500_25 = 0

			if var_500_25 < arg_497_1.time_ and arg_497_1.time_ <= var_500_25 + arg_500_0 and arg_497_1.var_.characterEffect1015ui_story == nil then
				arg_497_1.var_.characterEffect1015ui_story = var_500_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_26 = 0.200000002980232

			if var_500_25 <= arg_497_1.time_ and arg_497_1.time_ < var_500_25 + var_500_26 then
				local var_500_27 = (arg_497_1.time_ - var_500_25) / var_500_26

				if arg_497_1.var_.characterEffect1015ui_story then
					local var_500_28 = Mathf.Lerp(0, 0.5, var_500_27)

					arg_497_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_497_1.var_.characterEffect1015ui_story.fillRatio = var_500_28
				end
			end

			if arg_497_1.time_ >= var_500_25 + var_500_26 and arg_497_1.time_ < var_500_25 + var_500_26 + arg_500_0 and arg_497_1.var_.characterEffect1015ui_story then
				local var_500_29 = 0.5

				arg_497_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_497_1.var_.characterEffect1015ui_story.fillRatio = var_500_29
			end

			local var_500_30 = 0
			local var_500_31 = 0.375

			if var_500_30 < arg_497_1.time_ and arg_497_1.time_ <= var_500_30 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_32 = arg_497_1:FormatText(StoryNameCfg[264].name)

				arg_497_1.leftNameTxt_.text = var_500_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_33 = arg_497_1:GetWordFromCfg(318301121)
				local var_500_34 = arg_497_1:FormatText(var_500_33.content)

				arg_497_1.text_.text = var_500_34

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_35 = 15
				local var_500_36 = utf8.len(var_500_34)
				local var_500_37 = var_500_35 <= 0 and var_500_31 or var_500_31 * (var_500_36 / var_500_35)

				if var_500_37 > 0 and var_500_31 < var_500_37 then
					arg_497_1.talkMaxDuration = var_500_37

					if var_500_37 + var_500_30 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_37 + var_500_30
					end
				end

				arg_497_1.text_.text = var_500_34
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301121", "story_v_out_318301.awb") ~= 0 then
					local var_500_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301121", "story_v_out_318301.awb") / 1000

					if var_500_38 + var_500_30 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_38 + var_500_30
					end

					if var_500_33.prefab_name ~= "" and arg_497_1.actors_[var_500_33.prefab_name] ~= nil then
						local var_500_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_497_1.actors_[var_500_33.prefab_name].transform, "story_v_out_318301", "318301121", "story_v_out_318301.awb")

						arg_497_1:RecordAudio("318301121", var_500_39)
						arg_497_1:RecordAudio("318301121", var_500_39)
					else
						arg_497_1:AudioAction("play", "voice", "story_v_out_318301", "318301121", "story_v_out_318301.awb")
					end

					arg_497_1:RecordHistoryTalkVoice("story_v_out_318301", "318301121", "story_v_out_318301.awb")
				end

				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_40 = math.max(var_500_31, arg_497_1.talkMaxDuration)

			if var_500_30 <= arg_497_1.time_ and arg_497_1.time_ < var_500_30 + var_500_40 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_30) / var_500_40

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_30 + var_500_40 and arg_497_1.time_ < var_500_30 + var_500_40 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play318301122 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 318301122
		arg_501_1.duration_ = 9.5

		local var_501_0 = {
			zh = 6.4,
			ja = 9.5
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
				arg_501_0:Play318301123(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 0
			local var_504_1 = 0.775

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_2 = arg_501_1:FormatText(StoryNameCfg[264].name)

				arg_501_1.leftNameTxt_.text = var_504_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_3 = arg_501_1:GetWordFromCfg(318301122)
				local var_504_4 = arg_501_1:FormatText(var_504_3.content)

				arg_501_1.text_.text = var_504_4

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301122", "story_v_out_318301.awb") ~= 0 then
					local var_504_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301122", "story_v_out_318301.awb") / 1000

					if var_504_8 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_8 + var_504_0
					end

					if var_504_3.prefab_name ~= "" and arg_501_1.actors_[var_504_3.prefab_name] ~= nil then
						local var_504_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_3.prefab_name].transform, "story_v_out_318301", "318301122", "story_v_out_318301.awb")

						arg_501_1:RecordAudio("318301122", var_504_9)
						arg_501_1:RecordAudio("318301122", var_504_9)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_318301", "318301122", "story_v_out_318301.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_318301", "318301122", "story_v_out_318301.awb")
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
	Play318301123 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 318301123
		arg_505_1.duration_ = 8.066

		local var_505_0 = {
			zh = 4.533,
			ja = 8.066
		}
		local var_505_1 = manager.audio:GetLocalizationFlag()

		if var_505_0[var_505_1] ~= nil then
			arg_505_1.duration_ = var_505_0[var_505_1]
		end

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play318301124(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = arg_505_1.actors_["1015ui_story"].transform
			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 then
				arg_505_1.var_.moveOldPos1015ui_story = var_508_0.localPosition
			end

			local var_508_2 = 0.001

			if var_508_1 <= arg_505_1.time_ and arg_505_1.time_ < var_508_1 + var_508_2 then
				local var_508_3 = (arg_505_1.time_ - var_508_1) / var_508_2
				local var_508_4 = Vector3.New(0, -1.15, -6.2)

				var_508_0.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos1015ui_story, var_508_4, var_508_3)

				local var_508_5 = manager.ui.mainCamera.transform.position - var_508_0.position

				var_508_0.forward = Vector3.New(var_508_5.x, var_508_5.y, var_508_5.z)

				local var_508_6 = var_508_0.localEulerAngles

				var_508_6.z = 0
				var_508_6.x = 0
				var_508_0.localEulerAngles = var_508_6
			end

			if arg_505_1.time_ >= var_508_1 + var_508_2 and arg_505_1.time_ < var_508_1 + var_508_2 + arg_508_0 then
				var_508_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_508_7 = manager.ui.mainCamera.transform.position - var_508_0.position

				var_508_0.forward = Vector3.New(var_508_7.x, var_508_7.y, var_508_7.z)

				local var_508_8 = var_508_0.localEulerAngles

				var_508_8.z = 0
				var_508_8.x = 0
				var_508_0.localEulerAngles = var_508_8
			end

			local var_508_9 = arg_505_1.actors_["1015ui_story"]
			local var_508_10 = 0

			if var_508_10 < arg_505_1.time_ and arg_505_1.time_ <= var_508_10 + arg_508_0 and arg_505_1.var_.characterEffect1015ui_story == nil then
				arg_505_1.var_.characterEffect1015ui_story = var_508_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_11 = 0.200000002980232

			if var_508_10 <= arg_505_1.time_ and arg_505_1.time_ < var_508_10 + var_508_11 then
				local var_508_12 = (arg_505_1.time_ - var_508_10) / var_508_11

				if arg_505_1.var_.characterEffect1015ui_story then
					arg_505_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_505_1.time_ >= var_508_10 + var_508_11 and arg_505_1.time_ < var_508_10 + var_508_11 + arg_508_0 and arg_505_1.var_.characterEffect1015ui_story then
				arg_505_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_508_13 = 0

			if var_508_13 < arg_505_1.time_ and arg_505_1.time_ <= var_508_13 + arg_508_0 then
				arg_505_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_508_14 = 0

			if var_508_14 < arg_505_1.time_ and arg_505_1.time_ <= var_508_14 + arg_508_0 then
				arg_505_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_508_15 = arg_505_1.actors_["10014ui_story"].transform
			local var_508_16 = 0

			if var_508_16 < arg_505_1.time_ and arg_505_1.time_ <= var_508_16 + arg_508_0 then
				arg_505_1.var_.moveOldPos10014ui_story = var_508_15.localPosition
			end

			local var_508_17 = 0.001

			if var_508_16 <= arg_505_1.time_ and arg_505_1.time_ < var_508_16 + var_508_17 then
				local var_508_18 = (arg_505_1.time_ - var_508_16) / var_508_17
				local var_508_19 = Vector3.New(0, 100, 0)

				var_508_15.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos10014ui_story, var_508_19, var_508_18)

				local var_508_20 = manager.ui.mainCamera.transform.position - var_508_15.position

				var_508_15.forward = Vector3.New(var_508_20.x, var_508_20.y, var_508_20.z)

				local var_508_21 = var_508_15.localEulerAngles

				var_508_21.z = 0
				var_508_21.x = 0
				var_508_15.localEulerAngles = var_508_21
			end

			if arg_505_1.time_ >= var_508_16 + var_508_17 and arg_505_1.time_ < var_508_16 + var_508_17 + arg_508_0 then
				var_508_15.localPosition = Vector3.New(0, 100, 0)

				local var_508_22 = manager.ui.mainCamera.transform.position - var_508_15.position

				var_508_15.forward = Vector3.New(var_508_22.x, var_508_22.y, var_508_22.z)

				local var_508_23 = var_508_15.localEulerAngles

				var_508_23.z = 0
				var_508_23.x = 0
				var_508_15.localEulerAngles = var_508_23
			end

			local var_508_24 = arg_505_1.actors_["10014ui_story"]
			local var_508_25 = 0

			if var_508_25 < arg_505_1.time_ and arg_505_1.time_ <= var_508_25 + arg_508_0 and arg_505_1.var_.characterEffect10014ui_story == nil then
				arg_505_1.var_.characterEffect10014ui_story = var_508_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_26 = 0.200000002980232

			if var_508_25 <= arg_505_1.time_ and arg_505_1.time_ < var_508_25 + var_508_26 then
				local var_508_27 = (arg_505_1.time_ - var_508_25) / var_508_26

				if arg_505_1.var_.characterEffect10014ui_story then
					local var_508_28 = Mathf.Lerp(0, 0.5, var_508_27)

					arg_505_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_505_1.var_.characterEffect10014ui_story.fillRatio = var_508_28
				end
			end

			if arg_505_1.time_ >= var_508_25 + var_508_26 and arg_505_1.time_ < var_508_25 + var_508_26 + arg_508_0 and arg_505_1.var_.characterEffect10014ui_story then
				local var_508_29 = 0.5

				arg_505_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_505_1.var_.characterEffect10014ui_story.fillRatio = var_508_29
			end

			local var_508_30 = 0
			local var_508_31 = 0.45

			if var_508_30 < arg_505_1.time_ and arg_505_1.time_ <= var_508_30 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_32 = arg_505_1:FormatText(StoryNameCfg[479].name)

				arg_505_1.leftNameTxt_.text = var_508_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_33 = arg_505_1:GetWordFromCfg(318301123)
				local var_508_34 = arg_505_1:FormatText(var_508_33.content)

				arg_505_1.text_.text = var_508_34

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_35 = 18
				local var_508_36 = utf8.len(var_508_34)
				local var_508_37 = var_508_35 <= 0 and var_508_31 or var_508_31 * (var_508_36 / var_508_35)

				if var_508_37 > 0 and var_508_31 < var_508_37 then
					arg_505_1.talkMaxDuration = var_508_37

					if var_508_37 + var_508_30 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_37 + var_508_30
					end
				end

				arg_505_1.text_.text = var_508_34
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301123", "story_v_out_318301.awb") ~= 0 then
					local var_508_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301123", "story_v_out_318301.awb") / 1000

					if var_508_38 + var_508_30 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_38 + var_508_30
					end

					if var_508_33.prefab_name ~= "" and arg_505_1.actors_[var_508_33.prefab_name] ~= nil then
						local var_508_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_33.prefab_name].transform, "story_v_out_318301", "318301123", "story_v_out_318301.awb")

						arg_505_1:RecordAudio("318301123", var_508_39)
						arg_505_1:RecordAudio("318301123", var_508_39)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_out_318301", "318301123", "story_v_out_318301.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_out_318301", "318301123", "story_v_out_318301.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_40 = math.max(var_508_31, arg_505_1.talkMaxDuration)

			if var_508_30 <= arg_505_1.time_ and arg_505_1.time_ < var_508_30 + var_508_40 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_30) / var_508_40

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_30 + var_508_40 and arg_505_1.time_ < var_508_30 + var_508_40 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play318301124 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 318301124
		arg_509_1.duration_ = 4.1

		local var_509_0 = {
			zh = 3.366,
			ja = 4.1
		}
		local var_509_1 = manager.audio:GetLocalizationFlag()

		if var_509_0[var_509_1] ~= nil then
			arg_509_1.duration_ = var_509_0[var_509_1]
		end

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play318301125(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["10014ui_story"].transform
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 then
				arg_509_1.var_.moveOldPos10014ui_story = var_512_0.localPosition
			end

			local var_512_2 = 0.001

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2
				local var_512_4 = Vector3.New(0, -1.06, -6.2)

				var_512_0.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos10014ui_story, var_512_4, var_512_3)

				local var_512_5 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_5.x, var_512_5.y, var_512_5.z)

				local var_512_6 = var_512_0.localEulerAngles

				var_512_6.z = 0
				var_512_6.x = 0
				var_512_0.localEulerAngles = var_512_6
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 then
				var_512_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_512_7 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_7.x, var_512_7.y, var_512_7.z)

				local var_512_8 = var_512_0.localEulerAngles

				var_512_8.z = 0
				var_512_8.x = 0
				var_512_0.localEulerAngles = var_512_8
			end

			local var_512_9 = arg_509_1.actors_["10014ui_story"]
			local var_512_10 = 0

			if var_512_10 < arg_509_1.time_ and arg_509_1.time_ <= var_512_10 + arg_512_0 and arg_509_1.var_.characterEffect10014ui_story == nil then
				arg_509_1.var_.characterEffect10014ui_story = var_512_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_11 = 0.200000002980232

			if var_512_10 <= arg_509_1.time_ and arg_509_1.time_ < var_512_10 + var_512_11 then
				local var_512_12 = (arg_509_1.time_ - var_512_10) / var_512_11

				if arg_509_1.var_.characterEffect10014ui_story then
					arg_509_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_509_1.time_ >= var_512_10 + var_512_11 and arg_509_1.time_ < var_512_10 + var_512_11 + arg_512_0 and arg_509_1.var_.characterEffect10014ui_story then
				arg_509_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_512_13 = 0

			if var_512_13 < arg_509_1.time_ and arg_509_1.time_ <= var_512_13 + arg_512_0 then
				arg_509_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_512_14 = arg_509_1.actors_["1015ui_story"].transform
			local var_512_15 = 0

			if var_512_15 < arg_509_1.time_ and arg_509_1.time_ <= var_512_15 + arg_512_0 then
				arg_509_1.var_.moveOldPos1015ui_story = var_512_14.localPosition
			end

			local var_512_16 = 0.001

			if var_512_15 <= arg_509_1.time_ and arg_509_1.time_ < var_512_15 + var_512_16 then
				local var_512_17 = (arg_509_1.time_ - var_512_15) / var_512_16
				local var_512_18 = Vector3.New(0, 100, 0)

				var_512_14.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos1015ui_story, var_512_18, var_512_17)

				local var_512_19 = manager.ui.mainCamera.transform.position - var_512_14.position

				var_512_14.forward = Vector3.New(var_512_19.x, var_512_19.y, var_512_19.z)

				local var_512_20 = var_512_14.localEulerAngles

				var_512_20.z = 0
				var_512_20.x = 0
				var_512_14.localEulerAngles = var_512_20
			end

			if arg_509_1.time_ >= var_512_15 + var_512_16 and arg_509_1.time_ < var_512_15 + var_512_16 + arg_512_0 then
				var_512_14.localPosition = Vector3.New(0, 100, 0)

				local var_512_21 = manager.ui.mainCamera.transform.position - var_512_14.position

				var_512_14.forward = Vector3.New(var_512_21.x, var_512_21.y, var_512_21.z)

				local var_512_22 = var_512_14.localEulerAngles

				var_512_22.z = 0
				var_512_22.x = 0
				var_512_14.localEulerAngles = var_512_22
			end

			local var_512_23 = arg_509_1.actors_["1015ui_story"]
			local var_512_24 = 0

			if var_512_24 < arg_509_1.time_ and arg_509_1.time_ <= var_512_24 + arg_512_0 and arg_509_1.var_.characterEffect1015ui_story == nil then
				arg_509_1.var_.characterEffect1015ui_story = var_512_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_25 = 0.200000002980232

			if var_512_24 <= arg_509_1.time_ and arg_509_1.time_ < var_512_24 + var_512_25 then
				local var_512_26 = (arg_509_1.time_ - var_512_24) / var_512_25

				if arg_509_1.var_.characterEffect1015ui_story then
					local var_512_27 = Mathf.Lerp(0, 0.5, var_512_26)

					arg_509_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_509_1.var_.characterEffect1015ui_story.fillRatio = var_512_27
				end
			end

			if arg_509_1.time_ >= var_512_24 + var_512_25 and arg_509_1.time_ < var_512_24 + var_512_25 + arg_512_0 and arg_509_1.var_.characterEffect1015ui_story then
				local var_512_28 = 0.5

				arg_509_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_509_1.var_.characterEffect1015ui_story.fillRatio = var_512_28
			end

			local var_512_29 = 0
			local var_512_30 = 0.425

			if var_512_29 < arg_509_1.time_ and arg_509_1.time_ <= var_512_29 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_31 = arg_509_1:FormatText(StoryNameCfg[264].name)

				arg_509_1.leftNameTxt_.text = var_512_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_32 = arg_509_1:GetWordFromCfg(318301124)
				local var_512_33 = arg_509_1:FormatText(var_512_32.content)

				arg_509_1.text_.text = var_512_33

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_34 = 17
				local var_512_35 = utf8.len(var_512_33)
				local var_512_36 = var_512_34 <= 0 and var_512_30 or var_512_30 * (var_512_35 / var_512_34)

				if var_512_36 > 0 and var_512_30 < var_512_36 then
					arg_509_1.talkMaxDuration = var_512_36

					if var_512_36 + var_512_29 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_36 + var_512_29
					end
				end

				arg_509_1.text_.text = var_512_33
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301124", "story_v_out_318301.awb") ~= 0 then
					local var_512_37 = manager.audio:GetVoiceLength("story_v_out_318301", "318301124", "story_v_out_318301.awb") / 1000

					if var_512_37 + var_512_29 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_37 + var_512_29
					end

					if var_512_32.prefab_name ~= "" and arg_509_1.actors_[var_512_32.prefab_name] ~= nil then
						local var_512_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_509_1.actors_[var_512_32.prefab_name].transform, "story_v_out_318301", "318301124", "story_v_out_318301.awb")

						arg_509_1:RecordAudio("318301124", var_512_38)
						arg_509_1:RecordAudio("318301124", var_512_38)
					else
						arg_509_1:AudioAction("play", "voice", "story_v_out_318301", "318301124", "story_v_out_318301.awb")
					end

					arg_509_1:RecordHistoryTalkVoice("story_v_out_318301", "318301124", "story_v_out_318301.awb")
				end

				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_39 = math.max(var_512_30, arg_509_1.talkMaxDuration)

			if var_512_29 <= arg_509_1.time_ and arg_509_1.time_ < var_512_29 + var_512_39 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_29) / var_512_39

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_29 + var_512_39 and arg_509_1.time_ < var_512_29 + var_512_39 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play318301125 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 318301125
		arg_513_1.duration_ = 3.566

		local var_513_0 = {
			zh = 2.633,
			ja = 3.566
		}
		local var_513_1 = manager.audio:GetLocalizationFlag()

		if var_513_0[var_513_1] ~= nil then
			arg_513_1.duration_ = var_513_0[var_513_1]
		end

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play318301126(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = 0
			local var_516_1 = 0.325

			if var_516_0 < arg_513_1.time_ and arg_513_1.time_ <= var_516_0 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_2 = arg_513_1:FormatText(StoryNameCfg[264].name)

				arg_513_1.leftNameTxt_.text = var_516_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_3 = arg_513_1:GetWordFromCfg(318301125)
				local var_516_4 = arg_513_1:FormatText(var_516_3.content)

				arg_513_1.text_.text = var_516_4

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_5 = 13
				local var_516_6 = utf8.len(var_516_4)
				local var_516_7 = var_516_5 <= 0 and var_516_1 or var_516_1 * (var_516_6 / var_516_5)

				if var_516_7 > 0 and var_516_1 < var_516_7 then
					arg_513_1.talkMaxDuration = var_516_7

					if var_516_7 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_7 + var_516_0
					end
				end

				arg_513_1.text_.text = var_516_4
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301125", "story_v_out_318301.awb") ~= 0 then
					local var_516_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301125", "story_v_out_318301.awb") / 1000

					if var_516_8 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_8 + var_516_0
					end

					if var_516_3.prefab_name ~= "" and arg_513_1.actors_[var_516_3.prefab_name] ~= nil then
						local var_516_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_3.prefab_name].transform, "story_v_out_318301", "318301125", "story_v_out_318301.awb")

						arg_513_1:RecordAudio("318301125", var_516_9)
						arg_513_1:RecordAudio("318301125", var_516_9)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_318301", "318301125", "story_v_out_318301.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_318301", "318301125", "story_v_out_318301.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_10 = math.max(var_516_1, arg_513_1.talkMaxDuration)

			if var_516_0 <= arg_513_1.time_ and arg_513_1.time_ < var_516_0 + var_516_10 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_0) / var_516_10

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_0 + var_516_10 and arg_513_1.time_ < var_516_0 + var_516_10 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play318301126 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 318301126
		arg_517_1.duration_ = 1.566

		local var_517_0 = {
			zh = 1.533,
			ja = 1.566
		}
		local var_517_1 = manager.audio:GetLocalizationFlag()

		if var_517_0[var_517_1] ~= nil then
			arg_517_1.duration_ = var_517_0[var_517_1]
		end

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play318301127(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["1015ui_story"].transform
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 then
				arg_517_1.var_.moveOldPos1015ui_story = var_520_0.localPosition
			end

			local var_520_2 = 0.001

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2
				local var_520_4 = Vector3.New(0, -1.15, -6.2)

				var_520_0.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos1015ui_story, var_520_4, var_520_3)

				local var_520_5 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_5.x, var_520_5.y, var_520_5.z)

				local var_520_6 = var_520_0.localEulerAngles

				var_520_6.z = 0
				var_520_6.x = 0
				var_520_0.localEulerAngles = var_520_6
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 then
				var_520_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_520_7 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_7.x, var_520_7.y, var_520_7.z)

				local var_520_8 = var_520_0.localEulerAngles

				var_520_8.z = 0
				var_520_8.x = 0
				var_520_0.localEulerAngles = var_520_8
			end

			local var_520_9 = arg_517_1.actors_["1015ui_story"]
			local var_520_10 = 0

			if var_520_10 < arg_517_1.time_ and arg_517_1.time_ <= var_520_10 + arg_520_0 and arg_517_1.var_.characterEffect1015ui_story == nil then
				arg_517_1.var_.characterEffect1015ui_story = var_520_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_11 = 0.200000002980232

			if var_520_10 <= arg_517_1.time_ and arg_517_1.time_ < var_520_10 + var_520_11 then
				local var_520_12 = (arg_517_1.time_ - var_520_10) / var_520_11

				if arg_517_1.var_.characterEffect1015ui_story then
					arg_517_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_517_1.time_ >= var_520_10 + var_520_11 and arg_517_1.time_ < var_520_10 + var_520_11 + arg_520_0 and arg_517_1.var_.characterEffect1015ui_story then
				arg_517_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_520_13 = 0

			if var_520_13 < arg_517_1.time_ and arg_517_1.time_ <= var_520_13 + arg_520_0 then
				arg_517_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_520_14 = 0

			if var_520_14 < arg_517_1.time_ and arg_517_1.time_ <= var_520_14 + arg_520_0 then
				arg_517_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_520_15 = arg_517_1.actors_["10014ui_story"].transform
			local var_520_16 = 0

			if var_520_16 < arg_517_1.time_ and arg_517_1.time_ <= var_520_16 + arg_520_0 then
				arg_517_1.var_.moveOldPos10014ui_story = var_520_15.localPosition
			end

			local var_520_17 = 0.001

			if var_520_16 <= arg_517_1.time_ and arg_517_1.time_ < var_520_16 + var_520_17 then
				local var_520_18 = (arg_517_1.time_ - var_520_16) / var_520_17
				local var_520_19 = Vector3.New(0, 100, 0)

				var_520_15.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos10014ui_story, var_520_19, var_520_18)

				local var_520_20 = manager.ui.mainCamera.transform.position - var_520_15.position

				var_520_15.forward = Vector3.New(var_520_20.x, var_520_20.y, var_520_20.z)

				local var_520_21 = var_520_15.localEulerAngles

				var_520_21.z = 0
				var_520_21.x = 0
				var_520_15.localEulerAngles = var_520_21
			end

			if arg_517_1.time_ >= var_520_16 + var_520_17 and arg_517_1.time_ < var_520_16 + var_520_17 + arg_520_0 then
				var_520_15.localPosition = Vector3.New(0, 100, 0)

				local var_520_22 = manager.ui.mainCamera.transform.position - var_520_15.position

				var_520_15.forward = Vector3.New(var_520_22.x, var_520_22.y, var_520_22.z)

				local var_520_23 = var_520_15.localEulerAngles

				var_520_23.z = 0
				var_520_23.x = 0
				var_520_15.localEulerAngles = var_520_23
			end

			local var_520_24 = arg_517_1.actors_["10014ui_story"]
			local var_520_25 = 0

			if var_520_25 < arg_517_1.time_ and arg_517_1.time_ <= var_520_25 + arg_520_0 and arg_517_1.var_.characterEffect10014ui_story == nil then
				arg_517_1.var_.characterEffect10014ui_story = var_520_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_26 = 0.200000002980232

			if var_520_25 <= arg_517_1.time_ and arg_517_1.time_ < var_520_25 + var_520_26 then
				local var_520_27 = (arg_517_1.time_ - var_520_25) / var_520_26

				if arg_517_1.var_.characterEffect10014ui_story then
					local var_520_28 = Mathf.Lerp(0, 0.5, var_520_27)

					arg_517_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_517_1.var_.characterEffect10014ui_story.fillRatio = var_520_28
				end
			end

			if arg_517_1.time_ >= var_520_25 + var_520_26 and arg_517_1.time_ < var_520_25 + var_520_26 + arg_520_0 and arg_517_1.var_.characterEffect10014ui_story then
				local var_520_29 = 0.5

				arg_517_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_517_1.var_.characterEffect10014ui_story.fillRatio = var_520_29
			end

			local var_520_30 = 0
			local var_520_31 = 0.1

			if var_520_30 < arg_517_1.time_ and arg_517_1.time_ <= var_520_30 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_32 = arg_517_1:FormatText(StoryNameCfg[479].name)

				arg_517_1.leftNameTxt_.text = var_520_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_33 = arg_517_1:GetWordFromCfg(318301126)
				local var_520_34 = arg_517_1:FormatText(var_520_33.content)

				arg_517_1.text_.text = var_520_34

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_35 = 4
				local var_520_36 = utf8.len(var_520_34)
				local var_520_37 = var_520_35 <= 0 and var_520_31 or var_520_31 * (var_520_36 / var_520_35)

				if var_520_37 > 0 and var_520_31 < var_520_37 then
					arg_517_1.talkMaxDuration = var_520_37

					if var_520_37 + var_520_30 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_37 + var_520_30
					end
				end

				arg_517_1.text_.text = var_520_34
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301126", "story_v_out_318301.awb") ~= 0 then
					local var_520_38 = manager.audio:GetVoiceLength("story_v_out_318301", "318301126", "story_v_out_318301.awb") / 1000

					if var_520_38 + var_520_30 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_38 + var_520_30
					end

					if var_520_33.prefab_name ~= "" and arg_517_1.actors_[var_520_33.prefab_name] ~= nil then
						local var_520_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_33.prefab_name].transform, "story_v_out_318301", "318301126", "story_v_out_318301.awb")

						arg_517_1:RecordAudio("318301126", var_520_39)
						arg_517_1:RecordAudio("318301126", var_520_39)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_318301", "318301126", "story_v_out_318301.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_318301", "318301126", "story_v_out_318301.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_40 = math.max(var_520_31, arg_517_1.talkMaxDuration)

			if var_520_30 <= arg_517_1.time_ and arg_517_1.time_ < var_520_30 + var_520_40 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_30) / var_520_40

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_30 + var_520_40 and arg_517_1.time_ < var_520_30 + var_520_40 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play318301127 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 318301127
		arg_521_1.duration_ = 5

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play318301128(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["1015ui_story"].transform
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 then
				arg_521_1.var_.moveOldPos1015ui_story = var_524_0.localPosition
			end

			local var_524_2 = 0.001

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2
				local var_524_4 = Vector3.New(0, 100, 0)

				var_524_0.localPosition = Vector3.Lerp(arg_521_1.var_.moveOldPos1015ui_story, var_524_4, var_524_3)

				local var_524_5 = manager.ui.mainCamera.transform.position - var_524_0.position

				var_524_0.forward = Vector3.New(var_524_5.x, var_524_5.y, var_524_5.z)

				local var_524_6 = var_524_0.localEulerAngles

				var_524_6.z = 0
				var_524_6.x = 0
				var_524_0.localEulerAngles = var_524_6
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 then
				var_524_0.localPosition = Vector3.New(0, 100, 0)

				local var_524_7 = manager.ui.mainCamera.transform.position - var_524_0.position

				var_524_0.forward = Vector3.New(var_524_7.x, var_524_7.y, var_524_7.z)

				local var_524_8 = var_524_0.localEulerAngles

				var_524_8.z = 0
				var_524_8.x = 0
				var_524_0.localEulerAngles = var_524_8
			end

			local var_524_9 = arg_521_1.actors_["1015ui_story"]
			local var_524_10 = 0

			if var_524_10 < arg_521_1.time_ and arg_521_1.time_ <= var_524_10 + arg_524_0 and arg_521_1.var_.characterEffect1015ui_story == nil then
				arg_521_1.var_.characterEffect1015ui_story = var_524_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_11 = 0.200000002980232

			if var_524_10 <= arg_521_1.time_ and arg_521_1.time_ < var_524_10 + var_524_11 then
				local var_524_12 = (arg_521_1.time_ - var_524_10) / var_524_11

				if arg_521_1.var_.characterEffect1015ui_story then
					local var_524_13 = Mathf.Lerp(0, 0.5, var_524_12)

					arg_521_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_521_1.var_.characterEffect1015ui_story.fillRatio = var_524_13
				end
			end

			if arg_521_1.time_ >= var_524_10 + var_524_11 and arg_521_1.time_ < var_524_10 + var_524_11 + arg_524_0 and arg_521_1.var_.characterEffect1015ui_story then
				local var_524_14 = 0.5

				arg_521_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_521_1.var_.characterEffect1015ui_story.fillRatio = var_524_14
			end

			local var_524_15 = 0
			local var_524_16 = 0.725

			if var_524_15 < arg_521_1.time_ and arg_521_1.time_ <= var_524_15 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, false)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_17 = arg_521_1:GetWordFromCfg(318301127)
				local var_524_18 = arg_521_1:FormatText(var_524_17.content)

				arg_521_1.text_.text = var_524_18

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_19 = 29
				local var_524_20 = utf8.len(var_524_18)
				local var_524_21 = var_524_19 <= 0 and var_524_16 or var_524_16 * (var_524_20 / var_524_19)

				if var_524_21 > 0 and var_524_16 < var_524_21 then
					arg_521_1.talkMaxDuration = var_524_21

					if var_524_21 + var_524_15 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_21 + var_524_15
					end
				end

				arg_521_1.text_.text = var_524_18
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)
				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_22 = math.max(var_524_16, arg_521_1.talkMaxDuration)

			if var_524_15 <= arg_521_1.time_ and arg_521_1.time_ < var_524_15 + var_524_22 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_15) / var_524_22

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_15 + var_524_22 and arg_521_1.time_ < var_524_15 + var_524_22 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play318301128 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 318301128
		arg_525_1.duration_ = 6.166

		local var_525_0 = {
			zh = 4.1,
			ja = 6.166
		}
		local var_525_1 = manager.audio:GetLocalizationFlag()

		if var_525_0[var_525_1] ~= nil then
			arg_525_1.duration_ = var_525_0[var_525_1]
		end

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play318301129(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = arg_525_1.actors_["1015ui_story"].transform
			local var_528_1 = 0

			if var_528_1 < arg_525_1.time_ and arg_525_1.time_ <= var_528_1 + arg_528_0 then
				arg_525_1.var_.moveOldPos1015ui_story = var_528_0.localPosition
			end

			local var_528_2 = 0.001

			if var_528_1 <= arg_525_1.time_ and arg_525_1.time_ < var_528_1 + var_528_2 then
				local var_528_3 = (arg_525_1.time_ - var_528_1) / var_528_2
				local var_528_4 = Vector3.New(0, -1.15, -6.2)

				var_528_0.localPosition = Vector3.Lerp(arg_525_1.var_.moveOldPos1015ui_story, var_528_4, var_528_3)

				local var_528_5 = manager.ui.mainCamera.transform.position - var_528_0.position

				var_528_0.forward = Vector3.New(var_528_5.x, var_528_5.y, var_528_5.z)

				local var_528_6 = var_528_0.localEulerAngles

				var_528_6.z = 0
				var_528_6.x = 0
				var_528_0.localEulerAngles = var_528_6
			end

			if arg_525_1.time_ >= var_528_1 + var_528_2 and arg_525_1.time_ < var_528_1 + var_528_2 + arg_528_0 then
				var_528_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_528_7 = manager.ui.mainCamera.transform.position - var_528_0.position

				var_528_0.forward = Vector3.New(var_528_7.x, var_528_7.y, var_528_7.z)

				local var_528_8 = var_528_0.localEulerAngles

				var_528_8.z = 0
				var_528_8.x = 0
				var_528_0.localEulerAngles = var_528_8
			end

			local var_528_9 = arg_525_1.actors_["1015ui_story"]
			local var_528_10 = 0

			if var_528_10 < arg_525_1.time_ and arg_525_1.time_ <= var_528_10 + arg_528_0 and arg_525_1.var_.characterEffect1015ui_story == nil then
				arg_525_1.var_.characterEffect1015ui_story = var_528_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_528_11 = 0.200000002980232

			if var_528_10 <= arg_525_1.time_ and arg_525_1.time_ < var_528_10 + var_528_11 then
				local var_528_12 = (arg_525_1.time_ - var_528_10) / var_528_11

				if arg_525_1.var_.characterEffect1015ui_story then
					arg_525_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_525_1.time_ >= var_528_10 + var_528_11 and arg_525_1.time_ < var_528_10 + var_528_11 + arg_528_0 and arg_525_1.var_.characterEffect1015ui_story then
				arg_525_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_528_13 = 0

			if var_528_13 < arg_525_1.time_ and arg_525_1.time_ <= var_528_13 + arg_528_0 then
				arg_525_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_528_14 = 0

			if var_528_14 < arg_525_1.time_ and arg_525_1.time_ <= var_528_14 + arg_528_0 then
				arg_525_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_528_15 = 0
			local var_528_16 = 0.275

			if var_528_15 < arg_525_1.time_ and arg_525_1.time_ <= var_528_15 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_17 = arg_525_1:FormatText(StoryNameCfg[479].name)

				arg_525_1.leftNameTxt_.text = var_528_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_18 = arg_525_1:GetWordFromCfg(318301128)
				local var_528_19 = arg_525_1:FormatText(var_528_18.content)

				arg_525_1.text_.text = var_528_19

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_20 = 11
				local var_528_21 = utf8.len(var_528_19)
				local var_528_22 = var_528_20 <= 0 and var_528_16 or var_528_16 * (var_528_21 / var_528_20)

				if var_528_22 > 0 and var_528_16 < var_528_22 then
					arg_525_1.talkMaxDuration = var_528_22

					if var_528_22 + var_528_15 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_22 + var_528_15
					end
				end

				arg_525_1.text_.text = var_528_19
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301128", "story_v_out_318301.awb") ~= 0 then
					local var_528_23 = manager.audio:GetVoiceLength("story_v_out_318301", "318301128", "story_v_out_318301.awb") / 1000

					if var_528_23 + var_528_15 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_23 + var_528_15
					end

					if var_528_18.prefab_name ~= "" and arg_525_1.actors_[var_528_18.prefab_name] ~= nil then
						local var_528_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_18.prefab_name].transform, "story_v_out_318301", "318301128", "story_v_out_318301.awb")

						arg_525_1:RecordAudio("318301128", var_528_24)
						arg_525_1:RecordAudio("318301128", var_528_24)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_out_318301", "318301128", "story_v_out_318301.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_out_318301", "318301128", "story_v_out_318301.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_25 = math.max(var_528_16, arg_525_1.talkMaxDuration)

			if var_528_15 <= arg_525_1.time_ and arg_525_1.time_ < var_528_15 + var_528_25 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_15) / var_528_25

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_15 + var_528_25 and arg_525_1.time_ < var_528_15 + var_528_25 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play318301129 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 318301129
		arg_529_1.duration_ = 9

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play318301130(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = "K05g"

			if arg_529_1.bgs_[var_532_0] == nil then
				local var_532_1 = Object.Instantiate(arg_529_1.paintGo_)

				var_532_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_532_0)
				var_532_1.name = var_532_0
				var_532_1.transform.parent = arg_529_1.stage_.transform
				var_532_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_529_1.bgs_[var_532_0] = var_532_1
			end

			local var_532_2 = 2

			if var_532_2 < arg_529_1.time_ and arg_529_1.time_ <= var_532_2 + arg_532_0 then
				local var_532_3 = manager.ui.mainCamera.transform.localPosition
				local var_532_4 = Vector3.New(0, 0, 10) + Vector3.New(var_532_3.x, var_532_3.y, 0)
				local var_532_5 = arg_529_1.bgs_.K05g

				var_532_5.transform.localPosition = var_532_4
				var_532_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_532_6 = var_532_5:GetComponent("SpriteRenderer")

				if var_532_6 and var_532_6.sprite then
					local var_532_7 = (var_532_5.transform.localPosition - var_532_3).z
					local var_532_8 = manager.ui.mainCameraCom_
					local var_532_9 = 2 * var_532_7 * Mathf.Tan(var_532_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_532_10 = var_532_9 * var_532_8.aspect
					local var_532_11 = var_532_6.sprite.bounds.size.x
					local var_532_12 = var_532_6.sprite.bounds.size.y
					local var_532_13 = var_532_10 / var_532_11
					local var_532_14 = var_532_9 / var_532_12
					local var_532_15 = var_532_14 < var_532_13 and var_532_13 or var_532_14

					var_532_5.transform.localScale = Vector3.New(var_532_15, var_532_15, 0)
				end

				for iter_532_0, iter_532_1 in pairs(arg_529_1.bgs_) do
					if iter_532_0 ~= "K05g" then
						iter_532_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_532_16 = 0

			if var_532_16 < arg_529_1.time_ and arg_529_1.time_ <= var_532_16 + arg_532_0 then
				arg_529_1.mask_.enabled = true
				arg_529_1.mask_.raycastTarget = true

				arg_529_1:SetGaussion(false)
			end

			local var_532_17 = 2

			if var_532_16 <= arg_529_1.time_ and arg_529_1.time_ < var_532_16 + var_532_17 then
				local var_532_18 = (arg_529_1.time_ - var_532_16) / var_532_17
				local var_532_19 = Color.New(0, 0, 0)

				var_532_19.a = Mathf.Lerp(0, 1, var_532_18)
				arg_529_1.mask_.color = var_532_19
			end

			if arg_529_1.time_ >= var_532_16 + var_532_17 and arg_529_1.time_ < var_532_16 + var_532_17 + arg_532_0 then
				local var_532_20 = Color.New(0, 0, 0)

				var_532_20.a = 1
				arg_529_1.mask_.color = var_532_20
			end

			local var_532_21 = 2

			if var_532_21 < arg_529_1.time_ and arg_529_1.time_ <= var_532_21 + arg_532_0 then
				arg_529_1.mask_.enabled = true
				arg_529_1.mask_.raycastTarget = true

				arg_529_1:SetGaussion(false)
			end

			local var_532_22 = 2

			if var_532_21 <= arg_529_1.time_ and arg_529_1.time_ < var_532_21 + var_532_22 then
				local var_532_23 = (arg_529_1.time_ - var_532_21) / var_532_22
				local var_532_24 = Color.New(0, 0, 0)

				var_532_24.a = Mathf.Lerp(1, 0, var_532_23)
				arg_529_1.mask_.color = var_532_24
			end

			if arg_529_1.time_ >= var_532_21 + var_532_22 and arg_529_1.time_ < var_532_21 + var_532_22 + arg_532_0 then
				local var_532_25 = Color.New(0, 0, 0)
				local var_532_26 = 0

				arg_529_1.mask_.enabled = false
				var_532_25.a = var_532_26
				arg_529_1.mask_.color = var_532_25
			end

			local var_532_27 = arg_529_1.actors_["1015ui_story"].transform
			local var_532_28 = 1.96599999815226

			if var_532_28 < arg_529_1.time_ and arg_529_1.time_ <= var_532_28 + arg_532_0 then
				arg_529_1.var_.moveOldPos1015ui_story = var_532_27.localPosition
			end

			local var_532_29 = 0.001

			if var_532_28 <= arg_529_1.time_ and arg_529_1.time_ < var_532_28 + var_532_29 then
				local var_532_30 = (arg_529_1.time_ - var_532_28) / var_532_29
				local var_532_31 = Vector3.New(0, 100, 0)

				var_532_27.localPosition = Vector3.Lerp(arg_529_1.var_.moveOldPos1015ui_story, var_532_31, var_532_30)

				local var_532_32 = manager.ui.mainCamera.transform.position - var_532_27.position

				var_532_27.forward = Vector3.New(var_532_32.x, var_532_32.y, var_532_32.z)

				local var_532_33 = var_532_27.localEulerAngles

				var_532_33.z = 0
				var_532_33.x = 0
				var_532_27.localEulerAngles = var_532_33
			end

			if arg_529_1.time_ >= var_532_28 + var_532_29 and arg_529_1.time_ < var_532_28 + var_532_29 + arg_532_0 then
				var_532_27.localPosition = Vector3.New(0, 100, 0)

				local var_532_34 = manager.ui.mainCamera.transform.position - var_532_27.position

				var_532_27.forward = Vector3.New(var_532_34.x, var_532_34.y, var_532_34.z)

				local var_532_35 = var_532_27.localEulerAngles

				var_532_35.z = 0
				var_532_35.x = 0
				var_532_27.localEulerAngles = var_532_35
			end

			local var_532_36 = arg_529_1.actors_["1015ui_story"]
			local var_532_37 = 1.96599999815226

			if var_532_37 < arg_529_1.time_ and arg_529_1.time_ <= var_532_37 + arg_532_0 and arg_529_1.var_.characterEffect1015ui_story == nil then
				arg_529_1.var_.characterEffect1015ui_story = var_532_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_38 = 0.034000001847744

			if var_532_37 <= arg_529_1.time_ and arg_529_1.time_ < var_532_37 + var_532_38 then
				local var_532_39 = (arg_529_1.time_ - var_532_37) / var_532_38

				if arg_529_1.var_.characterEffect1015ui_story then
					local var_532_40 = Mathf.Lerp(0, 0.5, var_532_39)

					arg_529_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_529_1.var_.characterEffect1015ui_story.fillRatio = var_532_40
				end
			end

			if arg_529_1.time_ >= var_532_37 + var_532_38 and arg_529_1.time_ < var_532_37 + var_532_38 + arg_532_0 and arg_529_1.var_.characterEffect1015ui_story then
				local var_532_41 = 0.5

				arg_529_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_529_1.var_.characterEffect1015ui_story.fillRatio = var_532_41
			end

			if arg_529_1.frameCnt_ <= 1 then
				arg_529_1.dialog_:SetActive(false)
			end

			local var_532_42 = 4
			local var_532_43 = 1.1

			if var_532_42 < arg_529_1.time_ and arg_529_1.time_ <= var_532_42 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0

				arg_529_1.dialog_:SetActive(true)

				local var_532_44 = LeanTween.value(arg_529_1.dialog_, 0, 1, 0.3)

				var_532_44:setOnUpdate(LuaHelper.FloatAction(function(arg_533_0)
					arg_529_1.dialogCg_.alpha = arg_533_0
				end))
				var_532_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_529_1.dialog_)
					var_532_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_529_1.duration_ = arg_529_1.duration_ + 0.3

				SetActive(arg_529_1.leftNameGo_, false)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_45 = arg_529_1:GetWordFromCfg(318301129)
				local var_532_46 = arg_529_1:FormatText(var_532_45.content)

				arg_529_1.text_.text = var_532_46

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_47 = 44
				local var_532_48 = utf8.len(var_532_46)
				local var_532_49 = var_532_47 <= 0 and var_532_43 or var_532_43 * (var_532_48 / var_532_47)

				if var_532_49 > 0 and var_532_43 < var_532_49 then
					arg_529_1.talkMaxDuration = var_532_49
					var_532_42 = var_532_42 + 0.3

					if var_532_49 + var_532_42 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_49 + var_532_42
					end
				end

				arg_529_1.text_.text = var_532_46
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_50 = var_532_42 + 0.3
			local var_532_51 = math.max(var_532_43, arg_529_1.talkMaxDuration)

			if var_532_50 <= arg_529_1.time_ and arg_529_1.time_ < var_532_50 + var_532_51 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_50) / var_532_51

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_50 + var_532_51 and arg_529_1.time_ < var_532_50 + var_532_51 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play318301130 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 318301130
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play318301131(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = 0
			local var_538_1 = 0.225

			if var_538_0 < arg_535_1.time_ and arg_535_1.time_ <= var_538_0 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_2 = arg_535_1:FormatText(StoryNameCfg[7].name)

				arg_535_1.leftNameTxt_.text = var_538_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_3 = arg_535_1:GetWordFromCfg(318301130)
				local var_538_4 = arg_535_1:FormatText(var_538_3.content)

				arg_535_1.text_.text = var_538_4

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_5 = 9
				local var_538_6 = utf8.len(var_538_4)
				local var_538_7 = var_538_5 <= 0 and var_538_1 or var_538_1 * (var_538_6 / var_538_5)

				if var_538_7 > 0 and var_538_1 < var_538_7 then
					arg_535_1.talkMaxDuration = var_538_7

					if var_538_7 + var_538_0 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_7 + var_538_0
					end
				end

				arg_535_1.text_.text = var_538_4
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_8 = math.max(var_538_1, arg_535_1.talkMaxDuration)

			if var_538_0 <= arg_535_1.time_ and arg_535_1.time_ < var_538_0 + var_538_8 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_0) / var_538_8

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_0 + var_538_8 and arg_535_1.time_ < var_538_0 + var_538_8 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play318301131 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 318301131
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play318301132(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 0.533333333333333

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				local var_542_2 = "play"
				local var_542_3 = "effect"

				arg_539_1:AudioAction(var_542_2, var_542_3, "se_story_side_1148", "se_story_1148_vibrate", "")
			end

			local var_542_4 = 0
			local var_542_5 = 1

			if var_542_4 < arg_539_1.time_ and arg_539_1.time_ <= var_542_4 + arg_542_0 then
				local var_542_6 = "play"
				local var_542_7 = "music"

				arg_539_1:AudioAction(var_542_6, var_542_7, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_542_8 = 0
			local var_542_9 = 0.3

			if var_542_8 < arg_539_1.time_ and arg_539_1.time_ <= var_542_8 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, false)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_10 = arg_539_1:GetWordFromCfg(318301131)
				local var_542_11 = arg_539_1:FormatText(var_542_10.content)

				arg_539_1.text_.text = var_542_11

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_12 = 12
				local var_542_13 = utf8.len(var_542_11)
				local var_542_14 = var_542_12 <= 0 and var_542_9 or var_542_9 * (var_542_13 / var_542_12)

				if var_542_14 > 0 and var_542_9 < var_542_14 then
					arg_539_1.talkMaxDuration = var_542_14

					if var_542_14 + var_542_8 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_14 + var_542_8
					end
				end

				arg_539_1.text_.text = var_542_11
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_15 = math.max(var_542_9, arg_539_1.talkMaxDuration)

			if var_542_8 <= arg_539_1.time_ and arg_539_1.time_ < var_542_8 + var_542_15 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_8) / var_542_15

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_8 + var_542_15 and arg_539_1.time_ < var_542_8 + var_542_15 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play318301132 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 318301132
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play318301133(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0
			local var_546_1 = 0.1

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_2 = arg_543_1:FormatText(StoryNameCfg[7].name)

				arg_543_1.leftNameTxt_.text = var_546_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_3 = arg_543_1:GetWordFromCfg(318301132)
				local var_546_4 = arg_543_1:FormatText(var_546_3.content)

				arg_543_1.text_.text = var_546_4

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_5 = 4
				local var_546_6 = utf8.len(var_546_4)
				local var_546_7 = var_546_5 <= 0 and var_546_1 or var_546_1 * (var_546_6 / var_546_5)

				if var_546_7 > 0 and var_546_1 < var_546_7 then
					arg_543_1.talkMaxDuration = var_546_7

					if var_546_7 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_7 + var_546_0
					end
				end

				arg_543_1.text_.text = var_546_4
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_8 = math.max(var_546_1, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_8 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_0) / var_546_8

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_8 and arg_543_1.time_ < var_546_0 + var_546_8 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play318301133 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 318301133
		arg_547_1.duration_ = 2.933

		local var_547_0 = {
			zh = 2.633,
			ja = 2.933
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
				arg_547_0:Play318301134(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 0.325

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[13].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, true)
				arg_547_1.iconController_:SetSelectedState("hero")

				arg_547_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(318301133)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301133", "story_v_out_318301.awb") ~= 0 then
					local var_550_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301133", "story_v_out_318301.awb") / 1000

					if var_550_8 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_8 + var_550_0
					end

					if var_550_3.prefab_name ~= "" and arg_547_1.actors_[var_550_3.prefab_name] ~= nil then
						local var_550_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_3.prefab_name].transform, "story_v_out_318301", "318301133", "story_v_out_318301.awb")

						arg_547_1:RecordAudio("318301133", var_550_9)
						arg_547_1:RecordAudio("318301133", var_550_9)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_318301", "318301133", "story_v_out_318301.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_318301", "318301133", "story_v_out_318301.awb")
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
	Play318301134 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 318301134
		arg_551_1.duration_ = 3.166

		local var_551_0 = {
			zh = 1.4,
			ja = 3.166
		}
		local var_551_1 = manager.audio:GetLocalizationFlag()

		if var_551_0[var_551_1] ~= nil then
			arg_551_1.duration_ = var_551_0[var_551_1]
		end

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play318301135(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 0.2

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_2 = arg_551_1:FormatText(StoryNameCfg[13].name)

				arg_551_1.leftNameTxt_.text = var_554_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, true)
				arg_551_1.iconController_:SetSelectedState("hero")

				arg_551_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_3 = arg_551_1:GetWordFromCfg(318301134)
				local var_554_4 = arg_551_1:FormatText(var_554_3.content)

				arg_551_1.text_.text = var_554_4

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_5 = 8
				local var_554_6 = utf8.len(var_554_4)
				local var_554_7 = var_554_5 <= 0 and var_554_1 or var_554_1 * (var_554_6 / var_554_5)

				if var_554_7 > 0 and var_554_1 < var_554_7 then
					arg_551_1.talkMaxDuration = var_554_7

					if var_554_7 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_7 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_4
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318301", "318301134", "story_v_out_318301.awb") ~= 0 then
					local var_554_8 = manager.audio:GetVoiceLength("story_v_out_318301", "318301134", "story_v_out_318301.awb") / 1000

					if var_554_8 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_8 + var_554_0
					end

					if var_554_3.prefab_name ~= "" and arg_551_1.actors_[var_554_3.prefab_name] ~= nil then
						local var_554_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_3.prefab_name].transform, "story_v_out_318301", "318301134", "story_v_out_318301.awb")

						arg_551_1:RecordAudio("318301134", var_554_9)
						arg_551_1:RecordAudio("318301134", var_554_9)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_out_318301", "318301134", "story_v_out_318301.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_out_318301", "318301134", "story_v_out_318301.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_10 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_10 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_10

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_10 and arg_551_1.time_ < var_554_0 + var_554_10 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play318301135 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 318301135
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play318301136(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = "1019ui_story"

			if arg_555_1.actors_[var_558_0] == nil then
				local var_558_1 = Object.Instantiate(Asset.Load("Char/" .. var_558_0), arg_555_1.stage_.transform)

				var_558_1.name = var_558_0
				var_558_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_555_1.actors_[var_558_0] = var_558_1

				local var_558_2 = var_558_1:GetComponentInChildren(typeof(CharacterEffect))

				var_558_2.enabled = true

				local var_558_3 = GameObjectTools.GetOrAddComponent(var_558_1, typeof(DynamicBoneHelper))

				if var_558_3 then
					var_558_3:EnableDynamicBone(false)
				end

				arg_555_1:ShowWeapon(var_558_2.transform, false)

				arg_555_1.var_[var_558_0 .. "Animator"] = var_558_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_555_1.var_[var_558_0 .. "Animator"].applyRootMotion = true
				arg_555_1.var_[var_558_0 .. "LipSync"] = var_558_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_558_4 = arg_555_1.actors_["1019ui_story"].transform
			local var_558_5 = 0

			if var_558_5 < arg_555_1.time_ and arg_555_1.time_ <= var_558_5 + arg_558_0 then
				arg_555_1.var_.moveOldPos1019ui_story = var_558_4.localPosition
			end

			local var_558_6 = 0.001

			if var_558_5 <= arg_555_1.time_ and arg_555_1.time_ < var_558_5 + var_558_6 then
				local var_558_7 = (arg_555_1.time_ - var_558_5) / var_558_6
				local var_558_8 = Vector3.New(0, 100, 0)

				var_558_4.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos1019ui_story, var_558_8, var_558_7)

				local var_558_9 = manager.ui.mainCamera.transform.position - var_558_4.position

				var_558_4.forward = Vector3.New(var_558_9.x, var_558_9.y, var_558_9.z)

				local var_558_10 = var_558_4.localEulerAngles

				var_558_10.z = 0
				var_558_10.x = 0
				var_558_4.localEulerAngles = var_558_10
			end

			if arg_555_1.time_ >= var_558_5 + var_558_6 and arg_555_1.time_ < var_558_5 + var_558_6 + arg_558_0 then
				var_558_4.localPosition = Vector3.New(0, 100, 0)

				local var_558_11 = manager.ui.mainCamera.transform.position - var_558_4.position

				var_558_4.forward = Vector3.New(var_558_11.x, var_558_11.y, var_558_11.z)

				local var_558_12 = var_558_4.localEulerAngles

				var_558_12.z = 0
				var_558_12.x = 0
				var_558_4.localEulerAngles = var_558_12
			end

			local var_558_13 = arg_555_1.actors_["1019ui_story"]
			local var_558_14 = 0

			if var_558_14 < arg_555_1.time_ and arg_555_1.time_ <= var_558_14 + arg_558_0 and arg_555_1.var_.characterEffect1019ui_story == nil then
				arg_555_1.var_.characterEffect1019ui_story = var_558_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_15 = 0.200000002980232

			if var_558_14 <= arg_555_1.time_ and arg_555_1.time_ < var_558_14 + var_558_15 then
				local var_558_16 = (arg_555_1.time_ - var_558_14) / var_558_15

				if arg_555_1.var_.characterEffect1019ui_story then
					local var_558_17 = Mathf.Lerp(0, 0.5, var_558_16)

					arg_555_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_555_1.var_.characterEffect1019ui_story.fillRatio = var_558_17
				end
			end

			if arg_555_1.time_ >= var_558_14 + var_558_15 and arg_555_1.time_ < var_558_14 + var_558_15 + arg_558_0 and arg_555_1.var_.characterEffect1019ui_story then
				local var_558_18 = 0.5

				arg_555_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_555_1.var_.characterEffect1019ui_story.fillRatio = var_558_18
			end

			local var_558_19 = 0
			local var_558_20 = 0.9

			if var_558_19 < arg_555_1.time_ and arg_555_1.time_ <= var_558_19 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, false)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_21 = arg_555_1:GetWordFromCfg(318301135)
				local var_558_22 = arg_555_1:FormatText(var_558_21.content)

				arg_555_1.text_.text = var_558_22

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_23 = 36
				local var_558_24 = utf8.len(var_558_22)
				local var_558_25 = var_558_23 <= 0 and var_558_20 or var_558_20 * (var_558_24 / var_558_23)

				if var_558_25 > 0 and var_558_20 < var_558_25 then
					arg_555_1.talkMaxDuration = var_558_25

					if var_558_25 + var_558_19 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_25 + var_558_19
					end
				end

				arg_555_1.text_.text = var_558_22
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_26 = math.max(var_558_20, arg_555_1.talkMaxDuration)

			if var_558_19 <= arg_555_1.time_ and arg_555_1.time_ < var_558_19 + var_558_26 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_19) / var_558_26

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_19 + var_558_26 and arg_555_1.time_ < var_558_19 + var_558_26 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play318301136 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 318301136
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
			arg_559_1.auto_ = false
		end

		function arg_559_1.playNext_(arg_561_0)
			arg_559_1.onStoryFinished_()
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 0.875

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_2 = arg_559_1:GetWordFromCfg(318301136)
				local var_562_3 = arg_559_1:FormatText(var_562_2.content)

				arg_559_1.text_.text = var_562_3

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_4 = 35
				local var_562_5 = utf8.len(var_562_3)
				local var_562_6 = var_562_4 <= 0 and var_562_1 or var_562_1 * (var_562_5 / var_562_4)

				if var_562_6 > 0 and var_562_1 < var_562_6 then
					arg_559_1.talkMaxDuration = var_562_6

					if var_562_6 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_6 + var_562_0
					end
				end

				arg_559_1.text_.text = var_562_3
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_7 = math.max(var_562_1, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_7 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_0) / var_562_7

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_7 and arg_559_1.time_ < var_562_0 + var_562_7 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K11g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K13f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K13g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K02f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K06g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K07g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K05g"
	},
	voices = {
		"story_v_out_318301.awb"
	}
}
