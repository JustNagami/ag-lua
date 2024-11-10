return {
	Play222031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 222031001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play222031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST31a"

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
				local var_4_5 = arg_1_1.bgs_.ST31a

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
					if iter_4_0 ~= "ST31a" then
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
			local var_4_23 = 0.4

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.566666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.85

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

				local var_4_33 = arg_1_1:GetWordFromCfg(222031001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 34
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
	Play222031002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 222031002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play222031003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.375

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

				local var_10_2 = arg_7_1:GetWordFromCfg(222031002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 55
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
	Play222031003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 222031003
		arg_11_1.duration_ = 13.8

		local var_11_0 = {
			ja = 13.8,
			ko = 11.866,
			zh = 11.833
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
				arg_11_0:Play222031004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1074ui_story"

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

			local var_14_4 = arg_11_1.actors_["1074ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1074ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -1.055, -6.12)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1074ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1074ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1074ui_story == nil then
				arg_11_1.var_.characterEffect1074ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1074ui_story then
					arg_11_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1074ui_story then
				arg_11_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_14_19 = 0
			local var_14_20 = 1.25

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[410].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(222031003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031003", "story_v_out_222031.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_222031", "222031003", "story_v_out_222031.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_222031", "222031003", "story_v_out_222031.awb")

						arg_11_1:RecordAudio("222031003", var_14_28)
						arg_11_1:RecordAudio("222031003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_222031", "222031003", "story_v_out_222031.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_222031", "222031003", "story_v_out_222031.awb")
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
	Play222031004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 222031004
		arg_15_1.duration_ = 17.3

		local var_15_0 = {
			ja = 17.3,
			ko = 10.733,
			zh = 10.7
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
				arg_15_0:Play222031005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.15

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[410].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(222031004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031004", "story_v_out_222031.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031004", "story_v_out_222031.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_222031", "222031004", "story_v_out_222031.awb")

						arg_15_1:RecordAudio("222031004", var_18_9)
						arg_15_1:RecordAudio("222031004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_222031", "222031004", "story_v_out_222031.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_222031", "222031004", "story_v_out_222031.awb")
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
	Play222031005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 222031005
		arg_19_1.duration_ = 4.033

		local var_19_0 = {
			ja = 4.033,
			ko = 2.3,
			zh = 2.2
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
				arg_19_0:Play222031006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_22_1 = 0
			local var_22_2 = 0.225

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_3 = arg_19_1:FormatText(StoryNameCfg[410].name)

				arg_19_1.leftNameTxt_.text = var_22_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_4 = arg_19_1:GetWordFromCfg(222031005)
				local var_22_5 = arg_19_1:FormatText(var_22_4.content)

				arg_19_1.text_.text = var_22_5

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_6 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031005", "story_v_out_222031.awb") ~= 0 then
					local var_22_9 = manager.audio:GetVoiceLength("story_v_out_222031", "222031005", "story_v_out_222031.awb") / 1000

					if var_22_9 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_1
					end

					if var_22_4.prefab_name ~= "" and arg_19_1.actors_[var_22_4.prefab_name] ~= nil then
						local var_22_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_4.prefab_name].transform, "story_v_out_222031", "222031005", "story_v_out_222031.awb")

						arg_19_1:RecordAudio("222031005", var_22_10)
						arg_19_1:RecordAudio("222031005", var_22_10)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_222031", "222031005", "story_v_out_222031.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_222031", "222031005", "story_v_out_222031.awb")
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
	Play222031006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 222031006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play222031007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1074ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1074ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1074ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, 100, 0)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1074ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1074ui_story == nil then
				arg_23_1.var_.characterEffect1074ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1074ui_story then
					local var_26_13 = Mathf.Lerp(0, 0.5, var_26_12)

					arg_23_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1074ui_story.fillRatio = var_26_13
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1074ui_story then
				local var_26_14 = 0.5

				arg_23_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1074ui_story.fillRatio = var_26_14
			end

			local var_26_15 = 0
			local var_26_16 = 0.625

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_17 = arg_23_1:GetWordFromCfg(222031006)
				local var_26_18 = arg_23_1:FormatText(var_26_17.content)

				arg_23_1.text_.text = var_26_18

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_19 = 25
				local var_26_20 = utf8.len(var_26_18)
				local var_26_21 = var_26_19 <= 0 and var_26_16 or var_26_16 * (var_26_20 / var_26_19)

				if var_26_21 > 0 and var_26_16 < var_26_21 then
					arg_23_1.talkMaxDuration = var_26_21

					if var_26_21 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_15
					end
				end

				arg_23_1.text_.text = var_26_18
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_16, arg_23_1.talkMaxDuration)

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_15) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_15 + var_26_22 and arg_23_1.time_ < var_26_15 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play222031007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 222031007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play222031008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.3

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

				local var_30_2 = arg_27_1:GetWordFromCfg(222031007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 52
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
	Play222031008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 222031008
		arg_31_1.duration_ = 5.2

		local var_31_0 = {
			ja = 5.2,
			ko = 4.333,
			zh = 4.433
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
				arg_31_0:Play222031009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1074ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1074ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, -1.055, -6.12)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1074ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1074ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1074ui_story == nil then
				arg_31_1.var_.characterEffect1074ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.200000002980232

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1074ui_story then
					arg_31_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1074ui_story then
				arg_31_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_15 = 0
			local var_34_16 = 0.375

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[410].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(222031008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031008", "story_v_out_222031.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031008", "story_v_out_222031.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_out_222031", "222031008", "story_v_out_222031.awb")

						arg_31_1:RecordAudio("222031008", var_34_24)
						arg_31_1:RecordAudio("222031008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_222031", "222031008", "story_v_out_222031.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_222031", "222031008", "story_v_out_222031.awb")
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
	Play222031009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 222031009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play222031010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1074ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1074ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, 100, 0)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1074ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, 100, 0)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1074ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1074ui_story == nil then
				arg_35_1.var_.characterEffect1074ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1074ui_story then
					local var_38_13 = Mathf.Lerp(0, 0.5, var_38_12)

					arg_35_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1074ui_story.fillRatio = var_38_13
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1074ui_story then
				local var_38_14 = 0.5

				arg_35_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1074ui_story.fillRatio = var_38_14
			end

			local var_38_15 = 0
			local var_38_16 = 1.225

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_17 = arg_35_1:GetWordFromCfg(222031009)
				local var_38_18 = arg_35_1:FormatText(var_38_17.content)

				arg_35_1.text_.text = var_38_18

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_19 = 49
				local var_38_20 = utf8.len(var_38_18)
				local var_38_21 = var_38_19 <= 0 and var_38_16 or var_38_16 * (var_38_20 / var_38_19)

				if var_38_21 > 0 and var_38_16 < var_38_21 then
					arg_35_1.talkMaxDuration = var_38_21

					if var_38_21 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_21 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_18
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_22 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_22 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_22

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_22 and arg_35_1.time_ < var_38_15 + var_38_22 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play222031010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 222031010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play222031011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1.65

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_2 = arg_39_1:GetWordFromCfg(222031010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 66
				local var_42_5 = utf8.len(var_42_3)
				local var_42_6 = var_42_4 <= 0 and var_42_1 or var_42_1 * (var_42_5 / var_42_4)

				if var_42_6 > 0 and var_42_1 < var_42_6 then
					arg_39_1.talkMaxDuration = var_42_6

					if var_42_6 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_6 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_3
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_7 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_7 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_7

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_7 and arg_39_1.time_ < var_42_0 + var_42_7 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play222031011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 222031011
		arg_43_1.duration_ = 5.6

		local var_43_0 = {
			ja = 5,
			ko = 5.6,
			zh = 5.6
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
				arg_43_0:Play222031012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.375

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[462].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(222031011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 15
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031011", "story_v_out_222031.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031011", "story_v_out_222031.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_222031", "222031011", "story_v_out_222031.awb")

						arg_43_1:RecordAudio("222031011", var_46_9)
						arg_43_1:RecordAudio("222031011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_222031", "222031011", "story_v_out_222031.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_222031", "222031011", "story_v_out_222031.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_10 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_10 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_10

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_10 and arg_43_1.time_ < var_46_0 + var_46_10 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play222031012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 222031012
		arg_47_1.duration_ = 7.833

		local var_47_0 = {
			ja = 7.833,
			ko = 5.366,
			zh = 5.3
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
				arg_47_0:Play222031013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1074ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1074ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, -1.055, -6.12)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1074ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1074ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1074ui_story == nil then
				arg_47_1.var_.characterEffect1074ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1074ui_story then
					arg_47_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1074ui_story then
				arg_47_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_50_15 = 0
			local var_50_16 = 0.425

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[410].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(222031012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031012", "story_v_out_222031.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031012", "story_v_out_222031.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_222031", "222031012", "story_v_out_222031.awb")

						arg_47_1:RecordAudio("222031012", var_50_24)
						arg_47_1:RecordAudio("222031012", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_222031", "222031012", "story_v_out_222031.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_222031", "222031012", "story_v_out_222031.awb")
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
	Play222031013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 222031013
		arg_51_1.duration_ = 8.8

		local var_51_0 = {
			ja = 8.8,
			ko = 7.2,
			zh = 7.233
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
				arg_51_0:Play222031014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1074ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1074ui_story == nil then
				arg_51_1.var_.characterEffect1074ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1074ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1074ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1074ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1074ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.575

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[462].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(222031013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031013", "story_v_out_222031.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031013", "story_v_out_222031.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_222031", "222031013", "story_v_out_222031.awb")

						arg_51_1:RecordAudio("222031013", var_54_15)
						arg_51_1:RecordAudio("222031013", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_222031", "222031013", "story_v_out_222031.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_222031", "222031013", "story_v_out_222031.awb")
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
	Play222031014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 222031014
		arg_55_1.duration_ = 6

		local var_55_0 = {
			ja = 6,
			ko = 4.833,
			zh = 4.9
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
				arg_55_0:Play222031015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.375

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[462].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(222031014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 15
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031014", "story_v_out_222031.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031014", "story_v_out_222031.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_222031", "222031014", "story_v_out_222031.awb")

						arg_55_1:RecordAudio("222031014", var_58_9)
						arg_55_1:RecordAudio("222031014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_222031", "222031014", "story_v_out_222031.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_222031", "222031014", "story_v_out_222031.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play222031015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 222031015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play222031016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.1

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_2 = arg_59_1:GetWordFromCfg(222031015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 44
				local var_62_5 = utf8.len(var_62_3)
				local var_62_6 = var_62_4 <= 0 and var_62_1 or var_62_1 * (var_62_5 / var_62_4)

				if var_62_6 > 0 and var_62_1 < var_62_6 then
					arg_59_1.talkMaxDuration = var_62_6

					if var_62_6 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_6 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_3
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_7 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_7 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_7

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_7 and arg_59_1.time_ < var_62_0 + var_62_7 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play222031016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 222031016
		arg_63_1.duration_ = 4.966

		local var_63_0 = {
			ja = 4.966,
			ko = 4.9,
			zh = 4.9
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
				arg_63_0:Play222031017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1074ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1074ui_story == nil then
				arg_63_1.var_.characterEffect1074ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1074ui_story then
					arg_63_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1074ui_story then
				arg_63_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_66_4 = 0

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_6 = 0
			local var_66_7 = 0.475

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[410].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(222031016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031016", "story_v_out_222031.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031016", "story_v_out_222031.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_222031", "222031016", "story_v_out_222031.awb")

						arg_63_1:RecordAudio("222031016", var_66_15)
						arg_63_1:RecordAudio("222031016", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_222031", "222031016", "story_v_out_222031.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_222031", "222031016", "story_v_out_222031.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_16 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_16 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_16

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_16 and arg_63_1.time_ < var_66_6 + var_66_16 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play222031017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 222031017
		arg_67_1.duration_ = 12.966

		local var_67_0 = {
			ja = 12.966,
			ko = 12.633,
			zh = 12.766
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
				arg_67_0:Play222031018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1.075

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[410].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(222031017)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 43
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031017", "story_v_out_222031.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031017", "story_v_out_222031.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_222031", "222031017", "story_v_out_222031.awb")

						arg_67_1:RecordAudio("222031017", var_70_9)
						arg_67_1:RecordAudio("222031017", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_222031", "222031017", "story_v_out_222031.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_222031", "222031017", "story_v_out_222031.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play222031018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 222031018
		arg_71_1.duration_ = 3.033

		local var_71_0 = {
			ja = 3.033,
			ko = 2.9,
			zh = 2.9
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
				arg_71_0:Play222031019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1074ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1074ui_story == nil then
				arg_71_1.var_.characterEffect1074ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1074ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1074ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1074ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1074ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.225

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_8 = arg_71_1:FormatText(StoryNameCfg[462].name)

				arg_71_1.leftNameTxt_.text = var_74_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_9 = arg_71_1:GetWordFromCfg(222031018)
				local var_74_10 = arg_71_1:FormatText(var_74_9.content)

				arg_71_1.text_.text = var_74_10

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_11 = 9
				local var_74_12 = utf8.len(var_74_10)
				local var_74_13 = var_74_11 <= 0 and var_74_7 or var_74_7 * (var_74_12 / var_74_11)

				if var_74_13 > 0 and var_74_7 < var_74_13 then
					arg_71_1.talkMaxDuration = var_74_13

					if var_74_13 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_13 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_10
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031018", "story_v_out_222031.awb") ~= 0 then
					local var_74_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031018", "story_v_out_222031.awb") / 1000

					if var_74_14 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_14 + var_74_6
					end

					if var_74_9.prefab_name ~= "" and arg_71_1.actors_[var_74_9.prefab_name] ~= nil then
						local var_74_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_9.prefab_name].transform, "story_v_out_222031", "222031018", "story_v_out_222031.awb")

						arg_71_1:RecordAudio("222031018", var_74_15)
						arg_71_1:RecordAudio("222031018", var_74_15)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_222031", "222031018", "story_v_out_222031.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_222031", "222031018", "story_v_out_222031.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_16 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_16 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_16

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_16 and arg_71_1.time_ < var_74_6 + var_74_16 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play222031019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 222031019
		arg_75_1.duration_ = 12.4

		local var_75_0 = {
			ja = 10.8,
			ko = 12.366,
			zh = 12.4
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
				arg_75_0:Play222031020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.05

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[462].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(222031019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031019", "story_v_out_222031.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031019", "story_v_out_222031.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_222031", "222031019", "story_v_out_222031.awb")

						arg_75_1:RecordAudio("222031019", var_78_9)
						arg_75_1:RecordAudio("222031019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_222031", "222031019", "story_v_out_222031.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_222031", "222031019", "story_v_out_222031.awb")
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
	Play222031020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 222031020
		arg_79_1.duration_ = 12.9

		local var_79_0 = {
			ja = 12.9,
			ko = 8.033,
			zh = 8.033
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
				arg_79_0:Play222031021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.675

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[462].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(222031020)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 27
				local var_82_6 = utf8.len(var_82_4)
				local var_82_7 = var_82_5 <= 0 and var_82_1 or var_82_1 * (var_82_6 / var_82_5)

				if var_82_7 > 0 and var_82_1 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_4
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031020", "story_v_out_222031.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031020", "story_v_out_222031.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_222031", "222031020", "story_v_out_222031.awb")

						arg_79_1:RecordAudio("222031020", var_82_9)
						arg_79_1:RecordAudio("222031020", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_222031", "222031020", "story_v_out_222031.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_222031", "222031020", "story_v_out_222031.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_10 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_10 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_10

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_10 and arg_79_1.time_ < var_82_0 + var_82_10 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play222031021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 222031021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play222031022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1074ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1074ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, 100, 0)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1074ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, 100, 0)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1074ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1074ui_story == nil then
				arg_83_1.var_.characterEffect1074ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1074ui_story then
					local var_86_13 = Mathf.Lerp(0, 0.5, var_86_12)

					arg_83_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1074ui_story.fillRatio = var_86_13
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1074ui_story then
				local var_86_14 = 0.5

				arg_83_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1074ui_story.fillRatio = var_86_14
			end

			local var_86_15 = 0
			local var_86_16 = 0.675

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_17 = arg_83_1:GetWordFromCfg(222031021)
				local var_86_18 = arg_83_1:FormatText(var_86_17.content)

				arg_83_1.text_.text = var_86_18

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_19 = 27
				local var_86_20 = utf8.len(var_86_18)
				local var_86_21 = var_86_19 <= 0 and var_86_16 or var_86_16 * (var_86_20 / var_86_19)

				if var_86_21 > 0 and var_86_16 < var_86_21 then
					arg_83_1.talkMaxDuration = var_86_21

					if var_86_21 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_18
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_22 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_22 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_22

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_22 and arg_83_1.time_ < var_86_15 + var_86_22 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play222031022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 222031022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play222031023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.975

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_2 = arg_87_1:GetWordFromCfg(222031022)
				local var_90_3 = arg_87_1:FormatText(var_90_2.content)

				arg_87_1.text_.text = var_90_3

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_4 = 39
				local var_90_5 = utf8.len(var_90_3)
				local var_90_6 = var_90_4 <= 0 and var_90_1 or var_90_1 * (var_90_5 / var_90_4)

				if var_90_6 > 0 and var_90_1 < var_90_6 then
					arg_87_1.talkMaxDuration = var_90_6

					if var_90_6 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_6 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_3
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_7 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_7 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_7

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_7 and arg_87_1.time_ < var_90_0 + var_90_7 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play222031023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 222031023
		arg_91_1.duration_ = 19.5

		local var_91_0 = {
			ja = 19.5,
			ko = 12.666,
			zh = 12.7
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
				arg_91_0:Play222031024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.975

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[462].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(222031023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 39
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031023", "story_v_out_222031.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031023", "story_v_out_222031.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_222031", "222031023", "story_v_out_222031.awb")

						arg_91_1:RecordAudio("222031023", var_94_9)
						arg_91_1:RecordAudio("222031023", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_222031", "222031023", "story_v_out_222031.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_222031", "222031023", "story_v_out_222031.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play222031024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 222031024
		arg_95_1.duration_ = 16.233

		local var_95_0 = {
			ja = 16.233,
			ko = 4.833,
			zh = 4.833
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
				arg_95_0:Play222031025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.4

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[462].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(222031024)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 16
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031024", "story_v_out_222031.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031024", "story_v_out_222031.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_222031", "222031024", "story_v_out_222031.awb")

						arg_95_1:RecordAudio("222031024", var_98_9)
						arg_95_1:RecordAudio("222031024", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_222031", "222031024", "story_v_out_222031.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_222031", "222031024", "story_v_out_222031.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play222031025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 222031025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play222031026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.7

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_2 = arg_99_1:GetWordFromCfg(222031025)
				local var_102_3 = arg_99_1:FormatText(var_102_2.content)

				arg_99_1.text_.text = var_102_3

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_4 = 28
				local var_102_5 = utf8.len(var_102_3)
				local var_102_6 = var_102_4 <= 0 and var_102_1 or var_102_1 * (var_102_5 / var_102_4)

				if var_102_6 > 0 and var_102_1 < var_102_6 then
					arg_99_1.talkMaxDuration = var_102_6

					if var_102_6 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_6 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_3
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_7 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_7 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_7

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_7 and arg_99_1.time_ < var_102_0 + var_102_7 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play222031026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 222031026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play222031027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 1.2

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_2 = arg_103_1:GetWordFromCfg(222031026)
				local var_106_3 = arg_103_1:FormatText(var_106_2.content)

				arg_103_1.text_.text = var_106_3

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_4 = 48
				local var_106_5 = utf8.len(var_106_3)
				local var_106_6 = var_106_4 <= 0 and var_106_1 or var_106_1 * (var_106_5 / var_106_4)

				if var_106_6 > 0 and var_106_1 < var_106_6 then
					arg_103_1.talkMaxDuration = var_106_6

					if var_106_6 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_6 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_3
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_7 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_7 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_7

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_7 and arg_103_1.time_ < var_106_0 + var_106_7 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play222031027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 222031027
		arg_107_1.duration_ = 4.533

		local var_107_0 = {
			ja = 4.533,
			ko = 3.8,
			zh = 3.8
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
				arg_107_0:Play222031028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1074ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1074ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, -1.055, -6.12)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1074ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1074ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1074ui_story == nil then
				arg_107_1.var_.characterEffect1074ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1074ui_story then
					arg_107_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1074ui_story then
				arg_107_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_110_15 = 0
			local var_110_16 = 0.4

			if var_110_15 < arg_107_1.time_ and arg_107_1.time_ <= var_110_15 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_17 = arg_107_1:FormatText(StoryNameCfg[410].name)

				arg_107_1.leftNameTxt_.text = var_110_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_18 = arg_107_1:GetWordFromCfg(222031027)
				local var_110_19 = arg_107_1:FormatText(var_110_18.content)

				arg_107_1.text_.text = var_110_19

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_20 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031027", "story_v_out_222031.awb") ~= 0 then
					local var_110_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031027", "story_v_out_222031.awb") / 1000

					if var_110_23 + var_110_15 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_23 + var_110_15
					end

					if var_110_18.prefab_name ~= "" and arg_107_1.actors_[var_110_18.prefab_name] ~= nil then
						local var_110_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_18.prefab_name].transform, "story_v_out_222031", "222031027", "story_v_out_222031.awb")

						arg_107_1:RecordAudio("222031027", var_110_24)
						arg_107_1:RecordAudio("222031027", var_110_24)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_222031", "222031027", "story_v_out_222031.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_222031", "222031027", "story_v_out_222031.awb")
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
	Play222031028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 222031028
		arg_111_1.duration_ = 16.1330000029802

		local var_111_0 = {
			ja = 16.1330000029802,
			ko = 9.23300000298023,
			zh = 9.23300000298023
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
				arg_111_0:Play222031029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = "ST39a"

			if arg_111_1.bgs_[var_114_0] == nil then
				local var_114_1 = Object.Instantiate(arg_111_1.paintGo_)

				var_114_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_114_0)
				var_114_1.name = var_114_0
				var_114_1.transform.parent = arg_111_1.stage_.transform
				var_114_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.bgs_[var_114_0] = var_114_1
			end

			local var_114_2 = 2.00000000298023

			if var_114_2 < arg_111_1.time_ and arg_111_1.time_ <= var_114_2 + arg_114_0 then
				local var_114_3 = manager.ui.mainCamera.transform.localPosition
				local var_114_4 = Vector3.New(0, 0, 10) + Vector3.New(var_114_3.x, var_114_3.y, 0)
				local var_114_5 = arg_111_1.bgs_.ST39a

				var_114_5.transform.localPosition = var_114_4
				var_114_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_114_6 = var_114_5:GetComponent("SpriteRenderer")

				if var_114_6 and var_114_6.sprite then
					local var_114_7 = (var_114_5.transform.localPosition - var_114_3).z
					local var_114_8 = manager.ui.mainCameraCom_
					local var_114_9 = 2 * var_114_7 * Mathf.Tan(var_114_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_114_10 = var_114_9 * var_114_8.aspect
					local var_114_11 = var_114_6.sprite.bounds.size.x
					local var_114_12 = var_114_6.sprite.bounds.size.y
					local var_114_13 = var_114_10 / var_114_11
					local var_114_14 = var_114_9 / var_114_12
					local var_114_15 = var_114_14 < var_114_13 and var_114_13 or var_114_14

					var_114_5.transform.localScale = Vector3.New(var_114_15, var_114_15, 0)
				end

				for iter_114_0, iter_114_1 in pairs(arg_111_1.bgs_) do
					if iter_114_0 ~= "ST39a" then
						iter_114_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_17 = 2

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17
				local var_114_19 = Color.New(0, 0, 0)

				var_114_19.a = Mathf.Lerp(0, 1, var_114_18)
				arg_111_1.mask_.color = var_114_19
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 then
				local var_114_20 = Color.New(0, 0, 0)

				var_114_20.a = 1
				arg_111_1.mask_.color = var_114_20
			end

			local var_114_21 = 2.00000000298023

			if var_114_21 < arg_111_1.time_ and arg_111_1.time_ <= var_114_21 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_22 = 2

			if var_114_21 <= arg_111_1.time_ and arg_111_1.time_ < var_114_21 + var_114_22 then
				local var_114_23 = (arg_111_1.time_ - var_114_21) / var_114_22
				local var_114_24 = Color.New(0, 0, 0)

				var_114_24.a = Mathf.Lerp(1, 0, var_114_23)
				arg_111_1.mask_.color = var_114_24
			end

			if arg_111_1.time_ >= var_114_21 + var_114_22 and arg_111_1.time_ < var_114_21 + var_114_22 + arg_114_0 then
				local var_114_25 = Color.New(0, 0, 0)
				local var_114_26 = 0

				arg_111_1.mask_.enabled = false
				var_114_25.a = var_114_26
				arg_111_1.mask_.color = var_114_25
			end

			local var_114_27 = arg_111_1.actors_["1074ui_story"].transform
			local var_114_28 = 1.96599999815226

			if var_114_28 < arg_111_1.time_ and arg_111_1.time_ <= var_114_28 + arg_114_0 then
				arg_111_1.var_.moveOldPos1074ui_story = var_114_27.localPosition
			end

			local var_114_29 = 0.001

			if var_114_28 <= arg_111_1.time_ and arg_111_1.time_ < var_114_28 + var_114_29 then
				local var_114_30 = (arg_111_1.time_ - var_114_28) / var_114_29
				local var_114_31 = Vector3.New(0, 100, 0)

				var_114_27.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1074ui_story, var_114_31, var_114_30)

				local var_114_32 = manager.ui.mainCamera.transform.position - var_114_27.position

				var_114_27.forward = Vector3.New(var_114_32.x, var_114_32.y, var_114_32.z)

				local var_114_33 = var_114_27.localEulerAngles

				var_114_33.z = 0
				var_114_33.x = 0
				var_114_27.localEulerAngles = var_114_33
			end

			if arg_111_1.time_ >= var_114_28 + var_114_29 and arg_111_1.time_ < var_114_28 + var_114_29 + arg_114_0 then
				var_114_27.localPosition = Vector3.New(0, 100, 0)

				local var_114_34 = manager.ui.mainCamera.transform.position - var_114_27.position

				var_114_27.forward = Vector3.New(var_114_34.x, var_114_34.y, var_114_34.z)

				local var_114_35 = var_114_27.localEulerAngles

				var_114_35.z = 0
				var_114_35.x = 0
				var_114_27.localEulerAngles = var_114_35
			end

			local var_114_36 = arg_111_1.actors_["1074ui_story"]
			local var_114_37 = 1.96599999815226

			if var_114_37 < arg_111_1.time_ and arg_111_1.time_ <= var_114_37 + arg_114_0 and arg_111_1.var_.characterEffect1074ui_story == nil then
				arg_111_1.var_.characterEffect1074ui_story = var_114_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_38 = 0.034000001847744

			if var_114_37 <= arg_111_1.time_ and arg_111_1.time_ < var_114_37 + var_114_38 then
				local var_114_39 = (arg_111_1.time_ - var_114_37) / var_114_38

				if arg_111_1.var_.characterEffect1074ui_story then
					local var_114_40 = Mathf.Lerp(0, 0.5, var_114_39)

					arg_111_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1074ui_story.fillRatio = var_114_40
				end
			end

			if arg_111_1.time_ >= var_114_37 + var_114_38 and arg_111_1.time_ < var_114_37 + var_114_38 + arg_114_0 and arg_111_1.var_.characterEffect1074ui_story then
				local var_114_41 = 0.5

				arg_111_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1074ui_story.fillRatio = var_114_41
			end

			local var_114_42 = "1070ui_story"

			if arg_111_1.actors_[var_114_42] == nil then
				local var_114_43 = Object.Instantiate(Asset.Load("Char/" .. var_114_42), arg_111_1.stage_.transform)

				var_114_43.name = var_114_42
				var_114_43.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.actors_[var_114_42] = var_114_43

				local var_114_44 = var_114_43:GetComponentInChildren(typeof(CharacterEffect))

				var_114_44.enabled = true

				local var_114_45 = GameObjectTools.GetOrAddComponent(var_114_43, typeof(DynamicBoneHelper))

				if var_114_45 then
					var_114_45:EnableDynamicBone(false)
				end

				arg_111_1:ShowWeapon(var_114_44.transform, false)

				arg_111_1.var_[var_114_42 .. "Animator"] = var_114_44.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_111_1.var_[var_114_42 .. "Animator"].applyRootMotion = true
				arg_111_1.var_[var_114_42 .. "LipSync"] = var_114_44.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_114_46 = arg_111_1.actors_["1070ui_story"].transform
			local var_114_47 = 3.8

			if var_114_47 < arg_111_1.time_ and arg_111_1.time_ <= var_114_47 + arg_114_0 then
				arg_111_1.var_.moveOldPos1070ui_story = var_114_46.localPosition
			end

			local var_114_48 = 0.001

			if var_114_47 <= arg_111_1.time_ and arg_111_1.time_ < var_114_47 + var_114_48 then
				local var_114_49 = (arg_111_1.time_ - var_114_47) / var_114_48
				local var_114_50 = Vector3.New(0, -0.95, -6.05)

				var_114_46.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1070ui_story, var_114_50, var_114_49)

				local var_114_51 = manager.ui.mainCamera.transform.position - var_114_46.position

				var_114_46.forward = Vector3.New(var_114_51.x, var_114_51.y, var_114_51.z)

				local var_114_52 = var_114_46.localEulerAngles

				var_114_52.z = 0
				var_114_52.x = 0
				var_114_46.localEulerAngles = var_114_52
			end

			if arg_111_1.time_ >= var_114_47 + var_114_48 and arg_111_1.time_ < var_114_47 + var_114_48 + arg_114_0 then
				var_114_46.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_114_53 = manager.ui.mainCamera.transform.position - var_114_46.position

				var_114_46.forward = Vector3.New(var_114_53.x, var_114_53.y, var_114_53.z)

				local var_114_54 = var_114_46.localEulerAngles

				var_114_54.z = 0
				var_114_54.x = 0
				var_114_46.localEulerAngles = var_114_54
			end

			local var_114_55 = arg_111_1.actors_["1070ui_story"]
			local var_114_56 = 3.8

			if var_114_56 < arg_111_1.time_ and arg_111_1.time_ <= var_114_56 + arg_114_0 and arg_111_1.var_.characterEffect1070ui_story == nil then
				arg_111_1.var_.characterEffect1070ui_story = var_114_55:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_57 = 0.200000002980232

			if var_114_56 <= arg_111_1.time_ and arg_111_1.time_ < var_114_56 + var_114_57 then
				local var_114_58 = (arg_111_1.time_ - var_114_56) / var_114_57

				if arg_111_1.var_.characterEffect1070ui_story then
					arg_111_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_56 + var_114_57 and arg_111_1.time_ < var_114_56 + var_114_57 + arg_114_0 and arg_111_1.var_.characterEffect1070ui_story then
				arg_111_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_114_59 = 3.8

			if var_114_59 < arg_111_1.time_ and arg_111_1.time_ <= var_114_59 + arg_114_0 then
				arg_111_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action3_1")
			end

			local var_114_60 = 3.8

			if var_114_60 < arg_111_1.time_ and arg_111_1.time_ <= var_114_60 + arg_114_0 then
				arg_111_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			if arg_111_1.frameCnt_ <= 1 then
				arg_111_1.dialog_:SetActive(false)
			end

			local var_114_61 = 4.00000000298023
			local var_114_62 = 0.6

			if var_114_61 < arg_111_1.time_ and arg_111_1.time_ <= var_114_61 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				arg_111_1.dialog_:SetActive(true)

				local var_114_63 = LeanTween.value(arg_111_1.dialog_, 0, 1, 0.3)

				var_114_63:setOnUpdate(LuaHelper.FloatAction(function(arg_115_0)
					arg_111_1.dialogCg_.alpha = arg_115_0
				end))
				var_114_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_111_1.dialog_)
					var_114_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_111_1.duration_ = arg_111_1.duration_ + 0.3

				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_64 = arg_111_1:FormatText(StoryNameCfg[318].name)

				arg_111_1.leftNameTxt_.text = var_114_64

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_65 = arg_111_1:GetWordFromCfg(222031028)
				local var_114_66 = arg_111_1:FormatText(var_114_65.content)

				arg_111_1.text_.text = var_114_66

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_67 = 24
				local var_114_68 = utf8.len(var_114_66)
				local var_114_69 = var_114_67 <= 0 and var_114_62 or var_114_62 * (var_114_68 / var_114_67)

				if var_114_69 > 0 and var_114_62 < var_114_69 then
					arg_111_1.talkMaxDuration = var_114_69
					var_114_61 = var_114_61 + 0.3

					if var_114_69 + var_114_61 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_69 + var_114_61
					end
				end

				arg_111_1.text_.text = var_114_66
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031028", "story_v_out_222031.awb") ~= 0 then
					local var_114_70 = manager.audio:GetVoiceLength("story_v_out_222031", "222031028", "story_v_out_222031.awb") / 1000

					if var_114_70 + var_114_61 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_70 + var_114_61
					end

					if var_114_65.prefab_name ~= "" and arg_111_1.actors_[var_114_65.prefab_name] ~= nil then
						local var_114_71 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_65.prefab_name].transform, "story_v_out_222031", "222031028", "story_v_out_222031.awb")

						arg_111_1:RecordAudio("222031028", var_114_71)
						arg_111_1:RecordAudio("222031028", var_114_71)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_222031", "222031028", "story_v_out_222031.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_222031", "222031028", "story_v_out_222031.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_72 = var_114_61 + 0.3
			local var_114_73 = math.max(var_114_62, arg_111_1.talkMaxDuration)

			if var_114_72 <= arg_111_1.time_ and arg_111_1.time_ < var_114_72 + var_114_73 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_72) / var_114_73

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_72 + var_114_73 and arg_111_1.time_ < var_114_72 + var_114_73 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play222031029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 222031029
		arg_117_1.duration_ = 16.366

		local var_117_0 = {
			ja = 16.366,
			ko = 5.666,
			zh = 5.7
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
				arg_117_0:Play222031030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1070ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1070ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(-0.7, -0.95, -6.05)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1070ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1070ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect1070ui_story == nil then
				arg_117_1.var_.characterEffect1070ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1070ui_story then
					local var_120_13 = Mathf.Lerp(0, 0.5, var_120_12)

					arg_117_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1070ui_story.fillRatio = var_120_13
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect1070ui_story then
				local var_120_14 = 0.5

				arg_117_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1070ui_story.fillRatio = var_120_14
			end

			local var_120_15 = arg_117_1.actors_["1074ui_story"].transform
			local var_120_16 = 0

			if var_120_16 < arg_117_1.time_ and arg_117_1.time_ <= var_120_16 + arg_120_0 then
				arg_117_1.var_.moveOldPos1074ui_story = var_120_15.localPosition
			end

			local var_120_17 = 0.001

			if var_120_16 <= arg_117_1.time_ and arg_117_1.time_ < var_120_16 + var_120_17 then
				local var_120_18 = (arg_117_1.time_ - var_120_16) / var_120_17
				local var_120_19 = Vector3.New(0.7, -1.055, -6.12)

				var_120_15.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1074ui_story, var_120_19, var_120_18)

				local var_120_20 = manager.ui.mainCamera.transform.position - var_120_15.position

				var_120_15.forward = Vector3.New(var_120_20.x, var_120_20.y, var_120_20.z)

				local var_120_21 = var_120_15.localEulerAngles

				var_120_21.z = 0
				var_120_21.x = 0
				var_120_15.localEulerAngles = var_120_21
			end

			if arg_117_1.time_ >= var_120_16 + var_120_17 and arg_117_1.time_ < var_120_16 + var_120_17 + arg_120_0 then
				var_120_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_120_22 = manager.ui.mainCamera.transform.position - var_120_15.position

				var_120_15.forward = Vector3.New(var_120_22.x, var_120_22.y, var_120_22.z)

				local var_120_23 = var_120_15.localEulerAngles

				var_120_23.z = 0
				var_120_23.x = 0
				var_120_15.localEulerAngles = var_120_23
			end

			local var_120_24 = arg_117_1.actors_["1074ui_story"]
			local var_120_25 = 0

			if var_120_25 < arg_117_1.time_ and arg_117_1.time_ <= var_120_25 + arg_120_0 and arg_117_1.var_.characterEffect1074ui_story == nil then
				arg_117_1.var_.characterEffect1074ui_story = var_120_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_26 = 0.200000002980232

			if var_120_25 <= arg_117_1.time_ and arg_117_1.time_ < var_120_25 + var_120_26 then
				local var_120_27 = (arg_117_1.time_ - var_120_25) / var_120_26

				if arg_117_1.var_.characterEffect1074ui_story then
					arg_117_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_25 + var_120_26 and arg_117_1.time_ < var_120_25 + var_120_26 + arg_120_0 and arg_117_1.var_.characterEffect1074ui_story then
				arg_117_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_120_28 = 0

			if var_120_28 < arg_117_1.time_ and arg_117_1.time_ <= var_120_28 + arg_120_0 then
				arg_117_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_120_29 = 0

			if var_120_29 < arg_117_1.time_ and arg_117_1.time_ <= var_120_29 + arg_120_0 then
				arg_117_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_30 = 0
			local var_120_31 = 0.675

			if var_120_30 < arg_117_1.time_ and arg_117_1.time_ <= var_120_30 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_32 = arg_117_1:FormatText(StoryNameCfg[410].name)

				arg_117_1.leftNameTxt_.text = var_120_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_33 = arg_117_1:GetWordFromCfg(222031029)
				local var_120_34 = arg_117_1:FormatText(var_120_33.content)

				arg_117_1.text_.text = var_120_34

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_35 = 27
				local var_120_36 = utf8.len(var_120_34)
				local var_120_37 = var_120_35 <= 0 and var_120_31 or var_120_31 * (var_120_36 / var_120_35)

				if var_120_37 > 0 and var_120_31 < var_120_37 then
					arg_117_1.talkMaxDuration = var_120_37

					if var_120_37 + var_120_30 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_37 + var_120_30
					end
				end

				arg_117_1.text_.text = var_120_34
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031029", "story_v_out_222031.awb") ~= 0 then
					local var_120_38 = manager.audio:GetVoiceLength("story_v_out_222031", "222031029", "story_v_out_222031.awb") / 1000

					if var_120_38 + var_120_30 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_38 + var_120_30
					end

					if var_120_33.prefab_name ~= "" and arg_117_1.actors_[var_120_33.prefab_name] ~= nil then
						local var_120_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_33.prefab_name].transform, "story_v_out_222031", "222031029", "story_v_out_222031.awb")

						arg_117_1:RecordAudio("222031029", var_120_39)
						arg_117_1:RecordAudio("222031029", var_120_39)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_222031", "222031029", "story_v_out_222031.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_222031", "222031029", "story_v_out_222031.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_40 = math.max(var_120_31, arg_117_1.talkMaxDuration)

			if var_120_30 <= arg_117_1.time_ and arg_117_1.time_ < var_120_30 + var_120_40 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_30) / var_120_40

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_30 + var_120_40 and arg_117_1.time_ < var_120_30 + var_120_40 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play222031030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 222031030
		arg_121_1.duration_ = 11.366

		local var_121_0 = {
			ja = 11.366,
			ko = 7.033,
			zh = 7.066
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
				arg_121_0:Play222031031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1070ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1070ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(-0.7, -0.95, -6.05)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1070ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1070ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1070ui_story == nil then
				arg_121_1.var_.characterEffect1070ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect1070ui_story then
					arg_121_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect1070ui_story then
				arg_121_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070actionlink/1070action436")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_15 = arg_121_1.actors_["1074ui_story"]
			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 and arg_121_1.var_.characterEffect1074ui_story == nil then
				arg_121_1.var_.characterEffect1074ui_story = var_124_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_17 = 0.200000002980232

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17

				if arg_121_1.var_.characterEffect1074ui_story then
					local var_124_19 = Mathf.Lerp(0, 0.5, var_124_18)

					arg_121_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1074ui_story.fillRatio = var_124_19
				end
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 and arg_121_1.var_.characterEffect1074ui_story then
				local var_124_20 = 0.5

				arg_121_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1074ui_story.fillRatio = var_124_20
			end

			local var_124_21 = 0
			local var_124_22 = 0.825

			if var_124_21 < arg_121_1.time_ and arg_121_1.time_ <= var_124_21 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_23 = arg_121_1:FormatText(StoryNameCfg[318].name)

				arg_121_1.leftNameTxt_.text = var_124_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_24 = arg_121_1:GetWordFromCfg(222031030)
				local var_124_25 = arg_121_1:FormatText(var_124_24.content)

				arg_121_1.text_.text = var_124_25

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_26 = 33
				local var_124_27 = utf8.len(var_124_25)
				local var_124_28 = var_124_26 <= 0 and var_124_22 or var_124_22 * (var_124_27 / var_124_26)

				if var_124_28 > 0 and var_124_22 < var_124_28 then
					arg_121_1.talkMaxDuration = var_124_28

					if var_124_28 + var_124_21 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_28 + var_124_21
					end
				end

				arg_121_1.text_.text = var_124_25
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031030", "story_v_out_222031.awb") ~= 0 then
					local var_124_29 = manager.audio:GetVoiceLength("story_v_out_222031", "222031030", "story_v_out_222031.awb") / 1000

					if var_124_29 + var_124_21 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_29 + var_124_21
					end

					if var_124_24.prefab_name ~= "" and arg_121_1.actors_[var_124_24.prefab_name] ~= nil then
						local var_124_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_24.prefab_name].transform, "story_v_out_222031", "222031030", "story_v_out_222031.awb")

						arg_121_1:RecordAudio("222031030", var_124_30)
						arg_121_1:RecordAudio("222031030", var_124_30)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_222031", "222031030", "story_v_out_222031.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_222031", "222031030", "story_v_out_222031.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_31 = math.max(var_124_22, arg_121_1.talkMaxDuration)

			if var_124_21 <= arg_121_1.time_ and arg_121_1.time_ < var_124_21 + var_124_31 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_21) / var_124_31

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_21 + var_124_31 and arg_121_1.time_ < var_124_21 + var_124_31 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play222031031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 222031031
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play222031032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1070ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1070ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(0, 100, 0)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1070ui_story, var_128_4, var_128_3)

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

			local var_128_9 = arg_125_1.actors_["1070ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect1070ui_story == nil then
				arg_125_1.var_.characterEffect1070ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect1070ui_story then
					local var_128_13 = Mathf.Lerp(0, 0.5, var_128_12)

					arg_125_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1070ui_story.fillRatio = var_128_13
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect1070ui_story then
				local var_128_14 = 0.5

				arg_125_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1070ui_story.fillRatio = var_128_14
			end

			local var_128_15 = arg_125_1.actors_["1074ui_story"].transform
			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.var_.moveOldPos1074ui_story = var_128_15.localPosition
			end

			local var_128_17 = 0.001

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17
				local var_128_19 = Vector3.New(0, 100, 0)

				var_128_15.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1074ui_story, var_128_19, var_128_18)

				local var_128_20 = manager.ui.mainCamera.transform.position - var_128_15.position

				var_128_15.forward = Vector3.New(var_128_20.x, var_128_20.y, var_128_20.z)

				local var_128_21 = var_128_15.localEulerAngles

				var_128_21.z = 0
				var_128_21.x = 0
				var_128_15.localEulerAngles = var_128_21
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 then
				var_128_15.localPosition = Vector3.New(0, 100, 0)

				local var_128_22 = manager.ui.mainCamera.transform.position - var_128_15.position

				var_128_15.forward = Vector3.New(var_128_22.x, var_128_22.y, var_128_22.z)

				local var_128_23 = var_128_15.localEulerAngles

				var_128_23.z = 0
				var_128_23.x = 0
				var_128_15.localEulerAngles = var_128_23
			end

			local var_128_24 = arg_125_1.actors_["1074ui_story"]
			local var_128_25 = 0

			if var_128_25 < arg_125_1.time_ and arg_125_1.time_ <= var_128_25 + arg_128_0 and arg_125_1.var_.characterEffect1074ui_story == nil then
				arg_125_1.var_.characterEffect1074ui_story = var_128_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_26 = 0.200000002980232

			if var_128_25 <= arg_125_1.time_ and arg_125_1.time_ < var_128_25 + var_128_26 then
				local var_128_27 = (arg_125_1.time_ - var_128_25) / var_128_26

				if arg_125_1.var_.characterEffect1074ui_story then
					local var_128_28 = Mathf.Lerp(0, 0.5, var_128_27)

					arg_125_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1074ui_story.fillRatio = var_128_28
				end
			end

			if arg_125_1.time_ >= var_128_25 + var_128_26 and arg_125_1.time_ < var_128_25 + var_128_26 + arg_128_0 and arg_125_1.var_.characterEffect1074ui_story then
				local var_128_29 = 0.5

				arg_125_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1074ui_story.fillRatio = var_128_29
			end

			local var_128_30 = 0
			local var_128_31 = 1.325

			if var_128_30 < arg_125_1.time_ and arg_125_1.time_ <= var_128_30 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_32 = arg_125_1:GetWordFromCfg(222031031)
				local var_128_33 = arg_125_1:FormatText(var_128_32.content)

				arg_125_1.text_.text = var_128_33

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_34 = 53
				local var_128_35 = utf8.len(var_128_33)
				local var_128_36 = var_128_34 <= 0 and var_128_31 or var_128_31 * (var_128_35 / var_128_34)

				if var_128_36 > 0 and var_128_31 < var_128_36 then
					arg_125_1.talkMaxDuration = var_128_36

					if var_128_36 + var_128_30 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_36 + var_128_30
					end
				end

				arg_125_1.text_.text = var_128_33
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_37 = math.max(var_128_31, arg_125_1.talkMaxDuration)

			if var_128_30 <= arg_125_1.time_ and arg_125_1.time_ < var_128_30 + var_128_37 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_30) / var_128_37

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_30 + var_128_37 and arg_125_1.time_ < var_128_30 + var_128_37 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play222031032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 222031032
		arg_129_1.duration_ = 4.8

		local var_129_0 = {
			ja = 4.7,
			ko = 4.666,
			zh = 4.8
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
				arg_129_0:Play222031033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1074ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1074ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, -1.055, -6.12)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1074ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1074ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1074ui_story == nil then
				arg_129_1.var_.characterEffect1074ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1074ui_story then
					arg_129_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1074ui_story then
				arg_129_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_15 = 0
			local var_132_16 = 0.4

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_17 = arg_129_1:FormatText(StoryNameCfg[410].name)

				arg_129_1.leftNameTxt_.text = var_132_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_18 = arg_129_1:GetWordFromCfg(222031032)
				local var_132_19 = arg_129_1:FormatText(var_132_18.content)

				arg_129_1.text_.text = var_132_19

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_20 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031032", "story_v_out_222031.awb") ~= 0 then
					local var_132_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031032", "story_v_out_222031.awb") / 1000

					if var_132_23 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_23 + var_132_15
					end

					if var_132_18.prefab_name ~= "" and arg_129_1.actors_[var_132_18.prefab_name] ~= nil then
						local var_132_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_18.prefab_name].transform, "story_v_out_222031", "222031032", "story_v_out_222031.awb")

						arg_129_1:RecordAudio("222031032", var_132_24)
						arg_129_1:RecordAudio("222031032", var_132_24)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_222031", "222031032", "story_v_out_222031.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_222031", "222031032", "story_v_out_222031.awb")
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
	Play222031033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 222031033
		arg_133_1.duration_ = 2.433

		local var_133_0 = {
			ja = 2.433,
			ko = 1.1,
			zh = 1.033
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
				arg_133_0:Play222031034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1074ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1074ui_story == nil then
				arg_133_1.var_.characterEffect1074ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1074ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1074ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1074ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1074ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 0.075

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_8 = arg_133_1:FormatText(StoryNameCfg[461].name)

				arg_133_1.leftNameTxt_.text = var_136_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_9 = arg_133_1:GetWordFromCfg(222031033)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031033", "story_v_out_222031.awb") ~= 0 then
					local var_136_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031033", "story_v_out_222031.awb") / 1000

					if var_136_14 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_14 + var_136_6
					end

					if var_136_9.prefab_name ~= "" and arg_133_1.actors_[var_136_9.prefab_name] ~= nil then
						local var_136_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_9.prefab_name].transform, "story_v_out_222031", "222031033", "story_v_out_222031.awb")

						arg_133_1:RecordAudio("222031033", var_136_15)
						arg_133_1:RecordAudio("222031033", var_136_15)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_222031", "222031033", "story_v_out_222031.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_222031", "222031033", "story_v_out_222031.awb")
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
	Play222031034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 222031034
		arg_137_1.duration_ = 20.8

		local var_137_0 = {
			ja = 20.8,
			ko = 11.033,
			zh = 11.066
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
				arg_137_0:Play222031035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1074ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1074ui_story == nil then
				arg_137_1.var_.characterEffect1074ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1074ui_story then
					arg_137_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1074ui_story then
				arg_137_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_140_4 = 0

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action2_1")
			end

			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_140_6 = 0
			local var_140_7 = 1.425

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[410].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(222031034)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 55
				local var_140_12 = utf8.len(var_140_10)
				local var_140_13 = var_140_11 <= 0 and var_140_7 or var_140_7 * (var_140_12 / var_140_11)

				if var_140_13 > 0 and var_140_7 < var_140_13 then
					arg_137_1.talkMaxDuration = var_140_13

					if var_140_13 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_13 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_10
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031034", "story_v_out_222031.awb") ~= 0 then
					local var_140_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031034", "story_v_out_222031.awb") / 1000

					if var_140_14 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_6
					end

					if var_140_9.prefab_name ~= "" and arg_137_1.actors_[var_140_9.prefab_name] ~= nil then
						local var_140_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_9.prefab_name].transform, "story_v_out_222031", "222031034", "story_v_out_222031.awb")

						arg_137_1:RecordAudio("222031034", var_140_15)
						arg_137_1:RecordAudio("222031034", var_140_15)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_222031", "222031034", "story_v_out_222031.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_222031", "222031034", "story_v_out_222031.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_16 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_16 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_16

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_16 and arg_137_1.time_ < var_140_6 + var_140_16 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play222031035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 222031035
		arg_141_1.duration_ = 12.766

		local var_141_0 = {
			ja = 12.766,
			ko = 6.066,
			zh = 6.066
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
				arg_141_0:Play222031036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.775

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[410].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(222031035)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031035", "story_v_out_222031.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031035", "story_v_out_222031.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_222031", "222031035", "story_v_out_222031.awb")

						arg_141_1:RecordAudio("222031035", var_144_9)
						arg_141_1:RecordAudio("222031035", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_222031", "222031035", "story_v_out_222031.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_222031", "222031035", "story_v_out_222031.awb")
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
	Play222031036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 222031036
		arg_145_1.duration_ = 10.033

		local var_145_0 = {
			ja = 10.033,
			ko = 8.2,
			zh = 8.166
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
				arg_145_0:Play222031037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.025

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[410].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(222031036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031036", "story_v_out_222031.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031036", "story_v_out_222031.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_222031", "222031036", "story_v_out_222031.awb")

						arg_145_1:RecordAudio("222031036", var_148_9)
						arg_145_1:RecordAudio("222031036", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_222031", "222031036", "story_v_out_222031.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_222031", "222031036", "story_v_out_222031.awb")
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
	Play222031037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 222031037
		arg_149_1.duration_ = 1.7

		local var_149_0 = {
			ja = 1.7,
			ko = 1,
			zh = 1
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
				arg_149_0:Play222031038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1074ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1074ui_story == nil then
				arg_149_1.var_.characterEffect1074ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1074ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1074ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1074ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1074ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 0.05

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_8 = arg_149_1:FormatText(StoryNameCfg[461].name)

				arg_149_1.leftNameTxt_.text = var_152_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_9 = arg_149_1:GetWordFromCfg(222031037)
				local var_152_10 = arg_149_1:FormatText(var_152_9.content)

				arg_149_1.text_.text = var_152_10

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_11 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031037", "story_v_out_222031.awb") ~= 0 then
					local var_152_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031037", "story_v_out_222031.awb") / 1000

					if var_152_14 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_14 + var_152_6
					end

					if var_152_9.prefab_name ~= "" and arg_149_1.actors_[var_152_9.prefab_name] ~= nil then
						local var_152_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_9.prefab_name].transform, "story_v_out_222031", "222031037", "story_v_out_222031.awb")

						arg_149_1:RecordAudio("222031037", var_152_15)
						arg_149_1:RecordAudio("222031037", var_152_15)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_222031", "222031037", "story_v_out_222031.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_222031", "222031037", "story_v_out_222031.awb")
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
	Play222031038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 222031038
		arg_153_1.duration_ = 10.566

		local var_153_0 = {
			ja = 10.566,
			ko = 6.1,
			zh = 6.133
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
				arg_153_0:Play222031039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1074ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1074ui_story == nil then
				arg_153_1.var_.characterEffect1074ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1074ui_story then
					arg_153_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1074ui_story then
				arg_153_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_156_4 = 0
			local var_156_5 = 0.575

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_6 = arg_153_1:FormatText(StoryNameCfg[410].name)

				arg_153_1.leftNameTxt_.text = var_156_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_7 = arg_153_1:GetWordFromCfg(222031038)
				local var_156_8 = arg_153_1:FormatText(var_156_7.content)

				arg_153_1.text_.text = var_156_8

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_9 = 23
				local var_156_10 = utf8.len(var_156_8)
				local var_156_11 = var_156_9 <= 0 and var_156_5 or var_156_5 * (var_156_10 / var_156_9)

				if var_156_11 > 0 and var_156_5 < var_156_11 then
					arg_153_1.talkMaxDuration = var_156_11

					if var_156_11 + var_156_4 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_11 + var_156_4
					end
				end

				arg_153_1.text_.text = var_156_8
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031038", "story_v_out_222031.awb") ~= 0 then
					local var_156_12 = manager.audio:GetVoiceLength("story_v_out_222031", "222031038", "story_v_out_222031.awb") / 1000

					if var_156_12 + var_156_4 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_12 + var_156_4
					end

					if var_156_7.prefab_name ~= "" and arg_153_1.actors_[var_156_7.prefab_name] ~= nil then
						local var_156_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_7.prefab_name].transform, "story_v_out_222031", "222031038", "story_v_out_222031.awb")

						arg_153_1:RecordAudio("222031038", var_156_13)
						arg_153_1:RecordAudio("222031038", var_156_13)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_222031", "222031038", "story_v_out_222031.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_222031", "222031038", "story_v_out_222031.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_14 = math.max(var_156_5, arg_153_1.talkMaxDuration)

			if var_156_4 <= arg_153_1.time_ and arg_153_1.time_ < var_156_4 + var_156_14 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_4) / var_156_14

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_4 + var_156_14 and arg_153_1.time_ < var_156_4 + var_156_14 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play222031039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 222031039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play222031040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1074ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1074ui_story == nil then
				arg_157_1.var_.characterEffect1074ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1074ui_story then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1074ui_story.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1074ui_story then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1074ui_story.fillRatio = var_160_5
			end

			local var_160_6 = 0
			local var_160_7 = 0.95

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_8 = arg_157_1:GetWordFromCfg(222031039)
				local var_160_9 = arg_157_1:FormatText(var_160_8.content)

				arg_157_1.text_.text = var_160_9

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_10 = 38
				local var_160_11 = utf8.len(var_160_9)
				local var_160_12 = var_160_10 <= 0 and var_160_7 or var_160_7 * (var_160_11 / var_160_10)

				if var_160_12 > 0 and var_160_7 < var_160_12 then
					arg_157_1.talkMaxDuration = var_160_12

					if var_160_12 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_12 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_9
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_13 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_13 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_13

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_13 and arg_157_1.time_ < var_160_6 + var_160_13 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play222031040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 222031040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play222031041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 1.025

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_2 = arg_161_1:GetWordFromCfg(222031040)
				local var_164_3 = arg_161_1:FormatText(var_164_2.content)

				arg_161_1.text_.text = var_164_3

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_4 = 41
				local var_164_5 = utf8.len(var_164_3)
				local var_164_6 = var_164_4 <= 0 and var_164_1 or var_164_1 * (var_164_5 / var_164_4)

				if var_164_6 > 0 and var_164_1 < var_164_6 then
					arg_161_1.talkMaxDuration = var_164_6

					if var_164_6 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_6 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_3
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_7 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_7 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_7

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_7 and arg_161_1.time_ < var_164_0 + var_164_7 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play222031041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 222031041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play222031042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 1.025

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_2 = arg_165_1:GetWordFromCfg(222031041)
				local var_168_3 = arg_165_1:FormatText(var_168_2.content)

				arg_165_1.text_.text = var_168_3

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_4 = 41
				local var_168_5 = utf8.len(var_168_3)
				local var_168_6 = var_168_4 <= 0 and var_168_1 or var_168_1 * (var_168_5 / var_168_4)

				if var_168_6 > 0 and var_168_1 < var_168_6 then
					arg_165_1.talkMaxDuration = var_168_6

					if var_168_6 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_6 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_3
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_7 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_7 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_7

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_7 and arg_165_1.time_ < var_168_0 + var_168_7 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play222031042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 222031042
		arg_169_1.duration_ = 6.2

		local var_169_0 = {
			ja = 6.2,
			ko = 2.433,
			zh = 2.433
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
				arg_169_0:Play222031043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1074ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect1074ui_story == nil then
				arg_169_1.var_.characterEffect1074ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.200000002980232

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1074ui_story then
					arg_169_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect1074ui_story then
				arg_169_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_172_4 = 0
			local var_172_5 = 0.325

			if var_172_4 < arg_169_1.time_ and arg_169_1.time_ <= var_172_4 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_6 = arg_169_1:FormatText(StoryNameCfg[410].name)

				arg_169_1.leftNameTxt_.text = var_172_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_7 = arg_169_1:GetWordFromCfg(222031042)
				local var_172_8 = arg_169_1:FormatText(var_172_7.content)

				arg_169_1.text_.text = var_172_8

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_9 = 13
				local var_172_10 = utf8.len(var_172_8)
				local var_172_11 = var_172_9 <= 0 and var_172_5 or var_172_5 * (var_172_10 / var_172_9)

				if var_172_11 > 0 and var_172_5 < var_172_11 then
					arg_169_1.talkMaxDuration = var_172_11

					if var_172_11 + var_172_4 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_11 + var_172_4
					end
				end

				arg_169_1.text_.text = var_172_8
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031042", "story_v_out_222031.awb") ~= 0 then
					local var_172_12 = manager.audio:GetVoiceLength("story_v_out_222031", "222031042", "story_v_out_222031.awb") / 1000

					if var_172_12 + var_172_4 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_12 + var_172_4
					end

					if var_172_7.prefab_name ~= "" and arg_169_1.actors_[var_172_7.prefab_name] ~= nil then
						local var_172_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_7.prefab_name].transform, "story_v_out_222031", "222031042", "story_v_out_222031.awb")

						arg_169_1:RecordAudio("222031042", var_172_13)
						arg_169_1:RecordAudio("222031042", var_172_13)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_222031", "222031042", "story_v_out_222031.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_222031", "222031042", "story_v_out_222031.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_14 = math.max(var_172_5, arg_169_1.talkMaxDuration)

			if var_172_4 <= arg_169_1.time_ and arg_169_1.time_ < var_172_4 + var_172_14 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_4) / var_172_14

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_4 + var_172_14 and arg_169_1.time_ < var_172_4 + var_172_14 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play222031043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 222031043
		arg_173_1.duration_ = 2.5

		local var_173_0 = {
			ja = 2.5,
			ko = 1.8,
			zh = 1.866
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
				arg_173_0:Play222031044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1074ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1074ui_story == nil then
				arg_173_1.var_.characterEffect1074ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.200000002980232

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1074ui_story then
					local var_176_4 = Mathf.Lerp(0, 0.5, var_176_3)

					arg_173_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1074ui_story.fillRatio = var_176_4
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1074ui_story then
				local var_176_5 = 0.5

				arg_173_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1074ui_story.fillRatio = var_176_5
			end

			local var_176_6 = 0
			local var_176_7 = 0.1

			if var_176_6 < arg_173_1.time_ and arg_173_1.time_ <= var_176_6 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_8 = arg_173_1:FormatText(StoryNameCfg[461].name)

				arg_173_1.leftNameTxt_.text = var_176_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_9 = arg_173_1:GetWordFromCfg(222031043)
				local var_176_10 = arg_173_1:FormatText(var_176_9.content)

				arg_173_1.text_.text = var_176_10

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_11 = 4
				local var_176_12 = utf8.len(var_176_10)
				local var_176_13 = var_176_11 <= 0 and var_176_7 or var_176_7 * (var_176_12 / var_176_11)

				if var_176_13 > 0 and var_176_7 < var_176_13 then
					arg_173_1.talkMaxDuration = var_176_13

					if var_176_13 + var_176_6 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_13 + var_176_6
					end
				end

				arg_173_1.text_.text = var_176_10
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031043", "story_v_out_222031.awb") ~= 0 then
					local var_176_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031043", "story_v_out_222031.awb") / 1000

					if var_176_14 + var_176_6 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_14 + var_176_6
					end

					if var_176_9.prefab_name ~= "" and arg_173_1.actors_[var_176_9.prefab_name] ~= nil then
						local var_176_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_9.prefab_name].transform, "story_v_out_222031", "222031043", "story_v_out_222031.awb")

						arg_173_1:RecordAudio("222031043", var_176_15)
						arg_173_1:RecordAudio("222031043", var_176_15)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_222031", "222031043", "story_v_out_222031.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_222031", "222031043", "story_v_out_222031.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_16 = math.max(var_176_7, arg_173_1.talkMaxDuration)

			if var_176_6 <= arg_173_1.time_ and arg_173_1.time_ < var_176_6 + var_176_16 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_6) / var_176_16

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_6 + var_176_16 and arg_173_1.time_ < var_176_6 + var_176_16 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play222031044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 222031044
		arg_177_1.duration_ = 12.9

		local var_177_0 = {
			ja = 12.9,
			ko = 5.566,
			zh = 5.566
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
				arg_177_0:Play222031045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.5

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[461].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(222031044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 20
				local var_180_6 = utf8.len(var_180_4)
				local var_180_7 = var_180_5 <= 0 and var_180_1 or var_180_1 * (var_180_6 / var_180_5)

				if var_180_7 > 0 and var_180_1 < var_180_7 then
					arg_177_1.talkMaxDuration = var_180_7

					if var_180_7 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_7 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_4
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031044", "story_v_out_222031.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031044", "story_v_out_222031.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_222031", "222031044", "story_v_out_222031.awb")

						arg_177_1:RecordAudio("222031044", var_180_9)
						arg_177_1:RecordAudio("222031044", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_222031", "222031044", "story_v_out_222031.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_222031", "222031044", "story_v_out_222031.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_10 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_10 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_10

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_10 and arg_177_1.time_ < var_180_0 + var_180_10 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play222031045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 222031045
		arg_181_1.duration_ = 19.1

		local var_181_0 = {
			ja = 19.1,
			ko = 11.1,
			zh = 11.1
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
				arg_181_0:Play222031046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1074ui_story"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1074ui_story = var_184_0.localPosition
			end

			local var_184_2 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2
				local var_184_4 = Vector3.New(0, -1.055, -6.12)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1074ui_story, var_184_4, var_184_3)

				local var_184_5 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_5.x, var_184_5.y, var_184_5.z)

				local var_184_6 = var_184_0.localEulerAngles

				var_184_6.z = 0
				var_184_6.x = 0
				var_184_0.localEulerAngles = var_184_6
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_184_7 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_7.x, var_184_7.y, var_184_7.z)

				local var_184_8 = var_184_0.localEulerAngles

				var_184_8.z = 0
				var_184_8.x = 0
				var_184_0.localEulerAngles = var_184_8
			end

			local var_184_9 = arg_181_1.actors_["1074ui_story"]
			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 and arg_181_1.var_.characterEffect1074ui_story == nil then
				arg_181_1.var_.characterEffect1074ui_story = var_184_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_11 = 0.200000002980232

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_11 then
				local var_184_12 = (arg_181_1.time_ - var_184_10) / var_184_11

				if arg_181_1.var_.characterEffect1074ui_story then
					arg_181_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_10 + var_184_11 and arg_181_1.time_ < var_184_10 + var_184_11 + arg_184_0 and arg_181_1.var_.characterEffect1074ui_story then
				arg_181_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_184_13 = 0

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				arg_181_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074actionlink/1074action425")
			end

			local var_184_14 = 0

			if var_184_14 < arg_181_1.time_ and arg_181_1.time_ <= var_184_14 + arg_184_0 then
				arg_181_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_184_15 = 0
			local var_184_16 = 1.05

			if var_184_15 < arg_181_1.time_ and arg_181_1.time_ <= var_184_15 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_17 = arg_181_1:FormatText(StoryNameCfg[410].name)

				arg_181_1.leftNameTxt_.text = var_184_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_18 = arg_181_1:GetWordFromCfg(222031045)
				local var_184_19 = arg_181_1:FormatText(var_184_18.content)

				arg_181_1.text_.text = var_184_19

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_20 = 42
				local var_184_21 = utf8.len(var_184_19)
				local var_184_22 = var_184_20 <= 0 and var_184_16 or var_184_16 * (var_184_21 / var_184_20)

				if var_184_22 > 0 and var_184_16 < var_184_22 then
					arg_181_1.talkMaxDuration = var_184_22

					if var_184_22 + var_184_15 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_22 + var_184_15
					end
				end

				arg_181_1.text_.text = var_184_19
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031045", "story_v_out_222031.awb") ~= 0 then
					local var_184_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031045", "story_v_out_222031.awb") / 1000

					if var_184_23 + var_184_15 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_23 + var_184_15
					end

					if var_184_18.prefab_name ~= "" and arg_181_1.actors_[var_184_18.prefab_name] ~= nil then
						local var_184_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_18.prefab_name].transform, "story_v_out_222031", "222031045", "story_v_out_222031.awb")

						arg_181_1:RecordAudio("222031045", var_184_24)
						arg_181_1:RecordAudio("222031045", var_184_24)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_222031", "222031045", "story_v_out_222031.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_222031", "222031045", "story_v_out_222031.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_25 = math.max(var_184_16, arg_181_1.talkMaxDuration)

			if var_184_15 <= arg_181_1.time_ and arg_181_1.time_ < var_184_15 + var_184_25 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_15) / var_184_25

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_15 + var_184_25 and arg_181_1.time_ < var_184_15 + var_184_25 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play222031046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 222031046
		arg_185_1.duration_ = 14.9

		local var_185_0 = {
			ja = 14.9,
			ko = 8.9,
			zh = 8.9
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
				arg_185_0:Play222031047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1074ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1074ui_story == nil then
				arg_185_1.var_.characterEffect1074ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1074ui_story then
					local var_188_4 = Mathf.Lerp(0, 0.5, var_188_3)

					arg_185_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1074ui_story.fillRatio = var_188_4
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1074ui_story then
				local var_188_5 = 0.5

				arg_185_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1074ui_story.fillRatio = var_188_5
			end

			local var_188_6 = 0
			local var_188_7 = 0.85

			if var_188_6 < arg_185_1.time_ and arg_185_1.time_ <= var_188_6 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_8 = arg_185_1:FormatText(StoryNameCfg[461].name)

				arg_185_1.leftNameTxt_.text = var_188_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, true)
				arg_185_1.iconController_:SetSelectedState("hero")

				arg_185_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_9 = arg_185_1:GetWordFromCfg(222031046)
				local var_188_10 = arg_185_1:FormatText(var_188_9.content)

				arg_185_1.text_.text = var_188_10

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_11 = 34
				local var_188_12 = utf8.len(var_188_10)
				local var_188_13 = var_188_11 <= 0 and var_188_7 or var_188_7 * (var_188_12 / var_188_11)

				if var_188_13 > 0 and var_188_7 < var_188_13 then
					arg_185_1.talkMaxDuration = var_188_13

					if var_188_13 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_13 + var_188_6
					end
				end

				arg_185_1.text_.text = var_188_10
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031046", "story_v_out_222031.awb") ~= 0 then
					local var_188_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031046", "story_v_out_222031.awb") / 1000

					if var_188_14 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_14 + var_188_6
					end

					if var_188_9.prefab_name ~= "" and arg_185_1.actors_[var_188_9.prefab_name] ~= nil then
						local var_188_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_9.prefab_name].transform, "story_v_out_222031", "222031046", "story_v_out_222031.awb")

						arg_185_1:RecordAudio("222031046", var_188_15)
						arg_185_1:RecordAudio("222031046", var_188_15)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_222031", "222031046", "story_v_out_222031.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_222031", "222031046", "story_v_out_222031.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_16 = math.max(var_188_7, arg_185_1.talkMaxDuration)

			if var_188_6 <= arg_185_1.time_ and arg_185_1.time_ < var_188_6 + var_188_16 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_6) / var_188_16

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_6 + var_188_16 and arg_185_1.time_ < var_188_6 + var_188_16 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play222031047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 222031047
		arg_189_1.duration_ = 22.733

		local var_189_0 = {
			ja = 22.733,
			ko = 13.233,
			zh = 13.233
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
				arg_189_0:Play222031048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 1.25

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[461].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, true)
				arg_189_1.iconController_:SetSelectedState("hero")

				arg_189_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(222031047)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 50
				local var_192_6 = utf8.len(var_192_4)
				local var_192_7 = var_192_5 <= 0 and var_192_1 or var_192_1 * (var_192_6 / var_192_5)

				if var_192_7 > 0 and var_192_1 < var_192_7 then
					arg_189_1.talkMaxDuration = var_192_7

					if var_192_7 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_7 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_4
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031047", "story_v_out_222031.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031047", "story_v_out_222031.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_222031", "222031047", "story_v_out_222031.awb")

						arg_189_1:RecordAudio("222031047", var_192_9)
						arg_189_1:RecordAudio("222031047", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_222031", "222031047", "story_v_out_222031.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_222031", "222031047", "story_v_out_222031.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_10 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_10 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_10

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_10 and arg_189_1.time_ < var_192_0 + var_192_10 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play222031048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 222031048
		arg_193_1.duration_ = 16.333

		local var_193_0 = {
			ja = 16.333,
			ko = 10.333,
			zh = 10.5
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play222031049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.975

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[461].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, true)
				arg_193_1.iconController_:SetSelectedState("hero")

				arg_193_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(222031048)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 39
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031048", "story_v_out_222031.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031048", "story_v_out_222031.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_222031", "222031048", "story_v_out_222031.awb")

						arg_193_1:RecordAudio("222031048", var_196_9)
						arg_193_1:RecordAudio("222031048", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_222031", "222031048", "story_v_out_222031.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_222031", "222031048", "story_v_out_222031.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_10 and arg_193_1.time_ < var_196_0 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play222031049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 222031049
		arg_197_1.duration_ = 9.766

		local var_197_0 = {
			ja = 9.766,
			ko = 4.566,
			zh = 4.6
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
				arg_197_0:Play222031050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1074ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect1074ui_story == nil then
				arg_197_1.var_.characterEffect1074ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1074ui_story then
					arg_197_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect1074ui_story then
				arg_197_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_200_4 = 0
			local var_200_5 = 0.5

			if var_200_4 < arg_197_1.time_ and arg_197_1.time_ <= var_200_4 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_6 = arg_197_1:FormatText(StoryNameCfg[410].name)

				arg_197_1.leftNameTxt_.text = var_200_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_7 = arg_197_1:GetWordFromCfg(222031049)
				local var_200_8 = arg_197_1:FormatText(var_200_7.content)

				arg_197_1.text_.text = var_200_8

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_9 = 20
				local var_200_10 = utf8.len(var_200_8)
				local var_200_11 = var_200_9 <= 0 and var_200_5 or var_200_5 * (var_200_10 / var_200_9)

				if var_200_11 > 0 and var_200_5 < var_200_11 then
					arg_197_1.talkMaxDuration = var_200_11

					if var_200_11 + var_200_4 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_11 + var_200_4
					end
				end

				arg_197_1.text_.text = var_200_8
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031049", "story_v_out_222031.awb") ~= 0 then
					local var_200_12 = manager.audio:GetVoiceLength("story_v_out_222031", "222031049", "story_v_out_222031.awb") / 1000

					if var_200_12 + var_200_4 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_12 + var_200_4
					end

					if var_200_7.prefab_name ~= "" and arg_197_1.actors_[var_200_7.prefab_name] ~= nil then
						local var_200_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_7.prefab_name].transform, "story_v_out_222031", "222031049", "story_v_out_222031.awb")

						arg_197_1:RecordAudio("222031049", var_200_13)
						arg_197_1:RecordAudio("222031049", var_200_13)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_222031", "222031049", "story_v_out_222031.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_222031", "222031049", "story_v_out_222031.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_14 = math.max(var_200_5, arg_197_1.talkMaxDuration)

			if var_200_4 <= arg_197_1.time_ and arg_197_1.time_ < var_200_4 + var_200_14 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_4) / var_200_14

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_4 + var_200_14 and arg_197_1.time_ < var_200_4 + var_200_14 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play222031050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 222031050
		arg_201_1.duration_ = 9.766

		local var_201_0 = {
			ja = 9.766,
			ko = 4.633,
			zh = 4.633
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play222031051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1074ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect1074ui_story == nil then
				arg_201_1.var_.characterEffect1074ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.200000002980232

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect1074ui_story then
					local var_204_4 = Mathf.Lerp(0, 0.5, var_204_3)

					arg_201_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1074ui_story.fillRatio = var_204_4
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect1074ui_story then
				local var_204_5 = 0.5

				arg_201_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1074ui_story.fillRatio = var_204_5
			end

			local var_204_6 = 0
			local var_204_7 = 0.4

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_8 = arg_201_1:FormatText(StoryNameCfg[461].name)

				arg_201_1.leftNameTxt_.text = var_204_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, true)
				arg_201_1.iconController_:SetSelectedState("hero")

				arg_201_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_9 = arg_201_1:GetWordFromCfg(222031050)
				local var_204_10 = arg_201_1:FormatText(var_204_9.content)

				arg_201_1.text_.text = var_204_10

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_11 = 16
				local var_204_12 = utf8.len(var_204_10)
				local var_204_13 = var_204_11 <= 0 and var_204_7 or var_204_7 * (var_204_12 / var_204_11)

				if var_204_13 > 0 and var_204_7 < var_204_13 then
					arg_201_1.talkMaxDuration = var_204_13

					if var_204_13 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_13 + var_204_6
					end
				end

				arg_201_1.text_.text = var_204_10
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031050", "story_v_out_222031.awb") ~= 0 then
					local var_204_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031050", "story_v_out_222031.awb") / 1000

					if var_204_14 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_14 + var_204_6
					end

					if var_204_9.prefab_name ~= "" and arg_201_1.actors_[var_204_9.prefab_name] ~= nil then
						local var_204_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_9.prefab_name].transform, "story_v_out_222031", "222031050", "story_v_out_222031.awb")

						arg_201_1:RecordAudio("222031050", var_204_15)
						arg_201_1:RecordAudio("222031050", var_204_15)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_222031", "222031050", "story_v_out_222031.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_222031", "222031050", "story_v_out_222031.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_16 = math.max(var_204_7, arg_201_1.talkMaxDuration)

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_16 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_6) / var_204_16

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_6 + var_204_16 and arg_201_1.time_ < var_204_6 + var_204_16 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play222031051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 222031051
		arg_205_1.duration_ = 15.2

		local var_205_0 = {
			ja = 15.2,
			ko = 13.366,
			zh = 13.3
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
				arg_205_0:Play222031052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 1.325

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[461].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(222031051)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031051", "story_v_out_222031.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031051", "story_v_out_222031.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_222031", "222031051", "story_v_out_222031.awb")

						arg_205_1:RecordAudio("222031051", var_208_9)
						arg_205_1:RecordAudio("222031051", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_222031", "222031051", "story_v_out_222031.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_222031", "222031051", "story_v_out_222031.awb")
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
	Play222031052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 222031052
		arg_209_1.duration_ = 2.6

		local var_209_0 = {
			ja = 2.033,
			ko = 2.466,
			zh = 2.6
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
				arg_209_0:Play222031053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1074ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1074ui_story == nil then
				arg_209_1.var_.characterEffect1074ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1074ui_story then
					arg_209_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1074ui_story then
				arg_209_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_212_4 = 0

			if var_212_4 < arg_209_1.time_ and arg_209_1.time_ <= var_212_4 + arg_212_0 then
				arg_209_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_212_5 = 0
			local var_212_6 = 0.2

			if var_212_5 < arg_209_1.time_ and arg_209_1.time_ <= var_212_5 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_7 = arg_209_1:FormatText(StoryNameCfg[410].name)

				arg_209_1.leftNameTxt_.text = var_212_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_8 = arg_209_1:GetWordFromCfg(222031052)
				local var_212_9 = arg_209_1:FormatText(var_212_8.content)

				arg_209_1.text_.text = var_212_9

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_10 = 8
				local var_212_11 = utf8.len(var_212_9)
				local var_212_12 = var_212_10 <= 0 and var_212_6 or var_212_6 * (var_212_11 / var_212_10)

				if var_212_12 > 0 and var_212_6 < var_212_12 then
					arg_209_1.talkMaxDuration = var_212_12

					if var_212_12 + var_212_5 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_12 + var_212_5
					end
				end

				arg_209_1.text_.text = var_212_9
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031052", "story_v_out_222031.awb") ~= 0 then
					local var_212_13 = manager.audio:GetVoiceLength("story_v_out_222031", "222031052", "story_v_out_222031.awb") / 1000

					if var_212_13 + var_212_5 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_13 + var_212_5
					end

					if var_212_8.prefab_name ~= "" and arg_209_1.actors_[var_212_8.prefab_name] ~= nil then
						local var_212_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_8.prefab_name].transform, "story_v_out_222031", "222031052", "story_v_out_222031.awb")

						arg_209_1:RecordAudio("222031052", var_212_14)
						arg_209_1:RecordAudio("222031052", var_212_14)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_222031", "222031052", "story_v_out_222031.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_222031", "222031052", "story_v_out_222031.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_15 = math.max(var_212_6, arg_209_1.talkMaxDuration)

			if var_212_5 <= arg_209_1.time_ and arg_209_1.time_ < var_212_5 + var_212_15 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_5) / var_212_15

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_5 + var_212_15 and arg_209_1.time_ < var_212_5 + var_212_15 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play222031053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 222031053
		arg_213_1.duration_ = 12.3

		local var_213_0 = {
			ja = 10.933,
			ko = 12.3,
			zh = 12.3
		}
		local var_213_1 = manager.audio:GetLocalizationFlag()

		if var_213_0[var_213_1] ~= nil then
			arg_213_1.duration_ = var_213_0[var_213_1]
		end

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play222031054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1074ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1074ui_story == nil then
				arg_213_1.var_.characterEffect1074ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1074ui_story then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1074ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1074ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1074ui_story.fillRatio = var_216_5
			end

			local var_216_6 = 0
			local var_216_7 = 1.1

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_8 = arg_213_1:FormatText(StoryNameCfg[461].name)

				arg_213_1.leftNameTxt_.text = var_216_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, true)
				arg_213_1.iconController_:SetSelectedState("hero")

				arg_213_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_9 = arg_213_1:GetWordFromCfg(222031053)
				local var_216_10 = arg_213_1:FormatText(var_216_9.content)

				arg_213_1.text_.text = var_216_10

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_11 = 44
				local var_216_12 = utf8.len(var_216_10)
				local var_216_13 = var_216_11 <= 0 and var_216_7 or var_216_7 * (var_216_12 / var_216_11)

				if var_216_13 > 0 and var_216_7 < var_216_13 then
					arg_213_1.talkMaxDuration = var_216_13

					if var_216_13 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_10
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031053", "story_v_out_222031.awb") ~= 0 then
					local var_216_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031053", "story_v_out_222031.awb") / 1000

					if var_216_14 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_14 + var_216_6
					end

					if var_216_9.prefab_name ~= "" and arg_213_1.actors_[var_216_9.prefab_name] ~= nil then
						local var_216_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_9.prefab_name].transform, "story_v_out_222031", "222031053", "story_v_out_222031.awb")

						arg_213_1:RecordAudio("222031053", var_216_15)
						arg_213_1:RecordAudio("222031053", var_216_15)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_222031", "222031053", "story_v_out_222031.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_222031", "222031053", "story_v_out_222031.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_16 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_16 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_16

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_16 and arg_213_1.time_ < var_216_6 + var_216_16 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play222031054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 222031054
		arg_217_1.duration_ = 12.8

		local var_217_0 = {
			ja = 12.8,
			ko = 9.966,
			zh = 10
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
				arg_217_0:Play222031055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.725

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[461].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(222031054)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031054", "story_v_out_222031.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031054", "story_v_out_222031.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_222031", "222031054", "story_v_out_222031.awb")

						arg_217_1:RecordAudio("222031054", var_220_9)
						arg_217_1:RecordAudio("222031054", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_222031", "222031054", "story_v_out_222031.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_222031", "222031054", "story_v_out_222031.awb")
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
	Play222031055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 222031055
		arg_221_1.duration_ = 2.033

		local var_221_0 = {
			ja = 1.999999999999,
			ko = 2.033,
			zh = 2
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
				arg_221_0:Play222031056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1074ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1074ui_story == nil then
				arg_221_1.var_.characterEffect1074ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1074ui_story then
					arg_221_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1074ui_story then
				arg_221_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_224_4 = 0

			if var_224_4 < arg_221_1.time_ and arg_221_1.time_ <= var_224_4 + arg_224_0 then
				arg_221_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_224_5 = 0

			if var_224_5 < arg_221_1.time_ and arg_221_1.time_ <= var_224_5 + arg_224_0 then
				arg_221_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_224_6 = 0
			local var_224_7 = 0.225

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_8 = arg_221_1:FormatText(StoryNameCfg[410].name)

				arg_221_1.leftNameTxt_.text = var_224_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_9 = arg_221_1:GetWordFromCfg(222031055)
				local var_224_10 = arg_221_1:FormatText(var_224_9.content)

				arg_221_1.text_.text = var_224_10

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_11 = 9
				local var_224_12 = utf8.len(var_224_10)
				local var_224_13 = var_224_11 <= 0 and var_224_7 or var_224_7 * (var_224_12 / var_224_11)

				if var_224_13 > 0 and var_224_7 < var_224_13 then
					arg_221_1.talkMaxDuration = var_224_13

					if var_224_13 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_13 + var_224_6
					end
				end

				arg_221_1.text_.text = var_224_10
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031055", "story_v_out_222031.awb") ~= 0 then
					local var_224_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031055", "story_v_out_222031.awb") / 1000

					if var_224_14 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_14 + var_224_6
					end

					if var_224_9.prefab_name ~= "" and arg_221_1.actors_[var_224_9.prefab_name] ~= nil then
						local var_224_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_9.prefab_name].transform, "story_v_out_222031", "222031055", "story_v_out_222031.awb")

						arg_221_1:RecordAudio("222031055", var_224_15)
						arg_221_1:RecordAudio("222031055", var_224_15)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_222031", "222031055", "story_v_out_222031.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_222031", "222031055", "story_v_out_222031.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_16 = math.max(var_224_7, arg_221_1.talkMaxDuration)

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_16 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_6) / var_224_16

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_6 + var_224_16 and arg_221_1.time_ < var_224_6 + var_224_16 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play222031056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 222031056
		arg_225_1.duration_ = 18.133

		local var_225_0 = {
			ja = 18.133,
			ko = 12.333,
			zh = 12.333
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
				arg_225_0:Play222031057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1074ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1074ui_story == nil then
				arg_225_1.var_.characterEffect1074ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.200000002980232

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1074ui_story then
					local var_228_4 = Mathf.Lerp(0, 0.5, var_228_3)

					arg_225_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1074ui_story.fillRatio = var_228_4
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1074ui_story then
				local var_228_5 = 0.5

				arg_225_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1074ui_story.fillRatio = var_228_5
			end

			local var_228_6 = 0
			local var_228_7 = 1.125

			if var_228_6 < arg_225_1.time_ and arg_225_1.time_ <= var_228_6 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_8 = arg_225_1:FormatText(StoryNameCfg[461].name)

				arg_225_1.leftNameTxt_.text = var_228_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, true)
				arg_225_1.iconController_:SetSelectedState("hero")

				arg_225_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_9 = arg_225_1:GetWordFromCfg(222031056)
				local var_228_10 = arg_225_1:FormatText(var_228_9.content)

				arg_225_1.text_.text = var_228_10

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_11 = 45
				local var_228_12 = utf8.len(var_228_10)
				local var_228_13 = var_228_11 <= 0 and var_228_7 or var_228_7 * (var_228_12 / var_228_11)

				if var_228_13 > 0 and var_228_7 < var_228_13 then
					arg_225_1.talkMaxDuration = var_228_13

					if var_228_13 + var_228_6 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_13 + var_228_6
					end
				end

				arg_225_1.text_.text = var_228_10
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031056", "story_v_out_222031.awb") ~= 0 then
					local var_228_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031056", "story_v_out_222031.awb") / 1000

					if var_228_14 + var_228_6 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_14 + var_228_6
					end

					if var_228_9.prefab_name ~= "" and arg_225_1.actors_[var_228_9.prefab_name] ~= nil then
						local var_228_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_9.prefab_name].transform, "story_v_out_222031", "222031056", "story_v_out_222031.awb")

						arg_225_1:RecordAudio("222031056", var_228_15)
						arg_225_1:RecordAudio("222031056", var_228_15)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_222031", "222031056", "story_v_out_222031.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_222031", "222031056", "story_v_out_222031.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_16 = math.max(var_228_7, arg_225_1.talkMaxDuration)

			if var_228_6 <= arg_225_1.time_ and arg_225_1.time_ < var_228_6 + var_228_16 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_6) / var_228_16

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_6 + var_228_16 and arg_225_1.time_ < var_228_6 + var_228_16 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play222031057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 222031057
		arg_229_1.duration_ = 18.866

		local var_229_0 = {
			ja = 18.866,
			ko = 13.2,
			zh = 13.2
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
				arg_229_0:Play222031058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 1.2

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[461].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, true)
				arg_229_1.iconController_:SetSelectedState("hero")

				arg_229_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(222031057)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031057", "story_v_out_222031.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031057", "story_v_out_222031.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_222031", "222031057", "story_v_out_222031.awb")

						arg_229_1:RecordAudio("222031057", var_232_9)
						arg_229_1:RecordAudio("222031057", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_222031", "222031057", "story_v_out_222031.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_222031", "222031057", "story_v_out_222031.awb")
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
	Play222031058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 222031058
		arg_233_1.duration_ = 14.433

		local var_233_0 = {
			ja = 14.066,
			ko = 14.4,
			zh = 14.433
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
				arg_233_0:Play222031059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 1.2

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_2 = arg_233_1:FormatText(StoryNameCfg[461].name)

				arg_233_1.leftNameTxt_.text = var_236_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, true)
				arg_233_1.iconController_:SetSelectedState("hero")

				arg_233_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_3 = arg_233_1:GetWordFromCfg(222031058)
				local var_236_4 = arg_233_1:FormatText(var_236_3.content)

				arg_233_1.text_.text = var_236_4

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031058", "story_v_out_222031.awb") ~= 0 then
					local var_236_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031058", "story_v_out_222031.awb") / 1000

					if var_236_8 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_8 + var_236_0
					end

					if var_236_3.prefab_name ~= "" and arg_233_1.actors_[var_236_3.prefab_name] ~= nil then
						local var_236_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_3.prefab_name].transform, "story_v_out_222031", "222031058", "story_v_out_222031.awb")

						arg_233_1:RecordAudio("222031058", var_236_9)
						arg_233_1:RecordAudio("222031058", var_236_9)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_222031", "222031058", "story_v_out_222031.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_222031", "222031058", "story_v_out_222031.awb")
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
	Play222031059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 222031059
		arg_237_1.duration_ = 3.433

		local var_237_0 = {
			ja = 3.433,
			ko = 2.833,
			zh = 2.9
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play222031060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1074ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1074ui_story == nil then
				arg_237_1.var_.characterEffect1074ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1074ui_story then
					arg_237_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1074ui_story then
				arg_237_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_240_4 = 0

			if var_240_4 < arg_237_1.time_ and arg_237_1.time_ <= var_240_4 + arg_240_0 then
				arg_237_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_240_5 = 0

			if var_240_5 < arg_237_1.time_ and arg_237_1.time_ <= var_240_5 + arg_240_0 then
				arg_237_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_240_6 = 0
			local var_240_7 = 0.25

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_8 = arg_237_1:FormatText(StoryNameCfg[410].name)

				arg_237_1.leftNameTxt_.text = var_240_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_9 = arg_237_1:GetWordFromCfg(222031059)
				local var_240_10 = arg_237_1:FormatText(var_240_9.content)

				arg_237_1.text_.text = var_240_10

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_11 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031059", "story_v_out_222031.awb") ~= 0 then
					local var_240_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031059", "story_v_out_222031.awb") / 1000

					if var_240_14 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_14 + var_240_6
					end

					if var_240_9.prefab_name ~= "" and arg_237_1.actors_[var_240_9.prefab_name] ~= nil then
						local var_240_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_9.prefab_name].transform, "story_v_out_222031", "222031059", "story_v_out_222031.awb")

						arg_237_1:RecordAudio("222031059", var_240_15)
						arg_237_1:RecordAudio("222031059", var_240_15)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_222031", "222031059", "story_v_out_222031.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_222031", "222031059", "story_v_out_222031.awb")
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
	Play222031060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 222031060
		arg_241_1.duration_ = 6.2

		local var_241_0 = {
			ja = 6.2,
			ko = 5.066,
			zh = 5.066
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play222031061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1074ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1074ui_story == nil then
				arg_241_1.var_.characterEffect1074ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1074ui_story then
					local var_244_4 = Mathf.Lerp(0, 0.5, var_244_3)

					arg_241_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1074ui_story.fillRatio = var_244_4
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1074ui_story then
				local var_244_5 = 0.5

				arg_241_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1074ui_story.fillRatio = var_244_5
			end

			local var_244_6 = 0
			local var_244_7 = 0.35

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[461].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, true)
				arg_241_1.iconController_:SetSelectedState("hero")

				arg_241_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(222031060)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031060", "story_v_out_222031.awb") ~= 0 then
					local var_244_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031060", "story_v_out_222031.awb") / 1000

					if var_244_14 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_14 + var_244_6
					end

					if var_244_9.prefab_name ~= "" and arg_241_1.actors_[var_244_9.prefab_name] ~= nil then
						local var_244_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_9.prefab_name].transform, "story_v_out_222031", "222031060", "story_v_out_222031.awb")

						arg_241_1:RecordAudio("222031060", var_244_15)
						arg_241_1:RecordAudio("222031060", var_244_15)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_222031", "222031060", "story_v_out_222031.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_222031", "222031060", "story_v_out_222031.awb")
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
	Play222031061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 222031061
		arg_245_1.duration_ = 2.233

		local var_245_0 = {
			ja = 2.233,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_245_0:Play222031062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1074ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1074ui_story == nil then
				arg_245_1.var_.characterEffect1074ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1074ui_story then
					arg_245_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1074ui_story then
				arg_245_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_248_4 = 0

			if var_248_4 < arg_245_1.time_ and arg_245_1.time_ <= var_248_4 + arg_248_0 then
				arg_245_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_248_5 = 0

			if var_248_5 < arg_245_1.time_ and arg_245_1.time_ <= var_248_5 + arg_248_0 then
				arg_245_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_248_6 = 0
			local var_248_7 = 0.1

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_8 = arg_245_1:FormatText(StoryNameCfg[410].name)

				arg_245_1.leftNameTxt_.text = var_248_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_9 = arg_245_1:GetWordFromCfg(222031061)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031061", "story_v_out_222031.awb") ~= 0 then
					local var_248_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031061", "story_v_out_222031.awb") / 1000

					if var_248_14 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_14 + var_248_6
					end

					if var_248_9.prefab_name ~= "" and arg_245_1.actors_[var_248_9.prefab_name] ~= nil then
						local var_248_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_9.prefab_name].transform, "story_v_out_222031", "222031061", "story_v_out_222031.awb")

						arg_245_1:RecordAudio("222031061", var_248_15)
						arg_245_1:RecordAudio("222031061", var_248_15)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_222031", "222031061", "story_v_out_222031.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_222031", "222031061", "story_v_out_222031.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_16 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_16 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_16

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_16 and arg_245_1.time_ < var_248_6 + var_248_16 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play222031062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 222031062
		arg_249_1.duration_ = 10.033

		local var_249_0 = {
			ja = 9.466,
			ko = 10.033,
			zh = 10.033
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
				arg_249_0:Play222031063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1074ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1074ui_story == nil then
				arg_249_1.var_.characterEffect1074ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.200000002980232

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1074ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1074ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1074ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1074ui_story.fillRatio = var_252_5
			end

			local var_252_6 = 0
			local var_252_7 = 0.975

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_8 = arg_249_1:FormatText(StoryNameCfg[461].name)

				arg_249_1.leftNameTxt_.text = var_252_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, true)
				arg_249_1.iconController_:SetSelectedState("hero")

				arg_249_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_9 = arg_249_1:GetWordFromCfg(222031062)
				local var_252_10 = arg_249_1:FormatText(var_252_9.content)

				arg_249_1.text_.text = var_252_10

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_11 = 39
				local var_252_12 = utf8.len(var_252_10)
				local var_252_13 = var_252_11 <= 0 and var_252_7 or var_252_7 * (var_252_12 / var_252_11)

				if var_252_13 > 0 and var_252_7 < var_252_13 then
					arg_249_1.talkMaxDuration = var_252_13

					if var_252_13 + var_252_6 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_13 + var_252_6
					end
				end

				arg_249_1.text_.text = var_252_10
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031062", "story_v_out_222031.awb") ~= 0 then
					local var_252_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031062", "story_v_out_222031.awb") / 1000

					if var_252_14 + var_252_6 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_14 + var_252_6
					end

					if var_252_9.prefab_name ~= "" and arg_249_1.actors_[var_252_9.prefab_name] ~= nil then
						local var_252_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_9.prefab_name].transform, "story_v_out_222031", "222031062", "story_v_out_222031.awb")

						arg_249_1:RecordAudio("222031062", var_252_15)
						arg_249_1:RecordAudio("222031062", var_252_15)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_222031", "222031062", "story_v_out_222031.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_222031", "222031062", "story_v_out_222031.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_16 = math.max(var_252_7, arg_249_1.talkMaxDuration)

			if var_252_6 <= arg_249_1.time_ and arg_249_1.time_ < var_252_6 + var_252_16 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_6) / var_252_16

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_6 + var_252_16 and arg_249_1.time_ < var_252_6 + var_252_16 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play222031063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 222031063
		arg_253_1.duration_ = 14.433

		local var_253_0 = {
			ja = 14.433,
			ko = 7.566,
			zh = 7.566
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
				arg_253_0:Play222031064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.675

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[461].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(222031063)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 27
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031063", "story_v_out_222031.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031063", "story_v_out_222031.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_222031", "222031063", "story_v_out_222031.awb")

						arg_253_1:RecordAudio("222031063", var_256_9)
						arg_253_1:RecordAudio("222031063", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_222031", "222031063", "story_v_out_222031.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_222031", "222031063", "story_v_out_222031.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_10 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_10

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_10 and arg_253_1.time_ < var_256_0 + var_256_10 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play222031064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 222031064
		arg_257_1.duration_ = 9.066

		local var_257_0 = {
			ja = 9.066,
			ko = 7.433,
			zh = 7.433
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
				arg_257_0:Play222031065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1074ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1074ui_story == nil then
				arg_257_1.var_.characterEffect1074ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1074ui_story then
					arg_257_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1074ui_story then
				arg_257_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_260_4 = 0

			if var_260_4 < arg_257_1.time_ and arg_257_1.time_ <= var_260_4 + arg_260_0 then
				arg_257_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action6_1")
			end

			local var_260_5 = 0

			if var_260_5 < arg_257_1.time_ and arg_257_1.time_ <= var_260_5 + arg_260_0 then
				arg_257_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_260_6 = 0
			local var_260_7 = 0.85

			if var_260_6 < arg_257_1.time_ and arg_257_1.time_ <= var_260_6 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_8 = arg_257_1:FormatText(StoryNameCfg[410].name)

				arg_257_1.leftNameTxt_.text = var_260_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_9 = arg_257_1:GetWordFromCfg(222031064)
				local var_260_10 = arg_257_1:FormatText(var_260_9.content)

				arg_257_1.text_.text = var_260_10

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_11 = 34
				local var_260_12 = utf8.len(var_260_10)
				local var_260_13 = var_260_11 <= 0 and var_260_7 or var_260_7 * (var_260_12 / var_260_11)

				if var_260_13 > 0 and var_260_7 < var_260_13 then
					arg_257_1.talkMaxDuration = var_260_13

					if var_260_13 + var_260_6 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_13 + var_260_6
					end
				end

				arg_257_1.text_.text = var_260_10
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031064", "story_v_out_222031.awb") ~= 0 then
					local var_260_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031064", "story_v_out_222031.awb") / 1000

					if var_260_14 + var_260_6 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_14 + var_260_6
					end

					if var_260_9.prefab_name ~= "" and arg_257_1.actors_[var_260_9.prefab_name] ~= nil then
						local var_260_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_9.prefab_name].transform, "story_v_out_222031", "222031064", "story_v_out_222031.awb")

						arg_257_1:RecordAudio("222031064", var_260_15)
						arg_257_1:RecordAudio("222031064", var_260_15)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_222031", "222031064", "story_v_out_222031.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_222031", "222031064", "story_v_out_222031.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_16 = math.max(var_260_7, arg_257_1.talkMaxDuration)

			if var_260_6 <= arg_257_1.time_ and arg_257_1.time_ < var_260_6 + var_260_16 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_6) / var_260_16

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_6 + var_260_16 and arg_257_1.time_ < var_260_6 + var_260_16 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play222031065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 222031065
		arg_261_1.duration_ = 10.666

		local var_261_0 = {
			ja = 10.666,
			ko = 5.8,
			zh = 6
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
				arg_261_0:Play222031066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.85

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[410].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(222031065)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 34
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031065", "story_v_out_222031.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031065", "story_v_out_222031.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_222031", "222031065", "story_v_out_222031.awb")

						arg_261_1:RecordAudio("222031065", var_264_9)
						arg_261_1:RecordAudio("222031065", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_222031", "222031065", "story_v_out_222031.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_222031", "222031065", "story_v_out_222031.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_10 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_10

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_10 and arg_261_1.time_ < var_264_0 + var_264_10 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play222031066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 222031066
		arg_265_1.duration_ = 10.733

		local var_265_0 = {
			ja = 10.733,
			ko = 7.166,
			zh = 7.2
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
				arg_265_0:Play222031067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.75

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[410].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(222031066)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031066", "story_v_out_222031.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031066", "story_v_out_222031.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_222031", "222031066", "story_v_out_222031.awb")

						arg_265_1:RecordAudio("222031066", var_268_9)
						arg_265_1:RecordAudio("222031066", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_222031", "222031066", "story_v_out_222031.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_222031", "222031066", "story_v_out_222031.awb")
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
	Play222031067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 222031067
		arg_269_1.duration_ = 13.366

		local var_269_0 = {
			ja = 13.366,
			ko = 10.9,
			zh = 10.933
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
				arg_269_0:Play222031068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1074ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1074ui_story == nil then
				arg_269_1.var_.characterEffect1074ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1074ui_story then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1074ui_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1074ui_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1074ui_story.fillRatio = var_272_5
			end

			local var_272_6 = 0
			local var_272_7 = 0.85

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_8 = arg_269_1:FormatText(StoryNameCfg[461].name)

				arg_269_1.leftNameTxt_.text = var_272_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_9 = arg_269_1:GetWordFromCfg(222031067)
				local var_272_10 = arg_269_1:FormatText(var_272_9.content)

				arg_269_1.text_.text = var_272_10

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_11 = 34
				local var_272_12 = utf8.len(var_272_10)
				local var_272_13 = var_272_11 <= 0 and var_272_7 or var_272_7 * (var_272_12 / var_272_11)

				if var_272_13 > 0 and var_272_7 < var_272_13 then
					arg_269_1.talkMaxDuration = var_272_13

					if var_272_13 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_13 + var_272_6
					end
				end

				arg_269_1.text_.text = var_272_10
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031067", "story_v_out_222031.awb") ~= 0 then
					local var_272_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031067", "story_v_out_222031.awb") / 1000

					if var_272_14 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_14 + var_272_6
					end

					if var_272_9.prefab_name ~= "" and arg_269_1.actors_[var_272_9.prefab_name] ~= nil then
						local var_272_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_9.prefab_name].transform, "story_v_out_222031", "222031067", "story_v_out_222031.awb")

						arg_269_1:RecordAudio("222031067", var_272_15)
						arg_269_1:RecordAudio("222031067", var_272_15)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_222031", "222031067", "story_v_out_222031.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_222031", "222031067", "story_v_out_222031.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_16 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_16 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_16

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_16 and arg_269_1.time_ < var_272_6 + var_272_16 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play222031068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 222031068
		arg_273_1.duration_ = 6.133

		local var_273_0 = {
			ja = 6.133,
			ko = 5.933,
			zh = 5.933
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play222031069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.6

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[461].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, true)
				arg_273_1.iconController_:SetSelectedState("hero")

				arg_273_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(222031068)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 25
				local var_276_6 = utf8.len(var_276_4)
				local var_276_7 = var_276_5 <= 0 and var_276_1 or var_276_1 * (var_276_6 / var_276_5)

				if var_276_7 > 0 and var_276_1 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_4
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031068", "story_v_out_222031.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031068", "story_v_out_222031.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_222031", "222031068", "story_v_out_222031.awb")

						arg_273_1:RecordAudio("222031068", var_276_9)
						arg_273_1:RecordAudio("222031068", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_222031", "222031068", "story_v_out_222031.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_222031", "222031068", "story_v_out_222031.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_10 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_10 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_10

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_10 and arg_273_1.time_ < var_276_0 + var_276_10 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play222031069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 222031069
		arg_277_1.duration_ = 5.533

		local var_277_0 = {
			ja = 5.533,
			ko = 3.9,
			zh = 4.066
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
				arg_277_0:Play222031070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1074ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1074ui_story == nil then
				arg_277_1.var_.characterEffect1074ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1074ui_story then
					arg_277_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1074ui_story then
				arg_277_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_280_4 = 0

			if var_280_4 < arg_277_1.time_ and arg_277_1.time_ <= var_280_4 + arg_280_0 then
				arg_277_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action6_2")
			end

			local var_280_5 = 0

			if var_280_5 < arg_277_1.time_ and arg_277_1.time_ <= var_280_5 + arg_280_0 then
				arg_277_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_280_6 = 0
			local var_280_7 = 0.425

			if var_280_6 < arg_277_1.time_ and arg_277_1.time_ <= var_280_6 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_8 = arg_277_1:FormatText(StoryNameCfg[410].name)

				arg_277_1.leftNameTxt_.text = var_280_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_9 = arg_277_1:GetWordFromCfg(222031069)
				local var_280_10 = arg_277_1:FormatText(var_280_9.content)

				arg_277_1.text_.text = var_280_10

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_11 = 17
				local var_280_12 = utf8.len(var_280_10)
				local var_280_13 = var_280_11 <= 0 and var_280_7 or var_280_7 * (var_280_12 / var_280_11)

				if var_280_13 > 0 and var_280_7 < var_280_13 then
					arg_277_1.talkMaxDuration = var_280_13

					if var_280_13 + var_280_6 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_13 + var_280_6
					end
				end

				arg_277_1.text_.text = var_280_10
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031069", "story_v_out_222031.awb") ~= 0 then
					local var_280_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031069", "story_v_out_222031.awb") / 1000

					if var_280_14 + var_280_6 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_14 + var_280_6
					end

					if var_280_9.prefab_name ~= "" and arg_277_1.actors_[var_280_9.prefab_name] ~= nil then
						local var_280_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_9.prefab_name].transform, "story_v_out_222031", "222031069", "story_v_out_222031.awb")

						arg_277_1:RecordAudio("222031069", var_280_15)
						arg_277_1:RecordAudio("222031069", var_280_15)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_222031", "222031069", "story_v_out_222031.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_222031", "222031069", "story_v_out_222031.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_16 = math.max(var_280_7, arg_277_1.talkMaxDuration)

			if var_280_6 <= arg_277_1.time_ and arg_277_1.time_ < var_280_6 + var_280_16 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_6) / var_280_16

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_6 + var_280_16 and arg_277_1.time_ < var_280_6 + var_280_16 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play222031070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 222031070
		arg_281_1.duration_ = 8.766

		local var_281_0 = {
			ja = 8.766,
			ko = 7.533,
			zh = 7.533
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
				arg_281_0:Play222031071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1074ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1074ui_story == nil then
				arg_281_1.var_.characterEffect1074ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.200000002980232

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1074ui_story then
					local var_284_4 = Mathf.Lerp(0, 0.5, var_284_3)

					arg_281_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1074ui_story.fillRatio = var_284_4
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1074ui_story then
				local var_284_5 = 0.5

				arg_281_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1074ui_story.fillRatio = var_284_5
			end

			local var_284_6 = 0
			local var_284_7 = 0.75

			if var_284_6 < arg_281_1.time_ and arg_281_1.time_ <= var_284_6 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_8 = arg_281_1:FormatText(StoryNameCfg[461].name)

				arg_281_1.leftNameTxt_.text = var_284_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, true)
				arg_281_1.iconController_:SetSelectedState("hero")

				arg_281_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_9 = arg_281_1:GetWordFromCfg(222031070)
				local var_284_10 = arg_281_1:FormatText(var_284_9.content)

				arg_281_1.text_.text = var_284_10

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_11 = 30
				local var_284_12 = utf8.len(var_284_10)
				local var_284_13 = var_284_11 <= 0 and var_284_7 or var_284_7 * (var_284_12 / var_284_11)

				if var_284_13 > 0 and var_284_7 < var_284_13 then
					arg_281_1.talkMaxDuration = var_284_13

					if var_284_13 + var_284_6 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_13 + var_284_6
					end
				end

				arg_281_1.text_.text = var_284_10
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031070", "story_v_out_222031.awb") ~= 0 then
					local var_284_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031070", "story_v_out_222031.awb") / 1000

					if var_284_14 + var_284_6 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_14 + var_284_6
					end

					if var_284_9.prefab_name ~= "" and arg_281_1.actors_[var_284_9.prefab_name] ~= nil then
						local var_284_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_9.prefab_name].transform, "story_v_out_222031", "222031070", "story_v_out_222031.awb")

						arg_281_1:RecordAudio("222031070", var_284_15)
						arg_281_1:RecordAudio("222031070", var_284_15)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_222031", "222031070", "story_v_out_222031.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_222031", "222031070", "story_v_out_222031.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_16 = math.max(var_284_7, arg_281_1.talkMaxDuration)

			if var_284_6 <= arg_281_1.time_ and arg_281_1.time_ < var_284_6 + var_284_16 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_6) / var_284_16

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_6 + var_284_16 and arg_281_1.time_ < var_284_6 + var_284_16 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play222031071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 222031071
		arg_285_1.duration_ = 7.833

		local var_285_0 = {
			ja = 7.833,
			ko = 4.666,
			zh = 4.666
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
				arg_285_0:Play222031072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.425

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[461].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(222031071)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 17
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031071", "story_v_out_222031.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031071", "story_v_out_222031.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_222031", "222031071", "story_v_out_222031.awb")

						arg_285_1:RecordAudio("222031071", var_288_9)
						arg_285_1:RecordAudio("222031071", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_222031", "222031071", "story_v_out_222031.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_222031", "222031071", "story_v_out_222031.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play222031072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 222031072
		arg_289_1.duration_ = 14.1

		local var_289_0 = {
			ja = 14.1,
			ko = 13.333,
			zh = 13.466
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
				arg_289_0:Play222031073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 1.25

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[461].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, true)
				arg_289_1.iconController_:SetSelectedState("hero")

				arg_289_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(222031072)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031072", "story_v_out_222031.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031072", "story_v_out_222031.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_222031", "222031072", "story_v_out_222031.awb")

						arg_289_1:RecordAudio("222031072", var_292_9)
						arg_289_1:RecordAudio("222031072", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_222031", "222031072", "story_v_out_222031.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_222031", "222031072", "story_v_out_222031.awb")
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
	Play222031073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 222031073
		arg_293_1.duration_ = 14.766

		local var_293_0 = {
			ja = 14.766,
			ko = 13.133,
			zh = 13.166
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
				arg_293_0:Play222031074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 1.225

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[461].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, true)
				arg_293_1.iconController_:SetSelectedState("hero")

				arg_293_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(222031073)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031073", "story_v_out_222031.awb") ~= 0 then
					local var_296_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031073", "story_v_out_222031.awb") / 1000

					if var_296_8 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_8 + var_296_0
					end

					if var_296_3.prefab_name ~= "" and arg_293_1.actors_[var_296_3.prefab_name] ~= nil then
						local var_296_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_3.prefab_name].transform, "story_v_out_222031", "222031073", "story_v_out_222031.awb")

						arg_293_1:RecordAudio("222031073", var_296_9)
						arg_293_1:RecordAudio("222031073", var_296_9)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_222031", "222031073", "story_v_out_222031.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_222031", "222031073", "story_v_out_222031.awb")
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
	Play222031074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 222031074
		arg_297_1.duration_ = 8.3

		local var_297_0 = {
			ja = 8.3,
			ko = 3.7,
			zh = 3.733
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
				arg_297_0:Play222031075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1074ui_story"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.characterEffect1074ui_story == nil then
				arg_297_1.var_.characterEffect1074ui_story = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.200000002980232

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect1074ui_story then
					arg_297_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.characterEffect1074ui_story then
				arg_297_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_300_4 = 0

			if var_300_4 < arg_297_1.time_ and arg_297_1.time_ <= var_300_4 + arg_300_0 then
				arg_297_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_300_5 = 0

			if var_300_5 < arg_297_1.time_ and arg_297_1.time_ <= var_300_5 + arg_300_0 then
				arg_297_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_300_6 = 0
			local var_300_7 = 0.4

			if var_300_6 < arg_297_1.time_ and arg_297_1.time_ <= var_300_6 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_8 = arg_297_1:FormatText(StoryNameCfg[410].name)

				arg_297_1.leftNameTxt_.text = var_300_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_9 = arg_297_1:GetWordFromCfg(222031074)
				local var_300_10 = arg_297_1:FormatText(var_300_9.content)

				arg_297_1.text_.text = var_300_10

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_11 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031074", "story_v_out_222031.awb") ~= 0 then
					local var_300_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031074", "story_v_out_222031.awb") / 1000

					if var_300_14 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_14 + var_300_6
					end

					if var_300_9.prefab_name ~= "" and arg_297_1.actors_[var_300_9.prefab_name] ~= nil then
						local var_300_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_9.prefab_name].transform, "story_v_out_222031", "222031074", "story_v_out_222031.awb")

						arg_297_1:RecordAudio("222031074", var_300_15)
						arg_297_1:RecordAudio("222031074", var_300_15)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_222031", "222031074", "story_v_out_222031.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_222031", "222031074", "story_v_out_222031.awb")
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
	Play222031075 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 222031075
		arg_301_1.duration_ = 17.266

		local var_301_0 = {
			ja = 17.266,
			ko = 10.9,
			zh = 10.933
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
				arg_301_0:Play222031076(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1074ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect1074ui_story == nil then
				arg_301_1.var_.characterEffect1074ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.200000002980232

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect1074ui_story then
					local var_304_4 = Mathf.Lerp(0, 0.5, var_304_3)

					arg_301_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1074ui_story.fillRatio = var_304_4
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect1074ui_story then
				local var_304_5 = 0.5

				arg_301_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1074ui_story.fillRatio = var_304_5
			end

			local var_304_6 = 0
			local var_304_7 = 0.975

			if var_304_6 < arg_301_1.time_ and arg_301_1.time_ <= var_304_6 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_8 = arg_301_1:FormatText(StoryNameCfg[461].name)

				arg_301_1.leftNameTxt_.text = var_304_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, true)
				arg_301_1.iconController_:SetSelectedState("hero")

				arg_301_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_9 = arg_301_1:GetWordFromCfg(222031075)
				local var_304_10 = arg_301_1:FormatText(var_304_9.content)

				arg_301_1.text_.text = var_304_10

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_11 = 39
				local var_304_12 = utf8.len(var_304_10)
				local var_304_13 = var_304_11 <= 0 and var_304_7 or var_304_7 * (var_304_12 / var_304_11)

				if var_304_13 > 0 and var_304_7 < var_304_13 then
					arg_301_1.talkMaxDuration = var_304_13

					if var_304_13 + var_304_6 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_13 + var_304_6
					end
				end

				arg_301_1.text_.text = var_304_10
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031075", "story_v_out_222031.awb") ~= 0 then
					local var_304_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031075", "story_v_out_222031.awb") / 1000

					if var_304_14 + var_304_6 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_14 + var_304_6
					end

					if var_304_9.prefab_name ~= "" and arg_301_1.actors_[var_304_9.prefab_name] ~= nil then
						local var_304_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_9.prefab_name].transform, "story_v_out_222031", "222031075", "story_v_out_222031.awb")

						arg_301_1:RecordAudio("222031075", var_304_15)
						arg_301_1:RecordAudio("222031075", var_304_15)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_222031", "222031075", "story_v_out_222031.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_222031", "222031075", "story_v_out_222031.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_16 = math.max(var_304_7, arg_301_1.talkMaxDuration)

			if var_304_6 <= arg_301_1.time_ and arg_301_1.time_ < var_304_6 + var_304_16 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_6) / var_304_16

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_6 + var_304_16 and arg_301_1.time_ < var_304_6 + var_304_16 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play222031076 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 222031076
		arg_305_1.duration_ = 13.733

		local var_305_0 = {
			ja = 13.733,
			ko = 9.966,
			zh = 10
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
				arg_305_0:Play222031077(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 1

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[461].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, true)
				arg_305_1.iconController_:SetSelectedState("hero")

				arg_305_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(222031076)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031076", "story_v_out_222031.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031076", "story_v_out_222031.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_222031", "222031076", "story_v_out_222031.awb")

						arg_305_1:RecordAudio("222031076", var_308_9)
						arg_305_1:RecordAudio("222031076", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_222031", "222031076", "story_v_out_222031.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_222031", "222031076", "story_v_out_222031.awb")
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
	Play222031077 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 222031077
		arg_309_1.duration_ = 11.7

		local var_309_0 = {
			ja = 11.7,
			ko = 8.1,
			zh = 8.1
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
				arg_309_0:Play222031078(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1074ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.characterEffect1074ui_story == nil then
				arg_309_1.var_.characterEffect1074ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.200000002980232

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect1074ui_story then
					arg_309_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.characterEffect1074ui_story then
				arg_309_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_312_4 = 0

			if var_312_4 < arg_309_1.time_ and arg_309_1.time_ <= var_312_4 + arg_312_0 then
				arg_309_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_312_5 = 0
			local var_312_6 = 0.65

			if var_312_5 < arg_309_1.time_ and arg_309_1.time_ <= var_312_5 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_7 = arg_309_1:FormatText(StoryNameCfg[410].name)

				arg_309_1.leftNameTxt_.text = var_312_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_8 = arg_309_1:GetWordFromCfg(222031077)
				local var_312_9 = arg_309_1:FormatText(var_312_8.content)

				arg_309_1.text_.text = var_312_9

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_10 = 26
				local var_312_11 = utf8.len(var_312_9)
				local var_312_12 = var_312_10 <= 0 and var_312_6 or var_312_6 * (var_312_11 / var_312_10)

				if var_312_12 > 0 and var_312_6 < var_312_12 then
					arg_309_1.talkMaxDuration = var_312_12

					if var_312_12 + var_312_5 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_12 + var_312_5
					end
				end

				arg_309_1.text_.text = var_312_9
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031077", "story_v_out_222031.awb") ~= 0 then
					local var_312_13 = manager.audio:GetVoiceLength("story_v_out_222031", "222031077", "story_v_out_222031.awb") / 1000

					if var_312_13 + var_312_5 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_13 + var_312_5
					end

					if var_312_8.prefab_name ~= "" and arg_309_1.actors_[var_312_8.prefab_name] ~= nil then
						local var_312_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_8.prefab_name].transform, "story_v_out_222031", "222031077", "story_v_out_222031.awb")

						arg_309_1:RecordAudio("222031077", var_312_14)
						arg_309_1:RecordAudio("222031077", var_312_14)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_222031", "222031077", "story_v_out_222031.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_222031", "222031077", "story_v_out_222031.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_15 = math.max(var_312_6, arg_309_1.talkMaxDuration)

			if var_312_5 <= arg_309_1.time_ and arg_309_1.time_ < var_312_5 + var_312_15 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_5) / var_312_15

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_5 + var_312_15 and arg_309_1.time_ < var_312_5 + var_312_15 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play222031078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 222031078
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play222031079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1074ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1074ui_story == nil then
				arg_313_1.var_.characterEffect1074ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1074ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1074ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1074ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1074ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 1.575

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

				local var_316_8 = arg_313_1:GetWordFromCfg(222031078)
				local var_316_9 = arg_313_1:FormatText(var_316_8.content)

				arg_313_1.text_.text = var_316_9

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_10 = 63
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
	Play222031079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 222031079
		arg_317_1.duration_ = 4.666

		local var_317_0 = {
			ja = 4.666,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_317_0:Play222031080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1074ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect1074ui_story == nil then
				arg_317_1.var_.characterEffect1074ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect1074ui_story then
					arg_317_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect1074ui_story then
				arg_317_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_320_4 = 0

			if var_320_4 < arg_317_1.time_ and arg_317_1.time_ <= var_320_4 + arg_320_0 then
				arg_317_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 then
				arg_317_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_320_6 = 0
			local var_320_7 = 0.25

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_8 = arg_317_1:FormatText(StoryNameCfg[410].name)

				arg_317_1.leftNameTxt_.text = var_320_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_9 = arg_317_1:GetWordFromCfg(222031079)
				local var_320_10 = arg_317_1:FormatText(var_320_9.content)

				arg_317_1.text_.text = var_320_10

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_11 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031079", "story_v_out_222031.awb") ~= 0 then
					local var_320_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031079", "story_v_out_222031.awb") / 1000

					if var_320_14 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_14 + var_320_6
					end

					if var_320_9.prefab_name ~= "" and arg_317_1.actors_[var_320_9.prefab_name] ~= nil then
						local var_320_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_9.prefab_name].transform, "story_v_out_222031", "222031079", "story_v_out_222031.awb")

						arg_317_1:RecordAudio("222031079", var_320_15)
						arg_317_1:RecordAudio("222031079", var_320_15)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_222031", "222031079", "story_v_out_222031.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_222031", "222031079", "story_v_out_222031.awb")
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
	Play222031080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 222031080
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play222031081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1074ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect1074ui_story == nil then
				arg_321_1.var_.characterEffect1074ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.200000002980232

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect1074ui_story then
					local var_324_4 = Mathf.Lerp(0, 0.5, var_324_3)

					arg_321_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1074ui_story.fillRatio = var_324_4
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect1074ui_story then
				local var_324_5 = 0.5

				arg_321_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1074ui_story.fillRatio = var_324_5
			end

			local var_324_6 = 0
			local var_324_7 = 0.85

			if var_324_6 < arg_321_1.time_ and arg_321_1.time_ <= var_324_6 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_8 = arg_321_1:GetWordFromCfg(222031080)
				local var_324_9 = arg_321_1:FormatText(var_324_8.content)

				arg_321_1.text_.text = var_324_9

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_10 = 34
				local var_324_11 = utf8.len(var_324_9)
				local var_324_12 = var_324_10 <= 0 and var_324_7 or var_324_7 * (var_324_11 / var_324_10)

				if var_324_12 > 0 and var_324_7 < var_324_12 then
					arg_321_1.talkMaxDuration = var_324_12

					if var_324_12 + var_324_6 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_12 + var_324_6
					end
				end

				arg_321_1.text_.text = var_324_9
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_13 = math.max(var_324_7, arg_321_1.talkMaxDuration)

			if var_324_6 <= arg_321_1.time_ and arg_321_1.time_ < var_324_6 + var_324_13 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_6) / var_324_13

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_6 + var_324_13 and arg_321_1.time_ < var_324_6 + var_324_13 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play222031081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 222031081
		arg_325_1.duration_ = 16.2

		local var_325_0 = {
			ja = 16.2,
			ko = 10.933,
			zh = 10.833
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
				arg_325_0:Play222031082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1074ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect1074ui_story == nil then
				arg_325_1.var_.characterEffect1074ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.200000002980232

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect1074ui_story then
					arg_325_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect1074ui_story then
				arg_325_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_328_4 = 0

			if var_328_4 < arg_325_1.time_ and arg_325_1.time_ <= var_328_4 + arg_328_0 then
				arg_325_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_328_5 = 0
			local var_328_6 = 1.075

			if var_328_5 < arg_325_1.time_ and arg_325_1.time_ <= var_328_5 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_7 = arg_325_1:FormatText(StoryNameCfg[410].name)

				arg_325_1.leftNameTxt_.text = var_328_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_8 = arg_325_1:GetWordFromCfg(222031081)
				local var_328_9 = arg_325_1:FormatText(var_328_8.content)

				arg_325_1.text_.text = var_328_9

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_10 = 43
				local var_328_11 = utf8.len(var_328_9)
				local var_328_12 = var_328_10 <= 0 and var_328_6 or var_328_6 * (var_328_11 / var_328_10)

				if var_328_12 > 0 and var_328_6 < var_328_12 then
					arg_325_1.talkMaxDuration = var_328_12

					if var_328_12 + var_328_5 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_12 + var_328_5
					end
				end

				arg_325_1.text_.text = var_328_9
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031081", "story_v_out_222031.awb") ~= 0 then
					local var_328_13 = manager.audio:GetVoiceLength("story_v_out_222031", "222031081", "story_v_out_222031.awb") / 1000

					if var_328_13 + var_328_5 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_13 + var_328_5
					end

					if var_328_8.prefab_name ~= "" and arg_325_1.actors_[var_328_8.prefab_name] ~= nil then
						local var_328_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_8.prefab_name].transform, "story_v_out_222031", "222031081", "story_v_out_222031.awb")

						arg_325_1:RecordAudio("222031081", var_328_14)
						arg_325_1:RecordAudio("222031081", var_328_14)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_222031", "222031081", "story_v_out_222031.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_222031", "222031081", "story_v_out_222031.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_15 = math.max(var_328_6, arg_325_1.talkMaxDuration)

			if var_328_5 <= arg_325_1.time_ and arg_325_1.time_ < var_328_5 + var_328_15 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_5) / var_328_15

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_5 + var_328_15 and arg_325_1.time_ < var_328_5 + var_328_15 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play222031082 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 222031082
		arg_329_1.duration_ = 12.1

		local var_329_0 = {
			ja = 9.066,
			ko = 12.033,
			zh = 12.1
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
				arg_329_0:Play222031083(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_332_1 = 0
			local var_332_2 = 0.525

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_3 = arg_329_1:FormatText(StoryNameCfg[410].name)

				arg_329_1.leftNameTxt_.text = var_332_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_4 = arg_329_1:GetWordFromCfg(222031082)
				local var_332_5 = arg_329_1:FormatText(var_332_4.content)

				arg_329_1.text_.text = var_332_5

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_6 = 21
				local var_332_7 = utf8.len(var_332_5)
				local var_332_8 = var_332_6 <= 0 and var_332_2 or var_332_2 * (var_332_7 / var_332_6)

				if var_332_8 > 0 and var_332_2 < var_332_8 then
					arg_329_1.talkMaxDuration = var_332_8

					if var_332_8 + var_332_1 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_8 + var_332_1
					end
				end

				arg_329_1.text_.text = var_332_5
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031082", "story_v_out_222031.awb") ~= 0 then
					local var_332_9 = manager.audio:GetVoiceLength("story_v_out_222031", "222031082", "story_v_out_222031.awb") / 1000

					if var_332_9 + var_332_1 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_9 + var_332_1
					end

					if var_332_4.prefab_name ~= "" and arg_329_1.actors_[var_332_4.prefab_name] ~= nil then
						local var_332_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_4.prefab_name].transform, "story_v_out_222031", "222031082", "story_v_out_222031.awb")

						arg_329_1:RecordAudio("222031082", var_332_10)
						arg_329_1:RecordAudio("222031082", var_332_10)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_222031", "222031082", "story_v_out_222031.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_222031", "222031082", "story_v_out_222031.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_11 = math.max(var_332_2, arg_329_1.talkMaxDuration)

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_11 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_1) / var_332_11

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_1 + var_332_11 and arg_329_1.time_ < var_332_1 + var_332_11 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play222031083 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 222031083
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play222031084(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1074ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect1074ui_story == nil then
				arg_333_1.var_.characterEffect1074ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect1074ui_story then
					local var_336_4 = Mathf.Lerp(0, 0.5, var_336_3)

					arg_333_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1074ui_story.fillRatio = var_336_4
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect1074ui_story then
				local var_336_5 = 0.5

				arg_333_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1074ui_story.fillRatio = var_336_5
			end

			local var_336_6 = 0
			local var_336_7 = 0.8

			if var_336_6 < arg_333_1.time_ and arg_333_1.time_ <= var_336_6 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_8 = arg_333_1:GetWordFromCfg(222031083)
				local var_336_9 = arg_333_1:FormatText(var_336_8.content)

				arg_333_1.text_.text = var_336_9

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_10 = 32
				local var_336_11 = utf8.len(var_336_9)
				local var_336_12 = var_336_10 <= 0 and var_336_7 or var_336_7 * (var_336_11 / var_336_10)

				if var_336_12 > 0 and var_336_7 < var_336_12 then
					arg_333_1.talkMaxDuration = var_336_12

					if var_336_12 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_12 + var_336_6
					end
				end

				arg_333_1.text_.text = var_336_9
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_13 = math.max(var_336_7, arg_333_1.talkMaxDuration)

			if var_336_6 <= arg_333_1.time_ and arg_333_1.time_ < var_336_6 + var_336_13 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_6) / var_336_13

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_6 + var_336_13 and arg_333_1.time_ < var_336_6 + var_336_13 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play222031084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 222031084
		arg_337_1.duration_ = 9.9

		local var_337_0 = {
			ja = 9.9,
			ko = 5.4,
			zh = 5.4
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
				arg_337_0:Play222031085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1074ui_story"]
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 and arg_337_1.var_.characterEffect1074ui_story == nil then
				arg_337_1.var_.characterEffect1074ui_story = var_340_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_2 = 0.200000002980232

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2

				if arg_337_1.var_.characterEffect1074ui_story then
					arg_337_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 and arg_337_1.var_.characterEffect1074ui_story then
				arg_337_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_340_4 = 0

			if var_340_4 < arg_337_1.time_ and arg_337_1.time_ <= var_340_4 + arg_340_0 then
				arg_337_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_340_5 = 0
			local var_340_6 = 0.625

			if var_340_5 < arg_337_1.time_ and arg_337_1.time_ <= var_340_5 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_7 = arg_337_1:FormatText(StoryNameCfg[410].name)

				arg_337_1.leftNameTxt_.text = var_340_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_8 = arg_337_1:GetWordFromCfg(222031084)
				local var_340_9 = arg_337_1:FormatText(var_340_8.content)

				arg_337_1.text_.text = var_340_9

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_10 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031084", "story_v_out_222031.awb") ~= 0 then
					local var_340_13 = manager.audio:GetVoiceLength("story_v_out_222031", "222031084", "story_v_out_222031.awb") / 1000

					if var_340_13 + var_340_5 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_13 + var_340_5
					end

					if var_340_8.prefab_name ~= "" and arg_337_1.actors_[var_340_8.prefab_name] ~= nil then
						local var_340_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_8.prefab_name].transform, "story_v_out_222031", "222031084", "story_v_out_222031.awb")

						arg_337_1:RecordAudio("222031084", var_340_14)
						arg_337_1:RecordAudio("222031084", var_340_14)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_222031", "222031084", "story_v_out_222031.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_222031", "222031084", "story_v_out_222031.awb")
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
	Play222031085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 222031085
		arg_341_1.duration_ = 7.4

		local var_341_0 = {
			ja = 7.4,
			ko = 6.1,
			zh = 6.1
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
				arg_341_0:Play222031086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1074ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1074ui_story == nil then
				arg_341_1.var_.characterEffect1074ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1074ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1074ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1074ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1074ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 0.65

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_8 = arg_341_1:FormatText(StoryNameCfg[461].name)

				arg_341_1.leftNameTxt_.text = var_344_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, true)
				arg_341_1.iconController_:SetSelectedState("hero")

				arg_341_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_9 = arg_341_1:GetWordFromCfg(222031085)
				local var_344_10 = arg_341_1:FormatText(var_344_9.content)

				arg_341_1.text_.text = var_344_10

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_11 = 26
				local var_344_12 = utf8.len(var_344_10)
				local var_344_13 = var_344_11 <= 0 and var_344_7 or var_344_7 * (var_344_12 / var_344_11)

				if var_344_13 > 0 and var_344_7 < var_344_13 then
					arg_341_1.talkMaxDuration = var_344_13

					if var_344_13 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_13 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_10
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031085", "story_v_out_222031.awb") ~= 0 then
					local var_344_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031085", "story_v_out_222031.awb") / 1000

					if var_344_14 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_14 + var_344_6
					end

					if var_344_9.prefab_name ~= "" and arg_341_1.actors_[var_344_9.prefab_name] ~= nil then
						local var_344_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_9.prefab_name].transform, "story_v_out_222031", "222031085", "story_v_out_222031.awb")

						arg_341_1:RecordAudio("222031085", var_344_15)
						arg_341_1:RecordAudio("222031085", var_344_15)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_222031", "222031085", "story_v_out_222031.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_222031", "222031085", "story_v_out_222031.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_16 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_16 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_16

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_16 and arg_341_1.time_ < var_344_6 + var_344_16 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play222031086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 222031086
		arg_345_1.duration_ = 10.7

		local var_345_0 = {
			ja = 10.7,
			ko = 7.6,
			zh = 7.6
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
				arg_345_0:Play222031087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 0.7

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_2 = arg_345_1:FormatText(StoryNameCfg[461].name)

				arg_345_1.leftNameTxt_.text = var_348_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, true)
				arg_345_1.iconController_:SetSelectedState("hero")

				arg_345_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_3 = arg_345_1:GetWordFromCfg(222031086)
				local var_348_4 = arg_345_1:FormatText(var_348_3.content)

				arg_345_1.text_.text = var_348_4

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_5 = 28
				local var_348_6 = utf8.len(var_348_4)
				local var_348_7 = var_348_5 <= 0 and var_348_1 or var_348_1 * (var_348_6 / var_348_5)

				if var_348_7 > 0 and var_348_1 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_4
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031086", "story_v_out_222031.awb") ~= 0 then
					local var_348_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031086", "story_v_out_222031.awb") / 1000

					if var_348_8 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_8 + var_348_0
					end

					if var_348_3.prefab_name ~= "" and arg_345_1.actors_[var_348_3.prefab_name] ~= nil then
						local var_348_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_3.prefab_name].transform, "story_v_out_222031", "222031086", "story_v_out_222031.awb")

						arg_345_1:RecordAudio("222031086", var_348_9)
						arg_345_1:RecordAudio("222031086", var_348_9)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_222031", "222031086", "story_v_out_222031.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_222031", "222031086", "story_v_out_222031.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_10 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_10 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_10

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_10 and arg_345_1.time_ < var_348_0 + var_348_10 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play222031087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 222031087
		arg_349_1.duration_ = 14.733

		local var_349_0 = {
			ja = 14.733,
			ko = 7.366,
			zh = 7.366
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
				arg_349_0:Play222031088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1074ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1074ui_story == nil then
				arg_349_1.var_.characterEffect1074ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.200000002980232

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1074ui_story then
					arg_349_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1074ui_story then
				arg_349_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_352_4 = 0

			if var_352_4 < arg_349_1.time_ and arg_349_1.time_ <= var_352_4 + arg_352_0 then
				arg_349_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074actionlink/1074action453")
			end

			local var_352_5 = 0

			if var_352_5 < arg_349_1.time_ and arg_349_1.time_ <= var_352_5 + arg_352_0 then
				arg_349_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_352_6 = 0
			local var_352_7 = 0.875

			if var_352_6 < arg_349_1.time_ and arg_349_1.time_ <= var_352_6 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_8 = arg_349_1:FormatText(StoryNameCfg[410].name)

				arg_349_1.leftNameTxt_.text = var_352_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_9 = arg_349_1:GetWordFromCfg(222031087)
				local var_352_10 = arg_349_1:FormatText(var_352_9.content)

				arg_349_1.text_.text = var_352_10

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_11 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031087", "story_v_out_222031.awb") ~= 0 then
					local var_352_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031087", "story_v_out_222031.awb") / 1000

					if var_352_14 + var_352_6 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_14 + var_352_6
					end

					if var_352_9.prefab_name ~= "" and arg_349_1.actors_[var_352_9.prefab_name] ~= nil then
						local var_352_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_9.prefab_name].transform, "story_v_out_222031", "222031087", "story_v_out_222031.awb")

						arg_349_1:RecordAudio("222031087", var_352_15)
						arg_349_1:RecordAudio("222031087", var_352_15)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_222031", "222031087", "story_v_out_222031.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_222031", "222031087", "story_v_out_222031.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_16 = math.max(var_352_7, arg_349_1.talkMaxDuration)

			if var_352_6 <= arg_349_1.time_ and arg_349_1.time_ < var_352_6 + var_352_16 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_6) / var_352_16

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_6 + var_352_16 and arg_349_1.time_ < var_352_6 + var_352_16 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play222031088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 222031088
		arg_353_1.duration_ = 13.2

		local var_353_0 = {
			ja = 13.2,
			ko = 9.866,
			zh = 9.866
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
				arg_353_0:Play222031089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1074ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect1074ui_story == nil then
				arg_353_1.var_.characterEffect1074ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect1074ui_story then
					local var_356_4 = Mathf.Lerp(0, 0.5, var_356_3)

					arg_353_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_353_1.var_.characterEffect1074ui_story.fillRatio = var_356_4
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect1074ui_story then
				local var_356_5 = 0.5

				arg_353_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_353_1.var_.characterEffect1074ui_story.fillRatio = var_356_5
			end

			local var_356_6 = 0
			local var_356_7 = 0.925

			if var_356_6 < arg_353_1.time_ and arg_353_1.time_ <= var_356_6 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_8 = arg_353_1:FormatText(StoryNameCfg[461].name)

				arg_353_1.leftNameTxt_.text = var_356_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, true)
				arg_353_1.iconController_:SetSelectedState("hero")

				arg_353_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_9 = arg_353_1:GetWordFromCfg(222031088)
				local var_356_10 = arg_353_1:FormatText(var_356_9.content)

				arg_353_1.text_.text = var_356_10

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_11 = 37
				local var_356_12 = utf8.len(var_356_10)
				local var_356_13 = var_356_11 <= 0 and var_356_7 or var_356_7 * (var_356_12 / var_356_11)

				if var_356_13 > 0 and var_356_7 < var_356_13 then
					arg_353_1.talkMaxDuration = var_356_13

					if var_356_13 + var_356_6 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_13 + var_356_6
					end
				end

				arg_353_1.text_.text = var_356_10
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031088", "story_v_out_222031.awb") ~= 0 then
					local var_356_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031088", "story_v_out_222031.awb") / 1000

					if var_356_14 + var_356_6 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_14 + var_356_6
					end

					if var_356_9.prefab_name ~= "" and arg_353_1.actors_[var_356_9.prefab_name] ~= nil then
						local var_356_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_9.prefab_name].transform, "story_v_out_222031", "222031088", "story_v_out_222031.awb")

						arg_353_1:RecordAudio("222031088", var_356_15)
						arg_353_1:RecordAudio("222031088", var_356_15)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_222031", "222031088", "story_v_out_222031.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_222031", "222031088", "story_v_out_222031.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_16 = math.max(var_356_7, arg_353_1.talkMaxDuration)

			if var_356_6 <= arg_353_1.time_ and arg_353_1.time_ < var_356_6 + var_356_16 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_6) / var_356_16

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_6 + var_356_16 and arg_353_1.time_ < var_356_6 + var_356_16 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play222031089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 222031089
		arg_357_1.duration_ = 12.866

		local var_357_0 = {
			ja = 12.866,
			ko = 9,
			zh = 9
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
				arg_357_0:Play222031090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.925

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[461].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, true)
				arg_357_1.iconController_:SetSelectedState("hero")

				arg_357_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(222031089)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 37
				local var_360_6 = utf8.len(var_360_4)
				local var_360_7 = var_360_5 <= 0 and var_360_1 or var_360_1 * (var_360_6 / var_360_5)

				if var_360_7 > 0 and var_360_1 < var_360_7 then
					arg_357_1.talkMaxDuration = var_360_7

					if var_360_7 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_7 + var_360_0
					end
				end

				arg_357_1.text_.text = var_360_4
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031089", "story_v_out_222031.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031089", "story_v_out_222031.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_222031", "222031089", "story_v_out_222031.awb")

						arg_357_1:RecordAudio("222031089", var_360_9)
						arg_357_1:RecordAudio("222031089", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_222031", "222031089", "story_v_out_222031.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_222031", "222031089", "story_v_out_222031.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_10 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_10 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_10

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_10 and arg_357_1.time_ < var_360_0 + var_360_10 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play222031090 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 222031090
		arg_361_1.duration_ = 21.4

		local var_361_0 = {
			ja = 21.4,
			ko = 17.366,
			zh = 17.4
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
				arg_361_0:Play222031091(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 1.575

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[461].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, true)
				arg_361_1.iconController_:SetSelectedState("hero")

				arg_361_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(222031090)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 63
				local var_364_6 = utf8.len(var_364_4)
				local var_364_7 = var_364_5 <= 0 and var_364_1 or var_364_1 * (var_364_6 / var_364_5)

				if var_364_7 > 0 and var_364_1 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_4
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031090", "story_v_out_222031.awb") ~= 0 then
					local var_364_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031090", "story_v_out_222031.awb") / 1000

					if var_364_8 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_8 + var_364_0
					end

					if var_364_3.prefab_name ~= "" and arg_361_1.actors_[var_364_3.prefab_name] ~= nil then
						local var_364_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_3.prefab_name].transform, "story_v_out_222031", "222031090", "story_v_out_222031.awb")

						arg_361_1:RecordAudio("222031090", var_364_9)
						arg_361_1:RecordAudio("222031090", var_364_9)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_222031", "222031090", "story_v_out_222031.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_222031", "222031090", "story_v_out_222031.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_10 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_10 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_10

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_10 and arg_361_1.time_ < var_364_0 + var_364_10 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play222031091 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 222031091
		arg_365_1.duration_ = 9

		local var_365_0 = {
			ja = 8.433,
			ko = 9,
			zh = 9
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
				arg_365_0:Play222031092(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1074ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1074ui_story == nil then
				arg_365_1.var_.characterEffect1074ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.200000002980232

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1074ui_story then
					arg_365_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1074ui_story then
				arg_365_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_368_4 = 0

			if var_368_4 < arg_365_1.time_ and arg_365_1.time_ <= var_368_4 + arg_368_0 then
				arg_365_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action3_2")
			end

			local var_368_5 = 0

			if var_368_5 < arg_365_1.time_ and arg_365_1.time_ <= var_368_5 + arg_368_0 then
				arg_365_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_368_6 = 0
			local var_368_7 = 0.75

			if var_368_6 < arg_365_1.time_ and arg_365_1.time_ <= var_368_6 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_8 = arg_365_1:FormatText(StoryNameCfg[410].name)

				arg_365_1.leftNameTxt_.text = var_368_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_9 = arg_365_1:GetWordFromCfg(222031091)
				local var_368_10 = arg_365_1:FormatText(var_368_9.content)

				arg_365_1.text_.text = var_368_10

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_11 = 30
				local var_368_12 = utf8.len(var_368_10)
				local var_368_13 = var_368_11 <= 0 and var_368_7 or var_368_7 * (var_368_12 / var_368_11)

				if var_368_13 > 0 and var_368_7 < var_368_13 then
					arg_365_1.talkMaxDuration = var_368_13

					if var_368_13 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_13 + var_368_6
					end
				end

				arg_365_1.text_.text = var_368_10
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031091", "story_v_out_222031.awb") ~= 0 then
					local var_368_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031091", "story_v_out_222031.awb") / 1000

					if var_368_14 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_14 + var_368_6
					end

					if var_368_9.prefab_name ~= "" and arg_365_1.actors_[var_368_9.prefab_name] ~= nil then
						local var_368_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_9.prefab_name].transform, "story_v_out_222031", "222031091", "story_v_out_222031.awb")

						arg_365_1:RecordAudio("222031091", var_368_15)
						arg_365_1:RecordAudio("222031091", var_368_15)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_222031", "222031091", "story_v_out_222031.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_222031", "222031091", "story_v_out_222031.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_16 = math.max(var_368_7, arg_365_1.talkMaxDuration)

			if var_368_6 <= arg_365_1.time_ and arg_365_1.time_ < var_368_6 + var_368_16 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_6) / var_368_16

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_6 + var_368_16 and arg_365_1.time_ < var_368_6 + var_368_16 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play222031092 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 222031092
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play222031093(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1074ui_story"].transform
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.var_.moveOldPos1074ui_story = var_372_0.localPosition
			end

			local var_372_2 = 0.001

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2
				local var_372_4 = Vector3.New(0, 100, 0)

				var_372_0.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos1074ui_story, var_372_4, var_372_3)

				local var_372_5 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_5.x, var_372_5.y, var_372_5.z)

				local var_372_6 = var_372_0.localEulerAngles

				var_372_6.z = 0
				var_372_6.x = 0
				var_372_0.localEulerAngles = var_372_6
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 then
				var_372_0.localPosition = Vector3.New(0, 100, 0)

				local var_372_7 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_7.x, var_372_7.y, var_372_7.z)

				local var_372_8 = var_372_0.localEulerAngles

				var_372_8.z = 0
				var_372_8.x = 0
				var_372_0.localEulerAngles = var_372_8
			end

			local var_372_9 = arg_369_1.actors_["1074ui_story"]
			local var_372_10 = 0

			if var_372_10 < arg_369_1.time_ and arg_369_1.time_ <= var_372_10 + arg_372_0 and arg_369_1.var_.characterEffect1074ui_story == nil then
				arg_369_1.var_.characterEffect1074ui_story = var_372_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_11 = 0.200000002980232

			if var_372_10 <= arg_369_1.time_ and arg_369_1.time_ < var_372_10 + var_372_11 then
				local var_372_12 = (arg_369_1.time_ - var_372_10) / var_372_11

				if arg_369_1.var_.characterEffect1074ui_story then
					local var_372_13 = Mathf.Lerp(0, 0.5, var_372_12)

					arg_369_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_369_1.var_.characterEffect1074ui_story.fillRatio = var_372_13
				end
			end

			if arg_369_1.time_ >= var_372_10 + var_372_11 and arg_369_1.time_ < var_372_10 + var_372_11 + arg_372_0 and arg_369_1.var_.characterEffect1074ui_story then
				local var_372_14 = 0.5

				arg_369_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_369_1.var_.characterEffect1074ui_story.fillRatio = var_372_14
			end

			local var_372_15 = 0
			local var_372_16 = 0.75

			if var_372_15 < arg_369_1.time_ and arg_369_1.time_ <= var_372_15 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, false)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_17 = arg_369_1:GetWordFromCfg(222031092)
				local var_372_18 = arg_369_1:FormatText(var_372_17.content)

				arg_369_1.text_.text = var_372_18

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_19 = 30
				local var_372_20 = utf8.len(var_372_18)
				local var_372_21 = var_372_19 <= 0 and var_372_16 or var_372_16 * (var_372_20 / var_372_19)

				if var_372_21 > 0 and var_372_16 < var_372_21 then
					arg_369_1.talkMaxDuration = var_372_21

					if var_372_21 + var_372_15 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_21 + var_372_15
					end
				end

				arg_369_1.text_.text = var_372_18
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_22 = math.max(var_372_16, arg_369_1.talkMaxDuration)

			if var_372_15 <= arg_369_1.time_ and arg_369_1.time_ < var_372_15 + var_372_22 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_15) / var_372_22

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_15 + var_372_22 and arg_369_1.time_ < var_372_15 + var_372_22 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play222031093 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 222031093
		arg_373_1.duration_ = 8.2

		local var_373_0 = {
			ja = 8.2,
			ko = 3.633,
			zh = 3.633
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
				arg_373_0:Play222031094(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = "1072ui_story"

			if arg_373_1.actors_[var_376_0] == nil then
				local var_376_1 = Object.Instantiate(Asset.Load("Char/" .. var_376_0), arg_373_1.stage_.transform)

				var_376_1.name = var_376_0
				var_376_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_373_1.actors_[var_376_0] = var_376_1

				local var_376_2 = var_376_1:GetComponentInChildren(typeof(CharacterEffect))

				var_376_2.enabled = true

				local var_376_3 = GameObjectTools.GetOrAddComponent(var_376_1, typeof(DynamicBoneHelper))

				if var_376_3 then
					var_376_3:EnableDynamicBone(false)
				end

				arg_373_1:ShowWeapon(var_376_2.transform, false)

				arg_373_1.var_[var_376_0 .. "Animator"] = var_376_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_373_1.var_[var_376_0 .. "Animator"].applyRootMotion = true
				arg_373_1.var_[var_376_0 .. "LipSync"] = var_376_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_376_4 = arg_373_1.actors_["1072ui_story"].transform
			local var_376_5 = 0

			if var_376_5 < arg_373_1.time_ and arg_373_1.time_ <= var_376_5 + arg_376_0 then
				arg_373_1.var_.moveOldPos1072ui_story = var_376_4.localPosition
			end

			local var_376_6 = 0.001

			if var_376_5 <= arg_373_1.time_ and arg_373_1.time_ < var_376_5 + var_376_6 then
				local var_376_7 = (arg_373_1.time_ - var_376_5) / var_376_6
				local var_376_8 = Vector3.New(-0.7, -0.71, -6)

				var_376_4.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1072ui_story, var_376_8, var_376_7)

				local var_376_9 = manager.ui.mainCamera.transform.position - var_376_4.position

				var_376_4.forward = Vector3.New(var_376_9.x, var_376_9.y, var_376_9.z)

				local var_376_10 = var_376_4.localEulerAngles

				var_376_10.z = 0
				var_376_10.x = 0
				var_376_4.localEulerAngles = var_376_10
			end

			if arg_373_1.time_ >= var_376_5 + var_376_6 and arg_373_1.time_ < var_376_5 + var_376_6 + arg_376_0 then
				var_376_4.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_376_11 = manager.ui.mainCamera.transform.position - var_376_4.position

				var_376_4.forward = Vector3.New(var_376_11.x, var_376_11.y, var_376_11.z)

				local var_376_12 = var_376_4.localEulerAngles

				var_376_12.z = 0
				var_376_12.x = 0
				var_376_4.localEulerAngles = var_376_12
			end

			local var_376_13 = arg_373_1.actors_["1072ui_story"]
			local var_376_14 = 0

			if var_376_14 < arg_373_1.time_ and arg_373_1.time_ <= var_376_14 + arg_376_0 and arg_373_1.var_.characterEffect1072ui_story == nil then
				arg_373_1.var_.characterEffect1072ui_story = var_376_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_15 = 0.200000002980232

			if var_376_14 <= arg_373_1.time_ and arg_373_1.time_ < var_376_14 + var_376_15 then
				local var_376_16 = (arg_373_1.time_ - var_376_14) / var_376_15

				if arg_373_1.var_.characterEffect1072ui_story then
					arg_373_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_14 + var_376_15 and arg_373_1.time_ < var_376_14 + var_376_15 + arg_376_0 and arg_373_1.var_.characterEffect1072ui_story then
				arg_373_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_376_17 = 0

			if var_376_17 < arg_373_1.time_ and arg_373_1.time_ <= var_376_17 + arg_376_0 then
				arg_373_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_376_18 = 0

			if var_376_18 < arg_373_1.time_ and arg_373_1.time_ <= var_376_18 + arg_376_0 then
				arg_373_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_376_19 = arg_373_1.actors_["1074ui_story"].transform
			local var_376_20 = 0

			if var_376_20 < arg_373_1.time_ and arg_373_1.time_ <= var_376_20 + arg_376_0 then
				arg_373_1.var_.moveOldPos1074ui_story = var_376_19.localPosition
			end

			local var_376_21 = 0.001

			if var_376_20 <= arg_373_1.time_ and arg_373_1.time_ < var_376_20 + var_376_21 then
				local var_376_22 = (arg_373_1.time_ - var_376_20) / var_376_21
				local var_376_23 = Vector3.New(0.7, -1.055, -6.12)

				var_376_19.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1074ui_story, var_376_23, var_376_22)

				local var_376_24 = manager.ui.mainCamera.transform.position - var_376_19.position

				var_376_19.forward = Vector3.New(var_376_24.x, var_376_24.y, var_376_24.z)

				local var_376_25 = var_376_19.localEulerAngles

				var_376_25.z = 0
				var_376_25.x = 0
				var_376_19.localEulerAngles = var_376_25
			end

			if arg_373_1.time_ >= var_376_20 + var_376_21 and arg_373_1.time_ < var_376_20 + var_376_21 + arg_376_0 then
				var_376_19.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_376_26 = manager.ui.mainCamera.transform.position - var_376_19.position

				var_376_19.forward = Vector3.New(var_376_26.x, var_376_26.y, var_376_26.z)

				local var_376_27 = var_376_19.localEulerAngles

				var_376_27.z = 0
				var_376_27.x = 0
				var_376_19.localEulerAngles = var_376_27
			end

			local var_376_28 = arg_373_1.actors_["1074ui_story"]
			local var_376_29 = 0

			if var_376_29 < arg_373_1.time_ and arg_373_1.time_ <= var_376_29 + arg_376_0 and arg_373_1.var_.characterEffect1074ui_story == nil then
				arg_373_1.var_.characterEffect1074ui_story = var_376_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_30 = 0.200000002980232

			if var_376_29 <= arg_373_1.time_ and arg_373_1.time_ < var_376_29 + var_376_30 then
				local var_376_31 = (arg_373_1.time_ - var_376_29) / var_376_30

				if arg_373_1.var_.characterEffect1074ui_story then
					local var_376_32 = Mathf.Lerp(0, 0.5, var_376_31)

					arg_373_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_373_1.var_.characterEffect1074ui_story.fillRatio = var_376_32
				end
			end

			if arg_373_1.time_ >= var_376_29 + var_376_30 and arg_373_1.time_ < var_376_29 + var_376_30 + arg_376_0 and arg_373_1.var_.characterEffect1074ui_story then
				local var_376_33 = 0.5

				arg_373_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_373_1.var_.characterEffect1074ui_story.fillRatio = var_376_33
			end

			local var_376_34 = 0

			if var_376_34 < arg_373_1.time_ and arg_373_1.time_ <= var_376_34 + arg_376_0 then
				arg_373_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_376_35 = arg_373_1.actors_["1072ui_story"]
			local var_376_36 = 0
			local var_376_37 = 0.1

			if var_376_36 < arg_373_1.time_ and arg_373_1.time_ <= var_376_36 + arg_376_0 then
				if arg_373_1.var_.characterEffect1072ui_story == nil then
					arg_373_1.var_.characterEffect1072ui_story = var_376_35:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_373_1.var_.characterEffect1072ui_story.imageEffect:turnOn(false)
			end

			local var_376_38 = arg_373_1.actors_["1072ui_story"]
			local var_376_39 = 0

			if var_376_39 < arg_373_1.time_ and arg_373_1.time_ <= var_376_39 + arg_376_0 then
				if arg_373_1.var_.characterEffect1072ui_story == nil then
					arg_373_1.var_.characterEffect1072ui_story = var_376_38:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_376_40 = arg_373_1.var_.characterEffect1072ui_story

				var_376_40.imageEffect:turnOff()

				var_376_40.interferenceEffect.enabled = true
				var_376_40.interferenceEffect.noise = 0.001
				var_376_40.interferenceEffect.simTimeScale = 1
				var_376_40.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_376_41 = 0
			local var_376_42 = 0.475

			if var_376_41 < arg_373_1.time_ and arg_373_1.time_ <= var_376_41 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_43 = arg_373_1:FormatText(StoryNameCfg[379].name)

				arg_373_1.leftNameTxt_.text = var_376_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_44 = arg_373_1:GetWordFromCfg(222031093)
				local var_376_45 = arg_373_1:FormatText(var_376_44.content)

				arg_373_1.text_.text = var_376_45

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_46 = 19
				local var_376_47 = utf8.len(var_376_45)
				local var_376_48 = var_376_46 <= 0 and var_376_42 or var_376_42 * (var_376_47 / var_376_46)

				if var_376_48 > 0 and var_376_42 < var_376_48 then
					arg_373_1.talkMaxDuration = var_376_48

					if var_376_48 + var_376_41 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_48 + var_376_41
					end
				end

				arg_373_1.text_.text = var_376_45
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031093", "story_v_out_222031.awb") ~= 0 then
					local var_376_49 = manager.audio:GetVoiceLength("story_v_out_222031", "222031093", "story_v_out_222031.awb") / 1000

					if var_376_49 + var_376_41 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_49 + var_376_41
					end

					if var_376_44.prefab_name ~= "" and arg_373_1.actors_[var_376_44.prefab_name] ~= nil then
						local var_376_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_44.prefab_name].transform, "story_v_out_222031", "222031093", "story_v_out_222031.awb")

						arg_373_1:RecordAudio("222031093", var_376_50)
						arg_373_1:RecordAudio("222031093", var_376_50)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_222031", "222031093", "story_v_out_222031.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_222031", "222031093", "story_v_out_222031.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_51 = math.max(var_376_42, arg_373_1.talkMaxDuration)

			if var_376_41 <= arg_373_1.time_ and arg_373_1.time_ < var_376_41 + var_376_51 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_41) / var_376_51

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_41 + var_376_51 and arg_373_1.time_ < var_376_41 + var_376_51 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play222031094 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 222031094
		arg_377_1.duration_ = 10.8

		local var_377_0 = {
			ja = 10.8,
			ko = 6.633,
			zh = 6.633
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
				arg_377_0:Play222031095(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1074ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect1074ui_story == nil then
				arg_377_1.var_.characterEffect1074ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.200000002980232

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect1074ui_story then
					arg_377_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect1074ui_story then
				arg_377_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_380_4 = 0

			if var_380_4 < arg_377_1.time_ and arg_377_1.time_ <= var_380_4 + arg_380_0 then
				arg_377_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_380_5 = 0

			if var_380_5 < arg_377_1.time_ and arg_377_1.time_ <= var_380_5 + arg_380_0 then
				arg_377_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_380_6 = arg_377_1.actors_["1072ui_story"]
			local var_380_7 = 0

			if var_380_7 < arg_377_1.time_ and arg_377_1.time_ <= var_380_7 + arg_380_0 and arg_377_1.var_.characterEffect1072ui_story == nil then
				arg_377_1.var_.characterEffect1072ui_story = var_380_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_8 = 0.200000002980232

			if var_380_7 <= arg_377_1.time_ and arg_377_1.time_ < var_380_7 + var_380_8 then
				local var_380_9 = (arg_377_1.time_ - var_380_7) / var_380_8

				if arg_377_1.var_.characterEffect1072ui_story then
					local var_380_10 = Mathf.Lerp(0, 0.5, var_380_9)

					arg_377_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1072ui_story.fillRatio = var_380_10
				end
			end

			if arg_377_1.time_ >= var_380_7 + var_380_8 and arg_377_1.time_ < var_380_7 + var_380_8 + arg_380_0 and arg_377_1.var_.characterEffect1072ui_story then
				local var_380_11 = 0.5

				arg_377_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1072ui_story.fillRatio = var_380_11
			end

			local var_380_12 = 0
			local var_380_13 = 0.775

			if var_380_12 < arg_377_1.time_ and arg_377_1.time_ <= var_380_12 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_14 = arg_377_1:FormatText(StoryNameCfg[410].name)

				arg_377_1.leftNameTxt_.text = var_380_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_15 = arg_377_1:GetWordFromCfg(222031094)
				local var_380_16 = arg_377_1:FormatText(var_380_15.content)

				arg_377_1.text_.text = var_380_16

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_17 = 31
				local var_380_18 = utf8.len(var_380_16)
				local var_380_19 = var_380_17 <= 0 and var_380_13 or var_380_13 * (var_380_18 / var_380_17)

				if var_380_19 > 0 and var_380_13 < var_380_19 then
					arg_377_1.talkMaxDuration = var_380_19

					if var_380_19 + var_380_12 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_19 + var_380_12
					end
				end

				arg_377_1.text_.text = var_380_16
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031094", "story_v_out_222031.awb") ~= 0 then
					local var_380_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031094", "story_v_out_222031.awb") / 1000

					if var_380_20 + var_380_12 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_20 + var_380_12
					end

					if var_380_15.prefab_name ~= "" and arg_377_1.actors_[var_380_15.prefab_name] ~= nil then
						local var_380_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_15.prefab_name].transform, "story_v_out_222031", "222031094", "story_v_out_222031.awb")

						arg_377_1:RecordAudio("222031094", var_380_21)
						arg_377_1:RecordAudio("222031094", var_380_21)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_222031", "222031094", "story_v_out_222031.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_222031", "222031094", "story_v_out_222031.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_22 = math.max(var_380_13, arg_377_1.talkMaxDuration)

			if var_380_12 <= arg_377_1.time_ and arg_377_1.time_ < var_380_12 + var_380_22 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_12) / var_380_22

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_12 + var_380_22 and arg_377_1.time_ < var_380_12 + var_380_22 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play222031095 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 222031095
		arg_381_1.duration_ = 8.333

		local var_381_0 = {
			ja = 8.333,
			ko = 3.566,
			zh = 3.566
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
				arg_381_0:Play222031096(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.425

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[410].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(222031095)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031095", "story_v_out_222031.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031095", "story_v_out_222031.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_222031", "222031095", "story_v_out_222031.awb")

						arg_381_1:RecordAudio("222031095", var_384_9)
						arg_381_1:RecordAudio("222031095", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_222031", "222031095", "story_v_out_222031.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_222031", "222031095", "story_v_out_222031.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_10 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_10 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_10

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_10 and arg_381_1.time_ < var_384_0 + var_384_10 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play222031096 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 222031096
		arg_385_1.duration_ = 5.133

		local var_385_0 = {
			ja = 5.133,
			ko = 3.266,
			zh = 3.266
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
				arg_385_0:Play222031097(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1072ui_story"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.characterEffect1072ui_story == nil then
				arg_385_1.var_.characterEffect1072ui_story = var_388_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_2 = 0.200000002980232

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.characterEffect1072ui_story then
					arg_385_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.characterEffect1072ui_story then
				arg_385_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_388_4 = 0

			if var_388_4 < arg_385_1.time_ and arg_385_1.time_ <= var_388_4 + arg_388_0 then
				arg_385_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_388_5 = 0

			if var_388_5 < arg_385_1.time_ and arg_385_1.time_ <= var_388_5 + arg_388_0 then
				arg_385_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_388_6 = arg_385_1.actors_["1074ui_story"]
			local var_388_7 = 0

			if var_388_7 < arg_385_1.time_ and arg_385_1.time_ <= var_388_7 + arg_388_0 and arg_385_1.var_.characterEffect1074ui_story == nil then
				arg_385_1.var_.characterEffect1074ui_story = var_388_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_8 = 0.200000002980232

			if var_388_7 <= arg_385_1.time_ and arg_385_1.time_ < var_388_7 + var_388_8 then
				local var_388_9 = (arg_385_1.time_ - var_388_7) / var_388_8

				if arg_385_1.var_.characterEffect1074ui_story then
					local var_388_10 = Mathf.Lerp(0, 0.5, var_388_9)

					arg_385_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_385_1.var_.characterEffect1074ui_story.fillRatio = var_388_10
				end
			end

			if arg_385_1.time_ >= var_388_7 + var_388_8 and arg_385_1.time_ < var_388_7 + var_388_8 + arg_388_0 and arg_385_1.var_.characterEffect1074ui_story then
				local var_388_11 = 0.5

				arg_385_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_385_1.var_.characterEffect1074ui_story.fillRatio = var_388_11
			end

			local var_388_12 = 0
			local var_388_13 = 0.475

			if var_388_12 < arg_385_1.time_ and arg_385_1.time_ <= var_388_12 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_14 = arg_385_1:FormatText(StoryNameCfg[379].name)

				arg_385_1.leftNameTxt_.text = var_388_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_15 = arg_385_1:GetWordFromCfg(222031096)
				local var_388_16 = arg_385_1:FormatText(var_388_15.content)

				arg_385_1.text_.text = var_388_16

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_17 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031096", "story_v_out_222031.awb") ~= 0 then
					local var_388_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031096", "story_v_out_222031.awb") / 1000

					if var_388_20 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_20 + var_388_12
					end

					if var_388_15.prefab_name ~= "" and arg_385_1.actors_[var_388_15.prefab_name] ~= nil then
						local var_388_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_15.prefab_name].transform, "story_v_out_222031", "222031096", "story_v_out_222031.awb")

						arg_385_1:RecordAudio("222031096", var_388_21)
						arg_385_1:RecordAudio("222031096", var_388_21)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_222031", "222031096", "story_v_out_222031.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_222031", "222031096", "story_v_out_222031.awb")
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
	Play222031097 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 222031097
		arg_389_1.duration_ = 8.766

		local var_389_0 = {
			ja = 8.766,
			ko = 2.933,
			zh = 2.933
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
				arg_389_0:Play222031098(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1074ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1074ui_story == nil then
				arg_389_1.var_.characterEffect1074ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.200000002980232

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1074ui_story then
					arg_389_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1074ui_story then
				arg_389_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_392_4 = arg_389_1.actors_["1072ui_story"]
			local var_392_5 = 0

			if var_392_5 < arg_389_1.time_ and arg_389_1.time_ <= var_392_5 + arg_392_0 and arg_389_1.var_.characterEffect1072ui_story == nil then
				arg_389_1.var_.characterEffect1072ui_story = var_392_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_6 = 0.200000002980232

			if var_392_5 <= arg_389_1.time_ and arg_389_1.time_ < var_392_5 + var_392_6 then
				local var_392_7 = (arg_389_1.time_ - var_392_5) / var_392_6

				if arg_389_1.var_.characterEffect1072ui_story then
					local var_392_8 = Mathf.Lerp(0, 0.5, var_392_7)

					arg_389_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_389_1.var_.characterEffect1072ui_story.fillRatio = var_392_8
				end
			end

			if arg_389_1.time_ >= var_392_5 + var_392_6 and arg_389_1.time_ < var_392_5 + var_392_6 + arg_392_0 and arg_389_1.var_.characterEffect1072ui_story then
				local var_392_9 = 0.5

				arg_389_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_389_1.var_.characterEffect1072ui_story.fillRatio = var_392_9
			end

			local var_392_10 = 0
			local var_392_11 = 0.35

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_12 = arg_389_1:FormatText(StoryNameCfg[410].name)

				arg_389_1.leftNameTxt_.text = var_392_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_13 = arg_389_1:GetWordFromCfg(222031097)
				local var_392_14 = arg_389_1:FormatText(var_392_13.content)

				arg_389_1.text_.text = var_392_14

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_15 = 14
				local var_392_16 = utf8.len(var_392_14)
				local var_392_17 = var_392_15 <= 0 and var_392_11 or var_392_11 * (var_392_16 / var_392_15)

				if var_392_17 > 0 and var_392_11 < var_392_17 then
					arg_389_1.talkMaxDuration = var_392_17

					if var_392_17 + var_392_10 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_17 + var_392_10
					end
				end

				arg_389_1.text_.text = var_392_14
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031097", "story_v_out_222031.awb") ~= 0 then
					local var_392_18 = manager.audio:GetVoiceLength("story_v_out_222031", "222031097", "story_v_out_222031.awb") / 1000

					if var_392_18 + var_392_10 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_18 + var_392_10
					end

					if var_392_13.prefab_name ~= "" and arg_389_1.actors_[var_392_13.prefab_name] ~= nil then
						local var_392_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_13.prefab_name].transform, "story_v_out_222031", "222031097", "story_v_out_222031.awb")

						arg_389_1:RecordAudio("222031097", var_392_19)
						arg_389_1:RecordAudio("222031097", var_392_19)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_222031", "222031097", "story_v_out_222031.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_222031", "222031097", "story_v_out_222031.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_20 = math.max(var_392_11, arg_389_1.talkMaxDuration)

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_20 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_10) / var_392_20

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_10 + var_392_20 and arg_389_1.time_ < var_392_10 + var_392_20 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play222031098 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 222031098
		arg_393_1.duration_ = 1.999999999999

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play222031099(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1072ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1072ui_story == nil then
				arg_393_1.var_.characterEffect1072ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.200000002980232

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1072ui_story then
					arg_393_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1072ui_story then
				arg_393_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_396_4 = 0

			if var_396_4 < arg_393_1.time_ and arg_393_1.time_ <= var_396_4 + arg_396_0 then
				arg_393_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_2")
			end

			local var_396_5 = 0

			if var_396_5 < arg_393_1.time_ and arg_393_1.time_ <= var_396_5 + arg_396_0 then
				arg_393_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_396_6 = arg_393_1.actors_["1074ui_story"]
			local var_396_7 = 0

			if var_396_7 < arg_393_1.time_ and arg_393_1.time_ <= var_396_7 + arg_396_0 and arg_393_1.var_.characterEffect1074ui_story == nil then
				arg_393_1.var_.characterEffect1074ui_story = var_396_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_8 = 0.200000002980232

			if var_396_7 <= arg_393_1.time_ and arg_393_1.time_ < var_396_7 + var_396_8 then
				local var_396_9 = (arg_393_1.time_ - var_396_7) / var_396_8

				if arg_393_1.var_.characterEffect1074ui_story then
					local var_396_10 = Mathf.Lerp(0, 0.5, var_396_9)

					arg_393_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1074ui_story.fillRatio = var_396_10
				end
			end

			if arg_393_1.time_ >= var_396_7 + var_396_8 and arg_393_1.time_ < var_396_7 + var_396_8 + arg_396_0 and arg_393_1.var_.characterEffect1074ui_story then
				local var_396_11 = 0.5

				arg_393_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1074ui_story.fillRatio = var_396_11
			end

			local var_396_12 = 0
			local var_396_13 = 0.1

			if var_396_12 < arg_393_1.time_ and arg_393_1.time_ <= var_396_12 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_14 = arg_393_1:FormatText(StoryNameCfg[379].name)

				arg_393_1.leftNameTxt_.text = var_396_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_15 = arg_393_1:GetWordFromCfg(222031098)
				local var_396_16 = arg_393_1:FormatText(var_396_15.content)

				arg_393_1.text_.text = var_396_16

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_17 = 4
				local var_396_18 = utf8.len(var_396_16)
				local var_396_19 = var_396_17 <= 0 and var_396_13 or var_396_13 * (var_396_18 / var_396_17)

				if var_396_19 > 0 and var_396_13 < var_396_19 then
					arg_393_1.talkMaxDuration = var_396_19

					if var_396_19 + var_396_12 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_19 + var_396_12
					end
				end

				arg_393_1.text_.text = var_396_16
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031098", "story_v_out_222031.awb") ~= 0 then
					local var_396_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031098", "story_v_out_222031.awb") / 1000

					if var_396_20 + var_396_12 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_20 + var_396_12
					end

					if var_396_15.prefab_name ~= "" and arg_393_1.actors_[var_396_15.prefab_name] ~= nil then
						local var_396_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_15.prefab_name].transform, "story_v_out_222031", "222031098", "story_v_out_222031.awb")

						arg_393_1:RecordAudio("222031098", var_396_21)
						arg_393_1:RecordAudio("222031098", var_396_21)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_222031", "222031098", "story_v_out_222031.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_222031", "222031098", "story_v_out_222031.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_22 = math.max(var_396_13, arg_393_1.talkMaxDuration)

			if var_396_12 <= arg_393_1.time_ and arg_393_1.time_ < var_396_12 + var_396_22 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_12) / var_396_22

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_12 + var_396_22 and arg_393_1.time_ < var_396_12 + var_396_22 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play222031099 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 222031099
		arg_397_1.duration_ = 12.9

		local var_397_0 = {
			ja = 12.9,
			ko = 5.833,
			zh = 5.966
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
				arg_397_0:Play222031100(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1074ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1074ui_story == nil then
				arg_397_1.var_.characterEffect1074ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.200000002980232

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1074ui_story then
					arg_397_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1074ui_story then
				arg_397_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_400_4 = arg_397_1.actors_["1072ui_story"]
			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 and arg_397_1.var_.characterEffect1072ui_story == nil then
				arg_397_1.var_.characterEffect1072ui_story = var_400_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_6 = 0.200000002980232

			if var_400_5 <= arg_397_1.time_ and arg_397_1.time_ < var_400_5 + var_400_6 then
				local var_400_7 = (arg_397_1.time_ - var_400_5) / var_400_6

				if arg_397_1.var_.characterEffect1072ui_story then
					local var_400_8 = Mathf.Lerp(0, 0.5, var_400_7)

					arg_397_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_397_1.var_.characterEffect1072ui_story.fillRatio = var_400_8
				end
			end

			if arg_397_1.time_ >= var_400_5 + var_400_6 and arg_397_1.time_ < var_400_5 + var_400_6 + arg_400_0 and arg_397_1.var_.characterEffect1072ui_story then
				local var_400_9 = 0.5

				arg_397_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_397_1.var_.characterEffect1072ui_story.fillRatio = var_400_9
			end

			local var_400_10 = 0
			local var_400_11 = 0.7

			if var_400_10 < arg_397_1.time_ and arg_397_1.time_ <= var_400_10 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_12 = arg_397_1:FormatText(StoryNameCfg[410].name)

				arg_397_1.leftNameTxt_.text = var_400_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_13 = arg_397_1:GetWordFromCfg(222031099)
				local var_400_14 = arg_397_1:FormatText(var_400_13.content)

				arg_397_1.text_.text = var_400_14

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_15 = 28
				local var_400_16 = utf8.len(var_400_14)
				local var_400_17 = var_400_15 <= 0 and var_400_11 or var_400_11 * (var_400_16 / var_400_15)

				if var_400_17 > 0 and var_400_11 < var_400_17 then
					arg_397_1.talkMaxDuration = var_400_17

					if var_400_17 + var_400_10 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_17 + var_400_10
					end
				end

				arg_397_1.text_.text = var_400_14
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031099", "story_v_out_222031.awb") ~= 0 then
					local var_400_18 = manager.audio:GetVoiceLength("story_v_out_222031", "222031099", "story_v_out_222031.awb") / 1000

					if var_400_18 + var_400_10 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_18 + var_400_10
					end

					if var_400_13.prefab_name ~= "" and arg_397_1.actors_[var_400_13.prefab_name] ~= nil then
						local var_400_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_13.prefab_name].transform, "story_v_out_222031", "222031099", "story_v_out_222031.awb")

						arg_397_1:RecordAudio("222031099", var_400_19)
						arg_397_1:RecordAudio("222031099", var_400_19)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_222031", "222031099", "story_v_out_222031.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_222031", "222031099", "story_v_out_222031.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_20 = math.max(var_400_11, arg_397_1.talkMaxDuration)

			if var_400_10 <= arg_397_1.time_ and arg_397_1.time_ < var_400_10 + var_400_20 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_10) / var_400_20

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_10 + var_400_20 and arg_397_1.time_ < var_400_10 + var_400_20 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play222031100 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 222031100
		arg_401_1.duration_ = 4.366

		local var_401_0 = {
			ja = 4.366,
			ko = 2.3,
			zh = 2.3
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
				arg_401_0:Play222031101(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1072ui_story"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.characterEffect1072ui_story == nil then
				arg_401_1.var_.characterEffect1072ui_story = var_404_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_2 = 0.200000002980232

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.characterEffect1072ui_story then
					arg_401_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.characterEffect1072ui_story then
				arg_401_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_404_4 = 0

			if var_404_4 < arg_401_1.time_ and arg_401_1.time_ <= var_404_4 + arg_404_0 then
				arg_401_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_1")
			end

			local var_404_5 = 0

			if var_404_5 < arg_401_1.time_ and arg_401_1.time_ <= var_404_5 + arg_404_0 then
				arg_401_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_404_6 = arg_401_1.actors_["1074ui_story"]
			local var_404_7 = 0

			if var_404_7 < arg_401_1.time_ and arg_401_1.time_ <= var_404_7 + arg_404_0 and arg_401_1.var_.characterEffect1074ui_story == nil then
				arg_401_1.var_.characterEffect1074ui_story = var_404_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_8 = 0.200000002980232

			if var_404_7 <= arg_401_1.time_ and arg_401_1.time_ < var_404_7 + var_404_8 then
				local var_404_9 = (arg_401_1.time_ - var_404_7) / var_404_8

				if arg_401_1.var_.characterEffect1074ui_story then
					local var_404_10 = Mathf.Lerp(0, 0.5, var_404_9)

					arg_401_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1074ui_story.fillRatio = var_404_10
				end
			end

			if arg_401_1.time_ >= var_404_7 + var_404_8 and arg_401_1.time_ < var_404_7 + var_404_8 + arg_404_0 and arg_401_1.var_.characterEffect1074ui_story then
				local var_404_11 = 0.5

				arg_401_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1074ui_story.fillRatio = var_404_11
			end

			local var_404_12 = 0
			local var_404_13 = 0.225

			if var_404_12 < arg_401_1.time_ and arg_401_1.time_ <= var_404_12 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_14 = arg_401_1:FormatText(StoryNameCfg[379].name)

				arg_401_1.leftNameTxt_.text = var_404_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_15 = arg_401_1:GetWordFromCfg(222031100)
				local var_404_16 = arg_401_1:FormatText(var_404_15.content)

				arg_401_1.text_.text = var_404_16

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_17 = 9
				local var_404_18 = utf8.len(var_404_16)
				local var_404_19 = var_404_17 <= 0 and var_404_13 or var_404_13 * (var_404_18 / var_404_17)

				if var_404_19 > 0 and var_404_13 < var_404_19 then
					arg_401_1.talkMaxDuration = var_404_19

					if var_404_19 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_19 + var_404_12
					end
				end

				arg_401_1.text_.text = var_404_16
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031100", "story_v_out_222031.awb") ~= 0 then
					local var_404_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031100", "story_v_out_222031.awb") / 1000

					if var_404_20 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_20 + var_404_12
					end

					if var_404_15.prefab_name ~= "" and arg_401_1.actors_[var_404_15.prefab_name] ~= nil then
						local var_404_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_15.prefab_name].transform, "story_v_out_222031", "222031100", "story_v_out_222031.awb")

						arg_401_1:RecordAudio("222031100", var_404_21)
						arg_401_1:RecordAudio("222031100", var_404_21)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_222031", "222031100", "story_v_out_222031.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_222031", "222031100", "story_v_out_222031.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_22 = math.max(var_404_13, arg_401_1.talkMaxDuration)

			if var_404_12 <= arg_401_1.time_ and arg_401_1.time_ < var_404_12 + var_404_22 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_12) / var_404_22

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_12 + var_404_22 and arg_401_1.time_ < var_404_12 + var_404_22 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play222031101 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 222031101
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play222031102(arg_405_1)
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
				local var_408_4 = Vector3.New(0, 100, 0)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1072ui_story, var_408_4, var_408_3)

				local var_408_5 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_5.x, var_408_5.y, var_408_5.z)

				local var_408_6 = var_408_0.localEulerAngles

				var_408_6.z = 0
				var_408_6.x = 0
				var_408_0.localEulerAngles = var_408_6
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(0, 100, 0)

				local var_408_7 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_7.x, var_408_7.y, var_408_7.z)

				local var_408_8 = var_408_0.localEulerAngles

				var_408_8.z = 0
				var_408_8.x = 0
				var_408_0.localEulerAngles = var_408_8
			end

			local var_408_9 = arg_405_1.actors_["1072ui_story"]
			local var_408_10 = 0

			if var_408_10 < arg_405_1.time_ and arg_405_1.time_ <= var_408_10 + arg_408_0 and arg_405_1.var_.characterEffect1072ui_story == nil then
				arg_405_1.var_.characterEffect1072ui_story = var_408_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_11 = 0.200000002980232

			if var_408_10 <= arg_405_1.time_ and arg_405_1.time_ < var_408_10 + var_408_11 then
				local var_408_12 = (arg_405_1.time_ - var_408_10) / var_408_11

				if arg_405_1.var_.characterEffect1072ui_story then
					local var_408_13 = Mathf.Lerp(0, 0.5, var_408_12)

					arg_405_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_405_1.var_.characterEffect1072ui_story.fillRatio = var_408_13
				end
			end

			if arg_405_1.time_ >= var_408_10 + var_408_11 and arg_405_1.time_ < var_408_10 + var_408_11 + arg_408_0 and arg_405_1.var_.characterEffect1072ui_story then
				local var_408_14 = 0.5

				arg_405_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_405_1.var_.characterEffect1072ui_story.fillRatio = var_408_14
			end

			local var_408_15 = 0
			local var_408_16 = 1.025

			if var_408_15 < arg_405_1.time_ and arg_405_1.time_ <= var_408_15 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_17 = arg_405_1:GetWordFromCfg(222031101)
				local var_408_18 = arg_405_1:FormatText(var_408_17.content)

				arg_405_1.text_.text = var_408_18

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_19 = 41
				local var_408_20 = utf8.len(var_408_18)
				local var_408_21 = var_408_19 <= 0 and var_408_16 or var_408_16 * (var_408_20 / var_408_19)

				if var_408_21 > 0 and var_408_16 < var_408_21 then
					arg_405_1.talkMaxDuration = var_408_21

					if var_408_21 + var_408_15 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_21 + var_408_15
					end
				end

				arg_405_1.text_.text = var_408_18
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_22 = math.max(var_408_16, arg_405_1.talkMaxDuration)

			if var_408_15 <= arg_405_1.time_ and arg_405_1.time_ < var_408_15 + var_408_22 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_15) / var_408_22

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_15 + var_408_22 and arg_405_1.time_ < var_408_15 + var_408_22 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play222031102 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 222031102
		arg_409_1.duration_ = 2.4

		local var_409_0 = {
			ja = 2.4,
			ko = 2.066,
			zh = 2.066
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
				arg_409_0:Play222031103(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1072ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1072ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(-0.7, -0.71, -6)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1072ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["1072ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect1072ui_story == nil then
				arg_409_1.var_.characterEffect1072ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect1072ui_story then
					arg_409_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect1072ui_story then
				arg_409_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_412_13 = 0

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_412_14 = 0

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 then
				arg_409_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_412_15 = 0
			local var_412_16 = 0.1

			if var_412_15 < arg_409_1.time_ and arg_409_1.time_ <= var_412_15 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_17 = arg_409_1:FormatText(StoryNameCfg[379].name)

				arg_409_1.leftNameTxt_.text = var_412_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_18 = arg_409_1:GetWordFromCfg(222031102)
				local var_412_19 = arg_409_1:FormatText(var_412_18.content)

				arg_409_1.text_.text = var_412_19

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_20 = 4
				local var_412_21 = utf8.len(var_412_19)
				local var_412_22 = var_412_20 <= 0 and var_412_16 or var_412_16 * (var_412_21 / var_412_20)

				if var_412_22 > 0 and var_412_16 < var_412_22 then
					arg_409_1.talkMaxDuration = var_412_22

					if var_412_22 + var_412_15 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_22 + var_412_15
					end
				end

				arg_409_1.text_.text = var_412_19
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031102", "story_v_out_222031.awb") ~= 0 then
					local var_412_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031102", "story_v_out_222031.awb") / 1000

					if var_412_23 + var_412_15 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_23 + var_412_15
					end

					if var_412_18.prefab_name ~= "" and arg_409_1.actors_[var_412_18.prefab_name] ~= nil then
						local var_412_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_18.prefab_name].transform, "story_v_out_222031", "222031102", "story_v_out_222031.awb")

						arg_409_1:RecordAudio("222031102", var_412_24)
						arg_409_1:RecordAudio("222031102", var_412_24)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_222031", "222031102", "story_v_out_222031.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_222031", "222031102", "story_v_out_222031.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_25 = math.max(var_412_16, arg_409_1.talkMaxDuration)

			if var_412_15 <= arg_409_1.time_ and arg_409_1.time_ < var_412_15 + var_412_25 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_15) / var_412_25

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_15 + var_412_25 and arg_409_1.time_ < var_412_15 + var_412_25 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play222031103 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 222031103
		arg_413_1.duration_ = 2.6

		local var_413_0 = {
			ja = 2.6,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_413_0:Play222031104(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1074ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect1074ui_story == nil then
				arg_413_1.var_.characterEffect1074ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.200000002980232

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect1074ui_story then
					arg_413_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect1074ui_story then
				arg_413_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_416_4 = 0

			if var_416_4 < arg_413_1.time_ and arg_413_1.time_ <= var_416_4 + arg_416_0 then
				arg_413_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_416_5 = 0

			if var_416_5 < arg_413_1.time_ and arg_413_1.time_ <= var_416_5 + arg_416_0 then
				arg_413_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_416_6 = arg_413_1.actors_["1072ui_story"]
			local var_416_7 = 0

			if var_416_7 < arg_413_1.time_ and arg_413_1.time_ <= var_416_7 + arg_416_0 and arg_413_1.var_.characterEffect1072ui_story == nil then
				arg_413_1.var_.characterEffect1072ui_story = var_416_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_8 = 0.200000002980232

			if var_416_7 <= arg_413_1.time_ and arg_413_1.time_ < var_416_7 + var_416_8 then
				local var_416_9 = (arg_413_1.time_ - var_416_7) / var_416_8

				if arg_413_1.var_.characterEffect1072ui_story then
					local var_416_10 = Mathf.Lerp(0, 0.5, var_416_9)

					arg_413_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1072ui_story.fillRatio = var_416_10
				end
			end

			if arg_413_1.time_ >= var_416_7 + var_416_8 and arg_413_1.time_ < var_416_7 + var_416_8 + arg_416_0 and arg_413_1.var_.characterEffect1072ui_story then
				local var_416_11 = 0.5

				arg_413_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1072ui_story.fillRatio = var_416_11
			end

			local var_416_12 = 0
			local var_416_13 = 0.125

			if var_416_12 < arg_413_1.time_ and arg_413_1.time_ <= var_416_12 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_14 = arg_413_1:FormatText(StoryNameCfg[410].name)

				arg_413_1.leftNameTxt_.text = var_416_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_15 = arg_413_1:GetWordFromCfg(222031103)
				local var_416_16 = arg_413_1:FormatText(var_416_15.content)

				arg_413_1.text_.text = var_416_16

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_17 = 5
				local var_416_18 = utf8.len(var_416_16)
				local var_416_19 = var_416_17 <= 0 and var_416_13 or var_416_13 * (var_416_18 / var_416_17)

				if var_416_19 > 0 and var_416_13 < var_416_19 then
					arg_413_1.talkMaxDuration = var_416_19

					if var_416_19 + var_416_12 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_19 + var_416_12
					end
				end

				arg_413_1.text_.text = var_416_16
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031103", "story_v_out_222031.awb") ~= 0 then
					local var_416_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031103", "story_v_out_222031.awb") / 1000

					if var_416_20 + var_416_12 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_20 + var_416_12
					end

					if var_416_15.prefab_name ~= "" and arg_413_1.actors_[var_416_15.prefab_name] ~= nil then
						local var_416_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_15.prefab_name].transform, "story_v_out_222031", "222031103", "story_v_out_222031.awb")

						arg_413_1:RecordAudio("222031103", var_416_21)
						arg_413_1:RecordAudio("222031103", var_416_21)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_222031", "222031103", "story_v_out_222031.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_222031", "222031103", "story_v_out_222031.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_22 = math.max(var_416_13, arg_413_1.talkMaxDuration)

			if var_416_12 <= arg_413_1.time_ and arg_413_1.time_ < var_416_12 + var_416_22 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_12) / var_416_22

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_12 + var_416_22 and arg_413_1.time_ < var_416_12 + var_416_22 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play222031104 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 222031104
		arg_417_1.duration_ = 12.8

		local var_417_0 = {
			ja = 12.8,
			ko = 9.6,
			zh = 9.6
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
				arg_417_0:Play222031105(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1072ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect1072ui_story == nil then
				arg_417_1.var_.characterEffect1072ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.200000002980232

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect1072ui_story then
					arg_417_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect1072ui_story then
				arg_417_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_420_4 = 0

			if var_420_4 < arg_417_1.time_ and arg_417_1.time_ <= var_420_4 + arg_420_0 then
				arg_417_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_1")
			end

			local var_420_5 = 0

			if var_420_5 < arg_417_1.time_ and arg_417_1.time_ <= var_420_5 + arg_420_0 then
				arg_417_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_420_6 = arg_417_1.actors_["1074ui_story"]
			local var_420_7 = 0

			if var_420_7 < arg_417_1.time_ and arg_417_1.time_ <= var_420_7 + arg_420_0 and arg_417_1.var_.characterEffect1074ui_story == nil then
				arg_417_1.var_.characterEffect1074ui_story = var_420_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_8 = 0.200000002980232

			if var_420_7 <= arg_417_1.time_ and arg_417_1.time_ < var_420_7 + var_420_8 then
				local var_420_9 = (arg_417_1.time_ - var_420_7) / var_420_8

				if arg_417_1.var_.characterEffect1074ui_story then
					local var_420_10 = Mathf.Lerp(0, 0.5, var_420_9)

					arg_417_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1074ui_story.fillRatio = var_420_10
				end
			end

			if arg_417_1.time_ >= var_420_7 + var_420_8 and arg_417_1.time_ < var_420_7 + var_420_8 + arg_420_0 and arg_417_1.var_.characterEffect1074ui_story then
				local var_420_11 = 0.5

				arg_417_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1074ui_story.fillRatio = var_420_11
			end

			local var_420_12 = 0
			local var_420_13 = 1.075

			if var_420_12 < arg_417_1.time_ and arg_417_1.time_ <= var_420_12 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_14 = arg_417_1:FormatText(StoryNameCfg[379].name)

				arg_417_1.leftNameTxt_.text = var_420_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_15 = arg_417_1:GetWordFromCfg(222031104)
				local var_420_16 = arg_417_1:FormatText(var_420_15.content)

				arg_417_1.text_.text = var_420_16

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_17 = 43
				local var_420_18 = utf8.len(var_420_16)
				local var_420_19 = var_420_17 <= 0 and var_420_13 or var_420_13 * (var_420_18 / var_420_17)

				if var_420_19 > 0 and var_420_13 < var_420_19 then
					arg_417_1.talkMaxDuration = var_420_19

					if var_420_19 + var_420_12 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_19 + var_420_12
					end
				end

				arg_417_1.text_.text = var_420_16
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031104", "story_v_out_222031.awb") ~= 0 then
					local var_420_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031104", "story_v_out_222031.awb") / 1000

					if var_420_20 + var_420_12 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_20 + var_420_12
					end

					if var_420_15.prefab_name ~= "" and arg_417_1.actors_[var_420_15.prefab_name] ~= nil then
						local var_420_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_15.prefab_name].transform, "story_v_out_222031", "222031104", "story_v_out_222031.awb")

						arg_417_1:RecordAudio("222031104", var_420_21)
						arg_417_1:RecordAudio("222031104", var_420_21)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_222031", "222031104", "story_v_out_222031.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_222031", "222031104", "story_v_out_222031.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_22 = math.max(var_420_13, arg_417_1.talkMaxDuration)

			if var_420_12 <= arg_417_1.time_ and arg_417_1.time_ < var_420_12 + var_420_22 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_12) / var_420_22

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_12 + var_420_22 and arg_417_1.time_ < var_420_12 + var_420_22 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play222031105 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 222031105
		arg_421_1.duration_ = 18.8

		local var_421_0 = {
			ja = 18.8,
			ko = 10.4,
			zh = 10.4
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
				arg_421_0:Play222031106(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = 0

			if var_424_0 < arg_421_1.time_ and arg_421_1.time_ <= var_424_0 + arg_424_0 then
				arg_421_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_2")
			end

			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_424_2 = 0
			local var_424_3 = 1.325

			if var_424_2 < arg_421_1.time_ and arg_421_1.time_ <= var_424_2 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_4 = arg_421_1:FormatText(StoryNameCfg[379].name)

				arg_421_1.leftNameTxt_.text = var_424_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_5 = arg_421_1:GetWordFromCfg(222031105)
				local var_424_6 = arg_421_1:FormatText(var_424_5.content)

				arg_421_1.text_.text = var_424_6

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_7 = 53
				local var_424_8 = utf8.len(var_424_6)
				local var_424_9 = var_424_7 <= 0 and var_424_3 or var_424_3 * (var_424_8 / var_424_7)

				if var_424_9 > 0 and var_424_3 < var_424_9 then
					arg_421_1.talkMaxDuration = var_424_9

					if var_424_9 + var_424_2 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_9 + var_424_2
					end
				end

				arg_421_1.text_.text = var_424_6
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031105", "story_v_out_222031.awb") ~= 0 then
					local var_424_10 = manager.audio:GetVoiceLength("story_v_out_222031", "222031105", "story_v_out_222031.awb") / 1000

					if var_424_10 + var_424_2 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_10 + var_424_2
					end

					if var_424_5.prefab_name ~= "" and arg_421_1.actors_[var_424_5.prefab_name] ~= nil then
						local var_424_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_5.prefab_name].transform, "story_v_out_222031", "222031105", "story_v_out_222031.awb")

						arg_421_1:RecordAudio("222031105", var_424_11)
						arg_421_1:RecordAudio("222031105", var_424_11)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_222031", "222031105", "story_v_out_222031.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_222031", "222031105", "story_v_out_222031.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_12 = math.max(var_424_3, arg_421_1.talkMaxDuration)

			if var_424_2 <= arg_421_1.time_ and arg_421_1.time_ < var_424_2 + var_424_12 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_2) / var_424_12

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_2 + var_424_12 and arg_421_1.time_ < var_424_2 + var_424_12 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play222031106 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 222031106
		arg_425_1.duration_ = 20.366

		local var_425_0 = {
			ja = 20.366,
			ko = 12.333,
			zh = 12.333
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
				arg_425_0:Play222031107(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0
			local var_428_1 = 1.425

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_2 = arg_425_1:FormatText(StoryNameCfg[379].name)

				arg_425_1.leftNameTxt_.text = var_428_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_3 = arg_425_1:GetWordFromCfg(222031106)
				local var_428_4 = arg_425_1:FormatText(var_428_3.content)

				arg_425_1.text_.text = var_428_4

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_5 = 57
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031106", "story_v_out_222031.awb") ~= 0 then
					local var_428_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031106", "story_v_out_222031.awb") / 1000

					if var_428_8 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_8 + var_428_0
					end

					if var_428_3.prefab_name ~= "" and arg_425_1.actors_[var_428_3.prefab_name] ~= nil then
						local var_428_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_3.prefab_name].transform, "story_v_out_222031", "222031106", "story_v_out_222031.awb")

						arg_425_1:RecordAudio("222031106", var_428_9)
						arg_425_1:RecordAudio("222031106", var_428_9)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_222031", "222031106", "story_v_out_222031.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_222031", "222031106", "story_v_out_222031.awb")
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
	Play222031107 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 222031107
		arg_429_1.duration_ = 4.033

		local var_429_0 = {
			ja = 4.033,
			ko = 3.566,
			zh = 3.566
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
				arg_429_0:Play222031108(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1074ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1074ui_story == nil then
				arg_429_1.var_.characterEffect1074ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.200000002980232

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1074ui_story then
					arg_429_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1074ui_story then
				arg_429_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_432_4 = 0

			if var_432_4 < arg_429_1.time_ and arg_429_1.time_ <= var_432_4 + arg_432_0 then
				arg_429_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_432_5 = 0

			if var_432_5 < arg_429_1.time_ and arg_429_1.time_ <= var_432_5 + arg_432_0 then
				arg_429_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_432_6 = arg_429_1.actors_["1072ui_story"]
			local var_432_7 = 0

			if var_432_7 < arg_429_1.time_ and arg_429_1.time_ <= var_432_7 + arg_432_0 and arg_429_1.var_.characterEffect1072ui_story == nil then
				arg_429_1.var_.characterEffect1072ui_story = var_432_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_8 = 0.200000002980232

			if var_432_7 <= arg_429_1.time_ and arg_429_1.time_ < var_432_7 + var_432_8 then
				local var_432_9 = (arg_429_1.time_ - var_432_7) / var_432_8

				if arg_429_1.var_.characterEffect1072ui_story then
					local var_432_10 = Mathf.Lerp(0, 0.5, var_432_9)

					arg_429_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1072ui_story.fillRatio = var_432_10
				end
			end

			if arg_429_1.time_ >= var_432_7 + var_432_8 and arg_429_1.time_ < var_432_7 + var_432_8 + arg_432_0 and arg_429_1.var_.characterEffect1072ui_story then
				local var_432_11 = 0.5

				arg_429_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1072ui_story.fillRatio = var_432_11
			end

			local var_432_12 = 0
			local var_432_13 = 0.4

			if var_432_12 < arg_429_1.time_ and arg_429_1.time_ <= var_432_12 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_14 = arg_429_1:FormatText(StoryNameCfg[410].name)

				arg_429_1.leftNameTxt_.text = var_432_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_15 = arg_429_1:GetWordFromCfg(222031107)
				local var_432_16 = arg_429_1:FormatText(var_432_15.content)

				arg_429_1.text_.text = var_432_16

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_17 = 16
				local var_432_18 = utf8.len(var_432_16)
				local var_432_19 = var_432_17 <= 0 and var_432_13 or var_432_13 * (var_432_18 / var_432_17)

				if var_432_19 > 0 and var_432_13 < var_432_19 then
					arg_429_1.talkMaxDuration = var_432_19

					if var_432_19 + var_432_12 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_19 + var_432_12
					end
				end

				arg_429_1.text_.text = var_432_16
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031107", "story_v_out_222031.awb") ~= 0 then
					local var_432_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031107", "story_v_out_222031.awb") / 1000

					if var_432_20 + var_432_12 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_20 + var_432_12
					end

					if var_432_15.prefab_name ~= "" and arg_429_1.actors_[var_432_15.prefab_name] ~= nil then
						local var_432_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_15.prefab_name].transform, "story_v_out_222031", "222031107", "story_v_out_222031.awb")

						arg_429_1:RecordAudio("222031107", var_432_21)
						arg_429_1:RecordAudio("222031107", var_432_21)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_222031", "222031107", "story_v_out_222031.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_222031", "222031107", "story_v_out_222031.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_22 = math.max(var_432_13, arg_429_1.talkMaxDuration)

			if var_432_12 <= arg_429_1.time_ and arg_429_1.time_ < var_432_12 + var_432_22 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_12) / var_432_22

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_12 + var_432_22 and arg_429_1.time_ < var_432_12 + var_432_22 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play222031108 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 222031108
		arg_433_1.duration_ = 14.866

		local var_433_0 = {
			ja = 14.866,
			ko = 8.8,
			zh = 8.8
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
				arg_433_0:Play222031109(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1072ui_story"]
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 and arg_433_1.var_.characterEffect1072ui_story == nil then
				arg_433_1.var_.characterEffect1072ui_story = var_436_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_2 = 0.200000002980232

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2

				if arg_433_1.var_.characterEffect1072ui_story then
					arg_433_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 and arg_433_1.var_.characterEffect1072ui_story then
				arg_433_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_436_4 = 0

			if var_436_4 < arg_433_1.time_ and arg_433_1.time_ <= var_436_4 + arg_436_0 then
				arg_433_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_436_5 = 0

			if var_436_5 < arg_433_1.time_ and arg_433_1.time_ <= var_436_5 + arg_436_0 then
				arg_433_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_436_6 = arg_433_1.actors_["1074ui_story"]
			local var_436_7 = 0

			if var_436_7 < arg_433_1.time_ and arg_433_1.time_ <= var_436_7 + arg_436_0 and arg_433_1.var_.characterEffect1074ui_story == nil then
				arg_433_1.var_.characterEffect1074ui_story = var_436_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_8 = 0.200000002980232

			if var_436_7 <= arg_433_1.time_ and arg_433_1.time_ < var_436_7 + var_436_8 then
				local var_436_9 = (arg_433_1.time_ - var_436_7) / var_436_8

				if arg_433_1.var_.characterEffect1074ui_story then
					local var_436_10 = Mathf.Lerp(0, 0.5, var_436_9)

					arg_433_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_433_1.var_.characterEffect1074ui_story.fillRatio = var_436_10
				end
			end

			if arg_433_1.time_ >= var_436_7 + var_436_8 and arg_433_1.time_ < var_436_7 + var_436_8 + arg_436_0 and arg_433_1.var_.characterEffect1074ui_story then
				local var_436_11 = 0.5

				arg_433_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_433_1.var_.characterEffect1074ui_story.fillRatio = var_436_11
			end

			local var_436_12 = 0
			local var_436_13 = 1.1

			if var_436_12 < arg_433_1.time_ and arg_433_1.time_ <= var_436_12 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_14 = arg_433_1:FormatText(StoryNameCfg[379].name)

				arg_433_1.leftNameTxt_.text = var_436_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_15 = arg_433_1:GetWordFromCfg(222031108)
				local var_436_16 = arg_433_1:FormatText(var_436_15.content)

				arg_433_1.text_.text = var_436_16

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_17 = 44
				local var_436_18 = utf8.len(var_436_16)
				local var_436_19 = var_436_17 <= 0 and var_436_13 or var_436_13 * (var_436_18 / var_436_17)

				if var_436_19 > 0 and var_436_13 < var_436_19 then
					arg_433_1.talkMaxDuration = var_436_19

					if var_436_19 + var_436_12 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_19 + var_436_12
					end
				end

				arg_433_1.text_.text = var_436_16
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031108", "story_v_out_222031.awb") ~= 0 then
					local var_436_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031108", "story_v_out_222031.awb") / 1000

					if var_436_20 + var_436_12 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_20 + var_436_12
					end

					if var_436_15.prefab_name ~= "" and arg_433_1.actors_[var_436_15.prefab_name] ~= nil then
						local var_436_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_15.prefab_name].transform, "story_v_out_222031", "222031108", "story_v_out_222031.awb")

						arg_433_1:RecordAudio("222031108", var_436_21)
						arg_433_1:RecordAudio("222031108", var_436_21)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_222031", "222031108", "story_v_out_222031.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_222031", "222031108", "story_v_out_222031.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_22 = math.max(var_436_13, arg_433_1.talkMaxDuration)

			if var_436_12 <= arg_433_1.time_ and arg_433_1.time_ < var_436_12 + var_436_22 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_12) / var_436_22

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_12 + var_436_22 and arg_433_1.time_ < var_436_12 + var_436_22 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play222031109 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 222031109
		arg_437_1.duration_ = 18.566

		local var_437_0 = {
			ja = 18.566,
			ko = 10.133,
			zh = 10.133
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
				arg_437_0:Play222031110(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 1.25

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_2 = arg_437_1:FormatText(StoryNameCfg[379].name)

				arg_437_1.leftNameTxt_.text = var_440_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_3 = arg_437_1:GetWordFromCfg(222031109)
				local var_440_4 = arg_437_1:FormatText(var_440_3.content)

				arg_437_1.text_.text = var_440_4

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031109", "story_v_out_222031.awb") ~= 0 then
					local var_440_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031109", "story_v_out_222031.awb") / 1000

					if var_440_8 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_8 + var_440_0
					end

					if var_440_3.prefab_name ~= "" and arg_437_1.actors_[var_440_3.prefab_name] ~= nil then
						local var_440_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_3.prefab_name].transform, "story_v_out_222031", "222031109", "story_v_out_222031.awb")

						arg_437_1:RecordAudio("222031109", var_440_9)
						arg_437_1:RecordAudio("222031109", var_440_9)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_222031", "222031109", "story_v_out_222031.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_222031", "222031109", "story_v_out_222031.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_10 = math.max(var_440_1, arg_437_1.talkMaxDuration)

			if var_440_0 <= arg_437_1.time_ and arg_437_1.time_ < var_440_0 + var_440_10 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_0) / var_440_10

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_0 + var_440_10 and arg_437_1.time_ < var_440_0 + var_440_10 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play222031110 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 222031110
		arg_441_1.duration_ = 8.366

		local var_441_0 = {
			ja = 8.366,
			ko = 7.333,
			zh = 7.3
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
				arg_441_0:Play222031111(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				arg_441_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 then
				arg_441_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_444_2 = 0
			local var_444_3 = 0.975

			if var_444_2 < arg_441_1.time_ and arg_441_1.time_ <= var_444_2 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_4 = arg_441_1:FormatText(StoryNameCfg[379].name)

				arg_441_1.leftNameTxt_.text = var_444_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_5 = arg_441_1:GetWordFromCfg(222031110)
				local var_444_6 = arg_441_1:FormatText(var_444_5.content)

				arg_441_1.text_.text = var_444_6

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_7 = 39
				local var_444_8 = utf8.len(var_444_6)
				local var_444_9 = var_444_7 <= 0 and var_444_3 or var_444_3 * (var_444_8 / var_444_7)

				if var_444_9 > 0 and var_444_3 < var_444_9 then
					arg_441_1.talkMaxDuration = var_444_9

					if var_444_9 + var_444_2 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_9 + var_444_2
					end
				end

				arg_441_1.text_.text = var_444_6
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031110", "story_v_out_222031.awb") ~= 0 then
					local var_444_10 = manager.audio:GetVoiceLength("story_v_out_222031", "222031110", "story_v_out_222031.awb") / 1000

					if var_444_10 + var_444_2 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_10 + var_444_2
					end

					if var_444_5.prefab_name ~= "" and arg_441_1.actors_[var_444_5.prefab_name] ~= nil then
						local var_444_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_5.prefab_name].transform, "story_v_out_222031", "222031110", "story_v_out_222031.awb")

						arg_441_1:RecordAudio("222031110", var_444_11)
						arg_441_1:RecordAudio("222031110", var_444_11)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_222031", "222031110", "story_v_out_222031.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_222031", "222031110", "story_v_out_222031.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_12 = math.max(var_444_3, arg_441_1.talkMaxDuration)

			if var_444_2 <= arg_441_1.time_ and arg_441_1.time_ < var_444_2 + var_444_12 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_2) / var_444_12

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_2 + var_444_12 and arg_441_1.time_ < var_444_2 + var_444_12 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play222031111 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 222031111
		arg_445_1.duration_ = 2.9

		local var_445_0 = {
			ja = 2.4,
			ko = 2.9,
			zh = 2.9
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
				arg_445_0:Play222031112(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1074ui_story"]
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 and arg_445_1.var_.characterEffect1074ui_story == nil then
				arg_445_1.var_.characterEffect1074ui_story = var_448_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_2 = 0.200000002980232

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2

				if arg_445_1.var_.characterEffect1074ui_story then
					arg_445_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 and arg_445_1.var_.characterEffect1074ui_story then
				arg_445_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_448_4 = 0

			if var_448_4 < arg_445_1.time_ and arg_445_1.time_ <= var_448_4 + arg_448_0 then
				arg_445_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_448_5 = 0

			if var_448_5 < arg_445_1.time_ and arg_445_1.time_ <= var_448_5 + arg_448_0 then
				arg_445_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_448_6 = arg_445_1.actors_["1072ui_story"]
			local var_448_7 = 0

			if var_448_7 < arg_445_1.time_ and arg_445_1.time_ <= var_448_7 + arg_448_0 and arg_445_1.var_.characterEffect1072ui_story == nil then
				arg_445_1.var_.characterEffect1072ui_story = var_448_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_8 = 0.200000002980232

			if var_448_7 <= arg_445_1.time_ and arg_445_1.time_ < var_448_7 + var_448_8 then
				local var_448_9 = (arg_445_1.time_ - var_448_7) / var_448_8

				if arg_445_1.var_.characterEffect1072ui_story then
					local var_448_10 = Mathf.Lerp(0, 0.5, var_448_9)

					arg_445_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_445_1.var_.characterEffect1072ui_story.fillRatio = var_448_10
				end
			end

			if arg_445_1.time_ >= var_448_7 + var_448_8 and arg_445_1.time_ < var_448_7 + var_448_8 + arg_448_0 and arg_445_1.var_.characterEffect1072ui_story then
				local var_448_11 = 0.5

				arg_445_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_445_1.var_.characterEffect1072ui_story.fillRatio = var_448_11
			end

			local var_448_12 = 0
			local var_448_13 = 0.325

			if var_448_12 < arg_445_1.time_ and arg_445_1.time_ <= var_448_12 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_14 = arg_445_1:FormatText(StoryNameCfg[410].name)

				arg_445_1.leftNameTxt_.text = var_448_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_15 = arg_445_1:GetWordFromCfg(222031111)
				local var_448_16 = arg_445_1:FormatText(var_448_15.content)

				arg_445_1.text_.text = var_448_16

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_17 = 13
				local var_448_18 = utf8.len(var_448_16)
				local var_448_19 = var_448_17 <= 0 and var_448_13 or var_448_13 * (var_448_18 / var_448_17)

				if var_448_19 > 0 and var_448_13 < var_448_19 then
					arg_445_1.talkMaxDuration = var_448_19

					if var_448_19 + var_448_12 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_19 + var_448_12
					end
				end

				arg_445_1.text_.text = var_448_16
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031111", "story_v_out_222031.awb") ~= 0 then
					local var_448_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031111", "story_v_out_222031.awb") / 1000

					if var_448_20 + var_448_12 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_20 + var_448_12
					end

					if var_448_15.prefab_name ~= "" and arg_445_1.actors_[var_448_15.prefab_name] ~= nil then
						local var_448_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_15.prefab_name].transform, "story_v_out_222031", "222031111", "story_v_out_222031.awb")

						arg_445_1:RecordAudio("222031111", var_448_21)
						arg_445_1:RecordAudio("222031111", var_448_21)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_222031", "222031111", "story_v_out_222031.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_222031", "222031111", "story_v_out_222031.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_22 = math.max(var_448_13, arg_445_1.talkMaxDuration)

			if var_448_12 <= arg_445_1.time_ and arg_445_1.time_ < var_448_12 + var_448_22 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_12) / var_448_22

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_12 + var_448_22 and arg_445_1.time_ < var_448_12 + var_448_22 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play222031112 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 222031112
		arg_449_1.duration_ = 5.366

		local var_449_0 = {
			ja = 5.366,
			ko = 2.7,
			zh = 2.7
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
				arg_449_0:Play222031113(arg_449_1)
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
					arg_449_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 and arg_449_1.var_.characterEffect1072ui_story then
				arg_449_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_452_4 = 0

			if var_452_4 < arg_449_1.time_ and arg_449_1.time_ <= var_452_4 + arg_452_0 then
				arg_449_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_2")
			end

			local var_452_5 = 0

			if var_452_5 < arg_449_1.time_ and arg_449_1.time_ <= var_452_5 + arg_452_0 then
				arg_449_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_452_6 = arg_449_1.actors_["1074ui_story"]
			local var_452_7 = 0

			if var_452_7 < arg_449_1.time_ and arg_449_1.time_ <= var_452_7 + arg_452_0 and arg_449_1.var_.characterEffect1074ui_story == nil then
				arg_449_1.var_.characterEffect1074ui_story = var_452_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_8 = 0.200000002980232

			if var_452_7 <= arg_449_1.time_ and arg_449_1.time_ < var_452_7 + var_452_8 then
				local var_452_9 = (arg_449_1.time_ - var_452_7) / var_452_8

				if arg_449_1.var_.characterEffect1074ui_story then
					local var_452_10 = Mathf.Lerp(0, 0.5, var_452_9)

					arg_449_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_449_1.var_.characterEffect1074ui_story.fillRatio = var_452_10
				end
			end

			if arg_449_1.time_ >= var_452_7 + var_452_8 and arg_449_1.time_ < var_452_7 + var_452_8 + arg_452_0 and arg_449_1.var_.characterEffect1074ui_story then
				local var_452_11 = 0.5

				arg_449_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_449_1.var_.characterEffect1074ui_story.fillRatio = var_452_11
			end

			local var_452_12 = 0
			local var_452_13 = 0.275

			if var_452_12 < arg_449_1.time_ and arg_449_1.time_ <= var_452_12 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_14 = arg_449_1:FormatText(StoryNameCfg[379].name)

				arg_449_1.leftNameTxt_.text = var_452_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_15 = arg_449_1:GetWordFromCfg(222031112)
				local var_452_16 = arg_449_1:FormatText(var_452_15.content)

				arg_449_1.text_.text = var_452_16

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_17 = 11
				local var_452_18 = utf8.len(var_452_16)
				local var_452_19 = var_452_17 <= 0 and var_452_13 or var_452_13 * (var_452_18 / var_452_17)

				if var_452_19 > 0 and var_452_13 < var_452_19 then
					arg_449_1.talkMaxDuration = var_452_19

					if var_452_19 + var_452_12 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_19 + var_452_12
					end
				end

				arg_449_1.text_.text = var_452_16
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031112", "story_v_out_222031.awb") ~= 0 then
					local var_452_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031112", "story_v_out_222031.awb") / 1000

					if var_452_20 + var_452_12 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_20 + var_452_12
					end

					if var_452_15.prefab_name ~= "" and arg_449_1.actors_[var_452_15.prefab_name] ~= nil then
						local var_452_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_15.prefab_name].transform, "story_v_out_222031", "222031112", "story_v_out_222031.awb")

						arg_449_1:RecordAudio("222031112", var_452_21)
						arg_449_1:RecordAudio("222031112", var_452_21)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_222031", "222031112", "story_v_out_222031.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_222031", "222031112", "story_v_out_222031.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_22 = math.max(var_452_13, arg_449_1.talkMaxDuration)

			if var_452_12 <= arg_449_1.time_ and arg_449_1.time_ < var_452_12 + var_452_22 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_12) / var_452_22

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_12 + var_452_22 and arg_449_1.time_ < var_452_12 + var_452_22 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play222031113 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 222031113
		arg_453_1.duration_ = 21.033

		local var_453_0 = {
			ja = 21.033,
			ko = 10.533,
			zh = 10.533
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
				arg_453_0:Play222031114(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = 0
			local var_456_1 = 1.1

			if var_456_0 < arg_453_1.time_ and arg_453_1.time_ <= var_456_0 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_2 = arg_453_1:FormatText(StoryNameCfg[379].name)

				arg_453_1.leftNameTxt_.text = var_456_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_3 = arg_453_1:GetWordFromCfg(222031113)
				local var_456_4 = arg_453_1:FormatText(var_456_3.content)

				arg_453_1.text_.text = var_456_4

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_5 = 44
				local var_456_6 = utf8.len(var_456_4)
				local var_456_7 = var_456_5 <= 0 and var_456_1 or var_456_1 * (var_456_6 / var_456_5)

				if var_456_7 > 0 and var_456_1 < var_456_7 then
					arg_453_1.talkMaxDuration = var_456_7

					if var_456_7 + var_456_0 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_7 + var_456_0
					end
				end

				arg_453_1.text_.text = var_456_4
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031113", "story_v_out_222031.awb") ~= 0 then
					local var_456_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031113", "story_v_out_222031.awb") / 1000

					if var_456_8 + var_456_0 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_8 + var_456_0
					end

					if var_456_3.prefab_name ~= "" and arg_453_1.actors_[var_456_3.prefab_name] ~= nil then
						local var_456_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_3.prefab_name].transform, "story_v_out_222031", "222031113", "story_v_out_222031.awb")

						arg_453_1:RecordAudio("222031113", var_456_9)
						arg_453_1:RecordAudio("222031113", var_456_9)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_222031", "222031113", "story_v_out_222031.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_222031", "222031113", "story_v_out_222031.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_10 = math.max(var_456_1, arg_453_1.talkMaxDuration)

			if var_456_0 <= arg_453_1.time_ and arg_453_1.time_ < var_456_0 + var_456_10 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_0) / var_456_10

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_0 + var_456_10 and arg_453_1.time_ < var_456_0 + var_456_10 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play222031114 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 222031114
		arg_457_1.duration_ = 11.533

		local var_457_0 = {
			ja = 11.533,
			ko = 5,
			zh = 5.066
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
				arg_457_0:Play222031115(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1074ui_story"]
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 and arg_457_1.var_.characterEffect1074ui_story == nil then
				arg_457_1.var_.characterEffect1074ui_story = var_460_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_2 = 0.200000002980232

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2

				if arg_457_1.var_.characterEffect1074ui_story then
					arg_457_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 and arg_457_1.var_.characterEffect1074ui_story then
				arg_457_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_460_4 = 0

			if var_460_4 < arg_457_1.time_ and arg_457_1.time_ <= var_460_4 + arg_460_0 then
				arg_457_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_460_5 = 0

			if var_460_5 < arg_457_1.time_ and arg_457_1.time_ <= var_460_5 + arg_460_0 then
				arg_457_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_460_6 = arg_457_1.actors_["1072ui_story"]
			local var_460_7 = 0

			if var_460_7 < arg_457_1.time_ and arg_457_1.time_ <= var_460_7 + arg_460_0 and arg_457_1.var_.characterEffect1072ui_story == nil then
				arg_457_1.var_.characterEffect1072ui_story = var_460_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_8 = 0.200000002980232

			if var_460_7 <= arg_457_1.time_ and arg_457_1.time_ < var_460_7 + var_460_8 then
				local var_460_9 = (arg_457_1.time_ - var_460_7) / var_460_8

				if arg_457_1.var_.characterEffect1072ui_story then
					local var_460_10 = Mathf.Lerp(0, 0.5, var_460_9)

					arg_457_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_457_1.var_.characterEffect1072ui_story.fillRatio = var_460_10
				end
			end

			if arg_457_1.time_ >= var_460_7 + var_460_8 and arg_457_1.time_ < var_460_7 + var_460_8 + arg_460_0 and arg_457_1.var_.characterEffect1072ui_story then
				local var_460_11 = 0.5

				arg_457_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_457_1.var_.characterEffect1072ui_story.fillRatio = var_460_11
			end

			local var_460_12 = 0
			local var_460_13 = 0.675

			if var_460_12 < arg_457_1.time_ and arg_457_1.time_ <= var_460_12 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_14 = arg_457_1:FormatText(StoryNameCfg[410].name)

				arg_457_1.leftNameTxt_.text = var_460_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_15 = arg_457_1:GetWordFromCfg(222031114)
				local var_460_16 = arg_457_1:FormatText(var_460_15.content)

				arg_457_1.text_.text = var_460_16

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_17 = 27
				local var_460_18 = utf8.len(var_460_16)
				local var_460_19 = var_460_17 <= 0 and var_460_13 or var_460_13 * (var_460_18 / var_460_17)

				if var_460_19 > 0 and var_460_13 < var_460_19 then
					arg_457_1.talkMaxDuration = var_460_19

					if var_460_19 + var_460_12 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_19 + var_460_12
					end
				end

				arg_457_1.text_.text = var_460_16
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031114", "story_v_out_222031.awb") ~= 0 then
					local var_460_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031114", "story_v_out_222031.awb") / 1000

					if var_460_20 + var_460_12 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_20 + var_460_12
					end

					if var_460_15.prefab_name ~= "" and arg_457_1.actors_[var_460_15.prefab_name] ~= nil then
						local var_460_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_15.prefab_name].transform, "story_v_out_222031", "222031114", "story_v_out_222031.awb")

						arg_457_1:RecordAudio("222031114", var_460_21)
						arg_457_1:RecordAudio("222031114", var_460_21)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_222031", "222031114", "story_v_out_222031.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_222031", "222031114", "story_v_out_222031.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_22 = math.max(var_460_13, arg_457_1.talkMaxDuration)

			if var_460_12 <= arg_457_1.time_ and arg_457_1.time_ < var_460_12 + var_460_22 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_12) / var_460_22

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_12 + var_460_22 and arg_457_1.time_ < var_460_12 + var_460_22 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play222031115 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 222031115
		arg_461_1.duration_ = 11.066

		local var_461_0 = {
			ja = 11.066,
			ko = 7.5,
			zh = 7.5
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
				arg_461_0:Play222031116(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1072ui_story"]
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 and arg_461_1.var_.characterEffect1072ui_story == nil then
				arg_461_1.var_.characterEffect1072ui_story = var_464_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_2 = 0.200000002980232

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2

				if arg_461_1.var_.characterEffect1072ui_story then
					arg_461_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 and arg_461_1.var_.characterEffect1072ui_story then
				arg_461_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_464_4 = arg_461_1.actors_["1074ui_story"]
			local var_464_5 = 0

			if var_464_5 < arg_461_1.time_ and arg_461_1.time_ <= var_464_5 + arg_464_0 and arg_461_1.var_.characterEffect1074ui_story == nil then
				arg_461_1.var_.characterEffect1074ui_story = var_464_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_6 = 0.200000002980232

			if var_464_5 <= arg_461_1.time_ and arg_461_1.time_ < var_464_5 + var_464_6 then
				local var_464_7 = (arg_461_1.time_ - var_464_5) / var_464_6

				if arg_461_1.var_.characterEffect1074ui_story then
					local var_464_8 = Mathf.Lerp(0, 0.5, var_464_7)

					arg_461_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_461_1.var_.characterEffect1074ui_story.fillRatio = var_464_8
				end
			end

			if arg_461_1.time_ >= var_464_5 + var_464_6 and arg_461_1.time_ < var_464_5 + var_464_6 + arg_464_0 and arg_461_1.var_.characterEffect1074ui_story then
				local var_464_9 = 0.5

				arg_461_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_461_1.var_.characterEffect1074ui_story.fillRatio = var_464_9
			end

			local var_464_10 = 0
			local var_464_11 = 0.825

			if var_464_10 < arg_461_1.time_ and arg_461_1.time_ <= var_464_10 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_12 = arg_461_1:FormatText(StoryNameCfg[379].name)

				arg_461_1.leftNameTxt_.text = var_464_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_13 = arg_461_1:GetWordFromCfg(222031115)
				local var_464_14 = arg_461_1:FormatText(var_464_13.content)

				arg_461_1.text_.text = var_464_14

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_15 = 33
				local var_464_16 = utf8.len(var_464_14)
				local var_464_17 = var_464_15 <= 0 and var_464_11 or var_464_11 * (var_464_16 / var_464_15)

				if var_464_17 > 0 and var_464_11 < var_464_17 then
					arg_461_1.talkMaxDuration = var_464_17

					if var_464_17 + var_464_10 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_17 + var_464_10
					end
				end

				arg_461_1.text_.text = var_464_14
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031115", "story_v_out_222031.awb") ~= 0 then
					local var_464_18 = manager.audio:GetVoiceLength("story_v_out_222031", "222031115", "story_v_out_222031.awb") / 1000

					if var_464_18 + var_464_10 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_18 + var_464_10
					end

					if var_464_13.prefab_name ~= "" and arg_461_1.actors_[var_464_13.prefab_name] ~= nil then
						local var_464_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_13.prefab_name].transform, "story_v_out_222031", "222031115", "story_v_out_222031.awb")

						arg_461_1:RecordAudio("222031115", var_464_19)
						arg_461_1:RecordAudio("222031115", var_464_19)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_222031", "222031115", "story_v_out_222031.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_222031", "222031115", "story_v_out_222031.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_20 = math.max(var_464_11, arg_461_1.talkMaxDuration)

			if var_464_10 <= arg_461_1.time_ and arg_461_1.time_ < var_464_10 + var_464_20 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_10) / var_464_20

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_10 + var_464_20 and arg_461_1.time_ < var_464_10 + var_464_20 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play222031116 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 222031116
		arg_465_1.duration_ = 6.666

		local var_465_0 = {
			ja = 6.666,
			ko = 5.1,
			zh = 5.1
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
				arg_465_0:Play222031117(arg_465_1)
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

				local var_468_2 = arg_465_1:FormatText(StoryNameCfg[379].name)

				arg_465_1.leftNameTxt_.text = var_468_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_3 = arg_465_1:GetWordFromCfg(222031116)
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031116", "story_v_out_222031.awb") ~= 0 then
					local var_468_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031116", "story_v_out_222031.awb") / 1000

					if var_468_8 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_8 + var_468_0
					end

					if var_468_3.prefab_name ~= "" and arg_465_1.actors_[var_468_3.prefab_name] ~= nil then
						local var_468_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_3.prefab_name].transform, "story_v_out_222031", "222031116", "story_v_out_222031.awb")

						arg_465_1:RecordAudio("222031116", var_468_9)
						arg_465_1:RecordAudio("222031116", var_468_9)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_222031", "222031116", "story_v_out_222031.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_222031", "222031116", "story_v_out_222031.awb")
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
	Play222031117 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 222031117
		arg_469_1.duration_ = 9.333

		local var_469_0 = {
			ja = 9.333,
			ko = 7.2,
			zh = 7.2
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
				arg_469_0:Play222031118(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1074ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect1074ui_story == nil then
				arg_469_1.var_.characterEffect1074ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1074ui_story then
					arg_469_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect1074ui_story then
				arg_469_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_472_4 = arg_469_1.actors_["1072ui_story"]
			local var_472_5 = 0

			if var_472_5 < arg_469_1.time_ and arg_469_1.time_ <= var_472_5 + arg_472_0 and arg_469_1.var_.characterEffect1072ui_story == nil then
				arg_469_1.var_.characterEffect1072ui_story = var_472_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_6 = 0.200000002980232

			if var_472_5 <= arg_469_1.time_ and arg_469_1.time_ < var_472_5 + var_472_6 then
				local var_472_7 = (arg_469_1.time_ - var_472_5) / var_472_6

				if arg_469_1.var_.characterEffect1072ui_story then
					local var_472_8 = Mathf.Lerp(0, 0.5, var_472_7)

					arg_469_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_469_1.var_.characterEffect1072ui_story.fillRatio = var_472_8
				end
			end

			if arg_469_1.time_ >= var_472_5 + var_472_6 and arg_469_1.time_ < var_472_5 + var_472_6 + arg_472_0 and arg_469_1.var_.characterEffect1072ui_story then
				local var_472_9 = 0.5

				arg_469_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_469_1.var_.characterEffect1072ui_story.fillRatio = var_472_9
			end

			local var_472_10 = 0
			local var_472_11 = 0.8

			if var_472_10 < arg_469_1.time_ and arg_469_1.time_ <= var_472_10 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_12 = arg_469_1:FormatText(StoryNameCfg[410].name)

				arg_469_1.leftNameTxt_.text = var_472_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_13 = arg_469_1:GetWordFromCfg(222031117)
				local var_472_14 = arg_469_1:FormatText(var_472_13.content)

				arg_469_1.text_.text = var_472_14

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_15 = 32
				local var_472_16 = utf8.len(var_472_14)
				local var_472_17 = var_472_15 <= 0 and var_472_11 or var_472_11 * (var_472_16 / var_472_15)

				if var_472_17 > 0 and var_472_11 < var_472_17 then
					arg_469_1.talkMaxDuration = var_472_17

					if var_472_17 + var_472_10 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_17 + var_472_10
					end
				end

				arg_469_1.text_.text = var_472_14
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031117", "story_v_out_222031.awb") ~= 0 then
					local var_472_18 = manager.audio:GetVoiceLength("story_v_out_222031", "222031117", "story_v_out_222031.awb") / 1000

					if var_472_18 + var_472_10 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_18 + var_472_10
					end

					if var_472_13.prefab_name ~= "" and arg_469_1.actors_[var_472_13.prefab_name] ~= nil then
						local var_472_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_13.prefab_name].transform, "story_v_out_222031", "222031117", "story_v_out_222031.awb")

						arg_469_1:RecordAudio("222031117", var_472_19)
						arg_469_1:RecordAudio("222031117", var_472_19)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_222031", "222031117", "story_v_out_222031.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_222031", "222031117", "story_v_out_222031.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_20 = math.max(var_472_11, arg_469_1.talkMaxDuration)

			if var_472_10 <= arg_469_1.time_ and arg_469_1.time_ < var_472_10 + var_472_20 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_10) / var_472_20

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_10 + var_472_20 and arg_469_1.time_ < var_472_10 + var_472_20 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play222031118 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 222031118
		arg_473_1.duration_ = 20.266

		local var_473_0 = {
			ja = 20.266,
			ko = 9.566,
			zh = 9.566
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
				arg_473_0:Play222031119(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1072ui_story"]
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 and arg_473_1.var_.characterEffect1072ui_story == nil then
				arg_473_1.var_.characterEffect1072ui_story = var_476_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_2 = 0.200000002980232

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2

				if arg_473_1.var_.characterEffect1072ui_story then
					arg_473_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 and arg_473_1.var_.characterEffect1072ui_story then
				arg_473_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_476_4 = arg_473_1.actors_["1074ui_story"]
			local var_476_5 = 0

			if var_476_5 < arg_473_1.time_ and arg_473_1.time_ <= var_476_5 + arg_476_0 and arg_473_1.var_.characterEffect1074ui_story == nil then
				arg_473_1.var_.characterEffect1074ui_story = var_476_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_6 = 0.200000002980232

			if var_476_5 <= arg_473_1.time_ and arg_473_1.time_ < var_476_5 + var_476_6 then
				local var_476_7 = (arg_473_1.time_ - var_476_5) / var_476_6

				if arg_473_1.var_.characterEffect1074ui_story then
					local var_476_8 = Mathf.Lerp(0, 0.5, var_476_7)

					arg_473_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_473_1.var_.characterEffect1074ui_story.fillRatio = var_476_8
				end
			end

			if arg_473_1.time_ >= var_476_5 + var_476_6 and arg_473_1.time_ < var_476_5 + var_476_6 + arg_476_0 and arg_473_1.var_.characterEffect1074ui_story then
				local var_476_9 = 0.5

				arg_473_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_473_1.var_.characterEffect1074ui_story.fillRatio = var_476_9
			end

			local var_476_10 = 0
			local var_476_11 = 1.25

			if var_476_10 < arg_473_1.time_ and arg_473_1.time_ <= var_476_10 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_12 = arg_473_1:FormatText(StoryNameCfg[379].name)

				arg_473_1.leftNameTxt_.text = var_476_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_13 = arg_473_1:GetWordFromCfg(222031118)
				local var_476_14 = arg_473_1:FormatText(var_476_13.content)

				arg_473_1.text_.text = var_476_14

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_15 = 51
				local var_476_16 = utf8.len(var_476_14)
				local var_476_17 = var_476_15 <= 0 and var_476_11 or var_476_11 * (var_476_16 / var_476_15)

				if var_476_17 > 0 and var_476_11 < var_476_17 then
					arg_473_1.talkMaxDuration = var_476_17

					if var_476_17 + var_476_10 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_17 + var_476_10
					end
				end

				arg_473_1.text_.text = var_476_14
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031118", "story_v_out_222031.awb") ~= 0 then
					local var_476_18 = manager.audio:GetVoiceLength("story_v_out_222031", "222031118", "story_v_out_222031.awb") / 1000

					if var_476_18 + var_476_10 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_18 + var_476_10
					end

					if var_476_13.prefab_name ~= "" and arg_473_1.actors_[var_476_13.prefab_name] ~= nil then
						local var_476_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_13.prefab_name].transform, "story_v_out_222031", "222031118", "story_v_out_222031.awb")

						arg_473_1:RecordAudio("222031118", var_476_19)
						arg_473_1:RecordAudio("222031118", var_476_19)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_222031", "222031118", "story_v_out_222031.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_222031", "222031118", "story_v_out_222031.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_20 = math.max(var_476_11, arg_473_1.talkMaxDuration)

			if var_476_10 <= arg_473_1.time_ and arg_473_1.time_ < var_476_10 + var_476_20 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_10) / var_476_20

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_10 + var_476_20 and arg_473_1.time_ < var_476_10 + var_476_20 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play222031119 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 222031119
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play222031120(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1072ui_story"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos1072ui_story = var_480_0.localPosition
			end

			local var_480_2 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2
				local var_480_4 = Vector3.New(0, 100, 0)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1072ui_story, var_480_4, var_480_3)

				local var_480_5 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_5.x, var_480_5.y, var_480_5.z)

				local var_480_6 = var_480_0.localEulerAngles

				var_480_6.z = 0
				var_480_6.x = 0
				var_480_0.localEulerAngles = var_480_6
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 then
				var_480_0.localPosition = Vector3.New(0, 100, 0)

				local var_480_7 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_7.x, var_480_7.y, var_480_7.z)

				local var_480_8 = var_480_0.localEulerAngles

				var_480_8.z = 0
				var_480_8.x = 0
				var_480_0.localEulerAngles = var_480_8
			end

			local var_480_9 = arg_477_1.actors_["1072ui_story"]
			local var_480_10 = 0

			if var_480_10 < arg_477_1.time_ and arg_477_1.time_ <= var_480_10 + arg_480_0 and arg_477_1.var_.characterEffect1072ui_story == nil then
				arg_477_1.var_.characterEffect1072ui_story = var_480_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_11 = 0.200000002980232

			if var_480_10 <= arg_477_1.time_ and arg_477_1.time_ < var_480_10 + var_480_11 then
				local var_480_12 = (arg_477_1.time_ - var_480_10) / var_480_11

				if arg_477_1.var_.characterEffect1072ui_story then
					local var_480_13 = Mathf.Lerp(0, 0.5, var_480_12)

					arg_477_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_477_1.var_.characterEffect1072ui_story.fillRatio = var_480_13
				end
			end

			if arg_477_1.time_ >= var_480_10 + var_480_11 and arg_477_1.time_ < var_480_10 + var_480_11 + arg_480_0 and arg_477_1.var_.characterEffect1072ui_story then
				local var_480_14 = 0.5

				arg_477_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_477_1.var_.characterEffect1072ui_story.fillRatio = var_480_14
			end

			local var_480_15 = arg_477_1.actors_["1074ui_story"].transform
			local var_480_16 = 0

			if var_480_16 < arg_477_1.time_ and arg_477_1.time_ <= var_480_16 + arg_480_0 then
				arg_477_1.var_.moveOldPos1074ui_story = var_480_15.localPosition
			end

			local var_480_17 = 0.001

			if var_480_16 <= arg_477_1.time_ and arg_477_1.time_ < var_480_16 + var_480_17 then
				local var_480_18 = (arg_477_1.time_ - var_480_16) / var_480_17
				local var_480_19 = Vector3.New(0, 100, 0)

				var_480_15.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1074ui_story, var_480_19, var_480_18)

				local var_480_20 = manager.ui.mainCamera.transform.position - var_480_15.position

				var_480_15.forward = Vector3.New(var_480_20.x, var_480_20.y, var_480_20.z)

				local var_480_21 = var_480_15.localEulerAngles

				var_480_21.z = 0
				var_480_21.x = 0
				var_480_15.localEulerAngles = var_480_21
			end

			if arg_477_1.time_ >= var_480_16 + var_480_17 and arg_477_1.time_ < var_480_16 + var_480_17 + arg_480_0 then
				var_480_15.localPosition = Vector3.New(0, 100, 0)

				local var_480_22 = manager.ui.mainCamera.transform.position - var_480_15.position

				var_480_15.forward = Vector3.New(var_480_22.x, var_480_22.y, var_480_22.z)

				local var_480_23 = var_480_15.localEulerAngles

				var_480_23.z = 0
				var_480_23.x = 0
				var_480_15.localEulerAngles = var_480_23
			end

			local var_480_24 = arg_477_1.actors_["1074ui_story"]
			local var_480_25 = 0

			if var_480_25 < arg_477_1.time_ and arg_477_1.time_ <= var_480_25 + arg_480_0 and arg_477_1.var_.characterEffect1074ui_story == nil then
				arg_477_1.var_.characterEffect1074ui_story = var_480_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_26 = 0.200000002980232

			if var_480_25 <= arg_477_1.time_ and arg_477_1.time_ < var_480_25 + var_480_26 then
				local var_480_27 = (arg_477_1.time_ - var_480_25) / var_480_26

				if arg_477_1.var_.characterEffect1074ui_story then
					local var_480_28 = Mathf.Lerp(0, 0.5, var_480_27)

					arg_477_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_477_1.var_.characterEffect1074ui_story.fillRatio = var_480_28
				end
			end

			if arg_477_1.time_ >= var_480_25 + var_480_26 and arg_477_1.time_ < var_480_25 + var_480_26 + arg_480_0 and arg_477_1.var_.characterEffect1074ui_story then
				local var_480_29 = 0.5

				arg_477_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_477_1.var_.characterEffect1074ui_story.fillRatio = var_480_29
			end

			local var_480_30 = 0
			local var_480_31 = 0.95

			if var_480_30 < arg_477_1.time_ and arg_477_1.time_ <= var_480_30 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, false)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_32 = arg_477_1:GetWordFromCfg(222031119)
				local var_480_33 = arg_477_1:FormatText(var_480_32.content)

				arg_477_1.text_.text = var_480_33

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_34 = 38
				local var_480_35 = utf8.len(var_480_33)
				local var_480_36 = var_480_34 <= 0 and var_480_31 or var_480_31 * (var_480_35 / var_480_34)

				if var_480_36 > 0 and var_480_31 < var_480_36 then
					arg_477_1.talkMaxDuration = var_480_36

					if var_480_36 + var_480_30 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_36 + var_480_30
					end
				end

				arg_477_1.text_.text = var_480_33
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_37 = math.max(var_480_31, arg_477_1.talkMaxDuration)

			if var_480_30 <= arg_477_1.time_ and arg_477_1.time_ < var_480_30 + var_480_37 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_30) / var_480_37

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_30 + var_480_37 and arg_477_1.time_ < var_480_30 + var_480_37 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play222031120 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 222031120
		arg_481_1.duration_ = 5

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play222031121(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0
			local var_484_1 = 1.225

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

				local var_484_2 = arg_481_1:GetWordFromCfg(222031120)
				local var_484_3 = arg_481_1:FormatText(var_484_2.content)

				arg_481_1.text_.text = var_484_3

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_4 = 49
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
	Play222031121 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 222031121
		arg_485_1.duration_ = 23.5

		local var_485_0 = {
			ja = 23.5,
			ko = 16.666,
			zh = 16.733
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
				arg_485_0:Play222031122(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 2

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				local var_488_1 = manager.ui.mainCamera.transform.localPosition
				local var_488_2 = Vector3.New(0, 0, 10) + Vector3.New(var_488_1.x, var_488_1.y, 0)
				local var_488_3 = arg_485_1.bgs_.ST31a

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
					if iter_488_0 ~= "ST31a" then
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

			local var_488_25 = 2

			if var_488_25 < arg_485_1.time_ and arg_485_1.time_ <= var_488_25 + arg_488_0 then
				arg_485_1.screenFilterGo_:SetActive(true)

				arg_485_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_488_26 = 0.1

			if var_488_25 <= arg_485_1.time_ and arg_485_1.time_ < var_488_25 + var_488_26 then
				local var_488_27 = (arg_485_1.time_ - var_488_25) / var_488_26

				arg_485_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_488_27)
			end

			if arg_485_1.time_ >= var_488_25 + var_488_26 and arg_485_1.time_ < var_488_25 + var_488_26 + arg_488_0 then
				arg_485_1.screenFilterEffect_.weight = 1
			end

			if arg_485_1.frameCnt_ <= 1 then
				arg_485_1.dialog_:SetActive(false)
			end

			local var_488_28 = 4
			local var_488_29 = 0.975

			if var_488_28 < arg_485_1.time_ and arg_485_1.time_ <= var_488_28 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0

				arg_485_1.dialog_:SetActive(true)

				local var_488_30 = LeanTween.value(arg_485_1.dialog_, 0, 1, 0.3)

				var_488_30:setOnUpdate(LuaHelper.FloatAction(function(arg_489_0)
					arg_485_1.dialogCg_.alpha = arg_489_0
				end))
				var_488_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_485_1.dialog_)
					var_488_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_485_1.duration_ = arg_485_1.duration_ + 0.3

				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_31 = arg_485_1:FormatText(StoryNameCfg[462].name)

				arg_485_1.leftNameTxt_.text = var_488_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, true)
				arg_485_1.iconController_:SetSelectedState("hero")

				arg_485_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_32 = arg_485_1:GetWordFromCfg(222031121)
				local var_488_33 = arg_485_1:FormatText(var_488_32.content)

				arg_485_1.text_.text = var_488_33

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_34 = 39
				local var_488_35 = utf8.len(var_488_33)
				local var_488_36 = var_488_34 <= 0 and var_488_29 or var_488_29 * (var_488_35 / var_488_34)

				if var_488_36 > 0 and var_488_29 < var_488_36 then
					arg_485_1.talkMaxDuration = var_488_36
					var_488_28 = var_488_28 + 0.3

					if var_488_36 + var_488_28 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_36 + var_488_28
					end
				end

				arg_485_1.text_.text = var_488_33
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031121", "story_v_out_222031.awb") ~= 0 then
					local var_488_37 = manager.audio:GetVoiceLength("story_v_out_222031", "222031121", "story_v_out_222031.awb") / 1000

					if var_488_37 + var_488_28 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_37 + var_488_28
					end

					if var_488_32.prefab_name ~= "" and arg_485_1.actors_[var_488_32.prefab_name] ~= nil then
						local var_488_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_32.prefab_name].transform, "story_v_out_222031", "222031121", "story_v_out_222031.awb")

						arg_485_1:RecordAudio("222031121", var_488_38)
						arg_485_1:RecordAudio("222031121", var_488_38)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_222031", "222031121", "story_v_out_222031.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_222031", "222031121", "story_v_out_222031.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_39 = var_488_28 + 0.3
			local var_488_40 = math.max(var_488_29, arg_485_1.talkMaxDuration)

			if var_488_39 <= arg_485_1.time_ and arg_485_1.time_ < var_488_39 + var_488_40 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_39) / var_488_40

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_39 + var_488_40 and arg_485_1.time_ < var_488_39 + var_488_40 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play222031122 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 222031122
		arg_491_1.duration_ = 16.233

		local var_491_0 = {
			ja = 16.233,
			ko = 4.833,
			zh = 4.833
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
				arg_491_0:Play222031123(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0
			local var_494_1 = 0.4

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_2 = arg_491_1:FormatText(StoryNameCfg[462].name)

				arg_491_1.leftNameTxt_.text = var_494_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, true)
				arg_491_1.iconController_:SetSelectedState("hero")

				arg_491_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_3 = arg_491_1:GetWordFromCfg(222031122)
				local var_494_4 = arg_491_1:FormatText(var_494_3.content)

				arg_491_1.text_.text = var_494_4

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_5 = 16
				local var_494_6 = utf8.len(var_494_4)
				local var_494_7 = var_494_5 <= 0 and var_494_1 or var_494_1 * (var_494_6 / var_494_5)

				if var_494_7 > 0 and var_494_1 < var_494_7 then
					arg_491_1.talkMaxDuration = var_494_7

					if var_494_7 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_7 + var_494_0
					end
				end

				arg_491_1.text_.text = var_494_4
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031122", "story_v_out_222031.awb") ~= 0 then
					local var_494_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031122", "story_v_out_222031.awb") / 1000

					if var_494_8 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_8 + var_494_0
					end

					if var_494_3.prefab_name ~= "" and arg_491_1.actors_[var_494_3.prefab_name] ~= nil then
						local var_494_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_3.prefab_name].transform, "story_v_out_222031", "222031122", "story_v_out_222031.awb")

						arg_491_1:RecordAudio("222031122", var_494_9)
						arg_491_1:RecordAudio("222031122", var_494_9)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_222031", "222031122", "story_v_out_222031.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_222031", "222031122", "story_v_out_222031.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_10 = math.max(var_494_1, arg_491_1.talkMaxDuration)

			if var_494_0 <= arg_491_1.time_ and arg_491_1.time_ < var_494_0 + var_494_10 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_0) / var_494_10

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_0 + var_494_10 and arg_491_1.time_ < var_494_0 + var_494_10 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play222031123 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 222031123
		arg_495_1.duration_ = 13.7000000029802

		local var_495_0 = {
			ja = 13.7000000029802,
			ko = 12.4000000029802,
			zh = 12.4330000029802
		}
		local var_495_1 = manager.audio:GetLocalizationFlag()

		if var_495_0[var_495_1] ~= nil then
			arg_495_1.duration_ = var_495_0[var_495_1]
		end

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play222031124(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1072ui_story"]
			local var_498_1 = 3.8

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1072ui_story == nil then
				arg_495_1.var_.characterEffect1072ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.200000002980232

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1072ui_story then
					local var_498_4 = Mathf.Lerp(0, 0.5, var_498_3)

					arg_495_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_495_1.var_.characterEffect1072ui_story.fillRatio = var_498_4
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1072ui_story then
				local var_498_5 = 0.5

				arg_495_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_495_1.var_.characterEffect1072ui_story.fillRatio = var_498_5
			end

			local var_498_6 = arg_495_1.actors_["1074ui_story"]
			local var_498_7 = 3.8

			if var_498_7 < arg_495_1.time_ and arg_495_1.time_ <= var_498_7 + arg_498_0 and arg_495_1.var_.characterEffect1074ui_story == nil then
				arg_495_1.var_.characterEffect1074ui_story = var_498_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_8 = 0.200000002980232

			if var_498_7 <= arg_495_1.time_ and arg_495_1.time_ < var_498_7 + var_498_8 then
				local var_498_9 = (arg_495_1.time_ - var_498_7) / var_498_8

				if arg_495_1.var_.characterEffect1074ui_story then
					arg_495_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_495_1.time_ >= var_498_7 + var_498_8 and arg_495_1.time_ < var_498_7 + var_498_8 + arg_498_0 and arg_495_1.var_.characterEffect1074ui_story then
				arg_495_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_498_10 = 3.8

			if var_498_10 < arg_495_1.time_ and arg_495_1.time_ <= var_498_10 + arg_498_0 then
				arg_495_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_498_11 = 3.8

			if var_498_11 < arg_495_1.time_ and arg_495_1.time_ <= var_498_11 + arg_498_0 then
				arg_495_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_498_12 = 0

			if var_498_12 < arg_495_1.time_ and arg_495_1.time_ <= var_498_12 + arg_498_0 then
				arg_495_1.mask_.enabled = true
				arg_495_1.mask_.raycastTarget = true

				arg_495_1:SetGaussion(false)
			end

			local var_498_13 = 2

			if var_498_12 <= arg_495_1.time_ and arg_495_1.time_ < var_498_12 + var_498_13 then
				local var_498_14 = (arg_495_1.time_ - var_498_12) / var_498_13
				local var_498_15 = Color.New(0, 0, 0)

				var_498_15.a = Mathf.Lerp(0, 1, var_498_14)
				arg_495_1.mask_.color = var_498_15
			end

			if arg_495_1.time_ >= var_498_12 + var_498_13 and arg_495_1.time_ < var_498_12 + var_498_13 + arg_498_0 then
				local var_498_16 = Color.New(0, 0, 0)

				var_498_16.a = 1
				arg_495_1.mask_.color = var_498_16
			end

			local var_498_17 = 2

			if var_498_17 < arg_495_1.time_ and arg_495_1.time_ <= var_498_17 + arg_498_0 then
				arg_495_1.mask_.enabled = true
				arg_495_1.mask_.raycastTarget = true

				arg_495_1:SetGaussion(false)
			end

			local var_498_18 = 2

			if var_498_17 <= arg_495_1.time_ and arg_495_1.time_ < var_498_17 + var_498_18 then
				local var_498_19 = (arg_495_1.time_ - var_498_17) / var_498_18
				local var_498_20 = Color.New(0, 0, 0)

				var_498_20.a = Mathf.Lerp(1, 0, var_498_19)
				arg_495_1.mask_.color = var_498_20
			end

			if arg_495_1.time_ >= var_498_17 + var_498_18 and arg_495_1.time_ < var_498_17 + var_498_18 + arg_498_0 then
				local var_498_21 = Color.New(0, 0, 0)
				local var_498_22 = 0

				arg_495_1.mask_.enabled = false
				var_498_21.a = var_498_22
				arg_495_1.mask_.color = var_498_21
			end

			local var_498_23 = 2

			if var_498_23 < arg_495_1.time_ and arg_495_1.time_ <= var_498_23 + arg_498_0 then
				arg_495_1.screenFilterGo_:SetActive(false)
			end

			local var_498_24 = 0.1

			if var_498_23 <= arg_495_1.time_ and arg_495_1.time_ < var_498_23 + var_498_24 then
				local var_498_25 = (arg_495_1.time_ - var_498_23) / var_498_24

				arg_495_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_498_25)
			end

			if arg_495_1.time_ >= var_498_23 + var_498_24 and arg_495_1.time_ < var_498_23 + var_498_24 + arg_498_0 then
				arg_495_1.screenFilterEffect_.weight = 0
			end

			local var_498_26 = 2

			if var_498_26 < arg_495_1.time_ and arg_495_1.time_ <= var_498_26 + arg_498_0 then
				local var_498_27 = manager.ui.mainCamera.transform.localPosition
				local var_498_28 = Vector3.New(0, 0, 10) + Vector3.New(var_498_27.x, var_498_27.y, 0)
				local var_498_29 = arg_495_1.bgs_.ST39a

				var_498_29.transform.localPosition = var_498_28
				var_498_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_498_30 = var_498_29:GetComponent("SpriteRenderer")

				if var_498_30 and var_498_30.sprite then
					local var_498_31 = (var_498_29.transform.localPosition - var_498_27).z
					local var_498_32 = manager.ui.mainCameraCom_
					local var_498_33 = 2 * var_498_31 * Mathf.Tan(var_498_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_498_34 = var_498_33 * var_498_32.aspect
					local var_498_35 = var_498_30.sprite.bounds.size.x
					local var_498_36 = var_498_30.sprite.bounds.size.y
					local var_498_37 = var_498_34 / var_498_35
					local var_498_38 = var_498_33 / var_498_36
					local var_498_39 = var_498_38 < var_498_37 and var_498_37 or var_498_38

					var_498_29.transform.localScale = Vector3.New(var_498_39, var_498_39, 0)
				end

				for iter_498_0, iter_498_1 in pairs(arg_495_1.bgs_) do
					if iter_498_0 ~= "ST39a" then
						iter_498_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_498_40 = arg_495_1.actors_["1074ui_story"].transform
			local var_498_41 = 3.8

			if var_498_41 < arg_495_1.time_ and arg_495_1.time_ <= var_498_41 + arg_498_0 then
				arg_495_1.var_.moveOldPos1074ui_story = var_498_40.localPosition
			end

			local var_498_42 = 0.001

			if var_498_41 <= arg_495_1.time_ and arg_495_1.time_ < var_498_41 + var_498_42 then
				local var_498_43 = (arg_495_1.time_ - var_498_41) / var_498_42
				local var_498_44 = Vector3.New(0.7, -1.055, -6.12)

				var_498_40.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos1074ui_story, var_498_44, var_498_43)

				local var_498_45 = manager.ui.mainCamera.transform.position - var_498_40.position

				var_498_40.forward = Vector3.New(var_498_45.x, var_498_45.y, var_498_45.z)

				local var_498_46 = var_498_40.localEulerAngles

				var_498_46.z = 0
				var_498_46.x = 0
				var_498_40.localEulerAngles = var_498_46
			end

			if arg_495_1.time_ >= var_498_41 + var_498_42 and arg_495_1.time_ < var_498_41 + var_498_42 + arg_498_0 then
				var_498_40.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_498_47 = manager.ui.mainCamera.transform.position - var_498_40.position

				var_498_40.forward = Vector3.New(var_498_47.x, var_498_47.y, var_498_47.z)

				local var_498_48 = var_498_40.localEulerAngles

				var_498_48.z = 0
				var_498_48.x = 0
				var_498_40.localEulerAngles = var_498_48
			end

			local var_498_49 = arg_495_1.actors_["1072ui_story"].transform
			local var_498_50 = 3.8

			if var_498_50 < arg_495_1.time_ and arg_495_1.time_ <= var_498_50 + arg_498_0 then
				arg_495_1.var_.moveOldPos1072ui_story = var_498_49.localPosition
			end

			local var_498_51 = 0.001

			if var_498_50 <= arg_495_1.time_ and arg_495_1.time_ < var_498_50 + var_498_51 then
				local var_498_52 = (arg_495_1.time_ - var_498_50) / var_498_51
				local var_498_53 = Vector3.New(-0.7, -0.71, -6)

				var_498_49.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos1072ui_story, var_498_53, var_498_52)

				local var_498_54 = manager.ui.mainCamera.transform.position - var_498_49.position

				var_498_49.forward = Vector3.New(var_498_54.x, var_498_54.y, var_498_54.z)

				local var_498_55 = var_498_49.localEulerAngles

				var_498_55.z = 0
				var_498_55.x = 0
				var_498_49.localEulerAngles = var_498_55
			end

			if arg_495_1.time_ >= var_498_50 + var_498_51 and arg_495_1.time_ < var_498_50 + var_498_51 + arg_498_0 then
				var_498_49.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_498_56 = manager.ui.mainCamera.transform.position - var_498_49.position

				var_498_49.forward = Vector3.New(var_498_56.x, var_498_56.y, var_498_56.z)

				local var_498_57 = var_498_49.localEulerAngles

				var_498_57.z = 0
				var_498_57.x = 0
				var_498_49.localEulerAngles = var_498_57
			end

			if arg_495_1.frameCnt_ <= 1 then
				arg_495_1.dialog_:SetActive(false)
			end

			local var_498_58 = 4.00000000298023
			local var_498_59 = 1

			if var_498_58 < arg_495_1.time_ and arg_495_1.time_ <= var_498_58 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0

				arg_495_1.dialog_:SetActive(true)

				local var_498_60 = LeanTween.value(arg_495_1.dialog_, 0, 1, 0.3)

				var_498_60:setOnUpdate(LuaHelper.FloatAction(function(arg_499_0)
					arg_495_1.dialogCg_.alpha = arg_499_0
				end))
				var_498_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_495_1.dialog_)
					var_498_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_495_1.duration_ = arg_495_1.duration_ + 0.3

				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_61 = arg_495_1:FormatText(StoryNameCfg[410].name)

				arg_495_1.leftNameTxt_.text = var_498_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_62 = arg_495_1:GetWordFromCfg(222031123)
				local var_498_63 = arg_495_1:FormatText(var_498_62.content)

				arg_495_1.text_.text = var_498_63

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_64 = 40
				local var_498_65 = utf8.len(var_498_63)
				local var_498_66 = var_498_64 <= 0 and var_498_59 or var_498_59 * (var_498_65 / var_498_64)

				if var_498_66 > 0 and var_498_59 < var_498_66 then
					arg_495_1.talkMaxDuration = var_498_66
					var_498_58 = var_498_58 + 0.3

					if var_498_66 + var_498_58 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_66 + var_498_58
					end
				end

				arg_495_1.text_.text = var_498_63
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031123", "story_v_out_222031.awb") ~= 0 then
					local var_498_67 = manager.audio:GetVoiceLength("story_v_out_222031", "222031123", "story_v_out_222031.awb") / 1000

					if var_498_67 + var_498_58 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_67 + var_498_58
					end

					if var_498_62.prefab_name ~= "" and arg_495_1.actors_[var_498_62.prefab_name] ~= nil then
						local var_498_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_62.prefab_name].transform, "story_v_out_222031", "222031123", "story_v_out_222031.awb")

						arg_495_1:RecordAudio("222031123", var_498_68)
						arg_495_1:RecordAudio("222031123", var_498_68)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_222031", "222031123", "story_v_out_222031.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_222031", "222031123", "story_v_out_222031.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_69 = var_498_58 + 0.3
			local var_498_70 = math.max(var_498_59, arg_495_1.talkMaxDuration)

			if var_498_69 <= arg_495_1.time_ and arg_495_1.time_ < var_498_69 + var_498_70 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_69) / var_498_70

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_69 + var_498_70 and arg_495_1.time_ < var_498_69 + var_498_70 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play222031124 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 222031124
		arg_501_1.duration_ = 6.466

		local var_501_0 = {
			ja = 6.466,
			ko = 4.833,
			zh = 4.9
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
				arg_501_0:Play222031125(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 0

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				arg_501_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action3_1")
			end

			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 then
				arg_501_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_504_2 = 0
			local var_504_3 = 0.625

			if var_504_2 < arg_501_1.time_ and arg_501_1.time_ <= var_504_2 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_4 = arg_501_1:FormatText(StoryNameCfg[410].name)

				arg_501_1.leftNameTxt_.text = var_504_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_5 = arg_501_1:GetWordFromCfg(222031124)
				local var_504_6 = arg_501_1:FormatText(var_504_5.content)

				arg_501_1.text_.text = var_504_6

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_7 = 25
				local var_504_8 = utf8.len(var_504_6)
				local var_504_9 = var_504_7 <= 0 and var_504_3 or var_504_3 * (var_504_8 / var_504_7)

				if var_504_9 > 0 and var_504_3 < var_504_9 then
					arg_501_1.talkMaxDuration = var_504_9

					if var_504_9 + var_504_2 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_9 + var_504_2
					end
				end

				arg_501_1.text_.text = var_504_6
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031124", "story_v_out_222031.awb") ~= 0 then
					local var_504_10 = manager.audio:GetVoiceLength("story_v_out_222031", "222031124", "story_v_out_222031.awb") / 1000

					if var_504_10 + var_504_2 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_10 + var_504_2
					end

					if var_504_5.prefab_name ~= "" and arg_501_1.actors_[var_504_5.prefab_name] ~= nil then
						local var_504_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_5.prefab_name].transform, "story_v_out_222031", "222031124", "story_v_out_222031.awb")

						arg_501_1:RecordAudio("222031124", var_504_11)
						arg_501_1:RecordAudio("222031124", var_504_11)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_222031", "222031124", "story_v_out_222031.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_222031", "222031124", "story_v_out_222031.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_12 = math.max(var_504_3, arg_501_1.talkMaxDuration)

			if var_504_2 <= arg_501_1.time_ and arg_501_1.time_ < var_504_2 + var_504_12 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_2) / var_504_12

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_2 + var_504_12 and arg_501_1.time_ < var_504_2 + var_504_12 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play222031125 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 222031125
		arg_505_1.duration_ = 16.7

		local var_505_0 = {
			ja = 16.7,
			ko = 10.3,
			zh = 10.266
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
				arg_505_0:Play222031126(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = 0

			if var_508_0 < arg_505_1.time_ and arg_505_1.time_ <= var_508_0 + arg_508_0 then
				arg_505_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action3_2")
			end

			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 then
				arg_505_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_508_2 = 0
			local var_508_3 = 1.05

			if var_508_2 < arg_505_1.time_ and arg_505_1.time_ <= var_508_2 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_4 = arg_505_1:FormatText(StoryNameCfg[410].name)

				arg_505_1.leftNameTxt_.text = var_508_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_5 = arg_505_1:GetWordFromCfg(222031125)
				local var_508_6 = arg_505_1:FormatText(var_508_5.content)

				arg_505_1.text_.text = var_508_6

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_7 = 42
				local var_508_8 = utf8.len(var_508_6)
				local var_508_9 = var_508_7 <= 0 and var_508_3 or var_508_3 * (var_508_8 / var_508_7)

				if var_508_9 > 0 and var_508_3 < var_508_9 then
					arg_505_1.talkMaxDuration = var_508_9

					if var_508_9 + var_508_2 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_9 + var_508_2
					end
				end

				arg_505_1.text_.text = var_508_6
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031125", "story_v_out_222031.awb") ~= 0 then
					local var_508_10 = manager.audio:GetVoiceLength("story_v_out_222031", "222031125", "story_v_out_222031.awb") / 1000

					if var_508_10 + var_508_2 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_10 + var_508_2
					end

					if var_508_5.prefab_name ~= "" and arg_505_1.actors_[var_508_5.prefab_name] ~= nil then
						local var_508_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_5.prefab_name].transform, "story_v_out_222031", "222031125", "story_v_out_222031.awb")

						arg_505_1:RecordAudio("222031125", var_508_11)
						arg_505_1:RecordAudio("222031125", var_508_11)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_out_222031", "222031125", "story_v_out_222031.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_out_222031", "222031125", "story_v_out_222031.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_12 = math.max(var_508_3, arg_505_1.talkMaxDuration)

			if var_508_2 <= arg_505_1.time_ and arg_505_1.time_ < var_508_2 + var_508_12 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_2) / var_508_12

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_2 + var_508_12 and arg_505_1.time_ < var_508_2 + var_508_12 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play222031126 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 222031126
		arg_509_1.duration_ = 5

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play222031127(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["1072ui_story"].transform
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 then
				arg_509_1.var_.moveOldPos1072ui_story = var_512_0.localPosition
			end

			local var_512_2 = 0.001

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2
				local var_512_4 = Vector3.New(0, 100, 0)

				var_512_0.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos1072ui_story, var_512_4, var_512_3)

				local var_512_5 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_5.x, var_512_5.y, var_512_5.z)

				local var_512_6 = var_512_0.localEulerAngles

				var_512_6.z = 0
				var_512_6.x = 0
				var_512_0.localEulerAngles = var_512_6
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 then
				var_512_0.localPosition = Vector3.New(0, 100, 0)

				local var_512_7 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_7.x, var_512_7.y, var_512_7.z)

				local var_512_8 = var_512_0.localEulerAngles

				var_512_8.z = 0
				var_512_8.x = 0
				var_512_0.localEulerAngles = var_512_8
			end

			local var_512_9 = arg_509_1.actors_["1074ui_story"]
			local var_512_10 = 0

			if var_512_10 < arg_509_1.time_ and arg_509_1.time_ <= var_512_10 + arg_512_0 and arg_509_1.var_.characterEffect1074ui_story == nil then
				arg_509_1.var_.characterEffect1074ui_story = var_512_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_11 = 0.200000002980232

			if var_512_10 <= arg_509_1.time_ and arg_509_1.time_ < var_512_10 + var_512_11 then
				local var_512_12 = (arg_509_1.time_ - var_512_10) / var_512_11

				if arg_509_1.var_.characterEffect1074ui_story then
					local var_512_13 = Mathf.Lerp(0, 0.5, var_512_12)

					arg_509_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_509_1.var_.characterEffect1074ui_story.fillRatio = var_512_13
				end
			end

			if arg_509_1.time_ >= var_512_10 + var_512_11 and arg_509_1.time_ < var_512_10 + var_512_11 + arg_512_0 and arg_509_1.var_.characterEffect1074ui_story then
				local var_512_14 = 0.5

				arg_509_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_509_1.var_.characterEffect1074ui_story.fillRatio = var_512_14
			end

			local var_512_15 = arg_509_1.actors_["1074ui_story"].transform
			local var_512_16 = 0

			if var_512_16 < arg_509_1.time_ and arg_509_1.time_ <= var_512_16 + arg_512_0 then
				arg_509_1.var_.moveOldPos1074ui_story = var_512_15.localPosition
			end

			local var_512_17 = 0.001

			if var_512_16 <= arg_509_1.time_ and arg_509_1.time_ < var_512_16 + var_512_17 then
				local var_512_18 = (arg_509_1.time_ - var_512_16) / var_512_17
				local var_512_19 = Vector3.New(0, 100, 0)

				var_512_15.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos1074ui_story, var_512_19, var_512_18)

				local var_512_20 = manager.ui.mainCamera.transform.position - var_512_15.position

				var_512_15.forward = Vector3.New(var_512_20.x, var_512_20.y, var_512_20.z)

				local var_512_21 = var_512_15.localEulerAngles

				var_512_21.z = 0
				var_512_21.x = 0
				var_512_15.localEulerAngles = var_512_21
			end

			if arg_509_1.time_ >= var_512_16 + var_512_17 and arg_509_1.time_ < var_512_16 + var_512_17 + arg_512_0 then
				var_512_15.localPosition = Vector3.New(0, 100, 0)

				local var_512_22 = manager.ui.mainCamera.transform.position - var_512_15.position

				var_512_15.forward = Vector3.New(var_512_22.x, var_512_22.y, var_512_22.z)

				local var_512_23 = var_512_15.localEulerAngles

				var_512_23.z = 0
				var_512_23.x = 0
				var_512_15.localEulerAngles = var_512_23
			end

			local var_512_24 = arg_509_1.actors_["1074ui_story"]
			local var_512_25 = 0

			if var_512_25 < arg_509_1.time_ and arg_509_1.time_ <= var_512_25 + arg_512_0 and arg_509_1.var_.characterEffect1074ui_story == nil then
				arg_509_1.var_.characterEffect1074ui_story = var_512_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_26 = 0.200000002980232

			if var_512_25 <= arg_509_1.time_ and arg_509_1.time_ < var_512_25 + var_512_26 then
				local var_512_27 = (arg_509_1.time_ - var_512_25) / var_512_26

				if arg_509_1.var_.characterEffect1074ui_story then
					local var_512_28 = Mathf.Lerp(0, 0.5, var_512_27)

					arg_509_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_509_1.var_.characterEffect1074ui_story.fillRatio = var_512_28
				end
			end

			if arg_509_1.time_ >= var_512_25 + var_512_26 and arg_509_1.time_ < var_512_25 + var_512_26 + arg_512_0 and arg_509_1.var_.characterEffect1074ui_story then
				local var_512_29 = 0.5

				arg_509_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_509_1.var_.characterEffect1074ui_story.fillRatio = var_512_29
			end

			local var_512_30 = 0
			local var_512_31 = 0.7

			if var_512_30 < arg_509_1.time_ and arg_509_1.time_ <= var_512_30 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, false)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_32 = arg_509_1:GetWordFromCfg(222031126)
				local var_512_33 = arg_509_1:FormatText(var_512_32.content)

				arg_509_1.text_.text = var_512_33

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_34 = 28
				local var_512_35 = utf8.len(var_512_33)
				local var_512_36 = var_512_34 <= 0 and var_512_31 or var_512_31 * (var_512_35 / var_512_34)

				if var_512_36 > 0 and var_512_31 < var_512_36 then
					arg_509_1.talkMaxDuration = var_512_36

					if var_512_36 + var_512_30 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_36 + var_512_30
					end
				end

				arg_509_1.text_.text = var_512_33
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)
				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_37 = math.max(var_512_31, arg_509_1.talkMaxDuration)

			if var_512_30 <= arg_509_1.time_ and arg_509_1.time_ < var_512_30 + var_512_37 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_30) / var_512_37

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_30 + var_512_37 and arg_509_1.time_ < var_512_30 + var_512_37 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play222031127 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 222031127
		arg_513_1.duration_ = 13.1

		local var_513_0 = {
			ja = 13.1,
			ko = 6.066,
			zh = 6.1
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
				arg_513_0:Play222031128(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = arg_513_1.actors_["1074ui_story"].transform
			local var_516_1 = 0

			if var_516_1 < arg_513_1.time_ and arg_513_1.time_ <= var_516_1 + arg_516_0 then
				arg_513_1.var_.moveOldPos1074ui_story = var_516_0.localPosition
			end

			local var_516_2 = 0.001

			if var_516_1 <= arg_513_1.time_ and arg_513_1.time_ < var_516_1 + var_516_2 then
				local var_516_3 = (arg_513_1.time_ - var_516_1) / var_516_2
				local var_516_4 = Vector3.New(0, -1.055, -6.12)

				var_516_0.localPosition = Vector3.Lerp(arg_513_1.var_.moveOldPos1074ui_story, var_516_4, var_516_3)

				local var_516_5 = manager.ui.mainCamera.transform.position - var_516_0.position

				var_516_0.forward = Vector3.New(var_516_5.x, var_516_5.y, var_516_5.z)

				local var_516_6 = var_516_0.localEulerAngles

				var_516_6.z = 0
				var_516_6.x = 0
				var_516_0.localEulerAngles = var_516_6
			end

			if arg_513_1.time_ >= var_516_1 + var_516_2 and arg_513_1.time_ < var_516_1 + var_516_2 + arg_516_0 then
				var_516_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_516_7 = manager.ui.mainCamera.transform.position - var_516_0.position

				var_516_0.forward = Vector3.New(var_516_7.x, var_516_7.y, var_516_7.z)

				local var_516_8 = var_516_0.localEulerAngles

				var_516_8.z = 0
				var_516_8.x = 0
				var_516_0.localEulerAngles = var_516_8
			end

			local var_516_9 = arg_513_1.actors_["1074ui_story"]
			local var_516_10 = 0

			if var_516_10 < arg_513_1.time_ and arg_513_1.time_ <= var_516_10 + arg_516_0 and arg_513_1.var_.characterEffect1074ui_story == nil then
				arg_513_1.var_.characterEffect1074ui_story = var_516_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_11 = 0.200000002980232

			if var_516_10 <= arg_513_1.time_ and arg_513_1.time_ < var_516_10 + var_516_11 then
				local var_516_12 = (arg_513_1.time_ - var_516_10) / var_516_11

				if arg_513_1.var_.characterEffect1074ui_story then
					arg_513_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_513_1.time_ >= var_516_10 + var_516_11 and arg_513_1.time_ < var_516_10 + var_516_11 + arg_516_0 and arg_513_1.var_.characterEffect1074ui_story then
				arg_513_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_516_13 = 0

			if var_516_13 < arg_513_1.time_ and arg_513_1.time_ <= var_516_13 + arg_516_0 then
				arg_513_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_516_14 = 0

			if var_516_14 < arg_513_1.time_ and arg_513_1.time_ <= var_516_14 + arg_516_0 then
				arg_513_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_516_15 = 0
			local var_516_16 = 0.625

			if var_516_15 < arg_513_1.time_ and arg_513_1.time_ <= var_516_15 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_17 = arg_513_1:FormatText(StoryNameCfg[410].name)

				arg_513_1.leftNameTxt_.text = var_516_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_18 = arg_513_1:GetWordFromCfg(222031127)
				local var_516_19 = arg_513_1:FormatText(var_516_18.content)

				arg_513_1.text_.text = var_516_19

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_20 = 25
				local var_516_21 = utf8.len(var_516_19)
				local var_516_22 = var_516_20 <= 0 and var_516_16 or var_516_16 * (var_516_21 / var_516_20)

				if var_516_22 > 0 and var_516_16 < var_516_22 then
					arg_513_1.talkMaxDuration = var_516_22

					if var_516_22 + var_516_15 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_22 + var_516_15
					end
				end

				arg_513_1.text_.text = var_516_19
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031127", "story_v_out_222031.awb") ~= 0 then
					local var_516_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031127", "story_v_out_222031.awb") / 1000

					if var_516_23 + var_516_15 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_23 + var_516_15
					end

					if var_516_18.prefab_name ~= "" and arg_513_1.actors_[var_516_18.prefab_name] ~= nil then
						local var_516_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_18.prefab_name].transform, "story_v_out_222031", "222031127", "story_v_out_222031.awb")

						arg_513_1:RecordAudio("222031127", var_516_24)
						arg_513_1:RecordAudio("222031127", var_516_24)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_222031", "222031127", "story_v_out_222031.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_222031", "222031127", "story_v_out_222031.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_25 = math.max(var_516_16, arg_513_1.talkMaxDuration)

			if var_516_15 <= arg_513_1.time_ and arg_513_1.time_ < var_516_15 + var_516_25 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_15) / var_516_25

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_15 + var_516_25 and arg_513_1.time_ < var_516_15 + var_516_25 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play222031128 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 222031128
		arg_517_1.duration_ = 7.066

		local var_517_0 = {
			ja = 6.366,
			ko = 7.033,
			zh = 7.066
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
				arg_517_0:Play222031129(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["1074ui_story"]
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 and arg_517_1.var_.characterEffect1074ui_story == nil then
				arg_517_1.var_.characterEffect1074ui_story = var_520_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_2 = 0.200000002980232

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2

				if arg_517_1.var_.characterEffect1074ui_story then
					local var_520_4 = Mathf.Lerp(0, 0.5, var_520_3)

					arg_517_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_517_1.var_.characterEffect1074ui_story.fillRatio = var_520_4
				end
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 and arg_517_1.var_.characterEffect1074ui_story then
				local var_520_5 = 0.5

				arg_517_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_517_1.var_.characterEffect1074ui_story.fillRatio = var_520_5
			end

			local var_520_6 = 0
			local var_520_7 = 0.7

			if var_520_6 < arg_517_1.time_ and arg_517_1.time_ <= var_520_6 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_8 = arg_517_1:FormatText(StoryNameCfg[461].name)

				arg_517_1.leftNameTxt_.text = var_520_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, true)
				arg_517_1.iconController_:SetSelectedState("hero")

				arg_517_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_9 = arg_517_1:GetWordFromCfg(222031128)
				local var_520_10 = arg_517_1:FormatText(var_520_9.content)

				arg_517_1.text_.text = var_520_10

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_11 = 28
				local var_520_12 = utf8.len(var_520_10)
				local var_520_13 = var_520_11 <= 0 and var_520_7 or var_520_7 * (var_520_12 / var_520_11)

				if var_520_13 > 0 and var_520_7 < var_520_13 then
					arg_517_1.talkMaxDuration = var_520_13

					if var_520_13 + var_520_6 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_13 + var_520_6
					end
				end

				arg_517_1.text_.text = var_520_10
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031128", "story_v_out_222031.awb") ~= 0 then
					local var_520_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031128", "story_v_out_222031.awb") / 1000

					if var_520_14 + var_520_6 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_14 + var_520_6
					end

					if var_520_9.prefab_name ~= "" and arg_517_1.actors_[var_520_9.prefab_name] ~= nil then
						local var_520_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_9.prefab_name].transform, "story_v_out_222031", "222031128", "story_v_out_222031.awb")

						arg_517_1:RecordAudio("222031128", var_520_15)
						arg_517_1:RecordAudio("222031128", var_520_15)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_222031", "222031128", "story_v_out_222031.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_222031", "222031128", "story_v_out_222031.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_16 = math.max(var_520_7, arg_517_1.talkMaxDuration)

			if var_520_6 <= arg_517_1.time_ and arg_517_1.time_ < var_520_6 + var_520_16 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_6) / var_520_16

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_6 + var_520_16 and arg_517_1.time_ < var_520_6 + var_520_16 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play222031129 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 222031129
		arg_521_1.duration_ = 17.033

		local var_521_0 = {
			ja = 17.033,
			ko = 13.866,
			zh = 13.9
		}
		local var_521_1 = manager.audio:GetLocalizationFlag()

		if var_521_0[var_521_1] ~= nil then
			arg_521_1.duration_ = var_521_0[var_521_1]
		end

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play222031130(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = 0
			local var_524_1 = 1.325

			if var_524_0 < arg_521_1.time_ and arg_521_1.time_ <= var_524_0 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_2 = arg_521_1:FormatText(StoryNameCfg[461].name)

				arg_521_1.leftNameTxt_.text = var_524_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, true)
				arg_521_1.iconController_:SetSelectedState("hero")

				arg_521_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_3 = arg_521_1:GetWordFromCfg(222031129)
				local var_524_4 = arg_521_1:FormatText(var_524_3.content)

				arg_521_1.text_.text = var_524_4

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_5 = 53
				local var_524_6 = utf8.len(var_524_4)
				local var_524_7 = var_524_5 <= 0 and var_524_1 or var_524_1 * (var_524_6 / var_524_5)

				if var_524_7 > 0 and var_524_1 < var_524_7 then
					arg_521_1.talkMaxDuration = var_524_7

					if var_524_7 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_7 + var_524_0
					end
				end

				arg_521_1.text_.text = var_524_4
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031129", "story_v_out_222031.awb") ~= 0 then
					local var_524_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031129", "story_v_out_222031.awb") / 1000

					if var_524_8 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_8 + var_524_0
					end

					if var_524_3.prefab_name ~= "" and arg_521_1.actors_[var_524_3.prefab_name] ~= nil then
						local var_524_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_3.prefab_name].transform, "story_v_out_222031", "222031129", "story_v_out_222031.awb")

						arg_521_1:RecordAudio("222031129", var_524_9)
						arg_521_1:RecordAudio("222031129", var_524_9)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_222031", "222031129", "story_v_out_222031.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_222031", "222031129", "story_v_out_222031.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_10 = math.max(var_524_1, arg_521_1.talkMaxDuration)

			if var_524_0 <= arg_521_1.time_ and arg_521_1.time_ < var_524_0 + var_524_10 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_0) / var_524_10

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_0 + var_524_10 and arg_521_1.time_ < var_524_0 + var_524_10 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play222031130 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 222031130
		arg_525_1.duration_ = 13.766

		local var_525_0 = {
			ja = 13.766,
			ko = 10.266,
			zh = 10.266
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
				arg_525_0:Play222031131(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = arg_525_1.actors_["1074ui_story"]
			local var_528_1 = 0

			if var_528_1 < arg_525_1.time_ and arg_525_1.time_ <= var_528_1 + arg_528_0 and arg_525_1.var_.characterEffect1074ui_story == nil then
				arg_525_1.var_.characterEffect1074ui_story = var_528_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_528_2 = 0.200000002980232

			if var_528_1 <= arg_525_1.time_ and arg_525_1.time_ < var_528_1 + var_528_2 then
				local var_528_3 = (arg_525_1.time_ - var_528_1) / var_528_2

				if arg_525_1.var_.characterEffect1074ui_story then
					arg_525_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_525_1.time_ >= var_528_1 + var_528_2 and arg_525_1.time_ < var_528_1 + var_528_2 + arg_528_0 and arg_525_1.var_.characterEffect1074ui_story then
				arg_525_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_528_4 = 0
			local var_528_5 = 1.275

			if var_528_4 < arg_525_1.time_ and arg_525_1.time_ <= var_528_4 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_6 = arg_525_1:FormatText(StoryNameCfg[410].name)

				arg_525_1.leftNameTxt_.text = var_528_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_7 = arg_525_1:GetWordFromCfg(222031130)
				local var_528_8 = arg_525_1:FormatText(var_528_7.content)

				arg_525_1.text_.text = var_528_8

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_9 = 51
				local var_528_10 = utf8.len(var_528_8)
				local var_528_11 = var_528_9 <= 0 and var_528_5 or var_528_5 * (var_528_10 / var_528_9)

				if var_528_11 > 0 and var_528_5 < var_528_11 then
					arg_525_1.talkMaxDuration = var_528_11

					if var_528_11 + var_528_4 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_11 + var_528_4
					end
				end

				arg_525_1.text_.text = var_528_8
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031130", "story_v_out_222031.awb") ~= 0 then
					local var_528_12 = manager.audio:GetVoiceLength("story_v_out_222031", "222031130", "story_v_out_222031.awb") / 1000

					if var_528_12 + var_528_4 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_12 + var_528_4
					end

					if var_528_7.prefab_name ~= "" and arg_525_1.actors_[var_528_7.prefab_name] ~= nil then
						local var_528_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_7.prefab_name].transform, "story_v_out_222031", "222031130", "story_v_out_222031.awb")

						arg_525_1:RecordAudio("222031130", var_528_13)
						arg_525_1:RecordAudio("222031130", var_528_13)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_out_222031", "222031130", "story_v_out_222031.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_out_222031", "222031130", "story_v_out_222031.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_14 = math.max(var_528_5, arg_525_1.talkMaxDuration)

			if var_528_4 <= arg_525_1.time_ and arg_525_1.time_ < var_528_4 + var_528_14 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_4) / var_528_14

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_4 + var_528_14 and arg_525_1.time_ < var_528_4 + var_528_14 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play222031131 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 222031131
		arg_529_1.duration_ = 17.2

		local var_529_0 = {
			ja = 17.2,
			ko = 12.7,
			zh = 12.666
		}
		local var_529_1 = manager.audio:GetLocalizationFlag()

		if var_529_0[var_529_1] ~= nil then
			arg_529_1.duration_ = var_529_0[var_529_1]
		end

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play222031132(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = 0

			if var_532_0 < arg_529_1.time_ and arg_529_1.time_ <= var_532_0 + arg_532_0 then
				arg_529_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_532_1 = 0
			local var_532_2 = 1.375

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_3 = arg_529_1:FormatText(StoryNameCfg[410].name)

				arg_529_1.leftNameTxt_.text = var_532_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_4 = arg_529_1:GetWordFromCfg(222031131)
				local var_532_5 = arg_529_1:FormatText(var_532_4.content)

				arg_529_1.text_.text = var_532_5

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_6 = 55
				local var_532_7 = utf8.len(var_532_5)
				local var_532_8 = var_532_6 <= 0 and var_532_2 or var_532_2 * (var_532_7 / var_532_6)

				if var_532_8 > 0 and var_532_2 < var_532_8 then
					arg_529_1.talkMaxDuration = var_532_8

					if var_532_8 + var_532_1 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_8 + var_532_1
					end
				end

				arg_529_1.text_.text = var_532_5
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031131", "story_v_out_222031.awb") ~= 0 then
					local var_532_9 = manager.audio:GetVoiceLength("story_v_out_222031", "222031131", "story_v_out_222031.awb") / 1000

					if var_532_9 + var_532_1 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_9 + var_532_1
					end

					if var_532_4.prefab_name ~= "" and arg_529_1.actors_[var_532_4.prefab_name] ~= nil then
						local var_532_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_529_1.actors_[var_532_4.prefab_name].transform, "story_v_out_222031", "222031131", "story_v_out_222031.awb")

						arg_529_1:RecordAudio("222031131", var_532_10)
						arg_529_1:RecordAudio("222031131", var_532_10)
					else
						arg_529_1:AudioAction("play", "voice", "story_v_out_222031", "222031131", "story_v_out_222031.awb")
					end

					arg_529_1:RecordHistoryTalkVoice("story_v_out_222031", "222031131", "story_v_out_222031.awb")
				end

				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_11 = math.max(var_532_2, arg_529_1.talkMaxDuration)

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_11 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_1) / var_532_11

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_1 + var_532_11 and arg_529_1.time_ < var_532_1 + var_532_11 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play222031132 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 222031132
		arg_533_1.duration_ = 5.8

		local var_533_0 = {
			ja = 5.8,
			ko = 4.133,
			zh = 4.133
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
				arg_533_0:Play222031133(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = arg_533_1.actors_["1074ui_story"]
			local var_536_1 = 0

			if var_536_1 < arg_533_1.time_ and arg_533_1.time_ <= var_536_1 + arg_536_0 and arg_533_1.var_.characterEffect1074ui_story == nil then
				arg_533_1.var_.characterEffect1074ui_story = var_536_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_2 = 0.200000002980232

			if var_536_1 <= arg_533_1.time_ and arg_533_1.time_ < var_536_1 + var_536_2 then
				local var_536_3 = (arg_533_1.time_ - var_536_1) / var_536_2

				if arg_533_1.var_.characterEffect1074ui_story then
					local var_536_4 = Mathf.Lerp(0, 0.5, var_536_3)

					arg_533_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_533_1.var_.characterEffect1074ui_story.fillRatio = var_536_4
				end
			end

			if arg_533_1.time_ >= var_536_1 + var_536_2 and arg_533_1.time_ < var_536_1 + var_536_2 + arg_536_0 and arg_533_1.var_.characterEffect1074ui_story then
				local var_536_5 = 0.5

				arg_533_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_533_1.var_.characterEffect1074ui_story.fillRatio = var_536_5
			end

			local var_536_6 = 0
			local var_536_7 = 0.4

			if var_536_6 < arg_533_1.time_ and arg_533_1.time_ <= var_536_6 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_8 = arg_533_1:FormatText(StoryNameCfg[461].name)

				arg_533_1.leftNameTxt_.text = var_536_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, true)
				arg_533_1.iconController_:SetSelectedState("hero")

				arg_533_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_9 = arg_533_1:GetWordFromCfg(222031132)
				local var_536_10 = arg_533_1:FormatText(var_536_9.content)

				arg_533_1.text_.text = var_536_10

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_11 = 16
				local var_536_12 = utf8.len(var_536_10)
				local var_536_13 = var_536_11 <= 0 and var_536_7 or var_536_7 * (var_536_12 / var_536_11)

				if var_536_13 > 0 and var_536_7 < var_536_13 then
					arg_533_1.talkMaxDuration = var_536_13

					if var_536_13 + var_536_6 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_13 + var_536_6
					end
				end

				arg_533_1.text_.text = var_536_10
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031132", "story_v_out_222031.awb") ~= 0 then
					local var_536_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031132", "story_v_out_222031.awb") / 1000

					if var_536_14 + var_536_6 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_14 + var_536_6
					end

					if var_536_9.prefab_name ~= "" and arg_533_1.actors_[var_536_9.prefab_name] ~= nil then
						local var_536_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_533_1.actors_[var_536_9.prefab_name].transform, "story_v_out_222031", "222031132", "story_v_out_222031.awb")

						arg_533_1:RecordAudio("222031132", var_536_15)
						arg_533_1:RecordAudio("222031132", var_536_15)
					else
						arg_533_1:AudioAction("play", "voice", "story_v_out_222031", "222031132", "story_v_out_222031.awb")
					end

					arg_533_1:RecordHistoryTalkVoice("story_v_out_222031", "222031132", "story_v_out_222031.awb")
				end

				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_16 = math.max(var_536_7, arg_533_1.talkMaxDuration)

			if var_536_6 <= arg_533_1.time_ and arg_533_1.time_ < var_536_6 + var_536_16 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_6) / var_536_16

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_6 + var_536_16 and arg_533_1.time_ < var_536_6 + var_536_16 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play222031133 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 222031133
		arg_537_1.duration_ = 16.933

		local var_537_0 = {
			ja = 16.933,
			ko = 7.733,
			zh = 7.733
		}
		local var_537_1 = manager.audio:GetLocalizationFlag()

		if var_537_0[var_537_1] ~= nil then
			arg_537_1.duration_ = var_537_0[var_537_1]
		end

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play222031134(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = arg_537_1.actors_["1074ui_story"]
			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 and arg_537_1.var_.characterEffect1074ui_story == nil then
				arg_537_1.var_.characterEffect1074ui_story = var_540_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_540_2 = 0.200000002980232

			if var_540_1 <= arg_537_1.time_ and arg_537_1.time_ < var_540_1 + var_540_2 then
				local var_540_3 = (arg_537_1.time_ - var_540_1) / var_540_2

				if arg_537_1.var_.characterEffect1074ui_story then
					arg_537_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_537_1.time_ >= var_540_1 + var_540_2 and arg_537_1.time_ < var_540_1 + var_540_2 + arg_540_0 and arg_537_1.var_.characterEffect1074ui_story then
				arg_537_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_540_4 = 0
			local var_540_5 = 1.025

			if var_540_4 < arg_537_1.time_ and arg_537_1.time_ <= var_540_4 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_6 = arg_537_1:FormatText(StoryNameCfg[410].name)

				arg_537_1.leftNameTxt_.text = var_540_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_7 = arg_537_1:GetWordFromCfg(222031133)
				local var_540_8 = arg_537_1:FormatText(var_540_7.content)

				arg_537_1.text_.text = var_540_8

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_9 = 41
				local var_540_10 = utf8.len(var_540_8)
				local var_540_11 = var_540_9 <= 0 and var_540_5 or var_540_5 * (var_540_10 / var_540_9)

				if var_540_11 > 0 and var_540_5 < var_540_11 then
					arg_537_1.talkMaxDuration = var_540_11

					if var_540_11 + var_540_4 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_11 + var_540_4
					end
				end

				arg_537_1.text_.text = var_540_8
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031133", "story_v_out_222031.awb") ~= 0 then
					local var_540_12 = manager.audio:GetVoiceLength("story_v_out_222031", "222031133", "story_v_out_222031.awb") / 1000

					if var_540_12 + var_540_4 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_12 + var_540_4
					end

					if var_540_7.prefab_name ~= "" and arg_537_1.actors_[var_540_7.prefab_name] ~= nil then
						local var_540_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_7.prefab_name].transform, "story_v_out_222031", "222031133", "story_v_out_222031.awb")

						arg_537_1:RecordAudio("222031133", var_540_13)
						arg_537_1:RecordAudio("222031133", var_540_13)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_out_222031", "222031133", "story_v_out_222031.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_out_222031", "222031133", "story_v_out_222031.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_14 = math.max(var_540_5, arg_537_1.talkMaxDuration)

			if var_540_4 <= arg_537_1.time_ and arg_537_1.time_ < var_540_4 + var_540_14 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_4) / var_540_14

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_4 + var_540_14 and arg_537_1.time_ < var_540_4 + var_540_14 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play222031134 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 222031134
		arg_541_1.duration_ = 14.5

		local var_541_0 = {
			ja = 14.5,
			ko = 7.766,
			zh = 7.733
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
				arg_541_0:Play222031135(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = 0
			local var_544_1 = 1.025

			if var_544_0 < arg_541_1.time_ and arg_541_1.time_ <= var_544_0 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_2 = arg_541_1:FormatText(StoryNameCfg[410].name)

				arg_541_1.leftNameTxt_.text = var_544_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_3 = arg_541_1:GetWordFromCfg(222031134)
				local var_544_4 = arg_541_1:FormatText(var_544_3.content)

				arg_541_1.text_.text = var_544_4

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031134", "story_v_out_222031.awb") ~= 0 then
					local var_544_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031134", "story_v_out_222031.awb") / 1000

					if var_544_8 + var_544_0 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_8 + var_544_0
					end

					if var_544_3.prefab_name ~= "" and arg_541_1.actors_[var_544_3.prefab_name] ~= nil then
						local var_544_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_541_1.actors_[var_544_3.prefab_name].transform, "story_v_out_222031", "222031134", "story_v_out_222031.awb")

						arg_541_1:RecordAudio("222031134", var_544_9)
						arg_541_1:RecordAudio("222031134", var_544_9)
					else
						arg_541_1:AudioAction("play", "voice", "story_v_out_222031", "222031134", "story_v_out_222031.awb")
					end

					arg_541_1:RecordHistoryTalkVoice("story_v_out_222031", "222031134", "story_v_out_222031.awb")
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
	Play222031135 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 222031135
		arg_545_1.duration_ = 17.6

		local var_545_0 = {
			ja = 17.6,
			ko = 12.366,
			zh = 12.366
		}
		local var_545_1 = manager.audio:GetLocalizationFlag()

		if var_545_0[var_545_1] ~= nil then
			arg_545_1.duration_ = var_545_0[var_545_1]
		end

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play222031136(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = 0
			local var_548_1 = 1.4

			if var_548_0 < arg_545_1.time_ and arg_545_1.time_ <= var_548_0 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_2 = arg_545_1:FormatText(StoryNameCfg[410].name)

				arg_545_1.leftNameTxt_.text = var_548_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_3 = arg_545_1:GetWordFromCfg(222031135)
				local var_548_4 = arg_545_1:FormatText(var_548_3.content)

				arg_545_1.text_.text = var_548_4

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_5 = 56
				local var_548_6 = utf8.len(var_548_4)
				local var_548_7 = var_548_5 <= 0 and var_548_1 or var_548_1 * (var_548_6 / var_548_5)

				if var_548_7 > 0 and var_548_1 < var_548_7 then
					arg_545_1.talkMaxDuration = var_548_7

					if var_548_7 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_7 + var_548_0
					end
				end

				arg_545_1.text_.text = var_548_4
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031135", "story_v_out_222031.awb") ~= 0 then
					local var_548_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031135", "story_v_out_222031.awb") / 1000

					if var_548_8 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_8 + var_548_0
					end

					if var_548_3.prefab_name ~= "" and arg_545_1.actors_[var_548_3.prefab_name] ~= nil then
						local var_548_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_545_1.actors_[var_548_3.prefab_name].transform, "story_v_out_222031", "222031135", "story_v_out_222031.awb")

						arg_545_1:RecordAudio("222031135", var_548_9)
						arg_545_1:RecordAudio("222031135", var_548_9)
					else
						arg_545_1:AudioAction("play", "voice", "story_v_out_222031", "222031135", "story_v_out_222031.awb")
					end

					arg_545_1:RecordHistoryTalkVoice("story_v_out_222031", "222031135", "story_v_out_222031.awb")
				end

				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_10 = math.max(var_548_1, arg_545_1.talkMaxDuration)

			if var_548_0 <= arg_545_1.time_ and arg_545_1.time_ < var_548_0 + var_548_10 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_0) / var_548_10

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_0 + var_548_10 and arg_545_1.time_ < var_548_0 + var_548_10 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play222031136 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 222031136
		arg_549_1.duration_ = 22.066

		local var_549_0 = {
			ja = 22.066,
			ko = 15.5,
			zh = 15.5
		}
		local var_549_1 = manager.audio:GetLocalizationFlag()

		if var_549_0[var_549_1] ~= nil then
			arg_549_1.duration_ = var_549_0[var_549_1]
		end

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play222031137(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = arg_549_1.actors_["1074ui_story"]
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 and arg_549_1.var_.characterEffect1074ui_story == nil then
				arg_549_1.var_.characterEffect1074ui_story = var_552_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_552_2 = 0.200000002980232

			if var_552_1 <= arg_549_1.time_ and arg_549_1.time_ < var_552_1 + var_552_2 then
				local var_552_3 = (arg_549_1.time_ - var_552_1) / var_552_2

				if arg_549_1.var_.characterEffect1074ui_story then
					local var_552_4 = Mathf.Lerp(0, 0.5, var_552_3)

					arg_549_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_549_1.var_.characterEffect1074ui_story.fillRatio = var_552_4
				end
			end

			if arg_549_1.time_ >= var_552_1 + var_552_2 and arg_549_1.time_ < var_552_1 + var_552_2 + arg_552_0 and arg_549_1.var_.characterEffect1074ui_story then
				local var_552_5 = 0.5

				arg_549_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_549_1.var_.characterEffect1074ui_story.fillRatio = var_552_5
			end

			local var_552_6 = 0
			local var_552_7 = 1.075

			if var_552_6 < arg_549_1.time_ and arg_549_1.time_ <= var_552_6 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_8 = arg_549_1:FormatText(StoryNameCfg[461].name)

				arg_549_1.leftNameTxt_.text = var_552_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, true)
				arg_549_1.iconController_:SetSelectedState("hero")

				arg_549_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_9 = arg_549_1:GetWordFromCfg(222031136)
				local var_552_10 = arg_549_1:FormatText(var_552_9.content)

				arg_549_1.text_.text = var_552_10

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_11 = 43
				local var_552_12 = utf8.len(var_552_10)
				local var_552_13 = var_552_11 <= 0 and var_552_7 or var_552_7 * (var_552_12 / var_552_11)

				if var_552_13 > 0 and var_552_7 < var_552_13 then
					arg_549_1.talkMaxDuration = var_552_13

					if var_552_13 + var_552_6 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_13 + var_552_6
					end
				end

				arg_549_1.text_.text = var_552_10
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031136", "story_v_out_222031.awb") ~= 0 then
					local var_552_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031136", "story_v_out_222031.awb") / 1000

					if var_552_14 + var_552_6 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_14 + var_552_6
					end

					if var_552_9.prefab_name ~= "" and arg_549_1.actors_[var_552_9.prefab_name] ~= nil then
						local var_552_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_549_1.actors_[var_552_9.prefab_name].transform, "story_v_out_222031", "222031136", "story_v_out_222031.awb")

						arg_549_1:RecordAudio("222031136", var_552_15)
						arg_549_1:RecordAudio("222031136", var_552_15)
					else
						arg_549_1:AudioAction("play", "voice", "story_v_out_222031", "222031136", "story_v_out_222031.awb")
					end

					arg_549_1:RecordHistoryTalkVoice("story_v_out_222031", "222031136", "story_v_out_222031.awb")
				end

				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_16 = math.max(var_552_7, arg_549_1.talkMaxDuration)

			if var_552_6 <= arg_549_1.time_ and arg_549_1.time_ < var_552_6 + var_552_16 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_6) / var_552_16

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_6 + var_552_16 and arg_549_1.time_ < var_552_6 + var_552_16 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play222031137 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 222031137
		arg_553_1.duration_ = 9.133

		local var_553_0 = {
			ja = 9.133,
			ko = 9.066,
			zh = 9.066
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
				arg_553_0:Play222031138(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = arg_553_1.actors_["1074ui_story"]
			local var_556_1 = 0

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 and arg_553_1.var_.characterEffect1074ui_story == nil then
				arg_553_1.var_.characterEffect1074ui_story = var_556_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_556_2 = 0.200000002980232

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / var_556_2

				if arg_553_1.var_.characterEffect1074ui_story then
					arg_553_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 and arg_553_1.var_.characterEffect1074ui_story then
				arg_553_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_556_4 = 0
			local var_556_5 = 0.95

			if var_556_4 < arg_553_1.time_ and arg_553_1.time_ <= var_556_4 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, true)

				local var_556_6 = arg_553_1:FormatText(StoryNameCfg[410].name)

				arg_553_1.leftNameTxt_.text = var_556_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_553_1.leftNameTxt_.transform)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1.leftNameTxt_.text)
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_7 = arg_553_1:GetWordFromCfg(222031137)
				local var_556_8 = arg_553_1:FormatText(var_556_7.content)

				arg_553_1.text_.text = var_556_8

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_9 = 38
				local var_556_10 = utf8.len(var_556_8)
				local var_556_11 = var_556_9 <= 0 and var_556_5 or var_556_5 * (var_556_10 / var_556_9)

				if var_556_11 > 0 and var_556_5 < var_556_11 then
					arg_553_1.talkMaxDuration = var_556_11

					if var_556_11 + var_556_4 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_11 + var_556_4
					end
				end

				arg_553_1.text_.text = var_556_8
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031137", "story_v_out_222031.awb") ~= 0 then
					local var_556_12 = manager.audio:GetVoiceLength("story_v_out_222031", "222031137", "story_v_out_222031.awb") / 1000

					if var_556_12 + var_556_4 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_12 + var_556_4
					end

					if var_556_7.prefab_name ~= "" and arg_553_1.actors_[var_556_7.prefab_name] ~= nil then
						local var_556_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_553_1.actors_[var_556_7.prefab_name].transform, "story_v_out_222031", "222031137", "story_v_out_222031.awb")

						arg_553_1:RecordAudio("222031137", var_556_13)
						arg_553_1:RecordAudio("222031137", var_556_13)
					else
						arg_553_1:AudioAction("play", "voice", "story_v_out_222031", "222031137", "story_v_out_222031.awb")
					end

					arg_553_1:RecordHistoryTalkVoice("story_v_out_222031", "222031137", "story_v_out_222031.awb")
				end

				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_14 = math.max(var_556_5, arg_553_1.talkMaxDuration)

			if var_556_4 <= arg_553_1.time_ and arg_553_1.time_ < var_556_4 + var_556_14 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_4) / var_556_14

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_4 + var_556_14 and arg_553_1.time_ < var_556_4 + var_556_14 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play222031138 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 222031138
		arg_557_1.duration_ = 5.7

		local var_557_0 = {
			ja = 5.7,
			ko = 3.933,
			zh = 4.033
		}
		local var_557_1 = manager.audio:GetLocalizationFlag()

		if var_557_0[var_557_1] ~= nil then
			arg_557_1.duration_ = var_557_0[var_557_1]
		end

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play222031139(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = 0
			local var_560_1 = 0.5

			if var_560_0 < arg_557_1.time_ and arg_557_1.time_ <= var_560_0 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, true)

				local var_560_2 = arg_557_1:FormatText(StoryNameCfg[410].name)

				arg_557_1.leftNameTxt_.text = var_560_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_557_1.leftNameTxt_.transform)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1.leftNameTxt_.text)
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_3 = arg_557_1:GetWordFromCfg(222031138)
				local var_560_4 = arg_557_1:FormatText(var_560_3.content)

				arg_557_1.text_.text = var_560_4

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_5 = 20
				local var_560_6 = utf8.len(var_560_4)
				local var_560_7 = var_560_5 <= 0 and var_560_1 or var_560_1 * (var_560_6 / var_560_5)

				if var_560_7 > 0 and var_560_1 < var_560_7 then
					arg_557_1.talkMaxDuration = var_560_7

					if var_560_7 + var_560_0 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_7 + var_560_0
					end
				end

				arg_557_1.text_.text = var_560_4
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031138", "story_v_out_222031.awb") ~= 0 then
					local var_560_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031138", "story_v_out_222031.awb") / 1000

					if var_560_8 + var_560_0 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_8 + var_560_0
					end

					if var_560_3.prefab_name ~= "" and arg_557_1.actors_[var_560_3.prefab_name] ~= nil then
						local var_560_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_557_1.actors_[var_560_3.prefab_name].transform, "story_v_out_222031", "222031138", "story_v_out_222031.awb")

						arg_557_1:RecordAudio("222031138", var_560_9)
						arg_557_1:RecordAudio("222031138", var_560_9)
					else
						arg_557_1:AudioAction("play", "voice", "story_v_out_222031", "222031138", "story_v_out_222031.awb")
					end

					arg_557_1:RecordHistoryTalkVoice("story_v_out_222031", "222031138", "story_v_out_222031.awb")
				end

				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_10 = math.max(var_560_1, arg_557_1.talkMaxDuration)

			if var_560_0 <= arg_557_1.time_ and arg_557_1.time_ < var_560_0 + var_560_10 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_0) / var_560_10

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_0 + var_560_10 and arg_557_1.time_ < var_560_0 + var_560_10 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play222031139 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 222031139
		arg_561_1.duration_ = 16.133

		local var_561_0 = {
			ja = 16.133,
			ko = 14.266,
			zh = 14.266
		}
		local var_561_1 = manager.audio:GetLocalizationFlag()

		if var_561_0[var_561_1] ~= nil then
			arg_561_1.duration_ = var_561_0[var_561_1]
		end

		SetActive(arg_561_1.tipsGo_, false)

		function arg_561_1.onSingleLineFinish_()
			arg_561_1.onSingleLineUpdate_ = nil
			arg_561_1.onSingleLineFinish_ = nil
			arg_561_1.state_ = "waiting"
		end

		function arg_561_1.playNext_(arg_563_0)
			if arg_563_0 == 1 then
				arg_561_0:Play222031140(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = arg_561_1.actors_["1074ui_story"]
			local var_564_1 = 0

			if var_564_1 < arg_561_1.time_ and arg_561_1.time_ <= var_564_1 + arg_564_0 and arg_561_1.var_.characterEffect1074ui_story == nil then
				arg_561_1.var_.characterEffect1074ui_story = var_564_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_2 = 0.200000002980232

			if var_564_1 <= arg_561_1.time_ and arg_561_1.time_ < var_564_1 + var_564_2 then
				local var_564_3 = (arg_561_1.time_ - var_564_1) / var_564_2

				if arg_561_1.var_.characterEffect1074ui_story then
					local var_564_4 = Mathf.Lerp(0, 0.5, var_564_3)

					arg_561_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_561_1.var_.characterEffect1074ui_story.fillRatio = var_564_4
				end
			end

			if arg_561_1.time_ >= var_564_1 + var_564_2 and arg_561_1.time_ < var_564_1 + var_564_2 + arg_564_0 and arg_561_1.var_.characterEffect1074ui_story then
				local var_564_5 = 0.5

				arg_561_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_561_1.var_.characterEffect1074ui_story.fillRatio = var_564_5
			end

			local var_564_6 = 0
			local var_564_7 = 1.25

			if var_564_6 < arg_561_1.time_ and arg_561_1.time_ <= var_564_6 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, true)

				local var_564_8 = arg_561_1:FormatText(StoryNameCfg[461].name)

				arg_561_1.leftNameTxt_.text = var_564_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_561_1.leftNameTxt_.transform)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1.leftNameTxt_.text)
				SetActive(arg_561_1.iconTrs_.gameObject, true)
				arg_561_1.iconController_:SetSelectedState("hero")

				arg_561_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_9 = arg_561_1:GetWordFromCfg(222031139)
				local var_564_10 = arg_561_1:FormatText(var_564_9.content)

				arg_561_1.text_.text = var_564_10

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_11 = 50
				local var_564_12 = utf8.len(var_564_10)
				local var_564_13 = var_564_11 <= 0 and var_564_7 or var_564_7 * (var_564_12 / var_564_11)

				if var_564_13 > 0 and var_564_7 < var_564_13 then
					arg_561_1.talkMaxDuration = var_564_13

					if var_564_13 + var_564_6 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_13 + var_564_6
					end
				end

				arg_561_1.text_.text = var_564_10
				arg_561_1.typewritter.percent = 0

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031139", "story_v_out_222031.awb") ~= 0 then
					local var_564_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031139", "story_v_out_222031.awb") / 1000

					if var_564_14 + var_564_6 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_14 + var_564_6
					end

					if var_564_9.prefab_name ~= "" and arg_561_1.actors_[var_564_9.prefab_name] ~= nil then
						local var_564_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_561_1.actors_[var_564_9.prefab_name].transform, "story_v_out_222031", "222031139", "story_v_out_222031.awb")

						arg_561_1:RecordAudio("222031139", var_564_15)
						arg_561_1:RecordAudio("222031139", var_564_15)
					else
						arg_561_1:AudioAction("play", "voice", "story_v_out_222031", "222031139", "story_v_out_222031.awb")
					end

					arg_561_1:RecordHistoryTalkVoice("story_v_out_222031", "222031139", "story_v_out_222031.awb")
				end

				arg_561_1:RecordContent(arg_561_1.text_.text)
			end

			local var_564_16 = math.max(var_564_7, arg_561_1.talkMaxDuration)

			if var_564_6 <= arg_561_1.time_ and arg_561_1.time_ < var_564_6 + var_564_16 then
				arg_561_1.typewritter.percent = (arg_561_1.time_ - var_564_6) / var_564_16

				arg_561_1.typewritter:SetDirty()
			end

			if arg_561_1.time_ >= var_564_6 + var_564_16 and arg_561_1.time_ < var_564_6 + var_564_16 + arg_564_0 then
				arg_561_1.typewritter.percent = 1

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(true)
			end
		end
	end,
	Play222031140 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 222031140
		arg_565_1.duration_ = 10.933

		local var_565_0 = {
			ja = 10.933,
			ko = 8.466,
			zh = 8.466
		}
		local var_565_1 = manager.audio:GetLocalizationFlag()

		if var_565_0[var_565_1] ~= nil then
			arg_565_1.duration_ = var_565_0[var_565_1]
		end

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play222031141(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = 0
			local var_568_1 = 0.825

			if var_568_0 < arg_565_1.time_ and arg_565_1.time_ <= var_568_0 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, true)

				local var_568_2 = arg_565_1:FormatText(StoryNameCfg[461].name)

				arg_565_1.leftNameTxt_.text = var_568_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_565_1.leftNameTxt_.transform)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1.leftNameTxt_.text)
				SetActive(arg_565_1.iconTrs_.gameObject, true)
				arg_565_1.iconController_:SetSelectedState("hero")

				arg_565_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_3 = arg_565_1:GetWordFromCfg(222031140)
				local var_568_4 = arg_565_1:FormatText(var_568_3.content)

				arg_565_1.text_.text = var_568_4

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_5 = 33
				local var_568_6 = utf8.len(var_568_4)
				local var_568_7 = var_568_5 <= 0 and var_568_1 or var_568_1 * (var_568_6 / var_568_5)

				if var_568_7 > 0 and var_568_1 < var_568_7 then
					arg_565_1.talkMaxDuration = var_568_7

					if var_568_7 + var_568_0 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_7 + var_568_0
					end
				end

				arg_565_1.text_.text = var_568_4
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031140", "story_v_out_222031.awb") ~= 0 then
					local var_568_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031140", "story_v_out_222031.awb") / 1000

					if var_568_8 + var_568_0 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_8 + var_568_0
					end

					if var_568_3.prefab_name ~= "" and arg_565_1.actors_[var_568_3.prefab_name] ~= nil then
						local var_568_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_565_1.actors_[var_568_3.prefab_name].transform, "story_v_out_222031", "222031140", "story_v_out_222031.awb")

						arg_565_1:RecordAudio("222031140", var_568_9)
						arg_565_1:RecordAudio("222031140", var_568_9)
					else
						arg_565_1:AudioAction("play", "voice", "story_v_out_222031", "222031140", "story_v_out_222031.awb")
					end

					arg_565_1:RecordHistoryTalkVoice("story_v_out_222031", "222031140", "story_v_out_222031.awb")
				end

				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_10 = math.max(var_568_1, arg_565_1.talkMaxDuration)

			if var_568_0 <= arg_565_1.time_ and arg_565_1.time_ < var_568_0 + var_568_10 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_0) / var_568_10

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_0 + var_568_10 and arg_565_1.time_ < var_568_0 + var_568_10 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play222031141 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 222031141
		arg_569_1.duration_ = 16.233

		local var_569_0 = {
			ja = 16.233,
			ko = 14.166,
			zh = 14.2
		}
		local var_569_1 = manager.audio:GetLocalizationFlag()

		if var_569_0[var_569_1] ~= nil then
			arg_569_1.duration_ = var_569_0[var_569_1]
		end

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play222031142(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = 0
			local var_572_1 = 1.225

			if var_572_0 < arg_569_1.time_ and arg_569_1.time_ <= var_572_0 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, true)

				local var_572_2 = arg_569_1:FormatText(StoryNameCfg[461].name)

				arg_569_1.leftNameTxt_.text = var_572_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_569_1.leftNameTxt_.transform)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1.leftNameTxt_.text)
				SetActive(arg_569_1.iconTrs_.gameObject, true)
				arg_569_1.iconController_:SetSelectedState("hero")

				arg_569_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpaa")

				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_3 = arg_569_1:GetWordFromCfg(222031141)
				local var_572_4 = arg_569_1:FormatText(var_572_3.content)

				arg_569_1.text_.text = var_572_4

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_5 = 50
				local var_572_6 = utf8.len(var_572_4)
				local var_572_7 = var_572_5 <= 0 and var_572_1 or var_572_1 * (var_572_6 / var_572_5)

				if var_572_7 > 0 and var_572_1 < var_572_7 then
					arg_569_1.talkMaxDuration = var_572_7

					if var_572_7 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_7 + var_572_0
					end
				end

				arg_569_1.text_.text = var_572_4
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031141", "story_v_out_222031.awb") ~= 0 then
					local var_572_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031141", "story_v_out_222031.awb") / 1000

					if var_572_8 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_8 + var_572_0
					end

					if var_572_3.prefab_name ~= "" and arg_569_1.actors_[var_572_3.prefab_name] ~= nil then
						local var_572_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_569_1.actors_[var_572_3.prefab_name].transform, "story_v_out_222031", "222031141", "story_v_out_222031.awb")

						arg_569_1:RecordAudio("222031141", var_572_9)
						arg_569_1:RecordAudio("222031141", var_572_9)
					else
						arg_569_1:AudioAction("play", "voice", "story_v_out_222031", "222031141", "story_v_out_222031.awb")
					end

					arg_569_1:RecordHistoryTalkVoice("story_v_out_222031", "222031141", "story_v_out_222031.awb")
				end

				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_10 = math.max(var_572_1, arg_569_1.talkMaxDuration)

			if var_572_0 <= arg_569_1.time_ and arg_569_1.time_ < var_572_0 + var_572_10 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_0) / var_572_10

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_0 + var_572_10 and arg_569_1.time_ < var_572_0 + var_572_10 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play222031142 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 222031142
		arg_573_1.duration_ = 6.8

		local var_573_0 = {
			ja = 6.8,
			ko = 4.9,
			zh = 4.9
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
				arg_573_0:Play222031143(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = arg_573_1.actors_["1074ui_story"]
			local var_576_1 = 0

			if var_576_1 < arg_573_1.time_ and arg_573_1.time_ <= var_576_1 + arg_576_0 and arg_573_1.var_.characterEffect1074ui_story == nil then
				arg_573_1.var_.characterEffect1074ui_story = var_576_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_576_2 = 0.200000002980232

			if var_576_1 <= arg_573_1.time_ and arg_573_1.time_ < var_576_1 + var_576_2 then
				local var_576_3 = (arg_573_1.time_ - var_576_1) / var_576_2

				if arg_573_1.var_.characterEffect1074ui_story then
					arg_573_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_573_1.time_ >= var_576_1 + var_576_2 and arg_573_1.time_ < var_576_1 + var_576_2 + arg_576_0 and arg_573_1.var_.characterEffect1074ui_story then
				arg_573_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_576_4 = 0

			if var_576_4 < arg_573_1.time_ and arg_573_1.time_ <= var_576_4 + arg_576_0 then
				arg_573_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_576_5 = 0
			local var_576_6 = 0.475

			if var_576_5 < arg_573_1.time_ and arg_573_1.time_ <= var_576_5 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, true)

				local var_576_7 = arg_573_1:FormatText(StoryNameCfg[410].name)

				arg_573_1.leftNameTxt_.text = var_576_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_573_1.leftNameTxt_.transform)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1.leftNameTxt_.text)
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_8 = arg_573_1:GetWordFromCfg(222031142)
				local var_576_9 = arg_573_1:FormatText(var_576_8.content)

				arg_573_1.text_.text = var_576_9

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_10 = 19
				local var_576_11 = utf8.len(var_576_9)
				local var_576_12 = var_576_10 <= 0 and var_576_6 or var_576_6 * (var_576_11 / var_576_10)

				if var_576_12 > 0 and var_576_6 < var_576_12 then
					arg_573_1.talkMaxDuration = var_576_12

					if var_576_12 + var_576_5 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_12 + var_576_5
					end
				end

				arg_573_1.text_.text = var_576_9
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031142", "story_v_out_222031.awb") ~= 0 then
					local var_576_13 = manager.audio:GetVoiceLength("story_v_out_222031", "222031142", "story_v_out_222031.awb") / 1000

					if var_576_13 + var_576_5 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_13 + var_576_5
					end

					if var_576_8.prefab_name ~= "" and arg_573_1.actors_[var_576_8.prefab_name] ~= nil then
						local var_576_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_573_1.actors_[var_576_8.prefab_name].transform, "story_v_out_222031", "222031142", "story_v_out_222031.awb")

						arg_573_1:RecordAudio("222031142", var_576_14)
						arg_573_1:RecordAudio("222031142", var_576_14)
					else
						arg_573_1:AudioAction("play", "voice", "story_v_out_222031", "222031142", "story_v_out_222031.awb")
					end

					arg_573_1:RecordHistoryTalkVoice("story_v_out_222031", "222031142", "story_v_out_222031.awb")
				end

				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_15 = math.max(var_576_6, arg_573_1.talkMaxDuration)

			if var_576_5 <= arg_573_1.time_ and arg_573_1.time_ < var_576_5 + var_576_15 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_5) / var_576_15

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_5 + var_576_15 and arg_573_1.time_ < var_576_5 + var_576_15 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play222031143 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 222031143
		arg_577_1.duration_ = 5

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play222031144(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = arg_577_1.actors_["1074ui_story"].transform
			local var_580_1 = 0

			if var_580_1 < arg_577_1.time_ and arg_577_1.time_ <= var_580_1 + arg_580_0 then
				arg_577_1.var_.moveOldPos1074ui_story = var_580_0.localPosition
			end

			local var_580_2 = 0.001

			if var_580_1 <= arg_577_1.time_ and arg_577_1.time_ < var_580_1 + var_580_2 then
				local var_580_3 = (arg_577_1.time_ - var_580_1) / var_580_2
				local var_580_4 = Vector3.New(0, 100, 0)

				var_580_0.localPosition = Vector3.Lerp(arg_577_1.var_.moveOldPos1074ui_story, var_580_4, var_580_3)

				local var_580_5 = manager.ui.mainCamera.transform.position - var_580_0.position

				var_580_0.forward = Vector3.New(var_580_5.x, var_580_5.y, var_580_5.z)

				local var_580_6 = var_580_0.localEulerAngles

				var_580_6.z = 0
				var_580_6.x = 0
				var_580_0.localEulerAngles = var_580_6
			end

			if arg_577_1.time_ >= var_580_1 + var_580_2 and arg_577_1.time_ < var_580_1 + var_580_2 + arg_580_0 then
				var_580_0.localPosition = Vector3.New(0, 100, 0)

				local var_580_7 = manager.ui.mainCamera.transform.position - var_580_0.position

				var_580_0.forward = Vector3.New(var_580_7.x, var_580_7.y, var_580_7.z)

				local var_580_8 = var_580_0.localEulerAngles

				var_580_8.z = 0
				var_580_8.x = 0
				var_580_0.localEulerAngles = var_580_8
			end

			local var_580_9 = arg_577_1.actors_["1074ui_story"]
			local var_580_10 = 0

			if var_580_10 < arg_577_1.time_ and arg_577_1.time_ <= var_580_10 + arg_580_0 and arg_577_1.var_.characterEffect1074ui_story == nil then
				arg_577_1.var_.characterEffect1074ui_story = var_580_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_11 = 0.200000002980232

			if var_580_10 <= arg_577_1.time_ and arg_577_1.time_ < var_580_10 + var_580_11 then
				local var_580_12 = (arg_577_1.time_ - var_580_10) / var_580_11

				if arg_577_1.var_.characterEffect1074ui_story then
					local var_580_13 = Mathf.Lerp(0, 0.5, var_580_12)

					arg_577_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_577_1.var_.characterEffect1074ui_story.fillRatio = var_580_13
				end
			end

			if arg_577_1.time_ >= var_580_10 + var_580_11 and arg_577_1.time_ < var_580_10 + var_580_11 + arg_580_0 and arg_577_1.var_.characterEffect1074ui_story then
				local var_580_14 = 0.5

				arg_577_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_577_1.var_.characterEffect1074ui_story.fillRatio = var_580_14
			end

			local var_580_15 = 0
			local var_580_16 = 1.075

			if var_580_15 < arg_577_1.time_ and arg_577_1.time_ <= var_580_15 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, false)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_17 = arg_577_1:GetWordFromCfg(222031143)
				local var_580_18 = arg_577_1:FormatText(var_580_17.content)

				arg_577_1.text_.text = var_580_18

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_19 = 43
				local var_580_20 = utf8.len(var_580_18)
				local var_580_21 = var_580_19 <= 0 and var_580_16 or var_580_16 * (var_580_20 / var_580_19)

				if var_580_21 > 0 and var_580_16 < var_580_21 then
					arg_577_1.talkMaxDuration = var_580_21

					if var_580_21 + var_580_15 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_21 + var_580_15
					end
				end

				arg_577_1.text_.text = var_580_18
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)
				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_22 = math.max(var_580_16, arg_577_1.talkMaxDuration)

			if var_580_15 <= arg_577_1.time_ and arg_577_1.time_ < var_580_15 + var_580_22 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_15) / var_580_22

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_15 + var_580_22 and arg_577_1.time_ < var_580_15 + var_580_22 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play222031144 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 222031144
		arg_581_1.duration_ = 4.866

		local var_581_0 = {
			ja = 4.866,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_581_1 = manager.audio:GetLocalizationFlag()

		if var_581_0[var_581_1] ~= nil then
			arg_581_1.duration_ = var_581_0[var_581_1]
		end

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play222031145(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = arg_581_1.actors_["1070ui_story"].transform
			local var_584_1 = 0

			if var_584_1 < arg_581_1.time_ and arg_581_1.time_ <= var_584_1 + arg_584_0 then
				arg_581_1.var_.moveOldPos1070ui_story = var_584_0.localPosition
			end

			local var_584_2 = 0.001

			if var_584_1 <= arg_581_1.time_ and arg_581_1.time_ < var_584_1 + var_584_2 then
				local var_584_3 = (arg_581_1.time_ - var_584_1) / var_584_2
				local var_584_4 = Vector3.New(0, -0.95, -6.05)

				var_584_0.localPosition = Vector3.Lerp(arg_581_1.var_.moveOldPos1070ui_story, var_584_4, var_584_3)

				local var_584_5 = manager.ui.mainCamera.transform.position - var_584_0.position

				var_584_0.forward = Vector3.New(var_584_5.x, var_584_5.y, var_584_5.z)

				local var_584_6 = var_584_0.localEulerAngles

				var_584_6.z = 0
				var_584_6.x = 0
				var_584_0.localEulerAngles = var_584_6
			end

			if arg_581_1.time_ >= var_584_1 + var_584_2 and arg_581_1.time_ < var_584_1 + var_584_2 + arg_584_0 then
				var_584_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_584_7 = manager.ui.mainCamera.transform.position - var_584_0.position

				var_584_0.forward = Vector3.New(var_584_7.x, var_584_7.y, var_584_7.z)

				local var_584_8 = var_584_0.localEulerAngles

				var_584_8.z = 0
				var_584_8.x = 0
				var_584_0.localEulerAngles = var_584_8
			end

			local var_584_9 = arg_581_1.actors_["1070ui_story"]
			local var_584_10 = 0

			if var_584_10 < arg_581_1.time_ and arg_581_1.time_ <= var_584_10 + arg_584_0 and arg_581_1.var_.characterEffect1070ui_story == nil then
				arg_581_1.var_.characterEffect1070ui_story = var_584_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_584_11 = 0.200000002980232

			if var_584_10 <= arg_581_1.time_ and arg_581_1.time_ < var_584_10 + var_584_11 then
				local var_584_12 = (arg_581_1.time_ - var_584_10) / var_584_11

				if arg_581_1.var_.characterEffect1070ui_story then
					arg_581_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_581_1.time_ >= var_584_10 + var_584_11 and arg_581_1.time_ < var_584_10 + var_584_11 + arg_584_0 and arg_581_1.var_.characterEffect1070ui_story then
				arg_581_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_584_13 = 0

			if var_584_13 < arg_581_1.time_ and arg_581_1.time_ <= var_584_13 + arg_584_0 then
				arg_581_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action1_1")
			end

			local var_584_14 = 0

			if var_584_14 < arg_581_1.time_ and arg_581_1.time_ <= var_584_14 + arg_584_0 then
				arg_581_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_584_15 = 0
			local var_584_16 = 0.25

			if var_584_15 < arg_581_1.time_ and arg_581_1.time_ <= var_584_15 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_17 = arg_581_1:FormatText(StoryNameCfg[318].name)

				arg_581_1.leftNameTxt_.text = var_584_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_18 = arg_581_1:GetWordFromCfg(222031144)
				local var_584_19 = arg_581_1:FormatText(var_584_18.content)

				arg_581_1.text_.text = var_584_19

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_20 = 10
				local var_584_21 = utf8.len(var_584_19)
				local var_584_22 = var_584_20 <= 0 and var_584_16 or var_584_16 * (var_584_21 / var_584_20)

				if var_584_22 > 0 and var_584_16 < var_584_22 then
					arg_581_1.talkMaxDuration = var_584_22

					if var_584_22 + var_584_15 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_22 + var_584_15
					end
				end

				arg_581_1.text_.text = var_584_19
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031144", "story_v_out_222031.awb") ~= 0 then
					local var_584_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031144", "story_v_out_222031.awb") / 1000

					if var_584_23 + var_584_15 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_23 + var_584_15
					end

					if var_584_18.prefab_name ~= "" and arg_581_1.actors_[var_584_18.prefab_name] ~= nil then
						local var_584_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_581_1.actors_[var_584_18.prefab_name].transform, "story_v_out_222031", "222031144", "story_v_out_222031.awb")

						arg_581_1:RecordAudio("222031144", var_584_24)
						arg_581_1:RecordAudio("222031144", var_584_24)
					else
						arg_581_1:AudioAction("play", "voice", "story_v_out_222031", "222031144", "story_v_out_222031.awb")
					end

					arg_581_1:RecordHistoryTalkVoice("story_v_out_222031", "222031144", "story_v_out_222031.awb")
				end

				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_25 = math.max(var_584_16, arg_581_1.talkMaxDuration)

			if var_584_15 <= arg_581_1.time_ and arg_581_1.time_ < var_584_15 + var_584_25 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_15) / var_584_25

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_15 + var_584_25 and arg_581_1.time_ < var_584_15 + var_584_25 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play222031145 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 222031145
		arg_585_1.duration_ = 8.96599999815226

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play222031146(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = "ST37a"

			if arg_585_1.bgs_[var_588_0] == nil then
				local var_588_1 = Object.Instantiate(arg_585_1.paintGo_)

				var_588_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_588_0)
				var_588_1.name = var_588_0
				var_588_1.transform.parent = arg_585_1.stage_.transform
				var_588_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_585_1.bgs_[var_588_0] = var_588_1
			end

			local var_588_2 = 2

			if var_588_2 < arg_585_1.time_ and arg_585_1.time_ <= var_588_2 + arg_588_0 then
				local var_588_3 = manager.ui.mainCamera.transform.localPosition
				local var_588_4 = Vector3.New(0, 0, 10) + Vector3.New(var_588_3.x, var_588_3.y, 0)
				local var_588_5 = arg_585_1.bgs_.ST37a

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
					if iter_588_0 ~= "ST37a" then
						iter_588_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_588_16 = 0

			if var_588_16 < arg_585_1.time_ and arg_585_1.time_ <= var_588_16 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_17 = 2

			if var_588_16 <= arg_585_1.time_ and arg_585_1.time_ < var_588_16 + var_588_17 then
				local var_588_18 = (arg_585_1.time_ - var_588_16) / var_588_17
				local var_588_19 = Color.New(0, 0, 0)

				var_588_19.a = Mathf.Lerp(0, 1, var_588_18)
				arg_585_1.mask_.color = var_588_19
			end

			if arg_585_1.time_ >= var_588_16 + var_588_17 and arg_585_1.time_ < var_588_16 + var_588_17 + arg_588_0 then
				local var_588_20 = Color.New(0, 0, 0)

				var_588_20.a = 1
				arg_585_1.mask_.color = var_588_20
			end

			local var_588_21 = 2

			if var_588_21 < arg_585_1.time_ and arg_585_1.time_ <= var_588_21 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_22 = 2

			if var_588_21 <= arg_585_1.time_ and arg_585_1.time_ < var_588_21 + var_588_22 then
				local var_588_23 = (arg_585_1.time_ - var_588_21) / var_588_22
				local var_588_24 = Color.New(0, 0, 0)

				var_588_24.a = Mathf.Lerp(1, 0, var_588_23)
				arg_585_1.mask_.color = var_588_24
			end

			if arg_585_1.time_ >= var_588_21 + var_588_22 and arg_585_1.time_ < var_588_21 + var_588_22 + arg_588_0 then
				local var_588_25 = Color.New(0, 0, 0)
				local var_588_26 = 0

				arg_585_1.mask_.enabled = false
				var_588_25.a = var_588_26
				arg_585_1.mask_.color = var_588_25
			end

			local var_588_27 = arg_585_1.actors_["1070ui_story"].transform
			local var_588_28 = 1.96599999815226

			if var_588_28 < arg_585_1.time_ and arg_585_1.time_ <= var_588_28 + arg_588_0 then
				arg_585_1.var_.moveOldPos1070ui_story = var_588_27.localPosition
			end

			local var_588_29 = 0.001

			if var_588_28 <= arg_585_1.time_ and arg_585_1.time_ < var_588_28 + var_588_29 then
				local var_588_30 = (arg_585_1.time_ - var_588_28) / var_588_29
				local var_588_31 = Vector3.New(0, 100, 0)

				var_588_27.localPosition = Vector3.Lerp(arg_585_1.var_.moveOldPos1070ui_story, var_588_31, var_588_30)

				local var_588_32 = manager.ui.mainCamera.transform.position - var_588_27.position

				var_588_27.forward = Vector3.New(var_588_32.x, var_588_32.y, var_588_32.z)

				local var_588_33 = var_588_27.localEulerAngles

				var_588_33.z = 0
				var_588_33.x = 0
				var_588_27.localEulerAngles = var_588_33
			end

			if arg_585_1.time_ >= var_588_28 + var_588_29 and arg_585_1.time_ < var_588_28 + var_588_29 + arg_588_0 then
				var_588_27.localPosition = Vector3.New(0, 100, 0)

				local var_588_34 = manager.ui.mainCamera.transform.position - var_588_27.position

				var_588_27.forward = Vector3.New(var_588_34.x, var_588_34.y, var_588_34.z)

				local var_588_35 = var_588_27.localEulerAngles

				var_588_35.z = 0
				var_588_35.x = 0
				var_588_27.localEulerAngles = var_588_35
			end

			local var_588_36 = arg_585_1.actors_["1070ui_story"]
			local var_588_37 = 1.96599999815226

			if var_588_37 < arg_585_1.time_ and arg_585_1.time_ <= var_588_37 + arg_588_0 and arg_585_1.var_.characterEffect1070ui_story == nil then
				arg_585_1.var_.characterEffect1070ui_story = var_588_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_588_38 = 0.034000001847744

			if var_588_37 <= arg_585_1.time_ and arg_585_1.time_ < var_588_37 + var_588_38 then
				local var_588_39 = (arg_585_1.time_ - var_588_37) / var_588_38

				if arg_585_1.var_.characterEffect1070ui_story then
					local var_588_40 = Mathf.Lerp(0, 0.5, var_588_39)

					arg_585_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_585_1.var_.characterEffect1070ui_story.fillRatio = var_588_40
				end
			end

			if arg_585_1.time_ >= var_588_37 + var_588_38 and arg_585_1.time_ < var_588_37 + var_588_38 + arg_588_0 and arg_585_1.var_.characterEffect1070ui_story then
				local var_588_41 = 0.5

				arg_585_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_585_1.var_.characterEffect1070ui_story.fillRatio = var_588_41
			end

			if arg_585_1.frameCnt_ <= 1 then
				arg_585_1.dialog_:SetActive(false)
			end

			local var_588_42 = 3.96599999815226
			local var_588_43 = 0.575

			if var_588_42 < arg_585_1.time_ and arg_585_1.time_ <= var_588_42 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0

				arg_585_1.dialog_:SetActive(true)

				local var_588_44 = LeanTween.value(arg_585_1.dialog_, 0, 1, 0.3)

				var_588_44:setOnUpdate(LuaHelper.FloatAction(function(arg_589_0)
					arg_585_1.dialogCg_.alpha = arg_589_0
				end))
				var_588_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_585_1.dialog_)
					var_588_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_585_1.duration_ = arg_585_1.duration_ + 0.3

				SetActive(arg_585_1.leftNameGo_, false)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_45 = arg_585_1:GetWordFromCfg(222031145)
				local var_588_46 = arg_585_1:FormatText(var_588_45.content)

				arg_585_1.text_.text = var_588_46

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_47 = 23
				local var_588_48 = utf8.len(var_588_46)
				local var_588_49 = var_588_47 <= 0 and var_588_43 or var_588_43 * (var_588_48 / var_588_47)

				if var_588_49 > 0 and var_588_43 < var_588_49 then
					arg_585_1.talkMaxDuration = var_588_49
					var_588_42 = var_588_42 + 0.3

					if var_588_49 + var_588_42 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_49 + var_588_42
					end
				end

				arg_585_1.text_.text = var_588_46
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)
				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_50 = var_588_42 + 0.3
			local var_588_51 = math.max(var_588_43, arg_585_1.talkMaxDuration)

			if var_588_50 <= arg_585_1.time_ and arg_585_1.time_ < var_588_50 + var_588_51 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_50) / var_588_51

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_50 + var_588_51 and arg_585_1.time_ < var_588_50 + var_588_51 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play222031146 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 222031146
		arg_591_1.duration_ = 5.5

		local var_591_0 = {
			ja = 5.5,
			ko = 3.766,
			zh = 3.8
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
				arg_591_0:Play222031147(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = "10044ui_story"

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

			local var_594_4 = arg_591_1.actors_["10044ui_story"].transform
			local var_594_5 = 0

			if var_594_5 < arg_591_1.time_ and arg_591_1.time_ <= var_594_5 + arg_594_0 then
				arg_591_1.var_.moveOldPos10044ui_story = var_594_4.localPosition
			end

			local var_594_6 = 0.001

			if var_594_5 <= arg_591_1.time_ and arg_591_1.time_ < var_594_5 + var_594_6 then
				local var_594_7 = (arg_591_1.time_ - var_594_5) / var_594_6
				local var_594_8 = Vector3.New(-0.7, -0.72, -6.3)

				var_594_4.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos10044ui_story, var_594_8, var_594_7)

				local var_594_9 = manager.ui.mainCamera.transform.position - var_594_4.position

				var_594_4.forward = Vector3.New(var_594_9.x, var_594_9.y, var_594_9.z)

				local var_594_10 = var_594_4.localEulerAngles

				var_594_10.z = 0
				var_594_10.x = 0
				var_594_4.localEulerAngles = var_594_10
			end

			if arg_591_1.time_ >= var_594_5 + var_594_6 and arg_591_1.time_ < var_594_5 + var_594_6 + arg_594_0 then
				var_594_4.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_594_11 = manager.ui.mainCamera.transform.position - var_594_4.position

				var_594_4.forward = Vector3.New(var_594_11.x, var_594_11.y, var_594_11.z)

				local var_594_12 = var_594_4.localEulerAngles

				var_594_12.z = 0
				var_594_12.x = 0
				var_594_4.localEulerAngles = var_594_12
			end

			local var_594_13 = arg_591_1.actors_["10044ui_story"]
			local var_594_14 = 0

			if var_594_14 < arg_591_1.time_ and arg_591_1.time_ <= var_594_14 + arg_594_0 and arg_591_1.var_.characterEffect10044ui_story == nil then
				arg_591_1.var_.characterEffect10044ui_story = var_594_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_15 = 0.200000002980232

			if var_594_14 <= arg_591_1.time_ and arg_591_1.time_ < var_594_14 + var_594_15 then
				local var_594_16 = (arg_591_1.time_ - var_594_14) / var_594_15

				if arg_591_1.var_.characterEffect10044ui_story then
					arg_591_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_591_1.time_ >= var_594_14 + var_594_15 and arg_591_1.time_ < var_594_14 + var_594_15 + arg_594_0 and arg_591_1.var_.characterEffect10044ui_story then
				arg_591_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_594_17 = 0

			if var_594_17 < arg_591_1.time_ and arg_591_1.time_ <= var_594_17 + arg_594_0 then
				arg_591_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_594_18 = 0

			if var_594_18 < arg_591_1.time_ and arg_591_1.time_ <= var_594_18 + arg_594_0 then
				arg_591_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_594_19 = arg_591_1.actors_["1074ui_story"].transform
			local var_594_20 = 0

			if var_594_20 < arg_591_1.time_ and arg_591_1.time_ <= var_594_20 + arg_594_0 then
				arg_591_1.var_.moveOldPos1074ui_story = var_594_19.localPosition
			end

			local var_594_21 = 0.001

			if var_594_20 <= arg_591_1.time_ and arg_591_1.time_ < var_594_20 + var_594_21 then
				local var_594_22 = (arg_591_1.time_ - var_594_20) / var_594_21
				local var_594_23 = Vector3.New(0.7, -1.055, -6.12)

				var_594_19.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos1074ui_story, var_594_23, var_594_22)

				local var_594_24 = manager.ui.mainCamera.transform.position - var_594_19.position

				var_594_19.forward = Vector3.New(var_594_24.x, var_594_24.y, var_594_24.z)

				local var_594_25 = var_594_19.localEulerAngles

				var_594_25.z = 0
				var_594_25.x = 0
				var_594_19.localEulerAngles = var_594_25
			end

			if arg_591_1.time_ >= var_594_20 + var_594_21 and arg_591_1.time_ < var_594_20 + var_594_21 + arg_594_0 then
				var_594_19.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_594_26 = manager.ui.mainCamera.transform.position - var_594_19.position

				var_594_19.forward = Vector3.New(var_594_26.x, var_594_26.y, var_594_26.z)

				local var_594_27 = var_594_19.localEulerAngles

				var_594_27.z = 0
				var_594_27.x = 0
				var_594_19.localEulerAngles = var_594_27
			end

			local var_594_28 = arg_591_1.actors_["1074ui_story"]
			local var_594_29 = 0

			if var_594_29 < arg_591_1.time_ and arg_591_1.time_ <= var_594_29 + arg_594_0 and arg_591_1.var_.characterEffect1074ui_story == nil then
				arg_591_1.var_.characterEffect1074ui_story = var_594_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_30 = 0.200000002980232

			if var_594_29 <= arg_591_1.time_ and arg_591_1.time_ < var_594_29 + var_594_30 then
				local var_594_31 = (arg_591_1.time_ - var_594_29) / var_594_30

				if arg_591_1.var_.characterEffect1074ui_story then
					local var_594_32 = Mathf.Lerp(0, 0.5, var_594_31)

					arg_591_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_591_1.var_.characterEffect1074ui_story.fillRatio = var_594_32
				end
			end

			if arg_591_1.time_ >= var_594_29 + var_594_30 and arg_591_1.time_ < var_594_29 + var_594_30 + arg_594_0 and arg_591_1.var_.characterEffect1074ui_story then
				local var_594_33 = 0.5

				arg_591_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_591_1.var_.characterEffect1074ui_story.fillRatio = var_594_33
			end

			local var_594_34 = 0
			local var_594_35 = 0.275

			if var_594_34 < arg_591_1.time_ and arg_591_1.time_ <= var_594_34 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_36 = arg_591_1:FormatText(StoryNameCfg[380].name)

				arg_591_1.leftNameTxt_.text = var_594_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_37 = arg_591_1:GetWordFromCfg(222031146)
				local var_594_38 = arg_591_1:FormatText(var_594_37.content)

				arg_591_1.text_.text = var_594_38

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_39 = 11
				local var_594_40 = utf8.len(var_594_38)
				local var_594_41 = var_594_39 <= 0 and var_594_35 or var_594_35 * (var_594_40 / var_594_39)

				if var_594_41 > 0 and var_594_35 < var_594_41 then
					arg_591_1.talkMaxDuration = var_594_41

					if var_594_41 + var_594_34 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_41 + var_594_34
					end
				end

				arg_591_1.text_.text = var_594_38
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031146", "story_v_out_222031.awb") ~= 0 then
					local var_594_42 = manager.audio:GetVoiceLength("story_v_out_222031", "222031146", "story_v_out_222031.awb") / 1000

					if var_594_42 + var_594_34 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_42 + var_594_34
					end

					if var_594_37.prefab_name ~= "" and arg_591_1.actors_[var_594_37.prefab_name] ~= nil then
						local var_594_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_37.prefab_name].transform, "story_v_out_222031", "222031146", "story_v_out_222031.awb")

						arg_591_1:RecordAudio("222031146", var_594_43)
						arg_591_1:RecordAudio("222031146", var_594_43)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_out_222031", "222031146", "story_v_out_222031.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_out_222031", "222031146", "story_v_out_222031.awb")
				end

				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_44 = math.max(var_594_35, arg_591_1.talkMaxDuration)

			if var_594_34 <= arg_591_1.time_ and arg_591_1.time_ < var_594_34 + var_594_44 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_34) / var_594_44

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_34 + var_594_44 and arg_591_1.time_ < var_594_34 + var_594_44 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play222031147 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 222031147
		arg_595_1.duration_ = 12.9

		local var_595_0 = {
			ja = 12.9,
			ko = 5.433,
			zh = 5.466
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
				arg_595_0:Play222031148(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1074ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect1074ui_story == nil then
				arg_595_1.var_.characterEffect1074ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.200000002980232

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect1074ui_story then
					arg_595_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect1074ui_story then
				arg_595_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_598_4 = 0

			if var_598_4 < arg_595_1.time_ and arg_595_1.time_ <= var_598_4 + arg_598_0 then
				arg_595_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_598_5 = 0

			if var_598_5 < arg_595_1.time_ and arg_595_1.time_ <= var_598_5 + arg_598_0 then
				arg_595_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_598_6 = arg_595_1.actors_["10044ui_story"]
			local var_598_7 = 0

			if var_598_7 < arg_595_1.time_ and arg_595_1.time_ <= var_598_7 + arg_598_0 and arg_595_1.var_.characterEffect10044ui_story == nil then
				arg_595_1.var_.characterEffect10044ui_story = var_598_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_8 = 0.200000002980232

			if var_598_7 <= arg_595_1.time_ and arg_595_1.time_ < var_598_7 + var_598_8 then
				local var_598_9 = (arg_595_1.time_ - var_598_7) / var_598_8

				if arg_595_1.var_.characterEffect10044ui_story then
					local var_598_10 = Mathf.Lerp(0, 0.5, var_598_9)

					arg_595_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_595_1.var_.characterEffect10044ui_story.fillRatio = var_598_10
				end
			end

			if arg_595_1.time_ >= var_598_7 + var_598_8 and arg_595_1.time_ < var_598_7 + var_598_8 + arg_598_0 and arg_595_1.var_.characterEffect10044ui_story then
				local var_598_11 = 0.5

				arg_595_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_595_1.var_.characterEffect10044ui_story.fillRatio = var_598_11
			end

			local var_598_12 = 0
			local var_598_13 = 0.575

			if var_598_12 < arg_595_1.time_ and arg_595_1.time_ <= var_598_12 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_14 = arg_595_1:FormatText(StoryNameCfg[410].name)

				arg_595_1.leftNameTxt_.text = var_598_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_15 = arg_595_1:GetWordFromCfg(222031147)
				local var_598_16 = arg_595_1:FormatText(var_598_15.content)

				arg_595_1.text_.text = var_598_16

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_17 = 23
				local var_598_18 = utf8.len(var_598_16)
				local var_598_19 = var_598_17 <= 0 and var_598_13 or var_598_13 * (var_598_18 / var_598_17)

				if var_598_19 > 0 and var_598_13 < var_598_19 then
					arg_595_1.talkMaxDuration = var_598_19

					if var_598_19 + var_598_12 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_19 + var_598_12
					end
				end

				arg_595_1.text_.text = var_598_16
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031147", "story_v_out_222031.awb") ~= 0 then
					local var_598_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031147", "story_v_out_222031.awb") / 1000

					if var_598_20 + var_598_12 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_20 + var_598_12
					end

					if var_598_15.prefab_name ~= "" and arg_595_1.actors_[var_598_15.prefab_name] ~= nil then
						local var_598_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_15.prefab_name].transform, "story_v_out_222031", "222031147", "story_v_out_222031.awb")

						arg_595_1:RecordAudio("222031147", var_598_21)
						arg_595_1:RecordAudio("222031147", var_598_21)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_out_222031", "222031147", "story_v_out_222031.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_out_222031", "222031147", "story_v_out_222031.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_22 = math.max(var_598_13, arg_595_1.talkMaxDuration)

			if var_598_12 <= arg_595_1.time_ and arg_595_1.time_ < var_598_12 + var_598_22 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_12) / var_598_22

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_12 + var_598_22 and arg_595_1.time_ < var_598_12 + var_598_22 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play222031148 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 222031148
		arg_599_1.duration_ = 7.3

		local var_599_0 = {
			ja = 7.3,
			ko = 2.9,
			zh = 2.9
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
				arg_599_0:Play222031149(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["10044ui_story"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and arg_599_1.var_.characterEffect10044ui_story == nil then
				arg_599_1.var_.characterEffect10044ui_story = var_602_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_2 = 0.200000002980232

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.characterEffect10044ui_story then
					arg_599_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and arg_599_1.var_.characterEffect10044ui_story then
				arg_599_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_602_4 = 0

			if var_602_4 < arg_599_1.time_ and arg_599_1.time_ <= var_602_4 + arg_602_0 then
				arg_599_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_602_5 = 0

			if var_602_5 < arg_599_1.time_ and arg_599_1.time_ <= var_602_5 + arg_602_0 then
				arg_599_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_602_6 = arg_599_1.actors_["1074ui_story"]
			local var_602_7 = 0

			if var_602_7 < arg_599_1.time_ and arg_599_1.time_ <= var_602_7 + arg_602_0 and arg_599_1.var_.characterEffect1074ui_story == nil then
				arg_599_1.var_.characterEffect1074ui_story = var_602_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_8 = 0.200000002980232

			if var_602_7 <= arg_599_1.time_ and arg_599_1.time_ < var_602_7 + var_602_8 then
				local var_602_9 = (arg_599_1.time_ - var_602_7) / var_602_8

				if arg_599_1.var_.characterEffect1074ui_story then
					local var_602_10 = Mathf.Lerp(0, 0.5, var_602_9)

					arg_599_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_599_1.var_.characterEffect1074ui_story.fillRatio = var_602_10
				end
			end

			if arg_599_1.time_ >= var_602_7 + var_602_8 and arg_599_1.time_ < var_602_7 + var_602_8 + arg_602_0 and arg_599_1.var_.characterEffect1074ui_story then
				local var_602_11 = 0.5

				arg_599_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_599_1.var_.characterEffect1074ui_story.fillRatio = var_602_11
			end

			local var_602_12 = 0
			local var_602_13 = 0.375

			if var_602_12 < arg_599_1.time_ and arg_599_1.time_ <= var_602_12 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_14 = arg_599_1:FormatText(StoryNameCfg[380].name)

				arg_599_1.leftNameTxt_.text = var_602_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_15 = arg_599_1:GetWordFromCfg(222031148)
				local var_602_16 = arg_599_1:FormatText(var_602_15.content)

				arg_599_1.text_.text = var_602_16

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_17 = 15
				local var_602_18 = utf8.len(var_602_16)
				local var_602_19 = var_602_17 <= 0 and var_602_13 or var_602_13 * (var_602_18 / var_602_17)

				if var_602_19 > 0 and var_602_13 < var_602_19 then
					arg_599_1.talkMaxDuration = var_602_19

					if var_602_19 + var_602_12 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_19 + var_602_12
					end
				end

				arg_599_1.text_.text = var_602_16
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031148", "story_v_out_222031.awb") ~= 0 then
					local var_602_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031148", "story_v_out_222031.awb") / 1000

					if var_602_20 + var_602_12 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_20 + var_602_12
					end

					if var_602_15.prefab_name ~= "" and arg_599_1.actors_[var_602_15.prefab_name] ~= nil then
						local var_602_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_15.prefab_name].transform, "story_v_out_222031", "222031148", "story_v_out_222031.awb")

						arg_599_1:RecordAudio("222031148", var_602_21)
						arg_599_1:RecordAudio("222031148", var_602_21)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_222031", "222031148", "story_v_out_222031.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_222031", "222031148", "story_v_out_222031.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_22 = math.max(var_602_13, arg_599_1.talkMaxDuration)

			if var_602_12 <= arg_599_1.time_ and arg_599_1.time_ < var_602_12 + var_602_22 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_12) / var_602_22

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_12 + var_602_22 and arg_599_1.time_ < var_602_12 + var_602_22 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play222031149 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 222031149
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play222031150(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["10044ui_story"]
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 and arg_603_1.var_.characterEffect10044ui_story == nil then
				arg_603_1.var_.characterEffect10044ui_story = var_606_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_606_2 = 0.200000002980232

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_2 then
				local var_606_3 = (arg_603_1.time_ - var_606_1) / var_606_2

				if arg_603_1.var_.characterEffect10044ui_story then
					local var_606_4 = Mathf.Lerp(0, 0.5, var_606_3)

					arg_603_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_603_1.var_.characterEffect10044ui_story.fillRatio = var_606_4
				end
			end

			if arg_603_1.time_ >= var_606_1 + var_606_2 and arg_603_1.time_ < var_606_1 + var_606_2 + arg_606_0 and arg_603_1.var_.characterEffect10044ui_story then
				local var_606_5 = 0.5

				arg_603_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_603_1.var_.characterEffect10044ui_story.fillRatio = var_606_5
			end

			local var_606_6 = 0
			local var_606_7 = 0.725

			if var_606_6 < arg_603_1.time_ and arg_603_1.time_ <= var_606_6 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, false)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_8 = arg_603_1:GetWordFromCfg(222031149)
				local var_606_9 = arg_603_1:FormatText(var_606_8.content)

				arg_603_1.text_.text = var_606_9

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_10 = 29
				local var_606_11 = utf8.len(var_606_9)
				local var_606_12 = var_606_10 <= 0 and var_606_7 or var_606_7 * (var_606_11 / var_606_10)

				if var_606_12 > 0 and var_606_7 < var_606_12 then
					arg_603_1.talkMaxDuration = var_606_12

					if var_606_12 + var_606_6 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_12 + var_606_6
					end
				end

				arg_603_1.text_.text = var_606_9
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_13 = math.max(var_606_7, arg_603_1.talkMaxDuration)

			if var_606_6 <= arg_603_1.time_ and arg_603_1.time_ < var_606_6 + var_606_13 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_6) / var_606_13

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_6 + var_606_13 and arg_603_1.time_ < var_606_6 + var_606_13 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play222031150 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 222031150
		arg_607_1.duration_ = 5.5

		local var_607_0 = {
			ja = 5.5,
			ko = 3.5,
			zh = 3.5
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
				arg_607_0:Play222031151(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1074ui_story"].transform
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 then
				arg_607_1.var_.moveOldPos1074ui_story = var_610_0.localPosition
			end

			local var_610_2 = 0.001

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2
				local var_610_4 = Vector3.New(0, 100, 0)

				var_610_0.localPosition = Vector3.Lerp(arg_607_1.var_.moveOldPos1074ui_story, var_610_4, var_610_3)

				local var_610_5 = manager.ui.mainCamera.transform.position - var_610_0.position

				var_610_0.forward = Vector3.New(var_610_5.x, var_610_5.y, var_610_5.z)

				local var_610_6 = var_610_0.localEulerAngles

				var_610_6.z = 0
				var_610_6.x = 0
				var_610_0.localEulerAngles = var_610_6
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 then
				var_610_0.localPosition = Vector3.New(0, 100, 0)

				local var_610_7 = manager.ui.mainCamera.transform.position - var_610_0.position

				var_610_0.forward = Vector3.New(var_610_7.x, var_610_7.y, var_610_7.z)

				local var_610_8 = var_610_0.localEulerAngles

				var_610_8.z = 0
				var_610_8.x = 0
				var_610_0.localEulerAngles = var_610_8
			end

			local var_610_9 = arg_607_1.actors_["1074ui_story"]
			local var_610_10 = 0

			if var_610_10 < arg_607_1.time_ and arg_607_1.time_ <= var_610_10 + arg_610_0 and arg_607_1.var_.characterEffect1074ui_story == nil then
				arg_607_1.var_.characterEffect1074ui_story = var_610_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_11 = 0.200000002980232

			if var_610_10 <= arg_607_1.time_ and arg_607_1.time_ < var_610_10 + var_610_11 then
				local var_610_12 = (arg_607_1.time_ - var_610_10) / var_610_11

				if arg_607_1.var_.characterEffect1074ui_story then
					local var_610_13 = Mathf.Lerp(0, 0.5, var_610_12)

					arg_607_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_607_1.var_.characterEffect1074ui_story.fillRatio = var_610_13
				end
			end

			if arg_607_1.time_ >= var_610_10 + var_610_11 and arg_607_1.time_ < var_610_10 + var_610_11 + arg_610_0 and arg_607_1.var_.characterEffect1074ui_story then
				local var_610_14 = 0.5

				arg_607_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_607_1.var_.characterEffect1074ui_story.fillRatio = var_610_14
			end

			local var_610_15 = arg_607_1.actors_["1070ui_story"].transform
			local var_610_16 = 0

			if var_610_16 < arg_607_1.time_ and arg_607_1.time_ <= var_610_16 + arg_610_0 then
				arg_607_1.var_.moveOldPos1070ui_story = var_610_15.localPosition
			end

			local var_610_17 = 0.001

			if var_610_16 <= arg_607_1.time_ and arg_607_1.time_ < var_610_16 + var_610_17 then
				local var_610_18 = (arg_607_1.time_ - var_610_16) / var_610_17
				local var_610_19 = Vector3.New(0.7, -0.95, -6.05)

				var_610_15.localPosition = Vector3.Lerp(arg_607_1.var_.moveOldPos1070ui_story, var_610_19, var_610_18)

				local var_610_20 = manager.ui.mainCamera.transform.position - var_610_15.position

				var_610_15.forward = Vector3.New(var_610_20.x, var_610_20.y, var_610_20.z)

				local var_610_21 = var_610_15.localEulerAngles

				var_610_21.z = 0
				var_610_21.x = 0
				var_610_15.localEulerAngles = var_610_21
			end

			if arg_607_1.time_ >= var_610_16 + var_610_17 and arg_607_1.time_ < var_610_16 + var_610_17 + arg_610_0 then
				var_610_15.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_610_22 = manager.ui.mainCamera.transform.position - var_610_15.position

				var_610_15.forward = Vector3.New(var_610_22.x, var_610_22.y, var_610_22.z)

				local var_610_23 = var_610_15.localEulerAngles

				var_610_23.z = 0
				var_610_23.x = 0
				var_610_15.localEulerAngles = var_610_23
			end

			local var_610_24 = arg_607_1.actors_["1070ui_story"]
			local var_610_25 = 0

			if var_610_25 < arg_607_1.time_ and arg_607_1.time_ <= var_610_25 + arg_610_0 and arg_607_1.var_.characterEffect1070ui_story == nil then
				arg_607_1.var_.characterEffect1070ui_story = var_610_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_26 = 0.200000002980232

			if var_610_25 <= arg_607_1.time_ and arg_607_1.time_ < var_610_25 + var_610_26 then
				local var_610_27 = (arg_607_1.time_ - var_610_25) / var_610_26

				if arg_607_1.var_.characterEffect1070ui_story then
					arg_607_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_607_1.time_ >= var_610_25 + var_610_26 and arg_607_1.time_ < var_610_25 + var_610_26 + arg_610_0 and arg_607_1.var_.characterEffect1070ui_story then
				arg_607_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_610_28 = 0

			if var_610_28 < arg_607_1.time_ and arg_607_1.time_ <= var_610_28 + arg_610_0 then
				arg_607_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action3_1")
			end

			local var_610_29 = 0

			if var_610_29 < arg_607_1.time_ and arg_607_1.time_ <= var_610_29 + arg_610_0 then
				arg_607_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_610_30 = 0
			local var_610_31 = 0.5

			if var_610_30 < arg_607_1.time_ and arg_607_1.time_ <= var_610_30 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_32 = arg_607_1:FormatText(StoryNameCfg[318].name)

				arg_607_1.leftNameTxt_.text = var_610_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_33 = arg_607_1:GetWordFromCfg(222031150)
				local var_610_34 = arg_607_1:FormatText(var_610_33.content)

				arg_607_1.text_.text = var_610_34

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_35 = 20
				local var_610_36 = utf8.len(var_610_34)
				local var_610_37 = var_610_35 <= 0 and var_610_31 or var_610_31 * (var_610_36 / var_610_35)

				if var_610_37 > 0 and var_610_31 < var_610_37 then
					arg_607_1.talkMaxDuration = var_610_37

					if var_610_37 + var_610_30 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_37 + var_610_30
					end
				end

				arg_607_1.text_.text = var_610_34
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031150", "story_v_out_222031.awb") ~= 0 then
					local var_610_38 = manager.audio:GetVoiceLength("story_v_out_222031", "222031150", "story_v_out_222031.awb") / 1000

					if var_610_38 + var_610_30 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_38 + var_610_30
					end

					if var_610_33.prefab_name ~= "" and arg_607_1.actors_[var_610_33.prefab_name] ~= nil then
						local var_610_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_33.prefab_name].transform, "story_v_out_222031", "222031150", "story_v_out_222031.awb")

						arg_607_1:RecordAudio("222031150", var_610_39)
						arg_607_1:RecordAudio("222031150", var_610_39)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_222031", "222031150", "story_v_out_222031.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_222031", "222031150", "story_v_out_222031.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_40 = math.max(var_610_31, arg_607_1.talkMaxDuration)

			if var_610_30 <= arg_607_1.time_ and arg_607_1.time_ < var_610_30 + var_610_40 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_30) / var_610_40

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_30 + var_610_40 and arg_607_1.time_ < var_610_30 + var_610_40 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play222031151 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 222031151
		arg_611_1.duration_ = 9.2

		local var_611_0 = {
			ja = 9.2,
			ko = 4.666,
			zh = 4.666
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
				arg_611_0:Play222031152(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action3_2")
			end

			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 then
				arg_611_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_614_2 = 0
			local var_614_3 = 0.7

			if var_614_2 < arg_611_1.time_ and arg_611_1.time_ <= var_614_2 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_4 = arg_611_1:FormatText(StoryNameCfg[318].name)

				arg_611_1.leftNameTxt_.text = var_614_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_5 = arg_611_1:GetWordFromCfg(222031151)
				local var_614_6 = arg_611_1:FormatText(var_614_5.content)

				arg_611_1.text_.text = var_614_6

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_7 = 28
				local var_614_8 = utf8.len(var_614_6)
				local var_614_9 = var_614_7 <= 0 and var_614_3 or var_614_3 * (var_614_8 / var_614_7)

				if var_614_9 > 0 and var_614_3 < var_614_9 then
					arg_611_1.talkMaxDuration = var_614_9

					if var_614_9 + var_614_2 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_9 + var_614_2
					end
				end

				arg_611_1.text_.text = var_614_6
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031151", "story_v_out_222031.awb") ~= 0 then
					local var_614_10 = manager.audio:GetVoiceLength("story_v_out_222031", "222031151", "story_v_out_222031.awb") / 1000

					if var_614_10 + var_614_2 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_10 + var_614_2
					end

					if var_614_5.prefab_name ~= "" and arg_611_1.actors_[var_614_5.prefab_name] ~= nil then
						local var_614_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_611_1.actors_[var_614_5.prefab_name].transform, "story_v_out_222031", "222031151", "story_v_out_222031.awb")

						arg_611_1:RecordAudio("222031151", var_614_11)
						arg_611_1:RecordAudio("222031151", var_614_11)
					else
						arg_611_1:AudioAction("play", "voice", "story_v_out_222031", "222031151", "story_v_out_222031.awb")
					end

					arg_611_1:RecordHistoryTalkVoice("story_v_out_222031", "222031151", "story_v_out_222031.awb")
				end

				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_12 = math.max(var_614_3, arg_611_1.talkMaxDuration)

			if var_614_2 <= arg_611_1.time_ and arg_611_1.time_ < var_614_2 + var_614_12 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_2) / var_614_12

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_2 + var_614_12 and arg_611_1.time_ < var_614_2 + var_614_12 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play222031152 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 222031152
		arg_615_1.duration_ = 3.3

		local var_615_0 = {
			ja = 3.3,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_615_1 = manager.audio:GetLocalizationFlag()

		if var_615_0[var_615_1] ~= nil then
			arg_615_1.duration_ = var_615_0[var_615_1]
		end

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play222031153(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = arg_615_1.actors_["10044ui_story"]
			local var_618_1 = 0

			if var_618_1 < arg_615_1.time_ and arg_615_1.time_ <= var_618_1 + arg_618_0 and arg_615_1.var_.characterEffect10044ui_story == nil then
				arg_615_1.var_.characterEffect10044ui_story = var_618_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_2 = 0.200000002980232

			if var_618_1 <= arg_615_1.time_ and arg_615_1.time_ < var_618_1 + var_618_2 then
				local var_618_3 = (arg_615_1.time_ - var_618_1) / var_618_2

				if arg_615_1.var_.characterEffect10044ui_story then
					arg_615_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_615_1.time_ >= var_618_1 + var_618_2 and arg_615_1.time_ < var_618_1 + var_618_2 + arg_618_0 and arg_615_1.var_.characterEffect10044ui_story then
				arg_615_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_618_4 = 0

			if var_618_4 < arg_615_1.time_ and arg_615_1.time_ <= var_618_4 + arg_618_0 then
				arg_615_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_618_5 = 0

			if var_618_5 < arg_615_1.time_ and arg_615_1.time_ <= var_618_5 + arg_618_0 then
				arg_615_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_618_6 = arg_615_1.actors_["1070ui_story"]
			local var_618_7 = 0

			if var_618_7 < arg_615_1.time_ and arg_615_1.time_ <= var_618_7 + arg_618_0 and arg_615_1.var_.characterEffect1070ui_story == nil then
				arg_615_1.var_.characterEffect1070ui_story = var_618_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_8 = 0.200000002980232

			if var_618_7 <= arg_615_1.time_ and arg_615_1.time_ < var_618_7 + var_618_8 then
				local var_618_9 = (arg_615_1.time_ - var_618_7) / var_618_8

				if arg_615_1.var_.characterEffect1070ui_story then
					local var_618_10 = Mathf.Lerp(0, 0.5, var_618_9)

					arg_615_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_615_1.var_.characterEffect1070ui_story.fillRatio = var_618_10
				end
			end

			if arg_615_1.time_ >= var_618_7 + var_618_8 and arg_615_1.time_ < var_618_7 + var_618_8 + arg_618_0 and arg_615_1.var_.characterEffect1070ui_story then
				local var_618_11 = 0.5

				arg_615_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_615_1.var_.characterEffect1070ui_story.fillRatio = var_618_11
			end

			local var_618_12 = 0
			local var_618_13 = 0.125

			if var_618_12 < arg_615_1.time_ and arg_615_1.time_ <= var_618_12 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_14 = arg_615_1:FormatText(StoryNameCfg[380].name)

				arg_615_1.leftNameTxt_.text = var_618_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_15 = arg_615_1:GetWordFromCfg(222031152)
				local var_618_16 = arg_615_1:FormatText(var_618_15.content)

				arg_615_1.text_.text = var_618_16

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_17 = 5
				local var_618_18 = utf8.len(var_618_16)
				local var_618_19 = var_618_17 <= 0 and var_618_13 or var_618_13 * (var_618_18 / var_618_17)

				if var_618_19 > 0 and var_618_13 < var_618_19 then
					arg_615_1.talkMaxDuration = var_618_19

					if var_618_19 + var_618_12 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_19 + var_618_12
					end
				end

				arg_615_1.text_.text = var_618_16
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031152", "story_v_out_222031.awb") ~= 0 then
					local var_618_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031152", "story_v_out_222031.awb") / 1000

					if var_618_20 + var_618_12 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_20 + var_618_12
					end

					if var_618_15.prefab_name ~= "" and arg_615_1.actors_[var_618_15.prefab_name] ~= nil then
						local var_618_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_15.prefab_name].transform, "story_v_out_222031", "222031152", "story_v_out_222031.awb")

						arg_615_1:RecordAudio("222031152", var_618_21)
						arg_615_1:RecordAudio("222031152", var_618_21)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_out_222031", "222031152", "story_v_out_222031.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_out_222031", "222031152", "story_v_out_222031.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_22 = math.max(var_618_13, arg_615_1.talkMaxDuration)

			if var_618_12 <= arg_615_1.time_ and arg_615_1.time_ < var_618_12 + var_618_22 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_12) / var_618_22

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_12 + var_618_22 and arg_615_1.time_ < var_618_12 + var_618_22 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play222031153 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 222031153
		arg_619_1.duration_ = 5

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play222031154(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = arg_619_1.actors_["10044ui_story"]
			local var_622_1 = 0

			if var_622_1 < arg_619_1.time_ and arg_619_1.time_ <= var_622_1 + arg_622_0 and arg_619_1.var_.characterEffect10044ui_story == nil then
				arg_619_1.var_.characterEffect10044ui_story = var_622_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_622_2 = 0.200000002980232

			if var_622_1 <= arg_619_1.time_ and arg_619_1.time_ < var_622_1 + var_622_2 then
				local var_622_3 = (arg_619_1.time_ - var_622_1) / var_622_2

				if arg_619_1.var_.characterEffect10044ui_story then
					local var_622_4 = Mathf.Lerp(0, 0.5, var_622_3)

					arg_619_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_619_1.var_.characterEffect10044ui_story.fillRatio = var_622_4
				end
			end

			if arg_619_1.time_ >= var_622_1 + var_622_2 and arg_619_1.time_ < var_622_1 + var_622_2 + arg_622_0 and arg_619_1.var_.characterEffect10044ui_story then
				local var_622_5 = 0.5

				arg_619_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_619_1.var_.characterEffect10044ui_story.fillRatio = var_622_5
			end

			local var_622_6 = 0
			local var_622_7 = 1.175

			if var_622_6 < arg_619_1.time_ and arg_619_1.time_ <= var_622_6 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, false)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_8 = arg_619_1:GetWordFromCfg(222031153)
				local var_622_9 = arg_619_1:FormatText(var_622_8.content)

				arg_619_1.text_.text = var_622_9

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_10 = 47
				local var_622_11 = utf8.len(var_622_9)
				local var_622_12 = var_622_10 <= 0 and var_622_7 or var_622_7 * (var_622_11 / var_622_10)

				if var_622_12 > 0 and var_622_7 < var_622_12 then
					arg_619_1.talkMaxDuration = var_622_12

					if var_622_12 + var_622_6 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_12 + var_622_6
					end
				end

				arg_619_1.text_.text = var_622_9
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)
				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_13 = math.max(var_622_7, arg_619_1.talkMaxDuration)

			if var_622_6 <= arg_619_1.time_ and arg_619_1.time_ < var_622_6 + var_622_13 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_6) / var_622_13

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_6 + var_622_13 and arg_619_1.time_ < var_622_6 + var_622_13 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play222031154 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 222031154
		arg_623_1.duration_ = 2.8

		local var_623_0 = {
			ja = 2.8,
			ko = 2.766,
			zh = 2.766
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
				arg_623_0:Play222031155(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["10044ui_story"]
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 and arg_623_1.var_.characterEffect10044ui_story == nil then
				arg_623_1.var_.characterEffect10044ui_story = var_626_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_2 = 0.200000002980232

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2

				if arg_623_1.var_.characterEffect10044ui_story then
					arg_623_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 and arg_623_1.var_.characterEffect10044ui_story then
				arg_623_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_626_4 = 0

			if var_626_4 < arg_623_1.time_ and arg_623_1.time_ <= var_626_4 + arg_626_0 then
				arg_623_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_626_5 = 0

			if var_626_5 < arg_623_1.time_ and arg_623_1.time_ <= var_626_5 + arg_626_0 then
				arg_623_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_626_6 = 0
			local var_626_7 = 0.2

			if var_626_6 < arg_623_1.time_ and arg_623_1.time_ <= var_626_6 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_8 = arg_623_1:FormatText(StoryNameCfg[380].name)

				arg_623_1.leftNameTxt_.text = var_626_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_9 = arg_623_1:GetWordFromCfg(222031154)
				local var_626_10 = arg_623_1:FormatText(var_626_9.content)

				arg_623_1.text_.text = var_626_10

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_11 = 8
				local var_626_12 = utf8.len(var_626_10)
				local var_626_13 = var_626_11 <= 0 and var_626_7 or var_626_7 * (var_626_12 / var_626_11)

				if var_626_13 > 0 and var_626_7 < var_626_13 then
					arg_623_1.talkMaxDuration = var_626_13

					if var_626_13 + var_626_6 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_13 + var_626_6
					end
				end

				arg_623_1.text_.text = var_626_10
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031154", "story_v_out_222031.awb") ~= 0 then
					local var_626_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031154", "story_v_out_222031.awb") / 1000

					if var_626_14 + var_626_6 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_14 + var_626_6
					end

					if var_626_9.prefab_name ~= "" and arg_623_1.actors_[var_626_9.prefab_name] ~= nil then
						local var_626_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_9.prefab_name].transform, "story_v_out_222031", "222031154", "story_v_out_222031.awb")

						arg_623_1:RecordAudio("222031154", var_626_15)
						arg_623_1:RecordAudio("222031154", var_626_15)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_222031", "222031154", "story_v_out_222031.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_222031", "222031154", "story_v_out_222031.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_16 = math.max(var_626_7, arg_623_1.talkMaxDuration)

			if var_626_6 <= arg_623_1.time_ and arg_623_1.time_ < var_626_6 + var_626_16 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_6) / var_626_16

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_6 + var_626_16 and arg_623_1.time_ < var_626_6 + var_626_16 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play222031155 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 222031155
		arg_627_1.duration_ = 11.9

		local var_627_0 = {
			ja = 11.9,
			ko = 7.833,
			zh = 7.833
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
				arg_627_0:Play222031156(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1070ui_story"].transform
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 then
				arg_627_1.var_.moveOldPos1070ui_story = var_630_0.localPosition
			end

			local var_630_2 = 0.001

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2
				local var_630_4 = Vector3.New(0.7, -0.95, -6.05)

				var_630_0.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1070ui_story, var_630_4, var_630_3)

				local var_630_5 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_5.x, var_630_5.y, var_630_5.z)

				local var_630_6 = var_630_0.localEulerAngles

				var_630_6.z = 0
				var_630_6.x = 0
				var_630_0.localEulerAngles = var_630_6
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 then
				var_630_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_630_7 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_7.x, var_630_7.y, var_630_7.z)

				local var_630_8 = var_630_0.localEulerAngles

				var_630_8.z = 0
				var_630_8.x = 0
				var_630_0.localEulerAngles = var_630_8
			end

			local var_630_9 = arg_627_1.actors_["1070ui_story"]
			local var_630_10 = 0

			if var_630_10 < arg_627_1.time_ and arg_627_1.time_ <= var_630_10 + arg_630_0 and arg_627_1.var_.characterEffect1070ui_story == nil then
				arg_627_1.var_.characterEffect1070ui_story = var_630_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_11 = 0.200000002980232

			if var_630_10 <= arg_627_1.time_ and arg_627_1.time_ < var_630_10 + var_630_11 then
				local var_630_12 = (arg_627_1.time_ - var_630_10) / var_630_11

				if arg_627_1.var_.characterEffect1070ui_story then
					arg_627_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_10 + var_630_11 and arg_627_1.time_ < var_630_10 + var_630_11 + arg_630_0 and arg_627_1.var_.characterEffect1070ui_story then
				arg_627_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_630_13 = 0

			if var_630_13 < arg_627_1.time_ and arg_627_1.time_ <= var_630_13 + arg_630_0 then
				arg_627_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_1")
			end

			local var_630_14 = 0

			if var_630_14 < arg_627_1.time_ and arg_627_1.time_ <= var_630_14 + arg_630_0 then
				arg_627_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_630_15 = arg_627_1.actors_["10044ui_story"]
			local var_630_16 = 0

			if var_630_16 < arg_627_1.time_ and arg_627_1.time_ <= var_630_16 + arg_630_0 and arg_627_1.var_.characterEffect10044ui_story == nil then
				arg_627_1.var_.characterEffect10044ui_story = var_630_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_17 = 0.200000002980232

			if var_630_16 <= arg_627_1.time_ and arg_627_1.time_ < var_630_16 + var_630_17 then
				local var_630_18 = (arg_627_1.time_ - var_630_16) / var_630_17

				if arg_627_1.var_.characterEffect10044ui_story then
					local var_630_19 = Mathf.Lerp(0, 0.5, var_630_18)

					arg_627_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_627_1.var_.characterEffect10044ui_story.fillRatio = var_630_19
				end
			end

			if arg_627_1.time_ >= var_630_16 + var_630_17 and arg_627_1.time_ < var_630_16 + var_630_17 + arg_630_0 and arg_627_1.var_.characterEffect10044ui_story then
				local var_630_20 = 0.5

				arg_627_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_627_1.var_.characterEffect10044ui_story.fillRatio = var_630_20
			end

			local var_630_21 = 0
			local var_630_22 = 0.825

			if var_630_21 < arg_627_1.time_ and arg_627_1.time_ <= var_630_21 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_23 = arg_627_1:FormatText(StoryNameCfg[318].name)

				arg_627_1.leftNameTxt_.text = var_630_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_24 = arg_627_1:GetWordFromCfg(222031155)
				local var_630_25 = arg_627_1:FormatText(var_630_24.content)

				arg_627_1.text_.text = var_630_25

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_26 = 33
				local var_630_27 = utf8.len(var_630_25)
				local var_630_28 = var_630_26 <= 0 and var_630_22 or var_630_22 * (var_630_27 / var_630_26)

				if var_630_28 > 0 and var_630_22 < var_630_28 then
					arg_627_1.talkMaxDuration = var_630_28

					if var_630_28 + var_630_21 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_28 + var_630_21
					end
				end

				arg_627_1.text_.text = var_630_25
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031155", "story_v_out_222031.awb") ~= 0 then
					local var_630_29 = manager.audio:GetVoiceLength("story_v_out_222031", "222031155", "story_v_out_222031.awb") / 1000

					if var_630_29 + var_630_21 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_29 + var_630_21
					end

					if var_630_24.prefab_name ~= "" and arg_627_1.actors_[var_630_24.prefab_name] ~= nil then
						local var_630_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_24.prefab_name].transform, "story_v_out_222031", "222031155", "story_v_out_222031.awb")

						arg_627_1:RecordAudio("222031155", var_630_30)
						arg_627_1:RecordAudio("222031155", var_630_30)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_222031", "222031155", "story_v_out_222031.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_222031", "222031155", "story_v_out_222031.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_31 = math.max(var_630_22, arg_627_1.talkMaxDuration)

			if var_630_21 <= arg_627_1.time_ and arg_627_1.time_ < var_630_21 + var_630_31 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_21) / var_630_31

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_21 + var_630_31 and arg_627_1.time_ < var_630_21 + var_630_31 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play222031156 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 222031156
		arg_631_1.duration_ = 5.7

		local var_631_0 = {
			ja = 5.7,
			ko = 4.333,
			zh = 4.333
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
				arg_631_0:Play222031157(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1070ui_story"].transform
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 then
				arg_631_1.var_.moveOldPos1070ui_story = var_634_0.localPosition
			end

			local var_634_2 = 0.001

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2
				local var_634_4 = Vector3.New(0.7, -0.95, -6.05)

				var_634_0.localPosition = Vector3.Lerp(arg_631_1.var_.moveOldPos1070ui_story, var_634_4, var_634_3)

				local var_634_5 = manager.ui.mainCamera.transform.position - var_634_0.position

				var_634_0.forward = Vector3.New(var_634_5.x, var_634_5.y, var_634_5.z)

				local var_634_6 = var_634_0.localEulerAngles

				var_634_6.z = 0
				var_634_6.x = 0
				var_634_0.localEulerAngles = var_634_6
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 then
				var_634_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_634_7 = manager.ui.mainCamera.transform.position - var_634_0.position

				var_634_0.forward = Vector3.New(var_634_7.x, var_634_7.y, var_634_7.z)

				local var_634_8 = var_634_0.localEulerAngles

				var_634_8.z = 0
				var_634_8.x = 0
				var_634_0.localEulerAngles = var_634_8
			end

			local var_634_9 = arg_631_1.actors_["1070ui_story"]
			local var_634_10 = 0

			if var_634_10 < arg_631_1.time_ and arg_631_1.time_ <= var_634_10 + arg_634_0 and arg_631_1.var_.characterEffect1070ui_story == nil then
				arg_631_1.var_.characterEffect1070ui_story = var_634_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_11 = 0.200000002980232

			if var_634_10 <= arg_631_1.time_ and arg_631_1.time_ < var_634_10 + var_634_11 then
				local var_634_12 = (arg_631_1.time_ - var_634_10) / var_634_11

				if arg_631_1.var_.characterEffect1070ui_story then
					arg_631_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_10 + var_634_11 and arg_631_1.time_ < var_634_10 + var_634_11 + arg_634_0 and arg_631_1.var_.characterEffect1070ui_story then
				arg_631_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_634_13 = 0

			if var_634_13 < arg_631_1.time_ and arg_631_1.time_ <= var_634_13 + arg_634_0 then
				arg_631_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070actionlink/1070action467")
			end

			local var_634_14 = 0

			if var_634_14 < arg_631_1.time_ and arg_631_1.time_ <= var_634_14 + arg_634_0 then
				arg_631_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_634_15 = 0
			local var_634_16 = 0.525

			if var_634_15 < arg_631_1.time_ and arg_631_1.time_ <= var_634_15 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_17 = arg_631_1:FormatText(StoryNameCfg[318].name)

				arg_631_1.leftNameTxt_.text = var_634_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_18 = arg_631_1:GetWordFromCfg(222031156)
				local var_634_19 = arg_631_1:FormatText(var_634_18.content)

				arg_631_1.text_.text = var_634_19

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_20 = 21
				local var_634_21 = utf8.len(var_634_19)
				local var_634_22 = var_634_20 <= 0 and var_634_16 or var_634_16 * (var_634_21 / var_634_20)

				if var_634_22 > 0 and var_634_16 < var_634_22 then
					arg_631_1.talkMaxDuration = var_634_22

					if var_634_22 + var_634_15 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_22 + var_634_15
					end
				end

				arg_631_1.text_.text = var_634_19
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031156", "story_v_out_222031.awb") ~= 0 then
					local var_634_23 = manager.audio:GetVoiceLength("story_v_out_222031", "222031156", "story_v_out_222031.awb") / 1000

					if var_634_23 + var_634_15 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_23 + var_634_15
					end

					if var_634_18.prefab_name ~= "" and arg_631_1.actors_[var_634_18.prefab_name] ~= nil then
						local var_634_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_18.prefab_name].transform, "story_v_out_222031", "222031156", "story_v_out_222031.awb")

						arg_631_1:RecordAudio("222031156", var_634_24)
						arg_631_1:RecordAudio("222031156", var_634_24)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_222031", "222031156", "story_v_out_222031.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_222031", "222031156", "story_v_out_222031.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_25 = math.max(var_634_16, arg_631_1.talkMaxDuration)

			if var_634_15 <= arg_631_1.time_ and arg_631_1.time_ < var_634_15 + var_634_25 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_15) / var_634_25

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_15 + var_634_25 and arg_631_1.time_ < var_634_15 + var_634_25 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play222031157 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 222031157
		arg_635_1.duration_ = 9.333

		local var_635_0 = {
			ja = 9.333,
			ko = 4.133,
			zh = 4.133
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
				arg_635_0:Play222031158(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1070ui_story"].transform
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 then
				arg_635_1.var_.moveOldPos1070ui_story = var_638_0.localPosition
			end

			local var_638_2 = 0.001

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2
				local var_638_4 = Vector3.New(0, 100, 0)

				var_638_0.localPosition = Vector3.Lerp(arg_635_1.var_.moveOldPos1070ui_story, var_638_4, var_638_3)

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

			local var_638_9 = arg_635_1.actors_["1070ui_story"]
			local var_638_10 = 0

			if var_638_10 < arg_635_1.time_ and arg_635_1.time_ <= var_638_10 + arg_638_0 and arg_635_1.var_.characterEffect1070ui_story == nil then
				arg_635_1.var_.characterEffect1070ui_story = var_638_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_11 = 0.200000002980232

			if var_638_10 <= arg_635_1.time_ and arg_635_1.time_ < var_638_10 + var_638_11 then
				local var_638_12 = (arg_635_1.time_ - var_638_10) / var_638_11

				if arg_635_1.var_.characterEffect1070ui_story then
					local var_638_13 = Mathf.Lerp(0, 0.5, var_638_12)

					arg_635_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1070ui_story.fillRatio = var_638_13
				end
			end

			if arg_635_1.time_ >= var_638_10 + var_638_11 and arg_635_1.time_ < var_638_10 + var_638_11 + arg_638_0 and arg_635_1.var_.characterEffect1070ui_story then
				local var_638_14 = 0.5

				arg_635_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1070ui_story.fillRatio = var_638_14
			end

			local var_638_15 = arg_635_1.actors_["1074ui_story"].transform
			local var_638_16 = 0

			if var_638_16 < arg_635_1.time_ and arg_635_1.time_ <= var_638_16 + arg_638_0 then
				arg_635_1.var_.moveOldPos1074ui_story = var_638_15.localPosition
			end

			local var_638_17 = 0.001

			if var_638_16 <= arg_635_1.time_ and arg_635_1.time_ < var_638_16 + var_638_17 then
				local var_638_18 = (arg_635_1.time_ - var_638_16) / var_638_17
				local var_638_19 = Vector3.New(0.7, -1.055, -6.12)

				var_638_15.localPosition = Vector3.Lerp(arg_635_1.var_.moveOldPos1074ui_story, var_638_19, var_638_18)

				local var_638_20 = manager.ui.mainCamera.transform.position - var_638_15.position

				var_638_15.forward = Vector3.New(var_638_20.x, var_638_20.y, var_638_20.z)

				local var_638_21 = var_638_15.localEulerAngles

				var_638_21.z = 0
				var_638_21.x = 0
				var_638_15.localEulerAngles = var_638_21
			end

			if arg_635_1.time_ >= var_638_16 + var_638_17 and arg_635_1.time_ < var_638_16 + var_638_17 + arg_638_0 then
				var_638_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_638_22 = manager.ui.mainCamera.transform.position - var_638_15.position

				var_638_15.forward = Vector3.New(var_638_22.x, var_638_22.y, var_638_22.z)

				local var_638_23 = var_638_15.localEulerAngles

				var_638_23.z = 0
				var_638_23.x = 0
				var_638_15.localEulerAngles = var_638_23
			end

			local var_638_24 = arg_635_1.actors_["1074ui_story"]
			local var_638_25 = 0

			if var_638_25 < arg_635_1.time_ and arg_635_1.time_ <= var_638_25 + arg_638_0 and arg_635_1.var_.characterEffect1074ui_story == nil then
				arg_635_1.var_.characterEffect1074ui_story = var_638_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_26 = 0.200000002980232

			if var_638_25 <= arg_635_1.time_ and arg_635_1.time_ < var_638_25 + var_638_26 then
				local var_638_27 = (arg_635_1.time_ - var_638_25) / var_638_26

				if arg_635_1.var_.characterEffect1074ui_story then
					arg_635_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_635_1.time_ >= var_638_25 + var_638_26 and arg_635_1.time_ < var_638_25 + var_638_26 + arg_638_0 and arg_635_1.var_.characterEffect1074ui_story then
				arg_635_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_638_28 = 0

			if var_638_28 < arg_635_1.time_ and arg_635_1.time_ <= var_638_28 + arg_638_0 then
				arg_635_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_638_29 = 0

			if var_638_29 < arg_635_1.time_ and arg_635_1.time_ <= var_638_29 + arg_638_0 then
				arg_635_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_638_30 = 0
			local var_638_31 = 0.525

			if var_638_30 < arg_635_1.time_ and arg_635_1.time_ <= var_638_30 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_32 = arg_635_1:FormatText(StoryNameCfg[410].name)

				arg_635_1.leftNameTxt_.text = var_638_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_33 = arg_635_1:GetWordFromCfg(222031157)
				local var_638_34 = arg_635_1:FormatText(var_638_33.content)

				arg_635_1.text_.text = var_638_34

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_35 = 21
				local var_638_36 = utf8.len(var_638_34)
				local var_638_37 = var_638_35 <= 0 and var_638_31 or var_638_31 * (var_638_36 / var_638_35)

				if var_638_37 > 0 and var_638_31 < var_638_37 then
					arg_635_1.talkMaxDuration = var_638_37

					if var_638_37 + var_638_30 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_37 + var_638_30
					end
				end

				arg_635_1.text_.text = var_638_34
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031157", "story_v_out_222031.awb") ~= 0 then
					local var_638_38 = manager.audio:GetVoiceLength("story_v_out_222031", "222031157", "story_v_out_222031.awb") / 1000

					if var_638_38 + var_638_30 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_38 + var_638_30
					end

					if var_638_33.prefab_name ~= "" and arg_635_1.actors_[var_638_33.prefab_name] ~= nil then
						local var_638_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_33.prefab_name].transform, "story_v_out_222031", "222031157", "story_v_out_222031.awb")

						arg_635_1:RecordAudio("222031157", var_638_39)
						arg_635_1:RecordAudio("222031157", var_638_39)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_out_222031", "222031157", "story_v_out_222031.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_out_222031", "222031157", "story_v_out_222031.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_40 = math.max(var_638_31, arg_635_1.talkMaxDuration)

			if var_638_30 <= arg_635_1.time_ and arg_635_1.time_ < var_638_30 + var_638_40 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_30) / var_638_40

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_30 + var_638_40 and arg_635_1.time_ < var_638_30 + var_638_40 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play222031158 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 222031158
		arg_639_1.duration_ = 4.1

		local var_639_0 = {
			ja = 3.3,
			ko = 4.1,
			zh = 4.1
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
				arg_639_0:Play222031159(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["10044ui_story"].transform
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 then
				arg_639_1.var_.moveOldPos10044ui_story = var_642_0.localPosition
			end

			local var_642_2 = 0.001

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2
				local var_642_4 = Vector3.New(-0.7, -0.72, -6.3)

				var_642_0.localPosition = Vector3.Lerp(arg_639_1.var_.moveOldPos10044ui_story, var_642_4, var_642_3)

				local var_642_5 = manager.ui.mainCamera.transform.position - var_642_0.position

				var_642_0.forward = Vector3.New(var_642_5.x, var_642_5.y, var_642_5.z)

				local var_642_6 = var_642_0.localEulerAngles

				var_642_6.z = 0
				var_642_6.x = 0
				var_642_0.localEulerAngles = var_642_6
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 then
				var_642_0.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_642_7 = manager.ui.mainCamera.transform.position - var_642_0.position

				var_642_0.forward = Vector3.New(var_642_7.x, var_642_7.y, var_642_7.z)

				local var_642_8 = var_642_0.localEulerAngles

				var_642_8.z = 0
				var_642_8.x = 0
				var_642_0.localEulerAngles = var_642_8
			end

			local var_642_9 = arg_639_1.actors_["10044ui_story"]
			local var_642_10 = 0

			if var_642_10 < arg_639_1.time_ and arg_639_1.time_ <= var_642_10 + arg_642_0 and arg_639_1.var_.characterEffect10044ui_story == nil then
				arg_639_1.var_.characterEffect10044ui_story = var_642_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_11 = 0.200000002980232

			if var_642_10 <= arg_639_1.time_ and arg_639_1.time_ < var_642_10 + var_642_11 then
				local var_642_12 = (arg_639_1.time_ - var_642_10) / var_642_11

				if arg_639_1.var_.characterEffect10044ui_story then
					arg_639_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_639_1.time_ >= var_642_10 + var_642_11 and arg_639_1.time_ < var_642_10 + var_642_11 + arg_642_0 and arg_639_1.var_.characterEffect10044ui_story then
				arg_639_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_642_13 = 0

			if var_642_13 < arg_639_1.time_ and arg_639_1.time_ <= var_642_13 + arg_642_0 then
				arg_639_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_642_14 = 0

			if var_642_14 < arg_639_1.time_ and arg_639_1.time_ <= var_642_14 + arg_642_0 then
				arg_639_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_642_15 = arg_639_1.actors_["1074ui_story"]
			local var_642_16 = 0

			if var_642_16 < arg_639_1.time_ and arg_639_1.time_ <= var_642_16 + arg_642_0 and arg_639_1.var_.characterEffect1074ui_story == nil then
				arg_639_1.var_.characterEffect1074ui_story = var_642_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_17 = 0.200000002980232

			if var_642_16 <= arg_639_1.time_ and arg_639_1.time_ < var_642_16 + var_642_17 then
				local var_642_18 = (arg_639_1.time_ - var_642_16) / var_642_17

				if arg_639_1.var_.characterEffect1074ui_story then
					local var_642_19 = Mathf.Lerp(0, 0.5, var_642_18)

					arg_639_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_639_1.var_.characterEffect1074ui_story.fillRatio = var_642_19
				end
			end

			if arg_639_1.time_ >= var_642_16 + var_642_17 and arg_639_1.time_ < var_642_16 + var_642_17 + arg_642_0 and arg_639_1.var_.characterEffect1074ui_story then
				local var_642_20 = 0.5

				arg_639_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_639_1.var_.characterEffect1074ui_story.fillRatio = var_642_20
			end

			local var_642_21 = 0
			local var_642_22 = 0.325

			if var_642_21 < arg_639_1.time_ and arg_639_1.time_ <= var_642_21 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_23 = arg_639_1:FormatText(StoryNameCfg[380].name)

				arg_639_1.leftNameTxt_.text = var_642_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_24 = arg_639_1:GetWordFromCfg(222031158)
				local var_642_25 = arg_639_1:FormatText(var_642_24.content)

				arg_639_1.text_.text = var_642_25

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_26 = 13
				local var_642_27 = utf8.len(var_642_25)
				local var_642_28 = var_642_26 <= 0 and var_642_22 or var_642_22 * (var_642_27 / var_642_26)

				if var_642_28 > 0 and var_642_22 < var_642_28 then
					arg_639_1.talkMaxDuration = var_642_28

					if var_642_28 + var_642_21 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_28 + var_642_21
					end
				end

				arg_639_1.text_.text = var_642_25
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031158", "story_v_out_222031.awb") ~= 0 then
					local var_642_29 = manager.audio:GetVoiceLength("story_v_out_222031", "222031158", "story_v_out_222031.awb") / 1000

					if var_642_29 + var_642_21 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_29 + var_642_21
					end

					if var_642_24.prefab_name ~= "" and arg_639_1.actors_[var_642_24.prefab_name] ~= nil then
						local var_642_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_24.prefab_name].transform, "story_v_out_222031", "222031158", "story_v_out_222031.awb")

						arg_639_1:RecordAudio("222031158", var_642_30)
						arg_639_1:RecordAudio("222031158", var_642_30)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_out_222031", "222031158", "story_v_out_222031.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_out_222031", "222031158", "story_v_out_222031.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_31 = math.max(var_642_22, arg_639_1.talkMaxDuration)

			if var_642_21 <= arg_639_1.time_ and arg_639_1.time_ < var_642_21 + var_642_31 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_21) / var_642_31

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_21 + var_642_31 and arg_639_1.time_ < var_642_21 + var_642_31 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play222031159 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 222031159
		arg_643_1.duration_ = 4.233

		local var_643_0 = {
			ja = 3.866,
			ko = 4.233,
			zh = 4.233
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
				arg_643_0:Play222031160(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["10044ui_story"].transform
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 then
				arg_643_1.var_.moveOldPos10044ui_story = var_646_0.localPosition
			end

			local var_646_2 = 0.001

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2
				local var_646_4 = Vector3.New(0, 100, 0)

				var_646_0.localPosition = Vector3.Lerp(arg_643_1.var_.moveOldPos10044ui_story, var_646_4, var_646_3)

				local var_646_5 = manager.ui.mainCamera.transform.position - var_646_0.position

				var_646_0.forward = Vector3.New(var_646_5.x, var_646_5.y, var_646_5.z)

				local var_646_6 = var_646_0.localEulerAngles

				var_646_6.z = 0
				var_646_6.x = 0
				var_646_0.localEulerAngles = var_646_6
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 then
				var_646_0.localPosition = Vector3.New(0, 100, 0)

				local var_646_7 = manager.ui.mainCamera.transform.position - var_646_0.position

				var_646_0.forward = Vector3.New(var_646_7.x, var_646_7.y, var_646_7.z)

				local var_646_8 = var_646_0.localEulerAngles

				var_646_8.z = 0
				var_646_8.x = 0
				var_646_0.localEulerAngles = var_646_8
			end

			local var_646_9 = arg_643_1.actors_["10044ui_story"]
			local var_646_10 = 0

			if var_646_10 < arg_643_1.time_ and arg_643_1.time_ <= var_646_10 + arg_646_0 and arg_643_1.var_.characterEffect10044ui_story == nil then
				arg_643_1.var_.characterEffect10044ui_story = var_646_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_11 = 0.200000002980232

			if var_646_10 <= arg_643_1.time_ and arg_643_1.time_ < var_646_10 + var_646_11 then
				local var_646_12 = (arg_643_1.time_ - var_646_10) / var_646_11

				if arg_643_1.var_.characterEffect10044ui_story then
					local var_646_13 = Mathf.Lerp(0, 0.5, var_646_12)

					arg_643_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_643_1.var_.characterEffect10044ui_story.fillRatio = var_646_13
				end
			end

			if arg_643_1.time_ >= var_646_10 + var_646_11 and arg_643_1.time_ < var_646_10 + var_646_11 + arg_646_0 and arg_643_1.var_.characterEffect10044ui_story then
				local var_646_14 = 0.5

				arg_643_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_643_1.var_.characterEffect10044ui_story.fillRatio = var_646_14
			end

			local var_646_15 = arg_643_1.actors_["1070ui_story"].transform
			local var_646_16 = 0

			if var_646_16 < arg_643_1.time_ and arg_643_1.time_ <= var_646_16 + arg_646_0 then
				arg_643_1.var_.moveOldPos1070ui_story = var_646_15.localPosition
			end

			local var_646_17 = 0.001

			if var_646_16 <= arg_643_1.time_ and arg_643_1.time_ < var_646_16 + var_646_17 then
				local var_646_18 = (arg_643_1.time_ - var_646_16) / var_646_17
				local var_646_19 = Vector3.New(-0.7, -0.95, -6.05)

				var_646_15.localPosition = Vector3.Lerp(arg_643_1.var_.moveOldPos1070ui_story, var_646_19, var_646_18)

				local var_646_20 = manager.ui.mainCamera.transform.position - var_646_15.position

				var_646_15.forward = Vector3.New(var_646_20.x, var_646_20.y, var_646_20.z)

				local var_646_21 = var_646_15.localEulerAngles

				var_646_21.z = 0
				var_646_21.x = 0
				var_646_15.localEulerAngles = var_646_21
			end

			if arg_643_1.time_ >= var_646_16 + var_646_17 and arg_643_1.time_ < var_646_16 + var_646_17 + arg_646_0 then
				var_646_15.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_646_22 = manager.ui.mainCamera.transform.position - var_646_15.position

				var_646_15.forward = Vector3.New(var_646_22.x, var_646_22.y, var_646_22.z)

				local var_646_23 = var_646_15.localEulerAngles

				var_646_23.z = 0
				var_646_23.x = 0
				var_646_15.localEulerAngles = var_646_23
			end

			local var_646_24 = arg_643_1.actors_["1070ui_story"]
			local var_646_25 = 0

			if var_646_25 < arg_643_1.time_ and arg_643_1.time_ <= var_646_25 + arg_646_0 and arg_643_1.var_.characterEffect1070ui_story == nil then
				arg_643_1.var_.characterEffect1070ui_story = var_646_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_26 = 0.200000002980232

			if var_646_25 <= arg_643_1.time_ and arg_643_1.time_ < var_646_25 + var_646_26 then
				local var_646_27 = (arg_643_1.time_ - var_646_25) / var_646_26

				if arg_643_1.var_.characterEffect1070ui_story then
					arg_643_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_643_1.time_ >= var_646_25 + var_646_26 and arg_643_1.time_ < var_646_25 + var_646_26 + arg_646_0 and arg_643_1.var_.characterEffect1070ui_story then
				arg_643_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_646_28 = 0

			if var_646_28 < arg_643_1.time_ and arg_643_1.time_ <= var_646_28 + arg_646_0 then
				arg_643_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action7_2")
			end

			local var_646_29 = 0

			if var_646_29 < arg_643_1.time_ and arg_643_1.time_ <= var_646_29 + arg_646_0 then
				arg_643_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_646_30 = 0
			local var_646_31 = 0.5

			if var_646_30 < arg_643_1.time_ and arg_643_1.time_ <= var_646_30 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_32 = arg_643_1:FormatText(StoryNameCfg[318].name)

				arg_643_1.leftNameTxt_.text = var_646_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_33 = arg_643_1:GetWordFromCfg(222031159)
				local var_646_34 = arg_643_1:FormatText(var_646_33.content)

				arg_643_1.text_.text = var_646_34

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_35 = 20
				local var_646_36 = utf8.len(var_646_34)
				local var_646_37 = var_646_35 <= 0 and var_646_31 or var_646_31 * (var_646_36 / var_646_35)

				if var_646_37 > 0 and var_646_31 < var_646_37 then
					arg_643_1.talkMaxDuration = var_646_37

					if var_646_37 + var_646_30 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_37 + var_646_30
					end
				end

				arg_643_1.text_.text = var_646_34
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031159", "story_v_out_222031.awb") ~= 0 then
					local var_646_38 = manager.audio:GetVoiceLength("story_v_out_222031", "222031159", "story_v_out_222031.awb") / 1000

					if var_646_38 + var_646_30 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_38 + var_646_30
					end

					if var_646_33.prefab_name ~= "" and arg_643_1.actors_[var_646_33.prefab_name] ~= nil then
						local var_646_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_33.prefab_name].transform, "story_v_out_222031", "222031159", "story_v_out_222031.awb")

						arg_643_1:RecordAudio("222031159", var_646_39)
						arg_643_1:RecordAudio("222031159", var_646_39)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_222031", "222031159", "story_v_out_222031.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_222031", "222031159", "story_v_out_222031.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_40 = math.max(var_646_31, arg_643_1.talkMaxDuration)

			if var_646_30 <= arg_643_1.time_ and arg_643_1.time_ < var_646_30 + var_646_40 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_30) / var_646_40

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_30 + var_646_40 and arg_643_1.time_ < var_646_30 + var_646_40 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play222031160 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 222031160
		arg_647_1.duration_ = 5.3

		local var_647_0 = {
			ja = 5.3,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_647_0:Play222031161(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["1074ui_story"]
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 and arg_647_1.var_.characterEffect1074ui_story == nil then
				arg_647_1.var_.characterEffect1074ui_story = var_650_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_2 = 0.200000002980232

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2

				if arg_647_1.var_.characterEffect1074ui_story then
					arg_647_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 and arg_647_1.var_.characterEffect1074ui_story then
				arg_647_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_650_4 = 0

			if var_650_4 < arg_647_1.time_ and arg_647_1.time_ <= var_650_4 + arg_650_0 then
				arg_647_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action2_1")
			end

			local var_650_5 = 0

			if var_650_5 < arg_647_1.time_ and arg_647_1.time_ <= var_650_5 + arg_650_0 then
				arg_647_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_650_6 = arg_647_1.actors_["1070ui_story"]
			local var_650_7 = 0

			if var_650_7 < arg_647_1.time_ and arg_647_1.time_ <= var_650_7 + arg_650_0 and arg_647_1.var_.characterEffect1070ui_story == nil then
				arg_647_1.var_.characterEffect1070ui_story = var_650_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_8 = 0.200000002980232

			if var_650_7 <= arg_647_1.time_ and arg_647_1.time_ < var_650_7 + var_650_8 then
				local var_650_9 = (arg_647_1.time_ - var_650_7) / var_650_8

				if arg_647_1.var_.characterEffect1070ui_story then
					local var_650_10 = Mathf.Lerp(0, 0.5, var_650_9)

					arg_647_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_647_1.var_.characterEffect1070ui_story.fillRatio = var_650_10
				end
			end

			if arg_647_1.time_ >= var_650_7 + var_650_8 and arg_647_1.time_ < var_650_7 + var_650_8 + arg_650_0 and arg_647_1.var_.characterEffect1070ui_story then
				local var_650_11 = 0.5

				arg_647_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_647_1.var_.characterEffect1070ui_story.fillRatio = var_650_11
			end

			local var_650_12 = 0
			local var_650_13 = 0.225

			if var_650_12 < arg_647_1.time_ and arg_647_1.time_ <= var_650_12 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_14 = arg_647_1:FormatText(StoryNameCfg[410].name)

				arg_647_1.leftNameTxt_.text = var_650_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_15 = arg_647_1:GetWordFromCfg(222031160)
				local var_650_16 = arg_647_1:FormatText(var_650_15.content)

				arg_647_1.text_.text = var_650_16

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_17 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031160", "story_v_out_222031.awb") ~= 0 then
					local var_650_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031160", "story_v_out_222031.awb") / 1000

					if var_650_20 + var_650_12 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_20 + var_650_12
					end

					if var_650_15.prefab_name ~= "" and arg_647_1.actors_[var_650_15.prefab_name] ~= nil then
						local var_650_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_15.prefab_name].transform, "story_v_out_222031", "222031160", "story_v_out_222031.awb")

						arg_647_1:RecordAudio("222031160", var_650_21)
						arg_647_1:RecordAudio("222031160", var_650_21)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_222031", "222031160", "story_v_out_222031.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_222031", "222031160", "story_v_out_222031.awb")
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
	Play222031161 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 222031161
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play222031162(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1074ui_story"]
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 and arg_651_1.var_.characterEffect1074ui_story == nil then
				arg_651_1.var_.characterEffect1074ui_story = var_654_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_2 = 0.200000002980232

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2

				if arg_651_1.var_.characterEffect1074ui_story then
					local var_654_4 = Mathf.Lerp(0, 0.5, var_654_3)

					arg_651_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_651_1.var_.characterEffect1074ui_story.fillRatio = var_654_4
				end
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 and arg_651_1.var_.characterEffect1074ui_story then
				local var_654_5 = 0.5

				arg_651_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_651_1.var_.characterEffect1074ui_story.fillRatio = var_654_5
			end

			local var_654_6 = 0
			local var_654_7 = 0.525

			if var_654_6 < arg_651_1.time_ and arg_651_1.time_ <= var_654_6 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, false)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_8 = arg_651_1:GetWordFromCfg(222031161)
				local var_654_9 = arg_651_1:FormatText(var_654_8.content)

				arg_651_1.text_.text = var_654_9

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_10 = 21
				local var_654_11 = utf8.len(var_654_9)
				local var_654_12 = var_654_10 <= 0 and var_654_7 or var_654_7 * (var_654_11 / var_654_10)

				if var_654_12 > 0 and var_654_7 < var_654_12 then
					arg_651_1.talkMaxDuration = var_654_12

					if var_654_12 + var_654_6 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_12 + var_654_6
					end
				end

				arg_651_1.text_.text = var_654_9
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_13 = math.max(var_654_7, arg_651_1.talkMaxDuration)

			if var_654_6 <= arg_651_1.time_ and arg_651_1.time_ < var_654_6 + var_654_13 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_6) / var_654_13

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_6 + var_654_13 and arg_651_1.time_ < var_654_6 + var_654_13 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play222031162 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 222031162
		arg_655_1.duration_ = 1.999999999999

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play222031163(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = arg_655_1.actors_["1074ui_story"]
			local var_658_1 = 0

			if var_658_1 < arg_655_1.time_ and arg_655_1.time_ <= var_658_1 + arg_658_0 and arg_655_1.var_.characterEffect1074ui_story == nil then
				arg_655_1.var_.characterEffect1074ui_story = var_658_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_658_2 = 0.200000002980232

			if var_658_1 <= arg_655_1.time_ and arg_655_1.time_ < var_658_1 + var_658_2 then
				local var_658_3 = (arg_655_1.time_ - var_658_1) / var_658_2

				if arg_655_1.var_.characterEffect1074ui_story then
					arg_655_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_655_1.time_ >= var_658_1 + var_658_2 and arg_655_1.time_ < var_658_1 + var_658_2 + arg_658_0 and arg_655_1.var_.characterEffect1074ui_story then
				arg_655_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_658_4 = 0

			if var_658_4 < arg_655_1.time_ and arg_655_1.time_ <= var_658_4 + arg_658_0 then
				arg_655_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action2_2")
			end

			local var_658_5 = 0

			if var_658_5 < arg_655_1.time_ and arg_655_1.time_ <= var_658_5 + arg_658_0 then
				arg_655_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_658_6 = 0
			local var_658_7 = 0.2

			if var_658_6 < arg_655_1.time_ and arg_655_1.time_ <= var_658_6 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_8 = arg_655_1:FormatText(StoryNameCfg[410].name)

				arg_655_1.leftNameTxt_.text = var_658_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_9 = arg_655_1:GetWordFromCfg(222031162)
				local var_658_10 = arg_655_1:FormatText(var_658_9.content)

				arg_655_1.text_.text = var_658_10

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_11 = 8
				local var_658_12 = utf8.len(var_658_10)
				local var_658_13 = var_658_11 <= 0 and var_658_7 or var_658_7 * (var_658_12 / var_658_11)

				if var_658_13 > 0 and var_658_7 < var_658_13 then
					arg_655_1.talkMaxDuration = var_658_13

					if var_658_13 + var_658_6 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_13 + var_658_6
					end
				end

				arg_655_1.text_.text = var_658_10
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031162", "story_v_out_222031.awb") ~= 0 then
					local var_658_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031162", "story_v_out_222031.awb") / 1000

					if var_658_14 + var_658_6 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_14 + var_658_6
					end

					if var_658_9.prefab_name ~= "" and arg_655_1.actors_[var_658_9.prefab_name] ~= nil then
						local var_658_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_655_1.actors_[var_658_9.prefab_name].transform, "story_v_out_222031", "222031162", "story_v_out_222031.awb")

						arg_655_1:RecordAudio("222031162", var_658_15)
						arg_655_1:RecordAudio("222031162", var_658_15)
					else
						arg_655_1:AudioAction("play", "voice", "story_v_out_222031", "222031162", "story_v_out_222031.awb")
					end

					arg_655_1:RecordHistoryTalkVoice("story_v_out_222031", "222031162", "story_v_out_222031.awb")
				end

				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_16 = math.max(var_658_7, arg_655_1.talkMaxDuration)

			if var_658_6 <= arg_655_1.time_ and arg_655_1.time_ < var_658_6 + var_658_16 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_6) / var_658_16

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_6 + var_658_16 and arg_655_1.time_ < var_658_6 + var_658_16 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play222031163 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 222031163
		arg_659_1.duration_ = 11.5

		local var_659_0 = {
			ja = 11.5,
			ko = 7,
			zh = 7
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
				arg_659_0:Play222031164(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1070ui_story"].transform
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 then
				arg_659_1.var_.moveOldPos1070ui_story = var_662_0.localPosition
			end

			local var_662_2 = 0.001

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2
				local var_662_4 = Vector3.New(0, 100, 0)

				var_662_0.localPosition = Vector3.Lerp(arg_659_1.var_.moveOldPos1070ui_story, var_662_4, var_662_3)

				local var_662_5 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_5.x, var_662_5.y, var_662_5.z)

				local var_662_6 = var_662_0.localEulerAngles

				var_662_6.z = 0
				var_662_6.x = 0
				var_662_0.localEulerAngles = var_662_6
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 then
				var_662_0.localPosition = Vector3.New(0, 100, 0)

				local var_662_7 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_7.x, var_662_7.y, var_662_7.z)

				local var_662_8 = var_662_0.localEulerAngles

				var_662_8.z = 0
				var_662_8.x = 0
				var_662_0.localEulerAngles = var_662_8
			end

			local var_662_9 = arg_659_1.actors_["1070ui_story"]
			local var_662_10 = 0

			if var_662_10 < arg_659_1.time_ and arg_659_1.time_ <= var_662_10 + arg_662_0 and arg_659_1.var_.characterEffect1070ui_story == nil then
				arg_659_1.var_.characterEffect1070ui_story = var_662_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_11 = 0.200000002980232

			if var_662_10 <= arg_659_1.time_ and arg_659_1.time_ < var_662_10 + var_662_11 then
				local var_662_12 = (arg_659_1.time_ - var_662_10) / var_662_11

				if arg_659_1.var_.characterEffect1070ui_story then
					local var_662_13 = Mathf.Lerp(0, 0.5, var_662_12)

					arg_659_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_659_1.var_.characterEffect1070ui_story.fillRatio = var_662_13
				end
			end

			if arg_659_1.time_ >= var_662_10 + var_662_11 and arg_659_1.time_ < var_662_10 + var_662_11 + arg_662_0 and arg_659_1.var_.characterEffect1070ui_story then
				local var_662_14 = 0.5

				arg_659_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_659_1.var_.characterEffect1070ui_story.fillRatio = var_662_14
			end

			local var_662_15 = arg_659_1.actors_["10044ui_story"].transform
			local var_662_16 = 0

			if var_662_16 < arg_659_1.time_ and arg_659_1.time_ <= var_662_16 + arg_662_0 then
				arg_659_1.var_.moveOldPos10044ui_story = var_662_15.localPosition
			end

			local var_662_17 = 0.001

			if var_662_16 <= arg_659_1.time_ and arg_659_1.time_ < var_662_16 + var_662_17 then
				local var_662_18 = (arg_659_1.time_ - var_662_16) / var_662_17
				local var_662_19 = Vector3.New(-0.7, -0.72, -6.3)

				var_662_15.localPosition = Vector3.Lerp(arg_659_1.var_.moveOldPos10044ui_story, var_662_19, var_662_18)

				local var_662_20 = manager.ui.mainCamera.transform.position - var_662_15.position

				var_662_15.forward = Vector3.New(var_662_20.x, var_662_20.y, var_662_20.z)

				local var_662_21 = var_662_15.localEulerAngles

				var_662_21.z = 0
				var_662_21.x = 0
				var_662_15.localEulerAngles = var_662_21
			end

			if arg_659_1.time_ >= var_662_16 + var_662_17 and arg_659_1.time_ < var_662_16 + var_662_17 + arg_662_0 then
				var_662_15.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_662_22 = manager.ui.mainCamera.transform.position - var_662_15.position

				var_662_15.forward = Vector3.New(var_662_22.x, var_662_22.y, var_662_22.z)

				local var_662_23 = var_662_15.localEulerAngles

				var_662_23.z = 0
				var_662_23.x = 0
				var_662_15.localEulerAngles = var_662_23
			end

			local var_662_24 = arg_659_1.actors_["10044ui_story"]
			local var_662_25 = 0

			if var_662_25 < arg_659_1.time_ and arg_659_1.time_ <= var_662_25 + arg_662_0 and arg_659_1.var_.characterEffect10044ui_story == nil then
				arg_659_1.var_.characterEffect10044ui_story = var_662_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_26 = 0.200000002980232

			if var_662_25 <= arg_659_1.time_ and arg_659_1.time_ < var_662_25 + var_662_26 then
				local var_662_27 = (arg_659_1.time_ - var_662_25) / var_662_26

				if arg_659_1.var_.characterEffect10044ui_story then
					arg_659_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_25 + var_662_26 and arg_659_1.time_ < var_662_25 + var_662_26 + arg_662_0 and arg_659_1.var_.characterEffect10044ui_story then
				arg_659_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_662_28 = 0

			if var_662_28 < arg_659_1.time_ and arg_659_1.time_ <= var_662_28 + arg_662_0 then
				arg_659_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_662_29 = 0

			if var_662_29 < arg_659_1.time_ and arg_659_1.time_ <= var_662_29 + arg_662_0 then
				arg_659_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_662_30 = arg_659_1.actors_["1074ui_story"]
			local var_662_31 = 0

			if var_662_31 < arg_659_1.time_ and arg_659_1.time_ <= var_662_31 + arg_662_0 and arg_659_1.var_.characterEffect1074ui_story == nil then
				arg_659_1.var_.characterEffect1074ui_story = var_662_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_32 = 0.200000002980232

			if var_662_31 <= arg_659_1.time_ and arg_659_1.time_ < var_662_31 + var_662_32 then
				local var_662_33 = (arg_659_1.time_ - var_662_31) / var_662_32

				if arg_659_1.var_.characterEffect1074ui_story then
					local var_662_34 = Mathf.Lerp(0, 0.5, var_662_33)

					arg_659_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_659_1.var_.characterEffect1074ui_story.fillRatio = var_662_34
				end
			end

			if arg_659_1.time_ >= var_662_31 + var_662_32 and arg_659_1.time_ < var_662_31 + var_662_32 + arg_662_0 and arg_659_1.var_.characterEffect1074ui_story then
				local var_662_35 = 0.5

				arg_659_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_659_1.var_.characterEffect1074ui_story.fillRatio = var_662_35
			end

			local var_662_36 = 0
			local var_662_37 = 0.55

			if var_662_36 < arg_659_1.time_ and arg_659_1.time_ <= var_662_36 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_38 = arg_659_1:FormatText(StoryNameCfg[380].name)

				arg_659_1.leftNameTxt_.text = var_662_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_39 = arg_659_1:GetWordFromCfg(222031163)
				local var_662_40 = arg_659_1:FormatText(var_662_39.content)

				arg_659_1.text_.text = var_662_40

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_41 = 22
				local var_662_42 = utf8.len(var_662_40)
				local var_662_43 = var_662_41 <= 0 and var_662_37 or var_662_37 * (var_662_42 / var_662_41)

				if var_662_43 > 0 and var_662_37 < var_662_43 then
					arg_659_1.talkMaxDuration = var_662_43

					if var_662_43 + var_662_36 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_43 + var_662_36
					end
				end

				arg_659_1.text_.text = var_662_40
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031163", "story_v_out_222031.awb") ~= 0 then
					local var_662_44 = manager.audio:GetVoiceLength("story_v_out_222031", "222031163", "story_v_out_222031.awb") / 1000

					if var_662_44 + var_662_36 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_44 + var_662_36
					end

					if var_662_39.prefab_name ~= "" and arg_659_1.actors_[var_662_39.prefab_name] ~= nil then
						local var_662_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_39.prefab_name].transform, "story_v_out_222031", "222031163", "story_v_out_222031.awb")

						arg_659_1:RecordAudio("222031163", var_662_45)
						arg_659_1:RecordAudio("222031163", var_662_45)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_out_222031", "222031163", "story_v_out_222031.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_out_222031", "222031163", "story_v_out_222031.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_46 = math.max(var_662_37, arg_659_1.talkMaxDuration)

			if var_662_36 <= arg_659_1.time_ and arg_659_1.time_ < var_662_36 + var_662_46 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_36) / var_662_46

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_36 + var_662_46 and arg_659_1.time_ < var_662_36 + var_662_46 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play222031164 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 222031164
		arg_663_1.duration_ = 1.999999999999

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play222031165(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1074ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and arg_663_1.var_.characterEffect1074ui_story == nil then
				arg_663_1.var_.characterEffect1074ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.200000002980232

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1074ui_story then
					arg_663_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and arg_663_1.var_.characterEffect1074ui_story then
				arg_663_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_666_4 = 0

			if var_666_4 < arg_663_1.time_ and arg_663_1.time_ <= var_666_4 + arg_666_0 then
				arg_663_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_666_5 = 0

			if var_666_5 < arg_663_1.time_ and arg_663_1.time_ <= var_666_5 + arg_666_0 then
				arg_663_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_666_6 = arg_663_1.actors_["10044ui_story"]
			local var_666_7 = 0

			if var_666_7 < arg_663_1.time_ and arg_663_1.time_ <= var_666_7 + arg_666_0 and arg_663_1.var_.characterEffect10044ui_story == nil then
				arg_663_1.var_.characterEffect10044ui_story = var_666_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_8 = 0.200000002980232

			if var_666_7 <= arg_663_1.time_ and arg_663_1.time_ < var_666_7 + var_666_8 then
				local var_666_9 = (arg_663_1.time_ - var_666_7) / var_666_8

				if arg_663_1.var_.characterEffect10044ui_story then
					local var_666_10 = Mathf.Lerp(0, 0.5, var_666_9)

					arg_663_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_663_1.var_.characterEffect10044ui_story.fillRatio = var_666_10
				end
			end

			if arg_663_1.time_ >= var_666_7 + var_666_8 and arg_663_1.time_ < var_666_7 + var_666_8 + arg_666_0 and arg_663_1.var_.characterEffect10044ui_story then
				local var_666_11 = 0.5

				arg_663_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_663_1.var_.characterEffect10044ui_story.fillRatio = var_666_11
			end

			local var_666_12 = 0
			local var_666_13 = 0.075

			if var_666_12 < arg_663_1.time_ and arg_663_1.time_ <= var_666_12 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_14 = arg_663_1:FormatText(StoryNameCfg[410].name)

				arg_663_1.leftNameTxt_.text = var_666_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_15 = arg_663_1:GetWordFromCfg(222031164)
				local var_666_16 = arg_663_1:FormatText(var_666_15.content)

				arg_663_1.text_.text = var_666_16

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_17 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031164", "story_v_out_222031.awb") ~= 0 then
					local var_666_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031164", "story_v_out_222031.awb") / 1000

					if var_666_20 + var_666_12 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_20 + var_666_12
					end

					if var_666_15.prefab_name ~= "" and arg_663_1.actors_[var_666_15.prefab_name] ~= nil then
						local var_666_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_663_1.actors_[var_666_15.prefab_name].transform, "story_v_out_222031", "222031164", "story_v_out_222031.awb")

						arg_663_1:RecordAudio("222031164", var_666_21)
						arg_663_1:RecordAudio("222031164", var_666_21)
					else
						arg_663_1:AudioAction("play", "voice", "story_v_out_222031", "222031164", "story_v_out_222031.awb")
					end

					arg_663_1:RecordHistoryTalkVoice("story_v_out_222031", "222031164", "story_v_out_222031.awb")
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
	Play222031165 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 222031165
		arg_667_1.duration_ = 14.333

		local var_667_0 = {
			ja = 14.333,
			ko = 9.5,
			zh = 9.5
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
				arg_667_0:Play222031166(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = arg_667_1.actors_["10044ui_story"]
			local var_670_1 = 0

			if var_670_1 < arg_667_1.time_ and arg_667_1.time_ <= var_670_1 + arg_670_0 and arg_667_1.var_.characterEffect10044ui_story == nil then
				arg_667_1.var_.characterEffect10044ui_story = var_670_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_670_2 = 0.200000002980232

			if var_670_1 <= arg_667_1.time_ and arg_667_1.time_ < var_670_1 + var_670_2 then
				local var_670_3 = (arg_667_1.time_ - var_670_1) / var_670_2

				if arg_667_1.var_.characterEffect10044ui_story then
					arg_667_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_667_1.time_ >= var_670_1 + var_670_2 and arg_667_1.time_ < var_670_1 + var_670_2 + arg_670_0 and arg_667_1.var_.characterEffect10044ui_story then
				arg_667_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_670_4 = 0

			if var_670_4 < arg_667_1.time_ and arg_667_1.time_ <= var_670_4 + arg_670_0 then
				arg_667_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_670_5 = 0

			if var_670_5 < arg_667_1.time_ and arg_667_1.time_ <= var_670_5 + arg_670_0 then
				arg_667_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_670_6 = arg_667_1.actors_["1074ui_story"]
			local var_670_7 = 0

			if var_670_7 < arg_667_1.time_ and arg_667_1.time_ <= var_670_7 + arg_670_0 and arg_667_1.var_.characterEffect1074ui_story == nil then
				arg_667_1.var_.characterEffect1074ui_story = var_670_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_670_8 = 0.200000002980232

			if var_670_7 <= arg_667_1.time_ and arg_667_1.time_ < var_670_7 + var_670_8 then
				local var_670_9 = (arg_667_1.time_ - var_670_7) / var_670_8

				if arg_667_1.var_.characterEffect1074ui_story then
					local var_670_10 = Mathf.Lerp(0, 0.5, var_670_9)

					arg_667_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_667_1.var_.characterEffect1074ui_story.fillRatio = var_670_10
				end
			end

			if arg_667_1.time_ >= var_670_7 + var_670_8 and arg_667_1.time_ < var_670_7 + var_670_8 + arg_670_0 and arg_667_1.var_.characterEffect1074ui_story then
				local var_670_11 = 0.5

				arg_667_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_667_1.var_.characterEffect1074ui_story.fillRatio = var_670_11
			end

			local var_670_12 = 0
			local var_670_13 = 1.075

			if var_670_12 < arg_667_1.time_ and arg_667_1.time_ <= var_670_12 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_14 = arg_667_1:FormatText(StoryNameCfg[380].name)

				arg_667_1.leftNameTxt_.text = var_670_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_15 = arg_667_1:GetWordFromCfg(222031165)
				local var_670_16 = arg_667_1:FormatText(var_670_15.content)

				arg_667_1.text_.text = var_670_16

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_17 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031165", "story_v_out_222031.awb") ~= 0 then
					local var_670_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031165", "story_v_out_222031.awb") / 1000

					if var_670_20 + var_670_12 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_20 + var_670_12
					end

					if var_670_15.prefab_name ~= "" and arg_667_1.actors_[var_670_15.prefab_name] ~= nil then
						local var_670_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_15.prefab_name].transform, "story_v_out_222031", "222031165", "story_v_out_222031.awb")

						arg_667_1:RecordAudio("222031165", var_670_21)
						arg_667_1:RecordAudio("222031165", var_670_21)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_out_222031", "222031165", "story_v_out_222031.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_out_222031", "222031165", "story_v_out_222031.awb")
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
	Play222031166 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 222031166
		arg_671_1.duration_ = 10.2

		local var_671_0 = {
			ja = 10.2,
			ko = 6.633,
			zh = 6.633
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
				arg_671_0:Play222031167(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = arg_671_1.actors_["1074ui_story"]
			local var_674_1 = 0

			if var_674_1 < arg_671_1.time_ and arg_671_1.time_ <= var_674_1 + arg_674_0 and arg_671_1.var_.characterEffect1074ui_story == nil then
				arg_671_1.var_.characterEffect1074ui_story = var_674_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_2 = 0.200000002980232

			if var_674_1 <= arg_671_1.time_ and arg_671_1.time_ < var_674_1 + var_674_2 then
				local var_674_3 = (arg_671_1.time_ - var_674_1) / var_674_2

				if arg_671_1.var_.characterEffect1074ui_story then
					arg_671_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_671_1.time_ >= var_674_1 + var_674_2 and arg_671_1.time_ < var_674_1 + var_674_2 + arg_674_0 and arg_671_1.var_.characterEffect1074ui_story then
				arg_671_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_674_4 = 0

			if var_674_4 < arg_671_1.time_ and arg_671_1.time_ <= var_674_4 + arg_674_0 then
				arg_671_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_674_5 = 0

			if var_674_5 < arg_671_1.time_ and arg_671_1.time_ <= var_674_5 + arg_674_0 then
				arg_671_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_674_6 = arg_671_1.actors_["10044ui_story"]
			local var_674_7 = 0

			if var_674_7 < arg_671_1.time_ and arg_671_1.time_ <= var_674_7 + arg_674_0 and arg_671_1.var_.characterEffect10044ui_story == nil then
				arg_671_1.var_.characterEffect10044ui_story = var_674_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_8 = 0.200000002980232

			if var_674_7 <= arg_671_1.time_ and arg_671_1.time_ < var_674_7 + var_674_8 then
				local var_674_9 = (arg_671_1.time_ - var_674_7) / var_674_8

				if arg_671_1.var_.characterEffect10044ui_story then
					local var_674_10 = Mathf.Lerp(0, 0.5, var_674_9)

					arg_671_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_671_1.var_.characterEffect10044ui_story.fillRatio = var_674_10
				end
			end

			if arg_671_1.time_ >= var_674_7 + var_674_8 and arg_671_1.time_ < var_674_7 + var_674_8 + arg_674_0 and arg_671_1.var_.characterEffect10044ui_story then
				local var_674_11 = 0.5

				arg_671_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_671_1.var_.characterEffect10044ui_story.fillRatio = var_674_11
			end

			local var_674_12 = 0
			local var_674_13 = 0.85

			if var_674_12 < arg_671_1.time_ and arg_671_1.time_ <= var_674_12 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_14 = arg_671_1:FormatText(StoryNameCfg[410].name)

				arg_671_1.leftNameTxt_.text = var_674_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_15 = arg_671_1:GetWordFromCfg(222031166)
				local var_674_16 = arg_671_1:FormatText(var_674_15.content)

				arg_671_1.text_.text = var_674_16

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_17 = 34
				local var_674_18 = utf8.len(var_674_16)
				local var_674_19 = var_674_17 <= 0 and var_674_13 or var_674_13 * (var_674_18 / var_674_17)

				if var_674_19 > 0 and var_674_13 < var_674_19 then
					arg_671_1.talkMaxDuration = var_674_19

					if var_674_19 + var_674_12 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_19 + var_674_12
					end
				end

				arg_671_1.text_.text = var_674_16
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031166", "story_v_out_222031.awb") ~= 0 then
					local var_674_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031166", "story_v_out_222031.awb") / 1000

					if var_674_20 + var_674_12 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_20 + var_674_12
					end

					if var_674_15.prefab_name ~= "" and arg_671_1.actors_[var_674_15.prefab_name] ~= nil then
						local var_674_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_671_1.actors_[var_674_15.prefab_name].transform, "story_v_out_222031", "222031166", "story_v_out_222031.awb")

						arg_671_1:RecordAudio("222031166", var_674_21)
						arg_671_1:RecordAudio("222031166", var_674_21)
					else
						arg_671_1:AudioAction("play", "voice", "story_v_out_222031", "222031166", "story_v_out_222031.awb")
					end

					arg_671_1:RecordHistoryTalkVoice("story_v_out_222031", "222031166", "story_v_out_222031.awb")
				end

				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_22 = math.max(var_674_13, arg_671_1.talkMaxDuration)

			if var_674_12 <= arg_671_1.time_ and arg_671_1.time_ < var_674_12 + var_674_22 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_12) / var_674_22

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_12 + var_674_22 and arg_671_1.time_ < var_674_12 + var_674_22 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play222031167 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 222031167
		arg_675_1.duration_ = 15.733

		local var_675_0 = {
			ja = 15.733,
			ko = 11.266,
			zh = 11.266
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
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play222031168(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = arg_675_1.actors_["10044ui_story"]
			local var_678_1 = 0

			if var_678_1 < arg_675_1.time_ and arg_675_1.time_ <= var_678_1 + arg_678_0 and arg_675_1.var_.characterEffect10044ui_story == nil then
				arg_675_1.var_.characterEffect10044ui_story = var_678_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_2 = 0.200000002980232

			if var_678_1 <= arg_675_1.time_ and arg_675_1.time_ < var_678_1 + var_678_2 then
				local var_678_3 = (arg_675_1.time_ - var_678_1) / var_678_2

				if arg_675_1.var_.characterEffect10044ui_story then
					arg_675_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_675_1.time_ >= var_678_1 + var_678_2 and arg_675_1.time_ < var_678_1 + var_678_2 + arg_678_0 and arg_675_1.var_.characterEffect10044ui_story then
				arg_675_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_678_4 = 0

			if var_678_4 < arg_675_1.time_ and arg_675_1.time_ <= var_678_4 + arg_678_0 then
				arg_675_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_678_5 = 0

			if var_678_5 < arg_675_1.time_ and arg_675_1.time_ <= var_678_5 + arg_678_0 then
				arg_675_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_678_6 = arg_675_1.actors_["1074ui_story"]
			local var_678_7 = 0

			if var_678_7 < arg_675_1.time_ and arg_675_1.time_ <= var_678_7 + arg_678_0 and arg_675_1.var_.characterEffect1074ui_story == nil then
				arg_675_1.var_.characterEffect1074ui_story = var_678_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_8 = 0.200000002980232

			if var_678_7 <= arg_675_1.time_ and arg_675_1.time_ < var_678_7 + var_678_8 then
				local var_678_9 = (arg_675_1.time_ - var_678_7) / var_678_8

				if arg_675_1.var_.characterEffect1074ui_story then
					local var_678_10 = Mathf.Lerp(0, 0.5, var_678_9)

					arg_675_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_675_1.var_.characterEffect1074ui_story.fillRatio = var_678_10
				end
			end

			if arg_675_1.time_ >= var_678_7 + var_678_8 and arg_675_1.time_ < var_678_7 + var_678_8 + arg_678_0 and arg_675_1.var_.characterEffect1074ui_story then
				local var_678_11 = 0.5

				arg_675_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_675_1.var_.characterEffect1074ui_story.fillRatio = var_678_11
			end

			local var_678_12 = 0
			local var_678_13 = 1.25

			if var_678_12 < arg_675_1.time_ and arg_675_1.time_ <= var_678_12 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_14 = arg_675_1:FormatText(StoryNameCfg[380].name)

				arg_675_1.leftNameTxt_.text = var_678_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_15 = arg_675_1:GetWordFromCfg(222031167)
				local var_678_16 = arg_675_1:FormatText(var_678_15.content)

				arg_675_1.text_.text = var_678_16

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_17 = 50
				local var_678_18 = utf8.len(var_678_16)
				local var_678_19 = var_678_17 <= 0 and var_678_13 or var_678_13 * (var_678_18 / var_678_17)

				if var_678_19 > 0 and var_678_13 < var_678_19 then
					arg_675_1.talkMaxDuration = var_678_19

					if var_678_19 + var_678_12 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_19 + var_678_12
					end
				end

				arg_675_1.text_.text = var_678_16
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031167", "story_v_out_222031.awb") ~= 0 then
					local var_678_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031167", "story_v_out_222031.awb") / 1000

					if var_678_20 + var_678_12 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_20 + var_678_12
					end

					if var_678_15.prefab_name ~= "" and arg_675_1.actors_[var_678_15.prefab_name] ~= nil then
						local var_678_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_15.prefab_name].transform, "story_v_out_222031", "222031167", "story_v_out_222031.awb")

						arg_675_1:RecordAudio("222031167", var_678_21)
						arg_675_1:RecordAudio("222031167", var_678_21)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_out_222031", "222031167", "story_v_out_222031.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_out_222031", "222031167", "story_v_out_222031.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_22 = math.max(var_678_13, arg_675_1.talkMaxDuration)

			if var_678_12 <= arg_675_1.time_ and arg_675_1.time_ < var_678_12 + var_678_22 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_12) / var_678_22

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_12 + var_678_22 and arg_675_1.time_ < var_678_12 + var_678_22 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play222031168 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 222031168
		arg_679_1.duration_ = 6.633

		local var_679_0 = {
			ja = 6.633,
			ko = 4.966,
			zh = 4.966
		}
		local var_679_1 = manager.audio:GetLocalizationFlag()

		if var_679_0[var_679_1] ~= nil then
			arg_679_1.duration_ = var_679_0[var_679_1]
		end

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play222031169(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 0
			local var_682_1 = 0.575

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_2 = arg_679_1:FormatText(StoryNameCfg[380].name)

				arg_679_1.leftNameTxt_.text = var_682_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_3 = arg_679_1:GetWordFromCfg(222031168)
				local var_682_4 = arg_679_1:FormatText(var_682_3.content)

				arg_679_1.text_.text = var_682_4

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_5 = 23
				local var_682_6 = utf8.len(var_682_4)
				local var_682_7 = var_682_5 <= 0 and var_682_1 or var_682_1 * (var_682_6 / var_682_5)

				if var_682_7 > 0 and var_682_1 < var_682_7 then
					arg_679_1.talkMaxDuration = var_682_7

					if var_682_7 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_7 + var_682_0
					end
				end

				arg_679_1.text_.text = var_682_4
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031168", "story_v_out_222031.awb") ~= 0 then
					local var_682_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031168", "story_v_out_222031.awb") / 1000

					if var_682_8 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_8 + var_682_0
					end

					if var_682_3.prefab_name ~= "" and arg_679_1.actors_[var_682_3.prefab_name] ~= nil then
						local var_682_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_679_1.actors_[var_682_3.prefab_name].transform, "story_v_out_222031", "222031168", "story_v_out_222031.awb")

						arg_679_1:RecordAudio("222031168", var_682_9)
						arg_679_1:RecordAudio("222031168", var_682_9)
					else
						arg_679_1:AudioAction("play", "voice", "story_v_out_222031", "222031168", "story_v_out_222031.awb")
					end

					arg_679_1:RecordHistoryTalkVoice("story_v_out_222031", "222031168", "story_v_out_222031.awb")
				end

				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_10 = math.max(var_682_1, arg_679_1.talkMaxDuration)

			if var_682_0 <= arg_679_1.time_ and arg_679_1.time_ < var_682_0 + var_682_10 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_0) / var_682_10

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_0 + var_682_10 and arg_679_1.time_ < var_682_0 + var_682_10 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play222031169 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 222031169
		arg_683_1.duration_ = 5.766

		local var_683_0 = {
			ja = 5.766,
			ko = 4.9,
			zh = 4.9
		}
		local var_683_1 = manager.audio:GetLocalizationFlag()

		if var_683_0[var_683_1] ~= nil then
			arg_683_1.duration_ = var_683_0[var_683_1]
		end

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play222031170(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = arg_683_1.actors_["1074ui_story"]
			local var_686_1 = 0

			if var_686_1 < arg_683_1.time_ and arg_683_1.time_ <= var_686_1 + arg_686_0 and arg_683_1.var_.characterEffect1074ui_story == nil then
				arg_683_1.var_.characterEffect1074ui_story = var_686_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_686_2 = 0.200000002980232

			if var_686_1 <= arg_683_1.time_ and arg_683_1.time_ < var_686_1 + var_686_2 then
				local var_686_3 = (arg_683_1.time_ - var_686_1) / var_686_2

				if arg_683_1.var_.characterEffect1074ui_story then
					arg_683_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_683_1.time_ >= var_686_1 + var_686_2 and arg_683_1.time_ < var_686_1 + var_686_2 + arg_686_0 and arg_683_1.var_.characterEffect1074ui_story then
				arg_683_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_686_4 = 0

			if var_686_4 < arg_683_1.time_ and arg_683_1.time_ <= var_686_4 + arg_686_0 then
				arg_683_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_686_5 = 0

			if var_686_5 < arg_683_1.time_ and arg_683_1.time_ <= var_686_5 + arg_686_0 then
				arg_683_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_686_6 = arg_683_1.actors_["10044ui_story"]
			local var_686_7 = 0

			if var_686_7 < arg_683_1.time_ and arg_683_1.time_ <= var_686_7 + arg_686_0 and arg_683_1.var_.characterEffect10044ui_story == nil then
				arg_683_1.var_.characterEffect10044ui_story = var_686_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_686_8 = 0.200000002980232

			if var_686_7 <= arg_683_1.time_ and arg_683_1.time_ < var_686_7 + var_686_8 then
				local var_686_9 = (arg_683_1.time_ - var_686_7) / var_686_8

				if arg_683_1.var_.characterEffect10044ui_story then
					local var_686_10 = Mathf.Lerp(0, 0.5, var_686_9)

					arg_683_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_683_1.var_.characterEffect10044ui_story.fillRatio = var_686_10
				end
			end

			if arg_683_1.time_ >= var_686_7 + var_686_8 and arg_683_1.time_ < var_686_7 + var_686_8 + arg_686_0 and arg_683_1.var_.characterEffect10044ui_story then
				local var_686_11 = 0.5

				arg_683_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_683_1.var_.characterEffect10044ui_story.fillRatio = var_686_11
			end

			local var_686_12 = 0
			local var_686_13 = 0.425

			if var_686_12 < arg_683_1.time_ and arg_683_1.time_ <= var_686_12 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_14 = arg_683_1:FormatText(StoryNameCfg[410].name)

				arg_683_1.leftNameTxt_.text = var_686_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_15 = arg_683_1:GetWordFromCfg(222031169)
				local var_686_16 = arg_683_1:FormatText(var_686_15.content)

				arg_683_1.text_.text = var_686_16

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_17 = 17
				local var_686_18 = utf8.len(var_686_16)
				local var_686_19 = var_686_17 <= 0 and var_686_13 or var_686_13 * (var_686_18 / var_686_17)

				if var_686_19 > 0 and var_686_13 < var_686_19 then
					arg_683_1.talkMaxDuration = var_686_19

					if var_686_19 + var_686_12 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_19 + var_686_12
					end
				end

				arg_683_1.text_.text = var_686_16
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031169", "story_v_out_222031.awb") ~= 0 then
					local var_686_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031169", "story_v_out_222031.awb") / 1000

					if var_686_20 + var_686_12 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_20 + var_686_12
					end

					if var_686_15.prefab_name ~= "" and arg_683_1.actors_[var_686_15.prefab_name] ~= nil then
						local var_686_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_683_1.actors_[var_686_15.prefab_name].transform, "story_v_out_222031", "222031169", "story_v_out_222031.awb")

						arg_683_1:RecordAudio("222031169", var_686_21)
						arg_683_1:RecordAudio("222031169", var_686_21)
					else
						arg_683_1:AudioAction("play", "voice", "story_v_out_222031", "222031169", "story_v_out_222031.awb")
					end

					arg_683_1:RecordHistoryTalkVoice("story_v_out_222031", "222031169", "story_v_out_222031.awb")
				end

				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_22 = math.max(var_686_13, arg_683_1.talkMaxDuration)

			if var_686_12 <= arg_683_1.time_ and arg_683_1.time_ < var_686_12 + var_686_22 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_12) / var_686_22

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_12 + var_686_22 and arg_683_1.time_ < var_686_12 + var_686_22 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play222031170 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 222031170
		arg_687_1.duration_ = 5

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play222031171(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = arg_687_1.actors_["1074ui_story"]
			local var_690_1 = 0

			if var_690_1 < arg_687_1.time_ and arg_687_1.time_ <= var_690_1 + arg_690_0 and arg_687_1.var_.characterEffect1074ui_story == nil then
				arg_687_1.var_.characterEffect1074ui_story = var_690_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_690_2 = 0.200000002980232

			if var_690_1 <= arg_687_1.time_ and arg_687_1.time_ < var_690_1 + var_690_2 then
				local var_690_3 = (arg_687_1.time_ - var_690_1) / var_690_2

				if arg_687_1.var_.characterEffect1074ui_story then
					local var_690_4 = Mathf.Lerp(0, 0.5, var_690_3)

					arg_687_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_687_1.var_.characterEffect1074ui_story.fillRatio = var_690_4
				end
			end

			if arg_687_1.time_ >= var_690_1 + var_690_2 and arg_687_1.time_ < var_690_1 + var_690_2 + arg_690_0 and arg_687_1.var_.characterEffect1074ui_story then
				local var_690_5 = 0.5

				arg_687_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_687_1.var_.characterEffect1074ui_story.fillRatio = var_690_5
			end

			local var_690_6 = 0
			local var_690_7 = 0.8

			if var_690_6 < arg_687_1.time_ and arg_687_1.time_ <= var_690_6 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, false)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_8 = arg_687_1:GetWordFromCfg(222031170)
				local var_690_9 = arg_687_1:FormatText(var_690_8.content)

				arg_687_1.text_.text = var_690_9

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_10 = 32
				local var_690_11 = utf8.len(var_690_9)
				local var_690_12 = var_690_10 <= 0 and var_690_7 or var_690_7 * (var_690_11 / var_690_10)

				if var_690_12 > 0 and var_690_7 < var_690_12 then
					arg_687_1.talkMaxDuration = var_690_12

					if var_690_12 + var_690_6 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_12 + var_690_6
					end
				end

				arg_687_1.text_.text = var_690_9
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)
				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_13 = math.max(var_690_7, arg_687_1.talkMaxDuration)

			if var_690_6 <= arg_687_1.time_ and arg_687_1.time_ < var_690_6 + var_690_13 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_6) / var_690_13

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_6 + var_690_13 and arg_687_1.time_ < var_690_6 + var_690_13 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play222031171 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 222031171
		arg_691_1.duration_ = 13.4

		local var_691_0 = {
			ja = 13.4,
			ko = 12.6,
			zh = 12.6
		}
		local var_691_1 = manager.audio:GetLocalizationFlag()

		if var_691_0[var_691_1] ~= nil then
			arg_691_1.duration_ = var_691_0[var_691_1]
		end

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play222031172(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = arg_691_1.actors_["10044ui_story"]
			local var_694_1 = 0

			if var_694_1 < arg_691_1.time_ and arg_691_1.time_ <= var_694_1 + arg_694_0 and arg_691_1.var_.characterEffect10044ui_story == nil then
				arg_691_1.var_.characterEffect10044ui_story = var_694_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_694_2 = 0.200000002980232

			if var_694_1 <= arg_691_1.time_ and arg_691_1.time_ < var_694_1 + var_694_2 then
				local var_694_3 = (arg_691_1.time_ - var_694_1) / var_694_2

				if arg_691_1.var_.characterEffect10044ui_story then
					arg_691_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_691_1.time_ >= var_694_1 + var_694_2 and arg_691_1.time_ < var_694_1 + var_694_2 + arg_694_0 and arg_691_1.var_.characterEffect10044ui_story then
				arg_691_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_694_4 = 0

			if var_694_4 < arg_691_1.time_ and arg_691_1.time_ <= var_694_4 + arg_694_0 then
				arg_691_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_694_5 = 0

			if var_694_5 < arg_691_1.time_ and arg_691_1.time_ <= var_694_5 + arg_694_0 then
				arg_691_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_694_6 = 0
			local var_694_7 = 1.175

			if var_694_6 < arg_691_1.time_ and arg_691_1.time_ <= var_694_6 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, true)

				local var_694_8 = arg_691_1:FormatText(StoryNameCfg[380].name)

				arg_691_1.leftNameTxt_.text = var_694_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_691_1.leftNameTxt_.transform)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1.leftNameTxt_.text)
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_9 = arg_691_1:GetWordFromCfg(222031171)
				local var_694_10 = arg_691_1:FormatText(var_694_9.content)

				arg_691_1.text_.text = var_694_10

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_11 = 47
				local var_694_12 = utf8.len(var_694_10)
				local var_694_13 = var_694_11 <= 0 and var_694_7 or var_694_7 * (var_694_12 / var_694_11)

				if var_694_13 > 0 and var_694_7 < var_694_13 then
					arg_691_1.talkMaxDuration = var_694_13

					if var_694_13 + var_694_6 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_13 + var_694_6
					end
				end

				arg_691_1.text_.text = var_694_10
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031171", "story_v_out_222031.awb") ~= 0 then
					local var_694_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031171", "story_v_out_222031.awb") / 1000

					if var_694_14 + var_694_6 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_14 + var_694_6
					end

					if var_694_9.prefab_name ~= "" and arg_691_1.actors_[var_694_9.prefab_name] ~= nil then
						local var_694_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_691_1.actors_[var_694_9.prefab_name].transform, "story_v_out_222031", "222031171", "story_v_out_222031.awb")

						arg_691_1:RecordAudio("222031171", var_694_15)
						arg_691_1:RecordAudio("222031171", var_694_15)
					else
						arg_691_1:AudioAction("play", "voice", "story_v_out_222031", "222031171", "story_v_out_222031.awb")
					end

					arg_691_1:RecordHistoryTalkVoice("story_v_out_222031", "222031171", "story_v_out_222031.awb")
				end

				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_16 = math.max(var_694_7, arg_691_1.talkMaxDuration)

			if var_694_6 <= arg_691_1.time_ and arg_691_1.time_ < var_694_6 + var_694_16 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_6) / var_694_16

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_6 + var_694_16 and arg_691_1.time_ < var_694_6 + var_694_16 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	Play222031172 = function(arg_695_0, arg_695_1)
		arg_695_1.time_ = 0
		arg_695_1.frameCnt_ = 0
		arg_695_1.state_ = "playing"
		arg_695_1.curTalkId_ = 222031172
		arg_695_1.duration_ = 2

		local var_695_0 = {
			ja = 2,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_695_1 = manager.audio:GetLocalizationFlag()

		if var_695_0[var_695_1] ~= nil then
			arg_695_1.duration_ = var_695_0[var_695_1]
		end

		SetActive(arg_695_1.tipsGo_, false)

		function arg_695_1.onSingleLineFinish_()
			arg_695_1.onSingleLineUpdate_ = nil
			arg_695_1.onSingleLineFinish_ = nil
			arg_695_1.state_ = "waiting"
		end

		function arg_695_1.playNext_(arg_697_0)
			if arg_697_0 == 1 then
				arg_695_0:Play222031173(arg_695_1)
			end
		end

		function arg_695_1.onSingleLineUpdate_(arg_698_0)
			local var_698_0 = arg_695_1.actors_["1074ui_story"]
			local var_698_1 = 0

			if var_698_1 < arg_695_1.time_ and arg_695_1.time_ <= var_698_1 + arg_698_0 and arg_695_1.var_.characterEffect1074ui_story == nil then
				arg_695_1.var_.characterEffect1074ui_story = var_698_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_698_2 = 0.200000002980232

			if var_698_1 <= arg_695_1.time_ and arg_695_1.time_ < var_698_1 + var_698_2 then
				local var_698_3 = (arg_695_1.time_ - var_698_1) / var_698_2

				if arg_695_1.var_.characterEffect1074ui_story then
					arg_695_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_695_1.time_ >= var_698_1 + var_698_2 and arg_695_1.time_ < var_698_1 + var_698_2 + arg_698_0 and arg_695_1.var_.characterEffect1074ui_story then
				arg_695_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_698_4 = 0

			if var_698_4 < arg_695_1.time_ and arg_695_1.time_ <= var_698_4 + arg_698_0 then
				arg_695_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_698_5 = 0

			if var_698_5 < arg_695_1.time_ and arg_695_1.time_ <= var_698_5 + arg_698_0 then
				arg_695_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_698_6 = arg_695_1.actors_["10044ui_story"]
			local var_698_7 = 0

			if var_698_7 < arg_695_1.time_ and arg_695_1.time_ <= var_698_7 + arg_698_0 and arg_695_1.var_.characterEffect10044ui_story == nil then
				arg_695_1.var_.characterEffect10044ui_story = var_698_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_698_8 = 0.200000002980232

			if var_698_7 <= arg_695_1.time_ and arg_695_1.time_ < var_698_7 + var_698_8 then
				local var_698_9 = (arg_695_1.time_ - var_698_7) / var_698_8

				if arg_695_1.var_.characterEffect10044ui_story then
					local var_698_10 = Mathf.Lerp(0, 0.5, var_698_9)

					arg_695_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_695_1.var_.characterEffect10044ui_story.fillRatio = var_698_10
				end
			end

			if arg_695_1.time_ >= var_698_7 + var_698_8 and arg_695_1.time_ < var_698_7 + var_698_8 + arg_698_0 and arg_695_1.var_.characterEffect10044ui_story then
				local var_698_11 = 0.5

				arg_695_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_695_1.var_.characterEffect10044ui_story.fillRatio = var_698_11
			end

			local var_698_12 = 0
			local var_698_13 = 0.075

			if var_698_12 < arg_695_1.time_ and arg_695_1.time_ <= var_698_12 + arg_698_0 then
				arg_695_1.talkMaxDuration = 0
				arg_695_1.dialogCg_.alpha = 1

				arg_695_1.dialog_:SetActive(true)
				SetActive(arg_695_1.leftNameGo_, true)

				local var_698_14 = arg_695_1:FormatText(StoryNameCfg[410].name)

				arg_695_1.leftNameTxt_.text = var_698_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_695_1.leftNameTxt_.transform)

				arg_695_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_695_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_695_1:RecordName(arg_695_1.leftNameTxt_.text)
				SetActive(arg_695_1.iconTrs_.gameObject, false)
				arg_695_1.callingController_:SetSelectedState("normal")

				local var_698_15 = arg_695_1:GetWordFromCfg(222031172)
				local var_698_16 = arg_695_1:FormatText(var_698_15.content)

				arg_695_1.text_.text = var_698_16

				LuaForUtil.ClearLinePrefixSymbol(arg_695_1.text_)

				local var_698_17 = 3
				local var_698_18 = utf8.len(var_698_16)
				local var_698_19 = var_698_17 <= 0 and var_698_13 or var_698_13 * (var_698_18 / var_698_17)

				if var_698_19 > 0 and var_698_13 < var_698_19 then
					arg_695_1.talkMaxDuration = var_698_19

					if var_698_19 + var_698_12 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_19 + var_698_12
					end
				end

				arg_695_1.text_.text = var_698_16
				arg_695_1.typewritter.percent = 0

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031172", "story_v_out_222031.awb") ~= 0 then
					local var_698_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031172", "story_v_out_222031.awb") / 1000

					if var_698_20 + var_698_12 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_20 + var_698_12
					end

					if var_698_15.prefab_name ~= "" and arg_695_1.actors_[var_698_15.prefab_name] ~= nil then
						local var_698_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_695_1.actors_[var_698_15.prefab_name].transform, "story_v_out_222031", "222031172", "story_v_out_222031.awb")

						arg_695_1:RecordAudio("222031172", var_698_21)
						arg_695_1:RecordAudio("222031172", var_698_21)
					else
						arg_695_1:AudioAction("play", "voice", "story_v_out_222031", "222031172", "story_v_out_222031.awb")
					end

					arg_695_1:RecordHistoryTalkVoice("story_v_out_222031", "222031172", "story_v_out_222031.awb")
				end

				arg_695_1:RecordContent(arg_695_1.text_.text)
			end

			local var_698_22 = math.max(var_698_13, arg_695_1.talkMaxDuration)

			if var_698_12 <= arg_695_1.time_ and arg_695_1.time_ < var_698_12 + var_698_22 then
				arg_695_1.typewritter.percent = (arg_695_1.time_ - var_698_12) / var_698_22

				arg_695_1.typewritter:SetDirty()
			end

			if arg_695_1.time_ >= var_698_12 + var_698_22 and arg_695_1.time_ < var_698_12 + var_698_22 + arg_698_0 then
				arg_695_1.typewritter.percent = 1

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(true)
			end
		end
	end,
	Play222031173 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 222031173
		arg_699_1.duration_ = 6.7

		local var_699_0 = {
			ja = 6.7,
			ko = 4.8,
			zh = 4.8
		}
		local var_699_1 = manager.audio:GetLocalizationFlag()

		if var_699_0[var_699_1] ~= nil then
			arg_699_1.duration_ = var_699_0[var_699_1]
		end

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play222031174(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = arg_699_1.actors_["10044ui_story"].transform
			local var_702_1 = 0

			if var_702_1 < arg_699_1.time_ and arg_699_1.time_ <= var_702_1 + arg_702_0 then
				arg_699_1.var_.moveOldPos10044ui_story = var_702_0.localPosition
			end

			local var_702_2 = 0.001

			if var_702_1 <= arg_699_1.time_ and arg_699_1.time_ < var_702_1 + var_702_2 then
				local var_702_3 = (arg_699_1.time_ - var_702_1) / var_702_2
				local var_702_4 = Vector3.New(0, 100, 0)

				var_702_0.localPosition = Vector3.Lerp(arg_699_1.var_.moveOldPos10044ui_story, var_702_4, var_702_3)

				local var_702_5 = manager.ui.mainCamera.transform.position - var_702_0.position

				var_702_0.forward = Vector3.New(var_702_5.x, var_702_5.y, var_702_5.z)

				local var_702_6 = var_702_0.localEulerAngles

				var_702_6.z = 0
				var_702_6.x = 0
				var_702_0.localEulerAngles = var_702_6
			end

			if arg_699_1.time_ >= var_702_1 + var_702_2 and arg_699_1.time_ < var_702_1 + var_702_2 + arg_702_0 then
				var_702_0.localPosition = Vector3.New(0, 100, 0)

				local var_702_7 = manager.ui.mainCamera.transform.position - var_702_0.position

				var_702_0.forward = Vector3.New(var_702_7.x, var_702_7.y, var_702_7.z)

				local var_702_8 = var_702_0.localEulerAngles

				var_702_8.z = 0
				var_702_8.x = 0
				var_702_0.localEulerAngles = var_702_8
			end

			local var_702_9 = arg_699_1.actors_["10044ui_story"]
			local var_702_10 = 0

			if var_702_10 < arg_699_1.time_ and arg_699_1.time_ <= var_702_10 + arg_702_0 and arg_699_1.var_.characterEffect10044ui_story == nil then
				arg_699_1.var_.characterEffect10044ui_story = var_702_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_702_11 = 0.200000002980232

			if var_702_10 <= arg_699_1.time_ and arg_699_1.time_ < var_702_10 + var_702_11 then
				local var_702_12 = (arg_699_1.time_ - var_702_10) / var_702_11

				if arg_699_1.var_.characterEffect10044ui_story then
					local var_702_13 = Mathf.Lerp(0, 0.5, var_702_12)

					arg_699_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_699_1.var_.characterEffect10044ui_story.fillRatio = var_702_13
				end
			end

			if arg_699_1.time_ >= var_702_10 + var_702_11 and arg_699_1.time_ < var_702_10 + var_702_11 + arg_702_0 and arg_699_1.var_.characterEffect10044ui_story then
				local var_702_14 = 0.5

				arg_699_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_699_1.var_.characterEffect10044ui_story.fillRatio = var_702_14
			end

			local var_702_15 = arg_699_1.actors_["1070ui_story"].transform
			local var_702_16 = 0

			if var_702_16 < arg_699_1.time_ and arg_699_1.time_ <= var_702_16 + arg_702_0 then
				arg_699_1.var_.moveOldPos1070ui_story = var_702_15.localPosition
			end

			local var_702_17 = 0.001

			if var_702_16 <= arg_699_1.time_ and arg_699_1.time_ < var_702_16 + var_702_17 then
				local var_702_18 = (arg_699_1.time_ - var_702_16) / var_702_17
				local var_702_19 = Vector3.New(-0.7, -0.95, -6.05)

				var_702_15.localPosition = Vector3.Lerp(arg_699_1.var_.moveOldPos1070ui_story, var_702_19, var_702_18)

				local var_702_20 = manager.ui.mainCamera.transform.position - var_702_15.position

				var_702_15.forward = Vector3.New(var_702_20.x, var_702_20.y, var_702_20.z)

				local var_702_21 = var_702_15.localEulerAngles

				var_702_21.z = 0
				var_702_21.x = 0
				var_702_15.localEulerAngles = var_702_21
			end

			if arg_699_1.time_ >= var_702_16 + var_702_17 and arg_699_1.time_ < var_702_16 + var_702_17 + arg_702_0 then
				var_702_15.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_702_22 = manager.ui.mainCamera.transform.position - var_702_15.position

				var_702_15.forward = Vector3.New(var_702_22.x, var_702_22.y, var_702_22.z)

				local var_702_23 = var_702_15.localEulerAngles

				var_702_23.z = 0
				var_702_23.x = 0
				var_702_15.localEulerAngles = var_702_23
			end

			local var_702_24 = arg_699_1.actors_["1070ui_story"]
			local var_702_25 = 0

			if var_702_25 < arg_699_1.time_ and arg_699_1.time_ <= var_702_25 + arg_702_0 and arg_699_1.var_.characterEffect1070ui_story == nil then
				arg_699_1.var_.characterEffect1070ui_story = var_702_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_702_26 = 0.200000002980232

			if var_702_25 <= arg_699_1.time_ and arg_699_1.time_ < var_702_25 + var_702_26 then
				local var_702_27 = (arg_699_1.time_ - var_702_25) / var_702_26

				if arg_699_1.var_.characterEffect1070ui_story then
					arg_699_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_699_1.time_ >= var_702_25 + var_702_26 and arg_699_1.time_ < var_702_25 + var_702_26 + arg_702_0 and arg_699_1.var_.characterEffect1070ui_story then
				arg_699_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_702_28 = 0

			if var_702_28 < arg_699_1.time_ and arg_699_1.time_ <= var_702_28 + arg_702_0 then
				arg_699_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action1_1")
			end

			local var_702_29 = 0

			if var_702_29 < arg_699_1.time_ and arg_699_1.time_ <= var_702_29 + arg_702_0 then
				arg_699_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_702_30 = arg_699_1.actors_["1074ui_story"]
			local var_702_31 = 0

			if var_702_31 < arg_699_1.time_ and arg_699_1.time_ <= var_702_31 + arg_702_0 and arg_699_1.var_.characterEffect1074ui_story == nil then
				arg_699_1.var_.characterEffect1074ui_story = var_702_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_702_32 = 0.200000002980232

			if var_702_31 <= arg_699_1.time_ and arg_699_1.time_ < var_702_31 + var_702_32 then
				local var_702_33 = (arg_699_1.time_ - var_702_31) / var_702_32

				if arg_699_1.var_.characterEffect1074ui_story then
					local var_702_34 = Mathf.Lerp(0, 0.5, var_702_33)

					arg_699_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_699_1.var_.characterEffect1074ui_story.fillRatio = var_702_34
				end
			end

			if arg_699_1.time_ >= var_702_31 + var_702_32 and arg_699_1.time_ < var_702_31 + var_702_32 + arg_702_0 and arg_699_1.var_.characterEffect1074ui_story then
				local var_702_35 = 0.5

				arg_699_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_699_1.var_.characterEffect1074ui_story.fillRatio = var_702_35
			end

			local var_702_36 = 0
			local var_702_37 = 0.625

			if var_702_36 < arg_699_1.time_ and arg_699_1.time_ <= var_702_36 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0
				arg_699_1.dialogCg_.alpha = 1

				arg_699_1.dialog_:SetActive(true)
				SetActive(arg_699_1.leftNameGo_, true)

				local var_702_38 = arg_699_1:FormatText(StoryNameCfg[318].name)

				arg_699_1.leftNameTxt_.text = var_702_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_699_1.leftNameTxt_.transform)

				arg_699_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_699_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_699_1:RecordName(arg_699_1.leftNameTxt_.text)
				SetActive(arg_699_1.iconTrs_.gameObject, false)
				arg_699_1.callingController_:SetSelectedState("normal")

				local var_702_39 = arg_699_1:GetWordFromCfg(222031173)
				local var_702_40 = arg_699_1:FormatText(var_702_39.content)

				arg_699_1.text_.text = var_702_40

				LuaForUtil.ClearLinePrefixSymbol(arg_699_1.text_)

				local var_702_41 = 25
				local var_702_42 = utf8.len(var_702_40)
				local var_702_43 = var_702_41 <= 0 and var_702_37 or var_702_37 * (var_702_42 / var_702_41)

				if var_702_43 > 0 and var_702_37 < var_702_43 then
					arg_699_1.talkMaxDuration = var_702_43

					if var_702_43 + var_702_36 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_43 + var_702_36
					end
				end

				arg_699_1.text_.text = var_702_40
				arg_699_1.typewritter.percent = 0

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031173", "story_v_out_222031.awb") ~= 0 then
					local var_702_44 = manager.audio:GetVoiceLength("story_v_out_222031", "222031173", "story_v_out_222031.awb") / 1000

					if var_702_44 + var_702_36 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_44 + var_702_36
					end

					if var_702_39.prefab_name ~= "" and arg_699_1.actors_[var_702_39.prefab_name] ~= nil then
						local var_702_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_699_1.actors_[var_702_39.prefab_name].transform, "story_v_out_222031", "222031173", "story_v_out_222031.awb")

						arg_699_1:RecordAudio("222031173", var_702_45)
						arg_699_1:RecordAudio("222031173", var_702_45)
					else
						arg_699_1:AudioAction("play", "voice", "story_v_out_222031", "222031173", "story_v_out_222031.awb")
					end

					arg_699_1:RecordHistoryTalkVoice("story_v_out_222031", "222031173", "story_v_out_222031.awb")
				end

				arg_699_1:RecordContent(arg_699_1.text_.text)
			end

			local var_702_46 = math.max(var_702_37, arg_699_1.talkMaxDuration)

			if var_702_36 <= arg_699_1.time_ and arg_699_1.time_ < var_702_36 + var_702_46 then
				arg_699_1.typewritter.percent = (arg_699_1.time_ - var_702_36) / var_702_46

				arg_699_1.typewritter:SetDirty()
			end

			if arg_699_1.time_ >= var_702_36 + var_702_46 and arg_699_1.time_ < var_702_36 + var_702_46 + arg_702_0 then
				arg_699_1.typewritter.percent = 1

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(true)
			end
		end
	end,
	Play222031174 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 222031174
		arg_703_1.duration_ = 6

		local var_703_0 = {
			ja = 6,
			ko = 5.3,
			zh = 5.3
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
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play222031175(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = arg_703_1.actors_["1074ui_story"]
			local var_706_1 = 0

			if var_706_1 < arg_703_1.time_ and arg_703_1.time_ <= var_706_1 + arg_706_0 and arg_703_1.var_.characterEffect1074ui_story == nil then
				arg_703_1.var_.characterEffect1074ui_story = var_706_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_706_2 = 0.200000002980232

			if var_706_1 <= arg_703_1.time_ and arg_703_1.time_ < var_706_1 + var_706_2 then
				local var_706_3 = (arg_703_1.time_ - var_706_1) / var_706_2

				if arg_703_1.var_.characterEffect1074ui_story then
					arg_703_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_703_1.time_ >= var_706_1 + var_706_2 and arg_703_1.time_ < var_706_1 + var_706_2 + arg_706_0 and arg_703_1.var_.characterEffect1074ui_story then
				arg_703_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_706_4 = 0

			if var_706_4 < arg_703_1.time_ and arg_703_1.time_ <= var_706_4 + arg_706_0 then
				arg_703_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_706_5 = 0

			if var_706_5 < arg_703_1.time_ and arg_703_1.time_ <= var_706_5 + arg_706_0 then
				arg_703_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_706_6 = arg_703_1.actors_["1070ui_story"]
			local var_706_7 = 0

			if var_706_7 < arg_703_1.time_ and arg_703_1.time_ <= var_706_7 + arg_706_0 and arg_703_1.var_.characterEffect1070ui_story == nil then
				arg_703_1.var_.characterEffect1070ui_story = var_706_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_706_8 = 0.200000002980232

			if var_706_7 <= arg_703_1.time_ and arg_703_1.time_ < var_706_7 + var_706_8 then
				local var_706_9 = (arg_703_1.time_ - var_706_7) / var_706_8

				if arg_703_1.var_.characterEffect1070ui_story then
					local var_706_10 = Mathf.Lerp(0, 0.5, var_706_9)

					arg_703_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_703_1.var_.characterEffect1070ui_story.fillRatio = var_706_10
				end
			end

			if arg_703_1.time_ >= var_706_7 + var_706_8 and arg_703_1.time_ < var_706_7 + var_706_8 + arg_706_0 and arg_703_1.var_.characterEffect1070ui_story then
				local var_706_11 = 0.5

				arg_703_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_703_1.var_.characterEffect1070ui_story.fillRatio = var_706_11
			end

			local var_706_12 = 0
			local var_706_13 = 0.6

			if var_706_12 < arg_703_1.time_ and arg_703_1.time_ <= var_706_12 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, true)

				local var_706_14 = arg_703_1:FormatText(StoryNameCfg[410].name)

				arg_703_1.leftNameTxt_.text = var_706_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_703_1.leftNameTxt_.transform)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1.leftNameTxt_.text)
				SetActive(arg_703_1.iconTrs_.gameObject, false)
				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_15 = arg_703_1:GetWordFromCfg(222031174)
				local var_706_16 = arg_703_1:FormatText(var_706_15.content)

				arg_703_1.text_.text = var_706_16

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_17 = 24
				local var_706_18 = utf8.len(var_706_16)
				local var_706_19 = var_706_17 <= 0 and var_706_13 or var_706_13 * (var_706_18 / var_706_17)

				if var_706_19 > 0 and var_706_13 < var_706_19 then
					arg_703_1.talkMaxDuration = var_706_19

					if var_706_19 + var_706_12 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_19 + var_706_12
					end
				end

				arg_703_1.text_.text = var_706_16
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031174", "story_v_out_222031.awb") ~= 0 then
					local var_706_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031174", "story_v_out_222031.awb") / 1000

					if var_706_20 + var_706_12 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_20 + var_706_12
					end

					if var_706_15.prefab_name ~= "" and arg_703_1.actors_[var_706_15.prefab_name] ~= nil then
						local var_706_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_703_1.actors_[var_706_15.prefab_name].transform, "story_v_out_222031", "222031174", "story_v_out_222031.awb")

						arg_703_1:RecordAudio("222031174", var_706_21)
						arg_703_1:RecordAudio("222031174", var_706_21)
					else
						arg_703_1:AudioAction("play", "voice", "story_v_out_222031", "222031174", "story_v_out_222031.awb")
					end

					arg_703_1:RecordHistoryTalkVoice("story_v_out_222031", "222031174", "story_v_out_222031.awb")
				end

				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_22 = math.max(var_706_13, arg_703_1.talkMaxDuration)

			if var_706_12 <= arg_703_1.time_ and arg_703_1.time_ < var_706_12 + var_706_22 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_12) / var_706_22

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_12 + var_706_22 and arg_703_1.time_ < var_706_12 + var_706_22 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	Play222031175 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 222031175
		arg_707_1.duration_ = 7.433

		local var_707_0 = {
			ja = 7.433,
			ko = 7.2,
			zh = 7.2
		}
		local var_707_1 = manager.audio:GetLocalizationFlag()

		if var_707_0[var_707_1] ~= nil then
			arg_707_1.duration_ = var_707_0[var_707_1]
		end

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
		end

		function arg_707_1.playNext_(arg_709_0)
			if arg_709_0 == 1 then
				arg_707_0:Play222031176(arg_707_1)
			end
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = 0
			local var_710_1 = 0.95

			if var_710_0 < arg_707_1.time_ and arg_707_1.time_ <= var_710_0 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0
				arg_707_1.dialogCg_.alpha = 1

				arg_707_1.dialog_:SetActive(true)
				SetActive(arg_707_1.leftNameGo_, true)

				local var_710_2 = arg_707_1:FormatText(StoryNameCfg[410].name)

				arg_707_1.leftNameTxt_.text = var_710_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_707_1.leftNameTxt_.transform)

				arg_707_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_707_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_707_1:RecordName(arg_707_1.leftNameTxt_.text)
				SetActive(arg_707_1.iconTrs_.gameObject, false)
				arg_707_1.callingController_:SetSelectedState("normal")

				local var_710_3 = arg_707_1:GetWordFromCfg(222031175)
				local var_710_4 = arg_707_1:FormatText(var_710_3.content)

				arg_707_1.text_.text = var_710_4

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.text_)

				local var_710_5 = 38
				local var_710_6 = utf8.len(var_710_4)
				local var_710_7 = var_710_5 <= 0 and var_710_1 or var_710_1 * (var_710_6 / var_710_5)

				if var_710_7 > 0 and var_710_1 < var_710_7 then
					arg_707_1.talkMaxDuration = var_710_7

					if var_710_7 + var_710_0 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_7 + var_710_0
					end
				end

				arg_707_1.text_.text = var_710_4
				arg_707_1.typewritter.percent = 0

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031175", "story_v_out_222031.awb") ~= 0 then
					local var_710_8 = manager.audio:GetVoiceLength("story_v_out_222031", "222031175", "story_v_out_222031.awb") / 1000

					if var_710_8 + var_710_0 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_8 + var_710_0
					end

					if var_710_3.prefab_name ~= "" and arg_707_1.actors_[var_710_3.prefab_name] ~= nil then
						local var_710_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_707_1.actors_[var_710_3.prefab_name].transform, "story_v_out_222031", "222031175", "story_v_out_222031.awb")

						arg_707_1:RecordAudio("222031175", var_710_9)
						arg_707_1:RecordAudio("222031175", var_710_9)
					else
						arg_707_1:AudioAction("play", "voice", "story_v_out_222031", "222031175", "story_v_out_222031.awb")
					end

					arg_707_1:RecordHistoryTalkVoice("story_v_out_222031", "222031175", "story_v_out_222031.awb")
				end

				arg_707_1:RecordContent(arg_707_1.text_.text)
			end

			local var_710_10 = math.max(var_710_1, arg_707_1.talkMaxDuration)

			if var_710_0 <= arg_707_1.time_ and arg_707_1.time_ < var_710_0 + var_710_10 then
				arg_707_1.typewritter.percent = (arg_707_1.time_ - var_710_0) / var_710_10

				arg_707_1.typewritter:SetDirty()
			end

			if arg_707_1.time_ >= var_710_0 + var_710_10 and arg_707_1.time_ < var_710_0 + var_710_10 + arg_710_0 then
				arg_707_1.typewritter.percent = 1

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(true)
			end
		end
	end,
	Play222031176 = function(arg_711_0, arg_711_1)
		arg_711_1.time_ = 0
		arg_711_1.frameCnt_ = 0
		arg_711_1.state_ = "playing"
		arg_711_1.curTalkId_ = 222031176
		arg_711_1.duration_ = 9.2

		local var_711_0 = {
			ja = 9.2,
			ko = 4.266,
			zh = 4.266
		}
		local var_711_1 = manager.audio:GetLocalizationFlag()

		if var_711_0[var_711_1] ~= nil then
			arg_711_1.duration_ = var_711_0[var_711_1]
		end

		SetActive(arg_711_1.tipsGo_, false)

		function arg_711_1.onSingleLineFinish_()
			arg_711_1.onSingleLineUpdate_ = nil
			arg_711_1.onSingleLineFinish_ = nil
			arg_711_1.state_ = "waiting"
		end

		function arg_711_1.playNext_(arg_713_0)
			if arg_713_0 == 1 then
				arg_711_0:Play222031177(arg_711_1)
			end
		end

		function arg_711_1.onSingleLineUpdate_(arg_714_0)
			local var_714_0 = arg_711_1.actors_["1070ui_story"]
			local var_714_1 = 0

			if var_714_1 < arg_711_1.time_ and arg_711_1.time_ <= var_714_1 + arg_714_0 and arg_711_1.var_.characterEffect1070ui_story == nil then
				arg_711_1.var_.characterEffect1070ui_story = var_714_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_714_2 = 0.200000002980232

			if var_714_1 <= arg_711_1.time_ and arg_711_1.time_ < var_714_1 + var_714_2 then
				local var_714_3 = (arg_711_1.time_ - var_714_1) / var_714_2

				if arg_711_1.var_.characterEffect1070ui_story then
					arg_711_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_711_1.time_ >= var_714_1 + var_714_2 and arg_711_1.time_ < var_714_1 + var_714_2 + arg_714_0 and arg_711_1.var_.characterEffect1070ui_story then
				arg_711_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_714_4 = 0

			if var_714_4 < arg_711_1.time_ and arg_711_1.time_ <= var_714_4 + arg_714_0 then
				arg_711_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_1")
			end

			local var_714_5 = 0

			if var_714_5 < arg_711_1.time_ and arg_711_1.time_ <= var_714_5 + arg_714_0 then
				arg_711_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_714_6 = arg_711_1.actors_["1074ui_story"]
			local var_714_7 = 0

			if var_714_7 < arg_711_1.time_ and arg_711_1.time_ <= var_714_7 + arg_714_0 and arg_711_1.var_.characterEffect1074ui_story == nil then
				arg_711_1.var_.characterEffect1074ui_story = var_714_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_714_8 = 0.200000002980232

			if var_714_7 <= arg_711_1.time_ and arg_711_1.time_ < var_714_7 + var_714_8 then
				local var_714_9 = (arg_711_1.time_ - var_714_7) / var_714_8

				if arg_711_1.var_.characterEffect1074ui_story then
					local var_714_10 = Mathf.Lerp(0, 0.5, var_714_9)

					arg_711_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_711_1.var_.characterEffect1074ui_story.fillRatio = var_714_10
				end
			end

			if arg_711_1.time_ >= var_714_7 + var_714_8 and arg_711_1.time_ < var_714_7 + var_714_8 + arg_714_0 and arg_711_1.var_.characterEffect1074ui_story then
				local var_714_11 = 0.5

				arg_711_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_711_1.var_.characterEffect1074ui_story.fillRatio = var_714_11
			end

			local var_714_12 = 0
			local var_714_13 = 0.4

			if var_714_12 < arg_711_1.time_ and arg_711_1.time_ <= var_714_12 + arg_714_0 then
				arg_711_1.talkMaxDuration = 0
				arg_711_1.dialogCg_.alpha = 1

				arg_711_1.dialog_:SetActive(true)
				SetActive(arg_711_1.leftNameGo_, true)

				local var_714_14 = arg_711_1:FormatText(StoryNameCfg[318].name)

				arg_711_1.leftNameTxt_.text = var_714_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_711_1.leftNameTxt_.transform)

				arg_711_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_711_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_711_1:RecordName(arg_711_1.leftNameTxt_.text)
				SetActive(arg_711_1.iconTrs_.gameObject, false)
				arg_711_1.callingController_:SetSelectedState("normal")

				local var_714_15 = arg_711_1:GetWordFromCfg(222031176)
				local var_714_16 = arg_711_1:FormatText(var_714_15.content)

				arg_711_1.text_.text = var_714_16

				LuaForUtil.ClearLinePrefixSymbol(arg_711_1.text_)

				local var_714_17 = 16
				local var_714_18 = utf8.len(var_714_16)
				local var_714_19 = var_714_17 <= 0 and var_714_13 or var_714_13 * (var_714_18 / var_714_17)

				if var_714_19 > 0 and var_714_13 < var_714_19 then
					arg_711_1.talkMaxDuration = var_714_19

					if var_714_19 + var_714_12 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_19 + var_714_12
					end
				end

				arg_711_1.text_.text = var_714_16
				arg_711_1.typewritter.percent = 0

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031176", "story_v_out_222031.awb") ~= 0 then
					local var_714_20 = manager.audio:GetVoiceLength("story_v_out_222031", "222031176", "story_v_out_222031.awb") / 1000

					if var_714_20 + var_714_12 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_20 + var_714_12
					end

					if var_714_15.prefab_name ~= "" and arg_711_1.actors_[var_714_15.prefab_name] ~= nil then
						local var_714_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_711_1.actors_[var_714_15.prefab_name].transform, "story_v_out_222031", "222031176", "story_v_out_222031.awb")

						arg_711_1:RecordAudio("222031176", var_714_21)
						arg_711_1:RecordAudio("222031176", var_714_21)
					else
						arg_711_1:AudioAction("play", "voice", "story_v_out_222031", "222031176", "story_v_out_222031.awb")
					end

					arg_711_1:RecordHistoryTalkVoice("story_v_out_222031", "222031176", "story_v_out_222031.awb")
				end

				arg_711_1:RecordContent(arg_711_1.text_.text)
			end

			local var_714_22 = math.max(var_714_13, arg_711_1.talkMaxDuration)

			if var_714_12 <= arg_711_1.time_ and arg_711_1.time_ < var_714_12 + var_714_22 then
				arg_711_1.typewritter.percent = (arg_711_1.time_ - var_714_12) / var_714_22

				arg_711_1.typewritter:SetDirty()
			end

			if arg_711_1.time_ >= var_714_12 + var_714_22 and arg_711_1.time_ < var_714_12 + var_714_22 + arg_714_0 then
				arg_711_1.typewritter.percent = 1

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(true)
			end
		end
	end,
	Play222031177 = function(arg_715_0, arg_715_1)
		arg_715_1.time_ = 0
		arg_715_1.frameCnt_ = 0
		arg_715_1.state_ = "playing"
		arg_715_1.curTalkId_ = 222031177
		arg_715_1.duration_ = 5

		SetActive(arg_715_1.tipsGo_, false)

		function arg_715_1.onSingleLineFinish_()
			arg_715_1.onSingleLineUpdate_ = nil
			arg_715_1.onSingleLineFinish_ = nil
			arg_715_1.state_ = "waiting"
		end

		function arg_715_1.playNext_(arg_717_0)
			if arg_717_0 == 1 then
				arg_715_0:Play222031178(arg_715_1)
			end
		end

		function arg_715_1.onSingleLineUpdate_(arg_718_0)
			local var_718_0 = arg_715_1.actors_["1070ui_story"]
			local var_718_1 = 0

			if var_718_1 < arg_715_1.time_ and arg_715_1.time_ <= var_718_1 + arg_718_0 and arg_715_1.var_.characterEffect1070ui_story == nil then
				arg_715_1.var_.characterEffect1070ui_story = var_718_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_718_2 = 0.200000002980232

			if var_718_1 <= arg_715_1.time_ and arg_715_1.time_ < var_718_1 + var_718_2 then
				local var_718_3 = (arg_715_1.time_ - var_718_1) / var_718_2

				if arg_715_1.var_.characterEffect1070ui_story then
					local var_718_4 = Mathf.Lerp(0, 0.5, var_718_3)

					arg_715_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_715_1.var_.characterEffect1070ui_story.fillRatio = var_718_4
				end
			end

			if arg_715_1.time_ >= var_718_1 + var_718_2 and arg_715_1.time_ < var_718_1 + var_718_2 + arg_718_0 and arg_715_1.var_.characterEffect1070ui_story then
				local var_718_5 = 0.5

				arg_715_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_715_1.var_.characterEffect1070ui_story.fillRatio = var_718_5
			end

			local var_718_6 = 0
			local var_718_7 = 1.225

			if var_718_6 < arg_715_1.time_ and arg_715_1.time_ <= var_718_6 + arg_718_0 then
				arg_715_1.talkMaxDuration = 0
				arg_715_1.dialogCg_.alpha = 1

				arg_715_1.dialog_:SetActive(true)
				SetActive(arg_715_1.leftNameGo_, false)

				arg_715_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_715_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_715_1:RecordName(arg_715_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_715_1.iconTrs_.gameObject, false)
				arg_715_1.callingController_:SetSelectedState("normal")

				local var_718_8 = arg_715_1:GetWordFromCfg(222031177)
				local var_718_9 = arg_715_1:FormatText(var_718_8.content)

				arg_715_1.text_.text = var_718_9

				LuaForUtil.ClearLinePrefixSymbol(arg_715_1.text_)

				local var_718_10 = 49
				local var_718_11 = utf8.len(var_718_9)
				local var_718_12 = var_718_10 <= 0 and var_718_7 or var_718_7 * (var_718_11 / var_718_10)

				if var_718_12 > 0 and var_718_7 < var_718_12 then
					arg_715_1.talkMaxDuration = var_718_12

					if var_718_12 + var_718_6 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_12 + var_718_6
					end
				end

				arg_715_1.text_.text = var_718_9
				arg_715_1.typewritter.percent = 0

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(false)
				arg_715_1:RecordContent(arg_715_1.text_.text)
			end

			local var_718_13 = math.max(var_718_7, arg_715_1.talkMaxDuration)

			if var_718_6 <= arg_715_1.time_ and arg_715_1.time_ < var_718_6 + var_718_13 then
				arg_715_1.typewritter.percent = (arg_715_1.time_ - var_718_6) / var_718_13

				arg_715_1.typewritter:SetDirty()
			end

			if arg_715_1.time_ >= var_718_6 + var_718_13 and arg_715_1.time_ < var_718_6 + var_718_13 + arg_718_0 then
				arg_715_1.typewritter.percent = 1

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(true)
			end
		end
	end,
	Play222031178 = function(arg_719_0, arg_719_1)
		arg_719_1.time_ = 0
		arg_719_1.frameCnt_ = 0
		arg_719_1.state_ = "playing"
		arg_719_1.curTalkId_ = 222031178
		arg_719_1.duration_ = 2.5

		local var_719_0 = {
			ja = 2.5,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_719_1 = manager.audio:GetLocalizationFlag()

		if var_719_0[var_719_1] ~= nil then
			arg_719_1.duration_ = var_719_0[var_719_1]
		end

		SetActive(arg_719_1.tipsGo_, false)

		function arg_719_1.onSingleLineFinish_()
			arg_719_1.onSingleLineUpdate_ = nil
			arg_719_1.onSingleLineFinish_ = nil
			arg_719_1.state_ = "waiting"
			arg_719_1.auto_ = false
		end

		function arg_719_1.playNext_(arg_721_0)
			arg_719_1.onStoryFinished_()
		end

		function arg_719_1.onSingleLineUpdate_(arg_722_0)
			local var_722_0 = arg_719_1.actors_["1070ui_story"]
			local var_722_1 = 0

			if var_722_1 < arg_719_1.time_ and arg_719_1.time_ <= var_722_1 + arg_722_0 and arg_719_1.var_.characterEffect1070ui_story == nil then
				arg_719_1.var_.characterEffect1070ui_story = var_722_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_722_2 = 0.200000002980232

			if var_722_1 <= arg_719_1.time_ and arg_719_1.time_ < var_722_1 + var_722_2 then
				local var_722_3 = (arg_719_1.time_ - var_722_1) / var_722_2

				if arg_719_1.var_.characterEffect1070ui_story then
					arg_719_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_719_1.time_ >= var_722_1 + var_722_2 and arg_719_1.time_ < var_722_1 + var_722_2 + arg_722_0 and arg_719_1.var_.characterEffect1070ui_story then
				arg_719_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_722_4 = 0

			if var_722_4 < arg_719_1.time_ and arg_719_1.time_ <= var_722_4 + arg_722_0 then
				arg_719_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_2")
			end

			local var_722_5 = 0

			if var_722_5 < arg_719_1.time_ and arg_719_1.time_ <= var_722_5 + arg_722_0 then
				arg_719_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_722_6 = 0
			local var_722_7 = 0.2

			if var_722_6 < arg_719_1.time_ and arg_719_1.time_ <= var_722_6 + arg_722_0 then
				arg_719_1.talkMaxDuration = 0
				arg_719_1.dialogCg_.alpha = 1

				arg_719_1.dialog_:SetActive(true)
				SetActive(arg_719_1.leftNameGo_, true)

				local var_722_8 = arg_719_1:FormatText(StoryNameCfg[318].name)

				arg_719_1.leftNameTxt_.text = var_722_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_719_1.leftNameTxt_.transform)

				arg_719_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_719_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_719_1:RecordName(arg_719_1.leftNameTxt_.text)
				SetActive(arg_719_1.iconTrs_.gameObject, false)
				arg_719_1.callingController_:SetSelectedState("normal")

				local var_722_9 = arg_719_1:GetWordFromCfg(222031178)
				local var_722_10 = arg_719_1:FormatText(var_722_9.content)

				arg_719_1.text_.text = var_722_10

				LuaForUtil.ClearLinePrefixSymbol(arg_719_1.text_)

				local var_722_11 = 8
				local var_722_12 = utf8.len(var_722_10)
				local var_722_13 = var_722_11 <= 0 and var_722_7 or var_722_7 * (var_722_12 / var_722_11)

				if var_722_13 > 0 and var_722_7 < var_722_13 then
					arg_719_1.talkMaxDuration = var_722_13

					if var_722_13 + var_722_6 > arg_719_1.duration_ then
						arg_719_1.duration_ = var_722_13 + var_722_6
					end
				end

				arg_719_1.text_.text = var_722_10
				arg_719_1.typewritter.percent = 0

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222031", "222031178", "story_v_out_222031.awb") ~= 0 then
					local var_722_14 = manager.audio:GetVoiceLength("story_v_out_222031", "222031178", "story_v_out_222031.awb") / 1000

					if var_722_14 + var_722_6 > arg_719_1.duration_ then
						arg_719_1.duration_ = var_722_14 + var_722_6
					end

					if var_722_9.prefab_name ~= "" and arg_719_1.actors_[var_722_9.prefab_name] ~= nil then
						local var_722_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_719_1.actors_[var_722_9.prefab_name].transform, "story_v_out_222031", "222031178", "story_v_out_222031.awb")

						arg_719_1:RecordAudio("222031178", var_722_15)
						arg_719_1:RecordAudio("222031178", var_722_15)
					else
						arg_719_1:AudioAction("play", "voice", "story_v_out_222031", "222031178", "story_v_out_222031.awb")
					end

					arg_719_1:RecordHistoryTalkVoice("story_v_out_222031", "222031178", "story_v_out_222031.awb")
				end

				arg_719_1:RecordContent(arg_719_1.text_.text)
			end

			local var_722_16 = math.max(var_722_7, arg_719_1.talkMaxDuration)

			if var_722_6 <= arg_719_1.time_ and arg_719_1.time_ < var_722_6 + var_722_16 then
				arg_719_1.typewritter.percent = (arg_719_1.time_ - var_722_6) / var_722_16

				arg_719_1.typewritter:SetDirty()
			end

			if arg_719_1.time_ >= var_722_6 + var_722_16 and arg_719_1.time_ < var_722_6 + var_722_16 + arg_722_0 then
				arg_719_1.typewritter.percent = 1

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST39a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST37a"
	},
	voices = {
		"story_v_out_222031.awb"
	}
}
