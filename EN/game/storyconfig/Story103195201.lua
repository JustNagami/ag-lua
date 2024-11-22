return {
	Play319521001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319521001
		arg_1_1.duration_ = 8

		local var_1_0 = {
			zh = 6.9,
			ja = 8
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
				arg_1_0:Play319521002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST02"

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
				local var_4_5 = arg_1_1.bgs_.ST02

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
					if iter_4_0 ~= "ST02" then
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

			local var_4_22 = "1084ui_story"

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

			local var_4_26 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1084ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -0.97, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1084ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.97, -6)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1084ui_story"]
			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_39 = 1.8

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_4_40 = 1.8

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_4_41 = 0
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "effect"

				arg_1_1:AudioAction(var_4_43, var_4_44, "se_story_221_00", "se_story_221_00_canteen_loop", "")
			end

			local var_4_45 = 0
			local var_4_46 = 0.0666666666666667

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_49 = 0.1
			local var_4_50 = 1

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				local var_4_51 = "play"
				local var_4_52 = "music"

				arg_1_1:AudioAction(var_4_51, var_4_52, "bgm_activity_3_0_story_daily_leisure", "bgm_activity_3_0_story_daily_leisure", "bgm_activity_3_0_story_daily_leisure.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2
			local var_4_54 = 0.4

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

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(319521001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521001", "story_v_out_319521.awb") ~= 0 then
					local var_4_62 = manager.audio:GetVoiceLength("story_v_out_319521", "319521001", "story_v_out_319521.awb") / 1000

					if var_4_62 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_53
					end

					if var_4_57.prefab_name ~= "" and arg_1_1.actors_[var_4_57.prefab_name] ~= nil then
						local var_4_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_57.prefab_name].transform, "story_v_out_319521", "319521001", "story_v_out_319521.awb")

						arg_1_1:RecordAudio("319521001", var_4_63)
						arg_1_1:RecordAudio("319521001", var_4_63)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319521", "319521001", "story_v_out_319521.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319521", "319521001", "story_v_out_319521.awb")
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
	Play319521002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319521002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319521003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1084ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1084ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_5
			end

			local var_10_6 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_7 = 0

			if var_10_7 < arg_7_1.time_ and arg_7_1.time_ <= var_10_7 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_6.localPosition
			end

			local var_10_8 = 0.001

			if var_10_7 <= arg_7_1.time_ and arg_7_1.time_ < var_10_7 + var_10_8 then
				local var_10_9 = (arg_7_1.time_ - var_10_7) / var_10_8
				local var_10_10 = Vector3.New(0, 100, 0)

				var_10_6.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_10, var_10_9)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_6.position

				var_10_6.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_6.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_6.localEulerAngles = var_10_12
			end

			if arg_7_1.time_ >= var_10_7 + var_10_8 and arg_7_1.time_ < var_10_7 + var_10_8 + arg_10_0 then
				var_10_6.localPosition = Vector3.New(0, 100, 0)

				local var_10_13 = manager.ui.mainCamera.transform.position - var_10_6.position

				var_10_6.forward = Vector3.New(var_10_13.x, var_10_13.y, var_10_13.z)

				local var_10_14 = var_10_6.localEulerAngles

				var_10_14.z = 0
				var_10_14.x = 0
				var_10_6.localEulerAngles = var_10_14
			end

			local var_10_15 = 0
			local var_10_16 = 1.275

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_17 = arg_7_1:GetWordFromCfg(319521002)
				local var_10_18 = arg_7_1:FormatText(var_10_17.content)

				arg_7_1.text_.text = var_10_18

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_19 = 51
				local var_10_20 = utf8.len(var_10_18)
				local var_10_21 = var_10_19 <= 0 and var_10_16 or var_10_16 * (var_10_20 / var_10_19)

				if var_10_21 > 0 and var_10_16 < var_10_21 then
					arg_7_1.talkMaxDuration = var_10_21

					if var_10_21 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_21 + var_10_15
					end
				end

				arg_7_1.text_.text = var_10_18
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_22 = math.max(var_10_16, arg_7_1.talkMaxDuration)

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_22 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_15) / var_10_22

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_15 + var_10_22 and arg_7_1.time_ < var_10_15 + var_10_22 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319521003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319521003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319521004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.075

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

				local var_14_2 = arg_11_1:GetWordFromCfg(319521003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 43
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
	Play319521004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319521004
		arg_15_1.duration_ = 3.033

		local var_15_0 = {
			zh = 2.3,
			ja = 3.033
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
				arg_15_0:Play319521005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.25

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[704].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(319521004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521004", "story_v_out_319521.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521004", "story_v_out_319521.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_319521", "319521004", "story_v_out_319521.awb")

						arg_15_1:RecordAudio("319521004", var_18_9)
						arg_15_1:RecordAudio("319521004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319521", "319521004", "story_v_out_319521.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319521", "319521004", "story_v_out_319521.awb")
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
	Play319521005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319521005
		arg_19_1.duration_ = 6.533

		local var_19_0 = {
			zh = 4.3,
			ja = 6.533
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
				arg_19_0:Play319521006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1084ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1084ui_story then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0, -0.97, -6)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_22_15 = 0
			local var_22_16 = 0.575

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_17 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_18 = arg_19_1:GetWordFromCfg(319521005)
				local var_22_19 = arg_19_1:FormatText(var_22_18.content)

				arg_19_1.text_.text = var_22_19

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_20 = 23
				local var_22_21 = utf8.len(var_22_19)
				local var_22_22 = var_22_20 <= 0 and var_22_16 or var_22_16 * (var_22_21 / var_22_20)

				if var_22_22 > 0 and var_22_16 < var_22_22 then
					arg_19_1.talkMaxDuration = var_22_22

					if var_22_22 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_22 + var_22_15
					end
				end

				arg_19_1.text_.text = var_22_19
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521005", "story_v_out_319521.awb") ~= 0 then
					local var_22_23 = manager.audio:GetVoiceLength("story_v_out_319521", "319521005", "story_v_out_319521.awb") / 1000

					if var_22_23 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_23 + var_22_15
					end

					if var_22_18.prefab_name ~= "" and arg_19_1.actors_[var_22_18.prefab_name] ~= nil then
						local var_22_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_18.prefab_name].transform, "story_v_out_319521", "319521005", "story_v_out_319521.awb")

						arg_19_1:RecordAudio("319521005", var_22_24)
						arg_19_1:RecordAudio("319521005", var_22_24)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319521", "319521005", "story_v_out_319521.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319521", "319521005", "story_v_out_319521.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_25 = math.max(var_22_16, arg_19_1.talkMaxDuration)

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_25 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_15) / var_22_25

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_15 + var_22_25 and arg_19_1.time_ < var_22_15 + var_22_25 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319521006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319521006
		arg_23_1.duration_ = 7.333

		local var_23_0 = {
			zh = 4,
			ja = 7.333
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
				arg_23_0:Play319521007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1084ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.425

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[704].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(319521006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 17
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521006", "story_v_out_319521.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_319521", "319521006", "story_v_out_319521.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_319521", "319521006", "story_v_out_319521.awb")

						arg_23_1:RecordAudio("319521006", var_26_15)
						arg_23_1:RecordAudio("319521006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319521", "319521006", "story_v_out_319521.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319521", "319521006", "story_v_out_319521.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_16 and arg_23_1.time_ < var_26_6 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319521007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319521007
		arg_27_1.duration_ = 10.533

		local var_27_0 = {
			zh = 6.233,
			ja = 10.533
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
				arg_27_0:Play319521008(arg_27_1)
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
					arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story then
				arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_30_4 = 0
			local var_30_5 = 0.75

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_6 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_7 = arg_27_1:GetWordFromCfg(319521007)
				local var_30_8 = arg_27_1:FormatText(var_30_7.content)

				arg_27_1.text_.text = var_30_8

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_9 = 30
				local var_30_10 = utf8.len(var_30_8)
				local var_30_11 = var_30_9 <= 0 and var_30_5 or var_30_5 * (var_30_10 / var_30_9)

				if var_30_11 > 0 and var_30_5 < var_30_11 then
					arg_27_1.talkMaxDuration = var_30_11

					if var_30_11 + var_30_4 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_11 + var_30_4
					end
				end

				arg_27_1.text_.text = var_30_8
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521007", "story_v_out_319521.awb") ~= 0 then
					local var_30_12 = manager.audio:GetVoiceLength("story_v_out_319521", "319521007", "story_v_out_319521.awb") / 1000

					if var_30_12 + var_30_4 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_4
					end

					if var_30_7.prefab_name ~= "" and arg_27_1.actors_[var_30_7.prefab_name] ~= nil then
						local var_30_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_7.prefab_name].transform, "story_v_out_319521", "319521007", "story_v_out_319521.awb")

						arg_27_1:RecordAudio("319521007", var_30_13)
						arg_27_1:RecordAudio("319521007", var_30_13)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319521", "319521007", "story_v_out_319521.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319521", "319521007", "story_v_out_319521.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_14 = math.max(var_30_5, arg_27_1.talkMaxDuration)

			if var_30_4 <= arg_27_1.time_ and arg_27_1.time_ < var_30_4 + var_30_14 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_4) / var_30_14

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_4 + var_30_14 and arg_27_1.time_ < var_30_4 + var_30_14 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319521008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319521008
		arg_31_1.duration_ = 9.5

		local var_31_0 = {
			zh = 9.433,
			ja = 9.5
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
				arg_31_0:Play319521009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1084ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1084ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1084ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1084ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.975

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[704].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(319521008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521008", "story_v_out_319521.awb") ~= 0 then
					local var_34_14 = manager.audio:GetVoiceLength("story_v_out_319521", "319521008", "story_v_out_319521.awb") / 1000

					if var_34_14 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_14 + var_34_6
					end

					if var_34_9.prefab_name ~= "" and arg_31_1.actors_[var_34_9.prefab_name] ~= nil then
						local var_34_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_9.prefab_name].transform, "story_v_out_319521", "319521008", "story_v_out_319521.awb")

						arg_31_1:RecordAudio("319521008", var_34_15)
						arg_31_1:RecordAudio("319521008", var_34_15)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319521", "319521008", "story_v_out_319521.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319521", "319521008", "story_v_out_319521.awb")
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
	Play319521009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319521009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play319521010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_38_1 = 0
			local var_38_2 = 0.8

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(319521009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 32
				local var_38_6 = utf8.len(var_38_4)
				local var_38_7 = var_38_5 <= 0 and var_38_2 or var_38_2 * (var_38_6 / var_38_5)

				if var_38_7 > 0 and var_38_2 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_1
					end
				end

				arg_35_1.text_.text = var_38_4
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_8 = math.max(var_38_2, arg_35_1.talkMaxDuration)

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_8 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_1) / var_38_8

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_1 + var_38_8 and arg_35_1.time_ < var_38_1 + var_38_8 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319521010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319521010
		arg_39_1.duration_ = 4.8

		local var_39_0 = {
			zh = 3.4,
			ja = 4.8
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
				arg_39_0:Play319521011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1084ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1084ui_story then
					arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_6 = 0
			local var_42_7 = 0.325

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(319521010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 13
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521010", "story_v_out_319521.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_319521", "319521010", "story_v_out_319521.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_319521", "319521010", "story_v_out_319521.awb")

						arg_39_1:RecordAudio("319521010", var_42_15)
						arg_39_1:RecordAudio("319521010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319521", "319521010", "story_v_out_319521.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319521", "319521010", "story_v_out_319521.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_16 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_16 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_16

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_16 and arg_39_1.time_ < var_42_6 + var_42_16 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319521011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319521011
		arg_43_1.duration_ = 5.233

		local var_43_0 = {
			zh = 3.733,
			ja = 5.233
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
				arg_43_0:Play319521012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1084ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.45

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[704].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(319521011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 18
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521011", "story_v_out_319521.awb") ~= 0 then
					local var_46_14 = manager.audio:GetVoiceLength("story_v_out_319521", "319521011", "story_v_out_319521.awb") / 1000

					if var_46_14 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_14 + var_46_6
					end

					if var_46_9.prefab_name ~= "" and arg_43_1.actors_[var_46_9.prefab_name] ~= nil then
						local var_46_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_9.prefab_name].transform, "story_v_out_319521", "319521011", "story_v_out_319521.awb")

						arg_43_1:RecordAudio("319521011", var_46_15)
						arg_43_1:RecordAudio("319521011", var_46_15)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319521", "319521011", "story_v_out_319521.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319521", "319521011", "story_v_out_319521.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_16 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_16 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_16

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_16 and arg_43_1.time_ < var_46_6 + var_46_16 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319521012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319521012
		arg_47_1.duration_ = 8.133

		local var_47_0 = {
			zh = 6.433,
			ja = 8.133
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
				arg_47_0:Play319521013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "I11s"

			if arg_47_1.bgs_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(arg_47_1.paintGo_)

				var_50_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_50_0)
				var_50_1.name = var_50_0
				var_50_1.transform.parent = arg_47_1.stage_.transform
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.bgs_[var_50_0] = var_50_1
			end

			local var_50_2 = 2

			if var_50_2 < arg_47_1.time_ and arg_47_1.time_ <= var_50_2 + arg_50_0 then
				local var_50_3 = manager.ui.mainCamera.transform.localPosition
				local var_50_4 = Vector3.New(0, 0, 10) + Vector3.New(var_50_3.x, var_50_3.y, 0)
				local var_50_5 = arg_47_1.bgs_.I11s

				var_50_5.transform.localPosition = var_50_4
				var_50_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_6 = var_50_5:GetComponent("SpriteRenderer")

				if var_50_6 and var_50_6.sprite then
					local var_50_7 = (var_50_5.transform.localPosition - var_50_3).z
					local var_50_8 = manager.ui.mainCameraCom_
					local var_50_9 = 2 * var_50_7 * Mathf.Tan(var_50_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_10 = var_50_9 * var_50_8.aspect
					local var_50_11 = var_50_6.sprite.bounds.size.x
					local var_50_12 = var_50_6.sprite.bounds.size.y
					local var_50_13 = var_50_10 / var_50_11
					local var_50_14 = var_50_9 / var_50_12
					local var_50_15 = var_50_14 < var_50_13 and var_50_13 or var_50_14

					var_50_5.transform.localScale = Vector3.New(var_50_15, var_50_15, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "I11s" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_17 = 2

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17
				local var_50_19 = Color.New(0, 0, 0)

				var_50_19.a = Mathf.Lerp(0, 1, var_50_18)
				arg_47_1.mask_.color = var_50_19
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				local var_50_20 = Color.New(0, 0, 0)

				var_50_20.a = 1
				arg_47_1.mask_.color = var_50_20
			end

			local var_50_21 = 2

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_22 = 2

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22
				local var_50_24 = Color.New(0, 0, 0)

				var_50_24.a = Mathf.Lerp(1, 0, var_50_23)
				arg_47_1.mask_.color = var_50_24
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 then
				local var_50_25 = Color.New(0, 0, 0)
				local var_50_26 = 0

				arg_47_1.mask_.enabled = false
				var_50_25.a = var_50_26
				arg_47_1.mask_.color = var_50_25
			end

			local var_50_27 = arg_47_1.actors_["1084ui_story"].transform
			local var_50_28 = 2

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				arg_47_1.var_.moveOldPos1084ui_story = var_50_27.localPosition
			end

			local var_50_29 = 0.001

			if var_50_28 <= arg_47_1.time_ and arg_47_1.time_ < var_50_28 + var_50_29 then
				local var_50_30 = (arg_47_1.time_ - var_50_28) / var_50_29
				local var_50_31 = Vector3.New(0, 100, 0)

				var_50_27.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1084ui_story, var_50_31, var_50_30)

				local var_50_32 = manager.ui.mainCamera.transform.position - var_50_27.position

				var_50_27.forward = Vector3.New(var_50_32.x, var_50_32.y, var_50_32.z)

				local var_50_33 = var_50_27.localEulerAngles

				var_50_33.z = 0
				var_50_33.x = 0
				var_50_27.localEulerAngles = var_50_33
			end

			if arg_47_1.time_ >= var_50_28 + var_50_29 and arg_47_1.time_ < var_50_28 + var_50_29 + arg_50_0 then
				var_50_27.localPosition = Vector3.New(0, 100, 0)

				local var_50_34 = manager.ui.mainCamera.transform.position - var_50_27.position

				var_50_27.forward = Vector3.New(var_50_34.x, var_50_34.y, var_50_34.z)

				local var_50_35 = var_50_27.localEulerAngles

				var_50_35.z = 0
				var_50_35.x = 0
				var_50_27.localEulerAngles = var_50_35
			end

			local var_50_36 = arg_47_1.actors_["1084ui_story"]
			local var_50_37 = 2

			if var_50_37 < arg_47_1.time_ and arg_47_1.time_ <= var_50_37 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_38 = 0.200000002980232

			if var_50_37 <= arg_47_1.time_ and arg_47_1.time_ < var_50_37 + var_50_38 then
				local var_50_39 = (arg_47_1.time_ - var_50_37) / var_50_38

				if arg_47_1.var_.characterEffect1084ui_story then
					local var_50_40 = Mathf.Lerp(0, 0.5, var_50_39)

					arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_40
				end
			end

			if arg_47_1.time_ >= var_50_37 + var_50_38 and arg_47_1.time_ < var_50_37 + var_50_38 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				local var_50_41 = 0.5

				arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_41
			end

			local var_50_42 = 0
			local var_50_43 = 1

			if var_50_42 < arg_47_1.time_ and arg_47_1.time_ <= var_50_42 + arg_50_0 then
				local var_50_44 = "stop"
				local var_50_45 = "effect"

				arg_47_1:AudioAction(var_50_44, var_50_45, "se_story_221_00", "se_story_221_00_canteen_loop", "")
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_46 = 2
			local var_50_47 = 0.475

			if var_50_46 < arg_47_1.time_ and arg_47_1.time_ <= var_50_46 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_48 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_48:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_49 = arg_47_1:FormatText(StoryNameCfg[704].name)

				arg_47_1.leftNameTxt_.text = var_50_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_50 = arg_47_1:GetWordFromCfg(319521012)
				local var_50_51 = arg_47_1:FormatText(var_50_50.content)

				arg_47_1.text_.text = var_50_51

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_52 = 19
				local var_50_53 = utf8.len(var_50_51)
				local var_50_54 = var_50_52 <= 0 and var_50_47 or var_50_47 * (var_50_53 / var_50_52)

				if var_50_54 > 0 and var_50_47 < var_50_54 then
					arg_47_1.talkMaxDuration = var_50_54
					var_50_46 = var_50_46 + 0.3

					if var_50_54 + var_50_46 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_54 + var_50_46
					end
				end

				arg_47_1.text_.text = var_50_51
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521012", "story_v_out_319521.awb") ~= 0 then
					local var_50_55 = manager.audio:GetVoiceLength("story_v_out_319521", "319521012", "story_v_out_319521.awb") / 1000

					if var_50_55 + var_50_46 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_55 + var_50_46
					end

					if var_50_50.prefab_name ~= "" and arg_47_1.actors_[var_50_50.prefab_name] ~= nil then
						local var_50_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_50.prefab_name].transform, "story_v_out_319521", "319521012", "story_v_out_319521.awb")

						arg_47_1:RecordAudio("319521012", var_50_56)
						arg_47_1:RecordAudio("319521012", var_50_56)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319521", "319521012", "story_v_out_319521.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319521", "319521012", "story_v_out_319521.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_57 = var_50_46 + 0.3
			local var_50_58 = math.max(var_50_47, arg_47_1.talkMaxDuration)

			if var_50_57 <= arg_47_1.time_ and arg_47_1.time_ < var_50_57 + var_50_58 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_57) / var_50_58

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_57 + var_50_58 and arg_47_1.time_ < var_50_57 + var_50_58 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319521013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319521013
		arg_53_1.duration_ = 3.9

		local var_53_0 = {
			zh = 2.366,
			ja = 3.9
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
				arg_53_0:Play319521014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.275

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[704].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, true)
				arg_53_1.iconController_:SetSelectedState("hero")

				arg_53_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(319521013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521013", "story_v_out_319521.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521013", "story_v_out_319521.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_319521", "319521013", "story_v_out_319521.awb")

						arg_53_1:RecordAudio("319521013", var_56_9)
						arg_53_1:RecordAudio("319521013", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319521", "319521013", "story_v_out_319521.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319521", "319521013", "story_v_out_319521.awb")
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
	Play319521014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319521014
		arg_57_1.duration_ = 2

		local var_57_0 = {
			zh = 1.999999999999,
			ja = 2
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
				arg_57_0:Play319521015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = "10074ui_story"

			if arg_57_1.actors_[var_60_0] == nil then
				local var_60_1 = Object.Instantiate(Asset.Load("Char/" .. var_60_0), arg_57_1.stage_.transform)

				var_60_1.name = var_60_0
				var_60_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_57_1.actors_[var_60_0] = var_60_1

				local var_60_2 = var_60_1:GetComponentInChildren(typeof(CharacterEffect))

				var_60_2.enabled = true

				local var_60_3 = GameObjectTools.GetOrAddComponent(var_60_1, typeof(DynamicBoneHelper))

				if var_60_3 then
					var_60_3:EnableDynamicBone(false)
				end

				arg_57_1:ShowWeapon(var_60_2.transform, false)

				arg_57_1.var_[var_60_0 .. "Animator"] = var_60_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_57_1.var_[var_60_0 .. "Animator"].applyRootMotion = true
				arg_57_1.var_[var_60_0 .. "LipSync"] = var_60_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_60_4 = arg_57_1.actors_["10074ui_story"].transform
			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 then
				arg_57_1.var_.moveOldPos10074ui_story = var_60_4.localPosition
			end

			local var_60_6 = 0.001

			if var_60_5 <= arg_57_1.time_ and arg_57_1.time_ < var_60_5 + var_60_6 then
				local var_60_7 = (arg_57_1.time_ - var_60_5) / var_60_6
				local var_60_8 = Vector3.New(0, -0.75, -6.18)

				var_60_4.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10074ui_story, var_60_8, var_60_7)

				local var_60_9 = manager.ui.mainCamera.transform.position - var_60_4.position

				var_60_4.forward = Vector3.New(var_60_9.x, var_60_9.y, var_60_9.z)

				local var_60_10 = var_60_4.localEulerAngles

				var_60_10.z = 0
				var_60_10.x = 0
				var_60_4.localEulerAngles = var_60_10
			end

			if arg_57_1.time_ >= var_60_5 + var_60_6 and arg_57_1.time_ < var_60_5 + var_60_6 + arg_60_0 then
				var_60_4.localPosition = Vector3.New(0, -0.75, -6.18)

				local var_60_11 = manager.ui.mainCamera.transform.position - var_60_4.position

				var_60_4.forward = Vector3.New(var_60_11.x, var_60_11.y, var_60_11.z)

				local var_60_12 = var_60_4.localEulerAngles

				var_60_12.z = 0
				var_60_12.x = 0
				var_60_4.localEulerAngles = var_60_12
			end

			local var_60_13 = arg_57_1.actors_["10074ui_story"]
			local var_60_14 = 0

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 and arg_57_1.var_.characterEffect10074ui_story == nil then
				arg_57_1.var_.characterEffect10074ui_story = var_60_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_15 = 0.200000002980232

			if var_60_14 <= arg_57_1.time_ and arg_57_1.time_ < var_60_14 + var_60_15 then
				local var_60_16 = (arg_57_1.time_ - var_60_14) / var_60_15

				if arg_57_1.var_.characterEffect10074ui_story then
					arg_57_1.var_.characterEffect10074ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_14 + var_60_15 and arg_57_1.time_ < var_60_14 + var_60_15 + arg_60_0 and arg_57_1.var_.characterEffect10074ui_story then
				arg_57_1.var_.characterEffect10074ui_story.fillFlat = false
			end

			local var_60_17 = 0

			if var_60_17 < arg_57_1.time_ and arg_57_1.time_ <= var_60_17 + arg_60_0 then
				arg_57_1:PlayTimeline("10074ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action2_1")
			end

			local var_60_18 = 0

			if var_60_18 < arg_57_1.time_ and arg_57_1.time_ <= var_60_18 + arg_60_0 then
				arg_57_1:PlayTimeline("10074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_60_19 = 0
			local var_60_20 = 0.125

			if var_60_19 < arg_57_1.time_ and arg_57_1.time_ <= var_60_19 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_21 = arg_57_1:FormatText(StoryNameCfg[697].name)

				arg_57_1.leftNameTxt_.text = var_60_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_22 = arg_57_1:GetWordFromCfg(319521014)
				local var_60_23 = arg_57_1:FormatText(var_60_22.content)

				arg_57_1.text_.text = var_60_23

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_24 = 5
				local var_60_25 = utf8.len(var_60_23)
				local var_60_26 = var_60_24 <= 0 and var_60_20 or var_60_20 * (var_60_25 / var_60_24)

				if var_60_26 > 0 and var_60_20 < var_60_26 then
					arg_57_1.talkMaxDuration = var_60_26

					if var_60_26 + var_60_19 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_26 + var_60_19
					end
				end

				arg_57_1.text_.text = var_60_23
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521014", "story_v_out_319521.awb") ~= 0 then
					local var_60_27 = manager.audio:GetVoiceLength("story_v_out_319521", "319521014", "story_v_out_319521.awb") / 1000

					if var_60_27 + var_60_19 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_27 + var_60_19
					end

					if var_60_22.prefab_name ~= "" and arg_57_1.actors_[var_60_22.prefab_name] ~= nil then
						local var_60_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_22.prefab_name].transform, "story_v_out_319521", "319521014", "story_v_out_319521.awb")

						arg_57_1:RecordAudio("319521014", var_60_28)
						arg_57_1:RecordAudio("319521014", var_60_28)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319521", "319521014", "story_v_out_319521.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319521", "319521014", "story_v_out_319521.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_29 = math.max(var_60_20, arg_57_1.talkMaxDuration)

			if var_60_19 <= arg_57_1.time_ and arg_57_1.time_ < var_60_19 + var_60_29 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_19) / var_60_29

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_19 + var_60_29 and arg_57_1.time_ < var_60_19 + var_60_29 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319521015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319521015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play319521016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "10068ui_story"

			if arg_61_1.actors_[var_64_0] == nil then
				local var_64_1 = Object.Instantiate(Asset.Load("Char/" .. var_64_0), arg_61_1.stage_.transform)

				var_64_1.name = var_64_0
				var_64_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.actors_[var_64_0] = var_64_1

				local var_64_2 = var_64_1:GetComponentInChildren(typeof(CharacterEffect))

				var_64_2.enabled = true

				local var_64_3 = GameObjectTools.GetOrAddComponent(var_64_1, typeof(DynamicBoneHelper))

				if var_64_3 then
					var_64_3:EnableDynamicBone(false)
				end

				arg_61_1:ShowWeapon(var_64_2.transform, false)

				arg_61_1.var_[var_64_0 .. "Animator"] = var_64_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_61_1.var_[var_64_0 .. "Animator"].applyRootMotion = true
				arg_61_1.var_[var_64_0 .. "LipSync"] = var_64_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_64_4 = arg_61_1.actors_["10068ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect10068ui_story == nil then
				arg_61_1.var_.characterEffect10068ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.200000002980232

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect10068ui_story then
					local var_64_8 = Mathf.Lerp(0, 0.5, var_64_7)

					arg_61_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10068ui_story.fillRatio = var_64_8
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect10068ui_story then
				local var_64_9 = 0.5

				arg_61_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10068ui_story.fillRatio = var_64_9
			end

			local var_64_10 = 0
			local var_64_11 = 0.6

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_12 = arg_61_1:FormatText(StoryNameCfg[698].name)

				arg_61_1.leftNameTxt_.text = var_64_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_13 = arg_61_1:GetWordFromCfg(319521015)
				local var_64_14 = arg_61_1:FormatText(var_64_13.content)

				arg_61_1.text_.text = var_64_14

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_15 = 24
				local var_64_16 = utf8.len(var_64_14)
				local var_64_17 = var_64_15 <= 0 and var_64_11 or var_64_11 * (var_64_16 / var_64_15)

				if var_64_17 > 0 and var_64_11 < var_64_17 then
					arg_61_1.talkMaxDuration = var_64_17

					if var_64_17 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_17 + var_64_10
					end
				end

				arg_61_1.text_.text = var_64_14
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_18 = math.max(var_64_11, arg_61_1.talkMaxDuration)

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_18 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_10) / var_64_18

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_10 + var_64_18 and arg_61_1.time_ < var_64_10 + var_64_18 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319521016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319521016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play319521017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.75

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

				local var_68_2 = arg_65_1:GetWordFromCfg(319521016)
				local var_68_3 = arg_65_1:FormatText(var_68_2.content)

				arg_65_1.text_.text = var_68_3

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_4 = 30
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
	Play319521017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319521017
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319521018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.425

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[698].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(319521017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 17
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
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_8 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_8 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_8

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_8 and arg_69_1.time_ < var_72_0 + var_72_8 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319521018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319521018
		arg_73_1.duration_ = 9.7

		local var_73_0 = {
			zh = 8.1,
			ja = 9.7
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
				arg_73_0:Play319521019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.825

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[704].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(319521018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521018", "story_v_out_319521.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521018", "story_v_out_319521.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_319521", "319521018", "story_v_out_319521.awb")

						arg_73_1:RecordAudio("319521018", var_76_9)
						arg_73_1:RecordAudio("319521018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319521", "319521018", "story_v_out_319521.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319521", "319521018", "story_v_out_319521.awb")
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
	Play319521019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319521019
		arg_77_1.duration_ = 9

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play319521020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 2

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				local var_80_1 = manager.ui.mainCamera.transform.localPosition
				local var_80_2 = Vector3.New(0, 0, 10) + Vector3.New(var_80_1.x, var_80_1.y, 0)
				local var_80_3 = arg_77_1.bgs_.I11s

				var_80_3.transform.localPosition = var_80_2
				var_80_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_80_4 = var_80_3:GetComponent("SpriteRenderer")

				if var_80_4 and var_80_4.sprite then
					local var_80_5 = (var_80_3.transform.localPosition - var_80_1).z
					local var_80_6 = manager.ui.mainCameraCom_
					local var_80_7 = 2 * var_80_5 * Mathf.Tan(var_80_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_80_8 = var_80_7 * var_80_6.aspect
					local var_80_9 = var_80_4.sprite.bounds.size.x
					local var_80_10 = var_80_4.sprite.bounds.size.y
					local var_80_11 = var_80_8 / var_80_9
					local var_80_12 = var_80_7 / var_80_10
					local var_80_13 = var_80_12 < var_80_11 and var_80_11 or var_80_12

					var_80_3.transform.localScale = Vector3.New(var_80_13, var_80_13, 0)
				end

				for iter_80_0, iter_80_1 in pairs(arg_77_1.bgs_) do
					if iter_80_0 ~= "I11s" then
						iter_80_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1.mask_.enabled = true
				arg_77_1.mask_.raycastTarget = true

				arg_77_1:SetGaussion(false)
			end

			local var_80_15 = 2

			if var_80_14 <= arg_77_1.time_ and arg_77_1.time_ < var_80_14 + var_80_15 then
				local var_80_16 = (arg_77_1.time_ - var_80_14) / var_80_15
				local var_80_17 = Color.New(0, 0, 0)

				var_80_17.a = Mathf.Lerp(0, 1, var_80_16)
				arg_77_1.mask_.color = var_80_17
			end

			if arg_77_1.time_ >= var_80_14 + var_80_15 and arg_77_1.time_ < var_80_14 + var_80_15 + arg_80_0 then
				local var_80_18 = Color.New(0, 0, 0)

				var_80_18.a = 1
				arg_77_1.mask_.color = var_80_18
			end

			local var_80_19 = 2

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1.mask_.enabled = true
				arg_77_1.mask_.raycastTarget = true

				arg_77_1:SetGaussion(false)
			end

			local var_80_20 = 2

			if var_80_19 <= arg_77_1.time_ and arg_77_1.time_ < var_80_19 + var_80_20 then
				local var_80_21 = (arg_77_1.time_ - var_80_19) / var_80_20
				local var_80_22 = Color.New(0, 0, 0)

				var_80_22.a = Mathf.Lerp(1, 0, var_80_21)
				arg_77_1.mask_.color = var_80_22
			end

			if arg_77_1.time_ >= var_80_19 + var_80_20 and arg_77_1.time_ < var_80_19 + var_80_20 + arg_80_0 then
				local var_80_23 = Color.New(0, 0, 0)
				local var_80_24 = 0

				arg_77_1.mask_.enabled = false
				var_80_23.a = var_80_24
				arg_77_1.mask_.color = var_80_23
			end

			local var_80_25 = arg_77_1.actors_["10074ui_story"].transform
			local var_80_26 = 1.96599999815226

			if var_80_26 < arg_77_1.time_ and arg_77_1.time_ <= var_80_26 + arg_80_0 then
				arg_77_1.var_.moveOldPos10074ui_story = var_80_25.localPosition
			end

			local var_80_27 = 0.001

			if var_80_26 <= arg_77_1.time_ and arg_77_1.time_ < var_80_26 + var_80_27 then
				local var_80_28 = (arg_77_1.time_ - var_80_26) / var_80_27
				local var_80_29 = Vector3.New(0, 100, 0)

				var_80_25.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10074ui_story, var_80_29, var_80_28)

				local var_80_30 = manager.ui.mainCamera.transform.position - var_80_25.position

				var_80_25.forward = Vector3.New(var_80_30.x, var_80_30.y, var_80_30.z)

				local var_80_31 = var_80_25.localEulerAngles

				var_80_31.z = 0
				var_80_31.x = 0
				var_80_25.localEulerAngles = var_80_31
			end

			if arg_77_1.time_ >= var_80_26 + var_80_27 and arg_77_1.time_ < var_80_26 + var_80_27 + arg_80_0 then
				var_80_25.localPosition = Vector3.New(0, 100, 0)

				local var_80_32 = manager.ui.mainCamera.transform.position - var_80_25.position

				var_80_25.forward = Vector3.New(var_80_32.x, var_80_32.y, var_80_32.z)

				local var_80_33 = var_80_25.localEulerAngles

				var_80_33.z = 0
				var_80_33.x = 0
				var_80_25.localEulerAngles = var_80_33
			end

			local var_80_34 = arg_77_1.actors_["10074ui_story"].transform
			local var_80_35 = 1.966

			if var_80_35 < arg_77_1.time_ and arg_77_1.time_ <= var_80_35 + arg_80_0 then
				arg_77_1.var_.moveOldPos10074ui_story = var_80_34.localPosition
			end

			local var_80_36 = 0.001

			if var_80_35 <= arg_77_1.time_ and arg_77_1.time_ < var_80_35 + var_80_36 then
				local var_80_37 = (arg_77_1.time_ - var_80_35) / var_80_36
				local var_80_38 = Vector3.New(0, 100, 0)

				var_80_34.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10074ui_story, var_80_38, var_80_37)

				local var_80_39 = manager.ui.mainCamera.transform.position - var_80_34.position

				var_80_34.forward = Vector3.New(var_80_39.x, var_80_39.y, var_80_39.z)

				local var_80_40 = var_80_34.localEulerAngles

				var_80_40.z = 0
				var_80_40.x = 0
				var_80_34.localEulerAngles = var_80_40
			end

			if arg_77_1.time_ >= var_80_35 + var_80_36 and arg_77_1.time_ < var_80_35 + var_80_36 + arg_80_0 then
				var_80_34.localPosition = Vector3.New(0, 100, 0)

				local var_80_41 = manager.ui.mainCamera.transform.position - var_80_34.position

				var_80_34.forward = Vector3.New(var_80_41.x, var_80_41.y, var_80_41.z)

				local var_80_42 = var_80_34.localEulerAngles

				var_80_42.z = 0
				var_80_42.x = 0
				var_80_34.localEulerAngles = var_80_42
			end

			if arg_77_1.frameCnt_ <= 1 then
				arg_77_1.dialog_:SetActive(false)
			end

			local var_80_43 = 4
			local var_80_44 = 0.875

			if var_80_43 < arg_77_1.time_ and arg_77_1.time_ <= var_80_43 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				arg_77_1.dialog_:SetActive(true)

				local var_80_45 = LeanTween.value(arg_77_1.dialog_, 0, 1, 0.3)

				var_80_45:setOnUpdate(LuaHelper.FloatAction(function(arg_81_0)
					arg_77_1.dialogCg_.alpha = arg_81_0
				end))
				var_80_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_77_1.dialog_)
					var_80_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_77_1.duration_ = arg_77_1.duration_ + 0.3

				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_46 = arg_77_1:GetWordFromCfg(319521019)
				local var_80_47 = arg_77_1:FormatText(var_80_46.content)

				arg_77_1.text_.text = var_80_47

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_48 = 35
				local var_80_49 = utf8.len(var_80_47)
				local var_80_50 = var_80_48 <= 0 and var_80_44 or var_80_44 * (var_80_49 / var_80_48)

				if var_80_50 > 0 and var_80_44 < var_80_50 then
					arg_77_1.talkMaxDuration = var_80_50
					var_80_43 = var_80_43 + 0.3

					if var_80_50 + var_80_43 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_50 + var_80_43
					end
				end

				arg_77_1.text_.text = var_80_47
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_51 = var_80_43 + 0.3
			local var_80_52 = math.max(var_80_44, arg_77_1.talkMaxDuration)

			if var_80_51 <= arg_77_1.time_ and arg_77_1.time_ < var_80_51 + var_80_52 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_51) / var_80_52

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_51 + var_80_52 and arg_77_1.time_ < var_80_51 + var_80_52 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319521020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319521020
		arg_83_1.duration_ = 3.166

		local var_83_0 = {
			zh = 2.5,
			ja = 3.166
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
				arg_83_0:Play319521021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, -0.97, -6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1084ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1084ui_story then
					arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_15 = 0
			local var_86_16 = 0.275

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(319521020)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 11
				local var_86_21 = utf8.len(var_86_19)
				local var_86_22 = var_86_20 <= 0 and var_86_16 or var_86_16 * (var_86_21 / var_86_20)

				if var_86_22 > 0 and var_86_16 < var_86_22 then
					arg_83_1.talkMaxDuration = var_86_22

					if var_86_22 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_19
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521020", "story_v_out_319521.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_319521", "319521020", "story_v_out_319521.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_319521", "319521020", "story_v_out_319521.awb")

						arg_83_1:RecordAudio("319521020", var_86_24)
						arg_83_1:RecordAudio("319521020", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319521", "319521020", "story_v_out_319521.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319521", "319521020", "story_v_out_319521.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_25 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_25 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_25

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_25 and arg_83_1.time_ < var_86_15 + var_86_25 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319521021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319521021
		arg_87_1.duration_ = 7.833

		local var_87_0 = {
			zh = 5.066,
			ja = 7.833
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
				arg_87_0:Play319521022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.65

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[6].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(319521021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521021", "story_v_out_319521.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521021", "story_v_out_319521.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_319521", "319521021", "story_v_out_319521.awb")

						arg_87_1:RecordAudio("319521021", var_90_9)
						arg_87_1:RecordAudio("319521021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319521", "319521021", "story_v_out_319521.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319521", "319521021", "story_v_out_319521.awb")
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
	Play319521022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319521022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play319521023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1084ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1084ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 1.475

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_8 = arg_91_1:GetWordFromCfg(319521022)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 59
				local var_94_11 = utf8.len(var_94_9)
				local var_94_12 = var_94_10 <= 0 and var_94_7 or var_94_7 * (var_94_11 / var_94_10)

				if var_94_12 > 0 and var_94_7 < var_94_12 then
					arg_91_1.talkMaxDuration = var_94_12

					if var_94_12 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_12 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_9
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_13 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_13 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_13

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_13 and arg_91_1.time_ < var_94_6 + var_94_13 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319521023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319521023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play319521024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.5

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_2 = arg_95_1:GetWordFromCfg(319521023)
				local var_98_3 = arg_95_1:FormatText(var_98_2.content)

				arg_95_1.text_.text = var_98_3

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_4 = 60
				local var_98_5 = utf8.len(var_98_3)
				local var_98_6 = var_98_4 <= 0 and var_98_1 or var_98_1 * (var_98_5 / var_98_4)

				if var_98_6 > 0 and var_98_1 < var_98_6 then
					arg_95_1.talkMaxDuration = var_98_6

					if var_98_6 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_6 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_3
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_7 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_7 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_7

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_7 and arg_95_1.time_ < var_98_0 + var_98_7 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319521024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319521024
		arg_99_1.duration_ = 6.066

		local var_99_0 = {
			zh = 5.2,
			ja = 6.066
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
				arg_99_0:Play319521025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1084ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story == nil then
				arg_99_1.var_.characterEffect1084ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1084ui_story then
					arg_99_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story then
				arg_99_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_102_4 = 0

			if var_102_4 < arg_99_1.time_ and arg_99_1.time_ <= var_102_4 + arg_102_0 then
				arg_99_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_102_6 = 0
			local var_102_7 = 0.6

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[6].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(319521024)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521024", "story_v_out_319521.awb") ~= 0 then
					local var_102_14 = manager.audio:GetVoiceLength("story_v_out_319521", "319521024", "story_v_out_319521.awb") / 1000

					if var_102_14 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_14 + var_102_6
					end

					if var_102_9.prefab_name ~= "" and arg_99_1.actors_[var_102_9.prefab_name] ~= nil then
						local var_102_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_9.prefab_name].transform, "story_v_out_319521", "319521024", "story_v_out_319521.awb")

						arg_99_1:RecordAudio("319521024", var_102_15)
						arg_99_1:RecordAudio("319521024", var_102_15)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319521", "319521024", "story_v_out_319521.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319521", "319521024", "story_v_out_319521.awb")
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
	Play319521025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319521025
		arg_103_1.duration_ = 6.9

		local var_103_0 = {
			zh = 3.4,
			ja = 6.9
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
				arg_103_0:Play319521026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1084ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story == nil then
				arg_103_1.var_.characterEffect1084ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1084ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 0.3

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[36].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(319521025)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 12
				local var_106_12 = utf8.len(var_106_10)
				local var_106_13 = var_106_11 <= 0 and var_106_7 or var_106_7 * (var_106_12 / var_106_11)

				if var_106_13 > 0 and var_106_7 < var_106_13 then
					arg_103_1.talkMaxDuration = var_106_13

					if var_106_13 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_13 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_10
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521025", "story_v_out_319521.awb") ~= 0 then
					local var_106_14 = manager.audio:GetVoiceLength("story_v_out_319521", "319521025", "story_v_out_319521.awb") / 1000

					if var_106_14 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_14 + var_106_6
					end

					if var_106_9.prefab_name ~= "" and arg_103_1.actors_[var_106_9.prefab_name] ~= nil then
						local var_106_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_9.prefab_name].transform, "story_v_out_319521", "319521025", "story_v_out_319521.awb")

						arg_103_1:RecordAudio("319521025", var_106_15)
						arg_103_1:RecordAudio("319521025", var_106_15)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319521", "319521025", "story_v_out_319521.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319521", "319521025", "story_v_out_319521.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_16 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_16 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_16

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_16 and arg_103_1.time_ < var_106_6 + var_106_16 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319521026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319521026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play319521027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_110_2 = 0
			local var_110_3 = 1.15

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_4 = arg_107_1:GetWordFromCfg(319521026)
				local var_110_5 = arg_107_1:FormatText(var_110_4.content)

				arg_107_1.text_.text = var_110_5

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_6 = 46
				local var_110_7 = utf8.len(var_110_5)
				local var_110_8 = var_110_6 <= 0 and var_110_3 or var_110_3 * (var_110_7 / var_110_6)

				if var_110_8 > 0 and var_110_3 < var_110_8 then
					arg_107_1.talkMaxDuration = var_110_8

					if var_110_8 + var_110_2 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_2
					end
				end

				arg_107_1.text_.text = var_110_5
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_9 = math.max(var_110_3, arg_107_1.talkMaxDuration)

			if var_110_2 <= arg_107_1.time_ and arg_107_1.time_ < var_110_2 + var_110_9 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_2) / var_110_9

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_2 + var_110_9 and arg_107_1.time_ < var_110_2 + var_110_9 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319521027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319521027
		arg_111_1.duration_ = 7.466666666666

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play319521028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = "STblack"

			if arg_111_1.bgs_[var_114_0] == nil then
				local var_114_1 = Object.Instantiate(arg_111_1.paintGo_)

				var_114_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_114_0)
				var_114_1.name = var_114_0
				var_114_1.transform.parent = arg_111_1.stage_.transform
				var_114_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.bgs_[var_114_0] = var_114_1
			end

			local var_114_2 = 0

			if var_114_2 < arg_111_1.time_ and arg_111_1.time_ <= var_114_2 + arg_114_0 then
				local var_114_3 = manager.ui.mainCamera.transform.localPosition
				local var_114_4 = Vector3.New(0, 0, 10) + Vector3.New(var_114_3.x, var_114_3.y, 0)
				local var_114_5 = arg_111_1.bgs_.STblack

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
					if iter_114_0 ~= "STblack" then
						iter_114_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				local var_114_17 = arg_111_1.fswbg_.transform:Find("textbox/adapt/content") or arg_111_1.fswbg_.transform:Find("textbox/content")
				local var_114_18 = var_114_17:GetComponent("Text")
				local var_114_19 = var_114_17:GetComponent("RectTransform")

				var_114_18.alignment = UnityEngine.TextAnchor.LowerCenter
				var_114_19.offsetMin = Vector2.New(0, 0)
				var_114_19.offsetMax = Vector2.New(0, 0)
			end

			local var_114_20 = 0

			if var_114_20 < arg_111_1.time_ and arg_111_1.time_ <= var_114_20 + arg_114_0 then
				arg_111_1.fswbg_:SetActive(true)
				arg_111_1.dialog_:SetActive(false)

				arg_111_1.fswtw_.percent = 0

				local var_114_21 = arg_111_1:GetWordFromCfg(319521027)
				local var_114_22 = arg_111_1:FormatText(var_114_21.content)

				arg_111_1.fswt_.text = var_114_22

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.fswt_)

				arg_111_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_111_1.fswtw_:SetDirty()

				arg_111_1.typewritterCharCountI18N = 0

				SetActive(arg_111_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_111_1:ShowNextGo(false)
			end

			local var_114_23 = 0.366666666666667

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1.var_.oldValueTypewriter = arg_111_1.fswtw_.percent

				arg_111_1:ShowNextGo(false)
			end

			local var_114_24 = 4
			local var_114_25 = 0.266666666666667
			local var_114_26 = arg_111_1:GetWordFromCfg(319521027)
			local var_114_27 = arg_111_1:FormatText(var_114_26.content)
			local var_114_28, var_114_29 = arg_111_1:GetPercentByPara(var_114_27, 1)

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				local var_114_30 = var_114_24 <= 0 and var_114_25 or var_114_25 * ((var_114_29 - arg_111_1.typewritterCharCountI18N) / var_114_24)

				if var_114_30 > 0 and var_114_25 < var_114_30 then
					arg_111_1.talkMaxDuration = var_114_30

					if var_114_30 + var_114_23 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_30 + var_114_23
					end
				end
			end

			local var_114_31 = 0.266666666666667
			local var_114_32 = math.max(var_114_31, arg_111_1.talkMaxDuration)

			if var_114_23 <= arg_111_1.time_ and arg_111_1.time_ < var_114_23 + var_114_32 then
				local var_114_33 = (arg_111_1.time_ - var_114_23) / var_114_32

				arg_111_1.fswtw_.percent = Mathf.Lerp(arg_111_1.var_.oldValueTypewriter, var_114_28, var_114_33)
				arg_111_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_111_1.fswtw_:SetDirty()
			end

			if arg_111_1.time_ >= var_114_23 + var_114_32 and arg_111_1.time_ < var_114_23 + var_114_32 + arg_114_0 then
				arg_111_1.fswtw_.percent = var_114_28

				arg_111_1.fswtw_:SetDirty()
				arg_111_1:ShowNextGo(true)

				arg_111_1.typewritterCharCountI18N = var_114_29
			end

			local var_114_34 = 0

			if var_114_34 < arg_111_1.time_ and arg_111_1.time_ <= var_114_34 + arg_114_0 then
				arg_111_1.cswbg_:SetActive(true)

				local var_114_35 = arg_111_1.cswt_:GetComponent("RectTransform")

				arg_111_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_114_35.offsetMin = Vector2.New(410, 330)
				var_114_35.offsetMax = Vector2.New(-400, -175)

				local var_114_36 = arg_111_1:GetWordFromCfg(419028)
				local var_114_37 = arg_111_1:FormatText(var_114_36.content)

				arg_111_1.cswt_.text = var_114_37

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.cswt_)

				arg_111_1.cswt_.fontSize = 180
				arg_111_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_111_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_114_38 = arg_111_1.actors_["1084ui_story"].transform
			local var_114_39 = 0

			if var_114_39 < arg_111_1.time_ and arg_111_1.time_ <= var_114_39 + arg_114_0 then
				arg_111_1.var_.moveOldPos1084ui_story = var_114_38.localPosition
			end

			local var_114_40 = 0.001

			if var_114_39 <= arg_111_1.time_ and arg_111_1.time_ < var_114_39 + var_114_40 then
				local var_114_41 = (arg_111_1.time_ - var_114_39) / var_114_40
				local var_114_42 = Vector3.New(0, 100, 0)

				var_114_38.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1084ui_story, var_114_42, var_114_41)

				local var_114_43 = manager.ui.mainCamera.transform.position - var_114_38.position

				var_114_38.forward = Vector3.New(var_114_43.x, var_114_43.y, var_114_43.z)

				local var_114_44 = var_114_38.localEulerAngles

				var_114_44.z = 0
				var_114_44.x = 0
				var_114_38.localEulerAngles = var_114_44
			end

			if arg_111_1.time_ >= var_114_39 + var_114_40 and arg_111_1.time_ < var_114_39 + var_114_40 + arg_114_0 then
				var_114_38.localPosition = Vector3.New(0, 100, 0)

				local var_114_45 = manager.ui.mainCamera.transform.position - var_114_38.position

				var_114_38.forward = Vector3.New(var_114_45.x, var_114_45.y, var_114_45.z)

				local var_114_46 = var_114_38.localEulerAngles

				var_114_46.z = 0
				var_114_46.x = 0
				var_114_38.localEulerAngles = var_114_46
			end

			local var_114_47 = 0.366666666666667
			local var_114_48 = 1.333
			local var_114_49 = manager.audio:GetVoiceLength("story_v_out_319521", "319521027", "story_v_out_319521.awb") / 1000

			if var_114_49 > 0 and var_114_48 < var_114_49 and var_114_49 + var_114_47 > arg_111_1.duration_ then
				local var_114_50 = var_114_49

				arg_111_1.duration_ = var_114_49 + var_114_47
			end

			if var_114_47 < arg_111_1.time_ and arg_111_1.time_ <= var_114_47 + arg_114_0 then
				local var_114_51 = "play"
				local var_114_52 = "voice"

				arg_111_1:AudioAction(var_114_51, var_114_52, "story_v_out_319521", "319521027", "story_v_out_319521.awb")
			end

			local var_114_53 = 0
			local var_114_54 = 0.6

			if var_114_53 < arg_111_1.time_ and arg_111_1.time_ <= var_114_53 + arg_114_0 then
				local var_114_55 = "play"
				local var_114_56 = "music"

				arg_111_1:AudioAction(var_114_55, var_114_56, "ui_battle", "ui_battle_stopbgm", "")
			end
		end
	end,
	Play319521028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319521028
		arg_115_1.duration_ = 4.866333333332

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play319521029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.fswbg_:SetActive(true)
				arg_115_1.dialog_:SetActive(false)

				arg_115_1.fswtw_.percent = 0

				local var_118_1 = arg_115_1:GetWordFromCfg(319521028)
				local var_118_2 = arg_115_1:FormatText(var_118_1.content)

				arg_115_1.fswt_.text = var_118_2

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.fswt_)

				arg_115_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_115_1.fswtw_:SetDirty()

				arg_115_1.typewritterCharCountI18N = 0

				SetActive(arg_115_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_115_1:ShowNextGo(false)
			end

			local var_118_3 = 0.133333333333333

			if var_118_3 < arg_115_1.time_ and arg_115_1.time_ <= var_118_3 + arg_118_0 then
				arg_115_1.var_.oldValueTypewriter = arg_115_1.fswtw_.percent

				arg_115_1:ShowNextGo(false)
			end

			local var_118_4 = 19
			local var_118_5 = 1.26666666666667
			local var_118_6 = arg_115_1:GetWordFromCfg(319521028)
			local var_118_7 = arg_115_1:FormatText(var_118_6.content)
			local var_118_8, var_118_9 = arg_115_1:GetPercentByPara(var_118_7, 1)

			if var_118_3 < arg_115_1.time_ and arg_115_1.time_ <= var_118_3 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0

				local var_118_10 = var_118_4 <= 0 and var_118_5 or var_118_5 * ((var_118_9 - arg_115_1.typewritterCharCountI18N) / var_118_4)

				if var_118_10 > 0 and var_118_5 < var_118_10 then
					arg_115_1.talkMaxDuration = var_118_10

					if var_118_10 + var_118_3 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_10 + var_118_3
					end
				end
			end

			local var_118_11 = 1.26666666666667
			local var_118_12 = math.max(var_118_11, arg_115_1.talkMaxDuration)

			if var_118_3 <= arg_115_1.time_ and arg_115_1.time_ < var_118_3 + var_118_12 then
				local var_118_13 = (arg_115_1.time_ - var_118_3) / var_118_12

				arg_115_1.fswtw_.percent = Mathf.Lerp(arg_115_1.var_.oldValueTypewriter, var_118_8, var_118_13)
				arg_115_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_115_1.fswtw_:SetDirty()
			end

			if arg_115_1.time_ >= var_118_3 + var_118_12 and arg_115_1.time_ < var_118_3 + var_118_12 + arg_118_0 then
				arg_115_1.fswtw_.percent = var_118_8

				arg_115_1.fswtw_:SetDirty()
				arg_115_1:ShowNextGo(true)

				arg_115_1.typewritterCharCountI18N = var_118_9
			end

			local var_118_14 = 0.133333333333333
			local var_118_15 = 4.733
			local var_118_16 = manager.audio:GetVoiceLength("story_v_out_319521", "319521028", "story_v_out_319521.awb") / 1000

			if var_118_16 > 0 and var_118_15 < var_118_16 and var_118_16 + var_118_14 > arg_115_1.duration_ then
				local var_118_17 = var_118_16

				arg_115_1.duration_ = var_118_16 + var_118_14
			end

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				local var_118_18 = "play"
				local var_118_19 = "voice"

				arg_115_1:AudioAction(var_118_18, var_118_19, "story_v_out_319521", "319521028", "story_v_out_319521.awb")
			end
		end
	end,
	Play319521029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319521029
		arg_119_1.duration_ = 3.466666666666

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play319521030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				local var_122_1 = manager.ui.mainCamera.transform.localPosition
				local var_122_2 = Vector3.New(0, 0, 10) + Vector3.New(var_122_1.x, var_122_1.y, 0)
				local var_122_3 = arg_119_1.bgs_.I11s

				var_122_3.transform.localPosition = var_122_2
				var_122_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_122_4 = var_122_3:GetComponent("SpriteRenderer")

				if var_122_4 and var_122_4.sprite then
					local var_122_5 = (var_122_3.transform.localPosition - var_122_1).z
					local var_122_6 = manager.ui.mainCameraCom_
					local var_122_7 = 2 * var_122_5 * Mathf.Tan(var_122_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_122_8 = var_122_7 * var_122_6.aspect
					local var_122_9 = var_122_4.sprite.bounds.size.x
					local var_122_10 = var_122_4.sprite.bounds.size.y
					local var_122_11 = var_122_8 / var_122_9
					local var_122_12 = var_122_7 / var_122_10
					local var_122_13 = var_122_12 < var_122_11 and var_122_11 or var_122_12

					var_122_3.transform.localScale = Vector3.New(var_122_13, var_122_13, 0)
				end

				for iter_122_0, iter_122_1 in pairs(arg_119_1.bgs_) do
					if iter_122_0 ~= "I11s" then
						iter_122_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_122_14 = arg_119_1.actors_["1084ui_story"]
			local var_122_15 = 0.9

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story == nil then
				arg_119_1.var_.characterEffect1084ui_story = var_122_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_16 = 0.200000002980232

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_16 then
				local var_122_17 = (arg_119_1.time_ - var_122_15) / var_122_16

				if arg_119_1.var_.characterEffect1084ui_story then
					arg_119_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_15 + var_122_16 and arg_119_1.time_ < var_122_15 + var_122_16 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story then
				arg_119_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_122_18 = 0.9
			local var_122_19 = 0.0666666666666667

			if var_122_18 < arg_119_1.time_ and arg_119_1.time_ <= var_122_18 + arg_122_0 then
				local var_122_20 = "play"
				local var_122_21 = "music"

				arg_119_1:AudioAction(var_122_20, var_122_21, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_122_22 = 1
			local var_122_23 = 1

			if var_122_22 < arg_119_1.time_ and arg_119_1.time_ <= var_122_22 + arg_122_0 then
				local var_122_24 = "play"
				local var_122_25 = "music"

				arg_119_1:AudioAction(var_122_24, var_122_25, "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet.awb")
			end

			local var_122_26 = 0

			if var_122_26 < arg_119_1.time_ and arg_119_1.time_ <= var_122_26 + arg_122_0 then
				arg_119_1.fswbg_:SetActive(false)
				arg_119_1.dialog_:SetActive(false)
				arg_119_1:ShowNextGo(false)
			end

			local var_122_27 = 0

			if var_122_27 < arg_119_1.time_ and arg_119_1.time_ <= var_122_27 + arg_122_0 then
				arg_119_1.cswbg_:SetActive(false)
			end

			local var_122_28 = 0.9

			if var_122_28 < arg_119_1.time_ and arg_119_1.time_ <= var_122_28 + arg_122_0 then
				arg_119_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_122_29 = 0.9

			if var_122_29 < arg_119_1.time_ and arg_119_1.time_ <= var_122_29 + arg_122_0 then
				arg_119_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_122_30 = arg_119_1.actors_["1084ui_story"].transform
			local var_122_31 = 0.9

			if var_122_31 < arg_119_1.time_ and arg_119_1.time_ <= var_122_31 + arg_122_0 then
				arg_119_1.var_.moveOldPos1084ui_story = var_122_30.localPosition
			end

			local var_122_32 = 0.001

			if var_122_31 <= arg_119_1.time_ and arg_119_1.time_ < var_122_31 + var_122_32 then
				local var_122_33 = (arg_119_1.time_ - var_122_31) / var_122_32
				local var_122_34 = Vector3.New(0, -0.97, -6)

				var_122_30.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1084ui_story, var_122_34, var_122_33)

				local var_122_35 = manager.ui.mainCamera.transform.position - var_122_30.position

				var_122_30.forward = Vector3.New(var_122_35.x, var_122_35.y, var_122_35.z)

				local var_122_36 = var_122_30.localEulerAngles

				var_122_36.z = 0
				var_122_36.x = 0
				var_122_30.localEulerAngles = var_122_36
			end

			if arg_119_1.time_ >= var_122_31 + var_122_32 and arg_119_1.time_ < var_122_31 + var_122_32 + arg_122_0 then
				var_122_30.localPosition = Vector3.New(0, -0.97, -6)

				local var_122_37 = manager.ui.mainCamera.transform.position - var_122_30.position

				var_122_30.forward = Vector3.New(var_122_37.x, var_122_37.y, var_122_37.z)

				local var_122_38 = var_122_30.localEulerAngles

				var_122_38.z = 0
				var_122_38.x = 0
				var_122_30.localEulerAngles = var_122_38
			end

			if arg_119_1.frameCnt_ <= 1 then
				arg_119_1.dialog_:SetActive(false)
			end

			local var_122_39 = 0.9
			local var_122_40 = 0.175

			if var_122_39 < arg_119_1.time_ and arg_119_1.time_ <= var_122_39 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0

				arg_119_1.dialog_:SetActive(true)

				local var_122_41 = LeanTween.value(arg_119_1.dialog_, 0, 1, 0.3)

				var_122_41:setOnUpdate(LuaHelper.FloatAction(function(arg_123_0)
					arg_119_1.dialogCg_.alpha = arg_123_0
				end))
				var_122_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_119_1.dialog_)
					var_122_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_119_1.duration_ = arg_119_1.duration_ + 0.3

				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_42 = arg_119_1:FormatText(StoryNameCfg[6].name)

				arg_119_1.leftNameTxt_.text = var_122_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_43 = arg_119_1:GetWordFromCfg(319521029)
				local var_122_44 = arg_119_1:FormatText(var_122_43.content)

				arg_119_1.text_.text = var_122_44

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_45 = 7
				local var_122_46 = utf8.len(var_122_44)
				local var_122_47 = var_122_45 <= 0 and var_122_40 or var_122_40 * (var_122_46 / var_122_45)

				if var_122_47 > 0 and var_122_40 < var_122_47 then
					arg_119_1.talkMaxDuration = var_122_47
					var_122_39 = var_122_39 + 0.3

					if var_122_47 + var_122_39 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_47 + var_122_39
					end
				end

				arg_119_1.text_.text = var_122_44
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521029", "story_v_out_319521.awb") ~= 0 then
					local var_122_48 = manager.audio:GetVoiceLength("story_v_out_319521", "319521029", "story_v_out_319521.awb") / 1000

					if var_122_48 + var_122_39 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_48 + var_122_39
					end

					if var_122_43.prefab_name ~= "" and arg_119_1.actors_[var_122_43.prefab_name] ~= nil then
						local var_122_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_43.prefab_name].transform, "story_v_out_319521", "319521029", "story_v_out_319521.awb")

						arg_119_1:RecordAudio("319521029", var_122_49)
						arg_119_1:RecordAudio("319521029", var_122_49)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_319521", "319521029", "story_v_out_319521.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_319521", "319521029", "story_v_out_319521.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_50 = var_122_39 + 0.3
			local var_122_51 = math.max(var_122_40, arg_119_1.talkMaxDuration)

			if var_122_50 <= arg_119_1.time_ and arg_119_1.time_ < var_122_50 + var_122_51 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_50) / var_122_51

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_50 + var_122_51 and arg_119_1.time_ < var_122_50 + var_122_51 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319521030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319521030
		arg_125_1.duration_ = 10.6

		local var_125_0 = {
			zh = 6.2,
			ja = 10.6
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
				arg_125_0:Play319521031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = "4040ui_story"

			if arg_125_1.actors_[var_128_0] == nil then
				local var_128_1 = Object.Instantiate(Asset.Load("Char/" .. var_128_0), arg_125_1.stage_.transform)

				var_128_1.name = var_128_0
				var_128_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_125_1.actors_[var_128_0] = var_128_1

				local var_128_2 = var_128_1:GetComponentInChildren(typeof(CharacterEffect))

				var_128_2.enabled = true

				local var_128_3 = GameObjectTools.GetOrAddComponent(var_128_1, typeof(DynamicBoneHelper))

				if var_128_3 then
					var_128_3:EnableDynamicBone(false)
				end

				arg_125_1:ShowWeapon(var_128_2.transform, false)

				arg_125_1.var_[var_128_0 .. "Animator"] = var_128_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_125_1.var_[var_128_0 .. "Animator"].applyRootMotion = true
				arg_125_1.var_[var_128_0 .. "LipSync"] = var_128_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_128_4 = arg_125_1.actors_["4040ui_story"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect4040ui_story == nil then
				arg_125_1.var_.characterEffect4040ui_story = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.200000002980232

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect4040ui_story then
					arg_125_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect4040ui_story then
				arg_125_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_128_8 = arg_125_1.actors_["1084ui_story"]
			local var_128_9 = 0

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story == nil then
				arg_125_1.var_.characterEffect1084ui_story = var_128_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_10 = 0.200000002980232

			if var_128_9 <= arg_125_1.time_ and arg_125_1.time_ < var_128_9 + var_128_10 then
				local var_128_11 = (arg_125_1.time_ - var_128_9) / var_128_10

				if arg_125_1.var_.characterEffect1084ui_story then
					local var_128_12 = Mathf.Lerp(0, 0.5, var_128_11)

					arg_125_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1084ui_story.fillRatio = var_128_12
				end
			end

			if arg_125_1.time_ >= var_128_9 + var_128_10 and arg_125_1.time_ < var_128_9 + var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story then
				local var_128_13 = 0.5

				arg_125_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1084ui_story.fillRatio = var_128_13
			end

			local var_128_14 = arg_125_1.actors_["4040ui_story"].transform
			local var_128_15 = 0

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.var_.moveOldPos4040ui_story = var_128_14.localPosition
			end

			local var_128_16 = 0.001

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_16 then
				local var_128_17 = (arg_125_1.time_ - var_128_15) / var_128_16
				local var_128_18 = Vector3.New(0.7, -1.55, -5.5)

				var_128_14.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos4040ui_story, var_128_18, var_128_17)

				local var_128_19 = manager.ui.mainCamera.transform.position - var_128_14.position

				var_128_14.forward = Vector3.New(var_128_19.x, var_128_19.y, var_128_19.z)

				local var_128_20 = var_128_14.localEulerAngles

				var_128_20.z = 0
				var_128_20.x = 0
				var_128_14.localEulerAngles = var_128_20
			end

			if arg_125_1.time_ >= var_128_15 + var_128_16 and arg_125_1.time_ < var_128_15 + var_128_16 + arg_128_0 then
				var_128_14.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_128_21 = manager.ui.mainCamera.transform.position - var_128_14.position

				var_128_14.forward = Vector3.New(var_128_21.x, var_128_21.y, var_128_21.z)

				local var_128_22 = var_128_14.localEulerAngles

				var_128_22.z = 0
				var_128_22.x = 0
				var_128_14.localEulerAngles = var_128_22
			end

			local var_128_23 = arg_125_1.actors_["1084ui_story"].transform
			local var_128_24 = 0

			if var_128_24 < arg_125_1.time_ and arg_125_1.time_ <= var_128_24 + arg_128_0 then
				arg_125_1.var_.moveOldPos1084ui_story = var_128_23.localPosition
			end

			local var_128_25 = 0.001

			if var_128_24 <= arg_125_1.time_ and arg_125_1.time_ < var_128_24 + var_128_25 then
				local var_128_26 = (arg_125_1.time_ - var_128_24) / var_128_25
				local var_128_27 = Vector3.New(-0.7, -0.97, -6)

				var_128_23.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1084ui_story, var_128_27, var_128_26)

				local var_128_28 = manager.ui.mainCamera.transform.position - var_128_23.position

				var_128_23.forward = Vector3.New(var_128_28.x, var_128_28.y, var_128_28.z)

				local var_128_29 = var_128_23.localEulerAngles

				var_128_29.z = 0
				var_128_29.x = 0
				var_128_23.localEulerAngles = var_128_29
			end

			if arg_125_1.time_ >= var_128_24 + var_128_25 and arg_125_1.time_ < var_128_24 + var_128_25 + arg_128_0 then
				var_128_23.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_128_30 = manager.ui.mainCamera.transform.position - var_128_23.position

				var_128_23.forward = Vector3.New(var_128_30.x, var_128_30.y, var_128_30.z)

				local var_128_31 = var_128_23.localEulerAngles

				var_128_31.z = 0
				var_128_31.x = 0
				var_128_23.localEulerAngles = var_128_31
			end

			local var_128_32 = 0

			if var_128_32 < arg_125_1.time_ and arg_125_1.time_ <= var_128_32 + arg_128_0 then
				arg_125_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_128_33 = 0

			if var_128_33 < arg_125_1.time_ and arg_125_1.time_ <= var_128_33 + arg_128_0 then
				arg_125_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_128_34 = 0
			local var_128_35 = 0.725

			if var_128_34 < arg_125_1.time_ and arg_125_1.time_ <= var_128_34 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_36 = arg_125_1:FormatText(StoryNameCfg[668].name)

				arg_125_1.leftNameTxt_.text = var_128_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_37 = arg_125_1:GetWordFromCfg(319521030)
				local var_128_38 = arg_125_1:FormatText(var_128_37.content)

				arg_125_1.text_.text = var_128_38

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_39 = 29
				local var_128_40 = utf8.len(var_128_38)
				local var_128_41 = var_128_39 <= 0 and var_128_35 or var_128_35 * (var_128_40 / var_128_39)

				if var_128_41 > 0 and var_128_35 < var_128_41 then
					arg_125_1.talkMaxDuration = var_128_41

					if var_128_41 + var_128_34 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_41 + var_128_34
					end
				end

				arg_125_1.text_.text = var_128_38
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521030", "story_v_out_319521.awb") ~= 0 then
					local var_128_42 = manager.audio:GetVoiceLength("story_v_out_319521", "319521030", "story_v_out_319521.awb") / 1000

					if var_128_42 + var_128_34 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_42 + var_128_34
					end

					if var_128_37.prefab_name ~= "" and arg_125_1.actors_[var_128_37.prefab_name] ~= nil then
						local var_128_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_37.prefab_name].transform, "story_v_out_319521", "319521030", "story_v_out_319521.awb")

						arg_125_1:RecordAudio("319521030", var_128_43)
						arg_125_1:RecordAudio("319521030", var_128_43)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319521", "319521030", "story_v_out_319521.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319521", "319521030", "story_v_out_319521.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_44 = math.max(var_128_35, arg_125_1.talkMaxDuration)

			if var_128_34 <= arg_125_1.time_ and arg_125_1.time_ < var_128_34 + var_128_44 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_34) / var_128_44

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_34 + var_128_44 and arg_125_1.time_ < var_128_34 + var_128_44 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319521031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319521031
		arg_129_1.duration_ = 8.433

		local var_129_0 = {
			zh = 5.066,
			ja = 8.433
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
				arg_129_0:Play319521032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.625

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[668].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(319521031)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 25
				local var_132_6 = utf8.len(var_132_4)
				local var_132_7 = var_132_5 <= 0 and var_132_1 or var_132_1 * (var_132_6 / var_132_5)

				if var_132_7 > 0 and var_132_1 < var_132_7 then
					arg_129_1.talkMaxDuration = var_132_7

					if var_132_7 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_7 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_4
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521031", "story_v_out_319521.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521031", "story_v_out_319521.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_319521", "319521031", "story_v_out_319521.awb")

						arg_129_1:RecordAudio("319521031", var_132_9)
						arg_129_1:RecordAudio("319521031", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319521", "319521031", "story_v_out_319521.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319521", "319521031", "story_v_out_319521.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_10 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_10 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_10

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_10 and arg_129_1.time_ < var_132_0 + var_132_10 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319521032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319521032
		arg_133_1.duration_ = 6.833

		local var_133_0 = {
			zh = 3.666,
			ja = 6.833
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
				arg_133_0:Play319521033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["4040ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos4040ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0.7, -1.55, -5.5)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos4040ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["4040ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect4040ui_story == nil then
				arg_133_1.var_.characterEffect4040ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect4040ui_story then
					arg_133_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect4040ui_story then
				arg_133_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_2")
			end

			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 then
				arg_133_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_136_15 = 0
			local var_136_16 = 0.475

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_17 = arg_133_1:FormatText(StoryNameCfg[668].name)

				arg_133_1.leftNameTxt_.text = var_136_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_18 = arg_133_1:GetWordFromCfg(319521032)
				local var_136_19 = arg_133_1:FormatText(var_136_18.content)

				arg_133_1.text_.text = var_136_19

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_20 = 19
				local var_136_21 = utf8.len(var_136_19)
				local var_136_22 = var_136_20 <= 0 and var_136_16 or var_136_16 * (var_136_21 / var_136_20)

				if var_136_22 > 0 and var_136_16 < var_136_22 then
					arg_133_1.talkMaxDuration = var_136_22

					if var_136_22 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_22 + var_136_15
					end
				end

				arg_133_1.text_.text = var_136_19
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521032", "story_v_out_319521.awb") ~= 0 then
					local var_136_23 = manager.audio:GetVoiceLength("story_v_out_319521", "319521032", "story_v_out_319521.awb") / 1000

					if var_136_23 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_23 + var_136_15
					end

					if var_136_18.prefab_name ~= "" and arg_133_1.actors_[var_136_18.prefab_name] ~= nil then
						local var_136_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_18.prefab_name].transform, "story_v_out_319521", "319521032", "story_v_out_319521.awb")

						arg_133_1:RecordAudio("319521032", var_136_24)
						arg_133_1:RecordAudio("319521032", var_136_24)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319521", "319521032", "story_v_out_319521.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319521", "319521032", "story_v_out_319521.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_25 = math.max(var_136_16, arg_133_1.talkMaxDuration)

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_25 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_15) / var_136_25

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_15 + var_136_25 and arg_133_1.time_ < var_136_15 + var_136_25 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319521033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319521033
		arg_137_1.duration_ = 12.133

		local var_137_0 = {
			zh = 5,
			ja = 12.133
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
				arg_137_0:Play319521034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1084ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1084ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(-0.7, -0.97, -6)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1084ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["1084ui_story"]
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story == nil then
				arg_137_1.var_.characterEffect1084ui_story = var_140_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_11 = 0.200000002980232

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11

				if arg_137_1.var_.characterEffect1084ui_story then
					arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story then
				arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_140_13 = 0

			if var_140_13 < arg_137_1.time_ and arg_137_1.time_ <= var_140_13 + arg_140_0 then
				arg_137_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 then
				arg_137_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_15 = arg_137_1.actors_["4040ui_story"]
			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 and arg_137_1.var_.characterEffect4040ui_story == nil then
				arg_137_1.var_.characterEffect4040ui_story = var_140_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_17 = 0.200000002980232

			if var_140_16 <= arg_137_1.time_ and arg_137_1.time_ < var_140_16 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_16) / var_140_17

				if arg_137_1.var_.characterEffect4040ui_story then
					local var_140_19 = Mathf.Lerp(0, 0.5, var_140_18)

					arg_137_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_137_1.var_.characterEffect4040ui_story.fillRatio = var_140_19
				end
			end

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 and arg_137_1.var_.characterEffect4040ui_story then
				local var_140_20 = 0.5

				arg_137_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_137_1.var_.characterEffect4040ui_story.fillRatio = var_140_20
			end

			local var_140_21 = 0
			local var_140_22 = 0.6

			if var_140_21 < arg_137_1.time_ and arg_137_1.time_ <= var_140_21 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_23 = arg_137_1:FormatText(StoryNameCfg[6].name)

				arg_137_1.leftNameTxt_.text = var_140_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_24 = arg_137_1:GetWordFromCfg(319521033)
				local var_140_25 = arg_137_1:FormatText(var_140_24.content)

				arg_137_1.text_.text = var_140_25

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_26 = 24
				local var_140_27 = utf8.len(var_140_25)
				local var_140_28 = var_140_26 <= 0 and var_140_22 or var_140_22 * (var_140_27 / var_140_26)

				if var_140_28 > 0 and var_140_22 < var_140_28 then
					arg_137_1.talkMaxDuration = var_140_28

					if var_140_28 + var_140_21 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_28 + var_140_21
					end
				end

				arg_137_1.text_.text = var_140_25
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521033", "story_v_out_319521.awb") ~= 0 then
					local var_140_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521033", "story_v_out_319521.awb") / 1000

					if var_140_29 + var_140_21 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_29 + var_140_21
					end

					if var_140_24.prefab_name ~= "" and arg_137_1.actors_[var_140_24.prefab_name] ~= nil then
						local var_140_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_24.prefab_name].transform, "story_v_out_319521", "319521033", "story_v_out_319521.awb")

						arg_137_1:RecordAudio("319521033", var_140_30)
						arg_137_1:RecordAudio("319521033", var_140_30)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319521", "319521033", "story_v_out_319521.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319521", "319521033", "story_v_out_319521.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_31 = math.max(var_140_22, arg_137_1.talkMaxDuration)

			if var_140_21 <= arg_137_1.time_ and arg_137_1.time_ < var_140_21 + var_140_31 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_21) / var_140_31

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_21 + var_140_31 and arg_137_1.time_ < var_140_21 + var_140_31 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319521034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319521034
		arg_141_1.duration_ = 3.5

		local var_141_0 = {
			zh = 1.566,
			ja = 3.5
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
				arg_141_0:Play319521035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1084ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story == nil then
				arg_141_1.var_.characterEffect1084ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1084ui_story then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1084ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1084ui_story.fillRatio = var_144_5
			end

			local var_144_6 = arg_141_1.actors_["4040ui_story"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and arg_141_1.var_.characterEffect4040ui_story == nil then
				arg_141_1.var_.characterEffect4040ui_story = var_144_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_8 = 0.200000002980232

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.characterEffect4040ui_story then
					arg_141_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.characterEffect4040ui_story then
				arg_141_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_144_10 = 0
			local var_144_11 = 0.2

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_12 = arg_141_1:FormatText(StoryNameCfg[668].name)

				arg_141_1.leftNameTxt_.text = var_144_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_13 = arg_141_1:GetWordFromCfg(319521034)
				local var_144_14 = arg_141_1:FormatText(var_144_13.content)

				arg_141_1.text_.text = var_144_14

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_15 = 8
				local var_144_16 = utf8.len(var_144_14)
				local var_144_17 = var_144_15 <= 0 and var_144_11 or var_144_11 * (var_144_16 / var_144_15)

				if var_144_17 > 0 and var_144_11 < var_144_17 then
					arg_141_1.talkMaxDuration = var_144_17

					if var_144_17 + var_144_10 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_17 + var_144_10
					end
				end

				arg_141_1.text_.text = var_144_14
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521034", "story_v_out_319521.awb") ~= 0 then
					local var_144_18 = manager.audio:GetVoiceLength("story_v_out_319521", "319521034", "story_v_out_319521.awb") / 1000

					if var_144_18 + var_144_10 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_18 + var_144_10
					end

					if var_144_13.prefab_name ~= "" and arg_141_1.actors_[var_144_13.prefab_name] ~= nil then
						local var_144_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_13.prefab_name].transform, "story_v_out_319521", "319521034", "story_v_out_319521.awb")

						arg_141_1:RecordAudio("319521034", var_144_19)
						arg_141_1:RecordAudio("319521034", var_144_19)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319521", "319521034", "story_v_out_319521.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319521", "319521034", "story_v_out_319521.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_20 = math.max(var_144_11, arg_141_1.talkMaxDuration)

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_20 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_10) / var_144_20

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_10 + var_144_20 and arg_141_1.time_ < var_144_10 + var_144_20 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319521035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319521035
		arg_145_1.duration_ = 1.999999999999

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319521036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["4040ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect4040ui_story == nil then
				arg_145_1.var_.characterEffect4040ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect4040ui_story then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_145_1.var_.characterEffect4040ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect4040ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_145_1.var_.characterEffect4040ui_story.fillRatio = var_148_5
			end

			local var_148_6 = arg_145_1.actors_["1084ui_story"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story == nil then
				arg_145_1.var_.characterEffect1084ui_story = var_148_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_8 = 0.200000002980232

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.characterEffect1084ui_story then
					arg_145_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story then
				arg_145_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 then
				arg_145_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_148_11 = 0
			local var_148_12 = 0.05

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_13 = arg_145_1:FormatText(StoryNameCfg[6].name)

				arg_145_1.leftNameTxt_.text = var_148_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_14 = arg_145_1:GetWordFromCfg(319521035)
				local var_148_15 = arg_145_1:FormatText(var_148_14.content)

				arg_145_1.text_.text = var_148_15

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_16 = 2
				local var_148_17 = utf8.len(var_148_15)
				local var_148_18 = var_148_16 <= 0 and var_148_12 or var_148_12 * (var_148_17 / var_148_16)

				if var_148_18 > 0 and var_148_12 < var_148_18 then
					arg_145_1.talkMaxDuration = var_148_18

					if var_148_18 + var_148_11 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_18 + var_148_11
					end
				end

				arg_145_1.text_.text = var_148_15
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521035", "story_v_out_319521.awb") ~= 0 then
					local var_148_19 = manager.audio:GetVoiceLength("story_v_out_319521", "319521035", "story_v_out_319521.awb") / 1000

					if var_148_19 + var_148_11 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_11
					end

					if var_148_14.prefab_name ~= "" and arg_145_1.actors_[var_148_14.prefab_name] ~= nil then
						local var_148_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_14.prefab_name].transform, "story_v_out_319521", "319521035", "story_v_out_319521.awb")

						arg_145_1:RecordAudio("319521035", var_148_20)
						arg_145_1:RecordAudio("319521035", var_148_20)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_319521", "319521035", "story_v_out_319521.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_319521", "319521035", "story_v_out_319521.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_21 = math.max(var_148_12, arg_145_1.talkMaxDuration)

			if var_148_11 <= arg_145_1.time_ and arg_145_1.time_ < var_148_11 + var_148_21 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_11) / var_148_21

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_11 + var_148_21 and arg_145_1.time_ < var_148_11 + var_148_21 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319521036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319521036
		arg_149_1.duration_ = 5.233

		local var_149_0 = {
			zh = 3.133,
			ja = 5.233
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
				arg_149_0:Play319521037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["4040ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos4040ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0.7, -1.55, -5.5)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos4040ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["4040ui_story"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and arg_149_1.var_.characterEffect4040ui_story == nil then
				arg_149_1.var_.characterEffect4040ui_story = var_152_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_11 = 0.200000002980232

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.characterEffect4040ui_story then
					arg_149_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and arg_149_1.var_.characterEffect4040ui_story then
				arg_149_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_152_13 = 0

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_152_14 = 0

			if var_152_14 < arg_149_1.time_ and arg_149_1.time_ <= var_152_14 + arg_152_0 then
				arg_149_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_15 = arg_149_1.actors_["1084ui_story"]
			local var_152_16 = 0

			if var_152_16 < arg_149_1.time_ and arg_149_1.time_ <= var_152_16 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story == nil then
				arg_149_1.var_.characterEffect1084ui_story = var_152_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_17 = 0.200000002980232

			if var_152_16 <= arg_149_1.time_ and arg_149_1.time_ < var_152_16 + var_152_17 then
				local var_152_18 = (arg_149_1.time_ - var_152_16) / var_152_17

				if arg_149_1.var_.characterEffect1084ui_story then
					local var_152_19 = Mathf.Lerp(0, 0.5, var_152_18)

					arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_19
				end
			end

			if arg_149_1.time_ >= var_152_16 + var_152_17 and arg_149_1.time_ < var_152_16 + var_152_17 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story then
				local var_152_20 = 0.5

				arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_20
			end

			local var_152_21 = 0
			local var_152_22 = 0.325

			if var_152_21 < arg_149_1.time_ and arg_149_1.time_ <= var_152_21 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_23 = arg_149_1:FormatText(StoryNameCfg[668].name)

				arg_149_1.leftNameTxt_.text = var_152_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_24 = arg_149_1:GetWordFromCfg(319521036)
				local var_152_25 = arg_149_1:FormatText(var_152_24.content)

				arg_149_1.text_.text = var_152_25

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_26 = 13
				local var_152_27 = utf8.len(var_152_25)
				local var_152_28 = var_152_26 <= 0 and var_152_22 or var_152_22 * (var_152_27 / var_152_26)

				if var_152_28 > 0 and var_152_22 < var_152_28 then
					arg_149_1.talkMaxDuration = var_152_28

					if var_152_28 + var_152_21 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_28 + var_152_21
					end
				end

				arg_149_1.text_.text = var_152_25
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521036", "story_v_out_319521.awb") ~= 0 then
					local var_152_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521036", "story_v_out_319521.awb") / 1000

					if var_152_29 + var_152_21 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_29 + var_152_21
					end

					if var_152_24.prefab_name ~= "" and arg_149_1.actors_[var_152_24.prefab_name] ~= nil then
						local var_152_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_24.prefab_name].transform, "story_v_out_319521", "319521036", "story_v_out_319521.awb")

						arg_149_1:RecordAudio("319521036", var_152_30)
						arg_149_1:RecordAudio("319521036", var_152_30)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319521", "319521036", "story_v_out_319521.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319521", "319521036", "story_v_out_319521.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_31 = math.max(var_152_22, arg_149_1.talkMaxDuration)

			if var_152_21 <= arg_149_1.time_ and arg_149_1.time_ < var_152_21 + var_152_31 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_21) / var_152_31

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_21 + var_152_31 and arg_149_1.time_ < var_152_21 + var_152_31 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319521037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319521037
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play319521038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["4040ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect4040ui_story == nil then
				arg_153_1.var_.characterEffect4040ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect4040ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_153_1.var_.characterEffect4040ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect4040ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_153_1.var_.characterEffect4040ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0
			local var_156_7 = 1

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_8 = arg_153_1:GetWordFromCfg(319521037)
				local var_156_9 = arg_153_1:FormatText(var_156_8.content)

				arg_153_1.text_.text = var_156_9

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_10 = 40
				local var_156_11 = utf8.len(var_156_9)
				local var_156_12 = var_156_10 <= 0 and var_156_7 or var_156_7 * (var_156_11 / var_156_10)

				if var_156_12 > 0 and var_156_7 < var_156_12 then
					arg_153_1.talkMaxDuration = var_156_12

					if var_156_12 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_12 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_9
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_13 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_13 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_13

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_13 and arg_153_1.time_ < var_156_6 + var_156_13 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319521038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319521038
		arg_157_1.duration_ = 7.266

		local var_157_0 = {
			zh = 6.366,
			ja = 7.266
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
				arg_157_0:Play319521039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["4040ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect4040ui_story == nil then
				arg_157_1.var_.characterEffect4040ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect4040ui_story then
					arg_157_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect4040ui_story then
				arg_157_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_160_4 = 0

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_1")
			end

			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 then
				arg_157_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_160_6 = 0
			local var_160_7 = 0.625

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_8 = arg_157_1:FormatText(StoryNameCfg[668].name)

				arg_157_1.leftNameTxt_.text = var_160_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_9 = arg_157_1:GetWordFromCfg(319521038)
				local var_160_10 = arg_157_1:FormatText(var_160_9.content)

				arg_157_1.text_.text = var_160_10

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_11 = 25
				local var_160_12 = utf8.len(var_160_10)
				local var_160_13 = var_160_11 <= 0 and var_160_7 or var_160_7 * (var_160_12 / var_160_11)

				if var_160_13 > 0 and var_160_7 < var_160_13 then
					arg_157_1.talkMaxDuration = var_160_13

					if var_160_13 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_10
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521038", "story_v_out_319521.awb") ~= 0 then
					local var_160_14 = manager.audio:GetVoiceLength("story_v_out_319521", "319521038", "story_v_out_319521.awb") / 1000

					if var_160_14 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_14 + var_160_6
					end

					if var_160_9.prefab_name ~= "" and arg_157_1.actors_[var_160_9.prefab_name] ~= nil then
						local var_160_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_9.prefab_name].transform, "story_v_out_319521", "319521038", "story_v_out_319521.awb")

						arg_157_1:RecordAudio("319521038", var_160_15)
						arg_157_1:RecordAudio("319521038", var_160_15)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_319521", "319521038", "story_v_out_319521.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_319521", "319521038", "story_v_out_319521.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_16 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_16 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_16

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_16 and arg_157_1.time_ < var_160_6 + var_160_16 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319521039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319521039
		arg_161_1.duration_ = 5.733

		local var_161_0 = {
			zh = 3.666,
			ja = 5.733
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
				arg_161_0:Play319521040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.375

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[668].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(319521039)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 15
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521039", "story_v_out_319521.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521039", "story_v_out_319521.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_319521", "319521039", "story_v_out_319521.awb")

						arg_161_1:RecordAudio("319521039", var_164_9)
						arg_161_1:RecordAudio("319521039", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_319521", "319521039", "story_v_out_319521.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_319521", "319521039", "story_v_out_319521.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319521040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319521040
		arg_165_1.duration_ = 6.633

		local var_165_0 = {
			zh = 2.533,
			ja = 6.633
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
				arg_165_0:Play319521041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1084ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1084ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(-0.7, -0.97, -6)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1084ui_story, var_168_4, var_168_3)

				local var_168_5 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_5.x, var_168_5.y, var_168_5.z)

				local var_168_6 = var_168_0.localEulerAngles

				var_168_6.z = 0
				var_168_6.x = 0
				var_168_0.localEulerAngles = var_168_6
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_168_7 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_7.x, var_168_7.y, var_168_7.z)

				local var_168_8 = var_168_0.localEulerAngles

				var_168_8.z = 0
				var_168_8.x = 0
				var_168_0.localEulerAngles = var_168_8
			end

			local var_168_9 = arg_165_1.actors_["1084ui_story"]
			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 and arg_165_1.var_.characterEffect1084ui_story == nil then
				arg_165_1.var_.characterEffect1084ui_story = var_168_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_11 = 0.200000002980232

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_11 then
				local var_168_12 = (arg_165_1.time_ - var_168_10) / var_168_11

				if arg_165_1.var_.characterEffect1084ui_story then
					arg_165_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_10 + var_168_11 and arg_165_1.time_ < var_168_10 + var_168_11 + arg_168_0 and arg_165_1.var_.characterEffect1084ui_story then
				arg_165_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_168_13 = 0

			if var_168_13 < arg_165_1.time_ and arg_165_1.time_ <= var_168_13 + arg_168_0 then
				arg_165_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_168_14 = 0

			if var_168_14 < arg_165_1.time_ and arg_165_1.time_ <= var_168_14 + arg_168_0 then
				arg_165_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_168_15 = arg_165_1.actors_["4040ui_story"]
			local var_168_16 = 0

			if var_168_16 < arg_165_1.time_ and arg_165_1.time_ <= var_168_16 + arg_168_0 and arg_165_1.var_.characterEffect4040ui_story == nil then
				arg_165_1.var_.characterEffect4040ui_story = var_168_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_17 = 0.200000002980232

			if var_168_16 <= arg_165_1.time_ and arg_165_1.time_ < var_168_16 + var_168_17 then
				local var_168_18 = (arg_165_1.time_ - var_168_16) / var_168_17

				if arg_165_1.var_.characterEffect4040ui_story then
					local var_168_19 = Mathf.Lerp(0, 0.5, var_168_18)

					arg_165_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_165_1.var_.characterEffect4040ui_story.fillRatio = var_168_19
				end
			end

			if arg_165_1.time_ >= var_168_16 + var_168_17 and arg_165_1.time_ < var_168_16 + var_168_17 + arg_168_0 and arg_165_1.var_.characterEffect4040ui_story then
				local var_168_20 = 0.5

				arg_165_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_165_1.var_.characterEffect4040ui_story.fillRatio = var_168_20
			end

			local var_168_21 = 0
			local var_168_22 = 0.3

			if var_168_21 < arg_165_1.time_ and arg_165_1.time_ <= var_168_21 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_23 = arg_165_1:FormatText(StoryNameCfg[6].name)

				arg_165_1.leftNameTxt_.text = var_168_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_24 = arg_165_1:GetWordFromCfg(319521040)
				local var_168_25 = arg_165_1:FormatText(var_168_24.content)

				arg_165_1.text_.text = var_168_25

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_26 = 12
				local var_168_27 = utf8.len(var_168_25)
				local var_168_28 = var_168_26 <= 0 and var_168_22 or var_168_22 * (var_168_27 / var_168_26)

				if var_168_28 > 0 and var_168_22 < var_168_28 then
					arg_165_1.talkMaxDuration = var_168_28

					if var_168_28 + var_168_21 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_28 + var_168_21
					end
				end

				arg_165_1.text_.text = var_168_25
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521040", "story_v_out_319521.awb") ~= 0 then
					local var_168_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521040", "story_v_out_319521.awb") / 1000

					if var_168_29 + var_168_21 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_29 + var_168_21
					end

					if var_168_24.prefab_name ~= "" and arg_165_1.actors_[var_168_24.prefab_name] ~= nil then
						local var_168_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_24.prefab_name].transform, "story_v_out_319521", "319521040", "story_v_out_319521.awb")

						arg_165_1:RecordAudio("319521040", var_168_30)
						arg_165_1:RecordAudio("319521040", var_168_30)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_319521", "319521040", "story_v_out_319521.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_319521", "319521040", "story_v_out_319521.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_31 = math.max(var_168_22, arg_165_1.talkMaxDuration)

			if var_168_21 <= arg_165_1.time_ and arg_165_1.time_ < var_168_21 + var_168_31 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_21) / var_168_31

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_21 + var_168_31 and arg_165_1.time_ < var_168_21 + var_168_31 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play319521041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319521041
		arg_169_1.duration_ = 5.833

		local var_169_0 = {
			zh = 5.833,
			ja = 5.4
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
				arg_169_0:Play319521042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["4040ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos4040ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0.7, -1.55, -5.5)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos4040ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["4040ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect4040ui_story == nil then
				arg_169_1.var_.characterEffect4040ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect4040ui_story then
					arg_169_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect4040ui_story then
				arg_169_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_172_13 = 0

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_2")
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_15 = arg_169_1.actors_["1084ui_story"]
			local var_172_16 = 0

			if var_172_16 < arg_169_1.time_ and arg_169_1.time_ <= var_172_16 + arg_172_0 and arg_169_1.var_.characterEffect1084ui_story == nil then
				arg_169_1.var_.characterEffect1084ui_story = var_172_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_17 = 0.200000002980232

			if var_172_16 <= arg_169_1.time_ and arg_169_1.time_ < var_172_16 + var_172_17 then
				local var_172_18 = (arg_169_1.time_ - var_172_16) / var_172_17

				if arg_169_1.var_.characterEffect1084ui_story then
					local var_172_19 = Mathf.Lerp(0, 0.5, var_172_18)

					arg_169_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1084ui_story.fillRatio = var_172_19
				end
			end

			if arg_169_1.time_ >= var_172_16 + var_172_17 and arg_169_1.time_ < var_172_16 + var_172_17 + arg_172_0 and arg_169_1.var_.characterEffect1084ui_story then
				local var_172_20 = 0.5

				arg_169_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1084ui_story.fillRatio = var_172_20
			end

			local var_172_21 = 0
			local var_172_22 = 0.7

			if var_172_21 < arg_169_1.time_ and arg_169_1.time_ <= var_172_21 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_23 = arg_169_1:FormatText(StoryNameCfg[668].name)

				arg_169_1.leftNameTxt_.text = var_172_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_24 = arg_169_1:GetWordFromCfg(319521041)
				local var_172_25 = arg_169_1:FormatText(var_172_24.content)

				arg_169_1.text_.text = var_172_25

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_26 = 28
				local var_172_27 = utf8.len(var_172_25)
				local var_172_28 = var_172_26 <= 0 and var_172_22 or var_172_22 * (var_172_27 / var_172_26)

				if var_172_28 > 0 and var_172_22 < var_172_28 then
					arg_169_1.talkMaxDuration = var_172_28

					if var_172_28 + var_172_21 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_28 + var_172_21
					end
				end

				arg_169_1.text_.text = var_172_25
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521041", "story_v_out_319521.awb") ~= 0 then
					local var_172_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521041", "story_v_out_319521.awb") / 1000

					if var_172_29 + var_172_21 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_29 + var_172_21
					end

					if var_172_24.prefab_name ~= "" and arg_169_1.actors_[var_172_24.prefab_name] ~= nil then
						local var_172_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_24.prefab_name].transform, "story_v_out_319521", "319521041", "story_v_out_319521.awb")

						arg_169_1:RecordAudio("319521041", var_172_30)
						arg_169_1:RecordAudio("319521041", var_172_30)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_319521", "319521041", "story_v_out_319521.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_319521", "319521041", "story_v_out_319521.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_31 = math.max(var_172_22, arg_169_1.talkMaxDuration)

			if var_172_21 <= arg_169_1.time_ and arg_169_1.time_ < var_172_21 + var_172_31 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_21) / var_172_31

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_21 + var_172_31 and arg_169_1.time_ < var_172_21 + var_172_31 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319521042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319521042
		arg_173_1.duration_ = 6.733

		local var_173_0 = {
			zh = 3.1,
			ja = 6.733
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
				arg_173_0:Play319521043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.4

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[668].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(319521042)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 16
				local var_176_6 = utf8.len(var_176_4)
				local var_176_7 = var_176_5 <= 0 and var_176_1 or var_176_1 * (var_176_6 / var_176_5)

				if var_176_7 > 0 and var_176_1 < var_176_7 then
					arg_173_1.talkMaxDuration = var_176_7

					if var_176_7 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_7 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_4
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521042", "story_v_out_319521.awb") ~= 0 then
					local var_176_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521042", "story_v_out_319521.awb") / 1000

					if var_176_8 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_0
					end

					if var_176_3.prefab_name ~= "" and arg_173_1.actors_[var_176_3.prefab_name] ~= nil then
						local var_176_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_3.prefab_name].transform, "story_v_out_319521", "319521042", "story_v_out_319521.awb")

						arg_173_1:RecordAudio("319521042", var_176_9)
						arg_173_1:RecordAudio("319521042", var_176_9)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319521", "319521042", "story_v_out_319521.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319521", "319521042", "story_v_out_319521.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_10 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_10 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_10

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_10 and arg_173_1.time_ < var_176_0 + var_176_10 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319521043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319521043
		arg_177_1.duration_ = 11.6

		local var_177_0 = {
			zh = 3,
			ja = 11.6
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
				arg_177_0:Play319521044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["4040ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect4040ui_story == nil then
				arg_177_1.var_.characterEffect4040ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect4040ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_177_1.var_.characterEffect4040ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect4040ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_177_1.var_.characterEffect4040ui_story.fillRatio = var_180_5
			end

			local var_180_6 = arg_177_1.actors_["1084ui_story"]
			local var_180_7 = 0

			if var_180_7 < arg_177_1.time_ and arg_177_1.time_ <= var_180_7 + arg_180_0 and arg_177_1.var_.characterEffect1084ui_story == nil then
				arg_177_1.var_.characterEffect1084ui_story = var_180_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_8 = 0.200000002980232

			if var_180_7 <= arg_177_1.time_ and arg_177_1.time_ < var_180_7 + var_180_8 then
				local var_180_9 = (arg_177_1.time_ - var_180_7) / var_180_8

				if arg_177_1.var_.characterEffect1084ui_story then
					arg_177_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_7 + var_180_8 and arg_177_1.time_ < var_180_7 + var_180_8 + arg_180_0 and arg_177_1.var_.characterEffect1084ui_story then
				arg_177_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_180_10 = 0

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 then
				arg_177_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_180_11 = 0
			local var_180_12 = 0.325

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_13 = arg_177_1:FormatText(StoryNameCfg[6].name)

				arg_177_1.leftNameTxt_.text = var_180_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_14 = arg_177_1:GetWordFromCfg(319521043)
				local var_180_15 = arg_177_1:FormatText(var_180_14.content)

				arg_177_1.text_.text = var_180_15

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_16 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521043", "story_v_out_319521.awb") ~= 0 then
					local var_180_19 = manager.audio:GetVoiceLength("story_v_out_319521", "319521043", "story_v_out_319521.awb") / 1000

					if var_180_19 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_11
					end

					if var_180_14.prefab_name ~= "" and arg_177_1.actors_[var_180_14.prefab_name] ~= nil then
						local var_180_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_14.prefab_name].transform, "story_v_out_319521", "319521043", "story_v_out_319521.awb")

						arg_177_1:RecordAudio("319521043", var_180_20)
						arg_177_1:RecordAudio("319521043", var_180_20)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_319521", "319521043", "story_v_out_319521.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_319521", "319521043", "story_v_out_319521.awb")
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
	Play319521044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319521044
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319521045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1084ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1084ui_story == nil then
				arg_181_1.var_.characterEffect1084ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1084ui_story then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1084ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1084ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1084ui_story.fillRatio = var_184_5
			end

			local var_184_6 = 0
			local var_184_7 = 1.425

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_8 = arg_181_1:GetWordFromCfg(319521044)
				local var_184_9 = arg_181_1:FormatText(var_184_8.content)

				arg_181_1.text_.text = var_184_9

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_10 = 57
				local var_184_11 = utf8.len(var_184_9)
				local var_184_12 = var_184_10 <= 0 and var_184_7 or var_184_7 * (var_184_11 / var_184_10)

				if var_184_12 > 0 and var_184_7 < var_184_12 then
					arg_181_1.talkMaxDuration = var_184_12

					if var_184_12 + var_184_6 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_12 + var_184_6
					end
				end

				arg_181_1.text_.text = var_184_9
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_13 = math.max(var_184_7, arg_181_1.talkMaxDuration)

			if var_184_6 <= arg_181_1.time_ and arg_181_1.time_ < var_184_6 + var_184_13 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_6) / var_184_13

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_6 + var_184_13 and arg_181_1.time_ < var_184_6 + var_184_13 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319521045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319521045
		arg_185_1.duration_ = 6.233

		local var_185_0 = {
			zh = 4.066,
			ja = 6.233
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
				arg_185_0:Play319521046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["4040ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos4040ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0.7, -1.55, -5.5)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos4040ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["4040ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect4040ui_story == nil then
				arg_185_1.var_.characterEffect4040ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect4040ui_story then
					arg_185_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect4040ui_story then
				arg_185_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 then
				arg_185_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_188_15 = 0
			local var_188_16 = 0.55

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_17 = arg_185_1:FormatText(StoryNameCfg[668].name)

				arg_185_1.leftNameTxt_.text = var_188_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_18 = arg_185_1:GetWordFromCfg(319521045)
				local var_188_19 = arg_185_1:FormatText(var_188_18.content)

				arg_185_1.text_.text = var_188_19

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_20 = 22
				local var_188_21 = utf8.len(var_188_19)
				local var_188_22 = var_188_20 <= 0 and var_188_16 or var_188_16 * (var_188_21 / var_188_20)

				if var_188_22 > 0 and var_188_16 < var_188_22 then
					arg_185_1.talkMaxDuration = var_188_22

					if var_188_22 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_22 + var_188_15
					end
				end

				arg_185_1.text_.text = var_188_19
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521045", "story_v_out_319521.awb") ~= 0 then
					local var_188_23 = manager.audio:GetVoiceLength("story_v_out_319521", "319521045", "story_v_out_319521.awb") / 1000

					if var_188_23 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_23 + var_188_15
					end

					if var_188_18.prefab_name ~= "" and arg_185_1.actors_[var_188_18.prefab_name] ~= nil then
						local var_188_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_18.prefab_name].transform, "story_v_out_319521", "319521045", "story_v_out_319521.awb")

						arg_185_1:RecordAudio("319521045", var_188_24)
						arg_185_1:RecordAudio("319521045", var_188_24)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319521", "319521045", "story_v_out_319521.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319521", "319521045", "story_v_out_319521.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_25 = math.max(var_188_16, arg_185_1.talkMaxDuration)

			if var_188_15 <= arg_185_1.time_ and arg_185_1.time_ < var_188_15 + var_188_25 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_15) / var_188_25

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_15 + var_188_25 and arg_185_1.time_ < var_188_15 + var_188_25 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319521046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319521046
		arg_189_1.duration_ = 3.733

		local var_189_0 = {
			zh = 1.333,
			ja = 3.733
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
				arg_189_0:Play319521047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1084ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1084ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(-0.7, -0.97, -6)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1084ui_story, var_192_4, var_192_3)

				local var_192_5 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_5.x, var_192_5.y, var_192_5.z)

				local var_192_6 = var_192_0.localEulerAngles

				var_192_6.z = 0
				var_192_6.x = 0
				var_192_0.localEulerAngles = var_192_6
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_192_7 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_7.x, var_192_7.y, var_192_7.z)

				local var_192_8 = var_192_0.localEulerAngles

				var_192_8.z = 0
				var_192_8.x = 0
				var_192_0.localEulerAngles = var_192_8
			end

			local var_192_9 = arg_189_1.actors_["1084ui_story"]
			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 and arg_189_1.var_.characterEffect1084ui_story == nil then
				arg_189_1.var_.characterEffect1084ui_story = var_192_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_11 = 0.200000002980232

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_11 then
				local var_192_12 = (arg_189_1.time_ - var_192_10) / var_192_11

				if arg_189_1.var_.characterEffect1084ui_story then
					arg_189_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 and arg_189_1.var_.characterEffect1084ui_story then
				arg_189_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_192_13 = 0

			if var_192_13 < arg_189_1.time_ and arg_189_1.time_ <= var_192_13 + arg_192_0 then
				arg_189_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_192_14 = 0

			if var_192_14 < arg_189_1.time_ and arg_189_1.time_ <= var_192_14 + arg_192_0 then
				arg_189_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_192_15 = arg_189_1.actors_["4040ui_story"]
			local var_192_16 = 0

			if var_192_16 < arg_189_1.time_ and arg_189_1.time_ <= var_192_16 + arg_192_0 and arg_189_1.var_.characterEffect4040ui_story == nil then
				arg_189_1.var_.characterEffect4040ui_story = var_192_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_17 = 0.200000002980232

			if var_192_16 <= arg_189_1.time_ and arg_189_1.time_ < var_192_16 + var_192_17 then
				local var_192_18 = (arg_189_1.time_ - var_192_16) / var_192_17

				if arg_189_1.var_.characterEffect4040ui_story then
					local var_192_19 = Mathf.Lerp(0, 0.5, var_192_18)

					arg_189_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_189_1.var_.characterEffect4040ui_story.fillRatio = var_192_19
				end
			end

			if arg_189_1.time_ >= var_192_16 + var_192_17 and arg_189_1.time_ < var_192_16 + var_192_17 + arg_192_0 and arg_189_1.var_.characterEffect4040ui_story then
				local var_192_20 = 0.5

				arg_189_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_189_1.var_.characterEffect4040ui_story.fillRatio = var_192_20
			end

			local var_192_21 = 0
			local var_192_22 = 0.125

			if var_192_21 < arg_189_1.time_ and arg_189_1.time_ <= var_192_21 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_23 = arg_189_1:FormatText(StoryNameCfg[6].name)

				arg_189_1.leftNameTxt_.text = var_192_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_24 = arg_189_1:GetWordFromCfg(319521046)
				local var_192_25 = arg_189_1:FormatText(var_192_24.content)

				arg_189_1.text_.text = var_192_25

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_26 = 5
				local var_192_27 = utf8.len(var_192_25)
				local var_192_28 = var_192_26 <= 0 and var_192_22 or var_192_22 * (var_192_27 / var_192_26)

				if var_192_28 > 0 and var_192_22 < var_192_28 then
					arg_189_1.talkMaxDuration = var_192_28

					if var_192_28 + var_192_21 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_28 + var_192_21
					end
				end

				arg_189_1.text_.text = var_192_25
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521046", "story_v_out_319521.awb") ~= 0 then
					local var_192_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521046", "story_v_out_319521.awb") / 1000

					if var_192_29 + var_192_21 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_29 + var_192_21
					end

					if var_192_24.prefab_name ~= "" and arg_189_1.actors_[var_192_24.prefab_name] ~= nil then
						local var_192_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_24.prefab_name].transform, "story_v_out_319521", "319521046", "story_v_out_319521.awb")

						arg_189_1:RecordAudio("319521046", var_192_30)
						arg_189_1:RecordAudio("319521046", var_192_30)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319521", "319521046", "story_v_out_319521.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319521", "319521046", "story_v_out_319521.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_31 = math.max(var_192_22, arg_189_1.talkMaxDuration)

			if var_192_21 <= arg_189_1.time_ and arg_189_1.time_ < var_192_21 + var_192_31 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_21) / var_192_31

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_21 + var_192_31 and arg_189_1.time_ < var_192_21 + var_192_31 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319521047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319521047
		arg_193_1.duration_ = 11.133

		local var_193_0 = {
			zh = 1.999999999999,
			ja = 11.133
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
				arg_193_0:Play319521048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1084ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect1084ui_story == nil then
				arg_193_1.var_.characterEffect1084ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect1084ui_story then
					local var_196_4 = Mathf.Lerp(0, 0.5, var_196_3)

					arg_193_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1084ui_story.fillRatio = var_196_4
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect1084ui_story then
				local var_196_5 = 0.5

				arg_193_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1084ui_story.fillRatio = var_196_5
			end

			local var_196_6 = arg_193_1.actors_["4040ui_story"]
			local var_196_7 = 0

			if var_196_7 < arg_193_1.time_ and arg_193_1.time_ <= var_196_7 + arg_196_0 and arg_193_1.var_.characterEffect4040ui_story == nil then
				arg_193_1.var_.characterEffect4040ui_story = var_196_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_8 = 0.200000002980232

			if var_196_7 <= arg_193_1.time_ and arg_193_1.time_ < var_196_7 + var_196_8 then
				local var_196_9 = (arg_193_1.time_ - var_196_7) / var_196_8

				if arg_193_1.var_.characterEffect4040ui_story then
					arg_193_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_7 + var_196_8 and arg_193_1.time_ < var_196_7 + var_196_8 + arg_196_0 and arg_193_1.var_.characterEffect4040ui_story then
				arg_193_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 then
				arg_193_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_196_11 = 0

			if var_196_11 < arg_193_1.time_ and arg_193_1.time_ <= var_196_11 + arg_196_0 then
				arg_193_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_196_12 = 0
			local var_196_13 = 0.25

			if var_196_12 < arg_193_1.time_ and arg_193_1.time_ <= var_196_12 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_14 = arg_193_1:FormatText(StoryNameCfg[668].name)

				arg_193_1.leftNameTxt_.text = var_196_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_15 = arg_193_1:GetWordFromCfg(319521047)
				local var_196_16 = arg_193_1:FormatText(var_196_15.content)

				arg_193_1.text_.text = var_196_16

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_17 = 10
				local var_196_18 = utf8.len(var_196_16)
				local var_196_19 = var_196_17 <= 0 and var_196_13 or var_196_13 * (var_196_18 / var_196_17)

				if var_196_19 > 0 and var_196_13 < var_196_19 then
					arg_193_1.talkMaxDuration = var_196_19

					if var_196_19 + var_196_12 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_19 + var_196_12
					end
				end

				arg_193_1.text_.text = var_196_16
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521047", "story_v_out_319521.awb") ~= 0 then
					local var_196_20 = manager.audio:GetVoiceLength("story_v_out_319521", "319521047", "story_v_out_319521.awb") / 1000

					if var_196_20 + var_196_12 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_20 + var_196_12
					end

					if var_196_15.prefab_name ~= "" and arg_193_1.actors_[var_196_15.prefab_name] ~= nil then
						local var_196_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_15.prefab_name].transform, "story_v_out_319521", "319521047", "story_v_out_319521.awb")

						arg_193_1:RecordAudio("319521047", var_196_21)
						arg_193_1:RecordAudio("319521047", var_196_21)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_319521", "319521047", "story_v_out_319521.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_319521", "319521047", "story_v_out_319521.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_22 = math.max(var_196_13, arg_193_1.talkMaxDuration)

			if var_196_12 <= arg_193_1.time_ and arg_193_1.time_ < var_196_12 + var_196_22 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_12) / var_196_22

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_12 + var_196_22 and arg_193_1.time_ < var_196_12 + var_196_22 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319521048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319521048
		arg_197_1.duration_ = 7.966

		local var_197_0 = {
			zh = 4.566,
			ja = 7.966
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
				arg_197_0:Play319521049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["4040ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect4040ui_story == nil then
				arg_197_1.var_.characterEffect4040ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect4040ui_story then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_197_1.var_.characterEffect4040ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect4040ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_197_1.var_.characterEffect4040ui_story.fillRatio = var_200_5
			end

			local var_200_6 = arg_197_1.actors_["1084ui_story"]
			local var_200_7 = 0

			if var_200_7 < arg_197_1.time_ and arg_197_1.time_ <= var_200_7 + arg_200_0 and arg_197_1.var_.characterEffect1084ui_story == nil then
				arg_197_1.var_.characterEffect1084ui_story = var_200_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_8 = 0.200000002980232

			if var_200_7 <= arg_197_1.time_ and arg_197_1.time_ < var_200_7 + var_200_8 then
				local var_200_9 = (arg_197_1.time_ - var_200_7) / var_200_8

				if arg_197_1.var_.characterEffect1084ui_story then
					arg_197_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_7 + var_200_8 and arg_197_1.time_ < var_200_7 + var_200_8 + arg_200_0 and arg_197_1.var_.characterEffect1084ui_story then
				arg_197_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_200_10 = 0
			local var_200_11 = 0.65

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_12 = arg_197_1:FormatText(StoryNameCfg[6].name)

				arg_197_1.leftNameTxt_.text = var_200_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_13 = arg_197_1:GetWordFromCfg(319521048)
				local var_200_14 = arg_197_1:FormatText(var_200_13.content)

				arg_197_1.text_.text = var_200_14

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_15 = 26
				local var_200_16 = utf8.len(var_200_14)
				local var_200_17 = var_200_15 <= 0 and var_200_11 or var_200_11 * (var_200_16 / var_200_15)

				if var_200_17 > 0 and var_200_11 < var_200_17 then
					arg_197_1.talkMaxDuration = var_200_17

					if var_200_17 + var_200_10 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_17 + var_200_10
					end
				end

				arg_197_1.text_.text = var_200_14
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521048", "story_v_out_319521.awb") ~= 0 then
					local var_200_18 = manager.audio:GetVoiceLength("story_v_out_319521", "319521048", "story_v_out_319521.awb") / 1000

					if var_200_18 + var_200_10 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_18 + var_200_10
					end

					if var_200_13.prefab_name ~= "" and arg_197_1.actors_[var_200_13.prefab_name] ~= nil then
						local var_200_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_13.prefab_name].transform, "story_v_out_319521", "319521048", "story_v_out_319521.awb")

						arg_197_1:RecordAudio("319521048", var_200_19)
						arg_197_1:RecordAudio("319521048", var_200_19)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319521", "319521048", "story_v_out_319521.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319521", "319521048", "story_v_out_319521.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_20 = math.max(var_200_11, arg_197_1.talkMaxDuration)

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_20 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_10) / var_200_20

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_10 + var_200_20 and arg_197_1.time_ < var_200_10 + var_200_20 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319521049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319521049
		arg_201_1.duration_ = 3.166

		local var_201_0 = {
			zh = 2.433,
			ja = 3.166
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
				arg_201_0:Play319521050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["4040ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect4040ui_story == nil then
				arg_201_1.var_.characterEffect4040ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.200000002980232

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect4040ui_story then
					arg_201_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect4040ui_story then
				arg_201_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_204_4 = arg_201_1.actors_["1084ui_story"]
			local var_204_5 = 0

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 and arg_201_1.var_.characterEffect1084ui_story == nil then
				arg_201_1.var_.characterEffect1084ui_story = var_204_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_6 = 0.200000002980232

			if var_204_5 <= arg_201_1.time_ and arg_201_1.time_ < var_204_5 + var_204_6 then
				local var_204_7 = (arg_201_1.time_ - var_204_5) / var_204_6

				if arg_201_1.var_.characterEffect1084ui_story then
					local var_204_8 = Mathf.Lerp(0, 0.5, var_204_7)

					arg_201_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1084ui_story.fillRatio = var_204_8
				end
			end

			if arg_201_1.time_ >= var_204_5 + var_204_6 and arg_201_1.time_ < var_204_5 + var_204_6 + arg_204_0 and arg_201_1.var_.characterEffect1084ui_story then
				local var_204_9 = 0.5

				arg_201_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1084ui_story.fillRatio = var_204_9
			end

			local var_204_10 = 0
			local var_204_11 = 0.25

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_12 = arg_201_1:FormatText(StoryNameCfg[668].name)

				arg_201_1.leftNameTxt_.text = var_204_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_13 = arg_201_1:GetWordFromCfg(319521049)
				local var_204_14 = arg_201_1:FormatText(var_204_13.content)

				arg_201_1.text_.text = var_204_14

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_15 = 10
				local var_204_16 = utf8.len(var_204_14)
				local var_204_17 = var_204_15 <= 0 and var_204_11 or var_204_11 * (var_204_16 / var_204_15)

				if var_204_17 > 0 and var_204_11 < var_204_17 then
					arg_201_1.talkMaxDuration = var_204_17

					if var_204_17 + var_204_10 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_17 + var_204_10
					end
				end

				arg_201_1.text_.text = var_204_14
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521049", "story_v_out_319521.awb") ~= 0 then
					local var_204_18 = manager.audio:GetVoiceLength("story_v_out_319521", "319521049", "story_v_out_319521.awb") / 1000

					if var_204_18 + var_204_10 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_18 + var_204_10
					end

					if var_204_13.prefab_name ~= "" and arg_201_1.actors_[var_204_13.prefab_name] ~= nil then
						local var_204_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_13.prefab_name].transform, "story_v_out_319521", "319521049", "story_v_out_319521.awb")

						arg_201_1:RecordAudio("319521049", var_204_19)
						arg_201_1:RecordAudio("319521049", var_204_19)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_319521", "319521049", "story_v_out_319521.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_319521", "319521049", "story_v_out_319521.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_20 = math.max(var_204_11, arg_201_1.talkMaxDuration)

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_20 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_10) / var_204_20

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_10 + var_204_20 and arg_201_1.time_ < var_204_10 + var_204_20 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play319521050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319521050
		arg_205_1.duration_ = 6.7

		local var_205_0 = {
			zh = 1.999999999999,
			ja = 6.7
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
				arg_205_0:Play319521051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["4040ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect4040ui_story == nil then
				arg_205_1.var_.characterEffect4040ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect4040ui_story then
					local var_208_4 = Mathf.Lerp(0, 0.5, var_208_3)

					arg_205_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_205_1.var_.characterEffect4040ui_story.fillRatio = var_208_4
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect4040ui_story then
				local var_208_5 = 0.5

				arg_205_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_205_1.var_.characterEffect4040ui_story.fillRatio = var_208_5
			end

			local var_208_6 = arg_205_1.actors_["1084ui_story"]
			local var_208_7 = 0

			if var_208_7 < arg_205_1.time_ and arg_205_1.time_ <= var_208_7 + arg_208_0 and arg_205_1.var_.characterEffect1084ui_story == nil then
				arg_205_1.var_.characterEffect1084ui_story = var_208_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_8 = 0.200000002980232

			if var_208_7 <= arg_205_1.time_ and arg_205_1.time_ < var_208_7 + var_208_8 then
				local var_208_9 = (arg_205_1.time_ - var_208_7) / var_208_8

				if arg_205_1.var_.characterEffect1084ui_story then
					arg_205_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_7 + var_208_8 and arg_205_1.time_ < var_208_7 + var_208_8 + arg_208_0 and arg_205_1.var_.characterEffect1084ui_story then
				arg_205_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 then
				arg_205_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_208_11 = 0
			local var_208_12 = 0.2

			if var_208_11 < arg_205_1.time_ and arg_205_1.time_ <= var_208_11 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_13 = arg_205_1:FormatText(StoryNameCfg[6].name)

				arg_205_1.leftNameTxt_.text = var_208_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_14 = arg_205_1:GetWordFromCfg(319521050)
				local var_208_15 = arg_205_1:FormatText(var_208_14.content)

				arg_205_1.text_.text = var_208_15

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_16 = 8
				local var_208_17 = utf8.len(var_208_15)
				local var_208_18 = var_208_16 <= 0 and var_208_12 or var_208_12 * (var_208_17 / var_208_16)

				if var_208_18 > 0 and var_208_12 < var_208_18 then
					arg_205_1.talkMaxDuration = var_208_18

					if var_208_18 + var_208_11 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_18 + var_208_11
					end
				end

				arg_205_1.text_.text = var_208_15
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521050", "story_v_out_319521.awb") ~= 0 then
					local var_208_19 = manager.audio:GetVoiceLength("story_v_out_319521", "319521050", "story_v_out_319521.awb") / 1000

					if var_208_19 + var_208_11 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_19 + var_208_11
					end

					if var_208_14.prefab_name ~= "" and arg_205_1.actors_[var_208_14.prefab_name] ~= nil then
						local var_208_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_14.prefab_name].transform, "story_v_out_319521", "319521050", "story_v_out_319521.awb")

						arg_205_1:RecordAudio("319521050", var_208_20)
						arg_205_1:RecordAudio("319521050", var_208_20)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319521", "319521050", "story_v_out_319521.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319521", "319521050", "story_v_out_319521.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_21 = math.max(var_208_12, arg_205_1.talkMaxDuration)

			if var_208_11 <= arg_205_1.time_ and arg_205_1.time_ < var_208_11 + var_208_21 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_11) / var_208_21

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_11 + var_208_21 and arg_205_1.time_ < var_208_11 + var_208_21 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319521051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319521051
		arg_209_1.duration_ = 10.266

		local var_209_0 = {
			zh = 4.333,
			ja = 10.266
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
				arg_209_0:Play319521052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["4040ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos4040ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0.7, -1.55, -5.5)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos4040ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["4040ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect4040ui_story == nil then
				arg_209_1.var_.characterEffect4040ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect4040ui_story then
					arg_209_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect4040ui_story then
				arg_209_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_212_13 = 0

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 then
				arg_209_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_212_15 = arg_209_1.actors_["1084ui_story"]
			local var_212_16 = 0

			if var_212_16 < arg_209_1.time_ and arg_209_1.time_ <= var_212_16 + arg_212_0 and arg_209_1.var_.characterEffect1084ui_story == nil then
				arg_209_1.var_.characterEffect1084ui_story = var_212_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_17 = 0.200000002980232

			if var_212_16 <= arg_209_1.time_ and arg_209_1.time_ < var_212_16 + var_212_17 then
				local var_212_18 = (arg_209_1.time_ - var_212_16) / var_212_17

				if arg_209_1.var_.characterEffect1084ui_story then
					local var_212_19 = Mathf.Lerp(0, 0.5, var_212_18)

					arg_209_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1084ui_story.fillRatio = var_212_19
				end
			end

			if arg_209_1.time_ >= var_212_16 + var_212_17 and arg_209_1.time_ < var_212_16 + var_212_17 + arg_212_0 and arg_209_1.var_.characterEffect1084ui_story then
				local var_212_20 = 0.5

				arg_209_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1084ui_story.fillRatio = var_212_20
			end

			local var_212_21 = 0
			local var_212_22 = 0.55

			if var_212_21 < arg_209_1.time_ and arg_209_1.time_ <= var_212_21 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_23 = arg_209_1:FormatText(StoryNameCfg[668].name)

				arg_209_1.leftNameTxt_.text = var_212_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_24 = arg_209_1:GetWordFromCfg(319521051)
				local var_212_25 = arg_209_1:FormatText(var_212_24.content)

				arg_209_1.text_.text = var_212_25

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_26 = 22
				local var_212_27 = utf8.len(var_212_25)
				local var_212_28 = var_212_26 <= 0 and var_212_22 or var_212_22 * (var_212_27 / var_212_26)

				if var_212_28 > 0 and var_212_22 < var_212_28 then
					arg_209_1.talkMaxDuration = var_212_28

					if var_212_28 + var_212_21 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_28 + var_212_21
					end
				end

				arg_209_1.text_.text = var_212_25
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521051", "story_v_out_319521.awb") ~= 0 then
					local var_212_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521051", "story_v_out_319521.awb") / 1000

					if var_212_29 + var_212_21 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_29 + var_212_21
					end

					if var_212_24.prefab_name ~= "" and arg_209_1.actors_[var_212_24.prefab_name] ~= nil then
						local var_212_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_24.prefab_name].transform, "story_v_out_319521", "319521051", "story_v_out_319521.awb")

						arg_209_1:RecordAudio("319521051", var_212_30)
						arg_209_1:RecordAudio("319521051", var_212_30)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_319521", "319521051", "story_v_out_319521.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_319521", "319521051", "story_v_out_319521.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_31 = math.max(var_212_22, arg_209_1.talkMaxDuration)

			if var_212_21 <= arg_209_1.time_ and arg_209_1.time_ < var_212_21 + var_212_31 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_21) / var_212_31

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_21 + var_212_31 and arg_209_1.time_ < var_212_21 + var_212_31 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play319521052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319521052
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play319521053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["4040ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect4040ui_story == nil then
				arg_213_1.var_.characterEffect4040ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect4040ui_story then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_213_1.var_.characterEffect4040ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect4040ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_213_1.var_.characterEffect4040ui_story.fillRatio = var_216_5
			end

			local var_216_6 = 0
			local var_216_7 = 0.75

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_8 = arg_213_1:GetWordFromCfg(319521052)
				local var_216_9 = arg_213_1:FormatText(var_216_8.content)

				arg_213_1.text_.text = var_216_9

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_10 = 30
				local var_216_11 = utf8.len(var_216_9)
				local var_216_12 = var_216_10 <= 0 and var_216_7 or var_216_7 * (var_216_11 / var_216_10)

				if var_216_12 > 0 and var_216_7 < var_216_12 then
					arg_213_1.talkMaxDuration = var_216_12

					if var_216_12 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_12 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_9
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_13 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_13 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_13

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_13 and arg_213_1.time_ < var_216_6 + var_216_13 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319521053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319521053
		arg_217_1.duration_ = 10.6

		local var_217_0 = {
			zh = 7.933,
			ja = 10.6
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
				arg_217_0:Play319521054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["4040ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect4040ui_story == nil then
				arg_217_1.var_.characterEffect4040ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.200000002980232

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect4040ui_story then
					arg_217_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect4040ui_story then
				arg_217_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_220_4 = 0
			local var_220_5 = 0.975

			if var_220_4 < arg_217_1.time_ and arg_217_1.time_ <= var_220_4 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_6 = arg_217_1:FormatText(StoryNameCfg[668].name)

				arg_217_1.leftNameTxt_.text = var_220_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_7 = arg_217_1:GetWordFromCfg(319521053)
				local var_220_8 = arg_217_1:FormatText(var_220_7.content)

				arg_217_1.text_.text = var_220_8

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_9 = 39
				local var_220_10 = utf8.len(var_220_8)
				local var_220_11 = var_220_9 <= 0 and var_220_5 or var_220_5 * (var_220_10 / var_220_9)

				if var_220_11 > 0 and var_220_5 < var_220_11 then
					arg_217_1.talkMaxDuration = var_220_11

					if var_220_11 + var_220_4 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_11 + var_220_4
					end
				end

				arg_217_1.text_.text = var_220_8
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521053", "story_v_out_319521.awb") ~= 0 then
					local var_220_12 = manager.audio:GetVoiceLength("story_v_out_319521", "319521053", "story_v_out_319521.awb") / 1000

					if var_220_12 + var_220_4 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_12 + var_220_4
					end

					if var_220_7.prefab_name ~= "" and arg_217_1.actors_[var_220_7.prefab_name] ~= nil then
						local var_220_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_7.prefab_name].transform, "story_v_out_319521", "319521053", "story_v_out_319521.awb")

						arg_217_1:RecordAudio("319521053", var_220_13)
						arg_217_1:RecordAudio("319521053", var_220_13)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_319521", "319521053", "story_v_out_319521.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_319521", "319521053", "story_v_out_319521.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_14 = math.max(var_220_5, arg_217_1.talkMaxDuration)

			if var_220_4 <= arg_217_1.time_ and arg_217_1.time_ < var_220_4 + var_220_14 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_4) / var_220_14

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_4 + var_220_14 and arg_217_1.time_ < var_220_4 + var_220_14 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play319521054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319521054
		arg_221_1.duration_ = 10.733

		local var_221_0 = {
			zh = 8.733,
			ja = 10.733
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
				arg_221_0:Play319521055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1084ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1084ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(-0.7, -0.97, -6)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1084ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["1084ui_story"]
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story == nil then
				arg_221_1.var_.characterEffect1084ui_story = var_224_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_11 = 0.200000002980232

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11

				if arg_221_1.var_.characterEffect1084ui_story then
					arg_221_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story then
				arg_221_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_224_13 = 0

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				arg_221_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_224_15 = arg_221_1.actors_["4040ui_story"]
			local var_224_16 = 0

			if var_224_16 < arg_221_1.time_ and arg_221_1.time_ <= var_224_16 + arg_224_0 and arg_221_1.var_.characterEffect4040ui_story == nil then
				arg_221_1.var_.characterEffect4040ui_story = var_224_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_17 = 0.200000002980232

			if var_224_16 <= arg_221_1.time_ and arg_221_1.time_ < var_224_16 + var_224_17 then
				local var_224_18 = (arg_221_1.time_ - var_224_16) / var_224_17

				if arg_221_1.var_.characterEffect4040ui_story then
					local var_224_19 = Mathf.Lerp(0, 0.5, var_224_18)

					arg_221_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_221_1.var_.characterEffect4040ui_story.fillRatio = var_224_19
				end
			end

			if arg_221_1.time_ >= var_224_16 + var_224_17 and arg_221_1.time_ < var_224_16 + var_224_17 + arg_224_0 and arg_221_1.var_.characterEffect4040ui_story then
				local var_224_20 = 0.5

				arg_221_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_221_1.var_.characterEffect4040ui_story.fillRatio = var_224_20
			end

			local var_224_21 = 0
			local var_224_22 = 1.1

			if var_224_21 < arg_221_1.time_ and arg_221_1.time_ <= var_224_21 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_23 = arg_221_1:FormatText(StoryNameCfg[6].name)

				arg_221_1.leftNameTxt_.text = var_224_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_24 = arg_221_1:GetWordFromCfg(319521054)
				local var_224_25 = arg_221_1:FormatText(var_224_24.content)

				arg_221_1.text_.text = var_224_25

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_26 = 44
				local var_224_27 = utf8.len(var_224_25)
				local var_224_28 = var_224_26 <= 0 and var_224_22 or var_224_22 * (var_224_27 / var_224_26)

				if var_224_28 > 0 and var_224_22 < var_224_28 then
					arg_221_1.talkMaxDuration = var_224_28

					if var_224_28 + var_224_21 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_28 + var_224_21
					end
				end

				arg_221_1.text_.text = var_224_25
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521054", "story_v_out_319521.awb") ~= 0 then
					local var_224_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521054", "story_v_out_319521.awb") / 1000

					if var_224_29 + var_224_21 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_29 + var_224_21
					end

					if var_224_24.prefab_name ~= "" and arg_221_1.actors_[var_224_24.prefab_name] ~= nil then
						local var_224_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_24.prefab_name].transform, "story_v_out_319521", "319521054", "story_v_out_319521.awb")

						arg_221_1:RecordAudio("319521054", var_224_30)
						arg_221_1:RecordAudio("319521054", var_224_30)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_319521", "319521054", "story_v_out_319521.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_319521", "319521054", "story_v_out_319521.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_31 = math.max(var_224_22, arg_221_1.talkMaxDuration)

			if var_224_21 <= arg_221_1.time_ and arg_221_1.time_ < var_224_21 + var_224_31 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_21) / var_224_31

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_21 + var_224_31 and arg_221_1.time_ < var_224_21 + var_224_31 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play319521055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319521055
		arg_225_1.duration_ = 11.766

		local var_225_0 = {
			zh = 7.733,
			ja = 11.766
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
				arg_225_0:Play319521056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1084ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1084ui_story == nil then
				arg_225_1.var_.characterEffect1084ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.200000002980232

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1084ui_story then
					local var_228_4 = Mathf.Lerp(0, 0.5, var_228_3)

					arg_225_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1084ui_story.fillRatio = var_228_4
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1084ui_story then
				local var_228_5 = 0.5

				arg_225_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1084ui_story.fillRatio = var_228_5
			end

			local var_228_6 = arg_225_1.actors_["4040ui_story"]
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 and arg_225_1.var_.characterEffect4040ui_story == nil then
				arg_225_1.var_.characterEffect4040ui_story = var_228_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_8 = 0.200000002980232

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_8 then
				local var_228_9 = (arg_225_1.time_ - var_228_7) / var_228_8

				if arg_225_1.var_.characterEffect4040ui_story then
					arg_225_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_7 + var_228_8 and arg_225_1.time_ < var_228_7 + var_228_8 + arg_228_0 and arg_225_1.var_.characterEffect4040ui_story then
				arg_225_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 then
				arg_225_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_228_11 = 0
			local var_228_12 = 0.85

			if var_228_11 < arg_225_1.time_ and arg_225_1.time_ <= var_228_11 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_13 = arg_225_1:FormatText(StoryNameCfg[668].name)

				arg_225_1.leftNameTxt_.text = var_228_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_14 = arg_225_1:GetWordFromCfg(319521055)
				local var_228_15 = arg_225_1:FormatText(var_228_14.content)

				arg_225_1.text_.text = var_228_15

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_16 = 34
				local var_228_17 = utf8.len(var_228_15)
				local var_228_18 = var_228_16 <= 0 and var_228_12 or var_228_12 * (var_228_17 / var_228_16)

				if var_228_18 > 0 and var_228_12 < var_228_18 then
					arg_225_1.talkMaxDuration = var_228_18

					if var_228_18 + var_228_11 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_18 + var_228_11
					end
				end

				arg_225_1.text_.text = var_228_15
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521055", "story_v_out_319521.awb") ~= 0 then
					local var_228_19 = manager.audio:GetVoiceLength("story_v_out_319521", "319521055", "story_v_out_319521.awb") / 1000

					if var_228_19 + var_228_11 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_19 + var_228_11
					end

					if var_228_14.prefab_name ~= "" and arg_225_1.actors_[var_228_14.prefab_name] ~= nil then
						local var_228_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_14.prefab_name].transform, "story_v_out_319521", "319521055", "story_v_out_319521.awb")

						arg_225_1:RecordAudio("319521055", var_228_20)
						arg_225_1:RecordAudio("319521055", var_228_20)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_319521", "319521055", "story_v_out_319521.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_319521", "319521055", "story_v_out_319521.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_21 = math.max(var_228_12, arg_225_1.talkMaxDuration)

			if var_228_11 <= arg_225_1.time_ and arg_225_1.time_ < var_228_11 + var_228_21 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_11) / var_228_21

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_11 + var_228_21 and arg_225_1.time_ < var_228_11 + var_228_21 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319521056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 319521056
		arg_229_1.duration_ = 13.2

		local var_229_0 = {
			zh = 7.866,
			ja = 13.2
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
				arg_229_0:Play319521057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_232_1 = 0
			local var_232_2 = 0.9

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_3 = arg_229_1:FormatText(StoryNameCfg[668].name)

				arg_229_1.leftNameTxt_.text = var_232_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_4 = arg_229_1:GetWordFromCfg(319521056)
				local var_232_5 = arg_229_1:FormatText(var_232_4.content)

				arg_229_1.text_.text = var_232_5

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_6 = 36
				local var_232_7 = utf8.len(var_232_5)
				local var_232_8 = var_232_6 <= 0 and var_232_2 or var_232_2 * (var_232_7 / var_232_6)

				if var_232_8 > 0 and var_232_2 < var_232_8 then
					arg_229_1.talkMaxDuration = var_232_8

					if var_232_8 + var_232_1 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_1
					end
				end

				arg_229_1.text_.text = var_232_5
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521056", "story_v_out_319521.awb") ~= 0 then
					local var_232_9 = manager.audio:GetVoiceLength("story_v_out_319521", "319521056", "story_v_out_319521.awb") / 1000

					if var_232_9 + var_232_1 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_9 + var_232_1
					end

					if var_232_4.prefab_name ~= "" and arg_229_1.actors_[var_232_4.prefab_name] ~= nil then
						local var_232_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_4.prefab_name].transform, "story_v_out_319521", "319521056", "story_v_out_319521.awb")

						arg_229_1:RecordAudio("319521056", var_232_10)
						arg_229_1:RecordAudio("319521056", var_232_10)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_319521", "319521056", "story_v_out_319521.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_319521", "319521056", "story_v_out_319521.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_11 = math.max(var_232_2, arg_229_1.talkMaxDuration)

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_11 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_1) / var_232_11

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_1 + var_232_11 and arg_229_1.time_ < var_232_1 + var_232_11 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play319521057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 319521057
		arg_233_1.duration_ = 5.1

		local var_233_0 = {
			zh = 4.3,
			ja = 5.1
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
				arg_233_0:Play319521058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_236_1 = arg_233_1.actors_["1084ui_story"]
			local var_236_2 = 0

			if var_236_2 < arg_233_1.time_ and arg_233_1.time_ <= var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story == nil then
				arg_233_1.var_.characterEffect1084ui_story = var_236_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_3 = 0.2

			if var_236_2 <= arg_233_1.time_ and arg_233_1.time_ < var_236_2 + var_236_3 then
				local var_236_4 = (arg_233_1.time_ - var_236_2) / var_236_3

				if arg_233_1.var_.characterEffect1084ui_story then
					arg_233_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_2 + var_236_3 and arg_233_1.time_ < var_236_2 + var_236_3 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story then
				arg_233_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_236_5 = 0
			local var_236_6 = 0.575

			if var_236_5 < arg_233_1.time_ and arg_233_1.time_ <= var_236_5 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_7 = arg_233_1:FormatText(StoryNameCfg[6].name)

				arg_233_1.leftNameTxt_.text = var_236_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_8 = arg_233_1:GetWordFromCfg(319521057)
				local var_236_9 = arg_233_1:FormatText(var_236_8.content)

				arg_233_1.text_.text = var_236_9

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_10 = 23
				local var_236_11 = utf8.len(var_236_9)
				local var_236_12 = var_236_10 <= 0 and var_236_6 or var_236_6 * (var_236_11 / var_236_10)

				if var_236_12 > 0 and var_236_6 < var_236_12 then
					arg_233_1.talkMaxDuration = var_236_12

					if var_236_12 + var_236_5 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_12 + var_236_5
					end
				end

				arg_233_1.text_.text = var_236_9
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521057", "story_v_out_319521.awb") ~= 0 then
					local var_236_13 = manager.audio:GetVoiceLength("story_v_out_319521", "319521057", "story_v_out_319521.awb") / 1000

					if var_236_13 + var_236_5 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_13 + var_236_5
					end

					if var_236_8.prefab_name ~= "" and arg_233_1.actors_[var_236_8.prefab_name] ~= nil then
						local var_236_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_8.prefab_name].transform, "story_v_out_319521", "319521057", "story_v_out_319521.awb")

						arg_233_1:RecordAudio("319521057", var_236_14)
						arg_233_1:RecordAudio("319521057", var_236_14)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_319521", "319521057", "story_v_out_319521.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_319521", "319521057", "story_v_out_319521.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_15 = math.max(var_236_6, arg_233_1.talkMaxDuration)

			if var_236_5 <= arg_233_1.time_ and arg_233_1.time_ < var_236_5 + var_236_15 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_5) / var_236_15

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_5 + var_236_15 and arg_233_1.time_ < var_236_5 + var_236_15 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play319521058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 319521058
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play319521059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1084ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1084ui_story == nil then
				arg_237_1.var_.characterEffect1084ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1084ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1084ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1084ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1084ui_story.fillRatio = var_240_5
			end

			local var_240_6 = 0
			local var_240_7 = 0.8

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_8 = arg_237_1:GetWordFromCfg(319521058)
				local var_240_9 = arg_237_1:FormatText(var_240_8.content)

				arg_237_1.text_.text = var_240_9

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_10 = 32
				local var_240_11 = utf8.len(var_240_9)
				local var_240_12 = var_240_10 <= 0 and var_240_7 or var_240_7 * (var_240_11 / var_240_10)

				if var_240_12 > 0 and var_240_7 < var_240_12 then
					arg_237_1.talkMaxDuration = var_240_12

					if var_240_12 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_9
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_13 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_13 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_13

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_13 and arg_237_1.time_ < var_240_6 + var_240_13 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play319521059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 319521059
		arg_241_1.duration_ = 6.233

		local var_241_0 = {
			zh = 6.233,
			ja = 6.066
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
				arg_241_0:Play319521060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["4040ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos4040ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(0.7, -1.55, -5.5)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos4040ui_story, var_244_4, var_244_3)

				local var_244_5 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_5.x, var_244_5.y, var_244_5.z)

				local var_244_6 = var_244_0.localEulerAngles

				var_244_6.z = 0
				var_244_6.x = 0
				var_244_0.localEulerAngles = var_244_6
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_244_7 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_7.x, var_244_7.y, var_244_7.z)

				local var_244_8 = var_244_0.localEulerAngles

				var_244_8.z = 0
				var_244_8.x = 0
				var_244_0.localEulerAngles = var_244_8
			end

			local var_244_9 = arg_241_1.actors_["4040ui_story"]
			local var_244_10 = 0

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 and arg_241_1.var_.characterEffect4040ui_story == nil then
				arg_241_1.var_.characterEffect4040ui_story = var_244_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_11 = 0.200000002980232

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_10) / var_244_11

				if arg_241_1.var_.characterEffect4040ui_story then
					arg_241_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_10 + var_244_11 and arg_241_1.time_ < var_244_10 + var_244_11 + arg_244_0 and arg_241_1.var_.characterEffect4040ui_story then
				arg_241_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_244_13 = 0

			if var_244_13 < arg_241_1.time_ and arg_241_1.time_ <= var_244_13 + arg_244_0 then
				arg_241_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_244_14 = 0

			if var_244_14 < arg_241_1.time_ and arg_241_1.time_ <= var_244_14 + arg_244_0 then
				arg_241_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_244_15 = 0
			local var_244_16 = 0.55

			if var_244_15 < arg_241_1.time_ and arg_241_1.time_ <= var_244_15 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_17 = arg_241_1:FormatText(StoryNameCfg[668].name)

				arg_241_1.leftNameTxt_.text = var_244_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_18 = arg_241_1:GetWordFromCfg(319521059)
				local var_244_19 = arg_241_1:FormatText(var_244_18.content)

				arg_241_1.text_.text = var_244_19

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_20 = 22
				local var_244_21 = utf8.len(var_244_19)
				local var_244_22 = var_244_20 <= 0 and var_244_16 or var_244_16 * (var_244_21 / var_244_20)

				if var_244_22 > 0 and var_244_16 < var_244_22 then
					arg_241_1.talkMaxDuration = var_244_22

					if var_244_22 + var_244_15 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_22 + var_244_15
					end
				end

				arg_241_1.text_.text = var_244_19
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521059", "story_v_out_319521.awb") ~= 0 then
					local var_244_23 = manager.audio:GetVoiceLength("story_v_out_319521", "319521059", "story_v_out_319521.awb") / 1000

					if var_244_23 + var_244_15 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_23 + var_244_15
					end

					if var_244_18.prefab_name ~= "" and arg_241_1.actors_[var_244_18.prefab_name] ~= nil then
						local var_244_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_18.prefab_name].transform, "story_v_out_319521", "319521059", "story_v_out_319521.awb")

						arg_241_1:RecordAudio("319521059", var_244_24)
						arg_241_1:RecordAudio("319521059", var_244_24)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_319521", "319521059", "story_v_out_319521.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_319521", "319521059", "story_v_out_319521.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_25 = math.max(var_244_16, arg_241_1.talkMaxDuration)

			if var_244_15 <= arg_241_1.time_ and arg_241_1.time_ < var_244_15 + var_244_25 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_15) / var_244_25

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_15 + var_244_25 and arg_241_1.time_ < var_244_15 + var_244_25 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play319521060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319521060
		arg_245_1.duration_ = 12.1

		local var_245_0 = {
			zh = 8.466,
			ja = 12.1
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
				arg_245_0:Play319521061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1084ui_story"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos1084ui_story = var_248_0.localPosition
			end

			local var_248_2 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2
				local var_248_4 = Vector3.New(-0.7, -0.97, -6)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1084ui_story, var_248_4, var_248_3)

				local var_248_5 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_5.x, var_248_5.y, var_248_5.z)

				local var_248_6 = var_248_0.localEulerAngles

				var_248_6.z = 0
				var_248_6.x = 0
				var_248_0.localEulerAngles = var_248_6
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_248_7 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_7.x, var_248_7.y, var_248_7.z)

				local var_248_8 = var_248_0.localEulerAngles

				var_248_8.z = 0
				var_248_8.x = 0
				var_248_0.localEulerAngles = var_248_8
			end

			local var_248_9 = arg_245_1.actors_["1084ui_story"]
			local var_248_10 = 0

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 and arg_245_1.var_.characterEffect1084ui_story == nil then
				arg_245_1.var_.characterEffect1084ui_story = var_248_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_11 = 0.200000002980232

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_11 then
				local var_248_12 = (arg_245_1.time_ - var_248_10) / var_248_11

				if arg_245_1.var_.characterEffect1084ui_story then
					arg_245_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_10 + var_248_11 and arg_245_1.time_ < var_248_10 + var_248_11 + arg_248_0 and arg_245_1.var_.characterEffect1084ui_story then
				arg_245_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_248_13 = 0

			if var_248_13 < arg_245_1.time_ and arg_245_1.time_ <= var_248_13 + arg_248_0 then
				arg_245_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				arg_245_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_248_15 = arg_245_1.actors_["4040ui_story"]
			local var_248_16 = 0

			if var_248_16 < arg_245_1.time_ and arg_245_1.time_ <= var_248_16 + arg_248_0 and arg_245_1.var_.characterEffect4040ui_story == nil then
				arg_245_1.var_.characterEffect4040ui_story = var_248_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_17 = 0.200000002980232

			if var_248_16 <= arg_245_1.time_ and arg_245_1.time_ < var_248_16 + var_248_17 then
				local var_248_18 = (arg_245_1.time_ - var_248_16) / var_248_17

				if arg_245_1.var_.characterEffect4040ui_story then
					local var_248_19 = Mathf.Lerp(0, 0.5, var_248_18)

					arg_245_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_245_1.var_.characterEffect4040ui_story.fillRatio = var_248_19
				end
			end

			if arg_245_1.time_ >= var_248_16 + var_248_17 and arg_245_1.time_ < var_248_16 + var_248_17 + arg_248_0 and arg_245_1.var_.characterEffect4040ui_story then
				local var_248_20 = 0.5

				arg_245_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_245_1.var_.characterEffect4040ui_story.fillRatio = var_248_20
			end

			local var_248_21 = 0
			local var_248_22 = 1.025

			if var_248_21 < arg_245_1.time_ and arg_245_1.time_ <= var_248_21 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_23 = arg_245_1:FormatText(StoryNameCfg[6].name)

				arg_245_1.leftNameTxt_.text = var_248_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_24 = arg_245_1:GetWordFromCfg(319521060)
				local var_248_25 = arg_245_1:FormatText(var_248_24.content)

				arg_245_1.text_.text = var_248_25

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_26 = 41
				local var_248_27 = utf8.len(var_248_25)
				local var_248_28 = var_248_26 <= 0 and var_248_22 or var_248_22 * (var_248_27 / var_248_26)

				if var_248_28 > 0 and var_248_22 < var_248_28 then
					arg_245_1.talkMaxDuration = var_248_28

					if var_248_28 + var_248_21 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_28 + var_248_21
					end
				end

				arg_245_1.text_.text = var_248_25
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521060", "story_v_out_319521.awb") ~= 0 then
					local var_248_29 = manager.audio:GetVoiceLength("story_v_out_319521", "319521060", "story_v_out_319521.awb") / 1000

					if var_248_29 + var_248_21 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_29 + var_248_21
					end

					if var_248_24.prefab_name ~= "" and arg_245_1.actors_[var_248_24.prefab_name] ~= nil then
						local var_248_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_24.prefab_name].transform, "story_v_out_319521", "319521060", "story_v_out_319521.awb")

						arg_245_1:RecordAudio("319521060", var_248_30)
						arg_245_1:RecordAudio("319521060", var_248_30)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_319521", "319521060", "story_v_out_319521.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_319521", "319521060", "story_v_out_319521.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_31 = math.max(var_248_22, arg_245_1.talkMaxDuration)

			if var_248_21 <= arg_245_1.time_ and arg_245_1.time_ < var_248_21 + var_248_31 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_21) / var_248_31

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_21 + var_248_31 and arg_245_1.time_ < var_248_21 + var_248_31 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319521061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319521061
		arg_249_1.duration_ = 10.4

		local var_249_0 = {
			zh = 3.566,
			ja = 10.4
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
				arg_249_0:Play319521062(arg_249_1)
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
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1084ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1084ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1084ui_story.fillRatio = var_252_5
			end

			local var_252_6 = arg_249_1.actors_["4040ui_story"]
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 and arg_249_1.var_.characterEffect4040ui_story == nil then
				arg_249_1.var_.characterEffect4040ui_story = var_252_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_8 = 0.200000002980232

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_8 then
				local var_252_9 = (arg_249_1.time_ - var_252_7) / var_252_8

				if arg_249_1.var_.characterEffect4040ui_story then
					arg_249_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_7 + var_252_8 and arg_249_1.time_ < var_252_7 + var_252_8 + arg_252_0 and arg_249_1.var_.characterEffect4040ui_story then
				arg_249_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_252_10 = 0
			local var_252_11 = 0.4

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_12 = arg_249_1:FormatText(StoryNameCfg[668].name)

				arg_249_1.leftNameTxt_.text = var_252_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_13 = arg_249_1:GetWordFromCfg(319521061)
				local var_252_14 = arg_249_1:FormatText(var_252_13.content)

				arg_249_1.text_.text = var_252_14

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_15 = 16
				local var_252_16 = utf8.len(var_252_14)
				local var_252_17 = var_252_15 <= 0 and var_252_11 or var_252_11 * (var_252_16 / var_252_15)

				if var_252_17 > 0 and var_252_11 < var_252_17 then
					arg_249_1.talkMaxDuration = var_252_17

					if var_252_17 + var_252_10 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_17 + var_252_10
					end
				end

				arg_249_1.text_.text = var_252_14
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521061", "story_v_out_319521.awb") ~= 0 then
					local var_252_18 = manager.audio:GetVoiceLength("story_v_out_319521", "319521061", "story_v_out_319521.awb") / 1000

					if var_252_18 + var_252_10 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_18 + var_252_10
					end

					if var_252_13.prefab_name ~= "" and arg_249_1.actors_[var_252_13.prefab_name] ~= nil then
						local var_252_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_13.prefab_name].transform, "story_v_out_319521", "319521061", "story_v_out_319521.awb")

						arg_249_1:RecordAudio("319521061", var_252_19)
						arg_249_1:RecordAudio("319521061", var_252_19)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_319521", "319521061", "story_v_out_319521.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_319521", "319521061", "story_v_out_319521.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_20 = math.max(var_252_11, arg_249_1.talkMaxDuration)

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_20 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_10) / var_252_20

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_10 + var_252_20 and arg_249_1.time_ < var_252_10 + var_252_20 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319521062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319521062
		arg_253_1.duration_ = 8.266

		local var_253_0 = {
			zh = 3.766,
			ja = 8.266
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
				arg_253_0:Play319521063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["4040ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect4040ui_story == nil then
				arg_253_1.var_.characterEffect4040ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.200000002980232

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect4040ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_253_1.var_.characterEffect4040ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect4040ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_253_1.var_.characterEffect4040ui_story.fillRatio = var_256_5
			end

			local var_256_6 = arg_253_1.actors_["1084ui_story"]
			local var_256_7 = 0

			if var_256_7 < arg_253_1.time_ and arg_253_1.time_ <= var_256_7 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story == nil then
				arg_253_1.var_.characterEffect1084ui_story = var_256_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_8 = 0.200000002980232

			if var_256_7 <= arg_253_1.time_ and arg_253_1.time_ < var_256_7 + var_256_8 then
				local var_256_9 = (arg_253_1.time_ - var_256_7) / var_256_8

				if arg_253_1.var_.characterEffect1084ui_story then
					arg_253_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_7 + var_256_8 and arg_253_1.time_ < var_256_7 + var_256_8 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story then
				arg_253_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 then
				arg_253_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_256_11 = 0

			if var_256_11 < arg_253_1.time_ and arg_253_1.time_ <= var_256_11 + arg_256_0 then
				arg_253_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_256_12 = 0
			local var_256_13 = 0.425

			if var_256_12 < arg_253_1.time_ and arg_253_1.time_ <= var_256_12 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_14 = arg_253_1:FormatText(StoryNameCfg[6].name)

				arg_253_1.leftNameTxt_.text = var_256_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_15 = arg_253_1:GetWordFromCfg(319521062)
				local var_256_16 = arg_253_1:FormatText(var_256_15.content)

				arg_253_1.text_.text = var_256_16

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_17 = 17
				local var_256_18 = utf8.len(var_256_16)
				local var_256_19 = var_256_17 <= 0 and var_256_13 or var_256_13 * (var_256_18 / var_256_17)

				if var_256_19 > 0 and var_256_13 < var_256_19 then
					arg_253_1.talkMaxDuration = var_256_19

					if var_256_19 + var_256_12 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_19 + var_256_12
					end
				end

				arg_253_1.text_.text = var_256_16
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521062", "story_v_out_319521.awb") ~= 0 then
					local var_256_20 = manager.audio:GetVoiceLength("story_v_out_319521", "319521062", "story_v_out_319521.awb") / 1000

					if var_256_20 + var_256_12 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_20 + var_256_12
					end

					if var_256_15.prefab_name ~= "" and arg_253_1.actors_[var_256_15.prefab_name] ~= nil then
						local var_256_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_15.prefab_name].transform, "story_v_out_319521", "319521062", "story_v_out_319521.awb")

						arg_253_1:RecordAudio("319521062", var_256_21)
						arg_253_1:RecordAudio("319521062", var_256_21)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_319521", "319521062", "story_v_out_319521.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_319521", "319521062", "story_v_out_319521.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_22 = math.max(var_256_13, arg_253_1.talkMaxDuration)

			if var_256_12 <= arg_253_1.time_ and arg_253_1.time_ < var_256_12 + var_256_22 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_12) / var_256_22

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_12 + var_256_22 and arg_253_1.time_ < var_256_12 + var_256_22 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play319521063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 319521063
		arg_257_1.duration_ = 6.466

		local var_257_0 = {
			zh = 5.666,
			ja = 6.466
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
				arg_257_0:Play319521064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["4040ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect4040ui_story == nil then
				arg_257_1.var_.characterEffect4040ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect4040ui_story then
					arg_257_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect4040ui_story then
				arg_257_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_260_4 = arg_257_1.actors_["1084ui_story"]
			local var_260_5 = 0

			if var_260_5 < arg_257_1.time_ and arg_257_1.time_ <= var_260_5 + arg_260_0 and arg_257_1.var_.characterEffect1084ui_story == nil then
				arg_257_1.var_.characterEffect1084ui_story = var_260_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_6 = 0.200000002980232

			if var_260_5 <= arg_257_1.time_ and arg_257_1.time_ < var_260_5 + var_260_6 then
				local var_260_7 = (arg_257_1.time_ - var_260_5) / var_260_6

				if arg_257_1.var_.characterEffect1084ui_story then
					local var_260_8 = Mathf.Lerp(0, 0.5, var_260_7)

					arg_257_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_257_1.var_.characterEffect1084ui_story.fillRatio = var_260_8
				end
			end

			if arg_257_1.time_ >= var_260_5 + var_260_6 and arg_257_1.time_ < var_260_5 + var_260_6 + arg_260_0 and arg_257_1.var_.characterEffect1084ui_story then
				local var_260_9 = 0.5

				arg_257_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_257_1.var_.characterEffect1084ui_story.fillRatio = var_260_9
			end

			local var_260_10 = 0

			if var_260_10 < arg_257_1.time_ and arg_257_1.time_ <= var_260_10 + arg_260_0 then
				arg_257_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_1")
			end

			local var_260_11 = 0

			if var_260_11 < arg_257_1.time_ and arg_257_1.time_ <= var_260_11 + arg_260_0 then
				arg_257_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_260_12 = 0
			local var_260_13 = 0.425

			if var_260_12 < arg_257_1.time_ and arg_257_1.time_ <= var_260_12 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_14 = arg_257_1:FormatText(StoryNameCfg[668].name)

				arg_257_1.leftNameTxt_.text = var_260_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_15 = arg_257_1:GetWordFromCfg(319521063)
				local var_260_16 = arg_257_1:FormatText(var_260_15.content)

				arg_257_1.text_.text = var_260_16

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_17 = 17
				local var_260_18 = utf8.len(var_260_16)
				local var_260_19 = var_260_17 <= 0 and var_260_13 or var_260_13 * (var_260_18 / var_260_17)

				if var_260_19 > 0 and var_260_13 < var_260_19 then
					arg_257_1.talkMaxDuration = var_260_19

					if var_260_19 + var_260_12 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_19 + var_260_12
					end
				end

				arg_257_1.text_.text = var_260_16
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521063", "story_v_out_319521.awb") ~= 0 then
					local var_260_20 = manager.audio:GetVoiceLength("story_v_out_319521", "319521063", "story_v_out_319521.awb") / 1000

					if var_260_20 + var_260_12 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_20 + var_260_12
					end

					if var_260_15.prefab_name ~= "" and arg_257_1.actors_[var_260_15.prefab_name] ~= nil then
						local var_260_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_15.prefab_name].transform, "story_v_out_319521", "319521063", "story_v_out_319521.awb")

						arg_257_1:RecordAudio("319521063", var_260_21)
						arg_257_1:RecordAudio("319521063", var_260_21)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_319521", "319521063", "story_v_out_319521.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_319521", "319521063", "story_v_out_319521.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_22 = math.max(var_260_13, arg_257_1.talkMaxDuration)

			if var_260_12 <= arg_257_1.time_ and arg_257_1.time_ < var_260_12 + var_260_22 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_12) / var_260_22

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_12 + var_260_22 and arg_257_1.time_ < var_260_12 + var_260_22 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play319521064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 319521064
		arg_261_1.duration_ = 13.366

		local var_261_0 = {
			zh = 8.966,
			ja = 13.366
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
				arg_261_0:Play319521065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.825

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[668].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(319521064)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521064", "story_v_out_319521.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_319521", "319521064", "story_v_out_319521.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_319521", "319521064", "story_v_out_319521.awb")

						arg_261_1:RecordAudio("319521064", var_264_9)
						arg_261_1:RecordAudio("319521064", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_319521", "319521064", "story_v_out_319521.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_319521", "319521064", "story_v_out_319521.awb")
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
	Play319521065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 319521065
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play319521066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["4040ui_story"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and arg_265_1.var_.characterEffect4040ui_story == nil then
				arg_265_1.var_.characterEffect4040ui_story = var_268_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_2 = 0.200000002980232

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.characterEffect4040ui_story then
					local var_268_4 = Mathf.Lerp(0, 0.5, var_268_3)

					arg_265_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_265_1.var_.characterEffect4040ui_story.fillRatio = var_268_4
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and arg_265_1.var_.characterEffect4040ui_story then
				local var_268_5 = 0.5

				arg_265_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_265_1.var_.characterEffect4040ui_story.fillRatio = var_268_5
			end

			local var_268_6 = 0
			local var_268_7 = 1.15

			if var_268_6 < arg_265_1.time_ and arg_265_1.time_ <= var_268_6 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_8 = arg_265_1:GetWordFromCfg(319521065)
				local var_268_9 = arg_265_1:FormatText(var_268_8.content)

				arg_265_1.text_.text = var_268_9

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_10 = 46
				local var_268_11 = utf8.len(var_268_9)
				local var_268_12 = var_268_10 <= 0 and var_268_7 or var_268_7 * (var_268_11 / var_268_10)

				if var_268_12 > 0 and var_268_7 < var_268_12 then
					arg_265_1.talkMaxDuration = var_268_12

					if var_268_12 + var_268_6 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_12 + var_268_6
					end
				end

				arg_265_1.text_.text = var_268_9
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_13 = math.max(var_268_7, arg_265_1.talkMaxDuration)

			if var_268_6 <= arg_265_1.time_ and arg_265_1.time_ < var_268_6 + var_268_13 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_6) / var_268_13

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_6 + var_268_13 and arg_265_1.time_ < var_268_6 + var_268_13 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play319521066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 319521066
		arg_269_1.duration_ = 9.333

		local var_269_0 = {
			zh = 6.3,
			ja = 9.333
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
				arg_269_0:Play319521067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["4040ui_story"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos4040ui_story = var_272_0.localPosition
			end

			local var_272_2 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2
				local var_272_4 = Vector3.New(0.7, -1.55, -5.5)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos4040ui_story, var_272_4, var_272_3)

				local var_272_5 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_5.x, var_272_5.y, var_272_5.z)

				local var_272_6 = var_272_0.localEulerAngles

				var_272_6.z = 0
				var_272_6.x = 0
				var_272_0.localEulerAngles = var_272_6
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_272_7 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_7.x, var_272_7.y, var_272_7.z)

				local var_272_8 = var_272_0.localEulerAngles

				var_272_8.z = 0
				var_272_8.x = 0
				var_272_0.localEulerAngles = var_272_8
			end

			local var_272_9 = arg_269_1.actors_["4040ui_story"]
			local var_272_10 = 0

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 and arg_269_1.var_.characterEffect4040ui_story == nil then
				arg_269_1.var_.characterEffect4040ui_story = var_272_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_11 = 0.200000002980232

			if var_272_10 <= arg_269_1.time_ and arg_269_1.time_ < var_272_10 + var_272_11 then
				local var_272_12 = (arg_269_1.time_ - var_272_10) / var_272_11

				if arg_269_1.var_.characterEffect4040ui_story then
					arg_269_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_10 + var_272_11 and arg_269_1.time_ < var_272_10 + var_272_11 + arg_272_0 and arg_269_1.var_.characterEffect4040ui_story then
				arg_269_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_272_13 = 0

			if var_272_13 < arg_269_1.time_ and arg_269_1.time_ <= var_272_13 + arg_272_0 then
				arg_269_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_2")
			end

			local var_272_14 = 0

			if var_272_14 < arg_269_1.time_ and arg_269_1.time_ <= var_272_14 + arg_272_0 then
				arg_269_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_272_15 = 0
			local var_272_16 = 0.6

			if var_272_15 < arg_269_1.time_ and arg_269_1.time_ <= var_272_15 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_17 = arg_269_1:FormatText(StoryNameCfg[668].name)

				arg_269_1.leftNameTxt_.text = var_272_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_18 = arg_269_1:GetWordFromCfg(319521066)
				local var_272_19 = arg_269_1:FormatText(var_272_18.content)

				arg_269_1.text_.text = var_272_19

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_20 = 24
				local var_272_21 = utf8.len(var_272_19)
				local var_272_22 = var_272_20 <= 0 and var_272_16 or var_272_16 * (var_272_21 / var_272_20)

				if var_272_22 > 0 and var_272_16 < var_272_22 then
					arg_269_1.talkMaxDuration = var_272_22

					if var_272_22 + var_272_15 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_22 + var_272_15
					end
				end

				arg_269_1.text_.text = var_272_19
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319521", "319521066", "story_v_out_319521.awb") ~= 0 then
					local var_272_23 = manager.audio:GetVoiceLength("story_v_out_319521", "319521066", "story_v_out_319521.awb") / 1000

					if var_272_23 + var_272_15 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_23 + var_272_15
					end

					if var_272_18.prefab_name ~= "" and arg_269_1.actors_[var_272_18.prefab_name] ~= nil then
						local var_272_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_18.prefab_name].transform, "story_v_out_319521", "319521066", "story_v_out_319521.awb")

						arg_269_1:RecordAudio("319521066", var_272_24)
						arg_269_1:RecordAudio("319521066", var_272_24)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_319521", "319521066", "story_v_out_319521.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_319521", "319521066", "story_v_out_319521.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_25 = math.max(var_272_16, arg_269_1.talkMaxDuration)

			if var_272_15 <= arg_269_1.time_ and arg_269_1.time_ < var_272_15 + var_272_25 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_15) / var_272_25

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_15 + var_272_25 and arg_269_1.time_ < var_272_15 + var_272_25 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play319521067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 319521067
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play319521068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["4040ui_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.characterEffect4040ui_story == nil then
				arg_273_1.var_.characterEffect4040ui_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.200000002980232

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect4040ui_story then
					local var_276_4 = Mathf.Lerp(0, 0.5, var_276_3)

					arg_273_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_273_1.var_.characterEffect4040ui_story.fillRatio = var_276_4
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect4040ui_story then
				local var_276_5 = 0.5

				arg_273_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_273_1.var_.characterEffect4040ui_story.fillRatio = var_276_5
			end

			local var_276_6 = arg_273_1.actors_["4040ui_story"].transform
			local var_276_7 = 0

			if var_276_7 < arg_273_1.time_ and arg_273_1.time_ <= var_276_7 + arg_276_0 then
				arg_273_1.var_.moveOldPos4040ui_story = var_276_6.localPosition
			end

			local var_276_8 = 0.001

			if var_276_7 <= arg_273_1.time_ and arg_273_1.time_ < var_276_7 + var_276_8 then
				local var_276_9 = (arg_273_1.time_ - var_276_7) / var_276_8
				local var_276_10 = Vector3.New(0, 100, 0)

				var_276_6.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos4040ui_story, var_276_10, var_276_9)

				local var_276_11 = manager.ui.mainCamera.transform.position - var_276_6.position

				var_276_6.forward = Vector3.New(var_276_11.x, var_276_11.y, var_276_11.z)

				local var_276_12 = var_276_6.localEulerAngles

				var_276_12.z = 0
				var_276_12.x = 0
				var_276_6.localEulerAngles = var_276_12
			end

			if arg_273_1.time_ >= var_276_7 + var_276_8 and arg_273_1.time_ < var_276_7 + var_276_8 + arg_276_0 then
				var_276_6.localPosition = Vector3.New(0, 100, 0)

				local var_276_13 = manager.ui.mainCamera.transform.position - var_276_6.position

				var_276_6.forward = Vector3.New(var_276_13.x, var_276_13.y, var_276_13.z)

				local var_276_14 = var_276_6.localEulerAngles

				var_276_14.z = 0
				var_276_14.x = 0
				var_276_6.localEulerAngles = var_276_14
			end

			local var_276_15 = arg_273_1.actors_["1084ui_story"].transform
			local var_276_16 = 0

			if var_276_16 < arg_273_1.time_ and arg_273_1.time_ <= var_276_16 + arg_276_0 then
				arg_273_1.var_.moveOldPos1084ui_story = var_276_15.localPosition
			end

			local var_276_17 = 0.001

			if var_276_16 <= arg_273_1.time_ and arg_273_1.time_ < var_276_16 + var_276_17 then
				local var_276_18 = (arg_273_1.time_ - var_276_16) / var_276_17
				local var_276_19 = Vector3.New(0, 100, 0)

				var_276_15.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1084ui_story, var_276_19, var_276_18)

				local var_276_20 = manager.ui.mainCamera.transform.position - var_276_15.position

				var_276_15.forward = Vector3.New(var_276_20.x, var_276_20.y, var_276_20.z)

				local var_276_21 = var_276_15.localEulerAngles

				var_276_21.z = 0
				var_276_21.x = 0
				var_276_15.localEulerAngles = var_276_21
			end

			if arg_273_1.time_ >= var_276_16 + var_276_17 and arg_273_1.time_ < var_276_16 + var_276_17 + arg_276_0 then
				var_276_15.localPosition = Vector3.New(0, 100, 0)

				local var_276_22 = manager.ui.mainCamera.transform.position - var_276_15.position

				var_276_15.forward = Vector3.New(var_276_22.x, var_276_22.y, var_276_22.z)

				local var_276_23 = var_276_15.localEulerAngles

				var_276_23.z = 0
				var_276_23.x = 0
				var_276_15.localEulerAngles = var_276_23
			end

			local var_276_24 = 0
			local var_276_25 = 1.275

			if var_276_24 < arg_273_1.time_ and arg_273_1.time_ <= var_276_24 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_26 = arg_273_1:GetWordFromCfg(319521067)
				local var_276_27 = arg_273_1:FormatText(var_276_26.content)

				arg_273_1.text_.text = var_276_27

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_28 = 51
				local var_276_29 = utf8.len(var_276_27)
				local var_276_30 = var_276_28 <= 0 and var_276_25 or var_276_25 * (var_276_29 / var_276_28)

				if var_276_30 > 0 and var_276_25 < var_276_30 then
					arg_273_1.talkMaxDuration = var_276_30

					if var_276_30 + var_276_24 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_30 + var_276_24
					end
				end

				arg_273_1.text_.text = var_276_27
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_31 = math.max(var_276_25, arg_273_1.talkMaxDuration)

			if var_276_24 <= arg_273_1.time_ and arg_273_1.time_ < var_276_24 + var_276_31 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_24) / var_276_31

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_24 + var_276_31 and arg_273_1.time_ < var_276_24 + var_276_31 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play319521068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 319521068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play319521069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 1.2

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

				local var_280_2 = arg_277_1:GetWordFromCfg(319521068)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 48
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
	Play319521069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 319521069
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play319521070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 1.65

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_2 = arg_281_1:GetWordFromCfg(319521069)
				local var_284_3 = arg_281_1:FormatText(var_284_2.content)

				arg_281_1.text_.text = var_284_3

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_4 = 66
				local var_284_5 = utf8.len(var_284_3)
				local var_284_6 = var_284_4 <= 0 and var_284_1 or var_284_1 * (var_284_5 / var_284_4)

				if var_284_6 > 0 and var_284_1 < var_284_6 then
					arg_281_1.talkMaxDuration = var_284_6

					if var_284_6 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_6 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_3
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_7 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_7 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_7

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_7 and arg_281_1.time_ < var_284_0 + var_284_7 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play319521070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 319521070
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
			arg_285_1.auto_ = false
		end

		function arg_285_1.playNext_(arg_287_0)
			arg_285_1.onStoryFinished_()
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 1.6

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, false)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_2 = arg_285_1:GetWordFromCfg(319521070)
				local var_288_3 = arg_285_1:FormatText(var_288_2.content)

				arg_285_1.text_.text = var_288_3

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_4 = 64
				local var_288_5 = utf8.len(var_288_3)
				local var_288_6 = var_288_4 <= 0 and var_288_1 or var_288_1 * (var_288_5 / var_288_4)

				if var_288_6 > 0 and var_288_1 < var_288_6 then
					arg_285_1.talkMaxDuration = var_288_6

					if var_288_6 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_6 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_3
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_7 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_7 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_7

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_7 and arg_285_1.time_ < var_288_0 + var_288_7 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11s",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319521.awb"
	}
}
