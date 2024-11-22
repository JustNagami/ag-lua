return {
	Play115131001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115131001
		arg_1_1.duration_ = 6.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play115131002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "G03a"

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
				local var_4_5 = arg_1_1.bgs_.G03a

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
					if iter_4_0 ~= "G03a" then
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
			local var_4_23 = 0.266666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.433333333333333
			local var_4_27 = 0.566666666665667

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_5_story_1", "bgm_activity_1_5_story_1", "bgm_activity_1_5_story_1.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 1.999999999999
			local var_4_31 = 0.875

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

				local var_4_33 = arg_1_1:GetWordFromCfg(115131001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 35
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
	Play115131002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 115131002
		arg_7_1.duration_ = 17.133

		local var_7_0 = {
			ja = 17.133,
			ko = 15.633,
			zh = 16,
			en = 13.4
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
				arg_7_0:Play115131003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1052ui_story"

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

			local var_10_4 = arg_7_1.actors_["1052ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1052ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(-0.7, -1.05, -6.2)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1052ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 then
				arg_7_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_10_15 = arg_7_1.actors_["1052ui_story"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect1052ui_story == nil then
				arg_7_1.var_.characterEffect1052ui_story = var_10_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_17 = 0.2

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17

				if arg_7_1.var_.characterEffect1052ui_story then
					arg_7_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 and arg_7_1.var_.characterEffect1052ui_story then
				arg_7_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_10_19 = "1024ui_story"

			if arg_7_1.actors_[var_10_19] == nil then
				local var_10_20 = Object.Instantiate(Asset.Load("Char/" .. var_10_19), arg_7_1.stage_.transform)

				var_10_20.name = var_10_19
				var_10_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_19] = var_10_20

				local var_10_21 = var_10_20:GetComponentInChildren(typeof(CharacterEffect))

				var_10_21.enabled = true

				local var_10_22 = GameObjectTools.GetOrAddComponent(var_10_20, typeof(DynamicBoneHelper))

				if var_10_22 then
					var_10_22:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_21.transform, false)

				arg_7_1.var_[var_10_19 .. "Animator"] = var_10_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_19 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_19 .. "LipSync"] = var_10_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_10_24 = arg_7_1.actors_["1024ui_story"]
			local var_10_25 = 0

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 and arg_7_1.var_.characterEffect1024ui_story == nil then
				arg_7_1.var_.characterEffect1024ui_story = var_10_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_26 = 0.2

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_26 then
				local var_10_27 = (arg_7_1.time_ - var_10_25) / var_10_26

				if arg_7_1.var_.characterEffect1024ui_story then
					local var_10_28 = Mathf.Lerp(0, 0.5, var_10_27)

					arg_7_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1024ui_story.fillRatio = var_10_28
				end
			end

			if arg_7_1.time_ >= var_10_25 + var_10_26 and arg_7_1.time_ < var_10_25 + var_10_26 + arg_10_0 and arg_7_1.var_.characterEffect1024ui_story then
				local var_10_29 = 0.5

				arg_7_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1024ui_story.fillRatio = var_10_29
			end

			local var_10_30 = arg_7_1.actors_["1024ui_story"].transform
			local var_10_31 = 0

			if var_10_31 < arg_7_1.time_ and arg_7_1.time_ <= var_10_31 + arg_10_0 then
				arg_7_1.var_.moveOldPos1024ui_story = var_10_30.localPosition
			end

			local var_10_32 = 0.001

			if var_10_31 <= arg_7_1.time_ and arg_7_1.time_ < var_10_31 + var_10_32 then
				local var_10_33 = (arg_7_1.time_ - var_10_31) / var_10_32
				local var_10_34 = Vector3.New(0.7, -1, -6.05)

				var_10_30.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1024ui_story, var_10_34, var_10_33)

				local var_10_35 = manager.ui.mainCamera.transform.position - var_10_30.position

				var_10_30.forward = Vector3.New(var_10_35.x, var_10_35.y, var_10_35.z)

				local var_10_36 = var_10_30.localEulerAngles

				var_10_36.z = 0
				var_10_36.x = 0
				var_10_30.localEulerAngles = var_10_36
			end

			if arg_7_1.time_ >= var_10_31 + var_10_32 and arg_7_1.time_ < var_10_31 + var_10_32 + arg_10_0 then
				var_10_30.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_10_37 = manager.ui.mainCamera.transform.position - var_10_30.position

				var_10_30.forward = Vector3.New(var_10_37.x, var_10_37.y, var_10_37.z)

				local var_10_38 = var_10_30.localEulerAngles

				var_10_38.z = 0
				var_10_38.x = 0
				var_10_30.localEulerAngles = var_10_38
			end

			local var_10_39 = 0
			local var_10_40 = 1.45

			if var_10_39 < arg_7_1.time_ and arg_7_1.time_ <= var_10_39 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_41 = arg_7_1:FormatText(StoryNameCfg[263].name)

				arg_7_1.leftNameTxt_.text = var_10_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_42 = arg_7_1:GetWordFromCfg(115131002)
				local var_10_43 = arg_7_1:FormatText(var_10_42.content)

				arg_7_1.text_.text = var_10_43

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_44 = 58
				local var_10_45 = utf8.len(var_10_43)
				local var_10_46 = var_10_44 <= 0 and var_10_40 or var_10_40 * (var_10_45 / var_10_44)

				if var_10_46 > 0 and var_10_40 < var_10_46 then
					arg_7_1.talkMaxDuration = var_10_46

					if var_10_46 + var_10_39 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_46 + var_10_39
					end
				end

				arg_7_1.text_.text = var_10_43
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131002", "story_v_out_115131.awb") ~= 0 then
					local var_10_47 = manager.audio:GetVoiceLength("story_v_out_115131", "115131002", "story_v_out_115131.awb") / 1000

					if var_10_47 + var_10_39 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_47 + var_10_39
					end

					if var_10_42.prefab_name ~= "" and arg_7_1.actors_[var_10_42.prefab_name] ~= nil then
						local var_10_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_42.prefab_name].transform, "story_v_out_115131", "115131002", "story_v_out_115131.awb")

						arg_7_1:RecordAudio("115131002", var_10_48)
						arg_7_1:RecordAudio("115131002", var_10_48)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_115131", "115131002", "story_v_out_115131.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_115131", "115131002", "story_v_out_115131.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_49 = math.max(var_10_40, arg_7_1.talkMaxDuration)

			if var_10_39 <= arg_7_1.time_ and arg_7_1.time_ < var_10_39 + var_10_49 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_39) / var_10_49

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_39 + var_10_49 and arg_7_1.time_ < var_10_39 + var_10_49 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play115131003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 115131003
		arg_11_1.duration_ = 7.233

		local var_11_0 = {
			ja = 7.233,
			ko = 4.166,
			zh = 4.133,
			en = 3.8
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
				arg_11_0:Play115131004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1052ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1052ui_story == nil then
				arg_11_1.var_.characterEffect1052ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1052ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1052ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1052ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1052ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.4

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[273].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(115131003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131003", "story_v_out_115131.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_115131", "115131003", "story_v_out_115131.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_115131", "115131003", "story_v_out_115131.awb")

						arg_11_1:RecordAudio("115131003", var_14_15)
						arg_11_1:RecordAudio("115131003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_115131", "115131003", "story_v_out_115131.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_115131", "115131003", "story_v_out_115131.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_16 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_16 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_16

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_16 and arg_11_1.time_ < var_14_6 + var_14_16 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play115131004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 115131004
		arg_15_1.duration_ = 16.866

		local var_15_0 = {
			ja = 16.866,
			ko = 11.266,
			zh = 13,
			en = 13.1
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
				arg_15_0:Play115131005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1052ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1052ui_story == nil then
				arg_15_1.var_.characterEffect1052ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1052ui_story then
					arg_15_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1052ui_story then
				arg_15_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_5 = "1017ui_story"

			if arg_15_1.actors_[var_18_5] == nil then
				local var_18_6 = Object.Instantiate(Asset.Load("Char/" .. var_18_5), arg_15_1.stage_.transform)

				var_18_6.name = var_18_5
				var_18_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_5] = var_18_6

				local var_18_7 = var_18_6:GetComponentInChildren(typeof(CharacterEffect))

				var_18_7.enabled = true

				local var_18_8 = GameObjectTools.GetOrAddComponent(var_18_6, typeof(DynamicBoneHelper))

				if var_18_8 then
					var_18_8:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_7.transform, false)

				arg_15_1.var_[var_18_5 .. "Animator"] = var_18_7.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_5 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_5 .. "LipSync"] = var_18_7.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_9 = arg_15_1.actors_["1017ui_story"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos1017ui_story = var_18_9.localPosition
			end

			local var_18_11 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11
				local var_18_13 = Vector3.New(0, 100, 0)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1017ui_story, var_18_13, var_18_12)

				local var_18_14 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_14.x, var_18_14.y, var_18_14.z)

				local var_18_15 = var_18_9.localEulerAngles

				var_18_15.z = 0
				var_18_15.x = 0
				var_18_9.localEulerAngles = var_18_15
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(0, 100, 0)

				local var_18_16 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_16.x, var_18_16.y, var_18_16.z)

				local var_18_17 = var_18_9.localEulerAngles

				var_18_17.z = 0
				var_18_17.x = 0
				var_18_9.localEulerAngles = var_18_17
			end

			local var_18_18 = arg_15_1.actors_["1024ui_story"].transform
			local var_18_19 = 0

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.var_.moveOldPos1024ui_story = var_18_18.localPosition
			end

			local var_18_20 = 0.001

			if var_18_19 <= arg_15_1.time_ and arg_15_1.time_ < var_18_19 + var_18_20 then
				local var_18_21 = (arg_15_1.time_ - var_18_19) / var_18_20
				local var_18_22 = Vector3.New(0.7, -1, -6.05)

				var_18_18.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1024ui_story, var_18_22, var_18_21)

				local var_18_23 = manager.ui.mainCamera.transform.position - var_18_18.position

				var_18_18.forward = Vector3.New(var_18_23.x, var_18_23.y, var_18_23.z)

				local var_18_24 = var_18_18.localEulerAngles

				var_18_24.z = 0
				var_18_24.x = 0
				var_18_18.localEulerAngles = var_18_24
			end

			if arg_15_1.time_ >= var_18_19 + var_18_20 and arg_15_1.time_ < var_18_19 + var_18_20 + arg_18_0 then
				var_18_18.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_18_25 = manager.ui.mainCamera.transform.position - var_18_18.position

				var_18_18.forward = Vector3.New(var_18_25.x, var_18_25.y, var_18_25.z)

				local var_18_26 = var_18_18.localEulerAngles

				var_18_26.z = 0
				var_18_26.x = 0
				var_18_18.localEulerAngles = var_18_26
			end

			local var_18_27 = 0

			if var_18_27 < arg_15_1.time_ and arg_15_1.time_ <= var_18_27 + arg_18_0 then
				arg_15_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_18_28 = arg_15_1.actors_["1024ui_story"]
			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 and arg_15_1.var_.characterEffect1024ui_story == nil then
				arg_15_1.var_.characterEffect1024ui_story = var_18_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_30 = 0.2

			if var_18_29 <= arg_15_1.time_ and arg_15_1.time_ < var_18_29 + var_18_30 then
				local var_18_31 = (arg_15_1.time_ - var_18_29) / var_18_30

				if arg_15_1.var_.characterEffect1024ui_story then
					local var_18_32 = Mathf.Lerp(0, 0.5, var_18_31)

					arg_15_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1024ui_story.fillRatio = var_18_32
				end
			end

			if arg_15_1.time_ >= var_18_29 + var_18_30 and arg_15_1.time_ < var_18_29 + var_18_30 + arg_18_0 and arg_15_1.var_.characterEffect1024ui_story then
				local var_18_33 = 0.5

				arg_15_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1024ui_story.fillRatio = var_18_33
			end

			local var_18_34 = 0

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 then
				arg_15_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/1017/1017action/1017action4_2")
			end

			local var_18_35 = 0
			local var_18_36 = 1.275

			if var_18_35 < arg_15_1.time_ and arg_15_1.time_ <= var_18_35 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_37 = arg_15_1:FormatText(StoryNameCfg[263].name)

				arg_15_1.leftNameTxt_.text = var_18_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_38 = arg_15_1:GetWordFromCfg(115131004)
				local var_18_39 = arg_15_1:FormatText(var_18_38.content)

				arg_15_1.text_.text = var_18_39

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_40 = 52
				local var_18_41 = utf8.len(var_18_39)
				local var_18_42 = var_18_40 <= 0 and var_18_36 or var_18_36 * (var_18_41 / var_18_40)

				if var_18_42 > 0 and var_18_36 < var_18_42 then
					arg_15_1.talkMaxDuration = var_18_42

					if var_18_42 + var_18_35 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_35
					end
				end

				arg_15_1.text_.text = var_18_39
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131004", "story_v_out_115131.awb") ~= 0 then
					local var_18_43 = manager.audio:GetVoiceLength("story_v_out_115131", "115131004", "story_v_out_115131.awb") / 1000

					if var_18_43 + var_18_35 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_43 + var_18_35
					end

					if var_18_38.prefab_name ~= "" and arg_15_1.actors_[var_18_38.prefab_name] ~= nil then
						local var_18_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_38.prefab_name].transform, "story_v_out_115131", "115131004", "story_v_out_115131.awb")

						arg_15_1:RecordAudio("115131004", var_18_44)
						arg_15_1:RecordAudio("115131004", var_18_44)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_115131", "115131004", "story_v_out_115131.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_115131", "115131004", "story_v_out_115131.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_45 = math.max(var_18_36, arg_15_1.talkMaxDuration)

			if var_18_35 <= arg_15_1.time_ and arg_15_1.time_ < var_18_35 + var_18_45 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_35) / var_18_45

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_35 + var_18_45 and arg_15_1.time_ < var_18_35 + var_18_45 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play115131005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 115131005
		arg_19_1.duration_ = 8.6

		local var_19_0 = {
			ja = 6.533,
			ko = 8,
			zh = 8.6,
			en = 6.3
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
				arg_19_0:Play115131006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_22_1 = 0
			local var_22_2 = 0.75

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_3 = arg_19_1:FormatText(StoryNameCfg[263].name)

				arg_19_1.leftNameTxt_.text = var_22_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_4 = arg_19_1:GetWordFromCfg(115131005)
				local var_22_5 = arg_19_1:FormatText(var_22_4.content)

				arg_19_1.text_.text = var_22_5

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_6 = 30
				local var_22_7 = utf8.len(var_22_5)
				local var_22_8 = var_22_6 <= 0 and var_22_2 or var_22_2 * (var_22_7 / var_22_6)

				if var_22_8 > 0 and var_22_2 < var_22_8 then
					arg_19_1.talkMaxDuration = var_22_8

					if var_22_8 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_1
					end
				end

				arg_19_1.text_.text = var_22_5
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131005", "story_v_out_115131.awb") ~= 0 then
					local var_22_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131005", "story_v_out_115131.awb") / 1000

					if var_22_9 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_1
					end

					if var_22_4.prefab_name ~= "" and arg_19_1.actors_[var_22_4.prefab_name] ~= nil then
						local var_22_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_4.prefab_name].transform, "story_v_out_115131", "115131005", "story_v_out_115131.awb")

						arg_19_1:RecordAudio("115131005", var_22_10)
						arg_19_1:RecordAudio("115131005", var_22_10)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_115131", "115131005", "story_v_out_115131.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_115131", "115131005", "story_v_out_115131.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_11 = math.max(var_22_2, arg_19_1.talkMaxDuration)

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_11 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_1) / var_22_11

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_1 + var_22_11 and arg_19_1.time_ < var_22_1 + var_22_11 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play115131006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 115131006
		arg_23_1.duration_ = 1.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play115131007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1052ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1052ui_story == nil then
				arg_23_1.var_.characterEffect1052ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1052ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1052ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1052ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1052ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_7 = arg_23_1.actors_["1024ui_story"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.characterEffect1024ui_story == nil then
				arg_23_1.var_.characterEffect1024ui_story = var_26_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_9 = 0.2

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.characterEffect1024ui_story then
					arg_23_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect1024ui_story then
				arg_23_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_26_11 = 0
			local var_26_12 = 0.175

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_13 = arg_23_1:FormatText(StoryNameCfg[265].name)

				arg_23_1.leftNameTxt_.text = var_26_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_14 = arg_23_1:GetWordFromCfg(115131006)
				local var_26_15 = arg_23_1:FormatText(var_26_14.content)

				arg_23_1.text_.text = var_26_15

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_16 = 7
				local var_26_17 = utf8.len(var_26_15)
				local var_26_18 = var_26_16 <= 0 and var_26_12 or var_26_12 * (var_26_17 / var_26_16)

				if var_26_18 > 0 and var_26_12 < var_26_18 then
					arg_23_1.talkMaxDuration = var_26_18

					if var_26_18 + var_26_11 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_18 + var_26_11
					end
				end

				arg_23_1.text_.text = var_26_15
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131006", "story_v_out_115131.awb") ~= 0 then
					local var_26_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131006", "story_v_out_115131.awb") / 1000

					if var_26_19 + var_26_11 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_11
					end

					if var_26_14.prefab_name ~= "" and arg_23_1.actors_[var_26_14.prefab_name] ~= nil then
						local var_26_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_14.prefab_name].transform, "story_v_out_115131", "115131006", "story_v_out_115131.awb")

						arg_23_1:RecordAudio("115131006", var_26_20)
						arg_23_1:RecordAudio("115131006", var_26_20)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_115131", "115131006", "story_v_out_115131.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_115131", "115131006", "story_v_out_115131.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_21 = math.max(var_26_12, arg_23_1.talkMaxDuration)

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_21 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_11) / var_26_21

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_11 + var_26_21 and arg_23_1.time_ < var_26_11 + var_26_21 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play115131007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 115131007
		arg_27_1.duration_ = 18.7

		local var_27_0 = {
			ja = 18.7,
			ko = 15.133,
			zh = 17.9,
			en = 11.933
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
				arg_27_0:Play115131008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1052ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1052ui_story == nil then
				arg_27_1.var_.characterEffect1052ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1052ui_story then
					arg_27_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1052ui_story then
				arg_27_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["1024ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect1024ui_story == nil then
				arg_27_1.var_.characterEffect1024ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.2

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1024ui_story then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1024ui_story.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1024ui_story then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1024ui_story.fillRatio = var_30_9
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_30_11 = 0
			local var_30_12 = 1.55

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_13 = arg_27_1:FormatText(StoryNameCfg[263].name)

				arg_27_1.leftNameTxt_.text = var_30_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_14 = arg_27_1:GetWordFromCfg(115131007)
				local var_30_15 = arg_27_1:FormatText(var_30_14.content)

				arg_27_1.text_.text = var_30_15

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_16 = 62
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131007", "story_v_out_115131.awb") ~= 0 then
					local var_30_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131007", "story_v_out_115131.awb") / 1000

					if var_30_19 + var_30_11 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_11
					end

					if var_30_14.prefab_name ~= "" and arg_27_1.actors_[var_30_14.prefab_name] ~= nil then
						local var_30_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_14.prefab_name].transform, "story_v_out_115131", "115131007", "story_v_out_115131.awb")

						arg_27_1:RecordAudio("115131007", var_30_20)
						arg_27_1:RecordAudio("115131007", var_30_20)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_115131", "115131007", "story_v_out_115131.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_115131", "115131007", "story_v_out_115131.awb")
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
	Play115131008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 115131008
		arg_31_1.duration_ = 10.7

		local var_31_0 = {
			ja = 7.833,
			ko = 10.5,
			zh = 10.7,
			en = 9.733
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
				arg_31_0:Play115131009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1052ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1052ui_story == nil then
				arg_31_1.var_.characterEffect1052ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1052ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1052ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1052ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1052ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 1.225

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[273].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(115131008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131008", "story_v_out_115131.awb") ~= 0 then
					local var_34_14 = manager.audio:GetVoiceLength("story_v_out_115131", "115131008", "story_v_out_115131.awb") / 1000

					if var_34_14 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_14 + var_34_6
					end

					if var_34_9.prefab_name ~= "" and arg_31_1.actors_[var_34_9.prefab_name] ~= nil then
						local var_34_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_9.prefab_name].transform, "story_v_out_115131", "115131008", "story_v_out_115131.awb")

						arg_31_1:RecordAudio("115131008", var_34_15)
						arg_31_1:RecordAudio("115131008", var_34_15)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_115131", "115131008", "story_v_out_115131.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_115131", "115131008", "story_v_out_115131.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_16 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_16 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_16

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_16 and arg_31_1.time_ < var_34_6 + var_34_16 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play115131009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 115131009
		arg_35_1.duration_ = 1.999999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play115131010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_38_1 = arg_35_1.actors_["1024ui_story"]
			local var_38_2 = 0

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1024ui_story == nil then
				arg_35_1.var_.characterEffect1024ui_story = var_38_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_3 = 0.2

			if var_38_2 <= arg_35_1.time_ and arg_35_1.time_ < var_38_2 + var_38_3 then
				local var_38_4 = (arg_35_1.time_ - var_38_2) / var_38_3

				if arg_35_1.var_.characterEffect1024ui_story then
					arg_35_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_2 + var_38_3 and arg_35_1.time_ < var_38_2 + var_38_3 + arg_38_0 and arg_35_1.var_.characterEffect1024ui_story then
				arg_35_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_38_5 = 0
			local var_38_6 = 0.05

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_7 = arg_35_1:FormatText(StoryNameCfg[265].name)

				arg_35_1.leftNameTxt_.text = var_38_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_8 = arg_35_1:GetWordFromCfg(115131009)
				local var_38_9 = arg_35_1:FormatText(var_38_8.content)

				arg_35_1.text_.text = var_38_9

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_10 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131009", "story_v_out_115131.awb") ~= 0 then
					local var_38_13 = manager.audio:GetVoiceLength("story_v_out_115131", "115131009", "story_v_out_115131.awb") / 1000

					if var_38_13 + var_38_5 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_5
					end

					if var_38_8.prefab_name ~= "" and arg_35_1.actors_[var_38_8.prefab_name] ~= nil then
						local var_38_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_8.prefab_name].transform, "story_v_out_115131", "115131009", "story_v_out_115131.awb")

						arg_35_1:RecordAudio("115131009", var_38_14)
						arg_35_1:RecordAudio("115131009", var_38_14)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_115131", "115131009", "story_v_out_115131.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_115131", "115131009", "story_v_out_115131.awb")
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
	Play115131010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 115131010
		arg_39_1.duration_ = 13.633

		local var_39_0 = {
			ja = 13.633,
			ko = 10.366,
			zh = 7.866,
			en = 9.133
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
				arg_39_0:Play115131011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action5_1")
			end

			local var_42_2 = 0
			local var_42_3 = 1.05

			if var_42_2 < arg_39_1.time_ and arg_39_1.time_ <= var_42_2 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_4 = arg_39_1:FormatText(StoryNameCfg[265].name)

				arg_39_1.leftNameTxt_.text = var_42_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_5 = arg_39_1:GetWordFromCfg(115131010)
				local var_42_6 = arg_39_1:FormatText(var_42_5.content)

				arg_39_1.text_.text = var_42_6

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_7 = 42
				local var_42_8 = utf8.len(var_42_6)
				local var_42_9 = var_42_7 <= 0 and var_42_3 or var_42_3 * (var_42_8 / var_42_7)

				if var_42_9 > 0 and var_42_3 < var_42_9 then
					arg_39_1.talkMaxDuration = var_42_9

					if var_42_9 + var_42_2 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_9 + var_42_2
					end
				end

				arg_39_1.text_.text = var_42_6
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131010", "story_v_out_115131.awb") ~= 0 then
					local var_42_10 = manager.audio:GetVoiceLength("story_v_out_115131", "115131010", "story_v_out_115131.awb") / 1000

					if var_42_10 + var_42_2 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_10 + var_42_2
					end

					if var_42_5.prefab_name ~= "" and arg_39_1.actors_[var_42_5.prefab_name] ~= nil then
						local var_42_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_5.prefab_name].transform, "story_v_out_115131", "115131010", "story_v_out_115131.awb")

						arg_39_1:RecordAudio("115131010", var_42_11)
						arg_39_1:RecordAudio("115131010", var_42_11)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_115131", "115131010", "story_v_out_115131.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_115131", "115131010", "story_v_out_115131.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_12 = math.max(var_42_3, arg_39_1.talkMaxDuration)

			if var_42_2 <= arg_39_1.time_ and arg_39_1.time_ < var_42_2 + var_42_12 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_2) / var_42_12

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_2 + var_42_12 and arg_39_1.time_ < var_42_2 + var_42_12 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play115131011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 115131011
		arg_43_1.duration_ = 8.4

		local var_43_0 = {
			ja = 6.333,
			ko = 7.4,
			zh = 6.866,
			en = 8.4
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
				arg_43_0:Play115131012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action5_2")
			end

			local var_46_2 = 0
			local var_46_3 = 0.925

			if var_46_2 < arg_43_1.time_ and arg_43_1.time_ <= var_46_2 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_4 = arg_43_1:FormatText(StoryNameCfg[265].name)

				arg_43_1.leftNameTxt_.text = var_46_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_5 = arg_43_1:GetWordFromCfg(115131011)
				local var_46_6 = arg_43_1:FormatText(var_46_5.content)

				arg_43_1.text_.text = var_46_6

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_7 = 37
				local var_46_8 = utf8.len(var_46_6)
				local var_46_9 = var_46_7 <= 0 and var_46_3 or var_46_3 * (var_46_8 / var_46_7)

				if var_46_9 > 0 and var_46_3 < var_46_9 then
					arg_43_1.talkMaxDuration = var_46_9

					if var_46_9 + var_46_2 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_9 + var_46_2
					end
				end

				arg_43_1.text_.text = var_46_6
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131011", "story_v_out_115131.awb") ~= 0 then
					local var_46_10 = manager.audio:GetVoiceLength("story_v_out_115131", "115131011", "story_v_out_115131.awb") / 1000

					if var_46_10 + var_46_2 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_10 + var_46_2
					end

					if var_46_5.prefab_name ~= "" and arg_43_1.actors_[var_46_5.prefab_name] ~= nil then
						local var_46_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_5.prefab_name].transform, "story_v_out_115131", "115131011", "story_v_out_115131.awb")

						arg_43_1:RecordAudio("115131011", var_46_11)
						arg_43_1:RecordAudio("115131011", var_46_11)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_115131", "115131011", "story_v_out_115131.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_115131", "115131011", "story_v_out_115131.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_12 = math.max(var_46_3, arg_43_1.talkMaxDuration)

			if var_46_2 <= arg_43_1.time_ and arg_43_1.time_ < var_46_2 + var_46_12 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_2) / var_46_12

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_2 + var_46_12 and arg_43_1.time_ < var_46_2 + var_46_12 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play115131012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 115131012
		arg_47_1.duration_ = 9.733

		local var_47_0 = {
			ja = 6.566,
			ko = 8.2,
			zh = 9.733,
			en = 8.7
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
				arg_47_0:Play115131013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1052ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1052ui_story == nil then
				arg_47_1.var_.characterEffect1052ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1052ui_story then
					arg_47_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1052ui_story then
				arg_47_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1024ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect1024ui_story == nil then
				arg_47_1.var_.characterEffect1024ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.2

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect1024ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1024ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect1024ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1024ui_story.fillRatio = var_50_9
			end

			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action7_1")
			end

			local var_50_11 = 0

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_50_12 = 0
			local var_50_13 = 0.925

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[263].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(115131012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131012", "story_v_out_115131.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_115131", "115131012", "story_v_out_115131.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_115131", "115131012", "story_v_out_115131.awb")

						arg_47_1:RecordAudio("115131012", var_50_21)
						arg_47_1:RecordAudio("115131012", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_115131", "115131012", "story_v_out_115131.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_115131", "115131012", "story_v_out_115131.awb")
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
	Play115131013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 115131013
		arg_51_1.duration_ = 13.2

		local var_51_0 = {
			ja = 13.2,
			ko = 8.366,
			zh = 9.633,
			en = 7.666
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
				arg_51_0:Play115131014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_54_1 = 0
			local var_54_2 = 0.825

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_3 = arg_51_1:FormatText(StoryNameCfg[263].name)

				arg_51_1.leftNameTxt_.text = var_54_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_4 = arg_51_1:GetWordFromCfg(115131013)
				local var_54_5 = arg_51_1:FormatText(var_54_4.content)

				arg_51_1.text_.text = var_54_5

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_6 = 33
				local var_54_7 = utf8.len(var_54_5)
				local var_54_8 = var_54_6 <= 0 and var_54_2 or var_54_2 * (var_54_7 / var_54_6)

				if var_54_8 > 0 and var_54_2 < var_54_8 then
					arg_51_1.talkMaxDuration = var_54_8

					if var_54_8 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_1
					end
				end

				arg_51_1.text_.text = var_54_5
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131013", "story_v_out_115131.awb") ~= 0 then
					local var_54_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131013", "story_v_out_115131.awb") / 1000

					if var_54_9 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_9 + var_54_1
					end

					if var_54_4.prefab_name ~= "" and arg_51_1.actors_[var_54_4.prefab_name] ~= nil then
						local var_54_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_4.prefab_name].transform, "story_v_out_115131", "115131013", "story_v_out_115131.awb")

						arg_51_1:RecordAudio("115131013", var_54_10)
						arg_51_1:RecordAudio("115131013", var_54_10)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_115131", "115131013", "story_v_out_115131.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_115131", "115131013", "story_v_out_115131.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_11 = math.max(var_54_2, arg_51_1.talkMaxDuration)

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_11 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_1) / var_54_11

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_1 + var_54_11 and arg_51_1.time_ < var_54_1 + var_54_11 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play115131014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 115131014
		arg_55_1.duration_ = 12.033

		local var_55_0 = {
			ja = 12.033,
			ko = 6.566,
			zh = 5.8,
			en = 5.833
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
				arg_55_0:Play115131015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_58_1 = 0
			local var_58_2 = 0.425

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_3 = arg_55_1:FormatText(StoryNameCfg[263].name)

				arg_55_1.leftNameTxt_.text = var_58_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_4 = arg_55_1:GetWordFromCfg(115131014)
				local var_58_5 = arg_55_1:FormatText(var_58_4.content)

				arg_55_1.text_.text = var_58_5

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_6 = 17
				local var_58_7 = utf8.len(var_58_5)
				local var_58_8 = var_58_6 <= 0 and var_58_2 or var_58_2 * (var_58_7 / var_58_6)

				if var_58_8 > 0 and var_58_2 < var_58_8 then
					arg_55_1.talkMaxDuration = var_58_8

					if var_58_8 + var_58_1 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_1
					end
				end

				arg_55_1.text_.text = var_58_5
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131014", "story_v_out_115131.awb") ~= 0 then
					local var_58_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131014", "story_v_out_115131.awb") / 1000

					if var_58_9 + var_58_1 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_9 + var_58_1
					end

					if var_58_4.prefab_name ~= "" and arg_55_1.actors_[var_58_4.prefab_name] ~= nil then
						local var_58_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_4.prefab_name].transform, "story_v_out_115131", "115131014", "story_v_out_115131.awb")

						arg_55_1:RecordAudio("115131014", var_58_10)
						arg_55_1:RecordAudio("115131014", var_58_10)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_115131", "115131014", "story_v_out_115131.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_115131", "115131014", "story_v_out_115131.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_11 = math.max(var_58_2, arg_55_1.talkMaxDuration)

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_11 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_1) / var_58_11

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_1 + var_58_11 and arg_55_1.time_ < var_58_1 + var_58_11 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play115131015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 115131015
		arg_59_1.duration_ = 7.933

		local var_59_0 = {
			ja = 3.9,
			ko = 7.933,
			zh = 5.3,
			en = 5.2
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
				arg_59_0:Play115131016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1052ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1052ui_story == nil then
				arg_59_1.var_.characterEffect1052ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1052ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1052ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1052ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1052ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.45

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[273].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(115131015)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 18
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131015", "story_v_out_115131.awb") ~= 0 then
					local var_62_14 = manager.audio:GetVoiceLength("story_v_out_115131", "115131015", "story_v_out_115131.awb") / 1000

					if var_62_14 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_14 + var_62_6
					end

					if var_62_9.prefab_name ~= "" and arg_59_1.actors_[var_62_9.prefab_name] ~= nil then
						local var_62_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_9.prefab_name].transform, "story_v_out_115131", "115131015", "story_v_out_115131.awb")

						arg_59_1:RecordAudio("115131015", var_62_15)
						arg_59_1:RecordAudio("115131015", var_62_15)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_115131", "115131015", "story_v_out_115131.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_115131", "115131015", "story_v_out_115131.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_16 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_16 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_16

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_16 and arg_59_1.time_ < var_62_6 + var_62_16 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play115131016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 115131016
		arg_63_1.duration_ = 15.1

		local var_63_0 = {
			ja = 10.566,
			ko = 15.1,
			zh = 14.266,
			en = 13.2
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
				arg_63_0:Play115131017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1052ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1052ui_story == nil then
				arg_63_1.var_.characterEffect1052ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1052ui_story then
					arg_63_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1052ui_story then
				arg_63_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_66_4 = 0

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_66_5 = 0
			local var_66_6 = 1.3

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_7 = arg_63_1:FormatText(StoryNameCfg[263].name)

				arg_63_1.leftNameTxt_.text = var_66_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_8 = arg_63_1:GetWordFromCfg(115131016)
				local var_66_9 = arg_63_1:FormatText(var_66_8.content)

				arg_63_1.text_.text = var_66_9

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_10 = 52
				local var_66_11 = utf8.len(var_66_9)
				local var_66_12 = var_66_10 <= 0 and var_66_6 or var_66_6 * (var_66_11 / var_66_10)

				if var_66_12 > 0 and var_66_6 < var_66_12 then
					arg_63_1.talkMaxDuration = var_66_12

					if var_66_12 + var_66_5 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_12 + var_66_5
					end
				end

				arg_63_1.text_.text = var_66_9
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131016", "story_v_out_115131.awb") ~= 0 then
					local var_66_13 = manager.audio:GetVoiceLength("story_v_out_115131", "115131016", "story_v_out_115131.awb") / 1000

					if var_66_13 + var_66_5 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_5
					end

					if var_66_8.prefab_name ~= "" and arg_63_1.actors_[var_66_8.prefab_name] ~= nil then
						local var_66_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_8.prefab_name].transform, "story_v_out_115131", "115131016", "story_v_out_115131.awb")

						arg_63_1:RecordAudio("115131016", var_66_14)
						arg_63_1:RecordAudio("115131016", var_66_14)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_115131", "115131016", "story_v_out_115131.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_115131", "115131016", "story_v_out_115131.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_15 = math.max(var_66_6, arg_63_1.talkMaxDuration)

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_15 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_5) / var_66_15

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_5 + var_66_15 and arg_63_1.time_ < var_66_5 + var_66_15 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play115131017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 115131017
		arg_67_1.duration_ = 2.333

		local var_67_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2.333,
			en = 1.999999999999
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
				arg_67_0:Play115131018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_70_1 = arg_67_1.actors_["1024ui_story"]
			local var_70_2 = 0

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1024ui_story == nil then
				arg_67_1.var_.characterEffect1024ui_story = var_70_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_3 = 0.2

			if var_70_2 <= arg_67_1.time_ and arg_67_1.time_ < var_70_2 + var_70_3 then
				local var_70_4 = (arg_67_1.time_ - var_70_2) / var_70_3

				if arg_67_1.var_.characterEffect1024ui_story then
					arg_67_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_2 + var_70_3 and arg_67_1.time_ < var_70_2 + var_70_3 + arg_70_0 and arg_67_1.var_.characterEffect1024ui_story then
				arg_67_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_70_5 = arg_67_1.actors_["1052ui_story"]
			local var_70_6 = 0

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1052ui_story == nil then
				arg_67_1.var_.characterEffect1052ui_story = var_70_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_7 = 0.2

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_7 then
				local var_70_8 = (arg_67_1.time_ - var_70_6) / var_70_7

				if arg_67_1.var_.characterEffect1052ui_story then
					local var_70_9 = Mathf.Lerp(0, 0.5, var_70_8)

					arg_67_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1052ui_story.fillRatio = var_70_9
				end
			end

			if arg_67_1.time_ >= var_70_6 + var_70_7 and arg_67_1.time_ < var_70_6 + var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect1052ui_story then
				local var_70_10 = 0.5

				arg_67_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1052ui_story.fillRatio = var_70_10
			end

			local var_70_11 = 0
			local var_70_12 = 0.1

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_13 = arg_67_1:FormatText(StoryNameCfg[265].name)

				arg_67_1.leftNameTxt_.text = var_70_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_14 = arg_67_1:GetWordFromCfg(115131017)
				local var_70_15 = arg_67_1:FormatText(var_70_14.content)

				arg_67_1.text_.text = var_70_15

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_16 = 4
				local var_70_17 = utf8.len(var_70_15)
				local var_70_18 = var_70_16 <= 0 and var_70_12 or var_70_12 * (var_70_17 / var_70_16)

				if var_70_18 > 0 and var_70_12 < var_70_18 then
					arg_67_1.talkMaxDuration = var_70_18

					if var_70_18 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_11
					end
				end

				arg_67_1.text_.text = var_70_15
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131017", "story_v_out_115131.awb") ~= 0 then
					local var_70_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131017", "story_v_out_115131.awb") / 1000

					if var_70_19 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_11
					end

					if var_70_14.prefab_name ~= "" and arg_67_1.actors_[var_70_14.prefab_name] ~= nil then
						local var_70_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_14.prefab_name].transform, "story_v_out_115131", "115131017", "story_v_out_115131.awb")

						arg_67_1:RecordAudio("115131017", var_70_20)
						arg_67_1:RecordAudio("115131017", var_70_20)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_115131", "115131017", "story_v_out_115131.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_115131", "115131017", "story_v_out_115131.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_21 = math.max(var_70_12, arg_67_1.talkMaxDuration)

			if var_70_11 <= arg_67_1.time_ and arg_67_1.time_ < var_70_11 + var_70_21 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_11) / var_70_21

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_11 + var_70_21 and arg_67_1.time_ < var_70_11 + var_70_21 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play115131018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 115131018
		arg_71_1.duration_ = 6.766

		local var_71_0 = {
			ja = 5.2,
			ko = 6,
			zh = 6.766,
			en = 4.466
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
				arg_71_0:Play115131019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1024ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1024ui_story == nil then
				arg_71_1.var_.characterEffect1024ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1024ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1024ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1024ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1024ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_74_7 = arg_71_1.actors_["1052ui_story"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect1052ui_story == nil then
				arg_71_1.var_.characterEffect1052ui_story = var_74_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_9 = 0.2

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.characterEffect1052ui_story then
					arg_71_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.characterEffect1052ui_story then
				arg_71_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_74_11 = 0
			local var_74_12 = 0.5

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_13 = arg_71_1:FormatText(StoryNameCfg[263].name)

				arg_71_1.leftNameTxt_.text = var_74_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_14 = arg_71_1:GetWordFromCfg(115131018)
				local var_74_15 = arg_71_1:FormatText(var_74_14.content)

				arg_71_1.text_.text = var_74_15

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_16 = 20
				local var_74_17 = utf8.len(var_74_15)
				local var_74_18 = var_74_16 <= 0 and var_74_12 or var_74_12 * (var_74_17 / var_74_16)

				if var_74_18 > 0 and var_74_12 < var_74_18 then
					arg_71_1.talkMaxDuration = var_74_18

					if var_74_18 + var_74_11 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_11
					end
				end

				arg_71_1.text_.text = var_74_15
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131018", "story_v_out_115131.awb") ~= 0 then
					local var_74_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131018", "story_v_out_115131.awb") / 1000

					if var_74_19 + var_74_11 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_11
					end

					if var_74_14.prefab_name ~= "" and arg_71_1.actors_[var_74_14.prefab_name] ~= nil then
						local var_74_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_14.prefab_name].transform, "story_v_out_115131", "115131018", "story_v_out_115131.awb")

						arg_71_1:RecordAudio("115131018", var_74_20)
						arg_71_1:RecordAudio("115131018", var_74_20)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_115131", "115131018", "story_v_out_115131.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_115131", "115131018", "story_v_out_115131.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_21 = math.max(var_74_12, arg_71_1.talkMaxDuration)

			if var_74_11 <= arg_71_1.time_ and arg_71_1.time_ < var_74_11 + var_74_21 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_11) / var_74_21

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_11 + var_74_21 and arg_71_1.time_ < var_74_11 + var_74_21 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play115131019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 115131019
		arg_75_1.duration_ = 5.699999999999

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play115131020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1052ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1052ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1052ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, 100, 0)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1024ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos1024ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0, 100, 0)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1024ui_story, var_78_13, var_78_12)

				local var_78_14 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_14.x, var_78_14.y, var_78_14.z)

				local var_78_15 = var_78_9.localEulerAngles

				var_78_15.z = 0
				var_78_15.x = 0
				var_78_9.localEulerAngles = var_78_15
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 then
				var_78_9.localPosition = Vector3.New(0, 100, 0)

				local var_78_16 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_16.x, var_78_16.y, var_78_16.z)

				local var_78_17 = var_78_9.localEulerAngles

				var_78_17.z = 0
				var_78_17.x = 0
				var_78_9.localEulerAngles = var_78_17
			end

			local var_78_18 = arg_75_1.bgs_.G03a
			local var_78_19 = 0

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 then
				local var_78_20 = var_78_18:GetComponent("SpriteRenderer")

				if var_78_20 then
					var_78_20.material = arg_75_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_78_21 = var_78_20.material
					local var_78_22 = var_78_21:GetColor("_Color")

					arg_75_1.var_.alphaOldValueG03a = var_78_22.a
					arg_75_1.var_.alphaMatValueG03a = var_78_21
				end

				arg_75_1.var_.alphaOldValueG03a = 1
			end

			local var_78_23 = 2

			if var_78_19 <= arg_75_1.time_ and arg_75_1.time_ < var_78_19 + var_78_23 then
				local var_78_24 = (arg_75_1.time_ - var_78_19) / var_78_23
				local var_78_25 = Mathf.Lerp(arg_75_1.var_.alphaOldValueG03a, 0, var_78_24)

				if arg_75_1.var_.alphaMatValueG03a then
					local var_78_26 = arg_75_1.var_.alphaMatValueG03a
					local var_78_27 = var_78_26:GetColor("_Color")

					var_78_27.a = var_78_25

					var_78_26:SetColor("_Color", var_78_27)
				end
			end

			if arg_75_1.time_ >= var_78_19 + var_78_23 and arg_75_1.time_ < var_78_19 + var_78_23 + arg_78_0 and arg_75_1.var_.alphaMatValueG03a then
				local var_78_28 = arg_75_1.var_.alphaMatValueG03a
				local var_78_29 = var_78_28:GetColor("_Color")

				var_78_29.a = 0

				var_78_28:SetColor("_Color", var_78_29)
			end

			local var_78_30 = 0

			if var_78_30 < arg_75_1.time_ and arg_75_1.time_ <= var_78_30 + arg_78_0 then
				arg_75_1.fswbg_:SetActive(true)
				arg_75_1.dialog_:SetActive(false)

				arg_75_1.fswtw_.percent = 0

				local var_78_31 = arg_75_1:GetWordFromCfg(115131019)
				local var_78_32 = arg_75_1:FormatText(var_78_31.content)

				arg_75_1.fswt_.text = var_78_32

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.fswt_)

				arg_75_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_75_1.fswtw_:SetDirty()

				arg_75_1.typewritterCharCountI18N = 0

				SetActive(arg_75_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_75_1:ShowNextGo(false)
			end

			local var_78_33 = 2

			if var_78_33 < arg_75_1.time_ and arg_75_1.time_ <= var_78_33 + arg_78_0 then
				arg_75_1.var_.oldValueTypewriter = arg_75_1.fswtw_.percent

				arg_75_1:ShowNextGo(false)
			end

			local var_78_34 = 32
			local var_78_35 = 2.13333333333333
			local var_78_36 = arg_75_1:GetWordFromCfg(115131019)
			local var_78_37 = arg_75_1:FormatText(var_78_36.content)
			local var_78_38, var_78_39 = arg_75_1:GetPercentByPara(var_78_37, 1)

			if var_78_33 < arg_75_1.time_ and arg_75_1.time_ <= var_78_33 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				local var_78_40 = var_78_34 <= 0 and var_78_35 or var_78_35 * ((var_78_39 - arg_75_1.typewritterCharCountI18N) / var_78_34)

				if var_78_40 > 0 and var_78_35 < var_78_40 then
					arg_75_1.talkMaxDuration = var_78_40

					if var_78_40 + var_78_33 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_40 + var_78_33
					end
				end
			end

			local var_78_41 = 2.13333333333333
			local var_78_42 = math.max(var_78_41, arg_75_1.talkMaxDuration)

			if var_78_33 <= arg_75_1.time_ and arg_75_1.time_ < var_78_33 + var_78_42 then
				local var_78_43 = (arg_75_1.time_ - var_78_33) / var_78_42

				arg_75_1.fswtw_.percent = Mathf.Lerp(arg_75_1.var_.oldValueTypewriter, var_78_38, var_78_43)
				arg_75_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_75_1.fswtw_:SetDirty()
			end

			if arg_75_1.time_ >= var_78_33 + var_78_42 and arg_75_1.time_ < var_78_33 + var_78_42 + arg_78_0 then
				arg_75_1.fswtw_.percent = var_78_38

				arg_75_1.fswtw_:SetDirty()
				arg_75_1:ShowNextGo(true)

				arg_75_1.typewritterCharCountI18N = var_78_39
			end

			local var_78_44 = 2

			if var_78_44 < arg_75_1.time_ and arg_75_1.time_ <= var_78_44 + arg_78_0 then
				local var_78_45 = arg_75_1.fswbg_.transform:Find("textbox/adapt/content") or arg_75_1.fswbg_.transform:Find("textbox/content")
				local var_78_46 = var_78_45:GetComponent("Text")
				local var_78_47 = var_78_45:GetComponent("RectTransform")

				var_78_46.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_78_47.offsetMin = Vector2.New(0, 0)
				var_78_47.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play115131020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 115131020
		arg_79_1.duration_ = 7.121999999999

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play115131021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.fswbg_:SetActive(true)
				arg_79_1.dialog_:SetActive(false)

				arg_79_1.fswtw_.percent = 0

				local var_82_1 = arg_79_1:GetWordFromCfg(115131020)
				local var_82_2 = arg_79_1:FormatText(var_82_1.content)

				arg_79_1.fswt_.text = var_82_2

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.fswt_)

				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()

				arg_79_1.typewritterCharCountI18N = 0

				SetActive(arg_79_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_79_1:ShowNextGo(false)
			end

			local var_82_3 = 0.0166666666666667

			if var_82_3 < arg_79_1.time_ and arg_79_1.time_ <= var_82_3 + arg_82_0 then
				arg_79_1.var_.oldValueTypewriter = arg_79_1.fswtw_.percent

				arg_79_1:ShowNextGo(false)
			end

			local var_82_4 = 27
			local var_82_5 = 1.8
			local var_82_6 = arg_79_1:GetWordFromCfg(115131020)
			local var_82_7 = arg_79_1:FormatText(var_82_6.content)
			local var_82_8, var_82_9 = arg_79_1:GetPercentByPara(var_82_7, 1)

			if var_82_3 < arg_79_1.time_ and arg_79_1.time_ <= var_82_3 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				local var_82_10 = var_82_4 <= 0 and var_82_5 or var_82_5 * ((var_82_9 - arg_79_1.typewritterCharCountI18N) / var_82_4)

				if var_82_10 > 0 and var_82_5 < var_82_10 then
					arg_79_1.talkMaxDuration = var_82_10

					if var_82_10 + var_82_3 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_10 + var_82_3
					end
				end
			end

			local var_82_11 = 1.8
			local var_82_12 = math.max(var_82_11, arg_79_1.talkMaxDuration)

			if var_82_3 <= arg_79_1.time_ and arg_79_1.time_ < var_82_3 + var_82_12 then
				local var_82_13 = (arg_79_1.time_ - var_82_3) / var_82_12

				arg_79_1.fswtw_.percent = Mathf.Lerp(arg_79_1.var_.oldValueTypewriter, var_82_8, var_82_13)
				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()
			end

			if arg_79_1.time_ >= var_82_3 + var_82_12 and arg_79_1.time_ < var_82_3 + var_82_12 + arg_82_0 then
				arg_79_1.fswtw_.percent = var_82_8

				arg_79_1.fswtw_:SetDirty()
				arg_79_1:ShowNextGo(true)

				arg_79_1.typewritterCharCountI18N = var_82_9
			end

			local var_82_14 = 0
			local var_82_15 = 7.122
			local var_82_16 = manager.audio:GetVoiceLength("story_v_out_115131", "115131020", "story_v_out_115131.awb") / 1000

			if var_82_16 > 0 and var_82_15 < var_82_16 and var_82_16 + var_82_14 > arg_79_1.duration_ then
				local var_82_17 = var_82_16

				arg_79_1.duration_ = var_82_16 + var_82_14
			end

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				local var_82_18 = "play"
				local var_82_19 = "voice"

				arg_79_1:AudioAction(var_82_18, var_82_19, "story_v_out_115131", "115131020", "story_v_out_115131.awb")
			end
		end
	end,
	Play115131021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 115131021
		arg_83_1.duration_ = 10.620999999999

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play115131022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.fswbg_:SetActive(true)
				arg_83_1.dialog_:SetActive(false)

				arg_83_1.fswtw_.percent = 0

				local var_86_1 = arg_83_1:GetWordFromCfg(115131021)
				local var_86_2 = arg_83_1:FormatText(var_86_1.content)

				arg_83_1.fswt_.text = var_86_2

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.fswt_)

				arg_83_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_83_1.fswtw_:SetDirty()

				arg_83_1.typewritterCharCountI18N = 0

				SetActive(arg_83_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_83_1:ShowNextGo(false)
			end

			local var_86_3 = 0.0166666666666667

			if var_86_3 < arg_83_1.time_ and arg_83_1.time_ <= var_86_3 + arg_86_0 then
				arg_83_1.var_.oldValueTypewriter = arg_83_1.fswtw_.percent

				arg_83_1:ShowNextGo(false)
			end

			local var_86_4 = 39
			local var_86_5 = 2.6
			local var_86_6 = arg_83_1:GetWordFromCfg(115131021)
			local var_86_7 = arg_83_1:FormatText(var_86_6.content)
			local var_86_8, var_86_9 = arg_83_1:GetPercentByPara(var_86_7, 1)

			if var_86_3 < arg_83_1.time_ and arg_83_1.time_ <= var_86_3 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				local var_86_10 = var_86_4 <= 0 and var_86_5 or var_86_5 * ((var_86_9 - arg_83_1.typewritterCharCountI18N) / var_86_4)

				if var_86_10 > 0 and var_86_5 < var_86_10 then
					arg_83_1.talkMaxDuration = var_86_10

					if var_86_10 + var_86_3 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_3
					end
				end
			end

			local var_86_11 = 2.6
			local var_86_12 = math.max(var_86_11, arg_83_1.talkMaxDuration)

			if var_86_3 <= arg_83_1.time_ and arg_83_1.time_ < var_86_3 + var_86_12 then
				local var_86_13 = (arg_83_1.time_ - var_86_3) / var_86_12

				arg_83_1.fswtw_.percent = Mathf.Lerp(arg_83_1.var_.oldValueTypewriter, var_86_8, var_86_13)
				arg_83_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_83_1.fswtw_:SetDirty()
			end

			if arg_83_1.time_ >= var_86_3 + var_86_12 and arg_83_1.time_ < var_86_3 + var_86_12 + arg_86_0 then
				arg_83_1.fswtw_.percent = var_86_8

				arg_83_1.fswtw_:SetDirty()
				arg_83_1:ShowNextGo(true)

				arg_83_1.typewritterCharCountI18N = var_86_9
			end

			local var_86_14 = 0
			local var_86_15 = 10.621
			local var_86_16 = manager.audio:GetVoiceLength("story_v_out_115131", "115131021", "story_v_out_115131.awb") / 1000

			if var_86_16 > 0 and var_86_15 < var_86_16 and var_86_16 + var_86_14 > arg_83_1.duration_ then
				local var_86_17 = var_86_16

				arg_83_1.duration_ = var_86_16 + var_86_14
			end

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				local var_86_18 = "play"
				local var_86_19 = "voice"

				arg_83_1:AudioAction(var_86_18, var_86_19, "story_v_out_115131", "115131021", "story_v_out_115131.awb")
			end
		end
	end,
	Play115131022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 115131022
		arg_87_1.duration_ = 8.202999999999

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play115131023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.fswbg_:SetActive(true)
				arg_87_1.dialog_:SetActive(false)

				arg_87_1.fswtw_.percent = 0

				local var_90_1 = arg_87_1:GetWordFromCfg(115131022)
				local var_90_2 = arg_87_1:FormatText(var_90_1.content)

				arg_87_1.fswt_.text = var_90_2

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.fswt_)

				arg_87_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_87_1.fswtw_:SetDirty()

				arg_87_1.typewritterCharCountI18N = 0

				SetActive(arg_87_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_87_1:ShowNextGo(false)
			end

			local var_90_3 = 0.0166666666666667

			if var_90_3 < arg_87_1.time_ and arg_87_1.time_ <= var_90_3 + arg_90_0 then
				arg_87_1.var_.oldValueTypewriter = arg_87_1.fswtw_.percent

				arg_87_1:ShowNextGo(false)
			end

			local var_90_4 = 32
			local var_90_5 = 2.13333333333333
			local var_90_6 = arg_87_1:GetWordFromCfg(115131022)
			local var_90_7 = arg_87_1:FormatText(var_90_6.content)
			local var_90_8, var_90_9 = arg_87_1:GetPercentByPara(var_90_7, 1)

			if var_90_3 < arg_87_1.time_ and arg_87_1.time_ <= var_90_3 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0

				local var_90_10 = var_90_4 <= 0 and var_90_5 or var_90_5 * ((var_90_9 - arg_87_1.typewritterCharCountI18N) / var_90_4)

				if var_90_10 > 0 and var_90_5 < var_90_10 then
					arg_87_1.talkMaxDuration = var_90_10

					if var_90_10 + var_90_3 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_10 + var_90_3
					end
				end
			end

			local var_90_11 = 2.13333333333333
			local var_90_12 = math.max(var_90_11, arg_87_1.talkMaxDuration)

			if var_90_3 <= arg_87_1.time_ and arg_87_1.time_ < var_90_3 + var_90_12 then
				local var_90_13 = (arg_87_1.time_ - var_90_3) / var_90_12

				arg_87_1.fswtw_.percent = Mathf.Lerp(arg_87_1.var_.oldValueTypewriter, var_90_8, var_90_13)
				arg_87_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_87_1.fswtw_:SetDirty()
			end

			if arg_87_1.time_ >= var_90_3 + var_90_12 and arg_87_1.time_ < var_90_3 + var_90_12 + arg_90_0 then
				arg_87_1.fswtw_.percent = var_90_8

				arg_87_1.fswtw_:SetDirty()
				arg_87_1:ShowNextGo(true)

				arg_87_1.typewritterCharCountI18N = var_90_9
			end

			local var_90_14 = 0
			local var_90_15 = 8.203
			local var_90_16 = manager.audio:GetVoiceLength("story_v_out_115131", "115131022", "story_v_out_115131.awb") / 1000

			if var_90_16 > 0 and var_90_15 < var_90_16 and var_90_16 + var_90_14 > arg_87_1.duration_ then
				local var_90_17 = var_90_16

				arg_87_1.duration_ = var_90_16 + var_90_14
			end

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				local var_90_18 = "play"
				local var_90_19 = "voice"

				arg_87_1:AudioAction(var_90_18, var_90_19, "story_v_out_115131", "115131022", "story_v_out_115131.awb")
			end
		end
	end,
	Play115131023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 115131023
		arg_91_1.duration_ = 6.5

		local var_91_0 = {
			ja = 5.766,
			ko = 5.233333333332,
			zh = 5.233333333332,
			en = 6.5
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
				arg_91_0:Play115131024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = "RO0201"

			if arg_91_1.bgs_[var_94_0] == nil then
				local var_94_1 = Object.Instantiate(arg_91_1.paintGo_)

				var_94_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_94_0)
				var_94_1.name = var_94_0
				var_94_1.transform.parent = arg_91_1.stage_.transform
				var_94_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.bgs_[var_94_0] = var_94_1
			end

			local var_94_2 = 0

			if var_94_2 < arg_91_1.time_ and arg_91_1.time_ <= var_94_2 + arg_94_0 then
				local var_94_3 = manager.ui.mainCamera.transform.localPosition
				local var_94_4 = Vector3.New(0, 0, 10) + Vector3.New(var_94_3.x, var_94_3.y, 0)
				local var_94_5 = arg_91_1.bgs_.RO0201

				var_94_5.transform.localPosition = var_94_4
				var_94_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_94_6 = var_94_5:GetComponent("SpriteRenderer")

				if var_94_6 and var_94_6.sprite then
					local var_94_7 = (var_94_5.transform.localPosition - var_94_3).z
					local var_94_8 = manager.ui.mainCameraCom_
					local var_94_9 = 2 * var_94_7 * Mathf.Tan(var_94_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_94_10 = var_94_9 * var_94_8.aspect
					local var_94_11 = var_94_6.sprite.bounds.size.x
					local var_94_12 = var_94_6.sprite.bounds.size.y
					local var_94_13 = var_94_10 / var_94_11
					local var_94_14 = var_94_9 / var_94_12
					local var_94_15 = var_94_14 < var_94_13 and var_94_13 or var_94_14

					var_94_5.transform.localScale = Vector3.New(var_94_15, var_94_15, 0)
				end

				for iter_94_0, iter_94_1 in pairs(arg_91_1.bgs_) do
					if iter_94_0 ~= "RO0201" then
						iter_94_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 then
				arg_91_1.mask_.enabled = true
				arg_91_1.mask_.raycastTarget = true

				arg_91_1:SetGaussion(false)
			end

			local var_94_17 = 2

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17
				local var_94_19 = Color.New(0, 0, 0)

				var_94_19.a = Mathf.Lerp(1, 0, var_94_18)
				arg_91_1.mask_.color = var_94_19
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 then
				local var_94_20 = Color.New(0, 0, 0)
				local var_94_21 = 0

				arg_91_1.mask_.enabled = false
				var_94_20.a = var_94_21
				arg_91_1.mask_.color = var_94_20
			end

			local var_94_22 = "105201ui_story"

			if arg_91_1.actors_[var_94_22] == nil then
				local var_94_23 = Object.Instantiate(Asset.Load("Char/" .. var_94_22), arg_91_1.stage_.transform)

				var_94_23.name = var_94_22
				var_94_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.actors_[var_94_22] = var_94_23

				local var_94_24 = var_94_23:GetComponentInChildren(typeof(CharacterEffect))

				var_94_24.enabled = true

				local var_94_25 = GameObjectTools.GetOrAddComponent(var_94_23, typeof(DynamicBoneHelper))

				if var_94_25 then
					var_94_25:EnableDynamicBone(false)
				end

				arg_91_1:ShowWeapon(var_94_24.transform, false)

				arg_91_1.var_[var_94_22 .. "Animator"] = var_94_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_91_1.var_[var_94_22 .. "Animator"].applyRootMotion = true
				arg_91_1.var_[var_94_22 .. "LipSync"] = var_94_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_94_26 = arg_91_1.actors_["105201ui_story"].transform
			local var_94_27 = 2.1

			if var_94_27 < arg_91_1.time_ and arg_91_1.time_ <= var_94_27 + arg_94_0 then
				arg_91_1.var_.moveOldPos105201ui_story = var_94_26.localPosition
			end

			local var_94_28 = 0.001

			if var_94_27 <= arg_91_1.time_ and arg_91_1.time_ < var_94_27 + var_94_28 then
				local var_94_29 = (arg_91_1.time_ - var_94_27) / var_94_28
				local var_94_30 = Vector3.New(-0.7, -1.05, -6.2)

				var_94_26.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos105201ui_story, var_94_30, var_94_29)

				local var_94_31 = manager.ui.mainCamera.transform.position - var_94_26.position

				var_94_26.forward = Vector3.New(var_94_31.x, var_94_31.y, var_94_31.z)

				local var_94_32 = var_94_26.localEulerAngles

				var_94_32.z = 0
				var_94_32.x = 0
				var_94_26.localEulerAngles = var_94_32
			end

			if arg_91_1.time_ >= var_94_27 + var_94_28 and arg_91_1.time_ < var_94_27 + var_94_28 + arg_94_0 then
				var_94_26.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_94_33 = manager.ui.mainCamera.transform.position - var_94_26.position

				var_94_26.forward = Vector3.New(var_94_33.x, var_94_33.y, var_94_33.z)

				local var_94_34 = var_94_26.localEulerAngles

				var_94_34.z = 0
				var_94_34.x = 0
				var_94_26.localEulerAngles = var_94_34
			end

			local var_94_35 = 2.1

			if var_94_35 < arg_91_1.time_ and arg_91_1.time_ <= var_94_35 + arg_94_0 then
				arg_91_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_94_36 = 2.1

			if var_94_36 < arg_91_1.time_ and arg_91_1.time_ <= var_94_36 + arg_94_0 then
				arg_91_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_94_37 = arg_91_1.actors_["105201ui_story"]
			local var_94_38 = 2.1

			if var_94_38 < arg_91_1.time_ and arg_91_1.time_ <= var_94_38 + arg_94_0 and arg_91_1.var_.characterEffect105201ui_story == nil then
				arg_91_1.var_.characterEffect105201ui_story = var_94_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_39 = 0.2

			if var_94_38 <= arg_91_1.time_ and arg_91_1.time_ < var_94_38 + var_94_39 then
				local var_94_40 = (arg_91_1.time_ - var_94_38) / var_94_39

				if arg_91_1.var_.characterEffect105201ui_story then
					arg_91_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_38 + var_94_39 and arg_91_1.time_ < var_94_38 + var_94_39 + arg_94_0 and arg_91_1.var_.characterEffect105201ui_story then
				arg_91_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_94_41 = 0

			if var_94_41 < arg_91_1.time_ and arg_91_1.time_ <= var_94_41 + arg_94_0 then
				arg_91_1.fswbg_:SetActive(false)
				arg_91_1.dialog_:SetActive(true)
				arg_91_1:ShowNextGo(false)
			end

			if arg_91_1.frameCnt_ <= 1 then
				arg_91_1.dialog_:SetActive(false)
			end

			local var_94_42 = 2
			local var_94_43 = 0.35

			if var_94_42 < arg_91_1.time_ and arg_91_1.time_ <= var_94_42 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0

				arg_91_1.dialog_:SetActive(true)

				local var_94_44 = LeanTween.value(arg_91_1.dialog_, 0, 1, 0.3)

				var_94_44:setOnUpdate(LuaHelper.FloatAction(function(arg_95_0)
					arg_91_1.dialogCg_.alpha = arg_95_0
				end))
				var_94_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_91_1.dialog_)
					var_94_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_91_1.duration_ = arg_91_1.duration_ + 0.3

				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_45 = arg_91_1:FormatText(StoryNameCfg[263].name)

				arg_91_1.leftNameTxt_.text = var_94_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_46 = arg_91_1:GetWordFromCfg(115131023)
				local var_94_47 = arg_91_1:FormatText(var_94_46.content)

				arg_91_1.text_.text = var_94_47

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_48 = 14
				local var_94_49 = utf8.len(var_94_47)
				local var_94_50 = var_94_48 <= 0 and var_94_43 or var_94_43 * (var_94_49 / var_94_48)

				if var_94_50 > 0 and var_94_43 < var_94_50 then
					arg_91_1.talkMaxDuration = var_94_50
					var_94_42 = var_94_42 + 0.3

					if var_94_50 + var_94_42 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_50 + var_94_42
					end
				end

				arg_91_1.text_.text = var_94_47
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131023", "story_v_out_115131.awb") ~= 0 then
					local var_94_51 = manager.audio:GetVoiceLength("story_v_out_115131", "115131023", "story_v_out_115131.awb") / 1000

					if var_94_51 + var_94_42 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_51 + var_94_42
					end

					if var_94_46.prefab_name ~= "" and arg_91_1.actors_[var_94_46.prefab_name] ~= nil then
						local var_94_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_46.prefab_name].transform, "story_v_out_115131", "115131023", "story_v_out_115131.awb")

						arg_91_1:RecordAudio("115131023", var_94_52)
						arg_91_1:RecordAudio("115131023", var_94_52)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_115131", "115131023", "story_v_out_115131.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_115131", "115131023", "story_v_out_115131.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_53 = var_94_42 + 0.3
			local var_94_54 = math.max(var_94_43, arg_91_1.talkMaxDuration)

			if var_94_53 <= arg_91_1.time_ and arg_91_1.time_ < var_94_53 + var_94_54 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_53) / var_94_54

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_53 + var_94_54 and arg_91_1.time_ < var_94_53 + var_94_54 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play115131024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 115131024
		arg_97_1.duration_ = 11.533

		local var_97_0 = {
			ja = 11.533,
			ko = 6.366,
			zh = 5.1,
			en = 7.3
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
				arg_97_0:Play115131025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["105201ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect105201ui_story == nil then
				arg_97_1.var_.characterEffect105201ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.2

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect105201ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect105201ui_story.fillFlat = true
					arg_97_1.var_.characterEffect105201ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect105201ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect105201ui_story.fillFlat = true
				arg_97_1.var_.characterEffect105201ui_story.fillRatio = var_100_5
			end

			local var_100_6 = "10014ui_story"

			if arg_97_1.actors_[var_100_6] == nil then
				local var_100_7 = Object.Instantiate(Asset.Load("Char/" .. var_100_6), arg_97_1.stage_.transform)

				var_100_7.name = var_100_6
				var_100_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.actors_[var_100_6] = var_100_7

				local var_100_8 = var_100_7:GetComponentInChildren(typeof(CharacterEffect))

				var_100_8.enabled = true

				local var_100_9 = GameObjectTools.GetOrAddComponent(var_100_7, typeof(DynamicBoneHelper))

				if var_100_9 then
					var_100_9:EnableDynamicBone(false)
				end

				arg_97_1:ShowWeapon(var_100_8.transform, false)

				arg_97_1.var_[var_100_6 .. "Animator"] = var_100_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_97_1.var_[var_100_6 .. "Animator"].applyRootMotion = true
				arg_97_1.var_[var_100_6 .. "LipSync"] = var_100_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_100_10 = arg_97_1.actors_["10014ui_story"].transform
			local var_100_11 = 0

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.var_.moveOldPos10014ui_story = var_100_10.localPosition
			end

			local var_100_12 = 0.001

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_12 then
				local var_100_13 = (arg_97_1.time_ - var_100_11) / var_100_12
				local var_100_14 = Vector3.New(0.7, -1.06, -6.2)

				var_100_10.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10014ui_story, var_100_14, var_100_13)

				local var_100_15 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_15.x, var_100_15.y, var_100_15.z)

				local var_100_16 = var_100_10.localEulerAngles

				var_100_16.z = 0
				var_100_16.x = 0
				var_100_10.localEulerAngles = var_100_16
			end

			if arg_97_1.time_ >= var_100_11 + var_100_12 and arg_97_1.time_ < var_100_11 + var_100_12 + arg_100_0 then
				var_100_10.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_100_17 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_17.x, var_100_17.y, var_100_17.z)

				local var_100_18 = var_100_10.localEulerAngles

				var_100_18.z = 0
				var_100_18.x = 0
				var_100_10.localEulerAngles = var_100_18
			end

			local var_100_19 = 0

			if var_100_19 < arg_97_1.time_ and arg_97_1.time_ <= var_100_19 + arg_100_0 then
				arg_97_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_100_20 = arg_97_1.actors_["10014ui_story"]
			local var_100_21 = 0

			if var_100_21 < arg_97_1.time_ and arg_97_1.time_ <= var_100_21 + arg_100_0 and arg_97_1.var_.characterEffect10014ui_story == nil then
				arg_97_1.var_.characterEffect10014ui_story = var_100_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_22 = 0.2

			if var_100_21 <= arg_97_1.time_ and arg_97_1.time_ < var_100_21 + var_100_22 then
				local var_100_23 = (arg_97_1.time_ - var_100_21) / var_100_22

				if arg_97_1.var_.characterEffect10014ui_story then
					arg_97_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_21 + var_100_22 and arg_97_1.time_ < var_100_21 + var_100_22 + arg_100_0 and arg_97_1.var_.characterEffect10014ui_story then
				arg_97_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_100_24 = 0

			if var_100_24 < arg_97_1.time_ and arg_97_1.time_ <= var_100_24 + arg_100_0 then
				arg_97_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_100_25 = 0
			local var_100_26 = 0.575

			if var_100_25 < arg_97_1.time_ and arg_97_1.time_ <= var_100_25 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_27 = arg_97_1:FormatText(StoryNameCfg[264].name)

				arg_97_1.leftNameTxt_.text = var_100_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_28 = arg_97_1:GetWordFromCfg(115131024)
				local var_100_29 = arg_97_1:FormatText(var_100_28.content)

				arg_97_1.text_.text = var_100_29

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_30 = 23
				local var_100_31 = utf8.len(var_100_29)
				local var_100_32 = var_100_30 <= 0 and var_100_26 or var_100_26 * (var_100_31 / var_100_30)

				if var_100_32 > 0 and var_100_26 < var_100_32 then
					arg_97_1.talkMaxDuration = var_100_32

					if var_100_32 + var_100_25 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_32 + var_100_25
					end
				end

				arg_97_1.text_.text = var_100_29
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131024", "story_v_out_115131.awb") ~= 0 then
					local var_100_33 = manager.audio:GetVoiceLength("story_v_out_115131", "115131024", "story_v_out_115131.awb") / 1000

					if var_100_33 + var_100_25 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_33 + var_100_25
					end

					if var_100_28.prefab_name ~= "" and arg_97_1.actors_[var_100_28.prefab_name] ~= nil then
						local var_100_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_28.prefab_name].transform, "story_v_out_115131", "115131024", "story_v_out_115131.awb")

						arg_97_1:RecordAudio("115131024", var_100_34)
						arg_97_1:RecordAudio("115131024", var_100_34)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_115131", "115131024", "story_v_out_115131.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_115131", "115131024", "story_v_out_115131.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_35 = math.max(var_100_26, arg_97_1.talkMaxDuration)

			if var_100_25 <= arg_97_1.time_ and arg_97_1.time_ < var_100_25 + var_100_35 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_25) / var_100_35

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_25 + var_100_35 and arg_97_1.time_ < var_100_25 + var_100_35 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play115131025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 115131025
		arg_101_1.duration_ = 10.066

		local var_101_0 = {
			ja = 10.066,
			ko = 8.033,
			zh = 8.7,
			en = 9.333
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
				arg_101_0:Play115131026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_104_1 = arg_101_1.actors_["105201ui_story"]
			local var_104_2 = 0

			if var_104_2 < arg_101_1.time_ and arg_101_1.time_ <= var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect105201ui_story == nil then
				arg_101_1.var_.characterEffect105201ui_story = var_104_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_3 = 0.2

			if var_104_2 <= arg_101_1.time_ and arg_101_1.time_ < var_104_2 + var_104_3 then
				local var_104_4 = (arg_101_1.time_ - var_104_2) / var_104_3

				if arg_101_1.var_.characterEffect105201ui_story then
					arg_101_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_2 + var_104_3 and arg_101_1.time_ < var_104_2 + var_104_3 + arg_104_0 and arg_101_1.var_.characterEffect105201ui_story then
				arg_101_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_104_5 = arg_101_1.actors_["10014ui_story"]
			local var_104_6 = 0

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 and arg_101_1.var_.characterEffect10014ui_story == nil then
				arg_101_1.var_.characterEffect10014ui_story = var_104_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_7 = 0.2

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_7 then
				local var_104_8 = (arg_101_1.time_ - var_104_6) / var_104_7

				if arg_101_1.var_.characterEffect10014ui_story then
					local var_104_9 = Mathf.Lerp(0, 0.5, var_104_8)

					arg_101_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_101_1.var_.characterEffect10014ui_story.fillRatio = var_104_9
				end
			end

			if arg_101_1.time_ >= var_104_6 + var_104_7 and arg_101_1.time_ < var_104_6 + var_104_7 + arg_104_0 and arg_101_1.var_.characterEffect10014ui_story then
				local var_104_10 = 0.5

				arg_101_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_101_1.var_.characterEffect10014ui_story.fillRatio = var_104_10
			end

			local var_104_11 = 0
			local var_104_12 = 1.125

			if var_104_11 < arg_101_1.time_ and arg_101_1.time_ <= var_104_11 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_13 = arg_101_1:FormatText(StoryNameCfg[263].name)

				arg_101_1.leftNameTxt_.text = var_104_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_14 = arg_101_1:GetWordFromCfg(115131025)
				local var_104_15 = arg_101_1:FormatText(var_104_14.content)

				arg_101_1.text_.text = var_104_15

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_16 = 45
				local var_104_17 = utf8.len(var_104_15)
				local var_104_18 = var_104_16 <= 0 and var_104_12 or var_104_12 * (var_104_17 / var_104_16)

				if var_104_18 > 0 and var_104_12 < var_104_18 then
					arg_101_1.talkMaxDuration = var_104_18

					if var_104_18 + var_104_11 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_18 + var_104_11
					end
				end

				arg_101_1.text_.text = var_104_15
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131025", "story_v_out_115131.awb") ~= 0 then
					local var_104_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131025", "story_v_out_115131.awb") / 1000

					if var_104_19 + var_104_11 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_19 + var_104_11
					end

					if var_104_14.prefab_name ~= "" and arg_101_1.actors_[var_104_14.prefab_name] ~= nil then
						local var_104_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_14.prefab_name].transform, "story_v_out_115131", "115131025", "story_v_out_115131.awb")

						arg_101_1:RecordAudio("115131025", var_104_20)
						arg_101_1:RecordAudio("115131025", var_104_20)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_115131", "115131025", "story_v_out_115131.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_115131", "115131025", "story_v_out_115131.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_21 = math.max(var_104_12, arg_101_1.talkMaxDuration)

			if var_104_11 <= arg_101_1.time_ and arg_101_1.time_ < var_104_11 + var_104_21 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_11) / var_104_21

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_11 + var_104_21 and arg_101_1.time_ < var_104_11 + var_104_21 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play115131026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 115131026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play115131027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["105201ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos105201ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0, 100, 0)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos105201ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, 100, 0)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["10014ui_story"].transform
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1.var_.moveOldPos10014ui_story = var_108_9.localPosition
			end

			local var_108_11 = 0.001

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11
				local var_108_13 = Vector3.New(0, 100, 0)

				var_108_9.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10014ui_story, var_108_13, var_108_12)

				local var_108_14 = manager.ui.mainCamera.transform.position - var_108_9.position

				var_108_9.forward = Vector3.New(var_108_14.x, var_108_14.y, var_108_14.z)

				local var_108_15 = var_108_9.localEulerAngles

				var_108_15.z = 0
				var_108_15.x = 0
				var_108_9.localEulerAngles = var_108_15
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 then
				var_108_9.localPosition = Vector3.New(0, 100, 0)

				local var_108_16 = manager.ui.mainCamera.transform.position - var_108_9.position

				var_108_9.forward = Vector3.New(var_108_16.x, var_108_16.y, var_108_16.z)

				local var_108_17 = var_108_9.localEulerAngles

				var_108_17.z = 0
				var_108_17.x = 0
				var_108_9.localEulerAngles = var_108_17
			end

			local var_108_18 = 0
			local var_108_19 = 1.275

			if var_108_18 < arg_105_1.time_ and arg_105_1.time_ <= var_108_18 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_20 = arg_105_1:GetWordFromCfg(115131026)
				local var_108_21 = arg_105_1:FormatText(var_108_20.content)

				arg_105_1.text_.text = var_108_21

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_22 = 51
				local var_108_23 = utf8.len(var_108_21)
				local var_108_24 = var_108_22 <= 0 and var_108_19 or var_108_19 * (var_108_23 / var_108_22)

				if var_108_24 > 0 and var_108_19 < var_108_24 then
					arg_105_1.talkMaxDuration = var_108_24

					if var_108_24 + var_108_18 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_24 + var_108_18
					end
				end

				arg_105_1.text_.text = var_108_21
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_25 = math.max(var_108_19, arg_105_1.talkMaxDuration)

			if var_108_18 <= arg_105_1.time_ and arg_105_1.time_ < var_108_18 + var_108_25 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_18) / var_108_25

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_18 + var_108_25 and arg_105_1.time_ < var_108_18 + var_108_25 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play115131027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 115131027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play115131028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.025

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

				local var_112_2 = arg_109_1:GetWordFromCfg(115131027)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 41
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
	Play115131028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 115131028
		arg_113_1.duration_ = 14.933

		local var_113_0 = {
			ja = 10.866,
			ko = 14.933,
			zh = 11.666,
			en = 10.766
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
				arg_113_0:Play115131029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_116_1 = arg_113_1.actors_["10014ui_story"].transform
			local var_116_2 = 0

			if var_116_2 < arg_113_1.time_ and arg_113_1.time_ <= var_116_2 + arg_116_0 then
				arg_113_1.var_.moveOldPos10014ui_story = var_116_1.localPosition
			end

			local var_116_3 = 0.001

			if var_116_2 <= arg_113_1.time_ and arg_113_1.time_ < var_116_2 + var_116_3 then
				local var_116_4 = (arg_113_1.time_ - var_116_2) / var_116_3
				local var_116_5 = Vector3.New(0.7, -1.06, -6.2)

				var_116_1.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10014ui_story, var_116_5, var_116_4)

				local var_116_6 = manager.ui.mainCamera.transform.position - var_116_1.position

				var_116_1.forward = Vector3.New(var_116_6.x, var_116_6.y, var_116_6.z)

				local var_116_7 = var_116_1.localEulerAngles

				var_116_7.z = 0
				var_116_7.x = 0
				var_116_1.localEulerAngles = var_116_7
			end

			if arg_113_1.time_ >= var_116_2 + var_116_3 and arg_113_1.time_ < var_116_2 + var_116_3 + arg_116_0 then
				var_116_1.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_116_8 = manager.ui.mainCamera.transform.position - var_116_1.position

				var_116_1.forward = Vector3.New(var_116_8.x, var_116_8.y, var_116_8.z)

				local var_116_9 = var_116_1.localEulerAngles

				var_116_9.z = 0
				var_116_9.x = 0
				var_116_1.localEulerAngles = var_116_9
			end

			local var_116_10 = arg_113_1.actors_["10014ui_story"]
			local var_116_11 = 0

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 and arg_113_1.var_.characterEffect10014ui_story == nil then
				arg_113_1.var_.characterEffect10014ui_story = var_116_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_12 = 0.2

			if var_116_11 <= arg_113_1.time_ and arg_113_1.time_ < var_116_11 + var_116_12 then
				local var_116_13 = (arg_113_1.time_ - var_116_11) / var_116_12

				if arg_113_1.var_.characterEffect10014ui_story then
					arg_113_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_11 + var_116_12 and arg_113_1.time_ < var_116_11 + var_116_12 + arg_116_0 and arg_113_1.var_.characterEffect10014ui_story then
				arg_113_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_116_14 = arg_113_1.actors_["105201ui_story"].transform
			local var_116_15 = 0

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 then
				arg_113_1.var_.moveOldPos105201ui_story = var_116_14.localPosition
			end

			local var_116_16 = 0.001

			if var_116_15 <= arg_113_1.time_ and arg_113_1.time_ < var_116_15 + var_116_16 then
				local var_116_17 = (arg_113_1.time_ - var_116_15) / var_116_16
				local var_116_18 = Vector3.New(-0.7, -1.05, -6.2)

				var_116_14.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos105201ui_story, var_116_18, var_116_17)

				local var_116_19 = manager.ui.mainCamera.transform.position - var_116_14.position

				var_116_14.forward = Vector3.New(var_116_19.x, var_116_19.y, var_116_19.z)

				local var_116_20 = var_116_14.localEulerAngles

				var_116_20.z = 0
				var_116_20.x = 0
				var_116_14.localEulerAngles = var_116_20
			end

			if arg_113_1.time_ >= var_116_15 + var_116_16 and arg_113_1.time_ < var_116_15 + var_116_16 + arg_116_0 then
				var_116_14.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_116_21 = manager.ui.mainCamera.transform.position - var_116_14.position

				var_116_14.forward = Vector3.New(var_116_21.x, var_116_21.y, var_116_21.z)

				local var_116_22 = var_116_14.localEulerAngles

				var_116_22.z = 0
				var_116_22.x = 0
				var_116_14.localEulerAngles = var_116_22
			end

			local var_116_23 = arg_113_1.actors_["105201ui_story"]
			local var_116_24 = 0

			if var_116_24 < arg_113_1.time_ and arg_113_1.time_ <= var_116_24 + arg_116_0 and arg_113_1.var_.characterEffect105201ui_story == nil then
				arg_113_1.var_.characterEffect105201ui_story = var_116_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_25 = 0.2

			if var_116_24 <= arg_113_1.time_ and arg_113_1.time_ < var_116_24 + var_116_25 then
				local var_116_26 = (arg_113_1.time_ - var_116_24) / var_116_25

				if arg_113_1.var_.characterEffect105201ui_story then
					local var_116_27 = Mathf.Lerp(0, 0.5, var_116_26)

					arg_113_1.var_.characterEffect105201ui_story.fillFlat = true
					arg_113_1.var_.characterEffect105201ui_story.fillRatio = var_116_27
				end
			end

			if arg_113_1.time_ >= var_116_24 + var_116_25 and arg_113_1.time_ < var_116_24 + var_116_25 + arg_116_0 and arg_113_1.var_.characterEffect105201ui_story then
				local var_116_28 = 0.5

				arg_113_1.var_.characterEffect105201ui_story.fillFlat = true
				arg_113_1.var_.characterEffect105201ui_story.fillRatio = var_116_28
			end

			local var_116_29 = 0
			local var_116_30 = 1.275

			if var_116_29 < arg_113_1.time_ and arg_113_1.time_ <= var_116_29 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_31 = arg_113_1:FormatText(StoryNameCfg[264].name)

				arg_113_1.leftNameTxt_.text = var_116_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_32 = arg_113_1:GetWordFromCfg(115131028)
				local var_116_33 = arg_113_1:FormatText(var_116_32.content)

				arg_113_1.text_.text = var_116_33

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_34 = 51
				local var_116_35 = utf8.len(var_116_33)
				local var_116_36 = var_116_34 <= 0 and var_116_30 or var_116_30 * (var_116_35 / var_116_34)

				if var_116_36 > 0 and var_116_30 < var_116_36 then
					arg_113_1.talkMaxDuration = var_116_36

					if var_116_36 + var_116_29 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_36 + var_116_29
					end
				end

				arg_113_1.text_.text = var_116_33
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131028", "story_v_out_115131.awb") ~= 0 then
					local var_116_37 = manager.audio:GetVoiceLength("story_v_out_115131", "115131028", "story_v_out_115131.awb") / 1000

					if var_116_37 + var_116_29 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_37 + var_116_29
					end

					if var_116_32.prefab_name ~= "" and arg_113_1.actors_[var_116_32.prefab_name] ~= nil then
						local var_116_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_32.prefab_name].transform, "story_v_out_115131", "115131028", "story_v_out_115131.awb")

						arg_113_1:RecordAudio("115131028", var_116_38)
						arg_113_1:RecordAudio("115131028", var_116_38)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_115131", "115131028", "story_v_out_115131.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_115131", "115131028", "story_v_out_115131.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_39 = math.max(var_116_30, arg_113_1.talkMaxDuration)

			if var_116_29 <= arg_113_1.time_ and arg_113_1.time_ < var_116_29 + var_116_39 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_29) / var_116_39

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_29 + var_116_39 and arg_113_1.time_ < var_116_29 + var_116_39 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play115131029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 115131029
		arg_117_1.duration_ = 7.5

		local var_117_0 = {
			ja = 6.8,
			ko = 5.666,
			zh = 5.333,
			en = 7.5
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
				arg_117_0:Play115131030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10014ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect10014ui_story == nil then
				arg_117_1.var_.characterEffect10014ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.2

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect10014ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_117_1.var_.characterEffect10014ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect10014ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_117_1.var_.characterEffect10014ui_story.fillRatio = var_120_5
			end

			local var_120_6 = arg_117_1.actors_["105201ui_story"]
			local var_120_7 = 0

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 and arg_117_1.var_.characterEffect105201ui_story == nil then
				arg_117_1.var_.characterEffect105201ui_story = var_120_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_8 = 0.2

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_8 then
				local var_120_9 = (arg_117_1.time_ - var_120_7) / var_120_8

				if arg_117_1.var_.characterEffect105201ui_story then
					arg_117_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_7 + var_120_8 and arg_117_1.time_ < var_120_7 + var_120_8 + arg_120_0 and arg_117_1.var_.characterEffect105201ui_story then
				arg_117_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_120_11 = 0
			local var_120_12 = 0.625

			if var_120_11 < arg_117_1.time_ and arg_117_1.time_ <= var_120_11 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_13 = arg_117_1:FormatText(StoryNameCfg[263].name)

				arg_117_1.leftNameTxt_.text = var_120_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_14 = arg_117_1:GetWordFromCfg(115131029)
				local var_120_15 = arg_117_1:FormatText(var_120_14.content)

				arg_117_1.text_.text = var_120_15

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_16 = 25
				local var_120_17 = utf8.len(var_120_15)
				local var_120_18 = var_120_16 <= 0 and var_120_12 or var_120_12 * (var_120_17 / var_120_16)

				if var_120_18 > 0 and var_120_12 < var_120_18 then
					arg_117_1.talkMaxDuration = var_120_18

					if var_120_18 + var_120_11 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_18 + var_120_11
					end
				end

				arg_117_1.text_.text = var_120_15
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131029", "story_v_out_115131.awb") ~= 0 then
					local var_120_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131029", "story_v_out_115131.awb") / 1000

					if var_120_19 + var_120_11 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_19 + var_120_11
					end

					if var_120_14.prefab_name ~= "" and arg_117_1.actors_[var_120_14.prefab_name] ~= nil then
						local var_120_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_14.prefab_name].transform, "story_v_out_115131", "115131029", "story_v_out_115131.awb")

						arg_117_1:RecordAudio("115131029", var_120_20)
						arg_117_1:RecordAudio("115131029", var_120_20)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_115131", "115131029", "story_v_out_115131.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_115131", "115131029", "story_v_out_115131.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_21 = math.max(var_120_12, arg_117_1.talkMaxDuration)

			if var_120_11 <= arg_117_1.time_ and arg_117_1.time_ < var_120_11 + var_120_21 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_11) / var_120_21

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_11 + var_120_21 and arg_117_1.time_ < var_120_11 + var_120_21 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play115131030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 115131030
		arg_121_1.duration_ = 13.233

		local var_121_0 = {
			ja = 13.233,
			ko = 9.5,
			zh = 9.833,
			en = 7.466
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
				arg_121_0:Play115131031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_124_1 = arg_121_1.actors_["10014ui_story"]
			local var_124_2 = 0

			if var_124_2 < arg_121_1.time_ and arg_121_1.time_ <= var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect10014ui_story == nil then
				arg_121_1.var_.characterEffect10014ui_story = var_124_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_3 = 0.2

			if var_124_2 <= arg_121_1.time_ and arg_121_1.time_ < var_124_2 + var_124_3 then
				local var_124_4 = (arg_121_1.time_ - var_124_2) / var_124_3

				if arg_121_1.var_.characterEffect10014ui_story then
					arg_121_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_2 + var_124_3 and arg_121_1.time_ < var_124_2 + var_124_3 + arg_124_0 and arg_121_1.var_.characterEffect10014ui_story then
				arg_121_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_124_5 = arg_121_1.actors_["105201ui_story"]
			local var_124_6 = 0

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect105201ui_story == nil then
				arg_121_1.var_.characterEffect105201ui_story = var_124_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_7 = 0.2

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_7 then
				local var_124_8 = (arg_121_1.time_ - var_124_6) / var_124_7

				if arg_121_1.var_.characterEffect105201ui_story then
					local var_124_9 = Mathf.Lerp(0, 0.5, var_124_8)

					arg_121_1.var_.characterEffect105201ui_story.fillFlat = true
					arg_121_1.var_.characterEffect105201ui_story.fillRatio = var_124_9
				end
			end

			if arg_121_1.time_ >= var_124_6 + var_124_7 and arg_121_1.time_ < var_124_6 + var_124_7 + arg_124_0 and arg_121_1.var_.characterEffect105201ui_story then
				local var_124_10 = 0.5

				arg_121_1.var_.characterEffect105201ui_story.fillFlat = true
				arg_121_1.var_.characterEffect105201ui_story.fillRatio = var_124_10
			end

			local var_124_11 = 0
			local var_124_12 = 1.1

			if var_124_11 < arg_121_1.time_ and arg_121_1.time_ <= var_124_11 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_13 = arg_121_1:FormatText(StoryNameCfg[264].name)

				arg_121_1.leftNameTxt_.text = var_124_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_14 = arg_121_1:GetWordFromCfg(115131030)
				local var_124_15 = arg_121_1:FormatText(var_124_14.content)

				arg_121_1.text_.text = var_124_15

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_16 = 44
				local var_124_17 = utf8.len(var_124_15)
				local var_124_18 = var_124_16 <= 0 and var_124_12 or var_124_12 * (var_124_17 / var_124_16)

				if var_124_18 > 0 and var_124_12 < var_124_18 then
					arg_121_1.talkMaxDuration = var_124_18

					if var_124_18 + var_124_11 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_18 + var_124_11
					end
				end

				arg_121_1.text_.text = var_124_15
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131030", "story_v_out_115131.awb") ~= 0 then
					local var_124_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131030", "story_v_out_115131.awb") / 1000

					if var_124_19 + var_124_11 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_19 + var_124_11
					end

					if var_124_14.prefab_name ~= "" and arg_121_1.actors_[var_124_14.prefab_name] ~= nil then
						local var_124_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_14.prefab_name].transform, "story_v_out_115131", "115131030", "story_v_out_115131.awb")

						arg_121_1:RecordAudio("115131030", var_124_20)
						arg_121_1:RecordAudio("115131030", var_124_20)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_115131", "115131030", "story_v_out_115131.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_115131", "115131030", "story_v_out_115131.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_21 = math.max(var_124_12, arg_121_1.talkMaxDuration)

			if var_124_11 <= arg_121_1.time_ and arg_121_1.time_ < var_124_11 + var_124_21 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_11) / var_124_21

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_11 + var_124_21 and arg_121_1.time_ < var_124_11 + var_124_21 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play115131031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 115131031
		arg_125_1.duration_ = 2.6

		local var_125_0 = {
			ja = 1.999999999999,
			ko = 2.6,
			zh = 2.066,
			en = 1.999999999999
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
				arg_125_0:Play115131032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_128_2 = arg_125_1.actors_["105201ui_story"]
			local var_128_3 = 0

			if var_128_3 < arg_125_1.time_ and arg_125_1.time_ <= var_128_3 + arg_128_0 and arg_125_1.var_.characterEffect105201ui_story == nil then
				arg_125_1.var_.characterEffect105201ui_story = var_128_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_4 = 0.2

			if var_128_3 <= arg_125_1.time_ and arg_125_1.time_ < var_128_3 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_3) / var_128_4

				if arg_125_1.var_.characterEffect105201ui_story then
					arg_125_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_3 + var_128_4 and arg_125_1.time_ < var_128_3 + var_128_4 + arg_128_0 and arg_125_1.var_.characterEffect105201ui_story then
				arg_125_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_128_6 = arg_125_1.actors_["10014ui_story"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 and arg_125_1.var_.characterEffect10014ui_story == nil then
				arg_125_1.var_.characterEffect10014ui_story = var_128_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_8 = 0.2

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8

				if arg_125_1.var_.characterEffect10014ui_story then
					local var_128_10 = Mathf.Lerp(0, 0.5, var_128_9)

					arg_125_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_125_1.var_.characterEffect10014ui_story.fillRatio = var_128_10
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 and arg_125_1.var_.characterEffect10014ui_story then
				local var_128_11 = 0.5

				arg_125_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_125_1.var_.characterEffect10014ui_story.fillRatio = var_128_11
			end

			local var_128_12 = 0
			local var_128_13 = 0.225

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_14 = arg_125_1:FormatText(StoryNameCfg[263].name)

				arg_125_1.leftNameTxt_.text = var_128_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_15 = arg_125_1:GetWordFromCfg(115131031)
				local var_128_16 = arg_125_1:FormatText(var_128_15.content)

				arg_125_1.text_.text = var_128_16

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_17 = 9
				local var_128_18 = utf8.len(var_128_16)
				local var_128_19 = var_128_17 <= 0 and var_128_13 or var_128_13 * (var_128_18 / var_128_17)

				if var_128_19 > 0 and var_128_13 < var_128_19 then
					arg_125_1.talkMaxDuration = var_128_19

					if var_128_19 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_19 + var_128_12
					end
				end

				arg_125_1.text_.text = var_128_16
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131031", "story_v_out_115131.awb") ~= 0 then
					local var_128_20 = manager.audio:GetVoiceLength("story_v_out_115131", "115131031", "story_v_out_115131.awb") / 1000

					if var_128_20 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_12
					end

					if var_128_15.prefab_name ~= "" and arg_125_1.actors_[var_128_15.prefab_name] ~= nil then
						local var_128_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_15.prefab_name].transform, "story_v_out_115131", "115131031", "story_v_out_115131.awb")

						arg_125_1:RecordAudio("115131031", var_128_21)
						arg_125_1:RecordAudio("115131031", var_128_21)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_115131", "115131031", "story_v_out_115131.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_115131", "115131031", "story_v_out_115131.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_22 = math.max(var_128_13, arg_125_1.talkMaxDuration)

			if var_128_12 <= arg_125_1.time_ and arg_125_1.time_ < var_128_12 + var_128_22 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_12) / var_128_22

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_12 + var_128_22 and arg_125_1.time_ < var_128_12 + var_128_22 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play115131032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 115131032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play115131033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["105201ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos105201ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, 100, 0)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos105201ui_story, var_132_4, var_132_3)

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

			local var_132_9 = arg_129_1.actors_["10014ui_story"].transform
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1.var_.moveOldPos10014ui_story = var_132_9.localPosition
			end

			local var_132_11 = 0.001

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11
				local var_132_13 = Vector3.New(0, 100, 0)

				var_132_9.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10014ui_story, var_132_13, var_132_12)

				local var_132_14 = manager.ui.mainCamera.transform.position - var_132_9.position

				var_132_9.forward = Vector3.New(var_132_14.x, var_132_14.y, var_132_14.z)

				local var_132_15 = var_132_9.localEulerAngles

				var_132_15.z = 0
				var_132_15.x = 0
				var_132_9.localEulerAngles = var_132_15
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 then
				var_132_9.localPosition = Vector3.New(0, 100, 0)

				local var_132_16 = manager.ui.mainCamera.transform.position - var_132_9.position

				var_132_9.forward = Vector3.New(var_132_16.x, var_132_16.y, var_132_16.z)

				local var_132_17 = var_132_9.localEulerAngles

				var_132_17.z = 0
				var_132_17.x = 0
				var_132_9.localEulerAngles = var_132_17
			end

			local var_132_18 = 0
			local var_132_19 = 0.7

			if var_132_18 < arg_129_1.time_ and arg_129_1.time_ <= var_132_18 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_20 = arg_129_1:GetWordFromCfg(115131032)
				local var_132_21 = arg_129_1:FormatText(var_132_20.content)

				arg_129_1.text_.text = var_132_21

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_22 = 28
				local var_132_23 = utf8.len(var_132_21)
				local var_132_24 = var_132_22 <= 0 and var_132_19 or var_132_19 * (var_132_23 / var_132_22)

				if var_132_24 > 0 and var_132_19 < var_132_24 then
					arg_129_1.talkMaxDuration = var_132_24

					if var_132_24 + var_132_18 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_24 + var_132_18
					end
				end

				arg_129_1.text_.text = var_132_21
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_25 = math.max(var_132_19, arg_129_1.talkMaxDuration)

			if var_132_18 <= arg_129_1.time_ and arg_129_1.time_ < var_132_18 + var_132_25 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_18) / var_132_25

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_18 + var_132_25 and arg_129_1.time_ < var_132_18 + var_132_25 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play115131033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 115131033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play115131034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 1.325

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

				local var_136_2 = arg_133_1:GetWordFromCfg(115131033)
				local var_136_3 = arg_133_1:FormatText(var_136_2.content)

				arg_133_1.text_.text = var_136_3

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_4 = 53
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
	Play115131034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 115131034
		arg_137_1.duration_ = 12.066

		local var_137_0 = {
			ja = 12.066,
			ko = 7.3,
			zh = 9.466,
			en = 7.733
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
				arg_137_0:Play115131035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["105201ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos105201ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos105201ui_story, var_140_4, var_140_3)

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

			local var_140_9 = 0

			if var_140_9 < arg_137_1.time_ and arg_137_1.time_ <= var_140_9 + arg_140_0 then
				arg_137_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_140_11 = arg_137_1.actors_["105201ui_story"]
			local var_140_12 = 0

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 and arg_137_1.var_.characterEffect105201ui_story == nil then
				arg_137_1.var_.characterEffect105201ui_story = var_140_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_13 = 0.2

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_13 then
				local var_140_14 = (arg_137_1.time_ - var_140_12) / var_140_13

				if arg_137_1.var_.characterEffect105201ui_story then
					arg_137_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_12 + var_140_13 and arg_137_1.time_ < var_140_12 + var_140_13 + arg_140_0 and arg_137_1.var_.characterEffect105201ui_story then
				arg_137_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_140_15 = arg_137_1.actors_["10014ui_story"].transform
			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 then
				arg_137_1.var_.moveOldPos10014ui_story = var_140_15.localPosition
			end

			local var_140_17 = 0.001

			if var_140_16 <= arg_137_1.time_ and arg_137_1.time_ < var_140_16 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_16) / var_140_17
				local var_140_19 = Vector3.New(0.7, -1.06, -6.2)

				var_140_15.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10014ui_story, var_140_19, var_140_18)

				local var_140_20 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_20.x, var_140_20.y, var_140_20.z)

				local var_140_21 = var_140_15.localEulerAngles

				var_140_21.z = 0
				var_140_21.x = 0
				var_140_15.localEulerAngles = var_140_21
			end

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 then
				var_140_15.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_140_22 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_22.x, var_140_22.y, var_140_22.z)

				local var_140_23 = var_140_15.localEulerAngles

				var_140_23.z = 0
				var_140_23.x = 0
				var_140_15.localEulerAngles = var_140_23
			end

			local var_140_24 = arg_137_1.actors_["10014ui_story"]
			local var_140_25 = 0

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 and arg_137_1.var_.characterEffect10014ui_story == nil then
				arg_137_1.var_.characterEffect10014ui_story = var_140_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_26 = 0.2

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				local var_140_27 = (arg_137_1.time_ - var_140_25) / var_140_26

				if arg_137_1.var_.characterEffect10014ui_story then
					local var_140_28 = Mathf.Lerp(0, 0.5, var_140_27)

					arg_137_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_137_1.var_.characterEffect10014ui_story.fillRatio = var_140_28
				end
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 and arg_137_1.var_.characterEffect10014ui_story then
				local var_140_29 = 0.5

				arg_137_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_137_1.var_.characterEffect10014ui_story.fillRatio = var_140_29
			end

			local var_140_30 = 0
			local var_140_31 = 0.525

			if var_140_30 < arg_137_1.time_ and arg_137_1.time_ <= var_140_30 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_32 = arg_137_1:FormatText(StoryNameCfg[263].name)

				arg_137_1.leftNameTxt_.text = var_140_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_33 = arg_137_1:GetWordFromCfg(115131034)
				local var_140_34 = arg_137_1:FormatText(var_140_33.content)

				arg_137_1.text_.text = var_140_34

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_35 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131034", "story_v_out_115131.awb") ~= 0 then
					local var_140_38 = manager.audio:GetVoiceLength("story_v_out_115131", "115131034", "story_v_out_115131.awb") / 1000

					if var_140_38 + var_140_30 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_38 + var_140_30
					end

					if var_140_33.prefab_name ~= "" and arg_137_1.actors_[var_140_33.prefab_name] ~= nil then
						local var_140_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_33.prefab_name].transform, "story_v_out_115131", "115131034", "story_v_out_115131.awb")

						arg_137_1:RecordAudio("115131034", var_140_39)
						arg_137_1:RecordAudio("115131034", var_140_39)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_115131", "115131034", "story_v_out_115131.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_115131", "115131034", "story_v_out_115131.awb")
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
	Play115131035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 115131035
		arg_141_1.duration_ = 17.6

		local var_141_0 = {
			ja = 17.6,
			ko = 15.7,
			zh = 11.466,
			en = 15.966
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
				arg_141_0:Play115131036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["105201ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect105201ui_story == nil then
				arg_141_1.var_.characterEffect105201ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.2

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect105201ui_story then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect105201ui_story.fillFlat = true
					arg_141_1.var_.characterEffect105201ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect105201ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect105201ui_story.fillFlat = true
				arg_141_1.var_.characterEffect105201ui_story.fillRatio = var_144_5
			end

			local var_144_6 = arg_141_1.actors_["10014ui_story"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and arg_141_1.var_.characterEffect10014ui_story == nil then
				arg_141_1.var_.characterEffect10014ui_story = var_144_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_8 = 0.2

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.characterEffect10014ui_story then
					arg_141_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.characterEffect10014ui_story then
				arg_141_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_144_11 = 0
			local var_144_12 = 1.325

			if var_144_11 < arg_141_1.time_ and arg_141_1.time_ <= var_144_11 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_13 = arg_141_1:FormatText(StoryNameCfg[264].name)

				arg_141_1.leftNameTxt_.text = var_144_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_14 = arg_141_1:GetWordFromCfg(115131035)
				local var_144_15 = arg_141_1:FormatText(var_144_14.content)

				arg_141_1.text_.text = var_144_15

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_16 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131035", "story_v_out_115131.awb") ~= 0 then
					local var_144_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131035", "story_v_out_115131.awb") / 1000

					if var_144_19 + var_144_11 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_11
					end

					if var_144_14.prefab_name ~= "" and arg_141_1.actors_[var_144_14.prefab_name] ~= nil then
						local var_144_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_14.prefab_name].transform, "story_v_out_115131", "115131035", "story_v_out_115131.awb")

						arg_141_1:RecordAudio("115131035", var_144_20)
						arg_141_1:RecordAudio("115131035", var_144_20)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_115131", "115131035", "story_v_out_115131.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_115131", "115131035", "story_v_out_115131.awb")
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
	Play115131036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 115131036
		arg_145_1.duration_ = 9.6

		local var_145_0 = {
			ja = 9.6,
			ko = 6.533,
			zh = 5.966,
			en = 6.7
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
				arg_145_0:Play115131037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_148_1 = 0
			local var_148_2 = 0.725

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_3 = arg_145_1:FormatText(StoryNameCfg[264].name)

				arg_145_1.leftNameTxt_.text = var_148_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_4 = arg_145_1:GetWordFromCfg(115131036)
				local var_148_5 = arg_145_1:FormatText(var_148_4.content)

				arg_145_1.text_.text = var_148_5

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_6 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131036", "story_v_out_115131.awb") ~= 0 then
					local var_148_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131036", "story_v_out_115131.awb") / 1000

					if var_148_9 + var_148_1 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_9 + var_148_1
					end

					if var_148_4.prefab_name ~= "" and arg_145_1.actors_[var_148_4.prefab_name] ~= nil then
						local var_148_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_4.prefab_name].transform, "story_v_out_115131", "115131036", "story_v_out_115131.awb")

						arg_145_1:RecordAudio("115131036", var_148_10)
						arg_145_1:RecordAudio("115131036", var_148_10)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_115131", "115131036", "story_v_out_115131.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_115131", "115131036", "story_v_out_115131.awb")
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
	Play115131037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 115131037
		arg_149_1.duration_ = 6.266

		local var_149_0 = {
			ja = 6.266,
			ko = 5.433,
			zh = 5.333,
			en = 5
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
				arg_149_0:Play115131038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_152_2 = arg_149_1.actors_["105201ui_story"]
			local var_152_3 = 0

			if var_152_3 < arg_149_1.time_ and arg_149_1.time_ <= var_152_3 + arg_152_0 and arg_149_1.var_.characterEffect105201ui_story == nil then
				arg_149_1.var_.characterEffect105201ui_story = var_152_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_4 = 0.2

			if var_152_3 <= arg_149_1.time_ and arg_149_1.time_ < var_152_3 + var_152_4 then
				local var_152_5 = (arg_149_1.time_ - var_152_3) / var_152_4

				if arg_149_1.var_.characterEffect105201ui_story then
					arg_149_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_3 + var_152_4 and arg_149_1.time_ < var_152_3 + var_152_4 + arg_152_0 and arg_149_1.var_.characterEffect105201ui_story then
				arg_149_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_152_6 = arg_149_1.actors_["10014ui_story"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 and arg_149_1.var_.characterEffect10014ui_story == nil then
				arg_149_1.var_.characterEffect10014ui_story = var_152_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_8 = 0.2

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_8 then
				local var_152_9 = (arg_149_1.time_ - var_152_7) / var_152_8

				if arg_149_1.var_.characterEffect10014ui_story then
					local var_152_10 = Mathf.Lerp(0, 0.5, var_152_9)

					arg_149_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_149_1.var_.characterEffect10014ui_story.fillRatio = var_152_10
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_8 and arg_149_1.time_ < var_152_7 + var_152_8 + arg_152_0 and arg_149_1.var_.characterEffect10014ui_story then
				local var_152_11 = 0.5

				arg_149_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_149_1.var_.characterEffect10014ui_story.fillRatio = var_152_11
			end

			local var_152_12 = 0
			local var_152_13 = 0.75

			if var_152_12 < arg_149_1.time_ and arg_149_1.time_ <= var_152_12 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_14 = arg_149_1:FormatText(StoryNameCfg[263].name)

				arg_149_1.leftNameTxt_.text = var_152_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_15 = arg_149_1:GetWordFromCfg(115131037)
				local var_152_16 = arg_149_1:FormatText(var_152_15.content)

				arg_149_1.text_.text = var_152_16

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_17 = 30
				local var_152_18 = utf8.len(var_152_16)
				local var_152_19 = var_152_17 <= 0 and var_152_13 or var_152_13 * (var_152_18 / var_152_17)

				if var_152_19 > 0 and var_152_13 < var_152_19 then
					arg_149_1.talkMaxDuration = var_152_19

					if var_152_19 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_12
					end
				end

				arg_149_1.text_.text = var_152_16
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131037", "story_v_out_115131.awb") ~= 0 then
					local var_152_20 = manager.audio:GetVoiceLength("story_v_out_115131", "115131037", "story_v_out_115131.awb") / 1000

					if var_152_20 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_20 + var_152_12
					end

					if var_152_15.prefab_name ~= "" and arg_149_1.actors_[var_152_15.prefab_name] ~= nil then
						local var_152_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_15.prefab_name].transform, "story_v_out_115131", "115131037", "story_v_out_115131.awb")

						arg_149_1:RecordAudio("115131037", var_152_21)
						arg_149_1:RecordAudio("115131037", var_152_21)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_115131", "115131037", "story_v_out_115131.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_115131", "115131037", "story_v_out_115131.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_22 = math.max(var_152_13, arg_149_1.talkMaxDuration)

			if var_152_12 <= arg_149_1.time_ and arg_149_1.time_ < var_152_12 + var_152_22 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_12) / var_152_22

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_12 + var_152_22 and arg_149_1.time_ < var_152_12 + var_152_22 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play115131038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 115131038
		arg_153_1.duration_ = 15

		local var_153_0 = {
			ja = 14.2,
			ko = 12.633,
			zh = 13.133,
			en = 15
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
				arg_153_0:Play115131039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["105201ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect105201ui_story == nil then
				arg_153_1.var_.characterEffect105201ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.2

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect105201ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect105201ui_story.fillFlat = true
					arg_153_1.var_.characterEffect105201ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect105201ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect105201ui_story.fillFlat = true
				arg_153_1.var_.characterEffect105201ui_story.fillRatio = var_156_5
			end

			local var_156_6 = arg_153_1.actors_["10014ui_story"]
			local var_156_7 = 0

			if var_156_7 < arg_153_1.time_ and arg_153_1.time_ <= var_156_7 + arg_156_0 and arg_153_1.var_.characterEffect10014ui_story == nil then
				arg_153_1.var_.characterEffect10014ui_story = var_156_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_8 = 0.2

			if var_156_7 <= arg_153_1.time_ and arg_153_1.time_ < var_156_7 + var_156_8 then
				local var_156_9 = (arg_153_1.time_ - var_156_7) / var_156_8

				if arg_153_1.var_.characterEffect10014ui_story then
					arg_153_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_7 + var_156_8 and arg_153_1.time_ < var_156_7 + var_156_8 + arg_156_0 and arg_153_1.var_.characterEffect10014ui_story then
				arg_153_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_156_11 = 0
			local var_156_12 = 1.3

			if var_156_11 < arg_153_1.time_ and arg_153_1.time_ <= var_156_11 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_13 = arg_153_1:FormatText(StoryNameCfg[264].name)

				arg_153_1.leftNameTxt_.text = var_156_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_14 = arg_153_1:GetWordFromCfg(115131038)
				local var_156_15 = arg_153_1:FormatText(var_156_14.content)

				arg_153_1.text_.text = var_156_15

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_16 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131038", "story_v_out_115131.awb") ~= 0 then
					local var_156_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131038", "story_v_out_115131.awb") / 1000

					if var_156_19 + var_156_11 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_19 + var_156_11
					end

					if var_156_14.prefab_name ~= "" and arg_153_1.actors_[var_156_14.prefab_name] ~= nil then
						local var_156_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_14.prefab_name].transform, "story_v_out_115131", "115131038", "story_v_out_115131.awb")

						arg_153_1:RecordAudio("115131038", var_156_20)
						arg_153_1:RecordAudio("115131038", var_156_20)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_115131", "115131038", "story_v_out_115131.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_115131", "115131038", "story_v_out_115131.awb")
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
	Play115131039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 115131039
		arg_157_1.duration_ = 15.033

		local var_157_0 = {
			ja = 14.733,
			ko = 15.033,
			zh = 13,
			en = 14.066
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
				arg_157_0:Play115131040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_160_1 = 0
			local var_160_2 = 1.475

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_3 = arg_157_1:FormatText(StoryNameCfg[264].name)

				arg_157_1.leftNameTxt_.text = var_160_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_4 = arg_157_1:GetWordFromCfg(115131039)
				local var_160_5 = arg_157_1:FormatText(var_160_4.content)

				arg_157_1.text_.text = var_160_5

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_6 = 59
				local var_160_7 = utf8.len(var_160_5)
				local var_160_8 = var_160_6 <= 0 and var_160_2 or var_160_2 * (var_160_7 / var_160_6)

				if var_160_8 > 0 and var_160_2 < var_160_8 then
					arg_157_1.talkMaxDuration = var_160_8

					if var_160_8 + var_160_1 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_1
					end
				end

				arg_157_1.text_.text = var_160_5
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131039", "story_v_out_115131.awb") ~= 0 then
					local var_160_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131039", "story_v_out_115131.awb") / 1000

					if var_160_9 + var_160_1 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_9 + var_160_1
					end

					if var_160_4.prefab_name ~= "" and arg_157_1.actors_[var_160_4.prefab_name] ~= nil then
						local var_160_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_4.prefab_name].transform, "story_v_out_115131", "115131039", "story_v_out_115131.awb")

						arg_157_1:RecordAudio("115131039", var_160_10)
						arg_157_1:RecordAudio("115131039", var_160_10)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_115131", "115131039", "story_v_out_115131.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_115131", "115131039", "story_v_out_115131.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_11 = math.max(var_160_2, arg_157_1.talkMaxDuration)

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_11 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_1) / var_160_11

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_1 + var_160_11 and arg_157_1.time_ < var_160_1 + var_160_11 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play115131040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 115131040
		arg_161_1.duration_ = 10.8

		local var_161_0 = {
			ja = 10.066,
			ko = 7.9,
			zh = 7.7,
			en = 10.8
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
				arg_161_0:Play115131041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_164_1 = 0
			local var_164_2 = 0.925

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_3 = arg_161_1:FormatText(StoryNameCfg[264].name)

				arg_161_1.leftNameTxt_.text = var_164_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_4 = arg_161_1:GetWordFromCfg(115131040)
				local var_164_5 = arg_161_1:FormatText(var_164_4.content)

				arg_161_1.text_.text = var_164_5

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_6 = 37
				local var_164_7 = utf8.len(var_164_5)
				local var_164_8 = var_164_6 <= 0 and var_164_2 or var_164_2 * (var_164_7 / var_164_6)

				if var_164_8 > 0 and var_164_2 < var_164_8 then
					arg_161_1.talkMaxDuration = var_164_8

					if var_164_8 + var_164_1 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_1
					end
				end

				arg_161_1.text_.text = var_164_5
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131040", "story_v_out_115131.awb") ~= 0 then
					local var_164_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131040", "story_v_out_115131.awb") / 1000

					if var_164_9 + var_164_1 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_9 + var_164_1
					end

					if var_164_4.prefab_name ~= "" and arg_161_1.actors_[var_164_4.prefab_name] ~= nil then
						local var_164_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_4.prefab_name].transform, "story_v_out_115131", "115131040", "story_v_out_115131.awb")

						arg_161_1:RecordAudio("115131040", var_164_10)
						arg_161_1:RecordAudio("115131040", var_164_10)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_115131", "115131040", "story_v_out_115131.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_115131", "115131040", "story_v_out_115131.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_11 = math.max(var_164_2, arg_161_1.talkMaxDuration)

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_11 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_1) / var_164_11

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_1 + var_164_11 and arg_161_1.time_ < var_164_1 + var_164_11 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play115131041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 115131041
		arg_165_1.duration_ = 13.1

		local var_165_0 = {
			ja = 13.1,
			ko = 5.733,
			zh = 5.6,
			en = 7.466
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
				arg_165_0:Play115131042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_168_1 = 0
			local var_168_2 = 0.575

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_3 = arg_165_1:FormatText(StoryNameCfg[264].name)

				arg_165_1.leftNameTxt_.text = var_168_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_4 = arg_165_1:GetWordFromCfg(115131041)
				local var_168_5 = arg_165_1:FormatText(var_168_4.content)

				arg_165_1.text_.text = var_168_5

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_6 = 23
				local var_168_7 = utf8.len(var_168_5)
				local var_168_8 = var_168_6 <= 0 and var_168_2 or var_168_2 * (var_168_7 / var_168_6)

				if var_168_8 > 0 and var_168_2 < var_168_8 then
					arg_165_1.talkMaxDuration = var_168_8

					if var_168_8 + var_168_1 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_1
					end
				end

				arg_165_1.text_.text = var_168_5
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131041", "story_v_out_115131.awb") ~= 0 then
					local var_168_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131041", "story_v_out_115131.awb") / 1000

					if var_168_9 + var_168_1 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_9 + var_168_1
					end

					if var_168_4.prefab_name ~= "" and arg_165_1.actors_[var_168_4.prefab_name] ~= nil then
						local var_168_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_4.prefab_name].transform, "story_v_out_115131", "115131041", "story_v_out_115131.awb")

						arg_165_1:RecordAudio("115131041", var_168_10)
						arg_165_1:RecordAudio("115131041", var_168_10)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_115131", "115131041", "story_v_out_115131.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_115131", "115131041", "story_v_out_115131.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_11 = math.max(var_168_2, arg_165_1.talkMaxDuration)

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_11 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_1) / var_168_11

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_1 + var_168_11 and arg_165_1.time_ < var_168_1 + var_168_11 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play115131042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 115131042
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play115131043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10014ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect10014ui_story == nil then
				arg_169_1.var_.characterEffect10014ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect10014ui_story then
					local var_172_4 = Mathf.Lerp(0, 0.5, var_172_3)

					arg_169_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_169_1.var_.characterEffect10014ui_story.fillRatio = var_172_4
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect10014ui_story then
				local var_172_5 = 0.5

				arg_169_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_169_1.var_.characterEffect10014ui_story.fillRatio = var_172_5
			end

			local var_172_6 = 0
			local var_172_7 = 1.475

			if var_172_6 < arg_169_1.time_ and arg_169_1.time_ <= var_172_6 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_8 = arg_169_1:GetWordFromCfg(115131042)
				local var_172_9 = arg_169_1:FormatText(var_172_8.content)

				arg_169_1.text_.text = var_172_9

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_10 = 59
				local var_172_11 = utf8.len(var_172_9)
				local var_172_12 = var_172_10 <= 0 and var_172_7 or var_172_7 * (var_172_11 / var_172_10)

				if var_172_12 > 0 and var_172_7 < var_172_12 then
					arg_169_1.talkMaxDuration = var_172_12

					if var_172_12 + var_172_6 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_12 + var_172_6
					end
				end

				arg_169_1.text_.text = var_172_9
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_13 = math.max(var_172_7, arg_169_1.talkMaxDuration)

			if var_172_6 <= arg_169_1.time_ and arg_169_1.time_ < var_172_6 + var_172_13 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_6) / var_172_13

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_6 + var_172_13 and arg_169_1.time_ < var_172_6 + var_172_13 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play115131043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 115131043
		arg_173_1.duration_ = 2.366

		local var_173_0 = {
			ja = 2.3,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.366
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
				arg_173_0:Play115131044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["105201ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect105201ui_story == nil then
				arg_173_1.var_.characterEffect105201ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect105201ui_story then
					arg_173_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect105201ui_story then
				arg_173_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_176_4 = 0

			if var_176_4 < arg_173_1.time_ and arg_173_1.time_ <= var_176_4 + arg_176_0 then
				arg_173_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_176_5 = 0
			local var_176_6 = 0.1

			if var_176_5 < arg_173_1.time_ and arg_173_1.time_ <= var_176_5 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_7 = arg_173_1:FormatText(StoryNameCfg[263].name)

				arg_173_1.leftNameTxt_.text = var_176_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_8 = arg_173_1:GetWordFromCfg(115131043)
				local var_176_9 = arg_173_1:FormatText(var_176_8.content)

				arg_173_1.text_.text = var_176_9

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_10 = 4
				local var_176_11 = utf8.len(var_176_9)
				local var_176_12 = var_176_10 <= 0 and var_176_6 or var_176_6 * (var_176_11 / var_176_10)

				if var_176_12 > 0 and var_176_6 < var_176_12 then
					arg_173_1.talkMaxDuration = var_176_12

					if var_176_12 + var_176_5 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_12 + var_176_5
					end
				end

				arg_173_1.text_.text = var_176_9
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131043", "story_v_out_115131.awb") ~= 0 then
					local var_176_13 = manager.audio:GetVoiceLength("story_v_out_115131", "115131043", "story_v_out_115131.awb") / 1000

					if var_176_13 + var_176_5 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_13 + var_176_5
					end

					if var_176_8.prefab_name ~= "" and arg_173_1.actors_[var_176_8.prefab_name] ~= nil then
						local var_176_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_8.prefab_name].transform, "story_v_out_115131", "115131043", "story_v_out_115131.awb")

						arg_173_1:RecordAudio("115131043", var_176_14)
						arg_173_1:RecordAudio("115131043", var_176_14)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_115131", "115131043", "story_v_out_115131.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_115131", "115131043", "story_v_out_115131.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_15 = math.max(var_176_6, arg_173_1.talkMaxDuration)

			if var_176_5 <= arg_173_1.time_ and arg_173_1.time_ < var_176_5 + var_176_15 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_5) / var_176_15

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_5 + var_176_15 and arg_173_1.time_ < var_176_5 + var_176_15 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play115131044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 115131044
		arg_177_1.duration_ = 8.2

		local var_177_0 = {
			ja = 8.033,
			ko = 5.766,
			zh = 5.3,
			en = 8.2
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
				arg_177_0:Play115131045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["105201ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect105201ui_story == nil then
				arg_177_1.var_.characterEffect105201ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect105201ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect105201ui_story.fillFlat = true
					arg_177_1.var_.characterEffect105201ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect105201ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect105201ui_story.fillFlat = true
				arg_177_1.var_.characterEffect105201ui_story.fillRatio = var_180_5
			end

			local var_180_6 = arg_177_1.actors_["10014ui_story"]
			local var_180_7 = 0

			if var_180_7 < arg_177_1.time_ and arg_177_1.time_ <= var_180_7 + arg_180_0 and arg_177_1.var_.characterEffect10014ui_story == nil then
				arg_177_1.var_.characterEffect10014ui_story = var_180_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_8 = 0.2

			if var_180_7 <= arg_177_1.time_ and arg_177_1.time_ < var_180_7 + var_180_8 then
				local var_180_9 = (arg_177_1.time_ - var_180_7) / var_180_8

				if arg_177_1.var_.characterEffect10014ui_story then
					arg_177_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_7 + var_180_8 and arg_177_1.time_ < var_180_7 + var_180_8 + arg_180_0 and arg_177_1.var_.characterEffect10014ui_story then
				arg_177_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_180_10 = 0

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 then
				arg_177_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_180_11 = 0
			local var_180_12 = 0.475

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_13 = arg_177_1:FormatText(StoryNameCfg[264].name)

				arg_177_1.leftNameTxt_.text = var_180_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_14 = arg_177_1:GetWordFromCfg(115131044)
				local var_180_15 = arg_177_1:FormatText(var_180_14.content)

				arg_177_1.text_.text = var_180_15

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_16 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131044", "story_v_out_115131.awb") ~= 0 then
					local var_180_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131044", "story_v_out_115131.awb") / 1000

					if var_180_19 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_11
					end

					if var_180_14.prefab_name ~= "" and arg_177_1.actors_[var_180_14.prefab_name] ~= nil then
						local var_180_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_14.prefab_name].transform, "story_v_out_115131", "115131044", "story_v_out_115131.awb")

						arg_177_1:RecordAudio("115131044", var_180_20)
						arg_177_1:RecordAudio("115131044", var_180_20)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_115131", "115131044", "story_v_out_115131.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_115131", "115131044", "story_v_out_115131.awb")
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
	Play115131045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 115131045
		arg_181_1.duration_ = 20.766

		local var_181_0 = {
			ja = 15.9,
			ko = 20.766,
			zh = 11.433,
			en = 10.666
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
				arg_181_0:Play115131046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_184_1 = 0
			local var_184_2 = 1.275

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_3 = arg_181_1:FormatText(StoryNameCfg[264].name)

				arg_181_1.leftNameTxt_.text = var_184_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_4 = arg_181_1:GetWordFromCfg(115131045)
				local var_184_5 = arg_181_1:FormatText(var_184_4.content)

				arg_181_1.text_.text = var_184_5

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_6 = 51
				local var_184_7 = utf8.len(var_184_5)
				local var_184_8 = var_184_6 <= 0 and var_184_2 or var_184_2 * (var_184_7 / var_184_6)

				if var_184_8 > 0 and var_184_2 < var_184_8 then
					arg_181_1.talkMaxDuration = var_184_8

					if var_184_8 + var_184_1 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_1
					end
				end

				arg_181_1.text_.text = var_184_5
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131045", "story_v_out_115131.awb") ~= 0 then
					local var_184_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131045", "story_v_out_115131.awb") / 1000

					if var_184_9 + var_184_1 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_9 + var_184_1
					end

					if var_184_4.prefab_name ~= "" and arg_181_1.actors_[var_184_4.prefab_name] ~= nil then
						local var_184_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_4.prefab_name].transform, "story_v_out_115131", "115131045", "story_v_out_115131.awb")

						arg_181_1:RecordAudio("115131045", var_184_10)
						arg_181_1:RecordAudio("115131045", var_184_10)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_115131", "115131045", "story_v_out_115131.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_115131", "115131045", "story_v_out_115131.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_11 = math.max(var_184_2, arg_181_1.talkMaxDuration)

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_11 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_1) / var_184_11

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_1 + var_184_11 and arg_181_1.time_ < var_184_1 + var_184_11 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play115131046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 115131046
		arg_185_1.duration_ = 6.1

		local var_185_0 = {
			ja = 6.1,
			ko = 5.266,
			zh = 5.533,
			en = 5.7
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
				arg_185_0:Play115131047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_188_1 = 0
			local var_188_2 = 0.5

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_3 = arg_185_1:FormatText(StoryNameCfg[264].name)

				arg_185_1.leftNameTxt_.text = var_188_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_4 = arg_185_1:GetWordFromCfg(115131046)
				local var_188_5 = arg_185_1:FormatText(var_188_4.content)

				arg_185_1.text_.text = var_188_5

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_6 = 20
				local var_188_7 = utf8.len(var_188_5)
				local var_188_8 = var_188_6 <= 0 and var_188_2 or var_188_2 * (var_188_7 / var_188_6)

				if var_188_8 > 0 and var_188_2 < var_188_8 then
					arg_185_1.talkMaxDuration = var_188_8

					if var_188_8 + var_188_1 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_1
					end
				end

				arg_185_1.text_.text = var_188_5
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131046", "story_v_out_115131.awb") ~= 0 then
					local var_188_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131046", "story_v_out_115131.awb") / 1000

					if var_188_9 + var_188_1 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_9 + var_188_1
					end

					if var_188_4.prefab_name ~= "" and arg_185_1.actors_[var_188_4.prefab_name] ~= nil then
						local var_188_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_4.prefab_name].transform, "story_v_out_115131", "115131046", "story_v_out_115131.awb")

						arg_185_1:RecordAudio("115131046", var_188_10)
						arg_185_1:RecordAudio("115131046", var_188_10)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_115131", "115131046", "story_v_out_115131.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_115131", "115131046", "story_v_out_115131.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_11 = math.max(var_188_2, arg_185_1.talkMaxDuration)

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_11 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_1) / var_188_11

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_1 + var_188_11 and arg_185_1.time_ < var_188_1 + var_188_11 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play115131047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 115131047
		arg_189_1.duration_ = 10.033

		local var_189_0 = {
			ja = 5.166,
			ko = 5.733,
			zh = 7.933,
			en = 10.033
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
				arg_189_0:Play115131048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = manager.ui.mainCamera.transform
			local var_192_1 = 0.325

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.shakeOldPos = var_192_0.localPosition
			end

			local var_192_2 = 1

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / 0.066
				local var_192_4, var_192_5 = math.modf(var_192_3)

				var_192_0.localPosition = Vector3.New(var_192_5 * 0.13, var_192_5 * 0.13, var_192_5 * 0.13) + arg_189_1.var_.shakeOldPos
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = arg_189_1.var_.shakeOldPos
			end

			local var_192_6 = 0

			if var_192_6 < arg_189_1.time_ and arg_189_1.time_ <= var_192_6 + arg_192_0 then
				arg_189_1.allBtn_.enabled = false
			end

			local var_192_7 = 1.325

			if arg_189_1.time_ >= var_192_6 + var_192_7 and arg_189_1.time_ < var_192_6 + var_192_7 + arg_192_0 then
				arg_189_1.allBtn_.enabled = true
			end

			local var_192_8 = arg_189_1.actors_["105201ui_story"].transform
			local var_192_9 = 0

			if var_192_9 < arg_189_1.time_ and arg_189_1.time_ <= var_192_9 + arg_192_0 then
				arg_189_1.var_.moveOldPos105201ui_story = var_192_8.localPosition
			end

			local var_192_10 = 0.001

			if var_192_9 <= arg_189_1.time_ and arg_189_1.time_ < var_192_9 + var_192_10 then
				local var_192_11 = (arg_189_1.time_ - var_192_9) / var_192_10
				local var_192_12 = Vector3.New(0, 100, 0)

				var_192_8.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos105201ui_story, var_192_12, var_192_11)

				local var_192_13 = manager.ui.mainCamera.transform.position - var_192_8.position

				var_192_8.forward = Vector3.New(var_192_13.x, var_192_13.y, var_192_13.z)

				local var_192_14 = var_192_8.localEulerAngles

				var_192_14.z = 0
				var_192_14.x = 0
				var_192_8.localEulerAngles = var_192_14
			end

			if arg_189_1.time_ >= var_192_9 + var_192_10 and arg_189_1.time_ < var_192_9 + var_192_10 + arg_192_0 then
				var_192_8.localPosition = Vector3.New(0, 100, 0)

				local var_192_15 = manager.ui.mainCamera.transform.position - var_192_8.position

				var_192_8.forward = Vector3.New(var_192_15.x, var_192_15.y, var_192_15.z)

				local var_192_16 = var_192_8.localEulerAngles

				var_192_16.z = 0
				var_192_16.x = 0
				var_192_8.localEulerAngles = var_192_16
			end

			local var_192_17 = arg_189_1.actors_["10014ui_story"].transform
			local var_192_18 = 0

			if var_192_18 < arg_189_1.time_ and arg_189_1.time_ <= var_192_18 + arg_192_0 then
				arg_189_1.var_.moveOldPos10014ui_story = var_192_17.localPosition
			end

			local var_192_19 = 0.001

			if var_192_18 <= arg_189_1.time_ and arg_189_1.time_ < var_192_18 + var_192_19 then
				local var_192_20 = (arg_189_1.time_ - var_192_18) / var_192_19
				local var_192_21 = Vector3.New(0, 100, 0)

				var_192_17.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos10014ui_story, var_192_21, var_192_20)

				local var_192_22 = manager.ui.mainCamera.transform.position - var_192_17.position

				var_192_17.forward = Vector3.New(var_192_22.x, var_192_22.y, var_192_22.z)

				local var_192_23 = var_192_17.localEulerAngles

				var_192_23.z = 0
				var_192_23.x = 0
				var_192_17.localEulerAngles = var_192_23
			end

			if arg_189_1.time_ >= var_192_18 + var_192_19 and arg_189_1.time_ < var_192_18 + var_192_19 + arg_192_0 then
				var_192_17.localPosition = Vector3.New(0, 100, 0)

				local var_192_24 = manager.ui.mainCamera.transform.position - var_192_17.position

				var_192_17.forward = Vector3.New(var_192_24.x, var_192_24.y, var_192_24.z)

				local var_192_25 = var_192_17.localEulerAngles

				var_192_25.z = 0
				var_192_25.x = 0
				var_192_17.localEulerAngles = var_192_25
			end

			local var_192_26 = 0
			local var_192_27 = 0.325

			if var_192_26 < arg_189_1.time_ and arg_189_1.time_ <= var_192_26 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_28 = arg_189_1:FormatText(StoryNameCfg[263].name)

				arg_189_1.leftNameTxt_.text = var_192_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, true)
				arg_189_1.iconController_:SetSelectedState("hero")

				arg_189_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_105201")

				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_29 = arg_189_1:GetWordFromCfg(115131047)
				local var_192_30 = arg_189_1:FormatText(var_192_29.content)

				arg_189_1.text_.text = var_192_30

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_31 = 13
				local var_192_32 = utf8.len(var_192_30)
				local var_192_33 = var_192_31 <= 0 and var_192_27 or var_192_27 * (var_192_32 / var_192_31)

				if var_192_33 > 0 and var_192_27 < var_192_33 then
					arg_189_1.talkMaxDuration = var_192_33

					if var_192_33 + var_192_26 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_33 + var_192_26
					end
				end

				arg_189_1.text_.text = var_192_30
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131047", "story_v_out_115131.awb") ~= 0 then
					local var_192_34 = manager.audio:GetVoiceLength("story_v_out_115131", "115131047", "story_v_out_115131.awb") / 1000

					if var_192_34 + var_192_26 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_34 + var_192_26
					end

					if var_192_29.prefab_name ~= "" and arg_189_1.actors_[var_192_29.prefab_name] ~= nil then
						local var_192_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_29.prefab_name].transform, "story_v_out_115131", "115131047", "story_v_out_115131.awb")

						arg_189_1:RecordAudio("115131047", var_192_35)
						arg_189_1:RecordAudio("115131047", var_192_35)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_115131", "115131047", "story_v_out_115131.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_115131", "115131047", "story_v_out_115131.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_36 = math.max(var_192_27, arg_189_1.talkMaxDuration)

			if var_192_26 <= arg_189_1.time_ and arg_189_1.time_ < var_192_26 + var_192_36 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_26) / var_192_36

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_26 + var_192_36 and arg_189_1.time_ < var_192_26 + var_192_36 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play115131048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 115131048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play115131049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 1.4

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

				local var_196_2 = arg_193_1:GetWordFromCfg(115131048)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 56
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
	Play115131049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 115131049
		arg_197_1.duration_ = 11.966

		local var_197_0 = {
			ja = 6.166,
			ko = 5.333,
			zh = 11.966,
			en = 5.933
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play115131050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["105201ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos105201ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos105201ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["105201ui_story"]
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect105201ui_story == nil then
				arg_197_1.var_.characterEffect105201ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.2

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect105201ui_story then
					arg_197_1.var_.characterEffect105201ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect105201ui_story then
				arg_197_1.var_.characterEffect105201ui_story.fillFlat = false
			end

			local var_200_13 = 0

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_200_14 = 0

			if var_200_14 < arg_197_1.time_ and arg_197_1.time_ <= var_200_14 + arg_200_0 then
				arg_197_1:PlayTimeline("105201ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_200_15 = 0
			local var_200_16 = 0.325

			if var_200_15 < arg_197_1.time_ and arg_197_1.time_ <= var_200_15 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_17 = arg_197_1:FormatText(StoryNameCfg[263].name)

				arg_197_1.leftNameTxt_.text = var_200_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_18 = arg_197_1:GetWordFromCfg(115131049)
				local var_200_19 = arg_197_1:FormatText(var_200_18.content)

				arg_197_1.text_.text = var_200_19

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_20 = 13
				local var_200_21 = utf8.len(var_200_19)
				local var_200_22 = var_200_20 <= 0 and var_200_16 or var_200_16 * (var_200_21 / var_200_20)

				if var_200_22 > 0 and var_200_16 < var_200_22 then
					arg_197_1.talkMaxDuration = var_200_22

					if var_200_22 + var_200_15 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_22 + var_200_15
					end
				end

				arg_197_1.text_.text = var_200_19
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131049", "story_v_out_115131.awb") ~= 0 then
					local var_200_23 = manager.audio:GetVoiceLength("story_v_out_115131", "115131049", "story_v_out_115131.awb") / 1000

					if var_200_23 + var_200_15 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_23 + var_200_15
					end

					if var_200_18.prefab_name ~= "" and arg_197_1.actors_[var_200_18.prefab_name] ~= nil then
						local var_200_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_18.prefab_name].transform, "story_v_out_115131", "115131049", "story_v_out_115131.awb")

						arg_197_1:RecordAudio("115131049", var_200_24)
						arg_197_1:RecordAudio("115131049", var_200_24)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_115131", "115131049", "story_v_out_115131.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_115131", "115131049", "story_v_out_115131.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_25 = math.max(var_200_16, arg_197_1.talkMaxDuration)

			if var_200_15 <= arg_197_1.time_ and arg_197_1.time_ < var_200_15 + var_200_25 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_15) / var_200_25

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_15 + var_200_25 and arg_197_1.time_ < var_200_15 + var_200_25 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play115131050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 115131050
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play115131051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["105201ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect105201ui_story == nil then
				arg_201_1.var_.characterEffect105201ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.2

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect105201ui_story then
					local var_204_4 = Mathf.Lerp(0, 0.5, var_204_3)

					arg_201_1.var_.characterEffect105201ui_story.fillFlat = true
					arg_201_1.var_.characterEffect105201ui_story.fillRatio = var_204_4
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect105201ui_story then
				local var_204_5 = 0.5

				arg_201_1.var_.characterEffect105201ui_story.fillFlat = true
				arg_201_1.var_.characterEffect105201ui_story.fillRatio = var_204_5
			end

			local var_204_6 = arg_201_1.actors_["10014ui_story"].transform
			local var_204_7 = 0

			if var_204_7 < arg_201_1.time_ and arg_201_1.time_ <= var_204_7 + arg_204_0 then
				arg_201_1.var_.moveOldPos10014ui_story = var_204_6.localPosition
			end

			local var_204_8 = 0.001

			if var_204_7 <= arg_201_1.time_ and arg_201_1.time_ < var_204_7 + var_204_8 then
				local var_204_9 = (arg_201_1.time_ - var_204_7) / var_204_8
				local var_204_10 = Vector3.New(0.7, -1.06, -6.2)

				var_204_6.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10014ui_story, var_204_10, var_204_9)

				local var_204_11 = manager.ui.mainCamera.transform.position - var_204_6.position

				var_204_6.forward = Vector3.New(var_204_11.x, var_204_11.y, var_204_11.z)

				local var_204_12 = var_204_6.localEulerAngles

				var_204_12.z = 0
				var_204_12.x = 0
				var_204_6.localEulerAngles = var_204_12
			end

			if arg_201_1.time_ >= var_204_7 + var_204_8 and arg_201_1.time_ < var_204_7 + var_204_8 + arg_204_0 then
				var_204_6.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_204_13 = manager.ui.mainCamera.transform.position - var_204_6.position

				var_204_6.forward = Vector3.New(var_204_13.x, var_204_13.y, var_204_13.z)

				local var_204_14 = var_204_6.localEulerAngles

				var_204_14.z = 0
				var_204_14.x = 0
				var_204_6.localEulerAngles = var_204_14
			end

			local var_204_15 = arg_201_1.actors_["10014ui_story"]
			local var_204_16 = 0

			if var_204_16 < arg_201_1.time_ and arg_201_1.time_ <= var_204_16 + arg_204_0 and arg_201_1.var_.characterEffect10014ui_story == nil then
				arg_201_1.var_.characterEffect10014ui_story = var_204_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_17 = 0.0166666666666667

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17

				if arg_201_1.var_.characterEffect10014ui_story then
					local var_204_19 = Mathf.Lerp(0, 0.5, var_204_18)

					arg_201_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_201_1.var_.characterEffect10014ui_story.fillRatio = var_204_19
				end
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 and arg_201_1.var_.characterEffect10014ui_story then
				local var_204_20 = 0.5

				arg_201_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_201_1.var_.characterEffect10014ui_story.fillRatio = var_204_20
			end

			local var_204_21 = 0
			local var_204_22 = 0.375

			if var_204_21 < arg_201_1.time_ and arg_201_1.time_ <= var_204_21 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_23 = arg_201_1:GetWordFromCfg(115131050)
				local var_204_24 = arg_201_1:FormatText(var_204_23.content)

				arg_201_1.text_.text = var_204_24

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_25 = 15
				local var_204_26 = utf8.len(var_204_24)
				local var_204_27 = var_204_25 <= 0 and var_204_22 or var_204_22 * (var_204_26 / var_204_25)

				if var_204_27 > 0 and var_204_22 < var_204_27 then
					arg_201_1.talkMaxDuration = var_204_27

					if var_204_27 + var_204_21 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_27 + var_204_21
					end
				end

				arg_201_1.text_.text = var_204_24
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_28 = math.max(var_204_22, arg_201_1.talkMaxDuration)

			if var_204_21 <= arg_201_1.time_ and arg_201_1.time_ < var_204_21 + var_204_28 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_21) / var_204_28

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_21 + var_204_28 and arg_201_1.time_ < var_204_21 + var_204_28 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play115131051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 115131051
		arg_205_1.duration_ = 6.3

		local var_205_0 = {
			ja = 2.566,
			ko = 4.133,
			zh = 4.966,
			en = 6.3
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
				arg_205_0:Play115131052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_208_1 = arg_205_1.actors_["10014ui_story"]
			local var_208_2 = 0

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect10014ui_story == nil then
				arg_205_1.var_.characterEffect10014ui_story = var_208_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_3 = 0.2

			if var_208_2 <= arg_205_1.time_ and arg_205_1.time_ < var_208_2 + var_208_3 then
				local var_208_4 = (arg_205_1.time_ - var_208_2) / var_208_3

				if arg_205_1.var_.characterEffect10014ui_story then
					arg_205_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_2 + var_208_3 and arg_205_1.time_ < var_208_2 + var_208_3 + arg_208_0 and arg_205_1.var_.characterEffect10014ui_story then
				arg_205_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_208_5 = 0
			local var_208_6 = 0.45

			if var_208_5 < arg_205_1.time_ and arg_205_1.time_ <= var_208_5 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_7 = arg_205_1:FormatText(StoryNameCfg[264].name)

				arg_205_1.leftNameTxt_.text = var_208_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_8 = arg_205_1:GetWordFromCfg(115131051)
				local var_208_9 = arg_205_1:FormatText(var_208_8.content)

				arg_205_1.text_.text = var_208_9

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_10 = 18
				local var_208_11 = utf8.len(var_208_9)
				local var_208_12 = var_208_10 <= 0 and var_208_6 or var_208_6 * (var_208_11 / var_208_10)

				if var_208_12 > 0 and var_208_6 < var_208_12 then
					arg_205_1.talkMaxDuration = var_208_12

					if var_208_12 + var_208_5 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_12 + var_208_5
					end
				end

				arg_205_1.text_.text = var_208_9
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131051", "story_v_out_115131.awb") ~= 0 then
					local var_208_13 = manager.audio:GetVoiceLength("story_v_out_115131", "115131051", "story_v_out_115131.awb") / 1000

					if var_208_13 + var_208_5 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_13 + var_208_5
					end

					if var_208_8.prefab_name ~= "" and arg_205_1.actors_[var_208_8.prefab_name] ~= nil then
						local var_208_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_8.prefab_name].transform, "story_v_out_115131", "115131051", "story_v_out_115131.awb")

						arg_205_1:RecordAudio("115131051", var_208_14)
						arg_205_1:RecordAudio("115131051", var_208_14)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_115131", "115131051", "story_v_out_115131.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_115131", "115131051", "story_v_out_115131.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_15 = math.max(var_208_6, arg_205_1.talkMaxDuration)

			if var_208_5 <= arg_205_1.time_ and arg_205_1.time_ < var_208_5 + var_208_15 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_5) / var_208_15

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_5 + var_208_15 and arg_205_1.time_ < var_208_5 + var_208_15 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play115131052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 115131052
		arg_209_1.duration_ = 12.5

		local var_209_0 = {
			ja = 12.5,
			ko = 9,
			zh = 6.333,
			en = 7.833
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
				arg_209_0:Play115131053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_212_1 = 0
			local var_212_2 = 0.75

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_3 = arg_209_1:FormatText(StoryNameCfg[264].name)

				arg_209_1.leftNameTxt_.text = var_212_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_4 = arg_209_1:GetWordFromCfg(115131052)
				local var_212_5 = arg_209_1:FormatText(var_212_4.content)

				arg_209_1.text_.text = var_212_5

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_6 = 30
				local var_212_7 = utf8.len(var_212_5)
				local var_212_8 = var_212_6 <= 0 and var_212_2 or var_212_2 * (var_212_7 / var_212_6)

				if var_212_8 > 0 and var_212_2 < var_212_8 then
					arg_209_1.talkMaxDuration = var_212_8

					if var_212_8 + var_212_1 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_1
					end
				end

				arg_209_1.text_.text = var_212_5
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131052", "story_v_out_115131.awb") ~= 0 then
					local var_212_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131052", "story_v_out_115131.awb") / 1000

					if var_212_9 + var_212_1 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_9 + var_212_1
					end

					if var_212_4.prefab_name ~= "" and arg_209_1.actors_[var_212_4.prefab_name] ~= nil then
						local var_212_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_4.prefab_name].transform, "story_v_out_115131", "115131052", "story_v_out_115131.awb")

						arg_209_1:RecordAudio("115131052", var_212_10)
						arg_209_1:RecordAudio("115131052", var_212_10)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_115131", "115131052", "story_v_out_115131.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_115131", "115131052", "story_v_out_115131.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_11 = math.max(var_212_2, arg_209_1.talkMaxDuration)

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_11 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_1) / var_212_11

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_1 + var_212_11 and arg_209_1.time_ < var_212_1 + var_212_11 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play115131053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 115131053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play115131054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["105201ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos105201ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos105201ui_story, var_216_4, var_216_3)

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

			local var_216_9 = arg_213_1.actors_["10014ui_story"].transform
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 then
				arg_213_1.var_.moveOldPos10014ui_story = var_216_9.localPosition
			end

			local var_216_11 = 0.001

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11
				local var_216_13 = Vector3.New(0, 100, 0)

				var_216_9.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10014ui_story, var_216_13, var_216_12)

				local var_216_14 = manager.ui.mainCamera.transform.position - var_216_9.position

				var_216_9.forward = Vector3.New(var_216_14.x, var_216_14.y, var_216_14.z)

				local var_216_15 = var_216_9.localEulerAngles

				var_216_15.z = 0
				var_216_15.x = 0
				var_216_9.localEulerAngles = var_216_15
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 then
				var_216_9.localPosition = Vector3.New(0, 100, 0)

				local var_216_16 = manager.ui.mainCamera.transform.position - var_216_9.position

				var_216_9.forward = Vector3.New(var_216_16.x, var_216_16.y, var_216_16.z)

				local var_216_17 = var_216_9.localEulerAngles

				var_216_17.z = 0
				var_216_17.x = 0
				var_216_9.localEulerAngles = var_216_17
			end

			local var_216_18 = 0
			local var_216_19 = 0.85

			if var_216_18 < arg_213_1.time_ and arg_213_1.time_ <= var_216_18 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_20 = arg_213_1:GetWordFromCfg(115131053)
				local var_216_21 = arg_213_1:FormatText(var_216_20.content)

				arg_213_1.text_.text = var_216_21

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_22 = 34
				local var_216_23 = utf8.len(var_216_21)
				local var_216_24 = var_216_22 <= 0 and var_216_19 or var_216_19 * (var_216_23 / var_216_22)

				if var_216_24 > 0 and var_216_19 < var_216_24 then
					arg_213_1.talkMaxDuration = var_216_24

					if var_216_24 + var_216_18 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_24 + var_216_18
					end
				end

				arg_213_1.text_.text = var_216_21
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_25 = math.max(var_216_19, arg_213_1.talkMaxDuration)

			if var_216_18 <= arg_213_1.time_ and arg_213_1.time_ < var_216_18 + var_216_25 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_18) / var_216_25

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_18 + var_216_25 and arg_213_1.time_ < var_216_18 + var_216_25 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play115131054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 115131054
		arg_217_1.duration_ = 8.6

		local var_217_0 = {
			ja = 5,
			ko = 8.466,
			zh = 8.066,
			en = 8.6
		}
		local var_217_1 = manager.audio:GetLocalizationFlag()

		if var_217_0[var_217_1] ~= nil then
			arg_217_1.duration_ = var_217_0[var_217_1]
		end

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play115131055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.65

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[263].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_105201")

				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(115131054)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 26
				local var_220_6 = utf8.len(var_220_4)
				local var_220_7 = var_220_5 <= 0 and var_220_1 or var_220_1 * (var_220_6 / var_220_5)

				if var_220_7 > 0 and var_220_1 < var_220_7 then
					arg_217_1.talkMaxDuration = var_220_7

					if var_220_7 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_7 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_4
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131054", "story_v_out_115131.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_115131", "115131054", "story_v_out_115131.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_115131", "115131054", "story_v_out_115131.awb")

						arg_217_1:RecordAudio("115131054", var_220_9)
						arg_217_1:RecordAudio("115131054", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_115131", "115131054", "story_v_out_115131.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_115131", "115131054", "story_v_out_115131.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_10 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_10 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_10

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_10 and arg_217_1.time_ < var_220_0 + var_220_10 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play115131055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 115131055
		arg_221_1.duration_ = 3.466

		local var_221_0 = {
			ja = 2.266,
			ko = 2.766,
			zh = 3.366,
			en = 3.466
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
				arg_221_0:Play115131056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10014ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos10014ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0, -1.06, -6.2)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10014ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = 0

			if var_224_9 < arg_221_1.time_ and arg_221_1.time_ <= var_224_9 + arg_224_0 then
				arg_221_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 then
				arg_221_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_224_11 = arg_221_1.actors_["10014ui_story"]
			local var_224_12 = 0

			if var_224_12 < arg_221_1.time_ and arg_221_1.time_ <= var_224_12 + arg_224_0 and arg_221_1.var_.characterEffect10014ui_story == nil then
				arg_221_1.var_.characterEffect10014ui_story = var_224_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_13 = 0.208333333333333

			if var_224_12 <= arg_221_1.time_ and arg_221_1.time_ < var_224_12 + var_224_13 then
				local var_224_14 = (arg_221_1.time_ - var_224_12) / var_224_13

				if arg_221_1.var_.characterEffect10014ui_story then
					arg_221_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_12 + var_224_13 and arg_221_1.time_ < var_224_12 + var_224_13 + arg_224_0 and arg_221_1.var_.characterEffect10014ui_story then
				arg_221_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_224_15 = 0
			local var_224_16 = 0.325

			if var_224_15 < arg_221_1.time_ and arg_221_1.time_ <= var_224_15 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_17 = arg_221_1:FormatText(StoryNameCfg[264].name)

				arg_221_1.leftNameTxt_.text = var_224_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_18 = arg_221_1:GetWordFromCfg(115131055)
				local var_224_19 = arg_221_1:FormatText(var_224_18.content)

				arg_221_1.text_.text = var_224_19

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_20 = 13
				local var_224_21 = utf8.len(var_224_19)
				local var_224_22 = var_224_20 <= 0 and var_224_16 or var_224_16 * (var_224_21 / var_224_20)

				if var_224_22 > 0 and var_224_16 < var_224_22 then
					arg_221_1.talkMaxDuration = var_224_22

					if var_224_22 + var_224_15 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_22 + var_224_15
					end
				end

				arg_221_1.text_.text = var_224_19
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131055", "story_v_out_115131.awb") ~= 0 then
					local var_224_23 = manager.audio:GetVoiceLength("story_v_out_115131", "115131055", "story_v_out_115131.awb") / 1000

					if var_224_23 + var_224_15 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_23 + var_224_15
					end

					if var_224_18.prefab_name ~= "" and arg_221_1.actors_[var_224_18.prefab_name] ~= nil then
						local var_224_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_18.prefab_name].transform, "story_v_out_115131", "115131055", "story_v_out_115131.awb")

						arg_221_1:RecordAudio("115131055", var_224_24)
						arg_221_1:RecordAudio("115131055", var_224_24)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_115131", "115131055", "story_v_out_115131.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_115131", "115131055", "story_v_out_115131.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_25 = math.max(var_224_16, arg_221_1.talkMaxDuration)

			if var_224_15 <= arg_221_1.time_ and arg_221_1.time_ < var_224_15 + var_224_25 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_15) / var_224_25

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_15 + var_224_25 and arg_221_1.time_ < var_224_15 + var_224_25 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play115131056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 115131056
		arg_225_1.duration_ = 10.7

		local var_225_0 = {
			ja = 10,
			ko = 10.7,
			zh = 10.6,
			en = 8.766
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
				arg_225_0:Play115131057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_228_2 = 0
			local var_228_3 = 1

			if var_228_2 < arg_225_1.time_ and arg_225_1.time_ <= var_228_2 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_4 = arg_225_1:FormatText(StoryNameCfg[264].name)

				arg_225_1.leftNameTxt_.text = var_228_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_5 = arg_225_1:GetWordFromCfg(115131056)
				local var_228_6 = arg_225_1:FormatText(var_228_5.content)

				arg_225_1.text_.text = var_228_6

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_7 = 40
				local var_228_8 = utf8.len(var_228_6)
				local var_228_9 = var_228_7 <= 0 and var_228_3 or var_228_3 * (var_228_8 / var_228_7)

				if var_228_9 > 0 and var_228_3 < var_228_9 then
					arg_225_1.talkMaxDuration = var_228_9

					if var_228_9 + var_228_2 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_9 + var_228_2
					end
				end

				arg_225_1.text_.text = var_228_6
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131056", "story_v_out_115131.awb") ~= 0 then
					local var_228_10 = manager.audio:GetVoiceLength("story_v_out_115131", "115131056", "story_v_out_115131.awb") / 1000

					if var_228_10 + var_228_2 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_10 + var_228_2
					end

					if var_228_5.prefab_name ~= "" and arg_225_1.actors_[var_228_5.prefab_name] ~= nil then
						local var_228_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_5.prefab_name].transform, "story_v_out_115131", "115131056", "story_v_out_115131.awb")

						arg_225_1:RecordAudio("115131056", var_228_11)
						arg_225_1:RecordAudio("115131056", var_228_11)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_115131", "115131056", "story_v_out_115131.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_115131", "115131056", "story_v_out_115131.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_12 = math.max(var_228_3, arg_225_1.talkMaxDuration)

			if var_228_2 <= arg_225_1.time_ and arg_225_1.time_ < var_228_2 + var_228_12 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_2) / var_228_12

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_2 + var_228_12 and arg_225_1.time_ < var_228_2 + var_228_12 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play115131057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 115131057
		arg_229_1.duration_ = 23.1

		local var_229_0 = {
			ja = 21.1,
			ko = 17.366,
			zh = 23.1,
			en = 21.333
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
				arg_229_0:Play115131058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.mask_.enabled = true
				arg_229_1.mask_.raycastTarget = true

				arg_229_1:SetGaussion(false)
			end

			local var_232_1 = 2

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_1 then
				local var_232_2 = (arg_229_1.time_ - var_232_0) / var_232_1
				local var_232_3 = Color.New(0, 0, 0)

				var_232_3.a = Mathf.Lerp(0, 1, var_232_2)
				arg_229_1.mask_.color = var_232_3
			end

			if arg_229_1.time_ >= var_232_0 + var_232_1 and arg_229_1.time_ < var_232_0 + var_232_1 + arg_232_0 then
				local var_232_4 = Color.New(0, 0, 0)

				var_232_4.a = 1
				arg_229_1.mask_.color = var_232_4
			end

			local var_232_5 = 2

			if var_232_5 < arg_229_1.time_ and arg_229_1.time_ <= var_232_5 + arg_232_0 then
				arg_229_1.mask_.enabled = true
				arg_229_1.mask_.raycastTarget = true

				arg_229_1:SetGaussion(false)
			end

			local var_232_6 = 2

			if var_232_5 <= arg_229_1.time_ and arg_229_1.time_ < var_232_5 + var_232_6 then
				local var_232_7 = (arg_229_1.time_ - var_232_5) / var_232_6
				local var_232_8 = Color.New(0, 0, 0)

				var_232_8.a = Mathf.Lerp(1, 0, var_232_7)
				arg_229_1.mask_.color = var_232_8
			end

			if arg_229_1.time_ >= var_232_5 + var_232_6 and arg_229_1.time_ < var_232_5 + var_232_6 + arg_232_0 then
				local var_232_9 = Color.New(0, 0, 0)
				local var_232_10 = 0

				arg_229_1.mask_.enabled = false
				var_232_9.a = var_232_10
				arg_229_1.mask_.color = var_232_9
			end

			local var_232_11 = 2

			if var_232_11 < arg_229_1.time_ and arg_229_1.time_ <= var_232_11 + arg_232_0 then
				local var_232_12 = manager.ui.mainCamera.transform.localPosition
				local var_232_13 = Vector3.New(0, 0, 10) + Vector3.New(var_232_12.x, var_232_12.y, 0)
				local var_232_14 = arg_229_1.bgs_.G03a

				var_232_14.transform.localPosition = var_232_13
				var_232_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_232_15 = var_232_14:GetComponent("SpriteRenderer")

				if var_232_15 and var_232_15.sprite then
					local var_232_16 = (var_232_14.transform.localPosition - var_232_12).z
					local var_232_17 = manager.ui.mainCameraCom_
					local var_232_18 = 2 * var_232_16 * Mathf.Tan(var_232_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_232_19 = var_232_18 * var_232_17.aspect
					local var_232_20 = var_232_15.sprite.bounds.size.x
					local var_232_21 = var_232_15.sprite.bounds.size.y
					local var_232_22 = var_232_19 / var_232_20
					local var_232_23 = var_232_18 / var_232_21
					local var_232_24 = var_232_23 < var_232_22 and var_232_22 or var_232_23

					var_232_14.transform.localScale = Vector3.New(var_232_24, var_232_24, 0)
				end

				for iter_232_0, iter_232_1 in pairs(arg_229_1.bgs_) do
					if iter_232_0 ~= "G03a" then
						iter_232_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_232_25 = arg_229_1.actors_["1052ui_story"].transform
			local var_232_26 = 3.8

			if var_232_26 < arg_229_1.time_ and arg_229_1.time_ <= var_232_26 + arg_232_0 then
				arg_229_1.var_.moveOldPos1052ui_story = var_232_25.localPosition
			end

			local var_232_27 = 0.001

			if var_232_26 <= arg_229_1.time_ and arg_229_1.time_ < var_232_26 + var_232_27 then
				local var_232_28 = (arg_229_1.time_ - var_232_26) / var_232_27
				local var_232_29 = Vector3.New(-0.7, -1.05, -6.2)

				var_232_25.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1052ui_story, var_232_29, var_232_28)

				local var_232_30 = manager.ui.mainCamera.transform.position - var_232_25.position

				var_232_25.forward = Vector3.New(var_232_30.x, var_232_30.y, var_232_30.z)

				local var_232_31 = var_232_25.localEulerAngles

				var_232_31.z = 0
				var_232_31.x = 0
				var_232_25.localEulerAngles = var_232_31
			end

			if arg_229_1.time_ >= var_232_26 + var_232_27 and arg_229_1.time_ < var_232_26 + var_232_27 + arg_232_0 then
				var_232_25.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_232_32 = manager.ui.mainCamera.transform.position - var_232_25.position

				var_232_25.forward = Vector3.New(var_232_32.x, var_232_32.y, var_232_32.z)

				local var_232_33 = var_232_25.localEulerAngles

				var_232_33.z = 0
				var_232_33.x = 0
				var_232_25.localEulerAngles = var_232_33
			end

			local var_232_34 = 3.8

			if var_232_34 < arg_229_1.time_ and arg_229_1.time_ <= var_232_34 + arg_232_0 then
				arg_229_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_232_35 = 3.8

			if var_232_35 < arg_229_1.time_ and arg_229_1.time_ <= var_232_35 + arg_232_0 then
				arg_229_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_232_36 = arg_229_1.actors_["1052ui_story"]
			local var_232_37 = 3.8

			if var_232_37 < arg_229_1.time_ and arg_229_1.time_ <= var_232_37 + arg_232_0 and arg_229_1.var_.characterEffect1052ui_story == nil then
				arg_229_1.var_.characterEffect1052ui_story = var_232_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_38 = 0.2

			if var_232_37 <= arg_229_1.time_ and arg_229_1.time_ < var_232_37 + var_232_38 then
				local var_232_39 = (arg_229_1.time_ - var_232_37) / var_232_38

				if arg_229_1.var_.characterEffect1052ui_story then
					arg_229_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_37 + var_232_38 and arg_229_1.time_ < var_232_37 + var_232_38 + arg_232_0 and arg_229_1.var_.characterEffect1052ui_story then
				arg_229_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_232_40 = arg_229_1.bgs_.G03a
			local var_232_41 = 2

			if var_232_41 < arg_229_1.time_ and arg_229_1.time_ <= var_232_41 + arg_232_0 then
				local var_232_42 = var_232_40:GetComponent("SpriteRenderer")

				if var_232_42 then
					var_232_42.material = arg_229_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_232_43 = var_232_42.material
					local var_232_44 = var_232_43:GetColor("_Color")

					arg_229_1.var_.alphaOldValueG03a = var_232_44.a
					arg_229_1.var_.alphaMatValueG03a = var_232_43
				end

				arg_229_1.var_.alphaOldValueG03a = 0
			end

			local var_232_45 = 0.0166666666666667

			if var_232_41 <= arg_229_1.time_ and arg_229_1.time_ < var_232_41 + var_232_45 then
				local var_232_46 = (arg_229_1.time_ - var_232_41) / var_232_45
				local var_232_47 = Mathf.Lerp(arg_229_1.var_.alphaOldValueG03a, 1, var_232_46)

				if arg_229_1.var_.alphaMatValueG03a then
					local var_232_48 = arg_229_1.var_.alphaMatValueG03a
					local var_232_49 = var_232_48:GetColor("_Color")

					var_232_49.a = var_232_47

					var_232_48:SetColor("_Color", var_232_49)
				end
			end

			if arg_229_1.time_ >= var_232_41 + var_232_45 and arg_229_1.time_ < var_232_41 + var_232_45 + arg_232_0 and arg_229_1.var_.alphaMatValueG03a then
				local var_232_50 = arg_229_1.var_.alphaMatValueG03a
				local var_232_51 = var_232_50:GetColor("_Color")

				var_232_51.a = 1

				var_232_50:SetColor("_Color", var_232_51)
			end

			local var_232_52 = arg_229_1.actors_["1024ui_story"].transform
			local var_232_53 = 3.8

			if var_232_53 < arg_229_1.time_ and arg_229_1.time_ <= var_232_53 + arg_232_0 then
				arg_229_1.var_.moveOldPos1024ui_story = var_232_52.localPosition
			end

			local var_232_54 = 0.001

			if var_232_53 <= arg_229_1.time_ and arg_229_1.time_ < var_232_53 + var_232_54 then
				local var_232_55 = (arg_229_1.time_ - var_232_53) / var_232_54
				local var_232_56 = Vector3.New(0.7, -1, -6.05)

				var_232_52.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1024ui_story, var_232_56, var_232_55)

				local var_232_57 = manager.ui.mainCamera.transform.position - var_232_52.position

				var_232_52.forward = Vector3.New(var_232_57.x, var_232_57.y, var_232_57.z)

				local var_232_58 = var_232_52.localEulerAngles

				var_232_58.z = 0
				var_232_58.x = 0
				var_232_52.localEulerAngles = var_232_58
			end

			if arg_229_1.time_ >= var_232_53 + var_232_54 and arg_229_1.time_ < var_232_53 + var_232_54 + arg_232_0 then
				var_232_52.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_232_59 = manager.ui.mainCamera.transform.position - var_232_52.position

				var_232_52.forward = Vector3.New(var_232_59.x, var_232_59.y, var_232_59.z)

				local var_232_60 = var_232_52.localEulerAngles

				var_232_60.z = 0
				var_232_60.x = 0
				var_232_52.localEulerAngles = var_232_60
			end

			local var_232_61 = 3.8

			if var_232_61 < arg_229_1.time_ and arg_229_1.time_ <= var_232_61 + arg_232_0 then
				arg_229_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_232_62 = 3.8

			if var_232_62 < arg_229_1.time_ and arg_229_1.time_ <= var_232_62 + arg_232_0 then
				arg_229_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_232_63 = arg_229_1.actors_["10014ui_story"].transform
			local var_232_64 = 1.966

			if var_232_64 < arg_229_1.time_ and arg_229_1.time_ <= var_232_64 + arg_232_0 then
				arg_229_1.var_.moveOldPos10014ui_story = var_232_63.localPosition
			end

			local var_232_65 = 0.001

			if var_232_64 <= arg_229_1.time_ and arg_229_1.time_ < var_232_64 + var_232_65 then
				local var_232_66 = (arg_229_1.time_ - var_232_64) / var_232_65
				local var_232_67 = Vector3.New(0, 100, 0)

				var_232_63.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10014ui_story, var_232_67, var_232_66)

				local var_232_68 = manager.ui.mainCamera.transform.position - var_232_63.position

				var_232_63.forward = Vector3.New(var_232_68.x, var_232_68.y, var_232_68.z)

				local var_232_69 = var_232_63.localEulerAngles

				var_232_69.z = 0
				var_232_69.x = 0
				var_232_63.localEulerAngles = var_232_69
			end

			if arg_229_1.time_ >= var_232_64 + var_232_65 and arg_229_1.time_ < var_232_64 + var_232_65 + arg_232_0 then
				var_232_63.localPosition = Vector3.New(0, 100, 0)

				local var_232_70 = manager.ui.mainCamera.transform.position - var_232_63.position

				var_232_63.forward = Vector3.New(var_232_70.x, var_232_70.y, var_232_70.z)

				local var_232_71 = var_232_63.localEulerAngles

				var_232_71.z = 0
				var_232_71.x = 0
				var_232_63.localEulerAngles = var_232_71
			end

			if arg_229_1.frameCnt_ <= 1 then
				arg_229_1.dialog_:SetActive(false)
			end

			local var_232_72 = 4
			local var_232_73 = 1.4

			if var_232_72 < arg_229_1.time_ and arg_229_1.time_ <= var_232_72 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0

				arg_229_1.dialog_:SetActive(true)

				local var_232_74 = LeanTween.value(arg_229_1.dialog_, 0, 1, 0.3)

				var_232_74:setOnUpdate(LuaHelper.FloatAction(function(arg_233_0)
					arg_229_1.dialogCg_.alpha = arg_233_0
				end))
				var_232_74:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_229_1.dialog_)
					var_232_74:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_229_1.duration_ = arg_229_1.duration_ + 0.3

				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_75 = arg_229_1:FormatText(StoryNameCfg[263].name)

				arg_229_1.leftNameTxt_.text = var_232_75

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_76 = arg_229_1:GetWordFromCfg(115131057)
				local var_232_77 = arg_229_1:FormatText(var_232_76.content)

				arg_229_1.text_.text = var_232_77

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_78 = 56
				local var_232_79 = utf8.len(var_232_77)
				local var_232_80 = var_232_78 <= 0 and var_232_73 or var_232_73 * (var_232_79 / var_232_78)

				if var_232_80 > 0 and var_232_73 < var_232_80 then
					arg_229_1.talkMaxDuration = var_232_80
					var_232_72 = var_232_72 + 0.3

					if var_232_80 + var_232_72 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_80 + var_232_72
					end
				end

				arg_229_1.text_.text = var_232_77
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131057", "story_v_out_115131.awb") ~= 0 then
					local var_232_81 = manager.audio:GetVoiceLength("story_v_out_115131", "115131057", "story_v_out_115131.awb") / 1000

					if var_232_81 + var_232_72 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_81 + var_232_72
					end

					if var_232_76.prefab_name ~= "" and arg_229_1.actors_[var_232_76.prefab_name] ~= nil then
						local var_232_82 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_76.prefab_name].transform, "story_v_out_115131", "115131057", "story_v_out_115131.awb")

						arg_229_1:RecordAudio("115131057", var_232_82)
						arg_229_1:RecordAudio("115131057", var_232_82)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_115131", "115131057", "story_v_out_115131.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_115131", "115131057", "story_v_out_115131.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_83 = var_232_72 + 0.3
			local var_232_84 = math.max(var_232_73, arg_229_1.talkMaxDuration)

			if var_232_83 <= arg_229_1.time_ and arg_229_1.time_ < var_232_83 + var_232_84 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_83) / var_232_84

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_83 + var_232_84 and arg_229_1.time_ < var_232_83 + var_232_84 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play115131058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 115131058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play115131059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1052ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1052ui_story == nil then
				arg_235_1.var_.characterEffect1052ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.2

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1052ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1052ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1052ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1052ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0
			local var_238_7 = 0.4

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_8 = arg_235_1:GetWordFromCfg(115131058)
				local var_238_9 = arg_235_1:FormatText(var_238_8.content)

				arg_235_1.text_.text = var_238_9

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_10 = 16
				local var_238_11 = utf8.len(var_238_9)
				local var_238_12 = var_238_10 <= 0 and var_238_7 or var_238_7 * (var_238_11 / var_238_10)

				if var_238_12 > 0 and var_238_7 < var_238_12 then
					arg_235_1.talkMaxDuration = var_238_12

					if var_238_12 + var_238_6 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_12 + var_238_6
					end
				end

				arg_235_1.text_.text = var_238_9
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_13 = math.max(var_238_7, arg_235_1.talkMaxDuration)

			if var_238_6 <= arg_235_1.time_ and arg_235_1.time_ < var_238_6 + var_238_13 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_6) / var_238_13

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_6 + var_238_13 and arg_235_1.time_ < var_238_6 + var_238_13 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play115131059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 115131059
		arg_239_1.duration_ = 2.3

		local var_239_0 = {
			ja = 2.1,
			ko = 2.066,
			zh = 1.8,
			en = 2.3
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
				arg_239_0:Play115131060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.175

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[273].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, true)
				arg_239_1.iconController_:SetSelectedState("hero")

				arg_239_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(115131059)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131059", "story_v_out_115131.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_115131", "115131059", "story_v_out_115131.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_115131", "115131059", "story_v_out_115131.awb")

						arg_239_1:RecordAudio("115131059", var_242_9)
						arg_239_1:RecordAudio("115131059", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_115131", "115131059", "story_v_out_115131.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_115131", "115131059", "story_v_out_115131.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_10 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_10

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_10 and arg_239_1.time_ < var_242_0 + var_242_10 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play115131060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 115131060
		arg_243_1.duration_ = 1.366

		local var_243_0 = {
			ja = 1.366,
			ko = 1.366,
			zh = 1.366,
			en = 1.233
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
				arg_243_0:Play115131061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.075

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[266].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, true)
				arg_243_1.iconController_:SetSelectedState("hero")

				arg_243_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1024_1")

				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(115131060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131060", "story_v_out_115131.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_115131", "115131060", "story_v_out_115131.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_115131", "115131060", "story_v_out_115131.awb")

						arg_243_1:RecordAudio("115131060", var_246_9)
						arg_243_1:RecordAudio("115131060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_115131", "115131060", "story_v_out_115131.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_115131", "115131060", "story_v_out_115131.awb")
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
	Play115131061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 115131061
		arg_247_1.duration_ = 16.166

		local var_247_0 = {
			ja = 16.166,
			ko = 8.9,
			zh = 11.466,
			en = 8.9
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
				arg_247_0:Play115131062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_250_1 = arg_247_1.actors_["1052ui_story"]
			local var_250_2 = 0

			if var_250_2 < arg_247_1.time_ and arg_247_1.time_ <= var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1052ui_story == nil then
				arg_247_1.var_.characterEffect1052ui_story = var_250_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_3 = 0.2

			if var_250_2 <= arg_247_1.time_ and arg_247_1.time_ < var_250_2 + var_250_3 then
				local var_250_4 = (arg_247_1.time_ - var_250_2) / var_250_3

				if arg_247_1.var_.characterEffect1052ui_story then
					arg_247_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_2 + var_250_3 and arg_247_1.time_ < var_250_2 + var_250_3 + arg_250_0 and arg_247_1.var_.characterEffect1052ui_story then
				arg_247_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_250_5 = 0
			local var_250_6 = 0.85

			if var_250_5 < arg_247_1.time_ and arg_247_1.time_ <= var_250_5 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_7 = arg_247_1:FormatText(StoryNameCfg[263].name)

				arg_247_1.leftNameTxt_.text = var_250_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_8 = arg_247_1:GetWordFromCfg(115131061)
				local var_250_9 = arg_247_1:FormatText(var_250_8.content)

				arg_247_1.text_.text = var_250_9

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_10 = 34
				local var_250_11 = utf8.len(var_250_9)
				local var_250_12 = var_250_10 <= 0 and var_250_6 or var_250_6 * (var_250_11 / var_250_10)

				if var_250_12 > 0 and var_250_6 < var_250_12 then
					arg_247_1.talkMaxDuration = var_250_12

					if var_250_12 + var_250_5 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_12 + var_250_5
					end
				end

				arg_247_1.text_.text = var_250_9
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131061", "story_v_out_115131.awb") ~= 0 then
					local var_250_13 = manager.audio:GetVoiceLength("story_v_out_115131", "115131061", "story_v_out_115131.awb") / 1000

					if var_250_13 + var_250_5 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_13 + var_250_5
					end

					if var_250_8.prefab_name ~= "" and arg_247_1.actors_[var_250_8.prefab_name] ~= nil then
						local var_250_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_8.prefab_name].transform, "story_v_out_115131", "115131061", "story_v_out_115131.awb")

						arg_247_1:RecordAudio("115131061", var_250_14)
						arg_247_1:RecordAudio("115131061", var_250_14)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_115131", "115131061", "story_v_out_115131.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_115131", "115131061", "story_v_out_115131.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_15 = math.max(var_250_6, arg_247_1.talkMaxDuration)

			if var_250_5 <= arg_247_1.time_ and arg_247_1.time_ < var_250_5 + var_250_15 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_5) / var_250_15

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_5 + var_250_15 and arg_247_1.time_ < var_250_5 + var_250_15 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play115131062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 115131062
		arg_251_1.duration_ = 15.8

		local var_251_0 = {
			ja = 6.4,
			ko = 11.866,
			zh = 14.1,
			en = 15.8
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
				arg_251_0:Play115131063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_254_1 = 0
			local var_254_2 = 1.1

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_3 = arg_251_1:FormatText(StoryNameCfg[263].name)

				arg_251_1.leftNameTxt_.text = var_254_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_4 = arg_251_1:GetWordFromCfg(115131062)
				local var_254_5 = arg_251_1:FormatText(var_254_4.content)

				arg_251_1.text_.text = var_254_5

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_6 = 44
				local var_254_7 = utf8.len(var_254_5)
				local var_254_8 = var_254_6 <= 0 and var_254_2 or var_254_2 * (var_254_7 / var_254_6)

				if var_254_8 > 0 and var_254_2 < var_254_8 then
					arg_251_1.talkMaxDuration = var_254_8

					if var_254_8 + var_254_1 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_1
					end
				end

				arg_251_1.text_.text = var_254_5
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131062", "story_v_out_115131.awb") ~= 0 then
					local var_254_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131062", "story_v_out_115131.awb") / 1000

					if var_254_9 + var_254_1 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_9 + var_254_1
					end

					if var_254_4.prefab_name ~= "" and arg_251_1.actors_[var_254_4.prefab_name] ~= nil then
						local var_254_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_4.prefab_name].transform, "story_v_out_115131", "115131062", "story_v_out_115131.awb")

						arg_251_1:RecordAudio("115131062", var_254_10)
						arg_251_1:RecordAudio("115131062", var_254_10)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_115131", "115131062", "story_v_out_115131.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_115131", "115131062", "story_v_out_115131.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_11 = math.max(var_254_2, arg_251_1.talkMaxDuration)

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_11 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_1) / var_254_11

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_1 + var_254_11 and arg_251_1.time_ < var_254_1 + var_254_11 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play115131063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 115131063
		arg_255_1.duration_ = 1.733

		local var_255_0 = {
			ja = 1.466,
			ko = 1.233,
			zh = 1.4,
			en = 1.733
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
				arg_255_0:Play115131064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1052ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1052ui_story == nil then
				arg_255_1.var_.characterEffect1052ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1052ui_story then
					local var_258_4 = Mathf.Lerp(0, 0.5, var_258_3)

					arg_255_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1052ui_story.fillRatio = var_258_4
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1052ui_story then
				local var_258_5 = 0.5

				arg_255_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1052ui_story.fillRatio = var_258_5
			end

			local var_258_6 = arg_255_1.actors_["1024ui_story"]
			local var_258_7 = 0

			if var_258_7 < arg_255_1.time_ and arg_255_1.time_ <= var_258_7 + arg_258_0 and arg_255_1.var_.characterEffect1024ui_story == nil then
				arg_255_1.var_.characterEffect1024ui_story = var_258_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_8 = 0.2

			if var_258_7 <= arg_255_1.time_ and arg_255_1.time_ < var_258_7 + var_258_8 then
				local var_258_9 = (arg_255_1.time_ - var_258_7) / var_258_8

				if arg_255_1.var_.characterEffect1024ui_story then
					arg_255_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_7 + var_258_8 and arg_255_1.time_ < var_258_7 + var_258_8 + arg_258_0 and arg_255_1.var_.characterEffect1024ui_story then
				arg_255_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_258_10 = 0
			local var_258_11 = 0.05

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_12 = arg_255_1:FormatText(StoryNameCfg[265].name)

				arg_255_1.leftNameTxt_.text = var_258_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_13 = arg_255_1:GetWordFromCfg(115131063)
				local var_258_14 = arg_255_1:FormatText(var_258_13.content)

				arg_255_1.text_.text = var_258_14

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_15 = 2
				local var_258_16 = utf8.len(var_258_14)
				local var_258_17 = var_258_15 <= 0 and var_258_11 or var_258_11 * (var_258_16 / var_258_15)

				if var_258_17 > 0 and var_258_11 < var_258_17 then
					arg_255_1.talkMaxDuration = var_258_17

					if var_258_17 + var_258_10 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_17 + var_258_10
					end
				end

				arg_255_1.text_.text = var_258_14
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131063", "story_v_out_115131.awb") ~= 0 then
					local var_258_18 = manager.audio:GetVoiceLength("story_v_out_115131", "115131063", "story_v_out_115131.awb") / 1000

					if var_258_18 + var_258_10 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_18 + var_258_10
					end

					if var_258_13.prefab_name ~= "" and arg_255_1.actors_[var_258_13.prefab_name] ~= nil then
						local var_258_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_13.prefab_name].transform, "story_v_out_115131", "115131063", "story_v_out_115131.awb")

						arg_255_1:RecordAudio("115131063", var_258_19)
						arg_255_1:RecordAudio("115131063", var_258_19)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_115131", "115131063", "story_v_out_115131.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_115131", "115131063", "story_v_out_115131.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_20 = math.max(var_258_11, arg_255_1.talkMaxDuration)

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_20 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_10) / var_258_20

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_10 + var_258_20 and arg_255_1.time_ < var_258_10 + var_258_20 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play115131064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 115131064
		arg_259_1.duration_ = 2.966

		local var_259_0 = {
			ja = 1.533,
			ko = 2.766,
			zh = 2.966,
			en = 2.266
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
				arg_259_0:Play115131065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1024ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1024ui_story == nil then
				arg_259_1.var_.characterEffect1024ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.2

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1024ui_story then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1024ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1024ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1024ui_story.fillRatio = var_262_5
			end

			local var_262_6 = 0
			local var_262_7 = 0.2

			if var_262_6 < arg_259_1.time_ and arg_259_1.time_ <= var_262_6 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_8 = arg_259_1:FormatText(StoryNameCfg[273].name)

				arg_259_1.leftNameTxt_.text = var_262_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, true)
				arg_259_1.iconController_:SetSelectedState("hero")

				arg_259_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1017")

				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_9 = arg_259_1:GetWordFromCfg(115131064)
				local var_262_10 = arg_259_1:FormatText(var_262_9.content)

				arg_259_1.text_.text = var_262_10

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_11 = 8
				local var_262_12 = utf8.len(var_262_10)
				local var_262_13 = var_262_11 <= 0 and var_262_7 or var_262_7 * (var_262_12 / var_262_11)

				if var_262_13 > 0 and var_262_7 < var_262_13 then
					arg_259_1.talkMaxDuration = var_262_13

					if var_262_13 + var_262_6 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_13 + var_262_6
					end
				end

				arg_259_1.text_.text = var_262_10
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131064", "story_v_out_115131.awb") ~= 0 then
					local var_262_14 = manager.audio:GetVoiceLength("story_v_out_115131", "115131064", "story_v_out_115131.awb") / 1000

					if var_262_14 + var_262_6 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_14 + var_262_6
					end

					if var_262_9.prefab_name ~= "" and arg_259_1.actors_[var_262_9.prefab_name] ~= nil then
						local var_262_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_9.prefab_name].transform, "story_v_out_115131", "115131064", "story_v_out_115131.awb")

						arg_259_1:RecordAudio("115131064", var_262_15)
						arg_259_1:RecordAudio("115131064", var_262_15)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_115131", "115131064", "story_v_out_115131.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_115131", "115131064", "story_v_out_115131.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_16 = math.max(var_262_7, arg_259_1.talkMaxDuration)

			if var_262_6 <= arg_259_1.time_ and arg_259_1.time_ < var_262_6 + var_262_16 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_6) / var_262_16

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_6 + var_262_16 and arg_259_1.time_ < var_262_6 + var_262_16 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play115131065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 115131065
		arg_263_1.duration_ = 5.433

		local var_263_0 = {
			ja = 5.433,
			ko = 3,
			zh = 1.999999999999,
			en = 2.1
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
				arg_263_0:Play115131066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1024ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect1024ui_story == nil then
				arg_263_1.var_.characterEffect1024ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.2

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect1024ui_story then
					arg_263_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect1024ui_story then
				arg_263_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_266_4 = 0

			if var_266_4 < arg_263_1.time_ and arg_263_1.time_ <= var_266_4 + arg_266_0 then
				arg_263_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_266_5 = 0
			local var_266_6 = 0.225

			if var_266_5 < arg_263_1.time_ and arg_263_1.time_ <= var_266_5 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_7 = arg_263_1:FormatText(StoryNameCfg[265].name)

				arg_263_1.leftNameTxt_.text = var_266_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_8 = arg_263_1:GetWordFromCfg(115131065)
				local var_266_9 = arg_263_1:FormatText(var_266_8.content)

				arg_263_1.text_.text = var_266_9

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_10 = 9
				local var_266_11 = utf8.len(var_266_9)
				local var_266_12 = var_266_10 <= 0 and var_266_6 or var_266_6 * (var_266_11 / var_266_10)

				if var_266_12 > 0 and var_266_6 < var_266_12 then
					arg_263_1.talkMaxDuration = var_266_12

					if var_266_12 + var_266_5 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_12 + var_266_5
					end
				end

				arg_263_1.text_.text = var_266_9
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131065", "story_v_out_115131.awb") ~= 0 then
					local var_266_13 = manager.audio:GetVoiceLength("story_v_out_115131", "115131065", "story_v_out_115131.awb") / 1000

					if var_266_13 + var_266_5 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_13 + var_266_5
					end

					if var_266_8.prefab_name ~= "" and arg_263_1.actors_[var_266_8.prefab_name] ~= nil then
						local var_266_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_8.prefab_name].transform, "story_v_out_115131", "115131065", "story_v_out_115131.awb")

						arg_263_1:RecordAudio("115131065", var_266_14)
						arg_263_1:RecordAudio("115131065", var_266_14)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_115131", "115131065", "story_v_out_115131.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_115131", "115131065", "story_v_out_115131.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_15 = math.max(var_266_6, arg_263_1.talkMaxDuration)

			if var_266_5 <= arg_263_1.time_ and arg_263_1.time_ < var_266_5 + var_266_15 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_5) / var_266_15

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_5 + var_266_15 and arg_263_1.time_ < var_266_5 + var_266_15 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play115131066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 115131066
		arg_267_1.duration_ = 10.833

		local var_267_0 = {
			ja = 10.833,
			ko = 5.5,
			zh = 7.433,
			en = 6.833
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
				arg_267_0:Play115131067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1052ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1052ui_story == nil then
				arg_267_1.var_.characterEffect1052ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.2

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1052ui_story then
					arg_267_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1052ui_story then
				arg_267_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_270_4 = 0

			if var_270_4 < arg_267_1.time_ and arg_267_1.time_ <= var_270_4 + arg_270_0 then
				arg_267_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_270_5 = arg_267_1.actors_["1024ui_story"]
			local var_270_6 = 0

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 and arg_267_1.var_.characterEffect1024ui_story == nil then
				arg_267_1.var_.characterEffect1024ui_story = var_270_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_7 = 0.2

			if var_270_6 <= arg_267_1.time_ and arg_267_1.time_ < var_270_6 + var_270_7 then
				local var_270_8 = (arg_267_1.time_ - var_270_6) / var_270_7

				if arg_267_1.var_.characterEffect1024ui_story then
					local var_270_9 = Mathf.Lerp(0, 0.5, var_270_8)

					arg_267_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1024ui_story.fillRatio = var_270_9
				end
			end

			if arg_267_1.time_ >= var_270_6 + var_270_7 and arg_267_1.time_ < var_270_6 + var_270_7 + arg_270_0 and arg_267_1.var_.characterEffect1024ui_story then
				local var_270_10 = 0.5

				arg_267_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1024ui_story.fillRatio = var_270_10
			end

			local var_270_11 = 0
			local var_270_12 = 0.675

			if var_270_11 < arg_267_1.time_ and arg_267_1.time_ <= var_270_11 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_13 = arg_267_1:FormatText(StoryNameCfg[263].name)

				arg_267_1.leftNameTxt_.text = var_270_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_14 = arg_267_1:GetWordFromCfg(115131066)
				local var_270_15 = arg_267_1:FormatText(var_270_14.content)

				arg_267_1.text_.text = var_270_15

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_16 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131066", "story_v_out_115131.awb") ~= 0 then
					local var_270_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131066", "story_v_out_115131.awb") / 1000

					if var_270_19 + var_270_11 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_11
					end

					if var_270_14.prefab_name ~= "" and arg_267_1.actors_[var_270_14.prefab_name] ~= nil then
						local var_270_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_14.prefab_name].transform, "story_v_out_115131", "115131066", "story_v_out_115131.awb")

						arg_267_1:RecordAudio("115131066", var_270_20)
						arg_267_1:RecordAudio("115131066", var_270_20)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_115131", "115131066", "story_v_out_115131.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_115131", "115131066", "story_v_out_115131.awb")
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
	Play115131067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 115131067
		arg_271_1.duration_ = 12.3

		local var_271_0 = {
			ja = 11.1,
			ko = 12.3,
			zh = 9.333,
			en = 9.533
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
				arg_271_0:Play115131068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_274_1 = arg_271_1.actors_["1024ui_story"]
			local var_274_2 = 0

			if var_274_2 < arg_271_1.time_ and arg_271_1.time_ <= var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1024ui_story == nil then
				arg_271_1.var_.characterEffect1024ui_story = var_274_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_3 = 0.2

			if var_274_2 <= arg_271_1.time_ and arg_271_1.time_ < var_274_2 + var_274_3 then
				local var_274_4 = (arg_271_1.time_ - var_274_2) / var_274_3

				if arg_271_1.var_.characterEffect1024ui_story then
					arg_271_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_2 + var_274_3 and arg_271_1.time_ < var_274_2 + var_274_3 + arg_274_0 and arg_271_1.var_.characterEffect1024ui_story then
				arg_271_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_274_5 = arg_271_1.actors_["1052ui_story"]
			local var_274_6 = 0

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 and arg_271_1.var_.characterEffect1052ui_story == nil then
				arg_271_1.var_.characterEffect1052ui_story = var_274_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_7 = 0.2

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_7 then
				local var_274_8 = (arg_271_1.time_ - var_274_6) / var_274_7

				if arg_271_1.var_.characterEffect1052ui_story then
					local var_274_9 = Mathf.Lerp(0, 0.5, var_274_8)

					arg_271_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1052ui_story.fillRatio = var_274_9
				end
			end

			if arg_271_1.time_ >= var_274_6 + var_274_7 and arg_271_1.time_ < var_274_6 + var_274_7 + arg_274_0 and arg_271_1.var_.characterEffect1052ui_story then
				local var_274_10 = 0.5

				arg_271_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1052ui_story.fillRatio = var_274_10
			end

			local var_274_11 = 0
			local var_274_12 = 1.1

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_13 = arg_271_1:FormatText(StoryNameCfg[265].name)

				arg_271_1.leftNameTxt_.text = var_274_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_14 = arg_271_1:GetWordFromCfg(115131067)
				local var_274_15 = arg_271_1:FormatText(var_274_14.content)

				arg_271_1.text_.text = var_274_15

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_16 = 45
				local var_274_17 = utf8.len(var_274_15)
				local var_274_18 = var_274_16 <= 0 and var_274_12 or var_274_12 * (var_274_17 / var_274_16)

				if var_274_18 > 0 and var_274_12 < var_274_18 then
					arg_271_1.talkMaxDuration = var_274_18

					if var_274_18 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_18 + var_274_11
					end
				end

				arg_271_1.text_.text = var_274_15
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131067", "story_v_out_115131.awb") ~= 0 then
					local var_274_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131067", "story_v_out_115131.awb") / 1000

					if var_274_19 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_11
					end

					if var_274_14.prefab_name ~= "" and arg_271_1.actors_[var_274_14.prefab_name] ~= nil then
						local var_274_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_14.prefab_name].transform, "story_v_out_115131", "115131067", "story_v_out_115131.awb")

						arg_271_1:RecordAudio("115131067", var_274_20)
						arg_271_1:RecordAudio("115131067", var_274_20)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_115131", "115131067", "story_v_out_115131.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_115131", "115131067", "story_v_out_115131.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_21 = math.max(var_274_12, arg_271_1.talkMaxDuration)

			if var_274_11 <= arg_271_1.time_ and arg_271_1.time_ < var_274_11 + var_274_21 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_11) / var_274_21

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_11 + var_274_21 and arg_271_1.time_ < var_274_11 + var_274_21 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play115131068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 115131068
		arg_275_1.duration_ = 14.1

		local var_275_0 = {
			ja = 14.1,
			ko = 12.066,
			zh = 11.633,
			en = 10.7
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
				arg_275_0:Play115131069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1024ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect1024ui_story == nil then
				arg_275_1.var_.characterEffect1024ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.2

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect1024ui_story then
					local var_278_4 = Mathf.Lerp(0, 0.5, var_278_3)

					arg_275_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1024ui_story.fillRatio = var_278_4
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect1024ui_story then
				local var_278_5 = 0.5

				arg_275_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1024ui_story.fillRatio = var_278_5
			end

			local var_278_6 = 0

			if var_278_6 < arg_275_1.time_ and arg_275_1.time_ <= var_278_6 + arg_278_0 then
				arg_275_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_278_7 = arg_275_1.actors_["1052ui_story"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.characterEffect1052ui_story == nil then
				arg_275_1.var_.characterEffect1052ui_story = var_278_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_9 = 0.2

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.characterEffect1052ui_story then
					arg_275_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.characterEffect1052ui_story then
				arg_275_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_278_11 = 0

			if var_278_11 < arg_275_1.time_ and arg_275_1.time_ <= var_278_11 + arg_278_0 then
				arg_275_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action7_1")
			end

			local var_278_12 = 0
			local var_278_13 = 1.175

			if var_278_12 < arg_275_1.time_ and arg_275_1.time_ <= var_278_12 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_14 = arg_275_1:FormatText(StoryNameCfg[263].name)

				arg_275_1.leftNameTxt_.text = var_278_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_15 = arg_275_1:GetWordFromCfg(115131068)
				local var_278_16 = arg_275_1:FormatText(var_278_15.content)

				arg_275_1.text_.text = var_278_16

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_17 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131068", "story_v_out_115131.awb") ~= 0 then
					local var_278_20 = manager.audio:GetVoiceLength("story_v_out_115131", "115131068", "story_v_out_115131.awb") / 1000

					if var_278_20 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_12
					end

					if var_278_15.prefab_name ~= "" and arg_275_1.actors_[var_278_15.prefab_name] ~= nil then
						local var_278_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_15.prefab_name].transform, "story_v_out_115131", "115131068", "story_v_out_115131.awb")

						arg_275_1:RecordAudio("115131068", var_278_21)
						arg_275_1:RecordAudio("115131068", var_278_21)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_115131", "115131068", "story_v_out_115131.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_115131", "115131068", "story_v_out_115131.awb")
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
	Play115131069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 115131069
		arg_279_1.duration_ = 8.666

		local var_279_0 = {
			ja = 8.666,
			ko = 7.633,
			zh = 5.833,
			en = 5.166
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
				arg_279_0:Play115131070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_282_1 = arg_279_1.actors_["1024ui_story"]
			local var_282_2 = 0

			if var_282_2 < arg_279_1.time_ and arg_279_1.time_ <= var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1024ui_story == nil then
				arg_279_1.var_.characterEffect1024ui_story = var_282_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_3 = 0.2

			if var_282_2 <= arg_279_1.time_ and arg_279_1.time_ < var_282_2 + var_282_3 then
				local var_282_4 = (arg_279_1.time_ - var_282_2) / var_282_3

				if arg_279_1.var_.characterEffect1024ui_story then
					arg_279_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_2 + var_282_3 and arg_279_1.time_ < var_282_2 + var_282_3 + arg_282_0 and arg_279_1.var_.characterEffect1024ui_story then
				arg_279_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_282_5 = arg_279_1.actors_["1052ui_story"]
			local var_282_6 = 0

			if var_282_6 < arg_279_1.time_ and arg_279_1.time_ <= var_282_6 + arg_282_0 and arg_279_1.var_.characterEffect1052ui_story == nil then
				arg_279_1.var_.characterEffect1052ui_story = var_282_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_7 = 0.2

			if var_282_6 <= arg_279_1.time_ and arg_279_1.time_ < var_282_6 + var_282_7 then
				local var_282_8 = (arg_279_1.time_ - var_282_6) / var_282_7

				if arg_279_1.var_.characterEffect1052ui_story then
					local var_282_9 = Mathf.Lerp(0, 0.5, var_282_8)

					arg_279_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1052ui_story.fillRatio = var_282_9
				end
			end

			if arg_279_1.time_ >= var_282_6 + var_282_7 and arg_279_1.time_ < var_282_6 + var_282_7 + arg_282_0 and arg_279_1.var_.characterEffect1052ui_story then
				local var_282_10 = 0.5

				arg_279_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1052ui_story.fillRatio = var_282_10
			end

			local var_282_11 = 0
			local var_282_12 = 0.725

			if var_282_11 < arg_279_1.time_ and arg_279_1.time_ <= var_282_11 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_13 = arg_279_1:FormatText(StoryNameCfg[265].name)

				arg_279_1.leftNameTxt_.text = var_282_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_14 = arg_279_1:GetWordFromCfg(115131069)
				local var_282_15 = arg_279_1:FormatText(var_282_14.content)

				arg_279_1.text_.text = var_282_15

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_16 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131069", "story_v_out_115131.awb") ~= 0 then
					local var_282_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131069", "story_v_out_115131.awb") / 1000

					if var_282_19 + var_282_11 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_11
					end

					if var_282_14.prefab_name ~= "" and arg_279_1.actors_[var_282_14.prefab_name] ~= nil then
						local var_282_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_14.prefab_name].transform, "story_v_out_115131", "115131069", "story_v_out_115131.awb")

						arg_279_1:RecordAudio("115131069", var_282_20)
						arg_279_1:RecordAudio("115131069", var_282_20)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_115131", "115131069", "story_v_out_115131.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_115131", "115131069", "story_v_out_115131.awb")
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
	Play115131070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 115131070
		arg_283_1.duration_ = 14

		local var_283_0 = {
			ja = 14,
			ko = 11.033,
			zh = 13.766,
			en = 9.666
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
				arg_283_0:Play115131071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_286_1 = arg_283_1.actors_["1024ui_story"]
			local var_286_2 = 0

			if var_286_2 < arg_283_1.time_ and arg_283_1.time_ <= var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1024ui_story == nil then
				arg_283_1.var_.characterEffect1024ui_story = var_286_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_3 = 0.2

			if var_286_2 <= arg_283_1.time_ and arg_283_1.time_ < var_286_2 + var_286_3 then
				local var_286_4 = (arg_283_1.time_ - var_286_2) / var_286_3

				if arg_283_1.var_.characterEffect1024ui_story then
					local var_286_5 = Mathf.Lerp(0, 0.5, var_286_4)

					arg_283_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1024ui_story.fillRatio = var_286_5
				end
			end

			if arg_283_1.time_ >= var_286_2 + var_286_3 and arg_283_1.time_ < var_286_2 + var_286_3 + arg_286_0 and arg_283_1.var_.characterEffect1024ui_story then
				local var_286_6 = 0.5

				arg_283_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1024ui_story.fillRatio = var_286_6
			end

			local var_286_7 = arg_283_1.actors_["1052ui_story"]
			local var_286_8 = 0

			if var_286_8 < arg_283_1.time_ and arg_283_1.time_ <= var_286_8 + arg_286_0 and arg_283_1.var_.characterEffect1052ui_story == nil then
				arg_283_1.var_.characterEffect1052ui_story = var_286_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_9 = 0.2

			if var_286_8 <= arg_283_1.time_ and arg_283_1.time_ < var_286_8 + var_286_9 then
				local var_286_10 = (arg_283_1.time_ - var_286_8) / var_286_9

				if arg_283_1.var_.characterEffect1052ui_story then
					arg_283_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_8 + var_286_9 and arg_283_1.time_ < var_286_8 + var_286_9 + arg_286_0 and arg_283_1.var_.characterEffect1052ui_story then
				arg_283_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_286_11 = 0
			local var_286_12 = 1.3

			if var_286_11 < arg_283_1.time_ and arg_283_1.time_ <= var_286_11 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_13 = arg_283_1:FormatText(StoryNameCfg[263].name)

				arg_283_1.leftNameTxt_.text = var_286_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_14 = arg_283_1:GetWordFromCfg(115131070)
				local var_286_15 = arg_283_1:FormatText(var_286_14.content)

				arg_283_1.text_.text = var_286_15

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_16 = 52
				local var_286_17 = utf8.len(var_286_15)
				local var_286_18 = var_286_16 <= 0 and var_286_12 or var_286_12 * (var_286_17 / var_286_16)

				if var_286_18 > 0 and var_286_12 < var_286_18 then
					arg_283_1.talkMaxDuration = var_286_18

					if var_286_18 + var_286_11 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_18 + var_286_11
					end
				end

				arg_283_1.text_.text = var_286_15
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131070", "story_v_out_115131.awb") ~= 0 then
					local var_286_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131070", "story_v_out_115131.awb") / 1000

					if var_286_19 + var_286_11 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_11
					end

					if var_286_14.prefab_name ~= "" and arg_283_1.actors_[var_286_14.prefab_name] ~= nil then
						local var_286_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_14.prefab_name].transform, "story_v_out_115131", "115131070", "story_v_out_115131.awb")

						arg_283_1:RecordAudio("115131070", var_286_20)
						arg_283_1:RecordAudio("115131070", var_286_20)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_115131", "115131070", "story_v_out_115131.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_115131", "115131070", "story_v_out_115131.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_21 = math.max(var_286_12, arg_283_1.talkMaxDuration)

			if var_286_11 <= arg_283_1.time_ and arg_283_1.time_ < var_286_11 + var_286_21 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_11) / var_286_21

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_11 + var_286_21 and arg_283_1.time_ < var_286_11 + var_286_21 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play115131071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 115131071
		arg_287_1.duration_ = 17.566

		local var_287_0 = {
			ja = 16,
			ko = 12.466,
			zh = 13.233,
			en = 17.566
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
				arg_287_0:Play115131072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_290_1 = 0
			local var_290_2 = 1.225

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_3 = arg_287_1:FormatText(StoryNameCfg[263].name)

				arg_287_1.leftNameTxt_.text = var_290_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_4 = arg_287_1:GetWordFromCfg(115131071)
				local var_290_5 = arg_287_1:FormatText(var_290_4.content)

				arg_287_1.text_.text = var_290_5

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_6 = 49
				local var_290_7 = utf8.len(var_290_5)
				local var_290_8 = var_290_6 <= 0 and var_290_2 or var_290_2 * (var_290_7 / var_290_6)

				if var_290_8 > 0 and var_290_2 < var_290_8 then
					arg_287_1.talkMaxDuration = var_290_8

					if var_290_8 + var_290_1 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_1
					end
				end

				arg_287_1.text_.text = var_290_5
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131071", "story_v_out_115131.awb") ~= 0 then
					local var_290_9 = manager.audio:GetVoiceLength("story_v_out_115131", "115131071", "story_v_out_115131.awb") / 1000

					if var_290_9 + var_290_1 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_9 + var_290_1
					end

					if var_290_4.prefab_name ~= "" and arg_287_1.actors_[var_290_4.prefab_name] ~= nil then
						local var_290_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_4.prefab_name].transform, "story_v_out_115131", "115131071", "story_v_out_115131.awb")

						arg_287_1:RecordAudio("115131071", var_290_10)
						arg_287_1:RecordAudio("115131071", var_290_10)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_115131", "115131071", "story_v_out_115131.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_115131", "115131071", "story_v_out_115131.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_11 = math.max(var_290_2, arg_287_1.talkMaxDuration)

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_11 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_1) / var_290_11

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_1 + var_290_11 and arg_287_1.time_ < var_290_1 + var_290_11 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play115131072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 115131072
		arg_291_1.duration_ = 17.866

		local var_291_0 = {
			ja = 12.3,
			ko = 15.7,
			zh = 17.866,
			en = 12.4
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
				arg_291_0:Play115131073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052actionlink/1052action476")
			end

			local var_294_2 = 0
			local var_294_3 = 1.55

			if var_294_2 < arg_291_1.time_ and arg_291_1.time_ <= var_294_2 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_4 = arg_291_1:FormatText(StoryNameCfg[263].name)

				arg_291_1.leftNameTxt_.text = var_294_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_5 = arg_291_1:GetWordFromCfg(115131072)
				local var_294_6 = arg_291_1:FormatText(var_294_5.content)

				arg_291_1.text_.text = var_294_6

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_7 = 62
				local var_294_8 = utf8.len(var_294_6)
				local var_294_9 = var_294_7 <= 0 and var_294_3 or var_294_3 * (var_294_8 / var_294_7)

				if var_294_9 > 0 and var_294_3 < var_294_9 then
					arg_291_1.talkMaxDuration = var_294_9

					if var_294_9 + var_294_2 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_9 + var_294_2
					end
				end

				arg_291_1.text_.text = var_294_6
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131072", "story_v_out_115131.awb") ~= 0 then
					local var_294_10 = manager.audio:GetVoiceLength("story_v_out_115131", "115131072", "story_v_out_115131.awb") / 1000

					if var_294_10 + var_294_2 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_10 + var_294_2
					end

					if var_294_5.prefab_name ~= "" and arg_291_1.actors_[var_294_5.prefab_name] ~= nil then
						local var_294_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_5.prefab_name].transform, "story_v_out_115131", "115131072", "story_v_out_115131.awb")

						arg_291_1:RecordAudio("115131072", var_294_11)
						arg_291_1:RecordAudio("115131072", var_294_11)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_115131", "115131072", "story_v_out_115131.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_115131", "115131072", "story_v_out_115131.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_12 = math.max(var_294_3, arg_291_1.talkMaxDuration)

			if var_294_2 <= arg_291_1.time_ and arg_291_1.time_ < var_294_2 + var_294_12 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_2) / var_294_12

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_2 + var_294_12 and arg_291_1.time_ < var_294_2 + var_294_12 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play115131073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 115131073
		arg_295_1.duration_ = 18.3

		local var_295_0 = {
			ja = 18.3,
			ko = 17,
			zh = 12.8,
			en = 15.666
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
				arg_295_0:Play115131074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_298_1 = arg_295_1.actors_["1024ui_story"]
			local var_298_2 = 0

			if var_298_2 < arg_295_1.time_ and arg_295_1.time_ <= var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1024ui_story == nil then
				arg_295_1.var_.characterEffect1024ui_story = var_298_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_3 = 0.2

			if var_298_2 <= arg_295_1.time_ and arg_295_1.time_ < var_298_2 + var_298_3 then
				local var_298_4 = (arg_295_1.time_ - var_298_2) / var_298_3

				if arg_295_1.var_.characterEffect1024ui_story then
					arg_295_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_2 + var_298_3 and arg_295_1.time_ < var_298_2 + var_298_3 + arg_298_0 and arg_295_1.var_.characterEffect1024ui_story then
				arg_295_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_298_5 = arg_295_1.actors_["1052ui_story"]
			local var_298_6 = 0

			if var_298_6 < arg_295_1.time_ and arg_295_1.time_ <= var_298_6 + arg_298_0 and arg_295_1.var_.characterEffect1052ui_story == nil then
				arg_295_1.var_.characterEffect1052ui_story = var_298_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_7 = 0.2

			if var_298_6 <= arg_295_1.time_ and arg_295_1.time_ < var_298_6 + var_298_7 then
				local var_298_8 = (arg_295_1.time_ - var_298_6) / var_298_7

				if arg_295_1.var_.characterEffect1052ui_story then
					local var_298_9 = Mathf.Lerp(0, 0.5, var_298_8)

					arg_295_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1052ui_story.fillRatio = var_298_9
				end
			end

			if arg_295_1.time_ >= var_298_6 + var_298_7 and arg_295_1.time_ < var_298_6 + var_298_7 + arg_298_0 and arg_295_1.var_.characterEffect1052ui_story then
				local var_298_10 = 0.5

				arg_295_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1052ui_story.fillRatio = var_298_10
			end

			local var_298_11 = 0
			local var_298_12 = 1.525

			if var_298_11 < arg_295_1.time_ and arg_295_1.time_ <= var_298_11 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_13 = arg_295_1:FormatText(StoryNameCfg[265].name)

				arg_295_1.leftNameTxt_.text = var_298_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_14 = arg_295_1:GetWordFromCfg(115131073)
				local var_298_15 = arg_295_1:FormatText(var_298_14.content)

				arg_295_1.text_.text = var_298_15

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_16 = 61
				local var_298_17 = utf8.len(var_298_15)
				local var_298_18 = var_298_16 <= 0 and var_298_12 or var_298_12 * (var_298_17 / var_298_16)

				if var_298_18 > 0 and var_298_12 < var_298_18 then
					arg_295_1.talkMaxDuration = var_298_18

					if var_298_18 + var_298_11 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_18 + var_298_11
					end
				end

				arg_295_1.text_.text = var_298_15
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131073", "story_v_out_115131.awb") ~= 0 then
					local var_298_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131073", "story_v_out_115131.awb") / 1000

					if var_298_19 + var_298_11 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_19 + var_298_11
					end

					if var_298_14.prefab_name ~= "" and arg_295_1.actors_[var_298_14.prefab_name] ~= nil then
						local var_298_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_14.prefab_name].transform, "story_v_out_115131", "115131073", "story_v_out_115131.awb")

						arg_295_1:RecordAudio("115131073", var_298_20)
						arg_295_1:RecordAudio("115131073", var_298_20)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_115131", "115131073", "story_v_out_115131.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_115131", "115131073", "story_v_out_115131.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_21 = math.max(var_298_12, arg_295_1.talkMaxDuration)

			if var_298_11 <= arg_295_1.time_ and arg_295_1.time_ < var_298_11 + var_298_21 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_11) / var_298_21

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_11 + var_298_21 and arg_295_1.time_ < var_298_11 + var_298_21 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play115131074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 115131074
		arg_299_1.duration_ = 16

		local var_299_0 = {
			ja = 16,
			ko = 9.6,
			zh = 11.633,
			en = 7.833
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
				arg_299_0:Play115131075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_302_1 = arg_299_1.actors_["1024ui_story"]
			local var_302_2 = 0

			if var_302_2 < arg_299_1.time_ and arg_299_1.time_ <= var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1024ui_story == nil then
				arg_299_1.var_.characterEffect1024ui_story = var_302_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_3 = 0.2

			if var_302_2 <= arg_299_1.time_ and arg_299_1.time_ < var_302_2 + var_302_3 then
				local var_302_4 = (arg_299_1.time_ - var_302_2) / var_302_3

				if arg_299_1.var_.characterEffect1024ui_story then
					local var_302_5 = Mathf.Lerp(0, 0.5, var_302_4)

					arg_299_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1024ui_story.fillRatio = var_302_5
				end
			end

			if arg_299_1.time_ >= var_302_2 + var_302_3 and arg_299_1.time_ < var_302_2 + var_302_3 + arg_302_0 and arg_299_1.var_.characterEffect1024ui_story then
				local var_302_6 = 0.5

				arg_299_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1024ui_story.fillRatio = var_302_6
			end

			local var_302_7 = arg_299_1.actors_["1052ui_story"]
			local var_302_8 = 0

			if var_302_8 < arg_299_1.time_ and arg_299_1.time_ <= var_302_8 + arg_302_0 and arg_299_1.var_.characterEffect1052ui_story == nil then
				arg_299_1.var_.characterEffect1052ui_story = var_302_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_9 = 0.2

			if var_302_8 <= arg_299_1.time_ and arg_299_1.time_ < var_302_8 + var_302_9 then
				local var_302_10 = (arg_299_1.time_ - var_302_8) / var_302_9

				if arg_299_1.var_.characterEffect1052ui_story then
					arg_299_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_8 + var_302_9 and arg_299_1.time_ < var_302_8 + var_302_9 + arg_302_0 and arg_299_1.var_.characterEffect1052ui_story then
				arg_299_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_302_11 = 0
			local var_302_12 = 0.85

			if var_302_11 < arg_299_1.time_ and arg_299_1.time_ <= var_302_11 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_13 = arg_299_1:FormatText(StoryNameCfg[263].name)

				arg_299_1.leftNameTxt_.text = var_302_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_14 = arg_299_1:GetWordFromCfg(115131074)
				local var_302_15 = arg_299_1:FormatText(var_302_14.content)

				arg_299_1.text_.text = var_302_15

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_16 = 34
				local var_302_17 = utf8.len(var_302_15)
				local var_302_18 = var_302_16 <= 0 and var_302_12 or var_302_12 * (var_302_17 / var_302_16)

				if var_302_18 > 0 and var_302_12 < var_302_18 then
					arg_299_1.talkMaxDuration = var_302_18

					if var_302_18 + var_302_11 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_18 + var_302_11
					end
				end

				arg_299_1.text_.text = var_302_15
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131074", "story_v_out_115131.awb") ~= 0 then
					local var_302_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131074", "story_v_out_115131.awb") / 1000

					if var_302_19 + var_302_11 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_19 + var_302_11
					end

					if var_302_14.prefab_name ~= "" and arg_299_1.actors_[var_302_14.prefab_name] ~= nil then
						local var_302_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_14.prefab_name].transform, "story_v_out_115131", "115131074", "story_v_out_115131.awb")

						arg_299_1:RecordAudio("115131074", var_302_20)
						arg_299_1:RecordAudio("115131074", var_302_20)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_115131", "115131074", "story_v_out_115131.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_115131", "115131074", "story_v_out_115131.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_21 = math.max(var_302_12, arg_299_1.talkMaxDuration)

			if var_302_11 <= arg_299_1.time_ and arg_299_1.time_ < var_302_11 + var_302_21 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_11) / var_302_21

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_11 + var_302_21 and arg_299_1.time_ < var_302_11 + var_302_21 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play115131075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 115131075
		arg_303_1.duration_ = 10.433

		local var_303_0 = {
			ja = 9.8,
			ko = 8.266,
			zh = 7.9,
			en = 10.433
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
				arg_303_0:Play115131076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1052ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1052ui_story == nil then
				arg_303_1.var_.characterEffect1052ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.2

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1052ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1052ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1052ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1052ui_story.fillRatio = var_306_5
			end

			local var_306_6 = arg_303_1.actors_["1024ui_story"].transform
			local var_306_7 = 0

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 then
				arg_303_1.var_.moveOldPos1024ui_story = var_306_6.localPosition
			end

			local var_306_8 = 0.001

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_8 then
				local var_306_9 = (arg_303_1.time_ - var_306_7) / var_306_8
				local var_306_10 = Vector3.New(0, 100, 0)

				var_306_6.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1024ui_story, var_306_10, var_306_9)

				local var_306_11 = manager.ui.mainCamera.transform.position - var_306_6.position

				var_306_6.forward = Vector3.New(var_306_11.x, var_306_11.y, var_306_11.z)

				local var_306_12 = var_306_6.localEulerAngles

				var_306_12.z = 0
				var_306_12.x = 0
				var_306_6.localEulerAngles = var_306_12
			end

			if arg_303_1.time_ >= var_306_7 + var_306_8 and arg_303_1.time_ < var_306_7 + var_306_8 + arg_306_0 then
				var_306_6.localPosition = Vector3.New(0, 100, 0)

				local var_306_13 = manager.ui.mainCamera.transform.position - var_306_6.position

				var_306_6.forward = Vector3.New(var_306_13.x, var_306_13.y, var_306_13.z)

				local var_306_14 = var_306_6.localEulerAngles

				var_306_14.z = 0
				var_306_14.x = 0
				var_306_6.localEulerAngles = var_306_14
			end

			local var_306_15 = arg_303_1.actors_["1017ui_story"].transform
			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 then
				arg_303_1.var_.moveOldPos1017ui_story = var_306_15.localPosition
			end

			local var_306_17 = 0.001

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17
				local var_306_19 = Vector3.New(0.7, -1.01, -6.05)

				var_306_15.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1017ui_story, var_306_19, var_306_18)

				local var_306_20 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_20.x, var_306_20.y, var_306_20.z)

				local var_306_21 = var_306_15.localEulerAngles

				var_306_21.z = 0
				var_306_21.x = 0
				var_306_15.localEulerAngles = var_306_21
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 then
				var_306_15.localPosition = Vector3.New(0.7, -1.01, -6.05)

				local var_306_22 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_22.x, var_306_22.y, var_306_22.z)

				local var_306_23 = var_306_15.localEulerAngles

				var_306_23.z = 0
				var_306_23.x = 0
				var_306_15.localEulerAngles = var_306_23
			end

			local var_306_24 = 0

			if var_306_24 < arg_303_1.time_ and arg_303_1.time_ <= var_306_24 + arg_306_0 then
				arg_303_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/1017/1017action/1017action3_1")
			end

			local var_306_25 = 0

			if var_306_25 < arg_303_1.time_ and arg_303_1.time_ <= var_306_25 + arg_306_0 then
				arg_303_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_306_26 = arg_303_1.actors_["1017ui_story"]
			local var_306_27 = 0

			if var_306_27 < arg_303_1.time_ and arg_303_1.time_ <= var_306_27 + arg_306_0 and arg_303_1.var_.characterEffect1017ui_story == nil then
				arg_303_1.var_.characterEffect1017ui_story = var_306_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_28 = 0.2

			if var_306_27 <= arg_303_1.time_ and arg_303_1.time_ < var_306_27 + var_306_28 then
				local var_306_29 = (arg_303_1.time_ - var_306_27) / var_306_28

				if arg_303_1.var_.characterEffect1017ui_story then
					arg_303_1.var_.characterEffect1017ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_27 + var_306_28 and arg_303_1.time_ < var_306_27 + var_306_28 + arg_306_0 and arg_303_1.var_.characterEffect1017ui_story then
				arg_303_1.var_.characterEffect1017ui_story.fillFlat = false
			end

			local var_306_30 = 0
			local var_306_31 = 1.075

			if var_306_30 < arg_303_1.time_ and arg_303_1.time_ <= var_306_30 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_32 = arg_303_1:FormatText(StoryNameCfg[273].name)

				arg_303_1.leftNameTxt_.text = var_306_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_33 = arg_303_1:GetWordFromCfg(115131075)
				local var_306_34 = arg_303_1:FormatText(var_306_33.content)

				arg_303_1.text_.text = var_306_34

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_35 = 43
				local var_306_36 = utf8.len(var_306_34)
				local var_306_37 = var_306_35 <= 0 and var_306_31 or var_306_31 * (var_306_36 / var_306_35)

				if var_306_37 > 0 and var_306_31 < var_306_37 then
					arg_303_1.talkMaxDuration = var_306_37

					if var_306_37 + var_306_30 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_37 + var_306_30
					end
				end

				arg_303_1.text_.text = var_306_34
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131075", "story_v_out_115131.awb") ~= 0 then
					local var_306_38 = manager.audio:GetVoiceLength("story_v_out_115131", "115131075", "story_v_out_115131.awb") / 1000

					if var_306_38 + var_306_30 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_38 + var_306_30
					end

					if var_306_33.prefab_name ~= "" and arg_303_1.actors_[var_306_33.prefab_name] ~= nil then
						local var_306_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_33.prefab_name].transform, "story_v_out_115131", "115131075", "story_v_out_115131.awb")

						arg_303_1:RecordAudio("115131075", var_306_39)
						arg_303_1:RecordAudio("115131075", var_306_39)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_115131", "115131075", "story_v_out_115131.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_115131", "115131075", "story_v_out_115131.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_40 = math.max(var_306_31, arg_303_1.talkMaxDuration)

			if var_306_30 <= arg_303_1.time_ and arg_303_1.time_ < var_306_30 + var_306_40 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_30) / var_306_40

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_30 + var_306_40 and arg_303_1.time_ < var_306_30 + var_306_40 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play115131076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 115131076
		arg_307_1.duration_ = 8.833

		local var_307_0 = {
			ja = 8.833,
			ko = 8.833,
			zh = 6.233,
			en = 7.366
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
				arg_307_0:Play115131077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1017ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1017ui_story == nil then
				arg_307_1.var_.characterEffect1017ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.2

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1017ui_story then
					local var_310_4 = Mathf.Lerp(0, 0.5, var_310_3)

					arg_307_1.var_.characterEffect1017ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1017ui_story.fillRatio = var_310_4
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1017ui_story then
				local var_310_5 = 0.5

				arg_307_1.var_.characterEffect1017ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1017ui_story.fillRatio = var_310_5
			end

			local var_310_6 = 0
			local var_310_7 = 0.75

			if var_310_6 < arg_307_1.time_ and arg_307_1.time_ <= var_310_6 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_8 = arg_307_1:FormatText(StoryNameCfg[265].name)

				arg_307_1.leftNameTxt_.text = var_310_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, true)
				arg_307_1.iconController_:SetSelectedState("hero")

				arg_307_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1024")

				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_9 = arg_307_1:GetWordFromCfg(115131076)
				local var_310_10 = arg_307_1:FormatText(var_310_9.content)

				arg_307_1.text_.text = var_310_10

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_11 = 30
				local var_310_12 = utf8.len(var_310_10)
				local var_310_13 = var_310_11 <= 0 and var_310_7 or var_310_7 * (var_310_12 / var_310_11)

				if var_310_13 > 0 and var_310_7 < var_310_13 then
					arg_307_1.talkMaxDuration = var_310_13

					if var_310_13 + var_310_6 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_13 + var_310_6
					end
				end

				arg_307_1.text_.text = var_310_10
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131076", "story_v_out_115131.awb") ~= 0 then
					local var_310_14 = manager.audio:GetVoiceLength("story_v_out_115131", "115131076", "story_v_out_115131.awb") / 1000

					if var_310_14 + var_310_6 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_14 + var_310_6
					end

					if var_310_9.prefab_name ~= "" and arg_307_1.actors_[var_310_9.prefab_name] ~= nil then
						local var_310_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_9.prefab_name].transform, "story_v_out_115131", "115131076", "story_v_out_115131.awb")

						arg_307_1:RecordAudio("115131076", var_310_15)
						arg_307_1:RecordAudio("115131076", var_310_15)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_115131", "115131076", "story_v_out_115131.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_115131", "115131076", "story_v_out_115131.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_16 = math.max(var_310_7, arg_307_1.talkMaxDuration)

			if var_310_6 <= arg_307_1.time_ and arg_307_1.time_ < var_310_6 + var_310_16 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_6) / var_310_16

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_6 + var_310_16 and arg_307_1.time_ < var_310_6 + var_310_16 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play115131077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 115131077
		arg_311_1.duration_ = 2.333

		local var_311_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.333
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
				arg_311_0:Play115131078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_314_1 = arg_311_1.actors_["1017ui_story"]
			local var_314_2 = 0

			if var_314_2 < arg_311_1.time_ and arg_311_1.time_ <= var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect1017ui_story == nil then
				arg_311_1.var_.characterEffect1017ui_story = var_314_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_3 = 0.2

			if var_314_2 <= arg_311_1.time_ and arg_311_1.time_ < var_314_2 + var_314_3 then
				local var_314_4 = (arg_311_1.time_ - var_314_2) / var_314_3

				if arg_311_1.var_.characterEffect1017ui_story then
					arg_311_1.var_.characterEffect1017ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_2 + var_314_3 and arg_311_1.time_ < var_314_2 + var_314_3 + arg_314_0 and arg_311_1.var_.characterEffect1017ui_story then
				arg_311_1.var_.characterEffect1017ui_story.fillFlat = false
			end

			local var_314_5 = 0
			local var_314_6 = 0.175

			if var_314_5 < arg_311_1.time_ and arg_311_1.time_ <= var_314_5 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_7 = arg_311_1:FormatText(StoryNameCfg[273].name)

				arg_311_1.leftNameTxt_.text = var_314_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_8 = arg_311_1:GetWordFromCfg(115131077)
				local var_314_9 = arg_311_1:FormatText(var_314_8.content)

				arg_311_1.text_.text = var_314_9

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_10 = 7
				local var_314_11 = utf8.len(var_314_9)
				local var_314_12 = var_314_10 <= 0 and var_314_6 or var_314_6 * (var_314_11 / var_314_10)

				if var_314_12 > 0 and var_314_6 < var_314_12 then
					arg_311_1.talkMaxDuration = var_314_12

					if var_314_12 + var_314_5 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_12 + var_314_5
					end
				end

				arg_311_1.text_.text = var_314_9
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131077", "story_v_out_115131.awb") ~= 0 then
					local var_314_13 = manager.audio:GetVoiceLength("story_v_out_115131", "115131077", "story_v_out_115131.awb") / 1000

					if var_314_13 + var_314_5 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_13 + var_314_5
					end

					if var_314_8.prefab_name ~= "" and arg_311_1.actors_[var_314_8.prefab_name] ~= nil then
						local var_314_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_8.prefab_name].transform, "story_v_out_115131", "115131077", "story_v_out_115131.awb")

						arg_311_1:RecordAudio("115131077", var_314_14)
						arg_311_1:RecordAudio("115131077", var_314_14)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_115131", "115131077", "story_v_out_115131.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_115131", "115131077", "story_v_out_115131.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_15 = math.max(var_314_6, arg_311_1.talkMaxDuration)

			if var_314_5 <= arg_311_1.time_ and arg_311_1.time_ < var_314_5 + var_314_15 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_5) / var_314_15

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_5 + var_314_15 and arg_311_1.time_ < var_314_5 + var_314_15 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play115131078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 115131078
		arg_315_1.duration_ = 10.033

		local var_315_0 = {
			ja = 9.4,
			ko = 7,
			zh = 10.033,
			en = 8.7
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
				arg_315_0:Play115131079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_2")
			end

			local var_318_2 = arg_315_1.actors_["1017ui_story"]
			local var_318_3 = 0

			if var_318_3 < arg_315_1.time_ and arg_315_1.time_ <= var_318_3 + arg_318_0 and arg_315_1.var_.characterEffect1017ui_story == nil then
				arg_315_1.var_.characterEffect1017ui_story = var_318_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_4 = 0.2

			if var_318_3 <= arg_315_1.time_ and arg_315_1.time_ < var_318_3 + var_318_4 then
				local var_318_5 = (arg_315_1.time_ - var_318_3) / var_318_4

				if arg_315_1.var_.characterEffect1017ui_story then
					local var_318_6 = Mathf.Lerp(0, 0.5, var_318_5)

					arg_315_1.var_.characterEffect1017ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1017ui_story.fillRatio = var_318_6
				end
			end

			if arg_315_1.time_ >= var_318_3 + var_318_4 and arg_315_1.time_ < var_318_3 + var_318_4 + arg_318_0 and arg_315_1.var_.characterEffect1017ui_story then
				local var_318_7 = 0.5

				arg_315_1.var_.characterEffect1017ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1017ui_story.fillRatio = var_318_7
			end

			local var_318_8 = arg_315_1.actors_["1052ui_story"]
			local var_318_9 = 0

			if var_318_9 < arg_315_1.time_ and arg_315_1.time_ <= var_318_9 + arg_318_0 and arg_315_1.var_.characterEffect1052ui_story == nil then
				arg_315_1.var_.characterEffect1052ui_story = var_318_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_10 = 0.2

			if var_318_9 <= arg_315_1.time_ and arg_315_1.time_ < var_318_9 + var_318_10 then
				local var_318_11 = (arg_315_1.time_ - var_318_9) / var_318_10

				if arg_315_1.var_.characterEffect1052ui_story then
					arg_315_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_9 + var_318_10 and arg_315_1.time_ < var_318_9 + var_318_10 + arg_318_0 and arg_315_1.var_.characterEffect1052ui_story then
				arg_315_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_318_12 = 0
			local var_318_13 = 0.9

			if var_318_12 < arg_315_1.time_ and arg_315_1.time_ <= var_318_12 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_14 = arg_315_1:FormatText(StoryNameCfg[263].name)

				arg_315_1.leftNameTxt_.text = var_318_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_15 = arg_315_1:GetWordFromCfg(115131078)
				local var_318_16 = arg_315_1:FormatText(var_318_15.content)

				arg_315_1.text_.text = var_318_16

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_17 = 36
				local var_318_18 = utf8.len(var_318_16)
				local var_318_19 = var_318_17 <= 0 and var_318_13 or var_318_13 * (var_318_18 / var_318_17)

				if var_318_19 > 0 and var_318_13 < var_318_19 then
					arg_315_1.talkMaxDuration = var_318_19

					if var_318_19 + var_318_12 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_19 + var_318_12
					end
				end

				arg_315_1.text_.text = var_318_16
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131078", "story_v_out_115131.awb") ~= 0 then
					local var_318_20 = manager.audio:GetVoiceLength("story_v_out_115131", "115131078", "story_v_out_115131.awb") / 1000

					if var_318_20 + var_318_12 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_20 + var_318_12
					end

					if var_318_15.prefab_name ~= "" and arg_315_1.actors_[var_318_15.prefab_name] ~= nil then
						local var_318_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_15.prefab_name].transform, "story_v_out_115131", "115131078", "story_v_out_115131.awb")

						arg_315_1:RecordAudio("115131078", var_318_21)
						arg_315_1:RecordAudio("115131078", var_318_21)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_115131", "115131078", "story_v_out_115131.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_115131", "115131078", "story_v_out_115131.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_22 = math.max(var_318_13, arg_315_1.talkMaxDuration)

			if var_318_12 <= arg_315_1.time_ and arg_315_1.time_ < var_318_12 + var_318_22 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_12) / var_318_22

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_12 + var_318_22 and arg_315_1.time_ < var_318_12 + var_318_22 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play115131079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 115131079
		arg_319_1.duration_ = 6.6

		local var_319_0 = {
			ja = 6.6,
			ko = 3.633,
			zh = 3.433,
			en = 3.866
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
				arg_319_0:Play115131080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_322_1 = arg_319_1.actors_["1017ui_story"]
			local var_322_2 = 0

			if var_322_2 < arg_319_1.time_ and arg_319_1.time_ <= var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1017ui_story == nil then
				arg_319_1.var_.characterEffect1017ui_story = var_322_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_3 = 0.2

			if var_322_2 <= arg_319_1.time_ and arg_319_1.time_ < var_322_2 + var_322_3 then
				local var_322_4 = (arg_319_1.time_ - var_322_2) / var_322_3

				if arg_319_1.var_.characterEffect1017ui_story then
					arg_319_1.var_.characterEffect1017ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_2 + var_322_3 and arg_319_1.time_ < var_322_2 + var_322_3 + arg_322_0 and arg_319_1.var_.characterEffect1017ui_story then
				arg_319_1.var_.characterEffect1017ui_story.fillFlat = false
			end

			local var_322_5 = arg_319_1.actors_["1052ui_story"]
			local var_322_6 = 0

			if var_322_6 < arg_319_1.time_ and arg_319_1.time_ <= var_322_6 + arg_322_0 and arg_319_1.var_.characterEffect1052ui_story == nil then
				arg_319_1.var_.characterEffect1052ui_story = var_322_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_7 = 0.2

			if var_322_6 <= arg_319_1.time_ and arg_319_1.time_ < var_322_6 + var_322_7 then
				local var_322_8 = (arg_319_1.time_ - var_322_6) / var_322_7

				if arg_319_1.var_.characterEffect1052ui_story then
					local var_322_9 = Mathf.Lerp(0, 0.5, var_322_8)

					arg_319_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1052ui_story.fillRatio = var_322_9
				end
			end

			if arg_319_1.time_ >= var_322_6 + var_322_7 and arg_319_1.time_ < var_322_6 + var_322_7 + arg_322_0 and arg_319_1.var_.characterEffect1052ui_story then
				local var_322_10 = 0.5

				arg_319_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1052ui_story.fillRatio = var_322_10
			end

			local var_322_11 = 0

			if var_322_11 < arg_319_1.time_ and arg_319_1.time_ <= var_322_11 + arg_322_0 then
				arg_319_1:PlayTimeline("1017ui_story", "StoryTimeline/CharAction/1017/1017action/1017action3_2")
			end

			local var_322_12 = 0
			local var_322_13 = 0.4

			if var_322_12 < arg_319_1.time_ and arg_319_1.time_ <= var_322_12 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_14 = arg_319_1:FormatText(StoryNameCfg[273].name)

				arg_319_1.leftNameTxt_.text = var_322_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_15 = arg_319_1:GetWordFromCfg(115131079)
				local var_322_16 = arg_319_1:FormatText(var_322_15.content)

				arg_319_1.text_.text = var_322_16

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_17 = 16
				local var_322_18 = utf8.len(var_322_16)
				local var_322_19 = var_322_17 <= 0 and var_322_13 or var_322_13 * (var_322_18 / var_322_17)

				if var_322_19 > 0 and var_322_13 < var_322_19 then
					arg_319_1.talkMaxDuration = var_322_19

					if var_322_19 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_19 + var_322_12
					end
				end

				arg_319_1.text_.text = var_322_16
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131079", "story_v_out_115131.awb") ~= 0 then
					local var_322_20 = manager.audio:GetVoiceLength("story_v_out_115131", "115131079", "story_v_out_115131.awb") / 1000

					if var_322_20 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_20 + var_322_12
					end

					if var_322_15.prefab_name ~= "" and arg_319_1.actors_[var_322_15.prefab_name] ~= nil then
						local var_322_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_15.prefab_name].transform, "story_v_out_115131", "115131079", "story_v_out_115131.awb")

						arg_319_1:RecordAudio("115131079", var_322_21)
						arg_319_1:RecordAudio("115131079", var_322_21)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_115131", "115131079", "story_v_out_115131.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_115131", "115131079", "story_v_out_115131.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_22 = math.max(var_322_13, arg_319_1.talkMaxDuration)

			if var_322_12 <= arg_319_1.time_ and arg_319_1.time_ < var_322_12 + var_322_22 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_12) / var_322_22

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_12 + var_322_22 and arg_319_1.time_ < var_322_12 + var_322_22 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play115131080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 115131080
		arg_323_1.duration_ = 5.633

		local var_323_0 = {
			ja = 4.466,
			ko = 5.633,
			zh = 4.533,
			en = 4.5
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
				arg_323_0:Play115131081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_326_1 = arg_323_1.actors_["1017ui_story"]
			local var_326_2 = 0

			if var_326_2 < arg_323_1.time_ and arg_323_1.time_ <= var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1017ui_story == nil then
				arg_323_1.var_.characterEffect1017ui_story = var_326_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_3 = 0.2

			if var_326_2 <= arg_323_1.time_ and arg_323_1.time_ < var_326_2 + var_326_3 then
				local var_326_4 = (arg_323_1.time_ - var_326_2) / var_326_3

				if arg_323_1.var_.characterEffect1017ui_story then
					local var_326_5 = Mathf.Lerp(0, 0.5, var_326_4)

					arg_323_1.var_.characterEffect1017ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1017ui_story.fillRatio = var_326_5
				end
			end

			if arg_323_1.time_ >= var_326_2 + var_326_3 and arg_323_1.time_ < var_326_2 + var_326_3 + arg_326_0 and arg_323_1.var_.characterEffect1017ui_story then
				local var_326_6 = 0.5

				arg_323_1.var_.characterEffect1017ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1017ui_story.fillRatio = var_326_6
			end

			local var_326_7 = arg_323_1.actors_["1052ui_story"]
			local var_326_8 = 0

			if var_326_8 < arg_323_1.time_ and arg_323_1.time_ <= var_326_8 + arg_326_0 and arg_323_1.var_.characterEffect1052ui_story == nil then
				arg_323_1.var_.characterEffect1052ui_story = var_326_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_9 = 0.2

			if var_326_8 <= arg_323_1.time_ and arg_323_1.time_ < var_326_8 + var_326_9 then
				local var_326_10 = (arg_323_1.time_ - var_326_8) / var_326_9

				if arg_323_1.var_.characterEffect1052ui_story then
					arg_323_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_8 + var_326_9 and arg_323_1.time_ < var_326_8 + var_326_9 + arg_326_0 and arg_323_1.var_.characterEffect1052ui_story then
				arg_323_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_326_11 = 0
			local var_326_12 = 0.425

			if var_326_11 < arg_323_1.time_ and arg_323_1.time_ <= var_326_11 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_13 = arg_323_1:FormatText(StoryNameCfg[263].name)

				arg_323_1.leftNameTxt_.text = var_326_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_14 = arg_323_1:GetWordFromCfg(115131080)
				local var_326_15 = arg_323_1:FormatText(var_326_14.content)

				arg_323_1.text_.text = var_326_15

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_16 = 17
				local var_326_17 = utf8.len(var_326_15)
				local var_326_18 = var_326_16 <= 0 and var_326_12 or var_326_12 * (var_326_17 / var_326_16)

				if var_326_18 > 0 and var_326_12 < var_326_18 then
					arg_323_1.talkMaxDuration = var_326_18

					if var_326_18 + var_326_11 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_18 + var_326_11
					end
				end

				arg_323_1.text_.text = var_326_15
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131080", "story_v_out_115131.awb") ~= 0 then
					local var_326_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131080", "story_v_out_115131.awb") / 1000

					if var_326_19 + var_326_11 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_19 + var_326_11
					end

					if var_326_14.prefab_name ~= "" and arg_323_1.actors_[var_326_14.prefab_name] ~= nil then
						local var_326_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_14.prefab_name].transform, "story_v_out_115131", "115131080", "story_v_out_115131.awb")

						arg_323_1:RecordAudio("115131080", var_326_20)
						arg_323_1:RecordAudio("115131080", var_326_20)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_115131", "115131080", "story_v_out_115131.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_115131", "115131080", "story_v_out_115131.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_21 = math.max(var_326_12, arg_323_1.talkMaxDuration)

			if var_326_11 <= arg_323_1.time_ and arg_323_1.time_ < var_326_11 + var_326_21 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_11) / var_326_21

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_11 + var_326_21 and arg_323_1.time_ < var_326_11 + var_326_21 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play115131081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 115131081
		arg_327_1.duration_ = 7.3

		local var_327_0 = {
			ja = 4.333,
			ko = 3.666,
			zh = 2.7,
			en = 7.3
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
				arg_327_0:Play115131082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1052ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1052ui_story == nil then
				arg_327_1.var_.characterEffect1052ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.2

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1052ui_story then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1052ui_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1052ui_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1052ui_story.fillRatio = var_330_5
			end

			local var_330_6 = arg_327_1.actors_["1017ui_story"].transform
			local var_330_7 = 0

			if var_330_7 < arg_327_1.time_ and arg_327_1.time_ <= var_330_7 + arg_330_0 then
				arg_327_1.var_.moveOldPos1017ui_story = var_330_6.localPosition
			end

			local var_330_8 = 0.001

			if var_330_7 <= arg_327_1.time_ and arg_327_1.time_ < var_330_7 + var_330_8 then
				local var_330_9 = (arg_327_1.time_ - var_330_7) / var_330_8
				local var_330_10 = Vector3.New(0, 100, 0)

				var_330_6.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1017ui_story, var_330_10, var_330_9)

				local var_330_11 = manager.ui.mainCamera.transform.position - var_330_6.position

				var_330_6.forward = Vector3.New(var_330_11.x, var_330_11.y, var_330_11.z)

				local var_330_12 = var_330_6.localEulerAngles

				var_330_12.z = 0
				var_330_12.x = 0
				var_330_6.localEulerAngles = var_330_12
			end

			if arg_327_1.time_ >= var_330_7 + var_330_8 and arg_327_1.time_ < var_330_7 + var_330_8 + arg_330_0 then
				var_330_6.localPosition = Vector3.New(0, 100, 0)

				local var_330_13 = manager.ui.mainCamera.transform.position - var_330_6.position

				var_330_6.forward = Vector3.New(var_330_13.x, var_330_13.y, var_330_13.z)

				local var_330_14 = var_330_6.localEulerAngles

				var_330_14.z = 0
				var_330_14.x = 0
				var_330_6.localEulerAngles = var_330_14
			end

			local var_330_15 = arg_327_1.actors_["1024ui_story"].transform
			local var_330_16 = 0

			if var_330_16 < arg_327_1.time_ and arg_327_1.time_ <= var_330_16 + arg_330_0 then
				arg_327_1.var_.moveOldPos1024ui_story = var_330_15.localPosition
			end

			local var_330_17 = 0.001

			if var_330_16 <= arg_327_1.time_ and arg_327_1.time_ < var_330_16 + var_330_17 then
				local var_330_18 = (arg_327_1.time_ - var_330_16) / var_330_17
				local var_330_19 = Vector3.New(0.7, -1, -6.05)

				var_330_15.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1024ui_story, var_330_19, var_330_18)

				local var_330_20 = manager.ui.mainCamera.transform.position - var_330_15.position

				var_330_15.forward = Vector3.New(var_330_20.x, var_330_20.y, var_330_20.z)

				local var_330_21 = var_330_15.localEulerAngles

				var_330_21.z = 0
				var_330_21.x = 0
				var_330_15.localEulerAngles = var_330_21
			end

			if arg_327_1.time_ >= var_330_16 + var_330_17 and arg_327_1.time_ < var_330_16 + var_330_17 + arg_330_0 then
				var_330_15.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_330_22 = manager.ui.mainCamera.transform.position - var_330_15.position

				var_330_15.forward = Vector3.New(var_330_22.x, var_330_22.y, var_330_22.z)

				local var_330_23 = var_330_15.localEulerAngles

				var_330_23.z = 0
				var_330_23.x = 0
				var_330_15.localEulerAngles = var_330_23
			end

			local var_330_24 = 0

			if var_330_24 < arg_327_1.time_ and arg_327_1.time_ <= var_330_24 + arg_330_0 then
				arg_327_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_330_25 = 0

			if var_330_25 < arg_327_1.time_ and arg_327_1.time_ <= var_330_25 + arg_330_0 then
				arg_327_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_330_26 = arg_327_1.actors_["1024ui_story"]
			local var_330_27 = 0

			if var_330_27 < arg_327_1.time_ and arg_327_1.time_ <= var_330_27 + arg_330_0 and arg_327_1.var_.characterEffect1024ui_story == nil then
				arg_327_1.var_.characterEffect1024ui_story = var_330_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_28 = 0.2

			if var_330_27 <= arg_327_1.time_ and arg_327_1.time_ < var_330_27 + var_330_28 then
				local var_330_29 = (arg_327_1.time_ - var_330_27) / var_330_28

				if arg_327_1.var_.characterEffect1024ui_story then
					arg_327_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_27 + var_330_28 and arg_327_1.time_ < var_330_27 + var_330_28 + arg_330_0 and arg_327_1.var_.characterEffect1024ui_story then
				arg_327_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_330_30 = 0
			local var_330_31 = 0.275

			if var_330_30 < arg_327_1.time_ and arg_327_1.time_ <= var_330_30 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_32 = arg_327_1:FormatText(StoryNameCfg[265].name)

				arg_327_1.leftNameTxt_.text = var_330_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_33 = arg_327_1:GetWordFromCfg(115131081)
				local var_330_34 = arg_327_1:FormatText(var_330_33.content)

				arg_327_1.text_.text = var_330_34

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_35 = 11
				local var_330_36 = utf8.len(var_330_34)
				local var_330_37 = var_330_35 <= 0 and var_330_31 or var_330_31 * (var_330_36 / var_330_35)

				if var_330_37 > 0 and var_330_31 < var_330_37 then
					arg_327_1.talkMaxDuration = var_330_37

					if var_330_37 + var_330_30 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_37 + var_330_30
					end
				end

				arg_327_1.text_.text = var_330_34
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131081", "story_v_out_115131.awb") ~= 0 then
					local var_330_38 = manager.audio:GetVoiceLength("story_v_out_115131", "115131081", "story_v_out_115131.awb") / 1000

					if var_330_38 + var_330_30 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_38 + var_330_30
					end

					if var_330_33.prefab_name ~= "" and arg_327_1.actors_[var_330_33.prefab_name] ~= nil then
						local var_330_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_33.prefab_name].transform, "story_v_out_115131", "115131081", "story_v_out_115131.awb")

						arg_327_1:RecordAudio("115131081", var_330_39)
						arg_327_1:RecordAudio("115131081", var_330_39)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_115131", "115131081", "story_v_out_115131.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_115131", "115131081", "story_v_out_115131.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_40 = math.max(var_330_31, arg_327_1.talkMaxDuration)

			if var_330_30 <= arg_327_1.time_ and arg_327_1.time_ < var_330_30 + var_330_40 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_30) / var_330_40

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_30 + var_330_40 and arg_327_1.time_ < var_330_30 + var_330_40 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play115131082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 115131082
		arg_331_1.duration_ = 11.833

		local var_331_0 = {
			ja = 11.833,
			ko = 9.633,
			zh = 9.566,
			en = 8.2
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
				arg_331_0:Play115131083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_334_1 = arg_331_1.actors_["1024ui_story"]
			local var_334_2 = 0

			if var_334_2 < arg_331_1.time_ and arg_331_1.time_ <= var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1024ui_story == nil then
				arg_331_1.var_.characterEffect1024ui_story = var_334_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_3 = 0.2

			if var_334_2 <= arg_331_1.time_ and arg_331_1.time_ < var_334_2 + var_334_3 then
				local var_334_4 = (arg_331_1.time_ - var_334_2) / var_334_3

				if arg_331_1.var_.characterEffect1024ui_story then
					local var_334_5 = Mathf.Lerp(0, 0.5, var_334_4)

					arg_331_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1024ui_story.fillRatio = var_334_5
				end
			end

			if arg_331_1.time_ >= var_334_2 + var_334_3 and arg_331_1.time_ < var_334_2 + var_334_3 + arg_334_0 and arg_331_1.var_.characterEffect1024ui_story then
				local var_334_6 = 0.5

				arg_331_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1024ui_story.fillRatio = var_334_6
			end

			local var_334_7 = arg_331_1.actors_["1052ui_story"]
			local var_334_8 = 0

			if var_334_8 < arg_331_1.time_ and arg_331_1.time_ <= var_334_8 + arg_334_0 and arg_331_1.var_.characterEffect1052ui_story == nil then
				arg_331_1.var_.characterEffect1052ui_story = var_334_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_9 = 0.2

			if var_334_8 <= arg_331_1.time_ and arg_331_1.time_ < var_334_8 + var_334_9 then
				local var_334_10 = (arg_331_1.time_ - var_334_8) / var_334_9

				if arg_331_1.var_.characterEffect1052ui_story then
					arg_331_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_8 + var_334_9 and arg_331_1.time_ < var_334_8 + var_334_9 + arg_334_0 and arg_331_1.var_.characterEffect1052ui_story then
				arg_331_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_334_11 = 0

			if var_334_11 < arg_331_1.time_ and arg_331_1.time_ <= var_334_11 + arg_334_0 then
				arg_331_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_1")
			end

			local var_334_12 = 0
			local var_334_13 = 1.25

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_14 = arg_331_1:FormatText(StoryNameCfg[263].name)

				arg_331_1.leftNameTxt_.text = var_334_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_15 = arg_331_1:GetWordFromCfg(115131082)
				local var_334_16 = arg_331_1:FormatText(var_334_15.content)

				arg_331_1.text_.text = var_334_16

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_17 = 50
				local var_334_18 = utf8.len(var_334_16)
				local var_334_19 = var_334_17 <= 0 and var_334_13 or var_334_13 * (var_334_18 / var_334_17)

				if var_334_19 > 0 and var_334_13 < var_334_19 then
					arg_331_1.talkMaxDuration = var_334_19

					if var_334_19 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_19 + var_334_12
					end
				end

				arg_331_1.text_.text = var_334_16
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131082", "story_v_out_115131.awb") ~= 0 then
					local var_334_20 = manager.audio:GetVoiceLength("story_v_out_115131", "115131082", "story_v_out_115131.awb") / 1000

					if var_334_20 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_20 + var_334_12
					end

					if var_334_15.prefab_name ~= "" and arg_331_1.actors_[var_334_15.prefab_name] ~= nil then
						local var_334_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_15.prefab_name].transform, "story_v_out_115131", "115131082", "story_v_out_115131.awb")

						arg_331_1:RecordAudio("115131082", var_334_21)
						arg_331_1:RecordAudio("115131082", var_334_21)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_115131", "115131082", "story_v_out_115131.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_115131", "115131082", "story_v_out_115131.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_22 = math.max(var_334_13, arg_331_1.talkMaxDuration)

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_22 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_12) / var_334_22

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_12 + var_334_22 and arg_331_1.time_ < var_334_12 + var_334_22 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play115131083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 115131083
		arg_335_1.duration_ = 9.1

		local var_335_0 = {
			ja = 9.1,
			ko = 8.266,
			zh = 5.6,
			en = 6.7
		}
		local var_335_1 = manager.audio:GetLocalizationFlag()

		if var_335_0[var_335_1] ~= nil then
			arg_335_1.duration_ = var_335_0[var_335_1]
		end

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play115131084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1024ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1024ui_story == nil then
				arg_335_1.var_.characterEffect1024ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.2

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1024ui_story then
					arg_335_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1024ui_story then
				arg_335_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_338_4 = arg_335_1.actors_["1052ui_story"]
			local var_338_5 = 0

			if var_338_5 < arg_335_1.time_ and arg_335_1.time_ <= var_338_5 + arg_338_0 and arg_335_1.var_.characterEffect1052ui_story == nil then
				arg_335_1.var_.characterEffect1052ui_story = var_338_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_6 = 0.2

			if var_338_5 <= arg_335_1.time_ and arg_335_1.time_ < var_338_5 + var_338_6 then
				local var_338_7 = (arg_335_1.time_ - var_338_5) / var_338_6

				if arg_335_1.var_.characterEffect1052ui_story then
					local var_338_8 = Mathf.Lerp(0, 0.5, var_338_7)

					arg_335_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1052ui_story.fillRatio = var_338_8
				end
			end

			if arg_335_1.time_ >= var_338_5 + var_338_6 and arg_335_1.time_ < var_338_5 + var_338_6 + arg_338_0 and arg_335_1.var_.characterEffect1052ui_story then
				local var_338_9 = 0.5

				arg_335_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1052ui_story.fillRatio = var_338_9
			end

			local var_338_10 = 0

			if var_338_10 < arg_335_1.time_ and arg_335_1.time_ <= var_338_10 + arg_338_0 then
				arg_335_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_338_11 = 0
			local var_338_12 = 0.6

			if var_338_11 < arg_335_1.time_ and arg_335_1.time_ <= var_338_11 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_13 = arg_335_1:FormatText(StoryNameCfg[265].name)

				arg_335_1.leftNameTxt_.text = var_338_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_14 = arg_335_1:GetWordFromCfg(115131083)
				local var_338_15 = arg_335_1:FormatText(var_338_14.content)

				arg_335_1.text_.text = var_338_15

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_16 = 24
				local var_338_17 = utf8.len(var_338_15)
				local var_338_18 = var_338_16 <= 0 and var_338_12 or var_338_12 * (var_338_17 / var_338_16)

				if var_338_18 > 0 and var_338_12 < var_338_18 then
					arg_335_1.talkMaxDuration = var_338_18

					if var_338_18 + var_338_11 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_18 + var_338_11
					end
				end

				arg_335_1.text_.text = var_338_15
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131083", "story_v_out_115131.awb") ~= 0 then
					local var_338_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131083", "story_v_out_115131.awb") / 1000

					if var_338_19 + var_338_11 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_19 + var_338_11
					end

					if var_338_14.prefab_name ~= "" and arg_335_1.actors_[var_338_14.prefab_name] ~= nil then
						local var_338_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_14.prefab_name].transform, "story_v_out_115131", "115131083", "story_v_out_115131.awb")

						arg_335_1:RecordAudio("115131083", var_338_20)
						arg_335_1:RecordAudio("115131083", var_338_20)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_115131", "115131083", "story_v_out_115131.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_115131", "115131083", "story_v_out_115131.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_21 = math.max(var_338_12, arg_335_1.talkMaxDuration)

			if var_338_11 <= arg_335_1.time_ and arg_335_1.time_ < var_338_11 + var_338_21 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_11) / var_338_21

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_11 + var_338_21 and arg_335_1.time_ < var_338_11 + var_338_21 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play115131084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 115131084
		arg_339_1.duration_ = 8.833

		local var_339_0 = {
			ja = 8.833,
			ko = 5.4,
			zh = 6.4,
			en = 7.7
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
				arg_339_0:Play115131085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_342_1 = arg_339_1.actors_["1024ui_story"]
			local var_342_2 = 0

			if var_342_2 < arg_339_1.time_ and arg_339_1.time_ <= var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect1024ui_story == nil then
				arg_339_1.var_.characterEffect1024ui_story = var_342_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_3 = 0.2

			if var_342_2 <= arg_339_1.time_ and arg_339_1.time_ < var_342_2 + var_342_3 then
				local var_342_4 = (arg_339_1.time_ - var_342_2) / var_342_3

				if arg_339_1.var_.characterEffect1024ui_story then
					local var_342_5 = Mathf.Lerp(0, 0.5, var_342_4)

					arg_339_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1024ui_story.fillRatio = var_342_5
				end
			end

			if arg_339_1.time_ >= var_342_2 + var_342_3 and arg_339_1.time_ < var_342_2 + var_342_3 + arg_342_0 and arg_339_1.var_.characterEffect1024ui_story then
				local var_342_6 = 0.5

				arg_339_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1024ui_story.fillRatio = var_342_6
			end

			local var_342_7 = arg_339_1.actors_["1052ui_story"]
			local var_342_8 = 0

			if var_342_8 < arg_339_1.time_ and arg_339_1.time_ <= var_342_8 + arg_342_0 and arg_339_1.var_.characterEffect1052ui_story == nil then
				arg_339_1.var_.characterEffect1052ui_story = var_342_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_9 = 0.2

			if var_342_8 <= arg_339_1.time_ and arg_339_1.time_ < var_342_8 + var_342_9 then
				local var_342_10 = (arg_339_1.time_ - var_342_8) / var_342_9

				if arg_339_1.var_.characterEffect1052ui_story then
					arg_339_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_8 + var_342_9 and arg_339_1.time_ < var_342_8 + var_342_9 + arg_342_0 and arg_339_1.var_.characterEffect1052ui_story then
				arg_339_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_342_11 = 0
			local var_342_12 = 0.625

			if var_342_11 < arg_339_1.time_ and arg_339_1.time_ <= var_342_11 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_13 = arg_339_1:FormatText(StoryNameCfg[263].name)

				arg_339_1.leftNameTxt_.text = var_342_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_14 = arg_339_1:GetWordFromCfg(115131084)
				local var_342_15 = arg_339_1:FormatText(var_342_14.content)

				arg_339_1.text_.text = var_342_15

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_16 = 25
				local var_342_17 = utf8.len(var_342_15)
				local var_342_18 = var_342_16 <= 0 and var_342_12 or var_342_12 * (var_342_17 / var_342_16)

				if var_342_18 > 0 and var_342_12 < var_342_18 then
					arg_339_1.talkMaxDuration = var_342_18

					if var_342_18 + var_342_11 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_18 + var_342_11
					end
				end

				arg_339_1.text_.text = var_342_15
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131084", "story_v_out_115131.awb") ~= 0 then
					local var_342_19 = manager.audio:GetVoiceLength("story_v_out_115131", "115131084", "story_v_out_115131.awb") / 1000

					if var_342_19 + var_342_11 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_19 + var_342_11
					end

					if var_342_14.prefab_name ~= "" and arg_339_1.actors_[var_342_14.prefab_name] ~= nil then
						local var_342_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_14.prefab_name].transform, "story_v_out_115131", "115131084", "story_v_out_115131.awb")

						arg_339_1:RecordAudio("115131084", var_342_20)
						arg_339_1:RecordAudio("115131084", var_342_20)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_115131", "115131084", "story_v_out_115131.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_115131", "115131084", "story_v_out_115131.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_21 = math.max(var_342_12, arg_339_1.talkMaxDuration)

			if var_342_11 <= arg_339_1.time_ and arg_339_1.time_ < var_342_11 + var_342_21 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_11) / var_342_21

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_11 + var_342_21 and arg_339_1.time_ < var_342_11 + var_342_21 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play115131085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 115131085
		arg_343_1.duration_ = 4.166

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play115131086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1052ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1052ui_story == nil then
				arg_343_1.var_.characterEffect1052ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.2

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1052ui_story then
					local var_346_4 = Mathf.Lerp(0, 0.5, var_346_3)

					arg_343_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1052ui_story.fillRatio = var_346_4
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1052ui_story then
				local var_346_5 = 0.5

				arg_343_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1052ui_story.fillRatio = var_346_5
			end

			local var_346_6 = arg_343_1.actors_["1024ui_story"].transform
			local var_346_7 = 0

			if var_346_7 < arg_343_1.time_ and arg_343_1.time_ <= var_346_7 + arg_346_0 then
				arg_343_1.var_.moveOldPos1024ui_story = var_346_6.localPosition
			end

			local var_346_8 = 0.001

			if var_346_7 <= arg_343_1.time_ and arg_343_1.time_ < var_346_7 + var_346_8 then
				local var_346_9 = (arg_343_1.time_ - var_346_7) / var_346_8
				local var_346_10 = Vector3.New(0, 100, 0)

				var_346_6.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1024ui_story, var_346_10, var_346_9)

				local var_346_11 = manager.ui.mainCamera.transform.position - var_346_6.position

				var_346_6.forward = Vector3.New(var_346_11.x, var_346_11.y, var_346_11.z)

				local var_346_12 = var_346_6.localEulerAngles

				var_346_12.z = 0
				var_346_12.x = 0
				var_346_6.localEulerAngles = var_346_12
			end

			if arg_343_1.time_ >= var_346_7 + var_346_8 and arg_343_1.time_ < var_346_7 + var_346_8 + arg_346_0 then
				var_346_6.localPosition = Vector3.New(0, 100, 0)

				local var_346_13 = manager.ui.mainCamera.transform.position - var_346_6.position

				var_346_6.forward = Vector3.New(var_346_13.x, var_346_13.y, var_346_13.z)

				local var_346_14 = var_346_6.localEulerAngles

				var_346_14.z = 0
				var_346_14.x = 0
				var_346_6.localEulerAngles = var_346_14
			end

			local var_346_15 = arg_343_1.actors_["1052ui_story"].transform
			local var_346_16 = 0

			if var_346_16 < arg_343_1.time_ and arg_343_1.time_ <= var_346_16 + arg_346_0 then
				arg_343_1.var_.moveOldPos1052ui_story = var_346_15.localPosition
			end

			local var_346_17 = 0.001

			if var_346_16 <= arg_343_1.time_ and arg_343_1.time_ < var_346_16 + var_346_17 then
				local var_346_18 = (arg_343_1.time_ - var_346_16) / var_346_17
				local var_346_19 = Vector3.New(0, 100, 0)

				var_346_15.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1052ui_story, var_346_19, var_346_18)

				local var_346_20 = manager.ui.mainCamera.transform.position - var_346_15.position

				var_346_15.forward = Vector3.New(var_346_20.x, var_346_20.y, var_346_20.z)

				local var_346_21 = var_346_15.localEulerAngles

				var_346_21.z = 0
				var_346_21.x = 0
				var_346_15.localEulerAngles = var_346_21
			end

			if arg_343_1.time_ >= var_346_16 + var_346_17 and arg_343_1.time_ < var_346_16 + var_346_17 + arg_346_0 then
				var_346_15.localPosition = Vector3.New(0, 100, 0)

				local var_346_22 = manager.ui.mainCamera.transform.position - var_346_15.position

				var_346_15.forward = Vector3.New(var_346_22.x, var_346_22.y, var_346_22.z)

				local var_346_23 = var_346_15.localEulerAngles

				var_346_23.z = 0
				var_346_23.x = 0
				var_346_15.localEulerAngles = var_346_23
			end

			local var_346_24 = 0
			local var_346_25 = 0.075

			if var_346_24 < arg_343_1.time_ and arg_343_1.time_ <= var_346_24 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_26 = arg_343_1:FormatText(StoryNameCfg[266].name)

				arg_343_1.leftNameTxt_.text = var_346_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, true)
				arg_343_1.iconController_:SetSelectedState("hero")

				arg_343_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1024_1")

				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_27 = arg_343_1:GetWordFromCfg(115131085)
				local var_346_28 = arg_343_1:FormatText(var_346_27.content)

				arg_343_1.text_.text = var_346_28

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_29 = 3
				local var_346_30 = utf8.len(var_346_28)
				local var_346_31 = var_346_29 <= 0 and var_346_25 or var_346_25 * (var_346_30 / var_346_29)

				if var_346_31 > 0 and var_346_25 < var_346_31 then
					arg_343_1.talkMaxDuration = var_346_31

					if var_346_31 + var_346_24 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_31 + var_346_24
					end
				end

				arg_343_1.text_.text = var_346_28
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115131", "115131085", "story_v_out_115131.awb") ~= 0 then
					local var_346_32 = manager.audio:GetVoiceLength("story_v_out_115131", "115131085", "story_v_out_115131.awb") / 1000

					if var_346_32 + var_346_24 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_32 + var_346_24
					end

					if var_346_27.prefab_name ~= "" and arg_343_1.actors_[var_346_27.prefab_name] ~= nil then
						local var_346_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_27.prefab_name].transform, "story_v_out_115131", "115131085", "story_v_out_115131.awb")

						arg_343_1:RecordAudio("115131085", var_346_33)
						arg_343_1:RecordAudio("115131085", var_346_33)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_115131", "115131085", "story_v_out_115131.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_115131", "115131085", "story_v_out_115131.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_34 = math.max(var_346_25, arg_343_1.talkMaxDuration)

			if var_346_24 <= arg_343_1.time_ and arg_343_1.time_ < var_346_24 + var_346_34 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_24) / var_346_34

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_24 + var_346_34 and arg_343_1.time_ < var_346_24 + var_346_34 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play115131086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 115131086
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play115131087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 0.775

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, false)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_2 = arg_347_1:GetWordFromCfg(115131086)
				local var_350_3 = arg_347_1:FormatText(var_350_2.content)

				arg_347_1.text_.text = var_350_3

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_4 = 31
				local var_350_5 = utf8.len(var_350_3)
				local var_350_6 = var_350_4 <= 0 and var_350_1 or var_350_1 * (var_350_5 / var_350_4)

				if var_350_6 > 0 and var_350_1 < var_350_6 then
					arg_347_1.talkMaxDuration = var_350_6

					if var_350_6 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_6 + var_350_0
					end
				end

				arg_347_1.text_.text = var_350_3
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_7 = math.max(var_350_1, arg_347_1.talkMaxDuration)

			if var_350_0 <= arg_347_1.time_ and arg_347_1.time_ < var_350_0 + var_350_7 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_0) / var_350_7

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_0 + var_350_7 and arg_347_1.time_ < var_350_0 + var_350_7 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play115131087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 115131087
		arg_351_1.duration_ = 7

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
			arg_351_1.auto_ = false
		end

		function arg_351_1.playNext_(arg_353_0)
			arg_351_1.onStoryFinished_()
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.mask_.enabled = true
				arg_351_1.mask_.raycastTarget = false

				arg_351_1:SetGaussion(false)
			end

			local var_354_1 = 2

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_1 then
				local var_354_2 = (arg_351_1.time_ - var_354_0) / var_354_1
				local var_354_3 = Color.New(1, 1, 1)

				var_354_3.a = Mathf.Lerp(1, 0, var_354_2)
				arg_351_1.mask_.color = var_354_3
			end

			if arg_351_1.time_ >= var_354_0 + var_354_1 and arg_351_1.time_ < var_354_0 + var_354_1 + arg_354_0 then
				local var_354_4 = Color.New(1, 1, 1)
				local var_354_5 = 0

				arg_351_1.mask_.enabled = false
				var_354_4.a = var_354_5
				arg_351_1.mask_.color = var_354_4
			end

			if arg_351_1.frameCnt_ <= 1 then
				arg_351_1.dialog_:SetActive(false)
			end

			local var_354_6 = 2
			local var_354_7 = 0.85

			if var_354_6 < arg_351_1.time_ and arg_351_1.time_ <= var_354_6 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0

				arg_351_1.dialog_:SetActive(true)

				local var_354_8 = LeanTween.value(arg_351_1.dialog_, 0, 1, 0.3)

				var_354_8:setOnUpdate(LuaHelper.FloatAction(function(arg_355_0)
					arg_351_1.dialogCg_.alpha = arg_355_0
				end))
				var_354_8:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_351_1.dialog_)
					var_354_8:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_351_1.duration_ = arg_351_1.duration_ + 0.3

				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_9 = arg_351_1:GetWordFromCfg(115131087)
				local var_354_10 = arg_351_1:FormatText(var_354_9.content)

				arg_351_1.text_.text = var_354_10

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_11 = 34
				local var_354_12 = utf8.len(var_354_10)
				local var_354_13 = var_354_11 <= 0 and var_354_7 or var_354_7 * (var_354_12 / var_354_11)

				if var_354_13 > 0 and var_354_7 < var_354_13 then
					arg_351_1.talkMaxDuration = var_354_13
					var_354_6 = var_354_6 + 0.3

					if var_354_13 + var_354_6 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_13 + var_354_6
					end
				end

				arg_351_1.text_.text = var_354_10
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_14 = var_354_6 + 0.3
			local var_354_15 = math.max(var_354_7, arg_351_1.talkMaxDuration)

			if var_354_14 <= arg_351_1.time_ and arg_351_1.time_ < var_354_14 + var_354_15 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_14) / var_354_15

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_14 + var_354_15 and arg_351_1.time_ < var_354_14 + var_354_15 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/G03a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/RO0201"
	},
	voices = {
		"story_v_out_115131.awb"
	}
}
