return {
	Play111222001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 111222001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play111222002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "A07a"

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
				local var_4_5 = arg_1_1.bgs_.A07a

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
					if iter_4_0 ~= "A07a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.A07a
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueA07a = var_4_20.a
					arg_1_1.var_.alphaMatValueA07a = var_4_19
				end

				arg_1_1.var_.alphaOldValueA07a = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueA07a, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueA07a then
					local var_4_24 = arg_1_1.var_.alphaMatValueA07a
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueA07a then
				local var_4_26 = arg_1_1.var_.alphaMatValueA07a
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = manager.ui.mainCamera.transform
			local var_4_29 = 1.2

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_28.localPosition
			end

			local var_4_30 = 0.6

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / 0.066
				local var_4_32, var_4_33 = math.modf(var_4_31)

				var_4_28.localPosition = Vector3.New(var_4_33 * 0.13, var_4_33 * 0.13, var_4_33 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_34 = 0

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_35 = 2

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_36 = 2
			local var_4_37 = 1

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "music"

				arg_1_1:AudioAction(var_4_38, var_4_39, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_40 = 2
			local var_4_41 = 0.9

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_42 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_42:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_43 = arg_1_1:GetWordFromCfg(111222001)
				local var_4_44 = arg_1_1:FormatText(var_4_43.content)

				arg_1_1.text_.text = var_4_44

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_45 = 36
				local var_4_46 = utf8.len(var_4_44)
				local var_4_47 = var_4_45 <= 0 and var_4_41 or var_4_41 * (var_4_46 / var_4_45)

				if var_4_47 > 0 and var_4_41 < var_4_47 then
					arg_1_1.talkMaxDuration = var_4_47
					var_4_40 = var_4_40 + 0.3

					if var_4_47 + var_4_40 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_47 + var_4_40
					end
				end

				arg_1_1.text_.text = var_4_44
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_48 = var_4_40 + 0.3
			local var_4_49 = math.max(var_4_41, arg_1_1.talkMaxDuration)

			if var_4_48 <= arg_1_1.time_ and arg_1_1.time_ < var_4_48 + var_4_49 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_48) / var_4_49

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_48 + var_4_49 and arg_1_1.time_ < var_4_48 + var_4_49 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play111222002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 111222002
		arg_7_1.duration_ = 4.1

		local var_7_0 = {
			ja = 3.9,
			ko = 4.1,
			zh = 3.366,
			en = 3.666
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
				arg_7_0:Play111222003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1096ui_story"

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

			local var_10_4 = arg_7_1.actors_["1096ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1096ui_story == nil then
				arg_7_1.var_.characterEffect1096ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.2

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1096ui_story then
					arg_7_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1096ui_story then
				arg_7_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_10_8 = 0

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 then
				arg_7_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action1_1")
			end

			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_10_10 = arg_7_1.actors_["1096ui_story"].transform
			local var_10_11 = 0

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 then
				arg_7_1.var_.moveOldPos1096ui_story = var_10_10.localPosition
			end

			local var_10_12 = 0.001

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_11) / var_10_12
				local var_10_14 = Vector3.New(0, -1.13, -5.6)

				var_10_10.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1096ui_story, var_10_14, var_10_13)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_10.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_10.localEulerAngles = var_10_16
			end

			if arg_7_1.time_ >= var_10_11 + var_10_12 and arg_7_1.time_ < var_10_11 + var_10_12 + arg_10_0 then
				var_10_10.localPosition = Vector3.New(0, -1.13, -5.6)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_10.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_10.localEulerAngles = var_10_18
			end

			local var_10_19 = 0
			local var_10_20 = 0.425

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[169].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(111222002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222002", "story_v_out_111222.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_111222", "111222002", "story_v_out_111222.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_111222", "111222002", "story_v_out_111222.awb")

						arg_7_1:RecordAudio("111222002", var_10_28)
						arg_7_1:RecordAudio("111222002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_111222", "111222002", "story_v_out_111222.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_111222", "111222002", "story_v_out_111222.awb")
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
	Play111222003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 111222003
		arg_11_1.duration_ = 9.4

		local var_11_0 = {
			ja = 4.6,
			ko = 9.4,
			zh = 6.966,
			en = 6.4
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
				arg_11_0:Play111222004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1096ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1096ui_story == nil then
				arg_11_1.var_.characterEffect1096ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1096ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1096ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1096ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1096ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 1.05

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[32].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(111222003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222003", "story_v_out_111222.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222003", "story_v_out_111222.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_111222", "111222003", "story_v_out_111222.awb")

						arg_11_1:RecordAudio("111222003", var_14_15)
						arg_11_1:RecordAudio("111222003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_111222", "111222003", "story_v_out_111222.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_111222", "111222003", "story_v_out_111222.awb")
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
	Play111222004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 111222004
		arg_15_1.duration_ = 11

		local var_15_0 = {
			ja = 8.133,
			ko = 11,
			zh = 8.3,
			en = 8.066
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
				arg_15_0:Play111222005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.125

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[32].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(111222004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 45
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222004", "story_v_out_111222.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_111222", "111222004", "story_v_out_111222.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_111222", "111222004", "story_v_out_111222.awb")

						arg_15_1:RecordAudio("111222004", var_18_9)
						arg_15_1:RecordAudio("111222004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_111222", "111222004", "story_v_out_111222.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_111222", "111222004", "story_v_out_111222.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_10 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_10 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_10

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_10 and arg_15_1.time_ < var_18_0 + var_18_10 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play111222005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 111222005
		arg_19_1.duration_ = 5.166

		local var_19_0 = {
			ja = 4.833,
			ko = 5.166,
			zh = 4.333,
			en = 3.566
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
				arg_19_0:Play111222006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1096ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1096ui_story == nil then
				arg_19_1.var_.characterEffect1096ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1096ui_story then
					arg_19_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1096ui_story then
				arg_19_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action4_1")
			end

			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_22_6 = 0
			local var_22_7 = 0.65

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[32].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(111222005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222005", "story_v_out_111222.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222005", "story_v_out_111222.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_111222", "111222005", "story_v_out_111222.awb")

						arg_19_1:RecordAudio("111222005", var_22_15)
						arg_19_1:RecordAudio("111222005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_111222", "111222005", "story_v_out_111222.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_111222", "111222005", "story_v_out_111222.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play111222006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 111222006
		arg_23_1.duration_ = 2.7

		local var_23_0 = {
			ja = 2.2,
			ko = 2.333,
			zh = 1.999999999999,
			en = 2.7
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
				arg_23_0:Play111222007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_26_1 = 0
			local var_26_2 = 0.275

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_3 = arg_23_1:FormatText(StoryNameCfg[169].name)

				arg_23_1.leftNameTxt_.text = var_26_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_4 = arg_23_1:GetWordFromCfg(111222006)
				local var_26_5 = arg_23_1:FormatText(var_26_4.content)

				arg_23_1.text_.text = var_26_5

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_6 = 11
				local var_26_7 = utf8.len(var_26_5)
				local var_26_8 = var_26_6 <= 0 and var_26_2 or var_26_2 * (var_26_7 / var_26_6)

				if var_26_8 > 0 and var_26_2 < var_26_8 then
					arg_23_1.talkMaxDuration = var_26_8

					if var_26_8 + var_26_1 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_1
					end
				end

				arg_23_1.text_.text = var_26_5
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222006", "story_v_out_111222.awb") ~= 0 then
					local var_26_9 = manager.audio:GetVoiceLength("story_v_out_111222", "111222006", "story_v_out_111222.awb") / 1000

					if var_26_9 + var_26_1 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_9 + var_26_1
					end

					if var_26_4.prefab_name ~= "" and arg_23_1.actors_[var_26_4.prefab_name] ~= nil then
						local var_26_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_4.prefab_name].transform, "story_v_out_111222", "111222006", "story_v_out_111222.awb")

						arg_23_1:RecordAudio("111222006", var_26_10)
						arg_23_1:RecordAudio("111222006", var_26_10)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_111222", "111222006", "story_v_out_111222.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_111222", "111222006", "story_v_out_111222.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_11 = math.max(var_26_2, arg_23_1.talkMaxDuration)

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_11 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_1) / var_26_11

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_1 + var_26_11 and arg_23_1.time_ < var_26_1 + var_26_11 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play111222007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 111222007
		arg_27_1.duration_ = 5.733

		local var_27_0 = {
			ja = 3.4,
			ko = 5.733,
			zh = 4.4,
			en = 4.533
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
				arg_27_0:Play111222008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1096ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1096ui_story == nil then
				arg_27_1.var_.characterEffect1096ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1096ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1096ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1096ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1096ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.6

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[32].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(111222007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222007", "story_v_out_111222.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222007", "story_v_out_111222.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_111222", "111222007", "story_v_out_111222.awb")

						arg_27_1:RecordAudio("111222007", var_30_15)
						arg_27_1:RecordAudio("111222007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_111222", "111222007", "story_v_out_111222.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_111222", "111222007", "story_v_out_111222.awb")
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
	Play111222008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 111222008
		arg_31_1.duration_ = 10.333

		local var_31_0 = {
			ja = 10.333,
			ko = 9.866,
			zh = 8.7,
			en = 8.533
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
				arg_31_0:Play111222009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.25

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[32].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(111222008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 50
				local var_34_6 = utf8.len(var_34_4)
				local var_34_7 = var_34_5 <= 0 and var_34_1 or var_34_1 * (var_34_6 / var_34_5)

				if var_34_7 > 0 and var_34_1 < var_34_7 then
					arg_31_1.talkMaxDuration = var_34_7

					if var_34_7 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_7 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_4
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222008", "story_v_out_111222.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_111222", "111222008", "story_v_out_111222.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_111222", "111222008", "story_v_out_111222.awb")

						arg_31_1:RecordAudio("111222008", var_34_9)
						arg_31_1:RecordAudio("111222008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_111222", "111222008", "story_v_out_111222.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_111222", "111222008", "story_v_out_111222.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play111222009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 111222009
		arg_35_1.duration_ = 12.4

		local var_35_0 = {
			ja = 12.4,
			ko = 11.266,
			zh = 9,
			en = 9.333
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
				arg_35_0:Play111222010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.2

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[32].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(111222009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 48
				local var_38_6 = utf8.len(var_38_4)
				local var_38_7 = var_38_5 <= 0 and var_38_1 or var_38_1 * (var_38_6 / var_38_5)

				if var_38_7 > 0 and var_38_1 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_4
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222009", "story_v_out_111222.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_111222", "111222009", "story_v_out_111222.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_111222", "111222009", "story_v_out_111222.awb")

						arg_35_1:RecordAudio("111222009", var_38_9)
						arg_35_1:RecordAudio("111222009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_111222", "111222009", "story_v_out_111222.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_111222", "111222009", "story_v_out_111222.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play111222010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 111222010
		arg_39_1.duration_ = 4.133

		local var_39_0 = {
			ja = 3.633,
			ko = 2.1,
			zh = 2.933,
			en = 4.133
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
				arg_39_0:Play111222011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1096ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1096ui_story == nil then
				arg_39_1.var_.characterEffect1096ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1096ui_story then
					arg_39_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1096ui_story then
				arg_39_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action446")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_42_6 = 0
			local var_42_7 = 1

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				local var_42_8 = "play"
				local var_42_9 = "music"

				arg_39_1:AudioAction(var_42_8, var_42_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_42_10 = 0
			local var_42_11 = 0.4

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_12 = arg_39_1:FormatText(StoryNameCfg[169].name)

				arg_39_1.leftNameTxt_.text = var_42_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_13 = arg_39_1:GetWordFromCfg(111222010)
				local var_42_14 = arg_39_1:FormatText(var_42_13.content)

				arg_39_1.text_.text = var_42_14

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_15 = 14
				local var_42_16 = utf8.len(var_42_14)
				local var_42_17 = var_42_15 <= 0 and var_42_11 or var_42_11 * (var_42_16 / var_42_15)

				if var_42_17 > 0 and var_42_11 < var_42_17 then
					arg_39_1.talkMaxDuration = var_42_17

					if var_42_17 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_17 + var_42_10
					end
				end

				arg_39_1.text_.text = var_42_14
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222010", "story_v_out_111222.awb") ~= 0 then
					local var_42_18 = manager.audio:GetVoiceLength("story_v_out_111222", "111222010", "story_v_out_111222.awb") / 1000

					if var_42_18 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_10
					end

					if var_42_13.prefab_name ~= "" and arg_39_1.actors_[var_42_13.prefab_name] ~= nil then
						local var_42_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_13.prefab_name].transform, "story_v_out_111222", "111222010", "story_v_out_111222.awb")

						arg_39_1:RecordAudio("111222010", var_42_19)
						arg_39_1:RecordAudio("111222010", var_42_19)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_111222", "111222010", "story_v_out_111222.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_111222", "111222010", "story_v_out_111222.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_20 = math.max(var_42_11, arg_39_1.talkMaxDuration)

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_20 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_10) / var_42_20

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_10 + var_42_20 and arg_39_1.time_ < var_42_10 + var_42_20 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play111222011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 111222011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play111222012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1096ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1096ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1096ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, 100, 0)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = 0
			local var_46_10 = 1.1

			if var_46_9 < arg_43_1.time_ and arg_43_1.time_ <= var_46_9 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_11 = arg_43_1:GetWordFromCfg(111222011)
				local var_46_12 = arg_43_1:FormatText(var_46_11.content)

				arg_43_1.text_.text = var_46_12

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_13 = 44
				local var_46_14 = utf8.len(var_46_12)
				local var_46_15 = var_46_13 <= 0 and var_46_10 or var_46_10 * (var_46_14 / var_46_13)

				if var_46_15 > 0 and var_46_10 < var_46_15 then
					arg_43_1.talkMaxDuration = var_46_15

					if var_46_15 + var_46_9 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_15 + var_46_9
					end
				end

				arg_43_1.text_.text = var_46_12
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_16 = math.max(var_46_10, arg_43_1.talkMaxDuration)

			if var_46_9 <= arg_43_1.time_ and arg_43_1.time_ < var_46_9 + var_46_16 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_9) / var_46_16

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_9 + var_46_16 and arg_43_1.time_ < var_46_9 + var_46_16 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play111222012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 111222012
		arg_47_1.duration_ = 3.933

		local var_47_0 = {
			ja = 3.9,
			ko = 3.766,
			zh = 3.8,
			en = 3.933
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
				arg_47_0:Play111222013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1096ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1096ui_story == nil then
				arg_47_1.var_.characterEffect1096ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1096ui_story then
					arg_47_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1096ui_story then
				arg_47_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_50_5 = arg_47_1.actors_["1096ui_story"].transform
			local var_50_6 = 0

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.var_.moveOldPos1096ui_story = var_50_5.localPosition
			end

			local var_50_7 = 0.001

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_7 then
				local var_50_8 = (arg_47_1.time_ - var_50_6) / var_50_7
				local var_50_9 = Vector3.New(0, -1.13, -5.6)

				var_50_5.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1096ui_story, var_50_9, var_50_8)

				local var_50_10 = manager.ui.mainCamera.transform.position - var_50_5.position

				var_50_5.forward = Vector3.New(var_50_10.x, var_50_10.y, var_50_10.z)

				local var_50_11 = var_50_5.localEulerAngles

				var_50_11.z = 0
				var_50_11.x = 0
				var_50_5.localEulerAngles = var_50_11
			end

			if arg_47_1.time_ >= var_50_6 + var_50_7 and arg_47_1.time_ < var_50_6 + var_50_7 + arg_50_0 then
				var_50_5.localPosition = Vector3.New(0, -1.13, -5.6)

				local var_50_12 = manager.ui.mainCamera.transform.position - var_50_5.position

				var_50_5.forward = Vector3.New(var_50_12.x, var_50_12.y, var_50_12.z)

				local var_50_13 = var_50_5.localEulerAngles

				var_50_13.z = 0
				var_50_13.x = 0
				var_50_5.localEulerAngles = var_50_13
			end

			local var_50_14 = 0
			local var_50_15 = 1

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				local var_50_16 = "play"
				local var_50_17 = "music"

				arg_47_1:AudioAction(var_50_16, var_50_17, "bgm_activity_1_1_1_hermes_story", "bgm_activity_1_1_1_hermes_story", "bgm_activity_1_1_1_hermes_story.awb")
			end

			local var_50_18 = 0
			local var_50_19 = 0.5

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_20 = arg_47_1:FormatText(StoryNameCfg[169].name)

				arg_47_1.leftNameTxt_.text = var_50_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_21 = arg_47_1:GetWordFromCfg(111222012)
				local var_50_22 = arg_47_1:FormatText(var_50_21.content)

				arg_47_1.text_.text = var_50_22

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_23 = 20
				local var_50_24 = utf8.len(var_50_22)
				local var_50_25 = var_50_23 <= 0 and var_50_19 or var_50_19 * (var_50_24 / var_50_23)

				if var_50_25 > 0 and var_50_19 < var_50_25 then
					arg_47_1.talkMaxDuration = var_50_25

					if var_50_25 + var_50_18 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_25 + var_50_18
					end
				end

				arg_47_1.text_.text = var_50_22
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222012", "story_v_out_111222.awb") ~= 0 then
					local var_50_26 = manager.audio:GetVoiceLength("story_v_out_111222", "111222012", "story_v_out_111222.awb") / 1000

					if var_50_26 + var_50_18 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_26 + var_50_18
					end

					if var_50_21.prefab_name ~= "" and arg_47_1.actors_[var_50_21.prefab_name] ~= nil then
						local var_50_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_21.prefab_name].transform, "story_v_out_111222", "111222012", "story_v_out_111222.awb")

						arg_47_1:RecordAudio("111222012", var_50_27)
						arg_47_1:RecordAudio("111222012", var_50_27)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_111222", "111222012", "story_v_out_111222.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_111222", "111222012", "story_v_out_111222.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_28 = math.max(var_50_19, arg_47_1.talkMaxDuration)

			if var_50_18 <= arg_47_1.time_ and arg_47_1.time_ < var_50_18 + var_50_28 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_18) / var_50_28

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_18 + var_50_28 and arg_47_1.time_ < var_50_18 + var_50_28 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play111222013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 111222013
		arg_51_1.duration_ = 11.2

		local var_51_0 = {
			ja = 8.566,
			ko = 11.2,
			zh = 6.4,
			en = 6.433
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
				arg_51_0:Play111222014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1096ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1096ui_story == nil then
				arg_51_1.var_.characterEffect1096ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1096ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1096ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1096ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1096ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.825

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[32].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(111222013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222013", "story_v_out_111222.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222013", "story_v_out_111222.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_111222", "111222013", "story_v_out_111222.awb")

						arg_51_1:RecordAudio("111222013", var_54_15)
						arg_51_1:RecordAudio("111222013", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_111222", "111222013", "story_v_out_111222.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_111222", "111222013", "story_v_out_111222.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_16 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_16 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_16

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_16 and arg_51_1.time_ < var_54_6 + var_54_16 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play111222014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 111222014
		arg_55_1.duration_ = 5.766

		local var_55_0 = {
			ja = 5.766,
			ko = 5.433,
			zh = 4.866,
			en = 4.633
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
				arg_55_0:Play111222015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action6_2")
			end

			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_58_2 = arg_55_1.actors_["1096ui_story"]
			local var_58_3 = 0

			if var_58_3 < arg_55_1.time_ and arg_55_1.time_ <= var_58_3 + arg_58_0 and arg_55_1.var_.characterEffect1096ui_story == nil then
				arg_55_1.var_.characterEffect1096ui_story = var_58_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_4 = 0.2

			if var_58_3 <= arg_55_1.time_ and arg_55_1.time_ < var_58_3 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_3) / var_58_4

				if arg_55_1.var_.characterEffect1096ui_story then
					arg_55_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_3 + var_58_4 and arg_55_1.time_ < var_58_3 + var_58_4 + arg_58_0 and arg_55_1.var_.characterEffect1096ui_story then
				arg_55_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_58_6 = 0
			local var_58_7 = 0.675

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[169].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(111222014)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 27
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222014", "story_v_out_111222.awb") ~= 0 then
					local var_58_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222014", "story_v_out_111222.awb") / 1000

					if var_58_14 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_6
					end

					if var_58_9.prefab_name ~= "" and arg_55_1.actors_[var_58_9.prefab_name] ~= nil then
						local var_58_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_9.prefab_name].transform, "story_v_out_111222", "111222014", "story_v_out_111222.awb")

						arg_55_1:RecordAudio("111222014", var_58_15)
						arg_55_1:RecordAudio("111222014", var_58_15)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_111222", "111222014", "story_v_out_111222.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_111222", "111222014", "story_v_out_111222.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_16 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_16 and arg_55_1.time_ < var_58_6 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play111222015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 111222015
		arg_59_1.duration_ = 2.033

		local var_59_0 = {
			ja = 1.933,
			ko = 2.033,
			zh = 2.033,
			en = 1.2
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
				arg_59_0:Play111222016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1096ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1096ui_story == nil then
				arg_59_1.var_.characterEffect1096ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1096ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1096ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1096ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1096ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.25

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[32].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(111222015)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222015", "story_v_out_111222.awb") ~= 0 then
					local var_62_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222015", "story_v_out_111222.awb") / 1000

					if var_62_14 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_14 + var_62_6
					end

					if var_62_9.prefab_name ~= "" and arg_59_1.actors_[var_62_9.prefab_name] ~= nil then
						local var_62_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_9.prefab_name].transform, "story_v_out_111222", "111222015", "story_v_out_111222.awb")

						arg_59_1:RecordAudio("111222015", var_62_15)
						arg_59_1:RecordAudio("111222015", var_62_15)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_111222", "111222015", "story_v_out_111222.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_111222", "111222015", "story_v_out_111222.awb")
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
	Play111222016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 111222016
		arg_63_1.duration_ = 6.7

		local var_63_0 = {
			ja = 6.7,
			ko = 2.333,
			zh = 2.366,
			en = 1.999999999999
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
				arg_63_0:Play111222017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_66_1 = arg_63_1.actors_["1096ui_story"]
			local var_66_2 = 0

			if var_66_2 < arg_63_1.time_ and arg_63_1.time_ <= var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1096ui_story == nil then
				arg_63_1.var_.characterEffect1096ui_story = var_66_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_3 = 0.2

			if var_66_2 <= arg_63_1.time_ and arg_63_1.time_ < var_66_2 + var_66_3 then
				local var_66_4 = (arg_63_1.time_ - var_66_2) / var_66_3

				if arg_63_1.var_.characterEffect1096ui_story then
					arg_63_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_2 + var_66_3 and arg_63_1.time_ < var_66_2 + var_66_3 + arg_66_0 and arg_63_1.var_.characterEffect1096ui_story then
				arg_63_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_66_5 = 0
			local var_66_6 = 0.275

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_7 = arg_63_1:FormatText(StoryNameCfg[169].name)

				arg_63_1.leftNameTxt_.text = var_66_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_8 = arg_63_1:GetWordFromCfg(111222016)
				local var_66_9 = arg_63_1:FormatText(var_66_8.content)

				arg_63_1.text_.text = var_66_9

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_10 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222016", "story_v_out_111222.awb") ~= 0 then
					local var_66_13 = manager.audio:GetVoiceLength("story_v_out_111222", "111222016", "story_v_out_111222.awb") / 1000

					if var_66_13 + var_66_5 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_5
					end

					if var_66_8.prefab_name ~= "" and arg_63_1.actors_[var_66_8.prefab_name] ~= nil then
						local var_66_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_8.prefab_name].transform, "story_v_out_111222", "111222016", "story_v_out_111222.awb")

						arg_63_1:RecordAudio("111222016", var_66_14)
						arg_63_1:RecordAudio("111222016", var_66_14)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_111222", "111222016", "story_v_out_111222.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_111222", "111222016", "story_v_out_111222.awb")
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
	Play111222017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 111222017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play111222018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1096ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1096ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, 100, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1096ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, 100, 0)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = 0
			local var_70_10 = 0.95

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_11 = arg_67_1:GetWordFromCfg(111222017)
				local var_70_12 = arg_67_1:FormatText(var_70_11.content)

				arg_67_1.text_.text = var_70_12

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_13 = 38
				local var_70_14 = utf8.len(var_70_12)
				local var_70_15 = var_70_13 <= 0 and var_70_10 or var_70_10 * (var_70_14 / var_70_13)

				if var_70_15 > 0 and var_70_10 < var_70_15 then
					arg_67_1.talkMaxDuration = var_70_15

					if var_70_15 + var_70_9 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_15 + var_70_9
					end
				end

				arg_67_1.text_.text = var_70_12
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_16 = math.max(var_70_10, arg_67_1.talkMaxDuration)

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_16 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_9) / var_70_16

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_9 + var_70_16 and arg_67_1.time_ < var_70_9 + var_70_16 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play111222018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 111222018
		arg_71_1.duration_ = 4.433

		local var_71_0 = {
			ja = 4.3,
			ko = 4.033,
			zh = 4.266,
			en = 4.433
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
				arg_71_0:Play111222019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1096ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1096ui_story == nil then
				arg_71_1.var_.characterEffect1096ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1096ui_story then
					arg_71_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1096ui_story then
				arg_71_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_74_4 = 0

			if var_74_4 < arg_71_1.time_ and arg_71_1.time_ <= var_74_4 + arg_74_0 then
				arg_71_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action1_1")
			end

			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 then
				arg_71_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_74_6 = arg_71_1.actors_["1096ui_story"].transform
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 then
				arg_71_1.var_.moveOldPos1096ui_story = var_74_6.localPosition
			end

			local var_74_8 = 0.001

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8
				local var_74_10 = Vector3.New(0, -1.13, -5.6)

				var_74_6.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1096ui_story, var_74_10, var_74_9)

				local var_74_11 = manager.ui.mainCamera.transform.position - var_74_6.position

				var_74_6.forward = Vector3.New(var_74_11.x, var_74_11.y, var_74_11.z)

				local var_74_12 = var_74_6.localEulerAngles

				var_74_12.z = 0
				var_74_12.x = 0
				var_74_6.localEulerAngles = var_74_12
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 then
				var_74_6.localPosition = Vector3.New(0, -1.13, -5.6)

				local var_74_13 = manager.ui.mainCamera.transform.position - var_74_6.position

				var_74_6.forward = Vector3.New(var_74_13.x, var_74_13.y, var_74_13.z)

				local var_74_14 = var_74_6.localEulerAngles

				var_74_14.z = 0
				var_74_14.x = 0
				var_74_6.localEulerAngles = var_74_14
			end

			local var_74_15 = 0
			local var_74_16 = 0.45

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_17 = arg_71_1:FormatText(StoryNameCfg[169].name)

				arg_71_1.leftNameTxt_.text = var_74_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_18 = arg_71_1:GetWordFromCfg(111222018)
				local var_74_19 = arg_71_1:FormatText(var_74_18.content)

				arg_71_1.text_.text = var_74_19

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_20 = 18
				local var_74_21 = utf8.len(var_74_19)
				local var_74_22 = var_74_20 <= 0 and var_74_16 or var_74_16 * (var_74_21 / var_74_20)

				if var_74_22 > 0 and var_74_16 < var_74_22 then
					arg_71_1.talkMaxDuration = var_74_22

					if var_74_22 + var_74_15 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_22 + var_74_15
					end
				end

				arg_71_1.text_.text = var_74_19
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222018", "story_v_out_111222.awb") ~= 0 then
					local var_74_23 = manager.audio:GetVoiceLength("story_v_out_111222", "111222018", "story_v_out_111222.awb") / 1000

					if var_74_23 + var_74_15 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_23 + var_74_15
					end

					if var_74_18.prefab_name ~= "" and arg_71_1.actors_[var_74_18.prefab_name] ~= nil then
						local var_74_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_18.prefab_name].transform, "story_v_out_111222", "111222018", "story_v_out_111222.awb")

						arg_71_1:RecordAudio("111222018", var_74_24)
						arg_71_1:RecordAudio("111222018", var_74_24)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_111222", "111222018", "story_v_out_111222.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_111222", "111222018", "story_v_out_111222.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_25 = math.max(var_74_16, arg_71_1.talkMaxDuration)

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_25 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_15) / var_74_25

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_15 + var_74_25 and arg_71_1.time_ < var_74_15 + var_74_25 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play111222019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 111222019
		arg_75_1.duration_ = 7.833

		local var_75_0 = {
			ja = 6.533,
			ko = 7.833,
			zh = 7.5,
			en = 7.333
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
				arg_75_0:Play111222020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_78_1 = 0
			local var_78_2 = 1.025

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_3 = arg_75_1:FormatText(StoryNameCfg[169].name)

				arg_75_1.leftNameTxt_.text = var_78_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_4 = arg_75_1:GetWordFromCfg(111222019)
				local var_78_5 = arg_75_1:FormatText(var_78_4.content)

				arg_75_1.text_.text = var_78_5

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_6 = 41
				local var_78_7 = utf8.len(var_78_5)
				local var_78_8 = var_78_6 <= 0 and var_78_2 or var_78_2 * (var_78_7 / var_78_6)

				if var_78_8 > 0 and var_78_2 < var_78_8 then
					arg_75_1.talkMaxDuration = var_78_8

					if var_78_8 + var_78_1 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_1
					end
				end

				arg_75_1.text_.text = var_78_5
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222019", "story_v_out_111222.awb") ~= 0 then
					local var_78_9 = manager.audio:GetVoiceLength("story_v_out_111222", "111222019", "story_v_out_111222.awb") / 1000

					if var_78_9 + var_78_1 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_9 + var_78_1
					end

					if var_78_4.prefab_name ~= "" and arg_75_1.actors_[var_78_4.prefab_name] ~= nil then
						local var_78_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_4.prefab_name].transform, "story_v_out_111222", "111222019", "story_v_out_111222.awb")

						arg_75_1:RecordAudio("111222019", var_78_10)
						arg_75_1:RecordAudio("111222019", var_78_10)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_111222", "111222019", "story_v_out_111222.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_111222", "111222019", "story_v_out_111222.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_11 = math.max(var_78_2, arg_75_1.talkMaxDuration)

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_11 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_1) / var_78_11

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_1 + var_78_11 and arg_75_1.time_ < var_78_1 + var_78_11 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play111222020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 111222020
		arg_79_1.duration_ = 12.733

		local var_79_0 = {
			ja = 12.733,
			ko = 8.5,
			zh = 12.166,
			en = 10.866
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
				arg_79_0:Play111222021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_82_1 = 0
			local var_82_2 = 1.3

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_3 = arg_79_1:FormatText(StoryNameCfg[169].name)

				arg_79_1.leftNameTxt_.text = var_82_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_4 = arg_79_1:GetWordFromCfg(111222020)
				local var_82_5 = arg_79_1:FormatText(var_82_4.content)

				arg_79_1.text_.text = var_82_5

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_6 = 52
				local var_82_7 = utf8.len(var_82_5)
				local var_82_8 = var_82_6 <= 0 and var_82_2 or var_82_2 * (var_82_7 / var_82_6)

				if var_82_8 > 0 and var_82_2 < var_82_8 then
					arg_79_1.talkMaxDuration = var_82_8

					if var_82_8 + var_82_1 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_1
					end
				end

				arg_79_1.text_.text = var_82_5
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222020", "story_v_out_111222.awb") ~= 0 then
					local var_82_9 = manager.audio:GetVoiceLength("story_v_out_111222", "111222020", "story_v_out_111222.awb") / 1000

					if var_82_9 + var_82_1 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_9 + var_82_1
					end

					if var_82_4.prefab_name ~= "" and arg_79_1.actors_[var_82_4.prefab_name] ~= nil then
						local var_82_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_4.prefab_name].transform, "story_v_out_111222", "111222020", "story_v_out_111222.awb")

						arg_79_1:RecordAudio("111222020", var_82_10)
						arg_79_1:RecordAudio("111222020", var_82_10)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_111222", "111222020", "story_v_out_111222.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_111222", "111222020", "story_v_out_111222.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_11 = math.max(var_82_2, arg_79_1.talkMaxDuration)

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_11 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_1) / var_82_11

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_1 + var_82_11 and arg_79_1.time_ < var_82_1 + var_82_11 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play111222021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 111222021
		arg_83_1.duration_ = 8.5

		local var_83_0 = {
			ja = 8.5,
			ko = 4.9,
			zh = 6.033,
			en = 5.6
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
				arg_83_0:Play111222022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action3_1")
			end

			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_86_2 = 0
			local var_86_3 = 0.625

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_4 = arg_83_1:FormatText(StoryNameCfg[169].name)

				arg_83_1.leftNameTxt_.text = var_86_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_5 = arg_83_1:GetWordFromCfg(111222021)
				local var_86_6 = arg_83_1:FormatText(var_86_5.content)

				arg_83_1.text_.text = var_86_6

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_7 = 25
				local var_86_8 = utf8.len(var_86_6)
				local var_86_9 = var_86_7 <= 0 and var_86_3 or var_86_3 * (var_86_8 / var_86_7)

				if var_86_9 > 0 and var_86_3 < var_86_9 then
					arg_83_1.talkMaxDuration = var_86_9

					if var_86_9 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_9 + var_86_2
					end
				end

				arg_83_1.text_.text = var_86_6
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222021", "story_v_out_111222.awb") ~= 0 then
					local var_86_10 = manager.audio:GetVoiceLength("story_v_out_111222", "111222021", "story_v_out_111222.awb") / 1000

					if var_86_10 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_2
					end

					if var_86_5.prefab_name ~= "" and arg_83_1.actors_[var_86_5.prefab_name] ~= nil then
						local var_86_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_5.prefab_name].transform, "story_v_out_111222", "111222021", "story_v_out_111222.awb")

						arg_83_1:RecordAudio("111222021", var_86_11)
						arg_83_1:RecordAudio("111222021", var_86_11)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_111222", "111222021", "story_v_out_111222.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_111222", "111222021", "story_v_out_111222.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_12 = math.max(var_86_3, arg_83_1.talkMaxDuration)

			if var_86_2 <= arg_83_1.time_ and arg_83_1.time_ < var_86_2 + var_86_12 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_2) / var_86_12

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_2 + var_86_12 and arg_83_1.time_ < var_86_2 + var_86_12 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play111222022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 111222022
		arg_87_1.duration_ = 6.333

		local var_87_0 = {
			ja = 6.333,
			ko = 3.9,
			zh = 5.1,
			en = 3.733
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
				arg_87_0:Play111222023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1096ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1096ui_story == nil then
				arg_87_1.var_.characterEffect1096ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1096ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1096ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1096ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1096ui_story.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.575

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[32].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1066")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(111222022)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222022", "story_v_out_111222.awb") ~= 0 then
					local var_90_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222022", "story_v_out_111222.awb") / 1000

					if var_90_14 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_14 + var_90_6
					end

					if var_90_9.prefab_name ~= "" and arg_87_1.actors_[var_90_9.prefab_name] ~= nil then
						local var_90_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_9.prefab_name].transform, "story_v_out_111222", "111222022", "story_v_out_111222.awb")

						arg_87_1:RecordAudio("111222022", var_90_15)
						arg_87_1:RecordAudio("111222022", var_90_15)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_111222", "111222022", "story_v_out_111222.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_111222", "111222022", "story_v_out_111222.awb")
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
	Play111222023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 111222023
		arg_91_1.duration_ = 5.233

		local var_91_0 = {
			ja = 4.033,
			ko = 5.233,
			zh = 4.5,
			en = 2.9
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
				arg_91_0:Play111222024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action3_2")
			end

			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_94_2 = arg_91_1.actors_["1096ui_story"]
			local var_94_3 = 0

			if var_94_3 < arg_91_1.time_ and arg_91_1.time_ <= var_94_3 + arg_94_0 and arg_91_1.var_.characterEffect1096ui_story == nil then
				arg_91_1.var_.characterEffect1096ui_story = var_94_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_4 = 0.2

			if var_94_3 <= arg_91_1.time_ and arg_91_1.time_ < var_94_3 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_3) / var_94_4

				if arg_91_1.var_.characterEffect1096ui_story then
					arg_91_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_3 + var_94_4 and arg_91_1.time_ < var_94_3 + var_94_4 + arg_94_0 and arg_91_1.var_.characterEffect1096ui_story then
				arg_91_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_94_6 = 0
			local var_94_7 = 0.55

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[169].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(111222023)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 22
				local var_94_12 = utf8.len(var_94_10)
				local var_94_13 = var_94_11 <= 0 and var_94_7 or var_94_7 * (var_94_12 / var_94_11)

				if var_94_13 > 0 and var_94_7 < var_94_13 then
					arg_91_1.talkMaxDuration = var_94_13

					if var_94_13 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_10
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222023", "story_v_out_111222.awb") ~= 0 then
					local var_94_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222023", "story_v_out_111222.awb") / 1000

					if var_94_14 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_14 + var_94_6
					end

					if var_94_9.prefab_name ~= "" and arg_91_1.actors_[var_94_9.prefab_name] ~= nil then
						local var_94_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_9.prefab_name].transform, "story_v_out_111222", "111222023", "story_v_out_111222.awb")

						arg_91_1:RecordAudio("111222023", var_94_15)
						arg_91_1:RecordAudio("111222023", var_94_15)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_111222", "111222023", "story_v_out_111222.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_111222", "111222023", "story_v_out_111222.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_16 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_16 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_16

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_16 and arg_91_1.time_ < var_94_6 + var_94_16 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play111222024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 111222024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play111222025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1096ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1096ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1096ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, 100, 0)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = 0
			local var_98_10 = 0.6

			if var_98_9 < arg_95_1.time_ and arg_95_1.time_ <= var_98_9 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_11 = arg_95_1:GetWordFromCfg(111222024)
				local var_98_12 = arg_95_1:FormatText(var_98_11.content)

				arg_95_1.text_.text = var_98_12

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_13 = 24
				local var_98_14 = utf8.len(var_98_12)
				local var_98_15 = var_98_13 <= 0 and var_98_10 or var_98_10 * (var_98_14 / var_98_13)

				if var_98_15 > 0 and var_98_10 < var_98_15 then
					arg_95_1.talkMaxDuration = var_98_15

					if var_98_15 + var_98_9 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_15 + var_98_9
					end
				end

				arg_95_1.text_.text = var_98_12
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_10, arg_95_1.talkMaxDuration)

			if var_98_9 <= arg_95_1.time_ and arg_95_1.time_ < var_98_9 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_9) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_9 + var_98_16 and arg_95_1.time_ < var_98_9 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play111222025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 111222025
		arg_99_1.duration_ = 3.633

		local var_99_0 = {
			ja = 3.633,
			ko = 1.5,
			zh = 3,
			en = 3.6
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
				arg_99_0:Play111222026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.2

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[169].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1096")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(111222025)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222025", "story_v_out_111222.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_111222", "111222025", "story_v_out_111222.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_111222", "111222025", "story_v_out_111222.awb")

						arg_99_1:RecordAudio("111222025", var_102_9)
						arg_99_1:RecordAudio("111222025", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_111222", "111222025", "story_v_out_111222.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_111222", "111222025", "story_v_out_111222.awb")
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
	Play111222026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 111222026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play111222027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.bgs_.A07a.transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPosA07a = var_106_0.localPosition
			end

			local var_106_2 = 2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 1, 9)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPosA07a, var_106_4, var_106_3)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, 1, 9)
			end

			local var_106_5 = 0
			local var_106_6 = 1.3

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_7 = arg_103_1:GetWordFromCfg(111222026)
				local var_106_8 = arg_103_1:FormatText(var_106_7.content)

				arg_103_1.text_.text = var_106_8

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_9 = 52
				local var_106_10 = utf8.len(var_106_8)
				local var_106_11 = var_106_9 <= 0 and var_106_6 or var_106_6 * (var_106_10 / var_106_9)

				if var_106_11 > 0 and var_106_6 < var_106_11 then
					arg_103_1.talkMaxDuration = var_106_11

					if var_106_11 + var_106_5 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_11 + var_106_5
					end
				end

				arg_103_1.text_.text = var_106_8
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_12 = math.max(var_106_6, arg_103_1.talkMaxDuration)

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_12 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_5) / var_106_12

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_5 + var_106_12 and arg_103_1.time_ < var_106_5 + var_106_12 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play111222027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 111222027
		arg_107_1.duration_ = 6.5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play111222028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.bgs_.A07a.transform
			local var_110_1 = 0.0166666666666667

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPosA07a = var_110_0.localPosition
			end

			local var_110_2 = 0.1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(1.5, 2, 1)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPosA07a, var_110_4, var_110_3)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(1.5, 2, 1)
			end

			local var_110_5 = arg_107_1.bgs_.A07a.transform
			local var_110_6 = 0

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.var_.moveOldPosA07a = var_110_5.localPosition
			end

			local var_110_7 = 0.001

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_7 then
				local var_110_8 = (arg_107_1.time_ - var_110_6) / var_110_7
				local var_110_9 = Vector3.New(0, 1, 9)

				var_110_5.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPosA07a, var_110_9, var_110_8)
			end

			if arg_107_1.time_ >= var_110_6 + var_110_7 and arg_107_1.time_ < var_110_6 + var_110_7 + arg_110_0 then
				var_110_5.localPosition = Vector3.New(0, 1, 9)
			end

			local var_110_10 = arg_107_1.bgs_.A07a
			local var_110_11 = 0.116666666666667

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				local var_110_12 = var_110_10:GetComponent("SpriteRenderer")

				if var_110_12 then
					var_110_12.material = arg_107_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_110_13 = var_110_12.material
					local var_110_14 = var_110_13:GetColor("_Color")

					arg_107_1.var_.alphaOldValueA07a = var_110_14.a
					arg_107_1.var_.alphaMatValueA07a = var_110_13
				end

				arg_107_1.var_.alphaOldValueA07a = 1
			end

			local var_110_15 = 0.0166666666666667

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_11) / var_110_15
				local var_110_17 = Mathf.Lerp(arg_107_1.var_.alphaOldValueA07a, 0, var_110_16)

				if arg_107_1.var_.alphaMatValueA07a then
					local var_110_18 = arg_107_1.var_.alphaMatValueA07a
					local var_110_19 = var_110_18:GetColor("_Color")

					var_110_19.a = var_110_17

					var_110_18:SetColor("_Color", var_110_19)
				end
			end

			if arg_107_1.time_ >= var_110_11 + var_110_15 and arg_107_1.time_ < var_110_11 + var_110_15 + arg_110_0 and arg_107_1.var_.alphaMatValueA07a then
				local var_110_20 = arg_107_1.var_.alphaMatValueA07a
				local var_110_21 = var_110_20:GetColor("_Color")

				var_110_21.a = 0

				var_110_20:SetColor("_Color", var_110_21)
			end

			local var_110_22 = "STwhite"

			if arg_107_1.bgs_[var_110_22] == nil then
				local var_110_23 = Object.Instantiate(arg_107_1.paintGo_)

				var_110_23:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_110_22)
				var_110_23.name = var_110_22
				var_110_23.transform.parent = arg_107_1.stage_.transform
				var_110_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_107_1.bgs_[var_110_22] = var_110_23
			end

			local var_110_24 = arg_107_1.bgs_.STwhite.transform
			local var_110_25 = 1.08266666666667

			if var_110_25 < arg_107_1.time_ and arg_107_1.time_ <= var_110_25 + arg_110_0 then
				arg_107_1.var_.moveOldPosSTwhite = var_110_24.localPosition
				var_110_24.localScale = Vector3.New(10, 10, 10)
			end

			local var_110_26 = 0.001

			if var_110_25 <= arg_107_1.time_ and arg_107_1.time_ < var_110_25 + var_110_26 then
				local var_110_27 = (arg_107_1.time_ - var_110_25) / var_110_26
				local var_110_28 = Vector3.New(0, 0, 0)

				var_110_24.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPosSTwhite, var_110_28, var_110_27)
			end

			if arg_107_1.time_ >= var_110_25 + var_110_26 and arg_107_1.time_ < var_110_25 + var_110_26 + arg_110_0 then
				var_110_24.localPosition = Vector3.New(0, 0, 0)
			end

			local var_110_29 = 0.116666666666667

			if var_110_29 < arg_107_1.time_ and arg_107_1.time_ <= var_110_29 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_30 = 1

			if var_110_29 <= arg_107_1.time_ and arg_107_1.time_ < var_110_29 + var_110_30 then
				local var_110_31 = (arg_107_1.time_ - var_110_29) / var_110_30
				local var_110_32 = Color.New(1, 1, 1)

				var_110_32.a = Mathf.Lerp(0, 1, var_110_31)
				arg_107_1.mask_.color = var_110_32
			end

			if arg_107_1.time_ >= var_110_29 + var_110_30 and arg_107_1.time_ < var_110_29 + var_110_30 + arg_110_0 then
				local var_110_33 = Color.New(1, 1, 1)

				var_110_33.a = 1
				arg_107_1.mask_.color = var_110_33
			end

			local var_110_34 = 1.11666666666667

			if var_110_34 < arg_107_1.time_ and arg_107_1.time_ <= var_110_34 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = false

				arg_107_1:SetGaussion(false)
			end

			local var_110_35 = 0.0166666666666667

			if var_110_34 <= arg_107_1.time_ and arg_107_1.time_ < var_110_34 + var_110_35 then
				local var_110_36 = (arg_107_1.time_ - var_110_34) / var_110_35
				local var_110_37 = Color.New(1, 1, 1)

				var_110_37.a = Mathf.Lerp(1, 0, var_110_36)
				arg_107_1.mask_.color = var_110_37
			end

			if arg_107_1.time_ >= var_110_34 + var_110_35 and arg_107_1.time_ < var_110_34 + var_110_35 + arg_110_0 then
				local var_110_38 = Color.New(1, 1, 1)
				local var_110_39 = 0

				arg_107_1.mask_.enabled = false
				var_110_38.a = var_110_39
				arg_107_1.mask_.color = var_110_38
			end

			if arg_107_1.frameCnt_ <= 1 then
				arg_107_1.dialog_:SetActive(false)
			end

			local var_110_40 = 1.5
			local var_110_41 = 0.975

			if var_110_40 < arg_107_1.time_ and arg_107_1.time_ <= var_110_40 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_42 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_42:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_43 = arg_107_1:GetWordFromCfg(111222027)
				local var_110_44 = arg_107_1:FormatText(var_110_43.content)

				arg_107_1.text_.text = var_110_44

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_45 = 39
				local var_110_46 = utf8.len(var_110_44)
				local var_110_47 = var_110_45 <= 0 and var_110_41 or var_110_41 * (var_110_46 / var_110_45)

				if var_110_47 > 0 and var_110_41 < var_110_47 then
					arg_107_1.talkMaxDuration = var_110_47
					var_110_40 = var_110_40 + 0.3

					if var_110_47 + var_110_40 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_47 + var_110_40
					end
				end

				arg_107_1.text_.text = var_110_44
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_48 = var_110_40 + 0.3
			local var_110_49 = math.max(var_110_41, arg_107_1.talkMaxDuration)

			if var_110_48 <= arg_107_1.time_ and arg_107_1.time_ < var_110_48 + var_110_49 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_48) / var_110_49

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_48 + var_110_49 and arg_107_1.time_ < var_110_48 + var_110_49 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play111222028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 111222028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play111222029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.225

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

				local var_116_2 = arg_113_1:GetWordFromCfg(111222028)
				local var_116_3 = arg_113_1:FormatText(var_116_2.content)

				arg_113_1.text_.text = var_116_3

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_4 = 49
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
	Play111222029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 111222029
		arg_117_1.duration_ = 7

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play111222030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = "AS0109"

			if arg_117_1.bgs_[var_120_0] == nil then
				local var_120_1 = Object.Instantiate(arg_117_1.paintGo_)

				var_120_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_120_0)
				var_120_1.name = var_120_0
				var_120_1.transform.parent = arg_117_1.stage_.transform
				var_120_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_117_1.bgs_[var_120_0] = var_120_1
			end

			local var_120_2 = 0

			if var_120_2 < arg_117_1.time_ and arg_117_1.time_ <= var_120_2 + arg_120_0 then
				local var_120_3 = manager.ui.mainCamera.transform.localPosition
				local var_120_4 = Vector3.New(0, 0, 10) + Vector3.New(var_120_3.x, var_120_3.y, 0)
				local var_120_5 = arg_117_1.bgs_.AS0109

				var_120_5.transform.localPosition = var_120_4
				var_120_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_120_6 = var_120_5:GetComponent("SpriteRenderer")

				if var_120_6 and var_120_6.sprite then
					local var_120_7 = (var_120_5.transform.localPosition - var_120_3).z
					local var_120_8 = manager.ui.mainCameraCom_
					local var_120_9 = 2 * var_120_7 * Mathf.Tan(var_120_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_120_10 = var_120_9 * var_120_8.aspect
					local var_120_11 = var_120_6.sprite.bounds.size.x
					local var_120_12 = var_120_6.sprite.bounds.size.y
					local var_120_13 = var_120_10 / var_120_11
					local var_120_14 = var_120_9 / var_120_12
					local var_120_15 = var_120_14 < var_120_13 and var_120_13 or var_120_14

					var_120_5.transform.localScale = Vector3.New(var_120_15, var_120_15, 0)
				end

				for iter_120_0, iter_120_1 in pairs(arg_117_1.bgs_) do
					if iter_120_0 ~= "AS0109" then
						iter_120_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_120_16 = 0

			if var_120_16 < arg_117_1.time_ and arg_117_1.time_ <= var_120_16 + arg_120_0 then
				arg_117_1.mask_.enabled = true
				arg_117_1.mask_.raycastTarget = false

				arg_117_1:SetGaussion(false)
			end

			local var_120_17 = 1.5

			if var_120_16 <= arg_117_1.time_ and arg_117_1.time_ < var_120_16 + var_120_17 then
				local var_120_18 = (arg_117_1.time_ - var_120_16) / var_120_17
				local var_120_19 = Color.New(1, 1, 1)

				var_120_19.a = Mathf.Lerp(1, 0, var_120_18)
				arg_117_1.mask_.color = var_120_19
			end

			if arg_117_1.time_ >= var_120_16 + var_120_17 and arg_117_1.time_ < var_120_16 + var_120_17 + arg_120_0 then
				local var_120_20 = Color.New(1, 1, 1)
				local var_120_21 = 0

				arg_117_1.mask_.enabled = false
				var_120_20.a = var_120_21
				arg_117_1.mask_.color = var_120_20
			end

			if arg_117_1.frameCnt_ <= 1 then
				arg_117_1.dialog_:SetActive(false)
			end

			local var_120_22 = 2
			local var_120_23 = 0.45

			if var_120_22 < arg_117_1.time_ and arg_117_1.time_ <= var_120_22 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0

				arg_117_1.dialog_:SetActive(true)

				local var_120_24 = LeanTween.value(arg_117_1.dialog_, 0, 1, 0.3)

				var_120_24:setOnUpdate(LuaHelper.FloatAction(function(arg_121_0)
					arg_117_1.dialogCg_.alpha = arg_121_0
				end))
				var_120_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_117_1.dialog_)
					var_120_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_117_1.duration_ = arg_117_1.duration_ + 0.3

				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_25 = arg_117_1:GetWordFromCfg(111222029)
				local var_120_26 = arg_117_1:FormatText(var_120_25.content)

				arg_117_1.text_.text = var_120_26

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_27 = 18
				local var_120_28 = utf8.len(var_120_26)
				local var_120_29 = var_120_27 <= 0 and var_120_23 or var_120_23 * (var_120_28 / var_120_27)

				if var_120_29 > 0 and var_120_23 < var_120_29 then
					arg_117_1.talkMaxDuration = var_120_29
					var_120_22 = var_120_22 + 0.3

					if var_120_29 + var_120_22 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_29 + var_120_22
					end
				end

				arg_117_1.text_.text = var_120_26
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_30 = var_120_22 + 0.3
			local var_120_31 = math.max(var_120_23, arg_117_1.talkMaxDuration)

			if var_120_30 <= arg_117_1.time_ and arg_117_1.time_ < var_120_30 + var_120_31 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_30) / var_120_31

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_30 + var_120_31 and arg_117_1.time_ < var_120_30 + var_120_31 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play111222030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 111222030
		arg_123_1.duration_ = 5.133

		local var_123_0 = {
			ja = 3.3,
			ko = 3.4,
			zh = 4.366,
			en = 5.133
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
				arg_123_0:Play111222031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = manager.ui.mainCamera.transform
			local var_126_1 = 0.2

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.shakeOldPos = var_126_0.localPosition
			end

			local var_126_2 = 0.6

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / 0.066
				local var_126_4, var_126_5 = math.modf(var_126_3)

				var_126_0.localPosition = Vector3.New(var_126_5 * 0.13, var_126_5 * 0.13, var_126_5 * 0.13) + arg_123_1.var_.shakeOldPos
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = arg_123_1.var_.shakeOldPos
			end

			local var_126_6 = 0
			local var_126_7 = 0.2

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[169].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(111222030)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 8
				local var_126_12 = utf8.len(var_126_10)
				local var_126_13 = var_126_11 <= 0 and var_126_7 or var_126_7 * (var_126_12 / var_126_11)

				if var_126_13 > 0 and var_126_7 < var_126_13 then
					arg_123_1.talkMaxDuration = var_126_13

					if var_126_13 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_10
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111222", "111222030", "story_v_out_111222.awb") ~= 0 then
					local var_126_14 = manager.audio:GetVoiceLength("story_v_out_111222", "111222030", "story_v_out_111222.awb") / 1000

					if var_126_14 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_14 + var_126_6
					end

					if var_126_9.prefab_name ~= "" and arg_123_1.actors_[var_126_9.prefab_name] ~= nil then
						local var_126_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_9.prefab_name].transform, "story_v_out_111222", "111222030", "story_v_out_111222.awb")

						arg_123_1:RecordAudio("111222030", var_126_15)
						arg_123_1:RecordAudio("111222030", var_126_15)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_111222", "111222030", "story_v_out_111222.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_111222", "111222030", "story_v_out_111222.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_16 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_16 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_16

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_16 and arg_123_1.time_ < var_126_6 + var_126_16 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play111222031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 111222031
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play111222032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.6

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

				local var_130_2 = arg_127_1:GetWordFromCfg(111222031)
				local var_130_3 = arg_127_1:FormatText(var_130_2.content)

				arg_127_1.text_.text = var_130_3

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_4 = 24
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
	Play111222032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 111222032
		arg_131_1.duration_ = 7.19166666666667

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
			arg_131_1.auto_ = false
		end

		function arg_131_1.playNext_(arg_133_0)
			arg_131_1.onStoryFinished_()
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_1 = 1.5

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_1 then
				local var_134_2 = (arg_131_1.time_ - var_134_0) / var_134_1
				local var_134_3 = Color.New(1, 1, 1)

				var_134_3.a = Mathf.Lerp(0, 1, var_134_2)
				arg_131_1.mask_.color = var_134_3
			end

			if arg_131_1.time_ >= var_134_0 + var_134_1 and arg_131_1.time_ < var_134_0 + var_134_1 + arg_134_0 then
				local var_134_4 = Color.New(1, 1, 1)

				var_134_4.a = 1
				arg_131_1.mask_.color = var_134_4
			end

			local var_134_5 = 1.5

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = false

				arg_131_1:SetGaussion(false)
			end

			local var_134_6 = 0.0166666666666667

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6
				local var_134_8 = Color.New(1, 1, 1)

				var_134_8.a = Mathf.Lerp(1, 0, var_134_7)
				arg_131_1.mask_.color = var_134_8
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 then
				local var_134_9 = Color.New(1, 1, 1)
				local var_134_10 = 0

				arg_131_1.mask_.enabled = false
				var_134_9.a = var_134_10
				arg_131_1.mask_.color = var_134_9
			end

			local var_134_11 = arg_131_1.bgs_.STwhite
			local var_134_12 = 1.51666666666667

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				local var_134_13 = var_134_11:GetComponent("SpriteRenderer")

				if var_134_13 then
					var_134_13.material = arg_131_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_134_14 = var_134_13.material
					local var_134_15 = var_134_14:GetColor("_Color")

					arg_131_1.var_.alphaOldValueSTwhite = var_134_15.a
					arg_131_1.var_.alphaMatValueSTwhite = var_134_14
				end

				arg_131_1.var_.alphaOldValueSTwhite = 1
			end

			local var_134_16 = 1.5

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_16 then
				local var_134_17 = (arg_131_1.time_ - var_134_12) / var_134_16
				local var_134_18 = Mathf.Lerp(arg_131_1.var_.alphaOldValueSTwhite, 0, var_134_17)

				if arg_131_1.var_.alphaMatValueSTwhite then
					local var_134_19 = arg_131_1.var_.alphaMatValueSTwhite
					local var_134_20 = var_134_19:GetColor("_Color")

					var_134_20.a = var_134_18

					var_134_19:SetColor("_Color", var_134_20)
				end
			end

			if arg_131_1.time_ >= var_134_12 + var_134_16 and arg_131_1.time_ < var_134_12 + var_134_16 + arg_134_0 and arg_131_1.var_.alphaMatValueSTwhite then
				local var_134_21 = arg_131_1.var_.alphaMatValueSTwhite
				local var_134_22 = var_134_21:GetColor("_Color")

				var_134_22.a = 0

				var_134_21:SetColor("_Color", var_134_22)
			end

			local var_134_23 = arg_131_1.bgs_.AS0109
			local var_134_24 = 0

			if var_134_24 < arg_131_1.time_ and arg_131_1.time_ <= var_134_24 + arg_134_0 then
				local var_134_25 = var_134_23:GetComponent("SpriteRenderer")

				if var_134_25 then
					var_134_25.material = arg_131_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_134_26 = var_134_25.material
					local var_134_27 = var_134_26:GetColor("_Color")

					arg_131_1.var_.alphaOldValueAS0109 = var_134_27.a
					arg_131_1.var_.alphaMatValueAS0109 = var_134_26
				end

				arg_131_1.var_.alphaOldValueAS0109 = 1
			end

			local var_134_28 = 0.0166666666666667

			if var_134_24 <= arg_131_1.time_ and arg_131_1.time_ < var_134_24 + var_134_28 then
				local var_134_29 = (arg_131_1.time_ - var_134_24) / var_134_28
				local var_134_30 = Mathf.Lerp(arg_131_1.var_.alphaOldValueAS0109, 0, var_134_29)

				if arg_131_1.var_.alphaMatValueAS0109 then
					local var_134_31 = arg_131_1.var_.alphaMatValueAS0109
					local var_134_32 = var_134_31:GetColor("_Color")

					var_134_32.a = var_134_30

					var_134_31:SetColor("_Color", var_134_32)
				end
			end

			if arg_131_1.time_ >= var_134_24 + var_134_28 and arg_131_1.time_ < var_134_24 + var_134_28 + arg_134_0 and arg_131_1.var_.alphaMatValueAS0109 then
				local var_134_33 = arg_131_1.var_.alphaMatValueAS0109
				local var_134_34 = var_134_33:GetColor("_Color")

				var_134_34.a = 0

				var_134_33:SetColor("_Color", var_134_34)
			end

			local var_134_35 = arg_131_1.bgs_.STwhite.transform
			local var_134_36 = 1.466

			if var_134_36 < arg_131_1.time_ and arg_131_1.time_ <= var_134_36 + arg_134_0 then
				arg_131_1.var_.moveOldPosSTwhite = var_134_35.localPosition
				var_134_35.localScale = Vector3.New(10, 10, 10)
			end

			local var_134_37 = 0.001

			if var_134_36 <= arg_131_1.time_ and arg_131_1.time_ < var_134_36 + var_134_37 then
				local var_134_38 = (arg_131_1.time_ - var_134_36) / var_134_37
				local var_134_39 = Vector3.New(0, 0, 0)

				var_134_35.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPosSTwhite, var_134_39, var_134_38)
			end

			if arg_131_1.time_ >= var_134_36 + var_134_37 and arg_131_1.time_ < var_134_36 + var_134_37 + arg_134_0 then
				var_134_35.localPosition = Vector3.New(0, 0, 0)
			end

			local var_134_40 = 2.19166666666667
			local var_134_41 = 0.825

			if var_134_40 < arg_131_1.time_ and arg_131_1.time_ <= var_134_40 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_42 = arg_131_1:GetWordFromCfg(111222032)
				local var_134_43 = arg_131_1:FormatText(var_134_42.content)

				arg_131_1.text_.text = var_134_43

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_44 = 33
				local var_134_45 = utf8.len(var_134_43)
				local var_134_46 = var_134_44 <= 0 and var_134_41 or var_134_41 * (var_134_45 / var_134_44)

				if var_134_46 > 0 and var_134_41 < var_134_46 then
					arg_131_1.talkMaxDuration = var_134_46

					if var_134_46 + var_134_40 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_46 + var_134_40
					end
				end

				arg_131_1.text_.text = var_134_43
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_47 = math.max(var_134_41, arg_131_1.talkMaxDuration)

			if var_134_40 <= arg_131_1.time_ and arg_131_1.time_ < var_134_40 + var_134_47 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_40) / var_134_47

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_40 + var_134_47 and arg_131_1.time_ < var_134_40 + var_134_47 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/A07a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/AS0109"
	},
	voices = {
		"story_v_out_111222.awb"
	}
}
