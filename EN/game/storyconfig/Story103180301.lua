return {
	Play318031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 318031001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play318031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K01f"

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
				local var_4_5 = arg_1_1.bgs_.K01f

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
					if iter_4_0 ~= "K01f" then
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

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_4_story_forest", "bgm_activity_2_4_story_forest", "bgm_activity_2_4_story_forest.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1

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

				local var_4_33 = arg_1_1:GetWordFromCfg(318031001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 40
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
	Play318031002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 318031002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play318031003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.025

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

				local var_10_2 = arg_7_1:GetWordFromCfg(318031002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 41
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
	Play318031003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 318031003
		arg_11_1.duration_ = 2.766

		local var_11_0 = {
			zh = 2.766,
			ja = 1.999999999999
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
				arg_11_0:Play318031004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10053ui_story"

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

			local var_14_4 = arg_11_1.actors_["10053ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos10053ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -1.12, -5.99)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10053ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -1.12, -5.99)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["10053ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect10053ui_story == nil then
				arg_11_1.var_.characterEffect10053ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect10053ui_story then
					arg_11_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect10053ui_story then
				arg_11_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_14_19 = 0
			local var_14_20 = 0.1

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[477].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(318031003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031003", "story_v_out_318031.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_318031", "318031003", "story_v_out_318031.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_318031", "318031003", "story_v_out_318031.awb")

						arg_11_1:RecordAudio("318031003", var_14_28)
						arg_11_1:RecordAudio("318031003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_318031", "318031003", "story_v_out_318031.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_318031", "318031003", "story_v_out_318031.awb")
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
	Play318031004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 318031004
		arg_15_1.duration_ = 1.999999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play318031005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1049ui_story"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("Char/" .. var_18_0), arg_15_1.stage_.transform)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_0] = var_18_1

				local var_18_2 = var_18_1:GetComponentInChildren(typeof(CharacterEffect))

				var_18_2.enabled = true

				local var_18_3 = GameObjectTools.GetOrAddComponent(var_18_1, typeof(DynamicBoneHelper))

				if var_18_3 then
					var_18_3:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_2.transform, false)

				arg_15_1.var_[var_18_0 .. "Animator"] = var_18_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_0 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_0 .. "LipSync"] = var_18_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_4 = arg_15_1.actors_["1049ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1049ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0.7, -1.2, -6)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1049ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = arg_15_1.actors_["1049ui_story"]
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 and arg_15_1.var_.characterEffect1049ui_story == nil then
				arg_15_1.var_.characterEffect1049ui_story = var_18_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_15 = 0.200000002980232

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15

				if arg_15_1.var_.characterEffect1049ui_story then
					arg_15_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 and arg_15_1.var_.characterEffect1049ui_story then
				arg_15_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_18_19 = arg_15_1.actors_["10053ui_story"].transform
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.var_.moveOldPos10053ui_story = var_18_19.localPosition
			end

			local var_18_21 = 0.001

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21
				local var_18_23 = Vector3.New(-0.7, -1.12, -5.99)

				var_18_19.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10053ui_story, var_18_23, var_18_22)

				local var_18_24 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_24.x, var_18_24.y, var_18_24.z)

				local var_18_25 = var_18_19.localEulerAngles

				var_18_25.z = 0
				var_18_25.x = 0
				var_18_19.localEulerAngles = var_18_25
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 then
				var_18_19.localPosition = Vector3.New(-0.7, -1.12, -5.99)

				local var_18_26 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_26.x, var_18_26.y, var_18_26.z)

				local var_18_27 = var_18_19.localEulerAngles

				var_18_27.z = 0
				var_18_27.x = 0
				var_18_19.localEulerAngles = var_18_27
			end

			local var_18_28 = arg_15_1.actors_["10053ui_story"]
			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 and arg_15_1.var_.characterEffect10053ui_story == nil then
				arg_15_1.var_.characterEffect10053ui_story = var_18_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_30 = 0.200000002980232

			if var_18_29 <= arg_15_1.time_ and arg_15_1.time_ < var_18_29 + var_18_30 then
				local var_18_31 = (arg_15_1.time_ - var_18_29) / var_18_30

				if arg_15_1.var_.characterEffect10053ui_story then
					local var_18_32 = Mathf.Lerp(0, 0.5, var_18_31)

					arg_15_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_15_1.var_.characterEffect10053ui_story.fillRatio = var_18_32
				end
			end

			if arg_15_1.time_ >= var_18_29 + var_18_30 and arg_15_1.time_ < var_18_29 + var_18_30 + arg_18_0 and arg_15_1.var_.characterEffect10053ui_story then
				local var_18_33 = 0.5

				arg_15_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_15_1.var_.characterEffect10053ui_story.fillRatio = var_18_33
			end

			local var_18_34 = 0
			local var_18_35 = 0.075

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_36 = arg_15_1:FormatText(StoryNameCfg[562].name)

				arg_15_1.leftNameTxt_.text = var_18_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_37 = arg_15_1:GetWordFromCfg(318031004)
				local var_18_38 = arg_15_1:FormatText(var_18_37.content)

				arg_15_1.text_.text = var_18_38

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_39 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031004", "story_v_out_318031.awb") ~= 0 then
					local var_18_42 = manager.audio:GetVoiceLength("story_v_out_318031", "318031004", "story_v_out_318031.awb") / 1000

					if var_18_42 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_34
					end

					if var_18_37.prefab_name ~= "" and arg_15_1.actors_[var_18_37.prefab_name] ~= nil then
						local var_18_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_37.prefab_name].transform, "story_v_out_318031", "318031004", "story_v_out_318031.awb")

						arg_15_1:RecordAudio("318031004", var_18_43)
						arg_15_1:RecordAudio("318031004", var_18_43)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_318031", "318031004", "story_v_out_318031.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_318031", "318031004", "story_v_out_318031.awb")
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
	Play318031005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 318031005
		arg_19_1.duration_ = 3.533

		local var_19_0 = {
			zh = 3.533,
			ja = 2.533
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
				arg_19_0:Play318031006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10053ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10053ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(-0.7, -1.12, -5.99)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10053ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(-0.7, -1.12, -5.99)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["10053ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect10053ui_story == nil then
				arg_19_1.var_.characterEffect10053ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect10053ui_story then
					arg_19_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect10053ui_story then
				arg_19_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_15 = arg_19_1.actors_["1049ui_story"]
			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 and arg_19_1.var_.characterEffect1049ui_story == nil then
				arg_19_1.var_.characterEffect1049ui_story = var_22_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_17 = 0.200000002980232

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17

				if arg_19_1.var_.characterEffect1049ui_story then
					local var_22_19 = Mathf.Lerp(0, 0.5, var_22_18)

					arg_19_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1049ui_story.fillRatio = var_22_19
				end
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 and arg_19_1.var_.characterEffect1049ui_story then
				local var_22_20 = 0.5

				arg_19_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1049ui_story.fillRatio = var_22_20
			end

			local var_22_21 = 0
			local var_22_22 = 0.3

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_23 = arg_19_1:FormatText(StoryNameCfg[477].name)

				arg_19_1.leftNameTxt_.text = var_22_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_24 = arg_19_1:GetWordFromCfg(318031005)
				local var_22_25 = arg_19_1:FormatText(var_22_24.content)

				arg_19_1.text_.text = var_22_25

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_26 = 12
				local var_22_27 = utf8.len(var_22_25)
				local var_22_28 = var_22_26 <= 0 and var_22_22 or var_22_22 * (var_22_27 / var_22_26)

				if var_22_28 > 0 and var_22_22 < var_22_28 then
					arg_19_1.talkMaxDuration = var_22_28

					if var_22_28 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_28 + var_22_21
					end
				end

				arg_19_1.text_.text = var_22_25
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031005", "story_v_out_318031.awb") ~= 0 then
					local var_22_29 = manager.audio:GetVoiceLength("story_v_out_318031", "318031005", "story_v_out_318031.awb") / 1000

					if var_22_29 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_29 + var_22_21
					end

					if var_22_24.prefab_name ~= "" and arg_19_1.actors_[var_22_24.prefab_name] ~= nil then
						local var_22_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_24.prefab_name].transform, "story_v_out_318031", "318031005", "story_v_out_318031.awb")

						arg_19_1:RecordAudio("318031005", var_22_30)
						arg_19_1:RecordAudio("318031005", var_22_30)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_318031", "318031005", "story_v_out_318031.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_318031", "318031005", "story_v_out_318031.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_31 = math.max(var_22_22, arg_19_1.talkMaxDuration)

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_31 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_21) / var_22_31

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_21 + var_22_31 and arg_19_1.time_ < var_22_21 + var_22_31 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play318031006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 318031006
		arg_23_1.duration_ = 7.1

		local var_23_0 = {
			zh = 4.6,
			ja = 7.1
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
				arg_23_0:Play318031007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1049ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1049ui_story == nil then
				arg_23_1.var_.characterEffect1049ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1049ui_story then
					arg_23_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1049ui_story then
				arg_23_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_6 = arg_23_1.actors_["10053ui_story"]
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 and arg_23_1.var_.characterEffect10053ui_story == nil then
				arg_23_1.var_.characterEffect10053ui_story = var_26_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_8 = 0.200000002980232

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_8 then
				local var_26_9 = (arg_23_1.time_ - var_26_7) / var_26_8

				if arg_23_1.var_.characterEffect10053ui_story then
					local var_26_10 = Mathf.Lerp(0, 0.5, var_26_9)

					arg_23_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10053ui_story.fillRatio = var_26_10
				end
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 and arg_23_1.var_.characterEffect10053ui_story then
				local var_26_11 = 0.5

				arg_23_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10053ui_story.fillRatio = var_26_11
			end

			local var_26_12 = 0
			local var_26_13 = 0.525

			if var_26_12 < arg_23_1.time_ and arg_23_1.time_ <= var_26_12 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_14 = arg_23_1:FormatText(StoryNameCfg[562].name)

				arg_23_1.leftNameTxt_.text = var_26_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_15 = arg_23_1:GetWordFromCfg(318031006)
				local var_26_16 = arg_23_1:FormatText(var_26_15.content)

				arg_23_1.text_.text = var_26_16

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_17 = 21
				local var_26_18 = utf8.len(var_26_16)
				local var_26_19 = var_26_17 <= 0 and var_26_13 or var_26_13 * (var_26_18 / var_26_17)

				if var_26_19 > 0 and var_26_13 < var_26_19 then
					arg_23_1.talkMaxDuration = var_26_19

					if var_26_19 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_12
					end
				end

				arg_23_1.text_.text = var_26_16
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031006", "story_v_out_318031.awb") ~= 0 then
					local var_26_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031006", "story_v_out_318031.awb") / 1000

					if var_26_20 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_12
					end

					if var_26_15.prefab_name ~= "" and arg_23_1.actors_[var_26_15.prefab_name] ~= nil then
						local var_26_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_15.prefab_name].transform, "story_v_out_318031", "318031006", "story_v_out_318031.awb")

						arg_23_1:RecordAudio("318031006", var_26_21)
						arg_23_1:RecordAudio("318031006", var_26_21)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_318031", "318031006", "story_v_out_318031.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_318031", "318031006", "story_v_out_318031.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_13, arg_23_1.talkMaxDuration)

			if var_26_12 <= arg_23_1.time_ and arg_23_1.time_ < var_26_12 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_12) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_12 + var_26_22 and arg_23_1.time_ < var_26_12 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play318031007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 318031007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play318031008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1049ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1049ui_story == nil then
				arg_27_1.var_.characterEffect1049ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1049ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1049ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1049ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1049ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 1.05

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(318031007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 42
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play318031008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 318031008
		arg_31_1.duration_ = 3.633

		local var_31_0 = {
			zh = 2.5,
			ja = 3.633
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
				arg_31_0:Play318031009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10053ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10053ui_story == nil then
				arg_31_1.var_.characterEffect10053ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10053ui_story then
					arg_31_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10053ui_story then
				arg_31_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_34_4 = 0
			local var_34_5 = 0.275

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_6 = arg_31_1:FormatText(StoryNameCfg[477].name)

				arg_31_1.leftNameTxt_.text = var_34_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_7 = arg_31_1:GetWordFromCfg(318031008)
				local var_34_8 = arg_31_1:FormatText(var_34_7.content)

				arg_31_1.text_.text = var_34_8

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_9 = 11
				local var_34_10 = utf8.len(var_34_8)
				local var_34_11 = var_34_9 <= 0 and var_34_5 or var_34_5 * (var_34_10 / var_34_9)

				if var_34_11 > 0 and var_34_5 < var_34_11 then
					arg_31_1.talkMaxDuration = var_34_11

					if var_34_11 + var_34_4 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_11 + var_34_4
					end
				end

				arg_31_1.text_.text = var_34_8
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031008", "story_v_out_318031.awb") ~= 0 then
					local var_34_12 = manager.audio:GetVoiceLength("story_v_out_318031", "318031008", "story_v_out_318031.awb") / 1000

					if var_34_12 + var_34_4 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_4
					end

					if var_34_7.prefab_name ~= "" and arg_31_1.actors_[var_34_7.prefab_name] ~= nil then
						local var_34_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_7.prefab_name].transform, "story_v_out_318031", "318031008", "story_v_out_318031.awb")

						arg_31_1:RecordAudio("318031008", var_34_13)
						arg_31_1:RecordAudio("318031008", var_34_13)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_318031", "318031008", "story_v_out_318031.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_318031", "318031008", "story_v_out_318031.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_14 = math.max(var_34_5, arg_31_1.talkMaxDuration)

			if var_34_4 <= arg_31_1.time_ and arg_31_1.time_ < var_34_4 + var_34_14 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_4) / var_34_14

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_4 + var_34_14 and arg_31_1.time_ < var_34_4 + var_34_14 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play318031009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 318031009
		arg_35_1.duration_ = 7.5

		local var_35_0 = {
			zh = 4.333,
			ja = 7.5
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
				arg_35_0:Play318031010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1049ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1049ui_story == nil then
				arg_35_1.var_.characterEffect1049ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1049ui_story then
					arg_35_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1049ui_story then
				arg_35_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_38_5 = arg_35_1.actors_["10053ui_story"]
			local var_38_6 = 0

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect10053ui_story == nil then
				arg_35_1.var_.characterEffect10053ui_story = var_38_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_7 = 0.200000002980232

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_7 then
				local var_38_8 = (arg_35_1.time_ - var_38_6) / var_38_7

				if arg_35_1.var_.characterEffect10053ui_story then
					local var_38_9 = Mathf.Lerp(0, 0.5, var_38_8)

					arg_35_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_35_1.var_.characterEffect10053ui_story.fillRatio = var_38_9
				end
			end

			if arg_35_1.time_ >= var_38_6 + var_38_7 and arg_35_1.time_ < var_38_6 + var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect10053ui_story then
				local var_38_10 = 0.5

				arg_35_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_35_1.var_.characterEffect10053ui_story.fillRatio = var_38_10
			end

			local var_38_11 = 0
			local var_38_12 = 0.425

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_13 = arg_35_1:FormatText(StoryNameCfg[562].name)

				arg_35_1.leftNameTxt_.text = var_38_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_14 = arg_35_1:GetWordFromCfg(318031009)
				local var_38_15 = arg_35_1:FormatText(var_38_14.content)

				arg_35_1.text_.text = var_38_15

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_16 = 17
				local var_38_17 = utf8.len(var_38_15)
				local var_38_18 = var_38_16 <= 0 and var_38_12 or var_38_12 * (var_38_17 / var_38_16)

				if var_38_18 > 0 and var_38_12 < var_38_18 then
					arg_35_1.talkMaxDuration = var_38_18

					if var_38_18 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_11
					end
				end

				arg_35_1.text_.text = var_38_15
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031009", "story_v_out_318031.awb") ~= 0 then
					local var_38_19 = manager.audio:GetVoiceLength("story_v_out_318031", "318031009", "story_v_out_318031.awb") / 1000

					if var_38_19 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_11
					end

					if var_38_14.prefab_name ~= "" and arg_35_1.actors_[var_38_14.prefab_name] ~= nil then
						local var_38_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_14.prefab_name].transform, "story_v_out_318031", "318031009", "story_v_out_318031.awb")

						arg_35_1:RecordAudio("318031009", var_38_20)
						arg_35_1:RecordAudio("318031009", var_38_20)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_318031", "318031009", "story_v_out_318031.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_318031", "318031009", "story_v_out_318031.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_21 = math.max(var_38_12, arg_35_1.talkMaxDuration)

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_21 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_11) / var_38_21

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_11 + var_38_21 and arg_35_1.time_ < var_38_11 + var_38_21 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play318031010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 318031010
		arg_39_1.duration_ = 8.966

		local var_39_0 = {
			zh = 8.633,
			ja = 8.966
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
				arg_39_0:Play318031011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10053ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10053ui_story == nil then
				arg_39_1.var_.characterEffect10053ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10053ui_story then
					arg_39_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10053ui_story then
				arg_39_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action30_1")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_42_6 = arg_39_1.actors_["1049ui_story"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect1049ui_story == nil then
				arg_39_1.var_.characterEffect1049ui_story = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.200000002980232

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect1049ui_story then
					local var_42_10 = Mathf.Lerp(0, 0.5, var_42_9)

					arg_39_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1049ui_story.fillRatio = var_42_10
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect1049ui_story then
				local var_42_11 = 0.5

				arg_39_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1049ui_story.fillRatio = var_42_11
			end

			local var_42_12 = 0
			local var_42_13 = 0.525

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[477].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(318031010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031010", "story_v_out_318031.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031010", "story_v_out_318031.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_318031", "318031010", "story_v_out_318031.awb")

						arg_39_1:RecordAudio("318031010", var_42_21)
						arg_39_1:RecordAudio("318031010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_318031", "318031010", "story_v_out_318031.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_318031", "318031010", "story_v_out_318031.awb")
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
	Play318031011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 318031011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play318031012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10053ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect10053ui_story == nil then
				arg_43_1.var_.characterEffect10053ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect10053ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10053ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect10053ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10053ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 1.25

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

				local var_46_8 = arg_43_1:GetWordFromCfg(318031011)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 50
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
	Play318031012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 318031012
		arg_47_1.duration_ = 7.533

		local var_47_0 = {
			zh = 7.533,
			ja = 7.466
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
				arg_47_0:Play318031013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1049ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1049ui_story == nil then
				arg_47_1.var_.characterEffect1049ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1049ui_story then
					arg_47_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1049ui_story then
				arg_47_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_1")
			end

			local var_50_5 = 0
			local var_50_6 = 0.7

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_7 = arg_47_1:FormatText(StoryNameCfg[562].name)

				arg_47_1.leftNameTxt_.text = var_50_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_8 = arg_47_1:GetWordFromCfg(318031012)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031012", "story_v_out_318031.awb") ~= 0 then
					local var_50_13 = manager.audio:GetVoiceLength("story_v_out_318031", "318031012", "story_v_out_318031.awb") / 1000

					if var_50_13 + var_50_5 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_5
					end

					if var_50_8.prefab_name ~= "" and arg_47_1.actors_[var_50_8.prefab_name] ~= nil then
						local var_50_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_8.prefab_name].transform, "story_v_out_318031", "318031012", "story_v_out_318031.awb")

						arg_47_1:RecordAudio("318031012", var_50_14)
						arg_47_1:RecordAudio("318031012", var_50_14)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_318031", "318031012", "story_v_out_318031.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_318031", "318031012", "story_v_out_318031.awb")
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
	Play318031013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 318031013
		arg_51_1.duration_ = 11.2

		local var_51_0 = {
			zh = 8.3,
			ja = 11.2
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
				arg_51_0:Play318031014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.925

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[562].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(318031013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031013", "story_v_out_318031.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031013", "story_v_out_318031.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_318031", "318031013", "story_v_out_318031.awb")

						arg_51_1:RecordAudio("318031013", var_54_9)
						arg_51_1:RecordAudio("318031013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_318031", "318031013", "story_v_out_318031.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_318031", "318031013", "story_v_out_318031.awb")
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
	Play318031014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 318031014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play318031015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1049ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1049ui_story == nil then
				arg_55_1.var_.characterEffect1049ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1049ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1049ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1049ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1049ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 1.1

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_8 = arg_55_1:GetWordFromCfg(318031014)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 44
				local var_58_11 = utf8.len(var_58_9)
				local var_58_12 = var_58_10 <= 0 and var_58_7 or var_58_7 * (var_58_11 / var_58_10)

				if var_58_12 > 0 and var_58_7 < var_58_12 then
					arg_55_1.talkMaxDuration = var_58_12

					if var_58_12 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_9
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_13 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_13 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_13

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_13 and arg_55_1.time_ < var_58_6 + var_58_13 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play318031015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 318031015
		arg_59_1.duration_ = 5.966

		local var_59_0 = {
			zh = 5.066,
			ja = 5.966
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
				arg_59_0:Play318031016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10053ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect10053ui_story == nil then
				arg_59_1.var_.characterEffect10053ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect10053ui_story then
					arg_59_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect10053ui_story then
				arg_59_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_62_4 = 0

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053actionlink/10053action43024")
			end

			local var_62_5 = 0
			local var_62_6 = 0.4

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_7 = arg_59_1:FormatText(StoryNameCfg[477].name)

				arg_59_1.leftNameTxt_.text = var_62_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_8 = arg_59_1:GetWordFromCfg(318031015)
				local var_62_9 = arg_59_1:FormatText(var_62_8.content)

				arg_59_1.text_.text = var_62_9

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_10 = 16
				local var_62_11 = utf8.len(var_62_9)
				local var_62_12 = var_62_10 <= 0 and var_62_6 or var_62_6 * (var_62_11 / var_62_10)

				if var_62_12 > 0 and var_62_6 < var_62_12 then
					arg_59_1.talkMaxDuration = var_62_12

					if var_62_12 + var_62_5 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_12 + var_62_5
					end
				end

				arg_59_1.text_.text = var_62_9
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031015", "story_v_out_318031.awb") ~= 0 then
					local var_62_13 = manager.audio:GetVoiceLength("story_v_out_318031", "318031015", "story_v_out_318031.awb") / 1000

					if var_62_13 + var_62_5 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_5
					end

					if var_62_8.prefab_name ~= "" and arg_59_1.actors_[var_62_8.prefab_name] ~= nil then
						local var_62_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_8.prefab_name].transform, "story_v_out_318031", "318031015", "story_v_out_318031.awb")

						arg_59_1:RecordAudio("318031015", var_62_14)
						arg_59_1:RecordAudio("318031015", var_62_14)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_318031", "318031015", "story_v_out_318031.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_318031", "318031015", "story_v_out_318031.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_15 = math.max(var_62_6, arg_59_1.talkMaxDuration)

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_15 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_5) / var_62_15

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_5 + var_62_15 and arg_59_1.time_ < var_62_5 + var_62_15 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play318031016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 318031016
		arg_63_1.duration_ = 10.3

		local var_63_0 = {
			zh = 10.3,
			ja = 8.366
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
				arg_63_0:Play318031017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10053ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos10053ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(-0.7, -1.12, -5.99)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10053ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(-0.7, -1.12, -5.99)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = 0
			local var_66_10 = 0.925

			if var_66_9 < arg_63_1.time_ and arg_63_1.time_ <= var_66_9 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_11 = arg_63_1:FormatText(StoryNameCfg[477].name)

				arg_63_1.leftNameTxt_.text = var_66_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_12 = arg_63_1:GetWordFromCfg(318031016)
				local var_66_13 = arg_63_1:FormatText(var_66_12.content)

				arg_63_1.text_.text = var_66_13

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_14 = 37
				local var_66_15 = utf8.len(var_66_13)
				local var_66_16 = var_66_14 <= 0 and var_66_10 or var_66_10 * (var_66_15 / var_66_14)

				if var_66_16 > 0 and var_66_10 < var_66_16 then
					arg_63_1.talkMaxDuration = var_66_16

					if var_66_16 + var_66_9 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_16 + var_66_9
					end
				end

				arg_63_1.text_.text = var_66_13
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031016", "story_v_out_318031.awb") ~= 0 then
					local var_66_17 = manager.audio:GetVoiceLength("story_v_out_318031", "318031016", "story_v_out_318031.awb") / 1000

					if var_66_17 + var_66_9 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_17 + var_66_9
					end

					if var_66_12.prefab_name ~= "" and arg_63_1.actors_[var_66_12.prefab_name] ~= nil then
						local var_66_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_12.prefab_name].transform, "story_v_out_318031", "318031016", "story_v_out_318031.awb")

						arg_63_1:RecordAudio("318031016", var_66_18)
						arg_63_1:RecordAudio("318031016", var_66_18)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_318031", "318031016", "story_v_out_318031.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_318031", "318031016", "story_v_out_318031.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_19 = math.max(var_66_10, arg_63_1.talkMaxDuration)

			if var_66_9 <= arg_63_1.time_ and arg_63_1.time_ < var_66_9 + var_66_19 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_9) / var_66_19

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_9 + var_66_19 and arg_63_1.time_ < var_66_9 + var_66_19 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play318031017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 318031017
		arg_67_1.duration_ = 12.3

		local var_67_0 = {
			zh = 7.133,
			ja = 12.3
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
				arg_67_0:Play318031018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10053ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos10053ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(-0.7, -1.12, -5.99)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10053ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-0.7, -1.12, -5.99)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = 0
			local var_70_10 = 0.65

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_11 = arg_67_1:FormatText(StoryNameCfg[477].name)

				arg_67_1.leftNameTxt_.text = var_70_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_12 = arg_67_1:GetWordFromCfg(318031017)
				local var_70_13 = arg_67_1:FormatText(var_70_12.content)

				arg_67_1.text_.text = var_70_13

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_14 = 26
				local var_70_15 = utf8.len(var_70_13)
				local var_70_16 = var_70_14 <= 0 and var_70_10 or var_70_10 * (var_70_15 / var_70_14)

				if var_70_16 > 0 and var_70_10 < var_70_16 then
					arg_67_1.talkMaxDuration = var_70_16

					if var_70_16 + var_70_9 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_16 + var_70_9
					end
				end

				arg_67_1.text_.text = var_70_13
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031017", "story_v_out_318031.awb") ~= 0 then
					local var_70_17 = manager.audio:GetVoiceLength("story_v_out_318031", "318031017", "story_v_out_318031.awb") / 1000

					if var_70_17 + var_70_9 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_17 + var_70_9
					end

					if var_70_12.prefab_name ~= "" and arg_67_1.actors_[var_70_12.prefab_name] ~= nil then
						local var_70_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_12.prefab_name].transform, "story_v_out_318031", "318031017", "story_v_out_318031.awb")

						arg_67_1:RecordAudio("318031017", var_70_18)
						arg_67_1:RecordAudio("318031017", var_70_18)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_318031", "318031017", "story_v_out_318031.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_318031", "318031017", "story_v_out_318031.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_19 = math.max(var_70_10, arg_67_1.talkMaxDuration)

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_19 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_9) / var_70_19

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_9 + var_70_19 and arg_67_1.time_ < var_70_9 + var_70_19 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play318031018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 318031018
		arg_71_1.duration_ = 3.5

		local var_71_0 = {
			zh = 1.366,
			ja = 3.5
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
				arg_71_0:Play318031019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1049ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1049ui_story == nil then
				arg_71_1.var_.characterEffect1049ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1049ui_story then
					arg_71_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1049ui_story then
				arg_71_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_74_4 = arg_71_1.actors_["10053ui_story"]
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 and arg_71_1.var_.characterEffect10053ui_story == nil then
				arg_71_1.var_.characterEffect10053ui_story = var_74_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_6 = 0.200000002980232

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6

				if arg_71_1.var_.characterEffect10053ui_story then
					local var_74_8 = Mathf.Lerp(0, 0.5, var_74_7)

					arg_71_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_71_1.var_.characterEffect10053ui_story.fillRatio = var_74_8
				end
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 and arg_71_1.var_.characterEffect10053ui_story then
				local var_74_9 = 0.5

				arg_71_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_71_1.var_.characterEffect10053ui_story.fillRatio = var_74_9
			end

			local var_74_10 = 0
			local var_74_11 = 0.175

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_12 = arg_71_1:FormatText(StoryNameCfg[562].name)

				arg_71_1.leftNameTxt_.text = var_74_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_13 = arg_71_1:GetWordFromCfg(318031018)
				local var_74_14 = arg_71_1:FormatText(var_74_13.content)

				arg_71_1.text_.text = var_74_14

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_15 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031018", "story_v_out_318031.awb") ~= 0 then
					local var_74_18 = manager.audio:GetVoiceLength("story_v_out_318031", "318031018", "story_v_out_318031.awb") / 1000

					if var_74_18 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_10
					end

					if var_74_13.prefab_name ~= "" and arg_71_1.actors_[var_74_13.prefab_name] ~= nil then
						local var_74_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_13.prefab_name].transform, "story_v_out_318031", "318031018", "story_v_out_318031.awb")

						arg_71_1:RecordAudio("318031018", var_74_19)
						arg_71_1:RecordAudio("318031018", var_74_19)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_318031", "318031018", "story_v_out_318031.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_318031", "318031018", "story_v_out_318031.awb")
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
	Play318031019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 318031019
		arg_75_1.duration_ = 9.9

		local var_75_0 = {
			zh = 7.866,
			ja = 9.9
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
				arg_75_0:Play318031020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.725

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[562].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(318031019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 29
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031019", "story_v_out_318031.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031019", "story_v_out_318031.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_318031", "318031019", "story_v_out_318031.awb")

						arg_75_1:RecordAudio("318031019", var_78_9)
						arg_75_1:RecordAudio("318031019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_318031", "318031019", "story_v_out_318031.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_318031", "318031019", "story_v_out_318031.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play318031020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 318031020
		arg_79_1.duration_ = 4.166

		local var_79_0 = {
			zh = 4.166,
			ja = 2.133
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
				arg_79_0:Play318031021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10053ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect10053ui_story == nil then
				arg_79_1.var_.characterEffect10053ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect10053ui_story then
					arg_79_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect10053ui_story then
				arg_79_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053actionlink/10053action42415")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_6 = arg_79_1.actors_["1049ui_story"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.characterEffect1049ui_story == nil then
				arg_79_1.var_.characterEffect1049ui_story = var_82_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_8 = 0.200000002980232

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.characterEffect1049ui_story then
					local var_82_10 = Mathf.Lerp(0, 0.5, var_82_9)

					arg_79_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1049ui_story.fillRatio = var_82_10
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.characterEffect1049ui_story then
				local var_82_11 = 0.5

				arg_79_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1049ui_story.fillRatio = var_82_11
			end

			local var_82_12 = 0
			local var_82_13 = 0.425

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_14 = arg_79_1:FormatText(StoryNameCfg[477].name)

				arg_79_1.leftNameTxt_.text = var_82_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_15 = arg_79_1:GetWordFromCfg(318031020)
				local var_82_16 = arg_79_1:FormatText(var_82_15.content)

				arg_79_1.text_.text = var_82_16

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_17 = 17
				local var_82_18 = utf8.len(var_82_16)
				local var_82_19 = var_82_17 <= 0 and var_82_13 or var_82_13 * (var_82_18 / var_82_17)

				if var_82_19 > 0 and var_82_13 < var_82_19 then
					arg_79_1.talkMaxDuration = var_82_19

					if var_82_19 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_19 + var_82_12
					end
				end

				arg_79_1.text_.text = var_82_16
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031020", "story_v_out_318031.awb") ~= 0 then
					local var_82_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031020", "story_v_out_318031.awb") / 1000

					if var_82_20 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_12
					end

					if var_82_15.prefab_name ~= "" and arg_79_1.actors_[var_82_15.prefab_name] ~= nil then
						local var_82_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_15.prefab_name].transform, "story_v_out_318031", "318031020", "story_v_out_318031.awb")

						arg_79_1:RecordAudio("318031020", var_82_21)
						arg_79_1:RecordAudio("318031020", var_82_21)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_318031", "318031020", "story_v_out_318031.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_318031", "318031020", "story_v_out_318031.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_13, arg_79_1.talkMaxDuration)

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_12) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_12 + var_82_22 and arg_79_1.time_ < var_82_12 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play318031021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 318031021
		arg_83_1.duration_ = 13.833

		local var_83_0 = {
			zh = 13.833,
			ja = 12.533
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
				arg_83_0:Play318031022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 1.4

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[477].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(318031021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031021", "story_v_out_318031.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031021", "story_v_out_318031.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_318031", "318031021", "story_v_out_318031.awb")

						arg_83_1:RecordAudio("318031021", var_86_9)
						arg_83_1:RecordAudio("318031021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_318031", "318031021", "story_v_out_318031.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_318031", "318031021", "story_v_out_318031.awb")
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
	Play318031022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 318031022
		arg_87_1.duration_ = 12.4

		local var_87_0 = {
			zh = 4.6,
			ja = 12.4
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
				arg_87_0:Play318031023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.475

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[477].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(318031022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031022", "story_v_out_318031.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031022", "story_v_out_318031.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_318031", "318031022", "story_v_out_318031.awb")

						arg_87_1:RecordAudio("318031022", var_90_9)
						arg_87_1:RecordAudio("318031022", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_318031", "318031022", "story_v_out_318031.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_318031", "318031022", "story_v_out_318031.awb")
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
	Play318031023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 318031023
		arg_91_1.duration_ = 1.233

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play318031024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1049ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1049ui_story == nil then
				arg_91_1.var_.characterEffect1049ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1049ui_story then
					arg_91_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1049ui_story then
				arg_91_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["10053ui_story"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect10053ui_story == nil then
				arg_91_1.var_.characterEffect10053ui_story = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.200000002980232

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect10053ui_story then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_91_1.var_.characterEffect10053ui_story.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect10053ui_story then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_91_1.var_.characterEffect10053ui_story.fillRatio = var_94_9
			end

			local var_94_10 = 0
			local var_94_11 = 0.05

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_12 = arg_91_1:FormatText(StoryNameCfg[562].name)

				arg_91_1.leftNameTxt_.text = var_94_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_13 = arg_91_1:GetWordFromCfg(318031023)
				local var_94_14 = arg_91_1:FormatText(var_94_13.content)

				arg_91_1.text_.text = var_94_14

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_15 = 2
				local var_94_16 = utf8.len(var_94_14)
				local var_94_17 = var_94_15 <= 0 and var_94_11 or var_94_11 * (var_94_16 / var_94_15)

				if var_94_17 > 0 and var_94_11 < var_94_17 then
					arg_91_1.talkMaxDuration = var_94_17

					if var_94_17 + var_94_10 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_17 + var_94_10
					end
				end

				arg_91_1.text_.text = var_94_14
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031023", "story_v_out_318031.awb") ~= 0 then
					local var_94_18 = manager.audio:GetVoiceLength("story_v_out_318031", "318031023", "story_v_out_318031.awb") / 1000

					if var_94_18 + var_94_10 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_18 + var_94_10
					end

					if var_94_13.prefab_name ~= "" and arg_91_1.actors_[var_94_13.prefab_name] ~= nil then
						local var_94_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_13.prefab_name].transform, "story_v_out_318031", "318031023", "story_v_out_318031.awb")

						arg_91_1:RecordAudio("318031023", var_94_19)
						arg_91_1:RecordAudio("318031023", var_94_19)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_318031", "318031023", "story_v_out_318031.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_318031", "318031023", "story_v_out_318031.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_20 = math.max(var_94_11, arg_91_1.talkMaxDuration)

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_20 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_10) / var_94_20

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_10 + var_94_20 and arg_91_1.time_ < var_94_10 + var_94_20 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play318031024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 318031024
		arg_95_1.duration_ = 3.5

		local var_95_0 = {
			zh = 2.3,
			ja = 3.5
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
				arg_95_0:Play318031025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1049ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1049ui_story == nil then
				arg_95_1.var_.characterEffect1049ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1049ui_story then
					arg_95_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1049ui_story then
				arg_95_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_98_4 = 0

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_2")
			end

			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 then
				arg_95_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_98_6 = 0
			local var_98_7 = 0.225

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[562].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(318031024)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 9
				local var_98_12 = utf8.len(var_98_10)
				local var_98_13 = var_98_11 <= 0 and var_98_7 or var_98_7 * (var_98_12 / var_98_11)

				if var_98_13 > 0 and var_98_7 < var_98_13 then
					arg_95_1.talkMaxDuration = var_98_13

					if var_98_13 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_13 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_10
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031024", "story_v_out_318031.awb") ~= 0 then
					local var_98_14 = manager.audio:GetVoiceLength("story_v_out_318031", "318031024", "story_v_out_318031.awb") / 1000

					if var_98_14 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_14 + var_98_6
					end

					if var_98_9.prefab_name ~= "" and arg_95_1.actors_[var_98_9.prefab_name] ~= nil then
						local var_98_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_9.prefab_name].transform, "story_v_out_318031", "318031024", "story_v_out_318031.awb")

						arg_95_1:RecordAudio("318031024", var_98_15)
						arg_95_1:RecordAudio("318031024", var_98_15)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_318031", "318031024", "story_v_out_318031.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_318031", "318031024", "story_v_out_318031.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_16 and arg_95_1.time_ < var_98_6 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play318031025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 318031025
		arg_99_1.duration_ = 3.033

		local var_99_0 = {
			zh = 3.033,
			ja = 2.466
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
				arg_99_0:Play318031026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10053ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect10053ui_story == nil then
				arg_99_1.var_.characterEffect10053ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect10053ui_story then
					arg_99_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect10053ui_story then
				arg_99_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_102_4 = 0

			if var_102_4 < arg_99_1.time_ and arg_99_1.time_ <= var_102_4 + arg_102_0 then
				arg_99_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action15_2")
			end

			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_102_6 = arg_99_1.actors_["1049ui_story"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.characterEffect1049ui_story == nil then
				arg_99_1.var_.characterEffect1049ui_story = var_102_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_8 = 0.200000002980232

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.characterEffect1049ui_story then
					local var_102_10 = Mathf.Lerp(0, 0.5, var_102_9)

					arg_99_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1049ui_story.fillRatio = var_102_10
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.characterEffect1049ui_story then
				local var_102_11 = 0.5

				arg_99_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1049ui_story.fillRatio = var_102_11
			end

			local var_102_12 = 0
			local var_102_13 = 0.125

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[477].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(318031025)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 5
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031025", "story_v_out_318031.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031025", "story_v_out_318031.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_318031", "318031025", "story_v_out_318031.awb")

						arg_99_1:RecordAudio("318031025", var_102_21)
						arg_99_1:RecordAudio("318031025", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_318031", "318031025", "story_v_out_318031.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_318031", "318031025", "story_v_out_318031.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_22 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_22 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_22

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_22 and arg_99_1.time_ < var_102_12 + var_102_22 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play318031026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 318031026
		arg_103_1.duration_ = 13.4

		local var_103_0 = {
			zh = 4.8,
			ja = 13.4
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
				arg_103_0:Play318031027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1049ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1049ui_story == nil then
				arg_103_1.var_.characterEffect1049ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1049ui_story then
					arg_103_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1049ui_story then
				arg_103_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["10053ui_story"]
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 and arg_103_1.var_.characterEffect10053ui_story == nil then
				arg_103_1.var_.characterEffect10053ui_story = var_106_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_6 = 0.200000002980232

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6

				if arg_103_1.var_.characterEffect10053ui_story then
					local var_106_8 = Mathf.Lerp(0, 0.5, var_106_7)

					arg_103_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10053ui_story.fillRatio = var_106_8
				end
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 and arg_103_1.var_.characterEffect10053ui_story then
				local var_106_9 = 0.5

				arg_103_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10053ui_story.fillRatio = var_106_9
			end

			local var_106_10 = 0
			local var_106_11 = 0.45

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_12 = arg_103_1:FormatText(StoryNameCfg[562].name)

				arg_103_1.leftNameTxt_.text = var_106_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_13 = arg_103_1:GetWordFromCfg(318031026)
				local var_106_14 = arg_103_1:FormatText(var_106_13.content)

				arg_103_1.text_.text = var_106_14

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_15 = 18
				local var_106_16 = utf8.len(var_106_14)
				local var_106_17 = var_106_15 <= 0 and var_106_11 or var_106_11 * (var_106_16 / var_106_15)

				if var_106_17 > 0 and var_106_11 < var_106_17 then
					arg_103_1.talkMaxDuration = var_106_17

					if var_106_17 + var_106_10 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_17 + var_106_10
					end
				end

				arg_103_1.text_.text = var_106_14
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031026", "story_v_out_318031.awb") ~= 0 then
					local var_106_18 = manager.audio:GetVoiceLength("story_v_out_318031", "318031026", "story_v_out_318031.awb") / 1000

					if var_106_18 + var_106_10 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_18 + var_106_10
					end

					if var_106_13.prefab_name ~= "" and arg_103_1.actors_[var_106_13.prefab_name] ~= nil then
						local var_106_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_13.prefab_name].transform, "story_v_out_318031", "318031026", "story_v_out_318031.awb")

						arg_103_1:RecordAudio("318031026", var_106_19)
						arg_103_1:RecordAudio("318031026", var_106_19)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_318031", "318031026", "story_v_out_318031.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_318031", "318031026", "story_v_out_318031.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_20 = math.max(var_106_11, arg_103_1.talkMaxDuration)

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_20 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_10) / var_106_20

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_10 + var_106_20 and arg_103_1.time_ < var_106_10 + var_106_20 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play318031027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 318031027
		arg_107_1.duration_ = 3.5

		local var_107_0 = {
			zh = 3.5,
			ja = 3.433
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
				arg_107_0:Play318031028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1049ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1049ui_story == nil then
				arg_107_1.var_.characterEffect1049ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1049ui_story then
					arg_107_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1049ui_story then
				arg_107_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_110_4 = 0

			if var_110_4 < arg_107_1.time_ and arg_107_1.time_ <= var_110_4 + arg_110_0 then
				arg_107_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_110_5 = 0
			local var_110_6 = 0.275

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_7 = arg_107_1:FormatText(StoryNameCfg[562].name)

				arg_107_1.leftNameTxt_.text = var_110_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_8 = arg_107_1:GetWordFromCfg(318031027)
				local var_110_9 = arg_107_1:FormatText(var_110_8.content)

				arg_107_1.text_.text = var_110_9

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_10 = 11
				local var_110_11 = utf8.len(var_110_9)
				local var_110_12 = var_110_10 <= 0 and var_110_6 or var_110_6 * (var_110_11 / var_110_10)

				if var_110_12 > 0 and var_110_6 < var_110_12 then
					arg_107_1.talkMaxDuration = var_110_12

					if var_110_12 + var_110_5 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_12 + var_110_5
					end
				end

				arg_107_1.text_.text = var_110_9
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031027", "story_v_out_318031.awb") ~= 0 then
					local var_110_13 = manager.audio:GetVoiceLength("story_v_out_318031", "318031027", "story_v_out_318031.awb") / 1000

					if var_110_13 + var_110_5 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_5
					end

					if var_110_8.prefab_name ~= "" and arg_107_1.actors_[var_110_8.prefab_name] ~= nil then
						local var_110_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_8.prefab_name].transform, "story_v_out_318031", "318031027", "story_v_out_318031.awb")

						arg_107_1:RecordAudio("318031027", var_110_14)
						arg_107_1:RecordAudio("318031027", var_110_14)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_318031", "318031027", "story_v_out_318031.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_318031", "318031027", "story_v_out_318031.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_15 = math.max(var_110_6, arg_107_1.talkMaxDuration)

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_15 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_5) / var_110_15

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_5 + var_110_15 and arg_107_1.time_ < var_110_5 + var_110_15 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play318031028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 318031028
		arg_111_1.duration_ = 11.1

		local var_111_0 = {
			zh = 11.1,
			ja = 10.9
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
				arg_111_0:Play318031029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 2

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				local var_114_1 = manager.ui.mainCamera.transform.localPosition
				local var_114_2 = Vector3.New(0, 0, 10) + Vector3.New(var_114_1.x, var_114_1.y, 0)
				local var_114_3 = arg_111_1.bgs_.K01f

				var_114_3.transform.localPosition = var_114_2
				var_114_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_114_4 = var_114_3:GetComponent("SpriteRenderer")

				if var_114_4 and var_114_4.sprite then
					local var_114_5 = (var_114_3.transform.localPosition - var_114_1).z
					local var_114_6 = manager.ui.mainCameraCom_
					local var_114_7 = 2 * var_114_5 * Mathf.Tan(var_114_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_114_8 = var_114_7 * var_114_6.aspect
					local var_114_9 = var_114_4.sprite.bounds.size.x
					local var_114_10 = var_114_4.sprite.bounds.size.y
					local var_114_11 = var_114_8 / var_114_9
					local var_114_12 = var_114_7 / var_114_10
					local var_114_13 = var_114_12 < var_114_11 and var_114_11 or var_114_12

					var_114_3.transform.localScale = Vector3.New(var_114_13, var_114_13, 0)
				end

				for iter_114_0, iter_114_1 in pairs(arg_111_1.bgs_) do
					if iter_114_0 ~= "K01f" then
						iter_114_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_15 = 2

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15
				local var_114_17 = Color.New(0, 0, 0)

				var_114_17.a = Mathf.Lerp(0, 1, var_114_16)
				arg_111_1.mask_.color = var_114_17
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 then
				local var_114_18 = Color.New(0, 0, 0)

				var_114_18.a = 1
				arg_111_1.mask_.color = var_114_18
			end

			local var_114_19 = 2

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_20 = 2

			if var_114_19 <= arg_111_1.time_ and arg_111_1.time_ < var_114_19 + var_114_20 then
				local var_114_21 = (arg_111_1.time_ - var_114_19) / var_114_20
				local var_114_22 = Color.New(0, 0, 0)

				var_114_22.a = Mathf.Lerp(1, 0, var_114_21)
				arg_111_1.mask_.color = var_114_22
			end

			if arg_111_1.time_ >= var_114_19 + var_114_20 and arg_111_1.time_ < var_114_19 + var_114_20 + arg_114_0 then
				local var_114_23 = Color.New(0, 0, 0)
				local var_114_24 = 0

				arg_111_1.mask_.enabled = false
				var_114_23.a = var_114_24
				arg_111_1.mask_.color = var_114_23
			end

			local var_114_25 = "1093ui_story"

			if arg_111_1.actors_[var_114_25] == nil then
				local var_114_26 = Object.Instantiate(Asset.Load("Char/" .. var_114_25), arg_111_1.stage_.transform)

				var_114_26.name = var_114_25
				var_114_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.actors_[var_114_25] = var_114_26

				local var_114_27 = var_114_26:GetComponentInChildren(typeof(CharacterEffect))

				var_114_27.enabled = true

				local var_114_28 = GameObjectTools.GetOrAddComponent(var_114_26, typeof(DynamicBoneHelper))

				if var_114_28 then
					var_114_28:EnableDynamicBone(false)
				end

				arg_111_1:ShowWeapon(var_114_27.transform, false)

				arg_111_1.var_[var_114_25 .. "Animator"] = var_114_27.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_111_1.var_[var_114_25 .. "Animator"].applyRootMotion = true
				arg_111_1.var_[var_114_25 .. "LipSync"] = var_114_27.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_114_29 = arg_111_1.actors_["1093ui_story"].transform
			local var_114_30 = 4

			if var_114_30 < arg_111_1.time_ and arg_111_1.time_ <= var_114_30 + arg_114_0 then
				arg_111_1.var_.moveOldPos1093ui_story = var_114_29.localPosition
			end

			local var_114_31 = 0.001

			if var_114_30 <= arg_111_1.time_ and arg_111_1.time_ < var_114_30 + var_114_31 then
				local var_114_32 = (arg_111_1.time_ - var_114_30) / var_114_31
				local var_114_33 = Vector3.New(0, -1.11, -5.88)

				var_114_29.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1093ui_story, var_114_33, var_114_32)

				local var_114_34 = manager.ui.mainCamera.transform.position - var_114_29.position

				var_114_29.forward = Vector3.New(var_114_34.x, var_114_34.y, var_114_34.z)

				local var_114_35 = var_114_29.localEulerAngles

				var_114_35.z = 0
				var_114_35.x = 0
				var_114_29.localEulerAngles = var_114_35
			end

			if arg_111_1.time_ >= var_114_30 + var_114_31 and arg_111_1.time_ < var_114_30 + var_114_31 + arg_114_0 then
				var_114_29.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_114_36 = manager.ui.mainCamera.transform.position - var_114_29.position

				var_114_29.forward = Vector3.New(var_114_36.x, var_114_36.y, var_114_36.z)

				local var_114_37 = var_114_29.localEulerAngles

				var_114_37.z = 0
				var_114_37.x = 0
				var_114_29.localEulerAngles = var_114_37
			end

			local var_114_38 = arg_111_1.actors_["1093ui_story"]
			local var_114_39 = 4

			if var_114_39 < arg_111_1.time_ and arg_111_1.time_ <= var_114_39 + arg_114_0 and arg_111_1.var_.characterEffect1093ui_story == nil then
				arg_111_1.var_.characterEffect1093ui_story = var_114_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_40 = 0.200000002980232

			if var_114_39 <= arg_111_1.time_ and arg_111_1.time_ < var_114_39 + var_114_40 then
				local var_114_41 = (arg_111_1.time_ - var_114_39) / var_114_40

				if arg_111_1.var_.characterEffect1093ui_story then
					arg_111_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_39 + var_114_40 and arg_111_1.time_ < var_114_39 + var_114_40 + arg_114_0 and arg_111_1.var_.characterEffect1093ui_story then
				arg_111_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_114_42 = 4

			if var_114_42 < arg_111_1.time_ and arg_111_1.time_ <= var_114_42 + arg_114_0 then
				arg_111_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_114_43 = 4

			if var_114_43 < arg_111_1.time_ and arg_111_1.time_ <= var_114_43 + arg_114_0 then
				arg_111_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_114_44 = arg_111_1.actors_["1049ui_story"].transform
			local var_114_45 = 2

			if var_114_45 < arg_111_1.time_ and arg_111_1.time_ <= var_114_45 + arg_114_0 then
				arg_111_1.var_.moveOldPos1049ui_story = var_114_44.localPosition
			end

			local var_114_46 = 0.001

			if var_114_45 <= arg_111_1.time_ and arg_111_1.time_ < var_114_45 + var_114_46 then
				local var_114_47 = (arg_111_1.time_ - var_114_45) / var_114_46
				local var_114_48 = Vector3.New(0, 100, 0)

				var_114_44.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1049ui_story, var_114_48, var_114_47)

				local var_114_49 = manager.ui.mainCamera.transform.position - var_114_44.position

				var_114_44.forward = Vector3.New(var_114_49.x, var_114_49.y, var_114_49.z)

				local var_114_50 = var_114_44.localEulerAngles

				var_114_50.z = 0
				var_114_50.x = 0
				var_114_44.localEulerAngles = var_114_50
			end

			if arg_111_1.time_ >= var_114_45 + var_114_46 and arg_111_1.time_ < var_114_45 + var_114_46 + arg_114_0 then
				var_114_44.localPosition = Vector3.New(0, 100, 0)

				local var_114_51 = manager.ui.mainCamera.transform.position - var_114_44.position

				var_114_44.forward = Vector3.New(var_114_51.x, var_114_51.y, var_114_51.z)

				local var_114_52 = var_114_44.localEulerAngles

				var_114_52.z = 0
				var_114_52.x = 0
				var_114_44.localEulerAngles = var_114_52
			end

			local var_114_53 = arg_111_1.actors_["1049ui_story"]
			local var_114_54 = 2

			if var_114_54 < arg_111_1.time_ and arg_111_1.time_ <= var_114_54 + arg_114_0 and arg_111_1.var_.characterEffect1049ui_story == nil then
				arg_111_1.var_.characterEffect1049ui_story = var_114_53:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_55 = 0.200000002980232

			if var_114_54 <= arg_111_1.time_ and arg_111_1.time_ < var_114_54 + var_114_55 then
				local var_114_56 = (arg_111_1.time_ - var_114_54) / var_114_55

				if arg_111_1.var_.characterEffect1049ui_story then
					local var_114_57 = Mathf.Lerp(0, 0.5, var_114_56)

					arg_111_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1049ui_story.fillRatio = var_114_57
				end
			end

			if arg_111_1.time_ >= var_114_54 + var_114_55 and arg_111_1.time_ < var_114_54 + var_114_55 + arg_114_0 and arg_111_1.var_.characterEffect1049ui_story then
				local var_114_58 = 0.5

				arg_111_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1049ui_story.fillRatio = var_114_58
			end

			local var_114_59 = arg_111_1.actors_["10053ui_story"].transform
			local var_114_60 = 2

			if var_114_60 < arg_111_1.time_ and arg_111_1.time_ <= var_114_60 + arg_114_0 then
				arg_111_1.var_.moveOldPos10053ui_story = var_114_59.localPosition
			end

			local var_114_61 = 0.001

			if var_114_60 <= arg_111_1.time_ and arg_111_1.time_ < var_114_60 + var_114_61 then
				local var_114_62 = (arg_111_1.time_ - var_114_60) / var_114_61
				local var_114_63 = Vector3.New(0, 100, 0)

				var_114_59.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10053ui_story, var_114_63, var_114_62)

				local var_114_64 = manager.ui.mainCamera.transform.position - var_114_59.position

				var_114_59.forward = Vector3.New(var_114_64.x, var_114_64.y, var_114_64.z)

				local var_114_65 = var_114_59.localEulerAngles

				var_114_65.z = 0
				var_114_65.x = 0
				var_114_59.localEulerAngles = var_114_65
			end

			if arg_111_1.time_ >= var_114_60 + var_114_61 and arg_111_1.time_ < var_114_60 + var_114_61 + arg_114_0 then
				var_114_59.localPosition = Vector3.New(0, 100, 0)

				local var_114_66 = manager.ui.mainCamera.transform.position - var_114_59.position

				var_114_59.forward = Vector3.New(var_114_66.x, var_114_66.y, var_114_66.z)

				local var_114_67 = var_114_59.localEulerAngles

				var_114_67.z = 0
				var_114_67.x = 0
				var_114_59.localEulerAngles = var_114_67
			end

			local var_114_68 = arg_111_1.actors_["10053ui_story"]
			local var_114_69 = 2

			if var_114_69 < arg_111_1.time_ and arg_111_1.time_ <= var_114_69 + arg_114_0 and arg_111_1.var_.characterEffect10053ui_story == nil then
				arg_111_1.var_.characterEffect10053ui_story = var_114_68:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_70 = 0.200000002980232

			if var_114_69 <= arg_111_1.time_ and arg_111_1.time_ < var_114_69 + var_114_70 then
				local var_114_71 = (arg_111_1.time_ - var_114_69) / var_114_70

				if arg_111_1.var_.characterEffect10053ui_story then
					local var_114_72 = Mathf.Lerp(0, 0.5, var_114_71)

					arg_111_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_111_1.var_.characterEffect10053ui_story.fillRatio = var_114_72
				end
			end

			if arg_111_1.time_ >= var_114_69 + var_114_70 and arg_111_1.time_ < var_114_69 + var_114_70 + arg_114_0 and arg_111_1.var_.characterEffect10053ui_story then
				local var_114_73 = 0.5

				arg_111_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_111_1.var_.characterEffect10053ui_story.fillRatio = var_114_73
			end

			if arg_111_1.frameCnt_ <= 1 then
				arg_111_1.dialog_:SetActive(false)
			end

			local var_114_74 = 4
			local var_114_75 = 0.725

			if var_114_74 < arg_111_1.time_ and arg_111_1.time_ <= var_114_74 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				arg_111_1.dialog_:SetActive(true)

				local var_114_76 = LeanTween.value(arg_111_1.dialog_, 0, 1, 0.3)

				var_114_76:setOnUpdate(LuaHelper.FloatAction(function(arg_115_0)
					arg_111_1.dialogCg_.alpha = arg_115_0
				end))
				var_114_76:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_111_1.dialog_)
					var_114_76:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_111_1.duration_ = arg_111_1.duration_ + 0.3

				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_77 = arg_111_1:FormatText(StoryNameCfg[73].name)

				arg_111_1.leftNameTxt_.text = var_114_77

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_78 = arg_111_1:GetWordFromCfg(318031028)
				local var_114_79 = arg_111_1:FormatText(var_114_78.content)

				arg_111_1.text_.text = var_114_79

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_80 = 29
				local var_114_81 = utf8.len(var_114_79)
				local var_114_82 = var_114_80 <= 0 and var_114_75 or var_114_75 * (var_114_81 / var_114_80)

				if var_114_82 > 0 and var_114_75 < var_114_82 then
					arg_111_1.talkMaxDuration = var_114_82
					var_114_74 = var_114_74 + 0.3

					if var_114_82 + var_114_74 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_82 + var_114_74
					end
				end

				arg_111_1.text_.text = var_114_79
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031028", "story_v_out_318031.awb") ~= 0 then
					local var_114_83 = manager.audio:GetVoiceLength("story_v_out_318031", "318031028", "story_v_out_318031.awb") / 1000

					if var_114_83 + var_114_74 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_83 + var_114_74
					end

					if var_114_78.prefab_name ~= "" and arg_111_1.actors_[var_114_78.prefab_name] ~= nil then
						local var_114_84 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_78.prefab_name].transform, "story_v_out_318031", "318031028", "story_v_out_318031.awb")

						arg_111_1:RecordAudio("318031028", var_114_84)
						arg_111_1:RecordAudio("318031028", var_114_84)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_318031", "318031028", "story_v_out_318031.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_318031", "318031028", "story_v_out_318031.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_85 = var_114_74 + 0.3
			local var_114_86 = math.max(var_114_75, arg_111_1.talkMaxDuration)

			if var_114_85 <= arg_111_1.time_ and arg_111_1.time_ < var_114_85 + var_114_86 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_85) / var_114_86

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_85 + var_114_86 and arg_111_1.time_ < var_114_85 + var_114_86 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play318031029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 318031029
		arg_117_1.duration_ = 3.733

		local var_117_0 = {
			zh = 2.866,
			ja = 3.733
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
				arg_117_0:Play318031030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = "1015ui_story"

			if arg_117_1.actors_[var_120_0] == nil then
				local var_120_1 = Object.Instantiate(Asset.Load("Char/" .. var_120_0), arg_117_1.stage_.transform)

				var_120_1.name = var_120_0
				var_120_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_117_1.actors_[var_120_0] = var_120_1

				local var_120_2 = var_120_1:GetComponentInChildren(typeof(CharacterEffect))

				var_120_2.enabled = true

				local var_120_3 = GameObjectTools.GetOrAddComponent(var_120_1, typeof(DynamicBoneHelper))

				if var_120_3 then
					var_120_3:EnableDynamicBone(false)
				end

				arg_117_1:ShowWeapon(var_120_2.transform, false)

				arg_117_1.var_[var_120_0 .. "Animator"] = var_120_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_117_1.var_[var_120_0 .. "Animator"].applyRootMotion = true
				arg_117_1.var_[var_120_0 .. "LipSync"] = var_120_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_120_4 = arg_117_1.actors_["1015ui_story"].transform
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1.var_.moveOldPos1015ui_story = var_120_4.localPosition
			end

			local var_120_6 = 0.001

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6
				local var_120_8 = Vector3.New(0.7, -1.15, -6.2)

				var_120_4.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1015ui_story, var_120_8, var_120_7)

				local var_120_9 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_9.x, var_120_9.y, var_120_9.z)

				local var_120_10 = var_120_4.localEulerAngles

				var_120_10.z = 0
				var_120_10.x = 0
				var_120_4.localEulerAngles = var_120_10
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 then
				var_120_4.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_120_11 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_11.x, var_120_11.y, var_120_11.z)

				local var_120_12 = var_120_4.localEulerAngles

				var_120_12.z = 0
				var_120_12.x = 0
				var_120_4.localEulerAngles = var_120_12
			end

			local var_120_13 = arg_117_1.actors_["1015ui_story"]
			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 and arg_117_1.var_.characterEffect1015ui_story == nil then
				arg_117_1.var_.characterEffect1015ui_story = var_120_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_15 = 0.200000002980232

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_15 then
				local var_120_16 = (arg_117_1.time_ - var_120_14) / var_120_15

				if arg_117_1.var_.characterEffect1015ui_story then
					arg_117_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_14 + var_120_15 and arg_117_1.time_ < var_120_14 + var_120_15 + arg_120_0 and arg_117_1.var_.characterEffect1015ui_story then
				arg_117_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_120_17 = 0

			if var_120_17 < arg_117_1.time_ and arg_117_1.time_ <= var_120_17 + arg_120_0 then
				arg_117_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_120_18 = arg_117_1.actors_["1093ui_story"].transform
			local var_120_19 = 0

			if var_120_19 < arg_117_1.time_ and arg_117_1.time_ <= var_120_19 + arg_120_0 then
				arg_117_1.var_.moveOldPos1093ui_story = var_120_18.localPosition
			end

			local var_120_20 = 0.001

			if var_120_19 <= arg_117_1.time_ and arg_117_1.time_ < var_120_19 + var_120_20 then
				local var_120_21 = (arg_117_1.time_ - var_120_19) / var_120_20
				local var_120_22 = Vector3.New(-0.7, -1.11, -5.88)

				var_120_18.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1093ui_story, var_120_22, var_120_21)

				local var_120_23 = manager.ui.mainCamera.transform.position - var_120_18.position

				var_120_18.forward = Vector3.New(var_120_23.x, var_120_23.y, var_120_23.z)

				local var_120_24 = var_120_18.localEulerAngles

				var_120_24.z = 0
				var_120_24.x = 0
				var_120_18.localEulerAngles = var_120_24
			end

			if arg_117_1.time_ >= var_120_19 + var_120_20 and arg_117_1.time_ < var_120_19 + var_120_20 + arg_120_0 then
				var_120_18.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_120_25 = manager.ui.mainCamera.transform.position - var_120_18.position

				var_120_18.forward = Vector3.New(var_120_25.x, var_120_25.y, var_120_25.z)

				local var_120_26 = var_120_18.localEulerAngles

				var_120_26.z = 0
				var_120_26.x = 0
				var_120_18.localEulerAngles = var_120_26
			end

			local var_120_27 = arg_117_1.actors_["1093ui_story"]
			local var_120_28 = 0

			if var_120_28 < arg_117_1.time_ and arg_117_1.time_ <= var_120_28 + arg_120_0 and arg_117_1.var_.characterEffect1093ui_story == nil then
				arg_117_1.var_.characterEffect1093ui_story = var_120_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_29 = 0.200000002980232

			if var_120_28 <= arg_117_1.time_ and arg_117_1.time_ < var_120_28 + var_120_29 then
				local var_120_30 = (arg_117_1.time_ - var_120_28) / var_120_29

				if arg_117_1.var_.characterEffect1093ui_story then
					local var_120_31 = Mathf.Lerp(0, 0.5, var_120_30)

					arg_117_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1093ui_story.fillRatio = var_120_31
				end
			end

			if arg_117_1.time_ >= var_120_28 + var_120_29 and arg_117_1.time_ < var_120_28 + var_120_29 + arg_120_0 and arg_117_1.var_.characterEffect1093ui_story then
				local var_120_32 = 0.5

				arg_117_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1093ui_story.fillRatio = var_120_32
			end

			local var_120_33 = 0

			if var_120_33 < arg_117_1.time_ and arg_117_1.time_ <= var_120_33 + arg_120_0 then
				arg_117_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_120_34 = 0

			if var_120_34 < arg_117_1.time_ and arg_117_1.time_ <= var_120_34 + arg_120_0 then
				arg_117_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_120_35 = 0
			local var_120_36 = 0.35

			if var_120_35 < arg_117_1.time_ and arg_117_1.time_ <= var_120_35 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_37 = arg_117_1:FormatText(StoryNameCfg[479].name)

				arg_117_1.leftNameTxt_.text = var_120_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_38 = arg_117_1:GetWordFromCfg(318031029)
				local var_120_39 = arg_117_1:FormatText(var_120_38.content)

				arg_117_1.text_.text = var_120_39

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_40 = 14
				local var_120_41 = utf8.len(var_120_39)
				local var_120_42 = var_120_40 <= 0 and var_120_36 or var_120_36 * (var_120_41 / var_120_40)

				if var_120_42 > 0 and var_120_36 < var_120_42 then
					arg_117_1.talkMaxDuration = var_120_42

					if var_120_42 + var_120_35 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_42 + var_120_35
					end
				end

				arg_117_1.text_.text = var_120_39
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031029", "story_v_out_318031.awb") ~= 0 then
					local var_120_43 = manager.audio:GetVoiceLength("story_v_out_318031", "318031029", "story_v_out_318031.awb") / 1000

					if var_120_43 + var_120_35 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_43 + var_120_35
					end

					if var_120_38.prefab_name ~= "" and arg_117_1.actors_[var_120_38.prefab_name] ~= nil then
						local var_120_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_38.prefab_name].transform, "story_v_out_318031", "318031029", "story_v_out_318031.awb")

						arg_117_1:RecordAudio("318031029", var_120_44)
						arg_117_1:RecordAudio("318031029", var_120_44)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_318031", "318031029", "story_v_out_318031.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_318031", "318031029", "story_v_out_318031.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_45 = math.max(var_120_36, arg_117_1.talkMaxDuration)

			if var_120_35 <= arg_117_1.time_ and arg_117_1.time_ < var_120_35 + var_120_45 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_35) / var_120_45

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_35 + var_120_45 and arg_117_1.time_ < var_120_35 + var_120_45 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play318031030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 318031030
		arg_121_1.duration_ = 6.366

		local var_121_0 = {
			zh = 6.366,
			ja = 4.633
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
				arg_121_0:Play318031031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_1 = 0
			local var_124_2 = 0.675

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_3 = arg_121_1:FormatText(StoryNameCfg[479].name)

				arg_121_1.leftNameTxt_.text = var_124_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_4 = arg_121_1:GetWordFromCfg(318031030)
				local var_124_5 = arg_121_1:FormatText(var_124_4.content)

				arg_121_1.text_.text = var_124_5

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_6 = 27
				local var_124_7 = utf8.len(var_124_5)
				local var_124_8 = var_124_6 <= 0 and var_124_2 or var_124_2 * (var_124_7 / var_124_6)

				if var_124_8 > 0 and var_124_2 < var_124_8 then
					arg_121_1.talkMaxDuration = var_124_8

					if var_124_8 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_1
					end
				end

				arg_121_1.text_.text = var_124_5
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031030", "story_v_out_318031.awb") ~= 0 then
					local var_124_9 = manager.audio:GetVoiceLength("story_v_out_318031", "318031030", "story_v_out_318031.awb") / 1000

					if var_124_9 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_9 + var_124_1
					end

					if var_124_4.prefab_name ~= "" and arg_121_1.actors_[var_124_4.prefab_name] ~= nil then
						local var_124_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_4.prefab_name].transform, "story_v_out_318031", "318031030", "story_v_out_318031.awb")

						arg_121_1:RecordAudio("318031030", var_124_10)
						arg_121_1:RecordAudio("318031030", var_124_10)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_318031", "318031030", "story_v_out_318031.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_318031", "318031030", "story_v_out_318031.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_11 = math.max(var_124_2, arg_121_1.talkMaxDuration)

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_11 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_1) / var_124_11

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_1 + var_124_11 and arg_121_1.time_ < var_124_1 + var_124_11 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play318031031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 318031031
		arg_125_1.duration_ = 10.366

		local var_125_0 = {
			zh = 5.433,
			ja = 10.366
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
				arg_125_0:Play318031032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.65

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[479].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(318031031)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031031", "story_v_out_318031.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031031", "story_v_out_318031.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_out_318031", "318031031", "story_v_out_318031.awb")

						arg_125_1:RecordAudio("318031031", var_128_9)
						arg_125_1:RecordAudio("318031031", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_318031", "318031031", "story_v_out_318031.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_318031", "318031031", "story_v_out_318031.awb")
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
	Play318031032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 318031032
		arg_129_1.duration_ = 4.966

		local var_129_0 = {
			zh = 4.966,
			ja = 4.833
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
				arg_129_0:Play318031033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1093ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1093ui_story == nil then
				arg_129_1.var_.characterEffect1093ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1093ui_story then
					arg_129_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1093ui_story then
				arg_129_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_132_4 = 0

			if var_132_4 < arg_129_1.time_ and arg_129_1.time_ <= var_132_4 + arg_132_0 then
				arg_129_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action479")
			end

			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 then
				arg_129_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_132_6 = arg_129_1.actors_["1015ui_story"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 and arg_129_1.var_.characterEffect1015ui_story == nil then
				arg_129_1.var_.characterEffect1015ui_story = var_132_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_8 = 0.200000002980232

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_8 then
				local var_132_9 = (arg_129_1.time_ - var_132_7) / var_132_8

				if arg_129_1.var_.characterEffect1015ui_story then
					local var_132_10 = Mathf.Lerp(0, 0.5, var_132_9)

					arg_129_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1015ui_story.fillRatio = var_132_10
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_8 and arg_129_1.time_ < var_132_7 + var_132_8 + arg_132_0 and arg_129_1.var_.characterEffect1015ui_story then
				local var_132_11 = 0.5

				arg_129_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1015ui_story.fillRatio = var_132_11
			end

			local var_132_12 = 0
			local var_132_13 = 0.45

			if var_132_12 < arg_129_1.time_ and arg_129_1.time_ <= var_132_12 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_14 = arg_129_1:FormatText(StoryNameCfg[73].name)

				arg_129_1.leftNameTxt_.text = var_132_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_15 = arg_129_1:GetWordFromCfg(318031032)
				local var_132_16 = arg_129_1:FormatText(var_132_15.content)

				arg_129_1.text_.text = var_132_16

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_17 = 18
				local var_132_18 = utf8.len(var_132_16)
				local var_132_19 = var_132_17 <= 0 and var_132_13 or var_132_13 * (var_132_18 / var_132_17)

				if var_132_19 > 0 and var_132_13 < var_132_19 then
					arg_129_1.talkMaxDuration = var_132_19

					if var_132_19 + var_132_12 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_19 + var_132_12
					end
				end

				arg_129_1.text_.text = var_132_16
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031032", "story_v_out_318031.awb") ~= 0 then
					local var_132_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031032", "story_v_out_318031.awb") / 1000

					if var_132_20 + var_132_12 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_20 + var_132_12
					end

					if var_132_15.prefab_name ~= "" and arg_129_1.actors_[var_132_15.prefab_name] ~= nil then
						local var_132_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_15.prefab_name].transform, "story_v_out_318031", "318031032", "story_v_out_318031.awb")

						arg_129_1:RecordAudio("318031032", var_132_21)
						arg_129_1:RecordAudio("318031032", var_132_21)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_318031", "318031032", "story_v_out_318031.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_318031", "318031032", "story_v_out_318031.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_22 = math.max(var_132_13, arg_129_1.talkMaxDuration)

			if var_132_12 <= arg_129_1.time_ and arg_129_1.time_ < var_132_12 + var_132_22 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_12) / var_132_22

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_12 + var_132_22 and arg_129_1.time_ < var_132_12 + var_132_22 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play318031033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 318031033
		arg_133_1.duration_ = 6.533

		local var_133_0 = {
			zh = 4.266,
			ja = 6.533
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
				arg_133_0:Play318031034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1015ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1015ui_story == nil then
				arg_133_1.var_.characterEffect1015ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1015ui_story then
					arg_133_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1015ui_story then
				arg_133_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_136_4 = 0

			if var_136_4 < arg_133_1.time_ and arg_133_1.time_ <= var_136_4 + arg_136_0 then
				arg_133_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015actionlink/1015action426")
			end

			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 then
				arg_133_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_136_6 = arg_133_1.actors_["1093ui_story"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect1093ui_story == nil then
				arg_133_1.var_.characterEffect1093ui_story = var_136_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_8 = 0.200000002980232

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8

				if arg_133_1.var_.characterEffect1093ui_story then
					local var_136_10 = Mathf.Lerp(0, 0.5, var_136_9)

					arg_133_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1093ui_story.fillRatio = var_136_10
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 and arg_133_1.var_.characterEffect1093ui_story then
				local var_136_11 = 0.5

				arg_133_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1093ui_story.fillRatio = var_136_11
			end

			local var_136_12 = 0
			local var_136_13 = 0.625

			if var_136_12 < arg_133_1.time_ and arg_133_1.time_ <= var_136_12 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_14 = arg_133_1:FormatText(StoryNameCfg[479].name)

				arg_133_1.leftNameTxt_.text = var_136_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_15 = arg_133_1:GetWordFromCfg(318031033)
				local var_136_16 = arg_133_1:FormatText(var_136_15.content)

				arg_133_1.text_.text = var_136_16

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_17 = 25
				local var_136_18 = utf8.len(var_136_16)
				local var_136_19 = var_136_17 <= 0 and var_136_13 or var_136_13 * (var_136_18 / var_136_17)

				if var_136_19 > 0 and var_136_13 < var_136_19 then
					arg_133_1.talkMaxDuration = var_136_19

					if var_136_19 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_12
					end
				end

				arg_133_1.text_.text = var_136_16
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031033", "story_v_out_318031.awb") ~= 0 then
					local var_136_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031033", "story_v_out_318031.awb") / 1000

					if var_136_20 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_12
					end

					if var_136_15.prefab_name ~= "" and arg_133_1.actors_[var_136_15.prefab_name] ~= nil then
						local var_136_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_15.prefab_name].transform, "story_v_out_318031", "318031033", "story_v_out_318031.awb")

						arg_133_1:RecordAudio("318031033", var_136_21)
						arg_133_1:RecordAudio("318031033", var_136_21)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_318031", "318031033", "story_v_out_318031.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_318031", "318031033", "story_v_out_318031.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_22 = math.max(var_136_13, arg_133_1.talkMaxDuration)

			if var_136_12 <= arg_133_1.time_ and arg_133_1.time_ < var_136_12 + var_136_22 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_12) / var_136_22

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_12 + var_136_22 and arg_133_1.time_ < var_136_12 + var_136_22 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play318031034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 318031034
		arg_137_1.duration_ = 8.5

		local var_137_0 = {
			zh = 5.633,
			ja = 8.5
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
				arg_137_0:Play318031035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1093ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1093ui_story == nil then
				arg_137_1.var_.characterEffect1093ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1093ui_story then
					arg_137_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1093ui_story then
				arg_137_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_140_4 = 0

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action495")
			end

			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_140_6 = arg_137_1.actors_["1015ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect1015ui_story == nil then
				arg_137_1.var_.characterEffect1015ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.200000002980232

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect1015ui_story then
					local var_140_10 = Mathf.Lerp(0, 0.5, var_140_9)

					arg_137_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1015ui_story.fillRatio = var_140_10
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1015ui_story then
				local var_140_11 = 0.5

				arg_137_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1015ui_story.fillRatio = var_140_11
			end

			local var_140_12 = 0
			local var_140_13 = 0.575

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_14 = arg_137_1:FormatText(StoryNameCfg[73].name)

				arg_137_1.leftNameTxt_.text = var_140_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(318031034)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 23
				local var_140_18 = utf8.len(var_140_16)
				local var_140_19 = var_140_17 <= 0 and var_140_13 or var_140_13 * (var_140_18 / var_140_17)

				if var_140_19 > 0 and var_140_13 < var_140_19 then
					arg_137_1.talkMaxDuration = var_140_19

					if var_140_19 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_16
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031034", "story_v_out_318031.awb") ~= 0 then
					local var_140_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031034", "story_v_out_318031.awb") / 1000

					if var_140_20 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_12
					end

					if var_140_15.prefab_name ~= "" and arg_137_1.actors_[var_140_15.prefab_name] ~= nil then
						local var_140_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_15.prefab_name].transform, "story_v_out_318031", "318031034", "story_v_out_318031.awb")

						arg_137_1:RecordAudio("318031034", var_140_21)
						arg_137_1:RecordAudio("318031034", var_140_21)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_318031", "318031034", "story_v_out_318031.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_318031", "318031034", "story_v_out_318031.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_22 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_22 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_12) / var_140_22

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_12 + var_140_22 and arg_137_1.time_ < var_140_12 + var_140_22 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play318031035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 318031035
		arg_141_1.duration_ = 6.866

		local var_141_0 = {
			zh = 3.2,
			ja = 6.866
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
				arg_141_0:Play318031036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = "1199ui_story"

			if arg_141_1.actors_[var_144_0] == nil then
				local var_144_1 = Object.Instantiate(Asset.Load("Char/" .. var_144_0), arg_141_1.stage_.transform)

				var_144_1.name = var_144_0
				var_144_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_141_1.actors_[var_144_0] = var_144_1

				local var_144_2 = var_144_1:GetComponentInChildren(typeof(CharacterEffect))

				var_144_2.enabled = true

				local var_144_3 = GameObjectTools.GetOrAddComponent(var_144_1, typeof(DynamicBoneHelper))

				if var_144_3 then
					var_144_3:EnableDynamicBone(false)
				end

				arg_141_1:ShowWeapon(var_144_2.transform, false)

				arg_141_1.var_[var_144_0 .. "Animator"] = var_144_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_141_1.var_[var_144_0 .. "Animator"].applyRootMotion = true
				arg_141_1.var_[var_144_0 .. "LipSync"] = var_144_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_144_4 = arg_141_1.actors_["1199ui_story"].transform
			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1.var_.moveOldPos1199ui_story = var_144_4.localPosition
			end

			local var_144_6 = 0.001

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_6 then
				local var_144_7 = (arg_141_1.time_ - var_144_5) / var_144_6
				local var_144_8 = Vector3.New(0, -1.08, -5.9)

				var_144_4.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1199ui_story, var_144_8, var_144_7)

				local var_144_9 = manager.ui.mainCamera.transform.position - var_144_4.position

				var_144_4.forward = Vector3.New(var_144_9.x, var_144_9.y, var_144_9.z)

				local var_144_10 = var_144_4.localEulerAngles

				var_144_10.z = 0
				var_144_10.x = 0
				var_144_4.localEulerAngles = var_144_10
			end

			if arg_141_1.time_ >= var_144_5 + var_144_6 and arg_141_1.time_ < var_144_5 + var_144_6 + arg_144_0 then
				var_144_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_144_11 = manager.ui.mainCamera.transform.position - var_144_4.position

				var_144_4.forward = Vector3.New(var_144_11.x, var_144_11.y, var_144_11.z)

				local var_144_12 = var_144_4.localEulerAngles

				var_144_12.z = 0
				var_144_12.x = 0
				var_144_4.localEulerAngles = var_144_12
			end

			local var_144_13 = arg_141_1.actors_["1199ui_story"]
			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 and arg_141_1.var_.characterEffect1199ui_story == nil then
				arg_141_1.var_.characterEffect1199ui_story = var_144_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_15 = 0.200000002980232

			if var_144_14 <= arg_141_1.time_ and arg_141_1.time_ < var_144_14 + var_144_15 then
				local var_144_16 = (arg_141_1.time_ - var_144_14) / var_144_15

				if arg_141_1.var_.characterEffect1199ui_story then
					arg_141_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_14 + var_144_15 and arg_141_1.time_ < var_144_14 + var_144_15 + arg_144_0 and arg_141_1.var_.characterEffect1199ui_story then
				arg_141_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_144_17 = 0

			if var_144_17 < arg_141_1.time_ and arg_141_1.time_ <= var_144_17 + arg_144_0 then
				arg_141_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_144_18 = 0

			if var_144_18 < arg_141_1.time_ and arg_141_1.time_ <= var_144_18 + arg_144_0 then
				arg_141_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_144_19 = arg_141_1.actors_["1093ui_story"].transform
			local var_144_20 = 0

			if var_144_20 < arg_141_1.time_ and arg_141_1.time_ <= var_144_20 + arg_144_0 then
				arg_141_1.var_.moveOldPos1093ui_story = var_144_19.localPosition
			end

			local var_144_21 = 0.001

			if var_144_20 <= arg_141_1.time_ and arg_141_1.time_ < var_144_20 + var_144_21 then
				local var_144_22 = (arg_141_1.time_ - var_144_20) / var_144_21
				local var_144_23 = Vector3.New(0, 100, 0)

				var_144_19.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1093ui_story, var_144_23, var_144_22)

				local var_144_24 = manager.ui.mainCamera.transform.position - var_144_19.position

				var_144_19.forward = Vector3.New(var_144_24.x, var_144_24.y, var_144_24.z)

				local var_144_25 = var_144_19.localEulerAngles

				var_144_25.z = 0
				var_144_25.x = 0
				var_144_19.localEulerAngles = var_144_25
			end

			if arg_141_1.time_ >= var_144_20 + var_144_21 and arg_141_1.time_ < var_144_20 + var_144_21 + arg_144_0 then
				var_144_19.localPosition = Vector3.New(0, 100, 0)

				local var_144_26 = manager.ui.mainCamera.transform.position - var_144_19.position

				var_144_19.forward = Vector3.New(var_144_26.x, var_144_26.y, var_144_26.z)

				local var_144_27 = var_144_19.localEulerAngles

				var_144_27.z = 0
				var_144_27.x = 0
				var_144_19.localEulerAngles = var_144_27
			end

			local var_144_28 = arg_141_1.actors_["1093ui_story"]
			local var_144_29 = 0

			if var_144_29 < arg_141_1.time_ and arg_141_1.time_ <= var_144_29 + arg_144_0 and arg_141_1.var_.characterEffect1093ui_story == nil then
				arg_141_1.var_.characterEffect1093ui_story = var_144_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_30 = 0.200000002980232

			if var_144_29 <= arg_141_1.time_ and arg_141_1.time_ < var_144_29 + var_144_30 then
				local var_144_31 = (arg_141_1.time_ - var_144_29) / var_144_30

				if arg_141_1.var_.characterEffect1093ui_story then
					local var_144_32 = Mathf.Lerp(0, 0.5, var_144_31)

					arg_141_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1093ui_story.fillRatio = var_144_32
				end
			end

			if arg_141_1.time_ >= var_144_29 + var_144_30 and arg_141_1.time_ < var_144_29 + var_144_30 + arg_144_0 and arg_141_1.var_.characterEffect1093ui_story then
				local var_144_33 = 0.5

				arg_141_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1093ui_story.fillRatio = var_144_33
			end

			local var_144_34 = arg_141_1.actors_["1015ui_story"].transform
			local var_144_35 = 0

			if var_144_35 < arg_141_1.time_ and arg_141_1.time_ <= var_144_35 + arg_144_0 then
				arg_141_1.var_.moveOldPos1015ui_story = var_144_34.localPosition
			end

			local var_144_36 = 0.001

			if var_144_35 <= arg_141_1.time_ and arg_141_1.time_ < var_144_35 + var_144_36 then
				local var_144_37 = (arg_141_1.time_ - var_144_35) / var_144_36
				local var_144_38 = Vector3.New(0, 100, 0)

				var_144_34.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1015ui_story, var_144_38, var_144_37)

				local var_144_39 = manager.ui.mainCamera.transform.position - var_144_34.position

				var_144_34.forward = Vector3.New(var_144_39.x, var_144_39.y, var_144_39.z)

				local var_144_40 = var_144_34.localEulerAngles

				var_144_40.z = 0
				var_144_40.x = 0
				var_144_34.localEulerAngles = var_144_40
			end

			if arg_141_1.time_ >= var_144_35 + var_144_36 and arg_141_1.time_ < var_144_35 + var_144_36 + arg_144_0 then
				var_144_34.localPosition = Vector3.New(0, 100, 0)

				local var_144_41 = manager.ui.mainCamera.transform.position - var_144_34.position

				var_144_34.forward = Vector3.New(var_144_41.x, var_144_41.y, var_144_41.z)

				local var_144_42 = var_144_34.localEulerAngles

				var_144_42.z = 0
				var_144_42.x = 0
				var_144_34.localEulerAngles = var_144_42
			end

			local var_144_43 = 0
			local var_144_44 = 0.375

			if var_144_43 < arg_141_1.time_ and arg_141_1.time_ <= var_144_43 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_45 = arg_141_1:FormatText(StoryNameCfg[84].name)

				arg_141_1.leftNameTxt_.text = var_144_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_46 = arg_141_1:GetWordFromCfg(318031035)
				local var_144_47 = arg_141_1:FormatText(var_144_46.content)

				arg_141_1.text_.text = var_144_47

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_48 = 15
				local var_144_49 = utf8.len(var_144_47)
				local var_144_50 = var_144_48 <= 0 and var_144_44 or var_144_44 * (var_144_49 / var_144_48)

				if var_144_50 > 0 and var_144_44 < var_144_50 then
					arg_141_1.talkMaxDuration = var_144_50

					if var_144_50 + var_144_43 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_50 + var_144_43
					end
				end

				arg_141_1.text_.text = var_144_47
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031035", "story_v_out_318031.awb") ~= 0 then
					local var_144_51 = manager.audio:GetVoiceLength("story_v_out_318031", "318031035", "story_v_out_318031.awb") / 1000

					if var_144_51 + var_144_43 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_51 + var_144_43
					end

					if var_144_46.prefab_name ~= "" and arg_141_1.actors_[var_144_46.prefab_name] ~= nil then
						local var_144_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_46.prefab_name].transform, "story_v_out_318031", "318031035", "story_v_out_318031.awb")

						arg_141_1:RecordAudio("318031035", var_144_52)
						arg_141_1:RecordAudio("318031035", var_144_52)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_318031", "318031035", "story_v_out_318031.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_318031", "318031035", "story_v_out_318031.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_53 = math.max(var_144_44, arg_141_1.talkMaxDuration)

			if var_144_43 <= arg_141_1.time_ and arg_141_1.time_ < var_144_43 + var_144_53 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_43) / var_144_53

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_43 + var_144_53 and arg_141_1.time_ < var_144_43 + var_144_53 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play318031036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 318031036
		arg_145_1.duration_ = 4.033

		local var_145_0 = {
			zh = 4,
			ja = 4.033
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
				arg_145_0:Play318031037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1093ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1093ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1093ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["1093ui_story"]
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 and arg_145_1.var_.characterEffect1093ui_story == nil then
				arg_145_1.var_.characterEffect1093ui_story = var_148_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_11 = 0.200000002980232

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11

				if arg_145_1.var_.characterEffect1093ui_story then
					arg_145_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 and arg_145_1.var_.characterEffect1093ui_story then
				arg_145_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_148_13 = 0

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action459")
			end

			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_148_15 = arg_145_1.actors_["1199ui_story"].transform
			local var_148_16 = 0

			if var_148_16 < arg_145_1.time_ and arg_145_1.time_ <= var_148_16 + arg_148_0 then
				arg_145_1.var_.moveOldPos1199ui_story = var_148_15.localPosition
			end

			local var_148_17 = 0.001

			if var_148_16 <= arg_145_1.time_ and arg_145_1.time_ < var_148_16 + var_148_17 then
				local var_148_18 = (arg_145_1.time_ - var_148_16) / var_148_17
				local var_148_19 = Vector3.New(0, 100, 0)

				var_148_15.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1199ui_story, var_148_19, var_148_18)

				local var_148_20 = manager.ui.mainCamera.transform.position - var_148_15.position

				var_148_15.forward = Vector3.New(var_148_20.x, var_148_20.y, var_148_20.z)

				local var_148_21 = var_148_15.localEulerAngles

				var_148_21.z = 0
				var_148_21.x = 0
				var_148_15.localEulerAngles = var_148_21
			end

			if arg_145_1.time_ >= var_148_16 + var_148_17 and arg_145_1.time_ < var_148_16 + var_148_17 + arg_148_0 then
				var_148_15.localPosition = Vector3.New(0, 100, 0)

				local var_148_22 = manager.ui.mainCamera.transform.position - var_148_15.position

				var_148_15.forward = Vector3.New(var_148_22.x, var_148_22.y, var_148_22.z)

				local var_148_23 = var_148_15.localEulerAngles

				var_148_23.z = 0
				var_148_23.x = 0
				var_148_15.localEulerAngles = var_148_23
			end

			local var_148_24 = arg_145_1.actors_["1199ui_story"]
			local var_148_25 = 0

			if var_148_25 < arg_145_1.time_ and arg_145_1.time_ <= var_148_25 + arg_148_0 and arg_145_1.var_.characterEffect1199ui_story == nil then
				arg_145_1.var_.characterEffect1199ui_story = var_148_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_26 = 0.200000002980232

			if var_148_25 <= arg_145_1.time_ and arg_145_1.time_ < var_148_25 + var_148_26 then
				local var_148_27 = (arg_145_1.time_ - var_148_25) / var_148_26

				if arg_145_1.var_.characterEffect1199ui_story then
					local var_148_28 = Mathf.Lerp(0, 0.5, var_148_27)

					arg_145_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1199ui_story.fillRatio = var_148_28
				end
			end

			if arg_145_1.time_ >= var_148_25 + var_148_26 and arg_145_1.time_ < var_148_25 + var_148_26 + arg_148_0 and arg_145_1.var_.characterEffect1199ui_story then
				local var_148_29 = 0.5

				arg_145_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1199ui_story.fillRatio = var_148_29
			end

			local var_148_30 = arg_145_1.actors_["1015ui_story"].transform
			local var_148_31 = 0

			if var_148_31 < arg_145_1.time_ and arg_145_1.time_ <= var_148_31 + arg_148_0 then
				arg_145_1.var_.moveOldPos1015ui_story = var_148_30.localPosition
			end

			local var_148_32 = 0.001

			if var_148_31 <= arg_145_1.time_ and arg_145_1.time_ < var_148_31 + var_148_32 then
				local var_148_33 = (arg_145_1.time_ - var_148_31) / var_148_32
				local var_148_34 = Vector3.New(0.7, -1.15, -6.2)

				var_148_30.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1015ui_story, var_148_34, var_148_33)

				local var_148_35 = manager.ui.mainCamera.transform.position - var_148_30.position

				var_148_30.forward = Vector3.New(var_148_35.x, var_148_35.y, var_148_35.z)

				local var_148_36 = var_148_30.localEulerAngles

				var_148_36.z = 0
				var_148_36.x = 0
				var_148_30.localEulerAngles = var_148_36
			end

			if arg_145_1.time_ >= var_148_31 + var_148_32 and arg_145_1.time_ < var_148_31 + var_148_32 + arg_148_0 then
				var_148_30.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_148_37 = manager.ui.mainCamera.transform.position - var_148_30.position

				var_148_30.forward = Vector3.New(var_148_37.x, var_148_37.y, var_148_37.z)

				local var_148_38 = var_148_30.localEulerAngles

				var_148_38.z = 0
				var_148_38.x = 0
				var_148_30.localEulerAngles = var_148_38
			end

			local var_148_39 = 0

			if var_148_39 < arg_145_1.time_ and arg_145_1.time_ <= var_148_39 + arg_148_0 then
				arg_145_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action6_2")
			end

			local var_148_40 = 0

			if var_148_40 < arg_145_1.time_ and arg_145_1.time_ <= var_148_40 + arg_148_0 then
				arg_145_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_148_41 = arg_145_1.actors_["1015ui_story"]
			local var_148_42 = 0

			if var_148_42 < arg_145_1.time_ and arg_145_1.time_ <= var_148_42 + arg_148_0 and arg_145_1.var_.characterEffect1015ui_story == nil then
				arg_145_1.var_.characterEffect1015ui_story = var_148_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_43 = 0.200000002980232

			if var_148_42 <= arg_145_1.time_ and arg_145_1.time_ < var_148_42 + var_148_43 then
				local var_148_44 = (arg_145_1.time_ - var_148_42) / var_148_43

				if arg_145_1.var_.characterEffect1015ui_story then
					local var_148_45 = Mathf.Lerp(0, 0.5, var_148_44)

					arg_145_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1015ui_story.fillRatio = var_148_45
				end
			end

			if arg_145_1.time_ >= var_148_42 + var_148_43 and arg_145_1.time_ < var_148_42 + var_148_43 + arg_148_0 and arg_145_1.var_.characterEffect1015ui_story then
				local var_148_46 = 0.5

				arg_145_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1015ui_story.fillRatio = var_148_46
			end

			local var_148_47 = 0
			local var_148_48 = 0.45

			if var_148_47 < arg_145_1.time_ and arg_145_1.time_ <= var_148_47 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_49 = arg_145_1:FormatText(StoryNameCfg[73].name)

				arg_145_1.leftNameTxt_.text = var_148_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_50 = arg_145_1:GetWordFromCfg(318031036)
				local var_148_51 = arg_145_1:FormatText(var_148_50.content)

				arg_145_1.text_.text = var_148_51

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_52 = 18
				local var_148_53 = utf8.len(var_148_51)
				local var_148_54 = var_148_52 <= 0 and var_148_48 or var_148_48 * (var_148_53 / var_148_52)

				if var_148_54 > 0 and var_148_48 < var_148_54 then
					arg_145_1.talkMaxDuration = var_148_54

					if var_148_54 + var_148_47 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_54 + var_148_47
					end
				end

				arg_145_1.text_.text = var_148_51
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031036", "story_v_out_318031.awb") ~= 0 then
					local var_148_55 = manager.audio:GetVoiceLength("story_v_out_318031", "318031036", "story_v_out_318031.awb") / 1000

					if var_148_55 + var_148_47 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_55 + var_148_47
					end

					if var_148_50.prefab_name ~= "" and arg_145_1.actors_[var_148_50.prefab_name] ~= nil then
						local var_148_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_50.prefab_name].transform, "story_v_out_318031", "318031036", "story_v_out_318031.awb")

						arg_145_1:RecordAudio("318031036", var_148_56)
						arg_145_1:RecordAudio("318031036", var_148_56)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_318031", "318031036", "story_v_out_318031.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_318031", "318031036", "story_v_out_318031.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_57 = math.max(var_148_48, arg_145_1.talkMaxDuration)

			if var_148_47 <= arg_145_1.time_ and arg_145_1.time_ < var_148_47 + var_148_57 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_47) / var_148_57

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_47 + var_148_57 and arg_145_1.time_ < var_148_47 + var_148_57 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play318031037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 318031037
		arg_149_1.duration_ = 7.7

		local var_149_0 = {
			zh = 4.633,
			ja = 7.7
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
				arg_149_0:Play318031038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1015ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1015ui_story == nil then
				arg_149_1.var_.characterEffect1015ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1015ui_story then
					arg_149_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1015ui_story then
				arg_149_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_152_4 = 0

			if var_152_4 < arg_149_1.time_ and arg_149_1.time_ <= var_152_4 + arg_152_0 then
				arg_149_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 then
				arg_149_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_6 = arg_149_1.actors_["1093ui_story"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 and arg_149_1.var_.characterEffect1093ui_story == nil then
				arg_149_1.var_.characterEffect1093ui_story = var_152_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_8 = 0.200000002980232

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_8 then
				local var_152_9 = (arg_149_1.time_ - var_152_7) / var_152_8

				if arg_149_1.var_.characterEffect1093ui_story then
					local var_152_10 = Mathf.Lerp(0, 0.5, var_152_9)

					arg_149_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1093ui_story.fillRatio = var_152_10
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_8 and arg_149_1.time_ < var_152_7 + var_152_8 + arg_152_0 and arg_149_1.var_.characterEffect1093ui_story then
				local var_152_11 = 0.5

				arg_149_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1093ui_story.fillRatio = var_152_11
			end

			local var_152_12 = 0
			local var_152_13 = 0.625

			if var_152_12 < arg_149_1.time_ and arg_149_1.time_ <= var_152_12 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_14 = arg_149_1:FormatText(StoryNameCfg[479].name)

				arg_149_1.leftNameTxt_.text = var_152_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_15 = arg_149_1:GetWordFromCfg(318031037)
				local var_152_16 = arg_149_1:FormatText(var_152_15.content)

				arg_149_1.text_.text = var_152_16

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_17 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031037", "story_v_out_318031.awb") ~= 0 then
					local var_152_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031037", "story_v_out_318031.awb") / 1000

					if var_152_20 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_20 + var_152_12
					end

					if var_152_15.prefab_name ~= "" and arg_149_1.actors_[var_152_15.prefab_name] ~= nil then
						local var_152_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_15.prefab_name].transform, "story_v_out_318031", "318031037", "story_v_out_318031.awb")

						arg_149_1:RecordAudio("318031037", var_152_21)
						arg_149_1:RecordAudio("318031037", var_152_21)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_318031", "318031037", "story_v_out_318031.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_318031", "318031037", "story_v_out_318031.awb")
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
	Play318031038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 318031038
		arg_153_1.duration_ = 7.666

		local var_153_0 = {
			zh = 7,
			ja = 7.666
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
				arg_153_0:Play318031039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 2

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				local var_156_1 = manager.ui.mainCamera.transform.localPosition
				local var_156_2 = Vector3.New(0, 0, 10) + Vector3.New(var_156_1.x, var_156_1.y, 0)
				local var_156_3 = arg_153_1.bgs_.K01f

				var_156_3.transform.localPosition = var_156_2
				var_156_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_156_4 = var_156_3:GetComponent("SpriteRenderer")

				if var_156_4 and var_156_4.sprite then
					local var_156_5 = (var_156_3.transform.localPosition - var_156_1).z
					local var_156_6 = manager.ui.mainCameraCom_
					local var_156_7 = 2 * var_156_5 * Mathf.Tan(var_156_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_156_8 = var_156_7 * var_156_6.aspect
					local var_156_9 = var_156_4.sprite.bounds.size.x
					local var_156_10 = var_156_4.sprite.bounds.size.y
					local var_156_11 = var_156_8 / var_156_9
					local var_156_12 = var_156_7 / var_156_10
					local var_156_13 = var_156_12 < var_156_11 and var_156_11 or var_156_12

					var_156_3.transform.localScale = Vector3.New(var_156_13, var_156_13, 0)
				end

				for iter_156_0, iter_156_1 in pairs(arg_153_1.bgs_) do
					if iter_156_0 ~= "K01f" then
						iter_156_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_156_14 = 0

			if var_156_14 < arg_153_1.time_ and arg_153_1.time_ <= var_156_14 + arg_156_0 then
				arg_153_1.mask_.enabled = true
				arg_153_1.mask_.raycastTarget = true

				arg_153_1:SetGaussion(false)
			end

			local var_156_15 = 2

			if var_156_14 <= arg_153_1.time_ and arg_153_1.time_ < var_156_14 + var_156_15 then
				local var_156_16 = (arg_153_1.time_ - var_156_14) / var_156_15
				local var_156_17 = Color.New(0, 0, 0)

				var_156_17.a = Mathf.Lerp(0, 1, var_156_16)
				arg_153_1.mask_.color = var_156_17
			end

			if arg_153_1.time_ >= var_156_14 + var_156_15 and arg_153_1.time_ < var_156_14 + var_156_15 + arg_156_0 then
				local var_156_18 = Color.New(0, 0, 0)

				var_156_18.a = 1
				arg_153_1.mask_.color = var_156_18
			end

			local var_156_19 = 2

			if var_156_19 < arg_153_1.time_ and arg_153_1.time_ <= var_156_19 + arg_156_0 then
				arg_153_1.mask_.enabled = true
				arg_153_1.mask_.raycastTarget = true

				arg_153_1:SetGaussion(false)
			end

			local var_156_20 = 2

			if var_156_19 <= arg_153_1.time_ and arg_153_1.time_ < var_156_19 + var_156_20 then
				local var_156_21 = (arg_153_1.time_ - var_156_19) / var_156_20
				local var_156_22 = Color.New(0, 0, 0)

				var_156_22.a = Mathf.Lerp(1, 0, var_156_21)
				arg_153_1.mask_.color = var_156_22
			end

			if arg_153_1.time_ >= var_156_19 + var_156_20 and arg_153_1.time_ < var_156_19 + var_156_20 + arg_156_0 then
				local var_156_23 = Color.New(0, 0, 0)
				local var_156_24 = 0

				arg_153_1.mask_.enabled = false
				var_156_23.a = var_156_24
				arg_153_1.mask_.color = var_156_23
			end

			local var_156_25 = arg_153_1.actors_["1015ui_story"].transform
			local var_156_26 = 4

			if var_156_26 < arg_153_1.time_ and arg_153_1.time_ <= var_156_26 + arg_156_0 then
				arg_153_1.var_.moveOldPos1015ui_story = var_156_25.localPosition
			end

			local var_156_27 = 0.001

			if var_156_26 <= arg_153_1.time_ and arg_153_1.time_ < var_156_26 + var_156_27 then
				local var_156_28 = (arg_153_1.time_ - var_156_26) / var_156_27
				local var_156_29 = Vector3.New(0, -1.15, -6.2)

				var_156_25.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1015ui_story, var_156_29, var_156_28)

				local var_156_30 = manager.ui.mainCamera.transform.position - var_156_25.position

				var_156_25.forward = Vector3.New(var_156_30.x, var_156_30.y, var_156_30.z)

				local var_156_31 = var_156_25.localEulerAngles

				var_156_31.z = 0
				var_156_31.x = 0
				var_156_25.localEulerAngles = var_156_31
			end

			if arg_153_1.time_ >= var_156_26 + var_156_27 and arg_153_1.time_ < var_156_26 + var_156_27 + arg_156_0 then
				var_156_25.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_156_32 = manager.ui.mainCamera.transform.position - var_156_25.position

				var_156_25.forward = Vector3.New(var_156_32.x, var_156_32.y, var_156_32.z)

				local var_156_33 = var_156_25.localEulerAngles

				var_156_33.z = 0
				var_156_33.x = 0
				var_156_25.localEulerAngles = var_156_33
			end

			local var_156_34 = arg_153_1.actors_["1015ui_story"].transform
			local var_156_35 = 1.96599999815226

			if var_156_35 < arg_153_1.time_ and arg_153_1.time_ <= var_156_35 + arg_156_0 then
				arg_153_1.var_.moveOldPos1015ui_story = var_156_34.localPosition
			end

			local var_156_36 = 0.001

			if var_156_35 <= arg_153_1.time_ and arg_153_1.time_ < var_156_35 + var_156_36 then
				local var_156_37 = (arg_153_1.time_ - var_156_35) / var_156_36
				local var_156_38 = Vector3.New(0, 100, 0)

				var_156_34.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1015ui_story, var_156_38, var_156_37)

				local var_156_39 = manager.ui.mainCamera.transform.position - var_156_34.position

				var_156_34.forward = Vector3.New(var_156_39.x, var_156_39.y, var_156_39.z)

				local var_156_40 = var_156_34.localEulerAngles

				var_156_40.z = 0
				var_156_40.x = 0
				var_156_34.localEulerAngles = var_156_40
			end

			if arg_153_1.time_ >= var_156_35 + var_156_36 and arg_153_1.time_ < var_156_35 + var_156_36 + arg_156_0 then
				var_156_34.localPosition = Vector3.New(0, 100, 0)

				local var_156_41 = manager.ui.mainCamera.transform.position - var_156_34.position

				var_156_34.forward = Vector3.New(var_156_41.x, var_156_41.y, var_156_41.z)

				local var_156_42 = var_156_34.localEulerAngles

				var_156_42.z = 0
				var_156_42.x = 0
				var_156_34.localEulerAngles = var_156_42
			end

			local var_156_43 = arg_153_1.actors_["1015ui_story"]
			local var_156_44 = 4

			if var_156_44 < arg_153_1.time_ and arg_153_1.time_ <= var_156_44 + arg_156_0 and arg_153_1.var_.characterEffect1015ui_story == nil then
				arg_153_1.var_.characterEffect1015ui_story = var_156_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_45 = 0.200000002980232

			if var_156_44 <= arg_153_1.time_ and arg_153_1.time_ < var_156_44 + var_156_45 then
				local var_156_46 = (arg_153_1.time_ - var_156_44) / var_156_45

				if arg_153_1.var_.characterEffect1015ui_story then
					arg_153_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_44 + var_156_45 and arg_153_1.time_ < var_156_44 + var_156_45 + arg_156_0 and arg_153_1.var_.characterEffect1015ui_story then
				arg_153_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_156_47 = 4

			if var_156_47 < arg_153_1.time_ and arg_153_1.time_ <= var_156_47 + arg_156_0 then
				arg_153_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_156_48 = 4

			if var_156_48 < arg_153_1.time_ and arg_153_1.time_ <= var_156_48 + arg_156_0 then
				arg_153_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_156_49 = arg_153_1.actors_["1093ui_story"].transform
			local var_156_50 = 2

			if var_156_50 < arg_153_1.time_ and arg_153_1.time_ <= var_156_50 + arg_156_0 then
				arg_153_1.var_.moveOldPos1093ui_story = var_156_49.localPosition
			end

			local var_156_51 = 0.001

			if var_156_50 <= arg_153_1.time_ and arg_153_1.time_ < var_156_50 + var_156_51 then
				local var_156_52 = (arg_153_1.time_ - var_156_50) / var_156_51
				local var_156_53 = Vector3.New(0, 100, 0)

				var_156_49.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1093ui_story, var_156_53, var_156_52)

				local var_156_54 = manager.ui.mainCamera.transform.position - var_156_49.position

				var_156_49.forward = Vector3.New(var_156_54.x, var_156_54.y, var_156_54.z)

				local var_156_55 = var_156_49.localEulerAngles

				var_156_55.z = 0
				var_156_55.x = 0
				var_156_49.localEulerAngles = var_156_55
			end

			if arg_153_1.time_ >= var_156_50 + var_156_51 and arg_153_1.time_ < var_156_50 + var_156_51 + arg_156_0 then
				var_156_49.localPosition = Vector3.New(0, 100, 0)

				local var_156_56 = manager.ui.mainCamera.transform.position - var_156_49.position

				var_156_49.forward = Vector3.New(var_156_56.x, var_156_56.y, var_156_56.z)

				local var_156_57 = var_156_49.localEulerAngles

				var_156_57.z = 0
				var_156_57.x = 0
				var_156_49.localEulerAngles = var_156_57
			end

			if arg_153_1.frameCnt_ <= 1 then
				arg_153_1.dialog_:SetActive(false)
			end

			local var_156_58 = 4
			local var_156_59 = 0.375

			if var_156_58 < arg_153_1.time_ and arg_153_1.time_ <= var_156_58 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0

				arg_153_1.dialog_:SetActive(true)

				local var_156_60 = LeanTween.value(arg_153_1.dialog_, 0, 1, 0.3)

				var_156_60:setOnUpdate(LuaHelper.FloatAction(function(arg_157_0)
					arg_153_1.dialogCg_.alpha = arg_157_0
				end))
				var_156_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_153_1.dialog_)
					var_156_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_153_1.duration_ = arg_153_1.duration_ + 0.3

				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_61 = arg_153_1:FormatText(StoryNameCfg[479].name)

				arg_153_1.leftNameTxt_.text = var_156_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_62 = arg_153_1:GetWordFromCfg(318031038)
				local var_156_63 = arg_153_1:FormatText(var_156_62.content)

				arg_153_1.text_.text = var_156_63

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_64 = 15
				local var_156_65 = utf8.len(var_156_63)
				local var_156_66 = var_156_64 <= 0 and var_156_59 or var_156_59 * (var_156_65 / var_156_64)

				if var_156_66 > 0 and var_156_59 < var_156_66 then
					arg_153_1.talkMaxDuration = var_156_66
					var_156_58 = var_156_58 + 0.3

					if var_156_66 + var_156_58 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_66 + var_156_58
					end
				end

				arg_153_1.text_.text = var_156_63
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031038", "story_v_out_318031.awb") ~= 0 then
					local var_156_67 = manager.audio:GetVoiceLength("story_v_out_318031", "318031038", "story_v_out_318031.awb") / 1000

					if var_156_67 + var_156_58 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_67 + var_156_58
					end

					if var_156_62.prefab_name ~= "" and arg_153_1.actors_[var_156_62.prefab_name] ~= nil then
						local var_156_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_62.prefab_name].transform, "story_v_out_318031", "318031038", "story_v_out_318031.awb")

						arg_153_1:RecordAudio("318031038", var_156_68)
						arg_153_1:RecordAudio("318031038", var_156_68)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_318031", "318031038", "story_v_out_318031.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_318031", "318031038", "story_v_out_318031.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_69 = var_156_58 + 0.3
			local var_156_70 = math.max(var_156_59, arg_153_1.talkMaxDuration)

			if var_156_69 <= arg_153_1.time_ and arg_153_1.time_ < var_156_69 + var_156_70 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_69) / var_156_70

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_69 + var_156_70 and arg_153_1.time_ < var_156_69 + var_156_70 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play318031039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 318031039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play318031040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1015ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1015ui_story == nil then
				arg_159_1.var_.characterEffect1015ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.200000002980232

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1015ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1015ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1015ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1015ui_story.fillRatio = var_162_5
			end

			local var_162_6 = 0
			local var_162_7 = 0.7

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_8 = arg_159_1:GetWordFromCfg(318031039)
				local var_162_9 = arg_159_1:FormatText(var_162_8.content)

				arg_159_1.text_.text = var_162_9

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_10 = 28
				local var_162_11 = utf8.len(var_162_9)
				local var_162_12 = var_162_10 <= 0 and var_162_7 or var_162_7 * (var_162_11 / var_162_10)

				if var_162_12 > 0 and var_162_7 < var_162_12 then
					arg_159_1.talkMaxDuration = var_162_12

					if var_162_12 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_12 + var_162_6
					end
				end

				arg_159_1.text_.text = var_162_9
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_13 = math.max(var_162_7, arg_159_1.talkMaxDuration)

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_13 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_6) / var_162_13

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_6 + var_162_13 and arg_159_1.time_ < var_162_6 + var_162_13 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play318031040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 318031040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play318031041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1.375

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

				local var_166_2 = arg_163_1:GetWordFromCfg(318031040)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 55
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
	Play318031041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 318031041
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play318031042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.6

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[7].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(318031041)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 24
				local var_170_6 = utf8.len(var_170_4)
				local var_170_7 = var_170_5 <= 0 and var_170_1 or var_170_1 * (var_170_6 / var_170_5)

				if var_170_7 > 0 and var_170_1 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_4
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_8 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_8 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_8

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_8 and arg_167_1.time_ < var_170_0 + var_170_8 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play318031042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 318031042
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play318031043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1.175

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[7].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(318031042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 47
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_8 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_8 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_8

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_8 and arg_171_1.time_ < var_174_0 + var_174_8 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play318031043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 318031043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play318031044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 1.075

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[7].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(318031043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 43
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_8 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_8 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_8

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_8 and arg_175_1.time_ < var_178_0 + var_178_8 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play318031044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 318031044
		arg_179_1.duration_ = 5.433

		local var_179_0 = {
			zh = 5.066,
			ja = 5.433
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play318031045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1015ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1015ui_story == nil then
				arg_179_1.var_.characterEffect1015ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1015ui_story then
					arg_179_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1015ui_story then
				arg_179_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_182_4 = 0

			if var_182_4 < arg_179_1.time_ and arg_179_1.time_ <= var_182_4 + arg_182_0 then
				arg_179_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 then
				arg_179_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_6 = 0
			local var_182_7 = 0.55

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_8 = arg_179_1:FormatText(StoryNameCfg[479].name)

				arg_179_1.leftNameTxt_.text = var_182_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_9 = arg_179_1:GetWordFromCfg(318031044)
				local var_182_10 = arg_179_1:FormatText(var_182_9.content)

				arg_179_1.text_.text = var_182_10

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_11 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031044", "story_v_out_318031.awb") ~= 0 then
					local var_182_14 = manager.audio:GetVoiceLength("story_v_out_318031", "318031044", "story_v_out_318031.awb") / 1000

					if var_182_14 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_14 + var_182_6
					end

					if var_182_9.prefab_name ~= "" and arg_179_1.actors_[var_182_9.prefab_name] ~= nil then
						local var_182_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_9.prefab_name].transform, "story_v_out_318031", "318031044", "story_v_out_318031.awb")

						arg_179_1:RecordAudio("318031044", var_182_15)
						arg_179_1:RecordAudio("318031044", var_182_15)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_318031", "318031044", "story_v_out_318031.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_318031", "318031044", "story_v_out_318031.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_16 = math.max(var_182_7, arg_179_1.talkMaxDuration)

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_16 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_6) / var_182_16

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_6 + var_182_16 and arg_179_1.time_ < var_182_6 + var_182_16 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play318031045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 318031045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play318031046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1015ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1015ui_story == nil then
				arg_183_1.var_.characterEffect1015ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1015ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1015ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1015ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1015ui_story.fillRatio = var_186_5
			end

			local var_186_6 = 0
			local var_186_7 = 0.4

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_8 = arg_183_1:FormatText(StoryNameCfg[7].name)

				arg_183_1.leftNameTxt_.text = var_186_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_9 = arg_183_1:GetWordFromCfg(318031045)
				local var_186_10 = arg_183_1:FormatText(var_186_9.content)

				arg_183_1.text_.text = var_186_10

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_11 = 16
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
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_14 = math.max(var_186_7, arg_183_1.talkMaxDuration)

			if var_186_6 <= arg_183_1.time_ and arg_183_1.time_ < var_186_6 + var_186_14 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_6) / var_186_14

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_6 + var_186_14 and arg_183_1.time_ < var_186_6 + var_186_14 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play318031046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 318031046
		arg_187_1.duration_ = 7.1

		local var_187_0 = {
			zh = 5.133,
			ja = 7.1
		}
		local var_187_1 = manager.audio:GetLocalizationFlag()

		if var_187_0[var_187_1] ~= nil then
			arg_187_1.duration_ = var_187_0[var_187_1]
		end

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play318031047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1199ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1199ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0.7, -1.08, -5.9)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1199ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1199ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect1199ui_story == nil then
				arg_187_1.var_.characterEffect1199ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.200000002980232

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect1199ui_story then
					arg_187_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1199ui_story then
				arg_187_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_190_13 = 0

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_1")
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_190_15 = arg_187_1.actors_["1015ui_story"].transform
			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				arg_187_1.var_.moveOldPos1015ui_story = var_190_15.localPosition
			end

			local var_190_17 = 0.001

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_17 then
				local var_190_18 = (arg_187_1.time_ - var_190_16) / var_190_17
				local var_190_19 = Vector3.New(-0.7, -1.15, -6.2)

				var_190_15.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1015ui_story, var_190_19, var_190_18)

				local var_190_20 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_20.x, var_190_20.y, var_190_20.z)

				local var_190_21 = var_190_15.localEulerAngles

				var_190_21.z = 0
				var_190_21.x = 0
				var_190_15.localEulerAngles = var_190_21
			end

			if arg_187_1.time_ >= var_190_16 + var_190_17 and arg_187_1.time_ < var_190_16 + var_190_17 + arg_190_0 then
				var_190_15.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_190_22 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_22.x, var_190_22.y, var_190_22.z)

				local var_190_23 = var_190_15.localEulerAngles

				var_190_23.z = 0
				var_190_23.x = 0
				var_190_15.localEulerAngles = var_190_23
			end

			local var_190_24 = 0

			if var_190_24 < arg_187_1.time_ and arg_187_1.time_ <= var_190_24 + arg_190_0 then
				arg_187_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_2")
			end

			local var_190_25 = 0
			local var_190_26 = 0.65

			if var_190_25 < arg_187_1.time_ and arg_187_1.time_ <= var_190_25 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_27 = arg_187_1:FormatText(StoryNameCfg[84].name)

				arg_187_1.leftNameTxt_.text = var_190_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_28 = arg_187_1:GetWordFromCfg(318031046)
				local var_190_29 = arg_187_1:FormatText(var_190_28.content)

				arg_187_1.text_.text = var_190_29

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_30 = 26
				local var_190_31 = utf8.len(var_190_29)
				local var_190_32 = var_190_30 <= 0 and var_190_26 or var_190_26 * (var_190_31 / var_190_30)

				if var_190_32 > 0 and var_190_26 < var_190_32 then
					arg_187_1.talkMaxDuration = var_190_32

					if var_190_32 + var_190_25 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_32 + var_190_25
					end
				end

				arg_187_1.text_.text = var_190_29
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031046", "story_v_out_318031.awb") ~= 0 then
					local var_190_33 = manager.audio:GetVoiceLength("story_v_out_318031", "318031046", "story_v_out_318031.awb") / 1000

					if var_190_33 + var_190_25 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_33 + var_190_25
					end

					if var_190_28.prefab_name ~= "" and arg_187_1.actors_[var_190_28.prefab_name] ~= nil then
						local var_190_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_28.prefab_name].transform, "story_v_out_318031", "318031046", "story_v_out_318031.awb")

						arg_187_1:RecordAudio("318031046", var_190_34)
						arg_187_1:RecordAudio("318031046", var_190_34)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_318031", "318031046", "story_v_out_318031.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_318031", "318031046", "story_v_out_318031.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_35 = math.max(var_190_26, arg_187_1.talkMaxDuration)

			if var_190_25 <= arg_187_1.time_ and arg_187_1.time_ < var_190_25 + var_190_35 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_25) / var_190_35

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_25 + var_190_35 and arg_187_1.time_ < var_190_25 + var_190_35 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play318031047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 318031047
		arg_191_1.duration_ = 13.4

		local var_191_0 = {
			zh = 7.2,
			ja = 13.4
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
				arg_191_0:Play318031048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.875

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[84].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(318031047)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031047", "story_v_out_318031.awb") ~= 0 then
					local var_194_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031047", "story_v_out_318031.awb") / 1000

					if var_194_8 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_0
					end

					if var_194_3.prefab_name ~= "" and arg_191_1.actors_[var_194_3.prefab_name] ~= nil then
						local var_194_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_3.prefab_name].transform, "story_v_out_318031", "318031047", "story_v_out_318031.awb")

						arg_191_1:RecordAudio("318031047", var_194_9)
						arg_191_1:RecordAudio("318031047", var_194_9)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_318031", "318031047", "story_v_out_318031.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_318031", "318031047", "story_v_out_318031.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_10 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_10 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_10

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_10 and arg_191_1.time_ < var_194_0 + var_194_10 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play318031048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 318031048
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play318031049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1199ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1199ui_story == nil then
				arg_195_1.var_.characterEffect1199ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1199ui_story then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1199ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1199ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1199ui_story.fillRatio = var_198_5
			end

			local var_198_6 = 0
			local var_198_7 = 0.85

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_8 = arg_195_1:FormatText(StoryNameCfg[7].name)

				arg_195_1.leftNameTxt_.text = var_198_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_9 = arg_195_1:GetWordFromCfg(318031048)
				local var_198_10 = arg_195_1:FormatText(var_198_9.content)

				arg_195_1.text_.text = var_198_10

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_11 = 34
				local var_198_12 = utf8.len(var_198_10)
				local var_198_13 = var_198_11 <= 0 and var_198_7 or var_198_7 * (var_198_12 / var_198_11)

				if var_198_13 > 0 and var_198_7 < var_198_13 then
					arg_195_1.talkMaxDuration = var_198_13

					if var_198_13 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_13 + var_198_6
					end
				end

				arg_195_1.text_.text = var_198_10
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_14 = math.max(var_198_7, arg_195_1.talkMaxDuration)

			if var_198_6 <= arg_195_1.time_ and arg_195_1.time_ < var_198_6 + var_198_14 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_6) / var_198_14

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_6 + var_198_14 and arg_195_1.time_ < var_198_6 + var_198_14 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play318031049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 318031049
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play318031050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.8

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[7].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(318031049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 32
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_1 or var_202_1 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_1 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_8 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_8 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_8

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_8 and arg_199_1.time_ < var_202_0 + var_202_8 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play318031050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 318031050
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play318031051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 1.475

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[7].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(318031050)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 59
				local var_206_6 = utf8.len(var_206_4)
				local var_206_7 = var_206_5 <= 0 and var_206_1 or var_206_1 * (var_206_6 / var_206_5)

				if var_206_7 > 0 and var_206_1 < var_206_7 then
					arg_203_1.talkMaxDuration = var_206_7

					if var_206_7 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_7 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_4
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_8 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_8 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_8

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_8 and arg_203_1.time_ < var_206_0 + var_206_8 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play318031051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 318031051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play318031052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.3

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[7].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(318031051)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 51
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_8 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_8 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_8

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_8 and arg_207_1.time_ < var_210_0 + var_210_8 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play318031052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 318031052
		arg_211_1.duration_ = 7.766

		local var_211_0 = {
			zh = 7.1,
			ja = 7.766
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
				arg_211_0:Play318031053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1015ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1015ui_story == nil then
				arg_211_1.var_.characterEffect1015ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1015ui_story then
					arg_211_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1015ui_story then
				arg_211_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_214_4 = 0
			local var_214_5 = 0.65

			if var_214_4 < arg_211_1.time_ and arg_211_1.time_ <= var_214_4 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_6 = arg_211_1:FormatText(StoryNameCfg[479].name)

				arg_211_1.leftNameTxt_.text = var_214_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_7 = arg_211_1:GetWordFromCfg(318031052)
				local var_214_8 = arg_211_1:FormatText(var_214_7.content)

				arg_211_1.text_.text = var_214_8

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_9 = 26
				local var_214_10 = utf8.len(var_214_8)
				local var_214_11 = var_214_9 <= 0 and var_214_5 or var_214_5 * (var_214_10 / var_214_9)

				if var_214_11 > 0 and var_214_5 < var_214_11 then
					arg_211_1.talkMaxDuration = var_214_11

					if var_214_11 + var_214_4 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_11 + var_214_4
					end
				end

				arg_211_1.text_.text = var_214_8
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031052", "story_v_out_318031.awb") ~= 0 then
					local var_214_12 = manager.audio:GetVoiceLength("story_v_out_318031", "318031052", "story_v_out_318031.awb") / 1000

					if var_214_12 + var_214_4 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_12 + var_214_4
					end

					if var_214_7.prefab_name ~= "" and arg_211_1.actors_[var_214_7.prefab_name] ~= nil then
						local var_214_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_7.prefab_name].transform, "story_v_out_318031", "318031052", "story_v_out_318031.awb")

						arg_211_1:RecordAudio("318031052", var_214_13)
						arg_211_1:RecordAudio("318031052", var_214_13)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_318031", "318031052", "story_v_out_318031.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_318031", "318031052", "story_v_out_318031.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_14 = math.max(var_214_5, arg_211_1.talkMaxDuration)

			if var_214_4 <= arg_211_1.time_ and arg_211_1.time_ < var_214_4 + var_214_14 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_4) / var_214_14

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_4 + var_214_14 and arg_211_1.time_ < var_214_4 + var_214_14 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play318031053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 318031053
		arg_215_1.duration_ = 8.766

		local var_215_0 = {
			zh = 6,
			ja = 8.766
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
				arg_215_0:Play318031054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1015ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1015ui_story == nil then
				arg_215_1.var_.characterEffect1015ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1015ui_story then
					arg_215_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1015ui_story then
				arg_215_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_218_4 = 0
			local var_218_5 = 0.775

			if var_218_4 < arg_215_1.time_ and arg_215_1.time_ <= var_218_4 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_6 = arg_215_1:FormatText(StoryNameCfg[479].name)

				arg_215_1.leftNameTxt_.text = var_218_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_7 = arg_215_1:GetWordFromCfg(318031053)
				local var_218_8 = arg_215_1:FormatText(var_218_7.content)

				arg_215_1.text_.text = var_218_8

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_9 = 31
				local var_218_10 = utf8.len(var_218_8)
				local var_218_11 = var_218_9 <= 0 and var_218_5 or var_218_5 * (var_218_10 / var_218_9)

				if var_218_11 > 0 and var_218_5 < var_218_11 then
					arg_215_1.talkMaxDuration = var_218_11

					if var_218_11 + var_218_4 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_11 + var_218_4
					end
				end

				arg_215_1.text_.text = var_218_8
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031053", "story_v_out_318031.awb") ~= 0 then
					local var_218_12 = manager.audio:GetVoiceLength("story_v_out_318031", "318031053", "story_v_out_318031.awb") / 1000

					if var_218_12 + var_218_4 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_12 + var_218_4
					end

					if var_218_7.prefab_name ~= "" and arg_215_1.actors_[var_218_7.prefab_name] ~= nil then
						local var_218_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_7.prefab_name].transform, "story_v_out_318031", "318031053", "story_v_out_318031.awb")

						arg_215_1:RecordAudio("318031053", var_218_13)
						arg_215_1:RecordAudio("318031053", var_218_13)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_318031", "318031053", "story_v_out_318031.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_318031", "318031053", "story_v_out_318031.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_14 = math.max(var_218_5, arg_215_1.talkMaxDuration)

			if var_218_4 <= arg_215_1.time_ and arg_215_1.time_ < var_218_4 + var_218_14 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_4) / var_218_14

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_4 + var_218_14 and arg_215_1.time_ < var_218_4 + var_218_14 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play318031054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 318031054
		arg_219_1.duration_ = 8.1

		local var_219_0 = {
			zh = 7.433,
			ja = 8.1
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
				arg_219_0:Play318031055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.825

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[479].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(318031054)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 33
				local var_222_6 = utf8.len(var_222_4)
				local var_222_7 = var_222_5 <= 0 and var_222_1 or var_222_1 * (var_222_6 / var_222_5)

				if var_222_7 > 0 and var_222_1 < var_222_7 then
					arg_219_1.talkMaxDuration = var_222_7

					if var_222_7 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_7 + var_222_0
					end
				end

				arg_219_1.text_.text = var_222_4
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031054", "story_v_out_318031.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031054", "story_v_out_318031.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_318031", "318031054", "story_v_out_318031.awb")

						arg_219_1:RecordAudio("318031054", var_222_9)
						arg_219_1:RecordAudio("318031054", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_318031", "318031054", "story_v_out_318031.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_318031", "318031054", "story_v_out_318031.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_10 = math.max(var_222_1, arg_219_1.talkMaxDuration)

			if var_222_0 <= arg_219_1.time_ and arg_219_1.time_ < var_222_0 + var_222_10 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_0) / var_222_10

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_0 + var_222_10 and arg_219_1.time_ < var_222_0 + var_222_10 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play318031055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 318031055
		arg_223_1.duration_ = 0.999999999999

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"

			SetActive(arg_223_1.choicesGo_, true)

			for iter_224_0, iter_224_1 in ipairs(arg_223_1.choices_) do
				local var_224_0 = iter_224_0 <= 2

				SetActive(iter_224_1.go, var_224_0)
			end

			arg_223_1.choices_[1].txt.text = arg_223_1:FormatText(StoryChoiceCfg[640].name)
			arg_223_1.choices_[2].txt.text = arg_223_1:FormatText(StoryChoiceCfg[641].name)
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play318031056(arg_223_1)
			end

			if arg_225_0 == 2 then
				arg_223_0:Play318031057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1015ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1015ui_story == nil then
				arg_223_1.var_.characterEffect1015ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1015ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1015ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1015ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1015ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.allBtn_.enabled = false
			end

			local var_226_7 = 0.5

			if arg_223_1.time_ >= var_226_6 + var_226_7 and arg_223_1.time_ < var_226_6 + var_226_7 + arg_226_0 then
				arg_223_1.allBtn_.enabled = true
			end
		end
	end,
	Play318031056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 318031056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play318031058(arg_227_1)
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

				local var_230_3 = arg_227_1:GetWordFromCfg(318031056)
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
	Play318031058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 318031058
		arg_231_1.duration_ = 2.366

		local var_231_0 = {
			zh = 1.833,
			ja = 2.366
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
				arg_231_0:Play318031059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1015ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1015ui_story == nil then
				arg_231_1.var_.characterEffect1015ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1015ui_story then
					arg_231_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1015ui_story then
				arg_231_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_234_4 = 0
			local var_234_5 = 0.2

			if var_234_4 < arg_231_1.time_ and arg_231_1.time_ <= var_234_4 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_6 = arg_231_1:FormatText(StoryNameCfg[479].name)

				arg_231_1.leftNameTxt_.text = var_234_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_7 = arg_231_1:GetWordFromCfg(318031058)
				local var_234_8 = arg_231_1:FormatText(var_234_7.content)

				arg_231_1.text_.text = var_234_8

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_9 = 8
				local var_234_10 = utf8.len(var_234_8)
				local var_234_11 = var_234_9 <= 0 and var_234_5 or var_234_5 * (var_234_10 / var_234_9)

				if var_234_11 > 0 and var_234_5 < var_234_11 then
					arg_231_1.talkMaxDuration = var_234_11

					if var_234_11 + var_234_4 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_11 + var_234_4
					end
				end

				arg_231_1.text_.text = var_234_8
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031058", "story_v_out_318031.awb") ~= 0 then
					local var_234_12 = manager.audio:GetVoiceLength("story_v_out_318031", "318031058", "story_v_out_318031.awb") / 1000

					if var_234_12 + var_234_4 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_12 + var_234_4
					end

					if var_234_7.prefab_name ~= "" and arg_231_1.actors_[var_234_7.prefab_name] ~= nil then
						local var_234_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_7.prefab_name].transform, "story_v_out_318031", "318031058", "story_v_out_318031.awb")

						arg_231_1:RecordAudio("318031058", var_234_13)
						arg_231_1:RecordAudio("318031058", var_234_13)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_318031", "318031058", "story_v_out_318031.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_318031", "318031058", "story_v_out_318031.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_14 = math.max(var_234_5, arg_231_1.talkMaxDuration)

			if var_234_4 <= arg_231_1.time_ and arg_231_1.time_ < var_234_4 + var_234_14 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_4) / var_234_14

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_4 + var_234_14 and arg_231_1.time_ < var_234_4 + var_234_14 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play318031059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 318031059
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play318031060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1015ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1015ui_story == nil then
				arg_235_1.var_.characterEffect1015ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1015ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1015ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1015ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1015ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0
			local var_238_7 = 1.025

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

				local var_238_9 = arg_235_1:GetWordFromCfg(318031059)
				local var_238_10 = arg_235_1:FormatText(var_238_9.content)

				arg_235_1.text_.text = var_238_10

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_11 = 41
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
	Play318031060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 318031060
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play318031061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.475

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

				local var_242_3 = arg_239_1:GetWordFromCfg(318031060)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 19
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
	Play318031061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 318031061
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play318031062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.5

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[7].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(318031061)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 20
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
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_8 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_8 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_8

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_8 and arg_243_1.time_ < var_246_0 + var_246_8 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play318031062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 318031062
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play318031063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.75

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_2 = arg_247_1:GetWordFromCfg(318031062)
				local var_250_3 = arg_247_1:FormatText(var_250_2.content)

				arg_247_1.text_.text = var_250_3

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_4 = 30
				local var_250_5 = utf8.len(var_250_3)
				local var_250_6 = var_250_4 <= 0 and var_250_1 or var_250_1 * (var_250_5 / var_250_4)

				if var_250_6 > 0 and var_250_1 < var_250_6 then
					arg_247_1.talkMaxDuration = var_250_6

					if var_250_6 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_6 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_3
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_7 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_7 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_7

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_7 and arg_247_1.time_ < var_250_0 + var_250_7 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play318031063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 318031063
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play318031064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 1.425

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_2 = arg_251_1:GetWordFromCfg(318031063)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 57
				local var_254_5 = utf8.len(var_254_3)
				local var_254_6 = var_254_4 <= 0 and var_254_1 or var_254_1 * (var_254_5 / var_254_4)

				if var_254_6 > 0 and var_254_1 < var_254_6 then
					arg_251_1.talkMaxDuration = var_254_6

					if var_254_6 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_6 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_3
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_7 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_7 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_7

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_7 and arg_251_1.time_ < var_254_0 + var_254_7 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play318031064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 318031064
		arg_255_1.duration_ = 6.4

		local var_255_0 = {
			zh = 6.4,
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
				arg_255_0:Play318031065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1015ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1015ui_story == nil then
				arg_255_1.var_.characterEffect1015ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1015ui_story then
					arg_255_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1015ui_story then
				arg_255_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_258_4 = 0

			if var_258_4 < arg_255_1.time_ and arg_255_1.time_ <= var_258_4 + arg_258_0 then
				arg_255_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_258_5 = 0
			local var_258_6 = 0.775

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_7 = arg_255_1:FormatText(StoryNameCfg[479].name)

				arg_255_1.leftNameTxt_.text = var_258_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_8 = arg_255_1:GetWordFromCfg(318031064)
				local var_258_9 = arg_255_1:FormatText(var_258_8.content)

				arg_255_1.text_.text = var_258_9

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_10 = 31
				local var_258_11 = utf8.len(var_258_9)
				local var_258_12 = var_258_10 <= 0 and var_258_6 or var_258_6 * (var_258_11 / var_258_10)

				if var_258_12 > 0 and var_258_6 < var_258_12 then
					arg_255_1.talkMaxDuration = var_258_12

					if var_258_12 + var_258_5 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_12 + var_258_5
					end
				end

				arg_255_1.text_.text = var_258_9
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031064", "story_v_out_318031.awb") ~= 0 then
					local var_258_13 = manager.audio:GetVoiceLength("story_v_out_318031", "318031064", "story_v_out_318031.awb") / 1000

					if var_258_13 + var_258_5 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_13 + var_258_5
					end

					if var_258_8.prefab_name ~= "" and arg_255_1.actors_[var_258_8.prefab_name] ~= nil then
						local var_258_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_8.prefab_name].transform, "story_v_out_318031", "318031064", "story_v_out_318031.awb")

						arg_255_1:RecordAudio("318031064", var_258_14)
						arg_255_1:RecordAudio("318031064", var_258_14)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_318031", "318031064", "story_v_out_318031.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_318031", "318031064", "story_v_out_318031.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_15 = math.max(var_258_6, arg_255_1.talkMaxDuration)

			if var_258_5 <= arg_255_1.time_ and arg_255_1.time_ < var_258_5 + var_258_15 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_5) / var_258_15

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_5 + var_258_15 and arg_255_1.time_ < var_258_5 + var_258_15 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play318031065 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 318031065
		arg_259_1.duration_ = 2.666

		local var_259_0 = {
			zh = 2.4,
			ja = 2.666
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
				arg_259_0:Play318031066(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1199ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1199ui_story == nil then
				arg_259_1.var_.characterEffect1199ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.200000002980232

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1199ui_story then
					arg_259_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1199ui_story then
				arg_259_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_262_4 = 0

			if var_262_4 < arg_259_1.time_ and arg_259_1.time_ <= var_262_4 + arg_262_0 then
				arg_259_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199actionlink/1199action436")
			end

			local var_262_5 = 0

			if var_262_5 < arg_259_1.time_ and arg_259_1.time_ <= var_262_5 + arg_262_0 then
				arg_259_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_262_6 = arg_259_1.actors_["1015ui_story"]
			local var_262_7 = 0

			if var_262_7 < arg_259_1.time_ and arg_259_1.time_ <= var_262_7 + arg_262_0 and arg_259_1.var_.characterEffect1015ui_story == nil then
				arg_259_1.var_.characterEffect1015ui_story = var_262_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_8 = 0.200000002980232

			if var_262_7 <= arg_259_1.time_ and arg_259_1.time_ < var_262_7 + var_262_8 then
				local var_262_9 = (arg_259_1.time_ - var_262_7) / var_262_8

				if arg_259_1.var_.characterEffect1015ui_story then
					local var_262_10 = Mathf.Lerp(0, 0.5, var_262_9)

					arg_259_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1015ui_story.fillRatio = var_262_10
				end
			end

			if arg_259_1.time_ >= var_262_7 + var_262_8 and arg_259_1.time_ < var_262_7 + var_262_8 + arg_262_0 and arg_259_1.var_.characterEffect1015ui_story then
				local var_262_11 = 0.5

				arg_259_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1015ui_story.fillRatio = var_262_11
			end

			local var_262_12 = 0
			local var_262_13 = 0.3

			if var_262_12 < arg_259_1.time_ and arg_259_1.time_ <= var_262_12 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_14 = arg_259_1:FormatText(StoryNameCfg[84].name)

				arg_259_1.leftNameTxt_.text = var_262_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_15 = arg_259_1:GetWordFromCfg(318031065)
				local var_262_16 = arg_259_1:FormatText(var_262_15.content)

				arg_259_1.text_.text = var_262_16

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_17 = 12
				local var_262_18 = utf8.len(var_262_16)
				local var_262_19 = var_262_17 <= 0 and var_262_13 or var_262_13 * (var_262_18 / var_262_17)

				if var_262_19 > 0 and var_262_13 < var_262_19 then
					arg_259_1.talkMaxDuration = var_262_19

					if var_262_19 + var_262_12 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_19 + var_262_12
					end
				end

				arg_259_1.text_.text = var_262_16
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031065", "story_v_out_318031.awb") ~= 0 then
					local var_262_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031065", "story_v_out_318031.awb") / 1000

					if var_262_20 + var_262_12 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_20 + var_262_12
					end

					if var_262_15.prefab_name ~= "" and arg_259_1.actors_[var_262_15.prefab_name] ~= nil then
						local var_262_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_15.prefab_name].transform, "story_v_out_318031", "318031065", "story_v_out_318031.awb")

						arg_259_1:RecordAudio("318031065", var_262_21)
						arg_259_1:RecordAudio("318031065", var_262_21)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_318031", "318031065", "story_v_out_318031.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_318031", "318031065", "story_v_out_318031.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_22 = math.max(var_262_13, arg_259_1.talkMaxDuration)

			if var_262_12 <= arg_259_1.time_ and arg_259_1.time_ < var_262_12 + var_262_22 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_12) / var_262_22

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_12 + var_262_22 and arg_259_1.time_ < var_262_12 + var_262_22 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play318031066 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 318031066
		arg_263_1.duration_ = 5.833

		local var_263_0 = {
			zh = 4.6,
			ja = 5.833
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
				arg_263_0:Play318031067(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1049ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1049ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, -1.2, -6)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1049ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1049ui_story"]
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect1049ui_story == nil then
				arg_263_1.var_.characterEffect1049ui_story = var_266_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_11 = 0.200000002980232

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11

				if arg_263_1.var_.characterEffect1049ui_story then
					arg_263_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 and arg_263_1.var_.characterEffect1049ui_story then
				arg_263_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_266_13 = 0

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action7_1")
			end

			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_266_15 = arg_263_1.actors_["1199ui_story"].transform
			local var_266_16 = 0

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				arg_263_1.var_.moveOldPos1199ui_story = var_266_15.localPosition
			end

			local var_266_17 = 0.001

			if var_266_16 <= arg_263_1.time_ and arg_263_1.time_ < var_266_16 + var_266_17 then
				local var_266_18 = (arg_263_1.time_ - var_266_16) / var_266_17
				local var_266_19 = Vector3.New(0, 100, 0)

				var_266_15.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1199ui_story, var_266_19, var_266_18)

				local var_266_20 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_20.x, var_266_20.y, var_266_20.z)

				local var_266_21 = var_266_15.localEulerAngles

				var_266_21.z = 0
				var_266_21.x = 0
				var_266_15.localEulerAngles = var_266_21
			end

			if arg_263_1.time_ >= var_266_16 + var_266_17 and arg_263_1.time_ < var_266_16 + var_266_17 + arg_266_0 then
				var_266_15.localPosition = Vector3.New(0, 100, 0)

				local var_266_22 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_22.x, var_266_22.y, var_266_22.z)

				local var_266_23 = var_266_15.localEulerAngles

				var_266_23.z = 0
				var_266_23.x = 0
				var_266_15.localEulerAngles = var_266_23
			end

			local var_266_24 = arg_263_1.actors_["1199ui_story"]
			local var_266_25 = 0

			if var_266_25 < arg_263_1.time_ and arg_263_1.time_ <= var_266_25 + arg_266_0 and arg_263_1.var_.characterEffect1199ui_story == nil then
				arg_263_1.var_.characterEffect1199ui_story = var_266_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_26 = 0.200000002980232

			if var_266_25 <= arg_263_1.time_ and arg_263_1.time_ < var_266_25 + var_266_26 then
				local var_266_27 = (arg_263_1.time_ - var_266_25) / var_266_26

				if arg_263_1.var_.characterEffect1199ui_story then
					local var_266_28 = Mathf.Lerp(0, 0.5, var_266_27)

					arg_263_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_263_1.var_.characterEffect1199ui_story.fillRatio = var_266_28
				end
			end

			if arg_263_1.time_ >= var_266_25 + var_266_26 and arg_263_1.time_ < var_266_25 + var_266_26 + arg_266_0 and arg_263_1.var_.characterEffect1199ui_story then
				local var_266_29 = 0.5

				arg_263_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_263_1.var_.characterEffect1199ui_story.fillRatio = var_266_29
			end

			local var_266_30 = arg_263_1.actors_["1015ui_story"].transform
			local var_266_31 = 0

			if var_266_31 < arg_263_1.time_ and arg_263_1.time_ <= var_266_31 + arg_266_0 then
				arg_263_1.var_.moveOldPos1015ui_story = var_266_30.localPosition
			end

			local var_266_32 = 0.001

			if var_266_31 <= arg_263_1.time_ and arg_263_1.time_ < var_266_31 + var_266_32 then
				local var_266_33 = (arg_263_1.time_ - var_266_31) / var_266_32
				local var_266_34 = Vector3.New(0, 100, 0)

				var_266_30.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1015ui_story, var_266_34, var_266_33)

				local var_266_35 = manager.ui.mainCamera.transform.position - var_266_30.position

				var_266_30.forward = Vector3.New(var_266_35.x, var_266_35.y, var_266_35.z)

				local var_266_36 = var_266_30.localEulerAngles

				var_266_36.z = 0
				var_266_36.x = 0
				var_266_30.localEulerAngles = var_266_36
			end

			if arg_263_1.time_ >= var_266_31 + var_266_32 and arg_263_1.time_ < var_266_31 + var_266_32 + arg_266_0 then
				var_266_30.localPosition = Vector3.New(0, 100, 0)

				local var_266_37 = manager.ui.mainCamera.transform.position - var_266_30.position

				var_266_30.forward = Vector3.New(var_266_37.x, var_266_37.y, var_266_37.z)

				local var_266_38 = var_266_30.localEulerAngles

				var_266_38.z = 0
				var_266_38.x = 0
				var_266_30.localEulerAngles = var_266_38
			end

			local var_266_39 = 0
			local var_266_40 = 0.45

			if var_266_39 < arg_263_1.time_ and arg_263_1.time_ <= var_266_39 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_41 = arg_263_1:FormatText(StoryNameCfg[562].name)

				arg_263_1.leftNameTxt_.text = var_266_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_42 = arg_263_1:GetWordFromCfg(318031066)
				local var_266_43 = arg_263_1:FormatText(var_266_42.content)

				arg_263_1.text_.text = var_266_43

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_44 = 18
				local var_266_45 = utf8.len(var_266_43)
				local var_266_46 = var_266_44 <= 0 and var_266_40 or var_266_40 * (var_266_45 / var_266_44)

				if var_266_46 > 0 and var_266_40 < var_266_46 then
					arg_263_1.talkMaxDuration = var_266_46

					if var_266_46 + var_266_39 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_46 + var_266_39
					end
				end

				arg_263_1.text_.text = var_266_43
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031066", "story_v_out_318031.awb") ~= 0 then
					local var_266_47 = manager.audio:GetVoiceLength("story_v_out_318031", "318031066", "story_v_out_318031.awb") / 1000

					if var_266_47 + var_266_39 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_47 + var_266_39
					end

					if var_266_42.prefab_name ~= "" and arg_263_1.actors_[var_266_42.prefab_name] ~= nil then
						local var_266_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_42.prefab_name].transform, "story_v_out_318031", "318031066", "story_v_out_318031.awb")

						arg_263_1:RecordAudio("318031066", var_266_48)
						arg_263_1:RecordAudio("318031066", var_266_48)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_318031", "318031066", "story_v_out_318031.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_318031", "318031066", "story_v_out_318031.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_49 = math.max(var_266_40, arg_263_1.talkMaxDuration)

			if var_266_39 <= arg_263_1.time_ and arg_263_1.time_ < var_266_39 + var_266_49 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_39) / var_266_49

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_39 + var_266_49 and arg_263_1.time_ < var_266_39 + var_266_49 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play318031067 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 318031067
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play318031068(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1049ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1049ui_story == nil then
				arg_267_1.var_.characterEffect1049ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.200000002980232

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1049ui_story then
					local var_270_4 = Mathf.Lerp(0, 0.5, var_270_3)

					arg_267_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1049ui_story.fillRatio = var_270_4
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1049ui_story then
				local var_270_5 = 0.5

				arg_267_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1049ui_story.fillRatio = var_270_5
			end

			local var_270_6 = 0
			local var_270_7 = 0.225

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_8 = arg_267_1:FormatText(StoryNameCfg[7].name)

				arg_267_1.leftNameTxt_.text = var_270_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_9 = arg_267_1:GetWordFromCfg(318031067)
				local var_270_10 = arg_267_1:FormatText(var_270_9.content)

				arg_267_1.text_.text = var_270_10

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_11 = 9
				local var_270_12 = utf8.len(var_270_10)
				local var_270_13 = var_270_11 <= 0 and var_270_7 or var_270_7 * (var_270_12 / var_270_11)

				if var_270_13 > 0 and var_270_7 < var_270_13 then
					arg_267_1.talkMaxDuration = var_270_13

					if var_270_13 + var_270_6 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_13 + var_270_6
					end
				end

				arg_267_1.text_.text = var_270_10
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_14 = math.max(var_270_7, arg_267_1.talkMaxDuration)

			if var_270_6 <= arg_267_1.time_ and arg_267_1.time_ < var_270_6 + var_270_14 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_6) / var_270_14

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_6 + var_270_14 and arg_267_1.time_ < var_270_6 + var_270_14 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play318031068 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 318031068
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play318031069(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 1.375

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_2 = arg_271_1:FormatText(StoryNameCfg[7].name)

				arg_271_1.leftNameTxt_.text = var_274_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_3 = arg_271_1:GetWordFromCfg(318031068)
				local var_274_4 = arg_271_1:FormatText(var_274_3.content)

				arg_271_1.text_.text = var_274_4

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_5 = 55
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
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_8 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_8 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_8

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_8 and arg_271_1.time_ < var_274_0 + var_274_8 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play318031069 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 318031069
		arg_275_1.duration_ = 3.066

		local var_275_0 = {
			zh = 2.7,
			ja = 3.066
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
				arg_275_0:Play318031070(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1199ui_story"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1199ui_story = var_278_0.localPosition
			end

			local var_278_2 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2
				local var_278_4 = Vector3.New(0, -1.08, -5.9)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1199ui_story, var_278_4, var_278_3)

				local var_278_5 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_5.x, var_278_5.y, var_278_5.z)

				local var_278_6 = var_278_0.localEulerAngles

				var_278_6.z = 0
				var_278_6.x = 0
				var_278_0.localEulerAngles = var_278_6
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_278_7 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_7.x, var_278_7.y, var_278_7.z)

				local var_278_8 = var_278_0.localEulerAngles

				var_278_8.z = 0
				var_278_8.x = 0
				var_278_0.localEulerAngles = var_278_8
			end

			local var_278_9 = arg_275_1.actors_["1199ui_story"]
			local var_278_10 = 0

			if var_278_10 < arg_275_1.time_ and arg_275_1.time_ <= var_278_10 + arg_278_0 and arg_275_1.var_.characterEffect1199ui_story == nil then
				arg_275_1.var_.characterEffect1199ui_story = var_278_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_11 = 0.200000002980232

			if var_278_10 <= arg_275_1.time_ and arg_275_1.time_ < var_278_10 + var_278_11 then
				local var_278_12 = (arg_275_1.time_ - var_278_10) / var_278_11

				if arg_275_1.var_.characterEffect1199ui_story then
					arg_275_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_10 + var_278_11 and arg_275_1.time_ < var_278_10 + var_278_11 + arg_278_0 and arg_275_1.var_.characterEffect1199ui_story then
				arg_275_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_278_13 = arg_275_1.actors_["1049ui_story"].transform
			local var_278_14 = 0

			if var_278_14 < arg_275_1.time_ and arg_275_1.time_ <= var_278_14 + arg_278_0 then
				arg_275_1.var_.moveOldPos1049ui_story = var_278_13.localPosition
			end

			local var_278_15 = 0.001

			if var_278_14 <= arg_275_1.time_ and arg_275_1.time_ < var_278_14 + var_278_15 then
				local var_278_16 = (arg_275_1.time_ - var_278_14) / var_278_15
				local var_278_17 = Vector3.New(0, 100, 0)

				var_278_13.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1049ui_story, var_278_17, var_278_16)

				local var_278_18 = manager.ui.mainCamera.transform.position - var_278_13.position

				var_278_13.forward = Vector3.New(var_278_18.x, var_278_18.y, var_278_18.z)

				local var_278_19 = var_278_13.localEulerAngles

				var_278_19.z = 0
				var_278_19.x = 0
				var_278_13.localEulerAngles = var_278_19
			end

			if arg_275_1.time_ >= var_278_14 + var_278_15 and arg_275_1.time_ < var_278_14 + var_278_15 + arg_278_0 then
				var_278_13.localPosition = Vector3.New(0, 100, 0)

				local var_278_20 = manager.ui.mainCamera.transform.position - var_278_13.position

				var_278_13.forward = Vector3.New(var_278_20.x, var_278_20.y, var_278_20.z)

				local var_278_21 = var_278_13.localEulerAngles

				var_278_21.z = 0
				var_278_21.x = 0
				var_278_13.localEulerAngles = var_278_21
			end

			local var_278_22 = 0
			local var_278_23 = 0.3

			if var_278_22 < arg_275_1.time_ and arg_275_1.time_ <= var_278_22 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_24 = arg_275_1:FormatText(StoryNameCfg[84].name)

				arg_275_1.leftNameTxt_.text = var_278_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_25 = arg_275_1:GetWordFromCfg(318031069)
				local var_278_26 = arg_275_1:FormatText(var_278_25.content)

				arg_275_1.text_.text = var_278_26

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_27 = 12
				local var_278_28 = utf8.len(var_278_26)
				local var_278_29 = var_278_27 <= 0 and var_278_23 or var_278_23 * (var_278_28 / var_278_27)

				if var_278_29 > 0 and var_278_23 < var_278_29 then
					arg_275_1.talkMaxDuration = var_278_29

					if var_278_29 + var_278_22 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_29 + var_278_22
					end
				end

				arg_275_1.text_.text = var_278_26
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031069", "story_v_out_318031.awb") ~= 0 then
					local var_278_30 = manager.audio:GetVoiceLength("story_v_out_318031", "318031069", "story_v_out_318031.awb") / 1000

					if var_278_30 + var_278_22 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_30 + var_278_22
					end

					if var_278_25.prefab_name ~= "" and arg_275_1.actors_[var_278_25.prefab_name] ~= nil then
						local var_278_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_25.prefab_name].transform, "story_v_out_318031", "318031069", "story_v_out_318031.awb")

						arg_275_1:RecordAudio("318031069", var_278_31)
						arg_275_1:RecordAudio("318031069", var_278_31)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_318031", "318031069", "story_v_out_318031.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_318031", "318031069", "story_v_out_318031.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_32 = math.max(var_278_23, arg_275_1.talkMaxDuration)

			if var_278_22 <= arg_275_1.time_ and arg_275_1.time_ < var_278_22 + var_278_32 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_22) / var_278_32

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_22 + var_278_32 and arg_275_1.time_ < var_278_22 + var_278_32 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play318031070 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 318031070
		arg_279_1.duration_ = 2.1

		local var_279_0 = {
			zh = 1.999999999999,
			ja = 2.1
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
				arg_279_0:Play318031071(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1093ui_story"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1093ui_story = var_282_0.localPosition
			end

			local var_282_2 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2
				local var_282_4 = Vector3.New(0.7, -1.11, -5.88)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1093ui_story, var_282_4, var_282_3)

				local var_282_5 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_5.x, var_282_5.y, var_282_5.z)

				local var_282_6 = var_282_0.localEulerAngles

				var_282_6.z = 0
				var_282_6.x = 0
				var_282_0.localEulerAngles = var_282_6
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(0.7, -1.11, -5.88)

				local var_282_7 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_7.x, var_282_7.y, var_282_7.z)

				local var_282_8 = var_282_0.localEulerAngles

				var_282_8.z = 0
				var_282_8.x = 0
				var_282_0.localEulerAngles = var_282_8
			end

			local var_282_9 = arg_279_1.actors_["1093ui_story"]
			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 and arg_279_1.var_.characterEffect1093ui_story == nil then
				arg_279_1.var_.characterEffect1093ui_story = var_282_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_11 = 0.200000002980232

			if var_282_10 <= arg_279_1.time_ and arg_279_1.time_ < var_282_10 + var_282_11 then
				local var_282_12 = (arg_279_1.time_ - var_282_10) / var_282_11

				if arg_279_1.var_.characterEffect1093ui_story then
					arg_279_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_10 + var_282_11 and arg_279_1.time_ < var_282_10 + var_282_11 + arg_282_0 and arg_279_1.var_.characterEffect1093ui_story then
				arg_279_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_282_13 = arg_279_1.actors_["1199ui_story"].transform
			local var_282_14 = 0

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 then
				arg_279_1.var_.moveOldPos1199ui_story = var_282_13.localPosition
			end

			local var_282_15 = 0.001

			if var_282_14 <= arg_279_1.time_ and arg_279_1.time_ < var_282_14 + var_282_15 then
				local var_282_16 = (arg_279_1.time_ - var_282_14) / var_282_15
				local var_282_17 = Vector3.New(-0.7, -1.08, -5.9)

				var_282_13.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1199ui_story, var_282_17, var_282_16)

				local var_282_18 = manager.ui.mainCamera.transform.position - var_282_13.position

				var_282_13.forward = Vector3.New(var_282_18.x, var_282_18.y, var_282_18.z)

				local var_282_19 = var_282_13.localEulerAngles

				var_282_19.z = 0
				var_282_19.x = 0
				var_282_13.localEulerAngles = var_282_19
			end

			if arg_279_1.time_ >= var_282_14 + var_282_15 and arg_279_1.time_ < var_282_14 + var_282_15 + arg_282_0 then
				var_282_13.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_282_20 = manager.ui.mainCamera.transform.position - var_282_13.position

				var_282_13.forward = Vector3.New(var_282_20.x, var_282_20.y, var_282_20.z)

				local var_282_21 = var_282_13.localEulerAngles

				var_282_21.z = 0
				var_282_21.x = 0
				var_282_13.localEulerAngles = var_282_21
			end

			local var_282_22 = arg_279_1.actors_["1199ui_story"]
			local var_282_23 = 0

			if var_282_23 < arg_279_1.time_ and arg_279_1.time_ <= var_282_23 + arg_282_0 and arg_279_1.var_.characterEffect1199ui_story == nil then
				arg_279_1.var_.characterEffect1199ui_story = var_282_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_24 = 0.200000002980232

			if var_282_23 <= arg_279_1.time_ and arg_279_1.time_ < var_282_23 + var_282_24 then
				local var_282_25 = (arg_279_1.time_ - var_282_23) / var_282_24

				if arg_279_1.var_.characterEffect1199ui_story then
					local var_282_26 = Mathf.Lerp(0, 0.5, var_282_25)

					arg_279_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1199ui_story.fillRatio = var_282_26
				end
			end

			if arg_279_1.time_ >= var_282_23 + var_282_24 and arg_279_1.time_ < var_282_23 + var_282_24 + arg_282_0 and arg_279_1.var_.characterEffect1199ui_story then
				local var_282_27 = 0.5

				arg_279_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1199ui_story.fillRatio = var_282_27
			end

			local var_282_28 = 0

			if var_282_28 < arg_279_1.time_ and arg_279_1.time_ <= var_282_28 + arg_282_0 then
				arg_279_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_282_29 = 0
			local var_282_30 = 0.175

			if var_282_29 < arg_279_1.time_ and arg_279_1.time_ <= var_282_29 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_31 = arg_279_1:FormatText(StoryNameCfg[73].name)

				arg_279_1.leftNameTxt_.text = var_282_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_32 = arg_279_1:GetWordFromCfg(318031070)
				local var_282_33 = arg_279_1:FormatText(var_282_32.content)

				arg_279_1.text_.text = var_282_33

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_34 = 7
				local var_282_35 = utf8.len(var_282_33)
				local var_282_36 = var_282_34 <= 0 and var_282_30 or var_282_30 * (var_282_35 / var_282_34)

				if var_282_36 > 0 and var_282_30 < var_282_36 then
					arg_279_1.talkMaxDuration = var_282_36

					if var_282_36 + var_282_29 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_36 + var_282_29
					end
				end

				arg_279_1.text_.text = var_282_33
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031070", "story_v_out_318031.awb") ~= 0 then
					local var_282_37 = manager.audio:GetVoiceLength("story_v_out_318031", "318031070", "story_v_out_318031.awb") / 1000

					if var_282_37 + var_282_29 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_37 + var_282_29
					end

					if var_282_32.prefab_name ~= "" and arg_279_1.actors_[var_282_32.prefab_name] ~= nil then
						local var_282_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_32.prefab_name].transform, "story_v_out_318031", "318031070", "story_v_out_318031.awb")

						arg_279_1:RecordAudio("318031070", var_282_38)
						arg_279_1:RecordAudio("318031070", var_282_38)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_318031", "318031070", "story_v_out_318031.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_318031", "318031070", "story_v_out_318031.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_39 = math.max(var_282_30, arg_279_1.talkMaxDuration)

			if var_282_29 <= arg_279_1.time_ and arg_279_1.time_ < var_282_29 + var_282_39 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_29) / var_282_39

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_29 + var_282_39 and arg_279_1.time_ < var_282_29 + var_282_39 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play318031071 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 318031071
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play318031072(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1093ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect1093ui_story == nil then
				arg_283_1.var_.characterEffect1093ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect1093ui_story then
					local var_286_4 = Mathf.Lerp(0, 0.5, var_286_3)

					arg_283_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1093ui_story.fillRatio = var_286_4
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1093ui_story then
				local var_286_5 = 0.5

				arg_283_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1093ui_story.fillRatio = var_286_5
			end

			local var_286_6 = arg_283_1.actors_["1093ui_story"].transform
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 then
				arg_283_1.var_.moveOldPos1093ui_story = var_286_6.localPosition
			end

			local var_286_8 = 0.001

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8
				local var_286_10 = Vector3.New(0, 100, 0)

				var_286_6.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1093ui_story, var_286_10, var_286_9)

				local var_286_11 = manager.ui.mainCamera.transform.position - var_286_6.position

				var_286_6.forward = Vector3.New(var_286_11.x, var_286_11.y, var_286_11.z)

				local var_286_12 = var_286_6.localEulerAngles

				var_286_12.z = 0
				var_286_12.x = 0
				var_286_6.localEulerAngles = var_286_12
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 then
				var_286_6.localPosition = Vector3.New(0, 100, 0)

				local var_286_13 = manager.ui.mainCamera.transform.position - var_286_6.position

				var_286_6.forward = Vector3.New(var_286_13.x, var_286_13.y, var_286_13.z)

				local var_286_14 = var_286_6.localEulerAngles

				var_286_14.z = 0
				var_286_14.x = 0
				var_286_6.localEulerAngles = var_286_14
			end

			local var_286_15 = arg_283_1.actors_["1199ui_story"].transform
			local var_286_16 = 0

			if var_286_16 < arg_283_1.time_ and arg_283_1.time_ <= var_286_16 + arg_286_0 then
				arg_283_1.var_.moveOldPos1199ui_story = var_286_15.localPosition
			end

			local var_286_17 = 0.001

			if var_286_16 <= arg_283_1.time_ and arg_283_1.time_ < var_286_16 + var_286_17 then
				local var_286_18 = (arg_283_1.time_ - var_286_16) / var_286_17
				local var_286_19 = Vector3.New(0, 100, 0)

				var_286_15.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1199ui_story, var_286_19, var_286_18)

				local var_286_20 = manager.ui.mainCamera.transform.position - var_286_15.position

				var_286_15.forward = Vector3.New(var_286_20.x, var_286_20.y, var_286_20.z)

				local var_286_21 = var_286_15.localEulerAngles

				var_286_21.z = 0
				var_286_21.x = 0
				var_286_15.localEulerAngles = var_286_21
			end

			if arg_283_1.time_ >= var_286_16 + var_286_17 and arg_283_1.time_ < var_286_16 + var_286_17 + arg_286_0 then
				var_286_15.localPosition = Vector3.New(0, 100, 0)

				local var_286_22 = manager.ui.mainCamera.transform.position - var_286_15.position

				var_286_15.forward = Vector3.New(var_286_22.x, var_286_22.y, var_286_22.z)

				local var_286_23 = var_286_15.localEulerAngles

				var_286_23.z = 0
				var_286_23.x = 0
				var_286_15.localEulerAngles = var_286_23
			end

			local var_286_24 = arg_283_1.actors_["10053ui_story"].transform
			local var_286_25 = 0

			if var_286_25 < arg_283_1.time_ and arg_283_1.time_ <= var_286_25 + arg_286_0 then
				arg_283_1.var_.moveOldPos10053ui_story = var_286_24.localPosition
			end

			local var_286_26 = 0.001

			if var_286_25 <= arg_283_1.time_ and arg_283_1.time_ < var_286_25 + var_286_26 then
				local var_286_27 = (arg_283_1.time_ - var_286_25) / var_286_26
				local var_286_28 = Vector3.New(0, -1.12, -5.99)

				var_286_24.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos10053ui_story, var_286_28, var_286_27)

				local var_286_29 = manager.ui.mainCamera.transform.position - var_286_24.position

				var_286_24.forward = Vector3.New(var_286_29.x, var_286_29.y, var_286_29.z)

				local var_286_30 = var_286_24.localEulerAngles

				var_286_30.z = 0
				var_286_30.x = 0
				var_286_24.localEulerAngles = var_286_30
			end

			if arg_283_1.time_ >= var_286_25 + var_286_26 and arg_283_1.time_ < var_286_25 + var_286_26 + arg_286_0 then
				var_286_24.localPosition = Vector3.New(0, -1.12, -5.99)

				local var_286_31 = manager.ui.mainCamera.transform.position - var_286_24.position

				var_286_24.forward = Vector3.New(var_286_31.x, var_286_31.y, var_286_31.z)

				local var_286_32 = var_286_24.localEulerAngles

				var_286_32.z = 0
				var_286_32.x = 0
				var_286_24.localEulerAngles = var_286_32
			end

			local var_286_33 = 0

			if var_286_33 < arg_283_1.time_ and arg_283_1.time_ <= var_286_33 + arg_286_0 then
				arg_283_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_286_34 = 0

			if var_286_34 < arg_283_1.time_ and arg_283_1.time_ <= var_286_34 + arg_286_0 then
				arg_283_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_286_35 = 0
			local var_286_36 = 1.125

			if var_286_35 < arg_283_1.time_ and arg_283_1.time_ <= var_286_35 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_37 = arg_283_1:FormatText(StoryNameCfg[7].name)

				arg_283_1.leftNameTxt_.text = var_286_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_38 = arg_283_1:GetWordFromCfg(318031071)
				local var_286_39 = arg_283_1:FormatText(var_286_38.content)

				arg_283_1.text_.text = var_286_39

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_40 = 45
				local var_286_41 = utf8.len(var_286_39)
				local var_286_42 = var_286_40 <= 0 and var_286_36 or var_286_36 * (var_286_41 / var_286_40)

				if var_286_42 > 0 and var_286_36 < var_286_42 then
					arg_283_1.talkMaxDuration = var_286_42

					if var_286_42 + var_286_35 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_42 + var_286_35
					end
				end

				arg_283_1.text_.text = var_286_39
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_43 = math.max(var_286_36, arg_283_1.talkMaxDuration)

			if var_286_35 <= arg_283_1.time_ and arg_283_1.time_ < var_286_35 + var_286_43 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_35) / var_286_43

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_35 + var_286_43 and arg_283_1.time_ < var_286_35 + var_286_43 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play318031072 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 318031072
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play318031073(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["10053ui_story"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos10053ui_story = var_290_0.localPosition
			end

			local var_290_2 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2
				local var_290_4 = Vector3.New(0, 100, 0)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos10053ui_story, var_290_4, var_290_3)

				local var_290_5 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_5.x, var_290_5.y, var_290_5.z)

				local var_290_6 = var_290_0.localEulerAngles

				var_290_6.z = 0
				var_290_6.x = 0
				var_290_0.localEulerAngles = var_290_6
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(0, 100, 0)

				local var_290_7 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_7.x, var_290_7.y, var_290_7.z)

				local var_290_8 = var_290_0.localEulerAngles

				var_290_8.z = 0
				var_290_8.x = 0
				var_290_0.localEulerAngles = var_290_8
			end

			local var_290_9 = "1058ui_story"

			if arg_287_1.actors_[var_290_9] == nil then
				local var_290_10 = Object.Instantiate(Asset.Load("Char/" .. var_290_9), arg_287_1.stage_.transform)

				var_290_10.name = var_290_9
				var_290_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_287_1.actors_[var_290_9] = var_290_10

				local var_290_11 = var_290_10:GetComponentInChildren(typeof(CharacterEffect))

				var_290_11.enabled = true

				local var_290_12 = GameObjectTools.GetOrAddComponent(var_290_10, typeof(DynamicBoneHelper))

				if var_290_12 then
					var_290_12:EnableDynamicBone(false)
				end

				arg_287_1:ShowWeapon(var_290_11.transform, false)

				arg_287_1.var_[var_290_9 .. "Animator"] = var_290_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_287_1.var_[var_290_9 .. "Animator"].applyRootMotion = true
				arg_287_1.var_[var_290_9 .. "LipSync"] = var_290_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_290_13 = 0

			if var_290_13 < arg_287_1.time_ and arg_287_1.time_ <= var_290_13 + arg_290_0 then
				arg_287_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_290_14 = 0

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 then
				arg_287_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_290_15 = arg_287_1.actors_["1058ui_story"].transform
			local var_290_16 = 0

			if var_290_16 < arg_287_1.time_ and arg_287_1.time_ <= var_290_16 + arg_290_0 then
				arg_287_1.var_.moveOldPos1058ui_story = var_290_15.localPosition
			end

			local var_290_17 = 0.001

			if var_290_16 <= arg_287_1.time_ and arg_287_1.time_ < var_290_16 + var_290_17 then
				local var_290_18 = (arg_287_1.time_ - var_290_16) / var_290_17
				local var_290_19 = Vector3.New(-0.7, -0.95, -5.88)

				var_290_15.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1058ui_story, var_290_19, var_290_18)

				local var_290_20 = manager.ui.mainCamera.transform.position - var_290_15.position

				var_290_15.forward = Vector3.New(var_290_20.x, var_290_20.y, var_290_20.z)

				local var_290_21 = var_290_15.localEulerAngles

				var_290_21.z = 0
				var_290_21.x = 0
				var_290_15.localEulerAngles = var_290_21
			end

			if arg_287_1.time_ >= var_290_16 + var_290_17 and arg_287_1.time_ < var_290_16 + var_290_17 + arg_290_0 then
				var_290_15.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_290_22 = manager.ui.mainCamera.transform.position - var_290_15.position

				var_290_15.forward = Vector3.New(var_290_22.x, var_290_22.y, var_290_22.z)

				local var_290_23 = var_290_15.localEulerAngles

				var_290_23.z = 0
				var_290_23.x = 0
				var_290_15.localEulerAngles = var_290_23
			end

			local var_290_24 = arg_287_1.actors_["1058ui_story"]
			local var_290_25 = 0

			if var_290_25 < arg_287_1.time_ and arg_287_1.time_ <= var_290_25 + arg_290_0 and arg_287_1.var_.characterEffect1058ui_story == nil then
				arg_287_1.var_.characterEffect1058ui_story = var_290_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_26 = 0.0166666666666667

			if var_290_25 <= arg_287_1.time_ and arg_287_1.time_ < var_290_25 + var_290_26 then
				local var_290_27 = (arg_287_1.time_ - var_290_25) / var_290_26

				if arg_287_1.var_.characterEffect1058ui_story then
					local var_290_28 = Mathf.Lerp(0, 0.5, var_290_27)

					arg_287_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1058ui_story.fillRatio = var_290_28
				end
			end

			if arg_287_1.time_ >= var_290_25 + var_290_26 and arg_287_1.time_ < var_290_25 + var_290_26 + arg_290_0 and arg_287_1.var_.characterEffect1058ui_story then
				local var_290_29 = 0.5

				arg_287_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1058ui_story.fillRatio = var_290_29
			end

			local var_290_30 = arg_287_1.actors_["1049ui_story"]
			local var_290_31 = 0

			if var_290_31 < arg_287_1.time_ and arg_287_1.time_ <= var_290_31 + arg_290_0 and arg_287_1.var_.characterEffect1049ui_story == nil then
				arg_287_1.var_.characterEffect1049ui_story = var_290_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_32 = 0.0166666666666667

			if var_290_31 <= arg_287_1.time_ and arg_287_1.time_ < var_290_31 + var_290_32 then
				local var_290_33 = (arg_287_1.time_ - var_290_31) / var_290_32

				if arg_287_1.var_.characterEffect1049ui_story then
					local var_290_34 = Mathf.Lerp(0, 0.5, var_290_33)

					arg_287_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1049ui_story.fillRatio = var_290_34
				end
			end

			if arg_287_1.time_ >= var_290_31 + var_290_32 and arg_287_1.time_ < var_290_31 + var_290_32 + arg_290_0 and arg_287_1.var_.characterEffect1049ui_story then
				local var_290_35 = 0.5

				arg_287_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1049ui_story.fillRatio = var_290_35
			end

			local var_290_36 = arg_287_1.actors_["1049ui_story"].transform
			local var_290_37 = 0

			if var_290_37 < arg_287_1.time_ and arg_287_1.time_ <= var_290_37 + arg_290_0 then
				arg_287_1.var_.moveOldPos1049ui_story = var_290_36.localPosition
			end

			local var_290_38 = 0.001

			if var_290_37 <= arg_287_1.time_ and arg_287_1.time_ < var_290_37 + var_290_38 then
				local var_290_39 = (arg_287_1.time_ - var_290_37) / var_290_38
				local var_290_40 = Vector3.New(0.7, -1.2, -6)

				var_290_36.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1049ui_story, var_290_40, var_290_39)

				local var_290_41 = manager.ui.mainCamera.transform.position - var_290_36.position

				var_290_36.forward = Vector3.New(var_290_41.x, var_290_41.y, var_290_41.z)

				local var_290_42 = var_290_36.localEulerAngles

				var_290_42.z = 0
				var_290_42.x = 0
				var_290_36.localEulerAngles = var_290_42
			end

			if arg_287_1.time_ >= var_290_37 + var_290_38 and arg_287_1.time_ < var_290_37 + var_290_38 + arg_290_0 then
				var_290_36.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_290_43 = manager.ui.mainCamera.transform.position - var_290_36.position

				var_290_36.forward = Vector3.New(var_290_43.x, var_290_43.y, var_290_43.z)

				local var_290_44 = var_290_36.localEulerAngles

				var_290_44.z = 0
				var_290_44.x = 0
				var_290_36.localEulerAngles = var_290_44
			end

			local var_290_45 = 0

			if var_290_45 < arg_287_1.time_ and arg_287_1.time_ <= var_290_45 + arg_290_0 then
				arg_287_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_290_46 = arg_287_1.actors_["1049ui_story"]
			local var_290_47 = 0

			if var_290_47 < arg_287_1.time_ and arg_287_1.time_ <= var_290_47 + arg_290_0 and arg_287_1.var_.characterEffect1049ui_story == nil then
				arg_287_1.var_.characterEffect1049ui_story = var_290_46:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_48 = 0.0166666666666667

			if var_290_47 <= arg_287_1.time_ and arg_287_1.time_ < var_290_47 + var_290_48 then
				local var_290_49 = (arg_287_1.time_ - var_290_47) / var_290_48

				if arg_287_1.var_.characterEffect1049ui_story then
					local var_290_50 = Mathf.Lerp(0, 0.5, var_290_49)

					arg_287_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1049ui_story.fillRatio = var_290_50
				end
			end

			if arg_287_1.time_ >= var_290_47 + var_290_48 and arg_287_1.time_ < var_290_47 + var_290_48 + arg_290_0 and arg_287_1.var_.characterEffect1049ui_story then
				local var_290_51 = 0.5

				arg_287_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1049ui_story.fillRatio = var_290_51
			end

			local var_290_52 = 0
			local var_290_53 = 0.825

			if var_290_52 < arg_287_1.time_ and arg_287_1.time_ <= var_290_52 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_54 = arg_287_1:FormatText(StoryNameCfg[7].name)

				arg_287_1.leftNameTxt_.text = var_290_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_55 = arg_287_1:GetWordFromCfg(318031072)
				local var_290_56 = arg_287_1:FormatText(var_290_55.content)

				arg_287_1.text_.text = var_290_56

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_57 = 33
				local var_290_58 = utf8.len(var_290_56)
				local var_290_59 = var_290_57 <= 0 and var_290_53 or var_290_53 * (var_290_58 / var_290_57)

				if var_290_59 > 0 and var_290_53 < var_290_59 then
					arg_287_1.talkMaxDuration = var_290_59

					if var_290_59 + var_290_52 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_59 + var_290_52
					end
				end

				arg_287_1.text_.text = var_290_56
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_60 = math.max(var_290_53, arg_287_1.talkMaxDuration)

			if var_290_52 <= arg_287_1.time_ and arg_287_1.time_ < var_290_52 + var_290_60 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_52) / var_290_60

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_52 + var_290_60 and arg_287_1.time_ < var_290_52 + var_290_60 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play318031073 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 318031073
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play318031074(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1049ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1049ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, 100, 0)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1049ui_story, var_294_4, var_294_3)

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

			local var_294_9 = arg_291_1.actors_["1058ui_story"].transform
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 then
				arg_291_1.var_.moveOldPos1058ui_story = var_294_9.localPosition
			end

			local var_294_11 = 0.001

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11
				local var_294_13 = Vector3.New(0, 100, 0)

				var_294_9.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1058ui_story, var_294_13, var_294_12)

				local var_294_14 = manager.ui.mainCamera.transform.position - var_294_9.position

				var_294_9.forward = Vector3.New(var_294_14.x, var_294_14.y, var_294_14.z)

				local var_294_15 = var_294_9.localEulerAngles

				var_294_15.z = 0
				var_294_15.x = 0
				var_294_9.localEulerAngles = var_294_15
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 then
				var_294_9.localPosition = Vector3.New(0, 100, 0)

				local var_294_16 = manager.ui.mainCamera.transform.position - var_294_9.position

				var_294_9.forward = Vector3.New(var_294_16.x, var_294_16.y, var_294_16.z)

				local var_294_17 = var_294_9.localEulerAngles

				var_294_17.z = 0
				var_294_17.x = 0
				var_294_9.localEulerAngles = var_294_17
			end

			local var_294_18 = arg_291_1.actors_["1015ui_story"].transform
			local var_294_19 = 0

			if var_294_19 < arg_291_1.time_ and arg_291_1.time_ <= var_294_19 + arg_294_0 then
				arg_291_1.var_.moveOldPos1015ui_story = var_294_18.localPosition
			end

			local var_294_20 = 0.001

			if var_294_19 <= arg_291_1.time_ and arg_291_1.time_ < var_294_19 + var_294_20 then
				local var_294_21 = (arg_291_1.time_ - var_294_19) / var_294_20
				local var_294_22 = Vector3.New(0, -1.15, -6.2)

				var_294_18.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1015ui_story, var_294_22, var_294_21)

				local var_294_23 = manager.ui.mainCamera.transform.position - var_294_18.position

				var_294_18.forward = Vector3.New(var_294_23.x, var_294_23.y, var_294_23.z)

				local var_294_24 = var_294_18.localEulerAngles

				var_294_24.z = 0
				var_294_24.x = 0
				var_294_18.localEulerAngles = var_294_24
			end

			if arg_291_1.time_ >= var_294_19 + var_294_20 and arg_291_1.time_ < var_294_19 + var_294_20 + arg_294_0 then
				var_294_18.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_294_25 = manager.ui.mainCamera.transform.position - var_294_18.position

				var_294_18.forward = Vector3.New(var_294_25.x, var_294_25.y, var_294_25.z)

				local var_294_26 = var_294_18.localEulerAngles

				var_294_26.z = 0
				var_294_26.x = 0
				var_294_18.localEulerAngles = var_294_26
			end

			local var_294_27 = 0

			if var_294_27 < arg_291_1.time_ and arg_291_1.time_ <= var_294_27 + arg_294_0 then
				arg_291_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_294_28 = 0
			local var_294_29 = 0.975

			if var_294_28 < arg_291_1.time_ and arg_291_1.time_ <= var_294_28 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_30 = arg_291_1:FormatText(StoryNameCfg[7].name)

				arg_291_1.leftNameTxt_.text = var_294_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_31 = arg_291_1:GetWordFromCfg(318031073)
				local var_294_32 = arg_291_1:FormatText(var_294_31.content)

				arg_291_1.text_.text = var_294_32

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_33 = 39
				local var_294_34 = utf8.len(var_294_32)
				local var_294_35 = var_294_33 <= 0 and var_294_29 or var_294_29 * (var_294_34 / var_294_33)

				if var_294_35 > 0 and var_294_29 < var_294_35 then
					arg_291_1.talkMaxDuration = var_294_35

					if var_294_35 + var_294_28 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_35 + var_294_28
					end
				end

				arg_291_1.text_.text = var_294_32
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_36 = math.max(var_294_29, arg_291_1.talkMaxDuration)

			if var_294_28 <= arg_291_1.time_ and arg_291_1.time_ < var_294_28 + var_294_36 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_28) / var_294_36

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_28 + var_294_36 and arg_291_1.time_ < var_294_28 + var_294_36 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play318031074 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 318031074
		arg_295_1.duration_ = 8.333

		local var_295_0 = {
			zh = 4.966,
			ja = 8.333
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
				arg_295_0:Play318031075(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1015ui_story"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos1015ui_story = var_298_0.localPosition
			end

			local var_298_2 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2
				local var_298_4 = Vector3.New(0, -1.15, -6.2)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1015ui_story, var_298_4, var_298_3)

				local var_298_5 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_5.x, var_298_5.y, var_298_5.z)

				local var_298_6 = var_298_0.localEulerAngles

				var_298_6.z = 0
				var_298_6.x = 0
				var_298_0.localEulerAngles = var_298_6
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_298_7 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_7.x, var_298_7.y, var_298_7.z)

				local var_298_8 = var_298_0.localEulerAngles

				var_298_8.z = 0
				var_298_8.x = 0
				var_298_0.localEulerAngles = var_298_8
			end

			local var_298_9 = arg_295_1.actors_["1015ui_story"]
			local var_298_10 = 0

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 and arg_295_1.var_.characterEffect1015ui_story == nil then
				arg_295_1.var_.characterEffect1015ui_story = var_298_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_11 = 0.200000002980232

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_11 then
				local var_298_12 = (arg_295_1.time_ - var_298_10) / var_298_11

				if arg_295_1.var_.characterEffect1015ui_story then
					arg_295_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_10 + var_298_11 and arg_295_1.time_ < var_298_10 + var_298_11 + arg_298_0 and arg_295_1.var_.characterEffect1015ui_story then
				arg_295_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_298_13 = 0

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				arg_295_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_298_15 = arg_295_1.actors_["1199ui_story"].transform
			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 then
				arg_295_1.var_.moveOldPos1199ui_story = var_298_15.localPosition
			end

			local var_298_17 = 0.001

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17
				local var_298_19 = Vector3.New(0, 100, 0)

				var_298_15.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1199ui_story, var_298_19, var_298_18)

				local var_298_20 = manager.ui.mainCamera.transform.position - var_298_15.position

				var_298_15.forward = Vector3.New(var_298_20.x, var_298_20.y, var_298_20.z)

				local var_298_21 = var_298_15.localEulerAngles

				var_298_21.z = 0
				var_298_21.x = 0
				var_298_15.localEulerAngles = var_298_21
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 then
				var_298_15.localPosition = Vector3.New(0, 100, 0)

				local var_298_22 = manager.ui.mainCamera.transform.position - var_298_15.position

				var_298_15.forward = Vector3.New(var_298_22.x, var_298_22.y, var_298_22.z)

				local var_298_23 = var_298_15.localEulerAngles

				var_298_23.z = 0
				var_298_23.x = 0
				var_298_15.localEulerAngles = var_298_23
			end

			local var_298_24 = arg_295_1.actors_["1093ui_story"].transform
			local var_298_25 = 0

			if var_298_25 < arg_295_1.time_ and arg_295_1.time_ <= var_298_25 + arg_298_0 then
				arg_295_1.var_.moveOldPos1093ui_story = var_298_24.localPosition
			end

			local var_298_26 = 0.001

			if var_298_25 <= arg_295_1.time_ and arg_295_1.time_ < var_298_25 + var_298_26 then
				local var_298_27 = (arg_295_1.time_ - var_298_25) / var_298_26
				local var_298_28 = Vector3.New(0, 100, 0)

				var_298_24.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1093ui_story, var_298_28, var_298_27)

				local var_298_29 = manager.ui.mainCamera.transform.position - var_298_24.position

				var_298_24.forward = Vector3.New(var_298_29.x, var_298_29.y, var_298_29.z)

				local var_298_30 = var_298_24.localEulerAngles

				var_298_30.z = 0
				var_298_30.x = 0
				var_298_24.localEulerAngles = var_298_30
			end

			if arg_295_1.time_ >= var_298_25 + var_298_26 and arg_295_1.time_ < var_298_25 + var_298_26 + arg_298_0 then
				var_298_24.localPosition = Vector3.New(0, 100, 0)

				local var_298_31 = manager.ui.mainCamera.transform.position - var_298_24.position

				var_298_24.forward = Vector3.New(var_298_31.x, var_298_31.y, var_298_31.z)

				local var_298_32 = var_298_24.localEulerAngles

				var_298_32.z = 0
				var_298_32.x = 0
				var_298_24.localEulerAngles = var_298_32
			end

			local var_298_33 = 0
			local var_298_34 = 0.625

			if var_298_33 < arg_295_1.time_ and arg_295_1.time_ <= var_298_33 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_35 = arg_295_1:FormatText(StoryNameCfg[479].name)

				arg_295_1.leftNameTxt_.text = var_298_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_36 = arg_295_1:GetWordFromCfg(318031074)
				local var_298_37 = arg_295_1:FormatText(var_298_36.content)

				arg_295_1.text_.text = var_298_37

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_38 = 25
				local var_298_39 = utf8.len(var_298_37)
				local var_298_40 = var_298_38 <= 0 and var_298_34 or var_298_34 * (var_298_39 / var_298_38)

				if var_298_40 > 0 and var_298_34 < var_298_40 then
					arg_295_1.talkMaxDuration = var_298_40

					if var_298_40 + var_298_33 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_40 + var_298_33
					end
				end

				arg_295_1.text_.text = var_298_37
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031074", "story_v_out_318031.awb") ~= 0 then
					local var_298_41 = manager.audio:GetVoiceLength("story_v_out_318031", "318031074", "story_v_out_318031.awb") / 1000

					if var_298_41 + var_298_33 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_41 + var_298_33
					end

					if var_298_36.prefab_name ~= "" and arg_295_1.actors_[var_298_36.prefab_name] ~= nil then
						local var_298_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_36.prefab_name].transform, "story_v_out_318031", "318031074", "story_v_out_318031.awb")

						arg_295_1:RecordAudio("318031074", var_298_42)
						arg_295_1:RecordAudio("318031074", var_298_42)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_318031", "318031074", "story_v_out_318031.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_318031", "318031074", "story_v_out_318031.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_43 = math.max(var_298_34, arg_295_1.talkMaxDuration)

			if var_298_33 <= arg_295_1.time_ and arg_295_1.time_ < var_298_33 + var_298_43 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_33) / var_298_43

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_33 + var_298_43 and arg_295_1.time_ < var_298_33 + var_298_43 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play318031075 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 318031075
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play318031076(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1015ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect1015ui_story == nil then
				arg_299_1.var_.characterEffect1015ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.200000002980232

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect1015ui_story then
					local var_302_4 = Mathf.Lerp(0, 0.5, var_302_3)

					arg_299_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1015ui_story.fillRatio = var_302_4
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1015ui_story then
				local var_302_5 = 0.5

				arg_299_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1015ui_story.fillRatio = var_302_5
			end

			local var_302_6 = 0
			local var_302_7 = 1.025

			if var_302_6 < arg_299_1.time_ and arg_299_1.time_ <= var_302_6 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_8 = arg_299_1:FormatText(StoryNameCfg[7].name)

				arg_299_1.leftNameTxt_.text = var_302_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_9 = arg_299_1:GetWordFromCfg(318031075)
				local var_302_10 = arg_299_1:FormatText(var_302_9.content)

				arg_299_1.text_.text = var_302_10

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_11 = 41
				local var_302_12 = utf8.len(var_302_10)
				local var_302_13 = var_302_11 <= 0 and var_302_7 or var_302_7 * (var_302_12 / var_302_11)

				if var_302_13 > 0 and var_302_7 < var_302_13 then
					arg_299_1.talkMaxDuration = var_302_13

					if var_302_13 + var_302_6 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_13 + var_302_6
					end
				end

				arg_299_1.text_.text = var_302_10
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_14 = math.max(var_302_7, arg_299_1.talkMaxDuration)

			if var_302_6 <= arg_299_1.time_ and arg_299_1.time_ < var_302_6 + var_302_14 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_6) / var_302_14

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_6 + var_302_14 and arg_299_1.time_ < var_302_6 + var_302_14 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play318031076 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 318031076
		arg_303_1.duration_ = 6.766

		local var_303_0 = {
			zh = 3.333,
			ja = 6.766
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
				arg_303_0:Play318031077(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1015ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1015ui_story == nil then
				arg_303_1.var_.characterEffect1015ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.200000002980232

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1015ui_story then
					arg_303_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1015ui_story then
				arg_303_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_306_4 = 0

			if var_306_4 < arg_303_1.time_ and arg_303_1.time_ <= var_306_4 + arg_306_0 then
				arg_303_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_2")
			end

			local var_306_5 = 0

			if var_306_5 < arg_303_1.time_ and arg_303_1.time_ <= var_306_5 + arg_306_0 then
				arg_303_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_306_6 = 0
			local var_306_7 = 0.3

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_8 = arg_303_1:FormatText(StoryNameCfg[479].name)

				arg_303_1.leftNameTxt_.text = var_306_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_9 = arg_303_1:GetWordFromCfg(318031076)
				local var_306_10 = arg_303_1:FormatText(var_306_9.content)

				arg_303_1.text_.text = var_306_10

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031076", "story_v_out_318031.awb") ~= 0 then
					local var_306_14 = manager.audio:GetVoiceLength("story_v_out_318031", "318031076", "story_v_out_318031.awb") / 1000

					if var_306_14 + var_306_6 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_14 + var_306_6
					end

					if var_306_9.prefab_name ~= "" and arg_303_1.actors_[var_306_9.prefab_name] ~= nil then
						local var_306_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_9.prefab_name].transform, "story_v_out_318031", "318031076", "story_v_out_318031.awb")

						arg_303_1:RecordAudio("318031076", var_306_15)
						arg_303_1:RecordAudio("318031076", var_306_15)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_318031", "318031076", "story_v_out_318031.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_318031", "318031076", "story_v_out_318031.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_16 = math.max(var_306_7, arg_303_1.talkMaxDuration)

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_16 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_6) / var_306_16

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_6 + var_306_16 and arg_303_1.time_ < var_306_6 + var_306_16 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play318031077 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 318031077
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play318031078(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1015ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1015ui_story == nil then
				arg_307_1.var_.characterEffect1015ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.200000002980232

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1015ui_story then
					local var_310_4 = Mathf.Lerp(0, 0.5, var_310_3)

					arg_307_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1015ui_story.fillRatio = var_310_4
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1015ui_story then
				local var_310_5 = 0.5

				arg_307_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1015ui_story.fillRatio = var_310_5
			end

			local var_310_6 = 0
			local var_310_7 = 1.1

			if var_310_6 < arg_307_1.time_ and arg_307_1.time_ <= var_310_6 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_8 = arg_307_1:GetWordFromCfg(318031077)
				local var_310_9 = arg_307_1:FormatText(var_310_8.content)

				arg_307_1.text_.text = var_310_9

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_10 = 44
				local var_310_11 = utf8.len(var_310_9)
				local var_310_12 = var_310_10 <= 0 and var_310_7 or var_310_7 * (var_310_11 / var_310_10)

				if var_310_12 > 0 and var_310_7 < var_310_12 then
					arg_307_1.talkMaxDuration = var_310_12

					if var_310_12 + var_310_6 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_12 + var_310_6
					end
				end

				arg_307_1.text_.text = var_310_9
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_13 = math.max(var_310_7, arg_307_1.talkMaxDuration)

			if var_310_6 <= arg_307_1.time_ and arg_307_1.time_ < var_310_6 + var_310_13 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_6) / var_310_13

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_6 + var_310_13 and arg_307_1.time_ < var_310_6 + var_310_13 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play318031078 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 318031078
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play318031079(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.475

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_2 = arg_311_1:FormatText(StoryNameCfg[7].name)

				arg_311_1.leftNameTxt_.text = var_314_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_3 = arg_311_1:GetWordFromCfg(318031078)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 19
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
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_8 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_8 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_8

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_8 and arg_311_1.time_ < var_314_0 + var_314_8 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play318031079 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 318031079
		arg_315_1.duration_ = 7

		local var_315_0 = {
			zh = 7,
			ja = 6.266
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
				arg_315_0:Play318031080(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1015ui_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos1015ui_story = var_318_0.localPosition
			end

			local var_318_2 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2
				local var_318_4 = Vector3.New(0, -1.15, -6.2)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1015ui_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_318_7 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_7.x, var_318_7.y, var_318_7.z)

				local var_318_8 = var_318_0.localEulerAngles

				var_318_8.z = 0
				var_318_8.x = 0
				var_318_0.localEulerAngles = var_318_8
			end

			local var_318_9 = arg_315_1.actors_["1015ui_story"]
			local var_318_10 = 0

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 and arg_315_1.var_.characterEffect1015ui_story == nil then
				arg_315_1.var_.characterEffect1015ui_story = var_318_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_11 = 0.200000002980232

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_11 then
				local var_318_12 = (arg_315_1.time_ - var_318_10) / var_318_11

				if arg_315_1.var_.characterEffect1015ui_story then
					arg_315_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 and arg_315_1.var_.characterEffect1015ui_story then
				arg_315_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_318_13 = 0

			if var_318_13 < arg_315_1.time_ and arg_315_1.time_ <= var_318_13 + arg_318_0 then
				arg_315_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action3_1")
			end

			local var_318_14 = 0

			if var_318_14 < arg_315_1.time_ and arg_315_1.time_ <= var_318_14 + arg_318_0 then
				arg_315_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_318_15 = 0
			local var_318_16 = 0.55

			if var_318_15 < arg_315_1.time_ and arg_315_1.time_ <= var_318_15 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_17 = arg_315_1:FormatText(StoryNameCfg[479].name)

				arg_315_1.leftNameTxt_.text = var_318_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_18 = arg_315_1:GetWordFromCfg(318031079)
				local var_318_19 = arg_315_1:FormatText(var_318_18.content)

				arg_315_1.text_.text = var_318_19

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_20 = 22
				local var_318_21 = utf8.len(var_318_19)
				local var_318_22 = var_318_20 <= 0 and var_318_16 or var_318_16 * (var_318_21 / var_318_20)

				if var_318_22 > 0 and var_318_16 < var_318_22 then
					arg_315_1.talkMaxDuration = var_318_22

					if var_318_22 + var_318_15 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_22 + var_318_15
					end
				end

				arg_315_1.text_.text = var_318_19
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031079", "story_v_out_318031.awb") ~= 0 then
					local var_318_23 = manager.audio:GetVoiceLength("story_v_out_318031", "318031079", "story_v_out_318031.awb") / 1000

					if var_318_23 + var_318_15 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_23 + var_318_15
					end

					if var_318_18.prefab_name ~= "" and arg_315_1.actors_[var_318_18.prefab_name] ~= nil then
						local var_318_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_18.prefab_name].transform, "story_v_out_318031", "318031079", "story_v_out_318031.awb")

						arg_315_1:RecordAudio("318031079", var_318_24)
						arg_315_1:RecordAudio("318031079", var_318_24)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_318031", "318031079", "story_v_out_318031.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_318031", "318031079", "story_v_out_318031.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_25 = math.max(var_318_16, arg_315_1.talkMaxDuration)

			if var_318_15 <= arg_315_1.time_ and arg_315_1.time_ < var_318_15 + var_318_25 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_15) / var_318_25

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_15 + var_318_25 and arg_315_1.time_ < var_318_15 + var_318_25 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play318031080 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 318031080
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play318031081(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1015ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1015ui_story == nil then
				arg_319_1.var_.characterEffect1015ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.200000002980232

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1015ui_story then
					local var_322_4 = Mathf.Lerp(0, 0.5, var_322_3)

					arg_319_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1015ui_story.fillRatio = var_322_4
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1015ui_story then
				local var_322_5 = 0.5

				arg_319_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1015ui_story.fillRatio = var_322_5
			end

			local var_322_6 = 0
			local var_322_7 = 0.175

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

				local var_322_9 = arg_319_1:GetWordFromCfg(318031080)
				local var_322_10 = arg_319_1:FormatText(var_322_9.content)

				arg_319_1.text_.text = var_322_10

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_11 = 7
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
	Play318031081 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 318031081
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play318031082(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1015ui_story"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos1015ui_story = var_326_0.localPosition
			end

			local var_326_2 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2
				local var_326_4 = Vector3.New(0, 100, 0)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1015ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(0, 100, 0)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = 0
			local var_326_10 = 0.6

			if var_326_9 < arg_323_1.time_ and arg_323_1.time_ <= var_326_9 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_11 = arg_323_1:GetWordFromCfg(318031081)
				local var_326_12 = arg_323_1:FormatText(var_326_11.content)

				arg_323_1.text_.text = var_326_12

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_13 = 24
				local var_326_14 = utf8.len(var_326_12)
				local var_326_15 = var_326_13 <= 0 and var_326_10 or var_326_10 * (var_326_14 / var_326_13)

				if var_326_15 > 0 and var_326_10 < var_326_15 then
					arg_323_1.talkMaxDuration = var_326_15

					if var_326_15 + var_326_9 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_15 + var_326_9
					end
				end

				arg_323_1.text_.text = var_326_12
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_16 = math.max(var_326_10, arg_323_1.talkMaxDuration)

			if var_326_9 <= arg_323_1.time_ and arg_323_1.time_ < var_326_9 + var_326_16 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_9) / var_326_16

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_9 + var_326_16 and arg_323_1.time_ < var_326_9 + var_326_16 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play318031082 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 318031082
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play318031083(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.625

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

				local var_330_3 = arg_327_1:GetWordFromCfg(318031082)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 25
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
	Play318031083 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 318031083
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play318031084(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 1.025

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_2 = arg_331_1:FormatText(StoryNameCfg[7].name)

				arg_331_1.leftNameTxt_.text = var_334_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_3 = arg_331_1:GetWordFromCfg(318031083)
				local var_334_4 = arg_331_1:FormatText(var_334_3.content)

				arg_331_1.text_.text = var_334_4

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_5 = 41
				local var_334_6 = utf8.len(var_334_4)
				local var_334_7 = var_334_5 <= 0 and var_334_1 or var_334_1 * (var_334_6 / var_334_5)

				if var_334_7 > 0 and var_334_1 < var_334_7 then
					arg_331_1.talkMaxDuration = var_334_7

					if var_334_7 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_7 + var_334_0
					end
				end

				arg_331_1.text_.text = var_334_4
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_8 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_8 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_8

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_8 and arg_331_1.time_ < var_334_0 + var_334_8 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play318031084 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 318031084
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play318031085(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.325

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[7].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(318031084)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 13
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_8 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_8 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_8

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_8 and arg_335_1.time_ < var_338_0 + var_338_8 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play318031085 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 318031085
		arg_339_1.duration_ = 8.4

		local var_339_0 = {
			zh = 4.3,
			ja = 8.4
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
				arg_339_0:Play318031086(arg_339_1)
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
				local var_342_4 = Vector3.New(0.7, -1.2, -6)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1049ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0.7, -1.2, -6)

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
				arg_339_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_342_15 = arg_339_1.actors_["1015ui_story"].transform
			local var_342_16 = 0

			if var_342_16 < arg_339_1.time_ and arg_339_1.time_ <= var_342_16 + arg_342_0 then
				arg_339_1.var_.moveOldPos1015ui_story = var_342_15.localPosition
			end

			local var_342_17 = 0.001

			if var_342_16 <= arg_339_1.time_ and arg_339_1.time_ < var_342_16 + var_342_17 then
				local var_342_18 = (arg_339_1.time_ - var_342_16) / var_342_17
				local var_342_19 = Vector3.New(-0.7, -1.15, -6.2)

				var_342_15.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1015ui_story, var_342_19, var_342_18)

				local var_342_20 = manager.ui.mainCamera.transform.position - var_342_15.position

				var_342_15.forward = Vector3.New(var_342_20.x, var_342_20.y, var_342_20.z)

				local var_342_21 = var_342_15.localEulerAngles

				var_342_21.z = 0
				var_342_21.x = 0
				var_342_15.localEulerAngles = var_342_21
			end

			if arg_339_1.time_ >= var_342_16 + var_342_17 and arg_339_1.time_ < var_342_16 + var_342_17 + arg_342_0 then
				var_342_15.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_342_22 = manager.ui.mainCamera.transform.position - var_342_15.position

				var_342_15.forward = Vector3.New(var_342_22.x, var_342_22.y, var_342_22.z)

				local var_342_23 = var_342_15.localEulerAngles

				var_342_23.z = 0
				var_342_23.x = 0
				var_342_15.localEulerAngles = var_342_23
			end

			local var_342_24 = 0

			if var_342_24 < arg_339_1.time_ and arg_339_1.time_ <= var_342_24 + arg_342_0 then
				arg_339_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_342_25 = 0

			if var_342_25 < arg_339_1.time_ and arg_339_1.time_ <= var_342_25 + arg_342_0 then
				arg_339_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_342_26 = arg_339_1.actors_["1015ui_story"]
			local var_342_27 = 0

			if var_342_27 < arg_339_1.time_ and arg_339_1.time_ <= var_342_27 + arg_342_0 and arg_339_1.var_.characterEffect1015ui_story == nil then
				arg_339_1.var_.characterEffect1015ui_story = var_342_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_28 = 0.200000002980232

			if var_342_27 <= arg_339_1.time_ and arg_339_1.time_ < var_342_27 + var_342_28 then
				local var_342_29 = (arg_339_1.time_ - var_342_27) / var_342_28

				if arg_339_1.var_.characterEffect1015ui_story then
					local var_342_30 = Mathf.Lerp(0, 0.5, var_342_29)

					arg_339_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1015ui_story.fillRatio = var_342_30
				end
			end

			if arg_339_1.time_ >= var_342_27 + var_342_28 and arg_339_1.time_ < var_342_27 + var_342_28 + arg_342_0 and arg_339_1.var_.characterEffect1015ui_story then
				local var_342_31 = 0.5

				arg_339_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1015ui_story.fillRatio = var_342_31
			end

			local var_342_32 = 0
			local var_342_33 = 0.45

			if var_342_32 < arg_339_1.time_ and arg_339_1.time_ <= var_342_32 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_34 = arg_339_1:FormatText(StoryNameCfg[562].name)

				arg_339_1.leftNameTxt_.text = var_342_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_35 = arg_339_1:GetWordFromCfg(318031085)
				local var_342_36 = arg_339_1:FormatText(var_342_35.content)

				arg_339_1.text_.text = var_342_36

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_37 = 18
				local var_342_38 = utf8.len(var_342_36)
				local var_342_39 = var_342_37 <= 0 and var_342_33 or var_342_33 * (var_342_38 / var_342_37)

				if var_342_39 > 0 and var_342_33 < var_342_39 then
					arg_339_1.talkMaxDuration = var_342_39

					if var_342_39 + var_342_32 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_39 + var_342_32
					end
				end

				arg_339_1.text_.text = var_342_36
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031085", "story_v_out_318031.awb") ~= 0 then
					local var_342_40 = manager.audio:GetVoiceLength("story_v_out_318031", "318031085", "story_v_out_318031.awb") / 1000

					if var_342_40 + var_342_32 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_40 + var_342_32
					end

					if var_342_35.prefab_name ~= "" and arg_339_1.actors_[var_342_35.prefab_name] ~= nil then
						local var_342_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_35.prefab_name].transform, "story_v_out_318031", "318031085", "story_v_out_318031.awb")

						arg_339_1:RecordAudio("318031085", var_342_41)
						arg_339_1:RecordAudio("318031085", var_342_41)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_318031", "318031085", "story_v_out_318031.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_318031", "318031085", "story_v_out_318031.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_42 = math.max(var_342_33, arg_339_1.talkMaxDuration)

			if var_342_32 <= arg_339_1.time_ and arg_339_1.time_ < var_342_32 + var_342_42 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_32) / var_342_42

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_32 + var_342_42 and arg_339_1.time_ < var_342_32 + var_342_42 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play318031086 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 318031086
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play318031087(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1049ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1049ui_story == nil then
				arg_343_1.var_.characterEffect1049ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1049ui_story then
					local var_346_4 = Mathf.Lerp(0, 0.5, var_346_3)

					arg_343_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1049ui_story.fillRatio = var_346_4
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1049ui_story then
				local var_346_5 = 0.5

				arg_343_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1049ui_story.fillRatio = var_346_5
			end

			local var_346_6 = 0
			local var_346_7 = 1.15

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_8 = arg_343_1:GetWordFromCfg(318031086)
				local var_346_9 = arg_343_1:FormatText(var_346_8.content)

				arg_343_1.text_.text = var_346_9

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_10 = 46
				local var_346_11 = utf8.len(var_346_9)
				local var_346_12 = var_346_10 <= 0 and var_346_7 or var_346_7 * (var_346_11 / var_346_10)

				if var_346_12 > 0 and var_346_7 < var_346_12 then
					arg_343_1.talkMaxDuration = var_346_12

					if var_346_12 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_12 + var_346_6
					end
				end

				arg_343_1.text_.text = var_346_9
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_13 = math.max(var_346_7, arg_343_1.talkMaxDuration)

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_13 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_6) / var_346_13

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_6 + var_346_13 and arg_343_1.time_ < var_346_6 + var_346_13 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play318031087 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 318031087
		arg_347_1.duration_ = 5.233

		local var_347_0 = {
			zh = 2.533,
			ja = 5.233
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
				arg_347_0:Play318031088(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1049ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect1049ui_story == nil then
				arg_347_1.var_.characterEffect1049ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.200000002980232

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect1049ui_story then
					arg_347_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect1049ui_story then
				arg_347_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_350_4 = 0
			local var_350_5 = 0.3

			if var_350_4 < arg_347_1.time_ and arg_347_1.time_ <= var_350_4 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_6 = arg_347_1:FormatText(StoryNameCfg[562].name)

				arg_347_1.leftNameTxt_.text = var_350_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_7 = arg_347_1:GetWordFromCfg(318031087)
				local var_350_8 = arg_347_1:FormatText(var_350_7.content)

				arg_347_1.text_.text = var_350_8

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_9 = 12
				local var_350_10 = utf8.len(var_350_8)
				local var_350_11 = var_350_9 <= 0 and var_350_5 or var_350_5 * (var_350_10 / var_350_9)

				if var_350_11 > 0 and var_350_5 < var_350_11 then
					arg_347_1.talkMaxDuration = var_350_11

					if var_350_11 + var_350_4 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_11 + var_350_4
					end
				end

				arg_347_1.text_.text = var_350_8
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031087", "story_v_out_318031.awb") ~= 0 then
					local var_350_12 = manager.audio:GetVoiceLength("story_v_out_318031", "318031087", "story_v_out_318031.awb") / 1000

					if var_350_12 + var_350_4 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_12 + var_350_4
					end

					if var_350_7.prefab_name ~= "" and arg_347_1.actors_[var_350_7.prefab_name] ~= nil then
						local var_350_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_7.prefab_name].transform, "story_v_out_318031", "318031087", "story_v_out_318031.awb")

						arg_347_1:RecordAudio("318031087", var_350_13)
						arg_347_1:RecordAudio("318031087", var_350_13)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_318031", "318031087", "story_v_out_318031.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_318031", "318031087", "story_v_out_318031.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_14 = math.max(var_350_5, arg_347_1.talkMaxDuration)

			if var_350_4 <= arg_347_1.time_ and arg_347_1.time_ < var_350_4 + var_350_14 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_4) / var_350_14

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_4 + var_350_14 and arg_347_1.time_ < var_350_4 + var_350_14 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play318031088 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 318031088
		arg_351_1.duration_ = 4.333

		local var_351_0 = {
			zh = 3.233,
			ja = 4.333
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
				arg_351_0:Play318031089(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1015ui_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.characterEffect1015ui_story == nil then
				arg_351_1.var_.characterEffect1015ui_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.200000002980232

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect1015ui_story then
					arg_351_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.characterEffect1015ui_story then
				arg_351_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_354_4 = arg_351_1.actors_["1049ui_story"]
			local var_354_5 = 0

			if var_354_5 < arg_351_1.time_ and arg_351_1.time_ <= var_354_5 + arg_354_0 and arg_351_1.var_.characterEffect1049ui_story == nil then
				arg_351_1.var_.characterEffect1049ui_story = var_354_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_6 = 0.200000002980232

			if var_354_5 <= arg_351_1.time_ and arg_351_1.time_ < var_354_5 + var_354_6 then
				local var_354_7 = (arg_351_1.time_ - var_354_5) / var_354_6

				if arg_351_1.var_.characterEffect1049ui_story then
					local var_354_8 = Mathf.Lerp(0, 0.5, var_354_7)

					arg_351_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1049ui_story.fillRatio = var_354_8
				end
			end

			if arg_351_1.time_ >= var_354_5 + var_354_6 and arg_351_1.time_ < var_354_5 + var_354_6 + arg_354_0 and arg_351_1.var_.characterEffect1049ui_story then
				local var_354_9 = 0.5

				arg_351_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1049ui_story.fillRatio = var_354_9
			end

			local var_354_10 = 0
			local var_354_11 = 0.625

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_12 = arg_351_1:FormatText(StoryNameCfg[479].name)

				arg_351_1.leftNameTxt_.text = var_354_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_13 = arg_351_1:GetWordFromCfg(318031088)
				local var_354_14 = arg_351_1:FormatText(var_354_13.content)

				arg_351_1.text_.text = var_354_14

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_15 = 25
				local var_354_16 = utf8.len(var_354_14)
				local var_354_17 = var_354_15 <= 0 and var_354_11 or var_354_11 * (var_354_16 / var_354_15)

				if var_354_17 > 0 and var_354_11 < var_354_17 then
					arg_351_1.talkMaxDuration = var_354_17

					if var_354_17 + var_354_10 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_17 + var_354_10
					end
				end

				arg_351_1.text_.text = var_354_14
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031088", "story_v_out_318031.awb") ~= 0 then
					local var_354_18 = manager.audio:GetVoiceLength("story_v_out_318031", "318031088", "story_v_out_318031.awb") / 1000

					if var_354_18 + var_354_10 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_18 + var_354_10
					end

					if var_354_13.prefab_name ~= "" and arg_351_1.actors_[var_354_13.prefab_name] ~= nil then
						local var_354_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_13.prefab_name].transform, "story_v_out_318031", "318031088", "story_v_out_318031.awb")

						arg_351_1:RecordAudio("318031088", var_354_19)
						arg_351_1:RecordAudio("318031088", var_354_19)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_318031", "318031088", "story_v_out_318031.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_318031", "318031088", "story_v_out_318031.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_20 = math.max(var_354_11, arg_351_1.talkMaxDuration)

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_20 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_10) / var_354_20

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_10 + var_354_20 and arg_351_1.time_ < var_354_10 + var_354_20 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play318031089 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 318031089
		arg_355_1.duration_ = 7.466

		local var_355_0 = {
			zh = 4.366,
			ja = 7.466
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
				arg_355_0:Play318031090(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1049ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1049ui_story == nil then
				arg_355_1.var_.characterEffect1049ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1049ui_story then
					arg_355_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1049ui_story then
				arg_355_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_358_4 = arg_355_1.actors_["1015ui_story"]
			local var_358_5 = 0

			if var_358_5 < arg_355_1.time_ and arg_355_1.time_ <= var_358_5 + arg_358_0 and arg_355_1.var_.characterEffect1015ui_story == nil then
				arg_355_1.var_.characterEffect1015ui_story = var_358_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_6 = 0.200000002980232

			if var_358_5 <= arg_355_1.time_ and arg_355_1.time_ < var_358_5 + var_358_6 then
				local var_358_7 = (arg_355_1.time_ - var_358_5) / var_358_6

				if arg_355_1.var_.characterEffect1015ui_story then
					local var_358_8 = Mathf.Lerp(0, 0.5, var_358_7)

					arg_355_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1015ui_story.fillRatio = var_358_8
				end
			end

			if arg_355_1.time_ >= var_358_5 + var_358_6 and arg_355_1.time_ < var_358_5 + var_358_6 + arg_358_0 and arg_355_1.var_.characterEffect1015ui_story then
				local var_358_9 = 0.5

				arg_355_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1015ui_story.fillRatio = var_358_9
			end

			local var_358_10 = 0
			local var_358_11 = 0.475

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_12 = arg_355_1:FormatText(StoryNameCfg[562].name)

				arg_355_1.leftNameTxt_.text = var_358_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_13 = arg_355_1:GetWordFromCfg(318031089)
				local var_358_14 = arg_355_1:FormatText(var_358_13.content)

				arg_355_1.text_.text = var_358_14

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_15 = 19
				local var_358_16 = utf8.len(var_358_14)
				local var_358_17 = var_358_15 <= 0 and var_358_11 or var_358_11 * (var_358_16 / var_358_15)

				if var_358_17 > 0 and var_358_11 < var_358_17 then
					arg_355_1.talkMaxDuration = var_358_17

					if var_358_17 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_17 + var_358_10
					end
				end

				arg_355_1.text_.text = var_358_14
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031089", "story_v_out_318031.awb") ~= 0 then
					local var_358_18 = manager.audio:GetVoiceLength("story_v_out_318031", "318031089", "story_v_out_318031.awb") / 1000

					if var_358_18 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_18 + var_358_10
					end

					if var_358_13.prefab_name ~= "" and arg_355_1.actors_[var_358_13.prefab_name] ~= nil then
						local var_358_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_13.prefab_name].transform, "story_v_out_318031", "318031089", "story_v_out_318031.awb")

						arg_355_1:RecordAudio("318031089", var_358_19)
						arg_355_1:RecordAudio("318031089", var_358_19)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_318031", "318031089", "story_v_out_318031.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_318031", "318031089", "story_v_out_318031.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_20 = math.max(var_358_11, arg_355_1.talkMaxDuration)

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_20 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_10) / var_358_20

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_10 + var_358_20 and arg_355_1.time_ < var_358_10 + var_358_20 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play318031090 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 318031090
		arg_359_1.duration_ = 3.5

		local var_359_0 = {
			zh = 2.066,
			ja = 3.5
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
				arg_359_0:Play318031091(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1015ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1015ui_story == nil then
				arg_359_1.var_.characterEffect1015ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.200000002980232

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1015ui_story then
					arg_359_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1015ui_story then
				arg_359_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_362_4 = 0

			if var_362_4 < arg_359_1.time_ and arg_359_1.time_ <= var_362_4 + arg_362_0 then
				arg_359_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_362_5 = 0

			if var_362_5 < arg_359_1.time_ and arg_359_1.time_ <= var_362_5 + arg_362_0 then
				arg_359_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_362_6 = arg_359_1.actors_["1049ui_story"]
			local var_362_7 = 0

			if var_362_7 < arg_359_1.time_ and arg_359_1.time_ <= var_362_7 + arg_362_0 and arg_359_1.var_.characterEffect1049ui_story == nil then
				arg_359_1.var_.characterEffect1049ui_story = var_362_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_8 = 0.200000002980232

			if var_362_7 <= arg_359_1.time_ and arg_359_1.time_ < var_362_7 + var_362_8 then
				local var_362_9 = (arg_359_1.time_ - var_362_7) / var_362_8

				if arg_359_1.var_.characterEffect1049ui_story then
					local var_362_10 = Mathf.Lerp(0, 0.5, var_362_9)

					arg_359_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1049ui_story.fillRatio = var_362_10
				end
			end

			if arg_359_1.time_ >= var_362_7 + var_362_8 and arg_359_1.time_ < var_362_7 + var_362_8 + arg_362_0 and arg_359_1.var_.characterEffect1049ui_story then
				local var_362_11 = 0.5

				arg_359_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1049ui_story.fillRatio = var_362_11
			end

			local var_362_12 = 0
			local var_362_13 = 0.275

			if var_362_12 < arg_359_1.time_ and arg_359_1.time_ <= var_362_12 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_14 = arg_359_1:FormatText(StoryNameCfg[479].name)

				arg_359_1.leftNameTxt_.text = var_362_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_15 = arg_359_1:GetWordFromCfg(318031090)
				local var_362_16 = arg_359_1:FormatText(var_362_15.content)

				arg_359_1.text_.text = var_362_16

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_17 = 11
				local var_362_18 = utf8.len(var_362_16)
				local var_362_19 = var_362_17 <= 0 and var_362_13 or var_362_13 * (var_362_18 / var_362_17)

				if var_362_19 > 0 and var_362_13 < var_362_19 then
					arg_359_1.talkMaxDuration = var_362_19

					if var_362_19 + var_362_12 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_19 + var_362_12
					end
				end

				arg_359_1.text_.text = var_362_16
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031090", "story_v_out_318031.awb") ~= 0 then
					local var_362_20 = manager.audio:GetVoiceLength("story_v_out_318031", "318031090", "story_v_out_318031.awb") / 1000

					if var_362_20 + var_362_12 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_20 + var_362_12
					end

					if var_362_15.prefab_name ~= "" and arg_359_1.actors_[var_362_15.prefab_name] ~= nil then
						local var_362_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_15.prefab_name].transform, "story_v_out_318031", "318031090", "story_v_out_318031.awb")

						arg_359_1:RecordAudio("318031090", var_362_21)
						arg_359_1:RecordAudio("318031090", var_362_21)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_318031", "318031090", "story_v_out_318031.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_318031", "318031090", "story_v_out_318031.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_22 = math.max(var_362_13, arg_359_1.talkMaxDuration)

			if var_362_12 <= arg_359_1.time_ and arg_359_1.time_ < var_362_12 + var_362_22 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_12) / var_362_22

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_12 + var_362_22 and arg_359_1.time_ < var_362_12 + var_362_22 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play318031091 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 318031091
		arg_363_1.duration_ = 7.866

		local var_363_0 = {
			zh = 2.166,
			ja = 7.866
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
				arg_363_0:Play318031092(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1049ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect1049ui_story == nil then
				arg_363_1.var_.characterEffect1049ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1049ui_story then
					arg_363_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect1049ui_story then
				arg_363_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_366_4 = arg_363_1.actors_["1015ui_story"]
			local var_366_5 = 0

			if var_366_5 < arg_363_1.time_ and arg_363_1.time_ <= var_366_5 + arg_366_0 and arg_363_1.var_.characterEffect1015ui_story == nil then
				arg_363_1.var_.characterEffect1015ui_story = var_366_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_6 = 0.200000002980232

			if var_366_5 <= arg_363_1.time_ and arg_363_1.time_ < var_366_5 + var_366_6 then
				local var_366_7 = (arg_363_1.time_ - var_366_5) / var_366_6

				if arg_363_1.var_.characterEffect1015ui_story then
					local var_366_8 = Mathf.Lerp(0, 0.5, var_366_7)

					arg_363_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1015ui_story.fillRatio = var_366_8
				end
			end

			if arg_363_1.time_ >= var_366_5 + var_366_6 and arg_363_1.time_ < var_366_5 + var_366_6 + arg_366_0 and arg_363_1.var_.characterEffect1015ui_story then
				local var_366_9 = 0.5

				arg_363_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1015ui_story.fillRatio = var_366_9
			end

			local var_366_10 = 0
			local var_366_11 = 0.3

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_12 = arg_363_1:FormatText(StoryNameCfg[562].name)

				arg_363_1.leftNameTxt_.text = var_366_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_13 = arg_363_1:GetWordFromCfg(318031091)
				local var_366_14 = arg_363_1:FormatText(var_366_13.content)

				arg_363_1.text_.text = var_366_14

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_15 = 12
				local var_366_16 = utf8.len(var_366_14)
				local var_366_17 = var_366_15 <= 0 and var_366_11 or var_366_11 * (var_366_16 / var_366_15)

				if var_366_17 > 0 and var_366_11 < var_366_17 then
					arg_363_1.talkMaxDuration = var_366_17

					if var_366_17 + var_366_10 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_17 + var_366_10
					end
				end

				arg_363_1.text_.text = var_366_14
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031091", "story_v_out_318031.awb") ~= 0 then
					local var_366_18 = manager.audio:GetVoiceLength("story_v_out_318031", "318031091", "story_v_out_318031.awb") / 1000

					if var_366_18 + var_366_10 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_10
					end

					if var_366_13.prefab_name ~= "" and arg_363_1.actors_[var_366_13.prefab_name] ~= nil then
						local var_366_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_13.prefab_name].transform, "story_v_out_318031", "318031091", "story_v_out_318031.awb")

						arg_363_1:RecordAudio("318031091", var_366_19)
						arg_363_1:RecordAudio("318031091", var_366_19)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_318031", "318031091", "story_v_out_318031.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_318031", "318031091", "story_v_out_318031.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_20 = math.max(var_366_11, arg_363_1.talkMaxDuration)

			if var_366_10 <= arg_363_1.time_ and arg_363_1.time_ < var_366_10 + var_366_20 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_10) / var_366_20

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_10 + var_366_20 and arg_363_1.time_ < var_366_10 + var_366_20 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play318031092 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 318031092
		arg_367_1.duration_ = 8.633

		local var_367_0 = {
			zh = 8.633,
			ja = 8.2
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
				arg_367_0:Play318031093(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049actionlink/1049action423")
			end

			local var_370_1 = 0
			local var_370_2 = 1.15

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_3 = arg_367_1:FormatText(StoryNameCfg[562].name)

				arg_367_1.leftNameTxt_.text = var_370_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_4 = arg_367_1:GetWordFromCfg(318031092)
				local var_370_5 = arg_367_1:FormatText(var_370_4.content)

				arg_367_1.text_.text = var_370_5

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_6 = 46
				local var_370_7 = utf8.len(var_370_5)
				local var_370_8 = var_370_6 <= 0 and var_370_2 or var_370_2 * (var_370_7 / var_370_6)

				if var_370_8 > 0 and var_370_2 < var_370_8 then
					arg_367_1.talkMaxDuration = var_370_8

					if var_370_8 + var_370_1 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_8 + var_370_1
					end
				end

				arg_367_1.text_.text = var_370_5
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031092", "story_v_out_318031.awb") ~= 0 then
					local var_370_9 = manager.audio:GetVoiceLength("story_v_out_318031", "318031092", "story_v_out_318031.awb") / 1000

					if var_370_9 + var_370_1 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_9 + var_370_1
					end

					if var_370_4.prefab_name ~= "" and arg_367_1.actors_[var_370_4.prefab_name] ~= nil then
						local var_370_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_4.prefab_name].transform, "story_v_out_318031", "318031092", "story_v_out_318031.awb")

						arg_367_1:RecordAudio("318031092", var_370_10)
						arg_367_1:RecordAudio("318031092", var_370_10)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_318031", "318031092", "story_v_out_318031.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_318031", "318031092", "story_v_out_318031.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_11 = math.max(var_370_2, arg_367_1.talkMaxDuration)

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_11 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_1) / var_370_11

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_1 + var_370_11 and arg_367_1.time_ < var_370_1 + var_370_11 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play318031093 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 318031093
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play318031094(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1049ui_story"]
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 and arg_371_1.var_.characterEffect1049ui_story == nil then
				arg_371_1.var_.characterEffect1049ui_story = var_374_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_2 = 0.200000002980232

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2

				if arg_371_1.var_.characterEffect1049ui_story then
					local var_374_4 = Mathf.Lerp(0, 0.5, var_374_3)

					arg_371_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_371_1.var_.characterEffect1049ui_story.fillRatio = var_374_4
				end
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 and arg_371_1.var_.characterEffect1049ui_story then
				local var_374_5 = 0.5

				arg_371_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_371_1.var_.characterEffect1049ui_story.fillRatio = var_374_5
			end

			local var_374_6 = 0
			local var_374_7 = 1

			if var_374_6 < arg_371_1.time_ and arg_371_1.time_ <= var_374_6 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_8 = arg_371_1:GetWordFromCfg(318031093)
				local var_374_9 = arg_371_1:FormatText(var_374_8.content)

				arg_371_1.text_.text = var_374_9

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_10 = 40
				local var_374_11 = utf8.len(var_374_9)
				local var_374_12 = var_374_10 <= 0 and var_374_7 or var_374_7 * (var_374_11 / var_374_10)

				if var_374_12 > 0 and var_374_7 < var_374_12 then
					arg_371_1.talkMaxDuration = var_374_12

					if var_374_12 + var_374_6 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_12 + var_374_6
					end
				end

				arg_371_1.text_.text = var_374_9
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_13 = math.max(var_374_7, arg_371_1.talkMaxDuration)

			if var_374_6 <= arg_371_1.time_ and arg_371_1.time_ < var_374_6 + var_374_13 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_6) / var_374_13

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_6 + var_374_13 and arg_371_1.time_ < var_374_6 + var_374_13 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play318031094 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 318031094
		arg_375_1.duration_ = 8.133

		local var_375_0 = {
			zh = 8.133,
			ja = 7.4
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
				arg_375_0:Play318031095(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1049ui_story"]
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 and arg_375_1.var_.characterEffect1049ui_story == nil then
				arg_375_1.var_.characterEffect1049ui_story = var_378_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_2 = 0.200000002980232

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2

				if arg_375_1.var_.characterEffect1049ui_story then
					arg_375_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 and arg_375_1.var_.characterEffect1049ui_story then
				arg_375_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_378_4 = 0

			if var_378_4 < arg_375_1.time_ and arg_375_1.time_ <= var_378_4 + arg_378_0 then
				arg_375_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_2")
			end

			local var_378_5 = 0

			if var_378_5 < arg_375_1.time_ and arg_375_1.time_ <= var_378_5 + arg_378_0 then
				arg_375_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_378_6 = 0
			local var_378_7 = 0.625

			if var_378_6 < arg_375_1.time_ and arg_375_1.time_ <= var_378_6 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_8 = arg_375_1:FormatText(StoryNameCfg[562].name)

				arg_375_1.leftNameTxt_.text = var_378_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_9 = arg_375_1:GetWordFromCfg(318031094)
				local var_378_10 = arg_375_1:FormatText(var_378_9.content)

				arg_375_1.text_.text = var_378_10

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_11 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031094", "story_v_out_318031.awb") ~= 0 then
					local var_378_14 = manager.audio:GetVoiceLength("story_v_out_318031", "318031094", "story_v_out_318031.awb") / 1000

					if var_378_14 + var_378_6 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_14 + var_378_6
					end

					if var_378_9.prefab_name ~= "" and arg_375_1.actors_[var_378_9.prefab_name] ~= nil then
						local var_378_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_9.prefab_name].transform, "story_v_out_318031", "318031094", "story_v_out_318031.awb")

						arg_375_1:RecordAudio("318031094", var_378_15)
						arg_375_1:RecordAudio("318031094", var_378_15)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_318031", "318031094", "story_v_out_318031.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_318031", "318031094", "story_v_out_318031.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_16 = math.max(var_378_7, arg_375_1.talkMaxDuration)

			if var_378_6 <= arg_375_1.time_ and arg_375_1.time_ < var_378_6 + var_378_16 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_6) / var_378_16

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_6 + var_378_16 and arg_375_1.time_ < var_378_6 + var_378_16 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play318031095 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 318031095
		arg_379_1.duration_ = 5.433

		local var_379_0 = {
			zh = 2.5,
			ja = 5.433
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
				arg_379_0:Play318031096(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1049ui_story"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and arg_379_1.var_.characterEffect1049ui_story == nil then
				arg_379_1.var_.characterEffect1049ui_story = var_382_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_2 = 0.200000002980232

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.characterEffect1049ui_story then
					arg_379_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and arg_379_1.var_.characterEffect1049ui_story then
				arg_379_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_382_4 = 0

			if var_382_4 < arg_379_1.time_ and arg_379_1.time_ <= var_382_4 + arg_382_0 then
				arg_379_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_382_5 = 0
			local var_382_6 = 0.375

			if var_382_5 < arg_379_1.time_ and arg_379_1.time_ <= var_382_5 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_7 = arg_379_1:FormatText(StoryNameCfg[562].name)

				arg_379_1.leftNameTxt_.text = var_382_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_8 = arg_379_1:GetWordFromCfg(318031095)
				local var_382_9 = arg_379_1:FormatText(var_382_8.content)

				arg_379_1.text_.text = var_382_9

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_10 = 15
				local var_382_11 = utf8.len(var_382_9)
				local var_382_12 = var_382_10 <= 0 and var_382_6 or var_382_6 * (var_382_11 / var_382_10)

				if var_382_12 > 0 and var_382_6 < var_382_12 then
					arg_379_1.talkMaxDuration = var_382_12

					if var_382_12 + var_382_5 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_12 + var_382_5
					end
				end

				arg_379_1.text_.text = var_382_9
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031095", "story_v_out_318031.awb") ~= 0 then
					local var_382_13 = manager.audio:GetVoiceLength("story_v_out_318031", "318031095", "story_v_out_318031.awb") / 1000

					if var_382_13 + var_382_5 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_13 + var_382_5
					end

					if var_382_8.prefab_name ~= "" and arg_379_1.actors_[var_382_8.prefab_name] ~= nil then
						local var_382_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_8.prefab_name].transform, "story_v_out_318031", "318031095", "story_v_out_318031.awb")

						arg_379_1:RecordAudio("318031095", var_382_14)
						arg_379_1:RecordAudio("318031095", var_382_14)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_318031", "318031095", "story_v_out_318031.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_318031", "318031095", "story_v_out_318031.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_15 = math.max(var_382_6, arg_379_1.talkMaxDuration)

			if var_382_5 <= arg_379_1.time_ and arg_379_1.time_ < var_382_5 + var_382_15 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_5) / var_382_15

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_5 + var_382_15 and arg_379_1.time_ < var_382_5 + var_382_15 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play318031096 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 318031096
		arg_383_1.duration_ = 9

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play318031097(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = "K13f"

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
				local var_386_5 = arg_383_1.bgs_.K13f

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
					if iter_386_0 ~= "K13f" then
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
			local var_386_28 = 2

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
			local var_386_37 = 2

			if var_386_37 < arg_383_1.time_ and arg_383_1.time_ <= var_386_37 + arg_386_0 and arg_383_1.var_.characterEffect1049ui_story == nil then
				arg_383_1.var_.characterEffect1049ui_story = var_386_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_38 = 0.200000002980232

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

			local var_386_42 = 0
			local var_386_43 = 0.433333333333333

			if var_386_42 < arg_383_1.time_ and arg_383_1.time_ <= var_386_42 + arg_386_0 then
				local var_386_44 = "play"
				local var_386_45 = "music"

				arg_383_1:AudioAction(var_386_44, var_386_45, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_386_46 = 1.26666666666667
			local var_386_47 = 1

			if var_386_46 < arg_383_1.time_ and arg_383_1.time_ <= var_386_46 + arg_386_0 then
				local var_386_48 = "play"
				local var_386_49 = "music"

				arg_383_1:AudioAction(var_386_48, var_386_49, "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten.awb")
			end

			local var_386_50 = arg_383_1.actors_["1015ui_story"].transform
			local var_386_51 = 2

			if var_386_51 < arg_383_1.time_ and arg_383_1.time_ <= var_386_51 + arg_386_0 then
				arg_383_1.var_.moveOldPos1015ui_story = var_386_50.localPosition
			end

			local var_386_52 = 0.001

			if var_386_51 <= arg_383_1.time_ and arg_383_1.time_ < var_386_51 + var_386_52 then
				local var_386_53 = (arg_383_1.time_ - var_386_51) / var_386_52
				local var_386_54 = Vector3.New(0, 100, 0)

				var_386_50.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1015ui_story, var_386_54, var_386_53)

				local var_386_55 = manager.ui.mainCamera.transform.position - var_386_50.position

				var_386_50.forward = Vector3.New(var_386_55.x, var_386_55.y, var_386_55.z)

				local var_386_56 = var_386_50.localEulerAngles

				var_386_56.z = 0
				var_386_56.x = 0
				var_386_50.localEulerAngles = var_386_56
			end

			if arg_383_1.time_ >= var_386_51 + var_386_52 and arg_383_1.time_ < var_386_51 + var_386_52 + arg_386_0 then
				var_386_50.localPosition = Vector3.New(0, 100, 0)

				local var_386_57 = manager.ui.mainCamera.transform.position - var_386_50.position

				var_386_50.forward = Vector3.New(var_386_57.x, var_386_57.y, var_386_57.z)

				local var_386_58 = var_386_50.localEulerAngles

				var_386_58.z = 0
				var_386_58.x = 0
				var_386_50.localEulerAngles = var_386_58
			end

			if arg_383_1.frameCnt_ <= 1 then
				arg_383_1.dialog_:SetActive(false)
			end

			local var_386_59 = 4
			local var_386_60 = 0.6

			if var_386_59 < arg_383_1.time_ and arg_383_1.time_ <= var_386_59 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0

				arg_383_1.dialog_:SetActive(true)

				local var_386_61 = LeanTween.value(arg_383_1.dialog_, 0, 1, 0.3)

				var_386_61:setOnUpdate(LuaHelper.FloatAction(function(arg_387_0)
					arg_383_1.dialogCg_.alpha = arg_387_0
				end))
				var_386_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_383_1.dialog_)
					var_386_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_383_1.duration_ = arg_383_1.duration_ + 0.3

				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_62 = arg_383_1:GetWordFromCfg(318031096)
				local var_386_63 = arg_383_1:FormatText(var_386_62.content)

				arg_383_1.text_.text = var_386_63

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_64 = 24
				local var_386_65 = utf8.len(var_386_63)
				local var_386_66 = var_386_64 <= 0 and var_386_60 or var_386_60 * (var_386_65 / var_386_64)

				if var_386_66 > 0 and var_386_60 < var_386_66 then
					arg_383_1.talkMaxDuration = var_386_66
					var_386_59 = var_386_59 + 0.3

					if var_386_66 + var_386_59 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_66 + var_386_59
					end
				end

				arg_383_1.text_.text = var_386_63
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_67 = var_386_59 + 0.3
			local var_386_68 = math.max(var_386_60, arg_383_1.talkMaxDuration)

			if var_386_67 <= arg_383_1.time_ and arg_383_1.time_ < var_386_67 + var_386_68 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_67) / var_386_68

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_67 + var_386_68 and arg_383_1.time_ < var_386_67 + var_386_68 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play318031097 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 318031097
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play318031098(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 1.075

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

				local var_392_2 = arg_389_1:GetWordFromCfg(318031097)
				local var_392_3 = arg_389_1:FormatText(var_392_2.content)

				arg_389_1.text_.text = var_392_3

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_4 = 43
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
	Play318031098 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 318031098
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play318031099(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 0.75

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

				local var_396_2 = arg_393_1:GetWordFromCfg(318031098)
				local var_396_3 = arg_393_1:FormatText(var_396_2.content)

				arg_393_1.text_.text = var_396_3

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_4 = 30
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
	Play318031099 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 318031099
		arg_397_1.duration_ = 2.433

		local var_397_0 = {
			zh = 1.999999999999,
			ja = 2.433
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
				arg_397_0:Play318031100(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1093ui_story"].transform
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				arg_397_1.var_.moveOldPos1093ui_story = var_400_0.localPosition
			end

			local var_400_2 = 0.001

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2
				local var_400_4 = Vector3.New(0, -1.11, -5.88)

				var_400_0.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1093ui_story, var_400_4, var_400_3)

				local var_400_5 = manager.ui.mainCamera.transform.position - var_400_0.position

				var_400_0.forward = Vector3.New(var_400_5.x, var_400_5.y, var_400_5.z)

				local var_400_6 = var_400_0.localEulerAngles

				var_400_6.z = 0
				var_400_6.x = 0
				var_400_0.localEulerAngles = var_400_6
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 then
				var_400_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_400_7 = manager.ui.mainCamera.transform.position - var_400_0.position

				var_400_0.forward = Vector3.New(var_400_7.x, var_400_7.y, var_400_7.z)

				local var_400_8 = var_400_0.localEulerAngles

				var_400_8.z = 0
				var_400_8.x = 0
				var_400_0.localEulerAngles = var_400_8
			end

			local var_400_9 = arg_397_1.actors_["1093ui_story"]
			local var_400_10 = 0

			if var_400_10 < arg_397_1.time_ and arg_397_1.time_ <= var_400_10 + arg_400_0 and arg_397_1.var_.characterEffect1093ui_story == nil then
				arg_397_1.var_.characterEffect1093ui_story = var_400_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_11 = 0.200000002980232

			if var_400_10 <= arg_397_1.time_ and arg_397_1.time_ < var_400_10 + var_400_11 then
				local var_400_12 = (arg_397_1.time_ - var_400_10) / var_400_11

				if arg_397_1.var_.characterEffect1093ui_story then
					arg_397_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_10 + var_400_11 and arg_397_1.time_ < var_400_10 + var_400_11 + arg_400_0 and arg_397_1.var_.characterEffect1093ui_story then
				arg_397_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_400_13 = 0

			if var_400_13 < arg_397_1.time_ and arg_397_1.time_ <= var_400_13 + arg_400_0 then
				arg_397_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_400_14 = 0

			if var_400_14 < arg_397_1.time_ and arg_397_1.time_ <= var_400_14 + arg_400_0 then
				arg_397_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_400_15 = 0
			local var_400_16 = 0.2

			if var_400_15 < arg_397_1.time_ and arg_397_1.time_ <= var_400_15 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_17 = arg_397_1:FormatText(StoryNameCfg[73].name)

				arg_397_1.leftNameTxt_.text = var_400_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_18 = arg_397_1:GetWordFromCfg(318031099)
				local var_400_19 = arg_397_1:FormatText(var_400_18.content)

				arg_397_1.text_.text = var_400_19

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_20 = 8
				local var_400_21 = utf8.len(var_400_19)
				local var_400_22 = var_400_20 <= 0 and var_400_16 or var_400_16 * (var_400_21 / var_400_20)

				if var_400_22 > 0 and var_400_16 < var_400_22 then
					arg_397_1.talkMaxDuration = var_400_22

					if var_400_22 + var_400_15 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_22 + var_400_15
					end
				end

				arg_397_1.text_.text = var_400_19
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031099", "story_v_out_318031.awb") ~= 0 then
					local var_400_23 = manager.audio:GetVoiceLength("story_v_out_318031", "318031099", "story_v_out_318031.awb") / 1000

					if var_400_23 + var_400_15 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_23 + var_400_15
					end

					if var_400_18.prefab_name ~= "" and arg_397_1.actors_[var_400_18.prefab_name] ~= nil then
						local var_400_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_18.prefab_name].transform, "story_v_out_318031", "318031099", "story_v_out_318031.awb")

						arg_397_1:RecordAudio("318031099", var_400_24)
						arg_397_1:RecordAudio("318031099", var_400_24)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_318031", "318031099", "story_v_out_318031.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_318031", "318031099", "story_v_out_318031.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_25 = math.max(var_400_16, arg_397_1.talkMaxDuration)

			if var_400_15 <= arg_397_1.time_ and arg_397_1.time_ < var_400_15 + var_400_25 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_15) / var_400_25

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_15 + var_400_25 and arg_397_1.time_ < var_400_15 + var_400_25 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play318031100 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 318031100
		arg_401_1.duration_ = 4.1

		local var_401_0 = {
			zh = 4.1,
			ja = 3.533
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
				arg_401_0:Play318031101(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 0.45

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_2 = arg_401_1:FormatText(StoryNameCfg[73].name)

				arg_401_1.leftNameTxt_.text = var_404_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_3 = arg_401_1:GetWordFromCfg(318031100)
				local var_404_4 = arg_401_1:FormatText(var_404_3.content)

				arg_401_1.text_.text = var_404_4

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_5 = 18
				local var_404_6 = utf8.len(var_404_4)
				local var_404_7 = var_404_5 <= 0 and var_404_1 or var_404_1 * (var_404_6 / var_404_5)

				if var_404_7 > 0 and var_404_1 < var_404_7 then
					arg_401_1.talkMaxDuration = var_404_7

					if var_404_7 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_7 + var_404_0
					end
				end

				arg_401_1.text_.text = var_404_4
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031100", "story_v_out_318031.awb") ~= 0 then
					local var_404_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031100", "story_v_out_318031.awb") / 1000

					if var_404_8 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_8 + var_404_0
					end

					if var_404_3.prefab_name ~= "" and arg_401_1.actors_[var_404_3.prefab_name] ~= nil then
						local var_404_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_3.prefab_name].transform, "story_v_out_318031", "318031100", "story_v_out_318031.awb")

						arg_401_1:RecordAudio("318031100", var_404_9)
						arg_401_1:RecordAudio("318031100", var_404_9)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_318031", "318031100", "story_v_out_318031.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_318031", "318031100", "story_v_out_318031.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_10 = math.max(var_404_1, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_10 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_0) / var_404_10

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_10 and arg_401_1.time_ < var_404_0 + var_404_10 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play318031101 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 318031101
		arg_405_1.duration_ = 8.2

		local var_405_0 = {
			zh = 7.366,
			ja = 8.2
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
				arg_405_0:Play318031102(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = "LX0101"

			if arg_405_1.bgs_[var_408_0] == nil then
				local var_408_1 = Object.Instantiate(arg_405_1.paintGo_)

				var_408_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_408_0)
				var_408_1.name = var_408_0
				var_408_1.transform.parent = arg_405_1.stage_.transform
				var_408_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_405_1.bgs_[var_408_0] = var_408_1
			end

			local var_408_2 = 2

			if var_408_2 < arg_405_1.time_ and arg_405_1.time_ <= var_408_2 + arg_408_0 then
				local var_408_3 = manager.ui.mainCamera.transform.localPosition
				local var_408_4 = Vector3.New(0, 0, 10) + Vector3.New(var_408_3.x, var_408_3.y, 0)
				local var_408_5 = arg_405_1.bgs_.LX0101

				var_408_5.transform.localPosition = var_408_4
				var_408_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_408_6 = var_408_5:GetComponent("SpriteRenderer")

				if var_408_6 and var_408_6.sprite then
					local var_408_7 = (var_408_5.transform.localPosition - var_408_3).z
					local var_408_8 = manager.ui.mainCameraCom_
					local var_408_9 = 2 * var_408_7 * Mathf.Tan(var_408_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_408_10 = var_408_9 * var_408_8.aspect
					local var_408_11 = var_408_6.sprite.bounds.size.x
					local var_408_12 = var_408_6.sprite.bounds.size.y
					local var_408_13 = var_408_10 / var_408_11
					local var_408_14 = var_408_9 / var_408_12
					local var_408_15 = var_408_14 < var_408_13 and var_408_13 or var_408_14

					var_408_5.transform.localScale = Vector3.New(var_408_15, var_408_15, 0)
				end

				for iter_408_0, iter_408_1 in pairs(arg_405_1.bgs_) do
					if iter_408_0 ~= "LX0101" then
						iter_408_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_408_16 = 0

			if var_408_16 < arg_405_1.time_ and arg_405_1.time_ <= var_408_16 + arg_408_0 then
				arg_405_1.mask_.enabled = true
				arg_405_1.mask_.raycastTarget = true

				arg_405_1:SetGaussion(false)
			end

			local var_408_17 = 2

			if var_408_16 <= arg_405_1.time_ and arg_405_1.time_ < var_408_16 + var_408_17 then
				local var_408_18 = (arg_405_1.time_ - var_408_16) / var_408_17
				local var_408_19 = Color.New(0, 0, 0)

				var_408_19.a = Mathf.Lerp(0, 1, var_408_18)
				arg_405_1.mask_.color = var_408_19
			end

			if arg_405_1.time_ >= var_408_16 + var_408_17 and arg_405_1.time_ < var_408_16 + var_408_17 + arg_408_0 then
				local var_408_20 = Color.New(0, 0, 0)

				var_408_20.a = 1
				arg_405_1.mask_.color = var_408_20
			end

			local var_408_21 = 2

			if var_408_21 < arg_405_1.time_ and arg_405_1.time_ <= var_408_21 + arg_408_0 then
				arg_405_1.mask_.enabled = true
				arg_405_1.mask_.raycastTarget = true

				arg_405_1:SetGaussion(false)
			end

			local var_408_22 = 2

			if var_408_21 <= arg_405_1.time_ and arg_405_1.time_ < var_408_21 + var_408_22 then
				local var_408_23 = (arg_405_1.time_ - var_408_21) / var_408_22
				local var_408_24 = Color.New(0, 0, 0)

				var_408_24.a = Mathf.Lerp(1, 0, var_408_23)
				arg_405_1.mask_.color = var_408_24
			end

			if arg_405_1.time_ >= var_408_21 + var_408_22 and arg_405_1.time_ < var_408_21 + var_408_22 + arg_408_0 then
				local var_408_25 = Color.New(0, 0, 0)
				local var_408_26 = 0

				arg_405_1.mask_.enabled = false
				var_408_25.a = var_408_26
				arg_405_1.mask_.color = var_408_25
			end

			local var_408_27 = arg_405_1.actors_["1199ui_story"].transform
			local var_408_28 = 2

			if var_408_28 < arg_405_1.time_ and arg_405_1.time_ <= var_408_28 + arg_408_0 then
				arg_405_1.var_.moveOldPos1199ui_story = var_408_27.localPosition
			end

			local var_408_29 = 0.001

			if var_408_28 <= arg_405_1.time_ and arg_405_1.time_ < var_408_28 + var_408_29 then
				local var_408_30 = (arg_405_1.time_ - var_408_28) / var_408_29
				local var_408_31 = Vector3.New(0, 100, 0)

				var_408_27.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1199ui_story, var_408_31, var_408_30)

				local var_408_32 = manager.ui.mainCamera.transform.position - var_408_27.position

				var_408_27.forward = Vector3.New(var_408_32.x, var_408_32.y, var_408_32.z)

				local var_408_33 = var_408_27.localEulerAngles

				var_408_33.z = 0
				var_408_33.x = 0
				var_408_27.localEulerAngles = var_408_33
			end

			if arg_405_1.time_ >= var_408_28 + var_408_29 and arg_405_1.time_ < var_408_28 + var_408_29 + arg_408_0 then
				var_408_27.localPosition = Vector3.New(0, 100, 0)

				local var_408_34 = manager.ui.mainCamera.transform.position - var_408_27.position

				var_408_27.forward = Vector3.New(var_408_34.x, var_408_34.y, var_408_34.z)

				local var_408_35 = var_408_27.localEulerAngles

				var_408_35.z = 0
				var_408_35.x = 0
				var_408_27.localEulerAngles = var_408_35
			end

			local var_408_36 = arg_405_1.actors_["1199ui_story"]
			local var_408_37 = 2

			if var_408_37 < arg_405_1.time_ and arg_405_1.time_ <= var_408_37 + arg_408_0 and arg_405_1.var_.characterEffect1199ui_story == nil then
				arg_405_1.var_.characterEffect1199ui_story = var_408_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_38 = 0.200000002980232

			if var_408_37 <= arg_405_1.time_ and arg_405_1.time_ < var_408_37 + var_408_38 then
				local var_408_39 = (arg_405_1.time_ - var_408_37) / var_408_38

				if arg_405_1.var_.characterEffect1199ui_story then
					arg_405_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_37 + var_408_38 and arg_405_1.time_ < var_408_37 + var_408_38 + arg_408_0 and arg_405_1.var_.characterEffect1199ui_story then
				arg_405_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_408_40 = 2

			if var_408_40 < arg_405_1.time_ and arg_405_1.time_ <= var_408_40 + arg_408_0 then
				arg_405_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_408_41 = 2

			if var_408_41 < arg_405_1.time_ and arg_405_1.time_ <= var_408_41 + arg_408_0 then
				arg_405_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_408_42 = arg_405_1.actors_["1093ui_story"].transform
			local var_408_43 = 0

			if var_408_43 < arg_405_1.time_ and arg_405_1.time_ <= var_408_43 + arg_408_0 then
				arg_405_1.var_.moveOldPos1093ui_story = var_408_42.localPosition
			end

			local var_408_44 = 0.001

			if var_408_43 <= arg_405_1.time_ and arg_405_1.time_ < var_408_43 + var_408_44 then
				local var_408_45 = (arg_405_1.time_ - var_408_43) / var_408_44
				local var_408_46 = Vector3.New(0, 100, 0)

				var_408_42.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1093ui_story, var_408_46, var_408_45)

				local var_408_47 = manager.ui.mainCamera.transform.position - var_408_42.position

				var_408_42.forward = Vector3.New(var_408_47.x, var_408_47.y, var_408_47.z)

				local var_408_48 = var_408_42.localEulerAngles

				var_408_48.z = 0
				var_408_48.x = 0
				var_408_42.localEulerAngles = var_408_48
			end

			if arg_405_1.time_ >= var_408_43 + var_408_44 and arg_405_1.time_ < var_408_43 + var_408_44 + arg_408_0 then
				var_408_42.localPosition = Vector3.New(0, 100, 0)

				local var_408_49 = manager.ui.mainCamera.transform.position - var_408_42.position

				var_408_42.forward = Vector3.New(var_408_49.x, var_408_49.y, var_408_49.z)

				local var_408_50 = var_408_42.localEulerAngles

				var_408_50.z = 0
				var_408_50.x = 0
				var_408_42.localEulerAngles = var_408_50
			end

			local var_408_51 = arg_405_1.actors_["1093ui_story"]
			local var_408_52 = 0

			if var_408_52 < arg_405_1.time_ and arg_405_1.time_ <= var_408_52 + arg_408_0 and arg_405_1.var_.characterEffect1093ui_story == nil then
				arg_405_1.var_.characterEffect1093ui_story = var_408_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_53 = 0.200000002980232

			if var_408_52 <= arg_405_1.time_ and arg_405_1.time_ < var_408_52 + var_408_53 then
				local var_408_54 = (arg_405_1.time_ - var_408_52) / var_408_53

				if arg_405_1.var_.characterEffect1093ui_story then
					local var_408_55 = Mathf.Lerp(0, 0.5, var_408_54)

					arg_405_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_405_1.var_.characterEffect1093ui_story.fillRatio = var_408_55
				end
			end

			if arg_405_1.time_ >= var_408_52 + var_408_53 and arg_405_1.time_ < var_408_52 + var_408_53 + arg_408_0 and arg_405_1.var_.characterEffect1093ui_story then
				local var_408_56 = 0.5

				arg_405_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_405_1.var_.characterEffect1093ui_story.fillRatio = var_408_56
			end

			local var_408_57 = arg_405_1.bgs_.LX0101.transform
			local var_408_58 = 2

			if var_408_58 < arg_405_1.time_ and arg_405_1.time_ <= var_408_58 + arg_408_0 then
				arg_405_1.var_.moveOldPosLX0101 = var_408_57.localPosition
			end

			local var_408_59 = 0.001

			if var_408_58 <= arg_405_1.time_ and arg_405_1.time_ < var_408_58 + var_408_59 then
				local var_408_60 = (arg_405_1.time_ - var_408_58) / var_408_59
				local var_408_61 = Vector3.New(0, 1, 8)

				var_408_57.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPosLX0101, var_408_61, var_408_60)
			end

			if arg_405_1.time_ >= var_408_58 + var_408_59 and arg_405_1.time_ < var_408_58 + var_408_59 + arg_408_0 then
				var_408_57.localPosition = Vector3.New(0, 1, 8)
			end

			local var_408_62 = arg_405_1.bgs_.LX0101.transform
			local var_408_63 = 2.01666666666667

			if var_408_63 < arg_405_1.time_ and arg_405_1.time_ <= var_408_63 + arg_408_0 then
				arg_405_1.var_.moveOldPosLX0101 = var_408_62.localPosition
			end

			local var_408_64 = 2.5

			if var_408_63 <= arg_405_1.time_ and arg_405_1.time_ < var_408_63 + var_408_64 then
				local var_408_65 = (arg_405_1.time_ - var_408_63) / var_408_64
				local var_408_66 = Vector3.New(0, 1, 10)

				var_408_62.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPosLX0101, var_408_66, var_408_65)
			end

			if arg_405_1.time_ >= var_408_63 + var_408_64 and arg_405_1.time_ < var_408_63 + var_408_64 + arg_408_0 then
				var_408_62.localPosition = Vector3.New(0, 1, 10)
			end

			local var_408_67 = 4

			if var_408_67 < arg_405_1.time_ and arg_405_1.time_ <= var_408_67 + arg_408_0 then
				arg_405_1.allBtn_.enabled = false
			end

			local var_408_68 = 0.516666666666667

			if arg_405_1.time_ >= var_408_67 + var_408_68 and arg_405_1.time_ < var_408_67 + var_408_68 + arg_408_0 then
				arg_405_1.allBtn_.enabled = true
			end

			local var_408_69 = manager.ui.mainCamera.transform
			local var_408_70 = 2.01666666666667

			if var_408_70 < arg_405_1.time_ and arg_405_1.time_ <= var_408_70 + arg_408_0 then
				local var_408_71 = arg_405_1.var_.effect丽天宫上空1

				if not var_408_71 then
					var_408_71 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ripple"))
					var_408_71.name = "丽天宫上空1"
					arg_405_1.var_.effect丽天宫上空1 = var_408_71
				end

				local var_408_72 = var_408_69:Find("")

				if var_408_72 then
					var_408_71.transform.parent = var_408_72
				else
					var_408_71.transform.parent = var_408_69
				end

				var_408_71.transform.localPosition = Vector3.New(0, 0, 0)
				var_408_71.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_405_1.frameCnt_ <= 1 then
				arg_405_1.dialog_:SetActive(false)
			end

			local var_408_73 = 4
			local var_408_74 = 0.25

			if var_408_73 < arg_405_1.time_ and arg_405_1.time_ <= var_408_73 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0

				arg_405_1.dialog_:SetActive(true)

				local var_408_75 = LeanTween.value(arg_405_1.dialog_, 0, 1, 0.3)

				var_408_75:setOnUpdate(LuaHelper.FloatAction(function(arg_409_0)
					arg_405_1.dialogCg_.alpha = arg_409_0
				end))
				var_408_75:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_405_1.dialog_)
					var_408_75:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_405_1.duration_ = arg_405_1.duration_ + 0.3

				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_76 = arg_405_1:FormatText(StoryNameCfg[84].name)

				arg_405_1.leftNameTxt_.text = var_408_76

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, true)
				arg_405_1.iconController_:SetSelectedState("hero")

				arg_405_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1199")

				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_77 = arg_405_1:GetWordFromCfg(318031101)
				local var_408_78 = arg_405_1:FormatText(var_408_77.content)

				arg_405_1.text_.text = var_408_78

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_79 = 10
				local var_408_80 = utf8.len(var_408_78)
				local var_408_81 = var_408_79 <= 0 and var_408_74 or var_408_74 * (var_408_80 / var_408_79)

				if var_408_81 > 0 and var_408_74 < var_408_81 then
					arg_405_1.talkMaxDuration = var_408_81
					var_408_73 = var_408_73 + 0.3

					if var_408_81 + var_408_73 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_81 + var_408_73
					end
				end

				arg_405_1.text_.text = var_408_78
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031101", "story_v_out_318031.awb") ~= 0 then
					local var_408_82 = manager.audio:GetVoiceLength("story_v_out_318031", "318031101", "story_v_out_318031.awb") / 1000

					if var_408_82 + var_408_73 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_82 + var_408_73
					end

					if var_408_77.prefab_name ~= "" and arg_405_1.actors_[var_408_77.prefab_name] ~= nil then
						local var_408_83 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_77.prefab_name].transform, "story_v_out_318031", "318031101", "story_v_out_318031.awb")

						arg_405_1:RecordAudio("318031101", var_408_83)
						arg_405_1:RecordAudio("318031101", var_408_83)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_318031", "318031101", "story_v_out_318031.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_318031", "318031101", "story_v_out_318031.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_84 = var_408_73 + 0.3
			local var_408_85 = math.max(var_408_74, arg_405_1.talkMaxDuration)

			if var_408_84 <= arg_405_1.time_ and arg_405_1.time_ < var_408_84 + var_408_85 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_84) / var_408_85

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_84 + var_408_85 and arg_405_1.time_ < var_408_84 + var_408_85 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play318031102 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 318031102
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play318031103(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 1.125

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, false)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_2 = arg_411_1:GetWordFromCfg(318031102)
				local var_414_3 = arg_411_1:FormatText(var_414_2.content)

				arg_411_1.text_.text = var_414_3

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_4 = 45
				local var_414_5 = utf8.len(var_414_3)
				local var_414_6 = var_414_4 <= 0 and var_414_1 or var_414_1 * (var_414_5 / var_414_4)

				if var_414_6 > 0 and var_414_1 < var_414_6 then
					arg_411_1.talkMaxDuration = var_414_6

					if var_414_6 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_6 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_3
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_7 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_7 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_7

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_7 and arg_411_1.time_ < var_414_0 + var_414_7 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play318031103 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 318031103
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play318031104(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = 0
			local var_418_1 = 1.375

			if var_418_0 < arg_415_1.time_ and arg_415_1.time_ <= var_418_0 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_2 = arg_415_1:GetWordFromCfg(318031103)
				local var_418_3 = arg_415_1:FormatText(var_418_2.content)

				arg_415_1.text_.text = var_418_3

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_4 = 55
				local var_418_5 = utf8.len(var_418_3)
				local var_418_6 = var_418_4 <= 0 and var_418_1 or var_418_1 * (var_418_5 / var_418_4)

				if var_418_6 > 0 and var_418_1 < var_418_6 then
					arg_415_1.talkMaxDuration = var_418_6

					if var_418_6 + var_418_0 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_6 + var_418_0
					end
				end

				arg_415_1.text_.text = var_418_3
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_7 = math.max(var_418_1, arg_415_1.talkMaxDuration)

			if var_418_0 <= arg_415_1.time_ and arg_415_1.time_ < var_418_0 + var_418_7 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_0) / var_418_7

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_0 + var_418_7 and arg_415_1.time_ < var_418_0 + var_418_7 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play318031104 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 318031104
		arg_419_1.duration_ = 5

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play318031105(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0
			local var_422_1 = 0.275

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_2 = arg_419_1:FormatText(StoryNameCfg[7].name)

				arg_419_1.leftNameTxt_.text = var_422_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_3 = arg_419_1:GetWordFromCfg(318031104)
				local var_422_4 = arg_419_1:FormatText(var_422_3.content)

				arg_419_1.text_.text = var_422_4

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_5 = 11
				local var_422_6 = utf8.len(var_422_4)
				local var_422_7 = var_422_5 <= 0 and var_422_1 or var_422_1 * (var_422_6 / var_422_5)

				if var_422_7 > 0 and var_422_1 < var_422_7 then
					arg_419_1.talkMaxDuration = var_422_7

					if var_422_7 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_7 + var_422_0
					end
				end

				arg_419_1.text_.text = var_422_4
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_8 = math.max(var_422_1, arg_419_1.talkMaxDuration)

			if var_422_0 <= arg_419_1.time_ and arg_419_1.time_ < var_422_0 + var_422_8 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_0) / var_422_8

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_0 + var_422_8 and arg_419_1.time_ < var_422_0 + var_422_8 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play318031105 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 318031105
		arg_423_1.duration_ = 3.8

		local var_423_0 = {
			zh = 3.8,
			ja = 2.566
		}
		local var_423_1 = manager.audio:GetLocalizationFlag()

		if var_423_0[var_423_1] ~= nil then
			arg_423_1.duration_ = var_423_0[var_423_1]
		end

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play318031106(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 0.45

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_2 = arg_423_1:FormatText(StoryNameCfg[562].name)

				arg_423_1.leftNameTxt_.text = var_426_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, true)
				arg_423_1.iconController_:SetSelectedState("hero")

				arg_423_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_3 = arg_423_1:GetWordFromCfg(318031105)
				local var_426_4 = arg_423_1:FormatText(var_426_3.content)

				arg_423_1.text_.text = var_426_4

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_5 = 18
				local var_426_6 = utf8.len(var_426_4)
				local var_426_7 = var_426_5 <= 0 and var_426_1 or var_426_1 * (var_426_6 / var_426_5)

				if var_426_7 > 0 and var_426_1 < var_426_7 then
					arg_423_1.talkMaxDuration = var_426_7

					if var_426_7 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_7 + var_426_0
					end
				end

				arg_423_1.text_.text = var_426_4
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031105", "story_v_out_318031.awb") ~= 0 then
					local var_426_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031105", "story_v_out_318031.awb") / 1000

					if var_426_8 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_8 + var_426_0
					end

					if var_426_3.prefab_name ~= "" and arg_423_1.actors_[var_426_3.prefab_name] ~= nil then
						local var_426_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_3.prefab_name].transform, "story_v_out_318031", "318031105", "story_v_out_318031.awb")

						arg_423_1:RecordAudio("318031105", var_426_9)
						arg_423_1:RecordAudio("318031105", var_426_9)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_318031", "318031105", "story_v_out_318031.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_318031", "318031105", "story_v_out_318031.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_10 = math.max(var_426_1, arg_423_1.talkMaxDuration)

			if var_426_0 <= arg_423_1.time_ and arg_423_1.time_ < var_426_0 + var_426_10 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_0) / var_426_10

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_0 + var_426_10 and arg_423_1.time_ < var_426_0 + var_426_10 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play318031106 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 318031106
		arg_427_1.duration_ = 7.8

		local var_427_0 = {
			zh = 5.6,
			ja = 7.8
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
				arg_427_0:Play318031107(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 0.55

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_2 = arg_427_1:FormatText(StoryNameCfg[562].name)

				arg_427_1.leftNameTxt_.text = var_430_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, true)
				arg_427_1.iconController_:SetSelectedState("hero")

				arg_427_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_3 = arg_427_1:GetWordFromCfg(318031106)
				local var_430_4 = arg_427_1:FormatText(var_430_3.content)

				arg_427_1.text_.text = var_430_4

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_5 = 22
				local var_430_6 = utf8.len(var_430_4)
				local var_430_7 = var_430_5 <= 0 and var_430_1 or var_430_1 * (var_430_6 / var_430_5)

				if var_430_7 > 0 and var_430_1 < var_430_7 then
					arg_427_1.talkMaxDuration = var_430_7

					if var_430_7 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_7 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_4
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031106", "story_v_out_318031.awb") ~= 0 then
					local var_430_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031106", "story_v_out_318031.awb") / 1000

					if var_430_8 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_8 + var_430_0
					end

					if var_430_3.prefab_name ~= "" and arg_427_1.actors_[var_430_3.prefab_name] ~= nil then
						local var_430_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_3.prefab_name].transform, "story_v_out_318031", "318031106", "story_v_out_318031.awb")

						arg_427_1:RecordAudio("318031106", var_430_9)
						arg_427_1:RecordAudio("318031106", var_430_9)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_318031", "318031106", "story_v_out_318031.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_318031", "318031106", "story_v_out_318031.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_10 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_10 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_10

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_10 and arg_427_1.time_ < var_430_0 + var_430_10 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play318031107 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 318031107
		arg_431_1.duration_ = 4.8

		local var_431_0 = {
			zh = 4.8,
			ja = 4.2
		}
		local var_431_1 = manager.audio:GetLocalizationFlag()

		if var_431_0[var_431_1] ~= nil then
			arg_431_1.duration_ = var_431_0[var_431_1]
		end

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play318031108(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 0
			local var_434_1 = 0.5

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_2 = arg_431_1:FormatText(StoryNameCfg[84].name)

				arg_431_1.leftNameTxt_.text = var_434_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, true)
				arg_431_1.iconController_:SetSelectedState("hero")

				arg_431_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1199")

				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_3 = arg_431_1:GetWordFromCfg(318031107)
				local var_434_4 = arg_431_1:FormatText(var_434_3.content)

				arg_431_1.text_.text = var_434_4

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_5 = 20
				local var_434_6 = utf8.len(var_434_4)
				local var_434_7 = var_434_5 <= 0 and var_434_1 or var_434_1 * (var_434_6 / var_434_5)

				if var_434_7 > 0 and var_434_1 < var_434_7 then
					arg_431_1.talkMaxDuration = var_434_7

					if var_434_7 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_7 + var_434_0
					end
				end

				arg_431_1.text_.text = var_434_4
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031107", "story_v_out_318031.awb") ~= 0 then
					local var_434_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031107", "story_v_out_318031.awb") / 1000

					if var_434_8 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_8 + var_434_0
					end

					if var_434_3.prefab_name ~= "" and arg_431_1.actors_[var_434_3.prefab_name] ~= nil then
						local var_434_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_3.prefab_name].transform, "story_v_out_318031", "318031107", "story_v_out_318031.awb")

						arg_431_1:RecordAudio("318031107", var_434_9)
						arg_431_1:RecordAudio("318031107", var_434_9)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_318031", "318031107", "story_v_out_318031.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_318031", "318031107", "story_v_out_318031.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_10 = math.max(var_434_1, arg_431_1.talkMaxDuration)

			if var_434_0 <= arg_431_1.time_ and arg_431_1.time_ < var_434_0 + var_434_10 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_0) / var_434_10

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_0 + var_434_10 and arg_431_1.time_ < var_434_0 + var_434_10 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play318031108 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 318031108
		arg_435_1.duration_ = 8.4

		local var_435_0 = {
			zh = 6.933,
			ja = 8.4
		}
		local var_435_1 = manager.audio:GetLocalizationFlag()

		if var_435_0[var_435_1] ~= nil then
			arg_435_1.duration_ = var_435_0[var_435_1]
		end

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play318031109(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.875

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_2 = arg_435_1:FormatText(StoryNameCfg[84].name)

				arg_435_1.leftNameTxt_.text = var_438_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, true)
				arg_435_1.iconController_:SetSelectedState("hero")

				arg_435_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1199")

				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(318031108)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031108", "story_v_out_318031.awb") ~= 0 then
					local var_438_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031108", "story_v_out_318031.awb") / 1000

					if var_438_8 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_8 + var_438_0
					end

					if var_438_3.prefab_name ~= "" and arg_435_1.actors_[var_438_3.prefab_name] ~= nil then
						local var_438_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_3.prefab_name].transform, "story_v_out_318031", "318031108", "story_v_out_318031.awb")

						arg_435_1:RecordAudio("318031108", var_438_9)
						arg_435_1:RecordAudio("318031108", var_438_9)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_318031", "318031108", "story_v_out_318031.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_318031", "318031108", "story_v_out_318031.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_10 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_10 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_10

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_10 and arg_435_1.time_ < var_438_0 + var_438_10 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play318031109 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 318031109
		arg_439_1.duration_ = 5

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play318031110(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 0.875

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

				local var_442_3 = arg_439_1:GetWordFromCfg(318031109)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 35
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
	Play318031110 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 318031110
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play318031111(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0
			local var_446_1 = 0.75

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_2 = arg_443_1:FormatText(StoryNameCfg[7].name)

				arg_443_1.leftNameTxt_.text = var_446_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_3 = arg_443_1:GetWordFromCfg(318031110)
				local var_446_4 = arg_443_1:FormatText(var_446_3.content)

				arg_443_1.text_.text = var_446_4

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_5 = 30
				local var_446_6 = utf8.len(var_446_4)
				local var_446_7 = var_446_5 <= 0 and var_446_1 or var_446_1 * (var_446_6 / var_446_5)

				if var_446_7 > 0 and var_446_1 < var_446_7 then
					arg_443_1.talkMaxDuration = var_446_7

					if var_446_7 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_7 + var_446_0
					end
				end

				arg_443_1.text_.text = var_446_4
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_8 = math.max(var_446_1, arg_443_1.talkMaxDuration)

			if var_446_0 <= arg_443_1.time_ and arg_443_1.time_ < var_446_0 + var_446_8 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_0) / var_446_8

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_0 + var_446_8 and arg_443_1.time_ < var_446_0 + var_446_8 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play318031111 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 318031111
		arg_447_1.duration_ = 2.633

		local var_447_0 = {
			zh = 2.233,
			ja = 2.633
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
				arg_447_0:Play318031112(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.375

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[84].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, true)
				arg_447_1.iconController_:SetSelectedState("hero")

				arg_447_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1199")

				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(318031111)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031111", "story_v_out_318031.awb") ~= 0 then
					local var_450_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031111", "story_v_out_318031.awb") / 1000

					if var_450_8 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_8 + var_450_0
					end

					if var_450_3.prefab_name ~= "" and arg_447_1.actors_[var_450_3.prefab_name] ~= nil then
						local var_450_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_3.prefab_name].transform, "story_v_out_318031", "318031111", "story_v_out_318031.awb")

						arg_447_1:RecordAudio("318031111", var_450_9)
						arg_447_1:RecordAudio("318031111", var_450_9)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_318031", "318031111", "story_v_out_318031.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_318031", "318031111", "story_v_out_318031.awb")
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
	Play318031112 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 318031112
		arg_451_1.duration_ = 5.366

		local var_451_0 = {
			zh = 2.2,
			ja = 5.366
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
				arg_451_0:Play318031113(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 0.275

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_2 = arg_451_1:FormatText(StoryNameCfg[479].name)

				arg_451_1.leftNameTxt_.text = var_454_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, true)
				arg_451_1.iconController_:SetSelectedState("hero")

				arg_451_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1015")

				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_3 = arg_451_1:GetWordFromCfg(318031112)
				local var_454_4 = arg_451_1:FormatText(var_454_3.content)

				arg_451_1.text_.text = var_454_4

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_5 = 11
				local var_454_6 = utf8.len(var_454_4)
				local var_454_7 = var_454_5 <= 0 and var_454_1 or var_454_1 * (var_454_6 / var_454_5)

				if var_454_7 > 0 and var_454_1 < var_454_7 then
					arg_451_1.talkMaxDuration = var_454_7

					if var_454_7 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_7 + var_454_0
					end
				end

				arg_451_1.text_.text = var_454_4
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031112", "story_v_out_318031.awb") ~= 0 then
					local var_454_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031112", "story_v_out_318031.awb") / 1000

					if var_454_8 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_8 + var_454_0
					end

					if var_454_3.prefab_name ~= "" and arg_451_1.actors_[var_454_3.prefab_name] ~= nil then
						local var_454_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_3.prefab_name].transform, "story_v_out_318031", "318031112", "story_v_out_318031.awb")

						arg_451_1:RecordAudio("318031112", var_454_9)
						arg_451_1:RecordAudio("318031112", var_454_9)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_318031", "318031112", "story_v_out_318031.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_318031", "318031112", "story_v_out_318031.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_10 = math.max(var_454_1, arg_451_1.talkMaxDuration)

			if var_454_0 <= arg_451_1.time_ and arg_451_1.time_ < var_454_0 + var_454_10 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_0) / var_454_10

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_0 + var_454_10 and arg_451_1.time_ < var_454_0 + var_454_10 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play318031113 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 318031113
		arg_455_1.duration_ = 9

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play318031114(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 2

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				local var_458_1 = manager.ui.mainCamera.transform.localPosition
				local var_458_2 = Vector3.New(0, 0, 10) + Vector3.New(var_458_1.x, var_458_1.y, 0)
				local var_458_3 = arg_455_1.bgs_.K13f

				var_458_3.transform.localPosition = var_458_2
				var_458_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_458_4 = var_458_3:GetComponent("SpriteRenderer")

				if var_458_4 and var_458_4.sprite then
					local var_458_5 = (var_458_3.transform.localPosition - var_458_1).z
					local var_458_6 = manager.ui.mainCameraCom_
					local var_458_7 = 2 * var_458_5 * Mathf.Tan(var_458_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_458_8 = var_458_7 * var_458_6.aspect
					local var_458_9 = var_458_4.sprite.bounds.size.x
					local var_458_10 = var_458_4.sprite.bounds.size.y
					local var_458_11 = var_458_8 / var_458_9
					local var_458_12 = var_458_7 / var_458_10
					local var_458_13 = var_458_12 < var_458_11 and var_458_11 or var_458_12

					var_458_3.transform.localScale = Vector3.New(var_458_13, var_458_13, 0)
				end

				for iter_458_0, iter_458_1 in pairs(arg_455_1.bgs_) do
					if iter_458_0 ~= "K13f" then
						iter_458_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_458_14 = 0

			if var_458_14 < arg_455_1.time_ and arg_455_1.time_ <= var_458_14 + arg_458_0 then
				arg_455_1.mask_.enabled = true
				arg_455_1.mask_.raycastTarget = true

				arg_455_1:SetGaussion(false)
			end

			local var_458_15 = 2

			if var_458_14 <= arg_455_1.time_ and arg_455_1.time_ < var_458_14 + var_458_15 then
				local var_458_16 = (arg_455_1.time_ - var_458_14) / var_458_15
				local var_458_17 = Color.New(0, 0, 0)

				var_458_17.a = Mathf.Lerp(0, 1, var_458_16)
				arg_455_1.mask_.color = var_458_17
			end

			if arg_455_1.time_ >= var_458_14 + var_458_15 and arg_455_1.time_ < var_458_14 + var_458_15 + arg_458_0 then
				local var_458_18 = Color.New(0, 0, 0)

				var_458_18.a = 1
				arg_455_1.mask_.color = var_458_18
			end

			local var_458_19 = 2

			if var_458_19 < arg_455_1.time_ and arg_455_1.time_ <= var_458_19 + arg_458_0 then
				arg_455_1.mask_.enabled = true
				arg_455_1.mask_.raycastTarget = true

				arg_455_1:SetGaussion(false)
			end

			local var_458_20 = 2

			if var_458_19 <= arg_455_1.time_ and arg_455_1.time_ < var_458_19 + var_458_20 then
				local var_458_21 = (arg_455_1.time_ - var_458_19) / var_458_20
				local var_458_22 = Color.New(0, 0, 0)

				var_458_22.a = Mathf.Lerp(1, 0, var_458_21)
				arg_455_1.mask_.color = var_458_22
			end

			if arg_455_1.time_ >= var_458_19 + var_458_20 and arg_455_1.time_ < var_458_19 + var_458_20 + arg_458_0 then
				local var_458_23 = Color.New(0, 0, 0)
				local var_458_24 = 0

				arg_455_1.mask_.enabled = false
				var_458_23.a = var_458_24
				arg_455_1.mask_.color = var_458_23
			end

			local var_458_25 = 4
			local var_458_26 = 0.433333333333333

			if var_458_25 < arg_455_1.time_ and arg_455_1.time_ <= var_458_25 + arg_458_0 then
				local var_458_27 = "play"
				local var_458_28 = "effect"

				arg_455_1:AudioAction(var_458_27, var_458_28, "se_story_10", "se_story_10_sword", "")
			end

			local var_458_29 = manager.ui.mainCamera.transform
			local var_458_30 = 1.88333333333333

			if var_458_30 < arg_455_1.time_ and arg_455_1.time_ <= var_458_30 + arg_458_0 then
				local var_458_31 = arg_455_1.var_.effect丽天宫上空1

				if var_458_31 then
					Object.Destroy(var_458_31)

					arg_455_1.var_.effect丽天宫上空1 = nil
				end
			end

			if arg_455_1.frameCnt_ <= 1 then
				arg_455_1.dialog_:SetActive(false)
			end

			local var_458_32 = 4
			local var_458_33 = 0.575

			if var_458_32 < arg_455_1.time_ and arg_455_1.time_ <= var_458_32 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0

				arg_455_1.dialog_:SetActive(true)

				local var_458_34 = LeanTween.value(arg_455_1.dialog_, 0, 1, 0.3)

				var_458_34:setOnUpdate(LuaHelper.FloatAction(function(arg_459_0)
					arg_455_1.dialogCg_.alpha = arg_459_0
				end))
				var_458_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_455_1.dialog_)
					var_458_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_455_1.duration_ = arg_455_1.duration_ + 0.3

				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_35 = arg_455_1:GetWordFromCfg(318031113)
				local var_458_36 = arg_455_1:FormatText(var_458_35.content)

				arg_455_1.text_.text = var_458_36

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_37 = 23
				local var_458_38 = utf8.len(var_458_36)
				local var_458_39 = var_458_37 <= 0 and var_458_33 or var_458_33 * (var_458_38 / var_458_37)

				if var_458_39 > 0 and var_458_33 < var_458_39 then
					arg_455_1.talkMaxDuration = var_458_39
					var_458_32 = var_458_32 + 0.3

					if var_458_39 + var_458_32 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_39 + var_458_32
					end
				end

				arg_455_1.text_.text = var_458_36
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_40 = var_458_32 + 0.3
			local var_458_41 = math.max(var_458_33, arg_455_1.talkMaxDuration)

			if var_458_40 <= arg_455_1.time_ and arg_455_1.time_ < var_458_40 + var_458_41 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_40) / var_458_41

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_40 + var_458_41 and arg_455_1.time_ < var_458_40 + var_458_41 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play318031114 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 318031114
		arg_461_1.duration_ = 3.066

		local var_461_0 = {
			zh = 2.333,
			ja = 3.066
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
				arg_461_0:Play318031115(arg_461_1)
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

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[639].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, true)
				arg_461_1.iconController_:SetSelectedState("hero")

				arg_461_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2113")

				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(318031114)
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

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031114", "story_v_out_318031.awb") ~= 0 then
					local var_464_8 = manager.audio:GetVoiceLength("story_v_out_318031", "318031114", "story_v_out_318031.awb") / 1000

					if var_464_8 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_8 + var_464_0
					end

					if var_464_3.prefab_name ~= "" and arg_461_1.actors_[var_464_3.prefab_name] ~= nil then
						local var_464_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_3.prefab_name].transform, "story_v_out_318031", "318031114", "story_v_out_318031.awb")

						arg_461_1:RecordAudio("318031114", var_464_9)
						arg_461_1:RecordAudio("318031114", var_464_9)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_318031", "318031114", "story_v_out_318031.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_318031", "318031114", "story_v_out_318031.awb")
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
	Play318031115 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 318031115
		arg_465_1.duration_ = 10.366

		local var_465_0 = {
			zh = 5.4,
			ja = 10.366
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
			arg_465_1.auto_ = false
		end

		function arg_465_1.playNext_(arg_467_0)
			arg_465_1.onStoryFinished_()
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1015ui_story"].transform
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 then
				arg_465_1.var_.moveOldPos1015ui_story = var_468_0.localPosition
			end

			local var_468_2 = 0.001

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2
				local var_468_4 = Vector3.New(0, -1.15, -6.2)

				var_468_0.localPosition = Vector3.Lerp(arg_465_1.var_.moveOldPos1015ui_story, var_468_4, var_468_3)

				local var_468_5 = manager.ui.mainCamera.transform.position - var_468_0.position

				var_468_0.forward = Vector3.New(var_468_5.x, var_468_5.y, var_468_5.z)

				local var_468_6 = var_468_0.localEulerAngles

				var_468_6.z = 0
				var_468_6.x = 0
				var_468_0.localEulerAngles = var_468_6
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 then
				var_468_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_468_7 = manager.ui.mainCamera.transform.position - var_468_0.position

				var_468_0.forward = Vector3.New(var_468_7.x, var_468_7.y, var_468_7.z)

				local var_468_8 = var_468_0.localEulerAngles

				var_468_8.z = 0
				var_468_8.x = 0
				var_468_0.localEulerAngles = var_468_8
			end

			local var_468_9 = arg_465_1.actors_["1015ui_story"]
			local var_468_10 = 0

			if var_468_10 < arg_465_1.time_ and arg_465_1.time_ <= var_468_10 + arg_468_0 and arg_465_1.var_.characterEffect1015ui_story == nil then
				arg_465_1.var_.characterEffect1015ui_story = var_468_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_11 = 0.200000002980232

			if var_468_10 <= arg_465_1.time_ and arg_465_1.time_ < var_468_10 + var_468_11 then
				local var_468_12 = (arg_465_1.time_ - var_468_10) / var_468_11

				if arg_465_1.var_.characterEffect1015ui_story then
					arg_465_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_10 + var_468_11 and arg_465_1.time_ < var_468_10 + var_468_11 + arg_468_0 and arg_465_1.var_.characterEffect1015ui_story then
				arg_465_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_468_13 = 0

			if var_468_13 < arg_465_1.time_ and arg_465_1.time_ <= var_468_13 + arg_468_0 then
				arg_465_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_468_14 = 0

			if var_468_14 < arg_465_1.time_ and arg_465_1.time_ <= var_468_14 + arg_468_0 then
				arg_465_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_468_15 = 0
			local var_468_16 = 0.775

			if var_468_15 < arg_465_1.time_ and arg_465_1.time_ <= var_468_15 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_17 = arg_465_1:FormatText(StoryNameCfg[479].name)

				arg_465_1.leftNameTxt_.text = var_468_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_18 = arg_465_1:GetWordFromCfg(318031115)
				local var_468_19 = arg_465_1:FormatText(var_468_18.content)

				arg_465_1.text_.text = var_468_19

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_20 = 31
				local var_468_21 = utf8.len(var_468_19)
				local var_468_22 = var_468_20 <= 0 and var_468_16 or var_468_16 * (var_468_21 / var_468_20)

				if var_468_22 > 0 and var_468_16 < var_468_22 then
					arg_465_1.talkMaxDuration = var_468_22

					if var_468_22 + var_468_15 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_22 + var_468_15
					end
				end

				arg_465_1.text_.text = var_468_19
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318031", "318031115", "story_v_out_318031.awb") ~= 0 then
					local var_468_23 = manager.audio:GetVoiceLength("story_v_out_318031", "318031115", "story_v_out_318031.awb") / 1000

					if var_468_23 + var_468_15 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_23 + var_468_15
					end

					if var_468_18.prefab_name ~= "" and arg_465_1.actors_[var_468_18.prefab_name] ~= nil then
						local var_468_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_18.prefab_name].transform, "story_v_out_318031", "318031115", "story_v_out_318031.awb")

						arg_465_1:RecordAudio("318031115", var_468_24)
						arg_465_1:RecordAudio("318031115", var_468_24)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_318031", "318031115", "story_v_out_318031.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_318031", "318031115", "story_v_out_318031.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_25 = math.max(var_468_16, arg_465_1.talkMaxDuration)

			if var_468_15 <= arg_465_1.time_ and arg_465_1.time_ < var_468_15 + var_468_25 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_15) / var_468_25

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_15 + var_468_25 and arg_465_1.time_ < var_468_15 + var_468_25 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play318031057 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 318031057
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play318031058(arg_469_1)
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

				local var_472_2 = arg_469_1:FormatText(StoryNameCfg[7].name)

				arg_469_1.leftNameTxt_.text = var_472_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_3 = arg_469_1:GetWordFromCfg(318031057)
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
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_8 = math.max(var_472_1, arg_469_1.talkMaxDuration)

			if var_472_0 <= arg_469_1.time_ and arg_469_1.time_ < var_472_0 + var_472_8 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_0) / var_472_8

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_0 + var_472_8 and arg_469_1.time_ < var_472_0 + var_472_8 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K01f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K13f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LX0101"
	},
	voices = {
		"story_v_out_318031.awb"
	}
}
