return {
	Play104102001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104102001
		arg_1_1.duration_ = 10.866

		local var_1_0 = {
			ja = 10.866,
			ko = 9.433,
			zh = 10.433,
			en = 8.766
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
				arg_1_0:Play104102002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_office", "bgm_story_office", "bgm_story_office")
			end

			local var_4_4 = "B13"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = arg_1_1.bgs_.B13
			local var_4_7 = 0

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				local var_4_8 = var_4_6:GetComponent("SpriteRenderer")

				if var_4_8 then
					var_4_8.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_9 = var_4_8.material
					local var_4_10 = var_4_9:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB13 = var_4_10.a
					arg_1_1.var_.alphaMatValueB13 = var_4_9
				end

				arg_1_1.var_.alphaOldValueB13 = 0
			end

			local var_4_11 = 1.5

			if var_4_7 <= arg_1_1.time_ and arg_1_1.time_ < var_4_7 + var_4_11 then
				local var_4_12 = (arg_1_1.time_ - var_4_7) / var_4_11
				local var_4_13 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB13, 1, var_4_12)

				if arg_1_1.var_.alphaMatValueB13 then
					local var_4_14 = arg_1_1.var_.alphaMatValueB13
					local var_4_15 = var_4_14:GetColor("_Color")

					var_4_15.a = var_4_13

					var_4_14:SetColor("_Color", var_4_15)
				end
			end

			if arg_1_1.time_ >= var_4_7 + var_4_11 and arg_1_1.time_ < var_4_7 + var_4_11 + arg_4_0 and arg_1_1.var_.alphaMatValueB13 then
				local var_4_16 = arg_1_1.var_.alphaMatValueB13
				local var_4_17 = var_4_16:GetColor("_Color")

				var_4_17.a = 1

				var_4_16:SetColor("_Color", var_4_17)
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_19 = manager.ui.mainCamera.transform.localPosition
				local var_4_20 = Vector3.New(0, 0, 10) + Vector3.New(var_4_19.x, var_4_19.y, 0)
				local var_4_21 = arg_1_1.bgs_.B13

				var_4_21.transform.localPosition = var_4_20
				var_4_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_22 = var_4_21:GetComponent("SpriteRenderer")

				if var_4_22 and var_4_22.sprite then
					local var_4_23 = (var_4_21.transform.localPosition - var_4_19).z
					local var_4_24 = manager.ui.mainCameraCom_
					local var_4_25 = 2 * var_4_23 * Mathf.Tan(var_4_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_26 = var_4_25 * var_4_24.aspect
					local var_4_27 = var_4_22.sprite.bounds.size.x
					local var_4_28 = var_4_22.sprite.bounds.size.y
					local var_4_29 = var_4_26 / var_4_27
					local var_4_30 = var_4_25 / var_4_28
					local var_4_31 = var_4_30 < var_4_29 and var_4_29 or var_4_30

					var_4_21.transform.localScale = Vector3.New(var_4_31, var_4_31, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B13" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_33 = 2

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.825

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[10].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(104102001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 32
				local var_4_41 = utf8.len(var_4_39)
				local var_4_42 = var_4_40 <= 0 and var_4_35 or var_4_35 * (var_4_41 / var_4_40)

				if var_4_42 > 0 and var_4_35 < var_4_42 then
					arg_1_1.talkMaxDuration = var_4_42
					var_4_34 = var_4_34 + 0.3

					if var_4_42 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_42 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_39
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102001", "story_v_out_104102.awb") ~= 0 then
					local var_4_43 = manager.audio:GetVoiceLength("story_v_out_104102", "104102001", "story_v_out_104102.awb") / 1000

					if var_4_43 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_43 + var_4_34
					end

					if var_4_38.prefab_name ~= "" and arg_1_1.actors_[var_4_38.prefab_name] ~= nil then
						local var_4_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_38.prefab_name].transform, "story_v_out_104102", "104102001", "story_v_out_104102.awb")

						arg_1_1:RecordAudio("104102001", var_4_44)
						arg_1_1:RecordAudio("104102001", var_4_44)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_104102", "104102001", "story_v_out_104102.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_104102", "104102001", "story_v_out_104102.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_45 = var_4_34 + 0.3
			local var_4_46 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_45) / var_4_46

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play104102002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104102002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play104102003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.55

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(104102002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 22
				local var_10_6 = utf8.len(var_10_4)
				local var_10_7 = var_10_5 <= 0 and var_10_1 or var_10_1 * (var_10_6 / var_10_5)

				if var_10_7 > 0 and var_10_1 < var_10_7 then
					arg_7_1.talkMaxDuration = var_10_7

					if var_10_7 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_7 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_4
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_8 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_8 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_8

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_8 and arg_7_1.time_ < var_10_0 + var_10_8 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play104102003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104102003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play104102004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.725

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_2 = arg_11_1:GetWordFromCfg(104102003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 29
				local var_14_5 = utf8.len(var_14_3)
				local var_14_6 = var_14_4 <= 0 and var_14_1 or var_14_1 * (var_14_5 / var_14_4)

				if var_14_6 > 0 and var_14_1 < var_14_6 then
					arg_11_1.talkMaxDuration = var_14_6

					if var_14_6 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_6 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_3
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_7 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_7 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_7

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_7 and arg_11_1.time_ < var_14_0 + var_14_7 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play104102004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104102004
		arg_15_1.duration_ = 5.233

		local var_15_0 = {
			ja = 3.233,
			ko = 3.3,
			zh = 5.233,
			en = 3.566
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
				arg_15_0:Play104102005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1032ui_story"

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

			local var_18_4 = arg_15_1.actors_["1032ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1032ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0, -1.05, -6.2)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1032ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032action/1032action4_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_18_15 = arg_15_1.actors_["1032ui_story"]
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 and arg_15_1.var_.characterEffect1032ui_story == nil then
				arg_15_1.var_.characterEffect1032ui_story = var_18_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_17 = 0.2

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17

				if arg_15_1.var_.characterEffect1032ui_story then
					arg_15_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 and arg_15_1.var_.characterEffect1032ui_story then
				arg_15_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_18_19 = 0
			local var_18_20 = 0.5

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_21 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_21:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_21:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_21:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_22 = arg_15_1:FormatText(StoryNameCfg[61].name)

				arg_15_1.leftNameTxt_.text = var_18_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_23 = arg_15_1:GetWordFromCfg(104102004)
				local var_18_24 = arg_15_1:FormatText(var_18_23.content)

				arg_15_1.text_.text = var_18_24

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_25 = 20
				local var_18_26 = utf8.len(var_18_24)
				local var_18_27 = var_18_25 <= 0 and var_18_20 or var_18_20 * (var_18_26 / var_18_25)

				if var_18_27 > 0 and var_18_20 < var_18_27 then
					arg_15_1.talkMaxDuration = var_18_27
					var_18_19 = var_18_19 + 0.3

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end
				end

				arg_15_1.text_.text = var_18_24
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102004", "story_v_out_104102.awb") ~= 0 then
					local var_18_28 = manager.audio:GetVoiceLength("story_v_out_104102", "104102004", "story_v_out_104102.awb") / 1000

					if var_18_28 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_28 + var_18_19
					end

					if var_18_23.prefab_name ~= "" and arg_15_1.actors_[var_18_23.prefab_name] ~= nil then
						local var_18_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_23.prefab_name].transform, "story_v_out_104102", "104102004", "story_v_out_104102.awb")

						arg_15_1:RecordAudio("104102004", var_18_29)
						arg_15_1:RecordAudio("104102004", var_18_29)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104102", "104102004", "story_v_out_104102.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104102", "104102004", "story_v_out_104102.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_30 = var_18_19 + 0.3
			local var_18_31 = math.max(var_18_20, arg_15_1.talkMaxDuration)

			if var_18_30 <= arg_15_1.time_ and arg_15_1.time_ < var_18_30 + var_18_31 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_30) / var_18_31

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_30 + var_18_31 and arg_15_1.time_ < var_18_30 + var_18_31 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104102005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 104102005
		arg_21_1.duration_ = 3.633

		local var_21_0 = {
			ja = 2.233,
			ko = 1.833,
			zh = 3.633,
			en = 3.133
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play104102006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1032ui_story"]
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 and arg_21_1.var_.characterEffect1032ui_story == nil then
				arg_21_1.var_.characterEffect1032ui_story = var_24_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_2 = 0.2

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2

				if arg_21_1.var_.characterEffect1032ui_story then
					local var_24_4 = Mathf.Lerp(0, 0.5, var_24_3)

					arg_21_1.var_.characterEffect1032ui_story.fillFlat = true
					arg_21_1.var_.characterEffect1032ui_story.fillRatio = var_24_4
				end
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 and arg_21_1.var_.characterEffect1032ui_story then
				local var_24_5 = 0.5

				arg_21_1.var_.characterEffect1032ui_story.fillFlat = true
				arg_21_1.var_.characterEffect1032ui_story.fillRatio = var_24_5
			end

			local var_24_6 = 0
			local var_24_7 = 0.325

			if var_24_6 < arg_21_1.time_ and arg_21_1.time_ <= var_24_6 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_8 = arg_21_1:FormatText(StoryNameCfg[10].name)

				arg_21_1.leftNameTxt_.text = var_24_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_9 = arg_21_1:GetWordFromCfg(104102005)
				local var_24_10 = arg_21_1:FormatText(var_24_9.content)

				arg_21_1.text_.text = var_24_10

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_11 = 13
				local var_24_12 = utf8.len(var_24_10)
				local var_24_13 = var_24_11 <= 0 and var_24_7 or var_24_7 * (var_24_12 / var_24_11)

				if var_24_13 > 0 and var_24_7 < var_24_13 then
					arg_21_1.talkMaxDuration = var_24_13

					if var_24_13 + var_24_6 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_13 + var_24_6
					end
				end

				arg_21_1.text_.text = var_24_10
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102005", "story_v_out_104102.awb") ~= 0 then
					local var_24_14 = manager.audio:GetVoiceLength("story_v_out_104102", "104102005", "story_v_out_104102.awb") / 1000

					if var_24_14 + var_24_6 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_14 + var_24_6
					end

					if var_24_9.prefab_name ~= "" and arg_21_1.actors_[var_24_9.prefab_name] ~= nil then
						local var_24_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_9.prefab_name].transform, "story_v_out_104102", "104102005", "story_v_out_104102.awb")

						arg_21_1:RecordAudio("104102005", var_24_15)
						arg_21_1:RecordAudio("104102005", var_24_15)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_104102", "104102005", "story_v_out_104102.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_104102", "104102005", "story_v_out_104102.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_16 = math.max(var_24_7, arg_21_1.talkMaxDuration)

			if var_24_6 <= arg_21_1.time_ and arg_21_1.time_ < var_24_6 + var_24_16 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_6) / var_24_16

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_6 + var_24_16 and arg_21_1.time_ < var_24_6 + var_24_16 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play104102006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 104102006
		arg_25_1.duration_ = 5.566

		local var_25_0 = {
			ja = 5.566,
			ko = 3.633,
			zh = 4.7,
			en = 2.633
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
				arg_25_0:Play104102007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1032ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.characterEffect1032ui_story == nil then
				arg_25_1.var_.characterEffect1032ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.2

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect1032ui_story then
					arg_25_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.characterEffect1032ui_story then
				arg_25_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_28_4 = 0

			if var_28_4 < arg_25_1.time_ and arg_25_1.time_ <= var_28_4 + arg_28_0 then
				arg_25_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032actionlink/1032action443")
			end

			local var_28_5 = 0

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 then
				arg_25_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_28_6 = 0
			local var_28_7 = 0.425

			if var_28_6 < arg_25_1.time_ and arg_25_1.time_ <= var_28_6 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_8 = arg_25_1:FormatText(StoryNameCfg[61].name)

				arg_25_1.leftNameTxt_.text = var_28_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_9 = arg_25_1:GetWordFromCfg(104102006)
				local var_28_10 = arg_25_1:FormatText(var_28_9.content)

				arg_25_1.text_.text = var_28_10

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_11 = 17
				local var_28_12 = utf8.len(var_28_10)
				local var_28_13 = var_28_11 <= 0 and var_28_7 or var_28_7 * (var_28_12 / var_28_11)

				if var_28_13 > 0 and var_28_7 < var_28_13 then
					arg_25_1.talkMaxDuration = var_28_13

					if var_28_13 + var_28_6 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_13 + var_28_6
					end
				end

				arg_25_1.text_.text = var_28_10
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102006", "story_v_out_104102.awb") ~= 0 then
					local var_28_14 = manager.audio:GetVoiceLength("story_v_out_104102", "104102006", "story_v_out_104102.awb") / 1000

					if var_28_14 + var_28_6 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_14 + var_28_6
					end

					if var_28_9.prefab_name ~= "" and arg_25_1.actors_[var_28_9.prefab_name] ~= nil then
						local var_28_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_9.prefab_name].transform, "story_v_out_104102", "104102006", "story_v_out_104102.awb")

						arg_25_1:RecordAudio("104102006", var_28_15)
						arg_25_1:RecordAudio("104102006", var_28_15)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_104102", "104102006", "story_v_out_104102.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_104102", "104102006", "story_v_out_104102.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_16 = math.max(var_28_7, arg_25_1.talkMaxDuration)

			if var_28_6 <= arg_25_1.time_ and arg_25_1.time_ < var_28_6 + var_28_16 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_6) / var_28_16

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_6 + var_28_16 and arg_25_1.time_ < var_28_6 + var_28_16 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play104102007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 104102007
		arg_29_1.duration_ = 5.966

		local var_29_0 = {
			ja = 3.833,
			ko = 3.5,
			zh = 5.966,
			en = 4.566
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play104102008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032actionlink/1032action437")
			end

			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_32_2 = 0
			local var_32_3 = 0.575

			if var_32_2 < arg_29_1.time_ and arg_29_1.time_ <= var_32_2 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_4 = arg_29_1:FormatText(StoryNameCfg[61].name)

				arg_29_1.leftNameTxt_.text = var_32_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_5 = arg_29_1:GetWordFromCfg(104102007)
				local var_32_6 = arg_29_1:FormatText(var_32_5.content)

				arg_29_1.text_.text = var_32_6

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_7 = 23
				local var_32_8 = utf8.len(var_32_6)
				local var_32_9 = var_32_7 <= 0 and var_32_3 or var_32_3 * (var_32_8 / var_32_7)

				if var_32_9 > 0 and var_32_3 < var_32_9 then
					arg_29_1.talkMaxDuration = var_32_9

					if var_32_9 + var_32_2 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_9 + var_32_2
					end
				end

				arg_29_1.text_.text = var_32_6
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102007", "story_v_out_104102.awb") ~= 0 then
					local var_32_10 = manager.audio:GetVoiceLength("story_v_out_104102", "104102007", "story_v_out_104102.awb") / 1000

					if var_32_10 + var_32_2 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_10 + var_32_2
					end

					if var_32_5.prefab_name ~= "" and arg_29_1.actors_[var_32_5.prefab_name] ~= nil then
						local var_32_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_5.prefab_name].transform, "story_v_out_104102", "104102007", "story_v_out_104102.awb")

						arg_29_1:RecordAudio("104102007", var_32_11)
						arg_29_1:RecordAudio("104102007", var_32_11)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_104102", "104102007", "story_v_out_104102.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_104102", "104102007", "story_v_out_104102.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_12 = math.max(var_32_3, arg_29_1.talkMaxDuration)

			if var_32_2 <= arg_29_1.time_ and arg_29_1.time_ < var_32_2 + var_32_12 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_2) / var_32_12

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_2 + var_32_12 and arg_29_1.time_ < var_32_2 + var_32_12 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play104102008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 104102008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play104102009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1032ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect1032ui_story == nil then
				arg_33_1.var_.characterEffect1032ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.2

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1032ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect1032ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1032ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect1032ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect1032ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1032ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 0.05

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_8 = arg_33_1:FormatText(StoryNameCfg[7].name)

				arg_33_1.leftNameTxt_.text = var_36_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_9 = arg_33_1:GetWordFromCfg(104102008)
				local var_36_10 = arg_33_1:FormatText(var_36_9.content)

				arg_33_1.text_.text = var_36_10

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_11 = 2
				local var_36_12 = utf8.len(var_36_10)
				local var_36_13 = var_36_11 <= 0 and var_36_7 or var_36_7 * (var_36_12 / var_36_11)

				if var_36_13 > 0 and var_36_7 < var_36_13 then
					arg_33_1.talkMaxDuration = var_36_13

					if var_36_13 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_13 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_10
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_14 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_14 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_14

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_14 and arg_33_1.time_ < var_36_6 + var_36_14 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play104102009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 104102009
		arg_37_1.duration_ = 8

		local var_37_0 = {
			ja = 8,
			ko = 5.233,
			zh = 6.066,
			en = 6.366
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play104102010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = "1037ui_story"

			if arg_37_1.actors_[var_40_0] == nil then
				local var_40_1 = Object.Instantiate(Asset.Load("Char/" .. var_40_0), arg_37_1.stage_.transform)

				var_40_1.name = var_40_0
				var_40_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.actors_[var_40_0] = var_40_1

				local var_40_2 = var_40_1:GetComponentInChildren(typeof(CharacterEffect))

				var_40_2.enabled = true

				local var_40_3 = GameObjectTools.GetOrAddComponent(var_40_1, typeof(DynamicBoneHelper))

				if var_40_3 then
					var_40_3:EnableDynamicBone(false)
				end

				arg_37_1:ShowWeapon(var_40_2.transform, false)

				arg_37_1.var_[var_40_0 .. "Animator"] = var_40_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_37_1.var_[var_40_0 .. "Animator"].applyRootMotion = true
				arg_37_1.var_[var_40_0 .. "LipSync"] = var_40_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_40_4 = arg_37_1.actors_["1037ui_story"]
			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 and arg_37_1.var_.characterEffect1037ui_story == nil then
				arg_37_1.var_.characterEffect1037ui_story = var_40_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_6 = 0.1

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_6 then
				local var_40_7 = (arg_37_1.time_ - var_40_5) / var_40_6

				if arg_37_1.var_.characterEffect1037ui_story then
					arg_37_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_5 + var_40_6 and arg_37_1.time_ < var_40_5 + var_40_6 + arg_40_0 and arg_37_1.var_.characterEffect1037ui_story then
				arg_37_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_40_8 = arg_37_1.actors_["1037ui_story"].transform
			local var_40_9 = 0

			if var_40_9 < arg_37_1.time_ and arg_37_1.time_ <= var_40_9 + arg_40_0 then
				arg_37_1.var_.moveOldPos1037ui_story = var_40_8.localPosition
			end

			local var_40_10 = 0.001

			if var_40_9 <= arg_37_1.time_ and arg_37_1.time_ < var_40_9 + var_40_10 then
				local var_40_11 = (arg_37_1.time_ - var_40_9) / var_40_10
				local var_40_12 = Vector3.New(0.7, -1.09, -5.81)

				var_40_8.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1037ui_story, var_40_12, var_40_11)

				local var_40_13 = manager.ui.mainCamera.transform.position - var_40_8.position

				var_40_8.forward = Vector3.New(var_40_13.x, var_40_13.y, var_40_13.z)

				local var_40_14 = var_40_8.localEulerAngles

				var_40_14.z = 0
				var_40_14.x = 0
				var_40_8.localEulerAngles = var_40_14
			end

			if arg_37_1.time_ >= var_40_9 + var_40_10 and arg_37_1.time_ < var_40_9 + var_40_10 + arg_40_0 then
				var_40_8.localPosition = Vector3.New(0.7, -1.09, -5.81)

				local var_40_15 = manager.ui.mainCamera.transform.position - var_40_8.position

				var_40_8.forward = Vector3.New(var_40_15.x, var_40_15.y, var_40_15.z)

				local var_40_16 = var_40_8.localEulerAngles

				var_40_16.z = 0
				var_40_16.x = 0
				var_40_8.localEulerAngles = var_40_16
			end

			local var_40_17 = 0

			if var_40_17 < arg_37_1.time_ and arg_37_1.time_ <= var_40_17 + arg_40_0 then
				arg_37_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action4_1")
			end

			local var_40_18 = arg_37_1.actors_["1032ui_story"].transform
			local var_40_19 = 0

			if var_40_19 < arg_37_1.time_ and arg_37_1.time_ <= var_40_19 + arg_40_0 then
				arg_37_1.var_.moveOldPos1032ui_story = var_40_18.localPosition
			end

			local var_40_20 = 0.100000001490116

			if var_40_19 <= arg_37_1.time_ and arg_37_1.time_ < var_40_19 + var_40_20 then
				local var_40_21 = (arg_37_1.time_ - var_40_19) / var_40_20
				local var_40_22 = Vector3.New(-0.7, -1.05, -6.2)

				var_40_18.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1032ui_story, var_40_22, var_40_21)

				local var_40_23 = manager.ui.mainCamera.transform.position - var_40_18.position

				var_40_18.forward = Vector3.New(var_40_23.x, var_40_23.y, var_40_23.z)

				local var_40_24 = var_40_18.localEulerAngles

				var_40_24.z = 0
				var_40_24.x = 0
				var_40_18.localEulerAngles = var_40_24
			end

			if arg_37_1.time_ >= var_40_19 + var_40_20 and arg_37_1.time_ < var_40_19 + var_40_20 + arg_40_0 then
				var_40_18.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_40_25 = manager.ui.mainCamera.transform.position - var_40_18.position

				var_40_18.forward = Vector3.New(var_40_25.x, var_40_25.y, var_40_25.z)

				local var_40_26 = var_40_18.localEulerAngles

				var_40_26.z = 0
				var_40_26.x = 0
				var_40_18.localEulerAngles = var_40_26
			end

			local var_40_27 = arg_37_1.actors_["1032ui_story"]
			local var_40_28 = 0

			if var_40_28 < arg_37_1.time_ and arg_37_1.time_ <= var_40_28 + arg_40_0 and arg_37_1.var_.characterEffect1032ui_story == nil then
				arg_37_1.var_.characterEffect1032ui_story = var_40_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_29 = 0.1

			if var_40_28 <= arg_37_1.time_ and arg_37_1.time_ < var_40_28 + var_40_29 then
				local var_40_30 = (arg_37_1.time_ - var_40_28) / var_40_29

				if arg_37_1.var_.characterEffect1032ui_story then
					local var_40_31 = Mathf.Lerp(0, 0.5, var_40_30)

					arg_37_1.var_.characterEffect1032ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1032ui_story.fillRatio = var_40_31
				end
			end

			if arg_37_1.time_ >= var_40_28 + var_40_29 and arg_37_1.time_ < var_40_28 + var_40_29 + arg_40_0 and arg_37_1.var_.characterEffect1032ui_story then
				local var_40_32 = 0.5

				arg_37_1.var_.characterEffect1032ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1032ui_story.fillRatio = var_40_32
			end

			local var_40_33 = 0

			if var_40_33 < arg_37_1.time_ and arg_37_1.time_ <= var_40_33 + arg_40_0 then
				arg_37_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_40_34 = 0
			local var_40_35 = 0.6

			if var_40_34 < arg_37_1.time_ and arg_37_1.time_ <= var_40_34 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_36 = arg_37_1:FormatText(StoryNameCfg[15].name)

				arg_37_1.leftNameTxt_.text = var_40_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_37 = arg_37_1:GetWordFromCfg(104102009)
				local var_40_38 = arg_37_1:FormatText(var_40_37.content)

				arg_37_1.text_.text = var_40_38

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_39 = 24
				local var_40_40 = utf8.len(var_40_38)
				local var_40_41 = var_40_39 <= 0 and var_40_35 or var_40_35 * (var_40_40 / var_40_39)

				if var_40_41 > 0 and var_40_35 < var_40_41 then
					arg_37_1.talkMaxDuration = var_40_41

					if var_40_41 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_41 + var_40_34
					end
				end

				arg_37_1.text_.text = var_40_38
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102009", "story_v_out_104102.awb") ~= 0 then
					local var_40_42 = manager.audio:GetVoiceLength("story_v_out_104102", "104102009", "story_v_out_104102.awb") / 1000

					if var_40_42 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_42 + var_40_34
					end

					if var_40_37.prefab_name ~= "" and arg_37_1.actors_[var_40_37.prefab_name] ~= nil then
						local var_40_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_37.prefab_name].transform, "story_v_out_104102", "104102009", "story_v_out_104102.awb")

						arg_37_1:RecordAudio("104102009", var_40_43)
						arg_37_1:RecordAudio("104102009", var_40_43)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_104102", "104102009", "story_v_out_104102.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_104102", "104102009", "story_v_out_104102.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_44 = math.max(var_40_35, arg_37_1.talkMaxDuration)

			if var_40_34 <= arg_37_1.time_ and arg_37_1.time_ < var_40_34 + var_40_44 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_34) / var_40_44

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_34 + var_40_44 and arg_37_1.time_ < var_40_34 + var_40_44 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play104102010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 104102010
		arg_41_1.duration_ = 5.2

		local var_41_0 = {
			ja = 5.2,
			ko = 3.4,
			zh = 3.6,
			en = 3.7
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
				arg_41_0:Play104102011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action4_2")
			end

			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_44_2 = 0
			local var_44_3 = 0.425

			if var_44_2 < arg_41_1.time_ and arg_41_1.time_ <= var_44_2 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_4 = arg_41_1:FormatText(StoryNameCfg[15].name)

				arg_41_1.leftNameTxt_.text = var_44_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_5 = arg_41_1:GetWordFromCfg(104102010)
				local var_44_6 = arg_41_1:FormatText(var_44_5.content)

				arg_41_1.text_.text = var_44_6

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_7 = 17
				local var_44_8 = utf8.len(var_44_6)
				local var_44_9 = var_44_7 <= 0 and var_44_3 or var_44_3 * (var_44_8 / var_44_7)

				if var_44_9 > 0 and var_44_3 < var_44_9 then
					arg_41_1.talkMaxDuration = var_44_9

					if var_44_9 + var_44_2 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_9 + var_44_2
					end
				end

				arg_41_1.text_.text = var_44_6
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102010", "story_v_out_104102.awb") ~= 0 then
					local var_44_10 = manager.audio:GetVoiceLength("story_v_out_104102", "104102010", "story_v_out_104102.awb") / 1000

					if var_44_10 + var_44_2 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_10 + var_44_2
					end

					if var_44_5.prefab_name ~= "" and arg_41_1.actors_[var_44_5.prefab_name] ~= nil then
						local var_44_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_5.prefab_name].transform, "story_v_out_104102", "104102010", "story_v_out_104102.awb")

						arg_41_1:RecordAudio("104102010", var_44_11)
						arg_41_1:RecordAudio("104102010", var_44_11)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_104102", "104102010", "story_v_out_104102.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_104102", "104102010", "story_v_out_104102.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_12 = math.max(var_44_3, arg_41_1.talkMaxDuration)

			if var_44_2 <= arg_41_1.time_ and arg_41_1.time_ < var_44_2 + var_44_12 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_2) / var_44_12

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_2 + var_44_12 and arg_41_1.time_ < var_44_2 + var_44_12 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play104102011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 104102011
		arg_45_1.duration_ = 6.733

		local var_45_0 = {
			ja = 6.733,
			ko = 6.033,
			zh = 5.2,
			en = 4.466
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
				arg_45_0:Play104102012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1037ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1037ui_story == nil then
				arg_45_1.var_.characterEffect1037ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.1

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1037ui_story then
					local var_48_4 = Mathf.Lerp(0, 0.5, var_48_3)

					arg_45_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1037ui_story.fillRatio = var_48_4
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1037ui_story then
				local var_48_5 = 0.5

				arg_45_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1037ui_story.fillRatio = var_48_5
			end

			local var_48_6 = 0
			local var_48_7 = 0.5

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_8 = arg_45_1:FormatText(StoryNameCfg[10].name)

				arg_45_1.leftNameTxt_.text = var_48_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, true)
				arg_45_1.iconController_:SetSelectedState("hero")

				arg_45_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_9 = arg_45_1:GetWordFromCfg(104102011)
				local var_48_10 = arg_45_1:FormatText(var_48_9.content)

				arg_45_1.text_.text = var_48_10

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_11 = 20
				local var_48_12 = utf8.len(var_48_10)
				local var_48_13 = var_48_11 <= 0 and var_48_7 or var_48_7 * (var_48_12 / var_48_11)

				if var_48_13 > 0 and var_48_7 < var_48_13 then
					arg_45_1.talkMaxDuration = var_48_13

					if var_48_13 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_13 + var_48_6
					end
				end

				arg_45_1.text_.text = var_48_10
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102011", "story_v_out_104102.awb") ~= 0 then
					local var_48_14 = manager.audio:GetVoiceLength("story_v_out_104102", "104102011", "story_v_out_104102.awb") / 1000

					if var_48_14 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_14 + var_48_6
					end

					if var_48_9.prefab_name ~= "" and arg_45_1.actors_[var_48_9.prefab_name] ~= nil then
						local var_48_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_9.prefab_name].transform, "story_v_out_104102", "104102011", "story_v_out_104102.awb")

						arg_45_1:RecordAudio("104102011", var_48_15)
						arg_45_1:RecordAudio("104102011", var_48_15)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_104102", "104102011", "story_v_out_104102.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_104102", "104102011", "story_v_out_104102.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_16 = math.max(var_48_7, arg_45_1.talkMaxDuration)

			if var_48_6 <= arg_45_1.time_ and arg_45_1.time_ < var_48_6 + var_48_16 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_6) / var_48_16

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_6 + var_48_16 and arg_45_1.time_ < var_48_6 + var_48_16 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play104102012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 104102012
		arg_49_1.duration_ = 5.533

		local var_49_0 = {
			ja = 5.533,
			ko = 2.7,
			zh = 3.866,
			en = 3.533
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
				arg_49_0:Play104102013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1032ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect1032ui_story == nil then
				arg_49_1.var_.characterEffect1032ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.1

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1032ui_story then
					arg_49_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect1032ui_story then
				arg_49_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_52_4 = 0

			if var_52_4 < arg_49_1.time_ and arg_49_1.time_ <= var_52_4 + arg_52_0 then
				arg_49_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032action/1032action7_2")
			end

			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 then
				arg_49_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_52_6 = 0
			local var_52_7 = 0.375

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_8 = arg_49_1:FormatText(StoryNameCfg[61].name)

				arg_49_1.leftNameTxt_.text = var_52_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_9 = arg_49_1:GetWordFromCfg(104102012)
				local var_52_10 = arg_49_1:FormatText(var_52_9.content)

				arg_49_1.text_.text = var_52_10

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_11 = 15
				local var_52_12 = utf8.len(var_52_10)
				local var_52_13 = var_52_11 <= 0 and var_52_7 or var_52_7 * (var_52_12 / var_52_11)

				if var_52_13 > 0 and var_52_7 < var_52_13 then
					arg_49_1.talkMaxDuration = var_52_13

					if var_52_13 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_13 + var_52_6
					end
				end

				arg_49_1.text_.text = var_52_10
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102012", "story_v_out_104102.awb") ~= 0 then
					local var_52_14 = manager.audio:GetVoiceLength("story_v_out_104102", "104102012", "story_v_out_104102.awb") / 1000

					if var_52_14 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_14 + var_52_6
					end

					if var_52_9.prefab_name ~= "" and arg_49_1.actors_[var_52_9.prefab_name] ~= nil then
						local var_52_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_9.prefab_name].transform, "story_v_out_104102", "104102012", "story_v_out_104102.awb")

						arg_49_1:RecordAudio("104102012", var_52_15)
						arg_49_1:RecordAudio("104102012", var_52_15)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_104102", "104102012", "story_v_out_104102.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_104102", "104102012", "story_v_out_104102.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_16 = math.max(var_52_7, arg_49_1.talkMaxDuration)

			if var_52_6 <= arg_49_1.time_ and arg_49_1.time_ < var_52_6 + var_52_16 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_6) / var_52_16

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_6 + var_52_16 and arg_49_1.time_ < var_52_6 + var_52_16 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play104102013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 104102013
		arg_53_1.duration_ = 0.100000001489

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"

			SetActive(arg_53_1.choicesGo_, true)

			for iter_54_0, iter_54_1 in ipairs(arg_53_1.choices_) do
				local var_54_0 = iter_54_0 <= 2

				SetActive(iter_54_1.go, var_54_0)
			end

			arg_53_1.choices_[1].txt.text = arg_53_1:FormatText(StoryChoiceCfg[28].name)
			arg_53_1.choices_[2].txt.text = arg_53_1:FormatText(StoryChoiceCfg[29].name)
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play104102018(arg_53_1)
			end

			if arg_55_0 == 2 then
				arg_53_0:Play104102014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1032ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect1032ui_story == nil then
				arg_53_1.var_.characterEffect1032ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.1

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect1032ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect1032ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1032ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect1032ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect1032ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1032ui_story.fillRatio = var_56_5
			end
		end
	end,
	Play104102018 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 104102018
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play104102019(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1032ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect1032ui_story == nil then
				arg_57_1.var_.characterEffect1032ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.1

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1032ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect1032ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1032ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect1032ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect1032ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1032ui_story.fillRatio = var_60_5
			end

			local var_60_6 = 0
			local var_60_7 = 0.35

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_8 = arg_57_1:FormatText(StoryNameCfg[7].name)

				arg_57_1.leftNameTxt_.text = var_60_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_9 = arg_57_1:GetWordFromCfg(104102018)
				local var_60_10 = arg_57_1:FormatText(var_60_9.content)

				arg_57_1.text_.text = var_60_10

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_11 = 14
				local var_60_12 = utf8.len(var_60_10)
				local var_60_13 = var_60_11 <= 0 and var_60_7 or var_60_7 * (var_60_12 / var_60_11)

				if var_60_13 > 0 and var_60_7 < var_60_13 then
					arg_57_1.talkMaxDuration = var_60_13

					if var_60_13 + var_60_6 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_13 + var_60_6
					end
				end

				arg_57_1.text_.text = var_60_10
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_14 = math.max(var_60_7, arg_57_1.talkMaxDuration)

			if var_60_6 <= arg_57_1.time_ and arg_57_1.time_ < var_60_6 + var_60_14 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_6) / var_60_14

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_6 + var_60_14 and arg_57_1.time_ < var_60_6 + var_60_14 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play104102019 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 104102019
		arg_61_1.duration_ = 2.9

		local var_61_0 = {
			ja = 2.133,
			ko = 2.6,
			zh = 2.666,
			en = 2.9
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
				arg_61_0:Play104102020(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1032ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect1032ui_story == nil then
				arg_61_1.var_.characterEffect1032ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.1

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1032ui_story then
					arg_61_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect1032ui_story then
				arg_61_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_64_4 = 0

			if var_64_4 < arg_61_1.time_ and arg_61_1.time_ <= var_64_4 + arg_64_0 then
				arg_61_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032action/1032action1_1")
			end

			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 then
				arg_61_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_64_6 = 0
			local var_64_7 = 0.15

			if var_64_6 < arg_61_1.time_ and arg_61_1.time_ <= var_64_6 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_8 = arg_61_1:FormatText(StoryNameCfg[61].name)

				arg_61_1.leftNameTxt_.text = var_64_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_9 = arg_61_1:GetWordFromCfg(104102019)
				local var_64_10 = arg_61_1:FormatText(var_64_9.content)

				arg_61_1.text_.text = var_64_10

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_11 = 6
				local var_64_12 = utf8.len(var_64_10)
				local var_64_13 = var_64_11 <= 0 and var_64_7 or var_64_7 * (var_64_12 / var_64_11)

				if var_64_13 > 0 and var_64_7 < var_64_13 then
					arg_61_1.talkMaxDuration = var_64_13

					if var_64_13 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_13 + var_64_6
					end
				end

				arg_61_1.text_.text = var_64_10
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102019", "story_v_out_104102.awb") ~= 0 then
					local var_64_14 = manager.audio:GetVoiceLength("story_v_out_104102", "104102019", "story_v_out_104102.awb") / 1000

					if var_64_14 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_14 + var_64_6
					end

					if var_64_9.prefab_name ~= "" and arg_61_1.actors_[var_64_9.prefab_name] ~= nil then
						local var_64_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_9.prefab_name].transform, "story_v_out_104102", "104102019", "story_v_out_104102.awb")

						arg_61_1:RecordAudio("104102019", var_64_15)
						arg_61_1:RecordAudio("104102019", var_64_15)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_104102", "104102019", "story_v_out_104102.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_104102", "104102019", "story_v_out_104102.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_16 = math.max(var_64_7, arg_61_1.talkMaxDuration)

			if var_64_6 <= arg_61_1.time_ and arg_61_1.time_ < var_64_6 + var_64_16 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_6) / var_64_16

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_6 + var_64_16 and arg_61_1.time_ < var_64_6 + var_64_16 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play104102020 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 104102020
		arg_65_1.duration_ = 8.266

		local var_65_0 = {
			ja = 7.133,
			ko = 6.433,
			zh = 8.266,
			en = 7.766
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
				arg_65_0:Play104102021(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_68_1 = 0
			local var_68_2 = 0.95

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_3 = arg_65_1:FormatText(StoryNameCfg[61].name)

				arg_65_1.leftNameTxt_.text = var_68_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_4 = arg_65_1:GetWordFromCfg(104102020)
				local var_68_5 = arg_65_1:FormatText(var_68_4.content)

				arg_65_1.text_.text = var_68_5

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_6 = 38
				local var_68_7 = utf8.len(var_68_5)
				local var_68_8 = var_68_6 <= 0 and var_68_2 or var_68_2 * (var_68_7 / var_68_6)

				if var_68_8 > 0 and var_68_2 < var_68_8 then
					arg_65_1.talkMaxDuration = var_68_8

					if var_68_8 + var_68_1 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_1
					end
				end

				arg_65_1.text_.text = var_68_5
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102020", "story_v_out_104102.awb") ~= 0 then
					local var_68_9 = manager.audio:GetVoiceLength("story_v_out_104102", "104102020", "story_v_out_104102.awb") / 1000

					if var_68_9 + var_68_1 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_9 + var_68_1
					end

					if var_68_4.prefab_name ~= "" and arg_65_1.actors_[var_68_4.prefab_name] ~= nil then
						local var_68_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_4.prefab_name].transform, "story_v_out_104102", "104102020", "story_v_out_104102.awb")

						arg_65_1:RecordAudio("104102020", var_68_10)
						arg_65_1:RecordAudio("104102020", var_68_10)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_104102", "104102020", "story_v_out_104102.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_104102", "104102020", "story_v_out_104102.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_11 = math.max(var_68_2, arg_65_1.talkMaxDuration)

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_11 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_1) / var_68_11

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_1 + var_68_11 and arg_65_1.time_ < var_68_1 + var_68_11 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play104102021 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 104102021
		arg_69_1.duration_ = 12.9

		local var_69_0 = {
			ja = 12.9,
			ko = 7.466,
			zh = 7.166,
			en = 7.8
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
				arg_69_0:Play104102022(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1037ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1037ui_story == nil then
				arg_69_1.var_.characterEffect1037ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.1

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1037ui_story then
					arg_69_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1037ui_story then
				arg_69_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_72_4 = arg_69_1.actors_["1032ui_story"]
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and arg_69_1.var_.characterEffect1032ui_story == nil then
				arg_69_1.var_.characterEffect1032ui_story = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.1

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect1032ui_story then
					local var_72_8 = Mathf.Lerp(0, 0.5, var_72_7)

					arg_69_1.var_.characterEffect1032ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1032ui_story.fillRatio = var_72_8
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and arg_69_1.var_.characterEffect1032ui_story then
				local var_72_9 = 0.5

				arg_69_1.var_.characterEffect1032ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1032ui_story.fillRatio = var_72_9
			end

			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				arg_69_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_72_11 = 0
			local var_72_12 = 0.875

			if var_72_11 < arg_69_1.time_ and arg_69_1.time_ <= var_72_11 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_13 = arg_69_1:FormatText(StoryNameCfg[15].name)

				arg_69_1.leftNameTxt_.text = var_72_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_14 = arg_69_1:GetWordFromCfg(104102021)
				local var_72_15 = arg_69_1:FormatText(var_72_14.content)

				arg_69_1.text_.text = var_72_15

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_16 = 35
				local var_72_17 = utf8.len(var_72_15)
				local var_72_18 = var_72_16 <= 0 and var_72_12 or var_72_12 * (var_72_17 / var_72_16)

				if var_72_18 > 0 and var_72_12 < var_72_18 then
					arg_69_1.talkMaxDuration = var_72_18

					if var_72_18 + var_72_11 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_18 + var_72_11
					end
				end

				arg_69_1.text_.text = var_72_15
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102021", "story_v_out_104102.awb") ~= 0 then
					local var_72_19 = manager.audio:GetVoiceLength("story_v_out_104102", "104102021", "story_v_out_104102.awb") / 1000

					if var_72_19 + var_72_11 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_19 + var_72_11
					end

					if var_72_14.prefab_name ~= "" and arg_69_1.actors_[var_72_14.prefab_name] ~= nil then
						local var_72_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_14.prefab_name].transform, "story_v_out_104102", "104102021", "story_v_out_104102.awb")

						arg_69_1:RecordAudio("104102021", var_72_20)
						arg_69_1:RecordAudio("104102021", var_72_20)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_104102", "104102021", "story_v_out_104102.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_104102", "104102021", "story_v_out_104102.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_21 = math.max(var_72_12, arg_69_1.talkMaxDuration)

			if var_72_11 <= arg_69_1.time_ and arg_69_1.time_ < var_72_11 + var_72_21 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_11) / var_72_21

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_11 + var_72_21 and arg_69_1.time_ < var_72_11 + var_72_21 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play104102022 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 104102022
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play104102023(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1037ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1037ui_story == nil then
				arg_73_1.var_.characterEffect1037ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1037ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1037ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1037ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1037ui_story.fillRatio = var_76_5
			end

			local var_76_6 = 0
			local var_76_7 = 0.7

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_8 = arg_73_1:FormatText(StoryNameCfg[7].name)

				arg_73_1.leftNameTxt_.text = var_76_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_9 = arg_73_1:GetWordFromCfg(104102022)
				local var_76_10 = arg_73_1:FormatText(var_76_9.content)

				arg_73_1.text_.text = var_76_10

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_11 = 28
				local var_76_12 = utf8.len(var_76_10)
				local var_76_13 = var_76_11 <= 0 and var_76_7 or var_76_7 * (var_76_12 / var_76_11)

				if var_76_13 > 0 and var_76_7 < var_76_13 then
					arg_73_1.talkMaxDuration = var_76_13

					if var_76_13 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_13 + var_76_6
					end
				end

				arg_73_1.text_.text = var_76_10
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_14 = math.max(var_76_7, arg_73_1.talkMaxDuration)

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_14 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_6) / var_76_14

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_6 + var_76_14 and arg_73_1.time_ < var_76_6 + var_76_14 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play104102023 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 104102023
		arg_77_1.duration_ = 3.266

		local var_77_0 = {
			ja = 2.633,
			ko = 2.5,
			zh = 3.266,
			en = 1.666
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play104102024(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 1

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				local var_80_2 = "play"
				local var_80_3 = "effect"

				arg_77_1:AudioAction(var_80_2, var_80_3, "se_story", "se_story_robot_excited", "")
			end

			local var_80_4 = arg_77_1.actors_["1032ui_story"].transform
			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1.var_.moveOldPos1032ui_story = var_80_4.localPosition
			end

			local var_80_6 = 0.001

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_6 then
				local var_80_7 = (arg_77_1.time_ - var_80_5) / var_80_6
				local var_80_8 = Vector3.New(0, 100, 0)

				var_80_4.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1032ui_story, var_80_8, var_80_7)

				local var_80_9 = manager.ui.mainCamera.transform.position - var_80_4.position

				var_80_4.forward = Vector3.New(var_80_9.x, var_80_9.y, var_80_9.z)

				local var_80_10 = var_80_4.localEulerAngles

				var_80_10.z = 0
				var_80_10.x = 0
				var_80_4.localEulerAngles = var_80_10
			end

			if arg_77_1.time_ >= var_80_5 + var_80_6 and arg_77_1.time_ < var_80_5 + var_80_6 + arg_80_0 then
				var_80_4.localPosition = Vector3.New(0, 100, 0)

				local var_80_11 = manager.ui.mainCamera.transform.position - var_80_4.position

				var_80_4.forward = Vector3.New(var_80_11.x, var_80_11.y, var_80_11.z)

				local var_80_12 = var_80_4.localEulerAngles

				var_80_12.z = 0
				var_80_12.x = 0
				var_80_4.localEulerAngles = var_80_12
			end

			local var_80_13 = arg_77_1.actors_["1037ui_story"].transform
			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1.var_.moveOldPos1037ui_story = var_80_13.localPosition
			end

			local var_80_15 = 0.001

			if var_80_14 <= arg_77_1.time_ and arg_77_1.time_ < var_80_14 + var_80_15 then
				local var_80_16 = (arg_77_1.time_ - var_80_14) / var_80_15
				local var_80_17 = Vector3.New(0, 100, 0)

				var_80_13.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1037ui_story, var_80_17, var_80_16)

				local var_80_18 = manager.ui.mainCamera.transform.position - var_80_13.position

				var_80_13.forward = Vector3.New(var_80_18.x, var_80_18.y, var_80_18.z)

				local var_80_19 = var_80_13.localEulerAngles

				var_80_19.z = 0
				var_80_19.x = 0
				var_80_13.localEulerAngles = var_80_19
			end

			if arg_77_1.time_ >= var_80_14 + var_80_15 and arg_77_1.time_ < var_80_14 + var_80_15 + arg_80_0 then
				var_80_13.localPosition = Vector3.New(0, 100, 0)

				local var_80_20 = manager.ui.mainCamera.transform.position - var_80_13.position

				var_80_13.forward = Vector3.New(var_80_20.x, var_80_20.y, var_80_20.z)

				local var_80_21 = var_80_13.localEulerAngles

				var_80_21.z = 0
				var_80_21.x = 0
				var_80_13.localEulerAngles = var_80_21
			end

			local var_80_22 = "2069_tpose"

			if arg_77_1.actors_[var_80_22] == nil then
				local var_80_23 = Object.Instantiate(Asset.Load("Char/" .. var_80_22), arg_77_1.stage_.transform)

				var_80_23.name = var_80_22
				var_80_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_77_1.actors_[var_80_22] = var_80_23

				local var_80_24 = var_80_23:GetComponentInChildren(typeof(CharacterEffect))

				var_80_24.enabled = true

				local var_80_25 = GameObjectTools.GetOrAddComponent(var_80_23, typeof(DynamicBoneHelper))

				if var_80_25 then
					var_80_25:EnableDynamicBone(false)
				end

				arg_77_1:ShowWeapon(var_80_24.transform, false)

				arg_77_1.var_[var_80_22 .. "Animator"] = var_80_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_77_1.var_[var_80_22 .. "Animator"].applyRootMotion = true
				arg_77_1.var_[var_80_22 .. "LipSync"] = var_80_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_80_26 = arg_77_1.actors_["2069_tpose"].transform
			local var_80_27 = 0

			if var_80_27 < arg_77_1.time_ and arg_77_1.time_ <= var_80_27 + arg_80_0 then
				arg_77_1.var_.moveOldPos2069_tpose = var_80_26.localPosition
			end

			local var_80_28 = 0.001

			if var_80_27 <= arg_77_1.time_ and arg_77_1.time_ < var_80_27 + var_80_28 then
				local var_80_29 = (arg_77_1.time_ - var_80_27) / var_80_28
				local var_80_30 = Vector3.New(-0.7, -0.51, -3.1)

				var_80_26.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos2069_tpose, var_80_30, var_80_29)

				local var_80_31 = manager.ui.mainCamera.transform.position - var_80_26.position

				var_80_26.forward = Vector3.New(var_80_31.x, var_80_31.y, var_80_31.z)

				local var_80_32 = var_80_26.localEulerAngles

				var_80_32.z = 0
				var_80_32.x = 0
				var_80_26.localEulerAngles = var_80_32
			end

			if arg_77_1.time_ >= var_80_27 + var_80_28 and arg_77_1.time_ < var_80_27 + var_80_28 + arg_80_0 then
				var_80_26.localPosition = Vector3.New(-0.7, -0.51, -3.1)

				local var_80_33 = manager.ui.mainCamera.transform.position - var_80_26.position

				var_80_26.forward = Vector3.New(var_80_33.x, var_80_33.y, var_80_33.z)

				local var_80_34 = var_80_26.localEulerAngles

				var_80_34.z = 0
				var_80_34.x = 0
				var_80_26.localEulerAngles = var_80_34
			end

			local var_80_35 = "2070_tpose"

			if arg_77_1.actors_[var_80_35] == nil then
				local var_80_36 = Object.Instantiate(Asset.Load("Char/" .. var_80_35), arg_77_1.stage_.transform)

				var_80_36.name = var_80_35
				var_80_36.transform.localPosition = Vector3.New(0, 100, 0)
				arg_77_1.actors_[var_80_35] = var_80_36

				local var_80_37 = var_80_36:GetComponentInChildren(typeof(CharacterEffect))

				var_80_37.enabled = true

				local var_80_38 = GameObjectTools.GetOrAddComponent(var_80_36, typeof(DynamicBoneHelper))

				if var_80_38 then
					var_80_38:EnableDynamicBone(false)
				end

				arg_77_1:ShowWeapon(var_80_37.transform, false)

				arg_77_1.var_[var_80_35 .. "Animator"] = var_80_37.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_77_1.var_[var_80_35 .. "Animator"].applyRootMotion = true
				arg_77_1.var_[var_80_35 .. "LipSync"] = var_80_37.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_80_39 = arg_77_1.actors_["2070_tpose"].transform
			local var_80_40 = 0

			if var_80_40 < arg_77_1.time_ and arg_77_1.time_ <= var_80_40 + arg_80_0 then
				arg_77_1.var_.moveOldPos2070_tpose = var_80_39.localPosition
			end

			local var_80_41 = 0.001

			if var_80_40 <= arg_77_1.time_ and arg_77_1.time_ < var_80_40 + var_80_41 then
				local var_80_42 = (arg_77_1.time_ - var_80_40) / var_80_41
				local var_80_43 = Vector3.New(0.7, -0.49, -3.1)

				var_80_39.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos2070_tpose, var_80_43, var_80_42)

				local var_80_44 = manager.ui.mainCamera.transform.position - var_80_39.position

				var_80_39.forward = Vector3.New(var_80_44.x, var_80_44.y, var_80_44.z)

				local var_80_45 = var_80_39.localEulerAngles

				var_80_45.z = 0
				var_80_45.x = 0
				var_80_39.localEulerAngles = var_80_45
			end

			if arg_77_1.time_ >= var_80_40 + var_80_41 and arg_77_1.time_ < var_80_40 + var_80_41 + arg_80_0 then
				var_80_39.localPosition = Vector3.New(0.7, -0.49, -3.1)

				local var_80_46 = manager.ui.mainCamera.transform.position - var_80_39.position

				var_80_39.forward = Vector3.New(var_80_46.x, var_80_46.y, var_80_46.z)

				local var_80_47 = var_80_39.localEulerAngles

				var_80_47.z = 0
				var_80_47.x = 0
				var_80_39.localEulerAngles = var_80_47
			end

			local var_80_48 = arg_77_1.actors_["2069_tpose"]
			local var_80_49 = 0

			if var_80_49 < arg_77_1.time_ and arg_77_1.time_ <= var_80_49 + arg_80_0 and arg_77_1.var_.characterEffect2069_tpose == nil then
				arg_77_1.var_.characterEffect2069_tpose = var_80_48:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_50 = 0.2

			if var_80_49 <= arg_77_1.time_ and arg_77_1.time_ < var_80_49 + var_80_50 then
				local var_80_51 = (arg_77_1.time_ - var_80_49) / var_80_50

				if arg_77_1.var_.characterEffect2069_tpose then
					arg_77_1.var_.characterEffect2069_tpose.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_49 + var_80_50 and arg_77_1.time_ < var_80_49 + var_80_50 + arg_80_0 and arg_77_1.var_.characterEffect2069_tpose then
				arg_77_1.var_.characterEffect2069_tpose.fillFlat = false
			end

			local var_80_52 = arg_77_1.actors_["2070_tpose"]
			local var_80_53 = 0

			if var_80_53 < arg_77_1.time_ and arg_77_1.time_ <= var_80_53 + arg_80_0 and arg_77_1.var_.characterEffect2070_tpose == nil then
				arg_77_1.var_.characterEffect2070_tpose = var_80_52:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_54 = 0.2

			if var_80_53 <= arg_77_1.time_ and arg_77_1.time_ < var_80_53 + var_80_54 then
				local var_80_55 = (arg_77_1.time_ - var_80_53) / var_80_54

				if arg_77_1.var_.characterEffect2070_tpose then
					arg_77_1.var_.characterEffect2070_tpose.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_53 + var_80_54 and arg_77_1.time_ < var_80_53 + var_80_54 + arg_80_0 and arg_77_1.var_.characterEffect2070_tpose then
				arg_77_1.var_.characterEffect2070_tpose.fillFlat = false
			end

			local var_80_56 = 0
			local var_80_57 = 0.225

			if var_80_56 < arg_77_1.time_ and arg_77_1.time_ <= var_80_56 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				arg_77_1.dialog_:SetActive(true)

				local var_80_58 = LeanTween.value(arg_77_1.dialog_, 0, 1, 0.3)

				var_80_58:setOnUpdate(LuaHelper.FloatAction(function(arg_81_0)
					arg_77_1.dialogCg_.alpha = arg_81_0
				end))
				var_80_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_77_1.dialog_)
					var_80_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_77_1.duration_ = arg_77_1.duration_ + 0.3

				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_59 = arg_77_1:FormatText(StoryNameCfg[29].name)

				arg_77_1.leftNameTxt_.text = var_80_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_60 = arg_77_1:GetWordFromCfg(104102023)
				local var_80_61 = arg_77_1:FormatText(var_80_60.content)

				arg_77_1.text_.text = var_80_61

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_62 = 9
				local var_80_63 = utf8.len(var_80_61)
				local var_80_64 = var_80_62 <= 0 and var_80_57 or var_80_57 * (var_80_63 / var_80_62)

				if var_80_64 > 0 and var_80_57 < var_80_64 then
					arg_77_1.talkMaxDuration = var_80_64
					var_80_56 = var_80_56 + 0.3

					if var_80_64 + var_80_56 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_64 + var_80_56
					end
				end

				arg_77_1.text_.text = var_80_61
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102023", "story_v_out_104102.awb") ~= 0 then
					local var_80_65 = manager.audio:GetVoiceLength("story_v_out_104102", "104102023", "story_v_out_104102.awb") / 1000

					if var_80_65 + var_80_56 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_65 + var_80_56
					end

					if var_80_60.prefab_name ~= "" and arg_77_1.actors_[var_80_60.prefab_name] ~= nil then
						local var_80_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_60.prefab_name].transform, "story_v_out_104102", "104102023", "story_v_out_104102.awb")

						arg_77_1:RecordAudio("104102023", var_80_66)
						arg_77_1:RecordAudio("104102023", var_80_66)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_104102", "104102023", "story_v_out_104102.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_104102", "104102023", "story_v_out_104102.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_67 = var_80_56 + 0.3
			local var_80_68 = math.max(var_80_57, arg_77_1.talkMaxDuration)

			if var_80_67 <= arg_77_1.time_ and arg_77_1.time_ < var_80_67 + var_80_68 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_67) / var_80_68

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_67 + var_80_68 and arg_77_1.time_ < var_80_67 + var_80_68 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play104102024 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 104102024
		arg_83_1.duration_ = 4.666

		local var_83_0 = {
			ja = 3.533,
			ko = 3.633,
			zh = 4.666,
			en = 2.766
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
				arg_83_0:Play104102025(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 1

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				local var_86_2 = "play"
				local var_86_3 = "effect"

				arg_83_1:AudioAction(var_86_2, var_86_3, "se_story", "se_story_robot_excited", "")
			end

			local var_86_4 = 0
			local var_86_5 = 0.275

			if var_86_4 < arg_83_1.time_ and arg_83_1.time_ <= var_86_4 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_6 = arg_83_1:FormatText(StoryNameCfg[29].name)

				arg_83_1.leftNameTxt_.text = var_86_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_7 = arg_83_1:GetWordFromCfg(104102024)
				local var_86_8 = arg_83_1:FormatText(var_86_7.content)

				arg_83_1.text_.text = var_86_8

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_9 = 11
				local var_86_10 = utf8.len(var_86_8)
				local var_86_11 = var_86_9 <= 0 and var_86_5 or var_86_5 * (var_86_10 / var_86_9)

				if var_86_11 > 0 and var_86_5 < var_86_11 then
					arg_83_1.talkMaxDuration = var_86_11

					if var_86_11 + var_86_4 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_11 + var_86_4
					end
				end

				arg_83_1.text_.text = var_86_8
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102024", "story_v_out_104102.awb") ~= 0 then
					local var_86_12 = manager.audio:GetVoiceLength("story_v_out_104102", "104102024", "story_v_out_104102.awb") / 1000

					if var_86_12 + var_86_4 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_12 + var_86_4
					end

					if var_86_7.prefab_name ~= "" and arg_83_1.actors_[var_86_7.prefab_name] ~= nil then
						local var_86_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_7.prefab_name].transform, "story_v_out_104102", "104102024", "story_v_out_104102.awb")

						arg_83_1:RecordAudio("104102024", var_86_13)
						arg_83_1:RecordAudio("104102024", var_86_13)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_104102", "104102024", "story_v_out_104102.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_104102", "104102024", "story_v_out_104102.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_14 = math.max(var_86_5, arg_83_1.talkMaxDuration)

			if var_86_4 <= arg_83_1.time_ and arg_83_1.time_ < var_86_4 + var_86_14 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_4) / var_86_14

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_4 + var_86_14 and arg_83_1.time_ < var_86_4 + var_86_14 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play104102025 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 104102025
		arg_87_1.duration_ = 4.166

		local var_87_0 = {
			ja = 3.266,
			ko = 2.9,
			zh = 2.8,
			en = 4.166
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
				arg_87_0:Play104102026(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1037ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1037ui_story == nil then
				arg_87_1.var_.characterEffect1037ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1037ui_story then
					arg_87_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1037ui_story then
				arg_87_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["1037ui_story"].transform
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1.var_.moveOldPos1037ui_story = var_90_4.localPosition
			end

			local var_90_6 = 0.001

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6
				local var_90_8 = Vector3.New(0, -1.09, -5.81)

				var_90_4.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1037ui_story, var_90_8, var_90_7)

				local var_90_9 = manager.ui.mainCamera.transform.position - var_90_4.position

				var_90_4.forward = Vector3.New(var_90_9.x, var_90_9.y, var_90_9.z)

				local var_90_10 = var_90_4.localEulerAngles

				var_90_10.z = 0
				var_90_10.x = 0
				var_90_4.localEulerAngles = var_90_10
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 then
				var_90_4.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_90_11 = manager.ui.mainCamera.transform.position - var_90_4.position

				var_90_4.forward = Vector3.New(var_90_11.x, var_90_11.y, var_90_11.z)

				local var_90_12 = var_90_4.localEulerAngles

				var_90_12.z = 0
				var_90_12.x = 0
				var_90_4.localEulerAngles = var_90_12
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action6_1")
			end

			local var_90_14 = arg_87_1.actors_["2069_tpose"].transform
			local var_90_15 = 0

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				arg_87_1.var_.moveOldPos2069_tpose = var_90_14.localPosition
			end

			local var_90_16 = 0.001

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_16 then
				local var_90_17 = (arg_87_1.time_ - var_90_15) / var_90_16
				local var_90_18 = Vector3.New(0, 100, 0)

				var_90_14.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos2069_tpose, var_90_18, var_90_17)

				local var_90_19 = manager.ui.mainCamera.transform.position - var_90_14.position

				var_90_14.forward = Vector3.New(var_90_19.x, var_90_19.y, var_90_19.z)

				local var_90_20 = var_90_14.localEulerAngles

				var_90_20.z = 0
				var_90_20.x = 0
				var_90_14.localEulerAngles = var_90_20
			end

			if arg_87_1.time_ >= var_90_15 + var_90_16 and arg_87_1.time_ < var_90_15 + var_90_16 + arg_90_0 then
				var_90_14.localPosition = Vector3.New(0, 100, 0)

				local var_90_21 = manager.ui.mainCamera.transform.position - var_90_14.position

				var_90_14.forward = Vector3.New(var_90_21.x, var_90_21.y, var_90_21.z)

				local var_90_22 = var_90_14.localEulerAngles

				var_90_22.z = 0
				var_90_22.x = 0
				var_90_14.localEulerAngles = var_90_22
			end

			local var_90_23 = arg_87_1.actors_["2070_tpose"].transform
			local var_90_24 = 0

			if var_90_24 < arg_87_1.time_ and arg_87_1.time_ <= var_90_24 + arg_90_0 then
				arg_87_1.var_.moveOldPos2070_tpose = var_90_23.localPosition
			end

			local var_90_25 = 0.001

			if var_90_24 <= arg_87_1.time_ and arg_87_1.time_ < var_90_24 + var_90_25 then
				local var_90_26 = (arg_87_1.time_ - var_90_24) / var_90_25
				local var_90_27 = Vector3.New(0, 100, 0)

				var_90_23.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos2070_tpose, var_90_27, var_90_26)

				local var_90_28 = manager.ui.mainCamera.transform.position - var_90_23.position

				var_90_23.forward = Vector3.New(var_90_28.x, var_90_28.y, var_90_28.z)

				local var_90_29 = var_90_23.localEulerAngles

				var_90_29.z = 0
				var_90_29.x = 0
				var_90_23.localEulerAngles = var_90_29
			end

			if arg_87_1.time_ >= var_90_24 + var_90_25 and arg_87_1.time_ < var_90_24 + var_90_25 + arg_90_0 then
				var_90_23.localPosition = Vector3.New(0, 100, 0)

				local var_90_30 = manager.ui.mainCamera.transform.position - var_90_23.position

				var_90_23.forward = Vector3.New(var_90_30.x, var_90_30.y, var_90_30.z)

				local var_90_31 = var_90_23.localEulerAngles

				var_90_31.z = 0
				var_90_31.x = 0
				var_90_23.localEulerAngles = var_90_31
			end

			local var_90_32 = 0

			if var_90_32 < arg_87_1.time_ and arg_87_1.time_ <= var_90_32 + arg_90_0 then
				arg_87_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_90_33 = 0
			local var_90_34 = 0.3

			if var_90_33 < arg_87_1.time_ and arg_87_1.time_ <= var_90_33 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_35 = arg_87_1:FormatText(StoryNameCfg[15].name)

				arg_87_1.leftNameTxt_.text = var_90_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_36 = arg_87_1:GetWordFromCfg(104102025)
				local var_90_37 = arg_87_1:FormatText(var_90_36.content)

				arg_87_1.text_.text = var_90_37

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_38 = 12
				local var_90_39 = utf8.len(var_90_37)
				local var_90_40 = var_90_38 <= 0 and var_90_34 or var_90_34 * (var_90_39 / var_90_38)

				if var_90_40 > 0 and var_90_34 < var_90_40 then
					arg_87_1.talkMaxDuration = var_90_40

					if var_90_40 + var_90_33 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_40 + var_90_33
					end
				end

				arg_87_1.text_.text = var_90_37
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102025", "story_v_out_104102.awb") ~= 0 then
					local var_90_41 = manager.audio:GetVoiceLength("story_v_out_104102", "104102025", "story_v_out_104102.awb") / 1000

					if var_90_41 + var_90_33 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_41 + var_90_33
					end

					if var_90_36.prefab_name ~= "" and arg_87_1.actors_[var_90_36.prefab_name] ~= nil then
						local var_90_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_36.prefab_name].transform, "story_v_out_104102", "104102025", "story_v_out_104102.awb")

						arg_87_1:RecordAudio("104102025", var_90_42)
						arg_87_1:RecordAudio("104102025", var_90_42)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_104102", "104102025", "story_v_out_104102.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_104102", "104102025", "story_v_out_104102.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_43 = math.max(var_90_34, arg_87_1.talkMaxDuration)

			if var_90_33 <= arg_87_1.time_ and arg_87_1.time_ < var_90_33 + var_90_43 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_33) / var_90_43

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_33 + var_90_43 and arg_87_1.time_ < var_90_33 + var_90_43 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play104102026 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 104102026
		arg_91_1.duration_ = 9.533

		local var_91_0 = {
			ja = 9.533,
			ko = 7.733,
			zh = 8.6,
			en = 6.633
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
				arg_91_0:Play104102027(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1037ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1037ui_story == nil then
				arg_91_1.var_.characterEffect1037ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.1

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1037ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1037ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1037ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1037ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 0.925

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[10].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(104102026)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102026", "story_v_out_104102.awb") ~= 0 then
					local var_94_14 = manager.audio:GetVoiceLength("story_v_out_104102", "104102026", "story_v_out_104102.awb") / 1000

					if var_94_14 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_14 + var_94_6
					end

					if var_94_9.prefab_name ~= "" and arg_91_1.actors_[var_94_9.prefab_name] ~= nil then
						local var_94_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_9.prefab_name].transform, "story_v_out_104102", "104102026", "story_v_out_104102.awb")

						arg_91_1:RecordAudio("104102026", var_94_15)
						arg_91_1:RecordAudio("104102026", var_94_15)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_104102", "104102026", "story_v_out_104102.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_104102", "104102026", "story_v_out_104102.awb")
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
	Play104102027 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 104102027
		arg_95_1.duration_ = 14.433

		local var_95_0 = {
			ja = 11.966,
			ko = 10.733,
			zh = 12.7,
			en = 14.433
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
				arg_95_0:Play104102028(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1032ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1032ui_story == nil then
				arg_95_1.var_.characterEffect1032ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.1

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1032ui_story then
					arg_95_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1032ui_story then
				arg_95_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_98_4 = 0

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032action/1032action8_1")
			end

			local var_98_5 = arg_95_1.actors_["1032ui_story"].transform
			local var_98_6 = 0

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.var_.moveOldPos1032ui_story = var_98_5.localPosition

				local var_98_7 = "1032ui_story"

				arg_95_1:ShowWeapon(arg_95_1.var_[var_98_7 .. "Animator"].transform, false)
			end

			local var_98_8 = 0.001

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_6) / var_98_8
				local var_98_10 = Vector3.New(0, -1.05, -6.2)

				var_98_5.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1032ui_story, var_98_10, var_98_9)

				local var_98_11 = manager.ui.mainCamera.transform.position - var_98_5.position

				var_98_5.forward = Vector3.New(var_98_11.x, var_98_11.y, var_98_11.z)

				local var_98_12 = var_98_5.localEulerAngles

				var_98_12.z = 0
				var_98_12.x = 0
				var_98_5.localEulerAngles = var_98_12
			end

			if arg_95_1.time_ >= var_98_6 + var_98_8 and arg_95_1.time_ < var_98_6 + var_98_8 + arg_98_0 then
				var_98_5.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_98_13 = manager.ui.mainCamera.transform.position - var_98_5.position

				var_98_5.forward = Vector3.New(var_98_13.x, var_98_13.y, var_98_13.z)

				local var_98_14 = var_98_5.localEulerAngles

				var_98_14.z = 0
				var_98_14.x = 0
				var_98_5.localEulerAngles = var_98_14
			end

			local var_98_15 = arg_95_1.actors_["1037ui_story"].transform
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.var_.moveOldPos1037ui_story = var_98_15.localPosition
			end

			local var_98_17 = 0.001

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Vector3.New(0, 100, 0)

				var_98_15.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1037ui_story, var_98_19, var_98_18)

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

			local var_98_24 = 0

			if var_98_24 < arg_95_1.time_ and arg_95_1.time_ <= var_98_24 + arg_98_0 then
				arg_95_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_98_25 = 0
			local var_98_26 = 1.4

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_27 = arg_95_1:FormatText(StoryNameCfg[61].name)

				arg_95_1.leftNameTxt_.text = var_98_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_28 = arg_95_1:GetWordFromCfg(104102027)
				local var_98_29 = arg_95_1:FormatText(var_98_28.content)

				arg_95_1.text_.text = var_98_29

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_30 = 56
				local var_98_31 = utf8.len(var_98_29)
				local var_98_32 = var_98_30 <= 0 and var_98_26 or var_98_26 * (var_98_31 / var_98_30)

				if var_98_32 > 0 and var_98_26 < var_98_32 then
					arg_95_1.talkMaxDuration = var_98_32

					if var_98_32 + var_98_25 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_32 + var_98_25
					end
				end

				arg_95_1.text_.text = var_98_29
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102027", "story_v_out_104102.awb") ~= 0 then
					local var_98_33 = manager.audio:GetVoiceLength("story_v_out_104102", "104102027", "story_v_out_104102.awb") / 1000

					if var_98_33 + var_98_25 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_33 + var_98_25
					end

					if var_98_28.prefab_name ~= "" and arg_95_1.actors_[var_98_28.prefab_name] ~= nil then
						local var_98_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_28.prefab_name].transform, "story_v_out_104102", "104102027", "story_v_out_104102.awb")

						arg_95_1:RecordAudio("104102027", var_98_34)
						arg_95_1:RecordAudio("104102027", var_98_34)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_104102", "104102027", "story_v_out_104102.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_104102", "104102027", "story_v_out_104102.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_35 = math.max(var_98_26, arg_95_1.talkMaxDuration)

			if var_98_25 <= arg_95_1.time_ and arg_95_1.time_ < var_98_25 + var_98_35 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_25) / var_98_35

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_25 + var_98_35 and arg_95_1.time_ < var_98_25 + var_98_35 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play104102028 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 104102028
		arg_99_1.duration_ = 11.633

		local var_99_0 = {
			ja = 11.633,
			ko = 6,
			zh = 9.066,
			en = 7.3
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
				arg_99_0:Play104102029(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_102_1 = 0
			local var_102_2 = 0.875

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_3 = arg_99_1:FormatText(StoryNameCfg[61].name)

				arg_99_1.leftNameTxt_.text = var_102_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_4 = arg_99_1:GetWordFromCfg(104102028)
				local var_102_5 = arg_99_1:FormatText(var_102_4.content)

				arg_99_1.text_.text = var_102_5

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_6 = 35
				local var_102_7 = utf8.len(var_102_5)
				local var_102_8 = var_102_6 <= 0 and var_102_2 or var_102_2 * (var_102_7 / var_102_6)

				if var_102_8 > 0 and var_102_2 < var_102_8 then
					arg_99_1.talkMaxDuration = var_102_8

					if var_102_8 + var_102_1 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_1
					end
				end

				arg_99_1.text_.text = var_102_5
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102028", "story_v_out_104102.awb") ~= 0 then
					local var_102_9 = manager.audio:GetVoiceLength("story_v_out_104102", "104102028", "story_v_out_104102.awb") / 1000

					if var_102_9 + var_102_1 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_9 + var_102_1
					end

					if var_102_4.prefab_name ~= "" and arg_99_1.actors_[var_102_4.prefab_name] ~= nil then
						local var_102_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_4.prefab_name].transform, "story_v_out_104102", "104102028", "story_v_out_104102.awb")

						arg_99_1:RecordAudio("104102028", var_102_10)
						arg_99_1:RecordAudio("104102028", var_102_10)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_104102", "104102028", "story_v_out_104102.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_104102", "104102028", "story_v_out_104102.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_11 = math.max(var_102_2, arg_99_1.talkMaxDuration)

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_11 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_1) / var_102_11

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_1 + var_102_11 and arg_99_1.time_ < var_102_1 + var_102_11 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play104102029 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 104102029
		arg_103_1.duration_ = 4.866

		local var_103_0 = {
			ja = 3.466,
			ko = 4.333,
			zh = 4.866,
			en = 4.733
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
				arg_103_0:Play104102030(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_106_1 = 0
			local var_106_2 = 0.475

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_3 = arg_103_1:FormatText(StoryNameCfg[61].name)

				arg_103_1.leftNameTxt_.text = var_106_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_4 = arg_103_1:GetWordFromCfg(104102029)
				local var_106_5 = arg_103_1:FormatText(var_106_4.content)

				arg_103_1.text_.text = var_106_5

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_6 = 19
				local var_106_7 = utf8.len(var_106_5)
				local var_106_8 = var_106_6 <= 0 and var_106_2 or var_106_2 * (var_106_7 / var_106_6)

				if var_106_8 > 0 and var_106_2 < var_106_8 then
					arg_103_1.talkMaxDuration = var_106_8

					if var_106_8 + var_106_1 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_1
					end
				end

				arg_103_1.text_.text = var_106_5
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102029", "story_v_out_104102.awb") ~= 0 then
					local var_106_9 = manager.audio:GetVoiceLength("story_v_out_104102", "104102029", "story_v_out_104102.awb") / 1000

					if var_106_9 + var_106_1 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_9 + var_106_1
					end

					if var_106_4.prefab_name ~= "" and arg_103_1.actors_[var_106_4.prefab_name] ~= nil then
						local var_106_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_4.prefab_name].transform, "story_v_out_104102", "104102029", "story_v_out_104102.awb")

						arg_103_1:RecordAudio("104102029", var_106_10)
						arg_103_1:RecordAudio("104102029", var_106_10)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_104102", "104102029", "story_v_out_104102.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_104102", "104102029", "story_v_out_104102.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_11 = math.max(var_106_2, arg_103_1.talkMaxDuration)

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_11 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_1) / var_106_11

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_1 + var_106_11 and arg_103_1.time_ < var_106_1 + var_106_11 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play104102030 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 104102030
		arg_107_1.duration_ = 6.533

		local var_107_0 = {
			ja = 6.533,
			ko = 5.1,
			zh = 4.666,
			en = 4.8
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
				arg_107_0:Play104102031(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1032ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1032ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, 100, 0)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1032ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, 100, 0)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = 0
			local var_110_10 = 0.425

			if var_110_9 < arg_107_1.time_ and arg_107_1.time_ <= var_110_9 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_11 = arg_107_1:FormatText(StoryNameCfg[10].name)

				arg_107_1.leftNameTxt_.text = var_110_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_12 = arg_107_1:GetWordFromCfg(104102030)
				local var_110_13 = arg_107_1:FormatText(var_110_12.content)

				arg_107_1.text_.text = var_110_13

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_14 = 17
				local var_110_15 = utf8.len(var_110_13)
				local var_110_16 = var_110_14 <= 0 and var_110_10 or var_110_10 * (var_110_15 / var_110_14)

				if var_110_16 > 0 and var_110_10 < var_110_16 then
					arg_107_1.talkMaxDuration = var_110_16

					if var_110_16 + var_110_9 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_16 + var_110_9
					end
				end

				arg_107_1.text_.text = var_110_13
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102030", "story_v_out_104102.awb") ~= 0 then
					local var_110_17 = manager.audio:GetVoiceLength("story_v_out_104102", "104102030", "story_v_out_104102.awb") / 1000

					if var_110_17 + var_110_9 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_17 + var_110_9
					end

					if var_110_12.prefab_name ~= "" and arg_107_1.actors_[var_110_12.prefab_name] ~= nil then
						local var_110_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_12.prefab_name].transform, "story_v_out_104102", "104102030", "story_v_out_104102.awb")

						arg_107_1:RecordAudio("104102030", var_110_18)
						arg_107_1:RecordAudio("104102030", var_110_18)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_104102", "104102030", "story_v_out_104102.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_104102", "104102030", "story_v_out_104102.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_19 = math.max(var_110_10, arg_107_1.talkMaxDuration)

			if var_110_9 <= arg_107_1.time_ and arg_107_1.time_ < var_110_9 + var_110_19 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_9) / var_110_19

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_9 + var_110_19 and arg_107_1.time_ < var_110_9 + var_110_19 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play104102031 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 104102031
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play104102032(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.15

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[7].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(104102031)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 6
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
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_8 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_8 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_8

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_8 and arg_111_1.time_ < var_114_0 + var_114_8 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play104102032 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 104102032
		arg_115_1.duration_ = 8.866

		local var_115_0 = {
			ja = 8.866,
			ko = 5.766,
			zh = 7.233,
			en = 8.1
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
				arg_115_0:Play104102033(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.8

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[10].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, true)
				arg_115_1.iconController_:SetSelectedState("hero")

				arg_115_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(104102032)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102032", "story_v_out_104102.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_104102", "104102032", "story_v_out_104102.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_104102", "104102032", "story_v_out_104102.awb")

						arg_115_1:RecordAudio("104102032", var_118_9)
						arg_115_1:RecordAudio("104102032", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_104102", "104102032", "story_v_out_104102.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_104102", "104102032", "story_v_out_104102.awb")
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
	Play104102033 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 104102033
		arg_119_1.duration_ = 9.5

		local var_119_0 = {
			ja = 9.5,
			ko = 6.866,
			zh = 5.933,
			en = 7.233
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
				arg_119_0:Play104102034(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.725

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[10].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(104102033)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102033", "story_v_out_104102.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_104102", "104102033", "story_v_out_104102.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_104102", "104102033", "story_v_out_104102.awb")

						arg_119_1:RecordAudio("104102033", var_122_9)
						arg_119_1:RecordAudio("104102033", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_104102", "104102033", "story_v_out_104102.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_104102", "104102033", "story_v_out_104102.awb")
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
	Play104102034 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 104102034
		arg_123_1.duration_ = 4.566

		local var_123_0 = {
			ja = 4.2,
			ko = 3.966,
			zh = 3.533,
			en = 4.566
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
				arg_123_0:Play104102035(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1037ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1037ui_story == nil then
				arg_123_1.var_.characterEffect1037ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.1

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1037ui_story then
					arg_123_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1037ui_story then
				arg_123_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_126_4 = arg_123_1.actors_["1037ui_story"].transform
			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 then
				arg_123_1.var_.moveOldPos1037ui_story = var_126_4.localPosition
			end

			local var_126_6 = 0.001

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_6 then
				local var_126_7 = (arg_123_1.time_ - var_126_5) / var_126_6
				local var_126_8 = Vector3.New(0, -1.09, -5.81)

				var_126_4.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1037ui_story, var_126_8, var_126_7)

				local var_126_9 = manager.ui.mainCamera.transform.position - var_126_4.position

				var_126_4.forward = Vector3.New(var_126_9.x, var_126_9.y, var_126_9.z)

				local var_126_10 = var_126_4.localEulerAngles

				var_126_10.z = 0
				var_126_10.x = 0
				var_126_4.localEulerAngles = var_126_10
			end

			if arg_123_1.time_ >= var_126_5 + var_126_6 and arg_123_1.time_ < var_126_5 + var_126_6 + arg_126_0 then
				var_126_4.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_126_11 = manager.ui.mainCamera.transform.position - var_126_4.position

				var_126_4.forward = Vector3.New(var_126_11.x, var_126_11.y, var_126_11.z)

				local var_126_12 = var_126_4.localEulerAngles

				var_126_12.z = 0
				var_126_12.x = 0
				var_126_4.localEulerAngles = var_126_12
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_15 = 0
			local var_126_16 = 0.425

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[15].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(104102034)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 16
				local var_126_21 = utf8.len(var_126_19)
				local var_126_22 = var_126_20 <= 0 and var_126_16 or var_126_16 * (var_126_21 / var_126_20)

				if var_126_22 > 0 and var_126_16 < var_126_22 then
					arg_123_1.talkMaxDuration = var_126_22

					if var_126_22 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_22 + var_126_15
					end
				end

				arg_123_1.text_.text = var_126_19
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102034", "story_v_out_104102.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_out_104102", "104102034", "story_v_out_104102.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_out_104102", "104102034", "story_v_out_104102.awb")

						arg_123_1:RecordAudio("104102034", var_126_24)
						arg_123_1:RecordAudio("104102034", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_104102", "104102034", "story_v_out_104102.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_104102", "104102034", "story_v_out_104102.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_25 = math.max(var_126_16, arg_123_1.talkMaxDuration)

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_25 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_15) / var_126_25

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_15 + var_126_25 and arg_123_1.time_ < var_126_15 + var_126_25 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play104102035 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 104102035
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
			arg_127_1.auto_ = false
		end

		function arg_127_1.playNext_(arg_129_0)
			arg_127_1.onStoryFinished_()
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1037ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1037ui_story == nil then
				arg_127_1.var_.characterEffect1037ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.1

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1037ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1037ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1037ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1037ui_story.fillRatio = var_130_5
			end

			local var_130_6 = 0
			local var_130_7 = 0.25

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_8 = arg_127_1:FormatText(StoryNameCfg[7].name)

				arg_127_1.leftNameTxt_.text = var_130_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_9 = arg_127_1:GetWordFromCfg(104102035)
				local var_130_10 = arg_127_1:FormatText(var_130_9.content)

				arg_127_1.text_.text = var_130_10

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_11 = 10
				local var_130_12 = utf8.len(var_130_10)
				local var_130_13 = var_130_11 <= 0 and var_130_7 or var_130_7 * (var_130_12 / var_130_11)

				if var_130_13 > 0 and var_130_7 < var_130_13 then
					arg_127_1.talkMaxDuration = var_130_13

					if var_130_13 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_13 + var_130_6
					end
				end

				arg_127_1.text_.text = var_130_10
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_14 = math.max(var_130_7, arg_127_1.talkMaxDuration)

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_14 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_6) / var_130_14

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_6 + var_130_14 and arg_127_1.time_ < var_130_6 + var_130_14 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play104102014 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 104102014
		arg_131_1.duration_ = 5.133

		local var_131_0 = {
			ja = 4.933,
			ko = 4,
			zh = 5.133,
			en = 4.466
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
				arg_131_0:Play104102015(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1032ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1032ui_story == nil then
				arg_131_1.var_.characterEffect1032ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.1

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1032ui_story then
					arg_131_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1032ui_story then
				arg_131_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_134_4 = 0

			if var_134_4 < arg_131_1.time_ and arg_131_1.time_ <= var_134_4 + arg_134_0 then
				arg_131_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_134_6 = 0
			local var_134_7 = 0.4

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_8 = arg_131_1:FormatText(StoryNameCfg[61].name)

				arg_131_1.leftNameTxt_.text = var_134_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_9 = arg_131_1:GetWordFromCfg(104102014)
				local var_134_10 = arg_131_1:FormatText(var_134_9.content)

				arg_131_1.text_.text = var_134_10

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_11 = 16
				local var_134_12 = utf8.len(var_134_10)
				local var_134_13 = var_134_11 <= 0 and var_134_7 or var_134_7 * (var_134_12 / var_134_11)

				if var_134_13 > 0 and var_134_7 < var_134_13 then
					arg_131_1.talkMaxDuration = var_134_13

					if var_134_13 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_13 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_10
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102014", "story_v_out_104102.awb") ~= 0 then
					local var_134_14 = manager.audio:GetVoiceLength("story_v_out_104102", "104102014", "story_v_out_104102.awb") / 1000

					if var_134_14 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_14 + var_134_6
					end

					if var_134_9.prefab_name ~= "" and arg_131_1.actors_[var_134_9.prefab_name] ~= nil then
						local var_134_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_9.prefab_name].transform, "story_v_out_104102", "104102014", "story_v_out_104102.awb")

						arg_131_1:RecordAudio("104102014", var_134_15)
						arg_131_1:RecordAudio("104102014", var_134_15)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_104102", "104102014", "story_v_out_104102.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_104102", "104102014", "story_v_out_104102.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_16 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_16 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_16

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_16 and arg_131_1.time_ < var_134_6 + var_134_16 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play104102015 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 104102015
		arg_135_1.duration_ = 2.466

		local var_135_0 = {
			ja = 1.999999999999,
			ko = 2.466,
			zh = 2.233,
			en = 1.999999999999
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
				arg_135_0:Play104102016(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1037ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1037ui_story == nil then
				arg_135_1.var_.characterEffect1037ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.1

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1037ui_story then
					arg_135_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1037ui_story then
				arg_135_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_138_4 = 0

			if var_138_4 < arg_135_1.time_ and arg_135_1.time_ <= var_138_4 + arg_138_0 then
				arg_135_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action4_1")
			end

			local var_138_5 = arg_135_1.actors_["1032ui_story"]
			local var_138_6 = 0

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect1032ui_story == nil then
				arg_135_1.var_.characterEffect1032ui_story = var_138_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_7 = 0.1

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_7 then
				local var_138_8 = (arg_135_1.time_ - var_138_6) / var_138_7

				if arg_135_1.var_.characterEffect1032ui_story then
					local var_138_9 = Mathf.Lerp(0, 0.5, var_138_8)

					arg_135_1.var_.characterEffect1032ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1032ui_story.fillRatio = var_138_9
				end
			end

			if arg_135_1.time_ >= var_138_6 + var_138_7 and arg_135_1.time_ < var_138_6 + var_138_7 + arg_138_0 and arg_135_1.var_.characterEffect1032ui_story then
				local var_138_10 = 0.5

				arg_135_1.var_.characterEffect1032ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1032ui_story.fillRatio = var_138_10
			end

			local var_138_11 = 0

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_138_12 = 0
			local var_138_13 = 0.175

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[15].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(104102015)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102015", "story_v_out_104102.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_out_104102", "104102015", "story_v_out_104102.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_out_104102", "104102015", "story_v_out_104102.awb")

						arg_135_1:RecordAudio("104102015", var_138_21)
						arg_135_1:RecordAudio("104102015", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_104102", "104102015", "story_v_out_104102.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_104102", "104102015", "story_v_out_104102.awb")
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
	Play104102016 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 104102016
		arg_139_1.duration_ = 6.633

		local var_139_0 = {
			ja = 6.066,
			ko = 5.6,
			zh = 6.633,
			en = 6.5
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
				arg_139_0:Play104102017(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1037ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1037ui_story == nil then
				arg_139_1.var_.characterEffect1037ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.1

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1037ui_story then
					local var_142_4 = Mathf.Lerp(0, 0.5, var_142_3)

					arg_139_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1037ui_story.fillRatio = var_142_4
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1037ui_story then
				local var_142_5 = 0.5

				arg_139_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1037ui_story.fillRatio = var_142_5
			end

			local var_142_6 = arg_139_1.actors_["1032ui_story"]
			local var_142_7 = 0

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 and arg_139_1.var_.characterEffect1032ui_story == nil then
				arg_139_1.var_.characterEffect1032ui_story = var_142_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_8 = 0.1

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_8 then
				local var_142_9 = (arg_139_1.time_ - var_142_7) / var_142_8

				if arg_139_1.var_.characterEffect1032ui_story then
					arg_139_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_7 + var_142_8 and arg_139_1.time_ < var_142_7 + var_142_8 + arg_142_0 and arg_139_1.var_.characterEffect1032ui_story then
				arg_139_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 then
				arg_139_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032action/1032action9_1")
			end

			local var_142_11 = 0

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_142_12 = 0
			local var_142_13 = 0.775

			if var_142_12 < arg_139_1.time_ and arg_139_1.time_ <= var_142_12 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_14 = arg_139_1:FormatText(StoryNameCfg[61].name)

				arg_139_1.leftNameTxt_.text = var_142_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_15 = arg_139_1:GetWordFromCfg(104102016)
				local var_142_16 = arg_139_1:FormatText(var_142_15.content)

				arg_139_1.text_.text = var_142_16

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_17 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102016", "story_v_out_104102.awb") ~= 0 then
					local var_142_20 = manager.audio:GetVoiceLength("story_v_out_104102", "104102016", "story_v_out_104102.awb") / 1000

					if var_142_20 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_20 + var_142_12
					end

					if var_142_15.prefab_name ~= "" and arg_139_1.actors_[var_142_15.prefab_name] ~= nil then
						local var_142_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_15.prefab_name].transform, "story_v_out_104102", "104102016", "story_v_out_104102.awb")

						arg_139_1:RecordAudio("104102016", var_142_21)
						arg_139_1:RecordAudio("104102016", var_142_21)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_104102", "104102016", "story_v_out_104102.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_104102", "104102016", "story_v_out_104102.awb")
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
	Play104102017 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 104102017
		arg_143_1.duration_ = 9.166

		local var_143_0 = {
			ja = 9.166,
			ko = 5.4,
			zh = 8.6,
			en = 7.1
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
				arg_143_0:Play104102018(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_146_1 = 0
			local var_146_2 = 0.775

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_3 = arg_143_1:FormatText(StoryNameCfg[61].name)

				arg_143_1.leftNameTxt_.text = var_146_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_4 = arg_143_1:GetWordFromCfg(104102017)
				local var_146_5 = arg_143_1:FormatText(var_146_4.content)

				arg_143_1.text_.text = var_146_5

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_6 = 30
				local var_146_7 = utf8.len(var_146_5)
				local var_146_8 = var_146_6 <= 0 and var_146_2 or var_146_2 * (var_146_7 / var_146_6)

				if var_146_8 > 0 and var_146_2 < var_146_8 then
					arg_143_1.talkMaxDuration = var_146_8

					if var_146_8 + var_146_1 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_1
					end
				end

				arg_143_1.text_.text = var_146_5
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104102", "104102017", "story_v_out_104102.awb") ~= 0 then
					local var_146_9 = manager.audio:GetVoiceLength("story_v_out_104102", "104102017", "story_v_out_104102.awb") / 1000

					if var_146_9 + var_146_1 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_9 + var_146_1
					end

					if var_146_4.prefab_name ~= "" and arg_143_1.actors_[var_146_4.prefab_name] ~= nil then
						local var_146_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_4.prefab_name].transform, "story_v_out_104102", "104102017", "story_v_out_104102.awb")

						arg_143_1:RecordAudio("104102017", var_146_10)
						arg_143_1:RecordAudio("104102017", var_146_10)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_104102", "104102017", "story_v_out_104102.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_104102", "104102017", "story_v_out_104102.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_11 = math.max(var_146_2, arg_143_1.talkMaxDuration)

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_11 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_1) / var_146_11

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_1 + var_146_11 and arg_143_1.time_ < var_146_1 + var_146_11 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13"
	},
	voices = {
		"story_v_out_104102.awb"
	}
}
