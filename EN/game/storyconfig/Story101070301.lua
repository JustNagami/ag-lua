return {
	Play107031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 107031001
		arg_1_1.duration_ = 9.066

		local var_1_0 = {
			ja = 6.966,
			ko = 6.266,
			zh = 6.1,
			en = 9.066
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
				arg_1_0:Play107031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "1050ui_story"

			if arg_1_1.actors_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(Asset.Load("Char/" .. var_4_0), arg_1_1.stage_.transform)

				var_4_1.name = var_4_0
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_0] = var_4_1

				local var_4_2 = var_4_1:GetComponentInChildren(typeof(CharacterEffect))

				var_4_2.enabled = true

				local var_4_3 = GameObjectTools.GetOrAddComponent(var_4_1, typeof(DynamicBoneHelper))

				if var_4_3 then
					var_4_3:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_2.transform, false)

				arg_1_1.var_[var_4_0 .. "Animator"] = var_4_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_0 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_0 .. "LipSync"] = var_4_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_4 = arg_1_1.actors_["1050ui_story"]
			local var_4_5 = 1.8

			if var_4_5 < arg_1_1.time_ and arg_1_1.time_ <= var_4_5 + arg_4_0 and arg_1_1.var_.characterEffect1050ui_story == nil then
				arg_1_1.var_.characterEffect1050ui_story = var_4_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_6 = 0.1

			if var_4_5 <= arg_1_1.time_ and arg_1_1.time_ < var_4_5 + var_4_6 then
				local var_4_7 = (arg_1_1.time_ - var_4_5) / var_4_6

				if arg_1_1.var_.characterEffect1050ui_story then
					arg_1_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_5 + var_4_6 and arg_1_1.time_ < var_4_5 + var_4_6 + arg_4_0 and arg_1_1.var_.characterEffect1050ui_story then
				arg_1_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_4_8 = "C04a"

			if arg_1_1.bgs_[var_4_8] == nil then
				local var_4_9 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_8)
				var_4_9.name = var_4_8
				var_4_9.transform.parent = arg_1_1.stage_.transform
				var_4_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_8] = var_4_9
			end

			local var_4_10 = 0

			if var_4_10 < arg_1_1.time_ and arg_1_1.time_ <= var_4_10 + arg_4_0 then
				local var_4_11 = manager.ui.mainCamera.transform.localPosition
				local var_4_12 = Vector3.New(0, 0, 10) + Vector3.New(var_4_11.x, var_4_11.y, 0)
				local var_4_13 = arg_1_1.bgs_.C04a

				var_4_13.transform.localPosition = var_4_12
				var_4_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_14 = var_4_13:GetComponent("SpriteRenderer")

				if var_4_14 and var_4_14.sprite then
					local var_4_15 = (var_4_13.transform.localPosition - var_4_11).z
					local var_4_16 = manager.ui.mainCameraCom_
					local var_4_17 = 2 * var_4_15 * Mathf.Tan(var_4_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_18 = var_4_17 * var_4_16.aspect
					local var_4_19 = var_4_14.sprite.bounds.size.x
					local var_4_20 = var_4_14.sprite.bounds.size.y
					local var_4_21 = var_4_18 / var_4_19
					local var_4_22 = var_4_17 / var_4_20
					local var_4_23 = var_4_22 < var_4_21 and var_4_21 or var_4_22

					var_4_13.transform.localScale = Vector3.New(var_4_23, var_4_23, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "C04a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_24 = arg_1_1.actors_["1050ui_story"].transform
			local var_4_25 = 1.8

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos1050ui_story = var_4_24.localPosition
			end

			local var_4_26 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_26 then
				local var_4_27 = (arg_1_1.time_ - var_4_25) / var_4_26
				local var_4_28 = Vector3.New(0, -1, -6.1)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1050ui_story, var_4_28, var_4_27)

				local var_4_29 = manager.ui.mainCamera.transform.position - var_4_24.position

				var_4_24.forward = Vector3.New(var_4_29.x, var_4_29.y, var_4_29.z)

				local var_4_30 = var_4_24.localEulerAngles

				var_4_30.z = 0
				var_4_30.x = 0
				var_4_24.localEulerAngles = var_4_30
			end

			if arg_1_1.time_ >= var_4_25 + var_4_26 and arg_1_1.time_ < var_4_25 + var_4_26 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(0, -1, -6.1)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_24.position

				var_4_24.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_24.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_24.localEulerAngles = var_4_32
			end

			local var_4_33 = 1.8

			if var_4_33 < arg_1_1.time_ and arg_1_1.time_ <= var_4_33 + arg_4_0 then
				arg_1_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action5_1")
			end

			local var_4_34 = arg_1_1.bgs_.C04a
			local var_4_35 = 0

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				local var_4_36 = var_4_34:GetComponent("SpriteRenderer")

				if var_4_36 then
					var_4_36.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_37 = var_4_36.material
					local var_4_38 = var_4_37:GetColor("_Color")

					arg_1_1.var_.alphaOldValueC04a = var_4_38.a
					arg_1_1.var_.alphaMatValueC04a = var_4_37
				end

				arg_1_1.var_.alphaOldValueC04a = 0
			end

			local var_4_39 = 1.5

			if var_4_35 <= arg_1_1.time_ and arg_1_1.time_ < var_4_35 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_35) / var_4_39
				local var_4_41 = Mathf.Lerp(arg_1_1.var_.alphaOldValueC04a, 1, var_4_40)

				if arg_1_1.var_.alphaMatValueC04a then
					local var_4_42 = arg_1_1.var_.alphaMatValueC04a
					local var_4_43 = var_4_42:GetColor("_Color")

					var_4_43.a = var_4_41

					var_4_42:SetColor("_Color", var_4_43)
				end
			end

			if arg_1_1.time_ >= var_4_35 + var_4_39 and arg_1_1.time_ < var_4_35 + var_4_39 + arg_4_0 and arg_1_1.var_.alphaMatValueC04a then
				local var_4_44 = arg_1_1.var_.alphaMatValueC04a
				local var_4_45 = var_4_44:GetColor("_Color")

				var_4_45.a = 1

				var_4_44:SetColor("_Color", var_4_45)
			end

			local var_4_46 = 0
			local var_4_47 = 1

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				local var_4_48 = "play"
				local var_4_49 = "music"

				arg_1_1:AudioAction(var_4_48, var_4_49, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_50 = 0

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_51 = 2

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_52 = 0

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				arg_1_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2
			local var_4_54 = 0.6

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_55 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_55:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[74].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(107031001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 22
				local var_4_60 = utf8.len(var_4_58)
				local var_4_61 = var_4_59 <= 0 and var_4_54 or var_4_54 * (var_4_60 / var_4_59)

				if var_4_61 > 0 and var_4_54 < var_4_61 then
					arg_1_1.talkMaxDuration = var_4_61
					var_4_53 = var_4_53 + 0.3

					if var_4_61 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_53
					end
				end

				arg_1_1.text_.text = var_4_58
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031001", "story_v_out_107031.awb") ~= 0 then
					local var_4_62 = manager.audio:GetVoiceLength("story_v_out_107031", "107031001", "story_v_out_107031.awb") / 1000

					if var_4_62 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_53
					end

					if var_4_57.prefab_name ~= "" and arg_1_1.actors_[var_4_57.prefab_name] ~= nil then
						local var_4_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_57.prefab_name].transform, "story_v_out_107031", "107031001", "story_v_out_107031.awb")

						arg_1_1:RecordAudio("107031001", var_4_63)
						arg_1_1:RecordAudio("107031001", var_4_63)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_107031", "107031001", "story_v_out_107031.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_107031", "107031001", "story_v_out_107031.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_64 = var_4_53 + 0.3
			local var_4_65 = math.max(var_4_54, arg_1_1.talkMaxDuration)

			if var_4_64 <= arg_1_1.time_ and arg_1_1.time_ < var_4_64 + var_4_65 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_64) / var_4_65

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_64 + var_4_65 and arg_1_1.time_ < var_4_64 + var_4_65 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play107031002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 107031002
		arg_7_1.duration_ = 5.8

		local var_7_0 = {
			ja = 5,
			ko = 5.333,
			zh = 4.1,
			en = 5.8
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
				arg_7_0:Play107031003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1050ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1050ui_story == nil then
				arg_7_1.var_.characterEffect1050ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.1

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1050ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1050ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1050ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1050ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.6

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[76].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6065")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(107031002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031002", "story_v_out_107031.awb") ~= 0 then
					local var_10_14 = manager.audio:GetVoiceLength("story_v_out_107031", "107031002", "story_v_out_107031.awb") / 1000

					if var_10_14 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_14 + var_10_6
					end

					if var_10_9.prefab_name ~= "" and arg_7_1.actors_[var_10_9.prefab_name] ~= nil then
						local var_10_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_9.prefab_name].transform, "story_v_out_107031", "107031002", "story_v_out_107031.awb")

						arg_7_1:RecordAudio("107031002", var_10_15)
						arg_7_1:RecordAudio("107031002", var_10_15)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_107031", "107031002", "story_v_out_107031.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_107031", "107031002", "story_v_out_107031.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_16 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_16 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_16

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_16 and arg_7_1.time_ < var_10_6 + var_10_16 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play107031003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 107031003
		arg_11_1.duration_ = 10.233

		local var_11_0 = {
			ja = 8.4,
			ko = 6.066,
			zh = 10.233,
			en = 9.4
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
				arg_11_0:Play107031004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1050ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1050ui_story == nil then
				arg_11_1.var_.characterEffect1050ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.1

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1050ui_story then
					arg_11_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1050ui_story then
				arg_11_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050actionlink/1050action454")
			end

			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_14_6 = 0
			local var_14_7 = 0.825

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[74].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(107031003)
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

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031003", "story_v_out_107031.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_107031", "107031003", "story_v_out_107031.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_107031", "107031003", "story_v_out_107031.awb")

						arg_11_1:RecordAudio("107031003", var_14_15)
						arg_11_1:RecordAudio("107031003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_107031", "107031003", "story_v_out_107031.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_107031", "107031003", "story_v_out_107031.awb")
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
	Play107031004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 107031004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play107031005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1050ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1050ui_story == nil then
				arg_15_1.var_.characterEffect1050ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

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
			local var_18_7 = 0.8

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_8 = arg_15_1:GetWordFromCfg(107031004)
				local var_18_9 = arg_15_1:FormatText(var_18_8.content)

				arg_15_1.text_.text = var_18_9

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_10 = 32
				local var_18_11 = utf8.len(var_18_9)
				local var_18_12 = var_18_10 <= 0 and var_18_7 or var_18_7 * (var_18_11 / var_18_10)

				if var_18_12 > 0 and var_18_7 < var_18_12 then
					arg_15_1.talkMaxDuration = var_18_12

					if var_18_12 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_12 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_9
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_13 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_13 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_13

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_13 and arg_15_1.time_ < var_18_6 + var_18_13 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play107031005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 107031005
		arg_19_1.duration_ = 6.5

		local var_19_0 = {
			ja = 6.5,
			ko = 4.1,
			zh = 3.8,
			en = 4.633
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
				arg_19_0:Play107031006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1050ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1050ui_story == nil then
				arg_19_1.var_.characterEffect1050ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

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

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050actionlink/1050action445")
			end

			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_6 = 0
			local var_22_7 = 0.35

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[74].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(107031005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031005", "story_v_out_107031.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_107031", "107031005", "story_v_out_107031.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_107031", "107031005", "story_v_out_107031.awb")

						arg_19_1:RecordAudio("107031005", var_22_15)
						arg_19_1:RecordAudio("107031005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_107031", "107031005", "story_v_out_107031.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_107031", "107031005", "story_v_out_107031.awb")
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
	Play107031006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 107031006
		arg_23_1.duration_ = 11.733

		local var_23_0 = {
			ja = 9.666,
			ko = 7.966,
			zh = 8.633,
			en = 11.733
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
				arg_23_0:Play107031007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1050ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1050ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1050ui_story, var_26_4, var_26_3)

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

			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 then
				arg_23_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_10 = 0
			local var_26_11 = 0.9

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_12 = arg_23_1:FormatText(StoryNameCfg[74].name)

				arg_23_1.leftNameTxt_.text = var_26_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_13 = arg_23_1:GetWordFromCfg(107031006)
				local var_26_14 = arg_23_1:FormatText(var_26_13.content)

				arg_23_1.text_.text = var_26_14

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_15 = 36
				local var_26_16 = utf8.len(var_26_14)
				local var_26_17 = var_26_15 <= 0 and var_26_11 or var_26_11 * (var_26_16 / var_26_15)

				if var_26_17 > 0 and var_26_11 < var_26_17 then
					arg_23_1.talkMaxDuration = var_26_17

					if var_26_17 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_17 + var_26_10
					end
				end

				arg_23_1.text_.text = var_26_14
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031006", "story_v_out_107031.awb") ~= 0 then
					local var_26_18 = manager.audio:GetVoiceLength("story_v_out_107031", "107031006", "story_v_out_107031.awb") / 1000

					if var_26_18 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_18 + var_26_10
					end

					if var_26_13.prefab_name ~= "" and arg_23_1.actors_[var_26_13.prefab_name] ~= nil then
						local var_26_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_13.prefab_name].transform, "story_v_out_107031", "107031006", "story_v_out_107031.awb")

						arg_23_1:RecordAudio("107031006", var_26_19)
						arg_23_1:RecordAudio("107031006", var_26_19)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_107031", "107031006", "story_v_out_107031.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_107031", "107031006", "story_v_out_107031.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_20 = math.max(var_26_11, arg_23_1.talkMaxDuration)

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_20 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_10) / var_26_20

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_10 + var_26_20 and arg_23_1.time_ < var_26_10 + var_26_20 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play107031007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 107031007
		arg_27_1.duration_ = 12.2

		local var_27_0 = {
			ja = 12.2,
			ko = 8.9,
			zh = 8.5,
			en = 10.8
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
				arg_27_0:Play107031008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_30_1 = 0
			local var_30_2 = 0.8

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_3 = arg_27_1:FormatText(StoryNameCfg[74].name)

				arg_27_1.leftNameTxt_.text = var_30_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_4 = arg_27_1:GetWordFromCfg(107031007)
				local var_30_5 = arg_27_1:FormatText(var_30_4.content)

				arg_27_1.text_.text = var_30_5

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_6 = 33
				local var_30_7 = utf8.len(var_30_5)
				local var_30_8 = var_30_6 <= 0 and var_30_2 or var_30_2 * (var_30_7 / var_30_6)

				if var_30_8 > 0 and var_30_2 < var_30_8 then
					arg_27_1.talkMaxDuration = var_30_8

					if var_30_8 + var_30_1 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_1
					end
				end

				arg_27_1.text_.text = var_30_5
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031007", "story_v_out_107031.awb") ~= 0 then
					local var_30_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031007", "story_v_out_107031.awb") / 1000

					if var_30_9 + var_30_1 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_9 + var_30_1
					end

					if var_30_4.prefab_name ~= "" and arg_27_1.actors_[var_30_4.prefab_name] ~= nil then
						local var_30_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_4.prefab_name].transform, "story_v_out_107031", "107031007", "story_v_out_107031.awb")

						arg_27_1:RecordAudio("107031007", var_30_10)
						arg_27_1:RecordAudio("107031007", var_30_10)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_107031", "107031007", "story_v_out_107031.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_107031", "107031007", "story_v_out_107031.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_11 = math.max(var_30_2, arg_27_1.talkMaxDuration)

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_11 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_1) / var_30_11

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_1 + var_30_11 and arg_27_1.time_ < var_30_1 + var_30_11 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play107031008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 107031008
		arg_31_1.duration_ = 12.066

		local var_31_0 = {
			ja = 12.066,
			ko = 8.666,
			zh = 8.033,
			en = 8.333
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
				arg_31_0:Play107031009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_34_1 = 0
			local var_34_2 = 0.8

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_3 = arg_31_1:FormatText(StoryNameCfg[74].name)

				arg_31_1.leftNameTxt_.text = var_34_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_4 = arg_31_1:GetWordFromCfg(107031008)
				local var_34_5 = arg_31_1:FormatText(var_34_4.content)

				arg_31_1.text_.text = var_34_5

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_6 = 32
				local var_34_7 = utf8.len(var_34_5)
				local var_34_8 = var_34_6 <= 0 and var_34_2 or var_34_2 * (var_34_7 / var_34_6)

				if var_34_8 > 0 and var_34_2 < var_34_8 then
					arg_31_1.talkMaxDuration = var_34_8

					if var_34_8 + var_34_1 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_1
					end
				end

				arg_31_1.text_.text = var_34_5
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031008", "story_v_out_107031.awb") ~= 0 then
					local var_34_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031008", "story_v_out_107031.awb") / 1000

					if var_34_9 + var_34_1 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_9 + var_34_1
					end

					if var_34_4.prefab_name ~= "" and arg_31_1.actors_[var_34_4.prefab_name] ~= nil then
						local var_34_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_4.prefab_name].transform, "story_v_out_107031", "107031008", "story_v_out_107031.awb")

						arg_31_1:RecordAudio("107031008", var_34_10)
						arg_31_1:RecordAudio("107031008", var_34_10)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_107031", "107031008", "story_v_out_107031.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_107031", "107031008", "story_v_out_107031.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_11 = math.max(var_34_2, arg_31_1.talkMaxDuration)

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_11 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_1) / var_34_11

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_1 + var_34_11 and arg_31_1.time_ < var_34_1 + var_34_11 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play107031009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 107031009
		arg_35_1.duration_ = 17.9

		local var_35_0 = {
			ja = 9.766,
			ko = 8.2,
			zh = 9.433,
			en = 17.9
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
				arg_35_0:Play107031010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_38_1 = 0
			local var_38_2 = 0.875

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_3 = arg_35_1:FormatText(StoryNameCfg[74].name)

				arg_35_1.leftNameTxt_.text = var_38_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_4 = arg_35_1:GetWordFromCfg(107031009)
				local var_38_5 = arg_35_1:FormatText(var_38_4.content)

				arg_35_1.text_.text = var_38_5

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_6 = 35
				local var_38_7 = utf8.len(var_38_5)
				local var_38_8 = var_38_6 <= 0 and var_38_2 or var_38_2 * (var_38_7 / var_38_6)

				if var_38_8 > 0 and var_38_2 < var_38_8 then
					arg_35_1.talkMaxDuration = var_38_8

					if var_38_8 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_1
					end
				end

				arg_35_1.text_.text = var_38_5
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031009", "story_v_out_107031.awb") ~= 0 then
					local var_38_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031009", "story_v_out_107031.awb") / 1000

					if var_38_9 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_9 + var_38_1
					end

					if var_38_4.prefab_name ~= "" and arg_35_1.actors_[var_38_4.prefab_name] ~= nil then
						local var_38_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_4.prefab_name].transform, "story_v_out_107031", "107031009", "story_v_out_107031.awb")

						arg_35_1:RecordAudio("107031009", var_38_10)
						arg_35_1:RecordAudio("107031009", var_38_10)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_107031", "107031009", "story_v_out_107031.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_107031", "107031009", "story_v_out_107031.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_11 = math.max(var_38_2, arg_35_1.talkMaxDuration)

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_11 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_1) / var_38_11

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_1 + var_38_11 and arg_35_1.time_ < var_38_1 + var_38_11 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play107031010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 107031010
		arg_39_1.duration_ = 4.233

		local var_39_0 = {
			ja = 3.433,
			ko = 3.8,
			zh = 4.233,
			en = 3.233
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
				arg_39_0:Play107031011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_42_1 = 0
			local var_42_2 = 0.425

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_3 = arg_39_1:FormatText(StoryNameCfg[74].name)

				arg_39_1.leftNameTxt_.text = var_42_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_4 = arg_39_1:GetWordFromCfg(107031010)
				local var_42_5 = arg_39_1:FormatText(var_42_4.content)

				arg_39_1.text_.text = var_42_5

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_6 = 17
				local var_42_7 = utf8.len(var_42_5)
				local var_42_8 = var_42_6 <= 0 and var_42_2 or var_42_2 * (var_42_7 / var_42_6)

				if var_42_8 > 0 and var_42_2 < var_42_8 then
					arg_39_1.talkMaxDuration = var_42_8

					if var_42_8 + var_42_1 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_1
					end
				end

				arg_39_1.text_.text = var_42_5
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031010", "story_v_out_107031.awb") ~= 0 then
					local var_42_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031010", "story_v_out_107031.awb") / 1000

					if var_42_9 + var_42_1 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_9 + var_42_1
					end

					if var_42_4.prefab_name ~= "" and arg_39_1.actors_[var_42_4.prefab_name] ~= nil then
						local var_42_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_4.prefab_name].transform, "story_v_out_107031", "107031010", "story_v_out_107031.awb")

						arg_39_1:RecordAudio("107031010", var_42_10)
						arg_39_1:RecordAudio("107031010", var_42_10)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_107031", "107031010", "story_v_out_107031.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_107031", "107031010", "story_v_out_107031.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_11 = math.max(var_42_2, arg_39_1.talkMaxDuration)

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_11 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_1) / var_42_11

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_1 + var_42_11 and arg_39_1.time_ < var_42_1 + var_42_11 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play107031011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 107031011
		arg_43_1.duration_ = 4.566

		local var_43_0 = {
			ja = 4.566,
			ko = 3.266,
			zh = 4.166,
			en = 3.9
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
				arg_43_0:Play107031012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1050ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1050ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, -1, -6.1)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1050ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1050ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1050ui_story == nil then
				arg_43_1.var_.characterEffect1050ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.1

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1050ui_story then
					arg_43_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1050ui_story then
				arg_43_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_46_15 = 0
			local var_46_16 = 0.4

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_17 = arg_43_1:FormatText(StoryNameCfg[74].name)

				arg_43_1.leftNameTxt_.text = var_46_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_18 = arg_43_1:GetWordFromCfg(107031011)
				local var_46_19 = arg_43_1:FormatText(var_46_18.content)

				arg_43_1.text_.text = var_46_19

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_20 = 16
				local var_46_21 = utf8.len(var_46_19)
				local var_46_22 = var_46_20 <= 0 and var_46_16 or var_46_16 * (var_46_21 / var_46_20)

				if var_46_22 > 0 and var_46_16 < var_46_22 then
					arg_43_1.talkMaxDuration = var_46_22

					if var_46_22 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_22 + var_46_15
					end
				end

				arg_43_1.text_.text = var_46_19
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031011", "story_v_out_107031.awb") ~= 0 then
					local var_46_23 = manager.audio:GetVoiceLength("story_v_out_107031", "107031011", "story_v_out_107031.awb") / 1000

					if var_46_23 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_23 + var_46_15
					end

					if var_46_18.prefab_name ~= "" and arg_43_1.actors_[var_46_18.prefab_name] ~= nil then
						local var_46_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_18.prefab_name].transform, "story_v_out_107031", "107031011", "story_v_out_107031.awb")

						arg_43_1:RecordAudio("107031011", var_46_24)
						arg_43_1:RecordAudio("107031011", var_46_24)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_107031", "107031011", "story_v_out_107031.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_107031", "107031011", "story_v_out_107031.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_16, arg_43_1.talkMaxDuration)

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_15) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_15 + var_46_25 and arg_43_1.time_ < var_46_15 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play107031012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 107031012
		arg_47_1.duration_ = 12

		local var_47_0 = {
			ja = 12,
			ko = 8.733,
			zh = 8.1,
			en = 7.9
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
				arg_47_0:Play107031013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_50_1 = 0
			local var_50_2 = 1.05

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_3 = arg_47_1:FormatText(StoryNameCfg[74].name)

				arg_47_1.leftNameTxt_.text = var_50_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_4 = arg_47_1:GetWordFromCfg(107031012)
				local var_50_5 = arg_47_1:FormatText(var_50_4.content)

				arg_47_1.text_.text = var_50_5

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_6 = 42
				local var_50_7 = utf8.len(var_50_5)
				local var_50_8 = var_50_6 <= 0 and var_50_2 or var_50_2 * (var_50_7 / var_50_6)

				if var_50_8 > 0 and var_50_2 < var_50_8 then
					arg_47_1.talkMaxDuration = var_50_8

					if var_50_8 + var_50_1 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_1
					end
				end

				arg_47_1.text_.text = var_50_5
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031012", "story_v_out_107031.awb") ~= 0 then
					local var_50_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031012", "story_v_out_107031.awb") / 1000

					if var_50_9 + var_50_1 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_9 + var_50_1
					end

					if var_50_4.prefab_name ~= "" and arg_47_1.actors_[var_50_4.prefab_name] ~= nil then
						local var_50_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_4.prefab_name].transform, "story_v_out_107031", "107031012", "story_v_out_107031.awb")

						arg_47_1:RecordAudio("107031012", var_50_10)
						arg_47_1:RecordAudio("107031012", var_50_10)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_107031", "107031012", "story_v_out_107031.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_107031", "107031012", "story_v_out_107031.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_11 = math.max(var_50_2, arg_47_1.talkMaxDuration)

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_11 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_1) / var_50_11

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_1 + var_50_11 and arg_47_1.time_ < var_50_1 + var_50_11 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play107031013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 107031013
		arg_51_1.duration_ = 7.8

		local var_51_0 = {
			ja = 5.9,
			ko = 7.433,
			zh = 7.8,
			en = 7.433
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
				arg_51_0:Play107031014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1050ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1050ui_story == nil then
				arg_51_1.var_.characterEffect1050ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1050ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1050ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1050ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1050ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.65

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[95].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(107031013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031013", "story_v_out_107031.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_107031", "107031013", "story_v_out_107031.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_107031", "107031013", "story_v_out_107031.awb")

						arg_51_1:RecordAudio("107031013", var_54_15)
						arg_51_1:RecordAudio("107031013", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_107031", "107031013", "story_v_out_107031.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_107031", "107031013", "story_v_out_107031.awb")
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
	Play107031014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 107031014
		arg_55_1.duration_ = 1.999999999999

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play107031015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1050ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1050ui_story == nil then
				arg_55_1.var_.characterEffect1050ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1050ui_story then
					arg_55_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1050ui_story then
				arg_55_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action6_1")
			end

			local var_58_5 = arg_55_1.actors_["1050ui_story"].transform
			local var_58_6 = 0

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.var_.moveOldPos1050ui_story = var_58_5.localPosition

				local var_58_7 = "1050ui_story"

				arg_55_1:ShowWeapon(arg_55_1.var_[var_58_7 .. "Animator"].transform, true)
			end

			local var_58_8 = 0.001

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_6) / var_58_8
				local var_58_10 = Vector3.New(0, -1, -6.1)

				var_58_5.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1050ui_story, var_58_10, var_58_9)

				local var_58_11 = manager.ui.mainCamera.transform.position - var_58_5.position

				var_58_5.forward = Vector3.New(var_58_11.x, var_58_11.y, var_58_11.z)

				local var_58_12 = var_58_5.localEulerAngles

				var_58_12.z = 0
				var_58_12.x = 0
				var_58_5.localEulerAngles = var_58_12
			end

			if arg_55_1.time_ >= var_58_6 + var_58_8 and arg_55_1.time_ < var_58_6 + var_58_8 + arg_58_0 then
				var_58_5.localPosition = Vector3.New(0, -1, -6.1)

				local var_58_13 = manager.ui.mainCamera.transform.position - var_58_5.position

				var_58_5.forward = Vector3.New(var_58_13.x, var_58_13.y, var_58_13.z)

				local var_58_14 = var_58_5.localEulerAngles

				var_58_14.z = 0
				var_58_14.x = 0
				var_58_5.localEulerAngles = var_58_14
			end

			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_58_16 = 0
			local var_58_17 = 0.075

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_18 = arg_55_1:FormatText(StoryNameCfg[74].name)

				arg_55_1.leftNameTxt_.text = var_58_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_19 = arg_55_1:GetWordFromCfg(107031014)
				local var_58_20 = arg_55_1:FormatText(var_58_19.content)

				arg_55_1.text_.text = var_58_20

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_21 = 3
				local var_58_22 = utf8.len(var_58_20)
				local var_58_23 = var_58_21 <= 0 and var_58_17 or var_58_17 * (var_58_22 / var_58_21)

				if var_58_23 > 0 and var_58_17 < var_58_23 then
					arg_55_1.talkMaxDuration = var_58_23

					if var_58_23 + var_58_16 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_16
					end
				end

				arg_55_1.text_.text = var_58_20
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031014", "story_v_out_107031.awb") ~= 0 then
					local var_58_24 = manager.audio:GetVoiceLength("story_v_out_107031", "107031014", "story_v_out_107031.awb") / 1000

					if var_58_24 + var_58_16 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_24 + var_58_16
					end

					if var_58_19.prefab_name ~= "" and arg_55_1.actors_[var_58_19.prefab_name] ~= nil then
						local var_58_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_19.prefab_name].transform, "story_v_out_107031", "107031014", "story_v_out_107031.awb")

						arg_55_1:RecordAudio("107031014", var_58_25)
						arg_55_1:RecordAudio("107031014", var_58_25)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_107031", "107031014", "story_v_out_107031.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_107031", "107031014", "story_v_out_107031.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_26 = math.max(var_58_17, arg_55_1.talkMaxDuration)

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_26 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_16) / var_58_26

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_16 + var_58_26 and arg_55_1.time_ < var_58_16 + var_58_26 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play107031015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 107031015
		arg_59_1.duration_ = 9.4

		local var_59_0 = {
			ja = 9.2,
			ko = 6.9,
			zh = 8.433,
			en = 9.4
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
				arg_59_0:Play107031016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "S0703"

			if arg_59_1.bgs_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(arg_59_1.paintGo_)

				var_62_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_62_0)
				var_62_1.name = var_62_0
				var_62_1.transform.parent = arg_59_1.stage_.transform
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.bgs_[var_62_0] = var_62_1
			end

			local var_62_2 = 1.5

			if var_62_2 < arg_59_1.time_ and arg_59_1.time_ <= var_62_2 + arg_62_0 then
				local var_62_3 = manager.ui.mainCamera.transform.localPosition
				local var_62_4 = Vector3.New(0, 0, 10) + Vector3.New(var_62_3.x, var_62_3.y, 0)
				local var_62_5 = arg_59_1.bgs_.S0703

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
					if iter_62_0 ~= "S0703" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_16 = arg_59_1.bgs_.C04a
			local var_62_17 = 0

			if var_62_17 < arg_59_1.time_ and arg_59_1.time_ <= var_62_17 + arg_62_0 then
				local var_62_18 = var_62_16:GetComponent("SpriteRenderer")

				if var_62_18 then
					var_62_18.material = arg_59_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_62_19 = var_62_18.material
					local var_62_20 = var_62_19:GetColor("_Color")

					arg_59_1.var_.alphaOldValueC04a = var_62_20.a
					arg_59_1.var_.alphaMatValueC04a = var_62_19
				end

				arg_59_1.var_.alphaOldValueC04a = 1
			end

			local var_62_21 = 1.5

			if var_62_17 <= arg_59_1.time_ and arg_59_1.time_ < var_62_17 + var_62_21 then
				local var_62_22 = (arg_59_1.time_ - var_62_17) / var_62_21
				local var_62_23 = Mathf.Lerp(arg_59_1.var_.alphaOldValueC04a, 0, var_62_22)

				if arg_59_1.var_.alphaMatValueC04a then
					local var_62_24 = arg_59_1.var_.alphaMatValueC04a
					local var_62_25 = var_62_24:GetColor("_Color")

					var_62_25.a = var_62_23

					var_62_24:SetColor("_Color", var_62_25)
				end
			end

			if arg_59_1.time_ >= var_62_17 + var_62_21 and arg_59_1.time_ < var_62_17 + var_62_21 + arg_62_0 and arg_59_1.var_.alphaMatValueC04a then
				local var_62_26 = arg_59_1.var_.alphaMatValueC04a
				local var_62_27 = var_62_26:GetColor("_Color")

				var_62_27.a = 0

				var_62_26:SetColor("_Color", var_62_27)
			end

			local var_62_28 = arg_59_1.bgs_.S0703
			local var_62_29 = 1.5

			if var_62_29 < arg_59_1.time_ and arg_59_1.time_ <= var_62_29 + arg_62_0 then
				local var_62_30 = var_62_28:GetComponent("SpriteRenderer")

				if var_62_30 then
					var_62_30.material = arg_59_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_62_31 = var_62_30.material
					local var_62_32 = var_62_31:GetColor("_Color")

					arg_59_1.var_.alphaOldValueS0703 = var_62_32.a
					arg_59_1.var_.alphaMatValueS0703 = var_62_31
				end

				arg_59_1.var_.alphaOldValueS0703 = 0
			end

			local var_62_33 = 1.5

			if var_62_29 <= arg_59_1.time_ and arg_59_1.time_ < var_62_29 + var_62_33 then
				local var_62_34 = (arg_59_1.time_ - var_62_29) / var_62_33
				local var_62_35 = Mathf.Lerp(arg_59_1.var_.alphaOldValueS0703, 1, var_62_34)

				if arg_59_1.var_.alphaMatValueS0703 then
					local var_62_36 = arg_59_1.var_.alphaMatValueS0703
					local var_62_37 = var_62_36:GetColor("_Color")

					var_62_37.a = var_62_35

					var_62_36:SetColor("_Color", var_62_37)
				end
			end

			if arg_59_1.time_ >= var_62_29 + var_62_33 and arg_59_1.time_ < var_62_29 + var_62_33 + arg_62_0 and arg_59_1.var_.alphaMatValueS0703 then
				local var_62_38 = arg_59_1.var_.alphaMatValueS0703
				local var_62_39 = var_62_38:GetColor("_Color")

				var_62_39.a = 1

				var_62_38:SetColor("_Color", var_62_39)
			end

			local var_62_40 = arg_59_1.actors_["1050ui_story"].transform
			local var_62_41 = 0

			if var_62_41 < arg_59_1.time_ and arg_59_1.time_ <= var_62_41 + arg_62_0 then
				arg_59_1.var_.moveOldPos1050ui_story = var_62_40.localPosition
			end

			local var_62_42 = 0.001

			if var_62_41 <= arg_59_1.time_ and arg_59_1.time_ < var_62_41 + var_62_42 then
				local var_62_43 = (arg_59_1.time_ - var_62_41) / var_62_42
				local var_62_44 = Vector3.New(0, 100, 0)

				var_62_40.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1050ui_story, var_62_44, var_62_43)

				local var_62_45 = manager.ui.mainCamera.transform.position - var_62_40.position

				var_62_40.forward = Vector3.New(var_62_45.x, var_62_45.y, var_62_45.z)

				local var_62_46 = var_62_40.localEulerAngles

				var_62_46.z = 0
				var_62_46.x = 0
				var_62_40.localEulerAngles = var_62_46
			end

			if arg_59_1.time_ >= var_62_41 + var_62_42 and arg_59_1.time_ < var_62_41 + var_62_42 + arg_62_0 then
				var_62_40.localPosition = Vector3.New(0, 100, 0)

				local var_62_47 = manager.ui.mainCamera.transform.position - var_62_40.position

				var_62_40.forward = Vector3.New(var_62_47.x, var_62_47.y, var_62_47.z)

				local var_62_48 = var_62_40.localEulerAngles

				var_62_48.z = 0
				var_62_48.x = 0
				var_62_40.localEulerAngles = var_62_48
			end

			local var_62_49 = arg_59_1.bgs_.C04a.transform
			local var_62_50 = 1.5

			if var_62_50 < arg_59_1.time_ and arg_59_1.time_ <= var_62_50 + arg_62_0 then
				arg_59_1.var_.moveOldPosC04a = var_62_49.localPosition
			end

			local var_62_51 = 0.001

			if var_62_50 <= arg_59_1.time_ and arg_59_1.time_ < var_62_50 + var_62_51 then
				local var_62_52 = (arg_59_1.time_ - var_62_50) / var_62_51
				local var_62_53 = Vector3.New(0, 100, 0)

				var_62_49.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPosC04a, var_62_53, var_62_52)
			end

			if arg_59_1.time_ >= var_62_50 + var_62_51 and arg_59_1.time_ < var_62_50 + var_62_51 + arg_62_0 then
				var_62_49.localPosition = Vector3.New(0, 100, 0)
			end

			local var_62_54 = 0

			if var_62_54 < arg_59_1.time_ and arg_59_1.time_ <= var_62_54 + arg_62_0 then
				arg_59_1.allBtn_.enabled = false
			end

			local var_62_55 = 2

			if arg_59_1.time_ >= var_62_54 + var_62_55 and arg_59_1.time_ < var_62_54 + var_62_55 + arg_62_0 then
				arg_59_1.allBtn_.enabled = true
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_56 = 2
			local var_62_57 = 0.7

			if var_62_56 < arg_59_1.time_ and arg_59_1.time_ <= var_62_56 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_58 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_58:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_59 = arg_59_1:FormatText(StoryNameCfg[95].name)

				arg_59_1.leftNameTxt_.text = var_62_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_60 = arg_59_1:GetWordFromCfg(107031015)
				local var_62_61 = arg_59_1:FormatText(var_62_60.content)

				arg_59_1.text_.text = var_62_61

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_62 = 28
				local var_62_63 = utf8.len(var_62_61)
				local var_62_64 = var_62_62 <= 0 and var_62_57 or var_62_57 * (var_62_63 / var_62_62)

				if var_62_64 > 0 and var_62_57 < var_62_64 then
					arg_59_1.talkMaxDuration = var_62_64
					var_62_56 = var_62_56 + 0.3

					if var_62_64 + var_62_56 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_64 + var_62_56
					end
				end

				arg_59_1.text_.text = var_62_61
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031015", "story_v_out_107031.awb") ~= 0 then
					local var_62_65 = manager.audio:GetVoiceLength("story_v_out_107031", "107031015", "story_v_out_107031.awb") / 1000

					if var_62_65 + var_62_56 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_65 + var_62_56
					end

					if var_62_60.prefab_name ~= "" and arg_59_1.actors_[var_62_60.prefab_name] ~= nil then
						local var_62_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_60.prefab_name].transform, "story_v_out_107031", "107031015", "story_v_out_107031.awb")

						arg_59_1:RecordAudio("107031015", var_62_66)
						arg_59_1:RecordAudio("107031015", var_62_66)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_107031", "107031015", "story_v_out_107031.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_107031", "107031015", "story_v_out_107031.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_67 = var_62_56 + 0.3
			local var_62_68 = math.max(var_62_57, arg_59_1.talkMaxDuration)

			if var_62_67 <= arg_59_1.time_ and arg_59_1.time_ < var_62_67 + var_62_68 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_67) / var_62_68

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_67 + var_62_68 and arg_59_1.time_ < var_62_67 + var_62_68 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play107031016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 107031016
		arg_65_1.duration_ = 2.833

		local var_65_0 = {
			ja = 2.833,
			ko = 2,
			zh = 1.533,
			en = 1.066
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
				arg_65_0:Play107031017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.15

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[74].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(107031016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 6
				local var_68_6 = utf8.len(var_68_4)
				local var_68_7 = var_68_5 <= 0 and var_68_1 or var_68_1 * (var_68_6 / var_68_5)

				if var_68_7 > 0 and var_68_1 < var_68_7 then
					arg_65_1.talkMaxDuration = var_68_7

					if var_68_7 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_7 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_4
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031016", "story_v_out_107031.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031016", "story_v_out_107031.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_107031", "107031016", "story_v_out_107031.awb")

						arg_65_1:RecordAudio("107031016", var_68_9)
						arg_65_1:RecordAudio("107031016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_107031", "107031016", "story_v_out_107031.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_107031", "107031016", "story_v_out_107031.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_10 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_10 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_10

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_10 and arg_65_1.time_ < var_68_0 + var_68_10 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play107031017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 107031017
		arg_69_1.duration_ = 5.2

		local var_69_0 = {
			ja = 5.2,
			ko = 2.033,
			zh = 2.333,
			en = 2.566
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
				arg_69_0:Play107031018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.225

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[95].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(107031017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 9
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031017", "story_v_out_107031.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031017", "story_v_out_107031.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_107031", "107031017", "story_v_out_107031.awb")

						arg_69_1:RecordAudio("107031017", var_72_9)
						arg_69_1:RecordAudio("107031017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_107031", "107031017", "story_v_out_107031.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_107031", "107031017", "story_v_out_107031.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play107031018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 107031018
		arg_73_1.duration_ = 4.8

		local var_73_0 = {
			ja = 4.8,
			ko = 3.166,
			zh = 4.133,
			en = 1.8
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
				arg_73_0:Play107031019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.3

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[95].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(107031018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 12
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031018", "story_v_out_107031.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031018", "story_v_out_107031.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_107031", "107031018", "story_v_out_107031.awb")

						arg_73_1:RecordAudio("107031018", var_76_9)
						arg_73_1:RecordAudio("107031018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_107031", "107031018", "story_v_out_107031.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_107031", "107031018", "story_v_out_107031.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_10 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_10 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_10

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_10 and arg_73_1.time_ < var_76_0 + var_76_10 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play107031019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 107031019
		arg_77_1.duration_ = 18.333

		local var_77_0 = {
			ja = 18.333,
			ko = 10.8,
			zh = 8.333,
			en = 10
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
				arg_77_0:Play107031020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.975

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[95].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(107031019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 38
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031019", "story_v_out_107031.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031019", "story_v_out_107031.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_107031", "107031019", "story_v_out_107031.awb")

						arg_77_1:RecordAudio("107031019", var_80_9)
						arg_77_1:RecordAudio("107031019", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_107031", "107031019", "story_v_out_107031.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_107031", "107031019", "story_v_out_107031.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_10 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_10 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_10

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_10 and arg_77_1.time_ < var_80_0 + var_80_10 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play107031020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 107031020
		arg_81_1.duration_ = 3.266

		local var_81_0 = {
			ja = 2,
			ko = 1.766,
			zh = 3.266,
			en = 1.4
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
				arg_81_0:Play107031021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.15

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[74].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(107031020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031020", "story_v_out_107031.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031020", "story_v_out_107031.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_107031", "107031020", "story_v_out_107031.awb")

						arg_81_1:RecordAudio("107031020", var_84_9)
						arg_81_1:RecordAudio("107031020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_107031", "107031020", "story_v_out_107031.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_107031", "107031020", "story_v_out_107031.awb")
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
	Play107031021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 107031021
		arg_85_1.duration_ = 11.466

		local var_85_0 = {
			ja = 11.466,
			ko = 10.4,
			zh = 9.666,
			en = 8.566
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
				arg_85_0:Play107031022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.975

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[95].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(107031021)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 39
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_1 or var_88_1 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_1 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031021", "story_v_out_107031.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031021", "story_v_out_107031.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_107031", "107031021", "story_v_out_107031.awb")

						arg_85_1:RecordAudio("107031021", var_88_9)
						arg_85_1:RecordAudio("107031021", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_107031", "107031021", "story_v_out_107031.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_107031", "107031021", "story_v_out_107031.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_10 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_10 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_10

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_10 and arg_85_1.time_ < var_88_0 + var_88_10 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play107031022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 107031022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play107031023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = manager.ui.mainCamera.transform
			local var_92_1 = 0.45

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.shakeOldPos = var_92_0.localPosition
			end

			local var_92_2 = 0.2

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / 0.099
				local var_92_4, var_92_5 = math.modf(var_92_3)

				var_92_0.localPosition = Vector3.New(var_92_5 * 0.13, var_92_5 * 0.13, var_92_5 * 0.13) + arg_89_1.var_.shakeOldPos
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = arg_89_1.var_.shakeOldPos
			end

			local var_92_6 = 0.45

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.mask_.enabled = true
				arg_89_1.mask_.raycastTarget = true

				arg_89_1:SetGaussion(false)
			end

			local var_92_7 = 0.5

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_7 then
				local var_92_8 = (arg_89_1.time_ - var_92_6) / var_92_7
				local var_92_9 = Color.New(1, 1, 1)

				var_92_9.a = Mathf.Lerp(1, 0, var_92_8)
				arg_89_1.mask_.color = var_92_9
			end

			if arg_89_1.time_ >= var_92_6 + var_92_7 and arg_89_1.time_ < var_92_6 + var_92_7 + arg_92_0 then
				local var_92_10 = Color.New(1, 1, 1)
				local var_92_11 = 0

				arg_89_1.mask_.enabled = false
				var_92_10.a = var_92_11
				arg_89_1.mask_.color = var_92_10
			end

			local var_92_12 = 0
			local var_92_13 = 0.725

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				local var_92_14 = "play"
				local var_92_15 = "effect"

				arg_89_1:AudioAction(var_92_14, var_92_15, "se_story_7", "se_story_7_chopped", "")
			end

			local var_92_16 = 0
			local var_92_17 = 0.725

			if var_92_16 < arg_89_1.time_ and arg_89_1.time_ <= var_92_16 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_18 = arg_89_1:GetWordFromCfg(107031022)
				local var_92_19 = arg_89_1:FormatText(var_92_18.content)

				arg_89_1.text_.text = var_92_19

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_20 = 29
				local var_92_21 = utf8.len(var_92_19)
				local var_92_22 = var_92_20 <= 0 and var_92_17 or var_92_17 * (var_92_21 / var_92_20)

				if var_92_22 > 0 and var_92_17 < var_92_22 then
					arg_89_1.talkMaxDuration = var_92_22

					if var_92_22 + var_92_16 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_22 + var_92_16
					end
				end

				arg_89_1.text_.text = var_92_19
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_23 = math.max(var_92_17, arg_89_1.talkMaxDuration)

			if var_92_16 <= arg_89_1.time_ and arg_89_1.time_ < var_92_16 + var_92_23 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_16) / var_92_23

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_16 + var_92_23 and arg_89_1.time_ < var_92_16 + var_92_23 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play107031023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 107031023
		arg_93_1.duration_ = 4.466

		local var_93_0 = {
			ja = 3.666,
			ko = 4.3,
			zh = 3.366,
			en = 4.466
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
				arg_93_0:Play107031024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.425

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[76].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, true)
				arg_93_1.iconController_:SetSelectedState("hero")

				arg_93_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6065")

				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(107031023)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 17
				local var_96_6 = utf8.len(var_96_4)
				local var_96_7 = var_96_5 <= 0 and var_96_1 or var_96_1 * (var_96_6 / var_96_5)

				if var_96_7 > 0 and var_96_1 < var_96_7 then
					arg_93_1.talkMaxDuration = var_96_7

					if var_96_7 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_7 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_4
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031023", "story_v_out_107031.awb") ~= 0 then
					local var_96_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031023", "story_v_out_107031.awb") / 1000

					if var_96_8 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_0
					end

					if var_96_3.prefab_name ~= "" and arg_93_1.actors_[var_96_3.prefab_name] ~= nil then
						local var_96_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_3.prefab_name].transform, "story_v_out_107031", "107031023", "story_v_out_107031.awb")

						arg_93_1:RecordAudio("107031023", var_96_9)
						arg_93_1:RecordAudio("107031023", var_96_9)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_107031", "107031023", "story_v_out_107031.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_107031", "107031023", "story_v_out_107031.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_10 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_10 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_10

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_10 and arg_93_1.time_ < var_96_0 + var_96_10 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play107031024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 107031024
		arg_97_1.duration_ = 4.8

		local var_97_0 = {
			ja = 3.966,
			ko = 4.8,
			zh = 3.7,
			en = 2.9
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
				arg_97_0:Play107031025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.4

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[95].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(107031024)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031024", "story_v_out_107031.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031024", "story_v_out_107031.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_107031", "107031024", "story_v_out_107031.awb")

						arg_97_1:RecordAudio("107031024", var_100_9)
						arg_97_1:RecordAudio("107031024", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_107031", "107031024", "story_v_out_107031.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_107031", "107031024", "story_v_out_107031.awb")
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
	Play107031025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 107031025
		arg_101_1.duration_ = 12.966

		local var_101_0 = {
			ja = 12.966,
			ko = 8.166,
			zh = 8.9,
			en = 9.666
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
				arg_101_0:Play107031026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.875

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[95].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(107031025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 35
				local var_104_6 = utf8.len(var_104_4)
				local var_104_7 = var_104_5 <= 0 and var_104_1 or var_104_1 * (var_104_6 / var_104_5)

				if var_104_7 > 0 and var_104_1 < var_104_7 then
					arg_101_1.talkMaxDuration = var_104_7

					if var_104_7 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_7 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_4
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031025", "story_v_out_107031.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031025", "story_v_out_107031.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_107031", "107031025", "story_v_out_107031.awb")

						arg_101_1:RecordAudio("107031025", var_104_9)
						arg_101_1:RecordAudio("107031025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_107031", "107031025", "story_v_out_107031.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_107031", "107031025", "story_v_out_107031.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_10 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_10 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_10

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_10 and arg_101_1.time_ < var_104_0 + var_104_10 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play107031026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 107031026
		arg_105_1.duration_ = 11.5

		local var_105_0 = {
			ja = 7.733,
			ko = 9.2,
			zh = 11.5,
			en = 7.266
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
				arg_105_0:Play107031027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.95

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[95].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(107031026)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 39
				local var_108_6 = utf8.len(var_108_4)
				local var_108_7 = var_108_5 <= 0 and var_108_1 or var_108_1 * (var_108_6 / var_108_5)

				if var_108_7 > 0 and var_108_1 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_4
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031026", "story_v_out_107031.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031026", "story_v_out_107031.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_107031", "107031026", "story_v_out_107031.awb")

						arg_105_1:RecordAudio("107031026", var_108_9)
						arg_105_1:RecordAudio("107031026", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_107031", "107031026", "story_v_out_107031.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_107031", "107031026", "story_v_out_107031.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play107031027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 107031027
		arg_109_1.duration_ = 2.233

		local var_109_0 = {
			ja = 1.266,
			ko = 1.233,
			zh = 2.233,
			en = 1.5
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
				arg_109_0:Play107031028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.075

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[74].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(107031027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 3
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031027", "story_v_out_107031.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031027", "story_v_out_107031.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_107031", "107031027", "story_v_out_107031.awb")

						arg_109_1:RecordAudio("107031027", var_112_9)
						arg_109_1:RecordAudio("107031027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_107031", "107031027", "story_v_out_107031.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_107031", "107031027", "story_v_out_107031.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play107031028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 107031028
		arg_113_1.duration_ = 5.1

		local var_113_0 = {
			ja = 5.1,
			ko = 4.833,
			zh = 4,
			en = 5.033
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
				arg_113_0:Play107031029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.3

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[95].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(107031028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031028", "story_v_out_107031.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031028", "story_v_out_107031.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_107031", "107031028", "story_v_out_107031.awb")

						arg_113_1:RecordAudio("107031028", var_116_9)
						arg_113_1:RecordAudio("107031028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_107031", "107031028", "story_v_out_107031.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_107031", "107031028", "story_v_out_107031.awb")
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
	Play107031029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 107031029
		arg_117_1.duration_ = 10.366

		local var_117_0 = {
			ja = 10.166,
			ko = 8.8,
			zh = 10.366,
			en = 8.666
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
				arg_117_0:Play107031030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.875

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[95].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(107031029)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 35
				local var_120_6 = utf8.len(var_120_4)
				local var_120_7 = var_120_5 <= 0 and var_120_1 or var_120_1 * (var_120_6 / var_120_5)

				if var_120_7 > 0 and var_120_1 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_4
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031029", "story_v_out_107031.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031029", "story_v_out_107031.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_107031", "107031029", "story_v_out_107031.awb")

						arg_117_1:RecordAudio("107031029", var_120_9)
						arg_117_1:RecordAudio("107031029", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_107031", "107031029", "story_v_out_107031.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_107031", "107031029", "story_v_out_107031.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_10 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_10 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_10

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_10 and arg_117_1.time_ < var_120_0 + var_120_10 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play107031030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 107031030
		arg_121_1.duration_ = 3.2

		local var_121_0 = {
			ja = 1.2,
			ko = 1.2,
			zh = 3.2,
			en = 1.5
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
				arg_121_0:Play107031031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.075

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[74].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(107031030)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 2
				local var_124_6 = utf8.len(var_124_4)
				local var_124_7 = var_124_5 <= 0 and var_124_1 or var_124_1 * (var_124_6 / var_124_5)

				if var_124_7 > 0 and var_124_1 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_4
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031030", "story_v_out_107031.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031030", "story_v_out_107031.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_107031", "107031030", "story_v_out_107031.awb")

						arg_121_1:RecordAudio("107031030", var_124_9)
						arg_121_1:RecordAudio("107031030", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_107031", "107031030", "story_v_out_107031.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_107031", "107031030", "story_v_out_107031.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_10 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_10 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_10

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_10 and arg_121_1.time_ < var_124_0 + var_124_10 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play107031031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 107031031
		arg_125_1.duration_ = 7

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play107031032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = "B13"

			if arg_125_1.bgs_[var_128_0] == nil then
				local var_128_1 = Object.Instantiate(arg_125_1.paintGo_)

				var_128_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_128_0)
				var_128_1.name = var_128_0
				var_128_1.transform.parent = arg_125_1.stage_.transform
				var_128_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_125_1.bgs_[var_128_0] = var_128_1
			end

			local var_128_2 = 1.5

			if var_128_2 < arg_125_1.time_ and arg_125_1.time_ <= var_128_2 + arg_128_0 then
				local var_128_3 = manager.ui.mainCamera.transform.localPosition
				local var_128_4 = Vector3.New(0, 0, 10) + Vector3.New(var_128_3.x, var_128_3.y, 0)
				local var_128_5 = arg_125_1.bgs_.B13

				var_128_5.transform.localPosition = var_128_4
				var_128_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_128_6 = var_128_5:GetComponent("SpriteRenderer")

				if var_128_6 and var_128_6.sprite then
					local var_128_7 = (var_128_5.transform.localPosition - var_128_3).z
					local var_128_8 = manager.ui.mainCameraCom_
					local var_128_9 = 2 * var_128_7 * Mathf.Tan(var_128_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_128_10 = var_128_9 * var_128_8.aspect
					local var_128_11 = var_128_6.sprite.bounds.size.x
					local var_128_12 = var_128_6.sprite.bounds.size.y
					local var_128_13 = var_128_10 / var_128_11
					local var_128_14 = var_128_9 / var_128_12
					local var_128_15 = var_128_14 < var_128_13 and var_128_13 or var_128_14

					var_128_5.transform.localScale = Vector3.New(var_128_15, var_128_15, 0)
				end

				for iter_128_0, iter_128_1 in pairs(arg_125_1.bgs_) do
					if iter_128_0 ~= "B13" then
						iter_128_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_128_16 = arg_125_1.bgs_.S0703
			local var_128_17 = 0

			if var_128_17 < arg_125_1.time_ and arg_125_1.time_ <= var_128_17 + arg_128_0 then
				local var_128_18 = var_128_16:GetComponent("SpriteRenderer")

				if var_128_18 then
					var_128_18.material = arg_125_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_128_19 = var_128_18.material
					local var_128_20 = var_128_19:GetColor("_Color")

					arg_125_1.var_.alphaOldValueS0703 = var_128_20.a
					arg_125_1.var_.alphaMatValueS0703 = var_128_19
				end

				arg_125_1.var_.alphaOldValueS0703 = 1
			end

			local var_128_21 = 1.5

			if var_128_17 <= arg_125_1.time_ and arg_125_1.time_ < var_128_17 + var_128_21 then
				local var_128_22 = (arg_125_1.time_ - var_128_17) / var_128_21
				local var_128_23 = Mathf.Lerp(arg_125_1.var_.alphaOldValueS0703, 0, var_128_22)

				if arg_125_1.var_.alphaMatValueS0703 then
					local var_128_24 = arg_125_1.var_.alphaMatValueS0703
					local var_128_25 = var_128_24:GetColor("_Color")

					var_128_25.a = var_128_23

					var_128_24:SetColor("_Color", var_128_25)
				end
			end

			if arg_125_1.time_ >= var_128_17 + var_128_21 and arg_125_1.time_ < var_128_17 + var_128_21 + arg_128_0 and arg_125_1.var_.alphaMatValueS0703 then
				local var_128_26 = arg_125_1.var_.alphaMatValueS0703
				local var_128_27 = var_128_26:GetColor("_Color")

				var_128_27.a = 0

				var_128_26:SetColor("_Color", var_128_27)
			end

			local var_128_28 = arg_125_1.bgs_.B13
			local var_128_29 = 1.5

			if var_128_29 < arg_125_1.time_ and arg_125_1.time_ <= var_128_29 + arg_128_0 then
				local var_128_30 = var_128_28:GetComponent("SpriteRenderer")

				if var_128_30 then
					var_128_30.material = arg_125_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_128_31 = var_128_30.material
					local var_128_32 = var_128_31:GetColor("_Color")

					arg_125_1.var_.alphaOldValueB13 = var_128_32.a
					arg_125_1.var_.alphaMatValueB13 = var_128_31
				end

				arg_125_1.var_.alphaOldValueB13 = 0
			end

			local var_128_33 = 1.5

			if var_128_29 <= arg_125_1.time_ and arg_125_1.time_ < var_128_29 + var_128_33 then
				local var_128_34 = (arg_125_1.time_ - var_128_29) / var_128_33
				local var_128_35 = Mathf.Lerp(arg_125_1.var_.alphaOldValueB13, 1, var_128_34)

				if arg_125_1.var_.alphaMatValueB13 then
					local var_128_36 = arg_125_1.var_.alphaMatValueB13
					local var_128_37 = var_128_36:GetColor("_Color")

					var_128_37.a = var_128_35

					var_128_36:SetColor("_Color", var_128_37)
				end
			end

			if arg_125_1.time_ >= var_128_29 + var_128_33 and arg_125_1.time_ < var_128_29 + var_128_33 + arg_128_0 and arg_125_1.var_.alphaMatValueB13 then
				local var_128_38 = arg_125_1.var_.alphaMatValueB13
				local var_128_39 = var_128_38:GetColor("_Color")

				var_128_39.a = 1

				var_128_38:SetColor("_Color", var_128_39)
			end

			local var_128_40 = arg_125_1.bgs_.S0703.transform
			local var_128_41 = 1.5

			if var_128_41 < arg_125_1.time_ and arg_125_1.time_ <= var_128_41 + arg_128_0 then
				arg_125_1.var_.moveOldPosS0703 = var_128_40.localPosition
			end

			local var_128_42 = 0.001

			if var_128_41 <= arg_125_1.time_ and arg_125_1.time_ < var_128_41 + var_128_42 then
				local var_128_43 = (arg_125_1.time_ - var_128_41) / var_128_42
				local var_128_44 = Vector3.New(0, 100, 0)

				var_128_40.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPosS0703, var_128_44, var_128_43)
			end

			if arg_125_1.time_ >= var_128_41 + var_128_42 and arg_125_1.time_ < var_128_41 + var_128_42 + arg_128_0 then
				var_128_40.localPosition = Vector3.New(0, 100, 0)
			end

			local var_128_45 = 1.5

			if var_128_45 < arg_125_1.time_ and arg_125_1.time_ <= var_128_45 + arg_128_0 then
				arg_125_1.screenFilterGo_:SetActive(true)

				arg_125_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_128_46 = 1.5

			if var_128_45 <= arg_125_1.time_ and arg_125_1.time_ < var_128_45 + var_128_46 then
				local var_128_47 = (arg_125_1.time_ - var_128_45) / var_128_46

				arg_125_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_128_47)
			end

			if arg_125_1.time_ >= var_128_45 + var_128_46 and arg_125_1.time_ < var_128_45 + var_128_46 + arg_128_0 then
				arg_125_1.screenFilterEffect_.weight = 1
			end

			local var_128_48 = 0

			if var_128_48 < arg_125_1.time_ and arg_125_1.time_ <= var_128_48 + arg_128_0 then
				arg_125_1.allBtn_.enabled = false
			end

			local var_128_49 = 2

			if arg_125_1.time_ >= var_128_48 + var_128_49 and arg_125_1.time_ < var_128_48 + var_128_49 + arg_128_0 then
				arg_125_1.allBtn_.enabled = true
			end

			if arg_125_1.frameCnt_ <= 1 then
				arg_125_1.dialog_:SetActive(false)
			end

			local var_128_50 = 2
			local var_128_51 = 0.25

			if var_128_50 < arg_125_1.time_ and arg_125_1.time_ <= var_128_50 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0

				arg_125_1.dialog_:SetActive(true)

				local var_128_52 = LeanTween.value(arg_125_1.dialog_, 0, 1, 0.3)

				var_128_52:setOnUpdate(LuaHelper.FloatAction(function(arg_129_0)
					arg_125_1.dialogCg_.alpha = arg_129_0
				end))
				var_128_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_125_1.dialog_)
					var_128_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_125_1.duration_ = arg_125_1.duration_ + 0.3

				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_53 = arg_125_1:GetWordFromCfg(107031031)
				local var_128_54 = arg_125_1:FormatText(var_128_53.content)

				arg_125_1.text_.text = var_128_54

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_55 = 10
				local var_128_56 = utf8.len(var_128_54)
				local var_128_57 = var_128_55 <= 0 and var_128_51 or var_128_51 * (var_128_56 / var_128_55)

				if var_128_57 > 0 and var_128_51 < var_128_57 then
					arg_125_1.talkMaxDuration = var_128_57
					var_128_50 = var_128_50 + 0.3

					if var_128_57 + var_128_50 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_57 + var_128_50
					end
				end

				arg_125_1.text_.text = var_128_54
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_58 = var_128_50 + 0.3
			local var_128_59 = math.max(var_128_51, arg_125_1.talkMaxDuration)

			if var_128_58 <= arg_125_1.time_ and arg_125_1.time_ < var_128_58 + var_128_59 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_58) / var_128_59

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_58 + var_128_59 and arg_125_1.time_ < var_128_58 + var_128_59 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play107031032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 107031032
		arg_131_1.duration_ = 3.6

		local var_131_0 = {
			ja = 3.6,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_131_0:Play107031033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "1019ui_story"

			if arg_131_1.actors_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(Asset.Load("Char/" .. var_134_0), arg_131_1.stage_.transform)

				var_134_1.name = var_134_0
				var_134_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.actors_[var_134_0] = var_134_1

				local var_134_2 = var_134_1:GetComponentInChildren(typeof(CharacterEffect))

				var_134_2.enabled = true

				local var_134_3 = GameObjectTools.GetOrAddComponent(var_134_1, typeof(DynamicBoneHelper))

				if var_134_3 then
					var_134_3:EnableDynamicBone(false)
				end

				arg_131_1:ShowWeapon(var_134_2.transform, false)

				arg_131_1.var_[var_134_0 .. "Animator"] = var_134_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_131_1.var_[var_134_0 .. "Animator"].applyRootMotion = true
				arg_131_1.var_[var_134_0 .. "LipSync"] = var_134_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_134_4 = arg_131_1.actors_["1019ui_story"]
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 and arg_131_1.var_.characterEffect1019ui_story == nil then
				arg_131_1.var_.characterEffect1019ui_story = var_134_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_6 = 0.1

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6

				if arg_131_1.var_.characterEffect1019ui_story then
					arg_131_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 and arg_131_1.var_.characterEffect1019ui_story then
				arg_131_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_134_8 = arg_131_1.actors_["1019ui_story"].transform
			local var_134_9 = 0

			if var_134_9 < arg_131_1.time_ and arg_131_1.time_ <= var_134_9 + arg_134_0 then
				arg_131_1.var_.moveOldPos1019ui_story = var_134_8.localPosition
			end

			local var_134_10 = 0.001

			if var_134_9 <= arg_131_1.time_ and arg_131_1.time_ < var_134_9 + var_134_10 then
				local var_134_11 = (arg_131_1.time_ - var_134_9) / var_134_10
				local var_134_12 = Vector3.New(-0.7, -1.08, -5.9)

				var_134_8.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1019ui_story, var_134_12, var_134_11)

				local var_134_13 = manager.ui.mainCamera.transform.position - var_134_8.position

				var_134_8.forward = Vector3.New(var_134_13.x, var_134_13.y, var_134_13.z)

				local var_134_14 = var_134_8.localEulerAngles

				var_134_14.z = 0
				var_134_14.x = 0
				var_134_8.localEulerAngles = var_134_14
			end

			if arg_131_1.time_ >= var_134_9 + var_134_10 and arg_131_1.time_ < var_134_9 + var_134_10 + arg_134_0 then
				var_134_8.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_134_15 = manager.ui.mainCamera.transform.position - var_134_8.position

				var_134_8.forward = Vector3.New(var_134_15.x, var_134_15.y, var_134_15.z)

				local var_134_16 = var_134_8.localEulerAngles

				var_134_16.z = 0
				var_134_16.x = 0
				var_134_8.localEulerAngles = var_134_16
			end

			local var_134_17 = 0

			if var_134_17 < arg_131_1.time_ and arg_131_1.time_ <= var_134_17 + arg_134_0 then
				arg_131_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_134_18 = 0

			if var_134_18 < arg_131_1.time_ and arg_131_1.time_ <= var_134_18 + arg_134_0 then
				arg_131_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_134_19 = 0
			local var_134_20 = 0.175

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_21 = arg_131_1:FormatText(StoryNameCfg[13].name)

				arg_131_1.leftNameTxt_.text = var_134_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_22 = arg_131_1:GetWordFromCfg(107031032)
				local var_134_23 = arg_131_1:FormatText(var_134_22.content)

				arg_131_1.text_.text = var_134_23

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_24 = 7
				local var_134_25 = utf8.len(var_134_23)
				local var_134_26 = var_134_24 <= 0 and var_134_20 or var_134_20 * (var_134_25 / var_134_24)

				if var_134_26 > 0 and var_134_20 < var_134_26 then
					arg_131_1.talkMaxDuration = var_134_26

					if var_134_26 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_26 + var_134_19
					end
				end

				arg_131_1.text_.text = var_134_23
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031032", "story_v_out_107031.awb") ~= 0 then
					local var_134_27 = manager.audio:GetVoiceLength("story_v_out_107031", "107031032", "story_v_out_107031.awb") / 1000

					if var_134_27 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_27 + var_134_19
					end

					if var_134_22.prefab_name ~= "" and arg_131_1.actors_[var_134_22.prefab_name] ~= nil then
						local var_134_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_22.prefab_name].transform, "story_v_out_107031", "107031032", "story_v_out_107031.awb")

						arg_131_1:RecordAudio("107031032", var_134_28)
						arg_131_1:RecordAudio("107031032", var_134_28)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_107031", "107031032", "story_v_out_107031.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_107031", "107031032", "story_v_out_107031.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_29 = math.max(var_134_20, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_29 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_29

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_29 and arg_131_1.time_ < var_134_19 + var_134_29 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play107031033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 107031033
		arg_135_1.duration_ = 5.1

		local var_135_0 = {
			ja = 1.999999999999,
			ko = 5.1,
			zh = 4.533,
			en = 4.866
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
				arg_135_0:Play107031034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "1099ui_story"

			if arg_135_1.actors_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(Asset.Load("Char/" .. var_138_0), arg_135_1.stage_.transform)

				var_138_1.name = var_138_0
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.actors_[var_138_0] = var_138_1

				local var_138_2 = var_138_1:GetComponentInChildren(typeof(CharacterEffect))

				var_138_2.enabled = true

				local var_138_3 = GameObjectTools.GetOrAddComponent(var_138_1, typeof(DynamicBoneHelper))

				if var_138_3 then
					var_138_3:EnableDynamicBone(false)
				end

				arg_135_1:ShowWeapon(var_138_2.transform, false)

				arg_135_1.var_[var_138_0 .. "Animator"] = var_138_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_135_1.var_[var_138_0 .. "Animator"].applyRootMotion = true
				arg_135_1.var_[var_138_0 .. "LipSync"] = var_138_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_138_4 = arg_135_1.actors_["1099ui_story"]
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 and arg_135_1.var_.characterEffect1099ui_story == nil then
				arg_135_1.var_.characterEffect1099ui_story = var_138_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_6 = 0.1

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6

				if arg_135_1.var_.characterEffect1099ui_story then
					arg_135_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect1099ui_story then
				arg_135_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_138_8 = arg_135_1.actors_["1019ui_story"]
			local var_138_9 = 0

			if var_138_9 < arg_135_1.time_ and arg_135_1.time_ <= var_138_9 + arg_138_0 and arg_135_1.var_.characterEffect1019ui_story == nil then
				arg_135_1.var_.characterEffect1019ui_story = var_138_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_10 = 0.1

			if var_138_9 <= arg_135_1.time_ and arg_135_1.time_ < var_138_9 + var_138_10 then
				local var_138_11 = (arg_135_1.time_ - var_138_9) / var_138_10

				if arg_135_1.var_.characterEffect1019ui_story then
					local var_138_12 = Mathf.Lerp(0, 0.5, var_138_11)

					arg_135_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1019ui_story.fillRatio = var_138_12
				end
			end

			if arg_135_1.time_ >= var_138_9 + var_138_10 and arg_135_1.time_ < var_138_9 + var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1019ui_story then
				local var_138_13 = 0.5

				arg_135_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1019ui_story.fillRatio = var_138_13
			end

			local var_138_14 = arg_135_1.actors_["1099ui_story"].transform
			local var_138_15 = 0

			if var_138_15 < arg_135_1.time_ and arg_135_1.time_ <= var_138_15 + arg_138_0 then
				arg_135_1.var_.moveOldPos1099ui_story = var_138_14.localPosition
			end

			local var_138_16 = 0.001

			if var_138_15 <= arg_135_1.time_ and arg_135_1.time_ < var_138_15 + var_138_16 then
				local var_138_17 = (arg_135_1.time_ - var_138_15) / var_138_16
				local var_138_18 = Vector3.New(0.7, -1.08, -5.9)

				var_138_14.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1099ui_story, var_138_18, var_138_17)

				local var_138_19 = manager.ui.mainCamera.transform.position - var_138_14.position

				var_138_14.forward = Vector3.New(var_138_19.x, var_138_19.y, var_138_19.z)

				local var_138_20 = var_138_14.localEulerAngles

				var_138_20.z = 0
				var_138_20.x = 0
				var_138_14.localEulerAngles = var_138_20
			end

			if arg_135_1.time_ >= var_138_15 + var_138_16 and arg_135_1.time_ < var_138_15 + var_138_16 + arg_138_0 then
				var_138_14.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_138_21 = manager.ui.mainCamera.transform.position - var_138_14.position

				var_138_14.forward = Vector3.New(var_138_21.x, var_138_21.y, var_138_21.z)

				local var_138_22 = var_138_14.localEulerAngles

				var_138_22.z = 0
				var_138_22.x = 0
				var_138_14.localEulerAngles = var_138_22
			end

			local var_138_23 = 0

			if var_138_23 < arg_135_1.time_ and arg_135_1.time_ <= var_138_23 + arg_138_0 then
				arg_135_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_138_24 = 0

			if var_138_24 < arg_135_1.time_ and arg_135_1.time_ <= var_138_24 + arg_138_0 then
				arg_135_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_25 = 0
			local var_138_26 = 0.475

			if var_138_25 < arg_135_1.time_ and arg_135_1.time_ <= var_138_25 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_27 = arg_135_1:FormatText(StoryNameCfg[84].name)

				arg_135_1.leftNameTxt_.text = var_138_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_28 = arg_135_1:GetWordFromCfg(107031033)
				local var_138_29 = arg_135_1:FormatText(var_138_28.content)

				arg_135_1.text_.text = var_138_29

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_30 = 19
				local var_138_31 = utf8.len(var_138_29)
				local var_138_32 = var_138_30 <= 0 and var_138_26 or var_138_26 * (var_138_31 / var_138_30)

				if var_138_32 > 0 and var_138_26 < var_138_32 then
					arg_135_1.talkMaxDuration = var_138_32

					if var_138_32 + var_138_25 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_32 + var_138_25
					end
				end

				arg_135_1.text_.text = var_138_29
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031033", "story_v_out_107031.awb") ~= 0 then
					local var_138_33 = manager.audio:GetVoiceLength("story_v_out_107031", "107031033", "story_v_out_107031.awb") / 1000

					if var_138_33 + var_138_25 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_33 + var_138_25
					end

					if var_138_28.prefab_name ~= "" and arg_135_1.actors_[var_138_28.prefab_name] ~= nil then
						local var_138_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_28.prefab_name].transform, "story_v_out_107031", "107031033", "story_v_out_107031.awb")

						arg_135_1:RecordAudio("107031033", var_138_34)
						arg_135_1:RecordAudio("107031033", var_138_34)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_107031", "107031033", "story_v_out_107031.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_107031", "107031033", "story_v_out_107031.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_35 = math.max(var_138_26, arg_135_1.talkMaxDuration)

			if var_138_25 <= arg_135_1.time_ and arg_135_1.time_ < var_138_25 + var_138_35 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_25) / var_138_35

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_25 + var_138_35 and arg_135_1.time_ < var_138_25 + var_138_35 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play107031034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 107031034
		arg_139_1.duration_ = 11.2

		local var_139_0 = {
			ja = 11.2,
			ko = 6.566,
			zh = 7.3,
			en = 9.733
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
				arg_139_0:Play107031035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1019ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1019ui_story == nil then
				arg_139_1.var_.characterEffect1019ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.1

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1019ui_story then
					arg_139_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1019ui_story then
				arg_139_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["1099ui_story"]
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 and arg_139_1.var_.characterEffect1099ui_story == nil then
				arg_139_1.var_.characterEffect1099ui_story = var_142_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_6 = 0.1

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6

				if arg_139_1.var_.characterEffect1099ui_story then
					local var_142_8 = Mathf.Lerp(0, 0.5, var_142_7)

					arg_139_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1099ui_story.fillRatio = var_142_8
				end
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 and arg_139_1.var_.characterEffect1099ui_story then
				local var_142_9 = 0.5

				arg_139_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1099ui_story.fillRatio = var_142_9
			end

			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 then
				arg_139_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_142_11 = 0
			local var_142_12 = 0.8

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_13 = arg_139_1:FormatText(StoryNameCfg[13].name)

				arg_139_1.leftNameTxt_.text = var_142_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_14 = arg_139_1:GetWordFromCfg(107031034)
				local var_142_15 = arg_139_1:FormatText(var_142_14.content)

				arg_139_1.text_.text = var_142_15

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_16 = 32
				local var_142_17 = utf8.len(var_142_15)
				local var_142_18 = var_142_16 <= 0 and var_142_12 or var_142_12 * (var_142_17 / var_142_16)

				if var_142_18 > 0 and var_142_12 < var_142_18 then
					arg_139_1.talkMaxDuration = var_142_18

					if var_142_18 + var_142_11 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_18 + var_142_11
					end
				end

				arg_139_1.text_.text = var_142_15
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031034", "story_v_out_107031.awb") ~= 0 then
					local var_142_19 = manager.audio:GetVoiceLength("story_v_out_107031", "107031034", "story_v_out_107031.awb") / 1000

					if var_142_19 + var_142_11 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_19 + var_142_11
					end

					if var_142_14.prefab_name ~= "" and arg_139_1.actors_[var_142_14.prefab_name] ~= nil then
						local var_142_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_14.prefab_name].transform, "story_v_out_107031", "107031034", "story_v_out_107031.awb")

						arg_139_1:RecordAudio("107031034", var_142_20)
						arg_139_1:RecordAudio("107031034", var_142_20)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_107031", "107031034", "story_v_out_107031.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_107031", "107031034", "story_v_out_107031.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_21 = math.max(var_142_12, arg_139_1.talkMaxDuration)

			if var_142_11 <= arg_139_1.time_ and arg_139_1.time_ < var_142_11 + var_142_21 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_11) / var_142_21

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_11 + var_142_21 and arg_139_1.time_ < var_142_11 + var_142_21 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play107031035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 107031035
		arg_143_1.duration_ = 2.833

		local var_143_0 = {
			ja = 1.2,
			ko = 1.1,
			zh = 2.833,
			en = 1.033
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
				arg_143_0:Play107031036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1099ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1099ui_story == nil then
				arg_143_1.var_.characterEffect1099ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.1

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1099ui_story then
					arg_143_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1099ui_story then
				arg_143_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_146_4 = arg_143_1.actors_["1019ui_story"]
			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 and arg_143_1.var_.characterEffect1019ui_story == nil then
				arg_143_1.var_.characterEffect1019ui_story = var_146_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_6 = 0.1

			if var_146_5 <= arg_143_1.time_ and arg_143_1.time_ < var_146_5 + var_146_6 then
				local var_146_7 = (arg_143_1.time_ - var_146_5) / var_146_6

				if arg_143_1.var_.characterEffect1019ui_story then
					local var_146_8 = Mathf.Lerp(0, 0.5, var_146_7)

					arg_143_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1019ui_story.fillRatio = var_146_8
				end
			end

			if arg_143_1.time_ >= var_146_5 + var_146_6 and arg_143_1.time_ < var_146_5 + var_146_6 + arg_146_0 and arg_143_1.var_.characterEffect1019ui_story then
				local var_146_9 = 0.5

				arg_143_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1019ui_story.fillRatio = var_146_9
			end

			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_146_11 = 0
			local var_146_12 = 0.05

			if var_146_11 < arg_143_1.time_ and arg_143_1.time_ <= var_146_11 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_13 = arg_143_1:FormatText(StoryNameCfg[84].name)

				arg_143_1.leftNameTxt_.text = var_146_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_14 = arg_143_1:GetWordFromCfg(107031035)
				local var_146_15 = arg_143_1:FormatText(var_146_14.content)

				arg_143_1.text_.text = var_146_15

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_16 = 2
				local var_146_17 = utf8.len(var_146_15)
				local var_146_18 = var_146_16 <= 0 and var_146_12 or var_146_12 * (var_146_17 / var_146_16)

				if var_146_18 > 0 and var_146_12 < var_146_18 then
					arg_143_1.talkMaxDuration = var_146_18

					if var_146_18 + var_146_11 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_18 + var_146_11
					end
				end

				arg_143_1.text_.text = var_146_15
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031035", "story_v_out_107031.awb") ~= 0 then
					local var_146_19 = manager.audio:GetVoiceLength("story_v_out_107031", "107031035", "story_v_out_107031.awb") / 1000

					if var_146_19 + var_146_11 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_19 + var_146_11
					end

					if var_146_14.prefab_name ~= "" and arg_143_1.actors_[var_146_14.prefab_name] ~= nil then
						local var_146_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_14.prefab_name].transform, "story_v_out_107031", "107031035", "story_v_out_107031.awb")

						arg_143_1:RecordAudio("107031035", var_146_20)
						arg_143_1:RecordAudio("107031035", var_146_20)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_107031", "107031035", "story_v_out_107031.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_107031", "107031035", "story_v_out_107031.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_21 = math.max(var_146_12, arg_143_1.talkMaxDuration)

			if var_146_11 <= arg_143_1.time_ and arg_143_1.time_ < var_146_11 + var_146_21 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_11) / var_146_21

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_11 + var_146_21 and arg_143_1.time_ < var_146_11 + var_146_21 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play107031036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 107031036
		arg_147_1.duration_ = 4.166

		local var_147_0 = {
			ja = 1.366,
			ko = 3.166,
			zh = 4.166,
			en = 3.833
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
				arg_147_0:Play107031037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_1 = 0
			local var_150_2 = 0.35

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_3 = arg_147_1:FormatText(StoryNameCfg[84].name)

				arg_147_1.leftNameTxt_.text = var_150_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_4 = arg_147_1:GetWordFromCfg(107031036)
				local var_150_5 = arg_147_1:FormatText(var_150_4.content)

				arg_147_1.text_.text = var_150_5

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_6 = 14
				local var_150_7 = utf8.len(var_150_5)
				local var_150_8 = var_150_6 <= 0 and var_150_2 or var_150_2 * (var_150_7 / var_150_6)

				if var_150_8 > 0 and var_150_2 < var_150_8 then
					arg_147_1.talkMaxDuration = var_150_8

					if var_150_8 + var_150_1 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_1
					end
				end

				arg_147_1.text_.text = var_150_5
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031036", "story_v_out_107031.awb") ~= 0 then
					local var_150_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031036", "story_v_out_107031.awb") / 1000

					if var_150_9 + var_150_1 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_9 + var_150_1
					end

					if var_150_4.prefab_name ~= "" and arg_147_1.actors_[var_150_4.prefab_name] ~= nil then
						local var_150_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_4.prefab_name].transform, "story_v_out_107031", "107031036", "story_v_out_107031.awb")

						arg_147_1:RecordAudio("107031036", var_150_10)
						arg_147_1:RecordAudio("107031036", var_150_10)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_107031", "107031036", "story_v_out_107031.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_107031", "107031036", "story_v_out_107031.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_11 = math.max(var_150_2, arg_147_1.talkMaxDuration)

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_11 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_1) / var_150_11

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_1 + var_150_11 and arg_147_1.time_ < var_150_1 + var_150_11 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play107031037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 107031037
		arg_151_1.duration_ = 3.966

		local var_151_0 = {
			ja = 3.4,
			ko = 2.266,
			zh = 3.966,
			en = 3.066
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
				arg_151_0:Play107031038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1019ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1019ui_story == nil then
				arg_151_1.var_.characterEffect1019ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.1

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1019ui_story then
					arg_151_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1019ui_story then
				arg_151_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_154_4 = arg_151_1.actors_["1099ui_story"]
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 and arg_151_1.var_.characterEffect1099ui_story == nil then
				arg_151_1.var_.characterEffect1099ui_story = var_154_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_6 = 0.1

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6

				if arg_151_1.var_.characterEffect1099ui_story then
					local var_154_8 = Mathf.Lerp(0, 0.5, var_154_7)

					arg_151_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1099ui_story.fillRatio = var_154_8
				end
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1099ui_story then
				local var_154_9 = 0.5

				arg_151_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1099ui_story.fillRatio = var_154_9
			end

			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_154_11 = 0
			local var_154_12 = 0.375

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_13 = arg_151_1:FormatText(StoryNameCfg[13].name)

				arg_151_1.leftNameTxt_.text = var_154_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_14 = arg_151_1:GetWordFromCfg(107031037)
				local var_154_15 = arg_151_1:FormatText(var_154_14.content)

				arg_151_1.text_.text = var_154_15

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_16 = 15
				local var_154_17 = utf8.len(var_154_15)
				local var_154_18 = var_154_16 <= 0 and var_154_12 or var_154_12 * (var_154_17 / var_154_16)

				if var_154_18 > 0 and var_154_12 < var_154_18 then
					arg_151_1.talkMaxDuration = var_154_18

					if var_154_18 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_11
					end
				end

				arg_151_1.text_.text = var_154_15
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031037", "story_v_out_107031.awb") ~= 0 then
					local var_154_19 = manager.audio:GetVoiceLength("story_v_out_107031", "107031037", "story_v_out_107031.awb") / 1000

					if var_154_19 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_11
					end

					if var_154_14.prefab_name ~= "" and arg_151_1.actors_[var_154_14.prefab_name] ~= nil then
						local var_154_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_14.prefab_name].transform, "story_v_out_107031", "107031037", "story_v_out_107031.awb")

						arg_151_1:RecordAudio("107031037", var_154_20)
						arg_151_1:RecordAudio("107031037", var_154_20)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_107031", "107031037", "story_v_out_107031.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_107031", "107031037", "story_v_out_107031.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_21 = math.max(var_154_12, arg_151_1.talkMaxDuration)

			if var_154_11 <= arg_151_1.time_ and arg_151_1.time_ < var_154_11 + var_154_21 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_11) / var_154_21

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_11 + var_154_21 and arg_151_1.time_ < var_154_11 + var_154_21 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play107031038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 107031038
		arg_155_1.duration_ = 5.766

		local var_155_0 = {
			ja = 5.766,
			ko = 4.066,
			zh = 4.566,
			en = 5
		}
		local var_155_1 = manager.audio:GetLocalizationFlag()

		if var_155_0[var_155_1] ~= nil then
			arg_155_1.duration_ = var_155_0[var_155_1]
		end

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play107031039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1099ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1099ui_story == nil then
				arg_155_1.var_.characterEffect1099ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.1

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1099ui_story then
					arg_155_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1099ui_story then
				arg_155_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_158_4 = arg_155_1.actors_["1019ui_story"]
			local var_158_5 = 0

			if var_158_5 < arg_155_1.time_ and arg_155_1.time_ <= var_158_5 + arg_158_0 and arg_155_1.var_.characterEffect1019ui_story == nil then
				arg_155_1.var_.characterEffect1019ui_story = var_158_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_6 = 0.1

			if var_158_5 <= arg_155_1.time_ and arg_155_1.time_ < var_158_5 + var_158_6 then
				local var_158_7 = (arg_155_1.time_ - var_158_5) / var_158_6

				if arg_155_1.var_.characterEffect1019ui_story then
					local var_158_8 = Mathf.Lerp(0, 0.5, var_158_7)

					arg_155_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1019ui_story.fillRatio = var_158_8
				end
			end

			if arg_155_1.time_ >= var_158_5 + var_158_6 and arg_155_1.time_ < var_158_5 + var_158_6 + arg_158_0 and arg_155_1.var_.characterEffect1019ui_story then
				local var_158_9 = 0.5

				arg_155_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1019ui_story.fillRatio = var_158_9
			end

			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 then
				arg_155_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_158_11 = 0
			local var_158_12 = 0.475

			if var_158_11 < arg_155_1.time_ and arg_155_1.time_ <= var_158_11 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_13 = arg_155_1:FormatText(StoryNameCfg[84].name)

				arg_155_1.leftNameTxt_.text = var_158_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_14 = arg_155_1:GetWordFromCfg(107031038)
				local var_158_15 = arg_155_1:FormatText(var_158_14.content)

				arg_155_1.text_.text = var_158_15

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_16 = 19
				local var_158_17 = utf8.len(var_158_15)
				local var_158_18 = var_158_16 <= 0 and var_158_12 or var_158_12 * (var_158_17 / var_158_16)

				if var_158_18 > 0 and var_158_12 < var_158_18 then
					arg_155_1.talkMaxDuration = var_158_18

					if var_158_18 + var_158_11 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_18 + var_158_11
					end
				end

				arg_155_1.text_.text = var_158_15
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031038", "story_v_out_107031.awb") ~= 0 then
					local var_158_19 = manager.audio:GetVoiceLength("story_v_out_107031", "107031038", "story_v_out_107031.awb") / 1000

					if var_158_19 + var_158_11 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_19 + var_158_11
					end

					if var_158_14.prefab_name ~= "" and arg_155_1.actors_[var_158_14.prefab_name] ~= nil then
						local var_158_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_14.prefab_name].transform, "story_v_out_107031", "107031038", "story_v_out_107031.awb")

						arg_155_1:RecordAudio("107031038", var_158_20)
						arg_155_1:RecordAudio("107031038", var_158_20)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_107031", "107031038", "story_v_out_107031.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_107031", "107031038", "story_v_out_107031.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_21 = math.max(var_158_12, arg_155_1.talkMaxDuration)

			if var_158_11 <= arg_155_1.time_ and arg_155_1.time_ < var_158_11 + var_158_21 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_11) / var_158_21

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_11 + var_158_21 and arg_155_1.time_ < var_158_11 + var_158_21 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play107031039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 107031039
		arg_159_1.duration_ = 2.1

		local var_159_0 = {
			ja = 1.766,
			ko = 1.566,
			zh = 2.1,
			en = 1.2
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
				arg_159_0:Play107031040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1099ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1099ui_story == nil then
				arg_159_1.var_.characterEffect1099ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.1

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1099ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1099ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1099ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1099ui_story.fillRatio = var_162_5
			end

			local var_162_6 = 0
			local var_162_7 = 0.1

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_8 = arg_159_1:FormatText(StoryNameCfg[74].name)

				arg_159_1.leftNameTxt_.text = var_162_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, true)
				arg_159_1.iconController_:SetSelectedState("hero")

				arg_159_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_9 = arg_159_1:GetWordFromCfg(107031039)
				local var_162_10 = arg_159_1:FormatText(var_162_9.content)

				arg_159_1.text_.text = var_162_10

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_11 = 4
				local var_162_12 = utf8.len(var_162_10)
				local var_162_13 = var_162_11 <= 0 and var_162_7 or var_162_7 * (var_162_12 / var_162_11)

				if var_162_13 > 0 and var_162_7 < var_162_13 then
					arg_159_1.talkMaxDuration = var_162_13

					if var_162_13 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_13 + var_162_6
					end
				end

				arg_159_1.text_.text = var_162_10
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031039", "story_v_out_107031.awb") ~= 0 then
					local var_162_14 = manager.audio:GetVoiceLength("story_v_out_107031", "107031039", "story_v_out_107031.awb") / 1000

					if var_162_14 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_14 + var_162_6
					end

					if var_162_9.prefab_name ~= "" and arg_159_1.actors_[var_162_9.prefab_name] ~= nil then
						local var_162_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_9.prefab_name].transform, "story_v_out_107031", "107031039", "story_v_out_107031.awb")

						arg_159_1:RecordAudio("107031039", var_162_15)
						arg_159_1:RecordAudio("107031039", var_162_15)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_107031", "107031039", "story_v_out_107031.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_107031", "107031039", "story_v_out_107031.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_16 = math.max(var_162_7, arg_159_1.talkMaxDuration)

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_16 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_6) / var_162_16

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_6 + var_162_16 and arg_159_1.time_ < var_162_6 + var_162_16 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play107031040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 107031040
		arg_163_1.duration_ = 10.266

		local var_163_0 = {
			ja = 8.466,
			ko = 6.5,
			zh = 6.966,
			en = 10.266
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
				arg_163_0:Play107031041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1019ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1019ui_story == nil then
				arg_163_1.var_.characterEffect1019ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.1

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1019ui_story then
					arg_163_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1019ui_story then
				arg_163_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_166_4 = 0

			if var_166_4 < arg_163_1.time_ and arg_163_1.time_ <= var_166_4 + arg_166_0 then
				arg_163_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_166_5 = 0

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 then
				arg_163_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_166_6 = 0
			local var_166_7 = 0.8

			if var_166_6 < arg_163_1.time_ and arg_163_1.time_ <= var_166_6 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_8 = arg_163_1:FormatText(StoryNameCfg[13].name)

				arg_163_1.leftNameTxt_.text = var_166_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_9 = arg_163_1:GetWordFromCfg(107031040)
				local var_166_10 = arg_163_1:FormatText(var_166_9.content)

				arg_163_1.text_.text = var_166_10

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_11 = 32
				local var_166_12 = utf8.len(var_166_10)
				local var_166_13 = var_166_11 <= 0 and var_166_7 or var_166_7 * (var_166_12 / var_166_11)

				if var_166_13 > 0 and var_166_7 < var_166_13 then
					arg_163_1.talkMaxDuration = var_166_13

					if var_166_13 + var_166_6 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_13 + var_166_6
					end
				end

				arg_163_1.text_.text = var_166_10
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031040", "story_v_out_107031.awb") ~= 0 then
					local var_166_14 = manager.audio:GetVoiceLength("story_v_out_107031", "107031040", "story_v_out_107031.awb") / 1000

					if var_166_14 + var_166_6 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_14 + var_166_6
					end

					if var_166_9.prefab_name ~= "" and arg_163_1.actors_[var_166_9.prefab_name] ~= nil then
						local var_166_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_9.prefab_name].transform, "story_v_out_107031", "107031040", "story_v_out_107031.awb")

						arg_163_1:RecordAudio("107031040", var_166_15)
						arg_163_1:RecordAudio("107031040", var_166_15)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_107031", "107031040", "story_v_out_107031.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_107031", "107031040", "story_v_out_107031.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_16 = math.max(var_166_7, arg_163_1.talkMaxDuration)

			if var_166_6 <= arg_163_1.time_ and arg_163_1.time_ < var_166_6 + var_166_16 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_6) / var_166_16

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_6 + var_166_16 and arg_163_1.time_ < var_166_6 + var_166_16 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play107031041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 107031041
		arg_167_1.duration_ = 5.9

		local var_167_0 = {
			ja = 1.8,
			ko = 3.666,
			zh = 5.9,
			en = 4.6
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
				arg_167_0:Play107031042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1019ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1019ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, 100, 0)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1019ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, 100, 0)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1099ui_story"].transform
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1.var_.moveOldPos1099ui_story = var_170_9.localPosition
			end

			local var_170_11 = 0.001

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11
				local var_170_13 = Vector3.New(0, 100, 0)

				var_170_9.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1099ui_story, var_170_13, var_170_12)

				local var_170_14 = manager.ui.mainCamera.transform.position - var_170_9.position

				var_170_9.forward = Vector3.New(var_170_14.x, var_170_14.y, var_170_14.z)

				local var_170_15 = var_170_9.localEulerAngles

				var_170_15.z = 0
				var_170_15.x = 0
				var_170_9.localEulerAngles = var_170_15
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 then
				var_170_9.localPosition = Vector3.New(0, 100, 0)

				local var_170_16 = manager.ui.mainCamera.transform.position - var_170_9.position

				var_170_9.forward = Vector3.New(var_170_16.x, var_170_16.y, var_170_16.z)

				local var_170_17 = var_170_9.localEulerAngles

				var_170_17.z = 0
				var_170_17.x = 0
				var_170_9.localEulerAngles = var_170_17
			end

			local var_170_18 = 0

			if var_170_18 < arg_167_1.time_ and arg_167_1.time_ <= var_170_18 + arg_170_0 then
				arg_167_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_170_19 = 0
			local var_170_20 = 0.325

			if var_170_19 < arg_167_1.time_ and arg_167_1.time_ <= var_170_19 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_21 = arg_167_1:FormatText(StoryNameCfg[74].name)

				arg_167_1.leftNameTxt_.text = var_170_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, true)
				arg_167_1.iconController_:SetSelectedState("hero")

				arg_167_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_22 = arg_167_1:GetWordFromCfg(107031041)
				local var_170_23 = arg_167_1:FormatText(var_170_22.content)

				arg_167_1.text_.text = var_170_23

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_24 = 13
				local var_170_25 = utf8.len(var_170_23)
				local var_170_26 = var_170_24 <= 0 and var_170_20 or var_170_20 * (var_170_25 / var_170_24)

				if var_170_26 > 0 and var_170_20 < var_170_26 then
					arg_167_1.talkMaxDuration = var_170_26

					if var_170_26 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_26 + var_170_19
					end
				end

				arg_167_1.text_.text = var_170_23
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031041", "story_v_out_107031.awb") ~= 0 then
					local var_170_27 = manager.audio:GetVoiceLength("story_v_out_107031", "107031041", "story_v_out_107031.awb") / 1000

					if var_170_27 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_27 + var_170_19
					end

					if var_170_22.prefab_name ~= "" and arg_167_1.actors_[var_170_22.prefab_name] ~= nil then
						local var_170_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_22.prefab_name].transform, "story_v_out_107031", "107031041", "story_v_out_107031.awb")

						arg_167_1:RecordAudio("107031041", var_170_28)
						arg_167_1:RecordAudio("107031041", var_170_28)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_107031", "107031041", "story_v_out_107031.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_107031", "107031041", "story_v_out_107031.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_29 = math.max(var_170_20, arg_167_1.talkMaxDuration)

			if var_170_19 <= arg_167_1.time_ and arg_167_1.time_ < var_170_19 + var_170_29 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_19) / var_170_29

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_19 + var_170_29 and arg_167_1.time_ < var_170_19 + var_170_29 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play107031042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 107031042
		arg_171_1.duration_ = 5.233

		local var_171_0 = {
			ja = 5.233,
			ko = 2.433,
			zh = 4.2,
			en = 3.566
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
				arg_171_0:Play107031043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_174_1 = 0
			local var_174_2 = 0.3

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_3 = arg_171_1:FormatText(StoryNameCfg[74].name)

				arg_171_1.leftNameTxt_.text = var_174_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, true)
				arg_171_1.iconController_:SetSelectedState("hero")

				arg_171_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_4 = arg_171_1:GetWordFromCfg(107031042)
				local var_174_5 = arg_171_1:FormatText(var_174_4.content)

				arg_171_1.text_.text = var_174_5

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_6 = 12
				local var_174_7 = utf8.len(var_174_5)
				local var_174_8 = var_174_6 <= 0 and var_174_2 or var_174_2 * (var_174_7 / var_174_6)

				if var_174_8 > 0 and var_174_2 < var_174_8 then
					arg_171_1.talkMaxDuration = var_174_8

					if var_174_8 + var_174_1 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_1
					end
				end

				arg_171_1.text_.text = var_174_5
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031042", "story_v_out_107031.awb") ~= 0 then
					local var_174_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031042", "story_v_out_107031.awb") / 1000

					if var_174_9 + var_174_1 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_9 + var_174_1
					end

					if var_174_4.prefab_name ~= "" and arg_171_1.actors_[var_174_4.prefab_name] ~= nil then
						local var_174_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_4.prefab_name].transform, "story_v_out_107031", "107031042", "story_v_out_107031.awb")

						arg_171_1:RecordAudio("107031042", var_174_10)
						arg_171_1:RecordAudio("107031042", var_174_10)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_107031", "107031042", "story_v_out_107031.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_107031", "107031042", "story_v_out_107031.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_11 = math.max(var_174_2, arg_171_1.talkMaxDuration)

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_11 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_1) / var_174_11

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_1 + var_174_11 and arg_171_1.time_ < var_174_1 + var_174_11 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play107031043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 107031043
		arg_175_1.duration_ = 13.2993333333333

		local var_175_0 = {
			ja = 13.2993333333333,
			ko = 10.6663333333333,
			zh = 10.6663333333333,
			en = 10.2993333333333
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
				arg_175_0:Play107031044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 1.5

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				local var_178_1 = manager.ui.mainCamera.transform.localPosition
				local var_178_2 = Vector3.New(0, 0, 10) + Vector3.New(var_178_1.x, var_178_1.y, 0)
				local var_178_3 = arg_175_1.bgs_.S0703

				var_178_3.transform.localPosition = var_178_2
				var_178_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_178_4 = var_178_3:GetComponent("SpriteRenderer")

				if var_178_4 and var_178_4.sprite then
					local var_178_5 = (var_178_3.transform.localPosition - var_178_1).z
					local var_178_6 = manager.ui.mainCameraCom_
					local var_178_7 = 2 * var_178_5 * Mathf.Tan(var_178_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_178_8 = var_178_7 * var_178_6.aspect
					local var_178_9 = var_178_4.sprite.bounds.size.x
					local var_178_10 = var_178_4.sprite.bounds.size.y
					local var_178_11 = var_178_8 / var_178_9
					local var_178_12 = var_178_7 / var_178_10
					local var_178_13 = var_178_12 < var_178_11 and var_178_11 or var_178_12

					var_178_3.transform.localScale = Vector3.New(var_178_13, var_178_13, 0)
				end

				for iter_178_0, iter_178_1 in pairs(arg_175_1.bgs_) do
					if iter_178_0 ~= "S0703" then
						iter_178_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_178_14 = arg_175_1.bgs_.B13
			local var_178_15 = 0

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				local var_178_16 = var_178_14:GetComponent("SpriteRenderer")

				if var_178_16 then
					var_178_16.material = arg_175_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_178_17 = var_178_16.material
					local var_178_18 = var_178_17:GetColor("_Color")

					arg_175_1.var_.alphaOldValueB13 = var_178_18.a
					arg_175_1.var_.alphaMatValueB13 = var_178_17
				end

				arg_175_1.var_.alphaOldValueB13 = 1
			end

			local var_178_19 = 1.5

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_19 then
				local var_178_20 = (arg_175_1.time_ - var_178_15) / var_178_19
				local var_178_21 = Mathf.Lerp(arg_175_1.var_.alphaOldValueB13, 0, var_178_20)

				if arg_175_1.var_.alphaMatValueB13 then
					local var_178_22 = arg_175_1.var_.alphaMatValueB13
					local var_178_23 = var_178_22:GetColor("_Color")

					var_178_23.a = var_178_21

					var_178_22:SetColor("_Color", var_178_23)
				end
			end

			if arg_175_1.time_ >= var_178_15 + var_178_19 and arg_175_1.time_ < var_178_15 + var_178_19 + arg_178_0 and arg_175_1.var_.alphaMatValueB13 then
				local var_178_24 = arg_175_1.var_.alphaMatValueB13
				local var_178_25 = var_178_24:GetColor("_Color")

				var_178_25.a = 0

				var_178_24:SetColor("_Color", var_178_25)
			end

			local var_178_26 = arg_175_1.bgs_.S0703
			local var_178_27 = 1.5

			if var_178_27 < arg_175_1.time_ and arg_175_1.time_ <= var_178_27 + arg_178_0 then
				local var_178_28 = var_178_26:GetComponent("SpriteRenderer")

				if var_178_28 then
					var_178_28.material = arg_175_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_178_29 = var_178_28.material
					local var_178_30 = var_178_29:GetColor("_Color")

					arg_175_1.var_.alphaOldValueS0703 = var_178_30.a
					arg_175_1.var_.alphaMatValueS0703 = var_178_29
				end

				arg_175_1.var_.alphaOldValueS0703 = 0
			end

			local var_178_31 = 1.5

			if var_178_27 <= arg_175_1.time_ and arg_175_1.time_ < var_178_27 + var_178_31 then
				local var_178_32 = (arg_175_1.time_ - var_178_27) / var_178_31
				local var_178_33 = Mathf.Lerp(arg_175_1.var_.alphaOldValueS0703, 1, var_178_32)

				if arg_175_1.var_.alphaMatValueS0703 then
					local var_178_34 = arg_175_1.var_.alphaMatValueS0703
					local var_178_35 = var_178_34:GetColor("_Color")

					var_178_35.a = var_178_33

					var_178_34:SetColor("_Color", var_178_35)
				end
			end

			if arg_175_1.time_ >= var_178_27 + var_178_31 and arg_175_1.time_ < var_178_27 + var_178_31 + arg_178_0 and arg_175_1.var_.alphaMatValueS0703 then
				local var_178_36 = arg_175_1.var_.alphaMatValueS0703
				local var_178_37 = var_178_36:GetColor("_Color")

				var_178_37.a = 1

				var_178_36:SetColor("_Color", var_178_37)
			end

			local var_178_38 = 1.5

			if var_178_38 < arg_175_1.time_ and arg_175_1.time_ <= var_178_38 + arg_178_0 then
				arg_175_1.screenFilterGo_:SetActive(false)
			end

			local var_178_39 = 0.0333333333333333

			if var_178_38 <= arg_175_1.time_ and arg_175_1.time_ < var_178_38 + var_178_39 then
				local var_178_40 = (arg_175_1.time_ - var_178_38) / var_178_39

				arg_175_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_178_40)
			end

			if arg_175_1.time_ >= var_178_38 + var_178_39 and arg_175_1.time_ < var_178_38 + var_178_39 + arg_178_0 then
				arg_175_1.screenFilterEffect_.weight = 0
			end

			local var_178_41 = 0

			if var_178_41 < arg_175_1.time_ and arg_175_1.time_ <= var_178_41 + arg_178_0 then
				arg_175_1.allBtn_.enabled = false
			end

			local var_178_42 = 2.53333333333333

			if arg_175_1.time_ >= var_178_41 + var_178_42 and arg_175_1.time_ < var_178_41 + var_178_42 + arg_178_0 then
				arg_175_1.allBtn_.enabled = true
			end

			local var_178_43 = 2.53333333333333
			local var_178_44 = 0.975

			if var_178_43 < arg_175_1.time_ and arg_175_1.time_ <= var_178_43 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_45 = arg_175_1:FormatText(StoryNameCfg[95].name)

				arg_175_1.leftNameTxt_.text = var_178_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_46 = arg_175_1:GetWordFromCfg(107031043)
				local var_178_47 = arg_175_1:FormatText(var_178_46.content)

				arg_175_1.text_.text = var_178_47

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_48 = 39
				local var_178_49 = utf8.len(var_178_47)
				local var_178_50 = var_178_48 <= 0 and var_178_44 or var_178_44 * (var_178_49 / var_178_48)

				if var_178_50 > 0 and var_178_44 < var_178_50 then
					arg_175_1.talkMaxDuration = var_178_50

					if var_178_50 + var_178_43 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_50 + var_178_43
					end
				end

				arg_175_1.text_.text = var_178_47
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031043", "story_v_out_107031.awb") ~= 0 then
					local var_178_51 = manager.audio:GetVoiceLength("story_v_out_107031", "107031043", "story_v_out_107031.awb") / 1000

					if var_178_51 + var_178_43 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_51 + var_178_43
					end

					if var_178_46.prefab_name ~= "" and arg_175_1.actors_[var_178_46.prefab_name] ~= nil then
						local var_178_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_46.prefab_name].transform, "story_v_out_107031", "107031043", "story_v_out_107031.awb")

						arg_175_1:RecordAudio("107031043", var_178_52)
						arg_175_1:RecordAudio("107031043", var_178_52)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_107031", "107031043", "story_v_out_107031.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_107031", "107031043", "story_v_out_107031.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_53 = math.max(var_178_44, arg_175_1.talkMaxDuration)

			if var_178_43 <= arg_175_1.time_ and arg_175_1.time_ < var_178_43 + var_178_53 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_43) / var_178_53

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_43 + var_178_53 and arg_175_1.time_ < var_178_43 + var_178_53 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play107031044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 107031044
		arg_179_1.duration_ = 4.066

		local var_179_0 = {
			ja = 3.8,
			ko = 3.966,
			zh = 4.066,
			en = 3.133
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
				arg_179_0:Play107031045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_182_1 = 0
			local var_182_2 = 0.275

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_3 = arg_179_1:FormatText(StoryNameCfg[74].name)

				arg_179_1.leftNameTxt_.text = var_182_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_4 = arg_179_1:GetWordFromCfg(107031044)
				local var_182_5 = arg_179_1:FormatText(var_182_4.content)

				arg_179_1.text_.text = var_182_5

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_6 = 11
				local var_182_7 = utf8.len(var_182_5)
				local var_182_8 = var_182_6 <= 0 and var_182_2 or var_182_2 * (var_182_7 / var_182_6)

				if var_182_8 > 0 and var_182_2 < var_182_8 then
					arg_179_1.talkMaxDuration = var_182_8

					if var_182_8 + var_182_1 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_1
					end
				end

				arg_179_1.text_.text = var_182_5
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031044", "story_v_out_107031.awb") ~= 0 then
					local var_182_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031044", "story_v_out_107031.awb") / 1000

					if var_182_9 + var_182_1 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_9 + var_182_1
					end

					if var_182_4.prefab_name ~= "" and arg_179_1.actors_[var_182_4.prefab_name] ~= nil then
						local var_182_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_4.prefab_name].transform, "story_v_out_107031", "107031044", "story_v_out_107031.awb")

						arg_179_1:RecordAudio("107031044", var_182_10)
						arg_179_1:RecordAudio("107031044", var_182_10)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_107031", "107031044", "story_v_out_107031.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_107031", "107031044", "story_v_out_107031.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_11 = math.max(var_182_2, arg_179_1.talkMaxDuration)

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_11 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_1) / var_182_11

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_1 + var_182_11 and arg_179_1.time_ < var_182_1 + var_182_11 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play107031045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 107031045
		arg_183_1.duration_ = 6.866

		local var_183_0 = {
			ja = 6.2,
			ko = 4.166,
			zh = 6.866,
			en = 4.8
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
				arg_183_0:Play107031046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.5

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[95].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(107031045)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 20
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031045", "story_v_out_107031.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_107031", "107031045", "story_v_out_107031.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_107031", "107031045", "story_v_out_107031.awb")

						arg_183_1:RecordAudio("107031045", var_186_9)
						arg_183_1:RecordAudio("107031045", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_107031", "107031045", "story_v_out_107031.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_107031", "107031045", "story_v_out_107031.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play107031046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 107031046
		arg_187_1.duration_ = 4.733

		local var_187_0 = {
			ja = 2.533,
			ko = 1.566,
			zh = 4.733,
			en = 1.533
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
			arg_187_1.auto_ = false
		end

		function arg_187_1.playNext_(arg_189_0)
			arg_187_1.onStoryFinished_()
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_190_1 = 0
			local var_190_2 = 0.175

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_3 = arg_187_1:FormatText(StoryNameCfg[74].name)

				arg_187_1.leftNameTxt_.text = var_190_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_4 = arg_187_1:GetWordFromCfg(107031046)
				local var_190_5 = arg_187_1:FormatText(var_190_4.content)

				arg_187_1.text_.text = var_190_5

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_6 = 7
				local var_190_7 = utf8.len(var_190_5)
				local var_190_8 = var_190_6 <= 0 and var_190_2 or var_190_2 * (var_190_7 / var_190_6)

				if var_190_8 > 0 and var_190_2 < var_190_8 then
					arg_187_1.talkMaxDuration = var_190_8

					if var_190_8 + var_190_1 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_1
					end
				end

				arg_187_1.text_.text = var_190_5
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107031", "107031046", "story_v_out_107031.awb") ~= 0 then
					local var_190_9 = manager.audio:GetVoiceLength("story_v_out_107031", "107031046", "story_v_out_107031.awb") / 1000

					if var_190_9 + var_190_1 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_9 + var_190_1
					end

					if var_190_4.prefab_name ~= "" and arg_187_1.actors_[var_190_4.prefab_name] ~= nil then
						local var_190_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_4.prefab_name].transform, "story_v_out_107031", "107031046", "story_v_out_107031.awb")

						arg_187_1:RecordAudio("107031046", var_190_10)
						arg_187_1:RecordAudio("107031046", var_190_10)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_107031", "107031046", "story_v_out_107031.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_107031", "107031046", "story_v_out_107031.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_11 = math.max(var_190_2, arg_187_1.talkMaxDuration)

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_11 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_1) / var_190_11

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_1 + var_190_11 and arg_187_1.time_ < var_190_1 + var_190_11 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C04a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0703",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13"
	},
	voices = {
		"story_v_out_107031.awb"
	}
}
