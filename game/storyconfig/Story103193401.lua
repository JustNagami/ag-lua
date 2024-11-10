return {
	Play319341001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319341001
		arg_1_1.duration_ = 5.5

		local var_1_0 = {
			zh = 5.133,
			ja = 5.5
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
				arg_1_0:Play319341002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11o"

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
				local var_4_5 = arg_1_1.bgs_.I11o

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
					if iter_4_0 ~= "I11o" then
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

			local var_4_22 = 0.1
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano.awb")
			end

			local var_4_26 = 0
			local var_4_27 = 0.0666666666666667

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.25

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(319341001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 10
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_31 or var_4_31 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_31 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38
					var_4_30 = var_4_30 + 0.3

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341001", "story_v_out_319341.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_319341", "319341001", "story_v_out_319341.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_319341", "319341001", "story_v_out_319341.awb")

						arg_1_1:RecordAudio("319341001", var_4_40)
						arg_1_1:RecordAudio("319341001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319341", "319341001", "story_v_out_319341.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319341", "319341001", "story_v_out_319341.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_41 = var_4_30 + 0.3
			local var_4_42 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_41) / var_4_42

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319341002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319341002
		arg_7_1.duration_ = 4.166

		local var_7_0 = {
			zh = 2.4,
			ja = 4.166
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
				arg_7_0:Play319341003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1084ui_story"

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

			local var_10_4 = arg_7_1.actors_["1084ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.200000002980232

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1084ui_story then
					local var_10_8 = Mathf.Lerp(0, 0.5, var_10_7)

					arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_8
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				local var_10_9 = 0.5

				arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_9
			end

			local var_10_10 = 0
			local var_10_11 = 0.25

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_12 = arg_7_1:FormatText(StoryNameCfg[140].name)

				arg_7_1.leftNameTxt_.text = var_10_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolia")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_13 = arg_7_1:GetWordFromCfg(319341002)
				local var_10_14 = arg_7_1:FormatText(var_10_13.content)

				arg_7_1.text_.text = var_10_14

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_15 = 10
				local var_10_16 = utf8.len(var_10_14)
				local var_10_17 = var_10_15 <= 0 and var_10_11 or var_10_11 * (var_10_16 / var_10_15)

				if var_10_17 > 0 and var_10_11 < var_10_17 then
					arg_7_1.talkMaxDuration = var_10_17

					if var_10_17 + var_10_10 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_17 + var_10_10
					end
				end

				arg_7_1.text_.text = var_10_14
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341002", "story_v_out_319341.awb") ~= 0 then
					local var_10_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341002", "story_v_out_319341.awb") / 1000

					if var_10_18 + var_10_10 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_18 + var_10_10
					end

					if var_10_13.prefab_name ~= "" and arg_7_1.actors_[var_10_13.prefab_name] ~= nil then
						local var_10_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_13.prefab_name].transform, "story_v_out_319341", "319341002", "story_v_out_319341.awb")

						arg_7_1:RecordAudio("319341002", var_10_19)
						arg_7_1:RecordAudio("319341002", var_10_19)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319341", "319341002", "story_v_out_319341.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319341", "319341002", "story_v_out_319341.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_20 = math.max(var_10_11, arg_7_1.talkMaxDuration)

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_20 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_10) / var_10_20

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_10 + var_10_20 and arg_7_1.time_ < var_10_10 + var_10_20 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319341003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319341003
		arg_11_1.duration_ = 14.2

		local var_11_0 = {
			zh = 8.4,
			ja = 14.2
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
				arg_11_0:Play319341004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "I11r"

			if arg_11_1.bgs_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(arg_11_1.paintGo_)

				var_14_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_14_0)
				var_14_1.name = var_14_0
				var_14_1.transform.parent = arg_11_1.stage_.transform
				var_14_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.bgs_[var_14_0] = var_14_1
			end

			local var_14_2 = 1.43333333333333

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 then
				local var_14_3 = manager.ui.mainCamera.transform.localPosition
				local var_14_4 = Vector3.New(0, 0, 10) + Vector3.New(var_14_3.x, var_14_3.y, 0)
				local var_14_5 = arg_11_1.bgs_.I11r

				var_14_5.transform.localPosition = var_14_4
				var_14_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_14_6 = var_14_5:GetComponent("SpriteRenderer")

				if var_14_6 and var_14_6.sprite then
					local var_14_7 = (var_14_5.transform.localPosition - var_14_3).z
					local var_14_8 = manager.ui.mainCameraCom_
					local var_14_9 = 2 * var_14_7 * Mathf.Tan(var_14_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_14_10 = var_14_9 * var_14_8.aspect
					local var_14_11 = var_14_6.sprite.bounds.size.x
					local var_14_12 = var_14_6.sprite.bounds.size.y
					local var_14_13 = var_14_10 / var_14_11
					local var_14_14 = var_14_9 / var_14_12
					local var_14_15 = var_14_14 < var_14_13 and var_14_13 or var_14_14

					var_14_5.transform.localScale = Vector3.New(var_14_15, var_14_15, 0)
				end

				for iter_14_0, iter_14_1 in pairs(arg_11_1.bgs_) do
					if iter_14_0 ~= "I11r" then
						iter_14_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 then
				arg_11_1.mask_.enabled = true
				arg_11_1.mask_.raycastTarget = true

				arg_11_1:SetGaussion(false)
			end

			local var_14_17 = 1.43333333333333

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17
				local var_14_19 = Color.New(0, 0, 0)

				var_14_19.a = Mathf.Lerp(0, 1, var_14_18)
				arg_11_1.mask_.color = var_14_19
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 then
				local var_14_20 = Color.New(0, 0, 0)

				var_14_20.a = 1
				arg_11_1.mask_.color = var_14_20
			end

			local var_14_21 = 1.43333333333333

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.mask_.enabled = true
				arg_11_1.mask_.raycastTarget = true

				arg_11_1:SetGaussion(false)
			end

			local var_14_22 = 1.43333333333333

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_22 then
				local var_14_23 = (arg_11_1.time_ - var_14_21) / var_14_22
				local var_14_24 = Color.New(0, 0, 0)

				var_14_24.a = Mathf.Lerp(1, 0, var_14_23)
				arg_11_1.mask_.color = var_14_24
			end

			if arg_11_1.time_ >= var_14_21 + var_14_22 and arg_11_1.time_ < var_14_21 + var_14_22 + arg_14_0 then
				local var_14_25 = Color.New(0, 0, 0)
				local var_14_26 = 0

				arg_11_1.mask_.enabled = false
				var_14_25.a = var_14_26
				arg_11_1.mask_.color = var_14_25
			end

			if arg_11_1.frameCnt_ <= 1 then
				arg_11_1.dialog_:SetActive(false)
			end

			local var_14_27 = 2.6
			local var_14_28 = 0.775

			if var_14_27 < arg_11_1.time_ and arg_11_1.time_ <= var_14_27 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_29 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_29:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_30 = arg_11_1:FormatText(StoryNameCfg[141].name)

				arg_11_1.leftNameTxt_.text = var_14_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_31 = arg_11_1:GetWordFromCfg(319341003)
				local var_14_32 = arg_11_1:FormatText(var_14_31.content)

				arg_11_1.text_.text = var_14_32

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_33 = 31
				local var_14_34 = utf8.len(var_14_32)
				local var_14_35 = var_14_33 <= 0 and var_14_28 or var_14_28 * (var_14_34 / var_14_33)

				if var_14_35 > 0 and var_14_28 < var_14_35 then
					arg_11_1.talkMaxDuration = var_14_35
					var_14_27 = var_14_27 + 0.3

					if var_14_35 + var_14_27 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_35 + var_14_27
					end
				end

				arg_11_1.text_.text = var_14_32
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341003", "story_v_out_319341.awb") ~= 0 then
					local var_14_36 = manager.audio:GetVoiceLength("story_v_out_319341", "319341003", "story_v_out_319341.awb") / 1000

					if var_14_36 + var_14_27 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_36 + var_14_27
					end

					if var_14_31.prefab_name ~= "" and arg_11_1.actors_[var_14_31.prefab_name] ~= nil then
						local var_14_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_31.prefab_name].transform, "story_v_out_319341", "319341003", "story_v_out_319341.awb")

						arg_11_1:RecordAudio("319341003", var_14_37)
						arg_11_1:RecordAudio("319341003", var_14_37)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319341", "319341003", "story_v_out_319341.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319341", "319341003", "story_v_out_319341.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_38 = var_14_27 + 0.3
			local var_14_39 = math.max(var_14_28, arg_11_1.talkMaxDuration)

			if var_14_38 <= arg_11_1.time_ and arg_11_1.time_ < var_14_38 + var_14_39 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_38) / var_14_39

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_38 + var_14_39 and arg_11_1.time_ < var_14_38 + var_14_39 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319341004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 319341004
		arg_17_1.duration_ = 10.5326666666667

		local var_17_0 = {
			zh = 8.46666666666667,
			ja = 10.5326666666667
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
				arg_17_0:Play319341005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.mask_.enabled = true
				arg_17_1.mask_.raycastTarget = true

				arg_17_1:SetGaussion(false)
			end

			local var_20_1 = 1.43333333333333

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_1 then
				local var_20_2 = (arg_17_1.time_ - var_20_0) / var_20_1
				local var_20_3 = Color.New(0, 0, 0)

				var_20_3.a = Mathf.Lerp(0, 1, var_20_2)
				arg_17_1.mask_.color = var_20_3
			end

			if arg_17_1.time_ >= var_20_0 + var_20_1 and arg_17_1.time_ < var_20_0 + var_20_1 + arg_20_0 then
				local var_20_4 = Color.New(0, 0, 0)

				var_20_4.a = 1
				arg_17_1.mask_.color = var_20_4
			end

			local var_20_5 = 1.43333333333333

			if var_20_5 < arg_17_1.time_ and arg_17_1.time_ <= var_20_5 + arg_20_0 then
				arg_17_1.mask_.enabled = true
				arg_17_1.mask_.raycastTarget = true

				arg_17_1:SetGaussion(false)
			end

			local var_20_6 = 1.43333333333333

			if var_20_5 <= arg_17_1.time_ and arg_17_1.time_ < var_20_5 + var_20_6 then
				local var_20_7 = (arg_17_1.time_ - var_20_5) / var_20_6
				local var_20_8 = Color.New(0, 0, 0)

				var_20_8.a = Mathf.Lerp(1, 0, var_20_7)
				arg_17_1.mask_.color = var_20_8
			end

			if arg_17_1.time_ >= var_20_5 + var_20_6 and arg_17_1.time_ < var_20_5 + var_20_6 + arg_20_0 then
				local var_20_9 = Color.New(0, 0, 0)
				local var_20_10 = 0

				arg_17_1.mask_.enabled = false
				var_20_9.a = var_20_10
				arg_17_1.mask_.color = var_20_9
			end

			local var_20_11 = "I11i"

			if arg_17_1.bgs_[var_20_11] == nil then
				local var_20_12 = Object.Instantiate(arg_17_1.paintGo_)

				var_20_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_20_11)
				var_20_12.name = var_20_11
				var_20_12.transform.parent = arg_17_1.stage_.transform
				var_20_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_17_1.bgs_[var_20_11] = var_20_12
			end

			local var_20_13 = 1.43333333333333

			if var_20_13 < arg_17_1.time_ and arg_17_1.time_ <= var_20_13 + arg_20_0 then
				local var_20_14 = manager.ui.mainCamera.transform.localPosition
				local var_20_15 = Vector3.New(0, 0, 10) + Vector3.New(var_20_14.x, var_20_14.y, 0)
				local var_20_16 = arg_17_1.bgs_.I11i

				var_20_16.transform.localPosition = var_20_15
				var_20_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_20_17 = var_20_16:GetComponent("SpriteRenderer")

				if var_20_17 and var_20_17.sprite then
					local var_20_18 = (var_20_16.transform.localPosition - var_20_14).z
					local var_20_19 = manager.ui.mainCameraCom_
					local var_20_20 = 2 * var_20_18 * Mathf.Tan(var_20_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_20_21 = var_20_20 * var_20_19.aspect
					local var_20_22 = var_20_17.sprite.bounds.size.x
					local var_20_23 = var_20_17.sprite.bounds.size.y
					local var_20_24 = var_20_21 / var_20_22
					local var_20_25 = var_20_20 / var_20_23
					local var_20_26 = var_20_25 < var_20_24 and var_20_24 or var_20_25

					var_20_16.transform.localScale = Vector3.New(var_20_26, var_20_26, 0)
				end

				for iter_20_0, iter_20_1 in pairs(arg_17_1.bgs_) do
					if iter_20_0 ~= "I11i" then
						iter_20_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_17_1.frameCnt_ <= 1 then
				arg_17_1.dialog_:SetActive(false)
			end

			local var_20_27 = 2.86666666666667
			local var_20_28 = 0.525

			if var_20_27 < arg_17_1.time_ and arg_17_1.time_ <= var_20_27 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0

				arg_17_1.dialog_:SetActive(true)

				local var_20_29 = LeanTween.value(arg_17_1.dialog_, 0, 1, 0.3)

				var_20_29:setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
					arg_17_1.dialogCg_.alpha = arg_21_0
				end))
				var_20_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_17_1.dialog_)
					var_20_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_17_1.duration_ = arg_17_1.duration_ + 0.3

				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_30 = arg_17_1:FormatText(StoryNameCfg[701].name)

				arg_17_1.leftNameTxt_.text = var_20_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_31 = arg_17_1:GetWordFromCfg(319341004)
				local var_20_32 = arg_17_1:FormatText(var_20_31.content)

				arg_17_1.text_.text = var_20_32

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_33 = 21
				local var_20_34 = utf8.len(var_20_32)
				local var_20_35 = var_20_33 <= 0 and var_20_28 or var_20_28 * (var_20_34 / var_20_33)

				if var_20_35 > 0 and var_20_28 < var_20_35 then
					arg_17_1.talkMaxDuration = var_20_35
					var_20_27 = var_20_27 + 0.3

					if var_20_35 + var_20_27 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_35 + var_20_27
					end
				end

				arg_17_1.text_.text = var_20_32
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341004", "story_v_out_319341.awb") ~= 0 then
					local var_20_36 = manager.audio:GetVoiceLength("story_v_out_319341", "319341004", "story_v_out_319341.awb") / 1000

					if var_20_36 + var_20_27 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_36 + var_20_27
					end

					if var_20_31.prefab_name ~= "" and arg_17_1.actors_[var_20_31.prefab_name] ~= nil then
						local var_20_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_31.prefab_name].transform, "story_v_out_319341", "319341004", "story_v_out_319341.awb")

						arg_17_1:RecordAudio("319341004", var_20_37)
						arg_17_1:RecordAudio("319341004", var_20_37)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_319341", "319341004", "story_v_out_319341.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_319341", "319341004", "story_v_out_319341.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_38 = var_20_27 + 0.3
			local var_20_39 = math.max(var_20_28, arg_17_1.talkMaxDuration)

			if var_20_38 <= arg_17_1.time_ and arg_17_1.time_ < var_20_38 + var_20_39 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_38) / var_20_39

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_38 + var_20_39 and arg_17_1.time_ < var_20_38 + var_20_39 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play319341005 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319341005
		arg_23_1.duration_ = 7.566

		local var_23_0 = {
			zh = 5.533,
			ja = 7.566
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
				arg_23_0:Play319341006(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_0.localPosition

				local var_26_2 = "1084ui_story"

				arg_23_1:ShowWeapon(arg_23_1.var_[var_26_2 .. "Animator"].transform, false)
			end

			local var_26_3 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_3 then
				local var_26_4 = (arg_23_1.time_ - var_26_1) / var_26_3
				local var_26_5 = Vector3.New(0, -0.97, -6)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_5, var_26_4)

				local var_26_6 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_6.x, var_26_6.y, var_26_6.z)

				local var_26_7 = var_26_0.localEulerAngles

				var_26_7.z = 0
				var_26_7.x = 0
				var_26_0.localEulerAngles = var_26_7
			end

			if arg_23_1.time_ >= var_26_1 + var_26_3 and arg_23_1.time_ < var_26_1 + var_26_3 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_26_8 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_8.x, var_26_8.y, var_26_8.z)

				local var_26_9 = var_26_0.localEulerAngles

				var_26_9.z = 0
				var_26_9.x = 0
				var_26_0.localEulerAngles = var_26_9
			end

			local var_26_10 = arg_23_1.actors_["1084ui_story"]
			local var_26_11 = 0

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_12 = 0.200000002980232

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_12 then
				local var_26_13 = (arg_23_1.time_ - var_26_11) / var_26_12

				if arg_23_1.var_.characterEffect1084ui_story then
					arg_23_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_11 + var_26_12 and arg_23_1.time_ < var_26_11 + var_26_12 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				arg_23_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_26_16 = 0
			local var_26_17 = 0.625

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_18 = arg_23_1:FormatText(StoryNameCfg[6].name)

				arg_23_1.leftNameTxt_.text = var_26_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_19 = arg_23_1:GetWordFromCfg(319341005)
				local var_26_20 = arg_23_1:FormatText(var_26_19.content)

				arg_23_1.text_.text = var_26_20

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_21 = 25
				local var_26_22 = utf8.len(var_26_20)
				local var_26_23 = var_26_21 <= 0 and var_26_17 or var_26_17 * (var_26_22 / var_26_21)

				if var_26_23 > 0 and var_26_17 < var_26_23 then
					arg_23_1.talkMaxDuration = var_26_23

					if var_26_23 + var_26_16 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_16
					end
				end

				arg_23_1.text_.text = var_26_20
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341005", "story_v_out_319341.awb") ~= 0 then
					local var_26_24 = manager.audio:GetVoiceLength("story_v_out_319341", "319341005", "story_v_out_319341.awb") / 1000

					if var_26_24 + var_26_16 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_24 + var_26_16
					end

					if var_26_19.prefab_name ~= "" and arg_23_1.actors_[var_26_19.prefab_name] ~= nil then
						local var_26_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_19.prefab_name].transform, "story_v_out_319341", "319341005", "story_v_out_319341.awb")

						arg_23_1:RecordAudio("319341005", var_26_25)
						arg_23_1:RecordAudio("319341005", var_26_25)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319341", "319341005", "story_v_out_319341.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319341", "319341005", "story_v_out_319341.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_26 = math.max(var_26_17, arg_23_1.talkMaxDuration)

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_26 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_16) / var_26_26

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_16 + var_26_26 and arg_23_1.time_ < var_26_16 + var_26_26 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319341006 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319341006
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319341007(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1084ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story == nil then
				arg_27_1.var_.characterEffect1084ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1084ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1084ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1084ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 1.15

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

				local var_30_8 = arg_27_1:GetWordFromCfg(319341006)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 46
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
	Play319341007 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319341007
		arg_31_1.duration_ = 8.833

		local var_31_0 = {
			zh = 5.133,
			ja = 8.833
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
				arg_31_0:Play319341008(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.5

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[701].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(319341007)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341007", "story_v_out_319341.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341007", "story_v_out_319341.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_319341", "319341007", "story_v_out_319341.awb")

						arg_31_1:RecordAudio("319341007", var_34_9)
						arg_31_1:RecordAudio("319341007", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319341", "319341007", "story_v_out_319341.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319341", "319341007", "story_v_out_319341.awb")
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
	Play319341008 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319341008
		arg_35_1.duration_ = 10.8

		local var_35_0 = {
			zh = 6.466,
			ja = 10.8
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
				arg_35_0:Play319341009(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.75

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[701].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(319341008)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341008", "story_v_out_319341.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341008", "story_v_out_319341.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_319341", "319341008", "story_v_out_319341.awb")

						arg_35_1:RecordAudio("319341008", var_38_9)
						arg_35_1:RecordAudio("319341008", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319341", "319341008", "story_v_out_319341.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319341", "319341008", "story_v_out_319341.awb")
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
	Play319341009 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319341009
		arg_39_1.duration_ = 7.86666666666667

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play319341010(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1084ui_story"].transform
			local var_42_1 = 1.39933333148559

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1084ui_story = var_42_0.localPosition

				local var_42_2 = "1084ui_story"

				arg_39_1:ShowWeapon(arg_39_1.var_[var_42_2 .. "Animator"].transform, false)
			end

			local var_42_3 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_3 then
				local var_42_4 = (arg_39_1.time_ - var_42_1) / var_42_3
				local var_42_5 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1084ui_story, var_42_5, var_42_4)

				local var_42_6 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_6.x, var_42_6.y, var_42_6.z)

				local var_42_7 = var_42_0.localEulerAngles

				var_42_7.z = 0
				var_42_7.x = 0
				var_42_0.localEulerAngles = var_42_7
			end

			if arg_39_1.time_ >= var_42_1 + var_42_3 and arg_39_1.time_ < var_42_1 + var_42_3 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, 100, 0)

				local var_42_8 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_8.x, var_42_8.y, var_42_8.z)

				local var_42_9 = var_42_0.localEulerAngles

				var_42_9.z = 0
				var_42_9.x = 0
				var_42_0.localEulerAngles = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_11 = 1.43333333333333

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11
				local var_42_13 = Color.New(0, 0, 0)

				var_42_13.a = Mathf.Lerp(0, 1, var_42_12)
				arg_39_1.mask_.color = var_42_13
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 then
				local var_42_14 = Color.New(0, 0, 0)

				var_42_14.a = 1
				arg_39_1.mask_.color = var_42_14
			end

			local var_42_15 = 1.43333333333333

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_16 = 1.43333333333333

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_15) / var_42_16
				local var_42_18 = Color.New(0, 0, 0)

				var_42_18.a = Mathf.Lerp(1, 0, var_42_17)
				arg_39_1.mask_.color = var_42_18
			end

			if arg_39_1.time_ >= var_42_15 + var_42_16 and arg_39_1.time_ < var_42_15 + var_42_16 + arg_42_0 then
				local var_42_19 = Color.New(0, 0, 0)
				local var_42_20 = 0

				arg_39_1.mask_.enabled = false
				var_42_19.a = var_42_20
				arg_39_1.mask_.color = var_42_19
			end

			local var_42_21 = 1.43333333333333

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 then
				local var_42_22 = manager.ui.mainCamera.transform.localPosition
				local var_42_23 = Vector3.New(0, 0, 10) + Vector3.New(var_42_22.x, var_42_22.y, 0)
				local var_42_24 = arg_39_1.bgs_.I11o

				var_42_24.transform.localPosition = var_42_23
				var_42_24.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_25 = var_42_24:GetComponent("SpriteRenderer")

				if var_42_25 and var_42_25.sprite then
					local var_42_26 = (var_42_24.transform.localPosition - var_42_22).z
					local var_42_27 = manager.ui.mainCameraCom_
					local var_42_28 = 2 * var_42_26 * Mathf.Tan(var_42_27.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_29 = var_42_28 * var_42_27.aspect
					local var_42_30 = var_42_25.sprite.bounds.size.x
					local var_42_31 = var_42_25.sprite.bounds.size.y
					local var_42_32 = var_42_29 / var_42_30
					local var_42_33 = var_42_28 / var_42_31
					local var_42_34 = var_42_33 < var_42_32 and var_42_32 or var_42_33

					var_42_24.transform.localScale = Vector3.New(var_42_34, var_42_34, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "I11o" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_39_1.frameCnt_ <= 1 then
				arg_39_1.dialog_:SetActive(false)
			end

			local var_42_35 = 2.86666666666667
			local var_42_36 = 0.975

			if var_42_35 < arg_39_1.time_ and arg_39_1.time_ <= var_42_35 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_37 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_37:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_38 = arg_39_1:GetWordFromCfg(319341009)
				local var_42_39 = arg_39_1:FormatText(var_42_38.content)

				arg_39_1.text_.text = var_42_39

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_40 = 39
				local var_42_41 = utf8.len(var_42_39)
				local var_42_42 = var_42_40 <= 0 and var_42_36 or var_42_36 * (var_42_41 / var_42_40)

				if var_42_42 > 0 and var_42_36 < var_42_42 then
					arg_39_1.talkMaxDuration = var_42_42
					var_42_35 = var_42_35 + 0.3

					if var_42_42 + var_42_35 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_42 + var_42_35
					end
				end

				arg_39_1.text_.text = var_42_39
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_43 = var_42_35 + 0.3
			local var_42_44 = math.max(var_42_36, arg_39_1.talkMaxDuration)

			if var_42_43 <= arg_39_1.time_ and arg_39_1.time_ < var_42_43 + var_42_44 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_43) / var_42_44

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_43 + var_42_44 and arg_39_1.time_ < var_42_43 + var_42_44 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319341010 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319341010
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play319341011(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.95

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_2 = arg_45_1:GetWordFromCfg(319341010)
				local var_48_3 = arg_45_1:FormatText(var_48_2.content)

				arg_45_1.text_.text = var_48_3

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_4 = 38
				local var_48_5 = utf8.len(var_48_3)
				local var_48_6 = var_48_4 <= 0 and var_48_1 or var_48_1 * (var_48_5 / var_48_4)

				if var_48_6 > 0 and var_48_1 < var_48_6 then
					arg_45_1.talkMaxDuration = var_48_6

					if var_48_6 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_6 + var_48_0
					end
				end

				arg_45_1.text_.text = var_48_3
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_7 = math.max(var_48_1, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_7 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_0) / var_48_7

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_7 and arg_45_1.time_ < var_48_0 + var_48_7 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319341011 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319341011
		arg_49_1.duration_ = 10.466

		local var_49_0 = {
			zh = 4.533,
			ja = 10.466
		}
		local var_49_1 = manager.audio:GetLocalizationFlag()

		if var_49_0[var_49_1] ~= nil then
			arg_49_1.duration_ = var_49_0[var_49_1]
		end

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play319341012(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1084ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1084ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(0, -0.97, -6)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1084ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = arg_49_1.actors_["1084ui_story"]
			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_11 = 0.200000002980232

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_11 then
				local var_52_12 = (arg_49_1.time_ - var_52_10) / var_52_11

				if arg_49_1.var_.characterEffect1084ui_story then
					arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_10 + var_52_11 and arg_49_1.time_ < var_52_10 + var_52_11 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story then
				arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_52_13 = 0

			if var_52_13 < arg_49_1.time_ and arg_49_1.time_ <= var_52_13 + arg_52_0 then
				arg_49_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_52_14 = 0

			if var_52_14 < arg_49_1.time_ and arg_49_1.time_ <= var_52_14 + arg_52_0 then
				arg_49_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_52_15 = 0
			local var_52_16 = 0.5

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_17 = arg_49_1:FormatText(StoryNameCfg[6].name)

				arg_49_1.leftNameTxt_.text = var_52_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_18 = arg_49_1:GetWordFromCfg(319341011)
				local var_52_19 = arg_49_1:FormatText(var_52_18.content)

				arg_49_1.text_.text = var_52_19

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_20 = 20
				local var_52_21 = utf8.len(var_52_19)
				local var_52_22 = var_52_20 <= 0 and var_52_16 or var_52_16 * (var_52_21 / var_52_20)

				if var_52_22 > 0 and var_52_16 < var_52_22 then
					arg_49_1.talkMaxDuration = var_52_22

					if var_52_22 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_22 + var_52_15
					end
				end

				arg_49_1.text_.text = var_52_19
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341011", "story_v_out_319341.awb") ~= 0 then
					local var_52_23 = manager.audio:GetVoiceLength("story_v_out_319341", "319341011", "story_v_out_319341.awb") / 1000

					if var_52_23 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_23 + var_52_15
					end

					if var_52_18.prefab_name ~= "" and arg_49_1.actors_[var_52_18.prefab_name] ~= nil then
						local var_52_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_18.prefab_name].transform, "story_v_out_319341", "319341011", "story_v_out_319341.awb")

						arg_49_1:RecordAudio("319341011", var_52_24)
						arg_49_1:RecordAudio("319341011", var_52_24)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_319341", "319341011", "story_v_out_319341.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_319341", "319341011", "story_v_out_319341.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_25 = math.max(var_52_16, arg_49_1.talkMaxDuration)

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_25 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_15) / var_52_25

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_15 + var_52_25 and arg_49_1.time_ < var_52_15 + var_52_25 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play319341012 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319341012
		arg_53_1.duration_ = 6.1

		local var_53_0 = {
			zh = 2.166,
			ja = 6.1
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
				arg_53_0:Play319341013(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.325

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[6].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(319341012)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 13
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341012", "story_v_out_319341.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341012", "story_v_out_319341.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_319341", "319341012", "story_v_out_319341.awb")

						arg_53_1:RecordAudio("319341012", var_56_9)
						arg_53_1:RecordAudio("319341012", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319341", "319341012", "story_v_out_319341.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319341", "319341012", "story_v_out_319341.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_10 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_10 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_10

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_10 and arg_53_1.time_ < var_56_0 + var_56_10 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319341013 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319341013
		arg_57_1.duration_ = 6.65

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play319341014(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1084ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect1084ui_story == nil then
				arg_57_1.var_.characterEffect1084ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.200000002980232

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1084ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1084ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect1084ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1084ui_story.fillRatio = var_60_5
			end

			local var_60_6 = 1.63333333333333

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				local var_60_7 = manager.ui.mainCamera.transform.localPosition
				local var_60_8 = Vector3.New(0, 0, 10) + Vector3.New(var_60_7.x, var_60_7.y, 0)
				local var_60_9 = arg_57_1.bgs_.I11o

				var_60_9.transform.localPosition = var_60_8
				var_60_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_60_10 = var_60_9:GetComponent("SpriteRenderer")

				if var_60_10 and var_60_10.sprite then
					local var_60_11 = (var_60_9.transform.localPosition - var_60_7).z
					local var_60_12 = manager.ui.mainCameraCom_
					local var_60_13 = 2 * var_60_11 * Mathf.Tan(var_60_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_60_14 = var_60_13 * var_60_12.aspect
					local var_60_15 = var_60_10.sprite.bounds.size.x
					local var_60_16 = var_60_10.sprite.bounds.size.y
					local var_60_17 = var_60_14 / var_60_15
					local var_60_18 = var_60_13 / var_60_16
					local var_60_19 = var_60_18 < var_60_17 and var_60_17 or var_60_18

					var_60_9.transform.localScale = Vector3.New(var_60_19, var_60_19, 0)
				end

				for iter_60_0, iter_60_1 in pairs(arg_57_1.bgs_) do
					if iter_60_0 ~= "I11o" then
						iter_60_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_60_20 = 0

			if var_60_20 < arg_57_1.time_ and arg_57_1.time_ <= var_60_20 + arg_60_0 then
				arg_57_1.mask_.enabled = true
				arg_57_1.mask_.raycastTarget = true

				arg_57_1:SetGaussion(false)
			end

			local var_60_21 = 1.63333333333333

			if var_60_20 <= arg_57_1.time_ and arg_57_1.time_ < var_60_20 + var_60_21 then
				local var_60_22 = (arg_57_1.time_ - var_60_20) / var_60_21
				local var_60_23 = Color.New(0, 0, 0)

				var_60_23.a = Mathf.Lerp(0, 1, var_60_22)
				arg_57_1.mask_.color = var_60_23
			end

			if arg_57_1.time_ >= var_60_20 + var_60_21 and arg_57_1.time_ < var_60_20 + var_60_21 + arg_60_0 then
				local var_60_24 = Color.New(0, 0, 0)

				var_60_24.a = 1
				arg_57_1.mask_.color = var_60_24
			end

			local var_60_25 = 1.63333333333333

			if var_60_25 < arg_57_1.time_ and arg_57_1.time_ <= var_60_25 + arg_60_0 then
				arg_57_1.mask_.enabled = true
				arg_57_1.mask_.raycastTarget = true

				arg_57_1:SetGaussion(false)
			end

			local var_60_26 = 2

			if var_60_25 <= arg_57_1.time_ and arg_57_1.time_ < var_60_25 + var_60_26 then
				local var_60_27 = (arg_57_1.time_ - var_60_25) / var_60_26
				local var_60_28 = Color.New(0, 0, 0)

				var_60_28.a = Mathf.Lerp(1, 0, var_60_27)
				arg_57_1.mask_.color = var_60_28
			end

			if arg_57_1.time_ >= var_60_25 + var_60_26 and arg_57_1.time_ < var_60_25 + var_60_26 + arg_60_0 then
				local var_60_29 = Color.New(0, 0, 0)
				local var_60_30 = 0

				arg_57_1.mask_.enabled = false
				var_60_29.a = var_60_30
				arg_57_1.mask_.color = var_60_29
			end

			local var_60_31 = arg_57_1.actors_["1084ui_story"].transform
			local var_60_32 = 1.63333333333333

			if var_60_32 < arg_57_1.time_ and arg_57_1.time_ <= var_60_32 + arg_60_0 then
				arg_57_1.var_.moveOldPos1084ui_story = var_60_31.localPosition
			end

			local var_60_33 = 0.001

			if var_60_32 <= arg_57_1.time_ and arg_57_1.time_ < var_60_32 + var_60_33 then
				local var_60_34 = (arg_57_1.time_ - var_60_32) / var_60_33
				local var_60_35 = Vector3.New(0, 100, 0)

				var_60_31.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1084ui_story, var_60_35, var_60_34)

				local var_60_36 = manager.ui.mainCamera.transform.position - var_60_31.position

				var_60_31.forward = Vector3.New(var_60_36.x, var_60_36.y, var_60_36.z)

				local var_60_37 = var_60_31.localEulerAngles

				var_60_37.z = 0
				var_60_37.x = 0
				var_60_31.localEulerAngles = var_60_37
			end

			if arg_57_1.time_ >= var_60_32 + var_60_33 and arg_57_1.time_ < var_60_32 + var_60_33 + arg_60_0 then
				var_60_31.localPosition = Vector3.New(0, 100, 0)

				local var_60_38 = manager.ui.mainCamera.transform.position - var_60_31.position

				var_60_31.forward = Vector3.New(var_60_38.x, var_60_38.y, var_60_38.z)

				local var_60_39 = var_60_31.localEulerAngles

				var_60_39.z = 0
				var_60_39.x = 0
				var_60_31.localEulerAngles = var_60_39
			end

			local var_60_40 = 1.65
			local var_60_41 = 1.125

			if var_60_40 < arg_57_1.time_ and arg_57_1.time_ <= var_60_40 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_42 = arg_57_1:GetWordFromCfg(319341013)
				local var_60_43 = arg_57_1:FormatText(var_60_42.content)

				arg_57_1.text_.text = var_60_43

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_44 = 45
				local var_60_45 = utf8.len(var_60_43)
				local var_60_46 = var_60_44 <= 0 and var_60_41 or var_60_41 * (var_60_45 / var_60_44)

				if var_60_46 > 0 and var_60_41 < var_60_46 then
					arg_57_1.talkMaxDuration = var_60_46

					if var_60_46 + var_60_40 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_46 + var_60_40
					end
				end

				arg_57_1.text_.text = var_60_43
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_47 = math.max(var_60_41, arg_57_1.talkMaxDuration)

			if var_60_40 <= arg_57_1.time_ and arg_57_1.time_ < var_60_40 + var_60_47 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_40) / var_60_47

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_40 + var_60_47 and arg_57_1.time_ < var_60_40 + var_60_47 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319341014 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319341014
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play319341015(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 1.625

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_2 = arg_61_1:GetWordFromCfg(319341014)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 65
				local var_64_5 = utf8.len(var_64_3)
				local var_64_6 = var_64_4 <= 0 and var_64_1 or var_64_1 * (var_64_5 / var_64_4)

				if var_64_6 > 0 and var_64_1 < var_64_6 then
					arg_61_1.talkMaxDuration = var_64_6

					if var_64_6 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_6 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_3
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_7 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_7 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_7

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_7 and arg_61_1.time_ < var_64_0 + var_64_7 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319341015 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319341015
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play319341016(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.975

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_2 = arg_65_1:GetWordFromCfg(319341015)
				local var_68_3 = arg_65_1:FormatText(var_68_2.content)

				arg_65_1.text_.text = var_68_3

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_4 = 39
				local var_68_5 = utf8.len(var_68_3)
				local var_68_6 = var_68_4 <= 0 and var_68_1 or var_68_1 * (var_68_5 / var_68_4)

				if var_68_6 > 0 and var_68_1 < var_68_6 then
					arg_65_1.talkMaxDuration = var_68_6

					if var_68_6 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_6 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_3
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_7 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_7 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_7

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_7 and arg_65_1.time_ < var_68_0 + var_68_7 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319341016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319341016
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319341017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_1 = 0.666666666666667

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_1 then
				local var_72_2 = (arg_69_1.time_ - var_72_0) / var_72_1
				local var_72_3 = Color.New(0, 0, 0)

				var_72_3.a = Mathf.Lerp(1, 0, var_72_2)
				arg_69_1.mask_.color = var_72_3
			end

			if arg_69_1.time_ >= var_72_0 + var_72_1 and arg_69_1.time_ < var_72_0 + var_72_1 + arg_72_0 then
				local var_72_4 = Color.New(0, 0, 0)
				local var_72_5 = 0

				arg_69_1.mask_.enabled = false
				var_72_4.a = var_72_5
				arg_69_1.mask_.color = var_72_4
			end

			local var_72_6 = manager.ui.mainCamera.transform
			local var_72_7 = 0.366666666666667

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 then
				local var_72_8 = arg_69_1.var_.effect915

				if not var_72_8 then
					var_72_8 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_72_8.name = "915"
					arg_69_1.var_.effect915 = var_72_8
				end

				local var_72_9 = var_72_6:Find("")

				if var_72_9 then
					var_72_8.transform.parent = var_72_9
				else
					var_72_8.transform.parent = var_72_6
				end

				var_72_8.transform.localPosition = Vector3.New(0, 0, 0)
				var_72_8.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_72_10 = 0.533333333333333
			local var_72_11 = 1

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				local var_72_12 = "play"
				local var_72_13 = "music"

				arg_69_1:AudioAction(var_72_12, var_72_13, "", "", "")
			end

			local var_72_14 = 0.366666666666667
			local var_72_15 = 0.6

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				local var_72_16 = "play"
				local var_72_17 = "effect"

				arg_69_1:AudioAction(var_72_16, var_72_17, "se_story_130", "se_story_130_noise", "")
			end

			local var_72_18 = 0
			local var_72_19 = 0.3

			if var_72_18 < arg_69_1.time_ and arg_69_1.time_ <= var_72_18 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_20 = arg_69_1:GetWordFromCfg(319341016)
				local var_72_21 = arg_69_1:FormatText(var_72_20.content)

				arg_69_1.text_.text = var_72_21

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_22 = 12
				local var_72_23 = utf8.len(var_72_21)
				local var_72_24 = var_72_22 <= 0 and var_72_19 or var_72_19 * (var_72_23 / var_72_22)

				if var_72_24 > 0 and var_72_19 < var_72_24 then
					arg_69_1.talkMaxDuration = var_72_24

					if var_72_24 + var_72_18 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_24 + var_72_18
					end
				end

				arg_69_1.text_.text = var_72_21
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_25 = math.max(var_72_19, arg_69_1.talkMaxDuration)

			if var_72_18 <= arg_69_1.time_ and arg_69_1.time_ < var_72_18 + var_72_25 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_18) / var_72_25

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_18 + var_72_25 and arg_69_1.time_ < var_72_18 + var_72_25 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319341017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319341017
		arg_73_1.duration_ = 9.733

		local var_73_0 = {
			zh = 6.166,
			ja = 9.733
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
				arg_73_0:Play319341018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1084ui_story"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos1084ui_story = var_76_0.localPosition
			end

			local var_76_2 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2
				local var_76_4 = Vector3.New(0, -0.97, -6)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1084ui_story, var_76_4, var_76_3)

				local var_76_5 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_5.x, var_76_5.y, var_76_5.z)

				local var_76_6 = var_76_0.localEulerAngles

				var_76_6.z = 0
				var_76_6.x = 0
				var_76_0.localEulerAngles = var_76_6
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_76_7 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_7.x, var_76_7.y, var_76_7.z)

				local var_76_8 = var_76_0.localEulerAngles

				var_76_8.z = 0
				var_76_8.x = 0
				var_76_0.localEulerAngles = var_76_8
			end

			local var_76_9 = arg_73_1.actors_["1084ui_story"]
			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story == nil then
				arg_73_1.var_.characterEffect1084ui_story = var_76_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_11 = 0.200000002980232

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_11 then
				local var_76_12 = (arg_73_1.time_ - var_76_10) / var_76_11

				if arg_73_1.var_.characterEffect1084ui_story then
					arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_10 + var_76_11 and arg_73_1.time_ < var_76_10 + var_76_11 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story then
				arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_76_13 = 0

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 then
				arg_73_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_76_15 = 0
			local var_76_16 = 0.675

			if var_76_15 < arg_73_1.time_ and arg_73_1.time_ <= var_76_15 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_17 = arg_73_1:FormatText(StoryNameCfg[6].name)

				arg_73_1.leftNameTxt_.text = var_76_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_18 = arg_73_1:GetWordFromCfg(319341017)
				local var_76_19 = arg_73_1:FormatText(var_76_18.content)

				arg_73_1.text_.text = var_76_19

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_20 = 27
				local var_76_21 = utf8.len(var_76_19)
				local var_76_22 = var_76_20 <= 0 and var_76_16 or var_76_16 * (var_76_21 / var_76_20)

				if var_76_22 > 0 and var_76_16 < var_76_22 then
					arg_73_1.talkMaxDuration = var_76_22

					if var_76_22 + var_76_15 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_22 + var_76_15
					end
				end

				arg_73_1.text_.text = var_76_19
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341017", "story_v_out_319341.awb") ~= 0 then
					local var_76_23 = manager.audio:GetVoiceLength("story_v_out_319341", "319341017", "story_v_out_319341.awb") / 1000

					if var_76_23 + var_76_15 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_23 + var_76_15
					end

					if var_76_18.prefab_name ~= "" and arg_73_1.actors_[var_76_18.prefab_name] ~= nil then
						local var_76_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_18.prefab_name].transform, "story_v_out_319341", "319341017", "story_v_out_319341.awb")

						arg_73_1:RecordAudio("319341017", var_76_24)
						arg_73_1:RecordAudio("319341017", var_76_24)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319341", "319341017", "story_v_out_319341.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319341", "319341017", "story_v_out_319341.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_25 = math.max(var_76_16, arg_73_1.talkMaxDuration)

			if var_76_15 <= arg_73_1.time_ and arg_73_1.time_ < var_76_15 + var_76_25 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_15) / var_76_25

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_15 + var_76_25 and arg_73_1.time_ < var_76_15 + var_76_25 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319341018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319341018
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play319341019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1084ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1084ui_story == nil then
				arg_77_1.var_.characterEffect1084ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1084ui_story then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1084ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1084ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1084ui_story.fillRatio = var_80_5
			end

			local var_80_6 = 0
			local var_80_7 = 0.65

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_8 = arg_77_1:GetWordFromCfg(319341018)
				local var_80_9 = arg_77_1:FormatText(var_80_8.content)

				arg_77_1.text_.text = var_80_9

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_10 = 26
				local var_80_11 = utf8.len(var_80_9)
				local var_80_12 = var_80_10 <= 0 and var_80_7 or var_80_7 * (var_80_11 / var_80_10)

				if var_80_12 > 0 and var_80_7 < var_80_12 then
					arg_77_1.talkMaxDuration = var_80_12

					if var_80_12 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_12 + var_80_6
					end
				end

				arg_77_1.text_.text = var_80_9
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_13 = math.max(var_80_7, arg_77_1.talkMaxDuration)

			if var_80_6 <= arg_77_1.time_ and arg_77_1.time_ < var_80_6 + var_80_13 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_6) / var_80_13

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_6 + var_80_13 and arg_77_1.time_ < var_80_6 + var_80_13 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319341019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319341019
		arg_81_1.duration_ = 5.7

		local var_81_0 = {
			zh = 2.466,
			ja = 5.7
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
				arg_81_0:Play319341020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.275

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[702].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(319341019)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341019", "story_v_out_319341.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341019", "story_v_out_319341.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_319341", "319341019", "story_v_out_319341.awb")

						arg_81_1:RecordAudio("319341019", var_84_9)
						arg_81_1:RecordAudio("319341019", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_319341", "319341019", "story_v_out_319341.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_319341", "319341019", "story_v_out_319341.awb")
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
	Play319341020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319341020
		arg_85_1.duration_ = 11.3

		local var_85_0 = {
			zh = 5.7,
			ja = 11.3
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play319341021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1084ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story == nil then
				arg_85_1.var_.characterEffect1084ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1084ui_story then
					arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story then
				arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_88_4 = 0
			local var_88_5 = 0.625

			if var_88_4 < arg_85_1.time_ and arg_85_1.time_ <= var_88_4 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_6 = arg_85_1:FormatText(StoryNameCfg[6].name)

				arg_85_1.leftNameTxt_.text = var_88_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_7 = arg_85_1:GetWordFromCfg(319341020)
				local var_88_8 = arg_85_1:FormatText(var_88_7.content)

				arg_85_1.text_.text = var_88_8

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_9 = 25
				local var_88_10 = utf8.len(var_88_8)
				local var_88_11 = var_88_9 <= 0 and var_88_5 or var_88_5 * (var_88_10 / var_88_9)

				if var_88_11 > 0 and var_88_5 < var_88_11 then
					arg_85_1.talkMaxDuration = var_88_11

					if var_88_11 + var_88_4 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_11 + var_88_4
					end
				end

				arg_85_1.text_.text = var_88_8
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341020", "story_v_out_319341.awb") ~= 0 then
					local var_88_12 = manager.audio:GetVoiceLength("story_v_out_319341", "319341020", "story_v_out_319341.awb") / 1000

					if var_88_12 + var_88_4 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_12 + var_88_4
					end

					if var_88_7.prefab_name ~= "" and arg_85_1.actors_[var_88_7.prefab_name] ~= nil then
						local var_88_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_7.prefab_name].transform, "story_v_out_319341", "319341020", "story_v_out_319341.awb")

						arg_85_1:RecordAudio("319341020", var_88_13)
						arg_85_1:RecordAudio("319341020", var_88_13)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_319341", "319341020", "story_v_out_319341.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_319341", "319341020", "story_v_out_319341.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_14 = math.max(var_88_5, arg_85_1.talkMaxDuration)

			if var_88_4 <= arg_85_1.time_ and arg_85_1.time_ < var_88_4 + var_88_14 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_4) / var_88_14

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_4 + var_88_14 and arg_85_1.time_ < var_88_4 + var_88_14 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319341021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319341021
		arg_89_1.duration_ = 10.866

		local var_89_0 = {
			zh = 5.4,
			ja = 10.866
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
				arg_89_0:Play319341022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1084ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1084ui_story == nil then
				arg_89_1.var_.characterEffect1084ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1084ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1084ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1084ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1084ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 0.55

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_8 = arg_89_1:FormatText(StoryNameCfg[702].name)

				arg_89_1.leftNameTxt_.text = var_92_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_9 = arg_89_1:GetWordFromCfg(319341021)
				local var_92_10 = arg_89_1:FormatText(var_92_9.content)

				arg_89_1.text_.text = var_92_10

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_11 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341021", "story_v_out_319341.awb") ~= 0 then
					local var_92_14 = manager.audio:GetVoiceLength("story_v_out_319341", "319341021", "story_v_out_319341.awb") / 1000

					if var_92_14 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_14 + var_92_6
					end

					if var_92_9.prefab_name ~= "" and arg_89_1.actors_[var_92_9.prefab_name] ~= nil then
						local var_92_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_9.prefab_name].transform, "story_v_out_319341", "319341021", "story_v_out_319341.awb")

						arg_89_1:RecordAudio("319341021", var_92_15)
						arg_89_1:RecordAudio("319341021", var_92_15)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_319341", "319341021", "story_v_out_319341.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_319341", "319341021", "story_v_out_319341.awb")
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
	Play319341022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319341022
		arg_93_1.duration_ = 9.2

		local var_93_0 = {
			zh = 4.333,
			ja = 9.2
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
				arg_93_0:Play319341023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1084ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1084ui_story == nil then
				arg_93_1.var_.characterEffect1084ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1084ui_story then
					arg_93_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1084ui_story then
				arg_93_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_96_4 = 0

			if var_96_4 < arg_93_1.time_ and arg_93_1.time_ <= var_96_4 + arg_96_0 then
				arg_93_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_96_5 = 0
			local var_96_6 = 0.475

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_7 = arg_93_1:FormatText(StoryNameCfg[6].name)

				arg_93_1.leftNameTxt_.text = var_96_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_8 = arg_93_1:GetWordFromCfg(319341022)
				local var_96_9 = arg_93_1:FormatText(var_96_8.content)

				arg_93_1.text_.text = var_96_9

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_10 = 19
				local var_96_11 = utf8.len(var_96_9)
				local var_96_12 = var_96_10 <= 0 and var_96_6 or var_96_6 * (var_96_11 / var_96_10)

				if var_96_12 > 0 and var_96_6 < var_96_12 then
					arg_93_1.talkMaxDuration = var_96_12

					if var_96_12 + var_96_5 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_5
					end
				end

				arg_93_1.text_.text = var_96_9
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341022", "story_v_out_319341.awb") ~= 0 then
					local var_96_13 = manager.audio:GetVoiceLength("story_v_out_319341", "319341022", "story_v_out_319341.awb") / 1000

					if var_96_13 + var_96_5 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_13 + var_96_5
					end

					if var_96_8.prefab_name ~= "" and arg_93_1.actors_[var_96_8.prefab_name] ~= nil then
						local var_96_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_8.prefab_name].transform, "story_v_out_319341", "319341022", "story_v_out_319341.awb")

						arg_93_1:RecordAudio("319341022", var_96_14)
						arg_93_1:RecordAudio("319341022", var_96_14)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_319341", "319341022", "story_v_out_319341.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_319341", "319341022", "story_v_out_319341.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_15 = math.max(var_96_6, arg_93_1.talkMaxDuration)

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_15 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_5) / var_96_15

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_5 + var_96_15 and arg_93_1.time_ < var_96_5 + var_96_15 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play319341023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319341023
		arg_97_1.duration_ = 5.466

		local var_97_0 = {
			zh = 5.166,
			ja = 5.466
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
				arg_97_0:Play319341024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.675

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[6].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(319341023)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 27
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341023", "story_v_out_319341.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341023", "story_v_out_319341.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_319341", "319341023", "story_v_out_319341.awb")

						arg_97_1:RecordAudio("319341023", var_100_9)
						arg_97_1:RecordAudio("319341023", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_319341", "319341023", "story_v_out_319341.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_319341", "319341023", "story_v_out_319341.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play319341024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319341024
		arg_101_1.duration_ = 10.4

		local var_101_0 = {
			zh = 10.4,
			ja = 7.4
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
				arg_101_0:Play319341025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1084ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1084ui_story == nil then
				arg_101_1.var_.characterEffect1084ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1084ui_story then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1084ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1084ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1084ui_story.fillRatio = var_104_5
			end

			local var_104_6 = 0
			local var_104_7 = 0.925

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[702].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(319341024)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 37
				local var_104_12 = utf8.len(var_104_10)
				local var_104_13 = var_104_11 <= 0 and var_104_7 or var_104_7 * (var_104_12 / var_104_11)

				if var_104_13 > 0 and var_104_7 < var_104_13 then
					arg_101_1.talkMaxDuration = var_104_13

					if var_104_13 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_13 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_10
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341024", "story_v_out_319341.awb") ~= 0 then
					local var_104_14 = manager.audio:GetVoiceLength("story_v_out_319341", "319341024", "story_v_out_319341.awb") / 1000

					if var_104_14 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_14 + var_104_6
					end

					if var_104_9.prefab_name ~= "" and arg_101_1.actors_[var_104_9.prefab_name] ~= nil then
						local var_104_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_9.prefab_name].transform, "story_v_out_319341", "319341024", "story_v_out_319341.awb")

						arg_101_1:RecordAudio("319341024", var_104_15)
						arg_101_1:RecordAudio("319341024", var_104_15)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_319341", "319341024", "story_v_out_319341.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_319341", "319341024", "story_v_out_319341.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_16 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_16 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_16

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_16 and arg_101_1.time_ < var_104_6 + var_104_16 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play319341025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319341025
		arg_105_1.duration_ = 3.9

		local var_105_0 = {
			zh = 2.366,
			ja = 3.9
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
				arg_105_0:Play319341026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1084ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1084ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0, -0.97, -6)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1084ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1084ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story == nil then
				arg_105_1.var_.characterEffect1084ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1084ui_story then
					arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story then
				arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_108_14 = 0
			local var_108_15 = 0.225

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_16 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_17 = arg_105_1:GetWordFromCfg(319341025)
				local var_108_18 = arg_105_1:FormatText(var_108_17.content)

				arg_105_1.text_.text = var_108_18

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_19 = 9
				local var_108_20 = utf8.len(var_108_18)
				local var_108_21 = var_108_19 <= 0 and var_108_15 or var_108_15 * (var_108_20 / var_108_19)

				if var_108_21 > 0 and var_108_15 < var_108_21 then
					arg_105_1.talkMaxDuration = var_108_21

					if var_108_21 + var_108_14 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_21 + var_108_14
					end
				end

				arg_105_1.text_.text = var_108_18
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341025", "story_v_out_319341.awb") ~= 0 then
					local var_108_22 = manager.audio:GetVoiceLength("story_v_out_319341", "319341025", "story_v_out_319341.awb") / 1000

					if var_108_22 + var_108_14 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_14
					end

					if var_108_17.prefab_name ~= "" and arg_105_1.actors_[var_108_17.prefab_name] ~= nil then
						local var_108_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_17.prefab_name].transform, "story_v_out_319341", "319341025", "story_v_out_319341.awb")

						arg_105_1:RecordAudio("319341025", var_108_23)
						arg_105_1:RecordAudio("319341025", var_108_23)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319341", "319341025", "story_v_out_319341.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319341", "319341025", "story_v_out_319341.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_24 = math.max(var_108_15, arg_105_1.talkMaxDuration)

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_24 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_14) / var_108_24

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_14 + var_108_24 and arg_105_1.time_ < var_108_14 + var_108_24 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319341026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319341026
		arg_109_1.duration_ = 9.2

		local var_109_0 = {
			zh = 9.2,
			ja = 8.766
		}
		local var_109_1 = manager.audio:GetLocalizationFlag()

		if var_109_0[var_109_1] ~= nil then
			arg_109_1.duration_ = var_109_0[var_109_1]
		end

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play319341027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1084ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story == nil then
				arg_109_1.var_.characterEffect1084ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1084ui_story then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 1.15

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_8 = arg_109_1:FormatText(StoryNameCfg[702].name)

				arg_109_1.leftNameTxt_.text = var_112_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_9 = arg_109_1:GetWordFromCfg(319341026)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341026", "story_v_out_319341.awb") ~= 0 then
					local var_112_14 = manager.audio:GetVoiceLength("story_v_out_319341", "319341026", "story_v_out_319341.awb") / 1000

					if var_112_14 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_14 + var_112_6
					end

					if var_112_9.prefab_name ~= "" and arg_109_1.actors_[var_112_9.prefab_name] ~= nil then
						local var_112_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_9.prefab_name].transform, "story_v_out_319341", "319341026", "story_v_out_319341.awb")

						arg_109_1:RecordAudio("319341026", var_112_15)
						arg_109_1:RecordAudio("319341026", var_112_15)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_319341", "319341026", "story_v_out_319341.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_319341", "319341026", "story_v_out_319341.awb")
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
	Play319341027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319341027
		arg_113_1.duration_ = 7.233

		local var_113_0 = {
			zh = 4.7,
			ja = 7.233
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
				arg_113_0:Play319341028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.575

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[702].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(319341027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341027", "story_v_out_319341.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341027", "story_v_out_319341.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_319341", "319341027", "story_v_out_319341.awb")

						arg_113_1:RecordAudio("319341027", var_116_9)
						arg_113_1:RecordAudio("319341027", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319341", "319341027", "story_v_out_319341.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319341", "319341027", "story_v_out_319341.awb")
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
	Play319341028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319341028
		arg_117_1.duration_ = 2.433

		local var_117_0 = {
			zh = 1.999999999999,
			ja = 2.433
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
				arg_117_0:Play319341029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1084ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story == nil then
				arg_117_1.var_.characterEffect1084ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1084ui_story then
					arg_117_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story then
				arg_117_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_120_4 = 0

			if var_120_4 < arg_117_1.time_ and arg_117_1.time_ <= var_120_4 + arg_120_0 then
				arg_117_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_120_6 = 0
			local var_120_7 = 0.075

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[6].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_9 = arg_117_1:GetWordFromCfg(319341028)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 3
				local var_120_12 = utf8.len(var_120_10)
				local var_120_13 = var_120_11 <= 0 and var_120_7 or var_120_7 * (var_120_12 / var_120_11)

				if var_120_13 > 0 and var_120_7 < var_120_13 then
					arg_117_1.talkMaxDuration = var_120_13

					if var_120_13 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_13 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_10
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341028", "story_v_out_319341.awb") ~= 0 then
					local var_120_14 = manager.audio:GetVoiceLength("story_v_out_319341", "319341028", "story_v_out_319341.awb") / 1000

					if var_120_14 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_14 + var_120_6
					end

					if var_120_9.prefab_name ~= "" and arg_117_1.actors_[var_120_9.prefab_name] ~= nil then
						local var_120_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_9.prefab_name].transform, "story_v_out_319341", "319341028", "story_v_out_319341.awb")

						arg_117_1:RecordAudio("319341028", var_120_15)
						arg_117_1:RecordAudio("319341028", var_120_15)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_319341", "319341028", "story_v_out_319341.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_319341", "319341028", "story_v_out_319341.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_16 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_16 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_16

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_16 and arg_117_1.time_ < var_120_6 + var_120_16 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319341029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319341029
		arg_121_1.duration_ = 8.5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play319341030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1084ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story == nil then
				arg_121_1.var_.characterEffect1084ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1084ui_story then
					arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story then
				arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_124_4 = 1.63333333333333

			if var_124_4 < arg_121_1.time_ and arg_121_1.time_ <= var_124_4 + arg_124_0 then
				local var_124_5 = manager.ui.mainCamera.transform.localPosition
				local var_124_6 = Vector3.New(0, 0, 10) + Vector3.New(var_124_5.x, var_124_5.y, 0)
				local var_124_7 = arg_121_1.bgs_.I11o

				var_124_7.transform.localPosition = var_124_6
				var_124_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_124_8 = var_124_7:GetComponent("SpriteRenderer")

				if var_124_8 and var_124_8.sprite then
					local var_124_9 = (var_124_7.transform.localPosition - var_124_5).z
					local var_124_10 = manager.ui.mainCameraCom_
					local var_124_11 = 2 * var_124_9 * Mathf.Tan(var_124_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_124_12 = var_124_11 * var_124_10.aspect
					local var_124_13 = var_124_8.sprite.bounds.size.x
					local var_124_14 = var_124_8.sprite.bounds.size.y
					local var_124_15 = var_124_12 / var_124_13
					local var_124_16 = var_124_11 / var_124_14
					local var_124_17 = var_124_16 < var_124_15 and var_124_15 or var_124_16

					var_124_7.transform.localScale = Vector3.New(var_124_17, var_124_17, 0)
				end

				for iter_124_0, iter_124_1 in pairs(arg_121_1.bgs_) do
					if iter_124_0 ~= "I11o" then
						iter_124_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_124_18 = 0

			if var_124_18 < arg_121_1.time_ and arg_121_1.time_ <= var_124_18 + arg_124_0 then
				arg_121_1.mask_.enabled = true
				arg_121_1.mask_.raycastTarget = true

				arg_121_1:SetGaussion(false)
			end

			local var_124_19 = 1.63333333333333

			if var_124_18 <= arg_121_1.time_ and arg_121_1.time_ < var_124_18 + var_124_19 then
				local var_124_20 = (arg_121_1.time_ - var_124_18) / var_124_19
				local var_124_21 = Color.New(0, 0, 0)

				var_124_21.a = Mathf.Lerp(0, 1, var_124_20)
				arg_121_1.mask_.color = var_124_21
			end

			if arg_121_1.time_ >= var_124_18 + var_124_19 and arg_121_1.time_ < var_124_18 + var_124_19 + arg_124_0 then
				local var_124_22 = Color.New(0, 0, 0)

				var_124_22.a = 1
				arg_121_1.mask_.color = var_124_22
			end

			local var_124_23 = 1.63333333333333

			if var_124_23 < arg_121_1.time_ and arg_121_1.time_ <= var_124_23 + arg_124_0 then
				arg_121_1.mask_.enabled = true
				arg_121_1.mask_.raycastTarget = true

				arg_121_1:SetGaussion(false)
			end

			local var_124_24 = 2

			if var_124_23 <= arg_121_1.time_ and arg_121_1.time_ < var_124_23 + var_124_24 then
				local var_124_25 = (arg_121_1.time_ - var_124_23) / var_124_24
				local var_124_26 = Color.New(0, 0, 0)

				var_124_26.a = Mathf.Lerp(1, 0, var_124_25)
				arg_121_1.mask_.color = var_124_26
			end

			if arg_121_1.time_ >= var_124_23 + var_124_24 and arg_121_1.time_ < var_124_23 + var_124_24 + arg_124_0 then
				local var_124_27 = Color.New(0, 0, 0)
				local var_124_28 = 0

				arg_121_1.mask_.enabled = false
				var_124_27.a = var_124_28
				arg_121_1.mask_.color = var_124_27
			end

			local var_124_29 = arg_121_1.actors_["1084ui_story"].transform
			local var_124_30 = 1.63333333333333

			if var_124_30 < arg_121_1.time_ and arg_121_1.time_ <= var_124_30 + arg_124_0 then
				arg_121_1.var_.moveOldPos1084ui_story = var_124_29.localPosition
			end

			local var_124_31 = 0.001

			if var_124_30 <= arg_121_1.time_ and arg_121_1.time_ < var_124_30 + var_124_31 then
				local var_124_32 = (arg_121_1.time_ - var_124_30) / var_124_31
				local var_124_33 = Vector3.New(0, 100, 0)

				var_124_29.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1084ui_story, var_124_33, var_124_32)

				local var_124_34 = manager.ui.mainCamera.transform.position - var_124_29.position

				var_124_29.forward = Vector3.New(var_124_34.x, var_124_34.y, var_124_34.z)

				local var_124_35 = var_124_29.localEulerAngles

				var_124_35.z = 0
				var_124_35.x = 0
				var_124_29.localEulerAngles = var_124_35
			end

			if arg_121_1.time_ >= var_124_30 + var_124_31 and arg_121_1.time_ < var_124_30 + var_124_31 + arg_124_0 then
				var_124_29.localPosition = Vector3.New(0, 100, 0)

				local var_124_36 = manager.ui.mainCamera.transform.position - var_124_29.position

				var_124_29.forward = Vector3.New(var_124_36.x, var_124_36.y, var_124_36.z)

				local var_124_37 = var_124_29.localEulerAngles

				var_124_37.z = 0
				var_124_37.x = 0
				var_124_29.localEulerAngles = var_124_37
			end

			local var_124_38 = 3.5
			local var_124_39 = 1.1

			if var_124_38 < arg_121_1.time_ and arg_121_1.time_ <= var_124_38 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_40 = arg_121_1:GetWordFromCfg(319341029)
				local var_124_41 = arg_121_1:FormatText(var_124_40.content)

				arg_121_1.text_.text = var_124_41

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_42 = 44
				local var_124_43 = utf8.len(var_124_41)
				local var_124_44 = var_124_42 <= 0 and var_124_39 or var_124_39 * (var_124_43 / var_124_42)

				if var_124_44 > 0 and var_124_39 < var_124_44 then
					arg_121_1.talkMaxDuration = var_124_44

					if var_124_44 + var_124_38 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_44 + var_124_38
					end
				end

				arg_121_1.text_.text = var_124_41
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_45 = math.max(var_124_39, arg_121_1.talkMaxDuration)

			if var_124_38 <= arg_121_1.time_ and arg_121_1.time_ < var_124_38 + var_124_45 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_38) / var_124_45

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_38 + var_124_45 and arg_121_1.time_ < var_124_38 + var_124_45 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319341030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319341030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play319341031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 1.05

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_2 = arg_125_1:GetWordFromCfg(319341030)
				local var_128_3 = arg_125_1:FormatText(var_128_2.content)

				arg_125_1.text_.text = var_128_3

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_4 = 42
				local var_128_5 = utf8.len(var_128_3)
				local var_128_6 = var_128_4 <= 0 and var_128_1 or var_128_1 * (var_128_5 / var_128_4)

				if var_128_6 > 0 and var_128_1 < var_128_6 then
					arg_125_1.talkMaxDuration = var_128_6

					if var_128_6 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_6 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_3
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_7 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_7 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_7

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_7 and arg_125_1.time_ < var_128_0 + var_128_7 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319341031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319341031
		arg_129_1.duration_ = 6.13333333333333

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play319341032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.mask_.enabled = true
				arg_129_1.mask_.raycastTarget = false

				arg_129_1:SetGaussion(false)
			end

			local var_132_1 = 0.733333333333333

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_1 then
				local var_132_2 = (arg_129_1.time_ - var_132_0) / var_132_1
				local var_132_3 = Color.New(1, 1, 1)

				var_132_3.a = Mathf.Lerp(1, 0, var_132_2)
				arg_129_1.mask_.color = var_132_3
			end

			if arg_129_1.time_ >= var_132_0 + var_132_1 and arg_129_1.time_ < var_132_0 + var_132_1 + arg_132_0 then
				local var_132_4 = Color.New(1, 1, 1)
				local var_132_5 = 0

				arg_129_1.mask_.enabled = false
				var_132_4.a = var_132_5
				arg_129_1.mask_.color = var_132_4
			end

			local var_132_6 = 0.733333333333333

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.mask_.enabled = true
				arg_129_1.mask_.raycastTarget = false

				arg_129_1:SetGaussion(false)
			end

			local var_132_7 = 0.833333333333333

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_7 then
				local var_132_8 = (arg_129_1.time_ - var_132_6) / var_132_7
				local var_132_9 = Color.New(1, 1, 1)

				var_132_9.a = Mathf.Lerp(1, 0, var_132_8)
				arg_129_1.mask_.color = var_132_9
			end

			if arg_129_1.time_ >= var_132_6 + var_132_7 and arg_129_1.time_ < var_132_6 + var_132_7 + arg_132_0 then
				local var_132_10 = Color.New(1, 1, 1)
				local var_132_11 = 0

				arg_129_1.mask_.enabled = false
				var_132_10.a = var_132_11
				arg_129_1.mask_.color = var_132_10
			end

			local var_132_12 = manager.ui.mainCamera.transform
			local var_132_13 = 1.33333333333333

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				local var_132_14 = arg_129_1.var_.effect608

				if not var_132_14 then
					var_132_14 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ripple"))
					var_132_14.name = "608"
					arg_129_1.var_.effect608 = var_132_14
				end

				local var_132_15 = var_132_12:Find("")

				if var_132_15 then
					var_132_14.transform.parent = var_132_15
				else
					var_132_14.transform.parent = var_132_12
				end

				var_132_14.transform.localPosition = Vector3.New(0, 0, 0)
				var_132_14.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_132_16 = 1.13333333333333
			local var_132_17 = 1.8

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_18 = arg_129_1:GetWordFromCfg(319341031)
				local var_132_19 = arg_129_1:FormatText(var_132_18.content)

				arg_129_1.text_.text = var_132_19

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_20 = 72
				local var_132_21 = utf8.len(var_132_19)
				local var_132_22 = var_132_20 <= 0 and var_132_17 or var_132_17 * (var_132_21 / var_132_20)

				if var_132_22 > 0 and var_132_17 < var_132_22 then
					arg_129_1.talkMaxDuration = var_132_22

					if var_132_22 + var_132_16 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_22 + var_132_16
					end
				end

				arg_129_1.text_.text = var_132_19
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_23 = math.max(var_132_17, arg_129_1.talkMaxDuration)

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_23 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_16) / var_132_23

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_16 + var_132_23 and arg_129_1.time_ < var_132_16 + var_132_23 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319341032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319341032
		arg_133_1.duration_ = 3.5

		local var_133_0 = {
			zh = 1.999999999999,
			ja = 3.5
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
				arg_133_0:Play319341033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1084ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1084ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, -0.97, -6)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1084ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1084ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story == nil then
				arg_133_1.var_.characterEffect1084ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect1084ui_story then
					arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story then
				arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_136_14 = manager.ui.mainCamera.transform
			local var_136_15 = 0

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				local var_136_16 = arg_133_1.var_.effect608

				if var_136_16 then
					Object.Destroy(var_136_16)

					arg_133_1.var_.effect608 = nil
				end
			end

			local var_136_17 = 0
			local var_136_18 = 0.175

			if var_136_17 < arg_133_1.time_ and arg_133_1.time_ <= var_136_17 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_19 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_20 = arg_133_1:GetWordFromCfg(319341032)
				local var_136_21 = arg_133_1:FormatText(var_136_20.content)

				arg_133_1.text_.text = var_136_21

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_22 = 7
				local var_136_23 = utf8.len(var_136_21)
				local var_136_24 = var_136_22 <= 0 and var_136_18 or var_136_18 * (var_136_23 / var_136_22)

				if var_136_24 > 0 and var_136_18 < var_136_24 then
					arg_133_1.talkMaxDuration = var_136_24

					if var_136_24 + var_136_17 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_24 + var_136_17
					end
				end

				arg_133_1.text_.text = var_136_21
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341032", "story_v_out_319341.awb") ~= 0 then
					local var_136_25 = manager.audio:GetVoiceLength("story_v_out_319341", "319341032", "story_v_out_319341.awb") / 1000

					if var_136_25 + var_136_17 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_25 + var_136_17
					end

					if var_136_20.prefab_name ~= "" and arg_133_1.actors_[var_136_20.prefab_name] ~= nil then
						local var_136_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_20.prefab_name].transform, "story_v_out_319341", "319341032", "story_v_out_319341.awb")

						arg_133_1:RecordAudio("319341032", var_136_26)
						arg_133_1:RecordAudio("319341032", var_136_26)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319341", "319341032", "story_v_out_319341.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319341", "319341032", "story_v_out_319341.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_27 = math.max(var_136_18, arg_133_1.talkMaxDuration)

			if var_136_17 <= arg_133_1.time_ and arg_133_1.time_ < var_136_17 + var_136_27 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_17) / var_136_27

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_17 + var_136_27 and arg_133_1.time_ < var_136_17 + var_136_27 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319341033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319341033
		arg_137_1.duration_ = 7.33333333333333

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play319341034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1084ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story == nil then
				arg_137_1.var_.characterEffect1084ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1084ui_story then
					arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story then
				arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_140_4 = "STblack"

			if arg_137_1.bgs_[var_140_4] == nil then
				local var_140_5 = Object.Instantiate(arg_137_1.paintGo_)

				var_140_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_140_4)
				var_140_5.name = var_140_4
				var_140_5.transform.parent = arg_137_1.stage_.transform
				var_140_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_137_1.bgs_[var_140_4] = var_140_5
			end

			local var_140_6 = 1.63333333333333

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				local var_140_7 = manager.ui.mainCamera.transform.localPosition
				local var_140_8 = Vector3.New(0, 0, 10) + Vector3.New(var_140_7.x, var_140_7.y, 0)
				local var_140_9 = arg_137_1.bgs_.STblack

				var_140_9.transform.localPosition = var_140_8
				var_140_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_140_10 = var_140_9:GetComponent("SpriteRenderer")

				if var_140_10 and var_140_10.sprite then
					local var_140_11 = (var_140_9.transform.localPosition - var_140_7).z
					local var_140_12 = manager.ui.mainCameraCom_
					local var_140_13 = 2 * var_140_11 * Mathf.Tan(var_140_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_140_14 = var_140_13 * var_140_12.aspect
					local var_140_15 = var_140_10.sprite.bounds.size.x
					local var_140_16 = var_140_10.sprite.bounds.size.y
					local var_140_17 = var_140_14 / var_140_15
					local var_140_18 = var_140_13 / var_140_16
					local var_140_19 = var_140_18 < var_140_17 and var_140_17 or var_140_18

					var_140_9.transform.localScale = Vector3.New(var_140_19, var_140_19, 0)
				end

				for iter_140_0, iter_140_1 in pairs(arg_137_1.bgs_) do
					if iter_140_0 ~= "STblack" then
						iter_140_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_140_20 = 0

			if var_140_20 < arg_137_1.time_ and arg_137_1.time_ <= var_140_20 + arg_140_0 then
				arg_137_1.mask_.enabled = true
				arg_137_1.mask_.raycastTarget = true

				arg_137_1:SetGaussion(false)
			end

			local var_140_21 = 1.63333333333333

			if var_140_20 <= arg_137_1.time_ and arg_137_1.time_ < var_140_20 + var_140_21 then
				local var_140_22 = (arg_137_1.time_ - var_140_20) / var_140_21
				local var_140_23 = Color.New(0, 0, 0)

				var_140_23.a = Mathf.Lerp(0, 1, var_140_22)
				arg_137_1.mask_.color = var_140_23
			end

			if arg_137_1.time_ >= var_140_20 + var_140_21 and arg_137_1.time_ < var_140_20 + var_140_21 + arg_140_0 then
				local var_140_24 = Color.New(0, 0, 0)

				var_140_24.a = 1
				arg_137_1.mask_.color = var_140_24
			end

			local var_140_25 = 1.63333333333333

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 then
				arg_137_1.mask_.enabled = true
				arg_137_1.mask_.raycastTarget = true

				arg_137_1:SetGaussion(false)
			end

			local var_140_26 = 2

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				local var_140_27 = (arg_137_1.time_ - var_140_25) / var_140_26
				local var_140_28 = Color.New(0, 0, 0)

				var_140_28.a = Mathf.Lerp(1, 0, var_140_27)
				arg_137_1.mask_.color = var_140_28
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 then
				local var_140_29 = Color.New(0, 0, 0)
				local var_140_30 = 0

				arg_137_1.mask_.enabled = false
				var_140_29.a = var_140_30
				arg_137_1.mask_.color = var_140_29
			end

			local var_140_31 = arg_137_1.actors_["1084ui_story"].transform
			local var_140_32 = 1.63333333333333

			if var_140_32 < arg_137_1.time_ and arg_137_1.time_ <= var_140_32 + arg_140_0 then
				arg_137_1.var_.moveOldPos1084ui_story = var_140_31.localPosition
			end

			local var_140_33 = 0.001

			if var_140_32 <= arg_137_1.time_ and arg_137_1.time_ < var_140_32 + var_140_33 then
				local var_140_34 = (arg_137_1.time_ - var_140_32) / var_140_33
				local var_140_35 = Vector3.New(0, 100, 0)

				var_140_31.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1084ui_story, var_140_35, var_140_34)

				local var_140_36 = manager.ui.mainCamera.transform.position - var_140_31.position

				var_140_31.forward = Vector3.New(var_140_36.x, var_140_36.y, var_140_36.z)

				local var_140_37 = var_140_31.localEulerAngles

				var_140_37.z = 0
				var_140_37.x = 0
				var_140_31.localEulerAngles = var_140_37
			end

			if arg_137_1.time_ >= var_140_32 + var_140_33 and arg_137_1.time_ < var_140_32 + var_140_33 + arg_140_0 then
				var_140_31.localPosition = Vector3.New(0, 100, 0)

				local var_140_38 = manager.ui.mainCamera.transform.position - var_140_31.position

				var_140_31.forward = Vector3.New(var_140_38.x, var_140_38.y, var_140_38.z)

				local var_140_39 = var_140_31.localEulerAngles

				var_140_39.z = 0
				var_140_39.x = 0
				var_140_31.localEulerAngles = var_140_39
			end

			local var_140_40 = 2.33333333333333
			local var_140_41 = 1.3

			if var_140_40 < arg_137_1.time_ and arg_137_1.time_ <= var_140_40 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_42 = arg_137_1:GetWordFromCfg(319341033)
				local var_140_43 = arg_137_1:FormatText(var_140_42.content)

				arg_137_1.text_.text = var_140_43

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_44 = 52
				local var_140_45 = utf8.len(var_140_43)
				local var_140_46 = var_140_44 <= 0 and var_140_41 or var_140_41 * (var_140_45 / var_140_44)

				if var_140_46 > 0 and var_140_41 < var_140_46 then
					arg_137_1.talkMaxDuration = var_140_46

					if var_140_46 + var_140_40 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_46 + var_140_40
					end
				end

				arg_137_1.text_.text = var_140_43
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_47 = math.max(var_140_41, arg_137_1.talkMaxDuration)

			if var_140_40 <= arg_137_1.time_ and arg_137_1.time_ < var_140_40 + var_140_47 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_40) / var_140_47

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_40 + var_140_47 and arg_137_1.time_ < var_140_40 + var_140_47 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319341034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319341034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play319341035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1.725

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0

				arg_141_1.dialog_:SetActive(true)

				local var_144_2 = LeanTween.value(arg_141_1.dialog_, 0, 1, 0.3)

				var_144_2:setOnUpdate(LuaHelper.FloatAction(function(arg_145_0)
					arg_141_1.dialogCg_.alpha = arg_145_0
				end))
				var_144_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_141_1.dialog_)
					var_144_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_141_1.duration_ = arg_141_1.duration_ + 0.3

				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(319341034)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 67
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7
					var_144_0 = var_144_0 + 0.3

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_8 = var_144_0 + 0.3
			local var_144_9 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_9 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_8) / var_144_9

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_8 + var_144_9 and arg_141_1.time_ < var_144_8 + var_144_9 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319341035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319341035
		arg_147_1.duration_ = 6.26666666666667

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play319341036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = manager.ui.mainCamera.transform
			local var_150_1 = 0.366666666666667

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				local var_150_2 = arg_147_1.var_.effect147147147147

				if not var_150_2 then
					var_150_2 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_150_2.name = "147147"
					arg_147_1.var_.effect147147147147 = var_150_2
				end

				local var_150_3 = var_150_0:Find("")

				if var_150_3 then
					var_150_2.transform.parent = var_150_3
				else
					var_150_2.transform.parent = var_150_0
				end

				var_150_2.transform.localPosition = Vector3.New(0, 0, 0)
				var_150_2.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_150_4 = 0

			if var_150_4 < arg_147_1.time_ and arg_147_1.time_ <= var_150_4 + arg_150_0 then
				arg_147_1.mask_.enabled = true
				arg_147_1.mask_.raycastTarget = false

				arg_147_1:SetGaussion(false)
			end

			local var_150_5 = 0.366666666666667

			if var_150_4 <= arg_147_1.time_ and arg_147_1.time_ < var_150_4 + var_150_5 then
				local var_150_6 = (arg_147_1.time_ - var_150_4) / var_150_5
				local var_150_7 = Color.New(1, 1, 1)

				var_150_7.a = Mathf.Lerp(1, 0, var_150_6)
				arg_147_1.mask_.color = var_150_7
			end

			if arg_147_1.time_ >= var_150_4 + var_150_5 and arg_147_1.time_ < var_150_4 + var_150_5 + arg_150_0 then
				local var_150_8 = Color.New(1, 1, 1)
				local var_150_9 = 0

				arg_147_1.mask_.enabled = false
				var_150_8.a = var_150_9
				arg_147_1.mask_.color = var_150_8
			end

			local var_150_10 = 1.26666666666667
			local var_150_11 = 1

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_12 = arg_147_1:GetWordFromCfg(319341035)
				local var_150_13 = arg_147_1:FormatText(var_150_12.content)

				arg_147_1.text_.text = var_150_13

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_14 = 40
				local var_150_15 = utf8.len(var_150_13)
				local var_150_16 = var_150_14 <= 0 and var_150_11 or var_150_11 * (var_150_15 / var_150_14)

				if var_150_16 > 0 and var_150_11 < var_150_16 then
					arg_147_1.talkMaxDuration = var_150_16

					if var_150_16 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_16 + var_150_10
					end
				end

				arg_147_1.text_.text = var_150_13
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_17 = math.max(var_150_11, arg_147_1.talkMaxDuration)

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_17 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_10) / var_150_17

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_10 + var_150_17 and arg_147_1.time_ < var_150_10 + var_150_17 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319341036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319341036
		arg_151_1.duration_ = 1.033

		local var_151_0 = {
			zh = 1,
			ja = 1.033
		}
		local var_151_1 = manager.audio:GetLocalizationFlag()

		if var_151_0[var_151_1] ~= nil then
			arg_151_1.duration_ = var_151_0[var_151_1]
		end

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play319341037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1084ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1084ui_story == nil then
				arg_151_1.var_.characterEffect1084ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1084ui_story then
					arg_151_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1084ui_story then
				arg_151_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_154_4 = 0
			local var_154_5 = 0.05

			if var_154_4 < arg_151_1.time_ and arg_151_1.time_ <= var_154_4 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_6 = arg_151_1:FormatText(StoryNameCfg[6].name)

				arg_151_1.leftNameTxt_.text = var_154_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_7 = arg_151_1:GetWordFromCfg(319341036)
				local var_154_8 = arg_151_1:FormatText(var_154_7.content)

				arg_151_1.text_.text = var_154_8

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_9 = 2
				local var_154_10 = utf8.len(var_154_8)
				local var_154_11 = var_154_9 <= 0 and var_154_5 or var_154_5 * (var_154_10 / var_154_9)

				if var_154_11 > 0 and var_154_5 < var_154_11 then
					arg_151_1.talkMaxDuration = var_154_11

					if var_154_11 + var_154_4 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_11 + var_154_4
					end
				end

				arg_151_1.text_.text = var_154_8
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341036", "story_v_out_319341.awb") ~= 0 then
					local var_154_12 = manager.audio:GetVoiceLength("story_v_out_319341", "319341036", "story_v_out_319341.awb") / 1000

					if var_154_12 + var_154_4 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_12 + var_154_4
					end

					if var_154_7.prefab_name ~= "" and arg_151_1.actors_[var_154_7.prefab_name] ~= nil then
						local var_154_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_7.prefab_name].transform, "story_v_out_319341", "319341036", "story_v_out_319341.awb")

						arg_151_1:RecordAudio("319341036", var_154_13)
						arg_151_1:RecordAudio("319341036", var_154_13)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_319341", "319341036", "story_v_out_319341.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_319341", "319341036", "story_v_out_319341.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_14 = math.max(var_154_5, arg_151_1.talkMaxDuration)

			if var_154_4 <= arg_151_1.time_ and arg_151_1.time_ < var_154_4 + var_154_14 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_4) / var_154_14

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_4 + var_154_14 and arg_151_1.time_ < var_154_4 + var_154_14 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319341037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319341037
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play319341038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.1

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_2 = arg_155_1:GetWordFromCfg(319341037)
				local var_158_3 = arg_155_1:FormatText(var_158_2.content)

				arg_155_1.text_.text = var_158_3

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_4 = 44
				local var_158_5 = utf8.len(var_158_3)
				local var_158_6 = var_158_4 <= 0 and var_158_1 or var_158_1 * (var_158_5 / var_158_4)

				if var_158_6 > 0 and var_158_1 < var_158_6 then
					arg_155_1.talkMaxDuration = var_158_6

					if var_158_6 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_6 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_3
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_7 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_7 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_7

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_7 and arg_155_1.time_ < var_158_0 + var_158_7 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play319341038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319341038
		arg_159_1.duration_ = 6

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play319341039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				local var_162_2 = "play"
				local var_162_3 = "effect"

				arg_159_1:AudioAction(var_162_2, var_162_3, "se_story_128", "se_story_128_fall", "")
			end

			local var_162_4 = 1

			if var_162_4 < arg_159_1.time_ and arg_159_1.time_ <= var_162_4 + arg_162_0 then
				local var_162_5 = manager.ui.mainCamera.transform.localPosition
				local var_162_6 = Vector3.New(0, 0, 10) + Vector3.New(var_162_5.x, var_162_5.y, 0)
				local var_162_7 = arg_159_1.bgs_.I11o

				var_162_7.transform.localPosition = var_162_6
				var_162_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_162_8 = var_162_7:GetComponent("SpriteRenderer")

				if var_162_8 and var_162_8.sprite then
					local var_162_9 = (var_162_7.transform.localPosition - var_162_5).z
					local var_162_10 = manager.ui.mainCameraCom_
					local var_162_11 = 2 * var_162_9 * Mathf.Tan(var_162_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_162_12 = var_162_11 * var_162_10.aspect
					local var_162_13 = var_162_8.sprite.bounds.size.x
					local var_162_14 = var_162_8.sprite.bounds.size.y
					local var_162_15 = var_162_12 / var_162_13
					local var_162_16 = var_162_11 / var_162_14
					local var_162_17 = var_162_16 < var_162_15 and var_162_15 or var_162_16

					var_162_7.transform.localScale = Vector3.New(var_162_17, var_162_17, 0)
				end

				for iter_162_0, iter_162_1 in pairs(arg_159_1.bgs_) do
					if iter_162_0 ~= "I11o" then
						iter_162_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_162_18 = 0

			if var_162_18 < arg_159_1.time_ and arg_159_1.time_ <= var_162_18 + arg_162_0 then
				arg_159_1.mask_.enabled = true
				arg_159_1.mask_.raycastTarget = true

				arg_159_1:SetGaussion(false)
			end

			local var_162_19 = 1

			if var_162_18 <= arg_159_1.time_ and arg_159_1.time_ < var_162_18 + var_162_19 then
				local var_162_20 = (arg_159_1.time_ - var_162_18) / var_162_19
				local var_162_21 = Color.New(0, 0, 0)

				var_162_21.a = Mathf.Lerp(0, 1, var_162_20)
				arg_159_1.mask_.color = var_162_21
			end

			if arg_159_1.time_ >= var_162_18 + var_162_19 and arg_159_1.time_ < var_162_18 + var_162_19 + arg_162_0 then
				local var_162_22 = Color.New(0, 0, 0)

				var_162_22.a = 1
				arg_159_1.mask_.color = var_162_22
			end

			local var_162_23 = 1

			if var_162_23 < arg_159_1.time_ and arg_159_1.time_ <= var_162_23 + arg_162_0 then
				arg_159_1.mask_.enabled = true
				arg_159_1.mask_.raycastTarget = true

				arg_159_1:SetGaussion(false)
			end

			local var_162_24 = 2

			if var_162_23 <= arg_159_1.time_ and arg_159_1.time_ < var_162_23 + var_162_24 then
				local var_162_25 = (arg_159_1.time_ - var_162_23) / var_162_24
				local var_162_26 = Color.New(0, 0, 0)

				var_162_26.a = Mathf.Lerp(1, 0, var_162_25)
				arg_159_1.mask_.color = var_162_26
			end

			if arg_159_1.time_ >= var_162_23 + var_162_24 and arg_159_1.time_ < var_162_23 + var_162_24 + arg_162_0 then
				local var_162_27 = Color.New(0, 0, 0)
				local var_162_28 = 0

				arg_159_1.mask_.enabled = false
				var_162_27.a = var_162_28
				arg_159_1.mask_.color = var_162_27
			end

			local var_162_29 = manager.ui.mainCamera.transform
			local var_162_30 = 1

			if var_162_30 < arg_159_1.time_ and arg_159_1.time_ <= var_162_30 + arg_162_0 then
				arg_159_1.var_.shakeOldPos = var_162_29.localPosition
			end

			local var_162_31 = 0.8

			if var_162_30 <= arg_159_1.time_ and arg_159_1.time_ < var_162_30 + var_162_31 then
				local var_162_32 = (arg_159_1.time_ - var_162_30) / 0.066
				local var_162_33, var_162_34 = math.modf(var_162_32)

				var_162_29.localPosition = Vector3.New(var_162_34 * 0.13, var_162_34 * 0.13, var_162_34 * 0.13) + arg_159_1.var_.shakeOldPos
			end

			if arg_159_1.time_ >= var_162_30 + var_162_31 and arg_159_1.time_ < var_162_30 + var_162_31 + arg_162_0 then
				var_162_29.localPosition = arg_159_1.var_.shakeOldPos
			end

			local var_162_35 = 1
			local var_162_36 = 1.275

			if var_162_35 < arg_159_1.time_ and arg_159_1.time_ <= var_162_35 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_37 = arg_159_1:GetWordFromCfg(319341038)
				local var_162_38 = arg_159_1:FormatText(var_162_37.content)

				arg_159_1.text_.text = var_162_38

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_39 = 51
				local var_162_40 = utf8.len(var_162_38)
				local var_162_41 = var_162_39 <= 0 and var_162_36 or var_162_36 * (var_162_40 / var_162_39)

				if var_162_41 > 0 and var_162_36 < var_162_41 then
					arg_159_1.talkMaxDuration = var_162_41

					if var_162_41 + var_162_35 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_41 + var_162_35
					end
				end

				arg_159_1.text_.text = var_162_38
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_42 = math.max(var_162_36, arg_159_1.talkMaxDuration)

			if var_162_35 <= arg_159_1.time_ and arg_159_1.time_ < var_162_35 + var_162_42 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_35) / var_162_42

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_35 + var_162_42 and arg_159_1.time_ < var_162_35 + var_162_42 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play319341039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319341039
		arg_163_1.duration_ = 6.56666666666667

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play319341040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				local var_166_2 = "play"
				local var_166_3 = "effect"

				arg_163_1:AudioAction(var_166_2, var_166_3, "se_story_16", "se_story_16_energy02", "")
			end

			local var_166_4 = manager.ui.mainCamera.transform
			local var_166_5 = 0.233333333333333

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 then
				local var_166_6 = arg_163_1.var_.effect995

				if not var_166_6 then
					var_166_6 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_red"))
					var_166_6.name = "995"
					arg_163_1.var_.effect995 = var_166_6
				end

				local var_166_7 = var_166_4:Find("")

				if var_166_7 then
					var_166_6.transform.parent = var_166_7
				else
					var_166_6.transform.parent = var_166_4
				end

				var_166_6.transform.localPosition = Vector3.New(0, 0, 0)
				var_166_6.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_166_8 = manager.ui.mainCamera.transform
			local var_166_9 = 0.733333333333333

			if var_166_9 < arg_163_1.time_ and arg_163_1.time_ <= var_166_9 + arg_166_0 then
				local var_166_10 = arg_163_1.var_.effect994

				if var_166_10 then
					Object.Destroy(var_166_10)

					arg_163_1.var_.effect994 = nil
				end
			end

			local var_166_11 = 0

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1.mask_.enabled = true
				arg_163_1.mask_.raycastTarget = true

				arg_163_1:SetGaussion(false)
			end

			local var_166_12 = 0.233333333333333

			if var_166_11 <= arg_163_1.time_ and arg_163_1.time_ < var_166_11 + var_166_12 then
				local var_166_13 = (arg_163_1.time_ - var_166_11) / var_166_12
				local var_166_14 = Color.New(0.9811321, 0.9811321, 0.9811321)

				var_166_14.a = Mathf.Lerp(1, 0, var_166_13)
				arg_163_1.mask_.color = var_166_14
			end

			if arg_163_1.time_ >= var_166_11 + var_166_12 and arg_163_1.time_ < var_166_11 + var_166_12 + arg_166_0 then
				local var_166_15 = Color.New(0.9811321, 0.9811321, 0.9811321)
				local var_166_16 = 0

				arg_163_1.mask_.enabled = false
				var_166_15.a = var_166_16
				arg_163_1.mask_.color = var_166_15
			end

			if arg_163_1.frameCnt_ <= 1 then
				arg_163_1.dialog_:SetActive(false)
			end

			local var_166_17 = 1.56666666666667
			local var_166_18 = 1.2

			if var_166_17 < arg_163_1.time_ and arg_163_1.time_ <= var_166_17 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0

				arg_163_1.dialog_:SetActive(true)

				local var_166_19 = LeanTween.value(arg_163_1.dialog_, 0, 1, 0.3)

				var_166_19:setOnUpdate(LuaHelper.FloatAction(function(arg_167_0)
					arg_163_1.dialogCg_.alpha = arg_167_0
				end))
				var_166_19:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_163_1.dialog_)
					var_166_19:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_163_1.duration_ = arg_163_1.duration_ + 0.3

				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_20 = arg_163_1:GetWordFromCfg(319341039)
				local var_166_21 = arg_163_1:FormatText(var_166_20.content)

				arg_163_1.text_.text = var_166_21

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_22 = 48
				local var_166_23 = utf8.len(var_166_21)
				local var_166_24 = var_166_22 <= 0 and var_166_18 or var_166_18 * (var_166_23 / var_166_22)

				if var_166_24 > 0 and var_166_18 < var_166_24 then
					arg_163_1.talkMaxDuration = var_166_24
					var_166_17 = var_166_17 + 0.3

					if var_166_24 + var_166_17 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_24 + var_166_17
					end
				end

				arg_163_1.text_.text = var_166_21
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_25 = var_166_17 + 0.3
			local var_166_26 = math.max(var_166_18, arg_163_1.talkMaxDuration)

			if var_166_25 <= arg_163_1.time_ and arg_163_1.time_ < var_166_25 + var_166_26 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_25) / var_166_26

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_25 + var_166_26 and arg_163_1.time_ < var_166_25 + var_166_26 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319341040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319341040
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play319341041(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 1

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				local var_172_2 = "play"
				local var_172_3 = "effect"

				arg_169_1:AudioAction(var_172_2, var_172_3, "se_story_121_04", "se_story_121_04_gunreadygroup", "")
			end

			local var_172_4 = 0
			local var_172_5 = 0.85

			if var_172_4 < arg_169_1.time_ and arg_169_1.time_ <= var_172_4 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_6 = arg_169_1:GetWordFromCfg(319341040)
				local var_172_7 = arg_169_1:FormatText(var_172_6.content)

				arg_169_1.text_.text = var_172_7

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_8 = 34
				local var_172_9 = utf8.len(var_172_7)
				local var_172_10 = var_172_8 <= 0 and var_172_5 or var_172_5 * (var_172_9 / var_172_8)

				if var_172_10 > 0 and var_172_5 < var_172_10 then
					arg_169_1.talkMaxDuration = var_172_10

					if var_172_10 + var_172_4 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_10 + var_172_4
					end
				end

				arg_169_1.text_.text = var_172_7
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_11 = math.max(var_172_5, arg_169_1.talkMaxDuration)

			if var_172_4 <= arg_169_1.time_ and arg_169_1.time_ < var_172_4 + var_172_11 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_4) / var_172_11

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_4 + var_172_11 and arg_169_1.time_ < var_172_4 + var_172_11 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319341041 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319341041
		arg_173_1.duration_ = 4.73333333333333

		local var_173_0 = {
			zh = 4.36633333333333,
			ja = 4.73333333333333
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
				arg_173_0:Play319341042(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1084ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1084ui_story = var_176_0.localPosition

				local var_176_2 = "1084ui_story"

				arg_173_1:ShowWeapon(arg_173_1.var_[var_176_2 .. "Animator"].transform, true)
			end

			local var_176_3 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_3 then
				local var_176_4 = (arg_173_1.time_ - var_176_1) / var_176_3
				local var_176_5 = Vector3.New(0, -0.97, -6)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1084ui_story, var_176_5, var_176_4)

				local var_176_6 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_6.x, var_176_6.y, var_176_6.z)

				local var_176_7 = var_176_0.localEulerAngles

				var_176_7.z = 0
				var_176_7.x = 0
				var_176_0.localEulerAngles = var_176_7
			end

			if arg_173_1.time_ >= var_176_1 + var_176_3 and arg_173_1.time_ < var_176_1 + var_176_3 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_176_8 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_8.x, var_176_8.y, var_176_8.z)

				local var_176_9 = var_176_0.localEulerAngles

				var_176_9.z = 0
				var_176_9.x = 0
				var_176_0.localEulerAngles = var_176_9
			end

			local var_176_10 = arg_173_1.actors_["1084ui_story"]
			local var_176_11 = 0

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story == nil then
				arg_173_1.var_.characterEffect1084ui_story = var_176_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_12 = 0.200000002980232

			if var_176_11 <= arg_173_1.time_ and arg_173_1.time_ < var_176_11 + var_176_12 then
				local var_176_13 = (arg_173_1.time_ - var_176_11) / var_176_12

				if arg_173_1.var_.characterEffect1084ui_story then
					arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_11 + var_176_12 and arg_173_1.time_ < var_176_11 + var_176_12 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story then
				arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_176_15 = 0

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			if arg_173_1.frameCnt_ <= 1 then
				arg_173_1.dialog_:SetActive(false)
			end

			local var_176_16 = 0.633333333333333
			local var_176_17 = 0.225

			if var_176_16 < arg_173_1.time_ and arg_173_1.time_ <= var_176_16 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				arg_173_1.dialog_:SetActive(true)

				local var_176_18 = LeanTween.value(arg_173_1.dialog_, 0, 1, 0.3)

				var_176_18:setOnUpdate(LuaHelper.FloatAction(function(arg_177_0)
					arg_173_1.dialogCg_.alpha = arg_177_0
				end))
				var_176_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_173_1.dialog_)
					var_176_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_173_1.duration_ = arg_173_1.duration_ + 0.3

				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_19 = arg_173_1:FormatText(StoryNameCfg[6].name)

				arg_173_1.leftNameTxt_.text = var_176_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_20 = arg_173_1:GetWordFromCfg(319341041)
				local var_176_21 = arg_173_1:FormatText(var_176_20.content)

				arg_173_1.text_.text = var_176_21

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_22 = 9
				local var_176_23 = utf8.len(var_176_21)
				local var_176_24 = var_176_22 <= 0 and var_176_17 or var_176_17 * (var_176_23 / var_176_22)

				if var_176_24 > 0 and var_176_17 < var_176_24 then
					arg_173_1.talkMaxDuration = var_176_24
					var_176_16 = var_176_16 + 0.3

					if var_176_24 + var_176_16 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_24 + var_176_16
					end
				end

				arg_173_1.text_.text = var_176_21
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341041", "story_v_out_319341.awb") ~= 0 then
					local var_176_25 = manager.audio:GetVoiceLength("story_v_out_319341", "319341041", "story_v_out_319341.awb") / 1000

					if var_176_25 + var_176_16 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_25 + var_176_16
					end

					if var_176_20.prefab_name ~= "" and arg_173_1.actors_[var_176_20.prefab_name] ~= nil then
						local var_176_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_20.prefab_name].transform, "story_v_out_319341", "319341041", "story_v_out_319341.awb")

						arg_173_1:RecordAudio("319341041", var_176_26)
						arg_173_1:RecordAudio("319341041", var_176_26)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319341", "319341041", "story_v_out_319341.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319341", "319341041", "story_v_out_319341.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_27 = var_176_16 + 0.3
			local var_176_28 = math.max(var_176_17, arg_173_1.talkMaxDuration)

			if var_176_27 <= arg_173_1.time_ and arg_173_1.time_ < var_176_27 + var_176_28 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_27) / var_176_28

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_27 + var_176_28 and arg_173_1.time_ < var_176_27 + var_176_28 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319341042 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319341042
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play319341043(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1084ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story == nil then
				arg_179_1.var_.characterEffect1084ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1084ui_story then
					local var_182_4 = Mathf.Lerp(0, 0.5, var_182_3)

					arg_179_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1084ui_story.fillRatio = var_182_4
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story then
				local var_182_5 = 0.5

				arg_179_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1084ui_story.fillRatio = var_182_5
			end

			local var_182_6 = 0
			local var_182_7 = 0.85

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_8 = arg_179_1:GetWordFromCfg(319341042)
				local var_182_9 = arg_179_1:FormatText(var_182_8.content)

				arg_179_1.text_.text = var_182_9

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_10 = 34
				local var_182_11 = utf8.len(var_182_9)
				local var_182_12 = var_182_10 <= 0 and var_182_7 or var_182_7 * (var_182_11 / var_182_10)

				if var_182_12 > 0 and var_182_7 < var_182_12 then
					arg_179_1.talkMaxDuration = var_182_12

					if var_182_12 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_12 + var_182_6
					end
				end

				arg_179_1.text_.text = var_182_9
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_13 = math.max(var_182_7, arg_179_1.talkMaxDuration)

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_13 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_6) / var_182_13

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_6 + var_182_13 and arg_179_1.time_ < var_182_6 + var_182_13 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319341043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319341043
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play319341044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 1.075

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(319341043)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 43
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319341044 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319341044
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play319341045(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 1.35

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_2 = arg_187_1:GetWordFromCfg(319341044)
				local var_190_3 = arg_187_1:FormatText(var_190_2.content)

				arg_187_1.text_.text = var_190_3

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_4 = 54
				local var_190_5 = utf8.len(var_190_3)
				local var_190_6 = var_190_4 <= 0 and var_190_1 or var_190_1 * (var_190_5 / var_190_4)

				if var_190_6 > 0 and var_190_1 < var_190_6 then
					arg_187_1.talkMaxDuration = var_190_6

					if var_190_6 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_6 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_3
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_7 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_7 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_7

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_7 and arg_187_1.time_ < var_190_0 + var_190_7 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play319341045 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319341045
		arg_191_1.duration_ = 5.666

		local var_191_0 = {
			zh = 2.633,
			ja = 5.666
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
				arg_191_0:Play319341046(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1084ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story == nil then
				arg_191_1.var_.characterEffect1084ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1084ui_story then
					arg_191_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story then
				arg_191_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_194_4 = 0

			if var_194_4 < arg_191_1.time_ and arg_191_1.time_ <= var_194_4 + arg_194_0 then
				arg_191_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_194_5 = 0
			local var_194_6 = 0.375

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_7 = arg_191_1:FormatText(StoryNameCfg[6].name)

				arg_191_1.leftNameTxt_.text = var_194_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_8 = arg_191_1:GetWordFromCfg(319341045)
				local var_194_9 = arg_191_1:FormatText(var_194_8.content)

				arg_191_1.text_.text = var_194_9

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_10 = 15
				local var_194_11 = utf8.len(var_194_9)
				local var_194_12 = var_194_10 <= 0 and var_194_6 or var_194_6 * (var_194_11 / var_194_10)

				if var_194_12 > 0 and var_194_6 < var_194_12 then
					arg_191_1.talkMaxDuration = var_194_12

					if var_194_12 + var_194_5 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_12 + var_194_5
					end
				end

				arg_191_1.text_.text = var_194_9
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341045", "story_v_out_319341.awb") ~= 0 then
					local var_194_13 = manager.audio:GetVoiceLength("story_v_out_319341", "319341045", "story_v_out_319341.awb") / 1000

					if var_194_13 + var_194_5 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_5
					end

					if var_194_8.prefab_name ~= "" and arg_191_1.actors_[var_194_8.prefab_name] ~= nil then
						local var_194_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_8.prefab_name].transform, "story_v_out_319341", "319341045", "story_v_out_319341.awb")

						arg_191_1:RecordAudio("319341045", var_194_14)
						arg_191_1:RecordAudio("319341045", var_194_14)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_319341", "319341045", "story_v_out_319341.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_319341", "319341045", "story_v_out_319341.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_15 = math.max(var_194_6, arg_191_1.talkMaxDuration)

			if var_194_5 <= arg_191_1.time_ and arg_191_1.time_ < var_194_5 + var_194_15 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_5) / var_194_15

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_5 + var_194_15 and arg_191_1.time_ < var_194_5 + var_194_15 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play319341046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319341046
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play319341047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1084ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1084ui_story = var_198_0.localPosition

				local var_198_2 = "1084ui_story"

				arg_195_1:ShowWeapon(arg_195_1.var_[var_198_2 .. "Animator"].transform, false)
			end

			local var_198_3 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_3 then
				local var_198_4 = (arg_195_1.time_ - var_198_1) / var_198_3
				local var_198_5 = Vector3.New(0, 100, 0)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1084ui_story, var_198_5, var_198_4)

				local var_198_6 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_6.x, var_198_6.y, var_198_6.z)

				local var_198_7 = var_198_0.localEulerAngles

				var_198_7.z = 0
				var_198_7.x = 0
				var_198_0.localEulerAngles = var_198_7
			end

			if arg_195_1.time_ >= var_198_1 + var_198_3 and arg_195_1.time_ < var_198_1 + var_198_3 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, 100, 0)

				local var_198_8 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_8.x, var_198_8.y, var_198_8.z)

				local var_198_9 = var_198_0.localEulerAngles

				var_198_9.z = 0
				var_198_9.x = 0
				var_198_0.localEulerAngles = var_198_9
			end

			local var_198_10 = 0
			local var_198_11 = 0.9

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_12 = arg_195_1:GetWordFromCfg(319341046)
				local var_198_13 = arg_195_1:FormatText(var_198_12.content)

				arg_195_1.text_.text = var_198_13

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_14 = 36
				local var_198_15 = utf8.len(var_198_13)
				local var_198_16 = var_198_14 <= 0 and var_198_11 or var_198_11 * (var_198_15 / var_198_14)

				if var_198_16 > 0 and var_198_11 < var_198_16 then
					arg_195_1.talkMaxDuration = var_198_16

					if var_198_16 + var_198_10 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_16 + var_198_10
					end
				end

				arg_195_1.text_.text = var_198_13
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_17 = math.max(var_198_11, arg_195_1.talkMaxDuration)

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_17 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_10) / var_198_17

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_10 + var_198_17 and arg_195_1.time_ < var_198_10 + var_198_17 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319341047 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319341047
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play319341048(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = manager.ui.mainCamera.transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.shakeOldPos = var_202_0.localPosition
			end

			local var_202_2 = 0.6

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / 0.066
				local var_202_4, var_202_5 = math.modf(var_202_3)

				var_202_0.localPosition = Vector3.New(var_202_5 * 0.13, var_202_5 * 0.13, var_202_5 * 0.13) + arg_199_1.var_.shakeOldPos
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = arg_199_1.var_.shakeOldPos
			end

			local var_202_6 = 0

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.allBtn_.enabled = false
			end

			local var_202_7 = 0.6

			if arg_199_1.time_ >= var_202_6 + var_202_7 and arg_199_1.time_ < var_202_6 + var_202_7 + arg_202_0 then
				arg_199_1.allBtn_.enabled = true
			end

			local var_202_8 = 0
			local var_202_9 = 1.1

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_10 = arg_199_1:GetWordFromCfg(319341047)
				local var_202_11 = arg_199_1:FormatText(var_202_10.content)

				arg_199_1.text_.text = var_202_11

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_12 = 44
				local var_202_13 = utf8.len(var_202_11)
				local var_202_14 = var_202_12 <= 0 and var_202_9 or var_202_9 * (var_202_13 / var_202_12)

				if var_202_14 > 0 and var_202_9 < var_202_14 then
					arg_199_1.talkMaxDuration = var_202_14

					if var_202_14 + var_202_8 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_14 + var_202_8
					end
				end

				arg_199_1.text_.text = var_202_11
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_15 = math.max(var_202_9, arg_199_1.talkMaxDuration)

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_15 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_8) / var_202_15

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_8 + var_202_15 and arg_199_1.time_ < var_202_8 + var_202_15 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play319341048 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319341048
		arg_203_1.duration_ = 5.3

		local var_203_0 = {
			zh = 5.3,
			ja = 4.7
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
				arg_203_0:Play319341049(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1084ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1084ui_story == nil then
				arg_203_1.var_.characterEffect1084ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1084ui_story then
					arg_203_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1084ui_story then
				arg_203_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_206_4 = arg_203_1.actors_["1084ui_story"].transform
			local var_206_5 = 0

			if var_206_5 < arg_203_1.time_ and arg_203_1.time_ <= var_206_5 + arg_206_0 then
				arg_203_1.var_.moveOldPos1084ui_story = var_206_4.localPosition

				local var_206_6 = "1084ui_story"

				arg_203_1:ShowWeapon(arg_203_1.var_[var_206_6 .. "Animator"].transform, false)
			end

			local var_206_7 = 0.001

			if var_206_5 <= arg_203_1.time_ and arg_203_1.time_ < var_206_5 + var_206_7 then
				local var_206_8 = (arg_203_1.time_ - var_206_5) / var_206_7
				local var_206_9 = Vector3.New(0, -0.97, -6)

				var_206_4.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1084ui_story, var_206_9, var_206_8)

				local var_206_10 = manager.ui.mainCamera.transform.position - var_206_4.position

				var_206_4.forward = Vector3.New(var_206_10.x, var_206_10.y, var_206_10.z)

				local var_206_11 = var_206_4.localEulerAngles

				var_206_11.z = 0
				var_206_11.x = 0
				var_206_4.localEulerAngles = var_206_11
			end

			if arg_203_1.time_ >= var_206_5 + var_206_7 and arg_203_1.time_ < var_206_5 + var_206_7 + arg_206_0 then
				var_206_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_206_12 = manager.ui.mainCamera.transform.position - var_206_4.position

				var_206_4.forward = Vector3.New(var_206_12.x, var_206_12.y, var_206_12.z)

				local var_206_13 = var_206_4.localEulerAngles

				var_206_13.z = 0
				var_206_13.x = 0
				var_206_4.localEulerAngles = var_206_13
			end

			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_206_15 = 0

			if var_206_15 < arg_203_1.time_ and arg_203_1.time_ <= var_206_15 + arg_206_0 then
				arg_203_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_206_16 = 0
			local var_206_17 = 0.35

			if var_206_16 < arg_203_1.time_ and arg_203_1.time_ <= var_206_16 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_18 = arg_203_1:FormatText(StoryNameCfg[6].name)

				arg_203_1.leftNameTxt_.text = var_206_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_19 = arg_203_1:GetWordFromCfg(319341048)
				local var_206_20 = arg_203_1:FormatText(var_206_19.content)

				arg_203_1.text_.text = var_206_20

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_21 = 14
				local var_206_22 = utf8.len(var_206_20)
				local var_206_23 = var_206_21 <= 0 and var_206_17 or var_206_17 * (var_206_22 / var_206_21)

				if var_206_23 > 0 and var_206_17 < var_206_23 then
					arg_203_1.talkMaxDuration = var_206_23

					if var_206_23 + var_206_16 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_23 + var_206_16
					end
				end

				arg_203_1.text_.text = var_206_20
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341048", "story_v_out_319341.awb") ~= 0 then
					local var_206_24 = manager.audio:GetVoiceLength("story_v_out_319341", "319341048", "story_v_out_319341.awb") / 1000

					if var_206_24 + var_206_16 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_24 + var_206_16
					end

					if var_206_19.prefab_name ~= "" and arg_203_1.actors_[var_206_19.prefab_name] ~= nil then
						local var_206_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_19.prefab_name].transform, "story_v_out_319341", "319341048", "story_v_out_319341.awb")

						arg_203_1:RecordAudio("319341048", var_206_25)
						arg_203_1:RecordAudio("319341048", var_206_25)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319341", "319341048", "story_v_out_319341.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319341", "319341048", "story_v_out_319341.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_26 = math.max(var_206_17, arg_203_1.talkMaxDuration)

			if var_206_16 <= arg_203_1.time_ and arg_203_1.time_ < var_206_16 + var_206_26 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_16) / var_206_26

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_16 + var_206_26 and arg_203_1.time_ < var_206_16 + var_206_26 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play319341049 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319341049
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play319341050(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1084ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story == nil then
				arg_207_1.var_.characterEffect1084ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1084ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1084ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1084ui_story.fillRatio = var_210_5
			end

			local var_210_6 = arg_207_1.actors_["1084ui_story"].transform
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 then
				arg_207_1.var_.moveOldPos1084ui_story = var_210_6.localPosition

				local var_210_8 = "1084ui_story"

				arg_207_1:ShowWeapon(arg_207_1.var_[var_210_8 .. "Animator"].transform, false)
			end

			local var_210_9 = 0.001

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_7) / var_210_9
				local var_210_11 = Vector3.New(0, 100, 0)

				var_210_6.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1084ui_story, var_210_11, var_210_10)

				local var_210_12 = manager.ui.mainCamera.transform.position - var_210_6.position

				var_210_6.forward = Vector3.New(var_210_12.x, var_210_12.y, var_210_12.z)

				local var_210_13 = var_210_6.localEulerAngles

				var_210_13.z = 0
				var_210_13.x = 0
				var_210_6.localEulerAngles = var_210_13
			end

			if arg_207_1.time_ >= var_210_7 + var_210_9 and arg_207_1.time_ < var_210_7 + var_210_9 + arg_210_0 then
				var_210_6.localPosition = Vector3.New(0, 100, 0)

				local var_210_14 = manager.ui.mainCamera.transform.position - var_210_6.position

				var_210_6.forward = Vector3.New(var_210_14.x, var_210_14.y, var_210_14.z)

				local var_210_15 = var_210_6.localEulerAngles

				var_210_15.z = 0
				var_210_15.x = 0
				var_210_6.localEulerAngles = var_210_15
			end

			local var_210_16 = 0
			local var_210_17 = 0.6

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_18 = arg_207_1:GetWordFromCfg(319341049)
				local var_210_19 = arg_207_1:FormatText(var_210_18.content)

				arg_207_1.text_.text = var_210_19

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_20 = 24
				local var_210_21 = utf8.len(var_210_19)
				local var_210_22 = var_210_20 <= 0 and var_210_17 or var_210_17 * (var_210_21 / var_210_20)

				if var_210_22 > 0 and var_210_17 < var_210_22 then
					arg_207_1.talkMaxDuration = var_210_22

					if var_210_22 + var_210_16 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_22 + var_210_16
					end
				end

				arg_207_1.text_.text = var_210_19
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_23 = math.max(var_210_17, arg_207_1.talkMaxDuration)

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_23 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_16) / var_210_23

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_16 + var_210_23 and arg_207_1.time_ < var_210_16 + var_210_23 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play319341050 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319341050
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play319341051(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.625

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_2 = arg_211_1:GetWordFromCfg(319341050)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 65
				local var_214_5 = utf8.len(var_214_3)
				local var_214_6 = var_214_4 <= 0 and var_214_1 or var_214_1 * (var_214_5 / var_214_4)

				if var_214_6 > 0 and var_214_1 < var_214_6 then
					arg_211_1.talkMaxDuration = var_214_6

					if var_214_6 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_6 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_3
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_7 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_7 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_7

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_7 and arg_211_1.time_ < var_214_0 + var_214_7 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319341051 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319341051
		arg_215_1.duration_ = 12.8666666685144

		local var_215_0 = {
			zh = 6.73366666851441,
			ja = 12.8666666685144
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
				arg_215_0:Play319341052(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1084ui_story"].transform
			local var_218_1 = 1.96666666666667

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1084ui_story = var_218_0.localPosition

				local var_218_2 = "1084ui_story"

				arg_215_1:ShowWeapon(arg_215_1.var_[var_218_2 .. "Animator"].transform, false)
			end

			local var_218_3 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_3 then
				local var_218_4 = (arg_215_1.time_ - var_218_1) / var_218_3
				local var_218_5 = Vector3.New(0, -0.97, -6)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1084ui_story, var_218_5, var_218_4)

				local var_218_6 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_6.x, var_218_6.y, var_218_6.z)

				local var_218_7 = var_218_0.localEulerAngles

				var_218_7.z = 0
				var_218_7.x = 0
				var_218_0.localEulerAngles = var_218_7
			end

			if arg_215_1.time_ >= var_218_1 + var_218_3 and arg_215_1.time_ < var_218_1 + var_218_3 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_218_8 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_8.x, var_218_8.y, var_218_8.z)

				local var_218_9 = var_218_0.localEulerAngles

				var_218_9.z = 0
				var_218_9.x = 0
				var_218_0.localEulerAngles = var_218_9
			end

			local var_218_10 = arg_215_1.actors_["1084ui_story"]
			local var_218_11 = 1.96666666666667

			if var_218_11 < arg_215_1.time_ and arg_215_1.time_ <= var_218_11 + arg_218_0 and arg_215_1.var_.characterEffect1084ui_story == nil then
				arg_215_1.var_.characterEffect1084ui_story = var_218_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_12 = 0.200000002980232

			if var_218_11 <= arg_215_1.time_ and arg_215_1.time_ < var_218_11 + var_218_12 then
				local var_218_13 = (arg_215_1.time_ - var_218_11) / var_218_12

				if arg_215_1.var_.characterEffect1084ui_story then
					arg_215_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_11 + var_218_12 and arg_215_1.time_ < var_218_11 + var_218_12 + arg_218_0 and arg_215_1.var_.characterEffect1084ui_story then
				arg_215_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_218_14 = 1.96666666666667

			if var_218_14 < arg_215_1.time_ and arg_215_1.time_ <= var_218_14 + arg_218_0 then
				arg_215_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_218_15 = 1.96666666666667

			if var_218_15 < arg_215_1.time_ and arg_215_1.time_ <= var_218_15 + arg_218_0 then
				arg_215_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_218_16 = 1

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 then
				local var_218_17 = manager.ui.mainCamera.transform.localPosition
				local var_218_18 = Vector3.New(0, 0, 10) + Vector3.New(var_218_17.x, var_218_17.y, 0)
				local var_218_19 = arg_215_1.bgs_.I11o

				var_218_19.transform.localPosition = var_218_18
				var_218_19.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_218_20 = var_218_19:GetComponent("SpriteRenderer")

				if var_218_20 and var_218_20.sprite then
					local var_218_21 = (var_218_19.transform.localPosition - var_218_17).z
					local var_218_22 = manager.ui.mainCameraCom_
					local var_218_23 = 2 * var_218_21 * Mathf.Tan(var_218_22.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_218_24 = var_218_23 * var_218_22.aspect
					local var_218_25 = var_218_20.sprite.bounds.size.x
					local var_218_26 = var_218_20.sprite.bounds.size.y
					local var_218_27 = var_218_24 / var_218_25
					local var_218_28 = var_218_23 / var_218_26
					local var_218_29 = var_218_28 < var_218_27 and var_218_27 or var_218_28

					var_218_19.transform.localScale = Vector3.New(var_218_29, var_218_29, 0)
				end

				for iter_218_0, iter_218_1 in pairs(arg_215_1.bgs_) do
					if iter_218_0 ~= "I11o" then
						iter_218_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_218_30 = 0

			if var_218_30 < arg_215_1.time_ and arg_215_1.time_ <= var_218_30 + arg_218_0 then
				arg_215_1.mask_.enabled = true
				arg_215_1.mask_.raycastTarget = true

				arg_215_1:SetGaussion(false)
			end

			local var_218_31 = 1

			if var_218_30 <= arg_215_1.time_ and arg_215_1.time_ < var_218_30 + var_218_31 then
				local var_218_32 = (arg_215_1.time_ - var_218_30) / var_218_31
				local var_218_33 = Color.New(0, 0, 0)

				var_218_33.a = Mathf.Lerp(0, 1, var_218_32)
				arg_215_1.mask_.color = var_218_33
			end

			if arg_215_1.time_ >= var_218_30 + var_218_31 and arg_215_1.time_ < var_218_30 + var_218_31 + arg_218_0 then
				local var_218_34 = Color.New(0, 0, 0)

				var_218_34.a = 1
				arg_215_1.mask_.color = var_218_34
			end

			local var_218_35 = 1

			if var_218_35 < arg_215_1.time_ and arg_215_1.time_ <= var_218_35 + arg_218_0 then
				arg_215_1.mask_.enabled = true
				arg_215_1.mask_.raycastTarget = true

				arg_215_1:SetGaussion(false)
			end

			local var_218_36 = 0.966666666666667

			if var_218_35 <= arg_215_1.time_ and arg_215_1.time_ < var_218_35 + var_218_36 then
				local var_218_37 = (arg_215_1.time_ - var_218_35) / var_218_36
				local var_218_38 = Color.New(0, 0, 0)

				var_218_38.a = Mathf.Lerp(1, 0, var_218_37)
				arg_215_1.mask_.color = var_218_38
			end

			if arg_215_1.time_ >= var_218_35 + var_218_36 and arg_215_1.time_ < var_218_35 + var_218_36 + arg_218_0 then
				local var_218_39 = Color.New(0, 0, 0)
				local var_218_40 = 0

				arg_215_1.mask_.enabled = false
				var_218_39.a = var_218_40
				arg_215_1.mask_.color = var_218_39
			end

			if arg_215_1.frameCnt_ <= 1 then
				arg_215_1.dialog_:SetActive(false)
			end

			local var_218_41 = 2.00066666851441
			local var_218_42 = 0.575

			if var_218_41 < arg_215_1.time_ and arg_215_1.time_ <= var_218_41 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0

				arg_215_1.dialog_:SetActive(true)

				local var_218_43 = LeanTween.value(arg_215_1.dialog_, 0, 1, 0.3)

				var_218_43:setOnUpdate(LuaHelper.FloatAction(function(arg_219_0)
					arg_215_1.dialogCg_.alpha = arg_219_0
				end))
				var_218_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_215_1.dialog_)
					var_218_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_215_1.duration_ = arg_215_1.duration_ + 0.3

				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_44 = arg_215_1:FormatText(StoryNameCfg[6].name)

				arg_215_1.leftNameTxt_.text = var_218_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_45 = arg_215_1:GetWordFromCfg(319341051)
				local var_218_46 = arg_215_1:FormatText(var_218_45.content)

				arg_215_1.text_.text = var_218_46

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_47 = 23
				local var_218_48 = utf8.len(var_218_46)
				local var_218_49 = var_218_47 <= 0 and var_218_42 or var_218_42 * (var_218_48 / var_218_47)

				if var_218_49 > 0 and var_218_42 < var_218_49 then
					arg_215_1.talkMaxDuration = var_218_49
					var_218_41 = var_218_41 + 0.3

					if var_218_49 + var_218_41 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_49 + var_218_41
					end
				end

				arg_215_1.text_.text = var_218_46
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341051", "story_v_out_319341.awb") ~= 0 then
					local var_218_50 = manager.audio:GetVoiceLength("story_v_out_319341", "319341051", "story_v_out_319341.awb") / 1000

					if var_218_50 + var_218_41 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_50 + var_218_41
					end

					if var_218_45.prefab_name ~= "" and arg_215_1.actors_[var_218_45.prefab_name] ~= nil then
						local var_218_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_45.prefab_name].transform, "story_v_out_319341", "319341051", "story_v_out_319341.awb")

						arg_215_1:RecordAudio("319341051", var_218_51)
						arg_215_1:RecordAudio("319341051", var_218_51)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_319341", "319341051", "story_v_out_319341.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_319341", "319341051", "story_v_out_319341.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_52 = var_218_41 + 0.3
			local var_218_53 = math.max(var_218_42, arg_215_1.talkMaxDuration)

			if var_218_52 <= arg_215_1.time_ and arg_215_1.time_ < var_218_52 + var_218_53 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_52) / var_218_53

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_52 + var_218_53 and arg_215_1.time_ < var_218_52 + var_218_53 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play319341052 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319341052
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play319341053(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1084ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story == nil then
				arg_221_1.var_.characterEffect1084ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1084ui_story then
					local var_224_4 = Mathf.Lerp(0, 0.5, var_224_3)

					arg_221_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1084ui_story.fillRatio = var_224_4
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story then
				local var_224_5 = 0.5

				arg_221_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1084ui_story.fillRatio = var_224_5
			end

			local var_224_6 = 0
			local var_224_7 = 1

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				local var_224_8 = "play"
				local var_224_9 = "effect"

				arg_221_1:AudioAction(var_224_8, var_224_9, "se_story_130", "se_story_130_didi", "")
			end

			local var_224_10 = 0
			local var_224_11 = 1.325

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_12 = arg_221_1:GetWordFromCfg(319341052)
				local var_224_13 = arg_221_1:FormatText(var_224_12.content)

				arg_221_1.text_.text = var_224_13

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_14 = 53
				local var_224_15 = utf8.len(var_224_13)
				local var_224_16 = var_224_14 <= 0 and var_224_11 or var_224_11 * (var_224_15 / var_224_14)

				if var_224_16 > 0 and var_224_11 < var_224_16 then
					arg_221_1.talkMaxDuration = var_224_16

					if var_224_16 + var_224_10 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_16 + var_224_10
					end
				end

				arg_221_1.text_.text = var_224_13
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_17 = math.max(var_224_11, arg_221_1.talkMaxDuration)

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_17 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_10) / var_224_17

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_10 + var_224_17 and arg_221_1.time_ < var_224_10 + var_224_17 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play319341053 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319341053
		arg_225_1.duration_ = 6.2

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play319341054(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 1

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				local var_228_2 = "stop"
				local var_228_3 = "effect"

				arg_225_1:AudioAction(var_228_2, var_228_3, "se_story_130", "se_story_130_didi", "")
			end

			local var_228_4 = arg_225_1.actors_["1084ui_story"].transform
			local var_228_5 = 0

			if var_228_5 < arg_225_1.time_ and arg_225_1.time_ <= var_228_5 + arg_228_0 then
				arg_225_1.var_.moveOldPos1084ui_story = var_228_4.localPosition

				local var_228_6 = "1084ui_story"

				arg_225_1:ShowWeapon(arg_225_1.var_[var_228_6 .. "Animator"].transform, false)
			end

			local var_228_7 = 0.001

			if var_228_5 <= arg_225_1.time_ and arg_225_1.time_ < var_228_5 + var_228_7 then
				local var_228_8 = (arg_225_1.time_ - var_228_5) / var_228_7
				local var_228_9 = Vector3.New(0, 100, 0)

				var_228_4.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1084ui_story, var_228_9, var_228_8)

				local var_228_10 = manager.ui.mainCamera.transform.position - var_228_4.position

				var_228_4.forward = Vector3.New(var_228_10.x, var_228_10.y, var_228_10.z)

				local var_228_11 = var_228_4.localEulerAngles

				var_228_11.z = 0
				var_228_11.x = 0
				var_228_4.localEulerAngles = var_228_11
			end

			if arg_225_1.time_ >= var_228_5 + var_228_7 and arg_225_1.time_ < var_228_5 + var_228_7 + arg_228_0 then
				var_228_4.localPosition = Vector3.New(0, 100, 0)

				local var_228_12 = manager.ui.mainCamera.transform.position - var_228_4.position

				var_228_4.forward = Vector3.New(var_228_12.x, var_228_12.y, var_228_12.z)

				local var_228_13 = var_228_4.localEulerAngles

				var_228_13.z = 0
				var_228_13.x = 0
				var_228_4.localEulerAngles = var_228_13
			end

			local var_228_14 = manager.ui.mainCamera.transform
			local var_228_15 = 0

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 then
				local var_228_16 = arg_225_1.var_.effect破坏屏障1

				if not var_228_16 then
					var_228_16 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_228_16.name = "破坏屏障1"
					arg_225_1.var_.effect破坏屏障1 = var_228_16
				end

				local var_228_17 = var_228_14:Find("")

				if var_228_17 then
					var_228_16.transform.parent = var_228_17
				else
					var_228_16.transform.parent = var_228_14
				end

				var_228_16.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_228_16.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_228_18 = manager.ui.mainCamera.transform
			local var_228_19 = 0.6

			if var_228_19 < arg_225_1.time_ and arg_225_1.time_ <= var_228_19 + arg_228_0 then
				local var_228_20 = arg_225_1.var_.effect破坏屏障1

				if var_228_20 then
					Object.Destroy(var_228_20)

					arg_225_1.var_.effect破坏屏障1 = nil
				end
			end

			if arg_225_1.frameCnt_ <= 1 then
				arg_225_1.dialog_:SetActive(false)
			end

			local var_228_21 = 1.2
			local var_228_22 = 1.675

			if var_228_21 < arg_225_1.time_ and arg_225_1.time_ <= var_228_21 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0

				arg_225_1.dialog_:SetActive(true)

				local var_228_23 = LeanTween.value(arg_225_1.dialog_, 0, 1, 0.3)

				var_228_23:setOnUpdate(LuaHelper.FloatAction(function(arg_229_0)
					arg_225_1.dialogCg_.alpha = arg_229_0
				end))
				var_228_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_225_1.dialog_)
					var_228_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_225_1.duration_ = arg_225_1.duration_ + 0.3

				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_24 = arg_225_1:GetWordFromCfg(319341053)
				local var_228_25 = arg_225_1:FormatText(var_228_24.content)

				arg_225_1.text_.text = var_228_25

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_26 = 67
				local var_228_27 = utf8.len(var_228_25)
				local var_228_28 = var_228_26 <= 0 and var_228_22 or var_228_22 * (var_228_27 / var_228_26)

				if var_228_28 > 0 and var_228_22 < var_228_28 then
					arg_225_1.talkMaxDuration = var_228_28
					var_228_21 = var_228_21 + 0.3

					if var_228_28 + var_228_21 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_28 + var_228_21
					end
				end

				arg_225_1.text_.text = var_228_25
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_29 = var_228_21 + 0.3
			local var_228_30 = math.max(var_228_22, arg_225_1.talkMaxDuration)

			if var_228_29 <= arg_225_1.time_ and arg_225_1.time_ < var_228_29 + var_228_30 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_29) / var_228_30

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_29 + var_228_30 and arg_225_1.time_ < var_228_29 + var_228_30 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319341054 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319341054
		arg_231_1.duration_ = 7.333

		local var_231_0 = {
			zh = 7.333,
			ja = 6
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
				arg_231_0:Play319341055(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1084ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1084ui_story == nil then
				arg_231_1.var_.characterEffect1084ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1084ui_story then
					arg_231_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1084ui_story then
				arg_231_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_234_4 = arg_231_1.actors_["1084ui_story"].transform
			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 then
				arg_231_1.var_.moveOldPos1084ui_story = var_234_4.localPosition

				local var_234_6 = "1084ui_story"

				arg_231_1:ShowWeapon(arg_231_1.var_[var_234_6 .. "Animator"].transform, false)
			end

			local var_234_7 = 0.001

			if var_234_5 <= arg_231_1.time_ and arg_231_1.time_ < var_234_5 + var_234_7 then
				local var_234_8 = (arg_231_1.time_ - var_234_5) / var_234_7
				local var_234_9 = Vector3.New(0, -0.97, -6)

				var_234_4.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1084ui_story, var_234_9, var_234_8)

				local var_234_10 = manager.ui.mainCamera.transform.position - var_234_4.position

				var_234_4.forward = Vector3.New(var_234_10.x, var_234_10.y, var_234_10.z)

				local var_234_11 = var_234_4.localEulerAngles

				var_234_11.z = 0
				var_234_11.x = 0
				var_234_4.localEulerAngles = var_234_11
			end

			if arg_231_1.time_ >= var_234_5 + var_234_7 and arg_231_1.time_ < var_234_5 + var_234_7 + arg_234_0 then
				var_234_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_234_12 = manager.ui.mainCamera.transform.position - var_234_4.position

				var_234_4.forward = Vector3.New(var_234_12.x, var_234_12.y, var_234_12.z)

				local var_234_13 = var_234_4.localEulerAngles

				var_234_13.z = 0
				var_234_13.x = 0
				var_234_4.localEulerAngles = var_234_13
			end

			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_234_15 = 0

			if var_234_15 < arg_231_1.time_ and arg_231_1.time_ <= var_234_15 + arg_234_0 then
				arg_231_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_234_16 = 0
			local var_234_17 = 0.65

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_18 = arg_231_1:FormatText(StoryNameCfg[6].name)

				arg_231_1.leftNameTxt_.text = var_234_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_19 = arg_231_1:GetWordFromCfg(319341054)
				local var_234_20 = arg_231_1:FormatText(var_234_19.content)

				arg_231_1.text_.text = var_234_20

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_21 = 26
				local var_234_22 = utf8.len(var_234_20)
				local var_234_23 = var_234_21 <= 0 and var_234_17 or var_234_17 * (var_234_22 / var_234_21)

				if var_234_23 > 0 and var_234_17 < var_234_23 then
					arg_231_1.talkMaxDuration = var_234_23

					if var_234_23 + var_234_16 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_23 + var_234_16
					end
				end

				arg_231_1.text_.text = var_234_20
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341054", "story_v_out_319341.awb") ~= 0 then
					local var_234_24 = manager.audio:GetVoiceLength("story_v_out_319341", "319341054", "story_v_out_319341.awb") / 1000

					if var_234_24 + var_234_16 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_24 + var_234_16
					end

					if var_234_19.prefab_name ~= "" and arg_231_1.actors_[var_234_19.prefab_name] ~= nil then
						local var_234_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_19.prefab_name].transform, "story_v_out_319341", "319341054", "story_v_out_319341.awb")

						arg_231_1:RecordAudio("319341054", var_234_25)
						arg_231_1:RecordAudio("319341054", var_234_25)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_319341", "319341054", "story_v_out_319341.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_319341", "319341054", "story_v_out_319341.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_26 = math.max(var_234_17, arg_231_1.talkMaxDuration)

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_26 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_16) / var_234_26

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_16 + var_234_26 and arg_231_1.time_ < var_234_16 + var_234_26 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play319341055 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 319341055
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play319341056(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 1

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				local var_238_2 = "play"
				local var_238_3 = "effect"

				arg_235_1:AudioAction(var_238_2, var_238_3, "se_story_130", "se_story_130__1095_skill1_2", "")
			end

			local var_238_4 = arg_235_1.actors_["1084ui_story"]
			local var_238_5 = 0

			if var_238_5 < arg_235_1.time_ and arg_235_1.time_ <= var_238_5 + arg_238_0 and arg_235_1.var_.characterEffect1084ui_story == nil then
				arg_235_1.var_.characterEffect1084ui_story = var_238_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_6 = 0.200000002980232

			if var_238_5 <= arg_235_1.time_ and arg_235_1.time_ < var_238_5 + var_238_6 then
				local var_238_7 = (arg_235_1.time_ - var_238_5) / var_238_6

				if arg_235_1.var_.characterEffect1084ui_story then
					local var_238_8 = Mathf.Lerp(0, 0.5, var_238_7)

					arg_235_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1084ui_story.fillRatio = var_238_8
				end
			end

			if arg_235_1.time_ >= var_238_5 + var_238_6 and arg_235_1.time_ < var_238_5 + var_238_6 + arg_238_0 and arg_235_1.var_.characterEffect1084ui_story then
				local var_238_9 = 0.5

				arg_235_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1084ui_story.fillRatio = var_238_9
			end

			local var_238_10 = arg_235_1.actors_["1084ui_story"].transform
			local var_238_11 = 0

			if var_238_11 < arg_235_1.time_ and arg_235_1.time_ <= var_238_11 + arg_238_0 then
				arg_235_1.var_.moveOldPos1084ui_story = var_238_10.localPosition

				local var_238_12 = "1084ui_story"

				arg_235_1:ShowWeapon(arg_235_1.var_[var_238_12 .. "Animator"].transform, false)
			end

			local var_238_13 = 0.001

			if var_238_11 <= arg_235_1.time_ and arg_235_1.time_ < var_238_11 + var_238_13 then
				local var_238_14 = (arg_235_1.time_ - var_238_11) / var_238_13
				local var_238_15 = Vector3.New(0, 100, 0)

				var_238_10.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1084ui_story, var_238_15, var_238_14)

				local var_238_16 = manager.ui.mainCamera.transform.position - var_238_10.position

				var_238_10.forward = Vector3.New(var_238_16.x, var_238_16.y, var_238_16.z)

				local var_238_17 = var_238_10.localEulerAngles

				var_238_17.z = 0
				var_238_17.x = 0
				var_238_10.localEulerAngles = var_238_17
			end

			if arg_235_1.time_ >= var_238_11 + var_238_13 and arg_235_1.time_ < var_238_11 + var_238_13 + arg_238_0 then
				var_238_10.localPosition = Vector3.New(0, 100, 0)

				local var_238_18 = manager.ui.mainCamera.transform.position - var_238_10.position

				var_238_10.forward = Vector3.New(var_238_18.x, var_238_18.y, var_238_18.z)

				local var_238_19 = var_238_10.localEulerAngles

				var_238_19.z = 0
				var_238_19.x = 0
				var_238_10.localEulerAngles = var_238_19
			end

			local var_238_20 = 0
			local var_238_21 = 1.3

			if var_238_20 < arg_235_1.time_ and arg_235_1.time_ <= var_238_20 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(319341055)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 52
				local var_238_25 = utf8.len(var_238_23)
				local var_238_26 = var_238_24 <= 0 and var_238_21 or var_238_21 * (var_238_25 / var_238_24)

				if var_238_26 > 0 and var_238_21 < var_238_26 then
					arg_235_1.talkMaxDuration = var_238_26

					if var_238_26 + var_238_20 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_26 + var_238_20
					end
				end

				arg_235_1.text_.text = var_238_23
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_27 = math.max(var_238_21, arg_235_1.talkMaxDuration)

			if var_238_20 <= arg_235_1.time_ and arg_235_1.time_ < var_238_20 + var_238_27 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_20) / var_238_27

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_20 + var_238_27 and arg_235_1.time_ < var_238_20 + var_238_27 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play319341056 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319341056
		arg_239_1.duration_ = 5.6

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play319341057(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1084ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1084ui_story = var_242_0.localPosition

				local var_242_2 = "1084ui_story"

				arg_239_1:ShowWeapon(arg_239_1.var_[var_242_2 .. "Animator"].transform, false)
			end

			local var_242_3 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_3 then
				local var_242_4 = (arg_239_1.time_ - var_242_1) / var_242_3
				local var_242_5 = Vector3.New(0, 100, 0)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1084ui_story, var_242_5, var_242_4)

				local var_242_6 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_6.x, var_242_6.y, var_242_6.z)

				local var_242_7 = var_242_0.localEulerAngles

				var_242_7.z = 0
				var_242_7.x = 0
				var_242_0.localEulerAngles = var_242_7
			end

			if arg_239_1.time_ >= var_242_1 + var_242_3 and arg_239_1.time_ < var_242_1 + var_242_3 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, 100, 0)

				local var_242_8 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_8.x, var_242_8.y, var_242_8.z)

				local var_242_9 = var_242_0.localEulerAngles

				var_242_9.z = 0
				var_242_9.x = 0
				var_242_0.localEulerAngles = var_242_9
			end

			local var_242_10 = arg_239_1.actors_["1084ui_story"]
			local var_242_11 = 0

			if var_242_11 < arg_239_1.time_ and arg_239_1.time_ <= var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect1084ui_story == nil then
				arg_239_1.var_.characterEffect1084ui_story = var_242_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_12 = 0.200000002980232

			if var_242_11 <= arg_239_1.time_ and arg_239_1.time_ < var_242_11 + var_242_12 then
				local var_242_13 = (arg_239_1.time_ - var_242_11) / var_242_12

				if arg_239_1.var_.characterEffect1084ui_story then
					arg_239_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_11 + var_242_12 and arg_239_1.time_ < var_242_11 + var_242_12 + arg_242_0 and arg_239_1.var_.characterEffect1084ui_story then
				arg_239_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1.mask_.enabled = true
				arg_239_1.mask_.raycastTarget = false

				arg_239_1:SetGaussion(false)
			end

			local var_242_15 = 0.6

			if var_242_14 <= arg_239_1.time_ and arg_239_1.time_ < var_242_14 + var_242_15 then
				local var_242_16 = (arg_239_1.time_ - var_242_14) / var_242_15
				local var_242_17 = Color.New(1, 1, 1)

				var_242_17.a = Mathf.Lerp(1, 0, var_242_16)
				arg_239_1.mask_.color = var_242_17
			end

			if arg_239_1.time_ >= var_242_14 + var_242_15 and arg_239_1.time_ < var_242_14 + var_242_15 + arg_242_0 then
				local var_242_18 = Color.New(1, 1, 1)
				local var_242_19 = 0

				arg_239_1.mask_.enabled = false
				var_242_18.a = var_242_19
				arg_239_1.mask_.color = var_242_18
			end

			if arg_239_1.frameCnt_ <= 1 then
				arg_239_1.dialog_:SetActive(false)
			end

			local var_242_20 = 0.6
			local var_242_21 = 1.4

			if var_242_20 < arg_239_1.time_ and arg_239_1.time_ <= var_242_20 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				arg_239_1.dialog_:SetActive(true)

				local var_242_22 = LeanTween.value(arg_239_1.dialog_, 0, 1, 0.3)

				var_242_22:setOnUpdate(LuaHelper.FloatAction(function(arg_243_0)
					arg_239_1.dialogCg_.alpha = arg_243_0
				end))
				var_242_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_239_1.dialog_)
					var_242_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_239_1.duration_ = arg_239_1.duration_ + 0.3

				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_23 = arg_239_1:GetWordFromCfg(319341056)
				local var_242_24 = arg_239_1:FormatText(var_242_23.content)

				arg_239_1.text_.text = var_242_24

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_25 = 56
				local var_242_26 = utf8.len(var_242_24)
				local var_242_27 = var_242_25 <= 0 and var_242_21 or var_242_21 * (var_242_26 / var_242_25)

				if var_242_27 > 0 and var_242_21 < var_242_27 then
					arg_239_1.talkMaxDuration = var_242_27
					var_242_20 = var_242_20 + 0.3

					if var_242_27 + var_242_20 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_27 + var_242_20
					end
				end

				arg_239_1.text_.text = var_242_24
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_28 = var_242_20 + 0.3
			local var_242_29 = math.max(var_242_21, arg_239_1.talkMaxDuration)

			if var_242_28 <= arg_239_1.time_ and arg_239_1.time_ < var_242_28 + var_242_29 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_28) / var_242_29

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_28 + var_242_29 and arg_239_1.time_ < var_242_28 + var_242_29 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play319341057 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319341057
		arg_245_1.duration_ = 4.5

		local var_245_0 = {
			zh = 1.566,
			ja = 4.5
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play319341058(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.2

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[36].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(319341057)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 8
				local var_248_6 = utf8.len(var_248_4)
				local var_248_7 = var_248_5 <= 0 and var_248_1 or var_248_1 * (var_248_6 / var_248_5)

				if var_248_7 > 0 and var_248_1 < var_248_7 then
					arg_245_1.talkMaxDuration = var_248_7

					if var_248_7 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_7 + var_248_0
					end
				end

				arg_245_1.text_.text = var_248_4
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341057", "story_v_out_319341.awb") ~= 0 then
					local var_248_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341057", "story_v_out_319341.awb") / 1000

					if var_248_8 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_8 + var_248_0
					end

					if var_248_3.prefab_name ~= "" and arg_245_1.actors_[var_248_3.prefab_name] ~= nil then
						local var_248_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_3.prefab_name].transform, "story_v_out_319341", "319341057", "story_v_out_319341.awb")

						arg_245_1:RecordAudio("319341057", var_248_9)
						arg_245_1:RecordAudio("319341057", var_248_9)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_319341", "319341057", "story_v_out_319341.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_319341", "319341057", "story_v_out_319341.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_10 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_10 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_10

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_10 and arg_245_1.time_ < var_248_0 + var_248_10 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319341058 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319341058
		arg_249_1.duration_ = 0.999999999999

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play319341059(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1084ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1084ui_story == nil then
				arg_249_1.var_.characterEffect1084ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.200000002980232

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1084ui_story then
					arg_249_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1084ui_story then
				arg_249_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_252_4 = 0
			local var_252_5 = 0.166666666666667

			if var_252_4 < arg_249_1.time_ and arg_249_1.time_ <= var_252_4 + arg_252_0 then
				local var_252_6 = "play"
				local var_252_7 = "music"

				arg_249_1:AudioAction(var_252_6, var_252_7, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_252_8 = 0
			local var_252_9 = 0.05

			if var_252_8 < arg_249_1.time_ and arg_249_1.time_ <= var_252_8 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_10 = arg_249_1:FormatText(StoryNameCfg[6].name)

				arg_249_1.leftNameTxt_.text = var_252_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, true)
				arg_249_1.iconController_:SetSelectedState("hero")

				arg_249_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_11 = arg_249_1:GetWordFromCfg(319341058)
				local var_252_12 = arg_249_1:FormatText(var_252_11.content)

				arg_249_1.text_.text = var_252_12

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_13 = 2
				local var_252_14 = utf8.len(var_252_12)
				local var_252_15 = var_252_13 <= 0 and var_252_9 or var_252_9 * (var_252_14 / var_252_13)

				if var_252_15 > 0 and var_252_9 < var_252_15 then
					arg_249_1.talkMaxDuration = var_252_15

					if var_252_15 + var_252_8 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_15 + var_252_8
					end
				end

				arg_249_1.text_.text = var_252_12
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341058", "story_v_out_319341.awb") ~= 0 then
					local var_252_16 = manager.audio:GetVoiceLength("story_v_out_319341", "319341058", "story_v_out_319341.awb") / 1000

					if var_252_16 + var_252_8 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_16 + var_252_8
					end

					if var_252_11.prefab_name ~= "" and arg_249_1.actors_[var_252_11.prefab_name] ~= nil then
						local var_252_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_11.prefab_name].transform, "story_v_out_319341", "319341058", "story_v_out_319341.awb")

						arg_249_1:RecordAudio("319341058", var_252_17)
						arg_249_1:RecordAudio("319341058", var_252_17)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_319341", "319341058", "story_v_out_319341.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_319341", "319341058", "story_v_out_319341.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_18 = math.max(var_252_9, arg_249_1.talkMaxDuration)

			if var_252_8 <= arg_249_1.time_ and arg_249_1.time_ < var_252_8 + var_252_18 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_8) / var_252_18

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_8 + var_252_18 and arg_249_1.time_ < var_252_8 + var_252_18 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319341059 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319341059
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play319341060(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1084ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story == nil then
				arg_253_1.var_.characterEffect1084ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.200000002980232

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1084ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1084ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1084ui_story.fillRatio = var_256_5
			end

			local var_256_6 = 0
			local var_256_7 = 0.875

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_8 = arg_253_1:GetWordFromCfg(319341059)
				local var_256_9 = arg_253_1:FormatText(var_256_8.content)

				arg_253_1.text_.text = var_256_9

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_10 = 35
				local var_256_11 = utf8.len(var_256_9)
				local var_256_12 = var_256_10 <= 0 and var_256_7 or var_256_7 * (var_256_11 / var_256_10)

				if var_256_12 > 0 and var_256_7 < var_256_12 then
					arg_253_1.talkMaxDuration = var_256_12

					if var_256_12 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_12 + var_256_6
					end
				end

				arg_253_1.text_.text = var_256_9
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_13 = math.max(var_256_7, arg_253_1.talkMaxDuration)

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_13 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_6) / var_256_13

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_6 + var_256_13 and arg_253_1.time_ < var_256_6 + var_256_13 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play319341060 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 319341060
		arg_257_1.duration_ = 7.09933333333333

		local var_257_0 = {
			zh = 6.26633333333333,
			ja = 7.09933333333333
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play319341061(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = "ML0102"

			if arg_257_1.bgs_[var_260_0] == nil then
				local var_260_1 = Object.Instantiate(arg_257_1.paintGo_)

				var_260_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_260_0)
				var_260_1.name = var_260_0
				var_260_1.transform.parent = arg_257_1.stage_.transform
				var_260_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_257_1.bgs_[var_260_0] = var_260_1
			end

			local var_260_2 = 2

			if var_260_2 < arg_257_1.time_ and arg_257_1.time_ <= var_260_2 + arg_260_0 then
				local var_260_3 = manager.ui.mainCamera.transform.localPosition
				local var_260_4 = Vector3.New(0, 0, 10) + Vector3.New(var_260_3.x, var_260_3.y, 0)
				local var_260_5 = arg_257_1.bgs_.ML0102

				var_260_5.transform.localPosition = var_260_4
				var_260_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_260_6 = var_260_5:GetComponent("SpriteRenderer")

				if var_260_6 and var_260_6.sprite then
					local var_260_7 = (var_260_5.transform.localPosition - var_260_3).z
					local var_260_8 = manager.ui.mainCameraCom_
					local var_260_9 = 2 * var_260_7 * Mathf.Tan(var_260_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_260_10 = var_260_9 * var_260_8.aspect
					local var_260_11 = var_260_6.sprite.bounds.size.x
					local var_260_12 = var_260_6.sprite.bounds.size.y
					local var_260_13 = var_260_10 / var_260_11
					local var_260_14 = var_260_9 / var_260_12
					local var_260_15 = var_260_14 < var_260_13 and var_260_13 or var_260_14

					var_260_5.transform.localScale = Vector3.New(var_260_15, var_260_15, 0)
				end

				for iter_260_0, iter_260_1 in pairs(arg_257_1.bgs_) do
					if iter_260_0 ~= "ML0102" then
						iter_260_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_260_16 = 0

			if var_260_16 < arg_257_1.time_ and arg_257_1.time_ <= var_260_16 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_17 = 2

			if var_260_16 <= arg_257_1.time_ and arg_257_1.time_ < var_260_16 + var_260_17 then
				local var_260_18 = (arg_257_1.time_ - var_260_16) / var_260_17
				local var_260_19 = Color.New(0, 0, 0)

				var_260_19.a = Mathf.Lerp(0, 1, var_260_18)
				arg_257_1.mask_.color = var_260_19
			end

			if arg_257_1.time_ >= var_260_16 + var_260_17 and arg_257_1.time_ < var_260_16 + var_260_17 + arg_260_0 then
				local var_260_20 = Color.New(0, 0, 0)

				var_260_20.a = 1
				arg_257_1.mask_.color = var_260_20
			end

			local var_260_21 = 2

			if var_260_21 < arg_257_1.time_ and arg_257_1.time_ <= var_260_21 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_22 = 2

			if var_260_21 <= arg_257_1.time_ and arg_257_1.time_ < var_260_21 + var_260_22 then
				local var_260_23 = (arg_257_1.time_ - var_260_21) / var_260_22
				local var_260_24 = Color.New(0, 0, 0)

				var_260_24.a = Mathf.Lerp(1, 0, var_260_23)
				arg_257_1.mask_.color = var_260_24
			end

			if arg_257_1.time_ >= var_260_21 + var_260_22 and arg_257_1.time_ < var_260_21 + var_260_22 + arg_260_0 then
				local var_260_25 = Color.New(0, 0, 0)
				local var_260_26 = 0

				arg_257_1.mask_.enabled = false
				var_260_25.a = var_260_26
				arg_257_1.mask_.color = var_260_25
			end

			local var_260_27 = 0.166666666666667
			local var_260_28 = 0.933333333333333

			if var_260_27 < arg_257_1.time_ and arg_257_1.time_ <= var_260_27 + arg_260_0 then
				local var_260_29 = "play"
				local var_260_30 = "music"

				arg_257_1:AudioAction(var_260_29, var_260_30, "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet.awb")
			end

			local var_260_31 = 0
			local var_260_32 = 0.1

			if var_260_31 < arg_257_1.time_ and arg_257_1.time_ <= var_260_31 + arg_260_0 then
				local var_260_33 = "play"
				local var_260_34 = "music"

				arg_257_1:AudioAction(var_260_33, var_260_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_260_35 = "ML0102_blur"

			if arg_257_1.bgs_[var_260_35] == nil then
				local var_260_36 = Object.Instantiate(arg_257_1.blurPaintGo_)
				local var_260_37 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_260_35)

				var_260_36:GetComponent("SpriteRenderer").sprite = var_260_37
				var_260_36.name = var_260_35
				var_260_36.transform.parent = arg_257_1.stage_.transform
				var_260_36.transform.localPosition = Vector3.New(0, 100, 0)
				arg_257_1.bgs_[var_260_35] = var_260_36
			end

			local var_260_38 = 1.999999999999
			local var_260_39 = arg_257_1.bgs_[var_260_35]

			if var_260_38 < arg_257_1.time_ and arg_257_1.time_ <= var_260_38 + arg_260_0 then
				local var_260_40 = manager.ui.mainCamera.transform.localPosition
				local var_260_41 = Vector3.New(0, 0, 10) + Vector3.New(var_260_40.x, var_260_40.y, 0)

				var_260_39.transform.localPosition = var_260_41
				var_260_39.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_260_42 = var_260_39:GetComponent("SpriteRenderer")

				if var_260_42 and var_260_42.sprite then
					local var_260_43 = (var_260_39.transform.localPosition - var_260_40).z
					local var_260_44 = manager.ui.mainCameraCom_
					local var_260_45 = 2 * var_260_43 * Mathf.Tan(var_260_44.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_260_46 = var_260_45 * var_260_44.aspect
					local var_260_47 = var_260_42.sprite.bounds.size.x
					local var_260_48 = var_260_42.sprite.bounds.size.y
					local var_260_49 = var_260_46 / var_260_47
					local var_260_50 = var_260_45 / var_260_48
					local var_260_51 = var_260_50 < var_260_49 and var_260_49 or var_260_50

					var_260_39.transform.localScale = Vector3.New(var_260_51, var_260_51, 0)
				end
			end

			local var_260_52 = 0.900000000001

			if var_260_38 <= arg_257_1.time_ and arg_257_1.time_ < var_260_38 + var_260_52 then
				local var_260_53 = (arg_257_1.time_ - var_260_38) / var_260_52
				local var_260_54 = Color.New(1, 1, 1)

				var_260_54.a = Mathf.Lerp(1, 0, var_260_53)

				var_260_39:GetComponent("SpriteRenderer").material:SetColor("_Color", var_260_54)
			end

			if arg_257_1.frameCnt_ <= 1 then
				arg_257_1.dialog_:SetActive(false)
			end

			local var_260_55 = 3.83333333333333
			local var_260_56 = 0.275

			if var_260_55 < arg_257_1.time_ and arg_257_1.time_ <= var_260_55 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0

				arg_257_1.dialog_:SetActive(true)

				local var_260_57 = LeanTween.value(arg_257_1.dialog_, 0, 1, 0.3)

				var_260_57:setOnUpdate(LuaHelper.FloatAction(function(arg_261_0)
					arg_257_1.dialogCg_.alpha = arg_261_0
				end))
				var_260_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_257_1.dialog_)
					var_260_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_257_1.duration_ = arg_257_1.duration_ + 0.3

				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_58 = arg_257_1:FormatText(StoryNameCfg[6].name)

				arg_257_1.leftNameTxt_.text = var_260_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, true)
				arg_257_1.iconController_:SetSelectedState("hero")

				arg_257_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_59 = arg_257_1:GetWordFromCfg(319341060)
				local var_260_60 = arg_257_1:FormatText(var_260_59.content)

				arg_257_1.text_.text = var_260_60

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_61 = 11
				local var_260_62 = utf8.len(var_260_60)
				local var_260_63 = var_260_61 <= 0 and var_260_56 or var_260_56 * (var_260_62 / var_260_61)

				if var_260_63 > 0 and var_260_56 < var_260_63 then
					arg_257_1.talkMaxDuration = var_260_63
					var_260_55 = var_260_55 + 0.3

					if var_260_63 + var_260_55 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_63 + var_260_55
					end
				end

				arg_257_1.text_.text = var_260_60
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341060", "story_v_out_319341.awb") ~= 0 then
					local var_260_64 = manager.audio:GetVoiceLength("story_v_out_319341", "319341060", "story_v_out_319341.awb") / 1000

					if var_260_64 + var_260_55 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_64 + var_260_55
					end

					if var_260_59.prefab_name ~= "" and arg_257_1.actors_[var_260_59.prefab_name] ~= nil then
						local var_260_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_59.prefab_name].transform, "story_v_out_319341", "319341060", "story_v_out_319341.awb")

						arg_257_1:RecordAudio("319341060", var_260_65)
						arg_257_1:RecordAudio("319341060", var_260_65)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_319341", "319341060", "story_v_out_319341.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_319341", "319341060", "story_v_out_319341.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_66 = var_260_55 + 0.3
			local var_260_67 = math.max(var_260_56, arg_257_1.talkMaxDuration)

			if var_260_66 <= arg_257_1.time_ and arg_257_1.time_ < var_260_66 + var_260_67 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_66) / var_260_67

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_66 + var_260_67 and arg_257_1.time_ < var_260_66 + var_260_67 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play319341061 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 319341061
		arg_263_1.duration_ = 3.666

		local var_263_0 = {
			zh = 1.4,
			ja = 3.666
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
				arg_263_0:Play319341062(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.125

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[471].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(319341061)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 5
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341061", "story_v_out_319341.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341061", "story_v_out_319341.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_out_319341", "319341061", "story_v_out_319341.awb")

						arg_263_1:RecordAudio("319341061", var_266_9)
						arg_263_1:RecordAudio("319341061", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_319341", "319341061", "story_v_out_319341.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_319341", "319341061", "story_v_out_319341.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_10 and arg_263_1.time_ < var_266_0 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play319341062 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 319341062
		arg_267_1.duration_ = 4

		local var_267_0 = {
			zh = 3.933,
			ja = 4
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
				arg_267_0:Play319341063(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.4

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[6].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, true)
				arg_267_1.iconController_:SetSelectedState("hero")

				arg_267_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(319341062)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 16
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341062", "story_v_out_319341.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341062", "story_v_out_319341.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_319341", "319341062", "story_v_out_319341.awb")

						arg_267_1:RecordAudio("319341062", var_270_9)
						arg_267_1:RecordAudio("319341062", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_319341", "319341062", "story_v_out_319341.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_319341", "319341062", "story_v_out_319341.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_10 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_10 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_10

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_10 and arg_267_1.time_ < var_270_0 + var_270_10 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play319341063 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 319341063
		arg_271_1.duration_ = 13.4

		local var_271_0 = {
			zh = 10.566,
			ja = 13.4
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
				arg_271_0:Play319341064(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 1.3

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_2 = arg_271_1:FormatText(StoryNameCfg[6].name)

				arg_271_1.leftNameTxt_.text = var_274_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, true)
				arg_271_1.iconController_:SetSelectedState("hero")

				arg_271_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_3 = arg_271_1:GetWordFromCfg(319341063)
				local var_274_4 = arg_271_1:FormatText(var_274_3.content)

				arg_271_1.text_.text = var_274_4

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341063", "story_v_out_319341.awb") ~= 0 then
					local var_274_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341063", "story_v_out_319341.awb") / 1000

					if var_274_8 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_0
					end

					if var_274_3.prefab_name ~= "" and arg_271_1.actors_[var_274_3.prefab_name] ~= nil then
						local var_274_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_3.prefab_name].transform, "story_v_out_319341", "319341063", "story_v_out_319341.awb")

						arg_271_1:RecordAudio("319341063", var_274_9)
						arg_271_1:RecordAudio("319341063", var_274_9)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_319341", "319341063", "story_v_out_319341.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_319341", "319341063", "story_v_out_319341.awb")
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
	Play319341064 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 319341064
		arg_275_1.duration_ = 10.4

		local var_275_0 = {
			zh = 6.366,
			ja = 10.4
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
				arg_275_0:Play319341065(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 0.525

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_2 = arg_275_1:FormatText(StoryNameCfg[471].name)

				arg_275_1.leftNameTxt_.text = var_278_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_3 = arg_275_1:GetWordFromCfg(319341064)
				local var_278_4 = arg_275_1:FormatText(var_278_3.content)

				arg_275_1.text_.text = var_278_4

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341064", "story_v_out_319341.awb") ~= 0 then
					local var_278_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341064", "story_v_out_319341.awb") / 1000

					if var_278_8 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_8 + var_278_0
					end

					if var_278_3.prefab_name ~= "" and arg_275_1.actors_[var_278_3.prefab_name] ~= nil then
						local var_278_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_3.prefab_name].transform, "story_v_out_319341", "319341064", "story_v_out_319341.awb")

						arg_275_1:RecordAudio("319341064", var_278_9)
						arg_275_1:RecordAudio("319341064", var_278_9)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_319341", "319341064", "story_v_out_319341.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_319341", "319341064", "story_v_out_319341.awb")
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
	Play319341065 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 319341065
		arg_279_1.duration_ = 3.966

		local var_279_0 = {
			zh = 3.966,
			ja = 3.9
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
				arg_279_0:Play319341066(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.3

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_2 = arg_279_1:FormatText(StoryNameCfg[6].name)

				arg_279_1.leftNameTxt_.text = var_282_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, true)
				arg_279_1.iconController_:SetSelectedState("hero")

				arg_279_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_3 = arg_279_1:GetWordFromCfg(319341065)
				local var_282_4 = arg_279_1:FormatText(var_282_3.content)

				arg_279_1.text_.text = var_282_4

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341065", "story_v_out_319341.awb") ~= 0 then
					local var_282_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341065", "story_v_out_319341.awb") / 1000

					if var_282_8 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_8 + var_282_0
					end

					if var_282_3.prefab_name ~= "" and arg_279_1.actors_[var_282_3.prefab_name] ~= nil then
						local var_282_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_3.prefab_name].transform, "story_v_out_319341", "319341065", "story_v_out_319341.awb")

						arg_279_1:RecordAudio("319341065", var_282_9)
						arg_279_1:RecordAudio("319341065", var_282_9)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_319341", "319341065", "story_v_out_319341.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_319341", "319341065", "story_v_out_319341.awb")
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
	Play319341066 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 319341066
		arg_283_1.duration_ = 8.2

		local var_283_0 = {
			zh = 4.033,
			ja = 8.2
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
				arg_283_0:Play319341067(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.4

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[471].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(319341066)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341066", "story_v_out_319341.awb") ~= 0 then
					local var_286_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341066", "story_v_out_319341.awb") / 1000

					if var_286_8 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_0
					end

					if var_286_3.prefab_name ~= "" and arg_283_1.actors_[var_286_3.prefab_name] ~= nil then
						local var_286_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_3.prefab_name].transform, "story_v_out_319341", "319341066", "story_v_out_319341.awb")

						arg_283_1:RecordAudio("319341066", var_286_9)
						arg_283_1:RecordAudio("319341066", var_286_9)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_319341", "319341066", "story_v_out_319341.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_319341", "319341066", "story_v_out_319341.awb")
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
	Play319341067 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 319341067
		arg_287_1.duration_ = 1.133

		local var_287_0 = {
			zh = 1,
			ja = 1.133
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
				arg_287_0:Play319341068(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.075

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[6].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, true)
				arg_287_1.iconController_:SetSelectedState("hero")

				arg_287_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(319341067)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 3
				local var_290_6 = utf8.len(var_290_4)
				local var_290_7 = var_290_5 <= 0 and var_290_1 or var_290_1 * (var_290_6 / var_290_5)

				if var_290_7 > 0 and var_290_1 < var_290_7 then
					arg_287_1.talkMaxDuration = var_290_7

					if var_290_7 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_7 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_4
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341067", "story_v_out_319341.awb") ~= 0 then
					local var_290_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341067", "story_v_out_319341.awb") / 1000

					if var_290_8 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_0
					end

					if var_290_3.prefab_name ~= "" and arg_287_1.actors_[var_290_3.prefab_name] ~= nil then
						local var_290_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_3.prefab_name].transform, "story_v_out_319341", "319341067", "story_v_out_319341.awb")

						arg_287_1:RecordAudio("319341067", var_290_9)
						arg_287_1:RecordAudio("319341067", var_290_9)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_319341", "319341067", "story_v_out_319341.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_319341", "319341067", "story_v_out_319341.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_10 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_10 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_10

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_10 and arg_287_1.time_ < var_290_0 + var_290_10 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play319341068 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 319341068
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play319341069(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 1.35

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_2 = arg_291_1:GetWordFromCfg(319341068)
				local var_294_3 = arg_291_1:FormatText(var_294_2.content)

				arg_291_1.text_.text = var_294_3

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_4 = 54
				local var_294_5 = utf8.len(var_294_3)
				local var_294_6 = var_294_4 <= 0 and var_294_1 or var_294_1 * (var_294_5 / var_294_4)

				if var_294_6 > 0 and var_294_1 < var_294_6 then
					arg_291_1.talkMaxDuration = var_294_6

					if var_294_6 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_6 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_3
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_7 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_7 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_7

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_7 and arg_291_1.time_ < var_294_0 + var_294_7 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play319341069 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 319341069
		arg_295_1.duration_ = 7.333

		local var_295_0 = {
			zh = 7.166,
			ja = 7.333
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
				arg_295_0:Play319341070(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.mask_.enabled = true
				arg_295_1.mask_.raycastTarget = true

				arg_295_1:SetGaussion(false)
			end

			local var_298_1 = 1

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_1 then
				local var_298_2 = (arg_295_1.time_ - var_298_0) / var_298_1
				local var_298_3 = Color.New(0, 0, 0)

				var_298_3.a = Mathf.Lerp(0, 1, var_298_2)
				arg_295_1.mask_.color = var_298_3
			end

			if arg_295_1.time_ >= var_298_0 + var_298_1 and arg_295_1.time_ < var_298_0 + var_298_1 + arg_298_0 then
				local var_298_4 = Color.New(0, 0, 0)

				var_298_4.a = 1
				arg_295_1.mask_.color = var_298_4
			end

			local var_298_5 = 1

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 then
				arg_295_1.mask_.enabled = true
				arg_295_1.mask_.raycastTarget = true

				arg_295_1:SetGaussion(false)
			end

			local var_298_6 = 1

			if var_298_5 <= arg_295_1.time_ and arg_295_1.time_ < var_298_5 + var_298_6 then
				local var_298_7 = (arg_295_1.time_ - var_298_5) / var_298_6
				local var_298_8 = Color.New(0, 0, 0)

				var_298_8.a = Mathf.Lerp(1, 0, var_298_7)
				arg_295_1.mask_.color = var_298_8
			end

			if arg_295_1.time_ >= var_298_5 + var_298_6 and arg_295_1.time_ < var_298_5 + var_298_6 + arg_298_0 then
				local var_298_9 = Color.New(0, 0, 0)
				local var_298_10 = 0

				arg_295_1.mask_.enabled = false
				var_298_9.a = var_298_10
				arg_295_1.mask_.color = var_298_9
			end

			local var_298_11 = arg_295_1.bgs_.ML0102.transform
			local var_298_12 = 1

			if var_298_12 < arg_295_1.time_ and arg_295_1.time_ <= var_298_12 + arg_298_0 then
				arg_295_1.var_.moveOldPosML0102 = var_298_11.localPosition
			end

			local var_298_13 = 0.001

			if var_298_12 <= arg_295_1.time_ and arg_295_1.time_ < var_298_12 + var_298_13 then
				local var_298_14 = (arg_295_1.time_ - var_298_12) / var_298_13
				local var_298_15 = Vector3.New(1, 0, 4)

				var_298_11.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPosML0102, var_298_15, var_298_14)
			end

			if arg_295_1.time_ >= var_298_12 + var_298_13 and arg_295_1.time_ < var_298_12 + var_298_13 + arg_298_0 then
				var_298_11.localPosition = Vector3.New(1, 0, 4)
			end

			local var_298_16 = arg_295_1.bgs_.ML0102.transform
			local var_298_17 = 1.034

			if var_298_17 < arg_295_1.time_ and arg_295_1.time_ <= var_298_17 + arg_298_0 then
				arg_295_1.var_.moveOldPosML0102 = var_298_16.localPosition
			end

			local var_298_18 = 3.5

			if var_298_17 <= arg_295_1.time_ and arg_295_1.time_ < var_298_17 + var_298_18 then
				local var_298_19 = (arg_295_1.time_ - var_298_17) / var_298_18
				local var_298_20 = Vector3.New(1, -0.5, 4)

				var_298_16.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPosML0102, var_298_20, var_298_19)
			end

			if arg_295_1.time_ >= var_298_17 + var_298_18 and arg_295_1.time_ < var_298_17 + var_298_18 + arg_298_0 then
				var_298_16.localPosition = Vector3.New(1, -0.5, 4)
			end

			local var_298_21 = 2.01733333333333

			if var_298_21 < arg_295_1.time_ and arg_295_1.time_ <= var_298_21 + arg_298_0 then
				arg_295_1.allBtn_.enabled = false
			end

			local var_298_22 = 2.51666666666667

			if arg_295_1.time_ >= var_298_21 + var_298_22 and arg_295_1.time_ < var_298_21 + var_298_22 + arg_298_0 then
				arg_295_1.allBtn_.enabled = true
			end

			if arg_295_1.frameCnt_ <= 1 then
				arg_295_1.dialog_:SetActive(false)
			end

			local var_298_23 = 1.8
			local var_298_24 = 0.475

			if var_298_23 < arg_295_1.time_ and arg_295_1.time_ <= var_298_23 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0

				arg_295_1.dialog_:SetActive(true)

				local var_298_25 = LeanTween.value(arg_295_1.dialog_, 0, 1, 0.3)

				var_298_25:setOnUpdate(LuaHelper.FloatAction(function(arg_299_0)
					arg_295_1.dialogCg_.alpha = arg_299_0
				end))
				var_298_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_295_1.dialog_)
					var_298_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_295_1.duration_ = arg_295_1.duration_ + 0.3

				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_26 = arg_295_1:FormatText(StoryNameCfg[6].name)

				arg_295_1.leftNameTxt_.text = var_298_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, true)
				arg_295_1.iconController_:SetSelectedState("hero")

				arg_295_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_27 = arg_295_1:GetWordFromCfg(319341069)
				local var_298_28 = arg_295_1:FormatText(var_298_27.content)

				arg_295_1.text_.text = var_298_28

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_29 = 19
				local var_298_30 = utf8.len(var_298_28)
				local var_298_31 = var_298_29 <= 0 and var_298_24 or var_298_24 * (var_298_30 / var_298_29)

				if var_298_31 > 0 and var_298_24 < var_298_31 then
					arg_295_1.talkMaxDuration = var_298_31
					var_298_23 = var_298_23 + 0.3

					if var_298_31 + var_298_23 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_31 + var_298_23
					end
				end

				arg_295_1.text_.text = var_298_28
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341069", "story_v_out_319341.awb") ~= 0 then
					local var_298_32 = manager.audio:GetVoiceLength("story_v_out_319341", "319341069", "story_v_out_319341.awb") / 1000

					if var_298_32 + var_298_23 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_32 + var_298_23
					end

					if var_298_27.prefab_name ~= "" and arg_295_1.actors_[var_298_27.prefab_name] ~= nil then
						local var_298_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_27.prefab_name].transform, "story_v_out_319341", "319341069", "story_v_out_319341.awb")

						arg_295_1:RecordAudio("319341069", var_298_33)
						arg_295_1:RecordAudio("319341069", var_298_33)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_319341", "319341069", "story_v_out_319341.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_319341", "319341069", "story_v_out_319341.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_34 = var_298_23 + 0.3
			local var_298_35 = math.max(var_298_24, arg_295_1.talkMaxDuration)

			if var_298_34 <= arg_295_1.time_ and arg_295_1.time_ < var_298_34 + var_298_35 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_34) / var_298_35

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_34 + var_298_35 and arg_295_1.time_ < var_298_34 + var_298_35 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play319341070 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 319341070
		arg_301_1.duration_ = 5.5

		local var_301_0 = {
			zh = 2.433,
			ja = 5.5
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
				arg_301_0:Play319341071(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.25

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[471].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(319341070)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341070", "story_v_out_319341.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341070", "story_v_out_319341.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_319341", "319341070", "story_v_out_319341.awb")

						arg_301_1:RecordAudio("319341070", var_304_9)
						arg_301_1:RecordAudio("319341070", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_319341", "319341070", "story_v_out_319341.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_319341", "319341070", "story_v_out_319341.awb")
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
	Play319341071 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 319341071
		arg_305_1.duration_ = 6.766

		local var_305_0 = {
			zh = 6.4,
			ja = 6.766
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
				arg_305_0:Play319341072(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 1.7

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				local var_308_1 = manager.ui.mainCamera.transform.localPosition
				local var_308_2 = Vector3.New(0, 0, 10) + Vector3.New(var_308_1.x, var_308_1.y, 0)
				local var_308_3 = arg_305_1.bgs_.I11o

				var_308_3.transform.localPosition = var_308_2
				var_308_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_308_4 = var_308_3:GetComponent("SpriteRenderer")

				if var_308_4 and var_308_4.sprite then
					local var_308_5 = (var_308_3.transform.localPosition - var_308_1).z
					local var_308_6 = manager.ui.mainCameraCom_
					local var_308_7 = 2 * var_308_5 * Mathf.Tan(var_308_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_308_8 = var_308_7 * var_308_6.aspect
					local var_308_9 = var_308_4.sprite.bounds.size.x
					local var_308_10 = var_308_4.sprite.bounds.size.y
					local var_308_11 = var_308_8 / var_308_9
					local var_308_12 = var_308_7 / var_308_10
					local var_308_13 = var_308_12 < var_308_11 and var_308_11 or var_308_12

					var_308_3.transform.localScale = Vector3.New(var_308_13, var_308_13, 0)
				end

				for iter_308_0, iter_308_1 in pairs(arg_305_1.bgs_) do
					if iter_308_0 ~= "I11o" then
						iter_308_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_308_14 = 0

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 then
				arg_305_1.mask_.enabled = true
				arg_305_1.mask_.raycastTarget = true

				arg_305_1:SetGaussion(false)
			end

			local var_308_15 = 1.7

			if var_308_14 <= arg_305_1.time_ and arg_305_1.time_ < var_308_14 + var_308_15 then
				local var_308_16 = (arg_305_1.time_ - var_308_14) / var_308_15
				local var_308_17 = Color.New(0, 0, 0)

				var_308_17.a = Mathf.Lerp(0, 1, var_308_16)
				arg_305_1.mask_.color = var_308_17
			end

			if arg_305_1.time_ >= var_308_14 + var_308_15 and arg_305_1.time_ < var_308_14 + var_308_15 + arg_308_0 then
				local var_308_18 = Color.New(0, 0, 0)

				var_308_18.a = 1
				arg_305_1.mask_.color = var_308_18
			end

			local var_308_19 = 1.7

			if var_308_19 < arg_305_1.time_ and arg_305_1.time_ <= var_308_19 + arg_308_0 then
				arg_305_1.mask_.enabled = true
				arg_305_1.mask_.raycastTarget = true

				arg_305_1:SetGaussion(false)
			end

			local var_308_20 = 1.3

			if var_308_19 <= arg_305_1.time_ and arg_305_1.time_ < var_308_19 + var_308_20 then
				local var_308_21 = (arg_305_1.time_ - var_308_19) / var_308_20
				local var_308_22 = Color.New(0, 0, 0)

				var_308_22.a = Mathf.Lerp(1, 0, var_308_21)
				arg_305_1.mask_.color = var_308_22
			end

			if arg_305_1.time_ >= var_308_19 + var_308_20 and arg_305_1.time_ < var_308_19 + var_308_20 + arg_308_0 then
				local var_308_23 = Color.New(0, 0, 0)
				local var_308_24 = 0

				arg_305_1.mask_.enabled = false
				var_308_23.a = var_308_24
				arg_305_1.mask_.color = var_308_23
			end

			local var_308_25 = arg_305_1.actors_["1084ui_story"].transform
			local var_308_26 = 3

			if var_308_26 < arg_305_1.time_ and arg_305_1.time_ <= var_308_26 + arg_308_0 then
				arg_305_1.var_.moveOldPos1084ui_story = var_308_25.localPosition
			end

			local var_308_27 = 0.001

			if var_308_26 <= arg_305_1.time_ and arg_305_1.time_ < var_308_26 + var_308_27 then
				local var_308_28 = (arg_305_1.time_ - var_308_26) / var_308_27
				local var_308_29 = Vector3.New(-0.7, -0.97, -6)

				var_308_25.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1084ui_story, var_308_29, var_308_28)

				local var_308_30 = manager.ui.mainCamera.transform.position - var_308_25.position

				var_308_25.forward = Vector3.New(var_308_30.x, var_308_30.y, var_308_30.z)

				local var_308_31 = var_308_25.localEulerAngles

				var_308_31.z = 0
				var_308_31.x = 0
				var_308_25.localEulerAngles = var_308_31
			end

			if arg_305_1.time_ >= var_308_26 + var_308_27 and arg_305_1.time_ < var_308_26 + var_308_27 + arg_308_0 then
				var_308_25.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_308_32 = manager.ui.mainCamera.transform.position - var_308_25.position

				var_308_25.forward = Vector3.New(var_308_32.x, var_308_32.y, var_308_32.z)

				local var_308_33 = var_308_25.localEulerAngles

				var_308_33.z = 0
				var_308_33.x = 0
				var_308_25.localEulerAngles = var_308_33
			end

			local var_308_34 = arg_305_1.actors_["1084ui_story"]
			local var_308_35 = 3

			if var_308_35 < arg_305_1.time_ and arg_305_1.time_ <= var_308_35 + arg_308_0 and arg_305_1.var_.characterEffect1084ui_story == nil then
				arg_305_1.var_.characterEffect1084ui_story = var_308_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_36 = 0.200000002980232

			if var_308_35 <= arg_305_1.time_ and arg_305_1.time_ < var_308_35 + var_308_36 then
				local var_308_37 = (arg_305_1.time_ - var_308_35) / var_308_36

				if arg_305_1.var_.characterEffect1084ui_story then
					arg_305_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_35 + var_308_36 and arg_305_1.time_ < var_308_35 + var_308_36 + arg_308_0 and arg_305_1.var_.characterEffect1084ui_story then
				arg_305_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_308_38 = 3

			if var_308_38 < arg_305_1.time_ and arg_305_1.time_ <= var_308_38 + arg_308_0 then
				arg_305_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_308_39 = 3

			if var_308_39 < arg_305_1.time_ and arg_305_1.time_ <= var_308_39 + arg_308_0 then
				arg_305_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_305_1.frameCnt_ <= 1 then
				arg_305_1.dialog_:SetActive(false)
			end

			local var_308_40 = 3
			local var_308_41 = 0.4

			if var_308_40 < arg_305_1.time_ and arg_305_1.time_ <= var_308_40 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0

				arg_305_1.dialog_:SetActive(true)

				local var_308_42 = LeanTween.value(arg_305_1.dialog_, 0, 1, 0.3)

				var_308_42:setOnUpdate(LuaHelper.FloatAction(function(arg_309_0)
					arg_305_1.dialogCg_.alpha = arg_309_0
				end))
				var_308_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_305_1.dialog_)
					var_308_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_305_1.duration_ = arg_305_1.duration_ + 0.3

				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_43 = arg_305_1:FormatText(StoryNameCfg[6].name)

				arg_305_1.leftNameTxt_.text = var_308_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_44 = arg_305_1:GetWordFromCfg(319341071)
				local var_308_45 = arg_305_1:FormatText(var_308_44.content)

				arg_305_1.text_.text = var_308_45

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_46 = 16
				local var_308_47 = utf8.len(var_308_45)
				local var_308_48 = var_308_46 <= 0 and var_308_41 or var_308_41 * (var_308_47 / var_308_46)

				if var_308_48 > 0 and var_308_41 < var_308_48 then
					arg_305_1.talkMaxDuration = var_308_48
					var_308_40 = var_308_40 + 0.3

					if var_308_48 + var_308_40 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_48 + var_308_40
					end
				end

				arg_305_1.text_.text = var_308_45
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341071", "story_v_out_319341.awb") ~= 0 then
					local var_308_49 = manager.audio:GetVoiceLength("story_v_out_319341", "319341071", "story_v_out_319341.awb") / 1000

					if var_308_49 + var_308_40 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_49 + var_308_40
					end

					if var_308_44.prefab_name ~= "" and arg_305_1.actors_[var_308_44.prefab_name] ~= nil then
						local var_308_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_44.prefab_name].transform, "story_v_out_319341", "319341071", "story_v_out_319341.awb")

						arg_305_1:RecordAudio("319341071", var_308_50)
						arg_305_1:RecordAudio("319341071", var_308_50)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_319341", "319341071", "story_v_out_319341.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_319341", "319341071", "story_v_out_319341.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_51 = var_308_40 + 0.3
			local var_308_52 = math.max(var_308_41, arg_305_1.talkMaxDuration)

			if var_308_51 <= arg_305_1.time_ and arg_305_1.time_ < var_308_51 + var_308_52 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_51) / var_308_52

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_51 + var_308_52 and arg_305_1.time_ < var_308_51 + var_308_52 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play319341072 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 319341072
		arg_311_1.duration_ = 2.7

		local var_311_0 = {
			zh = 1.999999999999,
			ja = 2.7
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
				arg_311_0:Play319341073(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = "10058ui_story"

			if arg_311_1.actors_[var_314_0] == nil then
				local var_314_1 = Object.Instantiate(Asset.Load("Char/" .. var_314_0), arg_311_1.stage_.transform)

				var_314_1.name = var_314_0
				var_314_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_311_1.actors_[var_314_0] = var_314_1

				local var_314_2 = var_314_1:GetComponentInChildren(typeof(CharacterEffect))

				var_314_2.enabled = true

				local var_314_3 = GameObjectTools.GetOrAddComponent(var_314_1, typeof(DynamicBoneHelper))

				if var_314_3 then
					var_314_3:EnableDynamicBone(false)
				end

				arg_311_1:ShowWeapon(var_314_2.transform, false)

				arg_311_1.var_[var_314_0 .. "Animator"] = var_314_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_311_1.var_[var_314_0 .. "Animator"].applyRootMotion = true
				arg_311_1.var_[var_314_0 .. "LipSync"] = var_314_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_314_4 = arg_311_1.actors_["10058ui_story"].transform
			local var_314_5 = 0

			if var_314_5 < arg_311_1.time_ and arg_311_1.time_ <= var_314_5 + arg_314_0 then
				arg_311_1.var_.moveOldPos10058ui_story = var_314_4.localPosition
			end

			local var_314_6 = 0.001

			if var_314_5 <= arg_311_1.time_ and arg_311_1.time_ < var_314_5 + var_314_6 then
				local var_314_7 = (arg_311_1.time_ - var_314_5) / var_314_6
				local var_314_8 = Vector3.New(0.7, -0.98, -6.1)

				var_314_4.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10058ui_story, var_314_8, var_314_7)

				local var_314_9 = manager.ui.mainCamera.transform.position - var_314_4.position

				var_314_4.forward = Vector3.New(var_314_9.x, var_314_9.y, var_314_9.z)

				local var_314_10 = var_314_4.localEulerAngles

				var_314_10.z = 0
				var_314_10.x = 0
				var_314_4.localEulerAngles = var_314_10
			end

			if arg_311_1.time_ >= var_314_5 + var_314_6 and arg_311_1.time_ < var_314_5 + var_314_6 + arg_314_0 then
				var_314_4.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_314_11 = manager.ui.mainCamera.transform.position - var_314_4.position

				var_314_4.forward = Vector3.New(var_314_11.x, var_314_11.y, var_314_11.z)

				local var_314_12 = var_314_4.localEulerAngles

				var_314_12.z = 0
				var_314_12.x = 0
				var_314_4.localEulerAngles = var_314_12
			end

			local var_314_13 = arg_311_1.actors_["10058ui_story"]
			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 and arg_311_1.var_.characterEffect10058ui_story == nil then
				arg_311_1.var_.characterEffect10058ui_story = var_314_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_15 = 0.200000002980232

			if var_314_14 <= arg_311_1.time_ and arg_311_1.time_ < var_314_14 + var_314_15 then
				local var_314_16 = (arg_311_1.time_ - var_314_14) / var_314_15

				if arg_311_1.var_.characterEffect10058ui_story then
					arg_311_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_14 + var_314_15 and arg_311_1.time_ < var_314_14 + var_314_15 + arg_314_0 and arg_311_1.var_.characterEffect10058ui_story then
				arg_311_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_314_17 = 0

			if var_314_17 < arg_311_1.time_ and arg_311_1.time_ <= var_314_17 + arg_314_0 then
				arg_311_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_314_18 = 0

			if var_314_18 < arg_311_1.time_ and arg_311_1.time_ <= var_314_18 + arg_314_0 then
				arg_311_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_314_19 = arg_311_1.actors_["1084ui_story"].transform
			local var_314_20 = 0

			if var_314_20 < arg_311_1.time_ and arg_311_1.time_ <= var_314_20 + arg_314_0 then
				arg_311_1.var_.moveOldPos1084ui_story = var_314_19.localPosition
			end

			local var_314_21 = 0.001

			if var_314_20 <= arg_311_1.time_ and arg_311_1.time_ < var_314_20 + var_314_21 then
				local var_314_22 = (arg_311_1.time_ - var_314_20) / var_314_21
				local var_314_23 = Vector3.New(-0.7, -0.97, -6)

				var_314_19.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1084ui_story, var_314_23, var_314_22)

				local var_314_24 = manager.ui.mainCamera.transform.position - var_314_19.position

				var_314_19.forward = Vector3.New(var_314_24.x, var_314_24.y, var_314_24.z)

				local var_314_25 = var_314_19.localEulerAngles

				var_314_25.z = 0
				var_314_25.x = 0
				var_314_19.localEulerAngles = var_314_25
			end

			if arg_311_1.time_ >= var_314_20 + var_314_21 and arg_311_1.time_ < var_314_20 + var_314_21 + arg_314_0 then
				var_314_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_314_26 = manager.ui.mainCamera.transform.position - var_314_19.position

				var_314_19.forward = Vector3.New(var_314_26.x, var_314_26.y, var_314_26.z)

				local var_314_27 = var_314_19.localEulerAngles

				var_314_27.z = 0
				var_314_27.x = 0
				var_314_19.localEulerAngles = var_314_27
			end

			local var_314_28 = arg_311_1.actors_["1084ui_story"]
			local var_314_29 = 0

			if var_314_29 < arg_311_1.time_ and arg_311_1.time_ <= var_314_29 + arg_314_0 and arg_311_1.var_.characterEffect1084ui_story == nil then
				arg_311_1.var_.characterEffect1084ui_story = var_314_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_30 = 0.200000002980232

			if var_314_29 <= arg_311_1.time_ and arg_311_1.time_ < var_314_29 + var_314_30 then
				local var_314_31 = (arg_311_1.time_ - var_314_29) / var_314_30

				if arg_311_1.var_.characterEffect1084ui_story then
					local var_314_32 = Mathf.Lerp(0, 0.5, var_314_31)

					arg_311_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1084ui_story.fillRatio = var_314_32
				end
			end

			if arg_311_1.time_ >= var_314_29 + var_314_30 and arg_311_1.time_ < var_314_29 + var_314_30 + arg_314_0 and arg_311_1.var_.characterEffect1084ui_story then
				local var_314_33 = 0.5

				arg_311_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1084ui_story.fillRatio = var_314_33
			end

			local var_314_34 = 0
			local var_314_35 = 0.1

			if var_314_34 < arg_311_1.time_ and arg_311_1.time_ <= var_314_34 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_36 = arg_311_1:FormatText(StoryNameCfg[471].name)

				arg_311_1.leftNameTxt_.text = var_314_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_37 = arg_311_1:GetWordFromCfg(319341072)
				local var_314_38 = arg_311_1:FormatText(var_314_37.content)

				arg_311_1.text_.text = var_314_38

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_39 = 4
				local var_314_40 = utf8.len(var_314_38)
				local var_314_41 = var_314_39 <= 0 and var_314_35 or var_314_35 * (var_314_40 / var_314_39)

				if var_314_41 > 0 and var_314_35 < var_314_41 then
					arg_311_1.talkMaxDuration = var_314_41

					if var_314_41 + var_314_34 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_41 + var_314_34
					end
				end

				arg_311_1.text_.text = var_314_38
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341072", "story_v_out_319341.awb") ~= 0 then
					local var_314_42 = manager.audio:GetVoiceLength("story_v_out_319341", "319341072", "story_v_out_319341.awb") / 1000

					if var_314_42 + var_314_34 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_42 + var_314_34
					end

					if var_314_37.prefab_name ~= "" and arg_311_1.actors_[var_314_37.prefab_name] ~= nil then
						local var_314_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_37.prefab_name].transform, "story_v_out_319341", "319341072", "story_v_out_319341.awb")

						arg_311_1:RecordAudio("319341072", var_314_43)
						arg_311_1:RecordAudio("319341072", var_314_43)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_319341", "319341072", "story_v_out_319341.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_319341", "319341072", "story_v_out_319341.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_44 = math.max(var_314_35, arg_311_1.talkMaxDuration)

			if var_314_34 <= arg_311_1.time_ and arg_311_1.time_ < var_314_34 + var_314_44 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_34) / var_314_44

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_34 + var_314_44 and arg_311_1.time_ < var_314_34 + var_314_44 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play319341073 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 319341073
		arg_315_1.duration_ = 7.4

		local var_315_0 = {
			zh = 7.3,
			ja = 7.4
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
				arg_315_0:Play319341074(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10058ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect10058ui_story == nil then
				arg_315_1.var_.characterEffect10058ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.200000002980232

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect10058ui_story then
					local var_318_4 = Mathf.Lerp(0, 0.5, var_318_3)

					arg_315_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_315_1.var_.characterEffect10058ui_story.fillRatio = var_318_4
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect10058ui_story then
				local var_318_5 = 0.5

				arg_315_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_315_1.var_.characterEffect10058ui_story.fillRatio = var_318_5
			end

			local var_318_6 = arg_315_1.actors_["1084ui_story"]
			local var_318_7 = 0

			if var_318_7 < arg_315_1.time_ and arg_315_1.time_ <= var_318_7 + arg_318_0 and arg_315_1.var_.characterEffect1084ui_story == nil then
				arg_315_1.var_.characterEffect1084ui_story = var_318_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_8 = 0.200000002980232

			if var_318_7 <= arg_315_1.time_ and arg_315_1.time_ < var_318_7 + var_318_8 then
				local var_318_9 = (arg_315_1.time_ - var_318_7) / var_318_8

				if arg_315_1.var_.characterEffect1084ui_story then
					arg_315_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_7 + var_318_8 and arg_315_1.time_ < var_318_7 + var_318_8 + arg_318_0 and arg_315_1.var_.characterEffect1084ui_story then
				arg_315_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_318_10 = 0
			local var_318_11 = 0.9

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_12 = arg_315_1:FormatText(StoryNameCfg[6].name)

				arg_315_1.leftNameTxt_.text = var_318_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_13 = arg_315_1:GetWordFromCfg(319341073)
				local var_318_14 = arg_315_1:FormatText(var_318_13.content)

				arg_315_1.text_.text = var_318_14

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_15 = 36
				local var_318_16 = utf8.len(var_318_14)
				local var_318_17 = var_318_15 <= 0 and var_318_11 or var_318_11 * (var_318_16 / var_318_15)

				if var_318_17 > 0 and var_318_11 < var_318_17 then
					arg_315_1.talkMaxDuration = var_318_17

					if var_318_17 + var_318_10 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_17 + var_318_10
					end
				end

				arg_315_1.text_.text = var_318_14
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341073", "story_v_out_319341.awb") ~= 0 then
					local var_318_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341073", "story_v_out_319341.awb") / 1000

					if var_318_18 + var_318_10 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_18 + var_318_10
					end

					if var_318_13.prefab_name ~= "" and arg_315_1.actors_[var_318_13.prefab_name] ~= nil then
						local var_318_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_13.prefab_name].transform, "story_v_out_319341", "319341073", "story_v_out_319341.awb")

						arg_315_1:RecordAudio("319341073", var_318_19)
						arg_315_1:RecordAudio("319341073", var_318_19)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_319341", "319341073", "story_v_out_319341.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_319341", "319341073", "story_v_out_319341.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_20 = math.max(var_318_11, arg_315_1.talkMaxDuration)

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_20 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_10) / var_318_20

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_10 + var_318_20 and arg_315_1.time_ < var_318_10 + var_318_20 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play319341074 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 319341074
		arg_319_1.duration_ = 1.999999999999

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play319341075(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10058ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos10058ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0.7, -0.98, -6.1)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos10058ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["10058ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect10058ui_story == nil then
				arg_319_1.var_.characterEffect10058ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect10058ui_story then
					arg_319_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect10058ui_story then
				arg_319_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_322_13 = 0

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_322_15 = arg_319_1.actors_["1084ui_story"]
			local var_322_16 = 0

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 and arg_319_1.var_.characterEffect1084ui_story == nil then
				arg_319_1.var_.characterEffect1084ui_story = var_322_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_17 = 0.200000002980232

			if var_322_16 <= arg_319_1.time_ and arg_319_1.time_ < var_322_16 + var_322_17 then
				local var_322_18 = (arg_319_1.time_ - var_322_16) / var_322_17

				if arg_319_1.var_.characterEffect1084ui_story then
					local var_322_19 = Mathf.Lerp(0, 0.5, var_322_18)

					arg_319_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1084ui_story.fillRatio = var_322_19
				end
			end

			if arg_319_1.time_ >= var_322_16 + var_322_17 and arg_319_1.time_ < var_322_16 + var_322_17 + arg_322_0 and arg_319_1.var_.characterEffect1084ui_story then
				local var_322_20 = 0.5

				arg_319_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1084ui_story.fillRatio = var_322_20
			end

			local var_322_21 = 0
			local var_322_22 = 0.05

			if var_322_21 < arg_319_1.time_ and arg_319_1.time_ <= var_322_21 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_23 = arg_319_1:FormatText(StoryNameCfg[471].name)

				arg_319_1.leftNameTxt_.text = var_322_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_24 = arg_319_1:GetWordFromCfg(319341074)
				local var_322_25 = arg_319_1:FormatText(var_322_24.content)

				arg_319_1.text_.text = var_322_25

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_26 = 2
				local var_322_27 = utf8.len(var_322_25)
				local var_322_28 = var_322_26 <= 0 and var_322_22 or var_322_22 * (var_322_27 / var_322_26)

				if var_322_28 > 0 and var_322_22 < var_322_28 then
					arg_319_1.talkMaxDuration = var_322_28

					if var_322_28 + var_322_21 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_28 + var_322_21
					end
				end

				arg_319_1.text_.text = var_322_25
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341074", "story_v_out_319341.awb") ~= 0 then
					local var_322_29 = manager.audio:GetVoiceLength("story_v_out_319341", "319341074", "story_v_out_319341.awb") / 1000

					if var_322_29 + var_322_21 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_29 + var_322_21
					end

					if var_322_24.prefab_name ~= "" and arg_319_1.actors_[var_322_24.prefab_name] ~= nil then
						local var_322_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_24.prefab_name].transform, "story_v_out_319341", "319341074", "story_v_out_319341.awb")

						arg_319_1:RecordAudio("319341074", var_322_30)
						arg_319_1:RecordAudio("319341074", var_322_30)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_319341", "319341074", "story_v_out_319341.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_319341", "319341074", "story_v_out_319341.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_31 = math.max(var_322_22, arg_319_1.talkMaxDuration)

			if var_322_21 <= arg_319_1.time_ and arg_319_1.time_ < var_322_21 + var_322_31 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_21) / var_322_31

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_21 + var_322_31 and arg_319_1.time_ < var_322_21 + var_322_31 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play319341075 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 319341075
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play319341076(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["10058ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect10058ui_story == nil then
				arg_323_1.var_.characterEffect10058ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.200000002980232

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect10058ui_story then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_323_1.var_.characterEffect10058ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect10058ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_323_1.var_.characterEffect10058ui_story.fillRatio = var_326_5
			end

			local var_326_6 = 0
			local var_326_7 = 1.2

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

				local var_326_8 = arg_323_1:GetWordFromCfg(319341075)
				local var_326_9 = arg_323_1:FormatText(var_326_8.content)

				arg_323_1.text_.text = var_326_9

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_10 = 48
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
	Play319341076 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 319341076
		arg_327_1.duration_ = 8.7

		local var_327_0 = {
			zh = 7.766,
			ja = 8.7
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
				arg_327_0:Play319341077(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["10058ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect10058ui_story == nil then
				arg_327_1.var_.characterEffect10058ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect10058ui_story then
					arg_327_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect10058ui_story then
				arg_327_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_330_4 = 0
			local var_330_5 = 0.9

			if var_330_4 < arg_327_1.time_ and arg_327_1.time_ <= var_330_4 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_6 = arg_327_1:FormatText(StoryNameCfg[471].name)

				arg_327_1.leftNameTxt_.text = var_330_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_7 = arg_327_1:GetWordFromCfg(319341076)
				local var_330_8 = arg_327_1:FormatText(var_330_7.content)

				arg_327_1.text_.text = var_330_8

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_9 = 36
				local var_330_10 = utf8.len(var_330_8)
				local var_330_11 = var_330_9 <= 0 and var_330_5 or var_330_5 * (var_330_10 / var_330_9)

				if var_330_11 > 0 and var_330_5 < var_330_11 then
					arg_327_1.talkMaxDuration = var_330_11

					if var_330_11 + var_330_4 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_11 + var_330_4
					end
				end

				arg_327_1.text_.text = var_330_8
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341076", "story_v_out_319341.awb") ~= 0 then
					local var_330_12 = manager.audio:GetVoiceLength("story_v_out_319341", "319341076", "story_v_out_319341.awb") / 1000

					if var_330_12 + var_330_4 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_12 + var_330_4
					end

					if var_330_7.prefab_name ~= "" and arg_327_1.actors_[var_330_7.prefab_name] ~= nil then
						local var_330_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_7.prefab_name].transform, "story_v_out_319341", "319341076", "story_v_out_319341.awb")

						arg_327_1:RecordAudio("319341076", var_330_13)
						arg_327_1:RecordAudio("319341076", var_330_13)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_319341", "319341076", "story_v_out_319341.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_319341", "319341076", "story_v_out_319341.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_14 = math.max(var_330_5, arg_327_1.talkMaxDuration)

			if var_330_4 <= arg_327_1.time_ and arg_327_1.time_ < var_330_4 + var_330_14 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_4) / var_330_14

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_4 + var_330_14 and arg_327_1.time_ < var_330_4 + var_330_14 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play319341077 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 319341077
		arg_331_1.duration_ = 9.466

		local var_331_0 = {
			zh = 2.866,
			ja = 9.466
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
				arg_331_0:Play319341078(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["10058ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect10058ui_story == nil then
				arg_331_1.var_.characterEffect10058ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect10058ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_331_1.var_.characterEffect10058ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect10058ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_331_1.var_.characterEffect10058ui_story.fillRatio = var_334_5
			end

			local var_334_6 = arg_331_1.actors_["1084ui_story"]
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 and arg_331_1.var_.characterEffect1084ui_story == nil then
				arg_331_1.var_.characterEffect1084ui_story = var_334_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_8 = 0.200000002980232

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8

				if arg_331_1.var_.characterEffect1084ui_story then
					arg_331_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 and arg_331_1.var_.characterEffect1084ui_story then
				arg_331_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_334_10 = 0
			local var_334_11 = 0.3

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_12 = arg_331_1:FormatText(StoryNameCfg[6].name)

				arg_331_1.leftNameTxt_.text = var_334_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_13 = arg_331_1:GetWordFromCfg(319341077)
				local var_334_14 = arg_331_1:FormatText(var_334_13.content)

				arg_331_1.text_.text = var_334_14

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_15 = 12
				local var_334_16 = utf8.len(var_334_14)
				local var_334_17 = var_334_15 <= 0 and var_334_11 or var_334_11 * (var_334_16 / var_334_15)

				if var_334_17 > 0 and var_334_11 < var_334_17 then
					arg_331_1.talkMaxDuration = var_334_17

					if var_334_17 + var_334_10 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_17 + var_334_10
					end
				end

				arg_331_1.text_.text = var_334_14
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341077", "story_v_out_319341.awb") ~= 0 then
					local var_334_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341077", "story_v_out_319341.awb") / 1000

					if var_334_18 + var_334_10 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_18 + var_334_10
					end

					if var_334_13.prefab_name ~= "" and arg_331_1.actors_[var_334_13.prefab_name] ~= nil then
						local var_334_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_13.prefab_name].transform, "story_v_out_319341", "319341077", "story_v_out_319341.awb")

						arg_331_1:RecordAudio("319341077", var_334_19)
						arg_331_1:RecordAudio("319341077", var_334_19)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_319341", "319341077", "story_v_out_319341.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_319341", "319341077", "story_v_out_319341.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_20 = math.max(var_334_11, arg_331_1.talkMaxDuration)

			if var_334_10 <= arg_331_1.time_ and arg_331_1.time_ < var_334_10 + var_334_20 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_10) / var_334_20

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_10 + var_334_20 and arg_331_1.time_ < var_334_10 + var_334_20 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play319341078 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 319341078
		arg_335_1.duration_ = 7.6

		local var_335_0 = {
			zh = 1.666,
			ja = 7.6
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
				arg_335_0:Play319341079(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["10058ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect10058ui_story == nil then
				arg_335_1.var_.characterEffect10058ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect10058ui_story then
					local var_338_4 = Mathf.Lerp(0, 0.5, var_338_3)

					arg_335_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_335_1.var_.characterEffect10058ui_story.fillRatio = var_338_4
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect10058ui_story then
				local var_338_5 = 0.5

				arg_335_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_335_1.var_.characterEffect10058ui_story.fillRatio = var_338_5
			end

			local var_338_6 = arg_335_1.actors_["1084ui_story"]
			local var_338_7 = 0

			if var_338_7 < arg_335_1.time_ and arg_335_1.time_ <= var_338_7 + arg_338_0 and arg_335_1.var_.characterEffect1084ui_story == nil then
				arg_335_1.var_.characterEffect1084ui_story = var_338_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_8 = 0.200000002980232

			if var_338_7 <= arg_335_1.time_ and arg_335_1.time_ < var_338_7 + var_338_8 then
				local var_338_9 = (arg_335_1.time_ - var_338_7) / var_338_8

				if arg_335_1.var_.characterEffect1084ui_story then
					arg_335_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_7 + var_338_8 and arg_335_1.time_ < var_338_7 + var_338_8 + arg_338_0 and arg_335_1.var_.characterEffect1084ui_story then
				arg_335_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_338_10 = 0
			local var_338_11 = 0.225

			if var_338_10 < arg_335_1.time_ and arg_335_1.time_ <= var_338_10 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_12 = arg_335_1:FormatText(StoryNameCfg[471].name)

				arg_335_1.leftNameTxt_.text = var_338_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_13 = arg_335_1:GetWordFromCfg(319341078)
				local var_338_14 = arg_335_1:FormatText(var_338_13.content)

				arg_335_1.text_.text = var_338_14

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_15 = 9
				local var_338_16 = utf8.len(var_338_14)
				local var_338_17 = var_338_15 <= 0 and var_338_11 or var_338_11 * (var_338_16 / var_338_15)

				if var_338_17 > 0 and var_338_11 < var_338_17 then
					arg_335_1.talkMaxDuration = var_338_17

					if var_338_17 + var_338_10 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_17 + var_338_10
					end
				end

				arg_335_1.text_.text = var_338_14
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341078", "story_v_out_319341.awb") ~= 0 then
					local var_338_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341078", "story_v_out_319341.awb") / 1000

					if var_338_18 + var_338_10 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_18 + var_338_10
					end

					if var_338_13.prefab_name ~= "" and arg_335_1.actors_[var_338_13.prefab_name] ~= nil then
						local var_338_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_13.prefab_name].transform, "story_v_out_319341", "319341078", "story_v_out_319341.awb")

						arg_335_1:RecordAudio("319341078", var_338_19)
						arg_335_1:RecordAudio("319341078", var_338_19)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_319341", "319341078", "story_v_out_319341.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_319341", "319341078", "story_v_out_319341.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_20 = math.max(var_338_11, arg_335_1.talkMaxDuration)

			if var_338_10 <= arg_335_1.time_ and arg_335_1.time_ < var_338_10 + var_338_20 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_10) / var_338_20

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_10 + var_338_20 and arg_335_1.time_ < var_338_10 + var_338_20 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play319341079 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 319341079
		arg_339_1.duration_ = 6.2

		local var_339_0 = {
			zh = 1.999999999999,
			ja = 6.2
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
				arg_339_0:Play319341080(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1084ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1084ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(-0.7, -0.97, -6)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1084ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1084ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect1084ui_story == nil then
				arg_339_1.var_.characterEffect1084ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1084ui_story then
					arg_339_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect1084ui_story then
				arg_339_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_15 = 0
			local var_342_16 = 0.2

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[6].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(319341079)
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341079", "story_v_out_319341.awb") ~= 0 then
					local var_342_23 = manager.audio:GetVoiceLength("story_v_out_319341", "319341079", "story_v_out_319341.awb") / 1000

					if var_342_23 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_23 + var_342_15
					end

					if var_342_18.prefab_name ~= "" and arg_339_1.actors_[var_342_18.prefab_name] ~= nil then
						local var_342_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_18.prefab_name].transform, "story_v_out_319341", "319341079", "story_v_out_319341.awb")

						arg_339_1:RecordAudio("319341079", var_342_24)
						arg_339_1:RecordAudio("319341079", var_342_24)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_319341", "319341079", "story_v_out_319341.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_319341", "319341079", "story_v_out_319341.awb")
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
	Play319341080 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 319341080
		arg_343_1.duration_ = 17.233

		local var_343_0 = {
			zh = 14.1,
			ja = 17.233
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
				arg_343_0:Play319341081(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["10058ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos10058ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(0.7, -0.98, -6.1)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos10058ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = arg_343_1.actors_["10058ui_story"]
			local var_346_10 = 0

			if var_346_10 < arg_343_1.time_ and arg_343_1.time_ <= var_346_10 + arg_346_0 and arg_343_1.var_.characterEffect10058ui_story == nil then
				arg_343_1.var_.characterEffect10058ui_story = var_346_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_11 = 0.200000002980232

			if var_346_10 <= arg_343_1.time_ and arg_343_1.time_ < var_346_10 + var_346_11 then
				local var_346_12 = (arg_343_1.time_ - var_346_10) / var_346_11

				if arg_343_1.var_.characterEffect10058ui_story then
					arg_343_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_10 + var_346_11 and arg_343_1.time_ < var_346_10 + var_346_11 + arg_346_0 and arg_343_1.var_.characterEffect10058ui_story then
				arg_343_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_346_13 = arg_343_1.actors_["1084ui_story"]
			local var_346_14 = 0

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 and arg_343_1.var_.characterEffect1084ui_story == nil then
				arg_343_1.var_.characterEffect1084ui_story = var_346_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_15 = 0.200000002980232

			if var_346_14 <= arg_343_1.time_ and arg_343_1.time_ < var_346_14 + var_346_15 then
				local var_346_16 = (arg_343_1.time_ - var_346_14) / var_346_15

				if arg_343_1.var_.characterEffect1084ui_story then
					local var_346_17 = Mathf.Lerp(0, 0.5, var_346_16)

					arg_343_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1084ui_story.fillRatio = var_346_17
				end
			end

			if arg_343_1.time_ >= var_346_14 + var_346_15 and arg_343_1.time_ < var_346_14 + var_346_15 + arg_346_0 and arg_343_1.var_.characterEffect1084ui_story then
				local var_346_18 = 0.5

				arg_343_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1084ui_story.fillRatio = var_346_18
			end

			local var_346_19 = 0

			if var_346_19 < arg_343_1.time_ and arg_343_1.time_ <= var_346_19 + arg_346_0 then
				arg_343_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_346_20 = 0

			if var_346_20 < arg_343_1.time_ and arg_343_1.time_ <= var_346_20 + arg_346_0 then
				arg_343_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_346_21 = 0
			local var_346_22 = 1.475

			if var_346_21 < arg_343_1.time_ and arg_343_1.time_ <= var_346_21 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_23 = arg_343_1:FormatText(StoryNameCfg[471].name)

				arg_343_1.leftNameTxt_.text = var_346_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_24 = arg_343_1:GetWordFromCfg(319341080)
				local var_346_25 = arg_343_1:FormatText(var_346_24.content)

				arg_343_1.text_.text = var_346_25

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_26 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341080", "story_v_out_319341.awb") ~= 0 then
					local var_346_29 = manager.audio:GetVoiceLength("story_v_out_319341", "319341080", "story_v_out_319341.awb") / 1000

					if var_346_29 + var_346_21 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_29 + var_346_21
					end

					if var_346_24.prefab_name ~= "" and arg_343_1.actors_[var_346_24.prefab_name] ~= nil then
						local var_346_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_24.prefab_name].transform, "story_v_out_319341", "319341080", "story_v_out_319341.awb")

						arg_343_1:RecordAudio("319341080", var_346_30)
						arg_343_1:RecordAudio("319341080", var_346_30)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_319341", "319341080", "story_v_out_319341.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_319341", "319341080", "story_v_out_319341.awb")
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
	Play319341081 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 319341081
		arg_347_1.duration_ = 9.133

		local var_347_0 = {
			zh = 5.333,
			ja = 9.133
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
				arg_347_0:Play319341082(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_2")
			end

			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_350_2 = 0
			local var_350_3 = 0.925

			if var_350_2 < arg_347_1.time_ and arg_347_1.time_ <= var_350_2 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_4 = arg_347_1:FormatText(StoryNameCfg[471].name)

				arg_347_1.leftNameTxt_.text = var_350_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_5 = arg_347_1:GetWordFromCfg(319341081)
				local var_350_6 = arg_347_1:FormatText(var_350_5.content)

				arg_347_1.text_.text = var_350_6

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_7 = 37
				local var_350_8 = utf8.len(var_350_6)
				local var_350_9 = var_350_7 <= 0 and var_350_3 or var_350_3 * (var_350_8 / var_350_7)

				if var_350_9 > 0 and var_350_3 < var_350_9 then
					arg_347_1.talkMaxDuration = var_350_9

					if var_350_9 + var_350_2 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_9 + var_350_2
					end
				end

				arg_347_1.text_.text = var_350_6
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341081", "story_v_out_319341.awb") ~= 0 then
					local var_350_10 = manager.audio:GetVoiceLength("story_v_out_319341", "319341081", "story_v_out_319341.awb") / 1000

					if var_350_10 + var_350_2 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_10 + var_350_2
					end

					if var_350_5.prefab_name ~= "" and arg_347_1.actors_[var_350_5.prefab_name] ~= nil then
						local var_350_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_5.prefab_name].transform, "story_v_out_319341", "319341081", "story_v_out_319341.awb")

						arg_347_1:RecordAudio("319341081", var_350_11)
						arg_347_1:RecordAudio("319341081", var_350_11)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_319341", "319341081", "story_v_out_319341.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_319341", "319341081", "story_v_out_319341.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_12 = math.max(var_350_3, arg_347_1.talkMaxDuration)

			if var_350_2 <= arg_347_1.time_ and arg_347_1.time_ < var_350_2 + var_350_12 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_2) / var_350_12

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_2 + var_350_12 and arg_347_1.time_ < var_350_2 + var_350_12 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play319341082 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 319341082
		arg_351_1.duration_ = 2.133

		local var_351_0 = {
			zh = 1.999999999999,
			ja = 2.133
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
				arg_351_0:Play319341083(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["10058ui_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.characterEffect10058ui_story == nil then
				arg_351_1.var_.characterEffect10058ui_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.200000002980232

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect10058ui_story then
					local var_354_4 = Mathf.Lerp(0, 0.5, var_354_3)

					arg_351_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_351_1.var_.characterEffect10058ui_story.fillRatio = var_354_4
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.characterEffect10058ui_story then
				local var_354_5 = 0.5

				arg_351_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_351_1.var_.characterEffect10058ui_story.fillRatio = var_354_5
			end

			local var_354_6 = arg_351_1.actors_["1084ui_story"]
			local var_354_7 = 0

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 and arg_351_1.var_.characterEffect1084ui_story == nil then
				arg_351_1.var_.characterEffect1084ui_story = var_354_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_8 = 0.200000002980232

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_8 then
				local var_354_9 = (arg_351_1.time_ - var_354_7) / var_354_8

				if arg_351_1.var_.characterEffect1084ui_story then
					arg_351_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_7 + var_354_8 and arg_351_1.time_ < var_354_7 + var_354_8 + arg_354_0 and arg_351_1.var_.characterEffect1084ui_story then
				arg_351_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_354_10 = 0

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 then
				arg_351_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_354_11 = 0
			local var_354_12 = 0.125

			if var_354_11 < arg_351_1.time_ and arg_351_1.time_ <= var_354_11 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_13 = arg_351_1:FormatText(StoryNameCfg[6].name)

				arg_351_1.leftNameTxt_.text = var_354_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_14 = arg_351_1:GetWordFromCfg(319341082)
				local var_354_15 = arg_351_1:FormatText(var_354_14.content)

				arg_351_1.text_.text = var_354_15

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_16 = 5
				local var_354_17 = utf8.len(var_354_15)
				local var_354_18 = var_354_16 <= 0 and var_354_12 or var_354_12 * (var_354_17 / var_354_16)

				if var_354_18 > 0 and var_354_12 < var_354_18 then
					arg_351_1.talkMaxDuration = var_354_18

					if var_354_18 + var_354_11 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_18 + var_354_11
					end
				end

				arg_351_1.text_.text = var_354_15
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341082", "story_v_out_319341.awb") ~= 0 then
					local var_354_19 = manager.audio:GetVoiceLength("story_v_out_319341", "319341082", "story_v_out_319341.awb") / 1000

					if var_354_19 + var_354_11 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_19 + var_354_11
					end

					if var_354_14.prefab_name ~= "" and arg_351_1.actors_[var_354_14.prefab_name] ~= nil then
						local var_354_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_14.prefab_name].transform, "story_v_out_319341", "319341082", "story_v_out_319341.awb")

						arg_351_1:RecordAudio("319341082", var_354_20)
						arg_351_1:RecordAudio("319341082", var_354_20)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_319341", "319341082", "story_v_out_319341.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_319341", "319341082", "story_v_out_319341.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_21 = math.max(var_354_12, arg_351_1.talkMaxDuration)

			if var_354_11 <= arg_351_1.time_ and arg_351_1.time_ < var_354_11 + var_354_21 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_11) / var_354_21

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_11 + var_354_21 and arg_351_1.time_ < var_354_11 + var_354_21 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play319341083 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 319341083
		arg_355_1.duration_ = 10.6

		local var_355_0 = {
			zh = 4.6,
			ja = 10.6
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
				arg_355_0:Play319341084(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["10058ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect10058ui_story == nil then
				arg_355_1.var_.characterEffect10058ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect10058ui_story then
					arg_355_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect10058ui_story then
				arg_355_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_358_4 = arg_355_1.actors_["1084ui_story"]
			local var_358_5 = 0

			if var_358_5 < arg_355_1.time_ and arg_355_1.time_ <= var_358_5 + arg_358_0 and arg_355_1.var_.characterEffect1084ui_story == nil then
				arg_355_1.var_.characterEffect1084ui_story = var_358_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_6 = 0.200000002980232

			if var_358_5 <= arg_355_1.time_ and arg_355_1.time_ < var_358_5 + var_358_6 then
				local var_358_7 = (arg_355_1.time_ - var_358_5) / var_358_6

				if arg_355_1.var_.characterEffect1084ui_story then
					local var_358_8 = Mathf.Lerp(0, 0.5, var_358_7)

					arg_355_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1084ui_story.fillRatio = var_358_8
				end
			end

			if arg_355_1.time_ >= var_358_5 + var_358_6 and arg_355_1.time_ < var_358_5 + var_358_6 + arg_358_0 and arg_355_1.var_.characterEffect1084ui_story then
				local var_358_9 = 0.5

				arg_355_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1084ui_story.fillRatio = var_358_9
			end

			local var_358_10 = 0
			local var_358_11 = 0.85

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_12 = arg_355_1:FormatText(StoryNameCfg[471].name)

				arg_355_1.leftNameTxt_.text = var_358_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_13 = arg_355_1:GetWordFromCfg(319341083)
				local var_358_14 = arg_355_1:FormatText(var_358_13.content)

				arg_355_1.text_.text = var_358_14

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_15 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341083", "story_v_out_319341.awb") ~= 0 then
					local var_358_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341083", "story_v_out_319341.awb") / 1000

					if var_358_18 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_18 + var_358_10
					end

					if var_358_13.prefab_name ~= "" and arg_355_1.actors_[var_358_13.prefab_name] ~= nil then
						local var_358_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_13.prefab_name].transform, "story_v_out_319341", "319341083", "story_v_out_319341.awb")

						arg_355_1:RecordAudio("319341083", var_358_19)
						arg_355_1:RecordAudio("319341083", var_358_19)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_319341", "319341083", "story_v_out_319341.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_319341", "319341083", "story_v_out_319341.awb")
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
	Play319341084 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 319341084
		arg_359_1.duration_ = 4.933

		local var_359_0 = {
			zh = 4.933,
			ja = 4.366
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
				arg_359_0:Play319341085(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.6

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[471].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(319341084)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341084", "story_v_out_319341.awb") ~= 0 then
					local var_362_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341084", "story_v_out_319341.awb") / 1000

					if var_362_8 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_8 + var_362_0
					end

					if var_362_3.prefab_name ~= "" and arg_359_1.actors_[var_362_3.prefab_name] ~= nil then
						local var_362_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_3.prefab_name].transform, "story_v_out_319341", "319341084", "story_v_out_319341.awb")

						arg_359_1:RecordAudio("319341084", var_362_9)
						arg_359_1:RecordAudio("319341084", var_362_9)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_319341", "319341084", "story_v_out_319341.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_319341", "319341084", "story_v_out_319341.awb")
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
	Play319341085 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 319341085
		arg_363_1.duration_ = 7.966

		local var_363_0 = {
			zh = 3.066,
			ja = 7.966
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
				arg_363_0:Play319341086(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["10058ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect10058ui_story == nil then
				arg_363_1.var_.characterEffect10058ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect10058ui_story then
					local var_366_4 = Mathf.Lerp(0, 0.5, var_366_3)

					arg_363_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_363_1.var_.characterEffect10058ui_story.fillRatio = var_366_4
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect10058ui_story then
				local var_366_5 = 0.5

				arg_363_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_363_1.var_.characterEffect10058ui_story.fillRatio = var_366_5
			end

			local var_366_6 = arg_363_1.actors_["1084ui_story"]
			local var_366_7 = 0

			if var_366_7 < arg_363_1.time_ and arg_363_1.time_ <= var_366_7 + arg_366_0 and arg_363_1.var_.characterEffect1084ui_story == nil then
				arg_363_1.var_.characterEffect1084ui_story = var_366_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_8 = 0.200000002980232

			if var_366_7 <= arg_363_1.time_ and arg_363_1.time_ < var_366_7 + var_366_8 then
				local var_366_9 = (arg_363_1.time_ - var_366_7) / var_366_8

				if arg_363_1.var_.characterEffect1084ui_story then
					arg_363_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_7 + var_366_8 and arg_363_1.time_ < var_366_7 + var_366_8 + arg_366_0 and arg_363_1.var_.characterEffect1084ui_story then
				arg_363_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_366_10 = 0
			local var_366_11 = 0.3

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_12 = arg_363_1:FormatText(StoryNameCfg[6].name)

				arg_363_1.leftNameTxt_.text = var_366_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_13 = arg_363_1:GetWordFromCfg(319341085)
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341085", "story_v_out_319341.awb") ~= 0 then
					local var_366_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341085", "story_v_out_319341.awb") / 1000

					if var_366_18 + var_366_10 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_10
					end

					if var_366_13.prefab_name ~= "" and arg_363_1.actors_[var_366_13.prefab_name] ~= nil then
						local var_366_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_13.prefab_name].transform, "story_v_out_319341", "319341085", "story_v_out_319341.awb")

						arg_363_1:RecordAudio("319341085", var_366_19)
						arg_363_1:RecordAudio("319341085", var_366_19)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_319341", "319341085", "story_v_out_319341.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_319341", "319341085", "story_v_out_319341.awb")
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
	Play319341086 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 319341086
		arg_367_1.duration_ = 9.433

		local var_367_0 = {
			zh = 4.466,
			ja = 9.433
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
				arg_367_0:Play319341087(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["10058ui_story"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos10058ui_story = var_370_0.localPosition
			end

			local var_370_2 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2
				local var_370_4 = Vector3.New(0.7, -0.98, -6.1)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos10058ui_story, var_370_4, var_370_3)

				local var_370_5 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_5.x, var_370_5.y, var_370_5.z)

				local var_370_6 = var_370_0.localEulerAngles

				var_370_6.z = 0
				var_370_6.x = 0
				var_370_0.localEulerAngles = var_370_6
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_370_7 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_7.x, var_370_7.y, var_370_7.z)

				local var_370_8 = var_370_0.localEulerAngles

				var_370_8.z = 0
				var_370_8.x = 0
				var_370_0.localEulerAngles = var_370_8
			end

			local var_370_9 = arg_367_1.actors_["10058ui_story"]
			local var_370_10 = 0

			if var_370_10 < arg_367_1.time_ and arg_367_1.time_ <= var_370_10 + arg_370_0 and arg_367_1.var_.characterEffect10058ui_story == nil then
				arg_367_1.var_.characterEffect10058ui_story = var_370_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_11 = 0.200000002980232

			if var_370_10 <= arg_367_1.time_ and arg_367_1.time_ < var_370_10 + var_370_11 then
				local var_370_12 = (arg_367_1.time_ - var_370_10) / var_370_11

				if arg_367_1.var_.characterEffect10058ui_story then
					arg_367_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_367_1.time_ >= var_370_10 + var_370_11 and arg_367_1.time_ < var_370_10 + var_370_11 + arg_370_0 and arg_367_1.var_.characterEffect10058ui_story then
				arg_367_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_370_13 = arg_367_1.actors_["1084ui_story"]
			local var_370_14 = 0

			if var_370_14 < arg_367_1.time_ and arg_367_1.time_ <= var_370_14 + arg_370_0 and arg_367_1.var_.characterEffect1084ui_story == nil then
				arg_367_1.var_.characterEffect1084ui_story = var_370_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_15 = 0.200000002980232

			if var_370_14 <= arg_367_1.time_ and arg_367_1.time_ < var_370_14 + var_370_15 then
				local var_370_16 = (arg_367_1.time_ - var_370_14) / var_370_15

				if arg_367_1.var_.characterEffect1084ui_story then
					local var_370_17 = Mathf.Lerp(0, 0.5, var_370_16)

					arg_367_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1084ui_story.fillRatio = var_370_17
				end
			end

			if arg_367_1.time_ >= var_370_14 + var_370_15 and arg_367_1.time_ < var_370_14 + var_370_15 + arg_370_0 and arg_367_1.var_.characterEffect1084ui_story then
				local var_370_18 = 0.5

				arg_367_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1084ui_story.fillRatio = var_370_18
			end

			local var_370_19 = 0

			if var_370_19 < arg_367_1.time_ and arg_367_1.time_ <= var_370_19 + arg_370_0 then
				arg_367_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_370_20 = 0

			if var_370_20 < arg_367_1.time_ and arg_367_1.time_ <= var_370_20 + arg_370_0 then
				arg_367_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_370_21 = 0
			local var_370_22 = 0.55

			if var_370_21 < arg_367_1.time_ and arg_367_1.time_ <= var_370_21 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_23 = arg_367_1:FormatText(StoryNameCfg[471].name)

				arg_367_1.leftNameTxt_.text = var_370_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_24 = arg_367_1:GetWordFromCfg(319341086)
				local var_370_25 = arg_367_1:FormatText(var_370_24.content)

				arg_367_1.text_.text = var_370_25

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_26 = 22
				local var_370_27 = utf8.len(var_370_25)
				local var_370_28 = var_370_26 <= 0 and var_370_22 or var_370_22 * (var_370_27 / var_370_26)

				if var_370_28 > 0 and var_370_22 < var_370_28 then
					arg_367_1.talkMaxDuration = var_370_28

					if var_370_28 + var_370_21 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_28 + var_370_21
					end
				end

				arg_367_1.text_.text = var_370_25
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341086", "story_v_out_319341.awb") ~= 0 then
					local var_370_29 = manager.audio:GetVoiceLength("story_v_out_319341", "319341086", "story_v_out_319341.awb") / 1000

					if var_370_29 + var_370_21 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_29 + var_370_21
					end

					if var_370_24.prefab_name ~= "" and arg_367_1.actors_[var_370_24.prefab_name] ~= nil then
						local var_370_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_24.prefab_name].transform, "story_v_out_319341", "319341086", "story_v_out_319341.awb")

						arg_367_1:RecordAudio("319341086", var_370_30)
						arg_367_1:RecordAudio("319341086", var_370_30)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_319341", "319341086", "story_v_out_319341.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_319341", "319341086", "story_v_out_319341.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_31 = math.max(var_370_22, arg_367_1.talkMaxDuration)

			if var_370_21 <= arg_367_1.time_ and arg_367_1.time_ < var_370_21 + var_370_31 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_21) / var_370_31

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_21 + var_370_31 and arg_367_1.time_ < var_370_21 + var_370_31 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play319341087 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 319341087
		arg_371_1.duration_ = 4.066

		local var_371_0 = {
			zh = 1.999999999999,
			ja = 4.066
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
				arg_371_0:Play319341088(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["10058ui_story"]
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 and arg_371_1.var_.characterEffect10058ui_story == nil then
				arg_371_1.var_.characterEffect10058ui_story = var_374_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_2 = 0.200000002980232

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2

				if arg_371_1.var_.characterEffect10058ui_story then
					local var_374_4 = Mathf.Lerp(0, 0.5, var_374_3)

					arg_371_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_371_1.var_.characterEffect10058ui_story.fillRatio = var_374_4
				end
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 and arg_371_1.var_.characterEffect10058ui_story then
				local var_374_5 = 0.5

				arg_371_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_371_1.var_.characterEffect10058ui_story.fillRatio = var_374_5
			end

			local var_374_6 = arg_371_1.actors_["1084ui_story"]
			local var_374_7 = 0

			if var_374_7 < arg_371_1.time_ and arg_371_1.time_ <= var_374_7 + arg_374_0 and arg_371_1.var_.characterEffect1084ui_story == nil then
				arg_371_1.var_.characterEffect1084ui_story = var_374_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_8 = 0.200000002980232

			if var_374_7 <= arg_371_1.time_ and arg_371_1.time_ < var_374_7 + var_374_8 then
				local var_374_9 = (arg_371_1.time_ - var_374_7) / var_374_8

				if arg_371_1.var_.characterEffect1084ui_story then
					arg_371_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_371_1.time_ >= var_374_7 + var_374_8 and arg_371_1.time_ < var_374_7 + var_374_8 + arg_374_0 and arg_371_1.var_.characterEffect1084ui_story then
				arg_371_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 then
				arg_371_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_374_11 = 0

			if var_374_11 < arg_371_1.time_ and arg_371_1.time_ <= var_374_11 + arg_374_0 then
				arg_371_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_374_12 = 0
			local var_374_13 = 0.075

			if var_374_12 < arg_371_1.time_ and arg_371_1.time_ <= var_374_12 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_14 = arg_371_1:FormatText(StoryNameCfg[6].name)

				arg_371_1.leftNameTxt_.text = var_374_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_15 = arg_371_1:GetWordFromCfg(319341087)
				local var_374_16 = arg_371_1:FormatText(var_374_15.content)

				arg_371_1.text_.text = var_374_16

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_17 = 3
				local var_374_18 = utf8.len(var_374_16)
				local var_374_19 = var_374_17 <= 0 and var_374_13 or var_374_13 * (var_374_18 / var_374_17)

				if var_374_19 > 0 and var_374_13 < var_374_19 then
					arg_371_1.talkMaxDuration = var_374_19

					if var_374_19 + var_374_12 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_19 + var_374_12
					end
				end

				arg_371_1.text_.text = var_374_16
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341087", "story_v_out_319341.awb") ~= 0 then
					local var_374_20 = manager.audio:GetVoiceLength("story_v_out_319341", "319341087", "story_v_out_319341.awb") / 1000

					if var_374_20 + var_374_12 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_20 + var_374_12
					end

					if var_374_15.prefab_name ~= "" and arg_371_1.actors_[var_374_15.prefab_name] ~= nil then
						local var_374_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_15.prefab_name].transform, "story_v_out_319341", "319341087", "story_v_out_319341.awb")

						arg_371_1:RecordAudio("319341087", var_374_21)
						arg_371_1:RecordAudio("319341087", var_374_21)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_319341", "319341087", "story_v_out_319341.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_319341", "319341087", "story_v_out_319341.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_22 = math.max(var_374_13, arg_371_1.talkMaxDuration)

			if var_374_12 <= arg_371_1.time_ and arg_371_1.time_ < var_374_12 + var_374_22 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_12) / var_374_22

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_12 + var_374_22 and arg_371_1.time_ < var_374_12 + var_374_22 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play319341088 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 319341088
		arg_375_1.duration_ = 10.866

		local var_375_0 = {
			zh = 8.9,
			ja = 10.866
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
				arg_375_0:Play319341089(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["10058ui_story"]
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 and arg_375_1.var_.characterEffect10058ui_story == nil then
				arg_375_1.var_.characterEffect10058ui_story = var_378_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_2 = 0.200000002980232

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2

				if arg_375_1.var_.characterEffect10058ui_story then
					arg_375_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 and arg_375_1.var_.characterEffect10058ui_story then
				arg_375_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_378_4 = arg_375_1.actors_["1084ui_story"]
			local var_378_5 = 0

			if var_378_5 < arg_375_1.time_ and arg_375_1.time_ <= var_378_5 + arg_378_0 and arg_375_1.var_.characterEffect1084ui_story == nil then
				arg_375_1.var_.characterEffect1084ui_story = var_378_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_6 = 0.200000002980232

			if var_378_5 <= arg_375_1.time_ and arg_375_1.time_ < var_378_5 + var_378_6 then
				local var_378_7 = (arg_375_1.time_ - var_378_5) / var_378_6

				if arg_375_1.var_.characterEffect1084ui_story then
					local var_378_8 = Mathf.Lerp(0, 0.5, var_378_7)

					arg_375_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1084ui_story.fillRatio = var_378_8
				end
			end

			if arg_375_1.time_ >= var_378_5 + var_378_6 and arg_375_1.time_ < var_378_5 + var_378_6 + arg_378_0 and arg_375_1.var_.characterEffect1084ui_story then
				local var_378_9 = 0.5

				arg_375_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1084ui_story.fillRatio = var_378_9
			end

			local var_378_10 = 0
			local var_378_11 = 0.975

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_12 = arg_375_1:FormatText(StoryNameCfg[471].name)

				arg_375_1.leftNameTxt_.text = var_378_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_13 = arg_375_1:GetWordFromCfg(319341088)
				local var_378_14 = arg_375_1:FormatText(var_378_13.content)

				arg_375_1.text_.text = var_378_14

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_15 = 39
				local var_378_16 = utf8.len(var_378_14)
				local var_378_17 = var_378_15 <= 0 and var_378_11 or var_378_11 * (var_378_16 / var_378_15)

				if var_378_17 > 0 and var_378_11 < var_378_17 then
					arg_375_1.talkMaxDuration = var_378_17

					if var_378_17 + var_378_10 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_17 + var_378_10
					end
				end

				arg_375_1.text_.text = var_378_14
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341088", "story_v_out_319341.awb") ~= 0 then
					local var_378_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341088", "story_v_out_319341.awb") / 1000

					if var_378_18 + var_378_10 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_18 + var_378_10
					end

					if var_378_13.prefab_name ~= "" and arg_375_1.actors_[var_378_13.prefab_name] ~= nil then
						local var_378_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_13.prefab_name].transform, "story_v_out_319341", "319341088", "story_v_out_319341.awb")

						arg_375_1:RecordAudio("319341088", var_378_19)
						arg_375_1:RecordAudio("319341088", var_378_19)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_319341", "319341088", "story_v_out_319341.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_319341", "319341088", "story_v_out_319341.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_20 = math.max(var_378_11, arg_375_1.talkMaxDuration)

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_20 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_10) / var_378_20

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_10 + var_378_20 and arg_375_1.time_ < var_378_10 + var_378_20 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play319341089 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 319341089
		arg_379_1.duration_ = 5.366

		local var_379_0 = {
			zh = 2.9,
			ja = 5.366
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
				arg_379_0:Play319341090(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["10058ui_story"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and arg_379_1.var_.characterEffect10058ui_story == nil then
				arg_379_1.var_.characterEffect10058ui_story = var_382_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_2 = 0.200000002980232

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.characterEffect10058ui_story then
					local var_382_4 = Mathf.Lerp(0, 0.5, var_382_3)

					arg_379_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_379_1.var_.characterEffect10058ui_story.fillRatio = var_382_4
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and arg_379_1.var_.characterEffect10058ui_story then
				local var_382_5 = 0.5

				arg_379_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_379_1.var_.characterEffect10058ui_story.fillRatio = var_382_5
			end

			local var_382_6 = arg_379_1.actors_["1084ui_story"]
			local var_382_7 = 0

			if var_382_7 < arg_379_1.time_ and arg_379_1.time_ <= var_382_7 + arg_382_0 and arg_379_1.var_.characterEffect1084ui_story == nil then
				arg_379_1.var_.characterEffect1084ui_story = var_382_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_8 = 0.200000002980232

			if var_382_7 <= arg_379_1.time_ and arg_379_1.time_ < var_382_7 + var_382_8 then
				local var_382_9 = (arg_379_1.time_ - var_382_7) / var_382_8

				if arg_379_1.var_.characterEffect1084ui_story then
					arg_379_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_7 + var_382_8 and arg_379_1.time_ < var_382_7 + var_382_8 + arg_382_0 and arg_379_1.var_.characterEffect1084ui_story then
				arg_379_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_382_10 = 0
			local var_382_11 = 0.15

			if var_382_10 < arg_379_1.time_ and arg_379_1.time_ <= var_382_10 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_12 = arg_379_1:FormatText(StoryNameCfg[6].name)

				arg_379_1.leftNameTxt_.text = var_382_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_13 = arg_379_1:GetWordFromCfg(319341089)
				local var_382_14 = arg_379_1:FormatText(var_382_13.content)

				arg_379_1.text_.text = var_382_14

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_15 = 6
				local var_382_16 = utf8.len(var_382_14)
				local var_382_17 = var_382_15 <= 0 and var_382_11 or var_382_11 * (var_382_16 / var_382_15)

				if var_382_17 > 0 and var_382_11 < var_382_17 then
					arg_379_1.talkMaxDuration = var_382_17

					if var_382_17 + var_382_10 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_17 + var_382_10
					end
				end

				arg_379_1.text_.text = var_382_14
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341089", "story_v_out_319341.awb") ~= 0 then
					local var_382_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341089", "story_v_out_319341.awb") / 1000

					if var_382_18 + var_382_10 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_18 + var_382_10
					end

					if var_382_13.prefab_name ~= "" and arg_379_1.actors_[var_382_13.prefab_name] ~= nil then
						local var_382_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_13.prefab_name].transform, "story_v_out_319341", "319341089", "story_v_out_319341.awb")

						arg_379_1:RecordAudio("319341089", var_382_19)
						arg_379_1:RecordAudio("319341089", var_382_19)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_319341", "319341089", "story_v_out_319341.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_319341", "319341089", "story_v_out_319341.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_20 = math.max(var_382_11, arg_379_1.talkMaxDuration)

			if var_382_10 <= arg_379_1.time_ and arg_379_1.time_ < var_382_10 + var_382_20 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_10) / var_382_20

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_10 + var_382_20 and arg_379_1.time_ < var_382_10 + var_382_20 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play319341090 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 319341090
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play319341091(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1084ui_story"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and arg_383_1.var_.characterEffect1084ui_story == nil then
				arg_383_1.var_.characterEffect1084ui_story = var_386_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_2 = 0.200000002980232

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.characterEffect1084ui_story then
					local var_386_4 = Mathf.Lerp(0, 0.5, var_386_3)

					arg_383_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_383_1.var_.characterEffect1084ui_story.fillRatio = var_386_4
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and arg_383_1.var_.characterEffect1084ui_story then
				local var_386_5 = 0.5

				arg_383_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_383_1.var_.characterEffect1084ui_story.fillRatio = var_386_5
			end

			local var_386_6 = 0
			local var_386_7 = 0.95

			if var_386_6 < arg_383_1.time_ and arg_383_1.time_ <= var_386_6 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_8 = arg_383_1:GetWordFromCfg(319341090)
				local var_386_9 = arg_383_1:FormatText(var_386_8.content)

				arg_383_1.text_.text = var_386_9

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_10 = 38
				local var_386_11 = utf8.len(var_386_9)
				local var_386_12 = var_386_10 <= 0 and var_386_7 or var_386_7 * (var_386_11 / var_386_10)

				if var_386_12 > 0 and var_386_7 < var_386_12 then
					arg_383_1.talkMaxDuration = var_386_12

					if var_386_12 + var_386_6 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_12 + var_386_6
					end
				end

				arg_383_1.text_.text = var_386_9
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_13 = math.max(var_386_7, arg_383_1.talkMaxDuration)

			if var_386_6 <= arg_383_1.time_ and arg_383_1.time_ < var_386_6 + var_386_13 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_6) / var_386_13

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_6 + var_386_13 and arg_383_1.time_ < var_386_6 + var_386_13 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play319341091 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 319341091
		arg_387_1.duration_ = 10.166

		local var_387_0 = {
			zh = 4.266,
			ja = 10.166
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
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play319341092(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["10058ui_story"]
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 and arg_387_1.var_.characterEffect10058ui_story == nil then
				arg_387_1.var_.characterEffect10058ui_story = var_390_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_2 = 0.200000002980232

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2

				if arg_387_1.var_.characterEffect10058ui_story then
					arg_387_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 and arg_387_1.var_.characterEffect10058ui_story then
				arg_387_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_390_4 = 0

			if var_390_4 < arg_387_1.time_ and arg_387_1.time_ <= var_390_4 + arg_390_0 then
				arg_387_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_390_5 = 0

			if var_390_5 < arg_387_1.time_ and arg_387_1.time_ <= var_390_5 + arg_390_0 then
				arg_387_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_390_6 = 0
			local var_390_7 = 0.5

			if var_390_6 < arg_387_1.time_ and arg_387_1.time_ <= var_390_6 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_8 = arg_387_1:FormatText(StoryNameCfg[471].name)

				arg_387_1.leftNameTxt_.text = var_390_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_9 = arg_387_1:GetWordFromCfg(319341091)
				local var_390_10 = arg_387_1:FormatText(var_390_9.content)

				arg_387_1.text_.text = var_390_10

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_11 = 20
				local var_390_12 = utf8.len(var_390_10)
				local var_390_13 = var_390_11 <= 0 and var_390_7 or var_390_7 * (var_390_12 / var_390_11)

				if var_390_13 > 0 and var_390_7 < var_390_13 then
					arg_387_1.talkMaxDuration = var_390_13

					if var_390_13 + var_390_6 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_13 + var_390_6
					end
				end

				arg_387_1.text_.text = var_390_10
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341091", "story_v_out_319341.awb") ~= 0 then
					local var_390_14 = manager.audio:GetVoiceLength("story_v_out_319341", "319341091", "story_v_out_319341.awb") / 1000

					if var_390_14 + var_390_6 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_14 + var_390_6
					end

					if var_390_9.prefab_name ~= "" and arg_387_1.actors_[var_390_9.prefab_name] ~= nil then
						local var_390_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_9.prefab_name].transform, "story_v_out_319341", "319341091", "story_v_out_319341.awb")

						arg_387_1:RecordAudio("319341091", var_390_15)
						arg_387_1:RecordAudio("319341091", var_390_15)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_319341", "319341091", "story_v_out_319341.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_319341", "319341091", "story_v_out_319341.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_16 = math.max(var_390_7, arg_387_1.talkMaxDuration)

			if var_390_6 <= arg_387_1.time_ and arg_387_1.time_ < var_390_6 + var_390_16 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_6) / var_390_16

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_6 + var_390_16 and arg_387_1.time_ < var_390_6 + var_390_16 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play319341092 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 319341092
		arg_391_1.duration_ = 5.566

		local var_391_0 = {
			zh = 2.5,
			ja = 5.566
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play319341093(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["10058ui_story"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 and arg_391_1.var_.characterEffect10058ui_story == nil then
				arg_391_1.var_.characterEffect10058ui_story = var_394_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_2 = 0.200000002980232

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2

				if arg_391_1.var_.characterEffect10058ui_story then
					local var_394_4 = Mathf.Lerp(0, 0.5, var_394_3)

					arg_391_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_391_1.var_.characterEffect10058ui_story.fillRatio = var_394_4
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 and arg_391_1.var_.characterEffect10058ui_story then
				local var_394_5 = 0.5

				arg_391_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_391_1.var_.characterEffect10058ui_story.fillRatio = var_394_5
			end

			local var_394_6 = arg_391_1.actors_["1084ui_story"]
			local var_394_7 = 0

			if var_394_7 < arg_391_1.time_ and arg_391_1.time_ <= var_394_7 + arg_394_0 and arg_391_1.var_.characterEffect1084ui_story == nil then
				arg_391_1.var_.characterEffect1084ui_story = var_394_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_8 = 0.200000002980232

			if var_394_7 <= arg_391_1.time_ and arg_391_1.time_ < var_394_7 + var_394_8 then
				local var_394_9 = (arg_391_1.time_ - var_394_7) / var_394_8

				if arg_391_1.var_.characterEffect1084ui_story then
					arg_391_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_7 + var_394_8 and arg_391_1.time_ < var_394_7 + var_394_8 + arg_394_0 and arg_391_1.var_.characterEffect1084ui_story then
				arg_391_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_394_10 = 0

			if var_394_10 < arg_391_1.time_ and arg_391_1.time_ <= var_394_10 + arg_394_0 then
				arg_391_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_394_11 = 0

			if var_394_11 < arg_391_1.time_ and arg_391_1.time_ <= var_394_11 + arg_394_0 then
				arg_391_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4713")
			end

			local var_394_12 = 0
			local var_394_13 = 0.2

			if var_394_12 < arg_391_1.time_ and arg_391_1.time_ <= var_394_12 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_14 = arg_391_1:FormatText(StoryNameCfg[6].name)

				arg_391_1.leftNameTxt_.text = var_394_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_15 = arg_391_1:GetWordFromCfg(319341092)
				local var_394_16 = arg_391_1:FormatText(var_394_15.content)

				arg_391_1.text_.text = var_394_16

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_17 = 8
				local var_394_18 = utf8.len(var_394_16)
				local var_394_19 = var_394_17 <= 0 and var_394_13 or var_394_13 * (var_394_18 / var_394_17)

				if var_394_19 > 0 and var_394_13 < var_394_19 then
					arg_391_1.talkMaxDuration = var_394_19

					if var_394_19 + var_394_12 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_19 + var_394_12
					end
				end

				arg_391_1.text_.text = var_394_16
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341092", "story_v_out_319341.awb") ~= 0 then
					local var_394_20 = manager.audio:GetVoiceLength("story_v_out_319341", "319341092", "story_v_out_319341.awb") / 1000

					if var_394_20 + var_394_12 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_20 + var_394_12
					end

					if var_394_15.prefab_name ~= "" and arg_391_1.actors_[var_394_15.prefab_name] ~= nil then
						local var_394_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_15.prefab_name].transform, "story_v_out_319341", "319341092", "story_v_out_319341.awb")

						arg_391_1:RecordAudio("319341092", var_394_21)
						arg_391_1:RecordAudio("319341092", var_394_21)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_319341", "319341092", "story_v_out_319341.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_319341", "319341092", "story_v_out_319341.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_22 = math.max(var_394_13, arg_391_1.talkMaxDuration)

			if var_394_12 <= arg_391_1.time_ and arg_391_1.time_ < var_394_12 + var_394_22 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_12) / var_394_22

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_12 + var_394_22 and arg_391_1.time_ < var_394_12 + var_394_22 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play319341093 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 319341093
		arg_395_1.duration_ = 4.333

		local var_395_0 = {
			zh = 3.033,
			ja = 4.333
		}
		local var_395_1 = manager.audio:GetLocalizationFlag()

		if var_395_0[var_395_1] ~= nil then
			arg_395_1.duration_ = var_395_0[var_395_1]
		end

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play319341094(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["10058ui_story"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and arg_395_1.var_.characterEffect10058ui_story == nil then
				arg_395_1.var_.characterEffect10058ui_story = var_398_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_2 = 0.200000002980232

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.characterEffect10058ui_story then
					arg_395_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and arg_395_1.var_.characterEffect10058ui_story then
				arg_395_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_398_4 = arg_395_1.actors_["1084ui_story"]
			local var_398_5 = 0

			if var_398_5 < arg_395_1.time_ and arg_395_1.time_ <= var_398_5 + arg_398_0 and arg_395_1.var_.characterEffect1084ui_story == nil then
				arg_395_1.var_.characterEffect1084ui_story = var_398_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_6 = 0.200000002980232

			if var_398_5 <= arg_395_1.time_ and arg_395_1.time_ < var_398_5 + var_398_6 then
				local var_398_7 = (arg_395_1.time_ - var_398_5) / var_398_6

				if arg_395_1.var_.characterEffect1084ui_story then
					local var_398_8 = Mathf.Lerp(0, 0.5, var_398_7)

					arg_395_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1084ui_story.fillRatio = var_398_8
				end
			end

			if arg_395_1.time_ >= var_398_5 + var_398_6 and arg_395_1.time_ < var_398_5 + var_398_6 + arg_398_0 and arg_395_1.var_.characterEffect1084ui_story then
				local var_398_9 = 0.5

				arg_395_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1084ui_story.fillRatio = var_398_9
			end

			local var_398_10 = 0
			local var_398_11 = 0.425

			if var_398_10 < arg_395_1.time_ and arg_395_1.time_ <= var_398_10 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_12 = arg_395_1:FormatText(StoryNameCfg[471].name)

				arg_395_1.leftNameTxt_.text = var_398_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_13 = arg_395_1:GetWordFromCfg(319341093)
				local var_398_14 = arg_395_1:FormatText(var_398_13.content)

				arg_395_1.text_.text = var_398_14

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_15 = 17
				local var_398_16 = utf8.len(var_398_14)
				local var_398_17 = var_398_15 <= 0 and var_398_11 or var_398_11 * (var_398_16 / var_398_15)

				if var_398_17 > 0 and var_398_11 < var_398_17 then
					arg_395_1.talkMaxDuration = var_398_17

					if var_398_17 + var_398_10 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_17 + var_398_10
					end
				end

				arg_395_1.text_.text = var_398_14
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341093", "story_v_out_319341.awb") ~= 0 then
					local var_398_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341093", "story_v_out_319341.awb") / 1000

					if var_398_18 + var_398_10 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_18 + var_398_10
					end

					if var_398_13.prefab_name ~= "" and arg_395_1.actors_[var_398_13.prefab_name] ~= nil then
						local var_398_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_13.prefab_name].transform, "story_v_out_319341", "319341093", "story_v_out_319341.awb")

						arg_395_1:RecordAudio("319341093", var_398_19)
						arg_395_1:RecordAudio("319341093", var_398_19)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_319341", "319341093", "story_v_out_319341.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_319341", "319341093", "story_v_out_319341.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_20 = math.max(var_398_11, arg_395_1.talkMaxDuration)

			if var_398_10 <= arg_395_1.time_ and arg_395_1.time_ < var_398_10 + var_398_20 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_10) / var_398_20

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_10 + var_398_20 and arg_395_1.time_ < var_398_10 + var_398_20 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play319341094 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 319341094
		arg_399_1.duration_ = 2.433333333332

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play319341095(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["10058ui_story"].transform
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 then
				arg_399_1.var_.moveOldPos10058ui_story = var_402_0.localPosition
			end

			local var_402_2 = 0.001

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2
				local var_402_4 = Vector3.New(0, 100, 0)

				var_402_0.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos10058ui_story, var_402_4, var_402_3)

				local var_402_5 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_5.x, var_402_5.y, var_402_5.z)

				local var_402_6 = var_402_0.localEulerAngles

				var_402_6.z = 0
				var_402_6.x = 0
				var_402_0.localEulerAngles = var_402_6
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 then
				var_402_0.localPosition = Vector3.New(0, 100, 0)

				local var_402_7 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_7.x, var_402_7.y, var_402_7.z)

				local var_402_8 = var_402_0.localEulerAngles

				var_402_8.z = 0
				var_402_8.x = 0
				var_402_0.localEulerAngles = var_402_8
			end

			local var_402_9 = 0

			if var_402_9 < arg_399_1.time_ and arg_399_1.time_ <= var_402_9 + arg_402_0 then
				local var_402_10 = manager.ui.mainCamera.transform.localPosition
				local var_402_11 = Vector3.New(0, 0, 10) + Vector3.New(var_402_10.x, var_402_10.y, 0)
				local var_402_12 = arg_399_1.bgs_.STblack

				var_402_12.transform.localPosition = var_402_11
				var_402_12.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_402_13 = var_402_12:GetComponent("SpriteRenderer")

				if var_402_13 and var_402_13.sprite then
					local var_402_14 = (var_402_12.transform.localPosition - var_402_10).z
					local var_402_15 = manager.ui.mainCameraCom_
					local var_402_16 = 2 * var_402_14 * Mathf.Tan(var_402_15.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_402_17 = var_402_16 * var_402_15.aspect
					local var_402_18 = var_402_13.sprite.bounds.size.x
					local var_402_19 = var_402_13.sprite.bounds.size.y
					local var_402_20 = var_402_17 / var_402_18
					local var_402_21 = var_402_16 / var_402_19
					local var_402_22 = var_402_21 < var_402_20 and var_402_20 or var_402_21

					var_402_12.transform.localScale = Vector3.New(var_402_22, var_402_22, 0)
				end

				for iter_402_0, iter_402_1 in pairs(arg_399_1.bgs_) do
					if iter_402_0 ~= "STblack" then
						iter_402_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_402_23 = arg_399_1.actors_["1084ui_story"].transform
			local var_402_24 = 0

			if var_402_24 < arg_399_1.time_ and arg_399_1.time_ <= var_402_24 + arg_402_0 then
				arg_399_1.var_.moveOldPos1084ui_story = var_402_23.localPosition
			end

			local var_402_25 = 0.001

			if var_402_24 <= arg_399_1.time_ and arg_399_1.time_ < var_402_24 + var_402_25 then
				local var_402_26 = (arg_399_1.time_ - var_402_24) / var_402_25
				local var_402_27 = Vector3.New(0, 100, 0)

				var_402_23.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos1084ui_story, var_402_27, var_402_26)

				local var_402_28 = manager.ui.mainCamera.transform.position - var_402_23.position

				var_402_23.forward = Vector3.New(var_402_28.x, var_402_28.y, var_402_28.z)

				local var_402_29 = var_402_23.localEulerAngles

				var_402_29.z = 0
				var_402_29.x = 0
				var_402_23.localEulerAngles = var_402_29
			end

			if arg_399_1.time_ >= var_402_24 + var_402_25 and arg_399_1.time_ < var_402_24 + var_402_25 + arg_402_0 then
				var_402_23.localPosition = Vector3.New(0, 100, 0)

				local var_402_30 = manager.ui.mainCamera.transform.position - var_402_23.position

				var_402_23.forward = Vector3.New(var_402_30.x, var_402_30.y, var_402_30.z)

				local var_402_31 = var_402_23.localEulerAngles

				var_402_31.z = 0
				var_402_31.x = 0
				var_402_23.localEulerAngles = var_402_31
			end

			local var_402_32 = 4.44089209850063e-16

			if var_402_32 < arg_399_1.time_ and arg_399_1.time_ <= var_402_32 + arg_402_0 then
				local var_402_33 = arg_399_1.fswbg_.transform:Find("textbox/adapt/content") or arg_399_1.fswbg_.transform:Find("textbox/content")
				local var_402_34 = var_402_33:GetComponent("Text")
				local var_402_35 = var_402_33:GetComponent("RectTransform")

				var_402_34.alignment = UnityEngine.TextAnchor.LowerCenter
				var_402_35.offsetMin = Vector2.New(0, 0)
				var_402_35.offsetMax = Vector2.New(0, 0)
			end

			local var_402_36 = 0

			if var_402_36 < arg_399_1.time_ and arg_399_1.time_ <= var_402_36 + arg_402_0 then
				arg_399_1.fswbg_:SetActive(true)
				arg_399_1.dialog_:SetActive(false)

				arg_399_1.fswtw_.percent = 0

				local var_402_37 = arg_399_1:GetWordFromCfg(319341094)
				local var_402_38 = arg_399_1:FormatText(var_402_37.content)

				arg_399_1.fswt_.text = var_402_38

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.fswt_)

				arg_399_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_399_1.fswtw_:SetDirty()

				arg_399_1.typewritterCharCountI18N = 0

				SetActive(arg_399_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_399_1:ShowNextGo(false)
			end

			local var_402_39 = 0.333333333333333

			if var_402_39 < arg_399_1.time_ and arg_399_1.time_ <= var_402_39 + arg_402_0 then
				arg_399_1.var_.oldValueTypewriter = arg_399_1.fswtw_.percent

				arg_399_1:ShowNextGo(false)
			end

			local var_402_40 = 10
			local var_402_41 = 0.666666666666667
			local var_402_42 = arg_399_1:GetWordFromCfg(319341094)
			local var_402_43 = arg_399_1:FormatText(var_402_42.content)
			local var_402_44, var_402_45 = arg_399_1:GetPercentByPara(var_402_43, 1)

			if var_402_39 < arg_399_1.time_ and arg_399_1.time_ <= var_402_39 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0

				local var_402_46 = var_402_40 <= 0 and var_402_41 or var_402_41 * ((var_402_45 - arg_399_1.typewritterCharCountI18N) / var_402_40)

				if var_402_46 > 0 and var_402_41 < var_402_46 then
					arg_399_1.talkMaxDuration = var_402_46

					if var_402_46 + var_402_39 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_46 + var_402_39
					end
				end
			end

			local var_402_47 = 0.666666666666667
			local var_402_48 = math.max(var_402_47, arg_399_1.talkMaxDuration)

			if var_402_39 <= arg_399_1.time_ and arg_399_1.time_ < var_402_39 + var_402_48 then
				local var_402_49 = (arg_399_1.time_ - var_402_39) / var_402_48

				arg_399_1.fswtw_.percent = Mathf.Lerp(arg_399_1.var_.oldValueTypewriter, var_402_44, var_402_49)
				arg_399_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_399_1.fswtw_:SetDirty()
			end

			if arg_399_1.time_ >= var_402_39 + var_402_48 and arg_399_1.time_ < var_402_39 + var_402_48 + arg_402_0 then
				arg_399_1.fswtw_.percent = var_402_44

				arg_399_1.fswtw_:SetDirty()
				arg_399_1:ShowNextGo(true)

				arg_399_1.typewritterCharCountI18N = var_402_45
			end

			local var_402_50 = 4.44089209850063e-16

			if var_402_50 < arg_399_1.time_ and arg_399_1.time_ <= var_402_50 + arg_402_0 then
				arg_399_1.cswbg_:SetActive(true)

				local var_402_51 = arg_399_1.cswt_:GetComponent("RectTransform")

				arg_399_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_402_51.offsetMin = Vector2.New(410, 330)
				var_402_51.offsetMax = Vector2.New(-400, -175)

				local var_402_52 = arg_399_1:GetWordFromCfg(419012)
				local var_402_53 = arg_399_1:FormatText(var_402_52.content)

				arg_399_1.cswt_.text = var_402_53

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.cswt_)

				arg_399_1.cswt_.fontSize = 180
				arg_399_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_399_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_402_54 = 0.333333333333333
			local var_402_55 = 2.1
			local var_402_56 = manager.audio:GetVoiceLength("story_v_out_319341", "319341094", "story_v_out_319341.awb") / 1000

			if var_402_56 > 0 and var_402_55 < var_402_56 and var_402_56 + var_402_54 > arg_399_1.duration_ then
				local var_402_57 = var_402_56

				arg_399_1.duration_ = var_402_56 + var_402_54
			end

			if var_402_54 < arg_399_1.time_ and arg_399_1.time_ <= var_402_54 + arg_402_0 then
				local var_402_58 = "play"
				local var_402_59 = "voice"

				arg_399_1:AudioAction(var_402_58, var_402_59, "story_v_out_319341", "319341094", "story_v_out_319341.awb")
			end
		end
	end,
	Play319341095 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 319341095
		arg_403_1.duration_ = 1.399999999999

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play319341096(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = 0

			if var_406_0 < arg_403_1.time_ and arg_403_1.time_ <= var_406_0 + arg_406_0 then
				arg_403_1.fswbg_:SetActive(true)
				arg_403_1.dialog_:SetActive(false)

				arg_403_1.fswtw_.percent = 0

				local var_406_1 = arg_403_1:GetWordFromCfg(319341095)
				local var_406_2 = arg_403_1:FormatText(var_406_1.content)

				arg_403_1.fswt_.text = var_406_2

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.fswt_)

				arg_403_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_403_1.fswtw_:SetDirty()

				arg_403_1.typewritterCharCountI18N = 0

				SetActive(arg_403_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_403_1:ShowNextGo(false)
			end

			local var_406_3 = 0.1

			if var_406_3 < arg_403_1.time_ and arg_403_1.time_ <= var_406_3 + arg_406_0 then
				arg_403_1.var_.oldValueTypewriter = arg_403_1.fswtw_.percent

				arg_403_1:ShowNextGo(false)
			end

			local var_406_4 = 4
			local var_406_5 = 0.266666666666667
			local var_406_6 = arg_403_1:GetWordFromCfg(319341095)
			local var_406_7 = arg_403_1:FormatText(var_406_6.content)
			local var_406_8, var_406_9 = arg_403_1:GetPercentByPara(var_406_7, 1)

			if var_406_3 < arg_403_1.time_ and arg_403_1.time_ <= var_406_3 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0

				local var_406_10 = var_406_4 <= 0 and var_406_5 or var_406_5 * ((var_406_9 - arg_403_1.typewritterCharCountI18N) / var_406_4)

				if var_406_10 > 0 and var_406_5 < var_406_10 then
					arg_403_1.talkMaxDuration = var_406_10

					if var_406_10 + var_406_3 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_10 + var_406_3
					end
				end
			end

			local var_406_11 = 0.266666666666667
			local var_406_12 = math.max(var_406_11, arg_403_1.talkMaxDuration)

			if var_406_3 <= arg_403_1.time_ and arg_403_1.time_ < var_406_3 + var_406_12 then
				local var_406_13 = (arg_403_1.time_ - var_406_3) / var_406_12

				arg_403_1.fswtw_.percent = Mathf.Lerp(arg_403_1.var_.oldValueTypewriter, var_406_8, var_406_13)
				arg_403_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_403_1.fswtw_:SetDirty()
			end

			if arg_403_1.time_ >= var_406_3 + var_406_12 and arg_403_1.time_ < var_406_3 + var_406_12 + arg_406_0 then
				arg_403_1.fswtw_.percent = var_406_8

				arg_403_1.fswtw_:SetDirty()
				arg_403_1:ShowNextGo(true)

				arg_403_1.typewritterCharCountI18N = var_406_9
			end

			local var_406_14 = 0.1
			local var_406_15 = 1.3
			local var_406_16 = manager.audio:GetVoiceLength("story_v_out_319341", "319341095", "story_v_out_319341.awb") / 1000

			if var_406_16 > 0 and var_406_15 < var_406_16 and var_406_16 + var_406_14 > arg_403_1.duration_ then
				local var_406_17 = var_406_16

				arg_403_1.duration_ = var_406_16 + var_406_14
			end

			if var_406_14 < arg_403_1.time_ and arg_403_1.time_ <= var_406_14 + arg_406_0 then
				local var_406_18 = "play"
				local var_406_19 = "voice"

				arg_403_1:AudioAction(var_406_18, var_406_19, "story_v_out_319341", "319341095", "story_v_out_319341.awb")
			end
		end
	end,
	Play319341096 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 319341096
		arg_407_1.duration_ = 13.966

		local var_407_0 = {
			zh = 12.366,
			ja = 13.966
		}
		local var_407_1 = manager.audio:GetLocalizationFlag()

		if var_407_0[var_407_1] ~= nil then
			arg_407_1.duration_ = var_407_0[var_407_1]
		end

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play319341097(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0

			if var_410_0 < arg_407_1.time_ and arg_407_1.time_ <= var_410_0 + arg_410_0 then
				local var_410_1 = manager.ui.mainCamera.transform.localPosition
				local var_410_2 = Vector3.New(0, 0, 10) + Vector3.New(var_410_1.x, var_410_1.y, 0)
				local var_410_3 = arg_407_1.bgs_.I11o

				var_410_3.transform.localPosition = var_410_2
				var_410_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_410_4 = var_410_3:GetComponent("SpriteRenderer")

				if var_410_4 and var_410_4.sprite then
					local var_410_5 = (var_410_3.transform.localPosition - var_410_1).z
					local var_410_6 = manager.ui.mainCameraCom_
					local var_410_7 = 2 * var_410_5 * Mathf.Tan(var_410_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_410_8 = var_410_7 * var_410_6.aspect
					local var_410_9 = var_410_4.sprite.bounds.size.x
					local var_410_10 = var_410_4.sprite.bounds.size.y
					local var_410_11 = var_410_8 / var_410_9
					local var_410_12 = var_410_7 / var_410_10
					local var_410_13 = var_410_12 < var_410_11 and var_410_11 or var_410_12

					var_410_3.transform.localScale = Vector3.New(var_410_13, var_410_13, 0)
				end

				for iter_410_0, iter_410_1 in pairs(arg_407_1.bgs_) do
					if iter_410_0 ~= "I11o" then
						iter_410_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_410_14 = arg_407_1.actors_["1084ui_story"]
			local var_410_15 = 0

			if var_410_15 < arg_407_1.time_ and arg_407_1.time_ <= var_410_15 + arg_410_0 and arg_407_1.var_.characterEffect1084ui_story == nil then
				arg_407_1.var_.characterEffect1084ui_story = var_410_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_16 = 0.200000002980232

			if var_410_15 <= arg_407_1.time_ and arg_407_1.time_ < var_410_15 + var_410_16 then
				local var_410_17 = (arg_407_1.time_ - var_410_15) / var_410_16

				if arg_407_1.var_.characterEffect1084ui_story then
					local var_410_18 = Mathf.Lerp(0, 0.5, var_410_17)

					arg_407_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_407_1.var_.characterEffect1084ui_story.fillRatio = var_410_18
				end
			end

			if arg_407_1.time_ >= var_410_15 + var_410_16 and arg_407_1.time_ < var_410_15 + var_410_16 + arg_410_0 and arg_407_1.var_.characterEffect1084ui_story then
				local var_410_19 = 0.5

				arg_407_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_407_1.var_.characterEffect1084ui_story.fillRatio = var_410_19
			end

			local var_410_20 = arg_407_1.actors_["10058ui_story"]
			local var_410_21 = 0

			if var_410_21 < arg_407_1.time_ and arg_407_1.time_ <= var_410_21 + arg_410_0 and arg_407_1.var_.characterEffect10058ui_story == nil then
				arg_407_1.var_.characterEffect10058ui_story = var_410_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_22 = 0.200000002980232

			if var_410_21 <= arg_407_1.time_ and arg_407_1.time_ < var_410_21 + var_410_22 then
				local var_410_23 = (arg_407_1.time_ - var_410_21) / var_410_22

				if arg_407_1.var_.characterEffect10058ui_story then
					arg_407_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_407_1.time_ >= var_410_21 + var_410_22 and arg_407_1.time_ < var_410_21 + var_410_22 + arg_410_0 and arg_407_1.var_.characterEffect10058ui_story then
				arg_407_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_410_24 = 0

			if var_410_24 < arg_407_1.time_ and arg_407_1.time_ <= var_410_24 + arg_410_0 then
				arg_407_1.fswbg_:SetActive(false)
				arg_407_1.dialog_:SetActive(false)
				arg_407_1:ShowNextGo(false)
			end

			local var_410_25 = 0.233333333333334

			if var_410_25 < arg_407_1.time_ and arg_407_1.time_ <= var_410_25 + arg_410_0 then
				arg_407_1.fswbg_:SetActive(false)
				arg_407_1.dialog_:SetActive(false)
				arg_407_1:ShowNextGo(false)
			end

			local var_410_26 = 4.44089209850063e-16

			if var_410_26 < arg_407_1.time_ and arg_407_1.time_ <= var_410_26 + arg_410_0 then
				arg_407_1.cswbg_:SetActive(false)
			end

			local var_410_27 = arg_407_1.actors_["10058ui_story"].transform
			local var_410_28 = 1.46666666666667

			if var_410_28 < arg_407_1.time_ and arg_407_1.time_ <= var_410_28 + arg_410_0 then
				arg_407_1.var_.moveOldPos10058ui_story = var_410_27.localPosition
			end

			local var_410_29 = 0.001

			if var_410_28 <= arg_407_1.time_ and arg_407_1.time_ < var_410_28 + var_410_29 then
				local var_410_30 = (arg_407_1.time_ - var_410_28) / var_410_29
				local var_410_31 = Vector3.New(0, -0.98, -6.1)

				var_410_27.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos10058ui_story, var_410_31, var_410_30)

				local var_410_32 = manager.ui.mainCamera.transform.position - var_410_27.position

				var_410_27.forward = Vector3.New(var_410_32.x, var_410_32.y, var_410_32.z)

				local var_410_33 = var_410_27.localEulerAngles

				var_410_33.z = 0
				var_410_33.x = 0
				var_410_27.localEulerAngles = var_410_33
			end

			if arg_407_1.time_ >= var_410_28 + var_410_29 and arg_407_1.time_ < var_410_28 + var_410_29 + arg_410_0 then
				var_410_27.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_410_34 = manager.ui.mainCamera.transform.position - var_410_27.position

				var_410_27.forward = Vector3.New(var_410_34.x, var_410_34.y, var_410_34.z)

				local var_410_35 = var_410_27.localEulerAngles

				var_410_35.z = 0
				var_410_35.x = 0
				var_410_27.localEulerAngles = var_410_35
			end

			local var_410_36 = arg_407_1.actors_["10058ui_story"]
			local var_410_37 = 1.46666666666667

			if var_410_37 < arg_407_1.time_ and arg_407_1.time_ <= var_410_37 + arg_410_0 and arg_407_1.var_.characterEffect10058ui_story == nil then
				arg_407_1.var_.characterEffect10058ui_story = var_410_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_38 = 0.200000002980232

			if var_410_37 <= arg_407_1.time_ and arg_407_1.time_ < var_410_37 + var_410_38 then
				local var_410_39 = (arg_407_1.time_ - var_410_37) / var_410_38

				if arg_407_1.var_.characterEffect10058ui_story then
					arg_407_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_407_1.time_ >= var_410_37 + var_410_38 and arg_407_1.time_ < var_410_37 + var_410_38 + arg_410_0 and arg_407_1.var_.characterEffect10058ui_story then
				arg_407_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_410_40 = 1.46666666666667

			if var_410_40 < arg_407_1.time_ and arg_407_1.time_ <= var_410_40 + arg_410_0 then
				arg_407_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			if arg_407_1.frameCnt_ <= 1 then
				arg_407_1.dialog_:SetActive(false)
			end

			local var_410_41 = 1.3
			local var_410_42 = 1.35

			if var_410_41 < arg_407_1.time_ and arg_407_1.time_ <= var_410_41 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0

				arg_407_1.dialog_:SetActive(true)

				local var_410_43 = LeanTween.value(arg_407_1.dialog_, 0, 1, 0.3)

				var_410_43:setOnUpdate(LuaHelper.FloatAction(function(arg_411_0)
					arg_407_1.dialogCg_.alpha = arg_411_0
				end))
				var_410_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_407_1.dialog_)
					var_410_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_407_1.duration_ = arg_407_1.duration_ + 0.3

				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_44 = arg_407_1:FormatText(StoryNameCfg[471].name)

				arg_407_1.leftNameTxt_.text = var_410_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_45 = arg_407_1:GetWordFromCfg(319341096)
				local var_410_46 = arg_407_1:FormatText(var_410_45.content)

				arg_407_1.text_.text = var_410_46

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_47 = 54
				local var_410_48 = utf8.len(var_410_46)
				local var_410_49 = var_410_47 <= 0 and var_410_42 or var_410_42 * (var_410_48 / var_410_47)

				if var_410_49 > 0 and var_410_42 < var_410_49 then
					arg_407_1.talkMaxDuration = var_410_49
					var_410_41 = var_410_41 + 0.3

					if var_410_49 + var_410_41 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_49 + var_410_41
					end
				end

				arg_407_1.text_.text = var_410_46
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341096", "story_v_out_319341.awb") ~= 0 then
					local var_410_50 = manager.audio:GetVoiceLength("story_v_out_319341", "319341096", "story_v_out_319341.awb") / 1000

					if var_410_50 + var_410_41 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_50 + var_410_41
					end

					if var_410_45.prefab_name ~= "" and arg_407_1.actors_[var_410_45.prefab_name] ~= nil then
						local var_410_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_45.prefab_name].transform, "story_v_out_319341", "319341096", "story_v_out_319341.awb")

						arg_407_1:RecordAudio("319341096", var_410_51)
						arg_407_1:RecordAudio("319341096", var_410_51)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_319341", "319341096", "story_v_out_319341.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_319341", "319341096", "story_v_out_319341.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_52 = var_410_41 + 0.3
			local var_410_53 = math.max(var_410_42, arg_407_1.talkMaxDuration)

			if var_410_52 <= arg_407_1.time_ and arg_407_1.time_ < var_410_52 + var_410_53 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_52) / var_410_53

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_52 + var_410_53 and arg_407_1.time_ < var_410_52 + var_410_53 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play319341097 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 319341097
		arg_413_1.duration_ = 10.6

		local var_413_0 = {
			zh = 5.8,
			ja = 10.6
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
				arg_413_0:Play319341098(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0
			local var_416_1 = 0.675

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_2 = arg_413_1:FormatText(StoryNameCfg[471].name)

				arg_413_1.leftNameTxt_.text = var_416_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_3 = arg_413_1:GetWordFromCfg(319341097)
				local var_416_4 = arg_413_1:FormatText(var_416_3.content)

				arg_413_1.text_.text = var_416_4

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_5 = 27
				local var_416_6 = utf8.len(var_416_4)
				local var_416_7 = var_416_5 <= 0 and var_416_1 or var_416_1 * (var_416_6 / var_416_5)

				if var_416_7 > 0 and var_416_1 < var_416_7 then
					arg_413_1.talkMaxDuration = var_416_7

					if var_416_7 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_7 + var_416_0
					end
				end

				arg_413_1.text_.text = var_416_4
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341097", "story_v_out_319341.awb") ~= 0 then
					local var_416_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341097", "story_v_out_319341.awb") / 1000

					if var_416_8 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_8 + var_416_0
					end

					if var_416_3.prefab_name ~= "" and arg_413_1.actors_[var_416_3.prefab_name] ~= nil then
						local var_416_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_3.prefab_name].transform, "story_v_out_319341", "319341097", "story_v_out_319341.awb")

						arg_413_1:RecordAudio("319341097", var_416_9)
						arg_413_1:RecordAudio("319341097", var_416_9)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_319341", "319341097", "story_v_out_319341.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_319341", "319341097", "story_v_out_319341.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_10 = math.max(var_416_1, arg_413_1.talkMaxDuration)

			if var_416_0 <= arg_413_1.time_ and arg_413_1.time_ < var_416_0 + var_416_10 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_0) / var_416_10

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_0 + var_416_10 and arg_413_1.time_ < var_416_0 + var_416_10 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play319341098 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 319341098
		arg_417_1.duration_ = 2.666

		local var_417_0 = {
			zh = 1.999999999999,
			ja = 2.666
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
				arg_417_0:Play319341099(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["10058ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect10058ui_story == nil then
				arg_417_1.var_.characterEffect10058ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.200000002980232

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect10058ui_story then
					local var_420_4 = Mathf.Lerp(0, 0.5, var_420_3)

					arg_417_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_417_1.var_.characterEffect10058ui_story.fillRatio = var_420_4
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect10058ui_story then
				local var_420_5 = 0.5

				arg_417_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_417_1.var_.characterEffect10058ui_story.fillRatio = var_420_5
			end

			local var_420_6 = arg_417_1.actors_["1084ui_story"]
			local var_420_7 = 0

			if var_420_7 < arg_417_1.time_ and arg_417_1.time_ <= var_420_7 + arg_420_0 and arg_417_1.var_.characterEffect1084ui_story == nil then
				arg_417_1.var_.characterEffect1084ui_story = var_420_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_8 = 0.200000002980232

			if var_420_7 <= arg_417_1.time_ and arg_417_1.time_ < var_420_7 + var_420_8 then
				local var_420_9 = (arg_417_1.time_ - var_420_7) / var_420_8

				if arg_417_1.var_.characterEffect1084ui_story then
					arg_417_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_7 + var_420_8 and arg_417_1.time_ < var_420_7 + var_420_8 + arg_420_0 and arg_417_1.var_.characterEffect1084ui_story then
				arg_417_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 then
				arg_417_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_420_11 = 0

			if var_420_11 < arg_417_1.time_ and arg_417_1.time_ <= var_420_11 + arg_420_0 then
				arg_417_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_420_12 = arg_417_1.actors_["1084ui_story"].transform
			local var_420_13 = 0

			if var_420_13 < arg_417_1.time_ and arg_417_1.time_ <= var_420_13 + arg_420_0 then
				arg_417_1.var_.moveOldPos1084ui_story = var_420_12.localPosition
			end

			local var_420_14 = 0.001

			if var_420_13 <= arg_417_1.time_ and arg_417_1.time_ < var_420_13 + var_420_14 then
				local var_420_15 = (arg_417_1.time_ - var_420_13) / var_420_14
				local var_420_16 = Vector3.New(-0.7, -0.97, -6)

				var_420_12.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1084ui_story, var_420_16, var_420_15)

				local var_420_17 = manager.ui.mainCamera.transform.position - var_420_12.position

				var_420_12.forward = Vector3.New(var_420_17.x, var_420_17.y, var_420_17.z)

				local var_420_18 = var_420_12.localEulerAngles

				var_420_18.z = 0
				var_420_18.x = 0
				var_420_12.localEulerAngles = var_420_18
			end

			if arg_417_1.time_ >= var_420_13 + var_420_14 and arg_417_1.time_ < var_420_13 + var_420_14 + arg_420_0 then
				var_420_12.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_420_19 = manager.ui.mainCamera.transform.position - var_420_12.position

				var_420_12.forward = Vector3.New(var_420_19.x, var_420_19.y, var_420_19.z)

				local var_420_20 = var_420_12.localEulerAngles

				var_420_20.z = 0
				var_420_20.x = 0
				var_420_12.localEulerAngles = var_420_20
			end

			local var_420_21 = arg_417_1.actors_["10058ui_story"].transform
			local var_420_22 = 0

			if var_420_22 < arg_417_1.time_ and arg_417_1.time_ <= var_420_22 + arg_420_0 then
				arg_417_1.var_.moveOldPos10058ui_story = var_420_21.localPosition
			end

			local var_420_23 = 0.001

			if var_420_22 <= arg_417_1.time_ and arg_417_1.time_ < var_420_22 + var_420_23 then
				local var_420_24 = (arg_417_1.time_ - var_420_22) / var_420_23
				local var_420_25 = Vector3.New(0.7, -0.98, -6.1)

				var_420_21.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos10058ui_story, var_420_25, var_420_24)

				local var_420_26 = manager.ui.mainCamera.transform.position - var_420_21.position

				var_420_21.forward = Vector3.New(var_420_26.x, var_420_26.y, var_420_26.z)

				local var_420_27 = var_420_21.localEulerAngles

				var_420_27.z = 0
				var_420_27.x = 0
				var_420_21.localEulerAngles = var_420_27
			end

			if arg_417_1.time_ >= var_420_22 + var_420_23 and arg_417_1.time_ < var_420_22 + var_420_23 + arg_420_0 then
				var_420_21.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_420_28 = manager.ui.mainCamera.transform.position - var_420_21.position

				var_420_21.forward = Vector3.New(var_420_28.x, var_420_28.y, var_420_28.z)

				local var_420_29 = var_420_21.localEulerAngles

				var_420_29.z = 0
				var_420_29.x = 0
				var_420_21.localEulerAngles = var_420_29
			end

			local var_420_30 = 0
			local var_420_31 = 0.075

			if var_420_30 < arg_417_1.time_ and arg_417_1.time_ <= var_420_30 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_32 = arg_417_1:FormatText(StoryNameCfg[6].name)

				arg_417_1.leftNameTxt_.text = var_420_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_33 = arg_417_1:GetWordFromCfg(319341098)
				local var_420_34 = arg_417_1:FormatText(var_420_33.content)

				arg_417_1.text_.text = var_420_34

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_35 = 3
				local var_420_36 = utf8.len(var_420_34)
				local var_420_37 = var_420_35 <= 0 and var_420_31 or var_420_31 * (var_420_36 / var_420_35)

				if var_420_37 > 0 and var_420_31 < var_420_37 then
					arg_417_1.talkMaxDuration = var_420_37

					if var_420_37 + var_420_30 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_37 + var_420_30
					end
				end

				arg_417_1.text_.text = var_420_34
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341098", "story_v_out_319341.awb") ~= 0 then
					local var_420_38 = manager.audio:GetVoiceLength("story_v_out_319341", "319341098", "story_v_out_319341.awb") / 1000

					if var_420_38 + var_420_30 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_38 + var_420_30
					end

					if var_420_33.prefab_name ~= "" and arg_417_1.actors_[var_420_33.prefab_name] ~= nil then
						local var_420_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_33.prefab_name].transform, "story_v_out_319341", "319341098", "story_v_out_319341.awb")

						arg_417_1:RecordAudio("319341098", var_420_39)
						arg_417_1:RecordAudio("319341098", var_420_39)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_319341", "319341098", "story_v_out_319341.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_319341", "319341098", "story_v_out_319341.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_40 = math.max(var_420_31, arg_417_1.talkMaxDuration)

			if var_420_30 <= arg_417_1.time_ and arg_417_1.time_ < var_420_30 + var_420_40 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_30) / var_420_40

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_30 + var_420_40 and arg_417_1.time_ < var_420_30 + var_420_40 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play319341099 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 319341099
		arg_421_1.duration_ = 13.8

		local var_421_0 = {
			zh = 13.8,
			ja = 12.666
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
				arg_421_0:Play319341100(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["10058ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect10058ui_story == nil then
				arg_421_1.var_.characterEffect10058ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.200000002980232

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect10058ui_story then
					arg_421_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect10058ui_story then
				arg_421_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_424_4 = arg_421_1.actors_["1084ui_story"]
			local var_424_5 = 0

			if var_424_5 < arg_421_1.time_ and arg_421_1.time_ <= var_424_5 + arg_424_0 and arg_421_1.var_.characterEffect1084ui_story == nil then
				arg_421_1.var_.characterEffect1084ui_story = var_424_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_6 = 0.200000002980232

			if var_424_5 <= arg_421_1.time_ and arg_421_1.time_ < var_424_5 + var_424_6 then
				local var_424_7 = (arg_421_1.time_ - var_424_5) / var_424_6

				if arg_421_1.var_.characterEffect1084ui_story then
					local var_424_8 = Mathf.Lerp(0, 0.5, var_424_7)

					arg_421_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1084ui_story.fillRatio = var_424_8
				end
			end

			if arg_421_1.time_ >= var_424_5 + var_424_6 and arg_421_1.time_ < var_424_5 + var_424_6 + arg_424_0 and arg_421_1.var_.characterEffect1084ui_story then
				local var_424_9 = 0.5

				arg_421_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1084ui_story.fillRatio = var_424_9
			end

			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 then
				arg_421_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action4_1")
			end

			local var_424_11 = 0

			if var_424_11 < arg_421_1.time_ and arg_421_1.time_ <= var_424_11 + arg_424_0 then
				arg_421_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_424_12 = 0
			local var_424_13 = 1.5

			if var_424_12 < arg_421_1.time_ and arg_421_1.time_ <= var_424_12 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_14 = arg_421_1:FormatText(StoryNameCfg[471].name)

				arg_421_1.leftNameTxt_.text = var_424_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_15 = arg_421_1:GetWordFromCfg(319341099)
				local var_424_16 = arg_421_1:FormatText(var_424_15.content)

				arg_421_1.text_.text = var_424_16

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_17 = 60
				local var_424_18 = utf8.len(var_424_16)
				local var_424_19 = var_424_17 <= 0 and var_424_13 or var_424_13 * (var_424_18 / var_424_17)

				if var_424_19 > 0 and var_424_13 < var_424_19 then
					arg_421_1.talkMaxDuration = var_424_19

					if var_424_19 + var_424_12 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_19 + var_424_12
					end
				end

				arg_421_1.text_.text = var_424_16
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341099", "story_v_out_319341.awb") ~= 0 then
					local var_424_20 = manager.audio:GetVoiceLength("story_v_out_319341", "319341099", "story_v_out_319341.awb") / 1000

					if var_424_20 + var_424_12 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_20 + var_424_12
					end

					if var_424_15.prefab_name ~= "" and arg_421_1.actors_[var_424_15.prefab_name] ~= nil then
						local var_424_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_15.prefab_name].transform, "story_v_out_319341", "319341099", "story_v_out_319341.awb")

						arg_421_1:RecordAudio("319341099", var_424_21)
						arg_421_1:RecordAudio("319341099", var_424_21)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_319341", "319341099", "story_v_out_319341.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_319341", "319341099", "story_v_out_319341.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_22 = math.max(var_424_13, arg_421_1.talkMaxDuration)

			if var_424_12 <= arg_421_1.time_ and arg_421_1.time_ < var_424_12 + var_424_22 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_12) / var_424_22

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_12 + var_424_22 and arg_421_1.time_ < var_424_12 + var_424_22 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play319341100 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 319341100
		arg_425_1.duration_ = 10.733

		local var_425_0 = {
			zh = 8.6,
			ja = 10.733
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
				arg_425_0:Play319341101(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["10058ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect10058ui_story == nil then
				arg_425_1.var_.characterEffect10058ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.200000002980232

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect10058ui_story then
					local var_428_4 = Mathf.Lerp(0, 0.5, var_428_3)

					arg_425_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_425_1.var_.characterEffect10058ui_story.fillRatio = var_428_4
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect10058ui_story then
				local var_428_5 = 0.5

				arg_425_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_425_1.var_.characterEffect10058ui_story.fillRatio = var_428_5
			end

			local var_428_6 = arg_425_1.actors_["1084ui_story"]
			local var_428_7 = 0

			if var_428_7 < arg_425_1.time_ and arg_425_1.time_ <= var_428_7 + arg_428_0 and arg_425_1.var_.characterEffect1084ui_story == nil then
				arg_425_1.var_.characterEffect1084ui_story = var_428_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_8 = 0.200000002980232

			if var_428_7 <= arg_425_1.time_ and arg_425_1.time_ < var_428_7 + var_428_8 then
				local var_428_9 = (arg_425_1.time_ - var_428_7) / var_428_8

				if arg_425_1.var_.characterEffect1084ui_story then
					arg_425_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_7 + var_428_8 and arg_425_1.time_ < var_428_7 + var_428_8 + arg_428_0 and arg_425_1.var_.characterEffect1084ui_story then
				arg_425_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_428_10 = 0

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 then
				arg_425_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_428_11 = 0

			if var_428_11 < arg_425_1.time_ and arg_425_1.time_ <= var_428_11 + arg_428_0 then
				arg_425_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_428_12 = 0
			local var_428_13 = 0.875

			if var_428_12 < arg_425_1.time_ and arg_425_1.time_ <= var_428_12 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_14 = arg_425_1:FormatText(StoryNameCfg[6].name)

				arg_425_1.leftNameTxt_.text = var_428_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_15 = arg_425_1:GetWordFromCfg(319341100)
				local var_428_16 = arg_425_1:FormatText(var_428_15.content)

				arg_425_1.text_.text = var_428_16

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_17 = 35
				local var_428_18 = utf8.len(var_428_16)
				local var_428_19 = var_428_17 <= 0 and var_428_13 or var_428_13 * (var_428_18 / var_428_17)

				if var_428_19 > 0 and var_428_13 < var_428_19 then
					arg_425_1.talkMaxDuration = var_428_19

					if var_428_19 + var_428_12 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_19 + var_428_12
					end
				end

				arg_425_1.text_.text = var_428_16
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341100", "story_v_out_319341.awb") ~= 0 then
					local var_428_20 = manager.audio:GetVoiceLength("story_v_out_319341", "319341100", "story_v_out_319341.awb") / 1000

					if var_428_20 + var_428_12 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_20 + var_428_12
					end

					if var_428_15.prefab_name ~= "" and arg_425_1.actors_[var_428_15.prefab_name] ~= nil then
						local var_428_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_15.prefab_name].transform, "story_v_out_319341", "319341100", "story_v_out_319341.awb")

						arg_425_1:RecordAudio("319341100", var_428_21)
						arg_425_1:RecordAudio("319341100", var_428_21)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_319341", "319341100", "story_v_out_319341.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_319341", "319341100", "story_v_out_319341.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_22 = math.max(var_428_13, arg_425_1.talkMaxDuration)

			if var_428_12 <= arg_425_1.time_ and arg_425_1.time_ < var_428_12 + var_428_22 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_12) / var_428_22

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_12 + var_428_22 and arg_425_1.time_ < var_428_12 + var_428_22 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play319341101 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 319341101
		arg_429_1.duration_ = 1.533

		local var_429_0 = {
			zh = 1.033,
			ja = 1.533
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
				arg_429_0:Play319341102(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["10058ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect10058ui_story == nil then
				arg_429_1.var_.characterEffect10058ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.200000002980232

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect10058ui_story then
					arg_429_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect10058ui_story then
				arg_429_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_432_4 = arg_429_1.actors_["1084ui_story"]
			local var_432_5 = 0

			if var_432_5 < arg_429_1.time_ and arg_429_1.time_ <= var_432_5 + arg_432_0 and arg_429_1.var_.characterEffect1084ui_story == nil then
				arg_429_1.var_.characterEffect1084ui_story = var_432_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_6 = 0.200000002980232

			if var_432_5 <= arg_429_1.time_ and arg_429_1.time_ < var_432_5 + var_432_6 then
				local var_432_7 = (arg_429_1.time_ - var_432_5) / var_432_6

				if arg_429_1.var_.characterEffect1084ui_story then
					local var_432_8 = Mathf.Lerp(0, 0.5, var_432_7)

					arg_429_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1084ui_story.fillRatio = var_432_8
				end
			end

			if arg_429_1.time_ >= var_432_5 + var_432_6 and arg_429_1.time_ < var_432_5 + var_432_6 + arg_432_0 and arg_429_1.var_.characterEffect1084ui_story then
				local var_432_9 = 0.5

				arg_429_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1084ui_story.fillRatio = var_432_9
			end

			local var_432_10 = 0
			local var_432_11 = 0.05

			if var_432_10 < arg_429_1.time_ and arg_429_1.time_ <= var_432_10 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_12 = arg_429_1:FormatText(StoryNameCfg[471].name)

				arg_429_1.leftNameTxt_.text = var_432_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_13 = arg_429_1:GetWordFromCfg(319341101)
				local var_432_14 = arg_429_1:FormatText(var_432_13.content)

				arg_429_1.text_.text = var_432_14

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_15 = 2
				local var_432_16 = utf8.len(var_432_14)
				local var_432_17 = var_432_15 <= 0 and var_432_11 or var_432_11 * (var_432_16 / var_432_15)

				if var_432_17 > 0 and var_432_11 < var_432_17 then
					arg_429_1.talkMaxDuration = var_432_17

					if var_432_17 + var_432_10 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_17 + var_432_10
					end
				end

				arg_429_1.text_.text = var_432_14
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341101", "story_v_out_319341.awb") ~= 0 then
					local var_432_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341101", "story_v_out_319341.awb") / 1000

					if var_432_18 + var_432_10 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_18 + var_432_10
					end

					if var_432_13.prefab_name ~= "" and arg_429_1.actors_[var_432_13.prefab_name] ~= nil then
						local var_432_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_13.prefab_name].transform, "story_v_out_319341", "319341101", "story_v_out_319341.awb")

						arg_429_1:RecordAudio("319341101", var_432_19)
						arg_429_1:RecordAudio("319341101", var_432_19)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_319341", "319341101", "story_v_out_319341.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_319341", "319341101", "story_v_out_319341.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_20 = math.max(var_432_11, arg_429_1.talkMaxDuration)

			if var_432_10 <= arg_429_1.time_ and arg_429_1.time_ < var_432_10 + var_432_20 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_10) / var_432_20

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_10 + var_432_20 and arg_429_1.time_ < var_432_10 + var_432_20 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play319341102 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 319341102
		arg_433_1.duration_ = 3.733

		local var_433_0 = {
			zh = 2.133,
			ja = 3.733
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
				arg_433_0:Play319341103(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1084ui_story"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos1084ui_story = var_436_0.localPosition
			end

			local var_436_2 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2
				local var_436_4 = Vector3.New(-0.7, -0.97, -6)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1084ui_story, var_436_4, var_436_3)

				local var_436_5 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_5.x, var_436_5.y, var_436_5.z)

				local var_436_6 = var_436_0.localEulerAngles

				var_436_6.z = 0
				var_436_6.x = 0
				var_436_0.localEulerAngles = var_436_6
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_436_7 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_7.x, var_436_7.y, var_436_7.z)

				local var_436_8 = var_436_0.localEulerAngles

				var_436_8.z = 0
				var_436_8.x = 0
				var_436_0.localEulerAngles = var_436_8
			end

			local var_436_9 = 0

			if var_436_9 < arg_433_1.time_ and arg_433_1.time_ <= var_436_9 + arg_436_0 then
				arg_433_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_436_10 = arg_433_1.actors_["10058ui_story"]
			local var_436_11 = 0

			if var_436_11 < arg_433_1.time_ and arg_433_1.time_ <= var_436_11 + arg_436_0 and arg_433_1.var_.characterEffect10058ui_story == nil then
				arg_433_1.var_.characterEffect10058ui_story = var_436_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_12 = 0.200000002980232

			if var_436_11 <= arg_433_1.time_ and arg_433_1.time_ < var_436_11 + var_436_12 then
				local var_436_13 = (arg_433_1.time_ - var_436_11) / var_436_12

				if arg_433_1.var_.characterEffect10058ui_story then
					local var_436_14 = Mathf.Lerp(0, 0.5, var_436_13)

					arg_433_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_433_1.var_.characterEffect10058ui_story.fillRatio = var_436_14
				end
			end

			if arg_433_1.time_ >= var_436_11 + var_436_12 and arg_433_1.time_ < var_436_11 + var_436_12 + arg_436_0 and arg_433_1.var_.characterEffect10058ui_story then
				local var_436_15 = 0.5

				arg_433_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_433_1.var_.characterEffect10058ui_story.fillRatio = var_436_15
			end

			local var_436_16 = arg_433_1.actors_["1084ui_story"]
			local var_436_17 = 0

			if var_436_17 < arg_433_1.time_ and arg_433_1.time_ <= var_436_17 + arg_436_0 and arg_433_1.var_.characterEffect1084ui_story == nil then
				arg_433_1.var_.characterEffect1084ui_story = var_436_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_18 = 0.200000002980232

			if var_436_17 <= arg_433_1.time_ and arg_433_1.time_ < var_436_17 + var_436_18 then
				local var_436_19 = (arg_433_1.time_ - var_436_17) / var_436_18

				if arg_433_1.var_.characterEffect1084ui_story then
					arg_433_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_433_1.time_ >= var_436_17 + var_436_18 and arg_433_1.time_ < var_436_17 + var_436_18 + arg_436_0 and arg_433_1.var_.characterEffect1084ui_story then
				arg_433_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_436_20 = 0

			if var_436_20 < arg_433_1.time_ and arg_433_1.time_ <= var_436_20 + arg_436_0 then
				arg_433_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_436_21 = 0
			local var_436_22 = 0.2

			if var_436_21 < arg_433_1.time_ and arg_433_1.time_ <= var_436_21 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_23 = arg_433_1:FormatText(StoryNameCfg[6].name)

				arg_433_1.leftNameTxt_.text = var_436_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_24 = arg_433_1:GetWordFromCfg(319341102)
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341102", "story_v_out_319341.awb") ~= 0 then
					local var_436_29 = manager.audio:GetVoiceLength("story_v_out_319341", "319341102", "story_v_out_319341.awb") / 1000

					if var_436_29 + var_436_21 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_29 + var_436_21
					end

					if var_436_24.prefab_name ~= "" and arg_433_1.actors_[var_436_24.prefab_name] ~= nil then
						local var_436_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_24.prefab_name].transform, "story_v_out_319341", "319341102", "story_v_out_319341.awb")

						arg_433_1:RecordAudio("319341102", var_436_30)
						arg_433_1:RecordAudio("319341102", var_436_30)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_319341", "319341102", "story_v_out_319341.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_319341", "319341102", "story_v_out_319341.awb")
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
	Play319341103 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 319341103
		arg_437_1.duration_ = 5

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play319341104(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1084ui_story"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and arg_437_1.var_.characterEffect1084ui_story == nil then
				arg_437_1.var_.characterEffect1084ui_story = var_440_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_2 = 0.200000002980232

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.characterEffect1084ui_story then
					local var_440_4 = Mathf.Lerp(0, 0.5, var_440_3)

					arg_437_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_437_1.var_.characterEffect1084ui_story.fillRatio = var_440_4
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and arg_437_1.var_.characterEffect1084ui_story then
				local var_440_5 = 0.5

				arg_437_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_437_1.var_.characterEffect1084ui_story.fillRatio = var_440_5
			end

			local var_440_6 = arg_437_1.actors_["1084ui_story"]
			local var_440_7 = 0

			if var_440_7 < arg_437_1.time_ and arg_437_1.time_ <= var_440_7 + arg_440_0 and arg_437_1.var_.characterEffect1084ui_story == nil then
				arg_437_1.var_.characterEffect1084ui_story = var_440_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_8 = 0.200000002980232

			if var_440_7 <= arg_437_1.time_ and arg_437_1.time_ < var_440_7 + var_440_8 then
				local var_440_9 = (arg_437_1.time_ - var_440_7) / var_440_8

				if arg_437_1.var_.characterEffect1084ui_story then
					local var_440_10 = Mathf.Lerp(0, 0.5, var_440_9)

					arg_437_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_437_1.var_.characterEffect1084ui_story.fillRatio = var_440_10
				end
			end

			if arg_437_1.time_ >= var_440_7 + var_440_8 and arg_437_1.time_ < var_440_7 + var_440_8 + arg_440_0 and arg_437_1.var_.characterEffect1084ui_story then
				local var_440_11 = 0.5

				arg_437_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_437_1.var_.characterEffect1084ui_story.fillRatio = var_440_11
			end

			local var_440_12 = 0

			if var_440_12 < arg_437_1.time_ and arg_437_1.time_ <= var_440_12 + arg_440_0 then
				arg_437_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action4_2")
			end

			local var_440_13 = 0
			local var_440_14 = 1.325

			if var_440_13 < arg_437_1.time_ and arg_437_1.time_ <= var_440_13 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, false)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_15 = arg_437_1:GetWordFromCfg(319341103)
				local var_440_16 = arg_437_1:FormatText(var_440_15.content)

				arg_437_1.text_.text = var_440_16

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_17 = 53
				local var_440_18 = utf8.len(var_440_16)
				local var_440_19 = var_440_17 <= 0 and var_440_14 or var_440_14 * (var_440_18 / var_440_17)

				if var_440_19 > 0 and var_440_14 < var_440_19 then
					arg_437_1.talkMaxDuration = var_440_19

					if var_440_19 + var_440_13 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_19 + var_440_13
					end
				end

				arg_437_1.text_.text = var_440_16
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_20 = math.max(var_440_14, arg_437_1.talkMaxDuration)

			if var_440_13 <= arg_437_1.time_ and arg_437_1.time_ < var_440_13 + var_440_20 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_13) / var_440_20

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_13 + var_440_20 and arg_437_1.time_ < var_440_13 + var_440_20 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play319341104 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 319341104
		arg_441_1.duration_ = 13.733

		local var_441_0 = {
			zh = 13.733,
			ja = 13.266
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
				arg_441_0:Play319341105(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["10058ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and arg_441_1.var_.characterEffect10058ui_story == nil then
				arg_441_1.var_.characterEffect10058ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.200000002980232

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect10058ui_story then
					arg_441_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and arg_441_1.var_.characterEffect10058ui_story then
				arg_441_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_444_4 = 0
			local var_444_5 = 1.7

			if var_444_4 < arg_441_1.time_ and arg_441_1.time_ <= var_444_4 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_6 = arg_441_1:FormatText(StoryNameCfg[471].name)

				arg_441_1.leftNameTxt_.text = var_444_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_7 = arg_441_1:GetWordFromCfg(319341104)
				local var_444_8 = arg_441_1:FormatText(var_444_7.content)

				arg_441_1.text_.text = var_444_8

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_9 = 68
				local var_444_10 = utf8.len(var_444_8)
				local var_444_11 = var_444_9 <= 0 and var_444_5 or var_444_5 * (var_444_10 / var_444_9)

				if var_444_11 > 0 and var_444_5 < var_444_11 then
					arg_441_1.talkMaxDuration = var_444_11

					if var_444_11 + var_444_4 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_11 + var_444_4
					end
				end

				arg_441_1.text_.text = var_444_8
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341104", "story_v_out_319341.awb") ~= 0 then
					local var_444_12 = manager.audio:GetVoiceLength("story_v_out_319341", "319341104", "story_v_out_319341.awb") / 1000

					if var_444_12 + var_444_4 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_12 + var_444_4
					end

					if var_444_7.prefab_name ~= "" and arg_441_1.actors_[var_444_7.prefab_name] ~= nil then
						local var_444_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_7.prefab_name].transform, "story_v_out_319341", "319341104", "story_v_out_319341.awb")

						arg_441_1:RecordAudio("319341104", var_444_13)
						arg_441_1:RecordAudio("319341104", var_444_13)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_319341", "319341104", "story_v_out_319341.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_319341", "319341104", "story_v_out_319341.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_14 = math.max(var_444_5, arg_441_1.talkMaxDuration)

			if var_444_4 <= arg_441_1.time_ and arg_441_1.time_ < var_444_4 + var_444_14 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_4) / var_444_14

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_4 + var_444_14 and arg_441_1.time_ < var_444_4 + var_444_14 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play319341105 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 319341105
		arg_445_1.duration_ = 10

		local var_445_0 = {
			zh = 7.666,
			ja = 10
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
				arg_445_0:Play319341106(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.875

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_2 = arg_445_1:FormatText(StoryNameCfg[471].name)

				arg_445_1.leftNameTxt_.text = var_448_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_3 = arg_445_1:GetWordFromCfg(319341105)
				local var_448_4 = arg_445_1:FormatText(var_448_3.content)

				arg_445_1.text_.text = var_448_4

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341105", "story_v_out_319341.awb") ~= 0 then
					local var_448_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341105", "story_v_out_319341.awb") / 1000

					if var_448_8 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_8 + var_448_0
					end

					if var_448_3.prefab_name ~= "" and arg_445_1.actors_[var_448_3.prefab_name] ~= nil then
						local var_448_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_3.prefab_name].transform, "story_v_out_319341", "319341105", "story_v_out_319341.awb")

						arg_445_1:RecordAudio("319341105", var_448_9)
						arg_445_1:RecordAudio("319341105", var_448_9)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_319341", "319341105", "story_v_out_319341.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_319341", "319341105", "story_v_out_319341.awb")
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
	Play319341106 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 319341106
		arg_449_1.duration_ = 8.9

		local var_449_0 = {
			zh = 6.866,
			ja = 8.9
		}
		local var_449_1 = manager.audio:GetLocalizationFlag()

		if var_449_0[var_449_1] ~= nil then
			arg_449_1.duration_ = var_449_0[var_449_1]
		end

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play319341107(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["10058ui_story"]
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 and arg_449_1.var_.characterEffect10058ui_story == nil then
				arg_449_1.var_.characterEffect10058ui_story = var_452_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_2 = 0.200000002980232

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2

				if arg_449_1.var_.characterEffect10058ui_story then
					local var_452_4 = Mathf.Lerp(0, 0.5, var_452_3)

					arg_449_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_449_1.var_.characterEffect10058ui_story.fillRatio = var_452_4
				end
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 and arg_449_1.var_.characterEffect10058ui_story then
				local var_452_5 = 0.5

				arg_449_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_449_1.var_.characterEffect10058ui_story.fillRatio = var_452_5
			end

			local var_452_6 = arg_449_1.actors_["1084ui_story"]
			local var_452_7 = 0

			if var_452_7 < arg_449_1.time_ and arg_449_1.time_ <= var_452_7 + arg_452_0 and arg_449_1.var_.characterEffect1084ui_story == nil then
				arg_449_1.var_.characterEffect1084ui_story = var_452_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_8 = 0.200000002980232

			if var_452_7 <= arg_449_1.time_ and arg_449_1.time_ < var_452_7 + var_452_8 then
				local var_452_9 = (arg_449_1.time_ - var_452_7) / var_452_8

				if arg_449_1.var_.characterEffect1084ui_story then
					arg_449_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_449_1.time_ >= var_452_7 + var_452_8 and arg_449_1.time_ < var_452_7 + var_452_8 + arg_452_0 and arg_449_1.var_.characterEffect1084ui_story then
				arg_449_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_452_10 = 0

			if var_452_10 < arg_449_1.time_ and arg_449_1.time_ <= var_452_10 + arg_452_0 then
				arg_449_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_452_11 = 0
			local var_452_12 = 0.725

			if var_452_11 < arg_449_1.time_ and arg_449_1.time_ <= var_452_11 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_13 = arg_449_1:FormatText(StoryNameCfg[6].name)

				arg_449_1.leftNameTxt_.text = var_452_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_14 = arg_449_1:GetWordFromCfg(319341106)
				local var_452_15 = arg_449_1:FormatText(var_452_14.content)

				arg_449_1.text_.text = var_452_15

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_16 = 29
				local var_452_17 = utf8.len(var_452_15)
				local var_452_18 = var_452_16 <= 0 and var_452_12 or var_452_12 * (var_452_17 / var_452_16)

				if var_452_18 > 0 and var_452_12 < var_452_18 then
					arg_449_1.talkMaxDuration = var_452_18

					if var_452_18 + var_452_11 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_18 + var_452_11
					end
				end

				arg_449_1.text_.text = var_452_15
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341106", "story_v_out_319341.awb") ~= 0 then
					local var_452_19 = manager.audio:GetVoiceLength("story_v_out_319341", "319341106", "story_v_out_319341.awb") / 1000

					if var_452_19 + var_452_11 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_19 + var_452_11
					end

					if var_452_14.prefab_name ~= "" and arg_449_1.actors_[var_452_14.prefab_name] ~= nil then
						local var_452_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_14.prefab_name].transform, "story_v_out_319341", "319341106", "story_v_out_319341.awb")

						arg_449_1:RecordAudio("319341106", var_452_20)
						arg_449_1:RecordAudio("319341106", var_452_20)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_319341", "319341106", "story_v_out_319341.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_319341", "319341106", "story_v_out_319341.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_21 = math.max(var_452_12, arg_449_1.talkMaxDuration)

			if var_452_11 <= arg_449_1.time_ and arg_449_1.time_ < var_452_11 + var_452_21 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_11) / var_452_21

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_11 + var_452_21 and arg_449_1.time_ < var_452_11 + var_452_21 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play319341107 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 319341107
		arg_453_1.duration_ = 4.766

		local var_453_0 = {
			zh = 2.333,
			ja = 4.766
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
				arg_453_0:Play319341108(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["10058ui_story"]
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 and arg_453_1.var_.characterEffect10058ui_story == nil then
				arg_453_1.var_.characterEffect10058ui_story = var_456_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_2 = 0.200000002980232

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2

				if arg_453_1.var_.characterEffect10058ui_story then
					arg_453_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 and arg_453_1.var_.characterEffect10058ui_story then
				arg_453_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_456_4 = arg_453_1.actors_["1084ui_story"]
			local var_456_5 = 0

			if var_456_5 < arg_453_1.time_ and arg_453_1.time_ <= var_456_5 + arg_456_0 and arg_453_1.var_.characterEffect1084ui_story == nil then
				arg_453_1.var_.characterEffect1084ui_story = var_456_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_6 = 0.200000002980232

			if var_456_5 <= arg_453_1.time_ and arg_453_1.time_ < var_456_5 + var_456_6 then
				local var_456_7 = (arg_453_1.time_ - var_456_5) / var_456_6

				if arg_453_1.var_.characterEffect1084ui_story then
					local var_456_8 = Mathf.Lerp(0, 0.5, var_456_7)

					arg_453_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_453_1.var_.characterEffect1084ui_story.fillRatio = var_456_8
				end
			end

			if arg_453_1.time_ >= var_456_5 + var_456_6 and arg_453_1.time_ < var_456_5 + var_456_6 + arg_456_0 and arg_453_1.var_.characterEffect1084ui_story then
				local var_456_9 = 0.5

				arg_453_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_453_1.var_.characterEffect1084ui_story.fillRatio = var_456_9
			end

			local var_456_10 = 0
			local var_456_11 = 0.325

			if var_456_10 < arg_453_1.time_ and arg_453_1.time_ <= var_456_10 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_12 = arg_453_1:FormatText(StoryNameCfg[471].name)

				arg_453_1.leftNameTxt_.text = var_456_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_13 = arg_453_1:GetWordFromCfg(319341107)
				local var_456_14 = arg_453_1:FormatText(var_456_13.content)

				arg_453_1.text_.text = var_456_14

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_15 = 13
				local var_456_16 = utf8.len(var_456_14)
				local var_456_17 = var_456_15 <= 0 and var_456_11 or var_456_11 * (var_456_16 / var_456_15)

				if var_456_17 > 0 and var_456_11 < var_456_17 then
					arg_453_1.talkMaxDuration = var_456_17

					if var_456_17 + var_456_10 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_17 + var_456_10
					end
				end

				arg_453_1.text_.text = var_456_14
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341107", "story_v_out_319341.awb") ~= 0 then
					local var_456_18 = manager.audio:GetVoiceLength("story_v_out_319341", "319341107", "story_v_out_319341.awb") / 1000

					if var_456_18 + var_456_10 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_18 + var_456_10
					end

					if var_456_13.prefab_name ~= "" and arg_453_1.actors_[var_456_13.prefab_name] ~= nil then
						local var_456_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_13.prefab_name].transform, "story_v_out_319341", "319341107", "story_v_out_319341.awb")

						arg_453_1:RecordAudio("319341107", var_456_19)
						arg_453_1:RecordAudio("319341107", var_456_19)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_319341", "319341107", "story_v_out_319341.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_319341", "319341107", "story_v_out_319341.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_20 = math.max(var_456_11, arg_453_1.talkMaxDuration)

			if var_456_10 <= arg_453_1.time_ and arg_453_1.time_ < var_456_10 + var_456_20 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_10) / var_456_20

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_10 + var_456_20 and arg_453_1.time_ < var_456_10 + var_456_20 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play319341108 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 319341108
		arg_457_1.duration_ = 4.133

		local var_457_0 = {
			zh = 4.133,
			ja = 3.9
		}
		local var_457_1 = manager.audio:GetLocalizationFlag()

		if var_457_0[var_457_1] ~= nil then
			arg_457_1.duration_ = var_457_0[var_457_1]
		end

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play319341109(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_460_1 = 0
			local var_460_2 = 0.525

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_3 = arg_457_1:FormatText(StoryNameCfg[471].name)

				arg_457_1.leftNameTxt_.text = var_460_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_4 = arg_457_1:GetWordFromCfg(319341108)
				local var_460_5 = arg_457_1:FormatText(var_460_4.content)

				arg_457_1.text_.text = var_460_5

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_6 = 21
				local var_460_7 = utf8.len(var_460_5)
				local var_460_8 = var_460_6 <= 0 and var_460_2 or var_460_2 * (var_460_7 / var_460_6)

				if var_460_8 > 0 and var_460_2 < var_460_8 then
					arg_457_1.talkMaxDuration = var_460_8

					if var_460_8 + var_460_1 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_8 + var_460_1
					end
				end

				arg_457_1.text_.text = var_460_5
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341108", "story_v_out_319341.awb") ~= 0 then
					local var_460_9 = manager.audio:GetVoiceLength("story_v_out_319341", "319341108", "story_v_out_319341.awb") / 1000

					if var_460_9 + var_460_1 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_9 + var_460_1
					end

					if var_460_4.prefab_name ~= "" and arg_457_1.actors_[var_460_4.prefab_name] ~= nil then
						local var_460_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_4.prefab_name].transform, "story_v_out_319341", "319341108", "story_v_out_319341.awb")

						arg_457_1:RecordAudio("319341108", var_460_10)
						arg_457_1:RecordAudio("319341108", var_460_10)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_319341", "319341108", "story_v_out_319341.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_319341", "319341108", "story_v_out_319341.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_11 = math.max(var_460_2, arg_457_1.talkMaxDuration)

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_11 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_1) / var_460_11

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_1 + var_460_11 and arg_457_1.time_ < var_460_1 + var_460_11 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play319341109 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 319341109
		arg_461_1.duration_ = 13.866

		local var_461_0 = {
			zh = 9.366,
			ja = 13.866
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
				arg_461_0:Play319341110(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 1.275

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[471].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(319341109)
				local var_464_4 = arg_461_1:FormatText(var_464_3.content)

				arg_461_1.text_.text = var_464_4

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_5 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341109", "story_v_out_319341.awb") ~= 0 then
					local var_464_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341109", "story_v_out_319341.awb") / 1000

					if var_464_8 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_8 + var_464_0
					end

					if var_464_3.prefab_name ~= "" and arg_461_1.actors_[var_464_3.prefab_name] ~= nil then
						local var_464_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_3.prefab_name].transform, "story_v_out_319341", "319341109", "story_v_out_319341.awb")

						arg_461_1:RecordAudio("319341109", var_464_9)
						arg_461_1:RecordAudio("319341109", var_464_9)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_319341", "319341109", "story_v_out_319341.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_319341", "319341109", "story_v_out_319341.awb")
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
	Play319341110 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 319341110
		arg_465_1.duration_ = 8.566

		local var_465_0 = {
			zh = 5.7,
			ja = 8.566
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
				arg_465_0:Play319341111(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0
			local var_468_1 = 0.875

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_2 = arg_465_1:FormatText(StoryNameCfg[471].name)

				arg_465_1.leftNameTxt_.text = var_468_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_3 = arg_465_1:GetWordFromCfg(319341110)
				local var_468_4 = arg_465_1:FormatText(var_468_3.content)

				arg_465_1.text_.text = var_468_4

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341110", "story_v_out_319341.awb") ~= 0 then
					local var_468_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341110", "story_v_out_319341.awb") / 1000

					if var_468_8 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_8 + var_468_0
					end

					if var_468_3.prefab_name ~= "" and arg_465_1.actors_[var_468_3.prefab_name] ~= nil then
						local var_468_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_3.prefab_name].transform, "story_v_out_319341", "319341110", "story_v_out_319341.awb")

						arg_465_1:RecordAudio("319341110", var_468_9)
						arg_465_1:RecordAudio("319341110", var_468_9)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_319341", "319341110", "story_v_out_319341.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_319341", "319341110", "story_v_out_319341.awb")
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
	Play319341111 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 319341111
		arg_469_1.duration_ = 8.866

		local var_469_0 = {
			zh = 3.6,
			ja = 8.866
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
				arg_469_0:Play319341112(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1084ui_story"].transform
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 then
				arg_469_1.var_.moveOldPos1084ui_story = var_472_0.localPosition
			end

			local var_472_2 = 0.001

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2
				local var_472_4 = Vector3.New(-0.7, -0.97, -6)

				var_472_0.localPosition = Vector3.Lerp(arg_469_1.var_.moveOldPos1084ui_story, var_472_4, var_472_3)

				local var_472_5 = manager.ui.mainCamera.transform.position - var_472_0.position

				var_472_0.forward = Vector3.New(var_472_5.x, var_472_5.y, var_472_5.z)

				local var_472_6 = var_472_0.localEulerAngles

				var_472_6.z = 0
				var_472_6.x = 0
				var_472_0.localEulerAngles = var_472_6
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 then
				var_472_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_472_7 = manager.ui.mainCamera.transform.position - var_472_0.position

				var_472_0.forward = Vector3.New(var_472_7.x, var_472_7.y, var_472_7.z)

				local var_472_8 = var_472_0.localEulerAngles

				var_472_8.z = 0
				var_472_8.x = 0
				var_472_0.localEulerAngles = var_472_8
			end

			local var_472_9 = arg_469_1.actors_["1084ui_story"]
			local var_472_10 = 0

			if var_472_10 < arg_469_1.time_ and arg_469_1.time_ <= var_472_10 + arg_472_0 and arg_469_1.var_.characterEffect1084ui_story == nil then
				arg_469_1.var_.characterEffect1084ui_story = var_472_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_11 = 0.200000002980232

			if var_472_10 <= arg_469_1.time_ and arg_469_1.time_ < var_472_10 + var_472_11 then
				local var_472_12 = (arg_469_1.time_ - var_472_10) / var_472_11

				if arg_469_1.var_.characterEffect1084ui_story then
					arg_469_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_10 + var_472_11 and arg_469_1.time_ < var_472_10 + var_472_11 + arg_472_0 and arg_469_1.var_.characterEffect1084ui_story then
				arg_469_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_472_13 = 0

			if var_472_13 < arg_469_1.time_ and arg_469_1.time_ <= var_472_13 + arg_472_0 then
				arg_469_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_472_14 = 0

			if var_472_14 < arg_469_1.time_ and arg_469_1.time_ <= var_472_14 + arg_472_0 then
				arg_469_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_472_15 = arg_469_1.actors_["10058ui_story"]
			local var_472_16 = 0

			if var_472_16 < arg_469_1.time_ and arg_469_1.time_ <= var_472_16 + arg_472_0 and arg_469_1.var_.characterEffect10058ui_story == nil then
				arg_469_1.var_.characterEffect10058ui_story = var_472_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_17 = 0.200000002980232

			if var_472_16 <= arg_469_1.time_ and arg_469_1.time_ < var_472_16 + var_472_17 then
				local var_472_18 = (arg_469_1.time_ - var_472_16) / var_472_17

				if arg_469_1.var_.characterEffect10058ui_story then
					local var_472_19 = Mathf.Lerp(0, 0.5, var_472_18)

					arg_469_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_469_1.var_.characterEffect10058ui_story.fillRatio = var_472_19
				end
			end

			if arg_469_1.time_ >= var_472_16 + var_472_17 and arg_469_1.time_ < var_472_16 + var_472_17 + arg_472_0 and arg_469_1.var_.characterEffect10058ui_story then
				local var_472_20 = 0.5

				arg_469_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_469_1.var_.characterEffect10058ui_story.fillRatio = var_472_20
			end

			local var_472_21 = 0
			local var_472_22 = 0.375

			if var_472_21 < arg_469_1.time_ and arg_469_1.time_ <= var_472_21 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_23 = arg_469_1:FormatText(StoryNameCfg[6].name)

				arg_469_1.leftNameTxt_.text = var_472_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_24 = arg_469_1:GetWordFromCfg(319341111)
				local var_472_25 = arg_469_1:FormatText(var_472_24.content)

				arg_469_1.text_.text = var_472_25

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_26 = 15
				local var_472_27 = utf8.len(var_472_25)
				local var_472_28 = var_472_26 <= 0 and var_472_22 or var_472_22 * (var_472_27 / var_472_26)

				if var_472_28 > 0 and var_472_22 < var_472_28 then
					arg_469_1.talkMaxDuration = var_472_28

					if var_472_28 + var_472_21 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_28 + var_472_21
					end
				end

				arg_469_1.text_.text = var_472_25
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341111", "story_v_out_319341.awb") ~= 0 then
					local var_472_29 = manager.audio:GetVoiceLength("story_v_out_319341", "319341111", "story_v_out_319341.awb") / 1000

					if var_472_29 + var_472_21 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_29 + var_472_21
					end

					if var_472_24.prefab_name ~= "" and arg_469_1.actors_[var_472_24.prefab_name] ~= nil then
						local var_472_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_24.prefab_name].transform, "story_v_out_319341", "319341111", "story_v_out_319341.awb")

						arg_469_1:RecordAudio("319341111", var_472_30)
						arg_469_1:RecordAudio("319341111", var_472_30)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_319341", "319341111", "story_v_out_319341.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_319341", "319341111", "story_v_out_319341.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_31 = math.max(var_472_22, arg_469_1.talkMaxDuration)

			if var_472_21 <= arg_469_1.time_ and arg_469_1.time_ < var_472_21 + var_472_31 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_21) / var_472_31

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_21 + var_472_31 and arg_469_1.time_ < var_472_21 + var_472_31 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play319341112 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 319341112
		arg_473_1.duration_ = 7.3

		local var_473_0 = {
			zh = 5.9,
			ja = 7.3
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
				arg_473_0:Play319341113(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["10058ui_story"]
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 and arg_473_1.var_.characterEffect10058ui_story == nil then
				arg_473_1.var_.characterEffect10058ui_story = var_476_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_2 = 0.200000002980232

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2

				if arg_473_1.var_.characterEffect10058ui_story then
					arg_473_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 and arg_473_1.var_.characterEffect10058ui_story then
				arg_473_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_476_4 = arg_473_1.actors_["1084ui_story"]
			local var_476_5 = 0

			if var_476_5 < arg_473_1.time_ and arg_473_1.time_ <= var_476_5 + arg_476_0 and arg_473_1.var_.characterEffect1084ui_story == nil then
				arg_473_1.var_.characterEffect1084ui_story = var_476_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_6 = 0.200000002980232

			if var_476_5 <= arg_473_1.time_ and arg_473_1.time_ < var_476_5 + var_476_6 then
				local var_476_7 = (arg_473_1.time_ - var_476_5) / var_476_6

				if arg_473_1.var_.characterEffect1084ui_story then
					local var_476_8 = Mathf.Lerp(0, 0.5, var_476_7)

					arg_473_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_473_1.var_.characterEffect1084ui_story.fillRatio = var_476_8
				end
			end

			if arg_473_1.time_ >= var_476_5 + var_476_6 and arg_473_1.time_ < var_476_5 + var_476_6 + arg_476_0 and arg_473_1.var_.characterEffect1084ui_story then
				local var_476_9 = 0.5

				arg_473_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_473_1.var_.characterEffect1084ui_story.fillRatio = var_476_9
			end

			local var_476_10 = 0

			if var_476_10 < arg_473_1.time_ and arg_473_1.time_ <= var_476_10 + arg_476_0 then
				arg_473_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_476_11 = 0
			local var_476_12 = 0.675

			if var_476_11 < arg_473_1.time_ and arg_473_1.time_ <= var_476_11 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_13 = arg_473_1:FormatText(StoryNameCfg[471].name)

				arg_473_1.leftNameTxt_.text = var_476_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_14 = arg_473_1:GetWordFromCfg(319341112)
				local var_476_15 = arg_473_1:FormatText(var_476_14.content)

				arg_473_1.text_.text = var_476_15

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_16 = 27
				local var_476_17 = utf8.len(var_476_15)
				local var_476_18 = var_476_16 <= 0 and var_476_12 or var_476_12 * (var_476_17 / var_476_16)

				if var_476_18 > 0 and var_476_12 < var_476_18 then
					arg_473_1.talkMaxDuration = var_476_18

					if var_476_18 + var_476_11 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_18 + var_476_11
					end
				end

				arg_473_1.text_.text = var_476_15
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341112", "story_v_out_319341.awb") ~= 0 then
					local var_476_19 = manager.audio:GetVoiceLength("story_v_out_319341", "319341112", "story_v_out_319341.awb") / 1000

					if var_476_19 + var_476_11 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_19 + var_476_11
					end

					if var_476_14.prefab_name ~= "" and arg_473_1.actors_[var_476_14.prefab_name] ~= nil then
						local var_476_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_14.prefab_name].transform, "story_v_out_319341", "319341112", "story_v_out_319341.awb")

						arg_473_1:RecordAudio("319341112", var_476_20)
						arg_473_1:RecordAudio("319341112", var_476_20)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_319341", "319341112", "story_v_out_319341.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_319341", "319341112", "story_v_out_319341.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_21 = math.max(var_476_12, arg_473_1.talkMaxDuration)

			if var_476_11 <= arg_473_1.time_ and arg_473_1.time_ < var_476_11 + var_476_21 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_11) / var_476_21

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_11 + var_476_21 and arg_473_1.time_ < var_476_11 + var_476_21 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play319341113 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 319341113
		arg_477_1.duration_ = 13.966

		local var_477_0 = {
			zh = 9.733,
			ja = 13.966
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
				arg_477_0:Play319341114(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0
			local var_480_1 = 1.35

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_2 = arg_477_1:FormatText(StoryNameCfg[471].name)

				arg_477_1.leftNameTxt_.text = var_480_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_3 = arg_477_1:GetWordFromCfg(319341113)
				local var_480_4 = arg_477_1:FormatText(var_480_3.content)

				arg_477_1.text_.text = var_480_4

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_5 = 54
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

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341113", "story_v_out_319341.awb") ~= 0 then
					local var_480_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341113", "story_v_out_319341.awb") / 1000

					if var_480_8 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_8 + var_480_0
					end

					if var_480_3.prefab_name ~= "" and arg_477_1.actors_[var_480_3.prefab_name] ~= nil then
						local var_480_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_3.prefab_name].transform, "story_v_out_319341", "319341113", "story_v_out_319341.awb")

						arg_477_1:RecordAudio("319341113", var_480_9)
						arg_477_1:RecordAudio("319341113", var_480_9)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_319341", "319341113", "story_v_out_319341.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_319341", "319341113", "story_v_out_319341.awb")
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
	Play319341114 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 319341114
		arg_481_1.duration_ = 9.5

		local var_481_0 = {
			zh = 5.466,
			ja = 9.5
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
				arg_481_0:Play319341115(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0
			local var_484_1 = 0.575

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_2 = arg_481_1:FormatText(StoryNameCfg[471].name)

				arg_481_1.leftNameTxt_.text = var_484_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_3 = arg_481_1:GetWordFromCfg(319341114)
				local var_484_4 = arg_481_1:FormatText(var_484_3.content)

				arg_481_1.text_.text = var_484_4

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_5 = 23
				local var_484_6 = utf8.len(var_484_4)
				local var_484_7 = var_484_5 <= 0 and var_484_1 or var_484_1 * (var_484_6 / var_484_5)

				if var_484_7 > 0 and var_484_1 < var_484_7 then
					arg_481_1.talkMaxDuration = var_484_7

					if var_484_7 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_7 + var_484_0
					end
				end

				arg_481_1.text_.text = var_484_4
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319341", "319341114", "story_v_out_319341.awb") ~= 0 then
					local var_484_8 = manager.audio:GetVoiceLength("story_v_out_319341", "319341114", "story_v_out_319341.awb") / 1000

					if var_484_8 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_8 + var_484_0
					end

					if var_484_3.prefab_name ~= "" and arg_481_1.actors_[var_484_3.prefab_name] ~= nil then
						local var_484_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_3.prefab_name].transform, "story_v_out_319341", "319341114", "story_v_out_319341.awb")

						arg_481_1:RecordAudio("319341114", var_484_9)
						arg_481_1:RecordAudio("319341114", var_484_9)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_319341", "319341114", "story_v_out_319341.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_319341", "319341114", "story_v_out_319341.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_10 = math.max(var_484_1, arg_481_1.talkMaxDuration)

			if var_484_0 <= arg_481_1.time_ and arg_481_1.time_ < var_484_0 + var_484_10 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_0) / var_484_10

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_0 + var_484_10 and arg_481_1.time_ < var_484_0 + var_484_10 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play319341115 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 319341115
		arg_485_1.duration_ = 109.958333333332

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
			local var_488_0 = 1

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_1 = 0.0333333333333334

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_1 then
				local var_488_2 = (arg_485_1.time_ - var_488_0) / var_488_1
				local var_488_3 = Color.New(0, 0, 0)

				var_488_3.a = Mathf.Lerp(1, 0, var_488_2)
				arg_485_1.mask_.color = var_488_3
			end

			if arg_485_1.time_ >= var_488_0 + var_488_1 and arg_485_1.time_ < var_488_0 + var_488_1 + arg_488_0 then
				local var_488_4 = Color.New(0, 0, 0)
				local var_488_5 = 0

				arg_485_1.mask_.enabled = false
				var_488_4.a = var_488_5
				arg_485_1.mask_.color = var_488_4
			end

			local var_488_6 = 0

			if var_488_6 < arg_485_1.time_ and arg_485_1.time_ <= var_488_6 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_7 = 1

			if var_488_6 <= arg_485_1.time_ and arg_485_1.time_ < var_488_6 + var_488_7 then
				local var_488_8 = (arg_485_1.time_ - var_488_6) / var_488_7
				local var_488_9 = Color.New(0, 0, 0)

				var_488_9.a = Mathf.Lerp(0, 1, var_488_8)
				arg_485_1.mask_.color = var_488_9
			end

			if arg_485_1.time_ >= var_488_6 + var_488_7 and arg_485_1.time_ < var_488_6 + var_488_7 + arg_488_0 then
				local var_488_10 = Color.New(0, 0, 0)

				var_488_10.a = 1
				arg_485_1.mask_.color = var_488_10
			end

			local var_488_11 = 1

			if var_488_11 < arg_485_1.time_ and arg_485_1.time_ <= var_488_11 + arg_488_0 then
				SetActive(arg_485_1.dialog_, false)
				SetActive(arg_485_1.allBtn_.gameObject, false)
				arg_485_1.hideBtnsController_:SetSelectedIndex(1)
				arg_485_1:StopAllVoice()

				arg_485_1.marker = "stop1111"

				manager.video:Play("SofdecAsset/story/story_1031934.usm", function(arg_489_0)
					arg_485_1:Skip(arg_489_0)
					manager.video:Dispose()
				end, nil, nil, function(arg_490_0)
					if arg_490_0 then
						arg_485_1.state_ = "pause"
					else
						arg_485_1.state_ = "playing"
					end
				end, 1031934)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_488_12 = 108.958333333333

			if var_488_11 <= arg_485_1.time_ and arg_485_1.time_ < var_488_11 + var_488_12 then
				-- block empty
			end

			if arg_485_1.time_ >= var_488_11 + var_488_12 and arg_485_1.time_ < var_488_11 + var_488_12 + arg_488_0 then
				arg_485_1.marker = ""
			end

			local var_488_13 = arg_485_1.actors_["1084ui_story"].transform
			local var_488_14 = 0.966

			if var_488_14 < arg_485_1.time_ and arg_485_1.time_ <= var_488_14 + arg_488_0 then
				arg_485_1.var_.moveOldPos1084ui_story = var_488_13.localPosition
			end

			local var_488_15 = 0.001

			if var_488_14 <= arg_485_1.time_ and arg_485_1.time_ < var_488_14 + var_488_15 then
				local var_488_16 = (arg_485_1.time_ - var_488_14) / var_488_15
				local var_488_17 = Vector3.New(0, 100, 0)

				var_488_13.localPosition = Vector3.Lerp(arg_485_1.var_.moveOldPos1084ui_story, var_488_17, var_488_16)

				local var_488_18 = manager.ui.mainCamera.transform.position - var_488_13.position

				var_488_13.forward = Vector3.New(var_488_18.x, var_488_18.y, var_488_18.z)

				local var_488_19 = var_488_13.localEulerAngles

				var_488_19.z = 0
				var_488_19.x = 0
				var_488_13.localEulerAngles = var_488_19
			end

			if arg_485_1.time_ >= var_488_14 + var_488_15 and arg_485_1.time_ < var_488_14 + var_488_15 + arg_488_0 then
				var_488_13.localPosition = Vector3.New(0, 100, 0)

				local var_488_20 = manager.ui.mainCamera.transform.position - var_488_13.position

				var_488_13.forward = Vector3.New(var_488_20.x, var_488_20.y, var_488_20.z)

				local var_488_21 = var_488_13.localEulerAngles

				var_488_21.z = 0
				var_488_21.x = 0
				var_488_13.localEulerAngles = var_488_21
			end

			local var_488_22 = "1095ui_story"

			if arg_485_1.actors_[var_488_22] == nil then
				local var_488_23 = Object.Instantiate(Asset.Load("Char/" .. var_488_22), arg_485_1.stage_.transform)

				var_488_23.name = var_488_22
				var_488_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_485_1.actors_[var_488_22] = var_488_23

				local var_488_24 = var_488_23:GetComponentInChildren(typeof(CharacterEffect))

				var_488_24.enabled = true

				local var_488_25 = GameObjectTools.GetOrAddComponent(var_488_23, typeof(DynamicBoneHelper))

				if var_488_25 then
					var_488_25:EnableDynamicBone(false)
				end

				arg_485_1:ShowWeapon(var_488_24.transform, false)

				arg_485_1.var_[var_488_22 .. "Animator"] = var_488_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_485_1.var_[var_488_22 .. "Animator"].applyRootMotion = true
				arg_485_1.var_[var_488_22 .. "LipSync"] = var_488_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_488_26 = arg_485_1.actors_["1095ui_story"].transform
			local var_488_27 = 0.966

			if var_488_27 < arg_485_1.time_ and arg_485_1.time_ <= var_488_27 + arg_488_0 then
				arg_485_1.var_.moveOldPos1095ui_story = var_488_26.localPosition
			end

			local var_488_28 = 0.001

			if var_488_27 <= arg_485_1.time_ and arg_485_1.time_ < var_488_27 + var_488_28 then
				local var_488_29 = (arg_485_1.time_ - var_488_27) / var_488_28
				local var_488_30 = Vector3.New(0, 100, 0)

				var_488_26.localPosition = Vector3.Lerp(arg_485_1.var_.moveOldPos1095ui_story, var_488_30, var_488_29)

				local var_488_31 = manager.ui.mainCamera.transform.position - var_488_26.position

				var_488_26.forward = Vector3.New(var_488_31.x, var_488_31.y, var_488_31.z)

				local var_488_32 = var_488_26.localEulerAngles

				var_488_32.z = 0
				var_488_32.x = 0
				var_488_26.localEulerAngles = var_488_32
			end

			if arg_485_1.time_ >= var_488_27 + var_488_28 and arg_485_1.time_ < var_488_27 + var_488_28 + arg_488_0 then
				var_488_26.localPosition = Vector3.New(0, 100, 0)

				local var_488_33 = manager.ui.mainCamera.transform.position - var_488_26.position

				var_488_26.forward = Vector3.New(var_488_33.x, var_488_33.y, var_488_33.z)

				local var_488_34 = var_488_26.localEulerAngles

				var_488_34.z = 0
				var_488_34.x = 0
				var_488_26.localEulerAngles = var_488_34
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11o",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11r",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11i",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ML0102",
		"SofdecAsset/story/story_1031934.usm"
	},
	voices = {
		"story_v_out_319341.awb"
	},
	skipMarkers = {
		319341115
	}
}
