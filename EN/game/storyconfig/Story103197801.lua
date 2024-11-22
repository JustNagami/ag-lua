return {
	Play319781001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319781001
		arg_1_1.duration_ = 15.866

		local var_1_0 = {
			zh = 11.933,
			ja = 15.866
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
				arg_1_0:Play319781002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST74"

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
				local var_4_5 = arg_1_1.bgs_.ST74

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
					if iter_4_0 ~= "ST74" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = "1095ui_story"

			if arg_1_1.actors_[var_4_24] == nil then
				local var_4_25 = Object.Instantiate(Asset.Load("Char/" .. var_4_24), arg_1_1.stage_.transform)

				var_4_25.name = var_4_24
				var_4_25.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_24] = var_4_25

				local var_4_26 = var_4_25:GetComponentInChildren(typeof(CharacterEffect))

				var_4_26.enabled = true

				local var_4_27 = GameObjectTools.GetOrAddComponent(var_4_25, typeof(DynamicBoneHelper))

				if var_4_27 then
					var_4_27:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_26.transform, false)

				arg_1_1.var_[var_4_24 .. "Animator"] = var_4_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_24 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_24 .. "LipSync"] = var_4_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_28 = arg_1_1.actors_["1095ui_story"].transform
			local var_4_29 = 2

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.moveOldPos1095ui_story = var_4_28.localPosition
			end

			local var_4_30 = 0.001

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / var_4_30
				local var_4_32 = Vector3.New(0, -0.98, -6.1)

				var_4_28.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1095ui_story, var_4_32, var_4_31)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_28.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_28.localEulerAngles = var_4_34
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_4_35 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_35.x, var_4_35.y, var_4_35.z)

				local var_4_36 = var_4_28.localEulerAngles

				var_4_36.z = 0
				var_4_36.x = 0
				var_4_28.localEulerAngles = var_4_36
			end

			local var_4_37 = arg_1_1.actors_["1095ui_story"]
			local var_4_38 = 2

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story == nil then
				arg_1_1.var_.characterEffect1095ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.200000002980232

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1095ui_story then
					arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story then
				arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_4_42 = 2

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_43 = 0
			local var_4_44 = 0.2

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_47 = 0.233333333333333
			local var_4_48 = 1

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_51 = 2.1
			local var_4_52 = 1.075

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_53 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_53:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_54 = arg_1_1:FormatText(StoryNameCfg[471].name)

				arg_1_1.leftNameTxt_.text = var_4_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_55 = arg_1_1:GetWordFromCfg(319781001)
				local var_4_56 = arg_1_1:FormatText(var_4_55.content)

				arg_1_1.text_.text = var_4_56

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_57 = 43
				local var_4_58 = utf8.len(var_4_56)
				local var_4_59 = var_4_57 <= 0 and var_4_52 or var_4_52 * (var_4_58 / var_4_57)

				if var_4_59 > 0 and var_4_52 < var_4_59 then
					arg_1_1.talkMaxDuration = var_4_59
					var_4_51 = var_4_51 + 0.3

					if var_4_59 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_51
					end
				end

				arg_1_1.text_.text = var_4_56
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781001", "story_v_out_319781.awb") ~= 0 then
					local var_4_60 = manager.audio:GetVoiceLength("story_v_out_319781", "319781001", "story_v_out_319781.awb") / 1000

					if var_4_60 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_51
					end

					if var_4_55.prefab_name ~= "" and arg_1_1.actors_[var_4_55.prefab_name] ~= nil then
						local var_4_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_55.prefab_name].transform, "story_v_out_319781", "319781001", "story_v_out_319781.awb")

						arg_1_1:RecordAudio("319781001", var_4_61)
						arg_1_1:RecordAudio("319781001", var_4_61)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319781", "319781001", "story_v_out_319781.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319781", "319781001", "story_v_out_319781.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_62 = var_4_51 + 0.3
			local var_4_63 = math.max(var_4_52, arg_1_1.talkMaxDuration)

			if var_4_62 <= arg_1_1.time_ and arg_1_1.time_ < var_4_62 + var_4_63 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_62) / var_4_63

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_62 + var_4_63 and arg_1_1.time_ < var_4_62 + var_4_63 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319781002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319781002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319781003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1095ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story == nil then
				arg_7_1.var_.characterEffect1095ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1095ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1095ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1095ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 1.45

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_8 = arg_7_1:GetWordFromCfg(319781002)
				local var_10_9 = arg_7_1:FormatText(var_10_8.content)

				arg_7_1.text_.text = var_10_9

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_10 = 58
				local var_10_11 = utf8.len(var_10_9)
				local var_10_12 = var_10_10 <= 0 and var_10_7 or var_10_7 * (var_10_11 / var_10_10)

				if var_10_12 > 0 and var_10_7 < var_10_12 then
					arg_7_1.talkMaxDuration = var_10_12

					if var_10_12 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_12 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_9
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_13 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_13 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_13

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_13 and arg_7_1.time_ < var_10_6 + var_10_13 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319781003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319781003
		arg_11_1.duration_ = 5.566

		local var_11_0 = {
			zh = 5,
			ja = 5.566
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
				arg_11_0:Play319781004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1095ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story == nil then
				arg_11_1.var_.characterEffect1095ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1095ui_story then
					arg_11_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story then
				arg_11_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_14_4 = 0
			local var_14_5 = 0.55

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_6 = arg_11_1:FormatText(StoryNameCfg[471].name)

				arg_11_1.leftNameTxt_.text = var_14_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_7 = arg_11_1:GetWordFromCfg(319781003)
				local var_14_8 = arg_11_1:FormatText(var_14_7.content)

				arg_11_1.text_.text = var_14_8

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_9 = 22
				local var_14_10 = utf8.len(var_14_8)
				local var_14_11 = var_14_9 <= 0 and var_14_5 or var_14_5 * (var_14_10 / var_14_9)

				if var_14_11 > 0 and var_14_5 < var_14_11 then
					arg_11_1.talkMaxDuration = var_14_11

					if var_14_11 + var_14_4 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_11 + var_14_4
					end
				end

				arg_11_1.text_.text = var_14_8
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781003", "story_v_out_319781.awb") ~= 0 then
					local var_14_12 = manager.audio:GetVoiceLength("story_v_out_319781", "319781003", "story_v_out_319781.awb") / 1000

					if var_14_12 + var_14_4 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_12 + var_14_4
					end

					if var_14_7.prefab_name ~= "" and arg_11_1.actors_[var_14_7.prefab_name] ~= nil then
						local var_14_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_7.prefab_name].transform, "story_v_out_319781", "319781003", "story_v_out_319781.awb")

						arg_11_1:RecordAudio("319781003", var_14_13)
						arg_11_1:RecordAudio("319781003", var_14_13)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319781", "319781003", "story_v_out_319781.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319781", "319781003", "story_v_out_319781.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_5, arg_11_1.talkMaxDuration)

			if var_14_4 <= arg_11_1.time_ and arg_11_1.time_ < var_14_4 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_4) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_4 + var_14_14 and arg_11_1.time_ < var_14_4 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319781004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319781004
		arg_15_1.duration_ = 5.566

		local var_15_0 = {
			zh = 2.9,
			ja = 5.566
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
				arg_15_0:Play319781005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1095ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story == nil then
				arg_15_1.var_.characterEffect1095ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1095ui_story then
					arg_15_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story then
				arg_15_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action4_1")
			end

			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_6 = 0
			local var_18_7 = 0.275

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[471].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(319781004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781004", "story_v_out_319781.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_319781", "319781004", "story_v_out_319781.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_319781", "319781004", "story_v_out_319781.awb")

						arg_15_1:RecordAudio("319781004", var_18_15)
						arg_15_1:RecordAudio("319781004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319781", "319781004", "story_v_out_319781.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319781", "319781004", "story_v_out_319781.awb")
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
	Play319781005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319781005
		arg_19_1.duration_ = 4.966

		local var_19_0 = {
			zh = 4.766,
			ja = 4.966
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
				arg_19_0:Play319781006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1084ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("Char/" .. var_22_0), arg_19_1.stage_.transform)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_0] = var_22_1

				local var_22_2 = var_22_1:GetComponentInChildren(typeof(CharacterEffect))

				var_22_2.enabled = true

				local var_22_3 = GameObjectTools.GetOrAddComponent(var_22_1, typeof(DynamicBoneHelper))

				if var_22_3 then
					var_22_3:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_2.transform, false)

				arg_19_1.var_[var_22_0 .. "Animator"] = var_22_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_4 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0.7, -0.97, -6)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = arg_19_1.actors_["1084ui_story"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_15 = 0.200000002980232

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.characterEffect1084ui_story then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_22_19 = arg_19_1.actors_["1095ui_story"].transform
			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1.var_.moveOldPos1095ui_story = var_22_19.localPosition
			end

			local var_22_21 = 0.001

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_21 then
				local var_22_22 = (arg_19_1.time_ - var_22_20) / var_22_21
				local var_22_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_22_19.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1095ui_story, var_22_23, var_22_22)

				local var_22_24 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_24.x, var_22_24.y, var_22_24.z)

				local var_22_25 = var_22_19.localEulerAngles

				var_22_25.z = 0
				var_22_25.x = 0
				var_22_19.localEulerAngles = var_22_25
			end

			if arg_19_1.time_ >= var_22_20 + var_22_21 and arg_19_1.time_ < var_22_20 + var_22_21 + arg_22_0 then
				var_22_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_22_26 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_26.x, var_22_26.y, var_22_26.z)

				local var_22_27 = var_22_19.localEulerAngles

				var_22_27.z = 0
				var_22_27.x = 0
				var_22_19.localEulerAngles = var_22_27
			end

			local var_22_28 = arg_19_1.actors_["1095ui_story"]
			local var_22_29 = 0

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story == nil then
				arg_19_1.var_.characterEffect1095ui_story = var_22_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_30 = 0.200000002980232

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_30 then
				local var_22_31 = (arg_19_1.time_ - var_22_29) / var_22_30

				if arg_19_1.var_.characterEffect1095ui_story then
					local var_22_32 = Mathf.Lerp(0, 0.5, var_22_31)

					arg_19_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1095ui_story.fillRatio = var_22_32
				end
			end

			if arg_19_1.time_ >= var_22_29 + var_22_30 and arg_19_1.time_ < var_22_29 + var_22_30 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story then
				local var_22_33 = 0.5

				arg_19_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1095ui_story.fillRatio = var_22_33
			end

			local var_22_34 = 0
			local var_22_35 = 0.625

			if var_22_34 < arg_19_1.time_ and arg_19_1.time_ <= var_22_34 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_36 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_37 = arg_19_1:GetWordFromCfg(319781005)
				local var_22_38 = arg_19_1:FormatText(var_22_37.content)

				arg_19_1.text_.text = var_22_38

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_39 = 25
				local var_22_40 = utf8.len(var_22_38)
				local var_22_41 = var_22_39 <= 0 and var_22_35 or var_22_35 * (var_22_40 / var_22_39)

				if var_22_41 > 0 and var_22_35 < var_22_41 then
					arg_19_1.talkMaxDuration = var_22_41

					if var_22_41 + var_22_34 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_41 + var_22_34
					end
				end

				arg_19_1.text_.text = var_22_38
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781005", "story_v_out_319781.awb") ~= 0 then
					local var_22_42 = manager.audio:GetVoiceLength("story_v_out_319781", "319781005", "story_v_out_319781.awb") / 1000

					if var_22_42 + var_22_34 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_42 + var_22_34
					end

					if var_22_37.prefab_name ~= "" and arg_19_1.actors_[var_22_37.prefab_name] ~= nil then
						local var_22_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_37.prefab_name].transform, "story_v_out_319781", "319781005", "story_v_out_319781.awb")

						arg_19_1:RecordAudio("319781005", var_22_43)
						arg_19_1:RecordAudio("319781005", var_22_43)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319781", "319781005", "story_v_out_319781.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319781", "319781005", "story_v_out_319781.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_44 = math.max(var_22_35, arg_19_1.talkMaxDuration)

			if var_22_34 <= arg_19_1.time_ and arg_19_1.time_ < var_22_34 + var_22_44 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_34) / var_22_44

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_34 + var_22_44 and arg_19_1.time_ < var_22_34 + var_22_44 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319781006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319781006
		arg_23_1.duration_ = 7.366

		local var_23_0 = {
			zh = 5.433,
			ja = 7.366
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
				arg_23_0:Play319781007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "4040ui_story"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("Char/" .. var_26_0), arg_23_1.stage_.transform)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_0] = var_26_1

				local var_26_2 = var_26_1:GetComponentInChildren(typeof(CharacterEffect))

				var_26_2.enabled = true

				local var_26_3 = GameObjectTools.GetOrAddComponent(var_26_1, typeof(DynamicBoneHelper))

				if var_26_3 then
					var_26_3:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_2.transform, false)

				arg_23_1.var_[var_26_0 .. "Animator"] = var_26_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_0 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_0 .. "LipSync"] = var_26_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_4 = arg_23_1.actors_["4040ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos4040ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(0, -1.55, -5.5)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos4040ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = arg_23_1.actors_["4040ui_story"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.characterEffect4040ui_story == nil then
				arg_23_1.var_.characterEffect4040ui_story = var_26_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_15 = 0.200000002980232

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.characterEffect4040ui_story then
					arg_23_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect4040ui_story then
				arg_23_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				arg_23_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_26_19 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(0, 100, 0)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_23, var_26_22)

				local var_26_24 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_24.x, var_26_24.y, var_26_24.z)

				local var_26_25 = var_26_19.localEulerAngles

				var_26_25.z = 0
				var_26_25.x = 0
				var_26_19.localEulerAngles = var_26_25
			end

			if arg_23_1.time_ >= var_26_20 + var_26_21 and arg_23_1.time_ < var_26_20 + var_26_21 + arg_26_0 then
				var_26_19.localPosition = Vector3.New(0, 100, 0)

				local var_26_26 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_26.x, var_26_26.y, var_26_26.z)

				local var_26_27 = var_26_19.localEulerAngles

				var_26_27.z = 0
				var_26_27.x = 0
				var_26_19.localEulerAngles = var_26_27
			end

			local var_26_28 = arg_23_1.actors_["1084ui_story"]
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_30 = 0.200000002980232

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_30 then
				local var_26_31 = (arg_23_1.time_ - var_26_29) / var_26_30

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_32 = Mathf.Lerp(0, 0.5, var_26_31)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_32
				end
			end

			if arg_23_1.time_ >= var_26_29 + var_26_30 and arg_23_1.time_ < var_26_29 + var_26_30 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_33 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_33
			end

			local var_26_34 = arg_23_1.actors_["1095ui_story"].transform
			local var_26_35 = 0

			if var_26_35 < arg_23_1.time_ and arg_23_1.time_ <= var_26_35 + arg_26_0 then
				arg_23_1.var_.moveOldPos1095ui_story = var_26_34.localPosition
			end

			local var_26_36 = 0.001

			if var_26_35 <= arg_23_1.time_ and arg_23_1.time_ < var_26_35 + var_26_36 then
				local var_26_37 = (arg_23_1.time_ - var_26_35) / var_26_36
				local var_26_38 = Vector3.New(0, 100, 0)

				var_26_34.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1095ui_story, var_26_38, var_26_37)

				local var_26_39 = manager.ui.mainCamera.transform.position - var_26_34.position

				var_26_34.forward = Vector3.New(var_26_39.x, var_26_39.y, var_26_39.z)

				local var_26_40 = var_26_34.localEulerAngles

				var_26_40.z = 0
				var_26_40.x = 0
				var_26_34.localEulerAngles = var_26_40
			end

			if arg_23_1.time_ >= var_26_35 + var_26_36 and arg_23_1.time_ < var_26_35 + var_26_36 + arg_26_0 then
				var_26_34.localPosition = Vector3.New(0, 100, 0)

				local var_26_41 = manager.ui.mainCamera.transform.position - var_26_34.position

				var_26_34.forward = Vector3.New(var_26_41.x, var_26_41.y, var_26_41.z)

				local var_26_42 = var_26_34.localEulerAngles

				var_26_42.z = 0
				var_26_42.x = 0
				var_26_34.localEulerAngles = var_26_42
			end

			local var_26_43 = arg_23_1.actors_["1095ui_story"]
			local var_26_44 = 0

			if var_26_44 < arg_23_1.time_ and arg_23_1.time_ <= var_26_44 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story == nil then
				arg_23_1.var_.characterEffect1095ui_story = var_26_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_45 = 0.200000002980232

			if var_26_44 <= arg_23_1.time_ and arg_23_1.time_ < var_26_44 + var_26_45 then
				local var_26_46 = (arg_23_1.time_ - var_26_44) / var_26_45

				if arg_23_1.var_.characterEffect1095ui_story then
					local var_26_47 = Mathf.Lerp(0, 0.5, var_26_46)

					arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_47
				end
			end

			if arg_23_1.time_ >= var_26_44 + var_26_45 and arg_23_1.time_ < var_26_44 + var_26_45 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				local var_26_48 = 0.5

				arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_48
			end

			local var_26_49 = 0
			local var_26_50 = 0.65

			if var_26_49 < arg_23_1.time_ and arg_23_1.time_ <= var_26_49 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_51 = arg_23_1:FormatText(StoryNameCfg[668].name)

				arg_23_1.leftNameTxt_.text = var_26_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_52 = arg_23_1:GetWordFromCfg(319781006)
				local var_26_53 = arg_23_1:FormatText(var_26_52.content)

				arg_23_1.text_.text = var_26_53

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_54 = 26
				local var_26_55 = utf8.len(var_26_53)
				local var_26_56 = var_26_54 <= 0 and var_26_50 or var_26_50 * (var_26_55 / var_26_54)

				if var_26_56 > 0 and var_26_50 < var_26_56 then
					arg_23_1.talkMaxDuration = var_26_56

					if var_26_56 + var_26_49 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_56 + var_26_49
					end
				end

				arg_23_1.text_.text = var_26_53
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781006", "story_v_out_319781.awb") ~= 0 then
					local var_26_57 = manager.audio:GetVoiceLength("story_v_out_319781", "319781006", "story_v_out_319781.awb") / 1000

					if var_26_57 + var_26_49 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_57 + var_26_49
					end

					if var_26_52.prefab_name ~= "" and arg_23_1.actors_[var_26_52.prefab_name] ~= nil then
						local var_26_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_52.prefab_name].transform, "story_v_out_319781", "319781006", "story_v_out_319781.awb")

						arg_23_1:RecordAudio("319781006", var_26_58)
						arg_23_1:RecordAudio("319781006", var_26_58)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319781", "319781006", "story_v_out_319781.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319781", "319781006", "story_v_out_319781.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_59 = math.max(var_26_50, arg_23_1.talkMaxDuration)

			if var_26_49 <= arg_23_1.time_ and arg_23_1.time_ < var_26_49 + var_26_59 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_49) / var_26_59

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_49 + var_26_59 and arg_23_1.time_ < var_26_49 + var_26_59 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319781007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319781007
		arg_27_1.duration_ = 5.633

		local var_27_0 = {
			zh = 3.3,
			ja = 5.633
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
				arg_27_0:Play319781008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1095ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1095ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0.7, -0.98, -6.1)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1095ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["1095ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story == nil then
				arg_27_1.var_.characterEffect1095ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1095ui_story then
					arg_27_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story then
				arg_27_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_30_13 = arg_27_1.actors_["4040ui_story"].transform
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1.var_.moveOldPos4040ui_story = var_30_13.localPosition
			end

			local var_30_15 = 0.001

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15
				local var_30_17 = Vector3.New(-0.7, -1.55, -5.5)

				var_30_13.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos4040ui_story, var_30_17, var_30_16)

				local var_30_18 = manager.ui.mainCamera.transform.position - var_30_13.position

				var_30_13.forward = Vector3.New(var_30_18.x, var_30_18.y, var_30_18.z)

				local var_30_19 = var_30_13.localEulerAngles

				var_30_19.z = 0
				var_30_19.x = 0
				var_30_13.localEulerAngles = var_30_19
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 then
				var_30_13.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_30_20 = manager.ui.mainCamera.transform.position - var_30_13.position

				var_30_13.forward = Vector3.New(var_30_20.x, var_30_20.y, var_30_20.z)

				local var_30_21 = var_30_13.localEulerAngles

				var_30_21.z = 0
				var_30_21.x = 0
				var_30_13.localEulerAngles = var_30_21
			end

			local var_30_22 = arg_27_1.actors_["4040ui_story"]
			local var_30_23 = 0

			if var_30_23 < arg_27_1.time_ and arg_27_1.time_ <= var_30_23 + arg_30_0 and arg_27_1.var_.characterEffect4040ui_story == nil then
				arg_27_1.var_.characterEffect4040ui_story = var_30_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_24 = 0.200000002980232

			if var_30_23 <= arg_27_1.time_ and arg_27_1.time_ < var_30_23 + var_30_24 then
				local var_30_25 = (arg_27_1.time_ - var_30_23) / var_30_24

				if arg_27_1.var_.characterEffect4040ui_story then
					local var_30_26 = Mathf.Lerp(0, 0.5, var_30_25)

					arg_27_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_27_1.var_.characterEffect4040ui_story.fillRatio = var_30_26
				end
			end

			if arg_27_1.time_ >= var_30_23 + var_30_24 and arg_27_1.time_ < var_30_23 + var_30_24 + arg_30_0 and arg_27_1.var_.characterEffect4040ui_story then
				local var_30_27 = 0.5

				arg_27_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_27_1.var_.characterEffect4040ui_story.fillRatio = var_30_27
			end

			local var_30_28 = 0
			local var_30_29 = 0.275

			if var_30_28 < arg_27_1.time_ and arg_27_1.time_ <= var_30_28 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_30 = arg_27_1:FormatText(StoryNameCfg[471].name)

				arg_27_1.leftNameTxt_.text = var_30_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_31 = arg_27_1:GetWordFromCfg(319781007)
				local var_30_32 = arg_27_1:FormatText(var_30_31.content)

				arg_27_1.text_.text = var_30_32

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_33 = 11
				local var_30_34 = utf8.len(var_30_32)
				local var_30_35 = var_30_33 <= 0 and var_30_29 or var_30_29 * (var_30_34 / var_30_33)

				if var_30_35 > 0 and var_30_29 < var_30_35 then
					arg_27_1.talkMaxDuration = var_30_35

					if var_30_35 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_35 + var_30_28
					end
				end

				arg_27_1.text_.text = var_30_32
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781007", "story_v_out_319781.awb") ~= 0 then
					local var_30_36 = manager.audio:GetVoiceLength("story_v_out_319781", "319781007", "story_v_out_319781.awb") / 1000

					if var_30_36 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_28
					end

					if var_30_31.prefab_name ~= "" and arg_27_1.actors_[var_30_31.prefab_name] ~= nil then
						local var_30_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_31.prefab_name].transform, "story_v_out_319781", "319781007", "story_v_out_319781.awb")

						arg_27_1:RecordAudio("319781007", var_30_37)
						arg_27_1:RecordAudio("319781007", var_30_37)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319781", "319781007", "story_v_out_319781.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319781", "319781007", "story_v_out_319781.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_38 = math.max(var_30_29, arg_27_1.talkMaxDuration)

			if var_30_28 <= arg_27_1.time_ and arg_27_1.time_ < var_30_28 + var_30_38 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_28) / var_30_38

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_28 + var_30_38 and arg_27_1.time_ < var_30_28 + var_30_38 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319781008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319781008
		arg_31_1.duration_ = 3.8

		local var_31_0 = {
			zh = 3.8,
			ja = 3.266
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
				arg_31_0:Play319781009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1095ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story == nil then
				arg_31_1.var_.characterEffect1095ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1095ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1095ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1095ui_story.fillRatio = var_34_5
			end

			local var_34_6 = arg_31_1.actors_["4040ui_story"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 and arg_31_1.var_.characterEffect4040ui_story == nil then
				arg_31_1.var_.characterEffect4040ui_story = var_34_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_8 = 0.200000002980232

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8

				if arg_31_1.var_.characterEffect4040ui_story then
					arg_31_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 and arg_31_1.var_.characterEffect4040ui_story then
				arg_31_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_34_11 = 0

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_34_12 = 0
			local var_34_13 = 0.425

			if var_34_12 < arg_31_1.time_ and arg_31_1.time_ <= var_34_12 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_14 = arg_31_1:FormatText(StoryNameCfg[668].name)

				arg_31_1.leftNameTxt_.text = var_34_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_15 = arg_31_1:GetWordFromCfg(319781008)
				local var_34_16 = arg_31_1:FormatText(var_34_15.content)

				arg_31_1.text_.text = var_34_16

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_17 = 17
				local var_34_18 = utf8.len(var_34_16)
				local var_34_19 = var_34_17 <= 0 and var_34_13 or var_34_13 * (var_34_18 / var_34_17)

				if var_34_19 > 0 and var_34_13 < var_34_19 then
					arg_31_1.talkMaxDuration = var_34_19

					if var_34_19 + var_34_12 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_12
					end
				end

				arg_31_1.text_.text = var_34_16
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781008", "story_v_out_319781.awb") ~= 0 then
					local var_34_20 = manager.audio:GetVoiceLength("story_v_out_319781", "319781008", "story_v_out_319781.awb") / 1000

					if var_34_20 + var_34_12 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_20 + var_34_12
					end

					if var_34_15.prefab_name ~= "" and arg_31_1.actors_[var_34_15.prefab_name] ~= nil then
						local var_34_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_15.prefab_name].transform, "story_v_out_319781", "319781008", "story_v_out_319781.awb")

						arg_31_1:RecordAudio("319781008", var_34_21)
						arg_31_1:RecordAudio("319781008", var_34_21)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319781", "319781008", "story_v_out_319781.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319781", "319781008", "story_v_out_319781.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_22 = math.max(var_34_13, arg_31_1.talkMaxDuration)

			if var_34_12 <= arg_31_1.time_ and arg_31_1.time_ < var_34_12 + var_34_22 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_12) / var_34_22

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_12 + var_34_22 and arg_31_1.time_ < var_34_12 + var_34_22 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319781009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319781009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play319781010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["4040ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect4040ui_story == nil then
				arg_35_1.var_.characterEffect4040ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect4040ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_35_1.var_.characterEffect4040ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect4040ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_35_1.var_.characterEffect4040ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["4040ui_story"].transform
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.var_.moveOldPos4040ui_story = var_38_6.localPosition
			end

			local var_38_8 = 0.001

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8
				local var_38_10 = Vector3.New(0, 100, 0)

				var_38_6.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos4040ui_story, var_38_10, var_38_9)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_6.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_6.localEulerAngles = var_38_12
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 then
				var_38_6.localPosition = Vector3.New(0, 100, 0)

				local var_38_13 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_13.x, var_38_13.y, var_38_13.z)

				local var_38_14 = var_38_6.localEulerAngles

				var_38_14.z = 0
				var_38_14.x = 0
				var_38_6.localEulerAngles = var_38_14
			end

			local var_38_15 = arg_35_1.actors_["1095ui_story"].transform
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.var_.moveOldPos1095ui_story = var_38_15.localPosition
			end

			local var_38_17 = 0.001

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Vector3.New(0, 100, 0)

				var_38_15.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1095ui_story, var_38_19, var_38_18)

				local var_38_20 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_20.x, var_38_20.y, var_38_20.z)

				local var_38_21 = var_38_15.localEulerAngles

				var_38_21.z = 0
				var_38_21.x = 0
				var_38_15.localEulerAngles = var_38_21
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				var_38_15.localPosition = Vector3.New(0, 100, 0)

				local var_38_22 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_22.x, var_38_22.y, var_38_22.z)

				local var_38_23 = var_38_15.localEulerAngles

				var_38_23.z = 0
				var_38_23.x = 0
				var_38_15.localEulerAngles = var_38_23
			end

			local var_38_24 = 0
			local var_38_25 = 0.6

			if var_38_24 < arg_35_1.time_ and arg_35_1.time_ <= var_38_24 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_26 = arg_35_1:GetWordFromCfg(319781009)
				local var_38_27 = arg_35_1:FormatText(var_38_26.content)

				arg_35_1.text_.text = var_38_27

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_28 = 24
				local var_38_29 = utf8.len(var_38_27)
				local var_38_30 = var_38_28 <= 0 and var_38_25 or var_38_25 * (var_38_29 / var_38_28)

				if var_38_30 > 0 and var_38_25 < var_38_30 then
					arg_35_1.talkMaxDuration = var_38_30

					if var_38_30 + var_38_24 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_30 + var_38_24
					end
				end

				arg_35_1.text_.text = var_38_27
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_31 = math.max(var_38_25, arg_35_1.talkMaxDuration)

			if var_38_24 <= arg_35_1.time_ and arg_35_1.time_ < var_38_24 + var_38_31 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_24) / var_38_31

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_24 + var_38_31 and arg_35_1.time_ < var_38_24 + var_38_31 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319781010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319781010
		arg_39_1.duration_ = 2.966

		local var_39_0 = {
			zh = 2.5,
			ja = 2.966
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
				arg_39_0:Play319781011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1084ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1084ui_story = var_42_0.localPosition

				local var_42_2 = "1084ui_story"

				arg_39_1:ShowWeapon(arg_39_1.var_[var_42_2 .. "Animator"].transform, false)
			end

			local var_42_3 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_3 then
				local var_42_4 = (arg_39_1.time_ - var_42_1) / var_42_3
				local var_42_5 = Vector3.New(0, -0.97, -6)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1084ui_story, var_42_5, var_42_4)

				local var_42_6 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_6.x, var_42_6.y, var_42_6.z)

				local var_42_7 = var_42_0.localEulerAngles

				var_42_7.z = 0
				var_42_7.x = 0
				var_42_0.localEulerAngles = var_42_7
			end

			if arg_39_1.time_ >= var_42_1 + var_42_3 and arg_39_1.time_ < var_42_1 + var_42_3 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_42_8 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_8.x, var_42_8.y, var_42_8.z)

				local var_42_9 = var_42_0.localEulerAngles

				var_42_9.z = 0
				var_42_9.x = 0
				var_42_0.localEulerAngles = var_42_9
			end

			local var_42_10 = arg_39_1.actors_["1084ui_story"]
			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_12 = 0.200000002980232

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_12 then
				local var_42_13 = (arg_39_1.time_ - var_42_11) / var_42_12

				if arg_39_1.var_.characterEffect1084ui_story then
					arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_11 + var_42_12 and arg_39_1.time_ < var_42_11 + var_42_12 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_42_15 = 0

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_16 = arg_39_1.actors_["1095ui_story"]
			local var_42_17 = 0

			if var_42_17 < arg_39_1.time_ and arg_39_1.time_ <= var_42_17 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story == nil then
				arg_39_1.var_.characterEffect1095ui_story = var_42_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_18 = 0.200000002980232

			if var_42_17 <= arg_39_1.time_ and arg_39_1.time_ < var_42_17 + var_42_18 then
				local var_42_19 = (arg_39_1.time_ - var_42_17) / var_42_18

				if arg_39_1.var_.characterEffect1095ui_story then
					local var_42_20 = Mathf.Lerp(0, 0.5, var_42_19)

					arg_39_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1095ui_story.fillRatio = var_42_20
				end
			end

			if arg_39_1.time_ >= var_42_17 + var_42_18 and arg_39_1.time_ < var_42_17 + var_42_18 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story then
				local var_42_21 = 0.5

				arg_39_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1095ui_story.fillRatio = var_42_21
			end

			local var_42_22 = arg_39_1.actors_["4040ui_story"].transform
			local var_42_23 = 0

			if var_42_23 < arg_39_1.time_ and arg_39_1.time_ <= var_42_23 + arg_42_0 then
				arg_39_1.var_.moveOldPos4040ui_story = var_42_22.localPosition
			end

			local var_42_24 = 0.001

			if var_42_23 <= arg_39_1.time_ and arg_39_1.time_ < var_42_23 + var_42_24 then
				local var_42_25 = (arg_39_1.time_ - var_42_23) / var_42_24
				local var_42_26 = Vector3.New(0, 100, 0)

				var_42_22.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos4040ui_story, var_42_26, var_42_25)

				local var_42_27 = manager.ui.mainCamera.transform.position - var_42_22.position

				var_42_22.forward = Vector3.New(var_42_27.x, var_42_27.y, var_42_27.z)

				local var_42_28 = var_42_22.localEulerAngles

				var_42_28.z = 0
				var_42_28.x = 0
				var_42_22.localEulerAngles = var_42_28
			end

			if arg_39_1.time_ >= var_42_23 + var_42_24 and arg_39_1.time_ < var_42_23 + var_42_24 + arg_42_0 then
				var_42_22.localPosition = Vector3.New(0, 100, 0)

				local var_42_29 = manager.ui.mainCamera.transform.position - var_42_22.position

				var_42_22.forward = Vector3.New(var_42_29.x, var_42_29.y, var_42_29.z)

				local var_42_30 = var_42_22.localEulerAngles

				var_42_30.z = 0
				var_42_30.x = 0
				var_42_22.localEulerAngles = var_42_30
			end

			local var_42_31 = arg_39_1.actors_["4040ui_story"]
			local var_42_32 = 0

			if var_42_32 < arg_39_1.time_ and arg_39_1.time_ <= var_42_32 + arg_42_0 and arg_39_1.var_.characterEffect4040ui_story == nil then
				arg_39_1.var_.characterEffect4040ui_story = var_42_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_33 = 0.200000002980232

			if var_42_32 <= arg_39_1.time_ and arg_39_1.time_ < var_42_32 + var_42_33 then
				local var_42_34 = (arg_39_1.time_ - var_42_32) / var_42_33

				if arg_39_1.var_.characterEffect4040ui_story then
					local var_42_35 = Mathf.Lerp(0, 0.5, var_42_34)

					arg_39_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_39_1.var_.characterEffect4040ui_story.fillRatio = var_42_35
				end
			end

			if arg_39_1.time_ >= var_42_32 + var_42_33 and arg_39_1.time_ < var_42_32 + var_42_33 + arg_42_0 and arg_39_1.var_.characterEffect4040ui_story then
				local var_42_36 = 0.5

				arg_39_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_39_1.var_.characterEffect4040ui_story.fillRatio = var_42_36
			end

			local var_42_37 = 0
			local var_42_38 = 0.325

			if var_42_37 < arg_39_1.time_ and arg_39_1.time_ <= var_42_37 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_39 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_40 = arg_39_1:GetWordFromCfg(319781010)
				local var_42_41 = arg_39_1:FormatText(var_42_40.content)

				arg_39_1.text_.text = var_42_41

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_42 = 13
				local var_42_43 = utf8.len(var_42_41)
				local var_42_44 = var_42_42 <= 0 and var_42_38 or var_42_38 * (var_42_43 / var_42_42)

				if var_42_44 > 0 and var_42_38 < var_42_44 then
					arg_39_1.talkMaxDuration = var_42_44

					if var_42_44 + var_42_37 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_44 + var_42_37
					end
				end

				arg_39_1.text_.text = var_42_41
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781010", "story_v_out_319781.awb") ~= 0 then
					local var_42_45 = manager.audio:GetVoiceLength("story_v_out_319781", "319781010", "story_v_out_319781.awb") / 1000

					if var_42_45 + var_42_37 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_45 + var_42_37
					end

					if var_42_40.prefab_name ~= "" and arg_39_1.actors_[var_42_40.prefab_name] ~= nil then
						local var_42_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_40.prefab_name].transform, "story_v_out_319781", "319781010", "story_v_out_319781.awb")

						arg_39_1:RecordAudio("319781010", var_42_46)
						arg_39_1:RecordAudio("319781010", var_42_46)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319781", "319781010", "story_v_out_319781.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319781", "319781010", "story_v_out_319781.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_47 = math.max(var_42_38, arg_39_1.talkMaxDuration)

			if var_42_37 <= arg_39_1.time_ and arg_39_1.time_ < var_42_37 + var_42_47 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_37) / var_42_47

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_37 + var_42_47 and arg_39_1.time_ < var_42_37 + var_42_47 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319781011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319781011
		arg_43_1.duration_ = 4.766

		local var_43_0 = {
			zh = 4.766,
			ja = 4.133
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
				arg_43_0:Play319781012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["4040ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos4040ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0.7, -1.55, -5.5)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos4040ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["4040ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect4040ui_story == nil then
				arg_43_1.var_.characterEffect4040ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect4040ui_story then
					arg_43_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect4040ui_story then
				arg_43_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_15 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_16 = 0

			if var_46_16 < arg_43_1.time_ and arg_43_1.time_ <= var_46_16 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_15.localPosition
			end

			local var_46_17 = 0.001

			if var_46_16 <= arg_43_1.time_ and arg_43_1.time_ < var_46_16 + var_46_17 then
				local var_46_18 = (arg_43_1.time_ - var_46_16) / var_46_17
				local var_46_19 = Vector3.New(-0.7, -0.97, -6)

				var_46_15.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_19, var_46_18)

				local var_46_20 = manager.ui.mainCamera.transform.position - var_46_15.position

				var_46_15.forward = Vector3.New(var_46_20.x, var_46_20.y, var_46_20.z)

				local var_46_21 = var_46_15.localEulerAngles

				var_46_21.z = 0
				var_46_21.x = 0
				var_46_15.localEulerAngles = var_46_21
			end

			if arg_43_1.time_ >= var_46_16 + var_46_17 and arg_43_1.time_ < var_46_16 + var_46_17 + arg_46_0 then
				var_46_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_46_22 = manager.ui.mainCamera.transform.position - var_46_15.position

				var_46_15.forward = Vector3.New(var_46_22.x, var_46_22.y, var_46_22.z)

				local var_46_23 = var_46_15.localEulerAngles

				var_46_23.z = 0
				var_46_23.x = 0
				var_46_15.localEulerAngles = var_46_23
			end

			local var_46_24 = arg_43_1.actors_["1084ui_story"]
			local var_46_25 = 0

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_26 = 0.200000002980232

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_26 then
				local var_46_27 = (arg_43_1.time_ - var_46_25) / var_46_26

				if arg_43_1.var_.characterEffect1084ui_story then
					local var_46_28 = Mathf.Lerp(0, 0.5, var_46_27)

					arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_28
				end
			end

			if arg_43_1.time_ >= var_46_25 + var_46_26 and arg_43_1.time_ < var_46_25 + var_46_26 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				local var_46_29 = 0.5

				arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_29
			end

			local var_46_30 = arg_43_1.actors_["1095ui_story"].transform
			local var_46_31 = 0

			if var_46_31 < arg_43_1.time_ and arg_43_1.time_ <= var_46_31 + arg_46_0 then
				arg_43_1.var_.moveOldPos1095ui_story = var_46_30.localPosition
			end

			local var_46_32 = 0.001

			if var_46_31 <= arg_43_1.time_ and arg_43_1.time_ < var_46_31 + var_46_32 then
				local var_46_33 = (arg_43_1.time_ - var_46_31) / var_46_32
				local var_46_34 = Vector3.New(0, 100, 0)

				var_46_30.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1095ui_story, var_46_34, var_46_33)

				local var_46_35 = manager.ui.mainCamera.transform.position - var_46_30.position

				var_46_30.forward = Vector3.New(var_46_35.x, var_46_35.y, var_46_35.z)

				local var_46_36 = var_46_30.localEulerAngles

				var_46_36.z = 0
				var_46_36.x = 0
				var_46_30.localEulerAngles = var_46_36
			end

			if arg_43_1.time_ >= var_46_31 + var_46_32 and arg_43_1.time_ < var_46_31 + var_46_32 + arg_46_0 then
				var_46_30.localPosition = Vector3.New(0, 100, 0)

				local var_46_37 = manager.ui.mainCamera.transform.position - var_46_30.position

				var_46_30.forward = Vector3.New(var_46_37.x, var_46_37.y, var_46_37.z)

				local var_46_38 = var_46_30.localEulerAngles

				var_46_38.z = 0
				var_46_38.x = 0
				var_46_30.localEulerAngles = var_46_38
			end

			local var_46_39 = 0
			local var_46_40 = 0.475

			if var_46_39 < arg_43_1.time_ and arg_43_1.time_ <= var_46_39 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_41 = arg_43_1:FormatText(StoryNameCfg[668].name)

				arg_43_1.leftNameTxt_.text = var_46_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_42 = arg_43_1:GetWordFromCfg(319781011)
				local var_46_43 = arg_43_1:FormatText(var_46_42.content)

				arg_43_1.text_.text = var_46_43

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_44 = 19
				local var_46_45 = utf8.len(var_46_43)
				local var_46_46 = var_46_44 <= 0 and var_46_40 or var_46_40 * (var_46_45 / var_46_44)

				if var_46_46 > 0 and var_46_40 < var_46_46 then
					arg_43_1.talkMaxDuration = var_46_46

					if var_46_46 + var_46_39 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_46 + var_46_39
					end
				end

				arg_43_1.text_.text = var_46_43
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781011", "story_v_out_319781.awb") ~= 0 then
					local var_46_47 = manager.audio:GetVoiceLength("story_v_out_319781", "319781011", "story_v_out_319781.awb") / 1000

					if var_46_47 + var_46_39 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_47 + var_46_39
					end

					if var_46_42.prefab_name ~= "" and arg_43_1.actors_[var_46_42.prefab_name] ~= nil then
						local var_46_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_42.prefab_name].transform, "story_v_out_319781", "319781011", "story_v_out_319781.awb")

						arg_43_1:RecordAudio("319781011", var_46_48)
						arg_43_1:RecordAudio("319781011", var_46_48)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319781", "319781011", "story_v_out_319781.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319781", "319781011", "story_v_out_319781.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_49 = math.max(var_46_40, arg_43_1.talkMaxDuration)

			if var_46_39 <= arg_43_1.time_ and arg_43_1.time_ < var_46_39 + var_46_49 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_39) / var_46_49

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_39 + var_46_49 and arg_43_1.time_ < var_46_39 + var_46_49 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319781012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319781012
		arg_47_1.duration_ = 6.133

		local var_47_0 = {
			zh = 1.8,
			ja = 6.133
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
				arg_47_0:Play319781013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["4040ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect4040ui_story == nil then
				arg_47_1.var_.characterEffect4040ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect4040ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_47_1.var_.characterEffect4040ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect4040ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_47_1.var_.characterEffect4040ui_story.fillRatio = var_50_5
			end

			local var_50_6 = arg_47_1.actors_["1084ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.200000002980232

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1084ui_story then
					arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_50_10 = 0
			local var_50_11 = 0.175

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_12 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_13 = arg_47_1:GetWordFromCfg(319781012)
				local var_50_14 = arg_47_1:FormatText(var_50_13.content)

				arg_47_1.text_.text = var_50_14

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_15 = 7
				local var_50_16 = utf8.len(var_50_14)
				local var_50_17 = var_50_15 <= 0 and var_50_11 or var_50_11 * (var_50_16 / var_50_15)

				if var_50_17 > 0 and var_50_11 < var_50_17 then
					arg_47_1.talkMaxDuration = var_50_17

					if var_50_17 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_17 + var_50_10
					end
				end

				arg_47_1.text_.text = var_50_14
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781012", "story_v_out_319781.awb") ~= 0 then
					local var_50_18 = manager.audio:GetVoiceLength("story_v_out_319781", "319781012", "story_v_out_319781.awb") / 1000

					if var_50_18 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_18 + var_50_10
					end

					if var_50_13.prefab_name ~= "" and arg_47_1.actors_[var_50_13.prefab_name] ~= nil then
						local var_50_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_13.prefab_name].transform, "story_v_out_319781", "319781012", "story_v_out_319781.awb")

						arg_47_1:RecordAudio("319781012", var_50_19)
						arg_47_1:RecordAudio("319781012", var_50_19)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319781", "319781012", "story_v_out_319781.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319781", "319781012", "story_v_out_319781.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_20 = math.max(var_50_11, arg_47_1.talkMaxDuration)

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_20 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_10) / var_50_20

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_10 + var_50_20 and arg_47_1.time_ < var_50_10 + var_50_20 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319781013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319781013
		arg_51_1.duration_ = 3.4

		local var_51_0 = {
			zh = 3.1,
			ja = 3.4
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
				arg_51_0:Play319781014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1095ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1095ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, -0.98, -6.1)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1095ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1095ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story == nil then
				arg_51_1.var_.characterEffect1095ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1095ui_story then
					arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story then
				arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action4_2")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_54_15 = arg_51_1.actors_["4040ui_story"].transform
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.var_.moveOldPos4040ui_story = var_54_15.localPosition
			end

			local var_54_17 = 0.001

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Vector3.New(0, 100, 0)

				var_54_15.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos4040ui_story, var_54_19, var_54_18)

				local var_54_20 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_20.x, var_54_20.y, var_54_20.z)

				local var_54_21 = var_54_15.localEulerAngles

				var_54_21.z = 0
				var_54_21.x = 0
				var_54_15.localEulerAngles = var_54_21
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				var_54_15.localPosition = Vector3.New(0, 100, 0)

				local var_54_22 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_22.x, var_54_22.y, var_54_22.z)

				local var_54_23 = var_54_15.localEulerAngles

				var_54_23.z = 0
				var_54_23.x = 0
				var_54_15.localEulerAngles = var_54_23
			end

			local var_54_24 = arg_51_1.actors_["4040ui_story"]
			local var_54_25 = 0

			if var_54_25 < arg_51_1.time_ and arg_51_1.time_ <= var_54_25 + arg_54_0 and arg_51_1.var_.characterEffect4040ui_story == nil then
				arg_51_1.var_.characterEffect4040ui_story = var_54_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_26 = 0.200000002980232

			if var_54_25 <= arg_51_1.time_ and arg_51_1.time_ < var_54_25 + var_54_26 then
				local var_54_27 = (arg_51_1.time_ - var_54_25) / var_54_26

				if arg_51_1.var_.characterEffect4040ui_story then
					local var_54_28 = Mathf.Lerp(0, 0.5, var_54_27)

					arg_51_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_51_1.var_.characterEffect4040ui_story.fillRatio = var_54_28
				end
			end

			if arg_51_1.time_ >= var_54_25 + var_54_26 and arg_51_1.time_ < var_54_25 + var_54_26 + arg_54_0 and arg_51_1.var_.characterEffect4040ui_story then
				local var_54_29 = 0.5

				arg_51_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_51_1.var_.characterEffect4040ui_story.fillRatio = var_54_29
			end

			local var_54_30 = arg_51_1.actors_["1084ui_story"].transform
			local var_54_31 = 0

			if var_54_31 < arg_51_1.time_ and arg_51_1.time_ <= var_54_31 + arg_54_0 then
				arg_51_1.var_.moveOldPos1084ui_story = var_54_30.localPosition
			end

			local var_54_32 = 0.001

			if var_54_31 <= arg_51_1.time_ and arg_51_1.time_ < var_54_31 + var_54_32 then
				local var_54_33 = (arg_51_1.time_ - var_54_31) / var_54_32
				local var_54_34 = Vector3.New(0, 100, 0)

				var_54_30.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1084ui_story, var_54_34, var_54_33)

				local var_54_35 = manager.ui.mainCamera.transform.position - var_54_30.position

				var_54_30.forward = Vector3.New(var_54_35.x, var_54_35.y, var_54_35.z)

				local var_54_36 = var_54_30.localEulerAngles

				var_54_36.z = 0
				var_54_36.x = 0
				var_54_30.localEulerAngles = var_54_36
			end

			if arg_51_1.time_ >= var_54_31 + var_54_32 and arg_51_1.time_ < var_54_31 + var_54_32 + arg_54_0 then
				var_54_30.localPosition = Vector3.New(0, 100, 0)

				local var_54_37 = manager.ui.mainCamera.transform.position - var_54_30.position

				var_54_30.forward = Vector3.New(var_54_37.x, var_54_37.y, var_54_37.z)

				local var_54_38 = var_54_30.localEulerAngles

				var_54_38.z = 0
				var_54_38.x = 0
				var_54_30.localEulerAngles = var_54_38
			end

			local var_54_39 = arg_51_1.actors_["1084ui_story"]
			local var_54_40 = 0

			if var_54_40 < arg_51_1.time_ and arg_51_1.time_ <= var_54_40 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story == nil then
				arg_51_1.var_.characterEffect1084ui_story = var_54_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_41 = 0.200000002980232

			if var_54_40 <= arg_51_1.time_ and arg_51_1.time_ < var_54_40 + var_54_41 then
				local var_54_42 = (arg_51_1.time_ - var_54_40) / var_54_41

				if arg_51_1.var_.characterEffect1084ui_story then
					local var_54_43 = Mathf.Lerp(0, 0.5, var_54_42)

					arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_43
				end
			end

			if arg_51_1.time_ >= var_54_40 + var_54_41 and arg_51_1.time_ < var_54_40 + var_54_41 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story then
				local var_54_44 = 0.5

				arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_44
			end

			local var_54_45 = 0
			local var_54_46 = 0.425

			if var_54_45 < arg_51_1.time_ and arg_51_1.time_ <= var_54_45 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_47 = arg_51_1:FormatText(StoryNameCfg[471].name)

				arg_51_1.leftNameTxt_.text = var_54_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_48 = arg_51_1:GetWordFromCfg(319781013)
				local var_54_49 = arg_51_1:FormatText(var_54_48.content)

				arg_51_1.text_.text = var_54_49

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_50 = 17
				local var_54_51 = utf8.len(var_54_49)
				local var_54_52 = var_54_50 <= 0 and var_54_46 or var_54_46 * (var_54_51 / var_54_50)

				if var_54_52 > 0 and var_54_46 < var_54_52 then
					arg_51_1.talkMaxDuration = var_54_52

					if var_54_52 + var_54_45 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_52 + var_54_45
					end
				end

				arg_51_1.text_.text = var_54_49
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781013", "story_v_out_319781.awb") ~= 0 then
					local var_54_53 = manager.audio:GetVoiceLength("story_v_out_319781", "319781013", "story_v_out_319781.awb") / 1000

					if var_54_53 + var_54_45 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_53 + var_54_45
					end

					if var_54_48.prefab_name ~= "" and arg_51_1.actors_[var_54_48.prefab_name] ~= nil then
						local var_54_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_48.prefab_name].transform, "story_v_out_319781", "319781013", "story_v_out_319781.awb")

						arg_51_1:RecordAudio("319781013", var_54_54)
						arg_51_1:RecordAudio("319781013", var_54_54)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319781", "319781013", "story_v_out_319781.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319781", "319781013", "story_v_out_319781.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_55 = math.max(var_54_46, arg_51_1.talkMaxDuration)

			if var_54_45 <= arg_51_1.time_ and arg_51_1.time_ < var_54_45 + var_54_55 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_45) / var_54_55

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_45 + var_54_55 and arg_51_1.time_ < var_54_45 + var_54_55 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319781014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319781014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play319781015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1095ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story == nil then
				arg_55_1.var_.characterEffect1095ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1095ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1095ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1095ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 0.525

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

				local var_58_8 = arg_55_1:GetWordFromCfg(319781014)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 21
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
	Play319781015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319781015
		arg_59_1.duration_ = 8.233

		local var_59_0 = {
			zh = 7.6,
			ja = 8.233
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
				arg_59_0:Play319781016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1095ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story == nil then
				arg_59_1.var_.characterEffect1095ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1095ui_story then
					arg_59_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story then
				arg_59_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_62_4 = 0
			local var_62_5 = 0.85

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_6 = arg_59_1:FormatText(StoryNameCfg[471].name)

				arg_59_1.leftNameTxt_.text = var_62_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_7 = arg_59_1:GetWordFromCfg(319781015)
				local var_62_8 = arg_59_1:FormatText(var_62_7.content)

				arg_59_1.text_.text = var_62_8

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_9 = 34
				local var_62_10 = utf8.len(var_62_8)
				local var_62_11 = var_62_9 <= 0 and var_62_5 or var_62_5 * (var_62_10 / var_62_9)

				if var_62_11 > 0 and var_62_5 < var_62_11 then
					arg_59_1.talkMaxDuration = var_62_11

					if var_62_11 + var_62_4 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_11 + var_62_4
					end
				end

				arg_59_1.text_.text = var_62_8
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781015", "story_v_out_319781.awb") ~= 0 then
					local var_62_12 = manager.audio:GetVoiceLength("story_v_out_319781", "319781015", "story_v_out_319781.awb") / 1000

					if var_62_12 + var_62_4 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_12 + var_62_4
					end

					if var_62_7.prefab_name ~= "" and arg_59_1.actors_[var_62_7.prefab_name] ~= nil then
						local var_62_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_7.prefab_name].transform, "story_v_out_319781", "319781015", "story_v_out_319781.awb")

						arg_59_1:RecordAudio("319781015", var_62_13)
						arg_59_1:RecordAudio("319781015", var_62_13)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319781", "319781015", "story_v_out_319781.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319781", "319781015", "story_v_out_319781.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_5, arg_59_1.talkMaxDuration)

			if var_62_4 <= arg_59_1.time_ and arg_59_1.time_ < var_62_4 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_4) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_4 + var_62_14 and arg_59_1.time_ < var_62_4 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319781016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319781016
		arg_63_1.duration_ = 3.166

		local var_63_0 = {
			zh = 2.566,
			ja = 3.166
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
				arg_63_0:Play319781017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["4040ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos4040ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0.7, -1.55, -5.5)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos4040ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["4040ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect4040ui_story == nil then
				arg_63_1.var_.characterEffect4040ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect4040ui_story then
					arg_63_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect4040ui_story then
				arg_63_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_66_13 = arg_63_1.actors_["1095ui_story"].transform
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1.var_.moveOldPos1095ui_story = var_66_13.localPosition
			end

			local var_66_15 = 0.001

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15
				local var_66_17 = Vector3.New(-0.7, -0.98, -6.1)

				var_66_13.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1095ui_story, var_66_17, var_66_16)

				local var_66_18 = manager.ui.mainCamera.transform.position - var_66_13.position

				var_66_13.forward = Vector3.New(var_66_18.x, var_66_18.y, var_66_18.z)

				local var_66_19 = var_66_13.localEulerAngles

				var_66_19.z = 0
				var_66_19.x = 0
				var_66_13.localEulerAngles = var_66_19
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 then
				var_66_13.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_66_20 = manager.ui.mainCamera.transform.position - var_66_13.position

				var_66_13.forward = Vector3.New(var_66_20.x, var_66_20.y, var_66_20.z)

				local var_66_21 = var_66_13.localEulerAngles

				var_66_21.z = 0
				var_66_21.x = 0
				var_66_13.localEulerAngles = var_66_21
			end

			local var_66_22 = arg_63_1.actors_["1095ui_story"]
			local var_66_23 = 0

			if var_66_23 < arg_63_1.time_ and arg_63_1.time_ <= var_66_23 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story == nil then
				arg_63_1.var_.characterEffect1095ui_story = var_66_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_24 = 0.200000002980232

			if var_66_23 <= arg_63_1.time_ and arg_63_1.time_ < var_66_23 + var_66_24 then
				local var_66_25 = (arg_63_1.time_ - var_66_23) / var_66_24

				if arg_63_1.var_.characterEffect1095ui_story then
					local var_66_26 = Mathf.Lerp(0, 0.5, var_66_25)

					arg_63_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1095ui_story.fillRatio = var_66_26
				end
			end

			if arg_63_1.time_ >= var_66_23 + var_66_24 and arg_63_1.time_ < var_66_23 + var_66_24 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story then
				local var_66_27 = 0.5

				arg_63_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1095ui_story.fillRatio = var_66_27
			end

			local var_66_28 = 0

			if var_66_28 < arg_63_1.time_ and arg_63_1.time_ <= var_66_28 + arg_66_0 then
				arg_63_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_66_29 = 0

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 then
				arg_63_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_66_30 = 0
			local var_66_31 = 0.3

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_32 = arg_63_1:FormatText(StoryNameCfg[668].name)

				arg_63_1.leftNameTxt_.text = var_66_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_33 = arg_63_1:GetWordFromCfg(319781016)
				local var_66_34 = arg_63_1:FormatText(var_66_33.content)

				arg_63_1.text_.text = var_66_34

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_35 = 12
				local var_66_36 = utf8.len(var_66_34)
				local var_66_37 = var_66_35 <= 0 and var_66_31 or var_66_31 * (var_66_36 / var_66_35)

				if var_66_37 > 0 and var_66_31 < var_66_37 then
					arg_63_1.talkMaxDuration = var_66_37

					if var_66_37 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_37 + var_66_30
					end
				end

				arg_63_1.text_.text = var_66_34
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781016", "story_v_out_319781.awb") ~= 0 then
					local var_66_38 = manager.audio:GetVoiceLength("story_v_out_319781", "319781016", "story_v_out_319781.awb") / 1000

					if var_66_38 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_38 + var_66_30
					end

					if var_66_33.prefab_name ~= "" and arg_63_1.actors_[var_66_33.prefab_name] ~= nil then
						local var_66_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_33.prefab_name].transform, "story_v_out_319781", "319781016", "story_v_out_319781.awb")

						arg_63_1:RecordAudio("319781016", var_66_39)
						arg_63_1:RecordAudio("319781016", var_66_39)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319781", "319781016", "story_v_out_319781.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319781", "319781016", "story_v_out_319781.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_40 = math.max(var_66_31, arg_63_1.talkMaxDuration)

			if var_66_30 <= arg_63_1.time_ and arg_63_1.time_ < var_66_30 + var_66_40 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_30) / var_66_40

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_30 + var_66_40 and arg_63_1.time_ < var_66_30 + var_66_40 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319781017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319781017
		arg_67_1.duration_ = 2.3

		local var_67_0 = {
			zh = 2.133,
			ja = 2.3
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
				arg_67_0:Play319781018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["4040ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect4040ui_story == nil then
				arg_67_1.var_.characterEffect4040ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.233333333333333

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect4040ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_67_1.var_.characterEffect4040ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect4040ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_67_1.var_.characterEffect4040ui_story.fillRatio = var_70_5
			end

			local var_70_6 = arg_67_1.actors_["1095ui_story"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story == nil then
				arg_67_1.var_.characterEffect1095ui_story = var_70_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_8 = 0.200000002980232

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.characterEffect1095ui_story then
					arg_67_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story then
				arg_67_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_70_10 = 0
			local var_70_11 = 0.175

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_12 = arg_67_1:FormatText(StoryNameCfg[471].name)

				arg_67_1.leftNameTxt_.text = var_70_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_13 = arg_67_1:GetWordFromCfg(319781017)
				local var_70_14 = arg_67_1:FormatText(var_70_13.content)

				arg_67_1.text_.text = var_70_14

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_15 = 7
				local var_70_16 = utf8.len(var_70_14)
				local var_70_17 = var_70_15 <= 0 and var_70_11 or var_70_11 * (var_70_16 / var_70_15)

				if var_70_17 > 0 and var_70_11 < var_70_17 then
					arg_67_1.talkMaxDuration = var_70_17

					if var_70_17 + var_70_10 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_17 + var_70_10
					end
				end

				arg_67_1.text_.text = var_70_14
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781017", "story_v_out_319781.awb") ~= 0 then
					local var_70_18 = manager.audio:GetVoiceLength("story_v_out_319781", "319781017", "story_v_out_319781.awb") / 1000

					if var_70_18 + var_70_10 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_10
					end

					if var_70_13.prefab_name ~= "" and arg_67_1.actors_[var_70_13.prefab_name] ~= nil then
						local var_70_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_13.prefab_name].transform, "story_v_out_319781", "319781017", "story_v_out_319781.awb")

						arg_67_1:RecordAudio("319781017", var_70_19)
						arg_67_1:RecordAudio("319781017", var_70_19)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319781", "319781017", "story_v_out_319781.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319781", "319781017", "story_v_out_319781.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_20 = math.max(var_70_11, arg_67_1.talkMaxDuration)

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_20 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_10) / var_70_20

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_10 + var_70_20 and arg_67_1.time_ < var_70_10 + var_70_20 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319781018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319781018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play319781019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1095ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story == nil then
				arg_71_1.var_.characterEffect1095ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1095ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1095ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1095ui_story.fillRatio = var_74_5
			end

			local var_74_6 = arg_71_1.actors_["4040ui_story"].transform
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 then
				arg_71_1.var_.moveOldPos4040ui_story = var_74_6.localPosition
			end

			local var_74_8 = 0.001

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8
				local var_74_10 = Vector3.New(0, 100, 0)

				var_74_6.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos4040ui_story, var_74_10, var_74_9)

				local var_74_11 = manager.ui.mainCamera.transform.position - var_74_6.position

				var_74_6.forward = Vector3.New(var_74_11.x, var_74_11.y, var_74_11.z)

				local var_74_12 = var_74_6.localEulerAngles

				var_74_12.z = 0
				var_74_12.x = 0
				var_74_6.localEulerAngles = var_74_12
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 then
				var_74_6.localPosition = Vector3.New(0, 100, 0)

				local var_74_13 = manager.ui.mainCamera.transform.position - var_74_6.position

				var_74_6.forward = Vector3.New(var_74_13.x, var_74_13.y, var_74_13.z)

				local var_74_14 = var_74_6.localEulerAngles

				var_74_14.z = 0
				var_74_14.x = 0
				var_74_6.localEulerAngles = var_74_14
			end

			local var_74_15 = 0
			local var_74_16 = 0.75

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_17 = arg_71_1:GetWordFromCfg(319781018)
				local var_74_18 = arg_71_1:FormatText(var_74_17.content)

				arg_71_1.text_.text = var_74_18

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_19 = 30
				local var_74_20 = utf8.len(var_74_18)
				local var_74_21 = var_74_19 <= 0 and var_74_16 or var_74_16 * (var_74_20 / var_74_19)

				if var_74_21 > 0 and var_74_16 < var_74_21 then
					arg_71_1.talkMaxDuration = var_74_21

					if var_74_21 + var_74_15 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_15
					end
				end

				arg_71_1.text_.text = var_74_18
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_16, arg_71_1.talkMaxDuration)

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_15) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_15 + var_74_22 and arg_71_1.time_ < var_74_15 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319781019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319781019
		arg_75_1.duration_ = 7.933

		local var_75_0 = {
			zh = 6.3,
			ja = 7.933
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
				arg_75_0:Play319781020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1084ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1084ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0.7, -0.97, -6)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1084ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1084ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story == nil then
				arg_75_1.var_.characterEffect1084ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1084ui_story then
					arg_75_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story then
				arg_75_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_15 = arg_75_1.actors_["4040ui_story"].transform
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.var_.moveOldPos4040ui_story = var_78_15.localPosition
			end

			local var_78_17 = 0.001

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Vector3.New(0, 100, 0)

				var_78_15.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos4040ui_story, var_78_19, var_78_18)

				local var_78_20 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_20.x, var_78_20.y, var_78_20.z)

				local var_78_21 = var_78_15.localEulerAngles

				var_78_21.z = 0
				var_78_21.x = 0
				var_78_15.localEulerAngles = var_78_21
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				var_78_15.localPosition = Vector3.New(0, 100, 0)

				local var_78_22 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_22.x, var_78_22.y, var_78_22.z)

				local var_78_23 = var_78_15.localEulerAngles

				var_78_23.z = 0
				var_78_23.x = 0
				var_78_15.localEulerAngles = var_78_23
			end

			local var_78_24 = arg_75_1.actors_["1095ui_story"].transform
			local var_78_25 = 0

			if var_78_25 < arg_75_1.time_ and arg_75_1.time_ <= var_78_25 + arg_78_0 then
				arg_75_1.var_.moveOldPos1095ui_story = var_78_24.localPosition
			end

			local var_78_26 = 0.001

			if var_78_25 <= arg_75_1.time_ and arg_75_1.time_ < var_78_25 + var_78_26 then
				local var_78_27 = (arg_75_1.time_ - var_78_25) / var_78_26
				local var_78_28 = Vector3.New(-0.7, -0.98, -6.1)

				var_78_24.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1095ui_story, var_78_28, var_78_27)

				local var_78_29 = manager.ui.mainCamera.transform.position - var_78_24.position

				var_78_24.forward = Vector3.New(var_78_29.x, var_78_29.y, var_78_29.z)

				local var_78_30 = var_78_24.localEulerAngles

				var_78_30.z = 0
				var_78_30.x = 0
				var_78_24.localEulerAngles = var_78_30
			end

			if arg_75_1.time_ >= var_78_25 + var_78_26 and arg_75_1.time_ < var_78_25 + var_78_26 + arg_78_0 then
				var_78_24.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_78_31 = manager.ui.mainCamera.transform.position - var_78_24.position

				var_78_24.forward = Vector3.New(var_78_31.x, var_78_31.y, var_78_31.z)

				local var_78_32 = var_78_24.localEulerAngles

				var_78_32.z = 0
				var_78_32.x = 0
				var_78_24.localEulerAngles = var_78_32
			end

			local var_78_33 = 0
			local var_78_34 = 0.725

			if var_78_33 < arg_75_1.time_ and arg_75_1.time_ <= var_78_33 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_35 = arg_75_1:FormatText(StoryNameCfg[6].name)

				arg_75_1.leftNameTxt_.text = var_78_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_36 = arg_75_1:GetWordFromCfg(319781019)
				local var_78_37 = arg_75_1:FormatText(var_78_36.content)

				arg_75_1.text_.text = var_78_37

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_38 = 29
				local var_78_39 = utf8.len(var_78_37)
				local var_78_40 = var_78_38 <= 0 and var_78_34 or var_78_34 * (var_78_39 / var_78_38)

				if var_78_40 > 0 and var_78_34 < var_78_40 then
					arg_75_1.talkMaxDuration = var_78_40

					if var_78_40 + var_78_33 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_40 + var_78_33
					end
				end

				arg_75_1.text_.text = var_78_37
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781019", "story_v_out_319781.awb") ~= 0 then
					local var_78_41 = manager.audio:GetVoiceLength("story_v_out_319781", "319781019", "story_v_out_319781.awb") / 1000

					if var_78_41 + var_78_33 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_41 + var_78_33
					end

					if var_78_36.prefab_name ~= "" and arg_75_1.actors_[var_78_36.prefab_name] ~= nil then
						local var_78_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_36.prefab_name].transform, "story_v_out_319781", "319781019", "story_v_out_319781.awb")

						arg_75_1:RecordAudio("319781019", var_78_42)
						arg_75_1:RecordAudio("319781019", var_78_42)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319781", "319781019", "story_v_out_319781.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319781", "319781019", "story_v_out_319781.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_43 = math.max(var_78_34, arg_75_1.talkMaxDuration)

			if var_78_33 <= arg_75_1.time_ and arg_75_1.time_ < var_78_33 + var_78_43 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_33) / var_78_43

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_33 + var_78_43 and arg_75_1.time_ < var_78_33 + var_78_43 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319781020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319781020
		arg_79_1.duration_ = 4.266

		local var_79_0 = {
			zh = 2.2,
			ja = 4.266
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
				arg_79_0:Play319781021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1095ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1095ui_story == nil then
				arg_79_1.var_.characterEffect1095ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1095ui_story then
					arg_79_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1095ui_story then
				arg_79_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_6 = arg_79_1.actors_["1084ui_story"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_8 = 0.200000002980232

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.characterEffect1084ui_story then
					local var_82_10 = Mathf.Lerp(0, 0.5, var_82_9)

					arg_79_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1084ui_story.fillRatio = var_82_10
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				local var_82_11 = 0.5

				arg_79_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1084ui_story.fillRatio = var_82_11
			end

			local var_82_12 = 0
			local var_82_13 = 0.275

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_14 = arg_79_1:FormatText(StoryNameCfg[471].name)

				arg_79_1.leftNameTxt_.text = var_82_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_15 = arg_79_1:GetWordFromCfg(319781020)
				local var_82_16 = arg_79_1:FormatText(var_82_15.content)

				arg_79_1.text_.text = var_82_16

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_17 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781020", "story_v_out_319781.awb") ~= 0 then
					local var_82_20 = manager.audio:GetVoiceLength("story_v_out_319781", "319781020", "story_v_out_319781.awb") / 1000

					if var_82_20 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_12
					end

					if var_82_15.prefab_name ~= "" and arg_79_1.actors_[var_82_15.prefab_name] ~= nil then
						local var_82_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_15.prefab_name].transform, "story_v_out_319781", "319781020", "story_v_out_319781.awb")

						arg_79_1:RecordAudio("319781020", var_82_21)
						arg_79_1:RecordAudio("319781020", var_82_21)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_319781", "319781020", "story_v_out_319781.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_319781", "319781020", "story_v_out_319781.awb")
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
	Play319781021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319781021
		arg_83_1.duration_ = 2.8

		local var_83_0 = {
			zh = 1.133,
			ja = 2.8
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
				arg_83_0:Play319781022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1095ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story == nil then
				arg_83_1.var_.characterEffect1095ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1095ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1095ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1095ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["1084ui_story"]
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_8 = 0.200000002980232

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8

				if arg_83_1.var_.characterEffect1084ui_story then
					arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_86_10 = 0
			local var_86_11 = 0.075

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_12 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_13 = arg_83_1:GetWordFromCfg(319781021)
				local var_86_14 = arg_83_1:FormatText(var_86_13.content)

				arg_83_1.text_.text = var_86_14

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_15 = 3
				local var_86_16 = utf8.len(var_86_14)
				local var_86_17 = var_86_15 <= 0 and var_86_11 or var_86_11 * (var_86_16 / var_86_15)

				if var_86_17 > 0 and var_86_11 < var_86_17 then
					arg_83_1.talkMaxDuration = var_86_17

					if var_86_17 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_17 + var_86_10
					end
				end

				arg_83_1.text_.text = var_86_14
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781021", "story_v_out_319781.awb") ~= 0 then
					local var_86_18 = manager.audio:GetVoiceLength("story_v_out_319781", "319781021", "story_v_out_319781.awb") / 1000

					if var_86_18 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_18 + var_86_10
					end

					if var_86_13.prefab_name ~= "" and arg_83_1.actors_[var_86_13.prefab_name] ~= nil then
						local var_86_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_13.prefab_name].transform, "story_v_out_319781", "319781021", "story_v_out_319781.awb")

						arg_83_1:RecordAudio("319781021", var_86_19)
						arg_83_1:RecordAudio("319781021", var_86_19)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319781", "319781021", "story_v_out_319781.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319781", "319781021", "story_v_out_319781.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_20 = math.max(var_86_11, arg_83_1.talkMaxDuration)

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_20 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_10) / var_86_20

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_10 + var_86_20 and arg_83_1.time_ < var_86_10 + var_86_20 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319781022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319781022
		arg_87_1.duration_ = 7.566

		local var_87_0 = {
			zh = 7.033,
			ja = 7.566
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
				arg_87_0:Play319781023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_2 = arg_87_1.actors_["1095ui_story"]
			local var_90_3 = 0

			if var_90_3 < arg_87_1.time_ and arg_87_1.time_ <= var_90_3 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story == nil then
				arg_87_1.var_.characterEffect1095ui_story = var_90_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_4 = 0.200000002980232

			if var_90_3 <= arg_87_1.time_ and arg_87_1.time_ < var_90_3 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_3) / var_90_4

				if arg_87_1.var_.characterEffect1095ui_story then
					arg_87_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_3 + var_90_4 and arg_87_1.time_ < var_90_3 + var_90_4 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story then
				arg_87_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_90_6 = arg_87_1.actors_["1084ui_story"]
			local var_90_7 = 0

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_8 = 0.200000002980232

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_8 then
				local var_90_9 = (arg_87_1.time_ - var_90_7) / var_90_8

				if arg_87_1.var_.characterEffect1084ui_story then
					local var_90_10 = Mathf.Lerp(0, 0.5, var_90_9)

					arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_10
				end
			end

			if arg_87_1.time_ >= var_90_7 + var_90_8 and arg_87_1.time_ < var_90_7 + var_90_8 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story then
				local var_90_11 = 0.5

				arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_11
			end

			local var_90_12 = 0
			local var_90_13 = 0.725

			if var_90_12 < arg_87_1.time_ and arg_87_1.time_ <= var_90_12 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_14 = arg_87_1:FormatText(StoryNameCfg[471].name)

				arg_87_1.leftNameTxt_.text = var_90_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_15 = arg_87_1:GetWordFromCfg(319781022)
				local var_90_16 = arg_87_1:FormatText(var_90_15.content)

				arg_87_1.text_.text = var_90_16

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_17 = 29
				local var_90_18 = utf8.len(var_90_16)
				local var_90_19 = var_90_17 <= 0 and var_90_13 or var_90_13 * (var_90_18 / var_90_17)

				if var_90_19 > 0 and var_90_13 < var_90_19 then
					arg_87_1.talkMaxDuration = var_90_19

					if var_90_19 + var_90_12 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_19 + var_90_12
					end
				end

				arg_87_1.text_.text = var_90_16
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781022", "story_v_out_319781.awb") ~= 0 then
					local var_90_20 = manager.audio:GetVoiceLength("story_v_out_319781", "319781022", "story_v_out_319781.awb") / 1000

					if var_90_20 + var_90_12 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_20 + var_90_12
					end

					if var_90_15.prefab_name ~= "" and arg_87_1.actors_[var_90_15.prefab_name] ~= nil then
						local var_90_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_15.prefab_name].transform, "story_v_out_319781", "319781022", "story_v_out_319781.awb")

						arg_87_1:RecordAudio("319781022", var_90_21)
						arg_87_1:RecordAudio("319781022", var_90_21)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319781", "319781022", "story_v_out_319781.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319781", "319781022", "story_v_out_319781.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_22 = math.max(var_90_13, arg_87_1.talkMaxDuration)

			if var_90_12 <= arg_87_1.time_ and arg_87_1.time_ < var_90_12 + var_90_22 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_12) / var_90_22

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_12 + var_90_22 and arg_87_1.time_ < var_90_12 + var_90_22 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319781023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319781023
		arg_91_1.duration_ = 3.266

		local var_91_0 = {
			zh = 3.266,
			ja = 2.733
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
				arg_91_0:Play319781024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = "10066ui_story"

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

			local var_94_4 = arg_91_1.actors_["10066ui_story"].transform
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.var_.moveOldPos10066ui_story = var_94_4.localPosition
			end

			local var_94_6 = 0.001

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6
				local var_94_8 = Vector3.New(0, -0.99, -5.83)

				var_94_4.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10066ui_story, var_94_8, var_94_7)

				local var_94_9 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_9.x, var_94_9.y, var_94_9.z)

				local var_94_10 = var_94_4.localEulerAngles

				var_94_10.z = 0
				var_94_10.x = 0
				var_94_4.localEulerAngles = var_94_10
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 then
				var_94_4.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_94_11 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_11.x, var_94_11.y, var_94_11.z)

				local var_94_12 = var_94_4.localEulerAngles

				var_94_12.z = 0
				var_94_12.x = 0
				var_94_4.localEulerAngles = var_94_12
			end

			local var_94_13 = arg_91_1.actors_["10066ui_story"]
			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 and arg_91_1.var_.characterEffect10066ui_story == nil then
				arg_91_1.var_.characterEffect10066ui_story = var_94_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_15 = 0.200000002980232

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_15 then
				local var_94_16 = (arg_91_1.time_ - var_94_14) / var_94_15

				if arg_91_1.var_.characterEffect10066ui_story then
					arg_91_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_14 + var_94_15 and arg_91_1.time_ < var_94_14 + var_94_15 + arg_94_0 and arg_91_1.var_.characterEffect10066ui_story then
				arg_91_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_94_17 = 0

			if var_94_17 < arg_91_1.time_ and arg_91_1.time_ <= var_94_17 + arg_94_0 then
				arg_91_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_94_18 = 0

			if var_94_18 < arg_91_1.time_ and arg_91_1.time_ <= var_94_18 + arg_94_0 then
				arg_91_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_19 = arg_91_1.actors_["1095ui_story"].transform
			local var_94_20 = 0

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.var_.moveOldPos1095ui_story = var_94_19.localPosition
			end

			local var_94_21 = 0.001

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_21 then
				local var_94_22 = (arg_91_1.time_ - var_94_20) / var_94_21
				local var_94_23 = Vector3.New(0, 100, 0)

				var_94_19.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1095ui_story, var_94_23, var_94_22)

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

			local var_94_28 = arg_91_1.actors_["1095ui_story"]
			local var_94_29 = 0

			if var_94_29 < arg_91_1.time_ and arg_91_1.time_ <= var_94_29 + arg_94_0 and arg_91_1.var_.characterEffect1095ui_story == nil then
				arg_91_1.var_.characterEffect1095ui_story = var_94_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_30 = 0.200000002980232

			if var_94_29 <= arg_91_1.time_ and arg_91_1.time_ < var_94_29 + var_94_30 then
				local var_94_31 = (arg_91_1.time_ - var_94_29) / var_94_30

				if arg_91_1.var_.characterEffect1095ui_story then
					local var_94_32 = Mathf.Lerp(0, 0.5, var_94_31)

					arg_91_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1095ui_story.fillRatio = var_94_32
				end
			end

			if arg_91_1.time_ >= var_94_29 + var_94_30 and arg_91_1.time_ < var_94_29 + var_94_30 + arg_94_0 and arg_91_1.var_.characterEffect1095ui_story then
				local var_94_33 = 0.5

				arg_91_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1095ui_story.fillRatio = var_94_33
			end

			local var_94_34 = arg_91_1.actors_["1084ui_story"].transform
			local var_94_35 = 0

			if var_94_35 < arg_91_1.time_ and arg_91_1.time_ <= var_94_35 + arg_94_0 then
				arg_91_1.var_.moveOldPos1084ui_story = var_94_34.localPosition
			end

			local var_94_36 = 0.001

			if var_94_35 <= arg_91_1.time_ and arg_91_1.time_ < var_94_35 + var_94_36 then
				local var_94_37 = (arg_91_1.time_ - var_94_35) / var_94_36
				local var_94_38 = Vector3.New(0, 100, 0)

				var_94_34.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1084ui_story, var_94_38, var_94_37)

				local var_94_39 = manager.ui.mainCamera.transform.position - var_94_34.position

				var_94_34.forward = Vector3.New(var_94_39.x, var_94_39.y, var_94_39.z)

				local var_94_40 = var_94_34.localEulerAngles

				var_94_40.z = 0
				var_94_40.x = 0
				var_94_34.localEulerAngles = var_94_40
			end

			if arg_91_1.time_ >= var_94_35 + var_94_36 and arg_91_1.time_ < var_94_35 + var_94_36 + arg_94_0 then
				var_94_34.localPosition = Vector3.New(0, 100, 0)

				local var_94_41 = manager.ui.mainCamera.transform.position - var_94_34.position

				var_94_34.forward = Vector3.New(var_94_41.x, var_94_41.y, var_94_41.z)

				local var_94_42 = var_94_34.localEulerAngles

				var_94_42.z = 0
				var_94_42.x = 0
				var_94_34.localEulerAngles = var_94_42
			end

			local var_94_43 = arg_91_1.actors_["1084ui_story"]
			local var_94_44 = 0

			if var_94_44 < arg_91_1.time_ and arg_91_1.time_ <= var_94_44 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_45 = 0.200000002980232

			if var_94_44 <= arg_91_1.time_ and arg_91_1.time_ < var_94_44 + var_94_45 then
				local var_94_46 = (arg_91_1.time_ - var_94_44) / var_94_45

				if arg_91_1.var_.characterEffect1084ui_story then
					local var_94_47 = Mathf.Lerp(0, 0.5, var_94_46)

					arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_47
				end
			end

			if arg_91_1.time_ >= var_94_44 + var_94_45 and arg_91_1.time_ < var_94_44 + var_94_45 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				local var_94_48 = 0.5

				arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_48
			end

			local var_94_49 = 0
			local var_94_50 = 0.275

			if var_94_49 < arg_91_1.time_ and arg_91_1.time_ <= var_94_49 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_51 = arg_91_1:FormatText(StoryNameCfg[640].name)

				arg_91_1.leftNameTxt_.text = var_94_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_52 = arg_91_1:GetWordFromCfg(319781023)
				local var_94_53 = arg_91_1:FormatText(var_94_52.content)

				arg_91_1.text_.text = var_94_53

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_54 = 11
				local var_94_55 = utf8.len(var_94_53)
				local var_94_56 = var_94_54 <= 0 and var_94_50 or var_94_50 * (var_94_55 / var_94_54)

				if var_94_56 > 0 and var_94_50 < var_94_56 then
					arg_91_1.talkMaxDuration = var_94_56

					if var_94_56 + var_94_49 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_56 + var_94_49
					end
				end

				arg_91_1.text_.text = var_94_53
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781023", "story_v_out_319781.awb") ~= 0 then
					local var_94_57 = manager.audio:GetVoiceLength("story_v_out_319781", "319781023", "story_v_out_319781.awb") / 1000

					if var_94_57 + var_94_49 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_57 + var_94_49
					end

					if var_94_52.prefab_name ~= "" and arg_91_1.actors_[var_94_52.prefab_name] ~= nil then
						local var_94_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_52.prefab_name].transform, "story_v_out_319781", "319781023", "story_v_out_319781.awb")

						arg_91_1:RecordAudio("319781023", var_94_58)
						arg_91_1:RecordAudio("319781023", var_94_58)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319781", "319781023", "story_v_out_319781.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319781", "319781023", "story_v_out_319781.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_59 = math.max(var_94_50, arg_91_1.talkMaxDuration)

			if var_94_49 <= arg_91_1.time_ and arg_91_1.time_ < var_94_49 + var_94_59 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_49) / var_94_59

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_49 + var_94_59 and arg_91_1.time_ < var_94_49 + var_94_59 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319781024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319781024
		arg_95_1.duration_ = 2.8

		local var_95_0 = {
			zh = 2.8,
			ja = 2.2
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
				arg_95_0:Play319781025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1095ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1095ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, -0.98, -6.1)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1095ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1095ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1095ui_story == nil then
				arg_95_1.var_.characterEffect1095ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1095ui_story then
					arg_95_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1095ui_story then
				arg_95_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_98_14 = arg_95_1.actors_["10066ui_story"].transform
			local var_98_15 = 0

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1.var_.moveOldPos10066ui_story = var_98_14.localPosition
			end

			local var_98_16 = 0.001

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_16 then
				local var_98_17 = (arg_95_1.time_ - var_98_15) / var_98_16
				local var_98_18 = Vector3.New(0, 100, 0)

				var_98_14.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10066ui_story, var_98_18, var_98_17)

				local var_98_19 = manager.ui.mainCamera.transform.position - var_98_14.position

				var_98_14.forward = Vector3.New(var_98_19.x, var_98_19.y, var_98_19.z)

				local var_98_20 = var_98_14.localEulerAngles

				var_98_20.z = 0
				var_98_20.x = 0
				var_98_14.localEulerAngles = var_98_20
			end

			if arg_95_1.time_ >= var_98_15 + var_98_16 and arg_95_1.time_ < var_98_15 + var_98_16 + arg_98_0 then
				var_98_14.localPosition = Vector3.New(0, 100, 0)

				local var_98_21 = manager.ui.mainCamera.transform.position - var_98_14.position

				var_98_14.forward = Vector3.New(var_98_21.x, var_98_21.y, var_98_21.z)

				local var_98_22 = var_98_14.localEulerAngles

				var_98_22.z = 0
				var_98_22.x = 0
				var_98_14.localEulerAngles = var_98_22
			end

			local var_98_23 = arg_95_1.actors_["10066ui_story"]
			local var_98_24 = 0

			if var_98_24 < arg_95_1.time_ and arg_95_1.time_ <= var_98_24 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story == nil then
				arg_95_1.var_.characterEffect10066ui_story = var_98_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_25 = 0.200000002980232

			if var_98_24 <= arg_95_1.time_ and arg_95_1.time_ < var_98_24 + var_98_25 then
				local var_98_26 = (arg_95_1.time_ - var_98_24) / var_98_25

				if arg_95_1.var_.characterEffect10066ui_story then
					local var_98_27 = Mathf.Lerp(0, 0.5, var_98_26)

					arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_27
				end
			end

			if arg_95_1.time_ >= var_98_24 + var_98_25 and arg_95_1.time_ < var_98_24 + var_98_25 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story then
				local var_98_28 = 0.5

				arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_28
			end

			local var_98_29 = 0
			local var_98_30 = 0.35

			if var_98_29 < arg_95_1.time_ and arg_95_1.time_ <= var_98_29 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_31 = arg_95_1:FormatText(StoryNameCfg[471].name)

				arg_95_1.leftNameTxt_.text = var_98_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_32 = arg_95_1:GetWordFromCfg(319781024)
				local var_98_33 = arg_95_1:FormatText(var_98_32.content)

				arg_95_1.text_.text = var_98_33

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_34 = 14
				local var_98_35 = utf8.len(var_98_33)
				local var_98_36 = var_98_34 <= 0 and var_98_30 or var_98_30 * (var_98_35 / var_98_34)

				if var_98_36 > 0 and var_98_30 < var_98_36 then
					arg_95_1.talkMaxDuration = var_98_36

					if var_98_36 + var_98_29 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_36 + var_98_29
					end
				end

				arg_95_1.text_.text = var_98_33
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781024", "story_v_out_319781.awb") ~= 0 then
					local var_98_37 = manager.audio:GetVoiceLength("story_v_out_319781", "319781024", "story_v_out_319781.awb") / 1000

					if var_98_37 + var_98_29 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_37 + var_98_29
					end

					if var_98_32.prefab_name ~= "" and arg_95_1.actors_[var_98_32.prefab_name] ~= nil then
						local var_98_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_32.prefab_name].transform, "story_v_out_319781", "319781024", "story_v_out_319781.awb")

						arg_95_1:RecordAudio("319781024", var_98_38)
						arg_95_1:RecordAudio("319781024", var_98_38)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_319781", "319781024", "story_v_out_319781.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_319781", "319781024", "story_v_out_319781.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_39 = math.max(var_98_30, arg_95_1.talkMaxDuration)

			if var_98_29 <= arg_95_1.time_ and arg_95_1.time_ < var_98_29 + var_98_39 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_29) / var_98_39

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_29 + var_98_39 and arg_95_1.time_ < var_98_29 + var_98_39 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319781025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319781025
		arg_99_1.duration_ = 9.2

		local var_99_0 = {
			zh = 7.166,
			ja = 9.2
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
				arg_99_0:Play319781026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.825

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[471].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(319781025)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781025", "story_v_out_319781.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_319781", "319781025", "story_v_out_319781.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_319781", "319781025", "story_v_out_319781.awb")

						arg_99_1:RecordAudio("319781025", var_102_9)
						arg_99_1:RecordAudio("319781025", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319781", "319781025", "story_v_out_319781.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319781", "319781025", "story_v_out_319781.awb")
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
	Play319781026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319781026
		arg_103_1.duration_ = 4.1

		local var_103_0 = {
			zh = 2.5,
			ja = 4.1
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
				arg_103_0:Play319781027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.35

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[471].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(319781026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 14
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781026", "story_v_out_319781.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_319781", "319781026", "story_v_out_319781.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_319781", "319781026", "story_v_out_319781.awb")

						arg_103_1:RecordAudio("319781026", var_106_9)
						arg_103_1:RecordAudio("319781026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319781", "319781026", "story_v_out_319781.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319781", "319781026", "story_v_out_319781.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319781027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319781027
		arg_107_1.duration_ = 2.033

		local var_107_0 = {
			zh = 1.999999999999,
			ja = 2.033
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
				arg_107_0:Play319781028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1084ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1084ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0.7, -0.97, -6)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1084ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1084ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story == nil then
				arg_107_1.var_.characterEffect1084ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1084ui_story then
					arg_107_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story then
				arg_107_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4713")
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_110_15 = arg_107_1.actors_["1095ui_story"].transform
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.var_.moveOldPos1095ui_story = var_110_15.localPosition
			end

			local var_110_17 = 0.001

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_110_15.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1095ui_story, var_110_19, var_110_18)

				local var_110_20 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_20.x, var_110_20.y, var_110_20.z)

				local var_110_21 = var_110_15.localEulerAngles

				var_110_21.z = 0
				var_110_21.x = 0
				var_110_15.localEulerAngles = var_110_21
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				var_110_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_110_22 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_22.x, var_110_22.y, var_110_22.z)

				local var_110_23 = var_110_15.localEulerAngles

				var_110_23.z = 0
				var_110_23.x = 0
				var_110_15.localEulerAngles = var_110_23
			end

			local var_110_24 = arg_107_1.actors_["1095ui_story"]
			local var_110_25 = 0

			if var_110_25 < arg_107_1.time_ and arg_107_1.time_ <= var_110_25 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story == nil then
				arg_107_1.var_.characterEffect1095ui_story = var_110_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_26 = 0.200000002980232

			if var_110_25 <= arg_107_1.time_ and arg_107_1.time_ < var_110_25 + var_110_26 then
				local var_110_27 = (arg_107_1.time_ - var_110_25) / var_110_26

				if arg_107_1.var_.characterEffect1095ui_story then
					local var_110_28 = Mathf.Lerp(0, 0.5, var_110_27)

					arg_107_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1095ui_story.fillRatio = var_110_28
				end
			end

			if arg_107_1.time_ >= var_110_25 + var_110_26 and arg_107_1.time_ < var_110_25 + var_110_26 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story then
				local var_110_29 = 0.5

				arg_107_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1095ui_story.fillRatio = var_110_29
			end

			local var_110_30 = 0
			local var_110_31 = 0.15

			if var_110_30 < arg_107_1.time_ and arg_107_1.time_ <= var_110_30 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_32 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_33 = arg_107_1:GetWordFromCfg(319781027)
				local var_110_34 = arg_107_1:FormatText(var_110_33.content)

				arg_107_1.text_.text = var_110_34

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_35 = 6
				local var_110_36 = utf8.len(var_110_34)
				local var_110_37 = var_110_35 <= 0 and var_110_31 or var_110_31 * (var_110_36 / var_110_35)

				if var_110_37 > 0 and var_110_31 < var_110_37 then
					arg_107_1.talkMaxDuration = var_110_37

					if var_110_37 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_37 + var_110_30
					end
				end

				arg_107_1.text_.text = var_110_34
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781027", "story_v_out_319781.awb") ~= 0 then
					local var_110_38 = manager.audio:GetVoiceLength("story_v_out_319781", "319781027", "story_v_out_319781.awb") / 1000

					if var_110_38 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_38 + var_110_30
					end

					if var_110_33.prefab_name ~= "" and arg_107_1.actors_[var_110_33.prefab_name] ~= nil then
						local var_110_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_33.prefab_name].transform, "story_v_out_319781", "319781027", "story_v_out_319781.awb")

						arg_107_1:RecordAudio("319781027", var_110_39)
						arg_107_1:RecordAudio("319781027", var_110_39)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_319781", "319781027", "story_v_out_319781.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_319781", "319781027", "story_v_out_319781.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_40 = math.max(var_110_31, arg_107_1.talkMaxDuration)

			if var_110_30 <= arg_107_1.time_ and arg_107_1.time_ < var_110_30 + var_110_40 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_30) / var_110_40

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_30 + var_110_40 and arg_107_1.time_ < var_110_30 + var_110_40 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319781028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319781028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play319781029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1084ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story == nil then
				arg_111_1.var_.characterEffect1084ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1084ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 1.075

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_8 = arg_111_1:GetWordFromCfg(319781028)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 43
				local var_114_11 = utf8.len(var_114_9)
				local var_114_12 = var_114_10 <= 0 and var_114_7 or var_114_7 * (var_114_11 / var_114_10)

				if var_114_12 > 0 and var_114_7 < var_114_12 then
					arg_111_1.talkMaxDuration = var_114_12

					if var_114_12 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_9
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_13 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_13 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_13

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_13 and arg_111_1.time_ < var_114_6 + var_114_13 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play319781029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319781029
		arg_115_1.duration_ = 15.7

		local var_115_0 = {
			zh = 9.533,
			ja = 15.7
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
				arg_115_0:Play319781030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1095ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1095ui_story == nil then
				arg_115_1.var_.characterEffect1095ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1095ui_story then
					arg_115_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1095ui_story then
				arg_115_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_118_4 = arg_115_1.actors_["1084ui_story"]
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story == nil then
				arg_115_1.var_.characterEffect1084ui_story = var_118_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_6 = 0.200000002980232

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6

				if arg_115_1.var_.characterEffect1084ui_story then
					local var_118_8 = Mathf.Lerp(0, 0.5, var_118_7)

					arg_115_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1084ui_story.fillRatio = var_118_8
				end
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story then
				local var_118_9 = 0.5

				arg_115_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1084ui_story.fillRatio = var_118_9
			end

			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_118_11 = 0
			local var_118_12 = 1.025

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_13 = arg_115_1:FormatText(StoryNameCfg[471].name)

				arg_115_1.leftNameTxt_.text = var_118_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_14 = arg_115_1:GetWordFromCfg(319781029)
				local var_118_15 = arg_115_1:FormatText(var_118_14.content)

				arg_115_1.text_.text = var_118_15

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_16 = 41
				local var_118_17 = utf8.len(var_118_15)
				local var_118_18 = var_118_16 <= 0 and var_118_12 or var_118_12 * (var_118_17 / var_118_16)

				if var_118_18 > 0 and var_118_12 < var_118_18 then
					arg_115_1.talkMaxDuration = var_118_18

					if var_118_18 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_18 + var_118_11
					end
				end

				arg_115_1.text_.text = var_118_15
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781029", "story_v_out_319781.awb") ~= 0 then
					local var_118_19 = manager.audio:GetVoiceLength("story_v_out_319781", "319781029", "story_v_out_319781.awb") / 1000

					if var_118_19 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_11
					end

					if var_118_14.prefab_name ~= "" and arg_115_1.actors_[var_118_14.prefab_name] ~= nil then
						local var_118_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_14.prefab_name].transform, "story_v_out_319781", "319781029", "story_v_out_319781.awb")

						arg_115_1:RecordAudio("319781029", var_118_20)
						arg_115_1:RecordAudio("319781029", var_118_20)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_319781", "319781029", "story_v_out_319781.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_319781", "319781029", "story_v_out_319781.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_21 = math.max(var_118_12, arg_115_1.talkMaxDuration)

			if var_118_11 <= arg_115_1.time_ and arg_115_1.time_ < var_118_11 + var_118_21 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_11) / var_118_21

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_11 + var_118_21 and arg_115_1.time_ < var_118_11 + var_118_21 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play319781030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319781030
		arg_119_1.duration_ = 13.933

		local var_119_0 = {
			zh = 6.766,
			ja = 13.933
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
				arg_119_0:Play319781031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.875

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[471].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(319781030)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781030", "story_v_out_319781.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_319781", "319781030", "story_v_out_319781.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_319781", "319781030", "story_v_out_319781.awb")

						arg_119_1:RecordAudio("319781030", var_122_9)
						arg_119_1:RecordAudio("319781030", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_319781", "319781030", "story_v_out_319781.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_319781", "319781030", "story_v_out_319781.awb")
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
	Play319781031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319781031
		arg_123_1.duration_ = 3

		local var_123_0 = {
			zh = 1.999999999999,
			ja = 3
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
				arg_123_0:Play319781032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1095ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1095ui_story == nil then
				arg_123_1.var_.characterEffect1095ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1095ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1095ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1095ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1095ui_story.fillRatio = var_126_5
			end

			local var_126_6 = arg_123_1.actors_["1084ui_story"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story == nil then
				arg_123_1.var_.characterEffect1084ui_story = var_126_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_8 = 0.200000002980232

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8

				if arg_123_1.var_.characterEffect1084ui_story then
					arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story then
				arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_126_11 = 0
			local var_126_12 = 0.15

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_13 = arg_123_1:FormatText(StoryNameCfg[6].name)

				arg_123_1.leftNameTxt_.text = var_126_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_14 = arg_123_1:GetWordFromCfg(319781031)
				local var_126_15 = arg_123_1:FormatText(var_126_14.content)

				arg_123_1.text_.text = var_126_15

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_16 = 6
				local var_126_17 = utf8.len(var_126_15)
				local var_126_18 = var_126_16 <= 0 and var_126_12 or var_126_12 * (var_126_17 / var_126_16)

				if var_126_18 > 0 and var_126_12 < var_126_18 then
					arg_123_1.talkMaxDuration = var_126_18

					if var_126_18 + var_126_11 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_18 + var_126_11
					end
				end

				arg_123_1.text_.text = var_126_15
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781031", "story_v_out_319781.awb") ~= 0 then
					local var_126_19 = manager.audio:GetVoiceLength("story_v_out_319781", "319781031", "story_v_out_319781.awb") / 1000

					if var_126_19 + var_126_11 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_19 + var_126_11
					end

					if var_126_14.prefab_name ~= "" and arg_123_1.actors_[var_126_14.prefab_name] ~= nil then
						local var_126_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_14.prefab_name].transform, "story_v_out_319781", "319781031", "story_v_out_319781.awb")

						arg_123_1:RecordAudio("319781031", var_126_20)
						arg_123_1:RecordAudio("319781031", var_126_20)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319781", "319781031", "story_v_out_319781.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319781", "319781031", "story_v_out_319781.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_21 = math.max(var_126_12, arg_123_1.talkMaxDuration)

			if var_126_11 <= arg_123_1.time_ and arg_123_1.time_ < var_126_11 + var_126_21 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_11) / var_126_21

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_11 + var_126_21 and arg_123_1.time_ < var_126_11 + var_126_21 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319781032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319781032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play319781033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1084ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story == nil then
				arg_127_1.var_.characterEffect1084ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1084ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1084ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1084ui_story.fillRatio = var_130_5
			end

			local var_130_6 = 0
			local var_130_7 = 0.875

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_8 = arg_127_1:GetWordFromCfg(319781032)
				local var_130_9 = arg_127_1:FormatText(var_130_8.content)

				arg_127_1.text_.text = var_130_9

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_10 = 35
				local var_130_11 = utf8.len(var_130_9)
				local var_130_12 = var_130_10 <= 0 and var_130_7 or var_130_7 * (var_130_11 / var_130_10)

				if var_130_12 > 0 and var_130_7 < var_130_12 then
					arg_127_1.talkMaxDuration = var_130_12

					if var_130_12 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_12 + var_130_6
					end
				end

				arg_127_1.text_.text = var_130_9
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_13 = math.max(var_130_7, arg_127_1.talkMaxDuration)

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_13 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_6) / var_130_13

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_6 + var_130_13 and arg_127_1.time_ < var_130_6 + var_130_13 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play319781033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319781033
		arg_131_1.duration_ = 9.033

		local var_131_0 = {
			zh = 6.5,
			ja = 9.033
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
				arg_131_0:Play319781034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1095ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos1095ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1095ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["1095ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect1095ui_story == nil then
				arg_131_1.var_.characterEffect1095ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect1095ui_story then
					arg_131_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect1095ui_story then
				arg_131_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_134_15 = 0
			local var_134_16 = 0.65

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_17 = arg_131_1:FormatText(StoryNameCfg[471].name)

				arg_131_1.leftNameTxt_.text = var_134_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_18 = arg_131_1:GetWordFromCfg(319781033)
				local var_134_19 = arg_131_1:FormatText(var_134_18.content)

				arg_131_1.text_.text = var_134_19

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_20 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781033", "story_v_out_319781.awb") ~= 0 then
					local var_134_23 = manager.audio:GetVoiceLength("story_v_out_319781", "319781033", "story_v_out_319781.awb") / 1000

					if var_134_23 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_23 + var_134_15
					end

					if var_134_18.prefab_name ~= "" and arg_131_1.actors_[var_134_18.prefab_name] ~= nil then
						local var_134_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_18.prefab_name].transform, "story_v_out_319781", "319781033", "story_v_out_319781.awb")

						arg_131_1:RecordAudio("319781033", var_134_24)
						arg_131_1:RecordAudio("319781033", var_134_24)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_319781", "319781033", "story_v_out_319781.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_319781", "319781033", "story_v_out_319781.awb")
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
	Play319781034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319781034
		arg_135_1.duration_ = 1.999999999999

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play319781035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1084ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1084ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0.7, -0.97, -6)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1084ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["1084ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story == nil then
				arg_135_1.var_.characterEffect1084ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect1084ui_story then
					arg_135_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story then
				arg_135_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4133")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_138_15 = arg_135_1.actors_["1095ui_story"]
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story == nil then
				arg_135_1.var_.characterEffect1095ui_story = var_138_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_17 = 0.200000002980232

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17

				if arg_135_1.var_.characterEffect1095ui_story then
					local var_138_19 = Mathf.Lerp(0, 0.5, var_138_18)

					arg_135_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1095ui_story.fillRatio = var_138_19
				end
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story then
				local var_138_20 = 0.5

				arg_135_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1095ui_story.fillRatio = var_138_20
			end

			local var_138_21 = 0
			local var_138_22 = 0.05

			if var_138_21 < arg_135_1.time_ and arg_135_1.time_ <= var_138_21 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_23 = arg_135_1:FormatText(StoryNameCfg[6].name)

				arg_135_1.leftNameTxt_.text = var_138_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_24 = arg_135_1:GetWordFromCfg(319781034)
				local var_138_25 = arg_135_1:FormatText(var_138_24.content)

				arg_135_1.text_.text = var_138_25

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_26 = 2
				local var_138_27 = utf8.len(var_138_25)
				local var_138_28 = var_138_26 <= 0 and var_138_22 or var_138_22 * (var_138_27 / var_138_26)

				if var_138_28 > 0 and var_138_22 < var_138_28 then
					arg_135_1.talkMaxDuration = var_138_28

					if var_138_28 + var_138_21 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_28 + var_138_21
					end
				end

				arg_135_1.text_.text = var_138_25
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781034", "story_v_out_319781.awb") ~= 0 then
					local var_138_29 = manager.audio:GetVoiceLength("story_v_out_319781", "319781034", "story_v_out_319781.awb") / 1000

					if var_138_29 + var_138_21 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_29 + var_138_21
					end

					if var_138_24.prefab_name ~= "" and arg_135_1.actors_[var_138_24.prefab_name] ~= nil then
						local var_138_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_24.prefab_name].transform, "story_v_out_319781", "319781034", "story_v_out_319781.awb")

						arg_135_1:RecordAudio("319781034", var_138_30)
						arg_135_1:RecordAudio("319781034", var_138_30)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_319781", "319781034", "story_v_out_319781.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_319781", "319781034", "story_v_out_319781.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_31 = math.max(var_138_22, arg_135_1.talkMaxDuration)

			if var_138_21 <= arg_135_1.time_ and arg_135_1.time_ < var_138_21 + var_138_31 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_21) / var_138_31

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_21 + var_138_31 and arg_135_1.time_ < var_138_21 + var_138_31 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play319781035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319781035
		arg_139_1.duration_ = 17.233

		local var_139_0 = {
			zh = 11.866,
			ja = 17.233
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
				arg_139_0:Play319781036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1095ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1095ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1095ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1095ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1095ui_story == nil then
				arg_139_1.var_.characterEffect1095ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1095ui_story then
					arg_139_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1095ui_story then
				arg_139_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_142_13 = 0

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_142_15 = arg_139_1.actors_["1084ui_story"]
			local var_142_16 = 0

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story == nil then
				arg_139_1.var_.characterEffect1084ui_story = var_142_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_17 = 0.200000002980232

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_16) / var_142_17

				if arg_139_1.var_.characterEffect1084ui_story then
					local var_142_19 = Mathf.Lerp(0, 0.5, var_142_18)

					arg_139_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1084ui_story.fillRatio = var_142_19
				end
			end

			if arg_139_1.time_ >= var_142_16 + var_142_17 and arg_139_1.time_ < var_142_16 + var_142_17 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story then
				local var_142_20 = 0.5

				arg_139_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1084ui_story.fillRatio = var_142_20
			end

			local var_142_21 = 0
			local var_142_22 = 1.225

			if var_142_21 < arg_139_1.time_ and arg_139_1.time_ <= var_142_21 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_23 = arg_139_1:FormatText(StoryNameCfg[471].name)

				arg_139_1.leftNameTxt_.text = var_142_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_24 = arg_139_1:GetWordFromCfg(319781035)
				local var_142_25 = arg_139_1:FormatText(var_142_24.content)

				arg_139_1.text_.text = var_142_25

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_26 = 49
				local var_142_27 = utf8.len(var_142_25)
				local var_142_28 = var_142_26 <= 0 and var_142_22 or var_142_22 * (var_142_27 / var_142_26)

				if var_142_28 > 0 and var_142_22 < var_142_28 then
					arg_139_1.talkMaxDuration = var_142_28

					if var_142_28 + var_142_21 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_28 + var_142_21
					end
				end

				arg_139_1.text_.text = var_142_25
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781035", "story_v_out_319781.awb") ~= 0 then
					local var_142_29 = manager.audio:GetVoiceLength("story_v_out_319781", "319781035", "story_v_out_319781.awb") / 1000

					if var_142_29 + var_142_21 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_29 + var_142_21
					end

					if var_142_24.prefab_name ~= "" and arg_139_1.actors_[var_142_24.prefab_name] ~= nil then
						local var_142_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_24.prefab_name].transform, "story_v_out_319781", "319781035", "story_v_out_319781.awb")

						arg_139_1:RecordAudio("319781035", var_142_30)
						arg_139_1:RecordAudio("319781035", var_142_30)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_319781", "319781035", "story_v_out_319781.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_319781", "319781035", "story_v_out_319781.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_31 = math.max(var_142_22, arg_139_1.talkMaxDuration)

			if var_142_21 <= arg_139_1.time_ and arg_139_1.time_ < var_142_21 + var_142_31 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_21) / var_142_31

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_21 + var_142_31 and arg_139_1.time_ < var_142_21 + var_142_31 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play319781036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319781036
		arg_143_1.duration_ = 14.533

		local var_143_0 = {
			zh = 8.7,
			ja = 14.533
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
				arg_143_0:Play319781037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.1

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[471].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(319781036)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 44
				local var_146_6 = utf8.len(var_146_4)
				local var_146_7 = var_146_5 <= 0 and var_146_1 or var_146_1 * (var_146_6 / var_146_5)

				if var_146_7 > 0 and var_146_1 < var_146_7 then
					arg_143_1.talkMaxDuration = var_146_7

					if var_146_7 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_7 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_4
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781036", "story_v_out_319781.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_319781", "319781036", "story_v_out_319781.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_319781", "319781036", "story_v_out_319781.awb")

						arg_143_1:RecordAudio("319781036", var_146_9)
						arg_143_1:RecordAudio("319781036", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_319781", "319781036", "story_v_out_319781.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_319781", "319781036", "story_v_out_319781.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_10 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_10 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_10

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_10 and arg_143_1.time_ < var_146_0 + var_146_10 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play319781037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319781037
		arg_147_1.duration_ = 4.166

		local var_147_0 = {
			zh = 2.8,
			ja = 4.166
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
				arg_147_0:Play319781038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1095ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story == nil then
				arg_147_1.var_.characterEffect1095ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.200000002980232

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1095ui_story then
					local var_150_4 = Mathf.Lerp(0, 0.5, var_150_3)

					arg_147_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1095ui_story.fillRatio = var_150_4
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story then
				local var_150_5 = 0.5

				arg_147_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1095ui_story.fillRatio = var_150_5
			end

			local var_150_6 = arg_147_1.actors_["1084ui_story"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story == nil then
				arg_147_1.var_.characterEffect1084ui_story = var_150_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_8 = 0.200000002980232

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_8 then
				local var_150_9 = (arg_147_1.time_ - var_150_7) / var_150_8

				if arg_147_1.var_.characterEffect1084ui_story then
					arg_147_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_8 and arg_147_1.time_ < var_150_7 + var_150_8 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story then
				arg_147_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_150_10 = 0
			local var_150_11 = 0.225

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_12 = arg_147_1:FormatText(StoryNameCfg[6].name)

				arg_147_1.leftNameTxt_.text = var_150_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_13 = arg_147_1:GetWordFromCfg(319781037)
				local var_150_14 = arg_147_1:FormatText(var_150_13.content)

				arg_147_1.text_.text = var_150_14

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_15 = 9
				local var_150_16 = utf8.len(var_150_14)
				local var_150_17 = var_150_15 <= 0 and var_150_11 or var_150_11 * (var_150_16 / var_150_15)

				if var_150_17 > 0 and var_150_11 < var_150_17 then
					arg_147_1.talkMaxDuration = var_150_17

					if var_150_17 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_17 + var_150_10
					end
				end

				arg_147_1.text_.text = var_150_14
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781037", "story_v_out_319781.awb") ~= 0 then
					local var_150_18 = manager.audio:GetVoiceLength("story_v_out_319781", "319781037", "story_v_out_319781.awb") / 1000

					if var_150_18 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_18 + var_150_10
					end

					if var_150_13.prefab_name ~= "" and arg_147_1.actors_[var_150_13.prefab_name] ~= nil then
						local var_150_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_13.prefab_name].transform, "story_v_out_319781", "319781037", "story_v_out_319781.awb")

						arg_147_1:RecordAudio("319781037", var_150_19)
						arg_147_1:RecordAudio("319781037", var_150_19)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_319781", "319781037", "story_v_out_319781.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_319781", "319781037", "story_v_out_319781.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_20 = math.max(var_150_11, arg_147_1.talkMaxDuration)

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_20 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_10) / var_150_20

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_10 + var_150_20 and arg_147_1.time_ < var_150_10 + var_150_20 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319781038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319781038
		arg_151_1.duration_ = 16.833

		local var_151_0 = {
			zh = 16.833,
			ja = 15.333
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
				arg_151_0:Play319781039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1095ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1095ui_story == nil then
				arg_151_1.var_.characterEffect1095ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1095ui_story then
					arg_151_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1095ui_story then
				arg_151_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_154_4 = arg_151_1.actors_["1084ui_story"]
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 and arg_151_1.var_.characterEffect1084ui_story == nil then
				arg_151_1.var_.characterEffect1084ui_story = var_154_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_6 = 0.200000002980232

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6

				if arg_151_1.var_.characterEffect1084ui_story then
					local var_154_8 = Mathf.Lerp(0, 0.5, var_154_7)

					arg_151_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1084ui_story.fillRatio = var_154_8
				end
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1084ui_story then
				local var_154_9 = 0.5

				arg_151_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1084ui_story.fillRatio = var_154_9
			end

			local var_154_10 = 0
			local var_154_11 = 1.625

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_12 = arg_151_1:FormatText(StoryNameCfg[471].name)

				arg_151_1.leftNameTxt_.text = var_154_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_13 = arg_151_1:GetWordFromCfg(319781038)
				local var_154_14 = arg_151_1:FormatText(var_154_13.content)

				arg_151_1.text_.text = var_154_14

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_15 = 65
				local var_154_16 = utf8.len(var_154_14)
				local var_154_17 = var_154_15 <= 0 and var_154_11 or var_154_11 * (var_154_16 / var_154_15)

				if var_154_17 > 0 and var_154_11 < var_154_17 then
					arg_151_1.talkMaxDuration = var_154_17

					if var_154_17 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_17 + var_154_10
					end
				end

				arg_151_1.text_.text = var_154_14
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781038", "story_v_out_319781.awb") ~= 0 then
					local var_154_18 = manager.audio:GetVoiceLength("story_v_out_319781", "319781038", "story_v_out_319781.awb") / 1000

					if var_154_18 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_10
					end

					if var_154_13.prefab_name ~= "" and arg_151_1.actors_[var_154_13.prefab_name] ~= nil then
						local var_154_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_13.prefab_name].transform, "story_v_out_319781", "319781038", "story_v_out_319781.awb")

						arg_151_1:RecordAudio("319781038", var_154_19)
						arg_151_1:RecordAudio("319781038", var_154_19)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_319781", "319781038", "story_v_out_319781.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_319781", "319781038", "story_v_out_319781.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_20 = math.max(var_154_11, arg_151_1.talkMaxDuration)

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_20 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_10) / var_154_20

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_10 + var_154_20 and arg_151_1.time_ < var_154_10 + var_154_20 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319781039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319781039
		arg_155_1.duration_ = 10.3

		local var_155_0 = {
			zh = 8.4,
			ja = 10.3
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
				arg_155_0:Play319781040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1095ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1095ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1095ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = 0

			if var_158_9 < arg_155_1.time_ and arg_155_1.time_ <= var_158_9 + arg_158_0 then
				arg_155_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 then
				arg_155_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_158_11 = 0
			local var_158_12 = 1

			if var_158_11 < arg_155_1.time_ and arg_155_1.time_ <= var_158_11 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_13 = arg_155_1:FormatText(StoryNameCfg[471].name)

				arg_155_1.leftNameTxt_.text = var_158_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_14 = arg_155_1:GetWordFromCfg(319781039)
				local var_158_15 = arg_155_1:FormatText(var_158_14.content)

				arg_155_1.text_.text = var_158_15

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_16 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781039", "story_v_out_319781.awb") ~= 0 then
					local var_158_19 = manager.audio:GetVoiceLength("story_v_out_319781", "319781039", "story_v_out_319781.awb") / 1000

					if var_158_19 + var_158_11 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_19 + var_158_11
					end

					if var_158_14.prefab_name ~= "" and arg_155_1.actors_[var_158_14.prefab_name] ~= nil then
						local var_158_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_14.prefab_name].transform, "story_v_out_319781", "319781039", "story_v_out_319781.awb")

						arg_155_1:RecordAudio("319781039", var_158_20)
						arg_155_1:RecordAudio("319781039", var_158_20)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_319781", "319781039", "story_v_out_319781.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_319781", "319781039", "story_v_out_319781.awb")
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
	Play319781040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319781040
		arg_159_1.duration_ = 12.366

		local var_159_0 = {
			zh = 8.166,
			ja = 12.366
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
				arg_159_0:Play319781041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.9

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[471].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(319781040)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781040", "story_v_out_319781.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_319781", "319781040", "story_v_out_319781.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_319781", "319781040", "story_v_out_319781.awb")

						arg_159_1:RecordAudio("319781040", var_162_9)
						arg_159_1:RecordAudio("319781040", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_319781", "319781040", "story_v_out_319781.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_319781", "319781040", "story_v_out_319781.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play319781041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319781041
		arg_163_1.duration_ = 4.566

		local var_163_0 = {
			zh = 2.1,
			ja = 4.566
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
				arg_163_0:Play319781042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1095ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1095ui_story == nil then
				arg_163_1.var_.characterEffect1095ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1095ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1095ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1095ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1095ui_story.fillRatio = var_166_5
			end

			local var_166_6 = arg_163_1.actors_["1084ui_story"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1084ui_story == nil then
				arg_163_1.var_.characterEffect1084ui_story = var_166_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_8 = 0.200000002980232

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_8 then
				local var_166_9 = (arg_163_1.time_ - var_166_7) / var_166_8

				if arg_163_1.var_.characterEffect1084ui_story then
					arg_163_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_8 and arg_163_1.time_ < var_166_7 + var_166_8 + arg_166_0 and arg_163_1.var_.characterEffect1084ui_story then
				arg_163_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_166_11 = 0

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_166_12 = 0
			local var_166_13 = 0.3

			if var_166_12 < arg_163_1.time_ and arg_163_1.time_ <= var_166_12 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_14 = arg_163_1:FormatText(StoryNameCfg[6].name)

				arg_163_1.leftNameTxt_.text = var_166_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_15 = arg_163_1:GetWordFromCfg(319781041)
				local var_166_16 = arg_163_1:FormatText(var_166_15.content)

				arg_163_1.text_.text = var_166_16

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_17 = 12
				local var_166_18 = utf8.len(var_166_16)
				local var_166_19 = var_166_17 <= 0 and var_166_13 or var_166_13 * (var_166_18 / var_166_17)

				if var_166_19 > 0 and var_166_13 < var_166_19 then
					arg_163_1.talkMaxDuration = var_166_19

					if var_166_19 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_19 + var_166_12
					end
				end

				arg_163_1.text_.text = var_166_16
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781041", "story_v_out_319781.awb") ~= 0 then
					local var_166_20 = manager.audio:GetVoiceLength("story_v_out_319781", "319781041", "story_v_out_319781.awb") / 1000

					if var_166_20 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_20 + var_166_12
					end

					if var_166_15.prefab_name ~= "" and arg_163_1.actors_[var_166_15.prefab_name] ~= nil then
						local var_166_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_15.prefab_name].transform, "story_v_out_319781", "319781041", "story_v_out_319781.awb")

						arg_163_1:RecordAudio("319781041", var_166_21)
						arg_163_1:RecordAudio("319781041", var_166_21)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_319781", "319781041", "story_v_out_319781.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_319781", "319781041", "story_v_out_319781.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_22 = math.max(var_166_13, arg_163_1.talkMaxDuration)

			if var_166_12 <= arg_163_1.time_ and arg_163_1.time_ < var_166_12 + var_166_22 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_12) / var_166_22

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_12 + var_166_22 and arg_163_1.time_ < var_166_12 + var_166_22 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319781042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319781042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play319781043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1095ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1095ui_story == nil then
				arg_167_1.var_.characterEffect1095ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1095ui_story then
					local var_170_4 = Mathf.Lerp(0, 0.5, var_170_3)

					arg_167_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1095ui_story.fillRatio = var_170_4
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1095ui_story then
				local var_170_5 = 0.5

				arg_167_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1095ui_story.fillRatio = var_170_5
			end

			local var_170_6 = arg_167_1.actors_["1084ui_story"]
			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 and arg_167_1.var_.characterEffect1084ui_story == nil then
				arg_167_1.var_.characterEffect1084ui_story = var_170_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_8 = 0.200000002980232

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_8 then
				local var_170_9 = (arg_167_1.time_ - var_170_7) / var_170_8

				if arg_167_1.var_.characterEffect1084ui_story then
					local var_170_10 = Mathf.Lerp(0, 0.5, var_170_9)

					arg_167_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1084ui_story.fillRatio = var_170_10
				end
			end

			if arg_167_1.time_ >= var_170_7 + var_170_8 and arg_167_1.time_ < var_170_7 + var_170_8 + arg_170_0 and arg_167_1.var_.characterEffect1084ui_story then
				local var_170_11 = 0.5

				arg_167_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1084ui_story.fillRatio = var_170_11
			end

			local var_170_12 = arg_167_1.actors_["1095ui_story"].transform
			local var_170_13 = 0

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1.var_.moveOldPos1095ui_story = var_170_12.localPosition
			end

			local var_170_14 = 0.001

			if var_170_13 <= arg_167_1.time_ and arg_167_1.time_ < var_170_13 + var_170_14 then
				local var_170_15 = (arg_167_1.time_ - var_170_13) / var_170_14
				local var_170_16 = Vector3.New(0, 100, 0)

				var_170_12.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1095ui_story, var_170_16, var_170_15)

				local var_170_17 = manager.ui.mainCamera.transform.position - var_170_12.position

				var_170_12.forward = Vector3.New(var_170_17.x, var_170_17.y, var_170_17.z)

				local var_170_18 = var_170_12.localEulerAngles

				var_170_18.z = 0
				var_170_18.x = 0
				var_170_12.localEulerAngles = var_170_18
			end

			if arg_167_1.time_ >= var_170_13 + var_170_14 and arg_167_1.time_ < var_170_13 + var_170_14 + arg_170_0 then
				var_170_12.localPosition = Vector3.New(0, 100, 0)

				local var_170_19 = manager.ui.mainCamera.transform.position - var_170_12.position

				var_170_12.forward = Vector3.New(var_170_19.x, var_170_19.y, var_170_19.z)

				local var_170_20 = var_170_12.localEulerAngles

				var_170_20.z = 0
				var_170_20.x = 0
				var_170_12.localEulerAngles = var_170_20
			end

			local var_170_21 = arg_167_1.actors_["1084ui_story"].transform
			local var_170_22 = 0

			if var_170_22 < arg_167_1.time_ and arg_167_1.time_ <= var_170_22 + arg_170_0 then
				arg_167_1.var_.moveOldPos1084ui_story = var_170_21.localPosition
			end

			local var_170_23 = 0.001

			if var_170_22 <= arg_167_1.time_ and arg_167_1.time_ < var_170_22 + var_170_23 then
				local var_170_24 = (arg_167_1.time_ - var_170_22) / var_170_23
				local var_170_25 = Vector3.New(0, 100, 0)

				var_170_21.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1084ui_story, var_170_25, var_170_24)

				local var_170_26 = manager.ui.mainCamera.transform.position - var_170_21.position

				var_170_21.forward = Vector3.New(var_170_26.x, var_170_26.y, var_170_26.z)

				local var_170_27 = var_170_21.localEulerAngles

				var_170_27.z = 0
				var_170_27.x = 0
				var_170_21.localEulerAngles = var_170_27
			end

			if arg_167_1.time_ >= var_170_22 + var_170_23 and arg_167_1.time_ < var_170_22 + var_170_23 + arg_170_0 then
				var_170_21.localPosition = Vector3.New(0, 100, 0)

				local var_170_28 = manager.ui.mainCamera.transform.position - var_170_21.position

				var_170_21.forward = Vector3.New(var_170_28.x, var_170_28.y, var_170_28.z)

				local var_170_29 = var_170_21.localEulerAngles

				var_170_29.z = 0
				var_170_29.x = 0
				var_170_21.localEulerAngles = var_170_29
			end

			local var_170_30 = 0
			local var_170_31 = 1.375

			if var_170_30 < arg_167_1.time_ and arg_167_1.time_ <= var_170_30 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_32 = arg_167_1:GetWordFromCfg(319781042)
				local var_170_33 = arg_167_1:FormatText(var_170_32.content)

				arg_167_1.text_.text = var_170_33

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_34 = 55
				local var_170_35 = utf8.len(var_170_33)
				local var_170_36 = var_170_34 <= 0 and var_170_31 or var_170_31 * (var_170_35 / var_170_34)

				if var_170_36 > 0 and var_170_31 < var_170_36 then
					arg_167_1.talkMaxDuration = var_170_36

					if var_170_36 + var_170_30 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_36 + var_170_30
					end
				end

				arg_167_1.text_.text = var_170_33
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_37 = math.max(var_170_31, arg_167_1.talkMaxDuration)

			if var_170_30 <= arg_167_1.time_ and arg_167_1.time_ < var_170_30 + var_170_37 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_30) / var_170_37

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_30 + var_170_37 and arg_167_1.time_ < var_170_30 + var_170_37 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319781043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319781043
		arg_171_1.duration_ = 4.999999999999

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play319781044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1095ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story == nil then
				arg_171_1.var_.characterEffect1095ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1095ui_story then
					arg_171_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story then
				arg_171_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_174_4 = arg_171_1.actors_["1095ui_story"].transform
			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 then
				arg_171_1.var_.moveOldPos1095ui_story = var_174_4.localPosition
			end

			local var_174_6 = 0.001

			if var_174_5 <= arg_171_1.time_ and arg_171_1.time_ < var_174_5 + var_174_6 then
				local var_174_7 = (arg_171_1.time_ - var_174_5) / var_174_6
				local var_174_8 = Vector3.New(0, 100, 0)

				var_174_4.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1095ui_story, var_174_8, var_174_7)

				local var_174_9 = manager.ui.mainCamera.transform.position - var_174_4.position

				var_174_4.forward = Vector3.New(var_174_9.x, var_174_9.y, var_174_9.z)

				local var_174_10 = var_174_4.localEulerAngles

				var_174_10.z = 0
				var_174_10.x = 0
				var_174_4.localEulerAngles = var_174_10
			end

			if arg_171_1.time_ >= var_174_5 + var_174_6 and arg_171_1.time_ < var_174_5 + var_174_6 + arg_174_0 then
				var_174_4.localPosition = Vector3.New(0, 100, 0)

				local var_174_11 = manager.ui.mainCamera.transform.position - var_174_4.position

				var_174_4.forward = Vector3.New(var_174_11.x, var_174_11.y, var_174_11.z)

				local var_174_12 = var_174_4.localEulerAngles

				var_174_12.z = 0
				var_174_12.x = 0
				var_174_4.localEulerAngles = var_174_12
			end

			local var_174_13 = arg_171_1.actors_["1084ui_story"].transform
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1.var_.moveOldPos1084ui_story = var_174_13.localPosition
			end

			local var_174_15 = 0.001

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15
				local var_174_17 = Vector3.New(0, 100, 0)

				var_174_13.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1084ui_story, var_174_17, var_174_16)

				local var_174_18 = manager.ui.mainCamera.transform.position - var_174_13.position

				var_174_13.forward = Vector3.New(var_174_18.x, var_174_18.y, var_174_18.z)

				local var_174_19 = var_174_13.localEulerAngles

				var_174_19.z = 0
				var_174_19.x = 0
				var_174_13.localEulerAngles = var_174_19
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 then
				var_174_13.localPosition = Vector3.New(0, 100, 0)

				local var_174_20 = manager.ui.mainCamera.transform.position - var_174_13.position

				var_174_13.forward = Vector3.New(var_174_20.x, var_174_20.y, var_174_20.z)

				local var_174_21 = var_174_13.localEulerAngles

				var_174_21.z = 0
				var_174_21.x = 0
				var_174_13.localEulerAngles = var_174_21
			end

			local var_174_22 = 0

			if var_174_22 < arg_171_1.time_ and arg_171_1.time_ <= var_174_22 + arg_174_0 then
				local var_174_23 = arg_171_1.fswbg_.transform:Find("textbox/adapt/content") or arg_171_1.fswbg_.transform:Find("textbox/content")
				local var_174_24 = var_174_23:GetComponent("Text")
				local var_174_25 = var_174_23:GetComponent("RectTransform")

				var_174_24.alignment = UnityEngine.TextAnchor.LowerCenter
				var_174_25.offsetMin = Vector2.New(0, 0)
				var_174_25.offsetMax = Vector2.New(0, 0)
			end

			local var_174_26 = 0

			if var_174_26 < arg_171_1.time_ and arg_171_1.time_ <= var_174_26 + arg_174_0 then
				arg_171_1.fswbg_:SetActive(true)
				arg_171_1.dialog_:SetActive(false)

				arg_171_1.fswtw_.percent = 0

				local var_174_27 = arg_171_1:GetWordFromCfg(319781043)
				local var_174_28 = arg_171_1:FormatText(var_174_27.content)

				arg_171_1.fswt_.text = var_174_28

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.fswt_)

				arg_171_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_171_1.fswtw_:SetDirty()

				arg_171_1.typewritterCharCountI18N = 0

				SetActive(arg_171_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_171_1:ShowNextGo(false)
			end

			local var_174_29 = 0.466666666666667

			if var_174_29 < arg_171_1.time_ and arg_171_1.time_ <= var_174_29 + arg_174_0 then
				arg_171_1.var_.oldValueTypewriter = arg_171_1.fswtw_.percent

				arg_171_1:ShowNextGo(false)
			end

			local var_174_30 = 8
			local var_174_31 = 0.533333333333333
			local var_174_32 = arg_171_1:GetWordFromCfg(319781043)
			local var_174_33 = arg_171_1:FormatText(var_174_32.content)
			local var_174_34, var_174_35 = arg_171_1:GetPercentByPara(var_174_33, 1)

			if var_174_29 < arg_171_1.time_ and arg_171_1.time_ <= var_174_29 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0

				local var_174_36 = var_174_30 <= 0 and var_174_31 or var_174_31 * ((var_174_35 - arg_171_1.typewritterCharCountI18N) / var_174_30)

				if var_174_36 > 0 and var_174_31 < var_174_36 then
					arg_171_1.talkMaxDuration = var_174_36

					if var_174_36 + var_174_29 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_36 + var_174_29
					end
				end
			end

			local var_174_37 = 0.533333333333333
			local var_174_38 = math.max(var_174_37, arg_171_1.talkMaxDuration)

			if var_174_29 <= arg_171_1.time_ and arg_171_1.time_ < var_174_29 + var_174_38 then
				local var_174_39 = (arg_171_1.time_ - var_174_29) / var_174_38

				arg_171_1.fswtw_.percent = Mathf.Lerp(arg_171_1.var_.oldValueTypewriter, var_174_34, var_174_39)
				arg_171_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_171_1.fswtw_:SetDirty()
			end

			if arg_171_1.time_ >= var_174_29 + var_174_38 and arg_171_1.time_ < var_174_29 + var_174_38 + arg_174_0 then
				arg_171_1.fswtw_.percent = var_174_34

				arg_171_1.fswtw_:SetDirty()
				arg_171_1:ShowNextGo(true)

				arg_171_1.typewritterCharCountI18N = var_174_35
			end

			local var_174_40 = "STblack"

			if arg_171_1.bgs_[var_174_40] == nil then
				local var_174_41 = Object.Instantiate(arg_171_1.paintGo_)

				var_174_41:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_174_40)
				var_174_41.name = var_174_40
				var_174_41.transform.parent = arg_171_1.stage_.transform
				var_174_41.transform.localPosition = Vector3.New(0, 100, 0)
				arg_171_1.bgs_[var_174_40] = var_174_41
			end

			local var_174_42 = 0

			if var_174_42 < arg_171_1.time_ and arg_171_1.time_ <= var_174_42 + arg_174_0 then
				local var_174_43 = manager.ui.mainCamera.transform.localPosition
				local var_174_44 = Vector3.New(0, 0, 10) + Vector3.New(var_174_43.x, var_174_43.y, 0)
				local var_174_45 = arg_171_1.bgs_.STblack

				var_174_45.transform.localPosition = var_174_44
				var_174_45.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_174_46 = var_174_45:GetComponent("SpriteRenderer")

				if var_174_46 and var_174_46.sprite then
					local var_174_47 = (var_174_45.transform.localPosition - var_174_43).z
					local var_174_48 = manager.ui.mainCameraCom_
					local var_174_49 = 2 * var_174_47 * Mathf.Tan(var_174_48.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_174_50 = var_174_49 * var_174_48.aspect
					local var_174_51 = var_174_46.sprite.bounds.size.x
					local var_174_52 = var_174_46.sprite.bounds.size.y
					local var_174_53 = var_174_50 / var_174_51
					local var_174_54 = var_174_49 / var_174_52
					local var_174_55 = var_174_54 < var_174_53 and var_174_53 or var_174_54

					var_174_45.transform.localScale = Vector3.New(var_174_55, var_174_55, 0)
				end

				for iter_174_0, iter_174_1 in pairs(arg_171_1.bgs_) do
					if iter_174_0 ~= "STblack" then
						iter_174_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_174_56 = 0.466666666666667
			local var_174_57 = 2.666
			local var_174_58 = manager.audio:GetVoiceLength("story_v_out_319781", "319781043", "story_v_out_319781.awb") / 1000

			if var_174_58 > 0 and var_174_57 < var_174_58 and var_174_58 + var_174_56 > arg_171_1.duration_ then
				local var_174_59 = var_174_58

				arg_171_1.duration_ = var_174_58 + var_174_56
			end

			if var_174_56 < arg_171_1.time_ and arg_171_1.time_ <= var_174_56 + arg_174_0 then
				local var_174_60 = "play"
				local var_174_61 = "voice"

				arg_171_1:AudioAction(var_174_60, var_174_61, "story_v_out_319781", "319781043", "story_v_out_319781.awb")
			end

			local var_174_62 = 0

			if var_174_62 < arg_171_1.time_ and arg_171_1.time_ <= var_174_62 + arg_174_0 then
				arg_171_1.cswbg_:SetActive(true)

				local var_174_63 = arg_171_1.cswt_:GetComponent("RectTransform")

				arg_171_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_174_63.offsetMin = Vector2.New(410, 330)
				var_174_63.offsetMax = Vector2.New(-400, -175)

				local var_174_64 = arg_171_1:GetWordFromCfg(419053)
				local var_174_65 = arg_171_1:FormatText(var_174_64.content)

				arg_171_1.cswt_.text = var_174_65

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.cswt_)

				arg_171_1.cswt_.fontSize = 180
				arg_171_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_171_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319781044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319781044
		arg_175_1.duration_ = 1.799666666666

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play319781045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.fswbg_:SetActive(true)
				arg_175_1.dialog_:SetActive(false)

				arg_175_1.fswtw_.percent = 0

				local var_178_1 = arg_175_1:GetWordFromCfg(319781044)
				local var_178_2 = arg_175_1:FormatText(var_178_1.content)

				arg_175_1.fswt_.text = var_178_2

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.fswt_)

				arg_175_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_175_1.fswtw_:SetDirty()

				arg_175_1.typewritterCharCountI18N = 0

				SetActive(arg_175_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_175_1:ShowNextGo(false)
			end

			local var_178_3 = 0.466666666666667

			if var_178_3 < arg_175_1.time_ and arg_175_1.time_ <= var_178_3 + arg_178_0 then
				arg_175_1.var_.oldValueTypewriter = arg_175_1.fswtw_.percent

				arg_175_1:ShowNextGo(false)
			end

			local var_178_4 = 6
			local var_178_5 = 0.4
			local var_178_6 = arg_175_1:GetWordFromCfg(319781044)
			local var_178_7 = arg_175_1:FormatText(var_178_6.content)
			local var_178_8, var_178_9 = arg_175_1:GetPercentByPara(var_178_7, 1)

			if var_178_3 < arg_175_1.time_ and arg_175_1.time_ <= var_178_3 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0

				local var_178_10 = var_178_4 <= 0 and var_178_5 or var_178_5 * ((var_178_9 - arg_175_1.typewritterCharCountI18N) / var_178_4)

				if var_178_10 > 0 and var_178_5 < var_178_10 then
					arg_175_1.talkMaxDuration = var_178_10

					if var_178_10 + var_178_3 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_10 + var_178_3
					end
				end
			end

			local var_178_11 = 0.4
			local var_178_12 = math.max(var_178_11, arg_175_1.talkMaxDuration)

			if var_178_3 <= arg_175_1.time_ and arg_175_1.time_ < var_178_3 + var_178_12 then
				local var_178_13 = (arg_175_1.time_ - var_178_3) / var_178_12

				arg_175_1.fswtw_.percent = Mathf.Lerp(arg_175_1.var_.oldValueTypewriter, var_178_8, var_178_13)
				arg_175_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_175_1.fswtw_:SetDirty()
			end

			if arg_175_1.time_ >= var_178_3 + var_178_12 and arg_175_1.time_ < var_178_3 + var_178_12 + arg_178_0 then
				arg_175_1.fswtw_.percent = var_178_8

				arg_175_1.fswtw_:SetDirty()
				arg_175_1:ShowNextGo(true)

				arg_175_1.typewritterCharCountI18N = var_178_9
			end

			local var_178_14 = 0.466666666666667
			local var_178_15 = 1.333
			local var_178_16 = manager.audio:GetVoiceLength("story_v_out_319781", "319781044", "story_v_out_319781.awb") / 1000

			if var_178_16 > 0 and var_178_15 < var_178_16 and var_178_16 + var_178_14 > arg_175_1.duration_ then
				local var_178_17 = var_178_16

				arg_175_1.duration_ = var_178_16 + var_178_14
			end

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				local var_178_18 = "play"
				local var_178_19 = "voice"

				arg_175_1:AudioAction(var_178_18, var_178_19, "story_v_out_319781", "319781044", "story_v_out_319781.awb")
			end
		end
	end,
	Play319781045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319781045
		arg_179_1.duration_ = 7.66666666666667

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play319781046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 1

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				local var_182_1 = manager.ui.mainCamera.transform.localPosition
				local var_182_2 = Vector3.New(0, 0, 10) + Vector3.New(var_182_1.x, var_182_1.y, 0)
				local var_182_3 = arg_179_1.bgs_.ST74

				var_182_3.transform.localPosition = var_182_2
				var_182_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_182_4 = var_182_3:GetComponent("SpriteRenderer")

				if var_182_4 and var_182_4.sprite then
					local var_182_5 = (var_182_3.transform.localPosition - var_182_1).z
					local var_182_6 = manager.ui.mainCameraCom_
					local var_182_7 = 2 * var_182_5 * Mathf.Tan(var_182_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_182_8 = var_182_7 * var_182_6.aspect
					local var_182_9 = var_182_4.sprite.bounds.size.x
					local var_182_10 = var_182_4.sprite.bounds.size.y
					local var_182_11 = var_182_8 / var_182_9
					local var_182_12 = var_182_7 / var_182_10
					local var_182_13 = var_182_12 < var_182_11 and var_182_11 or var_182_12

					var_182_3.transform.localScale = Vector3.New(var_182_13, var_182_13, 0)
				end

				for iter_182_0, iter_182_1 in pairs(arg_179_1.bgs_) do
					if iter_182_0 ~= "ST74" then
						iter_182_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 then
				arg_179_1.allBtn_.enabled = false
			end

			local var_182_15 = 0.3

			if arg_179_1.time_ >= var_182_14 + var_182_15 and arg_179_1.time_ < var_182_14 + var_182_15 + arg_182_0 then
				arg_179_1.allBtn_.enabled = true
			end

			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_17 = 1

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17
				local var_182_19 = Color.New(0, 0, 0)

				var_182_19.a = Mathf.Lerp(0, 1, var_182_18)
				arg_179_1.mask_.color = var_182_19
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 then
				local var_182_20 = Color.New(0, 0, 0)

				var_182_20.a = 1
				arg_179_1.mask_.color = var_182_20
			end

			local var_182_21 = 1

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_22 = 2

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_22 then
				local var_182_23 = (arg_179_1.time_ - var_182_21) / var_182_22
				local var_182_24 = Color.New(0, 0, 0)

				var_182_24.a = Mathf.Lerp(1, 0, var_182_23)
				arg_179_1.mask_.color = var_182_24
			end

			if arg_179_1.time_ >= var_182_21 + var_182_22 and arg_179_1.time_ < var_182_21 + var_182_22 + arg_182_0 then
				local var_182_25 = Color.New(0, 0, 0)
				local var_182_26 = 0

				arg_179_1.mask_.enabled = false
				var_182_25.a = var_182_26
				arg_179_1.mask_.color = var_182_25
			end

			local var_182_27 = arg_179_1.actors_["1084ui_story"].transform
			local var_182_28 = 1

			if var_182_28 < arg_179_1.time_ and arg_179_1.time_ <= var_182_28 + arg_182_0 then
				arg_179_1.var_.moveOldPos1084ui_story = var_182_27.localPosition
			end

			local var_182_29 = 0.001

			if var_182_28 <= arg_179_1.time_ and arg_179_1.time_ < var_182_28 + var_182_29 then
				local var_182_30 = (arg_179_1.time_ - var_182_28) / var_182_29
				local var_182_31 = Vector3.New(0, 100, 0)

				var_182_27.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1084ui_story, var_182_31, var_182_30)

				local var_182_32 = manager.ui.mainCamera.transform.position - var_182_27.position

				var_182_27.forward = Vector3.New(var_182_32.x, var_182_32.y, var_182_32.z)

				local var_182_33 = var_182_27.localEulerAngles

				var_182_33.z = 0
				var_182_33.x = 0
				var_182_27.localEulerAngles = var_182_33
			end

			if arg_179_1.time_ >= var_182_28 + var_182_29 and arg_179_1.time_ < var_182_28 + var_182_29 + arg_182_0 then
				var_182_27.localPosition = Vector3.New(0, 100, 0)

				local var_182_34 = manager.ui.mainCamera.transform.position - var_182_27.position

				var_182_27.forward = Vector3.New(var_182_34.x, var_182_34.y, var_182_34.z)

				local var_182_35 = var_182_27.localEulerAngles

				var_182_35.z = 0
				var_182_35.x = 0
				var_182_27.localEulerAngles = var_182_35
			end

			local var_182_36 = arg_179_1.actors_["1095ui_story"].transform
			local var_182_37 = 1

			if var_182_37 < arg_179_1.time_ and arg_179_1.time_ <= var_182_37 + arg_182_0 then
				arg_179_1.var_.moveOldPos1095ui_story = var_182_36.localPosition
			end

			local var_182_38 = 0.001

			if var_182_37 <= arg_179_1.time_ and arg_179_1.time_ < var_182_37 + var_182_38 then
				local var_182_39 = (arg_179_1.time_ - var_182_37) / var_182_38
				local var_182_40 = Vector3.New(0, 100, 0)

				var_182_36.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1095ui_story, var_182_40, var_182_39)

				local var_182_41 = manager.ui.mainCamera.transform.position - var_182_36.position

				var_182_36.forward = Vector3.New(var_182_41.x, var_182_41.y, var_182_41.z)

				local var_182_42 = var_182_36.localEulerAngles

				var_182_42.z = 0
				var_182_42.x = 0
				var_182_36.localEulerAngles = var_182_42
			end

			if arg_179_1.time_ >= var_182_37 + var_182_38 and arg_179_1.time_ < var_182_37 + var_182_38 + arg_182_0 then
				var_182_36.localPosition = Vector3.New(0, 100, 0)

				local var_182_43 = manager.ui.mainCamera.transform.position - var_182_36.position

				var_182_36.forward = Vector3.New(var_182_43.x, var_182_43.y, var_182_43.z)

				local var_182_44 = var_182_36.localEulerAngles

				var_182_44.z = 0
				var_182_44.x = 0
				var_182_36.localEulerAngles = var_182_44
			end

			local var_182_45 = 1

			if var_182_45 < arg_179_1.time_ and arg_179_1.time_ <= var_182_45 + arg_182_0 then
				arg_179_1.fswbg_:SetActive(false)
				arg_179_1.dialog_:SetActive(false)
				arg_179_1:ShowNextGo(false)
			end

			local var_182_46 = 1.03400000184774

			if var_182_46 < arg_179_1.time_ and arg_179_1.time_ <= var_182_46 + arg_182_0 then
				arg_179_1.fswbg_:SetActive(false)
				arg_179_1.dialog_:SetActive(false)
				arg_179_1:ShowNextGo(false)
			end

			local var_182_47 = 1

			if var_182_47 < arg_179_1.time_ and arg_179_1.time_ <= var_182_47 + arg_182_0 then
				arg_179_1.cswbg_:SetActive(false)
			end

			if arg_179_1.frameCnt_ <= 1 then
				arg_179_1.dialog_:SetActive(false)
			end

			local var_182_48 = 2.66666666666667
			local var_182_49 = 1.125

			if var_182_48 < arg_179_1.time_ and arg_179_1.time_ <= var_182_48 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0

				arg_179_1.dialog_:SetActive(true)

				local var_182_50 = LeanTween.value(arg_179_1.dialog_, 0, 1, 0.3)

				var_182_50:setOnUpdate(LuaHelper.FloatAction(function(arg_183_0)
					arg_179_1.dialogCg_.alpha = arg_183_0
				end))
				var_182_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_179_1.dialog_)
					var_182_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_179_1.duration_ = arg_179_1.duration_ + 0.3

				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_51 = arg_179_1:GetWordFromCfg(319781045)
				local var_182_52 = arg_179_1:FormatText(var_182_51.content)

				arg_179_1.text_.text = var_182_52

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_53 = 45
				local var_182_54 = utf8.len(var_182_52)
				local var_182_55 = var_182_53 <= 0 and var_182_49 or var_182_49 * (var_182_54 / var_182_53)

				if var_182_55 > 0 and var_182_49 < var_182_55 then
					arg_179_1.talkMaxDuration = var_182_55
					var_182_48 = var_182_48 + 0.3

					if var_182_55 + var_182_48 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_55 + var_182_48
					end
				end

				arg_179_1.text_.text = var_182_52
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_56 = var_182_48 + 0.3
			local var_182_57 = math.max(var_182_49, arg_179_1.talkMaxDuration)

			if var_182_56 <= arg_179_1.time_ and arg_179_1.time_ < var_182_56 + var_182_57 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_56) / var_182_57

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_56 + var_182_57 and arg_179_1.time_ < var_182_56 + var_182_57 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319781046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319781046
		arg_185_1.duration_ = 6.366

		local var_185_0 = {
			zh = 4.3,
			ja = 6.366
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
			arg_185_1.auto_ = false
		end

		function arg_185_1.playNext_(arg_187_0)
			arg_185_1.onStoryFinished_()
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1095ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1095ui_story == nil then
				arg_185_1.var_.characterEffect1095ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1095ui_story then
					arg_185_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1095ui_story then
				arg_185_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_188_4 = arg_185_1.actors_["1095ui_story"].transform
			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 then
				arg_185_1.var_.moveOldPos1095ui_story = var_188_4.localPosition
			end

			local var_188_6 = 0.001

			if var_188_5 <= arg_185_1.time_ and arg_185_1.time_ < var_188_5 + var_188_6 then
				local var_188_7 = (arg_185_1.time_ - var_188_5) / var_188_6
				local var_188_8 = Vector3.New(0, -0.98, -6.1)

				var_188_4.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1095ui_story, var_188_8, var_188_7)

				local var_188_9 = manager.ui.mainCamera.transform.position - var_188_4.position

				var_188_4.forward = Vector3.New(var_188_9.x, var_188_9.y, var_188_9.z)

				local var_188_10 = var_188_4.localEulerAngles

				var_188_10.z = 0
				var_188_10.x = 0
				var_188_4.localEulerAngles = var_188_10
			end

			if arg_185_1.time_ >= var_188_5 + var_188_6 and arg_185_1.time_ < var_188_5 + var_188_6 + arg_188_0 then
				var_188_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_188_11 = manager.ui.mainCamera.transform.position - var_188_4.position

				var_188_4.forward = Vector3.New(var_188_11.x, var_188_11.y, var_188_11.z)

				local var_188_12 = var_188_4.localEulerAngles

				var_188_12.z = 0
				var_188_12.x = 0
				var_188_4.localEulerAngles = var_188_12
			end

			local var_188_13 = 0
			local var_188_14 = 0.275

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_15 = arg_185_1:FormatText(StoryNameCfg[471].name)

				arg_185_1.leftNameTxt_.text = var_188_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_16 = arg_185_1:GetWordFromCfg(319781046)
				local var_188_17 = arg_185_1:FormatText(var_188_16.content)

				arg_185_1.text_.text = var_188_17

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_18 = 11
				local var_188_19 = utf8.len(var_188_17)
				local var_188_20 = var_188_18 <= 0 and var_188_14 or var_188_14 * (var_188_19 / var_188_18)

				if var_188_20 > 0 and var_188_14 < var_188_20 then
					arg_185_1.talkMaxDuration = var_188_20

					if var_188_20 + var_188_13 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_20 + var_188_13
					end
				end

				arg_185_1.text_.text = var_188_17
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319781", "319781046", "story_v_out_319781.awb") ~= 0 then
					local var_188_21 = manager.audio:GetVoiceLength("story_v_out_319781", "319781046", "story_v_out_319781.awb") / 1000

					if var_188_21 + var_188_13 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_21 + var_188_13
					end

					if var_188_16.prefab_name ~= "" and arg_185_1.actors_[var_188_16.prefab_name] ~= nil then
						local var_188_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_16.prefab_name].transform, "story_v_out_319781", "319781046", "story_v_out_319781.awb")

						arg_185_1:RecordAudio("319781046", var_188_22)
						arg_185_1:RecordAudio("319781046", var_188_22)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319781", "319781046", "story_v_out_319781.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319781", "319781046", "story_v_out_319781.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_23 = math.max(var_188_14, arg_185_1.talkMaxDuration)

			if var_188_13 <= arg_185_1.time_ and arg_185_1.time_ < var_188_13 + var_188_23 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_13) / var_188_23

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_13 + var_188_23 and arg_185_1.time_ < var_188_13 + var_188_23 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319781.awb"
	}
}
