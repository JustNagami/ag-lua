return {
	Play123101001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 123101001
		arg_1_1.duration_ = 9.499999999999

		local var_1_0 = {
			zh = 6.165999999999,
			ja = 9.499999999999
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
				arg_1_0:Play123101002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K05f"

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
				local var_4_5 = arg_1_1.bgs_.K05f

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
					if iter_4_0 ~= "K05f" then
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

			local var_4_22 = "1093ui_story"

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

			local var_4_26 = arg_1_1.actors_["1093ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1093ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -1.11, -5.88)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1093ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1093ui_story"]
			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1093ui_story == nil then
				arg_1_1.var_.characterEffect1093ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1093ui_story then
					arg_1_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1093ui_story then
				arg_1_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_4_39 = 1.8

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action2_1")
			end

			local var_4_40 = 1.8

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_4_41 = 0
			local var_4_42 = 0.866666666666667

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 1.8
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_2_4_story_xiajingqu", "bgm_activity_2_4_story_xiajingqu", "bgm_activity_2_4_story_xiajingqu.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 1.999999999999
			local var_4_50 = 0.575

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[73].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(123101001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101001", "story_v_out_123101.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_123101", "123101001", "story_v_out_123101.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_123101", "123101001", "story_v_out_123101.awb")

						arg_1_1:RecordAudio("123101001", var_4_59)
						arg_1_1:RecordAudio("123101001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_123101", "123101001", "story_v_out_123101.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_123101", "123101001", "story_v_out_123101.awb")
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
	Play123101002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 123101002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play123101003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1093ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1093ui_story == nil then
				arg_7_1.var_.characterEffect1093ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1093ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1093ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1093ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1093ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.225

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(123101002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 9
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_14 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_14 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_14

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_14 and arg_7_1.time_ < var_10_6 + var_10_14 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play123101003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 123101003
		arg_11_1.duration_ = 10.4

		local var_11_0 = {
			zh = 8.233,
			ja = 10.4
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
				arg_11_0:Play123101004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1093ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story == nil then
				arg_11_1.var_.characterEffect1093ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1093ui_story then
					arg_11_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story then
				arg_11_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action426")
			end

			local var_14_6 = 0
			local var_14_7 = 0.825

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[73].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(123101003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101003", "story_v_out_123101.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101003", "story_v_out_123101.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_123101", "123101003", "story_v_out_123101.awb")

						arg_11_1:RecordAudio("123101003", var_14_15)
						arg_11_1:RecordAudio("123101003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_123101", "123101003", "story_v_out_123101.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_123101", "123101003", "story_v_out_123101.awb")
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
	Play123101004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 123101004
		arg_15_1.duration_ = 3.6

		local var_15_0 = {
			zh = 3.066,
			ja = 3.6
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
				arg_15_0:Play123101005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1093ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story == nil then
				arg_15_1.var_.characterEffect1093ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1093ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1093ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1093ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.3

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[495].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(123101004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 12
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101004", "story_v_out_123101.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101004", "story_v_out_123101.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_123101", "123101004", "story_v_out_123101.awb")

						arg_15_1:RecordAudio("123101004", var_18_15)
						arg_15_1:RecordAudio("123101004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_123101", "123101004", "story_v_out_123101.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_123101", "123101004", "story_v_out_123101.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_16 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_16 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_16

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_16 and arg_15_1.time_ < var_18_6 + var_18_16 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play123101005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 123101005
		arg_19_1.duration_ = 1.999999999999

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play123101006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1093ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story == nil then
				arg_19_1.var_.characterEffect1093ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1093ui_story then
					arg_19_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story then
				arg_19_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_22_5 = 0
			local var_22_6 = 0.05

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_7 = arg_19_1:FormatText(StoryNameCfg[73].name)

				arg_19_1.leftNameTxt_.text = var_22_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_8 = arg_19_1:GetWordFromCfg(123101005)
				local var_22_9 = arg_19_1:FormatText(var_22_8.content)

				arg_19_1.text_.text = var_22_9

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_10 = 2
				local var_22_11 = utf8.len(var_22_9)
				local var_22_12 = var_22_10 <= 0 and var_22_6 or var_22_6 * (var_22_11 / var_22_10)

				if var_22_12 > 0 and var_22_6 < var_22_12 then
					arg_19_1.talkMaxDuration = var_22_12

					if var_22_12 + var_22_5 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_5
					end
				end

				arg_19_1.text_.text = var_22_9
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101005", "story_v_out_123101.awb") ~= 0 then
					local var_22_13 = manager.audio:GetVoiceLength("story_v_out_123101", "123101005", "story_v_out_123101.awb") / 1000

					if var_22_13 + var_22_5 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_5
					end

					if var_22_8.prefab_name ~= "" and arg_19_1.actors_[var_22_8.prefab_name] ~= nil then
						local var_22_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_8.prefab_name].transform, "story_v_out_123101", "123101005", "story_v_out_123101.awb")

						arg_19_1:RecordAudio("123101005", var_22_14)
						arg_19_1:RecordAudio("123101005", var_22_14)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_123101", "123101005", "story_v_out_123101.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_123101", "123101005", "story_v_out_123101.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_15 = math.max(var_22_6, arg_19_1.talkMaxDuration)

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_15 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_5) / var_22_15

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_5 + var_22_15 and arg_19_1.time_ < var_22_5 + var_22_15 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play123101006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 123101006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play123101007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1093ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1093ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1093ui_story, var_26_4, var_26_3)

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

			local var_26_9 = arg_23_1.actors_["1093ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story == nil then
				arg_23_1.var_.characterEffect1093ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1093ui_story then
					local var_26_13 = Mathf.Lerp(0, 0.5, var_26_12)

					arg_23_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1093ui_story.fillRatio = var_26_13
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story then
				local var_26_14 = 0.5

				arg_23_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1093ui_story.fillRatio = var_26_14
			end

			local var_26_15 = 0
			local var_26_16 = 2

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

				local var_26_17 = arg_23_1:GetWordFromCfg(123101006)
				local var_26_18 = arg_23_1:FormatText(var_26_17.content)

				arg_23_1.text_.text = var_26_18

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_19 = 80
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
	Play123101007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 123101007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play123101008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.175

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

				local var_30_2 = arg_27_1:GetWordFromCfg(123101007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 47
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
	Play123101008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 123101008
		arg_31_1.duration_ = 2.166

		local var_31_0 = {
			zh = 2.133,
			ja = 2.166
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
				arg_31_0:Play123101009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.2

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[357].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_littleboyb")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(123101008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101008", "story_v_out_123101.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101008", "story_v_out_123101.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_123101", "123101008", "story_v_out_123101.awb")

						arg_31_1:RecordAudio("123101008", var_34_9)
						arg_31_1:RecordAudio("123101008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_123101", "123101008", "story_v_out_123101.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_123101", "123101008", "story_v_out_123101.awb")
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
	Play123101009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 123101009
		arg_35_1.duration_ = 3.933

		local var_35_0 = {
			zh = 3.933,
			ja = 3.766
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
				arg_35_0:Play123101010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.525

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[357].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_littleboyb")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(123101009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101009", "story_v_out_123101.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101009", "story_v_out_123101.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_123101", "123101009", "story_v_out_123101.awb")

						arg_35_1:RecordAudio("123101009", var_38_9)
						arg_35_1:RecordAudio("123101009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_123101", "123101009", "story_v_out_123101.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_123101", "123101009", "story_v_out_123101.awb")
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
	Play123101010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 123101010
		arg_39_1.duration_ = 4.233

		local var_39_0 = {
			zh = 4.233,
			ja = 4.166
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
				arg_39_0:Play123101011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.5

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[495].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(123101010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 20
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_1 or var_42_1 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_1 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101010", "story_v_out_123101.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101010", "story_v_out_123101.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_123101", "123101010", "story_v_out_123101.awb")

						arg_39_1:RecordAudio("123101010", var_42_9)
						arg_39_1:RecordAudio("123101010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_123101", "123101010", "story_v_out_123101.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_123101", "123101010", "story_v_out_123101.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_10 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_10 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_10

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_10 and arg_39_1.time_ < var_42_0 + var_42_10 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play123101011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 123101011
		arg_43_1.duration_ = 4.6

		local var_43_0 = {
			zh = 3.5,
			ja = 4.6
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
				arg_43_0:Play123101012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.3

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[495].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(123101011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101011", "story_v_out_123101.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101011", "story_v_out_123101.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_123101", "123101011", "story_v_out_123101.awb")

						arg_43_1:RecordAudio("123101011", var_46_9)
						arg_43_1:RecordAudio("123101011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_123101", "123101011", "story_v_out_123101.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_123101", "123101011", "story_v_out_123101.awb")
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
	Play123101012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 123101012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play123101013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.125

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(123101012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 45
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play123101013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 123101013
		arg_51_1.duration_ = 3.433

		local var_51_0 = {
			zh = 1.7,
			ja = 3.433
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
				arg_51_0:Play123101014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.225

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[495].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(123101013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101013", "story_v_out_123101.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101013", "story_v_out_123101.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_123101", "123101013", "story_v_out_123101.awb")

						arg_51_1:RecordAudio("123101013", var_54_9)
						arg_51_1:RecordAudio("123101013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_123101", "123101013", "story_v_out_123101.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_123101", "123101013", "story_v_out_123101.awb")
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
	Play123101014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 123101014
		arg_55_1.duration_ = 10.033

		local var_55_0 = {
			zh = 10.033,
			ja = 6.2
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
				arg_55_0:Play123101015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.775

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[36].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(123101014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101014", "story_v_out_123101.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101014", "story_v_out_123101.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_123101", "123101014", "story_v_out_123101.awb")

						arg_55_1:RecordAudio("123101014", var_58_9)
						arg_55_1:RecordAudio("123101014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_123101", "123101014", "story_v_out_123101.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_123101", "123101014", "story_v_out_123101.awb")
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
	Play123101015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 123101015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play123101016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.95

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

				local var_62_2 = arg_59_1:GetWordFromCfg(123101015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 38
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
	Play123101016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 123101016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play123101017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.075

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[7].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(123101016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 3
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_8 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_8 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_8

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_8 and arg_63_1.time_ < var_66_0 + var_66_8 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play123101017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 123101017
		arg_67_1.duration_ = 6.966

		local var_67_0 = {
			zh = 6.966,
			ja = 2.5
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
				arg_67_0:Play123101018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "1055ui_story"

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

			local var_70_4 = arg_67_1.actors_["1055ui_story"].transform
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.var_.moveOldPos1055ui_story = var_70_4.localPosition
			end

			local var_70_6 = 0.001

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6
				local var_70_8 = Vector3.New(0, -0.965, -6.2)

				var_70_4.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1055ui_story, var_70_8, var_70_7)

				local var_70_9 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_9.x, var_70_9.y, var_70_9.z)

				local var_70_10 = var_70_4.localEulerAngles

				var_70_10.z = 0
				var_70_10.x = 0
				var_70_4.localEulerAngles = var_70_10
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 then
				var_70_4.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_4.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_4.localEulerAngles = var_70_12
			end

			local var_70_13 = arg_67_1.actors_["1055ui_story"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.characterEffect1055ui_story == nil then
				arg_67_1.var_.characterEffect1055ui_story = var_70_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_15 = 0.200000002980232

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.characterEffect1055ui_story then
					arg_67_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.characterEffect1055ui_story then
				arg_67_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_70_17 = 0

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 then
				arg_67_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action7_1")
			end

			local var_70_18 = 0

			if var_70_18 < arg_67_1.time_ and arg_67_1.time_ <= var_70_18 + arg_70_0 then
				arg_67_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_70_19 = 0
			local var_70_20 = 0.825

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[481].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(123101017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101017", "story_v_out_123101.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_123101", "123101017", "story_v_out_123101.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_123101", "123101017", "story_v_out_123101.awb")

						arg_67_1:RecordAudio("123101017", var_70_28)
						arg_67_1:RecordAudio("123101017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_123101", "123101017", "story_v_out_123101.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_123101", "123101017", "story_v_out_123101.awb")
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
	Play123101018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 123101018
		arg_71_1.duration_ = 3.733

		local var_71_0 = {
			zh = 2,
			ja = 3.733
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
				arg_71_0:Play123101019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1055ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1055ui_story == nil then
				arg_71_1.var_.characterEffect1055ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1055ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1055ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1055ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1055ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.15

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_8 = arg_71_1:FormatText(StoryNameCfg[495].name)

				arg_71_1.leftNameTxt_.text = var_74_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_9 = arg_71_1:GetWordFromCfg(123101018)
				local var_74_10 = arg_71_1:FormatText(var_74_9.content)

				arg_71_1.text_.text = var_74_10

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_11 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101018", "story_v_out_123101.awb") ~= 0 then
					local var_74_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101018", "story_v_out_123101.awb") / 1000

					if var_74_14 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_14 + var_74_6
					end

					if var_74_9.prefab_name ~= "" and arg_71_1.actors_[var_74_9.prefab_name] ~= nil then
						local var_74_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_9.prefab_name].transform, "story_v_out_123101", "123101018", "story_v_out_123101.awb")

						arg_71_1:RecordAudio("123101018", var_74_15)
						arg_71_1:RecordAudio("123101018", var_74_15)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_123101", "123101018", "story_v_out_123101.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_123101", "123101018", "story_v_out_123101.awb")
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
	Play123101019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 123101019
		arg_75_1.duration_ = 7.733

		local var_75_0 = {
			zh = 4.833,
			ja = 7.733
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
				arg_75_0:Play123101020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1055ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1055ui_story == nil then
				arg_75_1.var_.characterEffect1055ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1055ui_story then
					arg_75_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1055ui_story then
				arg_75_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_78_4 = 0

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_78_5 = 0
			local var_78_6 = 0.525

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_7 = arg_75_1:FormatText(StoryNameCfg[481].name)

				arg_75_1.leftNameTxt_.text = var_78_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_8 = arg_75_1:GetWordFromCfg(123101019)
				local var_78_9 = arg_75_1:FormatText(var_78_8.content)

				arg_75_1.text_.text = var_78_9

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_10 = 21
				local var_78_11 = utf8.len(var_78_9)
				local var_78_12 = var_78_10 <= 0 and var_78_6 or var_78_6 * (var_78_11 / var_78_10)

				if var_78_12 > 0 and var_78_6 < var_78_12 then
					arg_75_1.talkMaxDuration = var_78_12

					if var_78_12 + var_78_5 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_12 + var_78_5
					end
				end

				arg_75_1.text_.text = var_78_9
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101019", "story_v_out_123101.awb") ~= 0 then
					local var_78_13 = manager.audio:GetVoiceLength("story_v_out_123101", "123101019", "story_v_out_123101.awb") / 1000

					if var_78_13 + var_78_5 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_13 + var_78_5
					end

					if var_78_8.prefab_name ~= "" and arg_75_1.actors_[var_78_8.prefab_name] ~= nil then
						local var_78_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_8.prefab_name].transform, "story_v_out_123101", "123101019", "story_v_out_123101.awb")

						arg_75_1:RecordAudio("123101019", var_78_14)
						arg_75_1:RecordAudio("123101019", var_78_14)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_123101", "123101019", "story_v_out_123101.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_123101", "123101019", "story_v_out_123101.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_15 = math.max(var_78_6, arg_75_1.talkMaxDuration)

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_15 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_5) / var_78_15

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_5 + var_78_15 and arg_75_1.time_ < var_78_5 + var_78_15 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play123101020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 123101020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play123101021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1055ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1055ui_story == nil then
				arg_79_1.var_.characterEffect1055ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1055ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1055ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1055ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1055ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.2

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

				local var_82_8 = arg_79_1:GetWordFromCfg(123101020)
				local var_82_9 = arg_79_1:FormatText(var_82_8.content)

				arg_79_1.text_.text = var_82_9

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_10 = 8
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
	Play123101021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 123101021
		arg_83_1.duration_ = 3.6

		local var_83_0 = {
			zh = 2.1,
			ja = 3.6
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
				arg_83_0:Play123101022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.225

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[495].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(123101021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101021", "story_v_out_123101.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101021", "story_v_out_123101.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_123101", "123101021", "story_v_out_123101.awb")

						arg_83_1:RecordAudio("123101021", var_86_9)
						arg_83_1:RecordAudio("123101021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_123101", "123101021", "story_v_out_123101.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_123101", "123101021", "story_v_out_123101.awb")
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
	Play123101022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 123101022
		arg_87_1.duration_ = 5.966

		local var_87_0 = {
			zh = 3.933,
			ja = 5.966
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
				arg_87_0:Play123101023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1055ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1055ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, -0.965, -6.2)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1055ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1055ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect1055ui_story == nil then
				arg_87_1.var_.characterEffect1055ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect1055ui_story then
					arg_87_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect1055ui_story then
				arg_87_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action7_2")
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_90_15 = 0
			local var_90_16 = 0.45

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_17 = arg_87_1:FormatText(StoryNameCfg[481].name)

				arg_87_1.leftNameTxt_.text = var_90_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_18 = arg_87_1:GetWordFromCfg(123101022)
				local var_90_19 = arg_87_1:FormatText(var_90_18.content)

				arg_87_1.text_.text = var_90_19

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_20 = 18
				local var_90_21 = utf8.len(var_90_19)
				local var_90_22 = var_90_20 <= 0 and var_90_16 or var_90_16 * (var_90_21 / var_90_20)

				if var_90_22 > 0 and var_90_16 < var_90_22 then
					arg_87_1.talkMaxDuration = var_90_22

					if var_90_22 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_22 + var_90_15
					end
				end

				arg_87_1.text_.text = var_90_19
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101022", "story_v_out_123101.awb") ~= 0 then
					local var_90_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101022", "story_v_out_123101.awb") / 1000

					if var_90_23 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_23 + var_90_15
					end

					if var_90_18.prefab_name ~= "" and arg_87_1.actors_[var_90_18.prefab_name] ~= nil then
						local var_90_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_18.prefab_name].transform, "story_v_out_123101", "123101022", "story_v_out_123101.awb")

						arg_87_1:RecordAudio("123101022", var_90_24)
						arg_87_1:RecordAudio("123101022", var_90_24)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_123101", "123101022", "story_v_out_123101.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_123101", "123101022", "story_v_out_123101.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_25 = math.max(var_90_16, arg_87_1.talkMaxDuration)

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_25 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_15) / var_90_25

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_15 + var_90_25 and arg_87_1.time_ < var_90_15 + var_90_25 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play123101023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 123101023
		arg_91_1.duration_ = 10.433

		local var_91_0 = {
			zh = 7.9,
			ja = 10.433
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
				arg_91_0:Play123101024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_94_2 = 0
			local var_94_3 = 0.925

			if var_94_2 < arg_91_1.time_ and arg_91_1.time_ <= var_94_2 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_4 = arg_91_1:FormatText(StoryNameCfg[481].name)

				arg_91_1.leftNameTxt_.text = var_94_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_5 = arg_91_1:GetWordFromCfg(123101023)
				local var_94_6 = arg_91_1:FormatText(var_94_5.content)

				arg_91_1.text_.text = var_94_6

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_7 = 37
				local var_94_8 = utf8.len(var_94_6)
				local var_94_9 = var_94_7 <= 0 and var_94_3 or var_94_3 * (var_94_8 / var_94_7)

				if var_94_9 > 0 and var_94_3 < var_94_9 then
					arg_91_1.talkMaxDuration = var_94_9

					if var_94_9 + var_94_2 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_9 + var_94_2
					end
				end

				arg_91_1.text_.text = var_94_6
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101023", "story_v_out_123101.awb") ~= 0 then
					local var_94_10 = manager.audio:GetVoiceLength("story_v_out_123101", "123101023", "story_v_out_123101.awb") / 1000

					if var_94_10 + var_94_2 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_10 + var_94_2
					end

					if var_94_5.prefab_name ~= "" and arg_91_1.actors_[var_94_5.prefab_name] ~= nil then
						local var_94_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_5.prefab_name].transform, "story_v_out_123101", "123101023", "story_v_out_123101.awb")

						arg_91_1:RecordAudio("123101023", var_94_11)
						arg_91_1:RecordAudio("123101023", var_94_11)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_123101", "123101023", "story_v_out_123101.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_123101", "123101023", "story_v_out_123101.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_12 = math.max(var_94_3, arg_91_1.talkMaxDuration)

			if var_94_2 <= arg_91_1.time_ and arg_91_1.time_ < var_94_2 + var_94_12 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_2) / var_94_12

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_2 + var_94_12 and arg_91_1.time_ < var_94_2 + var_94_12 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play123101024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 123101024
		arg_95_1.duration_ = 5.933

		local var_95_0 = {
			zh = 4.833,
			ja = 5.933
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
				arg_95_0:Play123101025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1055ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1055ui_story == nil then
				arg_95_1.var_.characterEffect1055ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1055ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1055ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1055ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1055ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.625

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[495].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(123101024)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101024", "story_v_out_123101.awb") ~= 0 then
					local var_98_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101024", "story_v_out_123101.awb") / 1000

					if var_98_14 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_14 + var_98_6
					end

					if var_98_9.prefab_name ~= "" and arg_95_1.actors_[var_98_9.prefab_name] ~= nil then
						local var_98_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_9.prefab_name].transform, "story_v_out_123101", "123101024", "story_v_out_123101.awb")

						arg_95_1:RecordAudio("123101024", var_98_15)
						arg_95_1:RecordAudio("123101024", var_98_15)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_123101", "123101024", "story_v_out_123101.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_123101", "123101024", "story_v_out_123101.awb")
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
	Play123101025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 123101025
		arg_99_1.duration_ = 7.233

		local var_99_0 = {
			zh = 4.4,
			ja = 7.233
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
				arg_99_0:Play123101026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1055ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1055ui_story == nil then
				arg_99_1.var_.characterEffect1055ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1055ui_story then
					arg_99_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1055ui_story then
				arg_99_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_102_4 = 0

			if var_102_4 < arg_99_1.time_ and arg_99_1.time_ <= var_102_4 + arg_102_0 then
				arg_99_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_102_6 = 0
			local var_102_7 = 0.25

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[481].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(123101025)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 10
				local var_102_12 = utf8.len(var_102_10)
				local var_102_13 = var_102_11 <= 0 and var_102_7 or var_102_7 * (var_102_12 / var_102_11)

				if var_102_13 > 0 and var_102_7 < var_102_13 then
					arg_99_1.talkMaxDuration = var_102_13

					if var_102_13 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_13 + var_102_6
					end
				end

				arg_99_1.text_.text = var_102_10
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101025", "story_v_out_123101.awb") ~= 0 then
					local var_102_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101025", "story_v_out_123101.awb") / 1000

					if var_102_14 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_14 + var_102_6
					end

					if var_102_9.prefab_name ~= "" and arg_99_1.actors_[var_102_9.prefab_name] ~= nil then
						local var_102_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_9.prefab_name].transform, "story_v_out_123101", "123101025", "story_v_out_123101.awb")

						arg_99_1:RecordAudio("123101025", var_102_15)
						arg_99_1:RecordAudio("123101025", var_102_15)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_123101", "123101025", "story_v_out_123101.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_123101", "123101025", "story_v_out_123101.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_16 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_16 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_16

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_16 and arg_99_1.time_ < var_102_6 + var_102_16 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play123101026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 123101026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play123101027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1055ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1055ui_story == nil then
				arg_103_1.var_.characterEffect1055ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1055ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1055ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1055ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1055ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 1.25

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_8 = arg_103_1:GetWordFromCfg(123101026)
				local var_106_9 = arg_103_1:FormatText(var_106_8.content)

				arg_103_1.text_.text = var_106_9

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_10 = 50
				local var_106_11 = utf8.len(var_106_9)
				local var_106_12 = var_106_10 <= 0 and var_106_7 or var_106_7 * (var_106_11 / var_106_10)

				if var_106_12 > 0 and var_106_7 < var_106_12 then
					arg_103_1.talkMaxDuration = var_106_12

					if var_106_12 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_12 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_9
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_13 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_13 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_13

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_13 and arg_103_1.time_ < var_106_6 + var_106_13 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play123101027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 123101027
		arg_107_1.duration_ = 5.133

		local var_107_0 = {
			zh = 5.133,
			ja = 3.1
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
				arg_107_0:Play123101028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1055ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1055ui_story == nil then
				arg_107_1.var_.characterEffect1055ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1055ui_story then
					arg_107_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1055ui_story then
				arg_107_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_110_4 = 0

			if var_110_4 < arg_107_1.time_ and arg_107_1.time_ <= var_110_4 + arg_110_0 then
				arg_107_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_110_6 = 0
			local var_110_7 = 0.625

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[481].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(123101027)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 25
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101027", "story_v_out_123101.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101027", "story_v_out_123101.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_out_123101", "123101027", "story_v_out_123101.awb")

						arg_107_1:RecordAudio("123101027", var_110_15)
						arg_107_1:RecordAudio("123101027", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_123101", "123101027", "story_v_out_123101.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_123101", "123101027", "story_v_out_123101.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_16 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_16 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_16

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_16 and arg_107_1.time_ < var_110_6 + var_110_16 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play123101028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 123101028
		arg_111_1.duration_ = 5.933

		local var_111_0 = {
			zh = 4.533,
			ja = 5.933
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
				arg_111_0:Play123101029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1055ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1055ui_story == nil then
				arg_111_1.var_.characterEffect1055ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1055ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1055ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1055ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1055ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 0.4

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_8 = arg_111_1:FormatText(StoryNameCfg[495].name)

				arg_111_1.leftNameTxt_.text = var_114_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_9 = arg_111_1:GetWordFromCfg(123101028)
				local var_114_10 = arg_111_1:FormatText(var_114_9.content)

				arg_111_1.text_.text = var_114_10

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_11 = 16
				local var_114_12 = utf8.len(var_114_10)
				local var_114_13 = var_114_11 <= 0 and var_114_7 or var_114_7 * (var_114_12 / var_114_11)

				if var_114_13 > 0 and var_114_7 < var_114_13 then
					arg_111_1.talkMaxDuration = var_114_13

					if var_114_13 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_13 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_10
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101028", "story_v_out_123101.awb") ~= 0 then
					local var_114_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101028", "story_v_out_123101.awb") / 1000

					if var_114_14 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_14 + var_114_6
					end

					if var_114_9.prefab_name ~= "" and arg_111_1.actors_[var_114_9.prefab_name] ~= nil then
						local var_114_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_9.prefab_name].transform, "story_v_out_123101", "123101028", "story_v_out_123101.awb")

						arg_111_1:RecordAudio("123101028", var_114_15)
						arg_111_1:RecordAudio("123101028", var_114_15)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_123101", "123101028", "story_v_out_123101.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_123101", "123101028", "story_v_out_123101.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_16 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_16 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_16

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_16 and arg_111_1.time_ < var_114_6 + var_114_16 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play123101029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 123101029
		arg_115_1.duration_ = 9.4

		local var_115_0 = {
			zh = 7.066,
			ja = 9.4
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
				arg_115_0:Play123101030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.775

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[498].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, true)
				arg_115_1.iconController_:SetSelectedState("hero")

				arg_115_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboyb")

				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(123101029)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101029", "story_v_out_123101.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101029", "story_v_out_123101.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_123101", "123101029", "story_v_out_123101.awb")

						arg_115_1:RecordAudio("123101029", var_118_9)
						arg_115_1:RecordAudio("123101029", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_123101", "123101029", "story_v_out_123101.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_123101", "123101029", "story_v_out_123101.awb")
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
	Play123101030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 123101030
		arg_119_1.duration_ = 8.366

		local var_119_0 = {
			zh = 8.366,
			ja = 6.333
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
				arg_119_0:Play123101031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.9

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[495].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(123101030)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101030", "story_v_out_123101.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101030", "story_v_out_123101.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_123101", "123101030", "story_v_out_123101.awb")

						arg_119_1:RecordAudio("123101030", var_122_9)
						arg_119_1:RecordAudio("123101030", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_123101", "123101030", "story_v_out_123101.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_123101", "123101030", "story_v_out_123101.awb")
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
	Play123101031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 123101031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play123101032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.475

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_2 = arg_123_1:GetWordFromCfg(123101031)
				local var_126_3 = arg_123_1:FormatText(var_126_2.content)

				arg_123_1.text_.text = var_126_3

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_4 = 19
				local var_126_5 = utf8.len(var_126_3)
				local var_126_6 = var_126_4 <= 0 and var_126_1 or var_126_1 * (var_126_5 / var_126_4)

				if var_126_6 > 0 and var_126_1 < var_126_6 then
					arg_123_1.talkMaxDuration = var_126_6

					if var_126_6 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_6 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_3
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_7 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_7 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_7

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_7 and arg_123_1.time_ < var_126_0 + var_126_7 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play123101032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 123101032
		arg_127_1.duration_ = 2.033

		local var_127_0 = {
			zh = 1.166,
			ja = 2.033
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
				arg_127_0:Play123101033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.125

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[495].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(123101032)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 5
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101032", "story_v_out_123101.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101032", "story_v_out_123101.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_123101", "123101032", "story_v_out_123101.awb")

						arg_127_1:RecordAudio("123101032", var_130_9)
						arg_127_1:RecordAudio("123101032", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_123101", "123101032", "story_v_out_123101.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_123101", "123101032", "story_v_out_123101.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play123101033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 123101033
		arg_131_1.duration_ = 2.533

		local var_131_0 = {
			zh = 1.999999999999,
			ja = 2.533
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
				arg_131_0:Play123101034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1055ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos1055ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, -0.965, -6.2)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1055ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["1055ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect1055ui_story == nil then
				arg_131_1.var_.characterEffect1055ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect1055ui_story then
					arg_131_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect1055ui_story then
				arg_131_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_134_15 = 0
			local var_134_16 = 0.075

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_17 = arg_131_1:FormatText(StoryNameCfg[481].name)

				arg_131_1.leftNameTxt_.text = var_134_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_18 = arg_131_1:GetWordFromCfg(123101033)
				local var_134_19 = arg_131_1:FormatText(var_134_18.content)

				arg_131_1.text_.text = var_134_19

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_20 = 3
				local var_134_21 = utf8.len(var_134_19)
				local var_134_22 = var_134_20 <= 0 and var_134_16 or var_134_16 * (var_134_21 / var_134_20)

				if var_134_22 > 0 and var_134_16 < var_134_22 then
					arg_131_1.talkMaxDuration = var_134_22

					if var_134_22 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_22 + var_134_15
					end
				end

				arg_131_1.text_.text = var_134_19
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101033", "story_v_out_123101.awb") ~= 0 then
					local var_134_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101033", "story_v_out_123101.awb") / 1000

					if var_134_23 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_23 + var_134_15
					end

					if var_134_18.prefab_name ~= "" and arg_131_1.actors_[var_134_18.prefab_name] ~= nil then
						local var_134_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_18.prefab_name].transform, "story_v_out_123101", "123101033", "story_v_out_123101.awb")

						arg_131_1:RecordAudio("123101033", var_134_24)
						arg_131_1:RecordAudio("123101033", var_134_24)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_123101", "123101033", "story_v_out_123101.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_123101", "123101033", "story_v_out_123101.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_25 = math.max(var_134_16, arg_131_1.talkMaxDuration)

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_25 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_15) / var_134_25

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_15 + var_134_25 and arg_131_1.time_ < var_134_15 + var_134_25 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play123101034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 123101034
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play123101035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1055ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1055ui_story == nil then
				arg_135_1.var_.characterEffect1055ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1055ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1055ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1055ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1055ui_story.fillRatio = var_138_5
			end

			local var_138_6 = 0
			local var_138_7 = 0.75

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_8 = arg_135_1:GetWordFromCfg(123101034)
				local var_138_9 = arg_135_1:FormatText(var_138_8.content)

				arg_135_1.text_.text = var_138_9

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_10 = 30
				local var_138_11 = utf8.len(var_138_9)
				local var_138_12 = var_138_10 <= 0 and var_138_7 or var_138_7 * (var_138_11 / var_138_10)

				if var_138_12 > 0 and var_138_7 < var_138_12 then
					arg_135_1.talkMaxDuration = var_138_12

					if var_138_12 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_12 + var_138_6
					end
				end

				arg_135_1.text_.text = var_138_9
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_13 = math.max(var_138_7, arg_135_1.talkMaxDuration)

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_13 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_6) / var_138_13

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_6 + var_138_13 and arg_135_1.time_ < var_138_6 + var_138_13 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play123101035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 123101035
		arg_139_1.duration_ = 8.7

		local var_139_0 = {
			zh = 8.7,
			ja = 4.733
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
				arg_139_0:Play123101036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1093ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1093ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1093ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1093ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1093ui_story == nil then
				arg_139_1.var_.characterEffect1093ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1093ui_story then
					arg_139_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1093ui_story then
				arg_139_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_142_13 = 0

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_142_15 = arg_139_1.actors_["1055ui_story"].transform
			local var_142_16 = 0

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 then
				arg_139_1.var_.moveOldPos1055ui_story = var_142_15.localPosition
			end

			local var_142_17 = 0.001

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_16) / var_142_17
				local var_142_19 = Vector3.New(0.7, -0.965, -6.2)

				var_142_15.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1055ui_story, var_142_19, var_142_18)

				local var_142_20 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_20.x, var_142_20.y, var_142_20.z)

				local var_142_21 = var_142_15.localEulerAngles

				var_142_21.z = 0
				var_142_21.x = 0
				var_142_15.localEulerAngles = var_142_21
			end

			if arg_139_1.time_ >= var_142_16 + var_142_17 and arg_139_1.time_ < var_142_16 + var_142_17 + arg_142_0 then
				var_142_15.localPosition = Vector3.New(0.7, -0.965, -6.2)

				local var_142_22 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_22.x, var_142_22.y, var_142_22.z)

				local var_142_23 = var_142_15.localEulerAngles

				var_142_23.z = 0
				var_142_23.x = 0
				var_142_15.localEulerAngles = var_142_23
			end

			local var_142_24 = arg_139_1.actors_["1055ui_story"]
			local var_142_25 = 0

			if var_142_25 < arg_139_1.time_ and arg_139_1.time_ <= var_142_25 + arg_142_0 and arg_139_1.var_.characterEffect1055ui_story == nil then
				arg_139_1.var_.characterEffect1055ui_story = var_142_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_26 = 0.200000002980232

			if var_142_25 <= arg_139_1.time_ and arg_139_1.time_ < var_142_25 + var_142_26 then
				local var_142_27 = (arg_139_1.time_ - var_142_25) / var_142_26

				if arg_139_1.var_.characterEffect1055ui_story then
					local var_142_28 = Mathf.Lerp(0, 0.5, var_142_27)

					arg_139_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1055ui_story.fillRatio = var_142_28
				end
			end

			if arg_139_1.time_ >= var_142_25 + var_142_26 and arg_139_1.time_ < var_142_25 + var_142_26 + arg_142_0 and arg_139_1.var_.characterEffect1055ui_story then
				local var_142_29 = 0.5

				arg_139_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1055ui_story.fillRatio = var_142_29
			end

			local var_142_30 = 0

			if var_142_30 < arg_139_1.time_ and arg_139_1.time_ <= var_142_30 + arg_142_0 then
				arg_139_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_142_31 = 0
			local var_142_32 = 1

			if var_142_31 < arg_139_1.time_ and arg_139_1.time_ <= var_142_31 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_33 = arg_139_1:FormatText(StoryNameCfg[73].name)

				arg_139_1.leftNameTxt_.text = var_142_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_34 = arg_139_1:GetWordFromCfg(123101035)
				local var_142_35 = arg_139_1:FormatText(var_142_34.content)

				arg_139_1.text_.text = var_142_35

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_36 = 40
				local var_142_37 = utf8.len(var_142_35)
				local var_142_38 = var_142_36 <= 0 and var_142_32 or var_142_32 * (var_142_37 / var_142_36)

				if var_142_38 > 0 and var_142_32 < var_142_38 then
					arg_139_1.talkMaxDuration = var_142_38

					if var_142_38 + var_142_31 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_38 + var_142_31
					end
				end

				arg_139_1.text_.text = var_142_35
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101035", "story_v_out_123101.awb") ~= 0 then
					local var_142_39 = manager.audio:GetVoiceLength("story_v_out_123101", "123101035", "story_v_out_123101.awb") / 1000

					if var_142_39 + var_142_31 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_39 + var_142_31
					end

					if var_142_34.prefab_name ~= "" and arg_139_1.actors_[var_142_34.prefab_name] ~= nil then
						local var_142_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_34.prefab_name].transform, "story_v_out_123101", "123101035", "story_v_out_123101.awb")

						arg_139_1:RecordAudio("123101035", var_142_40)
						arg_139_1:RecordAudio("123101035", var_142_40)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_123101", "123101035", "story_v_out_123101.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_123101", "123101035", "story_v_out_123101.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_41 = math.max(var_142_32, arg_139_1.talkMaxDuration)

			if var_142_31 <= arg_139_1.time_ and arg_139_1.time_ < var_142_31 + var_142_41 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_31) / var_142_41

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_31 + var_142_41 and arg_139_1.time_ < var_142_31 + var_142_41 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play123101036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 123101036
		arg_143_1.duration_ = 4.9

		local var_143_0 = {
			zh = 3.5,
			ja = 4.9
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
				arg_143_0:Play123101037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_146_1 = 0
			local var_146_2 = 0.35

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_3 = arg_143_1:FormatText(StoryNameCfg[73].name)

				arg_143_1.leftNameTxt_.text = var_146_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_4 = arg_143_1:GetWordFromCfg(123101036)
				local var_146_5 = arg_143_1:FormatText(var_146_4.content)

				arg_143_1.text_.text = var_146_5

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_6 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101036", "story_v_out_123101.awb") ~= 0 then
					local var_146_9 = manager.audio:GetVoiceLength("story_v_out_123101", "123101036", "story_v_out_123101.awb") / 1000

					if var_146_9 + var_146_1 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_9 + var_146_1
					end

					if var_146_4.prefab_name ~= "" and arg_143_1.actors_[var_146_4.prefab_name] ~= nil then
						local var_146_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_4.prefab_name].transform, "story_v_out_123101", "123101036", "story_v_out_123101.awb")

						arg_143_1:RecordAudio("123101036", var_146_10)
						arg_143_1:RecordAudio("123101036", var_146_10)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_123101", "123101036", "story_v_out_123101.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_123101", "123101036", "story_v_out_123101.awb")
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
	Play123101037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 123101037
		arg_147_1.duration_ = 6.6

		local var_147_0 = {
			zh = 2.3,
			ja = 6.6
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
				arg_147_0:Play123101038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1055ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1055ui_story == nil then
				arg_147_1.var_.characterEffect1055ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.200000002980232

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1055ui_story then
					arg_147_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1055ui_story then
				arg_147_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_150_4 = 0

			if var_150_4 < arg_147_1.time_ and arg_147_1.time_ <= var_150_4 + arg_150_0 then
				arg_147_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action5_1")
			end

			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_150_6 = arg_147_1.actors_["1093ui_story"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 and arg_147_1.var_.characterEffect1093ui_story == nil then
				arg_147_1.var_.characterEffect1093ui_story = var_150_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_8 = 0.200000002980232

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_8 then
				local var_150_9 = (arg_147_1.time_ - var_150_7) / var_150_8

				if arg_147_1.var_.characterEffect1093ui_story then
					local var_150_10 = Mathf.Lerp(0, 0.5, var_150_9)

					arg_147_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1093ui_story.fillRatio = var_150_10
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_8 and arg_147_1.time_ < var_150_7 + var_150_8 + arg_150_0 and arg_147_1.var_.characterEffect1093ui_story then
				local var_150_11 = 0.5

				arg_147_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1093ui_story.fillRatio = var_150_11
			end

			local var_150_12 = 0
			local var_150_13 = 0.275

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_14 = arg_147_1:FormatText(StoryNameCfg[481].name)

				arg_147_1.leftNameTxt_.text = var_150_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_15 = arg_147_1:GetWordFromCfg(123101037)
				local var_150_16 = arg_147_1:FormatText(var_150_15.content)

				arg_147_1.text_.text = var_150_16

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_17 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101037", "story_v_out_123101.awb") ~= 0 then
					local var_150_20 = manager.audio:GetVoiceLength("story_v_out_123101", "123101037", "story_v_out_123101.awb") / 1000

					if var_150_20 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_20 + var_150_12
					end

					if var_150_15.prefab_name ~= "" and arg_147_1.actors_[var_150_15.prefab_name] ~= nil then
						local var_150_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_15.prefab_name].transform, "story_v_out_123101", "123101037", "story_v_out_123101.awb")

						arg_147_1:RecordAudio("123101037", var_150_21)
						arg_147_1:RecordAudio("123101037", var_150_21)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_123101", "123101037", "story_v_out_123101.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_123101", "123101037", "story_v_out_123101.awb")
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
	Play123101038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 123101038
		arg_151_1.duration_ = 1.999999999999

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play123101039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1093ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1093ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1093ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["1093ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect1093ui_story == nil then
				arg_151_1.var_.characterEffect1093ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect1093ui_story then
					arg_151_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect1093ui_story then
				arg_151_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_2")
			end

			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_154_15 = arg_151_1.actors_["1055ui_story"]
			local var_154_16 = 0

			if var_154_16 < arg_151_1.time_ and arg_151_1.time_ <= var_154_16 + arg_154_0 and arg_151_1.var_.characterEffect1055ui_story == nil then
				arg_151_1.var_.characterEffect1055ui_story = var_154_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_17 = 0.200000002980232

			if var_154_16 <= arg_151_1.time_ and arg_151_1.time_ < var_154_16 + var_154_17 then
				local var_154_18 = (arg_151_1.time_ - var_154_16) / var_154_17

				if arg_151_1.var_.characterEffect1055ui_story then
					local var_154_19 = Mathf.Lerp(0, 0.5, var_154_18)

					arg_151_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1055ui_story.fillRatio = var_154_19
				end
			end

			if arg_151_1.time_ >= var_154_16 + var_154_17 and arg_151_1.time_ < var_154_16 + var_154_17 + arg_154_0 and arg_151_1.var_.characterEffect1055ui_story then
				local var_154_20 = 0.5

				arg_151_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1055ui_story.fillRatio = var_154_20
			end

			local var_154_21 = 0
			local var_154_22 = 0.05

			if var_154_21 < arg_151_1.time_ and arg_151_1.time_ <= var_154_21 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_23 = arg_151_1:FormatText(StoryNameCfg[73].name)

				arg_151_1.leftNameTxt_.text = var_154_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_24 = arg_151_1:GetWordFromCfg(123101038)
				local var_154_25 = arg_151_1:FormatText(var_154_24.content)

				arg_151_1.text_.text = var_154_25

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_26 = 2
				local var_154_27 = utf8.len(var_154_25)
				local var_154_28 = var_154_26 <= 0 and var_154_22 or var_154_22 * (var_154_27 / var_154_26)

				if var_154_28 > 0 and var_154_22 < var_154_28 then
					arg_151_1.talkMaxDuration = var_154_28

					if var_154_28 + var_154_21 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_28 + var_154_21
					end
				end

				arg_151_1.text_.text = var_154_25
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101038", "story_v_out_123101.awb") ~= 0 then
					local var_154_29 = manager.audio:GetVoiceLength("story_v_out_123101", "123101038", "story_v_out_123101.awb") / 1000

					if var_154_29 + var_154_21 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_29 + var_154_21
					end

					if var_154_24.prefab_name ~= "" and arg_151_1.actors_[var_154_24.prefab_name] ~= nil then
						local var_154_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_24.prefab_name].transform, "story_v_out_123101", "123101038", "story_v_out_123101.awb")

						arg_151_1:RecordAudio("123101038", var_154_30)
						arg_151_1:RecordAudio("123101038", var_154_30)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_123101", "123101038", "story_v_out_123101.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_123101", "123101038", "story_v_out_123101.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_31 = math.max(var_154_22, arg_151_1.talkMaxDuration)

			if var_154_21 <= arg_151_1.time_ and arg_151_1.time_ < var_154_21 + var_154_31 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_21) / var_154_31

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_21 + var_154_31 and arg_151_1.time_ < var_154_21 + var_154_31 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play123101039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 123101039
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play123101040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1093ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1093ui_story == nil then
				arg_155_1.var_.characterEffect1093ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1093ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1093ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1093ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1093ui_story.fillRatio = var_158_5
			end

			local var_158_6 = 0
			local var_158_7 = 1.5

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_8 = arg_155_1:GetWordFromCfg(123101039)
				local var_158_9 = arg_155_1:FormatText(var_158_8.content)

				arg_155_1.text_.text = var_158_9

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_10 = 60
				local var_158_11 = utf8.len(var_158_9)
				local var_158_12 = var_158_10 <= 0 and var_158_7 or var_158_7 * (var_158_11 / var_158_10)

				if var_158_12 > 0 and var_158_7 < var_158_12 then
					arg_155_1.talkMaxDuration = var_158_12

					if var_158_12 + var_158_6 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_12 + var_158_6
					end
				end

				arg_155_1.text_.text = var_158_9
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_13 = math.max(var_158_7, arg_155_1.talkMaxDuration)

			if var_158_6 <= arg_155_1.time_ and arg_155_1.time_ < var_158_6 + var_158_13 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_6) / var_158_13

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_6 + var_158_13 and arg_155_1.time_ < var_158_6 + var_158_13 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play123101040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 123101040
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play123101041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.3

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[7].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(123101040)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 12
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_8 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_8 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_8

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_8 and arg_159_1.time_ < var_162_0 + var_162_8 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play123101041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 123101041
		arg_163_1.duration_ = 12.633

		local var_163_0 = {
			zh = 8.366,
			ja = 12.633
		}
		local var_163_1 = manager.audio:GetLocalizationFlag()

		if var_163_0[var_163_1] ~= nil then
			arg_163_1.duration_ = var_163_0[var_163_1]
		end

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play123101042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1055ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1055ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0.7, -0.965, -6.2)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1055ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0.7, -0.965, -6.2)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["1055ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect1055ui_story == nil then
				arg_163_1.var_.characterEffect1055ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect1055ui_story then
					arg_163_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect1055ui_story then
				arg_163_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_166_13 = 0

			if var_166_13 < arg_163_1.time_ and arg_163_1.time_ <= var_166_13 + arg_166_0 then
				arg_163_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action5_2")
			end

			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 then
				arg_163_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_166_15 = 0
			local var_166_16 = 1.125

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_17 = arg_163_1:FormatText(StoryNameCfg[481].name)

				arg_163_1.leftNameTxt_.text = var_166_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_18 = arg_163_1:GetWordFromCfg(123101041)
				local var_166_19 = arg_163_1:FormatText(var_166_18.content)

				arg_163_1.text_.text = var_166_19

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_20 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101041", "story_v_out_123101.awb") ~= 0 then
					local var_166_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101041", "story_v_out_123101.awb") / 1000

					if var_166_23 + var_166_15 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_23 + var_166_15
					end

					if var_166_18.prefab_name ~= "" and arg_163_1.actors_[var_166_18.prefab_name] ~= nil then
						local var_166_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_18.prefab_name].transform, "story_v_out_123101", "123101041", "story_v_out_123101.awb")

						arg_163_1:RecordAudio("123101041", var_166_24)
						arg_163_1:RecordAudio("123101041", var_166_24)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_123101", "123101041", "story_v_out_123101.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_123101", "123101041", "story_v_out_123101.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_25 = math.max(var_166_16, arg_163_1.talkMaxDuration)

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_25 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_15) / var_166_25

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_15 + var_166_25 and arg_163_1.time_ < var_166_15 + var_166_25 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play123101042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 123101042
		arg_167_1.duration_ = 13.733

		local var_167_0 = {
			zh = 8.566,
			ja = 13.733
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
				arg_167_0:Play123101043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_170_1 = 0
			local var_170_2 = 1.075

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_3 = arg_167_1:FormatText(StoryNameCfg[481].name)

				arg_167_1.leftNameTxt_.text = var_170_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_4 = arg_167_1:GetWordFromCfg(123101042)
				local var_170_5 = arg_167_1:FormatText(var_170_4.content)

				arg_167_1.text_.text = var_170_5

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_6 = 43
				local var_170_7 = utf8.len(var_170_5)
				local var_170_8 = var_170_6 <= 0 and var_170_2 or var_170_2 * (var_170_7 / var_170_6)

				if var_170_8 > 0 and var_170_2 < var_170_8 then
					arg_167_1.talkMaxDuration = var_170_8

					if var_170_8 + var_170_1 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_1
					end
				end

				arg_167_1.text_.text = var_170_5
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101042", "story_v_out_123101.awb") ~= 0 then
					local var_170_9 = manager.audio:GetVoiceLength("story_v_out_123101", "123101042", "story_v_out_123101.awb") / 1000

					if var_170_9 + var_170_1 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_9 + var_170_1
					end

					if var_170_4.prefab_name ~= "" and arg_167_1.actors_[var_170_4.prefab_name] ~= nil then
						local var_170_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_4.prefab_name].transform, "story_v_out_123101", "123101042", "story_v_out_123101.awb")

						arg_167_1:RecordAudio("123101042", var_170_10)
						arg_167_1:RecordAudio("123101042", var_170_10)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_123101", "123101042", "story_v_out_123101.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_123101", "123101042", "story_v_out_123101.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_11 = math.max(var_170_2, arg_167_1.talkMaxDuration)

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_11 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_1) / var_170_11

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_1 + var_170_11 and arg_167_1.time_ < var_170_1 + var_170_11 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play123101043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 123101043
		arg_171_1.duration_ = 7.2

		local var_171_0 = {
			zh = 6.266,
			ja = 7.2
		}
		local var_171_1 = manager.audio:GetLocalizationFlag()

		if var_171_0[var_171_1] ~= nil then
			arg_171_1.duration_ = var_171_0[var_171_1]
		end

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play123101044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_2 = 0
			local var_174_3 = 0.725

			if var_174_2 < arg_171_1.time_ and arg_171_1.time_ <= var_174_2 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_4 = arg_171_1:FormatText(StoryNameCfg[481].name)

				arg_171_1.leftNameTxt_.text = var_174_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_5 = arg_171_1:GetWordFromCfg(123101043)
				local var_174_6 = arg_171_1:FormatText(var_174_5.content)

				arg_171_1.text_.text = var_174_6

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_7 = 29
				local var_174_8 = utf8.len(var_174_6)
				local var_174_9 = var_174_7 <= 0 and var_174_3 or var_174_3 * (var_174_8 / var_174_7)

				if var_174_9 > 0 and var_174_3 < var_174_9 then
					arg_171_1.talkMaxDuration = var_174_9

					if var_174_9 + var_174_2 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_9 + var_174_2
					end
				end

				arg_171_1.text_.text = var_174_6
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101043", "story_v_out_123101.awb") ~= 0 then
					local var_174_10 = manager.audio:GetVoiceLength("story_v_out_123101", "123101043", "story_v_out_123101.awb") / 1000

					if var_174_10 + var_174_2 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_10 + var_174_2
					end

					if var_174_5.prefab_name ~= "" and arg_171_1.actors_[var_174_5.prefab_name] ~= nil then
						local var_174_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_5.prefab_name].transform, "story_v_out_123101", "123101043", "story_v_out_123101.awb")

						arg_171_1:RecordAudio("123101043", var_174_11)
						arg_171_1:RecordAudio("123101043", var_174_11)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_123101", "123101043", "story_v_out_123101.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_123101", "123101043", "story_v_out_123101.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_12 = math.max(var_174_3, arg_171_1.talkMaxDuration)

			if var_174_2 <= arg_171_1.time_ and arg_171_1.time_ < var_174_2 + var_174_12 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_2) / var_174_12

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_2 + var_174_12 and arg_171_1.time_ < var_174_2 + var_174_12 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play123101044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 123101044
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play123101045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1055ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1055ui_story == nil then
				arg_175_1.var_.characterEffect1055ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1055ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1055ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1055ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1055ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0
			local var_178_7 = 0.675

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_8 = arg_175_1:GetWordFromCfg(123101044)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 27
				local var_178_11 = utf8.len(var_178_9)
				local var_178_12 = var_178_10 <= 0 and var_178_7 or var_178_7 * (var_178_11 / var_178_10)

				if var_178_12 > 0 and var_178_7 < var_178_12 then
					arg_175_1.talkMaxDuration = var_178_12

					if var_178_12 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_12 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_9
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_13 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_13 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_13

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_13 and arg_175_1.time_ < var_178_6 + var_178_13 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play123101045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 123101045
		arg_179_1.duration_ = 6.766

		local var_179_0 = {
			zh = 5.066,
			ja = 6.766
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
				arg_179_0:Play123101046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1093ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1093ui_story == nil then
				arg_179_1.var_.characterEffect1093ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1093ui_story then
					arg_179_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1093ui_story then
				arg_179_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_182_4 = 0

			if var_182_4 < arg_179_1.time_ and arg_179_1.time_ <= var_182_4 + arg_182_0 then
				arg_179_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 then
				arg_179_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_182_6 = 0
			local var_182_7 = 0.375

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_8 = arg_179_1:FormatText(StoryNameCfg[73].name)

				arg_179_1.leftNameTxt_.text = var_182_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_9 = arg_179_1:GetWordFromCfg(123101045)
				local var_182_10 = arg_179_1:FormatText(var_182_9.content)

				arg_179_1.text_.text = var_182_10

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_11 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101045", "story_v_out_123101.awb") ~= 0 then
					local var_182_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101045", "story_v_out_123101.awb") / 1000

					if var_182_14 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_14 + var_182_6
					end

					if var_182_9.prefab_name ~= "" and arg_179_1.actors_[var_182_9.prefab_name] ~= nil then
						local var_182_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_9.prefab_name].transform, "story_v_out_123101", "123101045", "story_v_out_123101.awb")

						arg_179_1:RecordAudio("123101045", var_182_15)
						arg_179_1:RecordAudio("123101045", var_182_15)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_123101", "123101045", "story_v_out_123101.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_123101", "123101045", "story_v_out_123101.awb")
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
	Play123101046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 123101046
		arg_183_1.duration_ = 12.4

		local var_183_0 = {
			zh = 6.2,
			ja = 12.4
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
				arg_183_0:Play123101047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1055ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1055ui_story == nil then
				arg_183_1.var_.characterEffect1055ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1055ui_story then
					arg_183_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1055ui_story then
				arg_183_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_186_4 = 0

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_186_6 = arg_183_1.actors_["1093ui_story"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.characterEffect1093ui_story == nil then
				arg_183_1.var_.characterEffect1093ui_story = var_186_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_8 = 0.200000002980232

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.characterEffect1093ui_story then
					local var_186_10 = Mathf.Lerp(0, 0.5, var_186_9)

					arg_183_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1093ui_story.fillRatio = var_186_10
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.characterEffect1093ui_story then
				local var_186_11 = 0.5

				arg_183_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1093ui_story.fillRatio = var_186_11
			end

			local var_186_12 = 0
			local var_186_13 = 0.875

			if var_186_12 < arg_183_1.time_ and arg_183_1.time_ <= var_186_12 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_14 = arg_183_1:FormatText(StoryNameCfg[481].name)

				arg_183_1.leftNameTxt_.text = var_186_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_15 = arg_183_1:GetWordFromCfg(123101046)
				local var_186_16 = arg_183_1:FormatText(var_186_15.content)

				arg_183_1.text_.text = var_186_16

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_17 = 34
				local var_186_18 = utf8.len(var_186_16)
				local var_186_19 = var_186_17 <= 0 and var_186_13 or var_186_13 * (var_186_18 / var_186_17)

				if var_186_19 > 0 and var_186_13 < var_186_19 then
					arg_183_1.talkMaxDuration = var_186_19

					if var_186_19 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_19 + var_186_12
					end
				end

				arg_183_1.text_.text = var_186_16
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101046", "story_v_out_123101.awb") ~= 0 then
					local var_186_20 = manager.audio:GetVoiceLength("story_v_out_123101", "123101046", "story_v_out_123101.awb") / 1000

					if var_186_20 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_12
					end

					if var_186_15.prefab_name ~= "" and arg_183_1.actors_[var_186_15.prefab_name] ~= nil then
						local var_186_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_15.prefab_name].transform, "story_v_out_123101", "123101046", "story_v_out_123101.awb")

						arg_183_1:RecordAudio("123101046", var_186_21)
						arg_183_1:RecordAudio("123101046", var_186_21)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_123101", "123101046", "story_v_out_123101.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_123101", "123101046", "story_v_out_123101.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_22 = math.max(var_186_13, arg_183_1.talkMaxDuration)

			if var_186_12 <= arg_183_1.time_ and arg_183_1.time_ < var_186_12 + var_186_22 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_12) / var_186_22

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_12 + var_186_22 and arg_183_1.time_ < var_186_12 + var_186_22 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play123101047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 123101047
		arg_187_1.duration_ = 3.1

		local var_187_0 = {
			zh = 1.999999999999,
			ja = 3.1
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
				arg_187_0:Play123101048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1093ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1093ui_story == nil then
				arg_187_1.var_.characterEffect1093ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1093ui_story then
					arg_187_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1093ui_story then
				arg_187_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_190_4 = 0

			if var_190_4 < arg_187_1.time_ and arg_187_1.time_ <= var_190_4 + arg_190_0 then
				arg_187_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action446")
			end

			local var_190_5 = 0

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 then
				arg_187_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_190_6 = arg_187_1.actors_["1055ui_story"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.characterEffect1055ui_story == nil then
				arg_187_1.var_.characterEffect1055ui_story = var_190_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_8 = 0.200000002980232

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.characterEffect1055ui_story then
					local var_190_10 = Mathf.Lerp(0, 0.5, var_190_9)

					arg_187_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1055ui_story.fillRatio = var_190_10
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.characterEffect1055ui_story then
				local var_190_11 = 0.5

				arg_187_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1055ui_story.fillRatio = var_190_11
			end

			local var_190_12 = 0
			local var_190_13 = 0.15

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_14 = arg_187_1:FormatText(StoryNameCfg[73].name)

				arg_187_1.leftNameTxt_.text = var_190_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_15 = arg_187_1:GetWordFromCfg(123101047)
				local var_190_16 = arg_187_1:FormatText(var_190_15.content)

				arg_187_1.text_.text = var_190_16

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_17 = 6
				local var_190_18 = utf8.len(var_190_16)
				local var_190_19 = var_190_17 <= 0 and var_190_13 or var_190_13 * (var_190_18 / var_190_17)

				if var_190_19 > 0 and var_190_13 < var_190_19 then
					arg_187_1.talkMaxDuration = var_190_19

					if var_190_19 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_12
					end
				end

				arg_187_1.text_.text = var_190_16
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101047", "story_v_out_123101.awb") ~= 0 then
					local var_190_20 = manager.audio:GetVoiceLength("story_v_out_123101", "123101047", "story_v_out_123101.awb") / 1000

					if var_190_20 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_12
					end

					if var_190_15.prefab_name ~= "" and arg_187_1.actors_[var_190_15.prefab_name] ~= nil then
						local var_190_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_15.prefab_name].transform, "story_v_out_123101", "123101047", "story_v_out_123101.awb")

						arg_187_1:RecordAudio("123101047", var_190_21)
						arg_187_1:RecordAudio("123101047", var_190_21)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_123101", "123101047", "story_v_out_123101.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_123101", "123101047", "story_v_out_123101.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_22 = math.max(var_190_13, arg_187_1.talkMaxDuration)

			if var_190_12 <= arg_187_1.time_ and arg_187_1.time_ < var_190_12 + var_190_22 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_12) / var_190_22

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_12 + var_190_22 and arg_187_1.time_ < var_190_12 + var_190_22 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play123101048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 123101048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play123101049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1093ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1093ui_story == nil then
				arg_191_1.var_.characterEffect1093ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1093ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1093ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1093ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1093ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.225

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(123101048)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 9
				local var_194_12 = utf8.len(var_194_10)
				local var_194_13 = var_194_11 <= 0 and var_194_7 or var_194_7 * (var_194_12 / var_194_11)

				if var_194_13 > 0 and var_194_7 < var_194_13 then
					arg_191_1.talkMaxDuration = var_194_13

					if var_194_13 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_10
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_14 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_14 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_14

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_14 and arg_191_1.time_ < var_194_6 + var_194_14 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play123101049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 123101049
		arg_195_1.duration_ = 16.033

		local var_195_0 = {
			zh = 11.266,
			ja = 16.033
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
				arg_195_0:Play123101050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1055ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1055ui_story == nil then
				arg_195_1.var_.characterEffect1055ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1055ui_story then
					arg_195_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1055ui_story then
				arg_195_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_198_4 = 0

			if var_198_4 < arg_195_1.time_ and arg_195_1.time_ <= var_198_4 + arg_198_0 then
				arg_195_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_198_5 = 0

			if var_198_5 < arg_195_1.time_ and arg_195_1.time_ <= var_198_5 + arg_198_0 then
				arg_195_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_198_6 = 0
			local var_198_7 = 1.325

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_8 = arg_195_1:FormatText(StoryNameCfg[481].name)

				arg_195_1.leftNameTxt_.text = var_198_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_9 = arg_195_1:GetWordFromCfg(123101049)
				local var_198_10 = arg_195_1:FormatText(var_198_9.content)

				arg_195_1.text_.text = var_198_10

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_11 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101049", "story_v_out_123101.awb") ~= 0 then
					local var_198_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101049", "story_v_out_123101.awb") / 1000

					if var_198_14 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_14 + var_198_6
					end

					if var_198_9.prefab_name ~= "" and arg_195_1.actors_[var_198_9.prefab_name] ~= nil then
						local var_198_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_9.prefab_name].transform, "story_v_out_123101", "123101049", "story_v_out_123101.awb")

						arg_195_1:RecordAudio("123101049", var_198_15)
						arg_195_1:RecordAudio("123101049", var_198_15)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_123101", "123101049", "story_v_out_123101.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_123101", "123101049", "story_v_out_123101.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_16 = math.max(var_198_7, arg_195_1.talkMaxDuration)

			if var_198_6 <= arg_195_1.time_ and arg_195_1.time_ < var_198_6 + var_198_16 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_6) / var_198_16

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_6 + var_198_16 and arg_195_1.time_ < var_198_6 + var_198_16 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play123101050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 123101050
		arg_199_1.duration_ = 4.466

		local var_199_0 = {
			zh = 3.833,
			ja = 4.466
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
				arg_199_0:Play123101051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1055ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect1055ui_story == nil then
				arg_199_1.var_.characterEffect1055ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect1055ui_story then
					arg_199_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1055ui_story then
				arg_199_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_202_4 = 0

			if var_202_4 < arg_199_1.time_ and arg_199_1.time_ <= var_202_4 + arg_202_0 then
				arg_199_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_202_5 = 0

			if var_202_5 < arg_199_1.time_ and arg_199_1.time_ <= var_202_5 + arg_202_0 then
				arg_199_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_202_6 = 0
			local var_202_7 = 0.525

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_8 = arg_199_1:FormatText(StoryNameCfg[481].name)

				arg_199_1.leftNameTxt_.text = var_202_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_9 = arg_199_1:GetWordFromCfg(123101050)
				local var_202_10 = arg_199_1:FormatText(var_202_9.content)

				arg_199_1.text_.text = var_202_10

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_11 = 21
				local var_202_12 = utf8.len(var_202_10)
				local var_202_13 = var_202_11 <= 0 and var_202_7 or var_202_7 * (var_202_12 / var_202_11)

				if var_202_13 > 0 and var_202_7 < var_202_13 then
					arg_199_1.talkMaxDuration = var_202_13

					if var_202_13 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_13 + var_202_6
					end
				end

				arg_199_1.text_.text = var_202_10
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101050", "story_v_out_123101.awb") ~= 0 then
					local var_202_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101050", "story_v_out_123101.awb") / 1000

					if var_202_14 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_14 + var_202_6
					end

					if var_202_9.prefab_name ~= "" and arg_199_1.actors_[var_202_9.prefab_name] ~= nil then
						local var_202_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_9.prefab_name].transform, "story_v_out_123101", "123101050", "story_v_out_123101.awb")

						arg_199_1:RecordAudio("123101050", var_202_15)
						arg_199_1:RecordAudio("123101050", var_202_15)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_123101", "123101050", "story_v_out_123101.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_123101", "123101050", "story_v_out_123101.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_16 = math.max(var_202_7, arg_199_1.talkMaxDuration)

			if var_202_6 <= arg_199_1.time_ and arg_199_1.time_ < var_202_6 + var_202_16 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_6) / var_202_16

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_6 + var_202_16 and arg_199_1.time_ < var_202_6 + var_202_16 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play123101051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 123101051
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play123101052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1055ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1055ui_story == nil then
				arg_203_1.var_.characterEffect1055ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1055ui_story then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1055ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1055ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1055ui_story.fillRatio = var_206_5
			end

			local var_206_6 = 0
			local var_206_7 = 0.375

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[7].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(123101051)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 15
				local var_206_12 = utf8.len(var_206_10)
				local var_206_13 = var_206_11 <= 0 and var_206_7 or var_206_7 * (var_206_12 / var_206_11)

				if var_206_13 > 0 and var_206_7 < var_206_13 then
					arg_203_1.talkMaxDuration = var_206_13

					if var_206_13 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_13 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_10
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_14 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_14 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_14

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_14 and arg_203_1.time_ < var_206_6 + var_206_14 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play123101052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 123101052
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play123101053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1093ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1093ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(0, 100, 0)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1093ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, 100, 0)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["1093ui_story"]
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect1093ui_story == nil then
				arg_207_1.var_.characterEffect1093ui_story = var_210_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_11 = 0.200000002980232

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11

				if arg_207_1.var_.characterEffect1093ui_story then
					local var_210_13 = Mathf.Lerp(0, 0.5, var_210_12)

					arg_207_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1093ui_story.fillRatio = var_210_13
				end
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 and arg_207_1.var_.characterEffect1093ui_story then
				local var_210_14 = 0.5

				arg_207_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1093ui_story.fillRatio = var_210_14
			end

			local var_210_15 = arg_207_1.actors_["1055ui_story"].transform
			local var_210_16 = 0

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 then
				arg_207_1.var_.moveOldPos1055ui_story = var_210_15.localPosition
			end

			local var_210_17 = 0.001

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_17 then
				local var_210_18 = (arg_207_1.time_ - var_210_16) / var_210_17
				local var_210_19 = Vector3.New(0, 100, 0)

				var_210_15.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1055ui_story, var_210_19, var_210_18)

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

			local var_210_24 = arg_207_1.actors_["1055ui_story"]
			local var_210_25 = 0

			if var_210_25 < arg_207_1.time_ and arg_207_1.time_ <= var_210_25 + arg_210_0 and arg_207_1.var_.characterEffect1055ui_story == nil then
				arg_207_1.var_.characterEffect1055ui_story = var_210_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_26 = 0.200000002980232

			if var_210_25 <= arg_207_1.time_ and arg_207_1.time_ < var_210_25 + var_210_26 then
				local var_210_27 = (arg_207_1.time_ - var_210_25) / var_210_26

				if arg_207_1.var_.characterEffect1055ui_story then
					local var_210_28 = Mathf.Lerp(0, 0.5, var_210_27)

					arg_207_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1055ui_story.fillRatio = var_210_28
				end
			end

			if arg_207_1.time_ >= var_210_25 + var_210_26 and arg_207_1.time_ < var_210_25 + var_210_26 + arg_210_0 and arg_207_1.var_.characterEffect1055ui_story then
				local var_210_29 = 0.5

				arg_207_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1055ui_story.fillRatio = var_210_29
			end

			local var_210_30 = 0
			local var_210_31 = 1.5

			if var_210_30 < arg_207_1.time_ and arg_207_1.time_ <= var_210_30 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_32 = arg_207_1:GetWordFromCfg(123101052)
				local var_210_33 = arg_207_1:FormatText(var_210_32.content)

				arg_207_1.text_.text = var_210_33

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_34 = 60
				local var_210_35 = utf8.len(var_210_33)
				local var_210_36 = var_210_34 <= 0 and var_210_31 or var_210_31 * (var_210_35 / var_210_34)

				if var_210_36 > 0 and var_210_31 < var_210_36 then
					arg_207_1.talkMaxDuration = var_210_36

					if var_210_36 + var_210_30 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_36 + var_210_30
					end
				end

				arg_207_1.text_.text = var_210_33
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_37 = math.max(var_210_31, arg_207_1.talkMaxDuration)

			if var_210_30 <= arg_207_1.time_ and arg_207_1.time_ < var_210_30 + var_210_37 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_30) / var_210_37

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_30 + var_210_37 and arg_207_1.time_ < var_210_30 + var_210_37 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play123101053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 123101053
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play123101054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.9

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

				local var_214_2 = arg_211_1:GetWordFromCfg(123101053)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 36
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
	Play123101054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 123101054
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play123101055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.15

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[7].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(123101054)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 6
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
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_8 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_8 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_8

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_8 and arg_215_1.time_ < var_218_0 + var_218_8 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play123101055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 123101055
		arg_219_1.duration_ = 1.999999999999

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play123101056(arg_219_1)
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
				arg_219_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_222_15 = 0
			local var_222_16 = 0.05

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_17 = arg_219_1:FormatText(StoryNameCfg[481].name)

				arg_219_1.leftNameTxt_.text = var_222_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_18 = arg_219_1:GetWordFromCfg(123101055)
				local var_222_19 = arg_219_1:FormatText(var_222_18.content)

				arg_219_1.text_.text = var_222_19

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_20 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101055", "story_v_out_123101.awb") ~= 0 then
					local var_222_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101055", "story_v_out_123101.awb") / 1000

					if var_222_23 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_23 + var_222_15
					end

					if var_222_18.prefab_name ~= "" and arg_219_1.actors_[var_222_18.prefab_name] ~= nil then
						local var_222_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_18.prefab_name].transform, "story_v_out_123101", "123101055", "story_v_out_123101.awb")

						arg_219_1:RecordAudio("123101055", var_222_24)
						arg_219_1:RecordAudio("123101055", var_222_24)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_123101", "123101055", "story_v_out_123101.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_123101", "123101055", "story_v_out_123101.awb")
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
	Play123101056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 123101056
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play123101057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1055ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1055ui_story == nil then
				arg_223_1.var_.characterEffect1055ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1055ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1055ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1055ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1055ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.925

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_8 = arg_223_1:GetWordFromCfg(123101056)
				local var_226_9 = arg_223_1:FormatText(var_226_8.content)

				arg_223_1.text_.text = var_226_9

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_10 = 37
				local var_226_11 = utf8.len(var_226_9)
				local var_226_12 = var_226_10 <= 0 and var_226_7 or var_226_7 * (var_226_11 / var_226_10)

				if var_226_12 > 0 and var_226_7 < var_226_12 then
					arg_223_1.talkMaxDuration = var_226_12

					if var_226_12 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_12 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_9
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_13 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_13 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_13

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_13 and arg_223_1.time_ < var_226_6 + var_226_13 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play123101057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 123101057
		arg_227_1.duration_ = 4.166

		local var_227_0 = {
			zh = 3.266,
			ja = 4.166
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
				arg_227_0:Play123101058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action5_1")
			end

			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_230_2 = arg_227_1.actors_["1055ui_story"]
			local var_230_3 = 0

			if var_230_3 < arg_227_1.time_ and arg_227_1.time_ <= var_230_3 + arg_230_0 and arg_227_1.var_.characterEffect1055ui_story == nil then
				arg_227_1.var_.characterEffect1055ui_story = var_230_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_4 = 0.200000002980232

			if var_230_3 <= arg_227_1.time_ and arg_227_1.time_ < var_230_3 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_3) / var_230_4

				if arg_227_1.var_.characterEffect1055ui_story then
					arg_227_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_3 + var_230_4 and arg_227_1.time_ < var_230_3 + var_230_4 + arg_230_0 and arg_227_1.var_.characterEffect1055ui_story then
				arg_227_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_230_6 = 0
			local var_230_7 = 0.3

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_8 = arg_227_1:FormatText(StoryNameCfg[481].name)

				arg_227_1.leftNameTxt_.text = var_230_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_9 = arg_227_1:GetWordFromCfg(123101057)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101057", "story_v_out_123101.awb") ~= 0 then
					local var_230_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101057", "story_v_out_123101.awb") / 1000

					if var_230_14 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_14 + var_230_6
					end

					if var_230_9.prefab_name ~= "" and arg_227_1.actors_[var_230_9.prefab_name] ~= nil then
						local var_230_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_9.prefab_name].transform, "story_v_out_123101", "123101057", "story_v_out_123101.awb")

						arg_227_1:RecordAudio("123101057", var_230_15)
						arg_227_1:RecordAudio("123101057", var_230_15)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_123101", "123101057", "story_v_out_123101.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_123101", "123101057", "story_v_out_123101.awb")
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
	Play123101058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 123101058
		arg_231_1.duration_ = 8.733

		local var_231_0 = {
			zh = 8.733,
			ja = 4.8
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
				arg_231_0:Play123101059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1055ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1055ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, 100, 0)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1055ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, 100, 0)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1055ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1055ui_story == nil then
				arg_231_1.var_.characterEffect1055ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1055ui_story then
					local var_234_13 = Mathf.Lerp(0, 0.5, var_234_12)

					arg_231_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1055ui_story.fillRatio = var_234_13
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1055ui_story then
				local var_234_14 = 0.5

				arg_231_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1055ui_story.fillRatio = var_234_14
			end

			local var_234_15 = arg_231_1.actors_["1093ui_story"].transform
			local var_234_16 = 0

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 then
				arg_231_1.var_.moveOldPos1093ui_story = var_234_15.localPosition
			end

			local var_234_17 = 0.001

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_17 then
				local var_234_18 = (arg_231_1.time_ - var_234_16) / var_234_17
				local var_234_19 = Vector3.New(0, -1.11, -5.88)

				var_234_15.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1093ui_story, var_234_19, var_234_18)

				local var_234_20 = manager.ui.mainCamera.transform.position - var_234_15.position

				var_234_15.forward = Vector3.New(var_234_20.x, var_234_20.y, var_234_20.z)

				local var_234_21 = var_234_15.localEulerAngles

				var_234_21.z = 0
				var_234_21.x = 0
				var_234_15.localEulerAngles = var_234_21
			end

			if arg_231_1.time_ >= var_234_16 + var_234_17 and arg_231_1.time_ < var_234_16 + var_234_17 + arg_234_0 then
				var_234_15.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_234_22 = manager.ui.mainCamera.transform.position - var_234_15.position

				var_234_15.forward = Vector3.New(var_234_22.x, var_234_22.y, var_234_22.z)

				local var_234_23 = var_234_15.localEulerAngles

				var_234_23.z = 0
				var_234_23.x = 0
				var_234_15.localEulerAngles = var_234_23
			end

			local var_234_24 = arg_231_1.actors_["1093ui_story"]
			local var_234_25 = 0

			if var_234_25 < arg_231_1.time_ and arg_231_1.time_ <= var_234_25 + arg_234_0 and arg_231_1.var_.characterEffect1093ui_story == nil then
				arg_231_1.var_.characterEffect1093ui_story = var_234_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_26 = 0.200000002980232

			if var_234_25 <= arg_231_1.time_ and arg_231_1.time_ < var_234_25 + var_234_26 then
				local var_234_27 = (arg_231_1.time_ - var_234_25) / var_234_26

				if arg_231_1.var_.characterEffect1093ui_story then
					arg_231_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_25 + var_234_26 and arg_231_1.time_ < var_234_25 + var_234_26 + arg_234_0 and arg_231_1.var_.characterEffect1093ui_story then
				arg_231_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_234_28 = 0

			if var_234_28 < arg_231_1.time_ and arg_231_1.time_ <= var_234_28 + arg_234_0 then
				arg_231_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_234_29 = 0

			if var_234_29 < arg_231_1.time_ and arg_231_1.time_ <= var_234_29 + arg_234_0 then
				arg_231_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_234_30 = 0
			local var_234_31 = 0.7

			if var_234_30 < arg_231_1.time_ and arg_231_1.time_ <= var_234_30 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_32 = arg_231_1:FormatText(StoryNameCfg[73].name)

				arg_231_1.leftNameTxt_.text = var_234_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_33 = arg_231_1:GetWordFromCfg(123101058)
				local var_234_34 = arg_231_1:FormatText(var_234_33.content)

				arg_231_1.text_.text = var_234_34

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_35 = 28
				local var_234_36 = utf8.len(var_234_34)
				local var_234_37 = var_234_35 <= 0 and var_234_31 or var_234_31 * (var_234_36 / var_234_35)

				if var_234_37 > 0 and var_234_31 < var_234_37 then
					arg_231_1.talkMaxDuration = var_234_37

					if var_234_37 + var_234_30 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_37 + var_234_30
					end
				end

				arg_231_1.text_.text = var_234_34
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101058", "story_v_out_123101.awb") ~= 0 then
					local var_234_38 = manager.audio:GetVoiceLength("story_v_out_123101", "123101058", "story_v_out_123101.awb") / 1000

					if var_234_38 + var_234_30 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_38 + var_234_30
					end

					if var_234_33.prefab_name ~= "" and arg_231_1.actors_[var_234_33.prefab_name] ~= nil then
						local var_234_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_33.prefab_name].transform, "story_v_out_123101", "123101058", "story_v_out_123101.awb")

						arg_231_1:RecordAudio("123101058", var_234_39)
						arg_231_1:RecordAudio("123101058", var_234_39)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_123101", "123101058", "story_v_out_123101.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_123101", "123101058", "story_v_out_123101.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_40 = math.max(var_234_31, arg_231_1.talkMaxDuration)

			if var_234_30 <= arg_231_1.time_ and arg_231_1.time_ < var_234_30 + var_234_40 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_30) / var_234_40

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_30 + var_234_40 and arg_231_1.time_ < var_234_30 + var_234_40 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play123101059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 123101059
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play123101060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1093ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1093ui_story == nil then
				arg_235_1.var_.characterEffect1093ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1093ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1093ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1093ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1093ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 then
				arg_235_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_238_7 = 0

			if var_238_7 < arg_235_1.time_ and arg_235_1.time_ <= var_238_7 + arg_238_0 then
				arg_235_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_238_8 = 0
			local var_238_9 = 0.375

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_10 = arg_235_1:GetWordFromCfg(123101059)
				local var_238_11 = arg_235_1:FormatText(var_238_10.content)

				arg_235_1.text_.text = var_238_11

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_12 = 15
				local var_238_13 = utf8.len(var_238_11)
				local var_238_14 = var_238_12 <= 0 and var_238_9 or var_238_9 * (var_238_13 / var_238_12)

				if var_238_14 > 0 and var_238_9 < var_238_14 then
					arg_235_1.talkMaxDuration = var_238_14

					if var_238_14 + var_238_8 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_14 + var_238_8
					end
				end

				arg_235_1.text_.text = var_238_11
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_15 = math.max(var_238_9, arg_235_1.talkMaxDuration)

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_15 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_8) / var_238_15

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_8 + var_238_15 and arg_235_1.time_ < var_238_8 + var_238_15 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play123101060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 123101060
		arg_239_1.duration_ = 8.733

		local var_239_0 = {
			zh = 6.733,
			ja = 8.733
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
				arg_239_0:Play123101061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1055ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1055ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(0.7, -0.965, -6.2)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1055ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0.7, -0.965, -6.2)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["1055ui_story"]
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 and arg_239_1.var_.characterEffect1055ui_story == nil then
				arg_239_1.var_.characterEffect1055ui_story = var_242_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_11 = 0.200000002980232

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11

				if arg_239_1.var_.characterEffect1055ui_story then
					arg_239_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect1055ui_story then
				arg_239_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_242_13 = 0

			if var_242_13 < arg_239_1.time_ and arg_239_1.time_ <= var_242_13 + arg_242_0 then
				arg_239_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_15 = arg_239_1.actors_["1093ui_story"].transform
			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1.var_.moveOldPos1093ui_story = var_242_15.localPosition
			end

			local var_242_17 = 0.001

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_17 then
				local var_242_18 = (arg_239_1.time_ - var_242_16) / var_242_17
				local var_242_19 = Vector3.New(-0.7, -1.11, -5.88)

				var_242_15.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1093ui_story, var_242_19, var_242_18)

				local var_242_20 = manager.ui.mainCamera.transform.position - var_242_15.position

				var_242_15.forward = Vector3.New(var_242_20.x, var_242_20.y, var_242_20.z)

				local var_242_21 = var_242_15.localEulerAngles

				var_242_21.z = 0
				var_242_21.x = 0
				var_242_15.localEulerAngles = var_242_21
			end

			if arg_239_1.time_ >= var_242_16 + var_242_17 and arg_239_1.time_ < var_242_16 + var_242_17 + arg_242_0 then
				var_242_15.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_242_22 = manager.ui.mainCamera.transform.position - var_242_15.position

				var_242_15.forward = Vector3.New(var_242_22.x, var_242_22.y, var_242_22.z)

				local var_242_23 = var_242_15.localEulerAngles

				var_242_23.z = 0
				var_242_23.x = 0
				var_242_15.localEulerAngles = var_242_23
			end

			local var_242_24 = 0
			local var_242_25 = 0.775

			if var_242_24 < arg_239_1.time_ and arg_239_1.time_ <= var_242_24 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_26 = arg_239_1:FormatText(StoryNameCfg[481].name)

				arg_239_1.leftNameTxt_.text = var_242_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_27 = arg_239_1:GetWordFromCfg(123101060)
				local var_242_28 = arg_239_1:FormatText(var_242_27.content)

				arg_239_1.text_.text = var_242_28

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_29 = 31
				local var_242_30 = utf8.len(var_242_28)
				local var_242_31 = var_242_29 <= 0 and var_242_25 or var_242_25 * (var_242_30 / var_242_29)

				if var_242_31 > 0 and var_242_25 < var_242_31 then
					arg_239_1.talkMaxDuration = var_242_31

					if var_242_31 + var_242_24 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_31 + var_242_24
					end
				end

				arg_239_1.text_.text = var_242_28
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101060", "story_v_out_123101.awb") ~= 0 then
					local var_242_32 = manager.audio:GetVoiceLength("story_v_out_123101", "123101060", "story_v_out_123101.awb") / 1000

					if var_242_32 + var_242_24 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_32 + var_242_24
					end

					if var_242_27.prefab_name ~= "" and arg_239_1.actors_[var_242_27.prefab_name] ~= nil then
						local var_242_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_27.prefab_name].transform, "story_v_out_123101", "123101060", "story_v_out_123101.awb")

						arg_239_1:RecordAudio("123101060", var_242_33)
						arg_239_1:RecordAudio("123101060", var_242_33)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_123101", "123101060", "story_v_out_123101.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_123101", "123101060", "story_v_out_123101.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_34 = math.max(var_242_25, arg_239_1.talkMaxDuration)

			if var_242_24 <= arg_239_1.time_ and arg_239_1.time_ < var_242_24 + var_242_34 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_24) / var_242_34

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_24 + var_242_34 and arg_239_1.time_ < var_242_24 + var_242_34 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play123101061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 123101061
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play123101062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1055ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1055ui_story == nil then
				arg_243_1.var_.characterEffect1055ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.200000002980232

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1055ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1055ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1055ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1055ui_story.fillRatio = var_246_5
			end

			local var_246_6 = 0
			local var_246_7 = 0.925

			if var_246_6 < arg_243_1.time_ and arg_243_1.time_ <= var_246_6 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_8 = arg_243_1:GetWordFromCfg(123101061)
				local var_246_9 = arg_243_1:FormatText(var_246_8.content)

				arg_243_1.text_.text = var_246_9

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_10 = 37
				local var_246_11 = utf8.len(var_246_9)
				local var_246_12 = var_246_10 <= 0 and var_246_7 or var_246_7 * (var_246_11 / var_246_10)

				if var_246_12 > 0 and var_246_7 < var_246_12 then
					arg_243_1.talkMaxDuration = var_246_12

					if var_246_12 + var_246_6 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_12 + var_246_6
					end
				end

				arg_243_1.text_.text = var_246_9
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_13 = math.max(var_246_7, arg_243_1.talkMaxDuration)

			if var_246_6 <= arg_243_1.time_ and arg_243_1.time_ < var_246_6 + var_246_13 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_6) / var_246_13

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_6 + var_246_13 and arg_243_1.time_ < var_246_6 + var_246_13 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play123101062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 123101062
		arg_247_1.duration_ = 10.966

		local var_247_0 = {
			zh = 9,
			ja = 10.966
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
				arg_247_0:Play123101063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1055ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1055ui_story == nil then
				arg_247_1.var_.characterEffect1055ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1055ui_story then
					arg_247_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1055ui_story then
				arg_247_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_250_4 = 0

			if var_250_4 < arg_247_1.time_ and arg_247_1.time_ <= var_250_4 + arg_250_0 then
				arg_247_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_250_5 = 0

			if var_250_5 < arg_247_1.time_ and arg_247_1.time_ <= var_250_5 + arg_250_0 then
				arg_247_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_250_6 = 0
			local var_250_7 = 0.925

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_8 = arg_247_1:FormatText(StoryNameCfg[481].name)

				arg_247_1.leftNameTxt_.text = var_250_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_9 = arg_247_1:GetWordFromCfg(123101062)
				local var_250_10 = arg_247_1:FormatText(var_250_9.content)

				arg_247_1.text_.text = var_250_10

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_11 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101062", "story_v_out_123101.awb") ~= 0 then
					local var_250_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101062", "story_v_out_123101.awb") / 1000

					if var_250_14 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_14 + var_250_6
					end

					if var_250_9.prefab_name ~= "" and arg_247_1.actors_[var_250_9.prefab_name] ~= nil then
						local var_250_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_9.prefab_name].transform, "story_v_out_123101", "123101062", "story_v_out_123101.awb")

						arg_247_1:RecordAudio("123101062", var_250_15)
						arg_247_1:RecordAudio("123101062", var_250_15)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_123101", "123101062", "story_v_out_123101.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_123101", "123101062", "story_v_out_123101.awb")
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
	Play123101063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 123101063
		arg_251_1.duration_ = 3.733

		local var_251_0 = {
			zh = 2.633,
			ja = 3.733
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
				arg_251_0:Play123101064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1093ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1093ui_story == nil then
				arg_251_1.var_.characterEffect1093ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1093ui_story then
					arg_251_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1093ui_story then
				arg_251_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_254_4 = 0

			if var_254_4 < arg_251_1.time_ and arg_251_1.time_ <= var_254_4 + arg_254_0 then
				arg_251_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 then
				arg_251_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_254_6 = arg_251_1.actors_["1055ui_story"]
			local var_254_7 = 0

			if var_254_7 < arg_251_1.time_ and arg_251_1.time_ <= var_254_7 + arg_254_0 and arg_251_1.var_.characterEffect1055ui_story == nil then
				arg_251_1.var_.characterEffect1055ui_story = var_254_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_8 = 0.200000002980232

			if var_254_7 <= arg_251_1.time_ and arg_251_1.time_ < var_254_7 + var_254_8 then
				local var_254_9 = (arg_251_1.time_ - var_254_7) / var_254_8

				if arg_251_1.var_.characterEffect1055ui_story then
					local var_254_10 = Mathf.Lerp(0, 0.5, var_254_9)

					arg_251_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1055ui_story.fillRatio = var_254_10
				end
			end

			if arg_251_1.time_ >= var_254_7 + var_254_8 and arg_251_1.time_ < var_254_7 + var_254_8 + arg_254_0 and arg_251_1.var_.characterEffect1055ui_story then
				local var_254_11 = 0.5

				arg_251_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1055ui_story.fillRatio = var_254_11
			end

			local var_254_12 = 0
			local var_254_13 = 0.35

			if var_254_12 < arg_251_1.time_ and arg_251_1.time_ <= var_254_12 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_14 = arg_251_1:FormatText(StoryNameCfg[73].name)

				arg_251_1.leftNameTxt_.text = var_254_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_15 = arg_251_1:GetWordFromCfg(123101063)
				local var_254_16 = arg_251_1:FormatText(var_254_15.content)

				arg_251_1.text_.text = var_254_16

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_17 = 14
				local var_254_18 = utf8.len(var_254_16)
				local var_254_19 = var_254_17 <= 0 and var_254_13 or var_254_13 * (var_254_18 / var_254_17)

				if var_254_19 > 0 and var_254_13 < var_254_19 then
					arg_251_1.talkMaxDuration = var_254_19

					if var_254_19 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_19 + var_254_12
					end
				end

				arg_251_1.text_.text = var_254_16
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101063", "story_v_out_123101.awb") ~= 0 then
					local var_254_20 = manager.audio:GetVoiceLength("story_v_out_123101", "123101063", "story_v_out_123101.awb") / 1000

					if var_254_20 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_20 + var_254_12
					end

					if var_254_15.prefab_name ~= "" and arg_251_1.actors_[var_254_15.prefab_name] ~= nil then
						local var_254_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_15.prefab_name].transform, "story_v_out_123101", "123101063", "story_v_out_123101.awb")

						arg_251_1:RecordAudio("123101063", var_254_21)
						arg_251_1:RecordAudio("123101063", var_254_21)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_123101", "123101063", "story_v_out_123101.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_123101", "123101063", "story_v_out_123101.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_22 = math.max(var_254_13, arg_251_1.talkMaxDuration)

			if var_254_12 <= arg_251_1.time_ and arg_251_1.time_ < var_254_12 + var_254_22 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_12) / var_254_22

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_12 + var_254_22 and arg_251_1.time_ < var_254_12 + var_254_22 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play123101064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 123101064
		arg_255_1.duration_ = 5.866

		local var_255_0 = {
			zh = 3.933,
			ja = 5.866
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
				arg_255_0:Play123101065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1055ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1055ui_story == nil then
				arg_255_1.var_.characterEffect1055ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1055ui_story then
					arg_255_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1055ui_story then
				arg_255_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_258_4 = 0

			if var_258_4 < arg_255_1.time_ and arg_255_1.time_ <= var_258_4 + arg_258_0 then
				arg_255_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_258_5 = 0

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 then
				arg_255_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_258_6 = arg_255_1.actors_["1093ui_story"]
			local var_258_7 = 0

			if var_258_7 < arg_255_1.time_ and arg_255_1.time_ <= var_258_7 + arg_258_0 and arg_255_1.var_.characterEffect1093ui_story == nil then
				arg_255_1.var_.characterEffect1093ui_story = var_258_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_8 = 0.200000002980232

			if var_258_7 <= arg_255_1.time_ and arg_255_1.time_ < var_258_7 + var_258_8 then
				local var_258_9 = (arg_255_1.time_ - var_258_7) / var_258_8

				if arg_255_1.var_.characterEffect1093ui_story then
					local var_258_10 = Mathf.Lerp(0, 0.5, var_258_9)

					arg_255_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1093ui_story.fillRatio = var_258_10
				end
			end

			if arg_255_1.time_ >= var_258_7 + var_258_8 and arg_255_1.time_ < var_258_7 + var_258_8 + arg_258_0 and arg_255_1.var_.characterEffect1093ui_story then
				local var_258_11 = 0.5

				arg_255_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1093ui_story.fillRatio = var_258_11
			end

			local var_258_12 = 0
			local var_258_13 = 0.425

			if var_258_12 < arg_255_1.time_ and arg_255_1.time_ <= var_258_12 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_14 = arg_255_1:FormatText(StoryNameCfg[481].name)

				arg_255_1.leftNameTxt_.text = var_258_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_15 = arg_255_1:GetWordFromCfg(123101064)
				local var_258_16 = arg_255_1:FormatText(var_258_15.content)

				arg_255_1.text_.text = var_258_16

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_17 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101064", "story_v_out_123101.awb") ~= 0 then
					local var_258_20 = manager.audio:GetVoiceLength("story_v_out_123101", "123101064", "story_v_out_123101.awb") / 1000

					if var_258_20 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_20 + var_258_12
					end

					if var_258_15.prefab_name ~= "" and arg_255_1.actors_[var_258_15.prefab_name] ~= nil then
						local var_258_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_15.prefab_name].transform, "story_v_out_123101", "123101064", "story_v_out_123101.awb")

						arg_255_1:RecordAudio("123101064", var_258_21)
						arg_255_1:RecordAudio("123101064", var_258_21)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_123101", "123101064", "story_v_out_123101.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_123101", "123101064", "story_v_out_123101.awb")
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
	Play123101065 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 123101065
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play123101066(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1055ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1055ui_story == nil then
				arg_259_1.var_.characterEffect1055ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.200000002980232

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1055ui_story then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1055ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1055ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1055ui_story.fillRatio = var_262_5
			end

			local var_262_6 = 0
			local var_262_7 = 0.5

			if var_262_6 < arg_259_1.time_ and arg_259_1.time_ <= var_262_6 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_8 = arg_259_1:FormatText(StoryNameCfg[7].name)

				arg_259_1.leftNameTxt_.text = var_262_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_9 = arg_259_1:GetWordFromCfg(123101065)
				local var_262_10 = arg_259_1:FormatText(var_262_9.content)

				arg_259_1.text_.text = var_262_10

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_11 = 20
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
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_14 = math.max(var_262_7, arg_259_1.talkMaxDuration)

			if var_262_6 <= arg_259_1.time_ and arg_259_1.time_ < var_262_6 + var_262_14 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_6) / var_262_14

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_6 + var_262_14 and arg_259_1.time_ < var_262_6 + var_262_14 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play123101066 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 123101066
		arg_263_1.duration_ = 6.4

		local var_263_0 = {
			zh = 5.133,
			ja = 6.4
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
				arg_263_0:Play123101067(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1055ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect1055ui_story == nil then
				arg_263_1.var_.characterEffect1055ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.200000002980232

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect1055ui_story then
					arg_263_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect1055ui_story then
				arg_263_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_266_4 = 0

			if var_266_4 < arg_263_1.time_ and arg_263_1.time_ <= var_266_4 + arg_266_0 then
				arg_263_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_266_5 = 0

			if var_266_5 < arg_263_1.time_ and arg_263_1.time_ <= var_266_5 + arg_266_0 then
				arg_263_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_266_6 = 0
			local var_266_7 = 0.6

			if var_266_6 < arg_263_1.time_ and arg_263_1.time_ <= var_266_6 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_8 = arg_263_1:FormatText(StoryNameCfg[481].name)

				arg_263_1.leftNameTxt_.text = var_266_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_9 = arg_263_1:GetWordFromCfg(123101066)
				local var_266_10 = arg_263_1:FormatText(var_266_9.content)

				arg_263_1.text_.text = var_266_10

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_11 = 24
				local var_266_12 = utf8.len(var_266_10)
				local var_266_13 = var_266_11 <= 0 and var_266_7 or var_266_7 * (var_266_12 / var_266_11)

				if var_266_13 > 0 and var_266_7 < var_266_13 then
					arg_263_1.talkMaxDuration = var_266_13

					if var_266_13 + var_266_6 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_13 + var_266_6
					end
				end

				arg_263_1.text_.text = var_266_10
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101066", "story_v_out_123101.awb") ~= 0 then
					local var_266_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101066", "story_v_out_123101.awb") / 1000

					if var_266_14 + var_266_6 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_14 + var_266_6
					end

					if var_266_9.prefab_name ~= "" and arg_263_1.actors_[var_266_9.prefab_name] ~= nil then
						local var_266_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_9.prefab_name].transform, "story_v_out_123101", "123101066", "story_v_out_123101.awb")

						arg_263_1:RecordAudio("123101066", var_266_15)
						arg_263_1:RecordAudio("123101066", var_266_15)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_123101", "123101066", "story_v_out_123101.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_123101", "123101066", "story_v_out_123101.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_16 = math.max(var_266_7, arg_263_1.talkMaxDuration)

			if var_266_6 <= arg_263_1.time_ and arg_263_1.time_ < var_266_6 + var_266_16 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_6) / var_266_16

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_6 + var_266_16 and arg_263_1.time_ < var_266_6 + var_266_16 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play123101067 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 123101067
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play123101068(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1055ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1055ui_story == nil then
				arg_267_1.var_.characterEffect1055ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.200000002980232

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1055ui_story then
					local var_270_4 = Mathf.Lerp(0, 0.5, var_270_3)

					arg_267_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1055ui_story.fillRatio = var_270_4
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1055ui_story then
				local var_270_5 = 0.5

				arg_267_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1055ui_story.fillRatio = var_270_5
			end

			local var_270_6 = 0
			local var_270_7 = 0.675

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_8 = arg_267_1:GetWordFromCfg(123101067)
				local var_270_9 = arg_267_1:FormatText(var_270_8.content)

				arg_267_1.text_.text = var_270_9

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_10 = 27
				local var_270_11 = utf8.len(var_270_9)
				local var_270_12 = var_270_10 <= 0 and var_270_7 or var_270_7 * (var_270_11 / var_270_10)

				if var_270_12 > 0 and var_270_7 < var_270_12 then
					arg_267_1.talkMaxDuration = var_270_12

					if var_270_12 + var_270_6 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_12 + var_270_6
					end
				end

				arg_267_1.text_.text = var_270_9
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_13 = math.max(var_270_7, arg_267_1.talkMaxDuration)

			if var_270_6 <= arg_267_1.time_ and arg_267_1.time_ < var_270_6 + var_270_13 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_6) / var_270_13

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_6 + var_270_13 and arg_267_1.time_ < var_270_6 + var_270_13 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play123101068 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 123101068
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play123101069(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1055ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1055ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(0, 100, 0)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1055ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0, 100, 0)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = arg_271_1.actors_["1055ui_story"]
			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 and arg_271_1.var_.characterEffect1055ui_story == nil then
				arg_271_1.var_.characterEffect1055ui_story = var_274_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_11 = 0.200000002980232

			if var_274_10 <= arg_271_1.time_ and arg_271_1.time_ < var_274_10 + var_274_11 then
				local var_274_12 = (arg_271_1.time_ - var_274_10) / var_274_11

				if arg_271_1.var_.characterEffect1055ui_story then
					local var_274_13 = Mathf.Lerp(0, 0.5, var_274_12)

					arg_271_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1055ui_story.fillRatio = var_274_13
				end
			end

			if arg_271_1.time_ >= var_274_10 + var_274_11 and arg_271_1.time_ < var_274_10 + var_274_11 + arg_274_0 and arg_271_1.var_.characterEffect1055ui_story then
				local var_274_14 = 0.5

				arg_271_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1055ui_story.fillRatio = var_274_14
			end

			local var_274_15 = arg_271_1.actors_["1093ui_story"].transform
			local var_274_16 = 0

			if var_274_16 < arg_271_1.time_ and arg_271_1.time_ <= var_274_16 + arg_274_0 then
				arg_271_1.var_.moveOldPos1093ui_story = var_274_15.localPosition
			end

			local var_274_17 = 0.001

			if var_274_16 <= arg_271_1.time_ and arg_271_1.time_ < var_274_16 + var_274_17 then
				local var_274_18 = (arg_271_1.time_ - var_274_16) / var_274_17
				local var_274_19 = Vector3.New(0, 100, 0)

				var_274_15.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1093ui_story, var_274_19, var_274_18)

				local var_274_20 = manager.ui.mainCamera.transform.position - var_274_15.position

				var_274_15.forward = Vector3.New(var_274_20.x, var_274_20.y, var_274_20.z)

				local var_274_21 = var_274_15.localEulerAngles

				var_274_21.z = 0
				var_274_21.x = 0
				var_274_15.localEulerAngles = var_274_21
			end

			if arg_271_1.time_ >= var_274_16 + var_274_17 and arg_271_1.time_ < var_274_16 + var_274_17 + arg_274_0 then
				var_274_15.localPosition = Vector3.New(0, 100, 0)

				local var_274_22 = manager.ui.mainCamera.transform.position - var_274_15.position

				var_274_15.forward = Vector3.New(var_274_22.x, var_274_22.y, var_274_22.z)

				local var_274_23 = var_274_15.localEulerAngles

				var_274_23.z = 0
				var_274_23.x = 0
				var_274_15.localEulerAngles = var_274_23
			end

			local var_274_24 = 0
			local var_274_25 = 1.35

			if var_274_24 < arg_271_1.time_ and arg_271_1.time_ <= var_274_24 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_26 = arg_271_1:GetWordFromCfg(123101068)
				local var_274_27 = arg_271_1:FormatText(var_274_26.content)

				arg_271_1.text_.text = var_274_27

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_28 = 54
				local var_274_29 = utf8.len(var_274_27)
				local var_274_30 = var_274_28 <= 0 and var_274_25 or var_274_25 * (var_274_29 / var_274_28)

				if var_274_30 > 0 and var_274_25 < var_274_30 then
					arg_271_1.talkMaxDuration = var_274_30

					if var_274_30 + var_274_24 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_30 + var_274_24
					end
				end

				arg_271_1.text_.text = var_274_27
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_31 = math.max(var_274_25, arg_271_1.talkMaxDuration)

			if var_274_24 <= arg_271_1.time_ and arg_271_1.time_ < var_274_24 + var_274_31 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_24) / var_274_31

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_24 + var_274_31 and arg_271_1.time_ < var_274_24 + var_274_31 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play123101069 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 123101069
		arg_275_1.duration_ = 0.599999999999

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"

			SetActive(arg_275_1.choicesGo_, true)

			for iter_276_0, iter_276_1 in ipairs(arg_275_1.choices_) do
				local var_276_0 = iter_276_0 <= 1

				SetActive(iter_276_1.go, var_276_0)
			end

			arg_275_1.choices_[1].txt.text = arg_275_1:FormatText(StoryChoiceCfg[504].name)
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play123101070(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.allBtn_.enabled = false
			end

			local var_278_1 = 0.6

			if arg_275_1.time_ >= var_278_0 + var_278_1 and arg_275_1.time_ < var_278_0 + var_278_1 + arg_278_0 then
				arg_275_1.allBtn_.enabled = true
			end
		end
	end,
	Play123101070 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 123101070
		arg_279_1.duration_ = 1.999999999999

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play123101071(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1055ui_story"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1055ui_story = var_282_0.localPosition
			end

			local var_282_2 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2
				local var_282_4 = Vector3.New(0.7, -0.965, -6.2)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1055ui_story, var_282_4, var_282_3)

				local var_282_5 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_5.x, var_282_5.y, var_282_5.z)

				local var_282_6 = var_282_0.localEulerAngles

				var_282_6.z = 0
				var_282_6.x = 0
				var_282_0.localEulerAngles = var_282_6
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(0.7, -0.965, -6.2)

				local var_282_7 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_7.x, var_282_7.y, var_282_7.z)

				local var_282_8 = var_282_0.localEulerAngles

				var_282_8.z = 0
				var_282_8.x = 0
				var_282_0.localEulerAngles = var_282_8
			end

			local var_282_9 = arg_279_1.actors_["1055ui_story"]
			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 and arg_279_1.var_.characterEffect1055ui_story == nil then
				arg_279_1.var_.characterEffect1055ui_story = var_282_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_11 = 0.200000002980232

			if var_282_10 <= arg_279_1.time_ and arg_279_1.time_ < var_282_10 + var_282_11 then
				local var_282_12 = (arg_279_1.time_ - var_282_10) / var_282_11

				if arg_279_1.var_.characterEffect1055ui_story then
					arg_279_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_10 + var_282_11 and arg_279_1.time_ < var_282_10 + var_282_11 + arg_282_0 and arg_279_1.var_.characterEffect1055ui_story then
				arg_279_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_282_13 = 0

			if var_282_13 < arg_279_1.time_ and arg_279_1.time_ <= var_282_13 + arg_282_0 then
				arg_279_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_282_14 = 0

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 then
				arg_279_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_282_15 = 0
			local var_282_16 = 0.05

			if var_282_15 < arg_279_1.time_ and arg_279_1.time_ <= var_282_15 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_17 = arg_279_1:FormatText(StoryNameCfg[481].name)

				arg_279_1.leftNameTxt_.text = var_282_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_18 = arg_279_1:GetWordFromCfg(123101070)
				local var_282_19 = arg_279_1:FormatText(var_282_18.content)

				arg_279_1.text_.text = var_282_19

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_20 = 2
				local var_282_21 = utf8.len(var_282_19)
				local var_282_22 = var_282_20 <= 0 and var_282_16 or var_282_16 * (var_282_21 / var_282_20)

				if var_282_22 > 0 and var_282_16 < var_282_22 then
					arg_279_1.talkMaxDuration = var_282_22

					if var_282_22 + var_282_15 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_22 + var_282_15
					end
				end

				arg_279_1.text_.text = var_282_19
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101070", "story_v_out_123101.awb") ~= 0 then
					local var_282_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101070", "story_v_out_123101.awb") / 1000

					if var_282_23 + var_282_15 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_23 + var_282_15
					end

					if var_282_18.prefab_name ~= "" and arg_279_1.actors_[var_282_18.prefab_name] ~= nil then
						local var_282_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_18.prefab_name].transform, "story_v_out_123101", "123101070", "story_v_out_123101.awb")

						arg_279_1:RecordAudio("123101070", var_282_24)
						arg_279_1:RecordAudio("123101070", var_282_24)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_123101", "123101070", "story_v_out_123101.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_123101", "123101070", "story_v_out_123101.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_25 = math.max(var_282_16, arg_279_1.talkMaxDuration)

			if var_282_15 <= arg_279_1.time_ and arg_279_1.time_ < var_282_15 + var_282_25 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_15) / var_282_25

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_15 + var_282_25 and arg_279_1.time_ < var_282_15 + var_282_25 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play123101071 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 123101071
		arg_283_1.duration_ = 2.566

		local var_283_0 = {
			zh = 2.566,
			ja = 2.533
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
				arg_283_0:Play123101072(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1093ui_story"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1093ui_story = var_286_0.localPosition
			end

			local var_286_2 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2
				local var_286_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1093ui_story, var_286_4, var_286_3)

				local var_286_5 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_5.x, var_286_5.y, var_286_5.z)

				local var_286_6 = var_286_0.localEulerAngles

				var_286_6.z = 0
				var_286_6.x = 0
				var_286_0.localEulerAngles = var_286_6
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_286_7 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_7.x, var_286_7.y, var_286_7.z)

				local var_286_8 = var_286_0.localEulerAngles

				var_286_8.z = 0
				var_286_8.x = 0
				var_286_0.localEulerAngles = var_286_8
			end

			local var_286_9 = arg_283_1.actors_["1093ui_story"]
			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 and arg_283_1.var_.characterEffect1093ui_story == nil then
				arg_283_1.var_.characterEffect1093ui_story = var_286_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_11 = 0.200000002980232

			if var_286_10 <= arg_283_1.time_ and arg_283_1.time_ < var_286_10 + var_286_11 then
				local var_286_12 = (arg_283_1.time_ - var_286_10) / var_286_11

				if arg_283_1.var_.characterEffect1093ui_story then
					arg_283_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_10 + var_286_11 and arg_283_1.time_ < var_286_10 + var_286_11 + arg_286_0 and arg_283_1.var_.characterEffect1093ui_story then
				arg_283_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_286_13 = 0

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 then
				arg_283_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_286_15 = arg_283_1.actors_["1055ui_story"]
			local var_286_16 = 0

			if var_286_16 < arg_283_1.time_ and arg_283_1.time_ <= var_286_16 + arg_286_0 and arg_283_1.var_.characterEffect1055ui_story == nil then
				arg_283_1.var_.characterEffect1055ui_story = var_286_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_17 = 0.200000002980232

			if var_286_16 <= arg_283_1.time_ and arg_283_1.time_ < var_286_16 + var_286_17 then
				local var_286_18 = (arg_283_1.time_ - var_286_16) / var_286_17

				if arg_283_1.var_.characterEffect1055ui_story then
					local var_286_19 = Mathf.Lerp(0, 0.5, var_286_18)

					arg_283_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1055ui_story.fillRatio = var_286_19
				end
			end

			if arg_283_1.time_ >= var_286_16 + var_286_17 and arg_283_1.time_ < var_286_16 + var_286_17 + arg_286_0 and arg_283_1.var_.characterEffect1055ui_story then
				local var_286_20 = 0.5

				arg_283_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1055ui_story.fillRatio = var_286_20
			end

			local var_286_21 = 0
			local var_286_22 = 0.3

			if var_286_21 < arg_283_1.time_ and arg_283_1.time_ <= var_286_21 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_23 = arg_283_1:FormatText(StoryNameCfg[73].name)

				arg_283_1.leftNameTxt_.text = var_286_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_24 = arg_283_1:GetWordFromCfg(123101071)
				local var_286_25 = arg_283_1:FormatText(var_286_24.content)

				arg_283_1.text_.text = var_286_25

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_26 = 12
				local var_286_27 = utf8.len(var_286_25)
				local var_286_28 = var_286_26 <= 0 and var_286_22 or var_286_22 * (var_286_27 / var_286_26)

				if var_286_28 > 0 and var_286_22 < var_286_28 then
					arg_283_1.talkMaxDuration = var_286_28

					if var_286_28 + var_286_21 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_28 + var_286_21
					end
				end

				arg_283_1.text_.text = var_286_25
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101071", "story_v_out_123101.awb") ~= 0 then
					local var_286_29 = manager.audio:GetVoiceLength("story_v_out_123101", "123101071", "story_v_out_123101.awb") / 1000

					if var_286_29 + var_286_21 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_29 + var_286_21
					end

					if var_286_24.prefab_name ~= "" and arg_283_1.actors_[var_286_24.prefab_name] ~= nil then
						local var_286_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_24.prefab_name].transform, "story_v_out_123101", "123101071", "story_v_out_123101.awb")

						arg_283_1:RecordAudio("123101071", var_286_30)
						arg_283_1:RecordAudio("123101071", var_286_30)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_123101", "123101071", "story_v_out_123101.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_123101", "123101071", "story_v_out_123101.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_31 = math.max(var_286_22, arg_283_1.talkMaxDuration)

			if var_286_21 <= arg_283_1.time_ and arg_283_1.time_ < var_286_21 + var_286_31 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_21) / var_286_31

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_21 + var_286_31 and arg_283_1.time_ < var_286_21 + var_286_31 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play123101072 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 123101072
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play123101073(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1093ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1093ui_story == nil then
				arg_287_1.var_.characterEffect1093ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.200000002980232

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1093ui_story then
					local var_290_4 = Mathf.Lerp(0, 0.5, var_290_3)

					arg_287_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1093ui_story.fillRatio = var_290_4
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1093ui_story then
				local var_290_5 = 0.5

				arg_287_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1093ui_story.fillRatio = var_290_5
			end

			local var_290_6 = 0
			local var_290_7 = 0.45

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

				local var_290_9 = arg_287_1:GetWordFromCfg(123101072)
				local var_290_10 = arg_287_1:FormatText(var_290_9.content)

				arg_287_1.text_.text = var_290_10

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_11 = 18
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
	Play123101073 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 123101073
		arg_291_1.duration_ = 4.3

		local var_291_0 = {
			zh = 4.3,
			ja = 2.566
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
				arg_291_0:Play123101074(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1093ui_story"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.characterEffect1093ui_story == nil then
				arg_291_1.var_.characterEffect1093ui_story = var_294_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_2 = 0.200000002980232

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.characterEffect1093ui_story then
					arg_291_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.characterEffect1093ui_story then
				arg_291_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_294_4 = 0
			local var_294_5 = 0.425

			if var_294_4 < arg_291_1.time_ and arg_291_1.time_ <= var_294_4 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_6 = arg_291_1:FormatText(StoryNameCfg[73].name)

				arg_291_1.leftNameTxt_.text = var_294_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_7 = arg_291_1:GetWordFromCfg(123101073)
				local var_294_8 = arg_291_1:FormatText(var_294_7.content)

				arg_291_1.text_.text = var_294_8

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_9 = 17
				local var_294_10 = utf8.len(var_294_8)
				local var_294_11 = var_294_9 <= 0 and var_294_5 or var_294_5 * (var_294_10 / var_294_9)

				if var_294_11 > 0 and var_294_5 < var_294_11 then
					arg_291_1.talkMaxDuration = var_294_11

					if var_294_11 + var_294_4 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_11 + var_294_4
					end
				end

				arg_291_1.text_.text = var_294_8
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101073", "story_v_out_123101.awb") ~= 0 then
					local var_294_12 = manager.audio:GetVoiceLength("story_v_out_123101", "123101073", "story_v_out_123101.awb") / 1000

					if var_294_12 + var_294_4 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_12 + var_294_4
					end

					if var_294_7.prefab_name ~= "" and arg_291_1.actors_[var_294_7.prefab_name] ~= nil then
						local var_294_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_7.prefab_name].transform, "story_v_out_123101", "123101073", "story_v_out_123101.awb")

						arg_291_1:RecordAudio("123101073", var_294_13)
						arg_291_1:RecordAudio("123101073", var_294_13)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_123101", "123101073", "story_v_out_123101.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_123101", "123101073", "story_v_out_123101.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_14 = math.max(var_294_5, arg_291_1.talkMaxDuration)

			if var_294_4 <= arg_291_1.time_ and arg_291_1.time_ < var_294_4 + var_294_14 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_4) / var_294_14

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_4 + var_294_14 and arg_291_1.time_ < var_294_4 + var_294_14 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play123101074 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 123101074
		arg_295_1.duration_ = 7.233

		local var_295_0 = {
			zh = 4.966,
			ja = 7.233
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
				arg_295_0:Play123101075(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1055ui_story"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos1055ui_story = var_298_0.localPosition
			end

			local var_298_2 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2
				local var_298_4 = Vector3.New(0.7, -0.965, -6.2)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1055ui_story, var_298_4, var_298_3)

				local var_298_5 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_5.x, var_298_5.y, var_298_5.z)

				local var_298_6 = var_298_0.localEulerAngles

				var_298_6.z = 0
				var_298_6.x = 0
				var_298_0.localEulerAngles = var_298_6
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(0.7, -0.965, -6.2)

				local var_298_7 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_7.x, var_298_7.y, var_298_7.z)

				local var_298_8 = var_298_0.localEulerAngles

				var_298_8.z = 0
				var_298_8.x = 0
				var_298_0.localEulerAngles = var_298_8
			end

			local var_298_9 = arg_295_1.actors_["1055ui_story"]
			local var_298_10 = 0

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 and arg_295_1.var_.characterEffect1055ui_story == nil then
				arg_295_1.var_.characterEffect1055ui_story = var_298_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_11 = 0.200000002980232

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_11 then
				local var_298_12 = (arg_295_1.time_ - var_298_10) / var_298_11

				if arg_295_1.var_.characterEffect1055ui_story then
					arg_295_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_10 + var_298_11 and arg_295_1.time_ < var_298_10 + var_298_11 + arg_298_0 and arg_295_1.var_.characterEffect1055ui_story then
				arg_295_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_298_13 = 0

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action7_1")
			end

			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				arg_295_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_298_15 = arg_295_1.actors_["1093ui_story"]
			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 and arg_295_1.var_.characterEffect1093ui_story == nil then
				arg_295_1.var_.characterEffect1093ui_story = var_298_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_17 = 0.200000002980232

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17

				if arg_295_1.var_.characterEffect1093ui_story then
					local var_298_19 = Mathf.Lerp(0, 0.5, var_298_18)

					arg_295_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1093ui_story.fillRatio = var_298_19
				end
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 and arg_295_1.var_.characterEffect1093ui_story then
				local var_298_20 = 0.5

				arg_295_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1093ui_story.fillRatio = var_298_20
			end

			local var_298_21 = 0
			local var_298_22 = 0.525

			if var_298_21 < arg_295_1.time_ and arg_295_1.time_ <= var_298_21 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_23 = arg_295_1:FormatText(StoryNameCfg[481].name)

				arg_295_1.leftNameTxt_.text = var_298_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_24 = arg_295_1:GetWordFromCfg(123101074)
				local var_298_25 = arg_295_1:FormatText(var_298_24.content)

				arg_295_1.text_.text = var_298_25

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_26 = 21
				local var_298_27 = utf8.len(var_298_25)
				local var_298_28 = var_298_26 <= 0 and var_298_22 or var_298_22 * (var_298_27 / var_298_26)

				if var_298_28 > 0 and var_298_22 < var_298_28 then
					arg_295_1.talkMaxDuration = var_298_28

					if var_298_28 + var_298_21 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_28 + var_298_21
					end
				end

				arg_295_1.text_.text = var_298_25
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101074", "story_v_out_123101.awb") ~= 0 then
					local var_298_29 = manager.audio:GetVoiceLength("story_v_out_123101", "123101074", "story_v_out_123101.awb") / 1000

					if var_298_29 + var_298_21 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_29 + var_298_21
					end

					if var_298_24.prefab_name ~= "" and arg_295_1.actors_[var_298_24.prefab_name] ~= nil then
						local var_298_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_24.prefab_name].transform, "story_v_out_123101", "123101074", "story_v_out_123101.awb")

						arg_295_1:RecordAudio("123101074", var_298_30)
						arg_295_1:RecordAudio("123101074", var_298_30)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_123101", "123101074", "story_v_out_123101.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_123101", "123101074", "story_v_out_123101.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_31 = math.max(var_298_22, arg_295_1.talkMaxDuration)

			if var_298_21 <= arg_295_1.time_ and arg_295_1.time_ < var_298_21 + var_298_31 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_21) / var_298_31

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_21 + var_298_31 and arg_295_1.time_ < var_298_21 + var_298_31 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play123101075 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 123101075
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play123101076(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1055ui_story"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos1055ui_story = var_302_0.localPosition
			end

			local var_302_2 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2
				local var_302_4 = Vector3.New(0, 100, 0)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1055ui_story, var_302_4, var_302_3)

				local var_302_5 = manager.ui.mainCamera.transform.position - var_302_0.position

				var_302_0.forward = Vector3.New(var_302_5.x, var_302_5.y, var_302_5.z)

				local var_302_6 = var_302_0.localEulerAngles

				var_302_6.z = 0
				var_302_6.x = 0
				var_302_0.localEulerAngles = var_302_6
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(0, 100, 0)

				local var_302_7 = manager.ui.mainCamera.transform.position - var_302_0.position

				var_302_0.forward = Vector3.New(var_302_7.x, var_302_7.y, var_302_7.z)

				local var_302_8 = var_302_0.localEulerAngles

				var_302_8.z = 0
				var_302_8.x = 0
				var_302_0.localEulerAngles = var_302_8
			end

			local var_302_9 = arg_299_1.actors_["1055ui_story"]
			local var_302_10 = 0

			if var_302_10 < arg_299_1.time_ and arg_299_1.time_ <= var_302_10 + arg_302_0 and arg_299_1.var_.characterEffect1055ui_story == nil then
				arg_299_1.var_.characterEffect1055ui_story = var_302_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_11 = 0.200000002980232

			if var_302_10 <= arg_299_1.time_ and arg_299_1.time_ < var_302_10 + var_302_11 then
				local var_302_12 = (arg_299_1.time_ - var_302_10) / var_302_11

				if arg_299_1.var_.characterEffect1055ui_story then
					local var_302_13 = Mathf.Lerp(0, 0.5, var_302_12)

					arg_299_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1055ui_story.fillRatio = var_302_13
				end
			end

			if arg_299_1.time_ >= var_302_10 + var_302_11 and arg_299_1.time_ < var_302_10 + var_302_11 + arg_302_0 and arg_299_1.var_.characterEffect1055ui_story then
				local var_302_14 = 0.5

				arg_299_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1055ui_story.fillRatio = var_302_14
			end

			local var_302_15 = arg_299_1.actors_["1093ui_story"].transform
			local var_302_16 = 0

			if var_302_16 < arg_299_1.time_ and arg_299_1.time_ <= var_302_16 + arg_302_0 then
				arg_299_1.var_.moveOldPos1093ui_story = var_302_15.localPosition
			end

			local var_302_17 = 0.001

			if var_302_16 <= arg_299_1.time_ and arg_299_1.time_ < var_302_16 + var_302_17 then
				local var_302_18 = (arg_299_1.time_ - var_302_16) / var_302_17
				local var_302_19 = Vector3.New(0, 100, 0)

				var_302_15.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1093ui_story, var_302_19, var_302_18)

				local var_302_20 = manager.ui.mainCamera.transform.position - var_302_15.position

				var_302_15.forward = Vector3.New(var_302_20.x, var_302_20.y, var_302_20.z)

				local var_302_21 = var_302_15.localEulerAngles

				var_302_21.z = 0
				var_302_21.x = 0
				var_302_15.localEulerAngles = var_302_21
			end

			if arg_299_1.time_ >= var_302_16 + var_302_17 and arg_299_1.time_ < var_302_16 + var_302_17 + arg_302_0 then
				var_302_15.localPosition = Vector3.New(0, 100, 0)

				local var_302_22 = manager.ui.mainCamera.transform.position - var_302_15.position

				var_302_15.forward = Vector3.New(var_302_22.x, var_302_22.y, var_302_22.z)

				local var_302_23 = var_302_15.localEulerAngles

				var_302_23.z = 0
				var_302_23.x = 0
				var_302_15.localEulerAngles = var_302_23
			end

			local var_302_24 = arg_299_1.actors_["1093ui_story"]
			local var_302_25 = 0

			if var_302_25 < arg_299_1.time_ and arg_299_1.time_ <= var_302_25 + arg_302_0 and arg_299_1.var_.characterEffect1093ui_story == nil then
				arg_299_1.var_.characterEffect1093ui_story = var_302_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_26 = 0.200000002980232

			if var_302_25 <= arg_299_1.time_ and arg_299_1.time_ < var_302_25 + var_302_26 then
				local var_302_27 = (arg_299_1.time_ - var_302_25) / var_302_26

				if arg_299_1.var_.characterEffect1093ui_story then
					local var_302_28 = Mathf.Lerp(0, 0.5, var_302_27)

					arg_299_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1093ui_story.fillRatio = var_302_28
				end
			end

			if arg_299_1.time_ >= var_302_25 + var_302_26 and arg_299_1.time_ < var_302_25 + var_302_26 + arg_302_0 and arg_299_1.var_.characterEffect1093ui_story then
				local var_302_29 = 0.5

				arg_299_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1093ui_story.fillRatio = var_302_29
			end

			local var_302_30 = 0
			local var_302_31 = 0.7

			if var_302_30 < arg_299_1.time_ and arg_299_1.time_ <= var_302_30 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_32 = arg_299_1:FormatText(StoryNameCfg[7].name)

				arg_299_1.leftNameTxt_.text = var_302_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_33 = arg_299_1:GetWordFromCfg(123101075)
				local var_302_34 = arg_299_1:FormatText(var_302_33.content)

				arg_299_1.text_.text = var_302_34

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_35 = 28
				local var_302_36 = utf8.len(var_302_34)
				local var_302_37 = var_302_35 <= 0 and var_302_31 or var_302_31 * (var_302_36 / var_302_35)

				if var_302_37 > 0 and var_302_31 < var_302_37 then
					arg_299_1.talkMaxDuration = var_302_37

					if var_302_37 + var_302_30 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_37 + var_302_30
					end
				end

				arg_299_1.text_.text = var_302_34
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_38 = math.max(var_302_31, arg_299_1.talkMaxDuration)

			if var_302_30 <= arg_299_1.time_ and arg_299_1.time_ < var_302_30 + var_302_38 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_30) / var_302_38

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_30 + var_302_38 and arg_299_1.time_ < var_302_30 + var_302_38 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play123101076 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 123101076
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play123101077(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.525

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_2 = arg_303_1:GetWordFromCfg(123101076)
				local var_306_3 = arg_303_1:FormatText(var_306_2.content)

				arg_303_1.text_.text = var_306_3

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_4 = 21
				local var_306_5 = utf8.len(var_306_3)
				local var_306_6 = var_306_4 <= 0 and var_306_1 or var_306_1 * (var_306_5 / var_306_4)

				if var_306_6 > 0 and var_306_1 < var_306_6 then
					arg_303_1.talkMaxDuration = var_306_6

					if var_306_6 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_6 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_3
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_7 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_7 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_7

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_7 and arg_303_1.time_ < var_306_0 + var_306_7 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play123101077 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 123101077
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play123101078(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 0.925

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_2 = arg_307_1:FormatText(StoryNameCfg[7].name)

				arg_307_1.leftNameTxt_.text = var_310_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_3 = arg_307_1:GetWordFromCfg(123101077)
				local var_310_4 = arg_307_1:FormatText(var_310_3.content)

				arg_307_1.text_.text = var_310_4

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_5 = 37
				local var_310_6 = utf8.len(var_310_4)
				local var_310_7 = var_310_5 <= 0 and var_310_1 or var_310_1 * (var_310_6 / var_310_5)

				if var_310_7 > 0 and var_310_1 < var_310_7 then
					arg_307_1.talkMaxDuration = var_310_7

					if var_310_7 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_7 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_4
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_8 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_8 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_8

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_8 and arg_307_1.time_ < var_310_0 + var_310_8 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play123101078 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 123101078
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play123101079(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.975

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

				local var_314_3 = arg_311_1:GetWordFromCfg(123101078)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 39
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
	Play123101079 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 123101079
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play123101080(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 0.5

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_2 = arg_315_1:GetWordFromCfg(123101079)
				local var_318_3 = arg_315_1:FormatText(var_318_2.content)

				arg_315_1.text_.text = var_318_3

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_4 = 20
				local var_318_5 = utf8.len(var_318_3)
				local var_318_6 = var_318_4 <= 0 and var_318_1 or var_318_1 * (var_318_5 / var_318_4)

				if var_318_6 > 0 and var_318_1 < var_318_6 then
					arg_315_1.talkMaxDuration = var_318_6

					if var_318_6 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_6 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_3
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_7 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_7 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_7

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_7 and arg_315_1.time_ < var_318_0 + var_318_7 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play123101080 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 123101080
		arg_319_1.duration_ = 7.133

		local var_319_0 = {
			zh = 7.133,
			ja = 6
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
				arg_319_0:Play123101081(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1055ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1055ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0, -0.965, -6.2)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1055ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["1055ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect1055ui_story == nil then
				arg_319_1.var_.characterEffect1055ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect1055ui_story then
					arg_319_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect1055ui_story then
				arg_319_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_322_13 = 0

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_322_15 = 0
			local var_322_16 = 0.475

			if var_322_15 < arg_319_1.time_ and arg_319_1.time_ <= var_322_15 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_17 = arg_319_1:FormatText(StoryNameCfg[481].name)

				arg_319_1.leftNameTxt_.text = var_322_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_18 = arg_319_1:GetWordFromCfg(123101080)
				local var_322_19 = arg_319_1:FormatText(var_322_18.content)

				arg_319_1.text_.text = var_322_19

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_20 = 20
				local var_322_21 = utf8.len(var_322_19)
				local var_322_22 = var_322_20 <= 0 and var_322_16 or var_322_16 * (var_322_21 / var_322_20)

				if var_322_22 > 0 and var_322_16 < var_322_22 then
					arg_319_1.talkMaxDuration = var_322_22

					if var_322_22 + var_322_15 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_22 + var_322_15
					end
				end

				arg_319_1.text_.text = var_322_19
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101080", "story_v_out_123101.awb") ~= 0 then
					local var_322_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101080", "story_v_out_123101.awb") / 1000

					if var_322_23 + var_322_15 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_23 + var_322_15
					end

					if var_322_18.prefab_name ~= "" and arg_319_1.actors_[var_322_18.prefab_name] ~= nil then
						local var_322_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_18.prefab_name].transform, "story_v_out_123101", "123101080", "story_v_out_123101.awb")

						arg_319_1:RecordAudio("123101080", var_322_24)
						arg_319_1:RecordAudio("123101080", var_322_24)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_123101", "123101080", "story_v_out_123101.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_123101", "123101080", "story_v_out_123101.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_25 = math.max(var_322_16, arg_319_1.talkMaxDuration)

			if var_322_15 <= arg_319_1.time_ and arg_319_1.time_ < var_322_15 + var_322_25 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_15) / var_322_25

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_15 + var_322_25 and arg_319_1.time_ < var_322_15 + var_322_25 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play123101081 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 123101081
		arg_323_1.duration_ = 6.633

		local var_323_0 = {
			zh = 3.366,
			ja = 6.633
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
				arg_323_0:Play123101082(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1055ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1055ui_story == nil then
				arg_323_1.var_.characterEffect1055ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.200000002980232

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1055ui_story then
					arg_323_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1055ui_story then
				arg_323_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_326_4 = 0

			if var_326_4 < arg_323_1.time_ and arg_323_1.time_ <= var_326_4 + arg_326_0 then
				arg_323_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_326_5 = 0

			if var_326_5 < arg_323_1.time_ and arg_323_1.time_ <= var_326_5 + arg_326_0 then
				arg_323_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_326_6 = 0
			local var_326_7 = 0.375

			if var_326_6 < arg_323_1.time_ and arg_323_1.time_ <= var_326_6 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_8 = arg_323_1:FormatText(StoryNameCfg[481].name)

				arg_323_1.leftNameTxt_.text = var_326_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_9 = arg_323_1:GetWordFromCfg(123101081)
				local var_326_10 = arg_323_1:FormatText(var_326_9.content)

				arg_323_1.text_.text = var_326_10

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_11 = 15
				local var_326_12 = utf8.len(var_326_10)
				local var_326_13 = var_326_11 <= 0 and var_326_7 or var_326_7 * (var_326_12 / var_326_11)

				if var_326_13 > 0 and var_326_7 < var_326_13 then
					arg_323_1.talkMaxDuration = var_326_13

					if var_326_13 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_13 + var_326_6
					end
				end

				arg_323_1.text_.text = var_326_10
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101081", "story_v_out_123101.awb") ~= 0 then
					local var_326_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101081", "story_v_out_123101.awb") / 1000

					if var_326_14 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_14 + var_326_6
					end

					if var_326_9.prefab_name ~= "" and arg_323_1.actors_[var_326_9.prefab_name] ~= nil then
						local var_326_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_9.prefab_name].transform, "story_v_out_123101", "123101081", "story_v_out_123101.awb")

						arg_323_1:RecordAudio("123101081", var_326_15)
						arg_323_1:RecordAudio("123101081", var_326_15)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_123101", "123101081", "story_v_out_123101.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_123101", "123101081", "story_v_out_123101.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_16 = math.max(var_326_7, arg_323_1.talkMaxDuration)

			if var_326_6 <= arg_323_1.time_ and arg_323_1.time_ < var_326_6 + var_326_16 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_6) / var_326_16

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_6 + var_326_16 and arg_323_1.time_ < var_326_6 + var_326_16 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play123101082 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 123101082
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play123101083(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1055ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1055ui_story == nil then
				arg_327_1.var_.characterEffect1055ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1055ui_story then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1055ui_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1055ui_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1055ui_story.fillRatio = var_330_5
			end

			local var_330_6 = 0
			local var_330_7 = 0.825

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

				local var_330_9 = arg_327_1:GetWordFromCfg(123101082)
				local var_330_10 = arg_327_1:FormatText(var_330_9.content)

				arg_327_1.text_.text = var_330_10

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_11 = 33
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
	Play123101083 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 123101083
		arg_331_1.duration_ = 2.6

		local var_331_0 = {
			zh = 2.6,
			ja = 2.033
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
				arg_331_0:Play123101084(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1055ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1055ui_story == nil then
				arg_331_1.var_.characterEffect1055ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1055ui_story then
					arg_331_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1055ui_story then
				arg_331_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_334_4 = 0

			if var_334_4 < arg_331_1.time_ and arg_331_1.time_ <= var_334_4 + arg_334_0 then
				arg_331_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action2_1")
			end

			local var_334_5 = 0

			if var_334_5 < arg_331_1.time_ and arg_331_1.time_ <= var_334_5 + arg_334_0 then
				arg_331_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_334_6 = 0
			local var_334_7 = 0.125

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[481].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(123101083)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101083", "story_v_out_123101.awb") ~= 0 then
					local var_334_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101083", "story_v_out_123101.awb") / 1000

					if var_334_14 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_14 + var_334_6
					end

					if var_334_9.prefab_name ~= "" and arg_331_1.actors_[var_334_9.prefab_name] ~= nil then
						local var_334_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_9.prefab_name].transform, "story_v_out_123101", "123101083", "story_v_out_123101.awb")

						arg_331_1:RecordAudio("123101083", var_334_15)
						arg_331_1:RecordAudio("123101083", var_334_15)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_123101", "123101083", "story_v_out_123101.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_123101", "123101083", "story_v_out_123101.awb")
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
	Play123101084 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 123101084
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play123101085(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1055ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1055ui_story == nil then
				arg_335_1.var_.characterEffect1055ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1055ui_story then
					local var_338_4 = Mathf.Lerp(0, 0.5, var_338_3)

					arg_335_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1055ui_story.fillRatio = var_338_4
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1055ui_story then
				local var_338_5 = 0.5

				arg_335_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1055ui_story.fillRatio = var_338_5
			end

			local var_338_6 = 0
			local var_338_7 = 0.6

			if var_338_6 < arg_335_1.time_ and arg_335_1.time_ <= var_338_6 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_8 = arg_335_1:GetWordFromCfg(123101084)
				local var_338_9 = arg_335_1:FormatText(var_338_8.content)

				arg_335_1.text_.text = var_338_9

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_10 = 24
				local var_338_11 = utf8.len(var_338_9)
				local var_338_12 = var_338_10 <= 0 and var_338_7 or var_338_7 * (var_338_11 / var_338_10)

				if var_338_12 > 0 and var_338_7 < var_338_12 then
					arg_335_1.talkMaxDuration = var_338_12

					if var_338_12 + var_338_6 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_12 + var_338_6
					end
				end

				arg_335_1.text_.text = var_338_9
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_13 = math.max(var_338_7, arg_335_1.talkMaxDuration)

			if var_338_6 <= arg_335_1.time_ and arg_335_1.time_ < var_338_6 + var_338_13 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_6) / var_338_13

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_6 + var_338_13 and arg_335_1.time_ < var_338_6 + var_338_13 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play123101085 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 123101085
		arg_339_1.duration_ = 5.533

		local var_339_0 = {
			zh = 5.533,
			ja = 5.4
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
				arg_339_0:Play123101086(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1055ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect1055ui_story == nil then
				arg_339_1.var_.characterEffect1055ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.200000002980232

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect1055ui_story then
					arg_339_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect1055ui_story then
				arg_339_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_342_4 = 0

			if var_342_4 < arg_339_1.time_ and arg_339_1.time_ <= var_342_4 + arg_342_0 then
				arg_339_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action2_2")
			end

			local var_342_5 = 0

			if var_342_5 < arg_339_1.time_ and arg_339_1.time_ <= var_342_5 + arg_342_0 then
				arg_339_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_6 = 0
			local var_342_7 = 0.75

			if var_342_6 < arg_339_1.time_ and arg_339_1.time_ <= var_342_6 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_8 = arg_339_1:FormatText(StoryNameCfg[481].name)

				arg_339_1.leftNameTxt_.text = var_342_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_9 = arg_339_1:GetWordFromCfg(123101085)
				local var_342_10 = arg_339_1:FormatText(var_342_9.content)

				arg_339_1.text_.text = var_342_10

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_11 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101085", "story_v_out_123101.awb") ~= 0 then
					local var_342_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101085", "story_v_out_123101.awb") / 1000

					if var_342_14 + var_342_6 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_14 + var_342_6
					end

					if var_342_9.prefab_name ~= "" and arg_339_1.actors_[var_342_9.prefab_name] ~= nil then
						local var_342_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_9.prefab_name].transform, "story_v_out_123101", "123101085", "story_v_out_123101.awb")

						arg_339_1:RecordAudio("123101085", var_342_15)
						arg_339_1:RecordAudio("123101085", var_342_15)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_123101", "123101085", "story_v_out_123101.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_123101", "123101085", "story_v_out_123101.awb")
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
	Play123101086 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 123101086
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play123101087(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1055ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1055ui_story == nil then
				arg_343_1.var_.characterEffect1055ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1055ui_story then
					local var_346_4 = Mathf.Lerp(0, 0.5, var_346_3)

					arg_343_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1055ui_story.fillRatio = var_346_4
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1055ui_story then
				local var_346_5 = 0.5

				arg_343_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1055ui_story.fillRatio = var_346_5
			end

			local var_346_6 = 0
			local var_346_7 = 0.7

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_8 = arg_343_1:FormatText(StoryNameCfg[7].name)

				arg_343_1.leftNameTxt_.text = var_346_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_9 = arg_343_1:GetWordFromCfg(123101086)
				local var_346_10 = arg_343_1:FormatText(var_346_9.content)

				arg_343_1.text_.text = var_346_10

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_11 = 28
				local var_346_12 = utf8.len(var_346_10)
				local var_346_13 = var_346_11 <= 0 and var_346_7 or var_346_7 * (var_346_12 / var_346_11)

				if var_346_13 > 0 and var_346_7 < var_346_13 then
					arg_343_1.talkMaxDuration = var_346_13

					if var_346_13 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_13 + var_346_6
					end
				end

				arg_343_1.text_.text = var_346_10
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_14 = math.max(var_346_7, arg_343_1.talkMaxDuration)

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_14 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_6) / var_346_14

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_6 + var_346_14 and arg_343_1.time_ < var_346_6 + var_346_14 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play123101087 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 123101087
		arg_347_1.duration_ = 7

		local var_347_0 = {
			zh = 6.033,
			ja = 7
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
				arg_347_0:Play123101088(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1055ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect1055ui_story == nil then
				arg_347_1.var_.characterEffect1055ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.200000002980232

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect1055ui_story then
					arg_347_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect1055ui_story then
				arg_347_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_350_4 = 0

			if var_350_4 < arg_347_1.time_ and arg_347_1.time_ <= var_350_4 + arg_350_0 then
				arg_347_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_350_5 = 0

			if var_350_5 < arg_347_1.time_ and arg_347_1.time_ <= var_350_5 + arg_350_0 then
				arg_347_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_350_6 = 0
			local var_350_7 = 0.625

			if var_350_6 < arg_347_1.time_ and arg_347_1.time_ <= var_350_6 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_8 = arg_347_1:FormatText(StoryNameCfg[481].name)

				arg_347_1.leftNameTxt_.text = var_350_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_9 = arg_347_1:GetWordFromCfg(123101087)
				local var_350_10 = arg_347_1:FormatText(var_350_9.content)

				arg_347_1.text_.text = var_350_10

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_11 = 25
				local var_350_12 = utf8.len(var_350_10)
				local var_350_13 = var_350_11 <= 0 and var_350_7 or var_350_7 * (var_350_12 / var_350_11)

				if var_350_13 > 0 and var_350_7 < var_350_13 then
					arg_347_1.talkMaxDuration = var_350_13

					if var_350_13 + var_350_6 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_13 + var_350_6
					end
				end

				arg_347_1.text_.text = var_350_10
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101087", "story_v_out_123101.awb") ~= 0 then
					local var_350_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101087", "story_v_out_123101.awb") / 1000

					if var_350_14 + var_350_6 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_14 + var_350_6
					end

					if var_350_9.prefab_name ~= "" and arg_347_1.actors_[var_350_9.prefab_name] ~= nil then
						local var_350_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_9.prefab_name].transform, "story_v_out_123101", "123101087", "story_v_out_123101.awb")

						arg_347_1:RecordAudio("123101087", var_350_15)
						arg_347_1:RecordAudio("123101087", var_350_15)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_123101", "123101087", "story_v_out_123101.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_123101", "123101087", "story_v_out_123101.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_16 = math.max(var_350_7, arg_347_1.talkMaxDuration)

			if var_350_6 <= arg_347_1.time_ and arg_347_1.time_ < var_350_6 + var_350_16 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_6) / var_350_16

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_6 + var_350_16 and arg_347_1.time_ < var_350_6 + var_350_16 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play123101088 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 123101088
		arg_351_1.duration_ = 3.7

		local var_351_0 = {
			zh = 3.166,
			ja = 3.7
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
				arg_351_0:Play123101089(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1093ui_story"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1093ui_story = var_354_0.localPosition
			end

			local var_354_2 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1093ui_story, var_354_4, var_354_3)

				local var_354_5 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_5.x, var_354_5.y, var_354_5.z)

				local var_354_6 = var_354_0.localEulerAngles

				var_354_6.z = 0
				var_354_6.x = 0
				var_354_0.localEulerAngles = var_354_6
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_354_7 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_7.x, var_354_7.y, var_354_7.z)

				local var_354_8 = var_354_0.localEulerAngles

				var_354_8.z = 0
				var_354_8.x = 0
				var_354_0.localEulerAngles = var_354_8
			end

			local var_354_9 = arg_351_1.actors_["1093ui_story"]
			local var_354_10 = 0

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 and arg_351_1.var_.characterEffect1093ui_story == nil then
				arg_351_1.var_.characterEffect1093ui_story = var_354_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_11 = 0.200000002980232

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_11 then
				local var_354_12 = (arg_351_1.time_ - var_354_10) / var_354_11

				if arg_351_1.var_.characterEffect1093ui_story then
					arg_351_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_10 + var_354_11 and arg_351_1.time_ < var_354_10 + var_354_11 + arg_354_0 and arg_351_1.var_.characterEffect1093ui_story then
				arg_351_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_354_13 = 0

			if var_354_13 < arg_351_1.time_ and arg_351_1.time_ <= var_354_13 + arg_354_0 then
				arg_351_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_354_14 = 0

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				arg_351_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_354_15 = arg_351_1.actors_["1055ui_story"].transform
			local var_354_16 = 0

			if var_354_16 < arg_351_1.time_ and arg_351_1.time_ <= var_354_16 + arg_354_0 then
				arg_351_1.var_.moveOldPos1055ui_story = var_354_15.localPosition
			end

			local var_354_17 = 0.001

			if var_354_16 <= arg_351_1.time_ and arg_351_1.time_ < var_354_16 + var_354_17 then
				local var_354_18 = (arg_351_1.time_ - var_354_16) / var_354_17
				local var_354_19 = Vector3.New(0.7, -0.965, -6.2)

				var_354_15.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1055ui_story, var_354_19, var_354_18)

				local var_354_20 = manager.ui.mainCamera.transform.position - var_354_15.position

				var_354_15.forward = Vector3.New(var_354_20.x, var_354_20.y, var_354_20.z)

				local var_354_21 = var_354_15.localEulerAngles

				var_354_21.z = 0
				var_354_21.x = 0
				var_354_15.localEulerAngles = var_354_21
			end

			if arg_351_1.time_ >= var_354_16 + var_354_17 and arg_351_1.time_ < var_354_16 + var_354_17 + arg_354_0 then
				var_354_15.localPosition = Vector3.New(0.7, -0.965, -6.2)

				local var_354_22 = manager.ui.mainCamera.transform.position - var_354_15.position

				var_354_15.forward = Vector3.New(var_354_22.x, var_354_22.y, var_354_22.z)

				local var_354_23 = var_354_15.localEulerAngles

				var_354_23.z = 0
				var_354_23.x = 0
				var_354_15.localEulerAngles = var_354_23
			end

			local var_354_24 = arg_351_1.actors_["1055ui_story"]
			local var_354_25 = 0

			if var_354_25 < arg_351_1.time_ and arg_351_1.time_ <= var_354_25 + arg_354_0 and arg_351_1.var_.characterEffect1055ui_story == nil then
				arg_351_1.var_.characterEffect1055ui_story = var_354_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_26 = 0.200000002980232

			if var_354_25 <= arg_351_1.time_ and arg_351_1.time_ < var_354_25 + var_354_26 then
				local var_354_27 = (arg_351_1.time_ - var_354_25) / var_354_26

				if arg_351_1.var_.characterEffect1055ui_story then
					local var_354_28 = Mathf.Lerp(0, 0.5, var_354_27)

					arg_351_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1055ui_story.fillRatio = var_354_28
				end
			end

			if arg_351_1.time_ >= var_354_25 + var_354_26 and arg_351_1.time_ < var_354_25 + var_354_26 + arg_354_0 and arg_351_1.var_.characterEffect1055ui_story then
				local var_354_29 = 0.5

				arg_351_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1055ui_story.fillRatio = var_354_29
			end

			local var_354_30 = 0
			local var_354_31 = 0.225

			if var_354_30 < arg_351_1.time_ and arg_351_1.time_ <= var_354_30 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_32 = arg_351_1:FormatText(StoryNameCfg[73].name)

				arg_351_1.leftNameTxt_.text = var_354_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_33 = arg_351_1:GetWordFromCfg(123101088)
				local var_354_34 = arg_351_1:FormatText(var_354_33.content)

				arg_351_1.text_.text = var_354_34

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_35 = 9
				local var_354_36 = utf8.len(var_354_34)
				local var_354_37 = var_354_35 <= 0 and var_354_31 or var_354_31 * (var_354_36 / var_354_35)

				if var_354_37 > 0 and var_354_31 < var_354_37 then
					arg_351_1.talkMaxDuration = var_354_37

					if var_354_37 + var_354_30 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_37 + var_354_30
					end
				end

				arg_351_1.text_.text = var_354_34
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101088", "story_v_out_123101.awb") ~= 0 then
					local var_354_38 = manager.audio:GetVoiceLength("story_v_out_123101", "123101088", "story_v_out_123101.awb") / 1000

					if var_354_38 + var_354_30 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_38 + var_354_30
					end

					if var_354_33.prefab_name ~= "" and arg_351_1.actors_[var_354_33.prefab_name] ~= nil then
						local var_354_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_33.prefab_name].transform, "story_v_out_123101", "123101088", "story_v_out_123101.awb")

						arg_351_1:RecordAudio("123101088", var_354_39)
						arg_351_1:RecordAudio("123101088", var_354_39)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_123101", "123101088", "story_v_out_123101.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_123101", "123101088", "story_v_out_123101.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_40 = math.max(var_354_31, arg_351_1.talkMaxDuration)

			if var_354_30 <= arg_351_1.time_ and arg_351_1.time_ < var_354_30 + var_354_40 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_30) / var_354_40

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_30 + var_354_40 and arg_351_1.time_ < var_354_30 + var_354_40 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play123101089 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 123101089
		arg_355_1.duration_ = 6.166

		local var_355_0 = {
			zh = 3.9,
			ja = 6.166
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
				arg_355_0:Play123101090(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1055ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1055ui_story == nil then
				arg_355_1.var_.characterEffect1055ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1055ui_story then
					arg_355_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1055ui_story then
				arg_355_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_358_4 = 0

			if var_358_4 < arg_355_1.time_ and arg_355_1.time_ <= var_358_4 + arg_358_0 then
				arg_355_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_358_5 = 0

			if var_358_5 < arg_355_1.time_ and arg_355_1.time_ <= var_358_5 + arg_358_0 then
				arg_355_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_358_6 = arg_355_1.actors_["1093ui_story"]
			local var_358_7 = 0

			if var_358_7 < arg_355_1.time_ and arg_355_1.time_ <= var_358_7 + arg_358_0 and arg_355_1.var_.characterEffect1093ui_story == nil then
				arg_355_1.var_.characterEffect1093ui_story = var_358_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_8 = 0.200000002980232

			if var_358_7 <= arg_355_1.time_ and arg_355_1.time_ < var_358_7 + var_358_8 then
				local var_358_9 = (arg_355_1.time_ - var_358_7) / var_358_8

				if arg_355_1.var_.characterEffect1093ui_story then
					local var_358_10 = Mathf.Lerp(0, 0.5, var_358_9)

					arg_355_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1093ui_story.fillRatio = var_358_10
				end
			end

			if arg_355_1.time_ >= var_358_7 + var_358_8 and arg_355_1.time_ < var_358_7 + var_358_8 + arg_358_0 and arg_355_1.var_.characterEffect1093ui_story then
				local var_358_11 = 0.5

				arg_355_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1093ui_story.fillRatio = var_358_11
			end

			local var_358_12 = 0
			local var_358_13 = 0.425

			if var_358_12 < arg_355_1.time_ and arg_355_1.time_ <= var_358_12 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_14 = arg_355_1:FormatText(StoryNameCfg[481].name)

				arg_355_1.leftNameTxt_.text = var_358_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_15 = arg_355_1:GetWordFromCfg(123101089)
				local var_358_16 = arg_355_1:FormatText(var_358_15.content)

				arg_355_1.text_.text = var_358_16

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_17 = 17
				local var_358_18 = utf8.len(var_358_16)
				local var_358_19 = var_358_17 <= 0 and var_358_13 or var_358_13 * (var_358_18 / var_358_17)

				if var_358_19 > 0 and var_358_13 < var_358_19 then
					arg_355_1.talkMaxDuration = var_358_19

					if var_358_19 + var_358_12 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_19 + var_358_12
					end
				end

				arg_355_1.text_.text = var_358_16
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101089", "story_v_out_123101.awb") ~= 0 then
					local var_358_20 = manager.audio:GetVoiceLength("story_v_out_123101", "123101089", "story_v_out_123101.awb") / 1000

					if var_358_20 + var_358_12 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_20 + var_358_12
					end

					if var_358_15.prefab_name ~= "" and arg_355_1.actors_[var_358_15.prefab_name] ~= nil then
						local var_358_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_15.prefab_name].transform, "story_v_out_123101", "123101089", "story_v_out_123101.awb")

						arg_355_1:RecordAudio("123101089", var_358_21)
						arg_355_1:RecordAudio("123101089", var_358_21)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_123101", "123101089", "story_v_out_123101.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_123101", "123101089", "story_v_out_123101.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_22 = math.max(var_358_13, arg_355_1.talkMaxDuration)

			if var_358_12 <= arg_355_1.time_ and arg_355_1.time_ < var_358_12 + var_358_22 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_12) / var_358_22

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_12 + var_358_22 and arg_355_1.time_ < var_358_12 + var_358_22 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play123101090 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 123101090
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play123101091(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1055ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1055ui_story == nil then
				arg_359_1.var_.characterEffect1055ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.200000002980232

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1055ui_story then
					local var_362_4 = Mathf.Lerp(0, 0.5, var_362_3)

					arg_359_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1055ui_story.fillRatio = var_362_4
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1055ui_story then
				local var_362_5 = 0.5

				arg_359_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1055ui_story.fillRatio = var_362_5
			end

			local var_362_6 = arg_359_1.actors_["1055ui_story"].transform
			local var_362_7 = 0

			if var_362_7 < arg_359_1.time_ and arg_359_1.time_ <= var_362_7 + arg_362_0 then
				arg_359_1.var_.moveOldPos1055ui_story = var_362_6.localPosition
			end

			local var_362_8 = 0.001

			if var_362_7 <= arg_359_1.time_ and arg_359_1.time_ < var_362_7 + var_362_8 then
				local var_362_9 = (arg_359_1.time_ - var_362_7) / var_362_8
				local var_362_10 = Vector3.New(0, 100, 0)

				var_362_6.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1055ui_story, var_362_10, var_362_9)

				local var_362_11 = manager.ui.mainCamera.transform.position - var_362_6.position

				var_362_6.forward = Vector3.New(var_362_11.x, var_362_11.y, var_362_11.z)

				local var_362_12 = var_362_6.localEulerAngles

				var_362_12.z = 0
				var_362_12.x = 0
				var_362_6.localEulerAngles = var_362_12
			end

			if arg_359_1.time_ >= var_362_7 + var_362_8 and arg_359_1.time_ < var_362_7 + var_362_8 + arg_362_0 then
				var_362_6.localPosition = Vector3.New(0, 100, 0)

				local var_362_13 = manager.ui.mainCamera.transform.position - var_362_6.position

				var_362_6.forward = Vector3.New(var_362_13.x, var_362_13.y, var_362_13.z)

				local var_362_14 = var_362_6.localEulerAngles

				var_362_14.z = 0
				var_362_14.x = 0
				var_362_6.localEulerAngles = var_362_14
			end

			local var_362_15 = arg_359_1.actors_["1093ui_story"].transform
			local var_362_16 = 0

			if var_362_16 < arg_359_1.time_ and arg_359_1.time_ <= var_362_16 + arg_362_0 then
				arg_359_1.var_.moveOldPos1093ui_story = var_362_15.localPosition
			end

			local var_362_17 = 0.001

			if var_362_16 <= arg_359_1.time_ and arg_359_1.time_ < var_362_16 + var_362_17 then
				local var_362_18 = (arg_359_1.time_ - var_362_16) / var_362_17
				local var_362_19 = Vector3.New(0, 100, 0)

				var_362_15.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1093ui_story, var_362_19, var_362_18)

				local var_362_20 = manager.ui.mainCamera.transform.position - var_362_15.position

				var_362_15.forward = Vector3.New(var_362_20.x, var_362_20.y, var_362_20.z)

				local var_362_21 = var_362_15.localEulerAngles

				var_362_21.z = 0
				var_362_21.x = 0
				var_362_15.localEulerAngles = var_362_21
			end

			if arg_359_1.time_ >= var_362_16 + var_362_17 and arg_359_1.time_ < var_362_16 + var_362_17 + arg_362_0 then
				var_362_15.localPosition = Vector3.New(0, 100, 0)

				local var_362_22 = manager.ui.mainCamera.transform.position - var_362_15.position

				var_362_15.forward = Vector3.New(var_362_22.x, var_362_22.y, var_362_22.z)

				local var_362_23 = var_362_15.localEulerAngles

				var_362_23.z = 0
				var_362_23.x = 0
				var_362_15.localEulerAngles = var_362_23
			end

			local var_362_24 = 0
			local var_362_25 = 0.7

			if var_362_24 < arg_359_1.time_ and arg_359_1.time_ <= var_362_24 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, false)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_26 = arg_359_1:GetWordFromCfg(123101090)
				local var_362_27 = arg_359_1:FormatText(var_362_26.content)

				arg_359_1.text_.text = var_362_27

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_28 = 28
				local var_362_29 = utf8.len(var_362_27)
				local var_362_30 = var_362_28 <= 0 and var_362_25 or var_362_25 * (var_362_29 / var_362_28)

				if var_362_30 > 0 and var_362_25 < var_362_30 then
					arg_359_1.talkMaxDuration = var_362_30

					if var_362_30 + var_362_24 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_30 + var_362_24
					end
				end

				arg_359_1.text_.text = var_362_27
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_31 = math.max(var_362_25, arg_359_1.talkMaxDuration)

			if var_362_24 <= arg_359_1.time_ and arg_359_1.time_ < var_362_24 + var_362_31 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_24) / var_362_31

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_24 + var_362_31 and arg_359_1.time_ < var_362_24 + var_362_31 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play123101091 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 123101091
		arg_363_1.duration_ = 3.9

		local var_363_0 = {
			zh = 3.3,
			ja = 3.9
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
				arg_363_0:Play123101092(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1093ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect1093ui_story == nil then
				arg_363_1.var_.characterEffect1093ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1093ui_story then
					arg_363_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect1093ui_story then
				arg_363_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_366_4 = 0

			if var_366_4 < arg_363_1.time_ and arg_363_1.time_ <= var_366_4 + arg_366_0 then
				arg_363_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action3_1")
			end

			local var_366_5 = 0

			if var_366_5 < arg_363_1.time_ and arg_363_1.time_ <= var_366_5 + arg_366_0 then
				arg_363_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_366_6 = arg_363_1.actors_["1093ui_story"].transform
			local var_366_7 = 0

			if var_366_7 < arg_363_1.time_ and arg_363_1.time_ <= var_366_7 + arg_366_0 then
				arg_363_1.var_.moveOldPos1093ui_story = var_366_6.localPosition
			end

			local var_366_8 = 0.001

			if var_366_7 <= arg_363_1.time_ and arg_363_1.time_ < var_366_7 + var_366_8 then
				local var_366_9 = (arg_363_1.time_ - var_366_7) / var_366_8
				local var_366_10 = Vector3.New(0, -1.11, -5.88)

				var_366_6.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1093ui_story, var_366_10, var_366_9)

				local var_366_11 = manager.ui.mainCamera.transform.position - var_366_6.position

				var_366_6.forward = Vector3.New(var_366_11.x, var_366_11.y, var_366_11.z)

				local var_366_12 = var_366_6.localEulerAngles

				var_366_12.z = 0
				var_366_12.x = 0
				var_366_6.localEulerAngles = var_366_12
			end

			if arg_363_1.time_ >= var_366_7 + var_366_8 and arg_363_1.time_ < var_366_7 + var_366_8 + arg_366_0 then
				var_366_6.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_366_13 = manager.ui.mainCamera.transform.position - var_366_6.position

				var_366_6.forward = Vector3.New(var_366_13.x, var_366_13.y, var_366_13.z)

				local var_366_14 = var_366_6.localEulerAngles

				var_366_14.z = 0
				var_366_14.x = 0
				var_366_6.localEulerAngles = var_366_14
			end

			local var_366_15 = arg_363_1.actors_["1055ui_story"].transform
			local var_366_16 = 0

			if var_366_16 < arg_363_1.time_ and arg_363_1.time_ <= var_366_16 + arg_366_0 then
				arg_363_1.var_.moveOldPos1055ui_story = var_366_15.localPosition
			end

			local var_366_17 = 0.001

			if var_366_16 <= arg_363_1.time_ and arg_363_1.time_ < var_366_16 + var_366_17 then
				local var_366_18 = (arg_363_1.time_ - var_366_16) / var_366_17
				local var_366_19 = Vector3.New(0, 100, 0)

				var_366_15.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1055ui_story, var_366_19, var_366_18)

				local var_366_20 = manager.ui.mainCamera.transform.position - var_366_15.position

				var_366_15.forward = Vector3.New(var_366_20.x, var_366_20.y, var_366_20.z)

				local var_366_21 = var_366_15.localEulerAngles

				var_366_21.z = 0
				var_366_21.x = 0
				var_366_15.localEulerAngles = var_366_21
			end

			if arg_363_1.time_ >= var_366_16 + var_366_17 and arg_363_1.time_ < var_366_16 + var_366_17 + arg_366_0 then
				var_366_15.localPosition = Vector3.New(0, 100, 0)

				local var_366_22 = manager.ui.mainCamera.transform.position - var_366_15.position

				var_366_15.forward = Vector3.New(var_366_22.x, var_366_22.y, var_366_22.z)

				local var_366_23 = var_366_15.localEulerAngles

				var_366_23.z = 0
				var_366_23.x = 0
				var_366_15.localEulerAngles = var_366_23
			end

			local var_366_24 = 0
			local var_366_25 = 0.35

			if var_366_24 < arg_363_1.time_ and arg_363_1.time_ <= var_366_24 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_26 = arg_363_1:FormatText(StoryNameCfg[73].name)

				arg_363_1.leftNameTxt_.text = var_366_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_27 = arg_363_1:GetWordFromCfg(123101091)
				local var_366_28 = arg_363_1:FormatText(var_366_27.content)

				arg_363_1.text_.text = var_366_28

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_29 = 14
				local var_366_30 = utf8.len(var_366_28)
				local var_366_31 = var_366_29 <= 0 and var_366_25 or var_366_25 * (var_366_30 / var_366_29)

				if var_366_31 > 0 and var_366_25 < var_366_31 then
					arg_363_1.talkMaxDuration = var_366_31

					if var_366_31 + var_366_24 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_31 + var_366_24
					end
				end

				arg_363_1.text_.text = var_366_28
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101091", "story_v_out_123101.awb") ~= 0 then
					local var_366_32 = manager.audio:GetVoiceLength("story_v_out_123101", "123101091", "story_v_out_123101.awb") / 1000

					if var_366_32 + var_366_24 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_32 + var_366_24
					end

					if var_366_27.prefab_name ~= "" and arg_363_1.actors_[var_366_27.prefab_name] ~= nil then
						local var_366_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_27.prefab_name].transform, "story_v_out_123101", "123101091", "story_v_out_123101.awb")

						arg_363_1:RecordAudio("123101091", var_366_33)
						arg_363_1:RecordAudio("123101091", var_366_33)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_123101", "123101091", "story_v_out_123101.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_123101", "123101091", "story_v_out_123101.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_34 = math.max(var_366_25, arg_363_1.talkMaxDuration)

			if var_366_24 <= arg_363_1.time_ and arg_363_1.time_ < var_366_24 + var_366_34 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_24) / var_366_34

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_24 + var_366_34 and arg_363_1.time_ < var_366_24 + var_366_34 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play123101092 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 123101092
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play123101093(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1093ui_story"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.characterEffect1093ui_story == nil then
				arg_367_1.var_.characterEffect1093ui_story = var_370_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_2 = 0.200000002980232

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.characterEffect1093ui_story then
					local var_370_4 = Mathf.Lerp(0, 0.5, var_370_3)

					arg_367_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1093ui_story.fillRatio = var_370_4
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.characterEffect1093ui_story then
				local var_370_5 = 0.5

				arg_367_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1093ui_story.fillRatio = var_370_5
			end

			local var_370_6 = 0
			local var_370_7 = 1.15

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_8 = arg_367_1:FormatText(StoryNameCfg[7].name)

				arg_367_1.leftNameTxt_.text = var_370_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_9 = arg_367_1:GetWordFromCfg(123101092)
				local var_370_10 = arg_367_1:FormatText(var_370_9.content)

				arg_367_1.text_.text = var_370_10

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_11 = 46
				local var_370_12 = utf8.len(var_370_10)
				local var_370_13 = var_370_11 <= 0 and var_370_7 or var_370_7 * (var_370_12 / var_370_11)

				if var_370_13 > 0 and var_370_7 < var_370_13 then
					arg_367_1.talkMaxDuration = var_370_13

					if var_370_13 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_13 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_10
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_14 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_14 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_14

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_14 and arg_367_1.time_ < var_370_6 + var_370_14 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play123101093 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 123101093
		arg_371_1.duration_ = 9.533

		local var_371_0 = {
			zh = 9.533,
			ja = 8.966
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
				arg_371_0:Play123101094(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1093ui_story"]
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 and arg_371_1.var_.characterEffect1093ui_story == nil then
				arg_371_1.var_.characterEffect1093ui_story = var_374_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_2 = 0.200000002980232

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2

				if arg_371_1.var_.characterEffect1093ui_story then
					arg_371_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 and arg_371_1.var_.characterEffect1093ui_story then
				arg_371_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_374_4 = 0

			if var_374_4 < arg_371_1.time_ and arg_371_1.time_ <= var_374_4 + arg_374_0 then
				arg_371_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_374_5 = 0
			local var_374_6 = 1.05

			if var_374_5 < arg_371_1.time_ and arg_371_1.time_ <= var_374_5 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_7 = arg_371_1:FormatText(StoryNameCfg[73].name)

				arg_371_1.leftNameTxt_.text = var_374_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_8 = arg_371_1:GetWordFromCfg(123101093)
				local var_374_9 = arg_371_1:FormatText(var_374_8.content)

				arg_371_1.text_.text = var_374_9

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_10 = 42
				local var_374_11 = utf8.len(var_374_9)
				local var_374_12 = var_374_10 <= 0 and var_374_6 or var_374_6 * (var_374_11 / var_374_10)

				if var_374_12 > 0 and var_374_6 < var_374_12 then
					arg_371_1.talkMaxDuration = var_374_12

					if var_374_12 + var_374_5 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_12 + var_374_5
					end
				end

				arg_371_1.text_.text = var_374_9
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101093", "story_v_out_123101.awb") ~= 0 then
					local var_374_13 = manager.audio:GetVoiceLength("story_v_out_123101", "123101093", "story_v_out_123101.awb") / 1000

					if var_374_13 + var_374_5 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_13 + var_374_5
					end

					if var_374_8.prefab_name ~= "" and arg_371_1.actors_[var_374_8.prefab_name] ~= nil then
						local var_374_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_8.prefab_name].transform, "story_v_out_123101", "123101093", "story_v_out_123101.awb")

						arg_371_1:RecordAudio("123101093", var_374_14)
						arg_371_1:RecordAudio("123101093", var_374_14)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_123101", "123101093", "story_v_out_123101.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_123101", "123101093", "story_v_out_123101.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_15 = math.max(var_374_6, arg_371_1.talkMaxDuration)

			if var_374_5 <= arg_371_1.time_ and arg_371_1.time_ < var_374_5 + var_374_15 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_5) / var_374_15

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_5 + var_374_15 and arg_371_1.time_ < var_374_5 + var_374_15 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play123101094 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 123101094
		arg_375_1.duration_ = 5

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play123101095(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1093ui_story"]
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 and arg_375_1.var_.characterEffect1093ui_story == nil then
				arg_375_1.var_.characterEffect1093ui_story = var_378_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_2 = 0.200000002980232

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2

				if arg_375_1.var_.characterEffect1093ui_story then
					local var_378_4 = Mathf.Lerp(0, 0.5, var_378_3)

					arg_375_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1093ui_story.fillRatio = var_378_4
				end
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 and arg_375_1.var_.characterEffect1093ui_story then
				local var_378_5 = 0.5

				arg_375_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1093ui_story.fillRatio = var_378_5
			end

			local var_378_6 = 0
			local var_378_7 = 1.15

			if var_378_6 < arg_375_1.time_ and arg_375_1.time_ <= var_378_6 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_8 = arg_375_1:FormatText(StoryNameCfg[7].name)

				arg_375_1.leftNameTxt_.text = var_378_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_9 = arg_375_1:GetWordFromCfg(123101094)
				local var_378_10 = arg_375_1:FormatText(var_378_9.content)

				arg_375_1.text_.text = var_378_10

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_11 = 46
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
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_14 = math.max(var_378_7, arg_375_1.talkMaxDuration)

			if var_378_6 <= arg_375_1.time_ and arg_375_1.time_ < var_378_6 + var_378_14 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_6) / var_378_14

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_6 + var_378_14 and arg_375_1.time_ < var_378_6 + var_378_14 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play123101095 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 123101095
		arg_379_1.duration_ = 2.3

		local var_379_0 = {
			zh = 1.999999999999,
			ja = 2.3
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
				arg_379_0:Play123101096(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1093ui_story"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and arg_379_1.var_.characterEffect1093ui_story == nil then
				arg_379_1.var_.characterEffect1093ui_story = var_382_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_2 = 0.200000002980232

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.characterEffect1093ui_story then
					arg_379_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and arg_379_1.var_.characterEffect1093ui_story then
				arg_379_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_382_4 = 0

			if var_382_4 < arg_379_1.time_ and arg_379_1.time_ <= var_382_4 + arg_382_0 then
				arg_379_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action3_2")
			end

			local var_382_5 = 0

			if var_382_5 < arg_379_1.time_ and arg_379_1.time_ <= var_382_5 + arg_382_0 then
				arg_379_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_382_6 = 0
			local var_382_7 = 0.125

			if var_382_6 < arg_379_1.time_ and arg_379_1.time_ <= var_382_6 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_8 = arg_379_1:FormatText(StoryNameCfg[73].name)

				arg_379_1.leftNameTxt_.text = var_382_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_9 = arg_379_1:GetWordFromCfg(123101095)
				local var_382_10 = arg_379_1:FormatText(var_382_9.content)

				arg_379_1.text_.text = var_382_10

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_11 = 5
				local var_382_12 = utf8.len(var_382_10)
				local var_382_13 = var_382_11 <= 0 and var_382_7 or var_382_7 * (var_382_12 / var_382_11)

				if var_382_13 > 0 and var_382_7 < var_382_13 then
					arg_379_1.talkMaxDuration = var_382_13

					if var_382_13 + var_382_6 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_13 + var_382_6
					end
				end

				arg_379_1.text_.text = var_382_10
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101095", "story_v_out_123101.awb") ~= 0 then
					local var_382_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101095", "story_v_out_123101.awb") / 1000

					if var_382_14 + var_382_6 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_14 + var_382_6
					end

					if var_382_9.prefab_name ~= "" and arg_379_1.actors_[var_382_9.prefab_name] ~= nil then
						local var_382_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_9.prefab_name].transform, "story_v_out_123101", "123101095", "story_v_out_123101.awb")

						arg_379_1:RecordAudio("123101095", var_382_15)
						arg_379_1:RecordAudio("123101095", var_382_15)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_123101", "123101095", "story_v_out_123101.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_123101", "123101095", "story_v_out_123101.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_16 = math.max(var_382_7, arg_379_1.talkMaxDuration)

			if var_382_6 <= arg_379_1.time_ and arg_379_1.time_ < var_382_6 + var_382_16 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_6) / var_382_16

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_6 + var_382_16 and arg_379_1.time_ < var_382_6 + var_382_16 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play123101096 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 123101096
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play123101097(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1093ui_story"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and arg_383_1.var_.characterEffect1093ui_story == nil then
				arg_383_1.var_.characterEffect1093ui_story = var_386_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_2 = 0.200000002980232

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.characterEffect1093ui_story then
					local var_386_4 = Mathf.Lerp(0, 0.5, var_386_3)

					arg_383_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_383_1.var_.characterEffect1093ui_story.fillRatio = var_386_4
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and arg_383_1.var_.characterEffect1093ui_story then
				local var_386_5 = 0.5

				arg_383_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_383_1.var_.characterEffect1093ui_story.fillRatio = var_386_5
			end

			local var_386_6 = 0
			local var_386_7 = 1.075

			if var_386_6 < arg_383_1.time_ and arg_383_1.time_ <= var_386_6 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_8 = arg_383_1:FormatText(StoryNameCfg[7].name)

				arg_383_1.leftNameTxt_.text = var_386_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_9 = arg_383_1:GetWordFromCfg(123101096)
				local var_386_10 = arg_383_1:FormatText(var_386_9.content)

				arg_383_1.text_.text = var_386_10

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_11 = 43
				local var_386_12 = utf8.len(var_386_10)
				local var_386_13 = var_386_11 <= 0 and var_386_7 or var_386_7 * (var_386_12 / var_386_11)

				if var_386_13 > 0 and var_386_7 < var_386_13 then
					arg_383_1.talkMaxDuration = var_386_13

					if var_386_13 + var_386_6 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_13 + var_386_6
					end
				end

				arg_383_1.text_.text = var_386_10
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_14 = math.max(var_386_7, arg_383_1.talkMaxDuration)

			if var_386_6 <= arg_383_1.time_ and arg_383_1.time_ < var_386_6 + var_386_14 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_6) / var_386_14

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_6 + var_386_14 and arg_383_1.time_ < var_386_6 + var_386_14 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play123101097 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 123101097
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play123101098(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.625

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, false)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_2 = arg_387_1:GetWordFromCfg(123101097)
				local var_390_3 = arg_387_1:FormatText(var_390_2.content)

				arg_387_1.text_.text = var_390_3

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_4 = 25
				local var_390_5 = utf8.len(var_390_3)
				local var_390_6 = var_390_4 <= 0 and var_390_1 or var_390_1 * (var_390_5 / var_390_4)

				if var_390_6 > 0 and var_390_1 < var_390_6 then
					arg_387_1.talkMaxDuration = var_390_6

					if var_390_6 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_6 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_3
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_7 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_7 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_7

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_7 and arg_387_1.time_ < var_390_0 + var_390_7 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play123101098 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 123101098
		arg_391_1.duration_ = 5.833

		local var_391_0 = {
			zh = 5.2,
			ja = 5.833
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
				arg_391_0:Play123101099(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1093ui_story"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 and arg_391_1.var_.characterEffect1093ui_story == nil then
				arg_391_1.var_.characterEffect1093ui_story = var_394_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_2 = 0.200000002980232

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2

				if arg_391_1.var_.characterEffect1093ui_story then
					arg_391_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 and arg_391_1.var_.characterEffect1093ui_story then
				arg_391_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_394_4 = 0

			if var_394_4 < arg_391_1.time_ and arg_391_1.time_ <= var_394_4 + arg_394_0 then
				arg_391_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_394_5 = 0

			if var_394_5 < arg_391_1.time_ and arg_391_1.time_ <= var_394_5 + arg_394_0 then
				arg_391_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_394_6 = 0
			local var_394_7 = 0.65

			if var_394_6 < arg_391_1.time_ and arg_391_1.time_ <= var_394_6 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_8 = arg_391_1:FormatText(StoryNameCfg[73].name)

				arg_391_1.leftNameTxt_.text = var_394_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_9 = arg_391_1:GetWordFromCfg(123101098)
				local var_394_10 = arg_391_1:FormatText(var_394_9.content)

				arg_391_1.text_.text = var_394_10

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_11 = 26
				local var_394_12 = utf8.len(var_394_10)
				local var_394_13 = var_394_11 <= 0 and var_394_7 or var_394_7 * (var_394_12 / var_394_11)

				if var_394_13 > 0 and var_394_7 < var_394_13 then
					arg_391_1.talkMaxDuration = var_394_13

					if var_394_13 + var_394_6 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_13 + var_394_6
					end
				end

				arg_391_1.text_.text = var_394_10
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101098", "story_v_out_123101.awb") ~= 0 then
					local var_394_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101098", "story_v_out_123101.awb") / 1000

					if var_394_14 + var_394_6 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_14 + var_394_6
					end

					if var_394_9.prefab_name ~= "" and arg_391_1.actors_[var_394_9.prefab_name] ~= nil then
						local var_394_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_9.prefab_name].transform, "story_v_out_123101", "123101098", "story_v_out_123101.awb")

						arg_391_1:RecordAudio("123101098", var_394_15)
						arg_391_1:RecordAudio("123101098", var_394_15)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_123101", "123101098", "story_v_out_123101.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_123101", "123101098", "story_v_out_123101.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_16 = math.max(var_394_7, arg_391_1.talkMaxDuration)

			if var_394_6 <= arg_391_1.time_ and arg_391_1.time_ < var_394_6 + var_394_16 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_6) / var_394_16

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_6 + var_394_16 and arg_391_1.time_ < var_394_6 + var_394_16 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play123101099 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 123101099
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play123101100(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1093ui_story"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and arg_395_1.var_.characterEffect1093ui_story == nil then
				arg_395_1.var_.characterEffect1093ui_story = var_398_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_2 = 0.200000002980232

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.characterEffect1093ui_story then
					local var_398_4 = Mathf.Lerp(0, 0.5, var_398_3)

					arg_395_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1093ui_story.fillRatio = var_398_4
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and arg_395_1.var_.characterEffect1093ui_story then
				local var_398_5 = 0.5

				arg_395_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1093ui_story.fillRatio = var_398_5
			end

			local var_398_6 = 0
			local var_398_7 = 1

			if var_398_6 < arg_395_1.time_ and arg_395_1.time_ <= var_398_6 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, false)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_8 = arg_395_1:GetWordFromCfg(123101099)
				local var_398_9 = arg_395_1:FormatText(var_398_8.content)

				arg_395_1.text_.text = var_398_9

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_10 = 40
				local var_398_11 = utf8.len(var_398_9)
				local var_398_12 = var_398_10 <= 0 and var_398_7 or var_398_7 * (var_398_11 / var_398_10)

				if var_398_12 > 0 and var_398_7 < var_398_12 then
					arg_395_1.talkMaxDuration = var_398_12

					if var_398_12 + var_398_6 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_12 + var_398_6
					end
				end

				arg_395_1.text_.text = var_398_9
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_13 = math.max(var_398_7, arg_395_1.talkMaxDuration)

			if var_398_6 <= arg_395_1.time_ and arg_395_1.time_ < var_398_6 + var_398_13 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_6) / var_398_13

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_6 + var_398_13 and arg_395_1.time_ < var_398_6 + var_398_13 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play123101100 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 123101100
		arg_399_1.duration_ = 8

		local var_399_0 = {
			zh = 5.2,
			ja = 8
		}
		local var_399_1 = manager.audio:GetLocalizationFlag()

		if var_399_0[var_399_1] ~= nil then
			arg_399_1.duration_ = var_399_0[var_399_1]
		end

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play123101101(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1055ui_story"].transform
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 then
				arg_399_1.var_.moveOldPos1055ui_story = var_402_0.localPosition
			end

			local var_402_2 = 0.001

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2
				local var_402_4 = Vector3.New(0, -0.965, -6.2)

				var_402_0.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos1055ui_story, var_402_4, var_402_3)

				local var_402_5 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_5.x, var_402_5.y, var_402_5.z)

				local var_402_6 = var_402_0.localEulerAngles

				var_402_6.z = 0
				var_402_6.x = 0
				var_402_0.localEulerAngles = var_402_6
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 then
				var_402_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_402_7 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_7.x, var_402_7.y, var_402_7.z)

				local var_402_8 = var_402_0.localEulerAngles

				var_402_8.z = 0
				var_402_8.x = 0
				var_402_0.localEulerAngles = var_402_8
			end

			local var_402_9 = arg_399_1.actors_["1055ui_story"]
			local var_402_10 = 0

			if var_402_10 < arg_399_1.time_ and arg_399_1.time_ <= var_402_10 + arg_402_0 and arg_399_1.var_.characterEffect1055ui_story == nil then
				arg_399_1.var_.characterEffect1055ui_story = var_402_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_11 = 0.200000002980232

			if var_402_10 <= arg_399_1.time_ and arg_399_1.time_ < var_402_10 + var_402_11 then
				local var_402_12 = (arg_399_1.time_ - var_402_10) / var_402_11

				if arg_399_1.var_.characterEffect1055ui_story then
					arg_399_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_10 + var_402_11 and arg_399_1.time_ < var_402_10 + var_402_11 + arg_402_0 and arg_399_1.var_.characterEffect1055ui_story then
				arg_399_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_402_13 = 0

			if var_402_13 < arg_399_1.time_ and arg_399_1.time_ <= var_402_13 + arg_402_0 then
				arg_399_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_402_14 = 0

			if var_402_14 < arg_399_1.time_ and arg_399_1.time_ <= var_402_14 + arg_402_0 then
				arg_399_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_402_15 = arg_399_1.actors_["1093ui_story"].transform
			local var_402_16 = 0

			if var_402_16 < arg_399_1.time_ and arg_399_1.time_ <= var_402_16 + arg_402_0 then
				arg_399_1.var_.moveOldPos1093ui_story = var_402_15.localPosition
			end

			local var_402_17 = 0.001

			if var_402_16 <= arg_399_1.time_ and arg_399_1.time_ < var_402_16 + var_402_17 then
				local var_402_18 = (arg_399_1.time_ - var_402_16) / var_402_17
				local var_402_19 = Vector3.New(0, 100, 0)

				var_402_15.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos1093ui_story, var_402_19, var_402_18)

				local var_402_20 = manager.ui.mainCamera.transform.position - var_402_15.position

				var_402_15.forward = Vector3.New(var_402_20.x, var_402_20.y, var_402_20.z)

				local var_402_21 = var_402_15.localEulerAngles

				var_402_21.z = 0
				var_402_21.x = 0
				var_402_15.localEulerAngles = var_402_21
			end

			if arg_399_1.time_ >= var_402_16 + var_402_17 and arg_399_1.time_ < var_402_16 + var_402_17 + arg_402_0 then
				var_402_15.localPosition = Vector3.New(0, 100, 0)

				local var_402_22 = manager.ui.mainCamera.transform.position - var_402_15.position

				var_402_15.forward = Vector3.New(var_402_22.x, var_402_22.y, var_402_22.z)

				local var_402_23 = var_402_15.localEulerAngles

				var_402_23.z = 0
				var_402_23.x = 0
				var_402_15.localEulerAngles = var_402_23
			end

			local var_402_24 = 0
			local var_402_25 = 0.6

			if var_402_24 < arg_399_1.time_ and arg_399_1.time_ <= var_402_24 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_26 = arg_399_1:FormatText(StoryNameCfg[481].name)

				arg_399_1.leftNameTxt_.text = var_402_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_27 = arg_399_1:GetWordFromCfg(123101100)
				local var_402_28 = arg_399_1:FormatText(var_402_27.content)

				arg_399_1.text_.text = var_402_28

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_29 = 24
				local var_402_30 = utf8.len(var_402_28)
				local var_402_31 = var_402_29 <= 0 and var_402_25 or var_402_25 * (var_402_30 / var_402_29)

				if var_402_31 > 0 and var_402_25 < var_402_31 then
					arg_399_1.talkMaxDuration = var_402_31

					if var_402_31 + var_402_24 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_31 + var_402_24
					end
				end

				arg_399_1.text_.text = var_402_28
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101100", "story_v_out_123101.awb") ~= 0 then
					local var_402_32 = manager.audio:GetVoiceLength("story_v_out_123101", "123101100", "story_v_out_123101.awb") / 1000

					if var_402_32 + var_402_24 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_32 + var_402_24
					end

					if var_402_27.prefab_name ~= "" and arg_399_1.actors_[var_402_27.prefab_name] ~= nil then
						local var_402_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_27.prefab_name].transform, "story_v_out_123101", "123101100", "story_v_out_123101.awb")

						arg_399_1:RecordAudio("123101100", var_402_33)
						arg_399_1:RecordAudio("123101100", var_402_33)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_123101", "123101100", "story_v_out_123101.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_123101", "123101100", "story_v_out_123101.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_34 = math.max(var_402_25, arg_399_1.talkMaxDuration)

			if var_402_24 <= arg_399_1.time_ and arg_399_1.time_ < var_402_24 + var_402_34 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_24) / var_402_34

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_24 + var_402_34 and arg_399_1.time_ < var_402_24 + var_402_34 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play123101101 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 123101101
		arg_403_1.duration_ = 3.7

		local var_403_0 = {
			zh = 3.366,
			ja = 3.7
		}
		local var_403_1 = manager.audio:GetLocalizationFlag()

		if var_403_0[var_403_1] ~= nil then
			arg_403_1.duration_ = var_403_0[var_403_1]
		end

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play123101102(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1093ui_story"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos1093ui_story = var_406_0.localPosition
			end

			local var_406_2 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2
				local var_406_4 = Vector3.New(0, -1.11, -5.88)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1093ui_story, var_406_4, var_406_3)

				local var_406_5 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_5.x, var_406_5.y, var_406_5.z)

				local var_406_6 = var_406_0.localEulerAngles

				var_406_6.z = 0
				var_406_6.x = 0
				var_406_0.localEulerAngles = var_406_6
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 then
				var_406_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_406_7 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_7.x, var_406_7.y, var_406_7.z)

				local var_406_8 = var_406_0.localEulerAngles

				var_406_8.z = 0
				var_406_8.x = 0
				var_406_0.localEulerAngles = var_406_8
			end

			local var_406_9 = arg_403_1.actors_["1093ui_story"]
			local var_406_10 = 0

			if var_406_10 < arg_403_1.time_ and arg_403_1.time_ <= var_406_10 + arg_406_0 and arg_403_1.var_.characterEffect1093ui_story == nil then
				arg_403_1.var_.characterEffect1093ui_story = var_406_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_11 = 0.200000002980232

			if var_406_10 <= arg_403_1.time_ and arg_403_1.time_ < var_406_10 + var_406_11 then
				local var_406_12 = (arg_403_1.time_ - var_406_10) / var_406_11

				if arg_403_1.var_.characterEffect1093ui_story then
					arg_403_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_403_1.time_ >= var_406_10 + var_406_11 and arg_403_1.time_ < var_406_10 + var_406_11 + arg_406_0 and arg_403_1.var_.characterEffect1093ui_story then
				arg_403_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_406_13 = 0

			if var_406_13 < arg_403_1.time_ and arg_403_1.time_ <= var_406_13 + arg_406_0 then
				arg_403_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action2_1")
			end

			local var_406_14 = 0

			if var_406_14 < arg_403_1.time_ and arg_403_1.time_ <= var_406_14 + arg_406_0 then
				arg_403_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_406_15 = arg_403_1.actors_["1055ui_story"]
			local var_406_16 = 0

			if var_406_16 < arg_403_1.time_ and arg_403_1.time_ <= var_406_16 + arg_406_0 and arg_403_1.var_.characterEffect1055ui_story == nil then
				arg_403_1.var_.characterEffect1055ui_story = var_406_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_17 = 0.200000002980232

			if var_406_16 <= arg_403_1.time_ and arg_403_1.time_ < var_406_16 + var_406_17 then
				local var_406_18 = (arg_403_1.time_ - var_406_16) / var_406_17

				if arg_403_1.var_.characterEffect1055ui_story then
					local var_406_19 = Mathf.Lerp(0, 0.5, var_406_18)

					arg_403_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1055ui_story.fillRatio = var_406_19
				end
			end

			if arg_403_1.time_ >= var_406_16 + var_406_17 and arg_403_1.time_ < var_406_16 + var_406_17 + arg_406_0 and arg_403_1.var_.characterEffect1055ui_story then
				local var_406_20 = 0.5

				arg_403_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1055ui_story.fillRatio = var_406_20
			end

			local var_406_21 = arg_403_1.actors_["1055ui_story"].transform
			local var_406_22 = 0

			if var_406_22 < arg_403_1.time_ and arg_403_1.time_ <= var_406_22 + arg_406_0 then
				arg_403_1.var_.moveOldPos1055ui_story = var_406_21.localPosition
			end

			local var_406_23 = 0.001

			if var_406_22 <= arg_403_1.time_ and arg_403_1.time_ < var_406_22 + var_406_23 then
				local var_406_24 = (arg_403_1.time_ - var_406_22) / var_406_23
				local var_406_25 = Vector3.New(0, 100, 0)

				var_406_21.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1055ui_story, var_406_25, var_406_24)

				local var_406_26 = manager.ui.mainCamera.transform.position - var_406_21.position

				var_406_21.forward = Vector3.New(var_406_26.x, var_406_26.y, var_406_26.z)

				local var_406_27 = var_406_21.localEulerAngles

				var_406_27.z = 0
				var_406_27.x = 0
				var_406_21.localEulerAngles = var_406_27
			end

			if arg_403_1.time_ >= var_406_22 + var_406_23 and arg_403_1.time_ < var_406_22 + var_406_23 + arg_406_0 then
				var_406_21.localPosition = Vector3.New(0, 100, 0)

				local var_406_28 = manager.ui.mainCamera.transform.position - var_406_21.position

				var_406_21.forward = Vector3.New(var_406_28.x, var_406_28.y, var_406_28.z)

				local var_406_29 = var_406_21.localEulerAngles

				var_406_29.z = 0
				var_406_29.x = 0
				var_406_21.localEulerAngles = var_406_29
			end

			local var_406_30 = 0
			local var_406_31 = 0.4

			if var_406_30 < arg_403_1.time_ and arg_403_1.time_ <= var_406_30 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_32 = arg_403_1:FormatText(StoryNameCfg[73].name)

				arg_403_1.leftNameTxt_.text = var_406_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_33 = arg_403_1:GetWordFromCfg(123101101)
				local var_406_34 = arg_403_1:FormatText(var_406_33.content)

				arg_403_1.text_.text = var_406_34

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_35 = 16
				local var_406_36 = utf8.len(var_406_34)
				local var_406_37 = var_406_35 <= 0 and var_406_31 or var_406_31 * (var_406_36 / var_406_35)

				if var_406_37 > 0 and var_406_31 < var_406_37 then
					arg_403_1.talkMaxDuration = var_406_37

					if var_406_37 + var_406_30 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_37 + var_406_30
					end
				end

				arg_403_1.text_.text = var_406_34
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101101", "story_v_out_123101.awb") ~= 0 then
					local var_406_38 = manager.audio:GetVoiceLength("story_v_out_123101", "123101101", "story_v_out_123101.awb") / 1000

					if var_406_38 + var_406_30 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_38 + var_406_30
					end

					if var_406_33.prefab_name ~= "" and arg_403_1.actors_[var_406_33.prefab_name] ~= nil then
						local var_406_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_33.prefab_name].transform, "story_v_out_123101", "123101101", "story_v_out_123101.awb")

						arg_403_1:RecordAudio("123101101", var_406_39)
						arg_403_1:RecordAudio("123101101", var_406_39)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_123101", "123101101", "story_v_out_123101.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_123101", "123101101", "story_v_out_123101.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_40 = math.max(var_406_31, arg_403_1.talkMaxDuration)

			if var_406_30 <= arg_403_1.time_ and arg_403_1.time_ < var_406_30 + var_406_40 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_30) / var_406_40

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_30 + var_406_40 and arg_403_1.time_ < var_406_30 + var_406_40 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play123101102 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 123101102
		arg_407_1.duration_ = 10.1

		local var_407_0 = {
			zh = 6.766,
			ja = 10.1
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
				arg_407_0:Play123101103(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1093ui_story"]
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 and arg_407_1.var_.characterEffect1093ui_story == nil then
				arg_407_1.var_.characterEffect1093ui_story = var_410_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_2 = 0.200000002980232

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2

				if arg_407_1.var_.characterEffect1093ui_story then
					local var_410_4 = Mathf.Lerp(0, 0.5, var_410_3)

					arg_407_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_407_1.var_.characterEffect1093ui_story.fillRatio = var_410_4
				end
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 and arg_407_1.var_.characterEffect1093ui_story then
				local var_410_5 = 0.5

				arg_407_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_407_1.var_.characterEffect1093ui_story.fillRatio = var_410_5
			end

			local var_410_6 = arg_407_1.actors_["1093ui_story"].transform
			local var_410_7 = 0

			if var_410_7 < arg_407_1.time_ and arg_407_1.time_ <= var_410_7 + arg_410_0 then
				arg_407_1.var_.moveOldPos1093ui_story = var_410_6.localPosition
			end

			local var_410_8 = 0.001

			if var_410_7 <= arg_407_1.time_ and arg_407_1.time_ < var_410_7 + var_410_8 then
				local var_410_9 = (arg_407_1.time_ - var_410_7) / var_410_8
				local var_410_10 = Vector3.New(0, 100, 0)

				var_410_6.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1093ui_story, var_410_10, var_410_9)

				local var_410_11 = manager.ui.mainCamera.transform.position - var_410_6.position

				var_410_6.forward = Vector3.New(var_410_11.x, var_410_11.y, var_410_11.z)

				local var_410_12 = var_410_6.localEulerAngles

				var_410_12.z = 0
				var_410_12.x = 0
				var_410_6.localEulerAngles = var_410_12
			end

			if arg_407_1.time_ >= var_410_7 + var_410_8 and arg_407_1.time_ < var_410_7 + var_410_8 + arg_410_0 then
				var_410_6.localPosition = Vector3.New(0, 100, 0)

				local var_410_13 = manager.ui.mainCamera.transform.position - var_410_6.position

				var_410_6.forward = Vector3.New(var_410_13.x, var_410_13.y, var_410_13.z)

				local var_410_14 = var_410_6.localEulerAngles

				var_410_14.z = 0
				var_410_14.x = 0
				var_410_6.localEulerAngles = var_410_14
			end

			local var_410_15 = 0
			local var_410_16 = 0.525

			if var_410_15 < arg_407_1.time_ and arg_407_1.time_ <= var_410_15 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_17 = arg_407_1:FormatText(StoryNameCfg[485].name)

				arg_407_1.leftNameTxt_.text = var_410_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, true)
				arg_407_1.iconController_:SetSelectedState("hero")

				arg_407_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_18 = arg_407_1:GetWordFromCfg(123101102)
				local var_410_19 = arg_407_1:FormatText(var_410_18.content)

				arg_407_1.text_.text = var_410_19

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_20 = 21
				local var_410_21 = utf8.len(var_410_19)
				local var_410_22 = var_410_20 <= 0 and var_410_16 or var_410_16 * (var_410_21 / var_410_20)

				if var_410_22 > 0 and var_410_16 < var_410_22 then
					arg_407_1.talkMaxDuration = var_410_22

					if var_410_22 + var_410_15 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_22 + var_410_15
					end
				end

				arg_407_1.text_.text = var_410_19
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101102", "story_v_out_123101.awb") ~= 0 then
					local var_410_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101102", "story_v_out_123101.awb") / 1000

					if var_410_23 + var_410_15 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_23 + var_410_15
					end

					if var_410_18.prefab_name ~= "" and arg_407_1.actors_[var_410_18.prefab_name] ~= nil then
						local var_410_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_18.prefab_name].transform, "story_v_out_123101", "123101102", "story_v_out_123101.awb")

						arg_407_1:RecordAudio("123101102", var_410_24)
						arg_407_1:RecordAudio("123101102", var_410_24)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_123101", "123101102", "story_v_out_123101.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_123101", "123101102", "story_v_out_123101.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_25 = math.max(var_410_16, arg_407_1.talkMaxDuration)

			if var_410_15 <= arg_407_1.time_ and arg_407_1.time_ < var_410_15 + var_410_25 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_15) / var_410_25

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_15 + var_410_25 and arg_407_1.time_ < var_410_15 + var_410_25 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play123101103 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 123101103
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play123101104(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 0.8

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

				local var_414_2 = arg_411_1:GetWordFromCfg(123101103)
				local var_414_3 = arg_411_1:FormatText(var_414_2.content)

				arg_411_1.text_.text = var_414_3

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_4 = 32
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
	Play123101104 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 123101104
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play123101105(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = 0
			local var_418_1 = 0.525

			if var_418_0 < arg_415_1.time_ and arg_415_1.time_ <= var_418_0 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_2 = arg_415_1:FormatText(StoryNameCfg[7].name)

				arg_415_1.leftNameTxt_.text = var_418_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_3 = arg_415_1:GetWordFromCfg(123101104)
				local var_418_4 = arg_415_1:FormatText(var_418_3.content)

				arg_415_1.text_.text = var_418_4

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_5 = 21
				local var_418_6 = utf8.len(var_418_4)
				local var_418_7 = var_418_5 <= 0 and var_418_1 or var_418_1 * (var_418_6 / var_418_5)

				if var_418_7 > 0 and var_418_1 < var_418_7 then
					arg_415_1.talkMaxDuration = var_418_7

					if var_418_7 + var_418_0 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_7 + var_418_0
					end
				end

				arg_415_1.text_.text = var_418_4
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_8 = math.max(var_418_1, arg_415_1.talkMaxDuration)

			if var_418_0 <= arg_415_1.time_ and arg_415_1.time_ < var_418_0 + var_418_8 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_0) / var_418_8

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_0 + var_418_8 and arg_415_1.time_ < var_418_0 + var_418_8 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play123101105 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 123101105
		arg_419_1.duration_ = 10.066

		local var_419_0 = {
			zh = 5.533,
			ja = 10.066
		}
		local var_419_1 = manager.audio:GetLocalizationFlag()

		if var_419_0[var_419_1] ~= nil then
			arg_419_1.duration_ = var_419_0[var_419_1]
		end

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play123101106(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1055ui_story"].transform
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 then
				arg_419_1.var_.moveOldPos1055ui_story = var_422_0.localPosition
			end

			local var_422_2 = 0.001

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2
				local var_422_4 = Vector3.New(0, -0.965, -6.2)

				var_422_0.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPos1055ui_story, var_422_4, var_422_3)

				local var_422_5 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_5.x, var_422_5.y, var_422_5.z)

				local var_422_6 = var_422_0.localEulerAngles

				var_422_6.z = 0
				var_422_6.x = 0
				var_422_0.localEulerAngles = var_422_6
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 then
				var_422_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_422_7 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_7.x, var_422_7.y, var_422_7.z)

				local var_422_8 = var_422_0.localEulerAngles

				var_422_8.z = 0
				var_422_8.x = 0
				var_422_0.localEulerAngles = var_422_8
			end

			local var_422_9 = arg_419_1.actors_["1055ui_story"]
			local var_422_10 = 0

			if var_422_10 < arg_419_1.time_ and arg_419_1.time_ <= var_422_10 + arg_422_0 and arg_419_1.var_.characterEffect1055ui_story == nil then
				arg_419_1.var_.characterEffect1055ui_story = var_422_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_11 = 0.200000002980232

			if var_422_10 <= arg_419_1.time_ and arg_419_1.time_ < var_422_10 + var_422_11 then
				local var_422_12 = (arg_419_1.time_ - var_422_10) / var_422_11

				if arg_419_1.var_.characterEffect1055ui_story then
					arg_419_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_10 + var_422_11 and arg_419_1.time_ < var_422_10 + var_422_11 + arg_422_0 and arg_419_1.var_.characterEffect1055ui_story then
				arg_419_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_422_13 = 0

			if var_422_13 < arg_419_1.time_ and arg_419_1.time_ <= var_422_13 + arg_422_0 then
				arg_419_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action7_1")
			end

			local var_422_14 = 0

			if var_422_14 < arg_419_1.time_ and arg_419_1.time_ <= var_422_14 + arg_422_0 then
				arg_419_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_422_15 = 0
			local var_422_16 = 0.575

			if var_422_15 < arg_419_1.time_ and arg_419_1.time_ <= var_422_15 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_17 = arg_419_1:FormatText(StoryNameCfg[481].name)

				arg_419_1.leftNameTxt_.text = var_422_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_18 = arg_419_1:GetWordFromCfg(123101105)
				local var_422_19 = arg_419_1:FormatText(var_422_18.content)

				arg_419_1.text_.text = var_422_19

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_20 = 23
				local var_422_21 = utf8.len(var_422_19)
				local var_422_22 = var_422_20 <= 0 and var_422_16 or var_422_16 * (var_422_21 / var_422_20)

				if var_422_22 > 0 and var_422_16 < var_422_22 then
					arg_419_1.talkMaxDuration = var_422_22

					if var_422_22 + var_422_15 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_22 + var_422_15
					end
				end

				arg_419_1.text_.text = var_422_19
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101105", "story_v_out_123101.awb") ~= 0 then
					local var_422_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101105", "story_v_out_123101.awb") / 1000

					if var_422_23 + var_422_15 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_23 + var_422_15
					end

					if var_422_18.prefab_name ~= "" and arg_419_1.actors_[var_422_18.prefab_name] ~= nil then
						local var_422_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_18.prefab_name].transform, "story_v_out_123101", "123101105", "story_v_out_123101.awb")

						arg_419_1:RecordAudio("123101105", var_422_24)
						arg_419_1:RecordAudio("123101105", var_422_24)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_123101", "123101105", "story_v_out_123101.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_123101", "123101105", "story_v_out_123101.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_25 = math.max(var_422_16, arg_419_1.talkMaxDuration)

			if var_422_15 <= arg_419_1.time_ and arg_419_1.time_ < var_422_15 + var_422_25 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_15) / var_422_25

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_15 + var_422_25 and arg_419_1.time_ < var_422_15 + var_422_25 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play123101106 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 123101106
		arg_423_1.duration_ = 1.2

		local var_423_0 = {
			zh = 0.999999999999,
			ja = 1.2
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
				arg_423_0:Play123101107(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["1055ui_story"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and arg_423_1.var_.characterEffect1055ui_story == nil then
				arg_423_1.var_.characterEffect1055ui_story = var_426_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_2 = 0.200000002980232

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.characterEffect1055ui_story then
					local var_426_4 = Mathf.Lerp(0, 0.5, var_426_3)

					arg_423_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_423_1.var_.characterEffect1055ui_story.fillRatio = var_426_4
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and arg_423_1.var_.characterEffect1055ui_story then
				local var_426_5 = 0.5

				arg_423_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_423_1.var_.characterEffect1055ui_story.fillRatio = var_426_5
			end

			local var_426_6 = 0
			local var_426_7 = 0.075

			if var_426_6 < arg_423_1.time_ and arg_423_1.time_ <= var_426_6 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_8 = arg_423_1:FormatText(StoryNameCfg[485].name)

				arg_423_1.leftNameTxt_.text = var_426_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, true)
				arg_423_1.iconController_:SetSelectedState("hero")

				arg_423_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_9 = arg_423_1:GetWordFromCfg(123101106)
				local var_426_10 = arg_423_1:FormatText(var_426_9.content)

				arg_423_1.text_.text = var_426_10

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_11 = 3
				local var_426_12 = utf8.len(var_426_10)
				local var_426_13 = var_426_11 <= 0 and var_426_7 or var_426_7 * (var_426_12 / var_426_11)

				if var_426_13 > 0 and var_426_7 < var_426_13 then
					arg_423_1.talkMaxDuration = var_426_13

					if var_426_13 + var_426_6 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_13 + var_426_6
					end
				end

				arg_423_1.text_.text = var_426_10
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101106", "story_v_out_123101.awb") ~= 0 then
					local var_426_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101106", "story_v_out_123101.awb") / 1000

					if var_426_14 + var_426_6 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_14 + var_426_6
					end

					if var_426_9.prefab_name ~= "" and arg_423_1.actors_[var_426_9.prefab_name] ~= nil then
						local var_426_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_9.prefab_name].transform, "story_v_out_123101", "123101106", "story_v_out_123101.awb")

						arg_423_1:RecordAudio("123101106", var_426_15)
						arg_423_1:RecordAudio("123101106", var_426_15)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_123101", "123101106", "story_v_out_123101.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_123101", "123101106", "story_v_out_123101.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_16 = math.max(var_426_7, arg_423_1.talkMaxDuration)

			if var_426_6 <= arg_423_1.time_ and arg_423_1.time_ < var_426_6 + var_426_16 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_6) / var_426_16

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_6 + var_426_16 and arg_423_1.time_ < var_426_6 + var_426_16 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play123101107 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 123101107
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play123101108(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 0.725

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, false)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_2 = arg_427_1:GetWordFromCfg(123101107)
				local var_430_3 = arg_427_1:FormatText(var_430_2.content)

				arg_427_1.text_.text = var_430_3

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_4 = 29
				local var_430_5 = utf8.len(var_430_3)
				local var_430_6 = var_430_4 <= 0 and var_430_1 or var_430_1 * (var_430_5 / var_430_4)

				if var_430_6 > 0 and var_430_1 < var_430_6 then
					arg_427_1.talkMaxDuration = var_430_6

					if var_430_6 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_6 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_3
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_7 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_7 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_7

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_7 and arg_427_1.time_ < var_430_0 + var_430_7 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play123101108 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 123101108
		arg_431_1.duration_ = 6.666

		local var_431_0 = {
			zh = 4,
			ja = 6.666
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
				arg_431_0:Play123101109(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1055ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and arg_431_1.var_.characterEffect1055ui_story == nil then
				arg_431_1.var_.characterEffect1055ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.200000002980232

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect1055ui_story then
					arg_431_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and arg_431_1.var_.characterEffect1055ui_story then
				arg_431_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_434_4 = 0

			if var_434_4 < arg_431_1.time_ and arg_431_1.time_ <= var_434_4 + arg_434_0 then
				arg_431_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action7_2")
			end

			local var_434_5 = 0

			if var_434_5 < arg_431_1.time_ and arg_431_1.time_ <= var_434_5 + arg_434_0 then
				arg_431_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_434_6 = 0
			local var_434_7 = 0.4

			if var_434_6 < arg_431_1.time_ and arg_431_1.time_ <= var_434_6 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_8 = arg_431_1:FormatText(StoryNameCfg[481].name)

				arg_431_1.leftNameTxt_.text = var_434_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_9 = arg_431_1:GetWordFromCfg(123101108)
				local var_434_10 = arg_431_1:FormatText(var_434_9.content)

				arg_431_1.text_.text = var_434_10

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_11 = 16
				local var_434_12 = utf8.len(var_434_10)
				local var_434_13 = var_434_11 <= 0 and var_434_7 or var_434_7 * (var_434_12 / var_434_11)

				if var_434_13 > 0 and var_434_7 < var_434_13 then
					arg_431_1.talkMaxDuration = var_434_13

					if var_434_13 + var_434_6 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_13 + var_434_6
					end
				end

				arg_431_1.text_.text = var_434_10
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101108", "story_v_out_123101.awb") ~= 0 then
					local var_434_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101108", "story_v_out_123101.awb") / 1000

					if var_434_14 + var_434_6 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_14 + var_434_6
					end

					if var_434_9.prefab_name ~= "" and arg_431_1.actors_[var_434_9.prefab_name] ~= nil then
						local var_434_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_9.prefab_name].transform, "story_v_out_123101", "123101108", "story_v_out_123101.awb")

						arg_431_1:RecordAudio("123101108", var_434_15)
						arg_431_1:RecordAudio("123101108", var_434_15)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_123101", "123101108", "story_v_out_123101.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_123101", "123101108", "story_v_out_123101.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_16 = math.max(var_434_7, arg_431_1.talkMaxDuration)

			if var_434_6 <= arg_431_1.time_ and arg_431_1.time_ < var_434_6 + var_434_16 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_6) / var_434_16

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_6 + var_434_16 and arg_431_1.time_ < var_434_6 + var_434_16 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play123101109 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 123101109
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play123101110(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["1055ui_story"]
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 and arg_435_1.var_.characterEffect1055ui_story == nil then
				arg_435_1.var_.characterEffect1055ui_story = var_438_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_2 = 0.200000002980232

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2

				if arg_435_1.var_.characterEffect1055ui_story then
					local var_438_4 = Mathf.Lerp(0, 0.5, var_438_3)

					arg_435_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_435_1.var_.characterEffect1055ui_story.fillRatio = var_438_4
				end
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 and arg_435_1.var_.characterEffect1055ui_story then
				local var_438_5 = 0.5

				arg_435_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_435_1.var_.characterEffect1055ui_story.fillRatio = var_438_5
			end

			local var_438_6 = arg_435_1.actors_["1055ui_story"].transform
			local var_438_7 = 0

			if var_438_7 < arg_435_1.time_ and arg_435_1.time_ <= var_438_7 + arg_438_0 then
				arg_435_1.var_.moveOldPos1055ui_story = var_438_6.localPosition
			end

			local var_438_8 = 0.001

			if var_438_7 <= arg_435_1.time_ and arg_435_1.time_ < var_438_7 + var_438_8 then
				local var_438_9 = (arg_435_1.time_ - var_438_7) / var_438_8
				local var_438_10 = Vector3.New(0, 100, 0)

				var_438_6.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos1055ui_story, var_438_10, var_438_9)

				local var_438_11 = manager.ui.mainCamera.transform.position - var_438_6.position

				var_438_6.forward = Vector3.New(var_438_11.x, var_438_11.y, var_438_11.z)

				local var_438_12 = var_438_6.localEulerAngles

				var_438_12.z = 0
				var_438_12.x = 0
				var_438_6.localEulerAngles = var_438_12
			end

			if arg_435_1.time_ >= var_438_7 + var_438_8 and arg_435_1.time_ < var_438_7 + var_438_8 + arg_438_0 then
				var_438_6.localPosition = Vector3.New(0, 100, 0)

				local var_438_13 = manager.ui.mainCamera.transform.position - var_438_6.position

				var_438_6.forward = Vector3.New(var_438_13.x, var_438_13.y, var_438_13.z)

				local var_438_14 = var_438_6.localEulerAngles

				var_438_14.z = 0
				var_438_14.x = 0
				var_438_6.localEulerAngles = var_438_14
			end

			local var_438_15 = 0
			local var_438_16 = 0.7

			if var_438_15 < arg_435_1.time_ and arg_435_1.time_ <= var_438_15 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_17 = arg_435_1:GetWordFromCfg(123101109)
				local var_438_18 = arg_435_1:FormatText(var_438_17.content)

				arg_435_1.text_.text = var_438_18

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_19 = 28
				local var_438_20 = utf8.len(var_438_18)
				local var_438_21 = var_438_19 <= 0 and var_438_16 or var_438_16 * (var_438_20 / var_438_19)

				if var_438_21 > 0 and var_438_16 < var_438_21 then
					arg_435_1.talkMaxDuration = var_438_21

					if var_438_21 + var_438_15 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_21 + var_438_15
					end
				end

				arg_435_1.text_.text = var_438_18
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_22 = math.max(var_438_16, arg_435_1.talkMaxDuration)

			if var_438_15 <= arg_435_1.time_ and arg_435_1.time_ < var_438_15 + var_438_22 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_15) / var_438_22

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_15 + var_438_22 and arg_435_1.time_ < var_438_15 + var_438_22 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play123101110 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 123101110
		arg_439_1.duration_ = 4.1

		local var_439_0 = {
			zh = 4.1,
			ja = 2.5
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
				arg_439_0:Play123101111(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1055ui_story"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and arg_439_1.var_.characterEffect1055ui_story == nil then
				arg_439_1.var_.characterEffect1055ui_story = var_442_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_2 = 0.200000002980232

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.characterEffect1055ui_story then
					local var_442_4 = Mathf.Lerp(0, 0.5, var_442_3)

					arg_439_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_439_1.var_.characterEffect1055ui_story.fillRatio = var_442_4
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and arg_439_1.var_.characterEffect1055ui_story then
				local var_442_5 = 0.5

				arg_439_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_439_1.var_.characterEffect1055ui_story.fillRatio = var_442_5
			end

			local var_442_6 = 0
			local var_442_7 = 0.15

			if var_442_6 < arg_439_1.time_ and arg_439_1.time_ <= var_442_6 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_8 = arg_439_1:FormatText(StoryNameCfg[485].name)

				arg_439_1.leftNameTxt_.text = var_442_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, true)
				arg_439_1.iconController_:SetSelectedState("hero")

				arg_439_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_9 = arg_439_1:GetWordFromCfg(123101110)
				local var_442_10 = arg_439_1:FormatText(var_442_9.content)

				arg_439_1.text_.text = var_442_10

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_11 = 6
				local var_442_12 = utf8.len(var_442_10)
				local var_442_13 = var_442_11 <= 0 and var_442_7 or var_442_7 * (var_442_12 / var_442_11)

				if var_442_13 > 0 and var_442_7 < var_442_13 then
					arg_439_1.talkMaxDuration = var_442_13

					if var_442_13 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_13 + var_442_6
					end
				end

				arg_439_1.text_.text = var_442_10
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101110", "story_v_out_123101.awb") ~= 0 then
					local var_442_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101110", "story_v_out_123101.awb") / 1000

					if var_442_14 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_14 + var_442_6
					end

					if var_442_9.prefab_name ~= "" and arg_439_1.actors_[var_442_9.prefab_name] ~= nil then
						local var_442_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_9.prefab_name].transform, "story_v_out_123101", "123101110", "story_v_out_123101.awb")

						arg_439_1:RecordAudio("123101110", var_442_15)
						arg_439_1:RecordAudio("123101110", var_442_15)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_123101", "123101110", "story_v_out_123101.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_123101", "123101110", "story_v_out_123101.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_16 = math.max(var_442_7, arg_439_1.talkMaxDuration)

			if var_442_6 <= arg_439_1.time_ and arg_439_1.time_ < var_442_6 + var_442_16 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_6) / var_442_16

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_6 + var_442_16 and arg_439_1.time_ < var_442_6 + var_442_16 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play123101111 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 123101111
		arg_443_1.duration_ = 9

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play123101112(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = "K05g"

			if arg_443_1.bgs_[var_446_0] == nil then
				local var_446_1 = Object.Instantiate(arg_443_1.paintGo_)

				var_446_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_446_0)
				var_446_1.name = var_446_0
				var_446_1.transform.parent = arg_443_1.stage_.transform
				var_446_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_443_1.bgs_[var_446_0] = var_446_1
			end

			local var_446_2 = 1.999999999999

			if var_446_2 < arg_443_1.time_ and arg_443_1.time_ <= var_446_2 + arg_446_0 then
				local var_446_3 = manager.ui.mainCamera.transform.localPosition
				local var_446_4 = Vector3.New(0, 0, 10) + Vector3.New(var_446_3.x, var_446_3.y, 0)
				local var_446_5 = arg_443_1.bgs_.K05g

				var_446_5.transform.localPosition = var_446_4
				var_446_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_446_6 = var_446_5:GetComponent("SpriteRenderer")

				if var_446_6 and var_446_6.sprite then
					local var_446_7 = (var_446_5.transform.localPosition - var_446_3).z
					local var_446_8 = manager.ui.mainCameraCom_
					local var_446_9 = 2 * var_446_7 * Mathf.Tan(var_446_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_446_10 = var_446_9 * var_446_8.aspect
					local var_446_11 = var_446_6.sprite.bounds.size.x
					local var_446_12 = var_446_6.sprite.bounds.size.y
					local var_446_13 = var_446_10 / var_446_11
					local var_446_14 = var_446_9 / var_446_12
					local var_446_15 = var_446_14 < var_446_13 and var_446_13 or var_446_14

					var_446_5.transform.localScale = Vector3.New(var_446_15, var_446_15, 0)
				end

				for iter_446_0, iter_446_1 in pairs(arg_443_1.bgs_) do
					if iter_446_0 ~= "K05g" then
						iter_446_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_446_16 = 0

			if var_446_16 < arg_443_1.time_ and arg_443_1.time_ <= var_446_16 + arg_446_0 then
				arg_443_1.mask_.enabled = true
				arg_443_1.mask_.raycastTarget = true

				arg_443_1:SetGaussion(false)
			end

			local var_446_17 = 2

			if var_446_16 <= arg_443_1.time_ and arg_443_1.time_ < var_446_16 + var_446_17 then
				local var_446_18 = (arg_443_1.time_ - var_446_16) / var_446_17
				local var_446_19 = Color.New(0, 0, 0)

				var_446_19.a = Mathf.Lerp(0, 1, var_446_18)
				arg_443_1.mask_.color = var_446_19
			end

			if arg_443_1.time_ >= var_446_16 + var_446_17 and arg_443_1.time_ < var_446_16 + var_446_17 + arg_446_0 then
				local var_446_20 = Color.New(0, 0, 0)

				var_446_20.a = 1
				arg_443_1.mask_.color = var_446_20
			end

			local var_446_21 = 2

			if var_446_21 < arg_443_1.time_ and arg_443_1.time_ <= var_446_21 + arg_446_0 then
				arg_443_1.mask_.enabled = true
				arg_443_1.mask_.raycastTarget = true

				arg_443_1:SetGaussion(false)
			end

			local var_446_22 = 2

			if var_446_21 <= arg_443_1.time_ and arg_443_1.time_ < var_446_21 + var_446_22 then
				local var_446_23 = (arg_443_1.time_ - var_446_21) / var_446_22
				local var_446_24 = Color.New(0, 0, 0)

				var_446_24.a = Mathf.Lerp(1, 0, var_446_23)
				arg_443_1.mask_.color = var_446_24
			end

			if arg_443_1.time_ >= var_446_21 + var_446_22 and arg_443_1.time_ < var_446_21 + var_446_22 + arg_446_0 then
				local var_446_25 = Color.New(0, 0, 0)
				local var_446_26 = 0

				arg_443_1.mask_.enabled = false
				var_446_25.a = var_446_26
				arg_443_1.mask_.color = var_446_25
			end

			if arg_443_1.frameCnt_ <= 1 then
				arg_443_1.dialog_:SetActive(false)
			end

			local var_446_27 = 4
			local var_446_28 = 0.85

			if var_446_27 < arg_443_1.time_ and arg_443_1.time_ <= var_446_27 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0

				arg_443_1.dialog_:SetActive(true)

				local var_446_29 = LeanTween.value(arg_443_1.dialog_, 0, 1, 0.3)

				var_446_29:setOnUpdate(LuaHelper.FloatAction(function(arg_447_0)
					arg_443_1.dialogCg_.alpha = arg_447_0
				end))
				var_446_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_443_1.dialog_)
					var_446_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_443_1.duration_ = arg_443_1.duration_ + 0.3

				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_30 = arg_443_1:GetWordFromCfg(123101111)
				local var_446_31 = arg_443_1:FormatText(var_446_30.content)

				arg_443_1.text_.text = var_446_31

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_32 = 34
				local var_446_33 = utf8.len(var_446_31)
				local var_446_34 = var_446_32 <= 0 and var_446_28 or var_446_28 * (var_446_33 / var_446_32)

				if var_446_34 > 0 and var_446_28 < var_446_34 then
					arg_443_1.talkMaxDuration = var_446_34
					var_446_27 = var_446_27 + 0.3

					if var_446_34 + var_446_27 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_34 + var_446_27
					end
				end

				arg_443_1.text_.text = var_446_31
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_35 = var_446_27 + 0.3
			local var_446_36 = math.max(var_446_28, arg_443_1.talkMaxDuration)

			if var_446_35 <= arg_443_1.time_ and arg_443_1.time_ < var_446_35 + var_446_36 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_35) / var_446_36

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_35 + var_446_36 and arg_443_1.time_ < var_446_35 + var_446_36 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play123101112 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 123101112
		arg_449_1.duration_ = 4.8

		local var_449_0 = {
			zh = 4.8,
			ja = 4
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
				arg_449_0:Play123101113(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["1055ui_story"].transform
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 then
				arg_449_1.var_.moveOldPos1055ui_story = var_452_0.localPosition
			end

			local var_452_2 = 0.001

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2
				local var_452_4 = Vector3.New(0, -0.965, -6.2)

				var_452_0.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos1055ui_story, var_452_4, var_452_3)

				local var_452_5 = manager.ui.mainCamera.transform.position - var_452_0.position

				var_452_0.forward = Vector3.New(var_452_5.x, var_452_5.y, var_452_5.z)

				local var_452_6 = var_452_0.localEulerAngles

				var_452_6.z = 0
				var_452_6.x = 0
				var_452_0.localEulerAngles = var_452_6
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 then
				var_452_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_452_7 = manager.ui.mainCamera.transform.position - var_452_0.position

				var_452_0.forward = Vector3.New(var_452_7.x, var_452_7.y, var_452_7.z)

				local var_452_8 = var_452_0.localEulerAngles

				var_452_8.z = 0
				var_452_8.x = 0
				var_452_0.localEulerAngles = var_452_8
			end

			local var_452_9 = arg_449_1.actors_["1055ui_story"]
			local var_452_10 = 0

			if var_452_10 < arg_449_1.time_ and arg_449_1.time_ <= var_452_10 + arg_452_0 and arg_449_1.var_.characterEffect1055ui_story == nil then
				arg_449_1.var_.characterEffect1055ui_story = var_452_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_11 = 0.200000002980232

			if var_452_10 <= arg_449_1.time_ and arg_449_1.time_ < var_452_10 + var_452_11 then
				local var_452_12 = (arg_449_1.time_ - var_452_10) / var_452_11

				if arg_449_1.var_.characterEffect1055ui_story then
					arg_449_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_449_1.time_ >= var_452_10 + var_452_11 and arg_449_1.time_ < var_452_10 + var_452_11 + arg_452_0 and arg_449_1.var_.characterEffect1055ui_story then
				arg_449_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_452_13 = 0

			if var_452_13 < arg_449_1.time_ and arg_449_1.time_ <= var_452_13 + arg_452_0 then
				arg_449_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_452_14 = 0

			if var_452_14 < arg_449_1.time_ and arg_449_1.time_ <= var_452_14 + arg_452_0 then
				arg_449_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_452_15 = 0
			local var_452_16 = 0.45

			if var_452_15 < arg_449_1.time_ and arg_449_1.time_ <= var_452_15 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_17 = arg_449_1:FormatText(StoryNameCfg[481].name)

				arg_449_1.leftNameTxt_.text = var_452_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_18 = arg_449_1:GetWordFromCfg(123101112)
				local var_452_19 = arg_449_1:FormatText(var_452_18.content)

				arg_449_1.text_.text = var_452_19

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_20 = 18
				local var_452_21 = utf8.len(var_452_19)
				local var_452_22 = var_452_20 <= 0 and var_452_16 or var_452_16 * (var_452_21 / var_452_20)

				if var_452_22 > 0 and var_452_16 < var_452_22 then
					arg_449_1.talkMaxDuration = var_452_22

					if var_452_22 + var_452_15 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_22 + var_452_15
					end
				end

				arg_449_1.text_.text = var_452_19
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101112", "story_v_out_123101.awb") ~= 0 then
					local var_452_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101112", "story_v_out_123101.awb") / 1000

					if var_452_23 + var_452_15 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_23 + var_452_15
					end

					if var_452_18.prefab_name ~= "" and arg_449_1.actors_[var_452_18.prefab_name] ~= nil then
						local var_452_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_18.prefab_name].transform, "story_v_out_123101", "123101112", "story_v_out_123101.awb")

						arg_449_1:RecordAudio("123101112", var_452_24)
						arg_449_1:RecordAudio("123101112", var_452_24)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_123101", "123101112", "story_v_out_123101.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_123101", "123101112", "story_v_out_123101.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_25 = math.max(var_452_16, arg_449_1.talkMaxDuration)

			if var_452_15 <= arg_449_1.time_ and arg_449_1.time_ < var_452_15 + var_452_25 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_15) / var_452_25

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_15 + var_452_25 and arg_449_1.time_ < var_452_15 + var_452_25 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play123101113 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 123101113
		arg_453_1.duration_ = 3.5

		local var_453_0 = {
			zh = 2.2,
			ja = 3.5
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
				arg_453_0:Play123101114(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["1055ui_story"]
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 and arg_453_1.var_.characterEffect1055ui_story == nil then
				arg_453_1.var_.characterEffect1055ui_story = var_456_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_2 = 0.200000002980232

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2

				if arg_453_1.var_.characterEffect1055ui_story then
					local var_456_4 = Mathf.Lerp(0, 0.5, var_456_3)

					arg_453_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_453_1.var_.characterEffect1055ui_story.fillRatio = var_456_4
				end
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 and arg_453_1.var_.characterEffect1055ui_story then
				local var_456_5 = 0.5

				arg_453_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_453_1.var_.characterEffect1055ui_story.fillRatio = var_456_5
			end

			local var_456_6 = 0
			local var_456_7 = 0.275

			if var_456_6 < arg_453_1.time_ and arg_453_1.time_ <= var_456_6 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_8 = arg_453_1:FormatText(StoryNameCfg[496].name)

				arg_453_1.leftNameTxt_.text = var_456_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, true)
				arg_453_1.iconController_:SetSelectedState("hero")

				arg_453_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officerma")

				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_9 = arg_453_1:GetWordFromCfg(123101113)
				local var_456_10 = arg_453_1:FormatText(var_456_9.content)

				arg_453_1.text_.text = var_456_10

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_11 = 11
				local var_456_12 = utf8.len(var_456_10)
				local var_456_13 = var_456_11 <= 0 and var_456_7 or var_456_7 * (var_456_12 / var_456_11)

				if var_456_13 > 0 and var_456_7 < var_456_13 then
					arg_453_1.talkMaxDuration = var_456_13

					if var_456_13 + var_456_6 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_13 + var_456_6
					end
				end

				arg_453_1.text_.text = var_456_10
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101113", "story_v_out_123101.awb") ~= 0 then
					local var_456_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101113", "story_v_out_123101.awb") / 1000

					if var_456_14 + var_456_6 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_14 + var_456_6
					end

					if var_456_9.prefab_name ~= "" and arg_453_1.actors_[var_456_9.prefab_name] ~= nil then
						local var_456_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_9.prefab_name].transform, "story_v_out_123101", "123101113", "story_v_out_123101.awb")

						arg_453_1:RecordAudio("123101113", var_456_15)
						arg_453_1:RecordAudio("123101113", var_456_15)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_123101", "123101113", "story_v_out_123101.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_123101", "123101113", "story_v_out_123101.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_16 = math.max(var_456_7, arg_453_1.talkMaxDuration)

			if var_456_6 <= arg_453_1.time_ and arg_453_1.time_ < var_456_6 + var_456_16 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_6) / var_456_16

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_6 + var_456_16 and arg_453_1.time_ < var_456_6 + var_456_16 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play123101114 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 123101114
		arg_457_1.duration_ = 3.5

		local var_457_0 = {
			zh = 3.5,
			ja = 2.733
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
				arg_457_0:Play123101115(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1055ui_story"]
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 and arg_457_1.var_.characterEffect1055ui_story == nil then
				arg_457_1.var_.characterEffect1055ui_story = var_460_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_2 = 0.200000002980232

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2

				if arg_457_1.var_.characterEffect1055ui_story then
					arg_457_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 and arg_457_1.var_.characterEffect1055ui_story then
				arg_457_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_460_4 = 0

			if var_460_4 < arg_457_1.time_ and arg_457_1.time_ <= var_460_4 + arg_460_0 then
				arg_457_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_460_5 = 0

			if var_460_5 < arg_457_1.time_ and arg_457_1.time_ <= var_460_5 + arg_460_0 then
				arg_457_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_460_6 = 0
			local var_460_7 = 0.4

			if var_460_6 < arg_457_1.time_ and arg_457_1.time_ <= var_460_6 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_8 = arg_457_1:FormatText(StoryNameCfg[481].name)

				arg_457_1.leftNameTxt_.text = var_460_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_9 = arg_457_1:GetWordFromCfg(123101114)
				local var_460_10 = arg_457_1:FormatText(var_460_9.content)

				arg_457_1.text_.text = var_460_10

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_11 = 16
				local var_460_12 = utf8.len(var_460_10)
				local var_460_13 = var_460_11 <= 0 and var_460_7 or var_460_7 * (var_460_12 / var_460_11)

				if var_460_13 > 0 and var_460_7 < var_460_13 then
					arg_457_1.talkMaxDuration = var_460_13

					if var_460_13 + var_460_6 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_13 + var_460_6
					end
				end

				arg_457_1.text_.text = var_460_10
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101114", "story_v_out_123101.awb") ~= 0 then
					local var_460_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101114", "story_v_out_123101.awb") / 1000

					if var_460_14 + var_460_6 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_14 + var_460_6
					end

					if var_460_9.prefab_name ~= "" and arg_457_1.actors_[var_460_9.prefab_name] ~= nil then
						local var_460_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_9.prefab_name].transform, "story_v_out_123101", "123101114", "story_v_out_123101.awb")

						arg_457_1:RecordAudio("123101114", var_460_15)
						arg_457_1:RecordAudio("123101114", var_460_15)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_123101", "123101114", "story_v_out_123101.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_123101", "123101114", "story_v_out_123101.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_16 = math.max(var_460_7, arg_457_1.talkMaxDuration)

			if var_460_6 <= arg_457_1.time_ and arg_457_1.time_ < var_460_6 + var_460_16 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_6) / var_460_16

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_6 + var_460_16 and arg_457_1.time_ < var_460_6 + var_460_16 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play123101115 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 123101115
		arg_461_1.duration_ = 13.4

		local var_461_0 = {
			zh = 5.1,
			ja = 13.4
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
				arg_461_0:Play123101116(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1055ui_story"]
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 and arg_461_1.var_.characterEffect1055ui_story == nil then
				arg_461_1.var_.characterEffect1055ui_story = var_464_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_2 = 0.200000002980232

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2

				if arg_461_1.var_.characterEffect1055ui_story then
					local var_464_4 = Mathf.Lerp(0, 0.5, var_464_3)

					arg_461_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_461_1.var_.characterEffect1055ui_story.fillRatio = var_464_4
				end
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 and arg_461_1.var_.characterEffect1055ui_story then
				local var_464_5 = 0.5

				arg_461_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_461_1.var_.characterEffect1055ui_story.fillRatio = var_464_5
			end

			local var_464_6 = 0
			local var_464_7 = 0.575

			if var_464_6 < arg_461_1.time_ and arg_461_1.time_ <= var_464_6 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_8 = arg_461_1:FormatText(StoryNameCfg[496].name)

				arg_461_1.leftNameTxt_.text = var_464_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, true)
				arg_461_1.iconController_:SetSelectedState("hero")

				arg_461_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officerma")

				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_9 = arg_461_1:GetWordFromCfg(123101115)
				local var_464_10 = arg_461_1:FormatText(var_464_9.content)

				arg_461_1.text_.text = var_464_10

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_11 = 23
				local var_464_12 = utf8.len(var_464_10)
				local var_464_13 = var_464_11 <= 0 and var_464_7 or var_464_7 * (var_464_12 / var_464_11)

				if var_464_13 > 0 and var_464_7 < var_464_13 then
					arg_461_1.talkMaxDuration = var_464_13

					if var_464_13 + var_464_6 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_13 + var_464_6
					end
				end

				arg_461_1.text_.text = var_464_10
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101115", "story_v_out_123101.awb") ~= 0 then
					local var_464_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101115", "story_v_out_123101.awb") / 1000

					if var_464_14 + var_464_6 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_14 + var_464_6
					end

					if var_464_9.prefab_name ~= "" and arg_461_1.actors_[var_464_9.prefab_name] ~= nil then
						local var_464_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_9.prefab_name].transform, "story_v_out_123101", "123101115", "story_v_out_123101.awb")

						arg_461_1:RecordAudio("123101115", var_464_15)
						arg_461_1:RecordAudio("123101115", var_464_15)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_123101", "123101115", "story_v_out_123101.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_123101", "123101115", "story_v_out_123101.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_16 = math.max(var_464_7, arg_461_1.talkMaxDuration)

			if var_464_6 <= arg_461_1.time_ and arg_461_1.time_ < var_464_6 + var_464_16 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_6) / var_464_16

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_6 + var_464_16 and arg_461_1.time_ < var_464_6 + var_464_16 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play123101116 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 123101116
		arg_465_1.duration_ = 5.2

		local var_465_0 = {
			zh = 3.666,
			ja = 5.2
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
				arg_465_0:Play123101117(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1055ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect1055ui_story == nil then
				arg_465_1.var_.characterEffect1055ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.200000002980232

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect1055ui_story then
					arg_465_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect1055ui_story then
				arg_465_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_468_4 = 0

			if var_468_4 < arg_465_1.time_ and arg_465_1.time_ <= var_468_4 + arg_468_0 then
				arg_465_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_468_5 = 0

			if var_468_5 < arg_465_1.time_ and arg_465_1.time_ <= var_468_5 + arg_468_0 then
				arg_465_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_468_6 = 0
			local var_468_7 = 0.325

			if var_468_6 < arg_465_1.time_ and arg_465_1.time_ <= var_468_6 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_8 = arg_465_1:FormatText(StoryNameCfg[481].name)

				arg_465_1.leftNameTxt_.text = var_468_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_9 = arg_465_1:GetWordFromCfg(123101116)
				local var_468_10 = arg_465_1:FormatText(var_468_9.content)

				arg_465_1.text_.text = var_468_10

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_11 = 13
				local var_468_12 = utf8.len(var_468_10)
				local var_468_13 = var_468_11 <= 0 and var_468_7 or var_468_7 * (var_468_12 / var_468_11)

				if var_468_13 > 0 and var_468_7 < var_468_13 then
					arg_465_1.talkMaxDuration = var_468_13

					if var_468_13 + var_468_6 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_13 + var_468_6
					end
				end

				arg_465_1.text_.text = var_468_10
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101116", "story_v_out_123101.awb") ~= 0 then
					local var_468_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101116", "story_v_out_123101.awb") / 1000

					if var_468_14 + var_468_6 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_14 + var_468_6
					end

					if var_468_9.prefab_name ~= "" and arg_465_1.actors_[var_468_9.prefab_name] ~= nil then
						local var_468_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_9.prefab_name].transform, "story_v_out_123101", "123101116", "story_v_out_123101.awb")

						arg_465_1:RecordAudio("123101116", var_468_15)
						arg_465_1:RecordAudio("123101116", var_468_15)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_123101", "123101116", "story_v_out_123101.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_123101", "123101116", "story_v_out_123101.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_16 = math.max(var_468_7, arg_465_1.talkMaxDuration)

			if var_468_6 <= arg_465_1.time_ and arg_465_1.time_ < var_468_6 + var_468_16 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_6) / var_468_16

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_6 + var_468_16 and arg_465_1.time_ < var_468_6 + var_468_16 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play123101117 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 123101117
		arg_469_1.duration_ = 7.7

		local var_469_0 = {
			zh = 4.8,
			ja = 7.7
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
				arg_469_0:Play123101118(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1055ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect1055ui_story == nil then
				arg_469_1.var_.characterEffect1055ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1055ui_story then
					local var_472_4 = Mathf.Lerp(0, 0.5, var_472_3)

					arg_469_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_469_1.var_.characterEffect1055ui_story.fillRatio = var_472_4
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect1055ui_story then
				local var_472_5 = 0.5

				arg_469_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_469_1.var_.characterEffect1055ui_story.fillRatio = var_472_5
			end

			local var_472_6 = 0
			local var_472_7 = 0.65

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_8 = arg_469_1:FormatText(StoryNameCfg[496].name)

				arg_469_1.leftNameTxt_.text = var_472_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, true)
				arg_469_1.iconController_:SetSelectedState("hero")

				arg_469_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officerma")

				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_9 = arg_469_1:GetWordFromCfg(123101117)
				local var_472_10 = arg_469_1:FormatText(var_472_9.content)

				arg_469_1.text_.text = var_472_10

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_11 = 26
				local var_472_12 = utf8.len(var_472_10)
				local var_472_13 = var_472_11 <= 0 and var_472_7 or var_472_7 * (var_472_12 / var_472_11)

				if var_472_13 > 0 and var_472_7 < var_472_13 then
					arg_469_1.talkMaxDuration = var_472_13

					if var_472_13 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_13 + var_472_6
					end
				end

				arg_469_1.text_.text = var_472_10
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101117", "story_v_out_123101.awb") ~= 0 then
					local var_472_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101117", "story_v_out_123101.awb") / 1000

					if var_472_14 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_14 + var_472_6
					end

					if var_472_9.prefab_name ~= "" and arg_469_1.actors_[var_472_9.prefab_name] ~= nil then
						local var_472_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_9.prefab_name].transform, "story_v_out_123101", "123101117", "story_v_out_123101.awb")

						arg_469_1:RecordAudio("123101117", var_472_15)
						arg_469_1:RecordAudio("123101117", var_472_15)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_123101", "123101117", "story_v_out_123101.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_123101", "123101117", "story_v_out_123101.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_16 = math.max(var_472_7, arg_469_1.talkMaxDuration)

			if var_472_6 <= arg_469_1.time_ and arg_469_1.time_ < var_472_6 + var_472_16 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_6) / var_472_16

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_6 + var_472_16 and arg_469_1.time_ < var_472_6 + var_472_16 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play123101118 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 123101118
		arg_473_1.duration_ = 8.266

		local var_473_0 = {
			zh = 6.566,
			ja = 8.266
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
				arg_473_0:Play123101119(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1055ui_story"]
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 and arg_473_1.var_.characterEffect1055ui_story == nil then
				arg_473_1.var_.characterEffect1055ui_story = var_476_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_2 = 0.200000002980232

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2

				if arg_473_1.var_.characterEffect1055ui_story then
					arg_473_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 and arg_473_1.var_.characterEffect1055ui_story then
				arg_473_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_476_4 = 0

			if var_476_4 < arg_473_1.time_ and arg_473_1.time_ <= var_476_4 + arg_476_0 then
				arg_473_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_476_5 = 0

			if var_476_5 < arg_473_1.time_ and arg_473_1.time_ <= var_476_5 + arg_476_0 then
				arg_473_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_476_6 = 0
			local var_476_7 = 0.85

			if var_476_6 < arg_473_1.time_ and arg_473_1.time_ <= var_476_6 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_8 = arg_473_1:FormatText(StoryNameCfg[481].name)

				arg_473_1.leftNameTxt_.text = var_476_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_9 = arg_473_1:GetWordFromCfg(123101118)
				local var_476_10 = arg_473_1:FormatText(var_476_9.content)

				arg_473_1.text_.text = var_476_10

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_11 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101118", "story_v_out_123101.awb") ~= 0 then
					local var_476_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101118", "story_v_out_123101.awb") / 1000

					if var_476_14 + var_476_6 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_14 + var_476_6
					end

					if var_476_9.prefab_name ~= "" and arg_473_1.actors_[var_476_9.prefab_name] ~= nil then
						local var_476_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_9.prefab_name].transform, "story_v_out_123101", "123101118", "story_v_out_123101.awb")

						arg_473_1:RecordAudio("123101118", var_476_15)
						arg_473_1:RecordAudio("123101118", var_476_15)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_123101", "123101118", "story_v_out_123101.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_123101", "123101118", "story_v_out_123101.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_16 = math.max(var_476_7, arg_473_1.talkMaxDuration)

			if var_476_6 <= arg_473_1.time_ and arg_473_1.time_ < var_476_6 + var_476_16 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_6) / var_476_16

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_6 + var_476_16 and arg_473_1.time_ < var_476_6 + var_476_16 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play123101119 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 123101119
		arg_477_1.duration_ = 4.466

		local var_477_0 = {
			zh = 3.633,
			ja = 4.466
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
				arg_477_0:Play123101120(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_480_2 = 0
			local var_480_3 = 0.375

			if var_480_2 < arg_477_1.time_ and arg_477_1.time_ <= var_480_2 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_4 = arg_477_1:FormatText(StoryNameCfg[481].name)

				arg_477_1.leftNameTxt_.text = var_480_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_5 = arg_477_1:GetWordFromCfg(123101119)
				local var_480_6 = arg_477_1:FormatText(var_480_5.content)

				arg_477_1.text_.text = var_480_6

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_7 = 15
				local var_480_8 = utf8.len(var_480_6)
				local var_480_9 = var_480_7 <= 0 and var_480_3 or var_480_3 * (var_480_8 / var_480_7)

				if var_480_9 > 0 and var_480_3 < var_480_9 then
					arg_477_1.talkMaxDuration = var_480_9

					if var_480_9 + var_480_2 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_9 + var_480_2
					end
				end

				arg_477_1.text_.text = var_480_6
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101119", "story_v_out_123101.awb") ~= 0 then
					local var_480_10 = manager.audio:GetVoiceLength("story_v_out_123101", "123101119", "story_v_out_123101.awb") / 1000

					if var_480_10 + var_480_2 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_10 + var_480_2
					end

					if var_480_5.prefab_name ~= "" and arg_477_1.actors_[var_480_5.prefab_name] ~= nil then
						local var_480_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_5.prefab_name].transform, "story_v_out_123101", "123101119", "story_v_out_123101.awb")

						arg_477_1:RecordAudio("123101119", var_480_11)
						arg_477_1:RecordAudio("123101119", var_480_11)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_123101", "123101119", "story_v_out_123101.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_123101", "123101119", "story_v_out_123101.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_12 = math.max(var_480_3, arg_477_1.talkMaxDuration)

			if var_480_2 <= arg_477_1.time_ and arg_477_1.time_ < var_480_2 + var_480_12 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_2) / var_480_12

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_2 + var_480_12 and arg_477_1.time_ < var_480_2 + var_480_12 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play123101120 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 123101120
		arg_481_1.duration_ = 8.7

		local var_481_0 = {
			zh = 6.9,
			ja = 8.7
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
				arg_481_0:Play123101121(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1055ui_story"]
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 and arg_481_1.var_.characterEffect1055ui_story == nil then
				arg_481_1.var_.characterEffect1055ui_story = var_484_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_2 = 0.200000002980232

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2

				if arg_481_1.var_.characterEffect1055ui_story then
					local var_484_4 = Mathf.Lerp(0, 0.5, var_484_3)

					arg_481_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_481_1.var_.characterEffect1055ui_story.fillRatio = var_484_4
				end
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 and arg_481_1.var_.characterEffect1055ui_story then
				local var_484_5 = 0.5

				arg_481_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_481_1.var_.characterEffect1055ui_story.fillRatio = var_484_5
			end

			local var_484_6 = 0
			local var_484_7 = 0.675

			if var_484_6 < arg_481_1.time_ and arg_481_1.time_ <= var_484_6 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_8 = arg_481_1:FormatText(StoryNameCfg[496].name)

				arg_481_1.leftNameTxt_.text = var_484_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, true)
				arg_481_1.iconController_:SetSelectedState("hero")

				arg_481_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officerma")

				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_9 = arg_481_1:GetWordFromCfg(123101120)
				local var_484_10 = arg_481_1:FormatText(var_484_9.content)

				arg_481_1.text_.text = var_484_10

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_11 = 27
				local var_484_12 = utf8.len(var_484_10)
				local var_484_13 = var_484_11 <= 0 and var_484_7 or var_484_7 * (var_484_12 / var_484_11)

				if var_484_13 > 0 and var_484_7 < var_484_13 then
					arg_481_1.talkMaxDuration = var_484_13

					if var_484_13 + var_484_6 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_13 + var_484_6
					end
				end

				arg_481_1.text_.text = var_484_10
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101120", "story_v_out_123101.awb") ~= 0 then
					local var_484_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101120", "story_v_out_123101.awb") / 1000

					if var_484_14 + var_484_6 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_14 + var_484_6
					end

					if var_484_9.prefab_name ~= "" and arg_481_1.actors_[var_484_9.prefab_name] ~= nil then
						local var_484_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_9.prefab_name].transform, "story_v_out_123101", "123101120", "story_v_out_123101.awb")

						arg_481_1:RecordAudio("123101120", var_484_15)
						arg_481_1:RecordAudio("123101120", var_484_15)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_123101", "123101120", "story_v_out_123101.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_123101", "123101120", "story_v_out_123101.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_16 = math.max(var_484_7, arg_481_1.talkMaxDuration)

			if var_484_6 <= arg_481_1.time_ and arg_481_1.time_ < var_484_6 + var_484_16 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_6) / var_484_16

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_6 + var_484_16 and arg_481_1.time_ < var_484_6 + var_484_16 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play123101121 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 123101121
		arg_485_1.duration_ = 8.733

		local var_485_0 = {
			zh = 6.533,
			ja = 8.733
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
				arg_485_0:Play123101122(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = arg_485_1.actors_["1055ui_story"]
			local var_488_1 = 0

			if var_488_1 < arg_485_1.time_ and arg_485_1.time_ <= var_488_1 + arg_488_0 and arg_485_1.var_.characterEffect1055ui_story == nil then
				arg_485_1.var_.characterEffect1055ui_story = var_488_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_2 = 0.200000002980232

			if var_488_1 <= arg_485_1.time_ and arg_485_1.time_ < var_488_1 + var_488_2 then
				local var_488_3 = (arg_485_1.time_ - var_488_1) / var_488_2

				if arg_485_1.var_.characterEffect1055ui_story then
					arg_485_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_485_1.time_ >= var_488_1 + var_488_2 and arg_485_1.time_ < var_488_1 + var_488_2 + arg_488_0 and arg_485_1.var_.characterEffect1055ui_story then
				arg_485_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_488_4 = 0

			if var_488_4 < arg_485_1.time_ and arg_485_1.time_ <= var_488_4 + arg_488_0 then
				arg_485_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_488_5 = 0

			if var_488_5 < arg_485_1.time_ and arg_485_1.time_ <= var_488_5 + arg_488_0 then
				arg_485_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_488_6 = 0
			local var_488_7 = 0.675

			if var_488_6 < arg_485_1.time_ and arg_485_1.time_ <= var_488_6 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_8 = arg_485_1:FormatText(StoryNameCfg[481].name)

				arg_485_1.leftNameTxt_.text = var_488_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_9 = arg_485_1:GetWordFromCfg(123101121)
				local var_488_10 = arg_485_1:FormatText(var_488_9.content)

				arg_485_1.text_.text = var_488_10

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_11 = 27
				local var_488_12 = utf8.len(var_488_10)
				local var_488_13 = var_488_11 <= 0 and var_488_7 or var_488_7 * (var_488_12 / var_488_11)

				if var_488_13 > 0 and var_488_7 < var_488_13 then
					arg_485_1.talkMaxDuration = var_488_13

					if var_488_13 + var_488_6 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_13 + var_488_6
					end
				end

				arg_485_1.text_.text = var_488_10
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101121", "story_v_out_123101.awb") ~= 0 then
					local var_488_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101121", "story_v_out_123101.awb") / 1000

					if var_488_14 + var_488_6 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_14 + var_488_6
					end

					if var_488_9.prefab_name ~= "" and arg_485_1.actors_[var_488_9.prefab_name] ~= nil then
						local var_488_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_9.prefab_name].transform, "story_v_out_123101", "123101121", "story_v_out_123101.awb")

						arg_485_1:RecordAudio("123101121", var_488_15)
						arg_485_1:RecordAudio("123101121", var_488_15)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_123101", "123101121", "story_v_out_123101.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_123101", "123101121", "story_v_out_123101.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_16 = math.max(var_488_7, arg_485_1.talkMaxDuration)

			if var_488_6 <= arg_485_1.time_ and arg_485_1.time_ < var_488_6 + var_488_16 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_6) / var_488_16

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_6 + var_488_16 and arg_485_1.time_ < var_488_6 + var_488_16 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play123101122 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 123101122
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play123101123(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["1055ui_story"]
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 and arg_489_1.var_.characterEffect1055ui_story == nil then
				arg_489_1.var_.characterEffect1055ui_story = var_492_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_2 = 0.200000002980232

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2

				if arg_489_1.var_.characterEffect1055ui_story then
					local var_492_4 = Mathf.Lerp(0, 0.5, var_492_3)

					arg_489_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_489_1.var_.characterEffect1055ui_story.fillRatio = var_492_4
				end
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 and arg_489_1.var_.characterEffect1055ui_story then
				local var_492_5 = 0.5

				arg_489_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_489_1.var_.characterEffect1055ui_story.fillRatio = var_492_5
			end

			local var_492_6 = 0
			local var_492_7 = 0.275

			if var_492_6 < arg_489_1.time_ and arg_489_1.time_ <= var_492_6 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, false)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_8 = arg_489_1:GetWordFromCfg(123101122)
				local var_492_9 = arg_489_1:FormatText(var_492_8.content)

				arg_489_1.text_.text = var_492_9

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_10 = 11
				local var_492_11 = utf8.len(var_492_9)
				local var_492_12 = var_492_10 <= 0 and var_492_7 or var_492_7 * (var_492_11 / var_492_10)

				if var_492_12 > 0 and var_492_7 < var_492_12 then
					arg_489_1.talkMaxDuration = var_492_12

					if var_492_12 + var_492_6 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_12 + var_492_6
					end
				end

				arg_489_1.text_.text = var_492_9
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_13 = math.max(var_492_7, arg_489_1.talkMaxDuration)

			if var_492_6 <= arg_489_1.time_ and arg_489_1.time_ < var_492_6 + var_492_13 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_6) / var_492_13

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_6 + var_492_13 and arg_489_1.time_ < var_492_6 + var_492_13 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play123101123 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 123101123
		arg_493_1.duration_ = 3.533

		local var_493_0 = {
			zh = 2.233,
			ja = 3.533
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
				arg_493_0:Play123101124(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0
			local var_496_1 = 0.25

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_2 = arg_493_1:FormatText(StoryNameCfg[496].name)

				arg_493_1.leftNameTxt_.text = var_496_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, true)
				arg_493_1.iconController_:SetSelectedState("hero")

				arg_493_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officerma")

				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_3 = arg_493_1:GetWordFromCfg(123101123)
				local var_496_4 = arg_493_1:FormatText(var_496_3.content)

				arg_493_1.text_.text = var_496_4

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101123", "story_v_out_123101.awb") ~= 0 then
					local var_496_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101123", "story_v_out_123101.awb") / 1000

					if var_496_8 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_8 + var_496_0
					end

					if var_496_3.prefab_name ~= "" and arg_493_1.actors_[var_496_3.prefab_name] ~= nil then
						local var_496_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_3.prefab_name].transform, "story_v_out_123101", "123101123", "story_v_out_123101.awb")

						arg_493_1:RecordAudio("123101123", var_496_9)
						arg_493_1:RecordAudio("123101123", var_496_9)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_out_123101", "123101123", "story_v_out_123101.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_out_123101", "123101123", "story_v_out_123101.awb")
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
	Play123101124 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 123101124
		arg_497_1.duration_ = 1.999999999999

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play123101125(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["1055ui_story"]
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 and arg_497_1.var_.characterEffect1055ui_story == nil then
				arg_497_1.var_.characterEffect1055ui_story = var_500_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_2 = 0.200000002980232

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_2 then
				local var_500_3 = (arg_497_1.time_ - var_500_1) / var_500_2

				if arg_497_1.var_.characterEffect1055ui_story then
					arg_497_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_497_1.time_ >= var_500_1 + var_500_2 and arg_497_1.time_ < var_500_1 + var_500_2 + arg_500_0 and arg_497_1.var_.characterEffect1055ui_story then
				arg_497_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_500_4 = 0

			if var_500_4 < arg_497_1.time_ and arg_497_1.time_ <= var_500_4 + arg_500_0 then
				arg_497_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_500_5 = 0

			if var_500_5 < arg_497_1.time_ and arg_497_1.time_ <= var_500_5 + arg_500_0 then
				arg_497_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_500_6 = 0
			local var_500_7 = 0.05

			if var_500_6 < arg_497_1.time_ and arg_497_1.time_ <= var_500_6 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_8 = arg_497_1:FormatText(StoryNameCfg[481].name)

				arg_497_1.leftNameTxt_.text = var_500_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_9 = arg_497_1:GetWordFromCfg(123101124)
				local var_500_10 = arg_497_1:FormatText(var_500_9.content)

				arg_497_1.text_.text = var_500_10

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_11 = 2
				local var_500_12 = utf8.len(var_500_10)
				local var_500_13 = var_500_11 <= 0 and var_500_7 or var_500_7 * (var_500_12 / var_500_11)

				if var_500_13 > 0 and var_500_7 < var_500_13 then
					arg_497_1.talkMaxDuration = var_500_13

					if var_500_13 + var_500_6 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_13 + var_500_6
					end
				end

				arg_497_1.text_.text = var_500_10
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101124", "story_v_out_123101.awb") ~= 0 then
					local var_500_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101124", "story_v_out_123101.awb") / 1000

					if var_500_14 + var_500_6 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_14 + var_500_6
					end

					if var_500_9.prefab_name ~= "" and arg_497_1.actors_[var_500_9.prefab_name] ~= nil then
						local var_500_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_497_1.actors_[var_500_9.prefab_name].transform, "story_v_out_123101", "123101124", "story_v_out_123101.awb")

						arg_497_1:RecordAudio("123101124", var_500_15)
						arg_497_1:RecordAudio("123101124", var_500_15)
					else
						arg_497_1:AudioAction("play", "voice", "story_v_out_123101", "123101124", "story_v_out_123101.awb")
					end

					arg_497_1:RecordHistoryTalkVoice("story_v_out_123101", "123101124", "story_v_out_123101.awb")
				end

				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_16 = math.max(var_500_7, arg_497_1.talkMaxDuration)

			if var_500_6 <= arg_497_1.time_ and arg_497_1.time_ < var_500_6 + var_500_16 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_6) / var_500_16

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_6 + var_500_16 and arg_497_1.time_ < var_500_6 + var_500_16 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play123101125 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 123101125
		arg_501_1.duration_ = 6.933

		local var_501_0 = {
			zh = 6.333,
			ja = 6.933
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
				arg_501_0:Play123101126(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["1055ui_story"]
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 and arg_501_1.var_.characterEffect1055ui_story == nil then
				arg_501_1.var_.characterEffect1055ui_story = var_504_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_2 = 0.200000002980232

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2

				if arg_501_1.var_.characterEffect1055ui_story then
					local var_504_4 = Mathf.Lerp(0, 0.5, var_504_3)

					arg_501_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_501_1.var_.characterEffect1055ui_story.fillRatio = var_504_4
				end
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 and arg_501_1.var_.characterEffect1055ui_story then
				local var_504_5 = 0.5

				arg_501_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_501_1.var_.characterEffect1055ui_story.fillRatio = var_504_5
			end

			local var_504_6 = 0
			local var_504_7 = 0.675

			if var_504_6 < arg_501_1.time_ and arg_501_1.time_ <= var_504_6 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_8 = arg_501_1:FormatText(StoryNameCfg[496].name)

				arg_501_1.leftNameTxt_.text = var_504_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, true)
				arg_501_1.iconController_:SetSelectedState("hero")

				arg_501_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officerma")

				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_9 = arg_501_1:GetWordFromCfg(123101125)
				local var_504_10 = arg_501_1:FormatText(var_504_9.content)

				arg_501_1.text_.text = var_504_10

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_11 = 27
				local var_504_12 = utf8.len(var_504_10)
				local var_504_13 = var_504_11 <= 0 and var_504_7 or var_504_7 * (var_504_12 / var_504_11)

				if var_504_13 > 0 and var_504_7 < var_504_13 then
					arg_501_1.talkMaxDuration = var_504_13

					if var_504_13 + var_504_6 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_13 + var_504_6
					end
				end

				arg_501_1.text_.text = var_504_10
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101125", "story_v_out_123101.awb") ~= 0 then
					local var_504_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101125", "story_v_out_123101.awb") / 1000

					if var_504_14 + var_504_6 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_14 + var_504_6
					end

					if var_504_9.prefab_name ~= "" and arg_501_1.actors_[var_504_9.prefab_name] ~= nil then
						local var_504_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_9.prefab_name].transform, "story_v_out_123101", "123101125", "story_v_out_123101.awb")

						arg_501_1:RecordAudio("123101125", var_504_15)
						arg_501_1:RecordAudio("123101125", var_504_15)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_123101", "123101125", "story_v_out_123101.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_123101", "123101125", "story_v_out_123101.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_16 = math.max(var_504_7, arg_501_1.talkMaxDuration)

			if var_504_6 <= arg_501_1.time_ and arg_501_1.time_ < var_504_6 + var_504_16 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_6) / var_504_16

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_6 + var_504_16 and arg_501_1.time_ < var_504_6 + var_504_16 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play123101126 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 123101126
		arg_505_1.duration_ = 5

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play123101127(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = 0
			local var_508_1 = 0.75

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

				local var_508_2 = arg_505_1:GetWordFromCfg(123101126)
				local var_508_3 = arg_505_1:FormatText(var_508_2.content)

				arg_505_1.text_.text = var_508_3

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_4 = 30
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
	Play123101127 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 123101127
		arg_509_1.duration_ = 4.933

		local var_509_0 = {
			zh = 2.766,
			ja = 4.933
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
				arg_509_0:Play123101128(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["1055ui_story"]
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 and arg_509_1.var_.characterEffect1055ui_story == nil then
				arg_509_1.var_.characterEffect1055ui_story = var_512_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_2 = 0.200000002980232

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2

				if arg_509_1.var_.characterEffect1055ui_story then
					arg_509_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 and arg_509_1.var_.characterEffect1055ui_story then
				arg_509_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_512_4 = 0

			if var_512_4 < arg_509_1.time_ and arg_509_1.time_ <= var_512_4 + arg_512_0 then
				arg_509_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action5_1")
			end

			local var_512_5 = 0

			if var_512_5 < arg_509_1.time_ and arg_509_1.time_ <= var_512_5 + arg_512_0 then
				arg_509_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_512_6 = 0
			local var_512_7 = 0.375

			if var_512_6 < arg_509_1.time_ and arg_509_1.time_ <= var_512_6 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_8 = arg_509_1:FormatText(StoryNameCfg[481].name)

				arg_509_1.leftNameTxt_.text = var_512_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_9 = arg_509_1:GetWordFromCfg(123101127)
				local var_512_10 = arg_509_1:FormatText(var_512_9.content)

				arg_509_1.text_.text = var_512_10

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_11 = 15
				local var_512_12 = utf8.len(var_512_10)
				local var_512_13 = var_512_11 <= 0 and var_512_7 or var_512_7 * (var_512_12 / var_512_11)

				if var_512_13 > 0 and var_512_7 < var_512_13 then
					arg_509_1.talkMaxDuration = var_512_13

					if var_512_13 + var_512_6 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_13 + var_512_6
					end
				end

				arg_509_1.text_.text = var_512_10
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101127", "story_v_out_123101.awb") ~= 0 then
					local var_512_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101127", "story_v_out_123101.awb") / 1000

					if var_512_14 + var_512_6 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_14 + var_512_6
					end

					if var_512_9.prefab_name ~= "" and arg_509_1.actors_[var_512_9.prefab_name] ~= nil then
						local var_512_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_509_1.actors_[var_512_9.prefab_name].transform, "story_v_out_123101", "123101127", "story_v_out_123101.awb")

						arg_509_1:RecordAudio("123101127", var_512_15)
						arg_509_1:RecordAudio("123101127", var_512_15)
					else
						arg_509_1:AudioAction("play", "voice", "story_v_out_123101", "123101127", "story_v_out_123101.awb")
					end

					arg_509_1:RecordHistoryTalkVoice("story_v_out_123101", "123101127", "story_v_out_123101.awb")
				end

				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_16 = math.max(var_512_7, arg_509_1.talkMaxDuration)

			if var_512_6 <= arg_509_1.time_ and arg_509_1.time_ < var_512_6 + var_512_16 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_6) / var_512_16

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_6 + var_512_16 and arg_509_1.time_ < var_512_6 + var_512_16 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play123101128 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 123101128
		arg_513_1.duration_ = 8.833

		local var_513_0 = {
			zh = 4.533,
			ja = 8.833
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
				arg_513_0:Play123101129(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = arg_513_1.actors_["1055ui_story"]
			local var_516_1 = 0

			if var_516_1 < arg_513_1.time_ and arg_513_1.time_ <= var_516_1 + arg_516_0 and arg_513_1.var_.characterEffect1055ui_story == nil then
				arg_513_1.var_.characterEffect1055ui_story = var_516_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_2 = 0.200000002980232

			if var_516_1 <= arg_513_1.time_ and arg_513_1.time_ < var_516_1 + var_516_2 then
				local var_516_3 = (arg_513_1.time_ - var_516_1) / var_516_2

				if arg_513_1.var_.characterEffect1055ui_story then
					local var_516_4 = Mathf.Lerp(0, 0.5, var_516_3)

					arg_513_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_513_1.var_.characterEffect1055ui_story.fillRatio = var_516_4
				end
			end

			if arg_513_1.time_ >= var_516_1 + var_516_2 and arg_513_1.time_ < var_516_1 + var_516_2 + arg_516_0 and arg_513_1.var_.characterEffect1055ui_story then
				local var_516_5 = 0.5

				arg_513_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_513_1.var_.characterEffect1055ui_story.fillRatio = var_516_5
			end

			local var_516_6 = 0
			local var_516_7 = 0.5

			if var_516_6 < arg_513_1.time_ and arg_513_1.time_ <= var_516_6 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_8 = arg_513_1:FormatText(StoryNameCfg[497].name)

				arg_513_1.leftNameTxt_.text = var_516_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, true)
				arg_513_1.iconController_:SetSelectedState("hero")

				arg_513_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_9 = arg_513_1:GetWordFromCfg(123101128)
				local var_516_10 = arg_513_1:FormatText(var_516_9.content)

				arg_513_1.text_.text = var_516_10

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_11 = 20
				local var_516_12 = utf8.len(var_516_10)
				local var_516_13 = var_516_11 <= 0 and var_516_7 or var_516_7 * (var_516_12 / var_516_11)

				if var_516_13 > 0 and var_516_7 < var_516_13 then
					arg_513_1.talkMaxDuration = var_516_13

					if var_516_13 + var_516_6 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_13 + var_516_6
					end
				end

				arg_513_1.text_.text = var_516_10
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101128", "story_v_out_123101.awb") ~= 0 then
					local var_516_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101128", "story_v_out_123101.awb") / 1000

					if var_516_14 + var_516_6 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_14 + var_516_6
					end

					if var_516_9.prefab_name ~= "" and arg_513_1.actors_[var_516_9.prefab_name] ~= nil then
						local var_516_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_9.prefab_name].transform, "story_v_out_123101", "123101128", "story_v_out_123101.awb")

						arg_513_1:RecordAudio("123101128", var_516_15)
						arg_513_1:RecordAudio("123101128", var_516_15)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_123101", "123101128", "story_v_out_123101.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_123101", "123101128", "story_v_out_123101.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_16 = math.max(var_516_7, arg_513_1.talkMaxDuration)

			if var_516_6 <= arg_513_1.time_ and arg_513_1.time_ < var_516_6 + var_516_16 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_6) / var_516_16

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_6 + var_516_16 and arg_513_1.time_ < var_516_6 + var_516_16 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play123101129 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 123101129
		arg_517_1.duration_ = 3.433

		local var_517_0 = {
			zh = 3.433,
			ja = 3.1
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
				arg_517_0:Play123101130(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["1055ui_story"]
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 and arg_517_1.var_.characterEffect1055ui_story == nil then
				arg_517_1.var_.characterEffect1055ui_story = var_520_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_2 = 0.200000002980232

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2

				if arg_517_1.var_.characterEffect1055ui_story then
					arg_517_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 and arg_517_1.var_.characterEffect1055ui_story then
				arg_517_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_520_4 = 0

			if var_520_4 < arg_517_1.time_ and arg_517_1.time_ <= var_520_4 + arg_520_0 then
				arg_517_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action5_2")
			end

			local var_520_5 = 0

			if var_520_5 < arg_517_1.time_ and arg_517_1.time_ <= var_520_5 + arg_520_0 then
				arg_517_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_520_6 = 0
			local var_520_7 = 0.425

			if var_520_6 < arg_517_1.time_ and arg_517_1.time_ <= var_520_6 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_8 = arg_517_1:FormatText(StoryNameCfg[481].name)

				arg_517_1.leftNameTxt_.text = var_520_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_9 = arg_517_1:GetWordFromCfg(123101129)
				local var_520_10 = arg_517_1:FormatText(var_520_9.content)

				arg_517_1.text_.text = var_520_10

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_11 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101129", "story_v_out_123101.awb") ~= 0 then
					local var_520_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101129", "story_v_out_123101.awb") / 1000

					if var_520_14 + var_520_6 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_14 + var_520_6
					end

					if var_520_9.prefab_name ~= "" and arg_517_1.actors_[var_520_9.prefab_name] ~= nil then
						local var_520_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_9.prefab_name].transform, "story_v_out_123101", "123101129", "story_v_out_123101.awb")

						arg_517_1:RecordAudio("123101129", var_520_15)
						arg_517_1:RecordAudio("123101129", var_520_15)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_123101", "123101129", "story_v_out_123101.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_123101", "123101129", "story_v_out_123101.awb")
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
	Play123101130 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 123101130
		arg_521_1.duration_ = 4.2

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play123101131(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["1055ui_story"]
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 and arg_521_1.var_.characterEffect1055ui_story == nil then
				arg_521_1.var_.characterEffect1055ui_story = var_524_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_2 = 0.200000002980232

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2

				if arg_521_1.var_.characterEffect1055ui_story then
					local var_524_4 = Mathf.Lerp(0, 0.5, var_524_3)

					arg_521_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_521_1.var_.characterEffect1055ui_story.fillRatio = var_524_4
				end
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 and arg_521_1.var_.characterEffect1055ui_story then
				local var_524_5 = 0.5

				arg_521_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_521_1.var_.characterEffect1055ui_story.fillRatio = var_524_5
			end

			local var_524_6 = 0
			local var_524_7 = 0.375

			if var_524_6 < arg_521_1.time_ and arg_521_1.time_ <= var_524_6 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_8 = arg_521_1:FormatText(StoryNameCfg[497].name)

				arg_521_1.leftNameTxt_.text = var_524_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, true)
				arg_521_1.iconController_:SetSelectedState("hero")

				arg_521_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_9 = arg_521_1:GetWordFromCfg(123101130)
				local var_524_10 = arg_521_1:FormatText(var_524_9.content)

				arg_521_1.text_.text = var_524_10

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_11 = 15
				local var_524_12 = utf8.len(var_524_10)
				local var_524_13 = var_524_11 <= 0 and var_524_7 or var_524_7 * (var_524_12 / var_524_11)

				if var_524_13 > 0 and var_524_7 < var_524_13 then
					arg_521_1.talkMaxDuration = var_524_13

					if var_524_13 + var_524_6 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_13 + var_524_6
					end
				end

				arg_521_1.text_.text = var_524_10
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101130", "story_v_out_123101.awb") ~= 0 then
					local var_524_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101130", "story_v_out_123101.awb") / 1000

					if var_524_14 + var_524_6 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_14 + var_524_6
					end

					if var_524_9.prefab_name ~= "" and arg_521_1.actors_[var_524_9.prefab_name] ~= nil then
						local var_524_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_9.prefab_name].transform, "story_v_out_123101", "123101130", "story_v_out_123101.awb")

						arg_521_1:RecordAudio("123101130", var_524_15)
						arg_521_1:RecordAudio("123101130", var_524_15)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_123101", "123101130", "story_v_out_123101.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_123101", "123101130", "story_v_out_123101.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_16 = math.max(var_524_7, arg_521_1.talkMaxDuration)

			if var_524_6 <= arg_521_1.time_ and arg_521_1.time_ < var_524_6 + var_524_16 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_6) / var_524_16

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_6 + var_524_16 and arg_521_1.time_ < var_524_6 + var_524_16 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play123101131 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 123101131
		arg_525_1.duration_ = 8.9

		local var_525_0 = {
			zh = 8.466,
			ja = 8.9
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
				arg_525_0:Play123101132(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 0.8

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_2 = arg_525_1:FormatText(StoryNameCfg[497].name)

				arg_525_1.leftNameTxt_.text = var_528_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, true)
				arg_525_1.iconController_:SetSelectedState("hero")

				arg_525_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_3 = arg_525_1:GetWordFromCfg(123101131)
				local var_528_4 = arg_525_1:FormatText(var_528_3.content)

				arg_525_1.text_.text = var_528_4

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_5 = 32
				local var_528_6 = utf8.len(var_528_4)
				local var_528_7 = var_528_5 <= 0 and var_528_1 or var_528_1 * (var_528_6 / var_528_5)

				if var_528_7 > 0 and var_528_1 < var_528_7 then
					arg_525_1.talkMaxDuration = var_528_7

					if var_528_7 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_7 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_4
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101131", "story_v_out_123101.awb") ~= 0 then
					local var_528_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101131", "story_v_out_123101.awb") / 1000

					if var_528_8 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_8 + var_528_0
					end

					if var_528_3.prefab_name ~= "" and arg_525_1.actors_[var_528_3.prefab_name] ~= nil then
						local var_528_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_3.prefab_name].transform, "story_v_out_123101", "123101131", "story_v_out_123101.awb")

						arg_525_1:RecordAudio("123101131", var_528_9)
						arg_525_1:RecordAudio("123101131", var_528_9)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_out_123101", "123101131", "story_v_out_123101.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_out_123101", "123101131", "story_v_out_123101.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_10 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_10 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_10

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_10 and arg_525_1.time_ < var_528_0 + var_528_10 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play123101132 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 123101132
		arg_529_1.duration_ = 4.6

		local var_529_0 = {
			zh = 4.6,
			ja = 2.033
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
				arg_529_0:Play123101133(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = arg_529_1.actors_["1055ui_story"].transform
			local var_532_1 = 0

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 then
				arg_529_1.var_.moveOldPos1055ui_story = var_532_0.localPosition
			end

			local var_532_2 = 0.001

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_2 then
				local var_532_3 = (arg_529_1.time_ - var_532_1) / var_532_2
				local var_532_4 = Vector3.New(0, 100, 0)

				var_532_0.localPosition = Vector3.Lerp(arg_529_1.var_.moveOldPos1055ui_story, var_532_4, var_532_3)

				local var_532_5 = manager.ui.mainCamera.transform.position - var_532_0.position

				var_532_0.forward = Vector3.New(var_532_5.x, var_532_5.y, var_532_5.z)

				local var_532_6 = var_532_0.localEulerAngles

				var_532_6.z = 0
				var_532_6.x = 0
				var_532_0.localEulerAngles = var_532_6
			end

			if arg_529_1.time_ >= var_532_1 + var_532_2 and arg_529_1.time_ < var_532_1 + var_532_2 + arg_532_0 then
				var_532_0.localPosition = Vector3.New(0, 100, 0)

				local var_532_7 = manager.ui.mainCamera.transform.position - var_532_0.position

				var_532_0.forward = Vector3.New(var_532_7.x, var_532_7.y, var_532_7.z)

				local var_532_8 = var_532_0.localEulerAngles

				var_532_8.z = 0
				var_532_8.x = 0
				var_532_0.localEulerAngles = var_532_8
			end

			local var_532_9 = arg_529_1.actors_["1055ui_story"]
			local var_532_10 = 0

			if var_532_10 < arg_529_1.time_ and arg_529_1.time_ <= var_532_10 + arg_532_0 and arg_529_1.var_.characterEffect1055ui_story == nil then
				arg_529_1.var_.characterEffect1055ui_story = var_532_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_11 = 0.200000002980232

			if var_532_10 <= arg_529_1.time_ and arg_529_1.time_ < var_532_10 + var_532_11 then
				local var_532_12 = (arg_529_1.time_ - var_532_10) / var_532_11

				if arg_529_1.var_.characterEffect1055ui_story then
					local var_532_13 = Mathf.Lerp(0, 0.5, var_532_12)

					arg_529_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_529_1.var_.characterEffect1055ui_story.fillRatio = var_532_13
				end
			end

			if arg_529_1.time_ >= var_532_10 + var_532_11 and arg_529_1.time_ < var_532_10 + var_532_11 + arg_532_0 and arg_529_1.var_.characterEffect1055ui_story then
				local var_532_14 = 0.5

				arg_529_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_529_1.var_.characterEffect1055ui_story.fillRatio = var_532_14
			end

			local var_532_15 = arg_529_1.actors_["1093ui_story"].transform
			local var_532_16 = 0

			if var_532_16 < arg_529_1.time_ and arg_529_1.time_ <= var_532_16 + arg_532_0 then
				arg_529_1.var_.moveOldPos1093ui_story = var_532_15.localPosition
			end

			local var_532_17 = 0.001

			if var_532_16 <= arg_529_1.time_ and arg_529_1.time_ < var_532_16 + var_532_17 then
				local var_532_18 = (arg_529_1.time_ - var_532_16) / var_532_17
				local var_532_19 = Vector3.New(0, -1.11, -5.88)

				var_532_15.localPosition = Vector3.Lerp(arg_529_1.var_.moveOldPos1093ui_story, var_532_19, var_532_18)

				local var_532_20 = manager.ui.mainCamera.transform.position - var_532_15.position

				var_532_15.forward = Vector3.New(var_532_20.x, var_532_20.y, var_532_20.z)

				local var_532_21 = var_532_15.localEulerAngles

				var_532_21.z = 0
				var_532_21.x = 0
				var_532_15.localEulerAngles = var_532_21
			end

			if arg_529_1.time_ >= var_532_16 + var_532_17 and arg_529_1.time_ < var_532_16 + var_532_17 + arg_532_0 then
				var_532_15.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_532_22 = manager.ui.mainCamera.transform.position - var_532_15.position

				var_532_15.forward = Vector3.New(var_532_22.x, var_532_22.y, var_532_22.z)

				local var_532_23 = var_532_15.localEulerAngles

				var_532_23.z = 0
				var_532_23.x = 0
				var_532_15.localEulerAngles = var_532_23
			end

			local var_532_24 = arg_529_1.actors_["1093ui_story"]
			local var_532_25 = 0

			if var_532_25 < arg_529_1.time_ and arg_529_1.time_ <= var_532_25 + arg_532_0 and arg_529_1.var_.characterEffect1093ui_story == nil then
				arg_529_1.var_.characterEffect1093ui_story = var_532_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_26 = 0.200000002980232

			if var_532_25 <= arg_529_1.time_ and arg_529_1.time_ < var_532_25 + var_532_26 then
				local var_532_27 = (arg_529_1.time_ - var_532_25) / var_532_26

				if arg_529_1.var_.characterEffect1093ui_story then
					arg_529_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_529_1.time_ >= var_532_25 + var_532_26 and arg_529_1.time_ < var_532_25 + var_532_26 + arg_532_0 and arg_529_1.var_.characterEffect1093ui_story then
				arg_529_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_532_28 = 0

			if var_532_28 < arg_529_1.time_ and arg_529_1.time_ <= var_532_28 + arg_532_0 then
				arg_529_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_532_29 = 0

			if var_532_29 < arg_529_1.time_ and arg_529_1.time_ <= var_532_29 + arg_532_0 then
				arg_529_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_532_30 = 0
			local var_532_31 = 0.225

			if var_532_30 < arg_529_1.time_ and arg_529_1.time_ <= var_532_30 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_32 = arg_529_1:FormatText(StoryNameCfg[73].name)

				arg_529_1.leftNameTxt_.text = var_532_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_33 = arg_529_1:GetWordFromCfg(123101132)
				local var_532_34 = arg_529_1:FormatText(var_532_33.content)

				arg_529_1.text_.text = var_532_34

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_35 = 9
				local var_532_36 = utf8.len(var_532_34)
				local var_532_37 = var_532_35 <= 0 and var_532_31 or var_532_31 * (var_532_36 / var_532_35)

				if var_532_37 > 0 and var_532_31 < var_532_37 then
					arg_529_1.talkMaxDuration = var_532_37

					if var_532_37 + var_532_30 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_37 + var_532_30
					end
				end

				arg_529_1.text_.text = var_532_34
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101132", "story_v_out_123101.awb") ~= 0 then
					local var_532_38 = manager.audio:GetVoiceLength("story_v_out_123101", "123101132", "story_v_out_123101.awb") / 1000

					if var_532_38 + var_532_30 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_38 + var_532_30
					end

					if var_532_33.prefab_name ~= "" and arg_529_1.actors_[var_532_33.prefab_name] ~= nil then
						local var_532_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_529_1.actors_[var_532_33.prefab_name].transform, "story_v_out_123101", "123101132", "story_v_out_123101.awb")

						arg_529_1:RecordAudio("123101132", var_532_39)
						arg_529_1:RecordAudio("123101132", var_532_39)
					else
						arg_529_1:AudioAction("play", "voice", "story_v_out_123101", "123101132", "story_v_out_123101.awb")
					end

					arg_529_1:RecordHistoryTalkVoice("story_v_out_123101", "123101132", "story_v_out_123101.awb")
				end

				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_40 = math.max(var_532_31, arg_529_1.talkMaxDuration)

			if var_532_30 <= arg_529_1.time_ and arg_529_1.time_ < var_532_30 + var_532_40 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_30) / var_532_40

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_30 + var_532_40 and arg_529_1.time_ < var_532_30 + var_532_40 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play123101133 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 123101133
		arg_533_1.duration_ = 2.366

		local var_533_0 = {
			zh = 2.366,
			ja = 1.999999999999
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
				arg_533_0:Play123101134(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = arg_533_1.actors_["1093ui_story"]
			local var_536_1 = 0

			if var_536_1 < arg_533_1.time_ and arg_533_1.time_ <= var_536_1 + arg_536_0 and arg_533_1.var_.characterEffect1093ui_story == nil then
				arg_533_1.var_.characterEffect1093ui_story = var_536_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_2 = 0.200000002980232

			if var_536_1 <= arg_533_1.time_ and arg_533_1.time_ < var_536_1 + var_536_2 then
				local var_536_3 = (arg_533_1.time_ - var_536_1) / var_536_2

				if arg_533_1.var_.characterEffect1093ui_story then
					local var_536_4 = Mathf.Lerp(0, 0.5, var_536_3)

					arg_533_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_533_1.var_.characterEffect1093ui_story.fillRatio = var_536_4
				end
			end

			if arg_533_1.time_ >= var_536_1 + var_536_2 and arg_533_1.time_ < var_536_1 + var_536_2 + arg_536_0 and arg_533_1.var_.characterEffect1093ui_story then
				local var_536_5 = 0.5

				arg_533_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_533_1.var_.characterEffect1093ui_story.fillRatio = var_536_5
			end

			local var_536_6 = 0

			if var_536_6 < arg_533_1.time_ and arg_533_1.time_ <= var_536_6 + arg_536_0 then
				arg_533_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_536_7 = 0
			local var_536_8 = 0.15

			if var_536_7 < arg_533_1.time_ and arg_533_1.time_ <= var_536_7 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_9 = arg_533_1:FormatText(StoryNameCfg[497].name)

				arg_533_1.leftNameTxt_.text = var_536_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, true)
				arg_533_1.iconController_:SetSelectedState("hero")

				arg_533_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_10 = arg_533_1:GetWordFromCfg(123101133)
				local var_536_11 = arg_533_1:FormatText(var_536_10.content)

				arg_533_1.text_.text = var_536_11

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_12 = 6
				local var_536_13 = utf8.len(var_536_11)
				local var_536_14 = var_536_12 <= 0 and var_536_8 or var_536_8 * (var_536_13 / var_536_12)

				if var_536_14 > 0 and var_536_8 < var_536_14 then
					arg_533_1.talkMaxDuration = var_536_14

					if var_536_14 + var_536_7 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_14 + var_536_7
					end
				end

				arg_533_1.text_.text = var_536_11
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101133", "story_v_out_123101.awb") ~= 0 then
					local var_536_15 = manager.audio:GetVoiceLength("story_v_out_123101", "123101133", "story_v_out_123101.awb") / 1000

					if var_536_15 + var_536_7 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_15 + var_536_7
					end

					if var_536_10.prefab_name ~= "" and arg_533_1.actors_[var_536_10.prefab_name] ~= nil then
						local var_536_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_533_1.actors_[var_536_10.prefab_name].transform, "story_v_out_123101", "123101133", "story_v_out_123101.awb")

						arg_533_1:RecordAudio("123101133", var_536_16)
						arg_533_1:RecordAudio("123101133", var_536_16)
					else
						arg_533_1:AudioAction("play", "voice", "story_v_out_123101", "123101133", "story_v_out_123101.awb")
					end

					arg_533_1:RecordHistoryTalkVoice("story_v_out_123101", "123101133", "story_v_out_123101.awb")
				end

				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_17 = math.max(var_536_8, arg_533_1.talkMaxDuration)

			if var_536_7 <= arg_533_1.time_ and arg_533_1.time_ < var_536_7 + var_536_17 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_7) / var_536_17

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_7 + var_536_17 and arg_533_1.time_ < var_536_7 + var_536_17 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play123101134 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 123101134
		arg_537_1.duration_ = 6.066

		local var_537_0 = {
			zh = 3.666,
			ja = 6.066
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
				arg_537_0:Play123101135(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = arg_537_1.actors_["1055ui_story"].transform
			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 then
				arg_537_1.var_.moveOldPos1055ui_story = var_540_0.localPosition
			end

			local var_540_2 = 0.001

			if var_540_1 <= arg_537_1.time_ and arg_537_1.time_ < var_540_1 + var_540_2 then
				local var_540_3 = (arg_537_1.time_ - var_540_1) / var_540_2
				local var_540_4 = Vector3.New(0, -0.965, -6.2)

				var_540_0.localPosition = Vector3.Lerp(arg_537_1.var_.moveOldPos1055ui_story, var_540_4, var_540_3)

				local var_540_5 = manager.ui.mainCamera.transform.position - var_540_0.position

				var_540_0.forward = Vector3.New(var_540_5.x, var_540_5.y, var_540_5.z)

				local var_540_6 = var_540_0.localEulerAngles

				var_540_6.z = 0
				var_540_6.x = 0
				var_540_0.localEulerAngles = var_540_6
			end

			if arg_537_1.time_ >= var_540_1 + var_540_2 and arg_537_1.time_ < var_540_1 + var_540_2 + arg_540_0 then
				var_540_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_540_7 = manager.ui.mainCamera.transform.position - var_540_0.position

				var_540_0.forward = Vector3.New(var_540_7.x, var_540_7.y, var_540_7.z)

				local var_540_8 = var_540_0.localEulerAngles

				var_540_8.z = 0
				var_540_8.x = 0
				var_540_0.localEulerAngles = var_540_8
			end

			local var_540_9 = arg_537_1.actors_["1055ui_story"]
			local var_540_10 = 0

			if var_540_10 < arg_537_1.time_ and arg_537_1.time_ <= var_540_10 + arg_540_0 and arg_537_1.var_.characterEffect1055ui_story == nil then
				arg_537_1.var_.characterEffect1055ui_story = var_540_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_540_11 = 0.200000002980232

			if var_540_10 <= arg_537_1.time_ and arg_537_1.time_ < var_540_10 + var_540_11 then
				local var_540_12 = (arg_537_1.time_ - var_540_10) / var_540_11

				if arg_537_1.var_.characterEffect1055ui_story then
					arg_537_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_537_1.time_ >= var_540_10 + var_540_11 and arg_537_1.time_ < var_540_10 + var_540_11 + arg_540_0 and arg_537_1.var_.characterEffect1055ui_story then
				arg_537_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_540_13 = 0

			if var_540_13 < arg_537_1.time_ and arg_537_1.time_ <= var_540_13 + arg_540_0 then
				arg_537_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_540_14 = 0

			if var_540_14 < arg_537_1.time_ and arg_537_1.time_ <= var_540_14 + arg_540_0 then
				arg_537_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_540_15 = arg_537_1.actors_["1093ui_story"].transform
			local var_540_16 = 0

			if var_540_16 < arg_537_1.time_ and arg_537_1.time_ <= var_540_16 + arg_540_0 then
				arg_537_1.var_.moveOldPos1093ui_story = var_540_15.localPosition
			end

			local var_540_17 = 0.001

			if var_540_16 <= arg_537_1.time_ and arg_537_1.time_ < var_540_16 + var_540_17 then
				local var_540_18 = (arg_537_1.time_ - var_540_16) / var_540_17
				local var_540_19 = Vector3.New(0, 100, 0)

				var_540_15.localPosition = Vector3.Lerp(arg_537_1.var_.moveOldPos1093ui_story, var_540_19, var_540_18)

				local var_540_20 = manager.ui.mainCamera.transform.position - var_540_15.position

				var_540_15.forward = Vector3.New(var_540_20.x, var_540_20.y, var_540_20.z)

				local var_540_21 = var_540_15.localEulerAngles

				var_540_21.z = 0
				var_540_21.x = 0
				var_540_15.localEulerAngles = var_540_21
			end

			if arg_537_1.time_ >= var_540_16 + var_540_17 and arg_537_1.time_ < var_540_16 + var_540_17 + arg_540_0 then
				var_540_15.localPosition = Vector3.New(0, 100, 0)

				local var_540_22 = manager.ui.mainCamera.transform.position - var_540_15.position

				var_540_15.forward = Vector3.New(var_540_22.x, var_540_22.y, var_540_22.z)

				local var_540_23 = var_540_15.localEulerAngles

				var_540_23.z = 0
				var_540_23.x = 0
				var_540_15.localEulerAngles = var_540_23
			end

			local var_540_24 = 0
			local var_540_25 = 0.425

			if var_540_24 < arg_537_1.time_ and arg_537_1.time_ <= var_540_24 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_26 = arg_537_1:FormatText(StoryNameCfg[481].name)

				arg_537_1.leftNameTxt_.text = var_540_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_27 = arg_537_1:GetWordFromCfg(123101134)
				local var_540_28 = arg_537_1:FormatText(var_540_27.content)

				arg_537_1.text_.text = var_540_28

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_29 = 17
				local var_540_30 = utf8.len(var_540_28)
				local var_540_31 = var_540_29 <= 0 and var_540_25 or var_540_25 * (var_540_30 / var_540_29)

				if var_540_31 > 0 and var_540_25 < var_540_31 then
					arg_537_1.talkMaxDuration = var_540_31

					if var_540_31 + var_540_24 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_31 + var_540_24
					end
				end

				arg_537_1.text_.text = var_540_28
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101134", "story_v_out_123101.awb") ~= 0 then
					local var_540_32 = manager.audio:GetVoiceLength("story_v_out_123101", "123101134", "story_v_out_123101.awb") / 1000

					if var_540_32 + var_540_24 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_32 + var_540_24
					end

					if var_540_27.prefab_name ~= "" and arg_537_1.actors_[var_540_27.prefab_name] ~= nil then
						local var_540_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_27.prefab_name].transform, "story_v_out_123101", "123101134", "story_v_out_123101.awb")

						arg_537_1:RecordAudio("123101134", var_540_33)
						arg_537_1:RecordAudio("123101134", var_540_33)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_out_123101", "123101134", "story_v_out_123101.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_out_123101", "123101134", "story_v_out_123101.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_34 = math.max(var_540_25, arg_537_1.talkMaxDuration)

			if var_540_24 <= arg_537_1.time_ and arg_537_1.time_ < var_540_24 + var_540_34 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_24) / var_540_34

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_24 + var_540_34 and arg_537_1.time_ < var_540_24 + var_540_34 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play123101135 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 123101135
		arg_541_1.duration_ = 3.9

		local var_541_0 = {
			zh = 3.9,
			ja = 3.566
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
				arg_541_0:Play123101136(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = arg_541_1.actors_["1055ui_story"]
			local var_544_1 = 0

			if var_544_1 < arg_541_1.time_ and arg_541_1.time_ <= var_544_1 + arg_544_0 and arg_541_1.var_.characterEffect1055ui_story == nil then
				arg_541_1.var_.characterEffect1055ui_story = var_544_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_544_2 = 0.200000002980232

			if var_544_1 <= arg_541_1.time_ and arg_541_1.time_ < var_544_1 + var_544_2 then
				local var_544_3 = (arg_541_1.time_ - var_544_1) / var_544_2

				if arg_541_1.var_.characterEffect1055ui_story then
					local var_544_4 = Mathf.Lerp(0, 0.5, var_544_3)

					arg_541_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_541_1.var_.characterEffect1055ui_story.fillRatio = var_544_4
				end
			end

			if arg_541_1.time_ >= var_544_1 + var_544_2 and arg_541_1.time_ < var_544_1 + var_544_2 + arg_544_0 and arg_541_1.var_.characterEffect1055ui_story then
				local var_544_5 = 0.5

				arg_541_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_541_1.var_.characterEffect1055ui_story.fillRatio = var_544_5
			end

			local var_544_6 = 0
			local var_544_7 = 0.425

			if var_544_6 < arg_541_1.time_ and arg_541_1.time_ <= var_544_6 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_8 = arg_541_1:FormatText(StoryNameCfg[497].name)

				arg_541_1.leftNameTxt_.text = var_544_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, true)
				arg_541_1.iconController_:SetSelectedState("hero")

				arg_541_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_9 = arg_541_1:GetWordFromCfg(123101135)
				local var_544_10 = arg_541_1:FormatText(var_544_9.content)

				arg_541_1.text_.text = var_544_10

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_11 = 17
				local var_544_12 = utf8.len(var_544_10)
				local var_544_13 = var_544_11 <= 0 and var_544_7 or var_544_7 * (var_544_12 / var_544_11)

				if var_544_13 > 0 and var_544_7 < var_544_13 then
					arg_541_1.talkMaxDuration = var_544_13

					if var_544_13 + var_544_6 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_13 + var_544_6
					end
				end

				arg_541_1.text_.text = var_544_10
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101135", "story_v_out_123101.awb") ~= 0 then
					local var_544_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101135", "story_v_out_123101.awb") / 1000

					if var_544_14 + var_544_6 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_14 + var_544_6
					end

					if var_544_9.prefab_name ~= "" and arg_541_1.actors_[var_544_9.prefab_name] ~= nil then
						local var_544_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_541_1.actors_[var_544_9.prefab_name].transform, "story_v_out_123101", "123101135", "story_v_out_123101.awb")

						arg_541_1:RecordAudio("123101135", var_544_15)
						arg_541_1:RecordAudio("123101135", var_544_15)
					else
						arg_541_1:AudioAction("play", "voice", "story_v_out_123101", "123101135", "story_v_out_123101.awb")
					end

					arg_541_1:RecordHistoryTalkVoice("story_v_out_123101", "123101135", "story_v_out_123101.awb")
				end

				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_16 = math.max(var_544_7, arg_541_1.talkMaxDuration)

			if var_544_6 <= arg_541_1.time_ and arg_541_1.time_ < var_544_6 + var_544_16 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_6) / var_544_16

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_6 + var_544_16 and arg_541_1.time_ < var_544_6 + var_544_16 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play123101136 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 123101136
		arg_545_1.duration_ = 4.733

		local var_545_0 = {
			zh = 4.266,
			ja = 4.733
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
				arg_545_0:Play123101137(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = arg_545_1.actors_["1055ui_story"]
			local var_548_1 = 0

			if var_548_1 < arg_545_1.time_ and arg_545_1.time_ <= var_548_1 + arg_548_0 and arg_545_1.var_.characterEffect1055ui_story == nil then
				arg_545_1.var_.characterEffect1055ui_story = var_548_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_548_2 = 0.200000002980232

			if var_548_1 <= arg_545_1.time_ and arg_545_1.time_ < var_548_1 + var_548_2 then
				local var_548_3 = (arg_545_1.time_ - var_548_1) / var_548_2

				if arg_545_1.var_.characterEffect1055ui_story then
					arg_545_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_545_1.time_ >= var_548_1 + var_548_2 and arg_545_1.time_ < var_548_1 + var_548_2 + arg_548_0 and arg_545_1.var_.characterEffect1055ui_story then
				arg_545_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_548_4 = 0

			if var_548_4 < arg_545_1.time_ and arg_545_1.time_ <= var_548_4 + arg_548_0 then
				arg_545_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_548_5 = 0

			if var_548_5 < arg_545_1.time_ and arg_545_1.time_ <= var_548_5 + arg_548_0 then
				arg_545_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_548_6 = 0
			local var_548_7 = 0.4

			if var_548_6 < arg_545_1.time_ and arg_545_1.time_ <= var_548_6 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_8 = arg_545_1:FormatText(StoryNameCfg[481].name)

				arg_545_1.leftNameTxt_.text = var_548_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_9 = arg_545_1:GetWordFromCfg(123101136)
				local var_548_10 = arg_545_1:FormatText(var_548_9.content)

				arg_545_1.text_.text = var_548_10

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_11 = 16
				local var_548_12 = utf8.len(var_548_10)
				local var_548_13 = var_548_11 <= 0 and var_548_7 or var_548_7 * (var_548_12 / var_548_11)

				if var_548_13 > 0 and var_548_7 < var_548_13 then
					arg_545_1.talkMaxDuration = var_548_13

					if var_548_13 + var_548_6 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_13 + var_548_6
					end
				end

				arg_545_1.text_.text = var_548_10
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101136", "story_v_out_123101.awb") ~= 0 then
					local var_548_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101136", "story_v_out_123101.awb") / 1000

					if var_548_14 + var_548_6 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_14 + var_548_6
					end

					if var_548_9.prefab_name ~= "" and arg_545_1.actors_[var_548_9.prefab_name] ~= nil then
						local var_548_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_545_1.actors_[var_548_9.prefab_name].transform, "story_v_out_123101", "123101136", "story_v_out_123101.awb")

						arg_545_1:RecordAudio("123101136", var_548_15)
						arg_545_1:RecordAudio("123101136", var_548_15)
					else
						arg_545_1:AudioAction("play", "voice", "story_v_out_123101", "123101136", "story_v_out_123101.awb")
					end

					arg_545_1:RecordHistoryTalkVoice("story_v_out_123101", "123101136", "story_v_out_123101.awb")
				end

				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_16 = math.max(var_548_7, arg_545_1.talkMaxDuration)

			if var_548_6 <= arg_545_1.time_ and arg_545_1.time_ < var_548_6 + var_548_16 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_6) / var_548_16

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_6 + var_548_16 and arg_545_1.time_ < var_548_6 + var_548_16 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play123101137 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 123101137
		arg_549_1.duration_ = 7.533

		local var_549_0 = {
			zh = 4.6,
			ja = 7.533
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
				arg_549_0:Play123101138(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = arg_549_1.actors_["1055ui_story"]
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 and arg_549_1.var_.characterEffect1055ui_story == nil then
				arg_549_1.var_.characterEffect1055ui_story = var_552_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_552_2 = 0.200000002980232

			if var_552_1 <= arg_549_1.time_ and arg_549_1.time_ < var_552_1 + var_552_2 then
				local var_552_3 = (arg_549_1.time_ - var_552_1) / var_552_2

				if arg_549_1.var_.characterEffect1055ui_story then
					local var_552_4 = Mathf.Lerp(0, 0.5, var_552_3)

					arg_549_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_549_1.var_.characterEffect1055ui_story.fillRatio = var_552_4
				end
			end

			if arg_549_1.time_ >= var_552_1 + var_552_2 and arg_549_1.time_ < var_552_1 + var_552_2 + arg_552_0 and arg_549_1.var_.characterEffect1055ui_story then
				local var_552_5 = 0.5

				arg_549_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_549_1.var_.characterEffect1055ui_story.fillRatio = var_552_5
			end

			local var_552_6 = 0
			local var_552_7 = 0.5

			if var_552_6 < arg_549_1.time_ and arg_549_1.time_ <= var_552_6 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_8 = arg_549_1:FormatText(StoryNameCfg[497].name)

				arg_549_1.leftNameTxt_.text = var_552_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, true)
				arg_549_1.iconController_:SetSelectedState("hero")

				arg_549_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_9 = arg_549_1:GetWordFromCfg(123101137)
				local var_552_10 = arg_549_1:FormatText(var_552_9.content)

				arg_549_1.text_.text = var_552_10

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_11 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101137", "story_v_out_123101.awb") ~= 0 then
					local var_552_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101137", "story_v_out_123101.awb") / 1000

					if var_552_14 + var_552_6 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_14 + var_552_6
					end

					if var_552_9.prefab_name ~= "" and arg_549_1.actors_[var_552_9.prefab_name] ~= nil then
						local var_552_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_549_1.actors_[var_552_9.prefab_name].transform, "story_v_out_123101", "123101137", "story_v_out_123101.awb")

						arg_549_1:RecordAudio("123101137", var_552_15)
						arg_549_1:RecordAudio("123101137", var_552_15)
					else
						arg_549_1:AudioAction("play", "voice", "story_v_out_123101", "123101137", "story_v_out_123101.awb")
					end

					arg_549_1:RecordHistoryTalkVoice("story_v_out_123101", "123101137", "story_v_out_123101.awb")
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
	Play123101138 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 123101138
		arg_553_1.duration_ = 9.066

		local var_553_0 = {
			zh = 6.8,
			ja = 9.066
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
				arg_553_0:Play123101139(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = arg_553_1.actors_["1055ui_story"]
			local var_556_1 = 0

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 and arg_553_1.var_.characterEffect1055ui_story == nil then
				arg_553_1.var_.characterEffect1055ui_story = var_556_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_556_2 = 0.200000002980232

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / var_556_2

				if arg_553_1.var_.characterEffect1055ui_story then
					arg_553_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 and arg_553_1.var_.characterEffect1055ui_story then
				arg_553_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_556_4 = 0

			if var_556_4 < arg_553_1.time_ and arg_553_1.time_ <= var_556_4 + arg_556_0 then
				arg_553_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_556_5 = 0

			if var_556_5 < arg_553_1.time_ and arg_553_1.time_ <= var_556_5 + arg_556_0 then
				arg_553_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_556_6 = 0
			local var_556_7 = 0.675

			if var_556_6 < arg_553_1.time_ and arg_553_1.time_ <= var_556_6 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, true)

				local var_556_8 = arg_553_1:FormatText(StoryNameCfg[481].name)

				arg_553_1.leftNameTxt_.text = var_556_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_553_1.leftNameTxt_.transform)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1.leftNameTxt_.text)
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_9 = arg_553_1:GetWordFromCfg(123101138)
				local var_556_10 = arg_553_1:FormatText(var_556_9.content)

				arg_553_1.text_.text = var_556_10

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_11 = 27
				local var_556_12 = utf8.len(var_556_10)
				local var_556_13 = var_556_11 <= 0 and var_556_7 or var_556_7 * (var_556_12 / var_556_11)

				if var_556_13 > 0 and var_556_7 < var_556_13 then
					arg_553_1.talkMaxDuration = var_556_13

					if var_556_13 + var_556_6 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_13 + var_556_6
					end
				end

				arg_553_1.text_.text = var_556_10
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101138", "story_v_out_123101.awb") ~= 0 then
					local var_556_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101138", "story_v_out_123101.awb") / 1000

					if var_556_14 + var_556_6 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_14 + var_556_6
					end

					if var_556_9.prefab_name ~= "" and arg_553_1.actors_[var_556_9.prefab_name] ~= nil then
						local var_556_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_553_1.actors_[var_556_9.prefab_name].transform, "story_v_out_123101", "123101138", "story_v_out_123101.awb")

						arg_553_1:RecordAudio("123101138", var_556_15)
						arg_553_1:RecordAudio("123101138", var_556_15)
					else
						arg_553_1:AudioAction("play", "voice", "story_v_out_123101", "123101138", "story_v_out_123101.awb")
					end

					arg_553_1:RecordHistoryTalkVoice("story_v_out_123101", "123101138", "story_v_out_123101.awb")
				end

				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_16 = math.max(var_556_7, arg_553_1.talkMaxDuration)

			if var_556_6 <= arg_553_1.time_ and arg_553_1.time_ < var_556_6 + var_556_16 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_6) / var_556_16

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_6 + var_556_16 and arg_553_1.time_ < var_556_6 + var_556_16 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play123101139 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 123101139
		arg_557_1.duration_ = 11.2

		local var_557_0 = {
			zh = 11.2,
			ja = 8.7
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
				arg_557_0:Play123101140(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = 0
			local var_560_1 = 1.15

			if var_560_0 < arg_557_1.time_ and arg_557_1.time_ <= var_560_0 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, true)

				local var_560_2 = arg_557_1:FormatText(StoryNameCfg[481].name)

				arg_557_1.leftNameTxt_.text = var_560_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_557_1.leftNameTxt_.transform)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1.leftNameTxt_.text)
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_3 = arg_557_1:GetWordFromCfg(123101139)
				local var_560_4 = arg_557_1:FormatText(var_560_3.content)

				arg_557_1.text_.text = var_560_4

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101139", "story_v_out_123101.awb") ~= 0 then
					local var_560_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101139", "story_v_out_123101.awb") / 1000

					if var_560_8 + var_560_0 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_8 + var_560_0
					end

					if var_560_3.prefab_name ~= "" and arg_557_1.actors_[var_560_3.prefab_name] ~= nil then
						local var_560_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_557_1.actors_[var_560_3.prefab_name].transform, "story_v_out_123101", "123101139", "story_v_out_123101.awb")

						arg_557_1:RecordAudio("123101139", var_560_9)
						arg_557_1:RecordAudio("123101139", var_560_9)
					else
						arg_557_1:AudioAction("play", "voice", "story_v_out_123101", "123101139", "story_v_out_123101.awb")
					end

					arg_557_1:RecordHistoryTalkVoice("story_v_out_123101", "123101139", "story_v_out_123101.awb")
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
	Play123101140 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 123101140
		arg_561_1.duration_ = 4.2

		local var_561_0 = {
			zh = 2.066,
			ja = 4.2
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
				arg_561_0:Play123101141(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = arg_561_1.actors_["1055ui_story"]
			local var_564_1 = 0

			if var_564_1 < arg_561_1.time_ and arg_561_1.time_ <= var_564_1 + arg_564_0 and arg_561_1.var_.characterEffect1055ui_story == nil then
				arg_561_1.var_.characterEffect1055ui_story = var_564_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_2 = 0.200000002980232

			if var_564_1 <= arg_561_1.time_ and arg_561_1.time_ < var_564_1 + var_564_2 then
				local var_564_3 = (arg_561_1.time_ - var_564_1) / var_564_2

				if arg_561_1.var_.characterEffect1055ui_story then
					local var_564_4 = Mathf.Lerp(0, 0.5, var_564_3)

					arg_561_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_561_1.var_.characterEffect1055ui_story.fillRatio = var_564_4
				end
			end

			if arg_561_1.time_ >= var_564_1 + var_564_2 and arg_561_1.time_ < var_564_1 + var_564_2 + arg_564_0 and arg_561_1.var_.characterEffect1055ui_story then
				local var_564_5 = 0.5

				arg_561_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_561_1.var_.characterEffect1055ui_story.fillRatio = var_564_5
			end

			local var_564_6 = 0
			local var_564_7 = 0.2

			if var_564_6 < arg_561_1.time_ and arg_561_1.time_ <= var_564_6 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, true)

				local var_564_8 = arg_561_1:FormatText(StoryNameCfg[497].name)

				arg_561_1.leftNameTxt_.text = var_564_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_561_1.leftNameTxt_.transform)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1.leftNameTxt_.text)
				SetActive(arg_561_1.iconTrs_.gameObject, true)
				arg_561_1.iconController_:SetSelectedState("hero")

				arg_561_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_9 = arg_561_1:GetWordFromCfg(123101140)
				local var_564_10 = arg_561_1:FormatText(var_564_9.content)

				arg_561_1.text_.text = var_564_10

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_11 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101140", "story_v_out_123101.awb") ~= 0 then
					local var_564_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101140", "story_v_out_123101.awb") / 1000

					if var_564_14 + var_564_6 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_14 + var_564_6
					end

					if var_564_9.prefab_name ~= "" and arg_561_1.actors_[var_564_9.prefab_name] ~= nil then
						local var_564_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_561_1.actors_[var_564_9.prefab_name].transform, "story_v_out_123101", "123101140", "story_v_out_123101.awb")

						arg_561_1:RecordAudio("123101140", var_564_15)
						arg_561_1:RecordAudio("123101140", var_564_15)
					else
						arg_561_1:AudioAction("play", "voice", "story_v_out_123101", "123101140", "story_v_out_123101.awb")
					end

					arg_561_1:RecordHistoryTalkVoice("story_v_out_123101", "123101140", "story_v_out_123101.awb")
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
	Play123101141 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 123101141
		arg_565_1.duration_ = 1.999999999999

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play123101142(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = arg_565_1.actors_["1055ui_story"]
			local var_568_1 = 0

			if var_568_1 < arg_565_1.time_ and arg_565_1.time_ <= var_568_1 + arg_568_0 and arg_565_1.var_.characterEffect1055ui_story == nil then
				arg_565_1.var_.characterEffect1055ui_story = var_568_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_568_2 = 0.200000002980232

			if var_568_1 <= arg_565_1.time_ and arg_565_1.time_ < var_568_1 + var_568_2 then
				local var_568_3 = (arg_565_1.time_ - var_568_1) / var_568_2

				if arg_565_1.var_.characterEffect1055ui_story then
					arg_565_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_565_1.time_ >= var_568_1 + var_568_2 and arg_565_1.time_ < var_568_1 + var_568_2 + arg_568_0 and arg_565_1.var_.characterEffect1055ui_story then
				arg_565_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_568_4 = 0

			if var_568_4 < arg_565_1.time_ and arg_565_1.time_ <= var_568_4 + arg_568_0 then
				arg_565_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_568_5 = 0

			if var_568_5 < arg_565_1.time_ and arg_565_1.time_ <= var_568_5 + arg_568_0 then
				arg_565_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_568_6 = 0
			local var_568_7 = 0.1

			if var_568_6 < arg_565_1.time_ and arg_565_1.time_ <= var_568_6 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, true)

				local var_568_8 = arg_565_1:FormatText(StoryNameCfg[481].name)

				arg_565_1.leftNameTxt_.text = var_568_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_565_1.leftNameTxt_.transform)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1.leftNameTxt_.text)
				SetActive(arg_565_1.iconTrs_.gameObject, false)
				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_9 = arg_565_1:GetWordFromCfg(123101141)
				local var_568_10 = arg_565_1:FormatText(var_568_9.content)

				arg_565_1.text_.text = var_568_10

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_11 = 4
				local var_568_12 = utf8.len(var_568_10)
				local var_568_13 = var_568_11 <= 0 and var_568_7 or var_568_7 * (var_568_12 / var_568_11)

				if var_568_13 > 0 and var_568_7 < var_568_13 then
					arg_565_1.talkMaxDuration = var_568_13

					if var_568_13 + var_568_6 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_13 + var_568_6
					end
				end

				arg_565_1.text_.text = var_568_10
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101141", "story_v_out_123101.awb") ~= 0 then
					local var_568_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101141", "story_v_out_123101.awb") / 1000

					if var_568_14 + var_568_6 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_14 + var_568_6
					end

					if var_568_9.prefab_name ~= "" and arg_565_1.actors_[var_568_9.prefab_name] ~= nil then
						local var_568_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_565_1.actors_[var_568_9.prefab_name].transform, "story_v_out_123101", "123101141", "story_v_out_123101.awb")

						arg_565_1:RecordAudio("123101141", var_568_15)
						arg_565_1:RecordAudio("123101141", var_568_15)
					else
						arg_565_1:AudioAction("play", "voice", "story_v_out_123101", "123101141", "story_v_out_123101.awb")
					end

					arg_565_1:RecordHistoryTalkVoice("story_v_out_123101", "123101141", "story_v_out_123101.awb")
				end

				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_16 = math.max(var_568_7, arg_565_1.talkMaxDuration)

			if var_568_6 <= arg_565_1.time_ and arg_565_1.time_ < var_568_6 + var_568_16 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_6) / var_568_16

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_6 + var_568_16 and arg_565_1.time_ < var_568_6 + var_568_16 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play123101142 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 123101142
		arg_569_1.duration_ = 4.666

		local var_569_0 = {
			zh = 4.566,
			ja = 4.666
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
				arg_569_0:Play123101143(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = arg_569_1.actors_["1055ui_story"]
			local var_572_1 = 0

			if var_572_1 < arg_569_1.time_ and arg_569_1.time_ <= var_572_1 + arg_572_0 and arg_569_1.var_.characterEffect1055ui_story == nil then
				arg_569_1.var_.characterEffect1055ui_story = var_572_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_572_2 = 0.200000002980232

			if var_572_1 <= arg_569_1.time_ and arg_569_1.time_ < var_572_1 + var_572_2 then
				local var_572_3 = (arg_569_1.time_ - var_572_1) / var_572_2

				if arg_569_1.var_.characterEffect1055ui_story then
					local var_572_4 = Mathf.Lerp(0, 0.5, var_572_3)

					arg_569_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_569_1.var_.characterEffect1055ui_story.fillRatio = var_572_4
				end
			end

			if arg_569_1.time_ >= var_572_1 + var_572_2 and arg_569_1.time_ < var_572_1 + var_572_2 + arg_572_0 and arg_569_1.var_.characterEffect1055ui_story then
				local var_572_5 = 0.5

				arg_569_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_569_1.var_.characterEffect1055ui_story.fillRatio = var_572_5
			end

			local var_572_6 = 0
			local var_572_7 = 0.325

			if var_572_6 < arg_569_1.time_ and arg_569_1.time_ <= var_572_6 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, true)

				local var_572_8 = arg_569_1:FormatText(StoryNameCfg[497].name)

				arg_569_1.leftNameTxt_.text = var_572_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_569_1.leftNameTxt_.transform)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1.leftNameTxt_.text)
				SetActive(arg_569_1.iconTrs_.gameObject, true)
				arg_569_1.iconController_:SetSelectedState("hero")

				arg_569_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_9 = arg_569_1:GetWordFromCfg(123101142)
				local var_572_10 = arg_569_1:FormatText(var_572_9.content)

				arg_569_1.text_.text = var_572_10

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_11 = 13
				local var_572_12 = utf8.len(var_572_10)
				local var_572_13 = var_572_11 <= 0 and var_572_7 or var_572_7 * (var_572_12 / var_572_11)

				if var_572_13 > 0 and var_572_7 < var_572_13 then
					arg_569_1.talkMaxDuration = var_572_13

					if var_572_13 + var_572_6 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_13 + var_572_6
					end
				end

				arg_569_1.text_.text = var_572_10
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101142", "story_v_out_123101.awb") ~= 0 then
					local var_572_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101142", "story_v_out_123101.awb") / 1000

					if var_572_14 + var_572_6 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_14 + var_572_6
					end

					if var_572_9.prefab_name ~= "" and arg_569_1.actors_[var_572_9.prefab_name] ~= nil then
						local var_572_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_569_1.actors_[var_572_9.prefab_name].transform, "story_v_out_123101", "123101142", "story_v_out_123101.awb")

						arg_569_1:RecordAudio("123101142", var_572_15)
						arg_569_1:RecordAudio("123101142", var_572_15)
					else
						arg_569_1:AudioAction("play", "voice", "story_v_out_123101", "123101142", "story_v_out_123101.awb")
					end

					arg_569_1:RecordHistoryTalkVoice("story_v_out_123101", "123101142", "story_v_out_123101.awb")
				end

				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_16 = math.max(var_572_7, arg_569_1.talkMaxDuration)

			if var_572_6 <= arg_569_1.time_ and arg_569_1.time_ < var_572_6 + var_572_16 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_6) / var_572_16

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_6 + var_572_16 and arg_569_1.time_ < var_572_6 + var_572_16 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play123101143 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 123101143
		arg_573_1.duration_ = 9

		local var_573_0 = {
			zh = 5.433,
			ja = 9
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
				arg_573_0:Play123101144(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = arg_573_1.actors_["1055ui_story"]
			local var_576_1 = 0

			if var_576_1 < arg_573_1.time_ and arg_573_1.time_ <= var_576_1 + arg_576_0 and arg_573_1.var_.characterEffect1055ui_story == nil then
				arg_573_1.var_.characterEffect1055ui_story = var_576_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_576_2 = 0.200000002980232

			if var_576_1 <= arg_573_1.time_ and arg_573_1.time_ < var_576_1 + var_576_2 then
				local var_576_3 = (arg_573_1.time_ - var_576_1) / var_576_2

				if arg_573_1.var_.characterEffect1055ui_story then
					arg_573_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_573_1.time_ >= var_576_1 + var_576_2 and arg_573_1.time_ < var_576_1 + var_576_2 + arg_576_0 and arg_573_1.var_.characterEffect1055ui_story then
				arg_573_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_576_4 = 0

			if var_576_4 < arg_573_1.time_ and arg_573_1.time_ <= var_576_4 + arg_576_0 then
				arg_573_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_576_5 = 0

			if var_576_5 < arg_573_1.time_ and arg_573_1.time_ <= var_576_5 + arg_576_0 then
				arg_573_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_576_6 = 0
			local var_576_7 = 0.575

			if var_576_6 < arg_573_1.time_ and arg_573_1.time_ <= var_576_6 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, true)

				local var_576_8 = arg_573_1:FormatText(StoryNameCfg[481].name)

				arg_573_1.leftNameTxt_.text = var_576_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_573_1.leftNameTxt_.transform)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1.leftNameTxt_.text)
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_9 = arg_573_1:GetWordFromCfg(123101143)
				local var_576_10 = arg_573_1:FormatText(var_576_9.content)

				arg_573_1.text_.text = var_576_10

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_11 = 23
				local var_576_12 = utf8.len(var_576_10)
				local var_576_13 = var_576_11 <= 0 and var_576_7 or var_576_7 * (var_576_12 / var_576_11)

				if var_576_13 > 0 and var_576_7 < var_576_13 then
					arg_573_1.talkMaxDuration = var_576_13

					if var_576_13 + var_576_6 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_13 + var_576_6
					end
				end

				arg_573_1.text_.text = var_576_10
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101143", "story_v_out_123101.awb") ~= 0 then
					local var_576_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101143", "story_v_out_123101.awb") / 1000

					if var_576_14 + var_576_6 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_14 + var_576_6
					end

					if var_576_9.prefab_name ~= "" and arg_573_1.actors_[var_576_9.prefab_name] ~= nil then
						local var_576_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_573_1.actors_[var_576_9.prefab_name].transform, "story_v_out_123101", "123101143", "story_v_out_123101.awb")

						arg_573_1:RecordAudio("123101143", var_576_15)
						arg_573_1:RecordAudio("123101143", var_576_15)
					else
						arg_573_1:AudioAction("play", "voice", "story_v_out_123101", "123101143", "story_v_out_123101.awb")
					end

					arg_573_1:RecordHistoryTalkVoice("story_v_out_123101", "123101143", "story_v_out_123101.awb")
				end

				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_16 = math.max(var_576_7, arg_573_1.talkMaxDuration)

			if var_576_6 <= arg_573_1.time_ and arg_573_1.time_ < var_576_6 + var_576_16 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_6) / var_576_16

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_6 + var_576_16 and arg_573_1.time_ < var_576_6 + var_576_16 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play123101144 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 123101144
		arg_577_1.duration_ = 3.1

		local var_577_0 = {
			zh = 3.1,
			ja = 1.8
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
				arg_577_0:Play123101145(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = arg_577_1.actors_["1055ui_story"]
			local var_580_1 = 0

			if var_580_1 < arg_577_1.time_ and arg_577_1.time_ <= var_580_1 + arg_580_0 and arg_577_1.var_.characterEffect1055ui_story == nil then
				arg_577_1.var_.characterEffect1055ui_story = var_580_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_2 = 0.200000002980232

			if var_580_1 <= arg_577_1.time_ and arg_577_1.time_ < var_580_1 + var_580_2 then
				local var_580_3 = (arg_577_1.time_ - var_580_1) / var_580_2

				if arg_577_1.var_.characterEffect1055ui_story then
					local var_580_4 = Mathf.Lerp(0, 0.5, var_580_3)

					arg_577_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_577_1.var_.characterEffect1055ui_story.fillRatio = var_580_4
				end
			end

			if arg_577_1.time_ >= var_580_1 + var_580_2 and arg_577_1.time_ < var_580_1 + var_580_2 + arg_580_0 and arg_577_1.var_.characterEffect1055ui_story then
				local var_580_5 = 0.5

				arg_577_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_577_1.var_.characterEffect1055ui_story.fillRatio = var_580_5
			end

			local var_580_6 = 0
			local var_580_7 = 0.225

			if var_580_6 < arg_577_1.time_ and arg_577_1.time_ <= var_580_6 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, true)

				local var_580_8 = arg_577_1:FormatText(StoryNameCfg[497].name)

				arg_577_1.leftNameTxt_.text = var_580_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_577_1.leftNameTxt_.transform)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1.leftNameTxt_.text)
				SetActive(arg_577_1.iconTrs_.gameObject, true)
				arg_577_1.iconController_:SetSelectedState("hero")

				arg_577_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_9 = arg_577_1:GetWordFromCfg(123101144)
				local var_580_10 = arg_577_1:FormatText(var_580_9.content)

				arg_577_1.text_.text = var_580_10

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_11 = 9
				local var_580_12 = utf8.len(var_580_10)
				local var_580_13 = var_580_11 <= 0 and var_580_7 or var_580_7 * (var_580_12 / var_580_11)

				if var_580_13 > 0 and var_580_7 < var_580_13 then
					arg_577_1.talkMaxDuration = var_580_13

					if var_580_13 + var_580_6 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_13 + var_580_6
					end
				end

				arg_577_1.text_.text = var_580_10
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101144", "story_v_out_123101.awb") ~= 0 then
					local var_580_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101144", "story_v_out_123101.awb") / 1000

					if var_580_14 + var_580_6 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_14 + var_580_6
					end

					if var_580_9.prefab_name ~= "" and arg_577_1.actors_[var_580_9.prefab_name] ~= nil then
						local var_580_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_577_1.actors_[var_580_9.prefab_name].transform, "story_v_out_123101", "123101144", "story_v_out_123101.awb")

						arg_577_1:RecordAudio("123101144", var_580_15)
						arg_577_1:RecordAudio("123101144", var_580_15)
					else
						arg_577_1:AudioAction("play", "voice", "story_v_out_123101", "123101144", "story_v_out_123101.awb")
					end

					arg_577_1:RecordHistoryTalkVoice("story_v_out_123101", "123101144", "story_v_out_123101.awb")
				end

				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_16 = math.max(var_580_7, arg_577_1.talkMaxDuration)

			if var_580_6 <= arg_577_1.time_ and arg_577_1.time_ < var_580_6 + var_580_16 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_6) / var_580_16

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_6 + var_580_16 and arg_577_1.time_ < var_580_6 + var_580_16 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play123101145 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 123101145
		arg_581_1.duration_ = 12.5

		local var_581_0 = {
			zh = 9.233,
			ja = 12.5
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
				arg_581_0:Play123101146(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = arg_581_1.actors_["1055ui_story"]
			local var_584_1 = 0

			if var_584_1 < arg_581_1.time_ and arg_581_1.time_ <= var_584_1 + arg_584_0 and arg_581_1.var_.characterEffect1055ui_story == nil then
				arg_581_1.var_.characterEffect1055ui_story = var_584_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_584_2 = 0.200000002980232

			if var_584_1 <= arg_581_1.time_ and arg_581_1.time_ < var_584_1 + var_584_2 then
				local var_584_3 = (arg_581_1.time_ - var_584_1) / var_584_2

				if arg_581_1.var_.characterEffect1055ui_story then
					arg_581_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_581_1.time_ >= var_584_1 + var_584_2 and arg_581_1.time_ < var_584_1 + var_584_2 + arg_584_0 and arg_581_1.var_.characterEffect1055ui_story then
				arg_581_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_584_4 = 0

			if var_584_4 < arg_581_1.time_ and arg_581_1.time_ <= var_584_4 + arg_584_0 then
				arg_581_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action7_1")
			end

			local var_584_5 = 0

			if var_584_5 < arg_581_1.time_ and arg_581_1.time_ <= var_584_5 + arg_584_0 then
				arg_581_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_584_6 = 0
			local var_584_7 = 0.9

			if var_584_6 < arg_581_1.time_ and arg_581_1.time_ <= var_584_6 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_8 = arg_581_1:FormatText(StoryNameCfg[481].name)

				arg_581_1.leftNameTxt_.text = var_584_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_9 = arg_581_1:GetWordFromCfg(123101145)
				local var_584_10 = arg_581_1:FormatText(var_584_9.content)

				arg_581_1.text_.text = var_584_10

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_11 = 36
				local var_584_12 = utf8.len(var_584_10)
				local var_584_13 = var_584_11 <= 0 and var_584_7 or var_584_7 * (var_584_12 / var_584_11)

				if var_584_13 > 0 and var_584_7 < var_584_13 then
					arg_581_1.talkMaxDuration = var_584_13

					if var_584_13 + var_584_6 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_13 + var_584_6
					end
				end

				arg_581_1.text_.text = var_584_10
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101145", "story_v_out_123101.awb") ~= 0 then
					local var_584_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101145", "story_v_out_123101.awb") / 1000

					if var_584_14 + var_584_6 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_14 + var_584_6
					end

					if var_584_9.prefab_name ~= "" and arg_581_1.actors_[var_584_9.prefab_name] ~= nil then
						local var_584_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_581_1.actors_[var_584_9.prefab_name].transform, "story_v_out_123101", "123101145", "story_v_out_123101.awb")

						arg_581_1:RecordAudio("123101145", var_584_15)
						arg_581_1:RecordAudio("123101145", var_584_15)
					else
						arg_581_1:AudioAction("play", "voice", "story_v_out_123101", "123101145", "story_v_out_123101.awb")
					end

					arg_581_1:RecordHistoryTalkVoice("story_v_out_123101", "123101145", "story_v_out_123101.awb")
				end

				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_16 = math.max(var_584_7, arg_581_1.talkMaxDuration)

			if var_584_6 <= arg_581_1.time_ and arg_581_1.time_ < var_584_6 + var_584_16 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_6) / var_584_16

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_6 + var_584_16 and arg_581_1.time_ < var_584_6 + var_584_16 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play123101146 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 123101146
		arg_585_1.duration_ = 7.633

		local var_585_0 = {
			zh = 4.6,
			ja = 7.633
		}
		local var_585_1 = manager.audio:GetLocalizationFlag()

		if var_585_0[var_585_1] ~= nil then
			arg_585_1.duration_ = var_585_0[var_585_1]
		end

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play123101147(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = 0

			if var_588_0 < arg_585_1.time_ and arg_585_1.time_ <= var_588_0 + arg_588_0 then
				arg_585_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_588_1 = 0
			local var_588_2 = 0.425

			if var_588_1 < arg_585_1.time_ and arg_585_1.time_ <= var_588_1 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_3 = arg_585_1:FormatText(StoryNameCfg[481].name)

				arg_585_1.leftNameTxt_.text = var_588_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_4 = arg_585_1:GetWordFromCfg(123101146)
				local var_588_5 = arg_585_1:FormatText(var_588_4.content)

				arg_585_1.text_.text = var_588_5

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_6 = 17
				local var_588_7 = utf8.len(var_588_5)
				local var_588_8 = var_588_6 <= 0 and var_588_2 or var_588_2 * (var_588_7 / var_588_6)

				if var_588_8 > 0 and var_588_2 < var_588_8 then
					arg_585_1.talkMaxDuration = var_588_8

					if var_588_8 + var_588_1 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_8 + var_588_1
					end
				end

				arg_585_1.text_.text = var_588_5
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101146", "story_v_out_123101.awb") ~= 0 then
					local var_588_9 = manager.audio:GetVoiceLength("story_v_out_123101", "123101146", "story_v_out_123101.awb") / 1000

					if var_588_9 + var_588_1 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_9 + var_588_1
					end

					if var_588_4.prefab_name ~= "" and arg_585_1.actors_[var_588_4.prefab_name] ~= nil then
						local var_588_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_585_1.actors_[var_588_4.prefab_name].transform, "story_v_out_123101", "123101146", "story_v_out_123101.awb")

						arg_585_1:RecordAudio("123101146", var_588_10)
						arg_585_1:RecordAudio("123101146", var_588_10)
					else
						arg_585_1:AudioAction("play", "voice", "story_v_out_123101", "123101146", "story_v_out_123101.awb")
					end

					arg_585_1:RecordHistoryTalkVoice("story_v_out_123101", "123101146", "story_v_out_123101.awb")
				end

				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_11 = math.max(var_588_2, arg_585_1.talkMaxDuration)

			if var_588_1 <= arg_585_1.time_ and arg_585_1.time_ < var_588_1 + var_588_11 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_1) / var_588_11

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_1 + var_588_11 and arg_585_1.time_ < var_588_1 + var_588_11 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play123101147 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 123101147
		arg_589_1.duration_ = 6.466

		local var_589_0 = {
			zh = 5.166,
			ja = 6.466
		}
		local var_589_1 = manager.audio:GetLocalizationFlag()

		if var_589_0[var_589_1] ~= nil then
			arg_589_1.duration_ = var_589_0[var_589_1]
		end

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play123101148(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = arg_589_1.actors_["1055ui_story"]
			local var_592_1 = 0

			if var_592_1 < arg_589_1.time_ and arg_589_1.time_ <= var_592_1 + arg_592_0 and arg_589_1.var_.characterEffect1055ui_story == nil then
				arg_589_1.var_.characterEffect1055ui_story = var_592_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_592_2 = 0.200000002980232

			if var_592_1 <= arg_589_1.time_ and arg_589_1.time_ < var_592_1 + var_592_2 then
				local var_592_3 = (arg_589_1.time_ - var_592_1) / var_592_2

				if arg_589_1.var_.characterEffect1055ui_story then
					local var_592_4 = Mathf.Lerp(0, 0.5, var_592_3)

					arg_589_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_589_1.var_.characterEffect1055ui_story.fillRatio = var_592_4
				end
			end

			if arg_589_1.time_ >= var_592_1 + var_592_2 and arg_589_1.time_ < var_592_1 + var_592_2 + arg_592_0 and arg_589_1.var_.characterEffect1055ui_story then
				local var_592_5 = 0.5

				arg_589_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_589_1.var_.characterEffect1055ui_story.fillRatio = var_592_5
			end

			local var_592_6 = 0
			local var_592_7 = 0.525

			if var_592_6 < arg_589_1.time_ and arg_589_1.time_ <= var_592_6 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0
				arg_589_1.dialogCg_.alpha = 1

				arg_589_1.dialog_:SetActive(true)
				SetActive(arg_589_1.leftNameGo_, true)

				local var_592_8 = arg_589_1:FormatText(StoryNameCfg[497].name)

				arg_589_1.leftNameTxt_.text = var_592_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_589_1.leftNameTxt_.transform)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1.leftNameTxt_.text)
				SetActive(arg_589_1.iconTrs_.gameObject, true)
				arg_589_1.iconController_:SetSelectedState("hero")

				arg_589_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_9 = arg_589_1:GetWordFromCfg(123101147)
				local var_592_10 = arg_589_1:FormatText(var_592_9.content)

				arg_589_1.text_.text = var_592_10

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_11 = 21
				local var_592_12 = utf8.len(var_592_10)
				local var_592_13 = var_592_11 <= 0 and var_592_7 or var_592_7 * (var_592_12 / var_592_11)

				if var_592_13 > 0 and var_592_7 < var_592_13 then
					arg_589_1.talkMaxDuration = var_592_13

					if var_592_13 + var_592_6 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_13 + var_592_6
					end
				end

				arg_589_1.text_.text = var_592_10
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101147", "story_v_out_123101.awb") ~= 0 then
					local var_592_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101147", "story_v_out_123101.awb") / 1000

					if var_592_14 + var_592_6 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_14 + var_592_6
					end

					if var_592_9.prefab_name ~= "" and arg_589_1.actors_[var_592_9.prefab_name] ~= nil then
						local var_592_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_589_1.actors_[var_592_9.prefab_name].transform, "story_v_out_123101", "123101147", "story_v_out_123101.awb")

						arg_589_1:RecordAudio("123101147", var_592_15)
						arg_589_1:RecordAudio("123101147", var_592_15)
					else
						arg_589_1:AudioAction("play", "voice", "story_v_out_123101", "123101147", "story_v_out_123101.awb")
					end

					arg_589_1:RecordHistoryTalkVoice("story_v_out_123101", "123101147", "story_v_out_123101.awb")
				end

				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_16 = math.max(var_592_7, arg_589_1.talkMaxDuration)

			if var_592_6 <= arg_589_1.time_ and arg_589_1.time_ < var_592_6 + var_592_16 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_6) / var_592_16

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_6 + var_592_16 and arg_589_1.time_ < var_592_6 + var_592_16 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play123101148 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 123101148
		arg_593_1.duration_ = 11.8

		local var_593_0 = {
			zh = 11.8,
			ja = 8.3
		}
		local var_593_1 = manager.audio:GetLocalizationFlag()

		if var_593_0[var_593_1] ~= nil then
			arg_593_1.duration_ = var_593_0[var_593_1]
		end

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play123101149(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = 0
			local var_596_1 = 1.025

			if var_596_0 < arg_593_1.time_ and arg_593_1.time_ <= var_596_0 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0
				arg_593_1.dialogCg_.alpha = 1

				arg_593_1.dialog_:SetActive(true)
				SetActive(arg_593_1.leftNameGo_, true)

				local var_596_2 = arg_593_1:FormatText(StoryNameCfg[497].name)

				arg_593_1.leftNameTxt_.text = var_596_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_593_1.leftNameTxt_.transform)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1.leftNameTxt_.text)
				SetActive(arg_593_1.iconTrs_.gameObject, true)
				arg_593_1.iconController_:SetSelectedState("hero")

				arg_593_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_3 = arg_593_1:GetWordFromCfg(123101148)
				local var_596_4 = arg_593_1:FormatText(var_596_3.content)

				arg_593_1.text_.text = var_596_4

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_5 = 41
				local var_596_6 = utf8.len(var_596_4)
				local var_596_7 = var_596_5 <= 0 and var_596_1 or var_596_1 * (var_596_6 / var_596_5)

				if var_596_7 > 0 and var_596_1 < var_596_7 then
					arg_593_1.talkMaxDuration = var_596_7

					if var_596_7 + var_596_0 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_7 + var_596_0
					end
				end

				arg_593_1.text_.text = var_596_4
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101148", "story_v_out_123101.awb") ~= 0 then
					local var_596_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101148", "story_v_out_123101.awb") / 1000

					if var_596_8 + var_596_0 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_8 + var_596_0
					end

					if var_596_3.prefab_name ~= "" and arg_593_1.actors_[var_596_3.prefab_name] ~= nil then
						local var_596_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_593_1.actors_[var_596_3.prefab_name].transform, "story_v_out_123101", "123101148", "story_v_out_123101.awb")

						arg_593_1:RecordAudio("123101148", var_596_9)
						arg_593_1:RecordAudio("123101148", var_596_9)
					else
						arg_593_1:AudioAction("play", "voice", "story_v_out_123101", "123101148", "story_v_out_123101.awb")
					end

					arg_593_1:RecordHistoryTalkVoice("story_v_out_123101", "123101148", "story_v_out_123101.awb")
				end

				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_10 = math.max(var_596_1, arg_593_1.talkMaxDuration)

			if var_596_0 <= arg_593_1.time_ and arg_593_1.time_ < var_596_0 + var_596_10 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_0) / var_596_10

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_0 + var_596_10 and arg_593_1.time_ < var_596_0 + var_596_10 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play123101149 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 123101149
		arg_597_1.duration_ = 11.166

		local var_597_0 = {
			zh = 10.166,
			ja = 11.166
		}
		local var_597_1 = manager.audio:GetLocalizationFlag()

		if var_597_0[var_597_1] ~= nil then
			arg_597_1.duration_ = var_597_0[var_597_1]
		end

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play123101150(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = 0
			local var_600_1 = 1.225

			if var_600_0 < arg_597_1.time_ and arg_597_1.time_ <= var_600_0 + arg_600_0 then
				arg_597_1.talkMaxDuration = 0
				arg_597_1.dialogCg_.alpha = 1

				arg_597_1.dialog_:SetActive(true)
				SetActive(arg_597_1.leftNameGo_, true)

				local var_600_2 = arg_597_1:FormatText(StoryNameCfg[497].name)

				arg_597_1.leftNameTxt_.text = var_600_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_597_1.leftNameTxt_.transform)

				arg_597_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_597_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_597_1:RecordName(arg_597_1.leftNameTxt_.text)
				SetActive(arg_597_1.iconTrs_.gameObject, true)
				arg_597_1.iconController_:SetSelectedState("hero")

				arg_597_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_597_1.callingController_:SetSelectedState("normal")

				local var_600_3 = arg_597_1:GetWordFromCfg(123101149)
				local var_600_4 = arg_597_1:FormatText(var_600_3.content)

				arg_597_1.text_.text = var_600_4

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.text_)

				local var_600_5 = 49
				local var_600_6 = utf8.len(var_600_4)
				local var_600_7 = var_600_5 <= 0 and var_600_1 or var_600_1 * (var_600_6 / var_600_5)

				if var_600_7 > 0 and var_600_1 < var_600_7 then
					arg_597_1.talkMaxDuration = var_600_7

					if var_600_7 + var_600_0 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_7 + var_600_0
					end
				end

				arg_597_1.text_.text = var_600_4
				arg_597_1.typewritter.percent = 0

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101149", "story_v_out_123101.awb") ~= 0 then
					local var_600_8 = manager.audio:GetVoiceLength("story_v_out_123101", "123101149", "story_v_out_123101.awb") / 1000

					if var_600_8 + var_600_0 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_8 + var_600_0
					end

					if var_600_3.prefab_name ~= "" and arg_597_1.actors_[var_600_3.prefab_name] ~= nil then
						local var_600_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_597_1.actors_[var_600_3.prefab_name].transform, "story_v_out_123101", "123101149", "story_v_out_123101.awb")

						arg_597_1:RecordAudio("123101149", var_600_9)
						arg_597_1:RecordAudio("123101149", var_600_9)
					else
						arg_597_1:AudioAction("play", "voice", "story_v_out_123101", "123101149", "story_v_out_123101.awb")
					end

					arg_597_1:RecordHistoryTalkVoice("story_v_out_123101", "123101149", "story_v_out_123101.awb")
				end

				arg_597_1:RecordContent(arg_597_1.text_.text)
			end

			local var_600_10 = math.max(var_600_1, arg_597_1.talkMaxDuration)

			if var_600_0 <= arg_597_1.time_ and arg_597_1.time_ < var_600_0 + var_600_10 then
				arg_597_1.typewritter.percent = (arg_597_1.time_ - var_600_0) / var_600_10

				arg_597_1.typewritter:SetDirty()
			end

			if arg_597_1.time_ >= var_600_0 + var_600_10 and arg_597_1.time_ < var_600_0 + var_600_10 + arg_600_0 then
				arg_597_1.typewritter.percent = 1

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(true)
			end
		end
	end,
	Play123101150 = function(arg_601_0, arg_601_1)
		arg_601_1.time_ = 0
		arg_601_1.frameCnt_ = 0
		arg_601_1.state_ = "playing"
		arg_601_1.curTalkId_ = 123101150
		arg_601_1.duration_ = 1.999999999999

		SetActive(arg_601_1.tipsGo_, false)

		function arg_601_1.onSingleLineFinish_()
			arg_601_1.onSingleLineUpdate_ = nil
			arg_601_1.onSingleLineFinish_ = nil
			arg_601_1.state_ = "waiting"
		end

		function arg_601_1.playNext_(arg_603_0)
			if arg_603_0 == 1 then
				arg_601_0:Play123101151(arg_601_1)
			end
		end

		function arg_601_1.onSingleLineUpdate_(arg_604_0)
			local var_604_0 = arg_601_1.actors_["1055ui_story"]
			local var_604_1 = 0

			if var_604_1 < arg_601_1.time_ and arg_601_1.time_ <= var_604_1 + arg_604_0 and arg_601_1.var_.characterEffect1055ui_story == nil then
				arg_601_1.var_.characterEffect1055ui_story = var_604_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_604_2 = 0.200000002980232

			if var_604_1 <= arg_601_1.time_ and arg_601_1.time_ < var_604_1 + var_604_2 then
				local var_604_3 = (arg_601_1.time_ - var_604_1) / var_604_2

				if arg_601_1.var_.characterEffect1055ui_story then
					arg_601_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_601_1.time_ >= var_604_1 + var_604_2 and arg_601_1.time_ < var_604_1 + var_604_2 + arg_604_0 and arg_601_1.var_.characterEffect1055ui_story then
				arg_601_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_604_4 = 0

			if var_604_4 < arg_601_1.time_ and arg_601_1.time_ <= var_604_4 + arg_604_0 then
				arg_601_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_604_5 = 0
			local var_604_6 = 0.125

			if var_604_5 < arg_601_1.time_ and arg_601_1.time_ <= var_604_5 + arg_604_0 then
				arg_601_1.talkMaxDuration = 0
				arg_601_1.dialogCg_.alpha = 1

				arg_601_1.dialog_:SetActive(true)
				SetActive(arg_601_1.leftNameGo_, true)

				local var_604_7 = arg_601_1:FormatText(StoryNameCfg[481].name)

				arg_601_1.leftNameTxt_.text = var_604_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_601_1.leftNameTxt_.transform)

				arg_601_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_601_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_601_1:RecordName(arg_601_1.leftNameTxt_.text)
				SetActive(arg_601_1.iconTrs_.gameObject, false)
				arg_601_1.callingController_:SetSelectedState("normal")

				local var_604_8 = arg_601_1:GetWordFromCfg(123101150)
				local var_604_9 = arg_601_1:FormatText(var_604_8.content)

				arg_601_1.text_.text = var_604_9

				LuaForUtil.ClearLinePrefixSymbol(arg_601_1.text_)

				local var_604_10 = 5
				local var_604_11 = utf8.len(var_604_9)
				local var_604_12 = var_604_10 <= 0 and var_604_6 or var_604_6 * (var_604_11 / var_604_10)

				if var_604_12 > 0 and var_604_6 < var_604_12 then
					arg_601_1.talkMaxDuration = var_604_12

					if var_604_12 + var_604_5 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_12 + var_604_5
					end
				end

				arg_601_1.text_.text = var_604_9
				arg_601_1.typewritter.percent = 0

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101150", "story_v_out_123101.awb") ~= 0 then
					local var_604_13 = manager.audio:GetVoiceLength("story_v_out_123101", "123101150", "story_v_out_123101.awb") / 1000

					if var_604_13 + var_604_5 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_13 + var_604_5
					end

					if var_604_8.prefab_name ~= "" and arg_601_1.actors_[var_604_8.prefab_name] ~= nil then
						local var_604_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_601_1.actors_[var_604_8.prefab_name].transform, "story_v_out_123101", "123101150", "story_v_out_123101.awb")

						arg_601_1:RecordAudio("123101150", var_604_14)
						arg_601_1:RecordAudio("123101150", var_604_14)
					else
						arg_601_1:AudioAction("play", "voice", "story_v_out_123101", "123101150", "story_v_out_123101.awb")
					end

					arg_601_1:RecordHistoryTalkVoice("story_v_out_123101", "123101150", "story_v_out_123101.awb")
				end

				arg_601_1:RecordContent(arg_601_1.text_.text)
			end

			local var_604_15 = math.max(var_604_6, arg_601_1.talkMaxDuration)

			if var_604_5 <= arg_601_1.time_ and arg_601_1.time_ < var_604_5 + var_604_15 then
				arg_601_1.typewritter.percent = (arg_601_1.time_ - var_604_5) / var_604_15

				arg_601_1.typewritter:SetDirty()
			end

			if arg_601_1.time_ >= var_604_5 + var_604_15 and arg_601_1.time_ < var_604_5 + var_604_15 + arg_604_0 then
				arg_601_1.typewritter.percent = 1

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(true)
			end
		end
	end,
	Play123101151 = function(arg_605_0, arg_605_1)
		arg_605_1.time_ = 0
		arg_605_1.frameCnt_ = 0
		arg_605_1.state_ = "playing"
		arg_605_1.curTalkId_ = 123101151
		arg_605_1.duration_ = 1.466

		local var_605_0 = {
			zh = 1.233,
			ja = 1.466
		}
		local var_605_1 = manager.audio:GetLocalizationFlag()

		if var_605_0[var_605_1] ~= nil then
			arg_605_1.duration_ = var_605_0[var_605_1]
		end

		SetActive(arg_605_1.tipsGo_, false)

		function arg_605_1.onSingleLineFinish_()
			arg_605_1.onSingleLineUpdate_ = nil
			arg_605_1.onSingleLineFinish_ = nil
			arg_605_1.state_ = "waiting"
		end

		function arg_605_1.playNext_(arg_607_0)
			if arg_607_0 == 1 then
				arg_605_0:Play123101152(arg_605_1)
			end
		end

		function arg_605_1.onSingleLineUpdate_(arg_608_0)
			local var_608_0 = arg_605_1.actors_["1055ui_story"]
			local var_608_1 = 0

			if var_608_1 < arg_605_1.time_ and arg_605_1.time_ <= var_608_1 + arg_608_0 and arg_605_1.var_.characterEffect1055ui_story == nil then
				arg_605_1.var_.characterEffect1055ui_story = var_608_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_608_2 = 0.200000002980232

			if var_608_1 <= arg_605_1.time_ and arg_605_1.time_ < var_608_1 + var_608_2 then
				local var_608_3 = (arg_605_1.time_ - var_608_1) / var_608_2

				if arg_605_1.var_.characterEffect1055ui_story then
					local var_608_4 = Mathf.Lerp(0, 0.5, var_608_3)

					arg_605_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_605_1.var_.characterEffect1055ui_story.fillRatio = var_608_4
				end
			end

			if arg_605_1.time_ >= var_608_1 + var_608_2 and arg_605_1.time_ < var_608_1 + var_608_2 + arg_608_0 and arg_605_1.var_.characterEffect1055ui_story then
				local var_608_5 = 0.5

				arg_605_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_605_1.var_.characterEffect1055ui_story.fillRatio = var_608_5
			end

			local var_608_6 = 0
			local var_608_7 = 0.1

			if var_608_6 < arg_605_1.time_ and arg_605_1.time_ <= var_608_6 + arg_608_0 then
				arg_605_1.talkMaxDuration = 0
				arg_605_1.dialogCg_.alpha = 1

				arg_605_1.dialog_:SetActive(true)
				SetActive(arg_605_1.leftNameGo_, true)

				local var_608_8 = arg_605_1:FormatText(StoryNameCfg[497].name)

				arg_605_1.leftNameTxt_.text = var_608_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_605_1.leftNameTxt_.transform)

				arg_605_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_605_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_605_1:RecordName(arg_605_1.leftNameTxt_.text)
				SetActive(arg_605_1.iconTrs_.gameObject, true)
				arg_605_1.iconController_:SetSelectedState("hero")

				arg_605_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_605_1.callingController_:SetSelectedState("normal")

				local var_608_9 = arg_605_1:GetWordFromCfg(123101151)
				local var_608_10 = arg_605_1:FormatText(var_608_9.content)

				arg_605_1.text_.text = var_608_10

				LuaForUtil.ClearLinePrefixSymbol(arg_605_1.text_)

				local var_608_11 = 4
				local var_608_12 = utf8.len(var_608_10)
				local var_608_13 = var_608_11 <= 0 and var_608_7 or var_608_7 * (var_608_12 / var_608_11)

				if var_608_13 > 0 and var_608_7 < var_608_13 then
					arg_605_1.talkMaxDuration = var_608_13

					if var_608_13 + var_608_6 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_13 + var_608_6
					end
				end

				arg_605_1.text_.text = var_608_10
				arg_605_1.typewritter.percent = 0

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101151", "story_v_out_123101.awb") ~= 0 then
					local var_608_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101151", "story_v_out_123101.awb") / 1000

					if var_608_14 + var_608_6 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_14 + var_608_6
					end

					if var_608_9.prefab_name ~= "" and arg_605_1.actors_[var_608_9.prefab_name] ~= nil then
						local var_608_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_605_1.actors_[var_608_9.prefab_name].transform, "story_v_out_123101", "123101151", "story_v_out_123101.awb")

						arg_605_1:RecordAudio("123101151", var_608_15)
						arg_605_1:RecordAudio("123101151", var_608_15)
					else
						arg_605_1:AudioAction("play", "voice", "story_v_out_123101", "123101151", "story_v_out_123101.awb")
					end

					arg_605_1:RecordHistoryTalkVoice("story_v_out_123101", "123101151", "story_v_out_123101.awb")
				end

				arg_605_1:RecordContent(arg_605_1.text_.text)
			end

			local var_608_16 = math.max(var_608_7, arg_605_1.talkMaxDuration)

			if var_608_6 <= arg_605_1.time_ and arg_605_1.time_ < var_608_6 + var_608_16 then
				arg_605_1.typewritter.percent = (arg_605_1.time_ - var_608_6) / var_608_16

				arg_605_1.typewritter:SetDirty()
			end

			if arg_605_1.time_ >= var_608_6 + var_608_16 and arg_605_1.time_ < var_608_6 + var_608_16 + arg_608_0 then
				arg_605_1.typewritter.percent = 1

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(true)
			end
		end
	end,
	Play123101152 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 123101152
		arg_609_1.duration_ = 5.866

		local var_609_0 = {
			zh = 3.466,
			ja = 5.866
		}
		local var_609_1 = manager.audio:GetLocalizationFlag()

		if var_609_0[var_609_1] ~= nil then
			arg_609_1.duration_ = var_609_0[var_609_1]
		end

		SetActive(arg_609_1.tipsGo_, false)

		function arg_609_1.onSingleLineFinish_()
			arg_609_1.onSingleLineUpdate_ = nil
			arg_609_1.onSingleLineFinish_ = nil
			arg_609_1.state_ = "waiting"
		end

		function arg_609_1.playNext_(arg_611_0)
			if arg_611_0 == 1 then
				arg_609_0:Play123101153(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = arg_609_1.actors_["1055ui_story"]
			local var_612_1 = 0

			if var_612_1 < arg_609_1.time_ and arg_609_1.time_ <= var_612_1 + arg_612_0 and arg_609_1.var_.characterEffect1055ui_story == nil then
				arg_609_1.var_.characterEffect1055ui_story = var_612_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_612_2 = 0.200000002980232

			if var_612_1 <= arg_609_1.time_ and arg_609_1.time_ < var_612_1 + var_612_2 then
				local var_612_3 = (arg_609_1.time_ - var_612_1) / var_612_2

				if arg_609_1.var_.characterEffect1055ui_story then
					arg_609_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_609_1.time_ >= var_612_1 + var_612_2 and arg_609_1.time_ < var_612_1 + var_612_2 + arg_612_0 and arg_609_1.var_.characterEffect1055ui_story then
				arg_609_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_612_4 = 0

			if var_612_4 < arg_609_1.time_ and arg_609_1.time_ <= var_612_4 + arg_612_0 then
				arg_609_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055actionlink/1055action472")
			end

			local var_612_5 = 0

			if var_612_5 < arg_609_1.time_ and arg_609_1.time_ <= var_612_5 + arg_612_0 then
				arg_609_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_612_6 = 0
			local var_612_7 = 0.175

			if var_612_6 < arg_609_1.time_ and arg_609_1.time_ <= var_612_6 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0
				arg_609_1.dialogCg_.alpha = 1

				arg_609_1.dialog_:SetActive(true)
				SetActive(arg_609_1.leftNameGo_, true)

				local var_612_8 = arg_609_1:FormatText(StoryNameCfg[481].name)

				arg_609_1.leftNameTxt_.text = var_612_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_609_1.leftNameTxt_.transform)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1.leftNameTxt_.text)
				SetActive(arg_609_1.iconTrs_.gameObject, false)
				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_9 = arg_609_1:GetWordFromCfg(123101152)
				local var_612_10 = arg_609_1:FormatText(var_612_9.content)

				arg_609_1.text_.text = var_612_10

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_11 = 7
				local var_612_12 = utf8.len(var_612_10)
				local var_612_13 = var_612_11 <= 0 and var_612_7 or var_612_7 * (var_612_12 / var_612_11)

				if var_612_13 > 0 and var_612_7 < var_612_13 then
					arg_609_1.talkMaxDuration = var_612_13

					if var_612_13 + var_612_6 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_13 + var_612_6
					end
				end

				arg_609_1.text_.text = var_612_10
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101152", "story_v_out_123101.awb") ~= 0 then
					local var_612_14 = manager.audio:GetVoiceLength("story_v_out_123101", "123101152", "story_v_out_123101.awb") / 1000

					if var_612_14 + var_612_6 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_14 + var_612_6
					end

					if var_612_9.prefab_name ~= "" and arg_609_1.actors_[var_612_9.prefab_name] ~= nil then
						local var_612_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_609_1.actors_[var_612_9.prefab_name].transform, "story_v_out_123101", "123101152", "story_v_out_123101.awb")

						arg_609_1:RecordAudio("123101152", var_612_15)
						arg_609_1:RecordAudio("123101152", var_612_15)
					else
						arg_609_1:AudioAction("play", "voice", "story_v_out_123101", "123101152", "story_v_out_123101.awb")
					end

					arg_609_1:RecordHistoryTalkVoice("story_v_out_123101", "123101152", "story_v_out_123101.awb")
				end

				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_16 = math.max(var_612_7, arg_609_1.talkMaxDuration)

			if var_612_6 <= arg_609_1.time_ and arg_609_1.time_ < var_612_6 + var_612_16 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_6) / var_612_16

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_6 + var_612_16 and arg_609_1.time_ < var_612_6 + var_612_16 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play123101153 = function(arg_613_0, arg_613_1)
		arg_613_1.time_ = 0
		arg_613_1.frameCnt_ = 0
		arg_613_1.state_ = "playing"
		arg_613_1.curTalkId_ = 123101153
		arg_613_1.duration_ = 5

		SetActive(arg_613_1.tipsGo_, false)

		function arg_613_1.onSingleLineFinish_()
			arg_613_1.onSingleLineUpdate_ = nil
			arg_613_1.onSingleLineFinish_ = nil
			arg_613_1.state_ = "waiting"
		end

		function arg_613_1.playNext_(arg_615_0)
			if arg_615_0 == 1 then
				arg_613_0:Play123101154(arg_613_1)
			end
		end

		function arg_613_1.onSingleLineUpdate_(arg_616_0)
			local var_616_0 = arg_613_1.actors_["1055ui_story"].transform
			local var_616_1 = 0

			if var_616_1 < arg_613_1.time_ and arg_613_1.time_ <= var_616_1 + arg_616_0 then
				arg_613_1.var_.moveOldPos1055ui_story = var_616_0.localPosition
			end

			local var_616_2 = 0.001

			if var_616_1 <= arg_613_1.time_ and arg_613_1.time_ < var_616_1 + var_616_2 then
				local var_616_3 = (arg_613_1.time_ - var_616_1) / var_616_2
				local var_616_4 = Vector3.New(0, 100, 0)

				var_616_0.localPosition = Vector3.Lerp(arg_613_1.var_.moveOldPos1055ui_story, var_616_4, var_616_3)

				local var_616_5 = manager.ui.mainCamera.transform.position - var_616_0.position

				var_616_0.forward = Vector3.New(var_616_5.x, var_616_5.y, var_616_5.z)

				local var_616_6 = var_616_0.localEulerAngles

				var_616_6.z = 0
				var_616_6.x = 0
				var_616_0.localEulerAngles = var_616_6
			end

			if arg_613_1.time_ >= var_616_1 + var_616_2 and arg_613_1.time_ < var_616_1 + var_616_2 + arg_616_0 then
				var_616_0.localPosition = Vector3.New(0, 100, 0)

				local var_616_7 = manager.ui.mainCamera.transform.position - var_616_0.position

				var_616_0.forward = Vector3.New(var_616_7.x, var_616_7.y, var_616_7.z)

				local var_616_8 = var_616_0.localEulerAngles

				var_616_8.z = 0
				var_616_8.x = 0
				var_616_0.localEulerAngles = var_616_8
			end

			local var_616_9 = arg_613_1.actors_["1055ui_story"]
			local var_616_10 = 0

			if var_616_10 < arg_613_1.time_ and arg_613_1.time_ <= var_616_10 + arg_616_0 and arg_613_1.var_.characterEffect1055ui_story == nil then
				arg_613_1.var_.characterEffect1055ui_story = var_616_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_616_11 = 0.200000002980232

			if var_616_10 <= arg_613_1.time_ and arg_613_1.time_ < var_616_10 + var_616_11 then
				local var_616_12 = (arg_613_1.time_ - var_616_10) / var_616_11

				if arg_613_1.var_.characterEffect1055ui_story then
					local var_616_13 = Mathf.Lerp(0, 0.5, var_616_12)

					arg_613_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_613_1.var_.characterEffect1055ui_story.fillRatio = var_616_13
				end
			end

			if arg_613_1.time_ >= var_616_10 + var_616_11 and arg_613_1.time_ < var_616_10 + var_616_11 + arg_616_0 and arg_613_1.var_.characterEffect1055ui_story then
				local var_616_14 = 0.5

				arg_613_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_613_1.var_.characterEffect1055ui_story.fillRatio = var_616_14
			end

			local var_616_15 = 0
			local var_616_16 = 0.475

			if var_616_15 < arg_613_1.time_ and arg_613_1.time_ <= var_616_15 + arg_616_0 then
				arg_613_1.talkMaxDuration = 0
				arg_613_1.dialogCg_.alpha = 1

				arg_613_1.dialog_:SetActive(true)
				SetActive(arg_613_1.leftNameGo_, false)

				arg_613_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_613_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_613_1:RecordName(arg_613_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_613_1.iconTrs_.gameObject, false)
				arg_613_1.callingController_:SetSelectedState("normal")

				local var_616_17 = arg_613_1:GetWordFromCfg(123101153)
				local var_616_18 = arg_613_1:FormatText(var_616_17.content)

				arg_613_1.text_.text = var_616_18

				LuaForUtil.ClearLinePrefixSymbol(arg_613_1.text_)

				local var_616_19 = 19
				local var_616_20 = utf8.len(var_616_18)
				local var_616_21 = var_616_19 <= 0 and var_616_16 or var_616_16 * (var_616_20 / var_616_19)

				if var_616_21 > 0 and var_616_16 < var_616_21 then
					arg_613_1.talkMaxDuration = var_616_21

					if var_616_21 + var_616_15 > arg_613_1.duration_ then
						arg_613_1.duration_ = var_616_21 + var_616_15
					end
				end

				arg_613_1.text_.text = var_616_18
				arg_613_1.typewritter.percent = 0

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(false)
				arg_613_1:RecordContent(arg_613_1.text_.text)
			end

			local var_616_22 = math.max(var_616_16, arg_613_1.talkMaxDuration)

			if var_616_15 <= arg_613_1.time_ and arg_613_1.time_ < var_616_15 + var_616_22 then
				arg_613_1.typewritter.percent = (arg_613_1.time_ - var_616_15) / var_616_22

				arg_613_1.typewritter:SetDirty()
			end

			if arg_613_1.time_ >= var_616_15 + var_616_22 and arg_613_1.time_ < var_616_15 + var_616_22 + arg_616_0 then
				arg_613_1.typewritter.percent = 1

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(true)
			end
		end
	end,
	Play123101154 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 123101154
		arg_617_1.duration_ = 4.4

		local var_617_0 = {
			zh = 4.4,
			ja = 2.1
		}
		local var_617_1 = manager.audio:GetLocalizationFlag()

		if var_617_0[var_617_1] ~= nil then
			arg_617_1.duration_ = var_617_0[var_617_1]
		end

		SetActive(arg_617_1.tipsGo_, false)

		function arg_617_1.onSingleLineFinish_()
			arg_617_1.onSingleLineUpdate_ = nil
			arg_617_1.onSingleLineFinish_ = nil
			arg_617_1.state_ = "waiting"
		end

		function arg_617_1.playNext_(arg_619_0)
			if arg_619_0 == 1 then
				arg_617_0:Play123101155(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = arg_617_1.actors_["1093ui_story"].transform
			local var_620_1 = 0

			if var_620_1 < arg_617_1.time_ and arg_617_1.time_ <= var_620_1 + arg_620_0 then
				arg_617_1.var_.moveOldPos1093ui_story = var_620_0.localPosition
			end

			local var_620_2 = 0.001

			if var_620_1 <= arg_617_1.time_ and arg_617_1.time_ < var_620_1 + var_620_2 then
				local var_620_3 = (arg_617_1.time_ - var_620_1) / var_620_2
				local var_620_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_620_0.localPosition = Vector3.Lerp(arg_617_1.var_.moveOldPos1093ui_story, var_620_4, var_620_3)

				local var_620_5 = manager.ui.mainCamera.transform.position - var_620_0.position

				var_620_0.forward = Vector3.New(var_620_5.x, var_620_5.y, var_620_5.z)

				local var_620_6 = var_620_0.localEulerAngles

				var_620_6.z = 0
				var_620_6.x = 0
				var_620_0.localEulerAngles = var_620_6
			end

			if arg_617_1.time_ >= var_620_1 + var_620_2 and arg_617_1.time_ < var_620_1 + var_620_2 + arg_620_0 then
				var_620_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_620_7 = manager.ui.mainCamera.transform.position - var_620_0.position

				var_620_0.forward = Vector3.New(var_620_7.x, var_620_7.y, var_620_7.z)

				local var_620_8 = var_620_0.localEulerAngles

				var_620_8.z = 0
				var_620_8.x = 0
				var_620_0.localEulerAngles = var_620_8
			end

			local var_620_9 = arg_617_1.actors_["1093ui_story"]
			local var_620_10 = 0

			if var_620_10 < arg_617_1.time_ and arg_617_1.time_ <= var_620_10 + arg_620_0 and arg_617_1.var_.characterEffect1093ui_story == nil then
				arg_617_1.var_.characterEffect1093ui_story = var_620_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_620_11 = 0.200000002980232

			if var_620_10 <= arg_617_1.time_ and arg_617_1.time_ < var_620_10 + var_620_11 then
				local var_620_12 = (arg_617_1.time_ - var_620_10) / var_620_11

				if arg_617_1.var_.characterEffect1093ui_story then
					arg_617_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_617_1.time_ >= var_620_10 + var_620_11 and arg_617_1.time_ < var_620_10 + var_620_11 + arg_620_0 and arg_617_1.var_.characterEffect1093ui_story then
				arg_617_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_620_13 = 0

			if var_620_13 < arg_617_1.time_ and arg_617_1.time_ <= var_620_13 + arg_620_0 then
				arg_617_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_620_14 = 0

			if var_620_14 < arg_617_1.time_ and arg_617_1.time_ <= var_620_14 + arg_620_0 then
				arg_617_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_620_15 = 0
			local var_620_16 = 0.275

			if var_620_15 < arg_617_1.time_ and arg_617_1.time_ <= var_620_15 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0
				arg_617_1.dialogCg_.alpha = 1

				arg_617_1.dialog_:SetActive(true)
				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_17 = arg_617_1:FormatText(StoryNameCfg[73].name)

				arg_617_1.leftNameTxt_.text = var_620_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_18 = arg_617_1:GetWordFromCfg(123101154)
				local var_620_19 = arg_617_1:FormatText(var_620_18.content)

				arg_617_1.text_.text = var_620_19

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_20 = 11
				local var_620_21 = utf8.len(var_620_19)
				local var_620_22 = var_620_20 <= 0 and var_620_16 or var_620_16 * (var_620_21 / var_620_20)

				if var_620_22 > 0 and var_620_16 < var_620_22 then
					arg_617_1.talkMaxDuration = var_620_22

					if var_620_22 + var_620_15 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_22 + var_620_15
					end
				end

				arg_617_1.text_.text = var_620_19
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101154", "story_v_out_123101.awb") ~= 0 then
					local var_620_23 = manager.audio:GetVoiceLength("story_v_out_123101", "123101154", "story_v_out_123101.awb") / 1000

					if var_620_23 + var_620_15 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_23 + var_620_15
					end

					if var_620_18.prefab_name ~= "" and arg_617_1.actors_[var_620_18.prefab_name] ~= nil then
						local var_620_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_617_1.actors_[var_620_18.prefab_name].transform, "story_v_out_123101", "123101154", "story_v_out_123101.awb")

						arg_617_1:RecordAudio("123101154", var_620_24)
						arg_617_1:RecordAudio("123101154", var_620_24)
					else
						arg_617_1:AudioAction("play", "voice", "story_v_out_123101", "123101154", "story_v_out_123101.awb")
					end

					arg_617_1:RecordHistoryTalkVoice("story_v_out_123101", "123101154", "story_v_out_123101.awb")
				end

				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_25 = math.max(var_620_16, arg_617_1.talkMaxDuration)

			if var_620_15 <= arg_617_1.time_ and arg_617_1.time_ < var_620_15 + var_620_25 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_15) / var_620_25

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_15 + var_620_25 and arg_617_1.time_ < var_620_15 + var_620_25 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play123101155 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 123101155
		arg_621_1.duration_ = 12.533

		local var_621_0 = {
			zh = 9.133,
			ja = 12.533
		}
		local var_621_1 = manager.audio:GetLocalizationFlag()

		if var_621_0[var_621_1] ~= nil then
			arg_621_1.duration_ = var_621_0[var_621_1]
		end

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
			arg_621_1.auto_ = false
		end

		function arg_621_1.playNext_(arg_623_0)
			arg_621_1.onStoryFinished_()
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = arg_621_1.actors_["1055ui_story"].transform
			local var_624_1 = 0

			if var_624_1 < arg_621_1.time_ and arg_621_1.time_ <= var_624_1 + arg_624_0 then
				arg_621_1.var_.moveOldPos1055ui_story = var_624_0.localPosition
			end

			local var_624_2 = 0.001

			if var_624_1 <= arg_621_1.time_ and arg_621_1.time_ < var_624_1 + var_624_2 then
				local var_624_3 = (arg_621_1.time_ - var_624_1) / var_624_2
				local var_624_4 = Vector3.New(0.7, -0.965, -6.2)

				var_624_0.localPosition = Vector3.Lerp(arg_621_1.var_.moveOldPos1055ui_story, var_624_4, var_624_3)

				local var_624_5 = manager.ui.mainCamera.transform.position - var_624_0.position

				var_624_0.forward = Vector3.New(var_624_5.x, var_624_5.y, var_624_5.z)

				local var_624_6 = var_624_0.localEulerAngles

				var_624_6.z = 0
				var_624_6.x = 0
				var_624_0.localEulerAngles = var_624_6
			end

			if arg_621_1.time_ >= var_624_1 + var_624_2 and arg_621_1.time_ < var_624_1 + var_624_2 + arg_624_0 then
				var_624_0.localPosition = Vector3.New(0.7, -0.965, -6.2)

				local var_624_7 = manager.ui.mainCamera.transform.position - var_624_0.position

				var_624_0.forward = Vector3.New(var_624_7.x, var_624_7.y, var_624_7.z)

				local var_624_8 = var_624_0.localEulerAngles

				var_624_8.z = 0
				var_624_8.x = 0
				var_624_0.localEulerAngles = var_624_8
			end

			local var_624_9 = arg_621_1.actors_["1055ui_story"]
			local var_624_10 = 0

			if var_624_10 < arg_621_1.time_ and arg_621_1.time_ <= var_624_10 + arg_624_0 and arg_621_1.var_.characterEffect1055ui_story == nil then
				arg_621_1.var_.characterEffect1055ui_story = var_624_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_624_11 = 0.200000002980232

			if var_624_10 <= arg_621_1.time_ and arg_621_1.time_ < var_624_10 + var_624_11 then
				local var_624_12 = (arg_621_1.time_ - var_624_10) / var_624_11

				if arg_621_1.var_.characterEffect1055ui_story then
					arg_621_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_621_1.time_ >= var_624_10 + var_624_11 and arg_621_1.time_ < var_624_10 + var_624_11 + arg_624_0 and arg_621_1.var_.characterEffect1055ui_story then
				arg_621_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_624_13 = 0

			if var_624_13 < arg_621_1.time_ and arg_621_1.time_ <= var_624_13 + arg_624_0 then
				arg_621_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_624_14 = 0

			if var_624_14 < arg_621_1.time_ and arg_621_1.time_ <= var_624_14 + arg_624_0 then
				arg_621_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_624_15 = arg_621_1.actors_["1093ui_story"]
			local var_624_16 = 0

			if var_624_16 < arg_621_1.time_ and arg_621_1.time_ <= var_624_16 + arg_624_0 and arg_621_1.var_.characterEffect1093ui_story == nil then
				arg_621_1.var_.characterEffect1093ui_story = var_624_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_624_17 = 0.200000002980232

			if var_624_16 <= arg_621_1.time_ and arg_621_1.time_ < var_624_16 + var_624_17 then
				local var_624_18 = (arg_621_1.time_ - var_624_16) / var_624_17

				if arg_621_1.var_.characterEffect1093ui_story then
					local var_624_19 = Mathf.Lerp(0, 0.5, var_624_18)

					arg_621_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_621_1.var_.characterEffect1093ui_story.fillRatio = var_624_19
				end
			end

			if arg_621_1.time_ >= var_624_16 + var_624_17 and arg_621_1.time_ < var_624_16 + var_624_17 + arg_624_0 and arg_621_1.var_.characterEffect1093ui_story then
				local var_624_20 = 0.5

				arg_621_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_621_1.var_.characterEffect1093ui_story.fillRatio = var_624_20
			end

			local var_624_21 = 0
			local var_624_22 = 0.975

			if var_624_21 < arg_621_1.time_ and arg_621_1.time_ <= var_624_21 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, true)

				local var_624_23 = arg_621_1:FormatText(StoryNameCfg[481].name)

				arg_621_1.leftNameTxt_.text = var_624_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_621_1.leftNameTxt_.transform)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1.leftNameTxt_.text)
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_24 = arg_621_1:GetWordFromCfg(123101155)
				local var_624_25 = arg_621_1:FormatText(var_624_24.content)

				arg_621_1.text_.text = var_624_25

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_26 = 39
				local var_624_27 = utf8.len(var_624_25)
				local var_624_28 = var_624_26 <= 0 and var_624_22 or var_624_22 * (var_624_27 / var_624_26)

				if var_624_28 > 0 and var_624_22 < var_624_28 then
					arg_621_1.talkMaxDuration = var_624_28

					if var_624_28 + var_624_21 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_28 + var_624_21
					end
				end

				arg_621_1.text_.text = var_624_25
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123101", "123101155", "story_v_out_123101.awb") ~= 0 then
					local var_624_29 = manager.audio:GetVoiceLength("story_v_out_123101", "123101155", "story_v_out_123101.awb") / 1000

					if var_624_29 + var_624_21 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_29 + var_624_21
					end

					if var_624_24.prefab_name ~= "" and arg_621_1.actors_[var_624_24.prefab_name] ~= nil then
						local var_624_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_621_1.actors_[var_624_24.prefab_name].transform, "story_v_out_123101", "123101155", "story_v_out_123101.awb")

						arg_621_1:RecordAudio("123101155", var_624_30)
						arg_621_1:RecordAudio("123101155", var_624_30)
					else
						arg_621_1:AudioAction("play", "voice", "story_v_out_123101", "123101155", "story_v_out_123101.awb")
					end

					arg_621_1:RecordHistoryTalkVoice("story_v_out_123101", "123101155", "story_v_out_123101.awb")
				end

				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_31 = math.max(var_624_22, arg_621_1.talkMaxDuration)

			if var_624_21 <= arg_621_1.time_ and arg_621_1.time_ < var_624_21 + var_624_31 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_21) / var_624_31

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_21 + var_624_31 and arg_621_1.time_ < var_624_21 + var_624_31 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K05f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K05g"
	},
	voices = {
		"story_v_out_123101.awb"
	}
}
