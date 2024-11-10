return {
	Play317032001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317032001
		arg_1_1.duration_ = 5.266

		local var_1_0 = {
			zh = 4.233,
			ja = 5.266
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
				arg_1_0:Play317032002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K10f"

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
				local var_4_5 = arg_1_1.bgs_.K10f

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
					if iter_4_0 ~= "K10f" then
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

			local var_4_22 = "2078ui_story"

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

			local var_4_26 = arg_1_1.actors_["2078ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos2078ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -1.28, -5.6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos2078ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["2078ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect2078ui_story == nil then
				arg_1_1.var_.characterEffect2078ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect2078ui_story then
					arg_1_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect2078ui_story then
				arg_1_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_4_39 = 2

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_41 = 0
			local var_4_42 = 0.3

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 1
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.15

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[530].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(317032001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032001", "story_v_out_317032.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_317032", "317032001", "story_v_out_317032.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_317032", "317032001", "story_v_out_317032.awb")

						arg_1_1:RecordAudio("317032001", var_4_59)
						arg_1_1:RecordAudio("317032001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_317032", "317032001", "story_v_out_317032.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_317032", "317032001", "story_v_out_317032.awb")
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
	Play317032002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317032002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play317032003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["2078ui_story"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos2078ui_story = var_10_0.localPosition
			end

			local var_10_2 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2
				local var_10_4 = Vector3.New(0, 100, 0)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2078ui_story, var_10_4, var_10_3)

				local var_10_5 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_5.x, var_10_5.y, var_10_5.z)

				local var_10_6 = var_10_0.localEulerAngles

				var_10_6.z = 0
				var_10_6.x = 0
				var_10_0.localEulerAngles = var_10_6
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(0, 100, 0)

				local var_10_7 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_7.x, var_10_7.y, var_10_7.z)

				local var_10_8 = var_10_0.localEulerAngles

				var_10_8.z = 0
				var_10_8.x = 0
				var_10_0.localEulerAngles = var_10_8
			end

			local var_10_9 = arg_7_1.actors_["2078ui_story"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect2078ui_story == nil then
				arg_7_1.var_.characterEffect2078ui_story = var_10_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_11 = 0.200000002980232

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11

				if arg_7_1.var_.characterEffect2078ui_story then
					local var_10_13 = Mathf.Lerp(0, 0.5, var_10_12)

					arg_7_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_7_1.var_.characterEffect2078ui_story.fillRatio = var_10_13
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 and arg_7_1.var_.characterEffect2078ui_story then
				local var_10_14 = 0.5

				arg_7_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_7_1.var_.characterEffect2078ui_story.fillRatio = var_10_14
			end

			local var_10_15 = 0
			local var_10_16 = 1.15

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

				local var_10_17 = arg_7_1:GetWordFromCfg(317032002)
				local var_10_18 = arg_7_1:FormatText(var_10_17.content)

				arg_7_1.text_.text = var_10_18

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_19 = 46
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
	Play317032003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317032003
		arg_11_1.duration_ = 3.366

		local var_11_0 = {
			zh = 3.366,
			ja = 2.3
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
				arg_11_0:Play317032004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["2078ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos2078ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2078ui_story, var_14_4, var_14_3)

				local var_14_5 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_5.x, var_14_5.y, var_14_5.z)

				local var_14_6 = var_14_0.localEulerAngles

				var_14_6.z = 0
				var_14_6.x = 0
				var_14_0.localEulerAngles = var_14_6
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_14_7 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_7.x, var_14_7.y, var_14_7.z)

				local var_14_8 = var_14_0.localEulerAngles

				var_14_8.z = 0
				var_14_8.x = 0
				var_14_0.localEulerAngles = var_14_8
			end

			local var_14_9 = arg_11_1.actors_["2078ui_story"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect2078ui_story == nil then
				arg_11_1.var_.characterEffect2078ui_story = var_14_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_11 = 0.200000002980232

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.characterEffect2078ui_story then
					arg_11_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.characterEffect2078ui_story then
				arg_11_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_14_13 = 0

			if var_14_13 < arg_11_1.time_ and arg_11_1.time_ <= var_14_13 + arg_14_0 then
				arg_11_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_15 = "1015ui_story"

			if arg_11_1.actors_[var_14_15] == nil then
				local var_14_16 = Object.Instantiate(Asset.Load("Char/" .. var_14_15), arg_11_1.stage_.transform)

				var_14_16.name = var_14_15
				var_14_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_15] = var_14_16

				local var_14_17 = var_14_16:GetComponentInChildren(typeof(CharacterEffect))

				var_14_17.enabled = true

				local var_14_18 = GameObjectTools.GetOrAddComponent(var_14_16, typeof(DynamicBoneHelper))

				if var_14_18 then
					var_14_18:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_17.transform, false)

				arg_11_1.var_[var_14_15 .. "Animator"] = var_14_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_15 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_15 .. "LipSync"] = var_14_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_19 = arg_11_1.actors_["1015ui_story"].transform
			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.var_.moveOldPos1015ui_story = var_14_19.localPosition
			end

			local var_14_21 = 0.001

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_20) / var_14_21
				local var_14_23 = Vector3.New(0.7, -1.15, -6.2)

				var_14_19.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1015ui_story, var_14_23, var_14_22)

				local var_14_24 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_24.x, var_14_24.y, var_14_24.z)

				local var_14_25 = var_14_19.localEulerAngles

				var_14_25.z = 0
				var_14_25.x = 0
				var_14_19.localEulerAngles = var_14_25
			end

			if arg_11_1.time_ >= var_14_20 + var_14_21 and arg_11_1.time_ < var_14_20 + var_14_21 + arg_14_0 then
				var_14_19.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_14_26 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_26.x, var_14_26.y, var_14_26.z)

				local var_14_27 = var_14_19.localEulerAngles

				var_14_27.z = 0
				var_14_27.x = 0
				var_14_19.localEulerAngles = var_14_27
			end

			local var_14_28 = arg_11_1.actors_["1015ui_story"]
			local var_14_29 = 0

			if var_14_29 < arg_11_1.time_ and arg_11_1.time_ <= var_14_29 + arg_14_0 and arg_11_1.var_.characterEffect1015ui_story == nil then
				arg_11_1.var_.characterEffect1015ui_story = var_14_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_30 = 0.200000002980232

			if var_14_29 <= arg_11_1.time_ and arg_11_1.time_ < var_14_29 + var_14_30 then
				local var_14_31 = (arg_11_1.time_ - var_14_29) / var_14_30

				if arg_11_1.var_.characterEffect1015ui_story then
					local var_14_32 = Mathf.Lerp(0, 0.5, var_14_31)

					arg_11_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1015ui_story.fillRatio = var_14_32
				end
			end

			if arg_11_1.time_ >= var_14_29 + var_14_30 and arg_11_1.time_ < var_14_29 + var_14_30 + arg_14_0 and arg_11_1.var_.characterEffect1015ui_story then
				local var_14_33 = 0.5

				arg_11_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1015ui_story.fillRatio = var_14_33
			end

			local var_14_34 = 0

			if var_14_34 < arg_11_1.time_ and arg_11_1.time_ <= var_14_34 + arg_14_0 then
				arg_11_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_14_35 = 0
			local var_14_36 = 0.325

			if var_14_35 < arg_11_1.time_ and arg_11_1.time_ <= var_14_35 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_37 = arg_11_1:FormatText(StoryNameCfg[528].name)

				arg_11_1.leftNameTxt_.text = var_14_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_38 = arg_11_1:GetWordFromCfg(317032003)
				local var_14_39 = arg_11_1:FormatText(var_14_38.content)

				arg_11_1.text_.text = var_14_39

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_40 = 13
				local var_14_41 = utf8.len(var_14_39)
				local var_14_42 = var_14_40 <= 0 and var_14_36 or var_14_36 * (var_14_41 / var_14_40)

				if var_14_42 > 0 and var_14_36 < var_14_42 then
					arg_11_1.talkMaxDuration = var_14_42

					if var_14_42 + var_14_35 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_42 + var_14_35
					end
				end

				arg_11_1.text_.text = var_14_39
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032003", "story_v_out_317032.awb") ~= 0 then
					local var_14_43 = manager.audio:GetVoiceLength("story_v_out_317032", "317032003", "story_v_out_317032.awb") / 1000

					if var_14_43 + var_14_35 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_43 + var_14_35
					end

					if var_14_38.prefab_name ~= "" and arg_11_1.actors_[var_14_38.prefab_name] ~= nil then
						local var_14_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_38.prefab_name].transform, "story_v_out_317032", "317032003", "story_v_out_317032.awb")

						arg_11_1:RecordAudio("317032003", var_14_44)
						arg_11_1:RecordAudio("317032003", var_14_44)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_317032", "317032003", "story_v_out_317032.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_317032", "317032003", "story_v_out_317032.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_45 = math.max(var_14_36, arg_11_1.talkMaxDuration)

			if var_14_35 <= arg_11_1.time_ and arg_11_1.time_ < var_14_35 + var_14_45 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_35) / var_14_45

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_35 + var_14_45 and arg_11_1.time_ < var_14_35 + var_14_45 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play317032004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317032004
		arg_15_1.duration_ = 1.366

		local var_15_0 = {
			zh = 1.033,
			ja = 1.366
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
				arg_15_0:Play317032005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["2078ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos2078ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos2078ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["2078ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect2078ui_story == nil then
				arg_15_1.var_.characterEffect2078ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect2078ui_story then
					local var_18_13 = Mathf.Lerp(0, 0.5, var_18_12)

					arg_15_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_15_1.var_.characterEffect2078ui_story.fillRatio = var_18_13
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect2078ui_story then
				local var_18_14 = 0.5

				arg_15_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_15_1.var_.characterEffect2078ui_story.fillRatio = var_18_14
			end

			local var_18_15 = arg_15_1.actors_["1015ui_story"].transform
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.var_.moveOldPos1015ui_story = var_18_15.localPosition
			end

			local var_18_17 = 0.001

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17
				local var_18_19 = Vector3.New(0.7, -1.15, -6.2)

				var_18_15.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1015ui_story, var_18_19, var_18_18)

				local var_18_20 = manager.ui.mainCamera.transform.position - var_18_15.position

				var_18_15.forward = Vector3.New(var_18_20.x, var_18_20.y, var_18_20.z)

				local var_18_21 = var_18_15.localEulerAngles

				var_18_21.z = 0
				var_18_21.x = 0
				var_18_15.localEulerAngles = var_18_21
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 then
				var_18_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_18_22 = manager.ui.mainCamera.transform.position - var_18_15.position

				var_18_15.forward = Vector3.New(var_18_22.x, var_18_22.y, var_18_22.z)

				local var_18_23 = var_18_15.localEulerAngles

				var_18_23.z = 0
				var_18_23.x = 0
				var_18_15.localEulerAngles = var_18_23
			end

			local var_18_24 = arg_15_1.actors_["1015ui_story"]
			local var_18_25 = 0

			if var_18_25 < arg_15_1.time_ and arg_15_1.time_ <= var_18_25 + arg_18_0 and arg_15_1.var_.characterEffect1015ui_story == nil then
				arg_15_1.var_.characterEffect1015ui_story = var_18_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_26 = 0.200000002980232

			if var_18_25 <= arg_15_1.time_ and arg_15_1.time_ < var_18_25 + var_18_26 then
				local var_18_27 = (arg_15_1.time_ - var_18_25) / var_18_26

				if arg_15_1.var_.characterEffect1015ui_story then
					arg_15_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_25 + var_18_26 and arg_15_1.time_ < var_18_25 + var_18_26 + arg_18_0 and arg_15_1.var_.characterEffect1015ui_story then
				arg_15_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_18_28 = 0

			if var_18_28 < arg_15_1.time_ and arg_15_1.time_ <= var_18_28 + arg_18_0 then
				arg_15_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 then
				arg_15_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_30 = 0
			local var_18_31 = 0.125

			if var_18_30 < arg_15_1.time_ and arg_15_1.time_ <= var_18_30 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_32 = arg_15_1:FormatText(StoryNameCfg[479].name)

				arg_15_1.leftNameTxt_.text = var_18_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_33 = arg_15_1:GetWordFromCfg(317032004)
				local var_18_34 = arg_15_1:FormatText(var_18_33.content)

				arg_15_1.text_.text = var_18_34

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_35 = 5
				local var_18_36 = utf8.len(var_18_34)
				local var_18_37 = var_18_35 <= 0 and var_18_31 or var_18_31 * (var_18_36 / var_18_35)

				if var_18_37 > 0 and var_18_31 < var_18_37 then
					arg_15_1.talkMaxDuration = var_18_37

					if var_18_37 + var_18_30 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_37 + var_18_30
					end
				end

				arg_15_1.text_.text = var_18_34
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032004", "story_v_out_317032.awb") ~= 0 then
					local var_18_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032004", "story_v_out_317032.awb") / 1000

					if var_18_38 + var_18_30 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_38 + var_18_30
					end

					if var_18_33.prefab_name ~= "" and arg_15_1.actors_[var_18_33.prefab_name] ~= nil then
						local var_18_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_33.prefab_name].transform, "story_v_out_317032", "317032004", "story_v_out_317032.awb")

						arg_15_1:RecordAudio("317032004", var_18_39)
						arg_15_1:RecordAudio("317032004", var_18_39)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317032", "317032004", "story_v_out_317032.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317032", "317032004", "story_v_out_317032.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_40 = math.max(var_18_31, arg_15_1.talkMaxDuration)

			if var_18_30 <= arg_15_1.time_ and arg_15_1.time_ < var_18_30 + var_18_40 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_30) / var_18_40

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_30 + var_18_40 and arg_15_1.time_ < var_18_30 + var_18_40 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play317032005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317032005
		arg_19_1.duration_ = 5.566

		local var_19_0 = {
			zh = 4.466,
			ja = 5.566
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
				arg_19_0:Play317032006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["2078ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos2078ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos2078ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["2078ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect2078ui_story == nil then
				arg_19_1.var_.characterEffect2078ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect2078ui_story then
					arg_19_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect2078ui_story then
				arg_19_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_22_13 = arg_19_1.actors_["1015ui_story"].transform
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1.var_.moveOldPos1015ui_story = var_22_13.localPosition
			end

			local var_22_15 = 0.001

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15
				local var_22_17 = Vector3.New(0.7, -1.15, -6.2)

				var_22_13.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1015ui_story, var_22_17, var_22_16)

				local var_22_18 = manager.ui.mainCamera.transform.position - var_22_13.position

				var_22_13.forward = Vector3.New(var_22_18.x, var_22_18.y, var_22_18.z)

				local var_22_19 = var_22_13.localEulerAngles

				var_22_19.z = 0
				var_22_19.x = 0
				var_22_13.localEulerAngles = var_22_19
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 then
				var_22_13.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_22_20 = manager.ui.mainCamera.transform.position - var_22_13.position

				var_22_13.forward = Vector3.New(var_22_20.x, var_22_20.y, var_22_20.z)

				local var_22_21 = var_22_13.localEulerAngles

				var_22_21.z = 0
				var_22_21.x = 0
				var_22_13.localEulerAngles = var_22_21
			end

			local var_22_22 = arg_19_1.actors_["1015ui_story"]
			local var_22_23 = 0

			if var_22_23 < arg_19_1.time_ and arg_19_1.time_ <= var_22_23 + arg_22_0 and arg_19_1.var_.characterEffect1015ui_story == nil then
				arg_19_1.var_.characterEffect1015ui_story = var_22_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_24 = 0.200000002980232

			if var_22_23 <= arg_19_1.time_ and arg_19_1.time_ < var_22_23 + var_22_24 then
				local var_22_25 = (arg_19_1.time_ - var_22_23) / var_22_24

				if arg_19_1.var_.characterEffect1015ui_story then
					local var_22_26 = Mathf.Lerp(0, 0.5, var_22_25)

					arg_19_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1015ui_story.fillRatio = var_22_26
				end
			end

			if arg_19_1.time_ >= var_22_23 + var_22_24 and arg_19_1.time_ < var_22_23 + var_22_24 + arg_22_0 and arg_19_1.var_.characterEffect1015ui_story then
				local var_22_27 = 0.5

				arg_19_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1015ui_story.fillRatio = var_22_27
			end

			local var_22_28 = 0
			local var_22_29 = 0.575

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_30 = arg_19_1:FormatText(StoryNameCfg[528].name)

				arg_19_1.leftNameTxt_.text = var_22_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_31 = arg_19_1:GetWordFromCfg(317032005)
				local var_22_32 = arg_19_1:FormatText(var_22_31.content)

				arg_19_1.text_.text = var_22_32

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_33 = 23
				local var_22_34 = utf8.len(var_22_32)
				local var_22_35 = var_22_33 <= 0 and var_22_29 or var_22_29 * (var_22_34 / var_22_33)

				if var_22_35 > 0 and var_22_29 < var_22_35 then
					arg_19_1.talkMaxDuration = var_22_35

					if var_22_35 + var_22_28 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_35 + var_22_28
					end
				end

				arg_19_1.text_.text = var_22_32
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032005", "story_v_out_317032.awb") ~= 0 then
					local var_22_36 = manager.audio:GetVoiceLength("story_v_out_317032", "317032005", "story_v_out_317032.awb") / 1000

					if var_22_36 + var_22_28 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_28
					end

					if var_22_31.prefab_name ~= "" and arg_19_1.actors_[var_22_31.prefab_name] ~= nil then
						local var_22_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_31.prefab_name].transform, "story_v_out_317032", "317032005", "story_v_out_317032.awb")

						arg_19_1:RecordAudio("317032005", var_22_37)
						arg_19_1:RecordAudio("317032005", var_22_37)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_317032", "317032005", "story_v_out_317032.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_317032", "317032005", "story_v_out_317032.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_38 = math.max(var_22_29, arg_19_1.talkMaxDuration)

			if var_22_28 <= arg_19_1.time_ and arg_19_1.time_ < var_22_28 + var_22_38 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_28) / var_22_38

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_28 + var_22_38 and arg_19_1.time_ < var_22_28 + var_22_38 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317032006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317032006
		arg_23_1.duration_ = 6.766

		local var_23_0 = {
			zh = 6.766,
			ja = 6.733
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
				arg_23_0:Play317032007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["2078ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos2078ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos2078ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["2078ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect2078ui_story == nil then
				arg_23_1.var_.characterEffect2078ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect2078ui_story then
					local var_26_13 = Mathf.Lerp(0, 0.5, var_26_12)

					arg_23_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_23_1.var_.characterEffect2078ui_story.fillRatio = var_26_13
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect2078ui_story then
				local var_26_14 = 0.5

				arg_23_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_23_1.var_.characterEffect2078ui_story.fillRatio = var_26_14
			end

			local var_26_15 = arg_23_1.actors_["1015ui_story"].transform
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.var_.moveOldPos1015ui_story = var_26_15.localPosition
			end

			local var_26_17 = 0.001

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Vector3.New(0.7, -1.15, -6.2)

				var_26_15.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1015ui_story, var_26_19, var_26_18)

				local var_26_20 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_20.x, var_26_20.y, var_26_20.z)

				local var_26_21 = var_26_15.localEulerAngles

				var_26_21.z = 0
				var_26_21.x = 0
				var_26_15.localEulerAngles = var_26_21
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				var_26_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_26_22 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_22.x, var_26_22.y, var_26_22.z)

				local var_26_23 = var_26_15.localEulerAngles

				var_26_23.z = 0
				var_26_23.x = 0
				var_26_15.localEulerAngles = var_26_23
			end

			local var_26_24 = arg_23_1.actors_["1015ui_story"]
			local var_26_25 = 0

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 and arg_23_1.var_.characterEffect1015ui_story == nil then
				arg_23_1.var_.characterEffect1015ui_story = var_26_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_26 = 0.200000002980232

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_26 then
				local var_26_27 = (arg_23_1.time_ - var_26_25) / var_26_26

				if arg_23_1.var_.characterEffect1015ui_story then
					arg_23_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_25 + var_26_26 and arg_23_1.time_ < var_26_25 + var_26_26 + arg_26_0 and arg_23_1.var_.characterEffect1015ui_story then
				arg_23_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_26_28 = 0

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				arg_23_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_30 = 0
			local var_26_31 = 0.85

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_32 = arg_23_1:FormatText(StoryNameCfg[479].name)

				arg_23_1.leftNameTxt_.text = var_26_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_33 = arg_23_1:GetWordFromCfg(317032006)
				local var_26_34 = arg_23_1:FormatText(var_26_33.content)

				arg_23_1.text_.text = var_26_34

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_35 = 34
				local var_26_36 = utf8.len(var_26_34)
				local var_26_37 = var_26_35 <= 0 and var_26_31 or var_26_31 * (var_26_36 / var_26_35)

				if var_26_37 > 0 and var_26_31 < var_26_37 then
					arg_23_1.talkMaxDuration = var_26_37

					if var_26_37 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_37 + var_26_30
					end
				end

				arg_23_1.text_.text = var_26_34
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032006", "story_v_out_317032.awb") ~= 0 then
					local var_26_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032006", "story_v_out_317032.awb") / 1000

					if var_26_38 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_38 + var_26_30
					end

					if var_26_33.prefab_name ~= "" and arg_23_1.actors_[var_26_33.prefab_name] ~= nil then
						local var_26_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_33.prefab_name].transform, "story_v_out_317032", "317032006", "story_v_out_317032.awb")

						arg_23_1:RecordAudio("317032006", var_26_39)
						arg_23_1:RecordAudio("317032006", var_26_39)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_317032", "317032006", "story_v_out_317032.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_317032", "317032006", "story_v_out_317032.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_40 = math.max(var_26_31, arg_23_1.talkMaxDuration)

			if var_26_30 <= arg_23_1.time_ and arg_23_1.time_ < var_26_30 + var_26_40 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_30) / var_26_40

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_30 + var_26_40 and arg_23_1.time_ < var_26_30 + var_26_40 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play317032007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317032007
		arg_27_1.duration_ = 4.766

		local var_27_0 = {
			zh = 4.033,
			ja = 4.766
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
				arg_27_0:Play317032008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["2078ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos2078ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos2078ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["2078ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect2078ui_story == nil then
				arg_27_1.var_.characterEffect2078ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect2078ui_story then
					arg_27_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect2078ui_story then
				arg_27_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_30_13 = arg_27_1.actors_["1015ui_story"].transform
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1.var_.moveOldPos1015ui_story = var_30_13.localPosition
			end

			local var_30_15 = 0.001

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15
				local var_30_17 = Vector3.New(0.7, -1.15, -6.2)

				var_30_13.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1015ui_story, var_30_17, var_30_16)

				local var_30_18 = manager.ui.mainCamera.transform.position - var_30_13.position

				var_30_13.forward = Vector3.New(var_30_18.x, var_30_18.y, var_30_18.z)

				local var_30_19 = var_30_13.localEulerAngles

				var_30_19.z = 0
				var_30_19.x = 0
				var_30_13.localEulerAngles = var_30_19
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 then
				var_30_13.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_30_20 = manager.ui.mainCamera.transform.position - var_30_13.position

				var_30_13.forward = Vector3.New(var_30_20.x, var_30_20.y, var_30_20.z)

				local var_30_21 = var_30_13.localEulerAngles

				var_30_21.z = 0
				var_30_21.x = 0
				var_30_13.localEulerAngles = var_30_21
			end

			local var_30_22 = arg_27_1.actors_["1015ui_story"]
			local var_30_23 = 0

			if var_30_23 < arg_27_1.time_ and arg_27_1.time_ <= var_30_23 + arg_30_0 and arg_27_1.var_.characterEffect1015ui_story == nil then
				arg_27_1.var_.characterEffect1015ui_story = var_30_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_24 = 0.200000002980232

			if var_30_23 <= arg_27_1.time_ and arg_27_1.time_ < var_30_23 + var_30_24 then
				local var_30_25 = (arg_27_1.time_ - var_30_23) / var_30_24

				if arg_27_1.var_.characterEffect1015ui_story then
					local var_30_26 = Mathf.Lerp(0, 0.5, var_30_25)

					arg_27_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1015ui_story.fillRatio = var_30_26
				end
			end

			if arg_27_1.time_ >= var_30_23 + var_30_24 and arg_27_1.time_ < var_30_23 + var_30_24 + arg_30_0 and arg_27_1.var_.characterEffect1015ui_story then
				local var_30_27 = 0.5

				arg_27_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1015ui_story.fillRatio = var_30_27
			end

			local var_30_28 = 0
			local var_30_29 = 0.55

			if var_30_28 < arg_27_1.time_ and arg_27_1.time_ <= var_30_28 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_30 = arg_27_1:FormatText(StoryNameCfg[528].name)

				arg_27_1.leftNameTxt_.text = var_30_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_31 = arg_27_1:GetWordFromCfg(317032007)
				local var_30_32 = arg_27_1:FormatText(var_30_31.content)

				arg_27_1.text_.text = var_30_32

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_33 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032007", "story_v_out_317032.awb") ~= 0 then
					local var_30_36 = manager.audio:GetVoiceLength("story_v_out_317032", "317032007", "story_v_out_317032.awb") / 1000

					if var_30_36 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_28
					end

					if var_30_31.prefab_name ~= "" and arg_27_1.actors_[var_30_31.prefab_name] ~= nil then
						local var_30_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_31.prefab_name].transform, "story_v_out_317032", "317032007", "story_v_out_317032.awb")

						arg_27_1:RecordAudio("317032007", var_30_37)
						arg_27_1:RecordAudio("317032007", var_30_37)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_317032", "317032007", "story_v_out_317032.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_317032", "317032007", "story_v_out_317032.awb")
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
	Play317032008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 317032008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play317032009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["2078ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos2078ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos2078ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, 100, 0)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1015ui_story"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos1015ui_story = var_34_9.localPosition
			end

			local var_34_11 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11
				local var_34_13 = Vector3.New(0, 100, 0)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1015ui_story, var_34_13, var_34_12)

				local var_34_14 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_14.x, var_34_14.y, var_34_14.z)

				local var_34_15 = var_34_9.localEulerAngles

				var_34_15.z = 0
				var_34_15.x = 0
				var_34_9.localEulerAngles = var_34_15
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(0, 100, 0)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_9.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_9.localEulerAngles = var_34_17
			end

			local var_34_18 = 0
			local var_34_19 = 1.375

			if var_34_18 < arg_31_1.time_ and arg_31_1.time_ <= var_34_18 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_20 = arg_31_1:GetWordFromCfg(317032008)
				local var_34_21 = arg_31_1:FormatText(var_34_20.content)

				arg_31_1.text_.text = var_34_21

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_22 = 55
				local var_34_23 = utf8.len(var_34_21)
				local var_34_24 = var_34_22 <= 0 and var_34_19 or var_34_19 * (var_34_23 / var_34_22)

				if var_34_24 > 0 and var_34_19 < var_34_24 then
					arg_31_1.talkMaxDuration = var_34_24

					if var_34_24 + var_34_18 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_24 + var_34_18
					end
				end

				arg_31_1.text_.text = var_34_21
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_25 = math.max(var_34_19, arg_31_1.talkMaxDuration)

			if var_34_18 <= arg_31_1.time_ and arg_31_1.time_ < var_34_18 + var_34_25 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_18) / var_34_25

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_18 + var_34_25 and arg_31_1.time_ < var_34_18 + var_34_25 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play317032009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317032009
		arg_35_1.duration_ = 2.933

		local var_35_0 = {
			zh = 2.1,
			ja = 2.933
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
				arg_35_0:Play317032010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1015ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1015ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, -1.15, -6.2)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1015ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1015ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1015ui_story == nil then
				arg_35_1.var_.characterEffect1015ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1015ui_story then
					arg_35_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1015ui_story then
				arg_35_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_15 = 0
			local var_38_16 = 0.275

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_17 = arg_35_1:FormatText(StoryNameCfg[479].name)

				arg_35_1.leftNameTxt_.text = var_38_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_18 = arg_35_1:GetWordFromCfg(317032009)
				local var_38_19 = arg_35_1:FormatText(var_38_18.content)

				arg_35_1.text_.text = var_38_19

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_20 = 11
				local var_38_21 = utf8.len(var_38_19)
				local var_38_22 = var_38_20 <= 0 and var_38_16 or var_38_16 * (var_38_21 / var_38_20)

				if var_38_22 > 0 and var_38_16 < var_38_22 then
					arg_35_1.talkMaxDuration = var_38_22

					if var_38_22 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_22 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_19
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032009", "story_v_out_317032.awb") ~= 0 then
					local var_38_23 = manager.audio:GetVoiceLength("story_v_out_317032", "317032009", "story_v_out_317032.awb") / 1000

					if var_38_23 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_15
					end

					if var_38_18.prefab_name ~= "" and arg_35_1.actors_[var_38_18.prefab_name] ~= nil then
						local var_38_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_18.prefab_name].transform, "story_v_out_317032", "317032009", "story_v_out_317032.awb")

						arg_35_1:RecordAudio("317032009", var_38_24)
						arg_35_1:RecordAudio("317032009", var_38_24)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_317032", "317032009", "story_v_out_317032.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_317032", "317032009", "story_v_out_317032.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_25 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_25 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_25

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_25 and arg_35_1.time_ < var_38_15 + var_38_25 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play317032010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317032010
		arg_39_1.duration_ = 0.999999999999

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play317032011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1015ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1015ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1015ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, 100, 0)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1015ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1015ui_story == nil then
				arg_39_1.var_.characterEffect1015ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1015ui_story then
					local var_42_13 = Mathf.Lerp(0, 0.5, var_42_12)

					arg_39_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1015ui_story.fillRatio = var_42_13
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1015ui_story then
				local var_42_14 = 0.5

				arg_39_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1015ui_story.fillRatio = var_42_14
			end

			local var_42_15 = arg_39_1.actors_["2078ui_story"].transform
			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.var_.moveOldPos2078ui_story = var_42_15.localPosition
			end

			local var_42_17 = 0.001

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / var_42_17
				local var_42_19 = Vector3.New(0, -1.28, -5.6)

				var_42_15.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos2078ui_story, var_42_19, var_42_18)

				local var_42_20 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_20.x, var_42_20.y, var_42_20.z)

				local var_42_21 = var_42_15.localEulerAngles

				var_42_21.z = 0
				var_42_21.x = 0
				var_42_15.localEulerAngles = var_42_21
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 then
				var_42_15.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_42_22 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_22.x, var_42_22.y, var_42_22.z)

				local var_42_23 = var_42_15.localEulerAngles

				var_42_23.z = 0
				var_42_23.x = 0
				var_42_15.localEulerAngles = var_42_23
			end

			local var_42_24 = arg_39_1.actors_["2078ui_story"]
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 and arg_39_1.var_.characterEffect2078ui_story == nil then
				arg_39_1.var_.characterEffect2078ui_story = var_42_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_26 = 0.200000002980232

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26

				if arg_39_1.var_.characterEffect2078ui_story then
					arg_39_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 and arg_39_1.var_.characterEffect2078ui_story then
				arg_39_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_42_28 = 0

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_42_29 = 0

			if var_42_29 < arg_39_1.time_ and arg_39_1.time_ <= var_42_29 + arg_42_0 then
				arg_39_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_30 = 0
			local var_42_31 = 0.075

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[528].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(317032010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 3
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032010", "story_v_out_317032.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032010", "story_v_out_317032.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_317032", "317032010", "story_v_out_317032.awb")

						arg_39_1:RecordAudio("317032010", var_42_39)
						arg_39_1:RecordAudio("317032010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_317032", "317032010", "story_v_out_317032.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_317032", "317032010", "story_v_out_317032.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_40 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_40 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_30) / var_42_40

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_30 + var_42_40 and arg_39_1.time_ < var_42_30 + var_42_40 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play317032011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 317032011
		arg_43_1.duration_ = 10.366

		local var_43_0 = {
			zh = 10.366,
			ja = 9.4
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
				arg_43_0:Play317032012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["2078ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos2078ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos2078ui_story, var_46_4, var_46_3)

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

			local var_46_9 = arg_43_1.actors_["2078ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect2078ui_story == nil then
				arg_43_1.var_.characterEffect2078ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect2078ui_story then
					local var_46_13 = Mathf.Lerp(0, 0.5, var_46_12)

					arg_43_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_43_1.var_.characterEffect2078ui_story.fillRatio = var_46_13
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect2078ui_story then
				local var_46_14 = 0.5

				arg_43_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_43_1.var_.characterEffect2078ui_story.fillRatio = var_46_14
			end

			local var_46_15 = "2079ui_story"

			if arg_43_1.actors_[var_46_15] == nil then
				local var_46_16 = Object.Instantiate(Asset.Load("Char/" .. var_46_15), arg_43_1.stage_.transform)

				var_46_16.name = var_46_15
				var_46_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.actors_[var_46_15] = var_46_16

				local var_46_17 = var_46_16:GetComponentInChildren(typeof(CharacterEffect))

				var_46_17.enabled = true

				local var_46_18 = GameObjectTools.GetOrAddComponent(var_46_16, typeof(DynamicBoneHelper))

				if var_46_18 then
					var_46_18:EnableDynamicBone(false)
				end

				arg_43_1:ShowWeapon(var_46_17.transform, false)

				arg_43_1.var_[var_46_15 .. "Animator"] = var_46_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_43_1.var_[var_46_15 .. "Animator"].applyRootMotion = true
				arg_43_1.var_[var_46_15 .. "LipSync"] = var_46_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_46_19 = arg_43_1.actors_["2079ui_story"].transform
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.var_.moveOldPos2079ui_story = var_46_19.localPosition
			end

			local var_46_21 = 0.001

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / var_46_21
				local var_46_23 = Vector3.New(0, -1.28, -5.6)

				var_46_19.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos2079ui_story, var_46_23, var_46_22)

				local var_46_24 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_24.x, var_46_24.y, var_46_24.z)

				local var_46_25 = var_46_19.localEulerAngles

				var_46_25.z = 0
				var_46_25.x = 0
				var_46_19.localEulerAngles = var_46_25
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 then
				var_46_19.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_46_26 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_26.x, var_46_26.y, var_46_26.z)

				local var_46_27 = var_46_19.localEulerAngles

				var_46_27.z = 0
				var_46_27.x = 0
				var_46_19.localEulerAngles = var_46_27
			end

			local var_46_28 = arg_43_1.actors_["2079ui_story"]
			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 and arg_43_1.var_.characterEffect2079ui_story == nil then
				arg_43_1.var_.characterEffect2079ui_story = var_46_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_30 = 0.200000002980232

			if var_46_29 <= arg_43_1.time_ and arg_43_1.time_ < var_46_29 + var_46_30 then
				local var_46_31 = (arg_43_1.time_ - var_46_29) / var_46_30

				if arg_43_1.var_.characterEffect2079ui_story then
					arg_43_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_29 + var_46_30 and arg_43_1.time_ < var_46_29 + var_46_30 + arg_46_0 and arg_43_1.var_.characterEffect2079ui_story then
				arg_43_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_46_32 = 0

			if var_46_32 < arg_43_1.time_ and arg_43_1.time_ <= var_46_32 + arg_46_0 then
				arg_43_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_46_33 = 0

			if var_46_33 < arg_43_1.time_ and arg_43_1.time_ <= var_46_33 + arg_46_0 then
				arg_43_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_34 = 0
			local var_46_35 = 1.3

			if var_46_34 < arg_43_1.time_ and arg_43_1.time_ <= var_46_34 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_36 = arg_43_1:FormatText(StoryNameCfg[529].name)

				arg_43_1.leftNameTxt_.text = var_46_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_37 = arg_43_1:GetWordFromCfg(317032011)
				local var_46_38 = arg_43_1:FormatText(var_46_37.content)

				arg_43_1.text_.text = var_46_38

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_39 = 52
				local var_46_40 = utf8.len(var_46_38)
				local var_46_41 = var_46_39 <= 0 and var_46_35 or var_46_35 * (var_46_40 / var_46_39)

				if var_46_41 > 0 and var_46_35 < var_46_41 then
					arg_43_1.talkMaxDuration = var_46_41

					if var_46_41 + var_46_34 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_41 + var_46_34
					end
				end

				arg_43_1.text_.text = var_46_38
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032011", "story_v_out_317032.awb") ~= 0 then
					local var_46_42 = manager.audio:GetVoiceLength("story_v_out_317032", "317032011", "story_v_out_317032.awb") / 1000

					if var_46_42 + var_46_34 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_42 + var_46_34
					end

					if var_46_37.prefab_name ~= "" and arg_43_1.actors_[var_46_37.prefab_name] ~= nil then
						local var_46_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_37.prefab_name].transform, "story_v_out_317032", "317032011", "story_v_out_317032.awb")

						arg_43_1:RecordAudio("317032011", var_46_43)
						arg_43_1:RecordAudio("317032011", var_46_43)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_317032", "317032011", "story_v_out_317032.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_317032", "317032011", "story_v_out_317032.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_44 = math.max(var_46_35, arg_43_1.talkMaxDuration)

			if var_46_34 <= arg_43_1.time_ and arg_43_1.time_ < var_46_34 + var_46_44 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_34) / var_46_44

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_34 + var_46_44 and arg_43_1.time_ < var_46_34 + var_46_44 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play317032012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 317032012
		arg_47_1.duration_ = 8.8

		local var_47_0 = {
			zh = 8.8,
			ja = 8.1
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
				arg_47_0:Play317032013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["2079ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos2079ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos2079ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["2079ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect2079ui_story == nil then
				arg_47_1.var_.characterEffect2079ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect2079ui_story then
					local var_50_13 = Mathf.Lerp(0, 0.5, var_50_12)

					arg_47_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_47_1.var_.characterEffect2079ui_story.fillRatio = var_50_13
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect2079ui_story then
				local var_50_14 = 0.5

				arg_47_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_47_1.var_.characterEffect2079ui_story.fillRatio = var_50_14
			end

			local var_50_15 = arg_47_1.actors_["1015ui_story"].transform
			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.var_.moveOldPos1015ui_story = var_50_15.localPosition
			end

			local var_50_17 = 0.001

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17
				local var_50_19 = Vector3.New(0.7, -1.15, -6.2)

				var_50_15.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1015ui_story, var_50_19, var_50_18)

				local var_50_20 = manager.ui.mainCamera.transform.position - var_50_15.position

				var_50_15.forward = Vector3.New(var_50_20.x, var_50_20.y, var_50_20.z)

				local var_50_21 = var_50_15.localEulerAngles

				var_50_21.z = 0
				var_50_21.x = 0
				var_50_15.localEulerAngles = var_50_21
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				var_50_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_50_22 = manager.ui.mainCamera.transform.position - var_50_15.position

				var_50_15.forward = Vector3.New(var_50_22.x, var_50_22.y, var_50_22.z)

				local var_50_23 = var_50_15.localEulerAngles

				var_50_23.z = 0
				var_50_23.x = 0
				var_50_15.localEulerAngles = var_50_23
			end

			local var_50_24 = arg_47_1.actors_["1015ui_story"]
			local var_50_25 = 0

			if var_50_25 < arg_47_1.time_ and arg_47_1.time_ <= var_50_25 + arg_50_0 and arg_47_1.var_.characterEffect1015ui_story == nil then
				arg_47_1.var_.characterEffect1015ui_story = var_50_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_26 = 0.200000002980232

			if var_50_25 <= arg_47_1.time_ and arg_47_1.time_ < var_50_25 + var_50_26 then
				local var_50_27 = (arg_47_1.time_ - var_50_25) / var_50_26

				if arg_47_1.var_.characterEffect1015ui_story then
					arg_47_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_25 + var_50_26 and arg_47_1.time_ < var_50_25 + var_50_26 + arg_50_0 and arg_47_1.var_.characterEffect1015ui_story then
				arg_47_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_50_28 = 0

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				arg_47_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action6_1")
			end

			local var_50_29 = 0

			if var_50_29 < arg_47_1.time_ and arg_47_1.time_ <= var_50_29 + arg_50_0 then
				arg_47_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_30 = 0
			local var_50_31 = 1.025

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_32 = arg_47_1:FormatText(StoryNameCfg[479].name)

				arg_47_1.leftNameTxt_.text = var_50_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_33 = arg_47_1:GetWordFromCfg(317032012)
				local var_50_34 = arg_47_1:FormatText(var_50_33.content)

				arg_47_1.text_.text = var_50_34

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_35 = 41
				local var_50_36 = utf8.len(var_50_34)
				local var_50_37 = var_50_35 <= 0 and var_50_31 or var_50_31 * (var_50_36 / var_50_35)

				if var_50_37 > 0 and var_50_31 < var_50_37 then
					arg_47_1.talkMaxDuration = var_50_37

					if var_50_37 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_37 + var_50_30
					end
				end

				arg_47_1.text_.text = var_50_34
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032012", "story_v_out_317032.awb") ~= 0 then
					local var_50_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032012", "story_v_out_317032.awb") / 1000

					if var_50_38 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_38 + var_50_30
					end

					if var_50_33.prefab_name ~= "" and arg_47_1.actors_[var_50_33.prefab_name] ~= nil then
						local var_50_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_33.prefab_name].transform, "story_v_out_317032", "317032012", "story_v_out_317032.awb")

						arg_47_1:RecordAudio("317032012", var_50_39)
						arg_47_1:RecordAudio("317032012", var_50_39)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_317032", "317032012", "story_v_out_317032.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_317032", "317032012", "story_v_out_317032.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_40 = math.max(var_50_31, arg_47_1.talkMaxDuration)

			if var_50_30 <= arg_47_1.time_ and arg_47_1.time_ < var_50_30 + var_50_40 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_30) / var_50_40

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_30 + var_50_40 and arg_47_1.time_ < var_50_30 + var_50_40 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play317032013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317032013
		arg_51_1.duration_ = 2.433

		local var_51_0 = {
			zh = 1.1,
			ja = 2.433
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
				arg_51_0:Play317032014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["2079ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos2079ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos2079ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["2079ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect2079ui_story == nil then
				arg_51_1.var_.characterEffect2079ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect2079ui_story then
					arg_51_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect2079ui_story then
				arg_51_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_54_13 = arg_51_1.actors_["1015ui_story"].transform
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1.var_.moveOldPos1015ui_story = var_54_13.localPosition
			end

			local var_54_15 = 0.001

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15
				local var_54_17 = Vector3.New(0.7, -1.15, -6.2)

				var_54_13.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1015ui_story, var_54_17, var_54_16)

				local var_54_18 = manager.ui.mainCamera.transform.position - var_54_13.position

				var_54_13.forward = Vector3.New(var_54_18.x, var_54_18.y, var_54_18.z)

				local var_54_19 = var_54_13.localEulerAngles

				var_54_19.z = 0
				var_54_19.x = 0
				var_54_13.localEulerAngles = var_54_19
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 then
				var_54_13.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_54_20 = manager.ui.mainCamera.transform.position - var_54_13.position

				var_54_13.forward = Vector3.New(var_54_20.x, var_54_20.y, var_54_20.z)

				local var_54_21 = var_54_13.localEulerAngles

				var_54_21.z = 0
				var_54_21.x = 0
				var_54_13.localEulerAngles = var_54_21
			end

			local var_54_22 = arg_51_1.actors_["1015ui_story"]
			local var_54_23 = 0

			if var_54_23 < arg_51_1.time_ and arg_51_1.time_ <= var_54_23 + arg_54_0 and arg_51_1.var_.characterEffect1015ui_story == nil then
				arg_51_1.var_.characterEffect1015ui_story = var_54_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_24 = 0.200000002980232

			if var_54_23 <= arg_51_1.time_ and arg_51_1.time_ < var_54_23 + var_54_24 then
				local var_54_25 = (arg_51_1.time_ - var_54_23) / var_54_24

				if arg_51_1.var_.characterEffect1015ui_story then
					local var_54_26 = Mathf.Lerp(0, 0.5, var_54_25)

					arg_51_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1015ui_story.fillRatio = var_54_26
				end
			end

			if arg_51_1.time_ >= var_54_23 + var_54_24 and arg_51_1.time_ < var_54_23 + var_54_24 + arg_54_0 and arg_51_1.var_.characterEffect1015ui_story then
				local var_54_27 = 0.5

				arg_51_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1015ui_story.fillRatio = var_54_27
			end

			local var_54_28 = 0
			local var_54_29 = 0.1

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_30 = arg_51_1:FormatText(StoryNameCfg[529].name)

				arg_51_1.leftNameTxt_.text = var_54_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_31 = arg_51_1:GetWordFromCfg(317032013)
				local var_54_32 = arg_51_1:FormatText(var_54_31.content)

				arg_51_1.text_.text = var_54_32

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_33 = 4
				local var_54_34 = utf8.len(var_54_32)
				local var_54_35 = var_54_33 <= 0 and var_54_29 or var_54_29 * (var_54_34 / var_54_33)

				if var_54_35 > 0 and var_54_29 < var_54_35 then
					arg_51_1.talkMaxDuration = var_54_35

					if var_54_35 + var_54_28 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_35 + var_54_28
					end
				end

				arg_51_1.text_.text = var_54_32
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032013", "story_v_out_317032.awb") ~= 0 then
					local var_54_36 = manager.audio:GetVoiceLength("story_v_out_317032", "317032013", "story_v_out_317032.awb") / 1000

					if var_54_36 + var_54_28 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_36 + var_54_28
					end

					if var_54_31.prefab_name ~= "" and arg_51_1.actors_[var_54_31.prefab_name] ~= nil then
						local var_54_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_31.prefab_name].transform, "story_v_out_317032", "317032013", "story_v_out_317032.awb")

						arg_51_1:RecordAudio("317032013", var_54_37)
						arg_51_1:RecordAudio("317032013", var_54_37)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_317032", "317032013", "story_v_out_317032.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_317032", "317032013", "story_v_out_317032.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_38 = math.max(var_54_29, arg_51_1.talkMaxDuration)

			if var_54_28 <= arg_51_1.time_ and arg_51_1.time_ < var_54_28 + var_54_38 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_28) / var_54_38

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_28 + var_54_38 and arg_51_1.time_ < var_54_28 + var_54_38 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play317032014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317032014
		arg_55_1.duration_ = 8.133

		local var_55_0 = {
			zh = 5.6,
			ja = 8.133
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
				arg_55_0:Play317032015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["2079ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos2079ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, 100, 0)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos2079ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, 100, 0)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["2079ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect2079ui_story == nil then
				arg_55_1.var_.characterEffect2079ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect2079ui_story then
					local var_58_13 = Mathf.Lerp(0, 0.5, var_58_12)

					arg_55_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_55_1.var_.characterEffect2079ui_story.fillRatio = var_58_13
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect2079ui_story then
				local var_58_14 = 0.5

				arg_55_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_55_1.var_.characterEffect2079ui_story.fillRatio = var_58_14
			end

			local var_58_15 = arg_55_1.actors_["1015ui_story"].transform
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.var_.moveOldPos1015ui_story = var_58_15.localPosition
			end

			local var_58_17 = 0.001

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Vector3.New(0, 100, 0)

				var_58_15.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1015ui_story, var_58_19, var_58_18)

				local var_58_20 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_20.x, var_58_20.y, var_58_20.z)

				local var_58_21 = var_58_15.localEulerAngles

				var_58_21.z = 0
				var_58_21.x = 0
				var_58_15.localEulerAngles = var_58_21
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 then
				var_58_15.localPosition = Vector3.New(0, 100, 0)

				local var_58_22 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_22.x, var_58_22.y, var_58_22.z)

				local var_58_23 = var_58_15.localEulerAngles

				var_58_23.z = 0
				var_58_23.x = 0
				var_58_15.localEulerAngles = var_58_23
			end

			local var_58_24 = arg_55_1.actors_["1015ui_story"]
			local var_58_25 = 0

			if var_58_25 < arg_55_1.time_ and arg_55_1.time_ <= var_58_25 + arg_58_0 and arg_55_1.var_.characterEffect1015ui_story == nil then
				arg_55_1.var_.characterEffect1015ui_story = var_58_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_26 = 0.200000002980232

			if var_58_25 <= arg_55_1.time_ and arg_55_1.time_ < var_58_25 + var_58_26 then
				local var_58_27 = (arg_55_1.time_ - var_58_25) / var_58_26

				if arg_55_1.var_.characterEffect1015ui_story then
					local var_58_28 = Mathf.Lerp(0, 0.5, var_58_27)

					arg_55_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1015ui_story.fillRatio = var_58_28
				end
			end

			if arg_55_1.time_ >= var_58_25 + var_58_26 and arg_55_1.time_ < var_58_25 + var_58_26 + arg_58_0 and arg_55_1.var_.characterEffect1015ui_story then
				local var_58_29 = 0.5

				arg_55_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1015ui_story.fillRatio = var_58_29
			end

			local var_58_30 = "1093ui_story"

			if arg_55_1.actors_[var_58_30] == nil then
				local var_58_31 = Object.Instantiate(Asset.Load("Char/" .. var_58_30), arg_55_1.stage_.transform)

				var_58_31.name = var_58_30
				var_58_31.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.actors_[var_58_30] = var_58_31

				local var_58_32 = var_58_31:GetComponentInChildren(typeof(CharacterEffect))

				var_58_32.enabled = true

				local var_58_33 = GameObjectTools.GetOrAddComponent(var_58_31, typeof(DynamicBoneHelper))

				if var_58_33 then
					var_58_33:EnableDynamicBone(false)
				end

				arg_55_1:ShowWeapon(var_58_32.transform, false)

				arg_55_1.var_[var_58_30 .. "Animator"] = var_58_32.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_55_1.var_[var_58_30 .. "Animator"].applyRootMotion = true
				arg_55_1.var_[var_58_30 .. "LipSync"] = var_58_32.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_58_34 = arg_55_1.actors_["1093ui_story"].transform
			local var_58_35 = 0

			if var_58_35 < arg_55_1.time_ and arg_55_1.time_ <= var_58_35 + arg_58_0 then
				arg_55_1.var_.moveOldPos1093ui_story = var_58_34.localPosition
			end

			local var_58_36 = 0.001

			if var_58_35 <= arg_55_1.time_ and arg_55_1.time_ < var_58_35 + var_58_36 then
				local var_58_37 = (arg_55_1.time_ - var_58_35) / var_58_36
				local var_58_38 = Vector3.New(0, -1.11, -5.88)

				var_58_34.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1093ui_story, var_58_38, var_58_37)

				local var_58_39 = manager.ui.mainCamera.transform.position - var_58_34.position

				var_58_34.forward = Vector3.New(var_58_39.x, var_58_39.y, var_58_39.z)

				local var_58_40 = var_58_34.localEulerAngles

				var_58_40.z = 0
				var_58_40.x = 0
				var_58_34.localEulerAngles = var_58_40
			end

			if arg_55_1.time_ >= var_58_35 + var_58_36 and arg_55_1.time_ < var_58_35 + var_58_36 + arg_58_0 then
				var_58_34.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_58_41 = manager.ui.mainCamera.transform.position - var_58_34.position

				var_58_34.forward = Vector3.New(var_58_41.x, var_58_41.y, var_58_41.z)

				local var_58_42 = var_58_34.localEulerAngles

				var_58_42.z = 0
				var_58_42.x = 0
				var_58_34.localEulerAngles = var_58_42
			end

			local var_58_43 = arg_55_1.actors_["1093ui_story"]
			local var_58_44 = 0

			if var_58_44 < arg_55_1.time_ and arg_55_1.time_ <= var_58_44 + arg_58_0 and arg_55_1.var_.characterEffect1093ui_story == nil then
				arg_55_1.var_.characterEffect1093ui_story = var_58_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_45 = 0.200000002980232

			if var_58_44 <= arg_55_1.time_ and arg_55_1.time_ < var_58_44 + var_58_45 then
				local var_58_46 = (arg_55_1.time_ - var_58_44) / var_58_45

				if arg_55_1.var_.characterEffect1093ui_story then
					arg_55_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_44 + var_58_45 and arg_55_1.time_ < var_58_44 + var_58_45 + arg_58_0 and arg_55_1.var_.characterEffect1093ui_story then
				arg_55_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_58_47 = 0

			if var_58_47 < arg_55_1.time_ and arg_55_1.time_ <= var_58_47 + arg_58_0 then
				arg_55_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_58_48 = 0

			if var_58_48 < arg_55_1.time_ and arg_55_1.time_ <= var_58_48 + arg_58_0 then
				arg_55_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_58_49 = 0
			local var_58_50 = 0.75

			if var_58_49 < arg_55_1.time_ and arg_55_1.time_ <= var_58_49 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_51 = arg_55_1:FormatText(StoryNameCfg[73].name)

				arg_55_1.leftNameTxt_.text = var_58_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_52 = arg_55_1:GetWordFromCfg(317032014)
				local var_58_53 = arg_55_1:FormatText(var_58_52.content)

				arg_55_1.text_.text = var_58_53

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_54 = 30
				local var_58_55 = utf8.len(var_58_53)
				local var_58_56 = var_58_54 <= 0 and var_58_50 or var_58_50 * (var_58_55 / var_58_54)

				if var_58_56 > 0 and var_58_50 < var_58_56 then
					arg_55_1.talkMaxDuration = var_58_56

					if var_58_56 + var_58_49 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_56 + var_58_49
					end
				end

				arg_55_1.text_.text = var_58_53
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032014", "story_v_out_317032.awb") ~= 0 then
					local var_58_57 = manager.audio:GetVoiceLength("story_v_out_317032", "317032014", "story_v_out_317032.awb") / 1000

					if var_58_57 + var_58_49 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_57 + var_58_49
					end

					if var_58_52.prefab_name ~= "" and arg_55_1.actors_[var_58_52.prefab_name] ~= nil then
						local var_58_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_52.prefab_name].transform, "story_v_out_317032", "317032014", "story_v_out_317032.awb")

						arg_55_1:RecordAudio("317032014", var_58_58)
						arg_55_1:RecordAudio("317032014", var_58_58)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_317032", "317032014", "story_v_out_317032.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_317032", "317032014", "story_v_out_317032.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_59 = math.max(var_58_50, arg_55_1.talkMaxDuration)

			if var_58_49 <= arg_55_1.time_ and arg_55_1.time_ < var_58_49 + var_58_59 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_49) / var_58_59

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_49 + var_58_59 and arg_55_1.time_ < var_58_49 + var_58_59 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play317032015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 317032015
		arg_59_1.duration_ = 8.7

		local var_59_0 = {
			zh = 8.7,
			ja = 6.833
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
				arg_59_0:Play317032016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1093ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1093ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0, 100, 0)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1093ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0, 100, 0)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["1093ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1093ui_story == nil then
				arg_59_1.var_.characterEffect1093ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect1093ui_story then
					local var_62_13 = Mathf.Lerp(0, 0.5, var_62_12)

					arg_59_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1093ui_story.fillRatio = var_62_13
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1093ui_story then
				local var_62_14 = 0.5

				arg_59_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1093ui_story.fillRatio = var_62_14
			end

			local var_62_15 = arg_59_1.actors_["2078ui_story"].transform
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.var_.moveOldPos2078ui_story = var_62_15.localPosition
			end

			local var_62_17 = 0.001

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17
				local var_62_19 = Vector3.New(0, -1.28, -5.6)

				var_62_15.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos2078ui_story, var_62_19, var_62_18)

				local var_62_20 = manager.ui.mainCamera.transform.position - var_62_15.position

				var_62_15.forward = Vector3.New(var_62_20.x, var_62_20.y, var_62_20.z)

				local var_62_21 = var_62_15.localEulerAngles

				var_62_21.z = 0
				var_62_21.x = 0
				var_62_15.localEulerAngles = var_62_21
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 then
				var_62_15.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_62_22 = manager.ui.mainCamera.transform.position - var_62_15.position

				var_62_15.forward = Vector3.New(var_62_22.x, var_62_22.y, var_62_22.z)

				local var_62_23 = var_62_15.localEulerAngles

				var_62_23.z = 0
				var_62_23.x = 0
				var_62_15.localEulerAngles = var_62_23
			end

			local var_62_24 = arg_59_1.actors_["2078ui_story"]
			local var_62_25 = 0

			if var_62_25 < arg_59_1.time_ and arg_59_1.time_ <= var_62_25 + arg_62_0 and arg_59_1.var_.characterEffect2078ui_story == nil then
				arg_59_1.var_.characterEffect2078ui_story = var_62_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_26 = 0.200000002980232

			if var_62_25 <= arg_59_1.time_ and arg_59_1.time_ < var_62_25 + var_62_26 then
				local var_62_27 = (arg_59_1.time_ - var_62_25) / var_62_26

				if arg_59_1.var_.characterEffect2078ui_story then
					arg_59_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_25 + var_62_26 and arg_59_1.time_ < var_62_25 + var_62_26 + arg_62_0 and arg_59_1.var_.characterEffect2078ui_story then
				arg_59_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_62_28 = 0

			if var_62_28 < arg_59_1.time_ and arg_59_1.time_ <= var_62_28 + arg_62_0 then
				arg_59_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_62_29 = 0

			if var_62_29 < arg_59_1.time_ and arg_59_1.time_ <= var_62_29 + arg_62_0 then
				arg_59_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_30 = 0
			local var_62_31 = 1.225

			if var_62_30 < arg_59_1.time_ and arg_59_1.time_ <= var_62_30 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_32 = arg_59_1:FormatText(StoryNameCfg[530].name)

				arg_59_1.leftNameTxt_.text = var_62_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_33 = arg_59_1:GetWordFromCfg(317032015)
				local var_62_34 = arg_59_1:FormatText(var_62_33.content)

				arg_59_1.text_.text = var_62_34

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_35 = 49
				local var_62_36 = utf8.len(var_62_34)
				local var_62_37 = var_62_35 <= 0 and var_62_31 or var_62_31 * (var_62_36 / var_62_35)

				if var_62_37 > 0 and var_62_31 < var_62_37 then
					arg_59_1.talkMaxDuration = var_62_37

					if var_62_37 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_37 + var_62_30
					end
				end

				arg_59_1.text_.text = var_62_34
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032015", "story_v_out_317032.awb") ~= 0 then
					local var_62_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032015", "story_v_out_317032.awb") / 1000

					if var_62_38 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_38 + var_62_30
					end

					if var_62_33.prefab_name ~= "" and arg_59_1.actors_[var_62_33.prefab_name] ~= nil then
						local var_62_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_33.prefab_name].transform, "story_v_out_317032", "317032015", "story_v_out_317032.awb")

						arg_59_1:RecordAudio("317032015", var_62_39)
						arg_59_1:RecordAudio("317032015", var_62_39)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_317032", "317032015", "story_v_out_317032.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_317032", "317032015", "story_v_out_317032.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_40 = math.max(var_62_31, arg_59_1.talkMaxDuration)

			if var_62_30 <= arg_59_1.time_ and arg_59_1.time_ < var_62_30 + var_62_40 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_30) / var_62_40

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_30 + var_62_40 and arg_59_1.time_ < var_62_30 + var_62_40 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play317032016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317032016
		arg_63_1.duration_ = 2.233

		local var_63_0 = {
			zh = 1.999999999999,
			ja = 2.233
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
				arg_63_0:Play317032017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1093ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1093ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, -1.11, -5.88)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1093ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1093ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1093ui_story == nil then
				arg_63_1.var_.characterEffect1093ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1093ui_story then
					arg_63_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1093ui_story then
				arg_63_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_66_14 = arg_63_1.actors_["2078ui_story"].transform
			local var_66_15 = 0

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 then
				arg_63_1.var_.moveOldPos2078ui_story = var_66_14.localPosition
			end

			local var_66_16 = 0.001

			if var_66_15 <= arg_63_1.time_ and arg_63_1.time_ < var_66_15 + var_66_16 then
				local var_66_17 = (arg_63_1.time_ - var_66_15) / var_66_16
				local var_66_18 = Vector3.New(0, 100, 0)

				var_66_14.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2078ui_story, var_66_18, var_66_17)

				local var_66_19 = manager.ui.mainCamera.transform.position - var_66_14.position

				var_66_14.forward = Vector3.New(var_66_19.x, var_66_19.y, var_66_19.z)

				local var_66_20 = var_66_14.localEulerAngles

				var_66_20.z = 0
				var_66_20.x = 0
				var_66_14.localEulerAngles = var_66_20
			end

			if arg_63_1.time_ >= var_66_15 + var_66_16 and arg_63_1.time_ < var_66_15 + var_66_16 + arg_66_0 then
				var_66_14.localPosition = Vector3.New(0, 100, 0)

				local var_66_21 = manager.ui.mainCamera.transform.position - var_66_14.position

				var_66_14.forward = Vector3.New(var_66_21.x, var_66_21.y, var_66_21.z)

				local var_66_22 = var_66_14.localEulerAngles

				var_66_22.z = 0
				var_66_22.x = 0
				var_66_14.localEulerAngles = var_66_22
			end

			local var_66_23 = arg_63_1.actors_["2078ui_story"]
			local var_66_24 = 0

			if var_66_24 < arg_63_1.time_ and arg_63_1.time_ <= var_66_24 + arg_66_0 and arg_63_1.var_.characterEffect2078ui_story == nil then
				arg_63_1.var_.characterEffect2078ui_story = var_66_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_25 = 0.200000002980232

			if var_66_24 <= arg_63_1.time_ and arg_63_1.time_ < var_66_24 + var_66_25 then
				local var_66_26 = (arg_63_1.time_ - var_66_24) / var_66_25

				if arg_63_1.var_.characterEffect2078ui_story then
					local var_66_27 = Mathf.Lerp(0, 0.5, var_66_26)

					arg_63_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_63_1.var_.characterEffect2078ui_story.fillRatio = var_66_27
				end
			end

			if arg_63_1.time_ >= var_66_24 + var_66_25 and arg_63_1.time_ < var_66_24 + var_66_25 + arg_66_0 and arg_63_1.var_.characterEffect2078ui_story then
				local var_66_28 = 0.5

				arg_63_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_63_1.var_.characterEffect2078ui_story.fillRatio = var_66_28
			end

			local var_66_29 = 0
			local var_66_30 = 0.2

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_31 = arg_63_1:FormatText(StoryNameCfg[73].name)

				arg_63_1.leftNameTxt_.text = var_66_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_32 = arg_63_1:GetWordFromCfg(317032016)
				local var_66_33 = arg_63_1:FormatText(var_66_32.content)

				arg_63_1.text_.text = var_66_33

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_34 = 8
				local var_66_35 = utf8.len(var_66_33)
				local var_66_36 = var_66_34 <= 0 and var_66_30 or var_66_30 * (var_66_35 / var_66_34)

				if var_66_36 > 0 and var_66_30 < var_66_36 then
					arg_63_1.talkMaxDuration = var_66_36

					if var_66_36 + var_66_29 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_36 + var_66_29
					end
				end

				arg_63_1.text_.text = var_66_33
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032016", "story_v_out_317032.awb") ~= 0 then
					local var_66_37 = manager.audio:GetVoiceLength("story_v_out_317032", "317032016", "story_v_out_317032.awb") / 1000

					if var_66_37 + var_66_29 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_37 + var_66_29
					end

					if var_66_32.prefab_name ~= "" and arg_63_1.actors_[var_66_32.prefab_name] ~= nil then
						local var_66_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_32.prefab_name].transform, "story_v_out_317032", "317032016", "story_v_out_317032.awb")

						arg_63_1:RecordAudio("317032016", var_66_38)
						arg_63_1:RecordAudio("317032016", var_66_38)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317032", "317032016", "story_v_out_317032.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317032", "317032016", "story_v_out_317032.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_39 = math.max(var_66_30, arg_63_1.talkMaxDuration)

			if var_66_29 <= arg_63_1.time_ and arg_63_1.time_ < var_66_29 + var_66_39 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_29) / var_66_39

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_29 + var_66_39 and arg_63_1.time_ < var_66_29 + var_66_39 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play317032017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317032017
		arg_67_1.duration_ = 7.366

		local var_67_0 = {
			zh = 4.333,
			ja = 7.366
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
				arg_67_0:Play317032018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1093ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1093ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, -1.11, -5.88)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1093ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1093ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1093ui_story == nil then
				arg_67_1.var_.characterEffect1093ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1093ui_story then
					arg_67_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1093ui_story then
				arg_67_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_70_14 = 0
			local var_70_15 = 0.575

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_16 = arg_67_1:FormatText(StoryNameCfg[73].name)

				arg_67_1.leftNameTxt_.text = var_70_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_17 = arg_67_1:GetWordFromCfg(317032017)
				local var_70_18 = arg_67_1:FormatText(var_70_17.content)

				arg_67_1.text_.text = var_70_18

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_19 = 21
				local var_70_20 = utf8.len(var_70_18)
				local var_70_21 = var_70_19 <= 0 and var_70_15 or var_70_15 * (var_70_20 / var_70_19)

				if var_70_21 > 0 and var_70_15 < var_70_21 then
					arg_67_1.talkMaxDuration = var_70_21

					if var_70_21 + var_70_14 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_21 + var_70_14
					end
				end

				arg_67_1.text_.text = var_70_18
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032017", "story_v_out_317032.awb") ~= 0 then
					local var_70_22 = manager.audio:GetVoiceLength("story_v_out_317032", "317032017", "story_v_out_317032.awb") / 1000

					if var_70_22 + var_70_14 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_22 + var_70_14
					end

					if var_70_17.prefab_name ~= "" and arg_67_1.actors_[var_70_17.prefab_name] ~= nil then
						local var_70_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_17.prefab_name].transform, "story_v_out_317032", "317032017", "story_v_out_317032.awb")

						arg_67_1:RecordAudio("317032017", var_70_23)
						arg_67_1:RecordAudio("317032017", var_70_23)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_317032", "317032017", "story_v_out_317032.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_317032", "317032017", "story_v_out_317032.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_24 = math.max(var_70_15, arg_67_1.talkMaxDuration)

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_24 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_14) / var_70_24

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_14 + var_70_24 and arg_67_1.time_ < var_70_14 + var_70_24 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317032018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317032018
		arg_71_1.duration_ = 6.2

		local var_71_0 = {
			zh = 6.2,
			ja = 4.466
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
				arg_71_0:Play317032019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["2078ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos2078ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, -1.28, -5.6)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos2078ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["2078ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect2078ui_story == nil then
				arg_71_1.var_.characterEffect2078ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect2078ui_story then
					arg_71_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect2078ui_story then
				arg_71_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_74_13 = 0

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_15 = arg_71_1.actors_["1093ui_story"].transform
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.var_.moveOldPos1093ui_story = var_74_15.localPosition
			end

			local var_74_17 = 0.001

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17
				local var_74_19 = Vector3.New(0, 100, 0)

				var_74_15.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1093ui_story, var_74_19, var_74_18)

				local var_74_20 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_20.x, var_74_20.y, var_74_20.z)

				local var_74_21 = var_74_15.localEulerAngles

				var_74_21.z = 0
				var_74_21.x = 0
				var_74_15.localEulerAngles = var_74_21
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 then
				var_74_15.localPosition = Vector3.New(0, 100, 0)

				local var_74_22 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_22.x, var_74_22.y, var_74_22.z)

				local var_74_23 = var_74_15.localEulerAngles

				var_74_23.z = 0
				var_74_23.x = 0
				var_74_15.localEulerAngles = var_74_23
			end

			local var_74_24 = arg_71_1.actors_["1093ui_story"]
			local var_74_25 = 0

			if var_74_25 < arg_71_1.time_ and arg_71_1.time_ <= var_74_25 + arg_74_0 and arg_71_1.var_.characterEffect1093ui_story == nil then
				arg_71_1.var_.characterEffect1093ui_story = var_74_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_26 = 0.200000002980232

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_26 then
				local var_74_27 = (arg_71_1.time_ - var_74_25) / var_74_26

				if arg_71_1.var_.characterEffect1093ui_story then
					local var_74_28 = Mathf.Lerp(0, 0.5, var_74_27)

					arg_71_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1093ui_story.fillRatio = var_74_28
				end
			end

			if arg_71_1.time_ >= var_74_25 + var_74_26 and arg_71_1.time_ < var_74_25 + var_74_26 + arg_74_0 and arg_71_1.var_.characterEffect1093ui_story then
				local var_74_29 = 0.5

				arg_71_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1093ui_story.fillRatio = var_74_29
			end

			local var_74_30 = 0
			local var_74_31 = 0.9

			if var_74_30 < arg_71_1.time_ and arg_71_1.time_ <= var_74_30 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_32 = arg_71_1:FormatText(StoryNameCfg[530].name)

				arg_71_1.leftNameTxt_.text = var_74_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_33 = arg_71_1:GetWordFromCfg(317032018)
				local var_74_34 = arg_71_1:FormatText(var_74_33.content)

				arg_71_1.text_.text = var_74_34

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_35 = 36
				local var_74_36 = utf8.len(var_74_34)
				local var_74_37 = var_74_35 <= 0 and var_74_31 or var_74_31 * (var_74_36 / var_74_35)

				if var_74_37 > 0 and var_74_31 < var_74_37 then
					arg_71_1.talkMaxDuration = var_74_37

					if var_74_37 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_37 + var_74_30
					end
				end

				arg_71_1.text_.text = var_74_34
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032018", "story_v_out_317032.awb") ~= 0 then
					local var_74_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032018", "story_v_out_317032.awb") / 1000

					if var_74_38 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_38 + var_74_30
					end

					if var_74_33.prefab_name ~= "" and arg_71_1.actors_[var_74_33.prefab_name] ~= nil then
						local var_74_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_33.prefab_name].transform, "story_v_out_317032", "317032018", "story_v_out_317032.awb")

						arg_71_1:RecordAudio("317032018", var_74_39)
						arg_71_1:RecordAudio("317032018", var_74_39)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_317032", "317032018", "story_v_out_317032.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_317032", "317032018", "story_v_out_317032.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_40 = math.max(var_74_31, arg_71_1.talkMaxDuration)

			if var_74_30 <= arg_71_1.time_ and arg_71_1.time_ < var_74_30 + var_74_40 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_30) / var_74_40

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_30 + var_74_40 and arg_71_1.time_ < var_74_30 + var_74_40 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317032019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 317032019
		arg_75_1.duration_ = 8.366

		local var_75_0 = {
			zh = 7.4,
			ja = 8.366
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
				arg_75_0:Play317032020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1093ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1093ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, -1.11, -5.88)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1093ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1093ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1093ui_story == nil then
				arg_75_1.var_.characterEffect1093ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1093ui_story then
					arg_75_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1093ui_story then
				arg_75_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_78_15 = arg_75_1.actors_["2078ui_story"].transform
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.var_.moveOldPos2078ui_story = var_78_15.localPosition
			end

			local var_78_17 = 0.001

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Vector3.New(0, 100, 0)

				var_78_15.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos2078ui_story, var_78_19, var_78_18)

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

			local var_78_24 = arg_75_1.actors_["2078ui_story"]
			local var_78_25 = 0

			if var_78_25 < arg_75_1.time_ and arg_75_1.time_ <= var_78_25 + arg_78_0 and arg_75_1.var_.characterEffect2078ui_story == nil then
				arg_75_1.var_.characterEffect2078ui_story = var_78_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_26 = 0.200000002980232

			if var_78_25 <= arg_75_1.time_ and arg_75_1.time_ < var_78_25 + var_78_26 then
				local var_78_27 = (arg_75_1.time_ - var_78_25) / var_78_26

				if arg_75_1.var_.characterEffect2078ui_story then
					local var_78_28 = Mathf.Lerp(0, 0.5, var_78_27)

					arg_75_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_75_1.var_.characterEffect2078ui_story.fillRatio = var_78_28
				end
			end

			if arg_75_1.time_ >= var_78_25 + var_78_26 and arg_75_1.time_ < var_78_25 + var_78_26 + arg_78_0 and arg_75_1.var_.characterEffect2078ui_story then
				local var_78_29 = 0.5

				arg_75_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_75_1.var_.characterEffect2078ui_story.fillRatio = var_78_29
			end

			local var_78_30 = 0
			local var_78_31 = 0.8

			if var_78_30 < arg_75_1.time_ and arg_75_1.time_ <= var_78_30 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_32 = arg_75_1:FormatText(StoryNameCfg[73].name)

				arg_75_1.leftNameTxt_.text = var_78_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_33 = arg_75_1:GetWordFromCfg(317032019)
				local var_78_34 = arg_75_1:FormatText(var_78_33.content)

				arg_75_1.text_.text = var_78_34

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_35 = 32
				local var_78_36 = utf8.len(var_78_34)
				local var_78_37 = var_78_35 <= 0 and var_78_31 or var_78_31 * (var_78_36 / var_78_35)

				if var_78_37 > 0 and var_78_31 < var_78_37 then
					arg_75_1.talkMaxDuration = var_78_37

					if var_78_37 + var_78_30 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_37 + var_78_30
					end
				end

				arg_75_1.text_.text = var_78_34
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032019", "story_v_out_317032.awb") ~= 0 then
					local var_78_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032019", "story_v_out_317032.awb") / 1000

					if var_78_38 + var_78_30 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_38 + var_78_30
					end

					if var_78_33.prefab_name ~= "" and arg_75_1.actors_[var_78_33.prefab_name] ~= nil then
						local var_78_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_33.prefab_name].transform, "story_v_out_317032", "317032019", "story_v_out_317032.awb")

						arg_75_1:RecordAudio("317032019", var_78_39)
						arg_75_1:RecordAudio("317032019", var_78_39)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_317032", "317032019", "story_v_out_317032.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_317032", "317032019", "story_v_out_317032.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_40 = math.max(var_78_31, arg_75_1.talkMaxDuration)

			if var_78_30 <= arg_75_1.time_ and arg_75_1.time_ < var_78_30 + var_78_40 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_30) / var_78_40

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_30 + var_78_40 and arg_75_1.time_ < var_78_30 + var_78_40 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play317032020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317032020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play317032021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1093ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1093ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1093ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, 100, 0)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1093ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story == nil then
				arg_79_1.var_.characterEffect1093ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1093ui_story then
					local var_82_13 = Mathf.Lerp(0, 0.5, var_82_12)

					arg_79_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1093ui_story.fillRatio = var_82_13
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story then
				local var_82_14 = 0.5

				arg_79_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1093ui_story.fillRatio = var_82_14
			end

			local var_82_15 = 0
			local var_82_16 = 0.8

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_17 = arg_79_1:GetWordFromCfg(317032020)
				local var_82_18 = arg_79_1:FormatText(var_82_17.content)

				arg_79_1.text_.text = var_82_18

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_19 = 32
				local var_82_20 = utf8.len(var_82_18)
				local var_82_21 = var_82_19 <= 0 and var_82_16 or var_82_16 * (var_82_20 / var_82_19)

				if var_82_21 > 0 and var_82_16 < var_82_21 then
					arg_79_1.talkMaxDuration = var_82_21

					if var_82_21 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_18
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_22 and arg_79_1.time_ < var_82_15 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play317032021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 317032021
		arg_83_1.duration_ = 6.166

		local var_83_0 = {
			zh = 5.9,
			ja = 6.166
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
				arg_83_0:Play317032022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1093ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1093ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, -1.11, -5.88)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1093ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1093ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story == nil then
				arg_83_1.var_.characterEffect1093ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1093ui_story then
					arg_83_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story then
				arg_83_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_86_15 = 0
			local var_86_16 = 0.65

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[73].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(317032021)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032021", "story_v_out_317032.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_317032", "317032021", "story_v_out_317032.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_317032", "317032021", "story_v_out_317032.awb")

						arg_83_1:RecordAudio("317032021", var_86_24)
						arg_83_1:RecordAudio("317032021", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_317032", "317032021", "story_v_out_317032.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_317032", "317032021", "story_v_out_317032.awb")
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
	Play317032022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 317032022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play317032023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1093ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1093ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1093ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, 100, 0)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1015ui_story"].transform
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.var_.moveOldPos1015ui_story = var_90_9.localPosition
			end

			local var_90_11 = 0.001

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11
				local var_90_13 = Vector3.New(0, -1.15, -6.2)

				var_90_9.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1015ui_story, var_90_13, var_90_12)

				local var_90_14 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_14.x, var_90_14.y, var_90_14.z)

				local var_90_15 = var_90_9.localEulerAngles

				var_90_15.z = 0
				var_90_15.x = 0
				var_90_9.localEulerAngles = var_90_15
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 then
				var_90_9.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_90_16 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_16.x, var_90_16.y, var_90_16.z)

				local var_90_17 = var_90_9.localEulerAngles

				var_90_17.z = 0
				var_90_17.x = 0
				var_90_9.localEulerAngles = var_90_17
			end

			local var_90_18 = 0

			if var_90_18 < arg_87_1.time_ and arg_87_1.time_ <= var_90_18 + arg_90_0 then
				arg_87_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_90_19 = 0
			local var_90_20 = 0.5

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_21 = arg_87_1:GetWordFromCfg(317032022)
				local var_90_22 = arg_87_1:FormatText(var_90_21.content)

				arg_87_1.text_.text = var_90_22

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_23 = 20
				local var_90_24 = utf8.len(var_90_22)
				local var_90_25 = var_90_23 <= 0 and var_90_20 or var_90_20 * (var_90_24 / var_90_23)

				if var_90_25 > 0 and var_90_20 < var_90_25 then
					arg_87_1.talkMaxDuration = var_90_25

					if var_90_25 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_25 + var_90_19
					end
				end

				arg_87_1.text_.text = var_90_22
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_26 = math.max(var_90_20, arg_87_1.talkMaxDuration)

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_26 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_19) / var_90_26

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_19 + var_90_26 and arg_87_1.time_ < var_90_19 + var_90_26 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play317032023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 317032023
		arg_91_1.duration_ = 3.533

		local var_91_0 = {
			zh = 3.533,
			ja = 3.133
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
				arg_91_0:Play317032024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1015ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1015ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, -1.15, -6.2)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1015ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1015ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1015ui_story == nil then
				arg_91_1.var_.characterEffect1015ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1015ui_story then
					arg_91_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1015ui_story then
				arg_91_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_14 = 0
			local var_94_15 = 0.475

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_16 = arg_91_1:FormatText(StoryNameCfg[479].name)

				arg_91_1.leftNameTxt_.text = var_94_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_17 = arg_91_1:GetWordFromCfg(317032023)
				local var_94_18 = arg_91_1:FormatText(var_94_17.content)

				arg_91_1.text_.text = var_94_18

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_19 = 19
				local var_94_20 = utf8.len(var_94_18)
				local var_94_21 = var_94_19 <= 0 and var_94_15 or var_94_15 * (var_94_20 / var_94_19)

				if var_94_21 > 0 and var_94_15 < var_94_21 then
					arg_91_1.talkMaxDuration = var_94_21

					if var_94_21 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_14
					end
				end

				arg_91_1.text_.text = var_94_18
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032023", "story_v_out_317032.awb") ~= 0 then
					local var_94_22 = manager.audio:GetVoiceLength("story_v_out_317032", "317032023", "story_v_out_317032.awb") / 1000

					if var_94_22 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_22 + var_94_14
					end

					if var_94_17.prefab_name ~= "" and arg_91_1.actors_[var_94_17.prefab_name] ~= nil then
						local var_94_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_17.prefab_name].transform, "story_v_out_317032", "317032023", "story_v_out_317032.awb")

						arg_91_1:RecordAudio("317032023", var_94_23)
						arg_91_1:RecordAudio("317032023", var_94_23)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_317032", "317032023", "story_v_out_317032.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_317032", "317032023", "story_v_out_317032.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_24 = math.max(var_94_15, arg_91_1.talkMaxDuration)

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_24 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_14) / var_94_24

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_14 + var_94_24 and arg_91_1.time_ < var_94_14 + var_94_24 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play317032024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 317032024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play317032025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1015ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1015ui_story == nil then
				arg_95_1.var_.characterEffect1015ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1015ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1015ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1015ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1015ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.325

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[7].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(317032024)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 13
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
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_14 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_14 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_14

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_14 and arg_95_1.time_ < var_98_6 + var_98_14 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play317032025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 317032025
		arg_99_1.duration_ = 7.166

		local var_99_0 = {
			zh = 7.166,
			ja = 3.666
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
				arg_99_0:Play317032026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1015ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1015ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1015ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1015ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1015ui_story == nil then
				arg_99_1.var_.characterEffect1015ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1015ui_story then
					local var_102_13 = Mathf.Lerp(0, 0.5, var_102_12)

					arg_99_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1015ui_story.fillRatio = var_102_13
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1015ui_story then
				local var_102_14 = 0.5

				arg_99_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1015ui_story.fillRatio = var_102_14
			end

			local var_102_15 = arg_99_1.actors_["2078ui_story"].transform
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1.var_.moveOldPos2078ui_story = var_102_15.localPosition
			end

			local var_102_17 = 0.001

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17
				local var_102_19 = Vector3.New(0.7, -1.28, -5.6)

				var_102_15.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos2078ui_story, var_102_19, var_102_18)

				local var_102_20 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_20.x, var_102_20.y, var_102_20.z)

				local var_102_21 = var_102_15.localEulerAngles

				var_102_21.z = 0
				var_102_21.x = 0
				var_102_15.localEulerAngles = var_102_21
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 then
				var_102_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_102_22 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_22.x, var_102_22.y, var_102_22.z)

				local var_102_23 = var_102_15.localEulerAngles

				var_102_23.z = 0
				var_102_23.x = 0
				var_102_15.localEulerAngles = var_102_23
			end

			local var_102_24 = arg_99_1.actors_["2078ui_story"]
			local var_102_25 = 0

			if var_102_25 < arg_99_1.time_ and arg_99_1.time_ <= var_102_25 + arg_102_0 and arg_99_1.var_.characterEffect2078ui_story == nil then
				arg_99_1.var_.characterEffect2078ui_story = var_102_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_26 = 0.200000002980232

			if var_102_25 <= arg_99_1.time_ and arg_99_1.time_ < var_102_25 + var_102_26 then
				local var_102_27 = (arg_99_1.time_ - var_102_25) / var_102_26

				if arg_99_1.var_.characterEffect2078ui_story then
					arg_99_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_25 + var_102_26 and arg_99_1.time_ < var_102_25 + var_102_26 + arg_102_0 and arg_99_1.var_.characterEffect2078ui_story then
				arg_99_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_102_28 = 0

			if var_102_28 < arg_99_1.time_ and arg_99_1.time_ <= var_102_28 + arg_102_0 then
				arg_99_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_102_29 = 0

			if var_102_29 < arg_99_1.time_ and arg_99_1.time_ <= var_102_29 + arg_102_0 then
				arg_99_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_30 = 0
			local var_102_31 = 0.8

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_32 = arg_99_1:FormatText(StoryNameCfg[528].name)

				arg_99_1.leftNameTxt_.text = var_102_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_33 = arg_99_1:GetWordFromCfg(317032025)
				local var_102_34 = arg_99_1:FormatText(var_102_33.content)

				arg_99_1.text_.text = var_102_34

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_35 = 32
				local var_102_36 = utf8.len(var_102_34)
				local var_102_37 = var_102_35 <= 0 and var_102_31 or var_102_31 * (var_102_36 / var_102_35)

				if var_102_37 > 0 and var_102_31 < var_102_37 then
					arg_99_1.talkMaxDuration = var_102_37

					if var_102_37 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_37 + var_102_30
					end
				end

				arg_99_1.text_.text = var_102_34
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032025", "story_v_out_317032.awb") ~= 0 then
					local var_102_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032025", "story_v_out_317032.awb") / 1000

					if var_102_38 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_38 + var_102_30
					end

					if var_102_33.prefab_name ~= "" and arg_99_1.actors_[var_102_33.prefab_name] ~= nil then
						local var_102_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_33.prefab_name].transform, "story_v_out_317032", "317032025", "story_v_out_317032.awb")

						arg_99_1:RecordAudio("317032025", var_102_39)
						arg_99_1:RecordAudio("317032025", var_102_39)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_317032", "317032025", "story_v_out_317032.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_317032", "317032025", "story_v_out_317032.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_40 = math.max(var_102_31, arg_99_1.talkMaxDuration)

			if var_102_30 <= arg_99_1.time_ and arg_99_1.time_ < var_102_30 + var_102_40 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_30) / var_102_40

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_30 + var_102_40 and arg_99_1.time_ < var_102_30 + var_102_40 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play317032026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 317032026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play317032027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["2078ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect2078ui_story == nil then
				arg_103_1.var_.characterEffect2078ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect2078ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_103_1.var_.characterEffect2078ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect2078ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_103_1.var_.characterEffect2078ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 1

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[7].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(317032026)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 40
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
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_14 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_14 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_14

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_14 and arg_103_1.time_ < var_106_6 + var_106_14 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play317032027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 317032027
		arg_107_1.duration_ = 2.366

		local var_107_0 = {
			zh = 1.033,
			ja = 2.366
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
				arg_107_0:Play317032028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1015ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1015ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1015ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1015ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1015ui_story == nil then
				arg_107_1.var_.characterEffect1015ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1015ui_story then
					local var_110_13 = Mathf.Lerp(0, 0.5, var_110_12)

					arg_107_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1015ui_story.fillRatio = var_110_13
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1015ui_story then
				local var_110_14 = 0.5

				arg_107_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1015ui_story.fillRatio = var_110_14
			end

			local var_110_15 = arg_107_1.actors_["2078ui_story"].transform
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.var_.moveOldPos2078ui_story = var_110_15.localPosition
			end

			local var_110_17 = 0.001

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Vector3.New(0.7, -1.28, -5.6)

				var_110_15.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos2078ui_story, var_110_19, var_110_18)

				local var_110_20 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_20.x, var_110_20.y, var_110_20.z)

				local var_110_21 = var_110_15.localEulerAngles

				var_110_21.z = 0
				var_110_21.x = 0
				var_110_15.localEulerAngles = var_110_21
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				var_110_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_110_22 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_22.x, var_110_22.y, var_110_22.z)

				local var_110_23 = var_110_15.localEulerAngles

				var_110_23.z = 0
				var_110_23.x = 0
				var_110_15.localEulerAngles = var_110_23
			end

			local var_110_24 = arg_107_1.actors_["2078ui_story"]
			local var_110_25 = 0

			if var_110_25 < arg_107_1.time_ and arg_107_1.time_ <= var_110_25 + arg_110_0 and arg_107_1.var_.characterEffect2078ui_story == nil then
				arg_107_1.var_.characterEffect2078ui_story = var_110_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_26 = 0.200000002980232

			if var_110_25 <= arg_107_1.time_ and arg_107_1.time_ < var_110_25 + var_110_26 then
				local var_110_27 = (arg_107_1.time_ - var_110_25) / var_110_26

				if arg_107_1.var_.characterEffect2078ui_story then
					arg_107_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_25 + var_110_26 and arg_107_1.time_ < var_110_25 + var_110_26 + arg_110_0 and arg_107_1.var_.characterEffect2078ui_story then
				arg_107_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_110_28 = 0

			if var_110_28 < arg_107_1.time_ and arg_107_1.time_ <= var_110_28 + arg_110_0 then
				arg_107_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_110_29 = 0

			if var_110_29 < arg_107_1.time_ and arg_107_1.time_ <= var_110_29 + arg_110_0 then
				arg_107_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_30 = 0
			local var_110_31 = 0.1

			if var_110_30 < arg_107_1.time_ and arg_107_1.time_ <= var_110_30 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_32 = arg_107_1:FormatText(StoryNameCfg[528].name)

				arg_107_1.leftNameTxt_.text = var_110_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_33 = arg_107_1:GetWordFromCfg(317032027)
				local var_110_34 = arg_107_1:FormatText(var_110_33.content)

				arg_107_1.text_.text = var_110_34

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_35 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032027", "story_v_out_317032.awb") ~= 0 then
					local var_110_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032027", "story_v_out_317032.awb") / 1000

					if var_110_38 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_38 + var_110_30
					end

					if var_110_33.prefab_name ~= "" and arg_107_1.actors_[var_110_33.prefab_name] ~= nil then
						local var_110_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_33.prefab_name].transform, "story_v_out_317032", "317032027", "story_v_out_317032.awb")

						arg_107_1:RecordAudio("317032027", var_110_39)
						arg_107_1:RecordAudio("317032027", var_110_39)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_317032", "317032027", "story_v_out_317032.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_317032", "317032027", "story_v_out_317032.awb")
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
	Play317032028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 317032028
		arg_111_1.duration_ = 2.2

		local var_111_0 = {
			zh = 2.2,
			ja = 2.066
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
				arg_111_0:Play317032029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1015ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1015ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1015ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = arg_111_1.actors_["1015ui_story"]
			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1015ui_story == nil then
				arg_111_1.var_.characterEffect1015ui_story = var_114_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_11 = 0.200000002980232

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_10) / var_114_11

				if arg_111_1.var_.characterEffect1015ui_story then
					arg_111_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 and arg_111_1.var_.characterEffect1015ui_story then
				arg_111_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_114_13 = 0

			if var_114_13 < arg_111_1.time_ and arg_111_1.time_ <= var_114_13 + arg_114_0 then
				arg_111_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				arg_111_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_114_15 = arg_111_1.actors_["2078ui_story"].transform
			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.var_.moveOldPos2078ui_story = var_114_15.localPosition
			end

			local var_114_17 = 0.001

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17
				local var_114_19 = Vector3.New(0.7, -1.28, -5.6)

				var_114_15.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos2078ui_story, var_114_19, var_114_18)

				local var_114_20 = manager.ui.mainCamera.transform.position - var_114_15.position

				var_114_15.forward = Vector3.New(var_114_20.x, var_114_20.y, var_114_20.z)

				local var_114_21 = var_114_15.localEulerAngles

				var_114_21.z = 0
				var_114_21.x = 0
				var_114_15.localEulerAngles = var_114_21
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 then
				var_114_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_114_22 = manager.ui.mainCamera.transform.position - var_114_15.position

				var_114_15.forward = Vector3.New(var_114_22.x, var_114_22.y, var_114_22.z)

				local var_114_23 = var_114_15.localEulerAngles

				var_114_23.z = 0
				var_114_23.x = 0
				var_114_15.localEulerAngles = var_114_23
			end

			local var_114_24 = arg_111_1.actors_["2078ui_story"]
			local var_114_25 = 0

			if var_114_25 < arg_111_1.time_ and arg_111_1.time_ <= var_114_25 + arg_114_0 and arg_111_1.var_.characterEffect2078ui_story == nil then
				arg_111_1.var_.characterEffect2078ui_story = var_114_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_26 = 0.200000002980232

			if var_114_25 <= arg_111_1.time_ and arg_111_1.time_ < var_114_25 + var_114_26 then
				local var_114_27 = (arg_111_1.time_ - var_114_25) / var_114_26

				if arg_111_1.var_.characterEffect2078ui_story then
					local var_114_28 = Mathf.Lerp(0, 0.5, var_114_27)

					arg_111_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_111_1.var_.characterEffect2078ui_story.fillRatio = var_114_28
				end
			end

			if arg_111_1.time_ >= var_114_25 + var_114_26 and arg_111_1.time_ < var_114_25 + var_114_26 + arg_114_0 and arg_111_1.var_.characterEffect2078ui_story then
				local var_114_29 = 0.5

				arg_111_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_111_1.var_.characterEffect2078ui_story.fillRatio = var_114_29
			end

			local var_114_30 = 0
			local var_114_31 = 0.275

			if var_114_30 < arg_111_1.time_ and arg_111_1.time_ <= var_114_30 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_32 = arg_111_1:FormatText(StoryNameCfg[479].name)

				arg_111_1.leftNameTxt_.text = var_114_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_33 = arg_111_1:GetWordFromCfg(317032028)
				local var_114_34 = arg_111_1:FormatText(var_114_33.content)

				arg_111_1.text_.text = var_114_34

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_35 = 22
				local var_114_36 = utf8.len(var_114_34)
				local var_114_37 = var_114_35 <= 0 and var_114_31 or var_114_31 * (var_114_36 / var_114_35)

				if var_114_37 > 0 and var_114_31 < var_114_37 then
					arg_111_1.talkMaxDuration = var_114_37

					if var_114_37 + var_114_30 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_37 + var_114_30
					end
				end

				arg_111_1.text_.text = var_114_34
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032028", "story_v_out_317032.awb") ~= 0 then
					local var_114_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032028", "story_v_out_317032.awb") / 1000

					if var_114_38 + var_114_30 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_38 + var_114_30
					end

					if var_114_33.prefab_name ~= "" and arg_111_1.actors_[var_114_33.prefab_name] ~= nil then
						local var_114_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_33.prefab_name].transform, "story_v_out_317032", "317032028", "story_v_out_317032.awb")

						arg_111_1:RecordAudio("317032028", var_114_39)
						arg_111_1:RecordAudio("317032028", var_114_39)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_317032", "317032028", "story_v_out_317032.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_317032", "317032028", "story_v_out_317032.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_40 = math.max(var_114_31, arg_111_1.talkMaxDuration)

			if var_114_30 <= arg_111_1.time_ and arg_111_1.time_ < var_114_30 + var_114_40 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_30) / var_114_40

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_30 + var_114_40 and arg_111_1.time_ < var_114_30 + var_114_40 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play317032029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 317032029
		arg_115_1.duration_ = 5.666

		local var_115_0 = {
			zh = 5.666,
			ja = 4.3
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
				arg_115_0:Play317032030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["2078ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos2078ui_story = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos2078ui_story, var_118_4, var_118_3)

				local var_118_5 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_5.x, var_118_5.y, var_118_5.z)

				local var_118_6 = var_118_0.localEulerAngles

				var_118_6.z = 0
				var_118_6.x = 0
				var_118_0.localEulerAngles = var_118_6
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_118_7 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_7.x, var_118_7.y, var_118_7.z)

				local var_118_8 = var_118_0.localEulerAngles

				var_118_8.z = 0
				var_118_8.x = 0
				var_118_0.localEulerAngles = var_118_8
			end

			local var_118_9 = arg_115_1.actors_["2078ui_story"]
			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 and arg_115_1.var_.characterEffect2078ui_story == nil then
				arg_115_1.var_.characterEffect2078ui_story = var_118_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_11 = 0.200000002980232

			if var_118_10 <= arg_115_1.time_ and arg_115_1.time_ < var_118_10 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_10) / var_118_11

				if arg_115_1.var_.characterEffect2078ui_story then
					arg_115_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_10 + var_118_11 and arg_115_1.time_ < var_118_10 + var_118_11 + arg_118_0 and arg_115_1.var_.characterEffect2078ui_story then
				arg_115_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				arg_115_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_118_15 = arg_115_1.actors_["2079ui_story"].transform
			local var_118_16 = 0

			if var_118_16 < arg_115_1.time_ and arg_115_1.time_ <= var_118_16 + arg_118_0 then
				arg_115_1.var_.moveOldPos2079ui_story = var_118_15.localPosition
			end

			local var_118_17 = 0.001

			if var_118_16 <= arg_115_1.time_ and arg_115_1.time_ < var_118_16 + var_118_17 then
				local var_118_18 = (arg_115_1.time_ - var_118_16) / var_118_17
				local var_118_19 = Vector3.New(0.7, -1.28, -5.6)

				var_118_15.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos2079ui_story, var_118_19, var_118_18)

				local var_118_20 = manager.ui.mainCamera.transform.position - var_118_15.position

				var_118_15.forward = Vector3.New(var_118_20.x, var_118_20.y, var_118_20.z)

				local var_118_21 = var_118_15.localEulerAngles

				var_118_21.z = 0
				var_118_21.x = 0
				var_118_15.localEulerAngles = var_118_21
			end

			if arg_115_1.time_ >= var_118_16 + var_118_17 and arg_115_1.time_ < var_118_16 + var_118_17 + arg_118_0 then
				var_118_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_118_22 = manager.ui.mainCamera.transform.position - var_118_15.position

				var_118_15.forward = Vector3.New(var_118_22.x, var_118_22.y, var_118_22.z)

				local var_118_23 = var_118_15.localEulerAngles

				var_118_23.z = 0
				var_118_23.x = 0
				var_118_15.localEulerAngles = var_118_23
			end

			local var_118_24 = arg_115_1.actors_["2079ui_story"]
			local var_118_25 = 0

			if var_118_25 < arg_115_1.time_ and arg_115_1.time_ <= var_118_25 + arg_118_0 and arg_115_1.var_.characterEffect2079ui_story == nil then
				arg_115_1.var_.characterEffect2079ui_story = var_118_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_26 = 0.200000002980232

			if var_118_25 <= arg_115_1.time_ and arg_115_1.time_ < var_118_25 + var_118_26 then
				local var_118_27 = (arg_115_1.time_ - var_118_25) / var_118_26

				if arg_115_1.var_.characterEffect2079ui_story then
					local var_118_28 = Mathf.Lerp(0, 0.5, var_118_27)

					arg_115_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_115_1.var_.characterEffect2079ui_story.fillRatio = var_118_28
				end
			end

			if arg_115_1.time_ >= var_118_25 + var_118_26 and arg_115_1.time_ < var_118_25 + var_118_26 + arg_118_0 and arg_115_1.var_.characterEffect2079ui_story then
				local var_118_29 = 0.5

				arg_115_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_115_1.var_.characterEffect2079ui_story.fillRatio = var_118_29
			end

			local var_118_30 = arg_115_1.actors_["1015ui_story"].transform
			local var_118_31 = 0

			if var_118_31 < arg_115_1.time_ and arg_115_1.time_ <= var_118_31 + arg_118_0 then
				arg_115_1.var_.moveOldPos1015ui_story = var_118_30.localPosition
			end

			local var_118_32 = 0.001

			if var_118_31 <= arg_115_1.time_ and arg_115_1.time_ < var_118_31 + var_118_32 then
				local var_118_33 = (arg_115_1.time_ - var_118_31) / var_118_32
				local var_118_34 = Vector3.New(0, 100, 0)

				var_118_30.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1015ui_story, var_118_34, var_118_33)

				local var_118_35 = manager.ui.mainCamera.transform.position - var_118_30.position

				var_118_30.forward = Vector3.New(var_118_35.x, var_118_35.y, var_118_35.z)

				local var_118_36 = var_118_30.localEulerAngles

				var_118_36.z = 0
				var_118_36.x = 0
				var_118_30.localEulerAngles = var_118_36
			end

			if arg_115_1.time_ >= var_118_31 + var_118_32 and arg_115_1.time_ < var_118_31 + var_118_32 + arg_118_0 then
				var_118_30.localPosition = Vector3.New(0, 100, 0)

				local var_118_37 = manager.ui.mainCamera.transform.position - var_118_30.position

				var_118_30.forward = Vector3.New(var_118_37.x, var_118_37.y, var_118_37.z)

				local var_118_38 = var_118_30.localEulerAngles

				var_118_38.z = 0
				var_118_38.x = 0
				var_118_30.localEulerAngles = var_118_38
			end

			local var_118_39 = arg_115_1.actors_["1015ui_story"]
			local var_118_40 = 0

			if var_118_40 < arg_115_1.time_ and arg_115_1.time_ <= var_118_40 + arg_118_0 and arg_115_1.var_.characterEffect1015ui_story == nil then
				arg_115_1.var_.characterEffect1015ui_story = var_118_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_41 = 0.200000002980232

			if var_118_40 <= arg_115_1.time_ and arg_115_1.time_ < var_118_40 + var_118_41 then
				local var_118_42 = (arg_115_1.time_ - var_118_40) / var_118_41

				if arg_115_1.var_.characterEffect1015ui_story then
					local var_118_43 = Mathf.Lerp(0, 0.5, var_118_42)

					arg_115_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1015ui_story.fillRatio = var_118_43
				end
			end

			if arg_115_1.time_ >= var_118_40 + var_118_41 and arg_115_1.time_ < var_118_40 + var_118_41 + arg_118_0 and arg_115_1.var_.characterEffect1015ui_story then
				local var_118_44 = 0.5

				arg_115_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1015ui_story.fillRatio = var_118_44
			end

			local var_118_45 = 0
			local var_118_46 = 0.475

			if var_118_45 < arg_115_1.time_ and arg_115_1.time_ <= var_118_45 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_47 = arg_115_1:FormatText(StoryNameCfg[530].name)

				arg_115_1.leftNameTxt_.text = var_118_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_48 = arg_115_1:GetWordFromCfg(317032029)
				local var_118_49 = arg_115_1:FormatText(var_118_48.content)

				arg_115_1.text_.text = var_118_49

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_50 = 19
				local var_118_51 = utf8.len(var_118_49)
				local var_118_52 = var_118_50 <= 0 and var_118_46 or var_118_46 * (var_118_51 / var_118_50)

				if var_118_52 > 0 and var_118_46 < var_118_52 then
					arg_115_1.talkMaxDuration = var_118_52

					if var_118_52 + var_118_45 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_52 + var_118_45
					end
				end

				arg_115_1.text_.text = var_118_49
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032029", "story_v_out_317032.awb") ~= 0 then
					local var_118_53 = manager.audio:GetVoiceLength("story_v_out_317032", "317032029", "story_v_out_317032.awb") / 1000

					if var_118_53 + var_118_45 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_53 + var_118_45
					end

					if var_118_48.prefab_name ~= "" and arg_115_1.actors_[var_118_48.prefab_name] ~= nil then
						local var_118_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_48.prefab_name].transform, "story_v_out_317032", "317032029", "story_v_out_317032.awb")

						arg_115_1:RecordAudio("317032029", var_118_54)
						arg_115_1:RecordAudio("317032029", var_118_54)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_317032", "317032029", "story_v_out_317032.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_317032", "317032029", "story_v_out_317032.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_55 = math.max(var_118_46, arg_115_1.talkMaxDuration)

			if var_118_45 <= arg_115_1.time_ and arg_115_1.time_ < var_118_45 + var_118_55 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_45) / var_118_55

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_45 + var_118_55 and arg_115_1.time_ < var_118_45 + var_118_55 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play317032030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 317032030
		arg_119_1.duration_ = 8.833

		local var_119_0 = {
			zh = 7.8,
			ja = 8.833
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
				arg_119_0:Play317032031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["2078ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos2078ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos2078ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["2078ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect2078ui_story == nil then
				arg_119_1.var_.characterEffect2078ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect2078ui_story then
					local var_122_13 = Mathf.Lerp(0, 0.5, var_122_12)

					arg_119_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_119_1.var_.characterEffect2078ui_story.fillRatio = var_122_13
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect2078ui_story then
				local var_122_14 = 0.5

				arg_119_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_119_1.var_.characterEffect2078ui_story.fillRatio = var_122_14
			end

			local var_122_15 = arg_119_1.actors_["2079ui_story"].transform
			local var_122_16 = 0

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.var_.moveOldPos2079ui_story = var_122_15.localPosition
			end

			local var_122_17 = 0.001

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17
				local var_122_19 = Vector3.New(0.7, -1.28, -5.6)

				var_122_15.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos2079ui_story, var_122_19, var_122_18)

				local var_122_20 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_20.x, var_122_20.y, var_122_20.z)

				local var_122_21 = var_122_15.localEulerAngles

				var_122_21.z = 0
				var_122_21.x = 0
				var_122_15.localEulerAngles = var_122_21
			end

			if arg_119_1.time_ >= var_122_16 + var_122_17 and arg_119_1.time_ < var_122_16 + var_122_17 + arg_122_0 then
				var_122_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_122_22 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_22.x, var_122_22.y, var_122_22.z)

				local var_122_23 = var_122_15.localEulerAngles

				var_122_23.z = 0
				var_122_23.x = 0
				var_122_15.localEulerAngles = var_122_23
			end

			local var_122_24 = arg_119_1.actors_["2079ui_story"]
			local var_122_25 = 0

			if var_122_25 < arg_119_1.time_ and arg_119_1.time_ <= var_122_25 + arg_122_0 and arg_119_1.var_.characterEffect2079ui_story == nil then
				arg_119_1.var_.characterEffect2079ui_story = var_122_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_26 = 0.200000002980232

			if var_122_25 <= arg_119_1.time_ and arg_119_1.time_ < var_122_25 + var_122_26 then
				local var_122_27 = (arg_119_1.time_ - var_122_25) / var_122_26

				if arg_119_1.var_.characterEffect2079ui_story then
					arg_119_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_25 + var_122_26 and arg_119_1.time_ < var_122_25 + var_122_26 + arg_122_0 and arg_119_1.var_.characterEffect2079ui_story then
				arg_119_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_122_28 = 0

			if var_122_28 < arg_119_1.time_ and arg_119_1.time_ <= var_122_28 + arg_122_0 then
				arg_119_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_122_29 = 0

			if var_122_29 < arg_119_1.time_ and arg_119_1.time_ <= var_122_29 + arg_122_0 then
				arg_119_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_122_30 = 0
			local var_122_31 = 0.9

			if var_122_30 < arg_119_1.time_ and arg_119_1.time_ <= var_122_30 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_32 = arg_119_1:FormatText(StoryNameCfg[529].name)

				arg_119_1.leftNameTxt_.text = var_122_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_33 = arg_119_1:GetWordFromCfg(317032030)
				local var_122_34 = arg_119_1:FormatText(var_122_33.content)

				arg_119_1.text_.text = var_122_34

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_35 = 36
				local var_122_36 = utf8.len(var_122_34)
				local var_122_37 = var_122_35 <= 0 and var_122_31 or var_122_31 * (var_122_36 / var_122_35)

				if var_122_37 > 0 and var_122_31 < var_122_37 then
					arg_119_1.talkMaxDuration = var_122_37

					if var_122_37 + var_122_30 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_37 + var_122_30
					end
				end

				arg_119_1.text_.text = var_122_34
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032030", "story_v_out_317032.awb") ~= 0 then
					local var_122_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032030", "story_v_out_317032.awb") / 1000

					if var_122_38 + var_122_30 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_38 + var_122_30
					end

					if var_122_33.prefab_name ~= "" and arg_119_1.actors_[var_122_33.prefab_name] ~= nil then
						local var_122_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_33.prefab_name].transform, "story_v_out_317032", "317032030", "story_v_out_317032.awb")

						arg_119_1:RecordAudio("317032030", var_122_39)
						arg_119_1:RecordAudio("317032030", var_122_39)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_317032", "317032030", "story_v_out_317032.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_317032", "317032030", "story_v_out_317032.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_40 = math.max(var_122_31, arg_119_1.talkMaxDuration)

			if var_122_30 <= arg_119_1.time_ and arg_119_1.time_ < var_122_30 + var_122_40 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_30) / var_122_40

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_30 + var_122_40 and arg_119_1.time_ < var_122_30 + var_122_40 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play317032031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 317032031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play317032032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["2078ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos2078ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, 100, 0)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos2078ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, 100, 0)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["2078ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect2078ui_story == nil then
				arg_123_1.var_.characterEffect2078ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect2078ui_story then
					local var_126_13 = Mathf.Lerp(0, 0.5, var_126_12)

					arg_123_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_123_1.var_.characterEffect2078ui_story.fillRatio = var_126_13
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect2078ui_story then
				local var_126_14 = 0.5

				arg_123_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_123_1.var_.characterEffect2078ui_story.fillRatio = var_126_14
			end

			local var_126_15 = arg_123_1.actors_["2079ui_story"].transform
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.var_.moveOldPos2079ui_story = var_126_15.localPosition
			end

			local var_126_17 = 0.001

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Vector3.New(0, 100, 0)

				var_126_15.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos2079ui_story, var_126_19, var_126_18)

				local var_126_20 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_20.x, var_126_20.y, var_126_20.z)

				local var_126_21 = var_126_15.localEulerAngles

				var_126_21.z = 0
				var_126_21.x = 0
				var_126_15.localEulerAngles = var_126_21
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				var_126_15.localPosition = Vector3.New(0, 100, 0)

				local var_126_22 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_22.x, var_126_22.y, var_126_22.z)

				local var_126_23 = var_126_15.localEulerAngles

				var_126_23.z = 0
				var_126_23.x = 0
				var_126_15.localEulerAngles = var_126_23
			end

			local var_126_24 = arg_123_1.actors_["2079ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect2079ui_story == nil then
				arg_123_1.var_.characterEffect2079ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.200000002980232

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect2079ui_story then
					local var_126_28 = Mathf.Lerp(0, 0.5, var_126_27)

					arg_123_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_123_1.var_.characterEffect2079ui_story.fillRatio = var_126_28
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect2079ui_story then
				local var_126_29 = 0.5

				arg_123_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_123_1.var_.characterEffect2079ui_story.fillRatio = var_126_29
			end

			local var_126_30 = 0
			local var_126_31 = 0.575

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_32 = arg_123_1:GetWordFromCfg(317032031)
				local var_126_33 = arg_123_1:FormatText(var_126_32.content)

				arg_123_1.text_.text = var_126_33

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_34 = 23
				local var_126_35 = utf8.len(var_126_33)
				local var_126_36 = var_126_34 <= 0 and var_126_31 or var_126_31 * (var_126_35 / var_126_34)

				if var_126_36 > 0 and var_126_31 < var_126_36 then
					arg_123_1.talkMaxDuration = var_126_36

					if var_126_36 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_36 + var_126_30
					end
				end

				arg_123_1.text_.text = var_126_33
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_37 = math.max(var_126_31, arg_123_1.talkMaxDuration)

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_37 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_30) / var_126_37

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_30 + var_126_37 and arg_123_1.time_ < var_126_30 + var_126_37 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play317032032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 317032032
		arg_127_1.duration_ = 7.9

		local var_127_0 = {
			zh = 3.9,
			ja = 7.9
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
				arg_127_0:Play317032033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1015ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1015ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, -1.15, -6.2)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1015ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1015ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story == nil then
				arg_127_1.var_.characterEffect1015ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect1015ui_story then
					arg_127_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story then
				arg_127_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_130_15 = 0
			local var_130_16 = 0.5

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_17 = arg_127_1:FormatText(StoryNameCfg[479].name)

				arg_127_1.leftNameTxt_.text = var_130_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_18 = arg_127_1:GetWordFromCfg(317032032)
				local var_130_19 = arg_127_1:FormatText(var_130_18.content)

				arg_127_1.text_.text = var_130_19

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_20 = 20
				local var_130_21 = utf8.len(var_130_19)
				local var_130_22 = var_130_20 <= 0 and var_130_16 or var_130_16 * (var_130_21 / var_130_20)

				if var_130_22 > 0 and var_130_16 < var_130_22 then
					arg_127_1.talkMaxDuration = var_130_22

					if var_130_22 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_22 + var_130_15
					end
				end

				arg_127_1.text_.text = var_130_19
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032032", "story_v_out_317032.awb") ~= 0 then
					local var_130_23 = manager.audio:GetVoiceLength("story_v_out_317032", "317032032", "story_v_out_317032.awb") / 1000

					if var_130_23 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_23 + var_130_15
					end

					if var_130_18.prefab_name ~= "" and arg_127_1.actors_[var_130_18.prefab_name] ~= nil then
						local var_130_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_18.prefab_name].transform, "story_v_out_317032", "317032032", "story_v_out_317032.awb")

						arg_127_1:RecordAudio("317032032", var_130_24)
						arg_127_1:RecordAudio("317032032", var_130_24)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_317032", "317032032", "story_v_out_317032.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_317032", "317032032", "story_v_out_317032.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_25 = math.max(var_130_16, arg_127_1.talkMaxDuration)

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_25 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_15) / var_130_25

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_15 + var_130_25 and arg_127_1.time_ < var_130_15 + var_130_25 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play317032033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 317032033
		arg_131_1.duration_ = 4.2

		local var_131_0 = {
			zh = 4.2,
			ja = 3.3
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
				arg_131_0:Play317032034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.525

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[479].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(317032033)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 21
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032033", "story_v_out_317032.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_317032", "317032033", "story_v_out_317032.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_317032", "317032033", "story_v_out_317032.awb")

						arg_131_1:RecordAudio("317032033", var_134_9)
						arg_131_1:RecordAudio("317032033", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_317032", "317032033", "story_v_out_317032.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_317032", "317032033", "story_v_out_317032.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_10 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_10 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_10

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_10 and arg_131_1.time_ < var_134_0 + var_134_10 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play317032034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 317032034
		arg_135_1.duration_ = 9.033

		local var_135_0 = {
			zh = 5.6,
			ja = 9.033
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
				arg_135_0:Play317032035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["2079ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos2079ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, -1.28, -5.6)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos2079ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["2079ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect2079ui_story == nil then
				arg_135_1.var_.characterEffect2079ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect2079ui_story then
					arg_135_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect2079ui_story then
				arg_135_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_15 = arg_135_1.actors_["1015ui_story"].transform
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				arg_135_1.var_.moveOldPos1015ui_story = var_138_15.localPosition
			end

			local var_138_17 = 0.001

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17
				local var_138_19 = Vector3.New(0, 100, 0)

				var_138_15.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1015ui_story, var_138_19, var_138_18)

				local var_138_20 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_20.x, var_138_20.y, var_138_20.z)

				local var_138_21 = var_138_15.localEulerAngles

				var_138_21.z = 0
				var_138_21.x = 0
				var_138_15.localEulerAngles = var_138_21
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 then
				var_138_15.localPosition = Vector3.New(0, 100, 0)

				local var_138_22 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_22.x, var_138_22.y, var_138_22.z)

				local var_138_23 = var_138_15.localEulerAngles

				var_138_23.z = 0
				var_138_23.x = 0
				var_138_15.localEulerAngles = var_138_23
			end

			local var_138_24 = arg_135_1.actors_["1015ui_story"]
			local var_138_25 = 0

			if var_138_25 < arg_135_1.time_ and arg_135_1.time_ <= var_138_25 + arg_138_0 and arg_135_1.var_.characterEffect1015ui_story == nil then
				arg_135_1.var_.characterEffect1015ui_story = var_138_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_26 = 0.200000002980232

			if var_138_25 <= arg_135_1.time_ and arg_135_1.time_ < var_138_25 + var_138_26 then
				local var_138_27 = (arg_135_1.time_ - var_138_25) / var_138_26

				if arg_135_1.var_.characterEffect1015ui_story then
					local var_138_28 = Mathf.Lerp(0, 0.5, var_138_27)

					arg_135_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1015ui_story.fillRatio = var_138_28
				end
			end

			if arg_135_1.time_ >= var_138_25 + var_138_26 and arg_135_1.time_ < var_138_25 + var_138_26 + arg_138_0 and arg_135_1.var_.characterEffect1015ui_story then
				local var_138_29 = 0.5

				arg_135_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1015ui_story.fillRatio = var_138_29
			end

			local var_138_30 = 0
			local var_138_31 = 0.675

			if var_138_30 < arg_135_1.time_ and arg_135_1.time_ <= var_138_30 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_32 = arg_135_1:FormatText(StoryNameCfg[529].name)

				arg_135_1.leftNameTxt_.text = var_138_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_33 = arg_135_1:GetWordFromCfg(317032034)
				local var_138_34 = arg_135_1:FormatText(var_138_33.content)

				arg_135_1.text_.text = var_138_34

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_35 = 28
				local var_138_36 = utf8.len(var_138_34)
				local var_138_37 = var_138_35 <= 0 and var_138_31 or var_138_31 * (var_138_36 / var_138_35)

				if var_138_37 > 0 and var_138_31 < var_138_37 then
					arg_135_1.talkMaxDuration = var_138_37

					if var_138_37 + var_138_30 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_37 + var_138_30
					end
				end

				arg_135_1.text_.text = var_138_34
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032034", "story_v_out_317032.awb") ~= 0 then
					local var_138_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032034", "story_v_out_317032.awb") / 1000

					if var_138_38 + var_138_30 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_38 + var_138_30
					end

					if var_138_33.prefab_name ~= "" and arg_135_1.actors_[var_138_33.prefab_name] ~= nil then
						local var_138_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_33.prefab_name].transform, "story_v_out_317032", "317032034", "story_v_out_317032.awb")

						arg_135_1:RecordAudio("317032034", var_138_39)
						arg_135_1:RecordAudio("317032034", var_138_39)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_317032", "317032034", "story_v_out_317032.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_317032", "317032034", "story_v_out_317032.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_40 = math.max(var_138_31, arg_135_1.talkMaxDuration)

			if var_138_30 <= arg_135_1.time_ and arg_135_1.time_ < var_138_30 + var_138_40 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_30) / var_138_40

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_30 + var_138_40 and arg_135_1.time_ < var_138_30 + var_138_40 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play317032035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 317032035
		arg_139_1.duration_ = 8.633

		local var_139_0 = {
			zh = 8.633,
			ja = 7.833
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
				arg_139_0:Play317032036(arg_139_1)
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
				local var_142_4 = Vector3.New(0, -1.11, -5.88)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1093ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -1.11, -5.88)

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
				arg_139_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_142_15 = arg_139_1.actors_["2079ui_story"].transform
			local var_142_16 = 0

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 then
				arg_139_1.var_.moveOldPos2079ui_story = var_142_15.localPosition
			end

			local var_142_17 = 0.001

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_16) / var_142_17
				local var_142_19 = Vector3.New(0, 100, 0)

				var_142_15.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos2079ui_story, var_142_19, var_142_18)

				local var_142_20 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_20.x, var_142_20.y, var_142_20.z)

				local var_142_21 = var_142_15.localEulerAngles

				var_142_21.z = 0
				var_142_21.x = 0
				var_142_15.localEulerAngles = var_142_21
			end

			if arg_139_1.time_ >= var_142_16 + var_142_17 and arg_139_1.time_ < var_142_16 + var_142_17 + arg_142_0 then
				var_142_15.localPosition = Vector3.New(0, 100, 0)

				local var_142_22 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_22.x, var_142_22.y, var_142_22.z)

				local var_142_23 = var_142_15.localEulerAngles

				var_142_23.z = 0
				var_142_23.x = 0
				var_142_15.localEulerAngles = var_142_23
			end

			local var_142_24 = arg_139_1.actors_["2079ui_story"]
			local var_142_25 = 0

			if var_142_25 < arg_139_1.time_ and arg_139_1.time_ <= var_142_25 + arg_142_0 and arg_139_1.var_.characterEffect2079ui_story == nil then
				arg_139_1.var_.characterEffect2079ui_story = var_142_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_26 = 0.200000002980232

			if var_142_25 <= arg_139_1.time_ and arg_139_1.time_ < var_142_25 + var_142_26 then
				local var_142_27 = (arg_139_1.time_ - var_142_25) / var_142_26

				if arg_139_1.var_.characterEffect2079ui_story then
					local var_142_28 = Mathf.Lerp(0, 0.5, var_142_27)

					arg_139_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_139_1.var_.characterEffect2079ui_story.fillRatio = var_142_28
				end
			end

			if arg_139_1.time_ >= var_142_25 + var_142_26 and arg_139_1.time_ < var_142_25 + var_142_26 + arg_142_0 and arg_139_1.var_.characterEffect2079ui_story then
				local var_142_29 = 0.5

				arg_139_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_139_1.var_.characterEffect2079ui_story.fillRatio = var_142_29
			end

			local var_142_30 = 0
			local var_142_31 = 1.05

			if var_142_30 < arg_139_1.time_ and arg_139_1.time_ <= var_142_30 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_32 = arg_139_1:FormatText(StoryNameCfg[73].name)

				arg_139_1.leftNameTxt_.text = var_142_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_33 = arg_139_1:GetWordFromCfg(317032035)
				local var_142_34 = arg_139_1:FormatText(var_142_33.content)

				arg_139_1.text_.text = var_142_34

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_35 = 42
				local var_142_36 = utf8.len(var_142_34)
				local var_142_37 = var_142_35 <= 0 and var_142_31 or var_142_31 * (var_142_36 / var_142_35)

				if var_142_37 > 0 and var_142_31 < var_142_37 then
					arg_139_1.talkMaxDuration = var_142_37

					if var_142_37 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_37 + var_142_30
					end
				end

				arg_139_1.text_.text = var_142_34
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032035", "story_v_out_317032.awb") ~= 0 then
					local var_142_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032035", "story_v_out_317032.awb") / 1000

					if var_142_38 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_38 + var_142_30
					end

					if var_142_33.prefab_name ~= "" and arg_139_1.actors_[var_142_33.prefab_name] ~= nil then
						local var_142_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_33.prefab_name].transform, "story_v_out_317032", "317032035", "story_v_out_317032.awb")

						arg_139_1:RecordAudio("317032035", var_142_39)
						arg_139_1:RecordAudio("317032035", var_142_39)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_317032", "317032035", "story_v_out_317032.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_317032", "317032035", "story_v_out_317032.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_40 = math.max(var_142_31, arg_139_1.talkMaxDuration)

			if var_142_30 <= arg_139_1.time_ and arg_139_1.time_ < var_142_30 + var_142_40 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_30) / var_142_40

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_30 + var_142_40 and arg_139_1.time_ < var_142_30 + var_142_40 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play317032036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 317032036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play317032037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1093ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1093ui_story == nil then
				arg_143_1.var_.characterEffect1093ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1093ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1093ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1093ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1093ui_story.fillRatio = var_146_5
			end

			local var_146_6 = 0
			local var_146_7 = 0.275

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_8 = arg_143_1:GetWordFromCfg(317032036)
				local var_146_9 = arg_143_1:FormatText(var_146_8.content)

				arg_143_1.text_.text = var_146_9

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_10 = 11
				local var_146_11 = utf8.len(var_146_9)
				local var_146_12 = var_146_10 <= 0 and var_146_7 or var_146_7 * (var_146_11 / var_146_10)

				if var_146_12 > 0 and var_146_7 < var_146_12 then
					arg_143_1.talkMaxDuration = var_146_12

					if var_146_12 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_9
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_13 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_13 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_13

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_13 and arg_143_1.time_ < var_146_6 + var_146_13 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play317032037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 317032037
		arg_147_1.duration_ = 15.2

		local var_147_0 = {
			zh = 9.233,
			ja = 15.2
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
				arg_147_0:Play317032038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1015ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1015ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0, -1.15, -6.2)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1015ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = arg_147_1.actors_["1015ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect1015ui_story == nil then
				arg_147_1.var_.characterEffect1015ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.200000002980232

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect1015ui_story then
					arg_147_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect1015ui_story then
				arg_147_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_150_13 = 0

			if var_150_13 < arg_147_1.time_ and arg_147_1.time_ <= var_150_13 + arg_150_0 then
				arg_147_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_15 = arg_147_1.actors_["1093ui_story"].transform
			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 then
				arg_147_1.var_.moveOldPos1093ui_story = var_150_15.localPosition
			end

			local var_150_17 = 0.001

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17
				local var_150_19 = Vector3.New(0, 100, 0)

				var_150_15.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1093ui_story, var_150_19, var_150_18)

				local var_150_20 = manager.ui.mainCamera.transform.position - var_150_15.position

				var_150_15.forward = Vector3.New(var_150_20.x, var_150_20.y, var_150_20.z)

				local var_150_21 = var_150_15.localEulerAngles

				var_150_21.z = 0
				var_150_21.x = 0
				var_150_15.localEulerAngles = var_150_21
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 then
				var_150_15.localPosition = Vector3.New(0, 100, 0)

				local var_150_22 = manager.ui.mainCamera.transform.position - var_150_15.position

				var_150_15.forward = Vector3.New(var_150_22.x, var_150_22.y, var_150_22.z)

				local var_150_23 = var_150_15.localEulerAngles

				var_150_23.z = 0
				var_150_23.x = 0
				var_150_15.localEulerAngles = var_150_23
			end

			local var_150_24 = 0
			local var_150_25 = 0.9

			if var_150_24 < arg_147_1.time_ and arg_147_1.time_ <= var_150_24 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_26 = arg_147_1:FormatText(StoryNameCfg[479].name)

				arg_147_1.leftNameTxt_.text = var_150_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_27 = arg_147_1:GetWordFromCfg(317032037)
				local var_150_28 = arg_147_1:FormatText(var_150_27.content)

				arg_147_1.text_.text = var_150_28

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_29 = 36
				local var_150_30 = utf8.len(var_150_28)
				local var_150_31 = var_150_29 <= 0 and var_150_25 or var_150_25 * (var_150_30 / var_150_29)

				if var_150_31 > 0 and var_150_25 < var_150_31 then
					arg_147_1.talkMaxDuration = var_150_31

					if var_150_31 + var_150_24 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_31 + var_150_24
					end
				end

				arg_147_1.text_.text = var_150_28
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032037", "story_v_out_317032.awb") ~= 0 then
					local var_150_32 = manager.audio:GetVoiceLength("story_v_out_317032", "317032037", "story_v_out_317032.awb") / 1000

					if var_150_32 + var_150_24 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_32 + var_150_24
					end

					if var_150_27.prefab_name ~= "" and arg_147_1.actors_[var_150_27.prefab_name] ~= nil then
						local var_150_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_27.prefab_name].transform, "story_v_out_317032", "317032037", "story_v_out_317032.awb")

						arg_147_1:RecordAudio("317032037", var_150_33)
						arg_147_1:RecordAudio("317032037", var_150_33)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_317032", "317032037", "story_v_out_317032.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_317032", "317032037", "story_v_out_317032.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_34 = math.max(var_150_25, arg_147_1.talkMaxDuration)

			if var_150_24 <= arg_147_1.time_ and arg_147_1.time_ < var_150_24 + var_150_34 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_24) / var_150_34

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_24 + var_150_34 and arg_147_1.time_ < var_150_24 + var_150_34 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play317032038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 317032038
		arg_151_1.duration_ = 1.999999999999

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play317032039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["2078ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos2078ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos2078ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["2078ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect2078ui_story == nil then
				arg_151_1.var_.characterEffect2078ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect2078ui_story then
					arg_151_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect2078ui_story then
				arg_151_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_154_15 = arg_151_1.actors_["2079ui_story"].transform
			local var_154_16 = 0

			if var_154_16 < arg_151_1.time_ and arg_151_1.time_ <= var_154_16 + arg_154_0 then
				arg_151_1.var_.moveOldPos2079ui_story = var_154_15.localPosition
			end

			local var_154_17 = 0.001

			if var_154_16 <= arg_151_1.time_ and arg_151_1.time_ < var_154_16 + var_154_17 then
				local var_154_18 = (arg_151_1.time_ - var_154_16) / var_154_17
				local var_154_19 = Vector3.New(0.7, -1.28, -5.6)

				var_154_15.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos2079ui_story, var_154_19, var_154_18)

				local var_154_20 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_20.x, var_154_20.y, var_154_20.z)

				local var_154_21 = var_154_15.localEulerAngles

				var_154_21.z = 0
				var_154_21.x = 0
				var_154_15.localEulerAngles = var_154_21
			end

			if arg_151_1.time_ >= var_154_16 + var_154_17 and arg_151_1.time_ < var_154_16 + var_154_17 + arg_154_0 then
				var_154_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_154_22 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_22.x, var_154_22.y, var_154_22.z)

				local var_154_23 = var_154_15.localEulerAngles

				var_154_23.z = 0
				var_154_23.x = 0
				var_154_15.localEulerAngles = var_154_23
			end

			local var_154_24 = arg_151_1.actors_["2079ui_story"]
			local var_154_25 = 0

			if var_154_25 < arg_151_1.time_ and arg_151_1.time_ <= var_154_25 + arg_154_0 and arg_151_1.var_.characterEffect2079ui_story == nil then
				arg_151_1.var_.characterEffect2079ui_story = var_154_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_26 = 0.200000002980232

			if var_154_25 <= arg_151_1.time_ and arg_151_1.time_ < var_154_25 + var_154_26 then
				local var_154_27 = (arg_151_1.time_ - var_154_25) / var_154_26

				if arg_151_1.var_.characterEffect2079ui_story then
					local var_154_28 = Mathf.Lerp(0, 0.5, var_154_27)

					arg_151_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_151_1.var_.characterEffect2079ui_story.fillRatio = var_154_28
				end
			end

			if arg_151_1.time_ >= var_154_25 + var_154_26 and arg_151_1.time_ < var_154_25 + var_154_26 + arg_154_0 and arg_151_1.var_.characterEffect2079ui_story then
				local var_154_29 = 0.5

				arg_151_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_151_1.var_.characterEffect2079ui_story.fillRatio = var_154_29
			end

			local var_154_30 = arg_151_1.actors_["1015ui_story"].transform
			local var_154_31 = 0

			if var_154_31 < arg_151_1.time_ and arg_151_1.time_ <= var_154_31 + arg_154_0 then
				arg_151_1.var_.moveOldPos1015ui_story = var_154_30.localPosition
			end

			local var_154_32 = 0.001

			if var_154_31 <= arg_151_1.time_ and arg_151_1.time_ < var_154_31 + var_154_32 then
				local var_154_33 = (arg_151_1.time_ - var_154_31) / var_154_32
				local var_154_34 = Vector3.New(0, 100, 0)

				var_154_30.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1015ui_story, var_154_34, var_154_33)

				local var_154_35 = manager.ui.mainCamera.transform.position - var_154_30.position

				var_154_30.forward = Vector3.New(var_154_35.x, var_154_35.y, var_154_35.z)

				local var_154_36 = var_154_30.localEulerAngles

				var_154_36.z = 0
				var_154_36.x = 0
				var_154_30.localEulerAngles = var_154_36
			end

			if arg_151_1.time_ >= var_154_31 + var_154_32 and arg_151_1.time_ < var_154_31 + var_154_32 + arg_154_0 then
				var_154_30.localPosition = Vector3.New(0, 100, 0)

				local var_154_37 = manager.ui.mainCamera.transform.position - var_154_30.position

				var_154_30.forward = Vector3.New(var_154_37.x, var_154_37.y, var_154_37.z)

				local var_154_38 = var_154_30.localEulerAngles

				var_154_38.z = 0
				var_154_38.x = 0
				var_154_30.localEulerAngles = var_154_38
			end

			local var_154_39 = 0
			local var_154_40 = 0.15

			if var_154_39 < arg_151_1.time_ and arg_151_1.time_ <= var_154_39 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_41 = arg_151_1:FormatText(StoryNameCfg[528].name)

				arg_151_1.leftNameTxt_.text = var_154_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_42 = arg_151_1:GetWordFromCfg(317032038)
				local var_154_43 = arg_151_1:FormatText(var_154_42.content)

				arg_151_1.text_.text = var_154_43

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_44 = 6
				local var_154_45 = utf8.len(var_154_43)
				local var_154_46 = var_154_44 <= 0 and var_154_40 or var_154_40 * (var_154_45 / var_154_44)

				if var_154_46 > 0 and var_154_40 < var_154_46 then
					arg_151_1.talkMaxDuration = var_154_46

					if var_154_46 + var_154_39 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_46 + var_154_39
					end
				end

				arg_151_1.text_.text = var_154_43
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032038", "story_v_out_317032.awb") ~= 0 then
					local var_154_47 = manager.audio:GetVoiceLength("story_v_out_317032", "317032038", "story_v_out_317032.awb") / 1000

					if var_154_47 + var_154_39 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_47 + var_154_39
					end

					if var_154_42.prefab_name ~= "" and arg_151_1.actors_[var_154_42.prefab_name] ~= nil then
						local var_154_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_42.prefab_name].transform, "story_v_out_317032", "317032038", "story_v_out_317032.awb")

						arg_151_1:RecordAudio("317032038", var_154_48)
						arg_151_1:RecordAudio("317032038", var_154_48)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_317032", "317032038", "story_v_out_317032.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_317032", "317032038", "story_v_out_317032.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_49 = math.max(var_154_40, arg_151_1.talkMaxDuration)

			if var_154_39 <= arg_151_1.time_ and arg_151_1.time_ < var_154_39 + var_154_49 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_39) / var_154_49

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_39 + var_154_49 and arg_151_1.time_ < var_154_39 + var_154_49 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play317032039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 317032039
		arg_155_1.duration_ = 2.866

		local var_155_0 = {
			zh = 1.833,
			ja = 2.866
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
				arg_155_0:Play317032040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["2078ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos2078ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos2078ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["2078ui_story"]
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect2078ui_story == nil then
				arg_155_1.var_.characterEffect2078ui_story = var_158_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_11 = 0.200000002980232

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11

				if arg_155_1.var_.characterEffect2078ui_story then
					arg_155_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect2078ui_story then
				arg_155_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_158_13 = 0

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_158_15 = arg_155_1.actors_["2079ui_story"].transform
			local var_158_16 = 0

			if var_158_16 < arg_155_1.time_ and arg_155_1.time_ <= var_158_16 + arg_158_0 then
				arg_155_1.var_.moveOldPos2079ui_story = var_158_15.localPosition
			end

			local var_158_17 = 0.001

			if var_158_16 <= arg_155_1.time_ and arg_155_1.time_ < var_158_16 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_16) / var_158_17
				local var_158_19 = Vector3.New(0.7, -1.28, -5.6)

				var_158_15.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos2079ui_story, var_158_19, var_158_18)

				local var_158_20 = manager.ui.mainCamera.transform.position - var_158_15.position

				var_158_15.forward = Vector3.New(var_158_20.x, var_158_20.y, var_158_20.z)

				local var_158_21 = var_158_15.localEulerAngles

				var_158_21.z = 0
				var_158_21.x = 0
				var_158_15.localEulerAngles = var_158_21
			end

			if arg_155_1.time_ >= var_158_16 + var_158_17 and arg_155_1.time_ < var_158_16 + var_158_17 + arg_158_0 then
				var_158_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_158_22 = manager.ui.mainCamera.transform.position - var_158_15.position

				var_158_15.forward = Vector3.New(var_158_22.x, var_158_22.y, var_158_22.z)

				local var_158_23 = var_158_15.localEulerAngles

				var_158_23.z = 0
				var_158_23.x = 0
				var_158_15.localEulerAngles = var_158_23
			end

			local var_158_24 = arg_155_1.actors_["2079ui_story"]
			local var_158_25 = 0

			if var_158_25 < arg_155_1.time_ and arg_155_1.time_ <= var_158_25 + arg_158_0 and arg_155_1.var_.characterEffect2079ui_story == nil then
				arg_155_1.var_.characterEffect2079ui_story = var_158_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_26 = 0.200000002980232

			if var_158_25 <= arg_155_1.time_ and arg_155_1.time_ < var_158_25 + var_158_26 then
				local var_158_27 = (arg_155_1.time_ - var_158_25) / var_158_26

				if arg_155_1.var_.characterEffect2079ui_story then
					local var_158_28 = Mathf.Lerp(0, 0.5, var_158_27)

					arg_155_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_155_1.var_.characterEffect2079ui_story.fillRatio = var_158_28
				end
			end

			if arg_155_1.time_ >= var_158_25 + var_158_26 and arg_155_1.time_ < var_158_25 + var_158_26 + arg_158_0 and arg_155_1.var_.characterEffect2079ui_story then
				local var_158_29 = 0.5

				arg_155_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_155_1.var_.characterEffect2079ui_story.fillRatio = var_158_29
			end

			local var_158_30 = 0
			local var_158_31 = 0.25

			if var_158_30 < arg_155_1.time_ and arg_155_1.time_ <= var_158_30 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_32 = arg_155_1:FormatText(StoryNameCfg[530].name)

				arg_155_1.leftNameTxt_.text = var_158_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_33 = arg_155_1:GetWordFromCfg(317032039)
				local var_158_34 = arg_155_1:FormatText(var_158_33.content)

				arg_155_1.text_.text = var_158_34

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_35 = 10
				local var_158_36 = utf8.len(var_158_34)
				local var_158_37 = var_158_35 <= 0 and var_158_31 or var_158_31 * (var_158_36 / var_158_35)

				if var_158_37 > 0 and var_158_31 < var_158_37 then
					arg_155_1.talkMaxDuration = var_158_37

					if var_158_37 + var_158_30 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_37 + var_158_30
					end
				end

				arg_155_1.text_.text = var_158_34
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032039", "story_v_out_317032.awb") ~= 0 then
					local var_158_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032039", "story_v_out_317032.awb") / 1000

					if var_158_38 + var_158_30 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_38 + var_158_30
					end

					if var_158_33.prefab_name ~= "" and arg_155_1.actors_[var_158_33.prefab_name] ~= nil then
						local var_158_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_33.prefab_name].transform, "story_v_out_317032", "317032039", "story_v_out_317032.awb")

						arg_155_1:RecordAudio("317032039", var_158_39)
						arg_155_1:RecordAudio("317032039", var_158_39)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_317032", "317032039", "story_v_out_317032.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_317032", "317032039", "story_v_out_317032.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_40 = math.max(var_158_31, arg_155_1.talkMaxDuration)

			if var_158_30 <= arg_155_1.time_ and arg_155_1.time_ < var_158_30 + var_158_40 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_30) / var_158_40

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_30 + var_158_40 and arg_155_1.time_ < var_158_30 + var_158_40 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play317032040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 317032040
		arg_159_1.duration_ = 4.8

		local var_159_0 = {
			zh = 4.8,
			ja = 4.266
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
				arg_159_0:Play317032041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["2078ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos2078ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos2078ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["2078ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect2078ui_story == nil then
				arg_159_1.var_.characterEffect2078ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect2078ui_story then
					local var_162_13 = Mathf.Lerp(0, 0.5, var_162_12)

					arg_159_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_159_1.var_.characterEffect2078ui_story.fillRatio = var_162_13
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect2078ui_story then
				local var_162_14 = 0.5

				arg_159_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_159_1.var_.characterEffect2078ui_story.fillRatio = var_162_14
			end

			local var_162_15 = arg_159_1.actors_["2079ui_story"].transform
			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 then
				arg_159_1.var_.moveOldPos2079ui_story = var_162_15.localPosition
			end

			local var_162_17 = 0.001

			if var_162_16 <= arg_159_1.time_ and arg_159_1.time_ < var_162_16 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_16) / var_162_17
				local var_162_19 = Vector3.New(0.7, -1.28, -5.6)

				var_162_15.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos2079ui_story, var_162_19, var_162_18)

				local var_162_20 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_20.x, var_162_20.y, var_162_20.z)

				local var_162_21 = var_162_15.localEulerAngles

				var_162_21.z = 0
				var_162_21.x = 0
				var_162_15.localEulerAngles = var_162_21
			end

			if arg_159_1.time_ >= var_162_16 + var_162_17 and arg_159_1.time_ < var_162_16 + var_162_17 + arg_162_0 then
				var_162_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_162_22 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_22.x, var_162_22.y, var_162_22.z)

				local var_162_23 = var_162_15.localEulerAngles

				var_162_23.z = 0
				var_162_23.x = 0
				var_162_15.localEulerAngles = var_162_23
			end

			local var_162_24 = arg_159_1.actors_["2079ui_story"]
			local var_162_25 = 0

			if var_162_25 < arg_159_1.time_ and arg_159_1.time_ <= var_162_25 + arg_162_0 and arg_159_1.var_.characterEffect2079ui_story == nil then
				arg_159_1.var_.characterEffect2079ui_story = var_162_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_26 = 0.200000002980232

			if var_162_25 <= arg_159_1.time_ and arg_159_1.time_ < var_162_25 + var_162_26 then
				local var_162_27 = (arg_159_1.time_ - var_162_25) / var_162_26

				if arg_159_1.var_.characterEffect2079ui_story then
					arg_159_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_25 + var_162_26 and arg_159_1.time_ < var_162_25 + var_162_26 + arg_162_0 and arg_159_1.var_.characterEffect2079ui_story then
				arg_159_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_162_28 = 0

			if var_162_28 < arg_159_1.time_ and arg_159_1.time_ <= var_162_28 + arg_162_0 then
				arg_159_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_162_29 = 0

			if var_162_29 < arg_159_1.time_ and arg_159_1.time_ <= var_162_29 + arg_162_0 then
				arg_159_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_162_30 = 0
			local var_162_31 = 0.475

			if var_162_30 < arg_159_1.time_ and arg_159_1.time_ <= var_162_30 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_32 = arg_159_1:FormatText(StoryNameCfg[529].name)

				arg_159_1.leftNameTxt_.text = var_162_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_33 = arg_159_1:GetWordFromCfg(317032040)
				local var_162_34 = arg_159_1:FormatText(var_162_33.content)

				arg_159_1.text_.text = var_162_34

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_35 = 19
				local var_162_36 = utf8.len(var_162_34)
				local var_162_37 = var_162_35 <= 0 and var_162_31 or var_162_31 * (var_162_36 / var_162_35)

				if var_162_37 > 0 and var_162_31 < var_162_37 then
					arg_159_1.talkMaxDuration = var_162_37

					if var_162_37 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_37 + var_162_30
					end
				end

				arg_159_1.text_.text = var_162_34
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032040", "story_v_out_317032.awb") ~= 0 then
					local var_162_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032040", "story_v_out_317032.awb") / 1000

					if var_162_38 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_38 + var_162_30
					end

					if var_162_33.prefab_name ~= "" and arg_159_1.actors_[var_162_33.prefab_name] ~= nil then
						local var_162_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_33.prefab_name].transform, "story_v_out_317032", "317032040", "story_v_out_317032.awb")

						arg_159_1:RecordAudio("317032040", var_162_39)
						arg_159_1:RecordAudio("317032040", var_162_39)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_317032", "317032040", "story_v_out_317032.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_317032", "317032040", "story_v_out_317032.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_40 = math.max(var_162_31, arg_159_1.talkMaxDuration)

			if var_162_30 <= arg_159_1.time_ and arg_159_1.time_ < var_162_30 + var_162_40 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_30) / var_162_40

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_30 + var_162_40 and arg_159_1.time_ < var_162_30 + var_162_40 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play317032041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 317032041
		arg_163_1.duration_ = 2.5

		local var_163_0 = {
			zh = 1.999999999999,
			ja = 2.5
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
				arg_163_0:Play317032042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["2078ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos2078ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, 100, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos2078ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, 100, 0)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["2078ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect2078ui_story == nil then
				arg_163_1.var_.characterEffect2078ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect2078ui_story then
					local var_166_13 = Mathf.Lerp(0, 0.5, var_166_12)

					arg_163_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_163_1.var_.characterEffect2078ui_story.fillRatio = var_166_13
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect2078ui_story then
				local var_166_14 = 0.5

				arg_163_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_163_1.var_.characterEffect2078ui_story.fillRatio = var_166_14
			end

			local var_166_15 = arg_163_1.actors_["2079ui_story"].transform
			local var_166_16 = 0

			if var_166_16 < arg_163_1.time_ and arg_163_1.time_ <= var_166_16 + arg_166_0 then
				arg_163_1.var_.moveOldPos2079ui_story = var_166_15.localPosition
			end

			local var_166_17 = 0.001

			if var_166_16 <= arg_163_1.time_ and arg_163_1.time_ < var_166_16 + var_166_17 then
				local var_166_18 = (arg_163_1.time_ - var_166_16) / var_166_17
				local var_166_19 = Vector3.New(0, 100, 0)

				var_166_15.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos2079ui_story, var_166_19, var_166_18)

				local var_166_20 = manager.ui.mainCamera.transform.position - var_166_15.position

				var_166_15.forward = Vector3.New(var_166_20.x, var_166_20.y, var_166_20.z)

				local var_166_21 = var_166_15.localEulerAngles

				var_166_21.z = 0
				var_166_21.x = 0
				var_166_15.localEulerAngles = var_166_21
			end

			if arg_163_1.time_ >= var_166_16 + var_166_17 and arg_163_1.time_ < var_166_16 + var_166_17 + arg_166_0 then
				var_166_15.localPosition = Vector3.New(0, 100, 0)

				local var_166_22 = manager.ui.mainCamera.transform.position - var_166_15.position

				var_166_15.forward = Vector3.New(var_166_22.x, var_166_22.y, var_166_22.z)

				local var_166_23 = var_166_15.localEulerAngles

				var_166_23.z = 0
				var_166_23.x = 0
				var_166_15.localEulerAngles = var_166_23
			end

			local var_166_24 = arg_163_1.actors_["2079ui_story"]
			local var_166_25 = 0

			if var_166_25 < arg_163_1.time_ and arg_163_1.time_ <= var_166_25 + arg_166_0 and arg_163_1.var_.characterEffect2079ui_story == nil then
				arg_163_1.var_.characterEffect2079ui_story = var_166_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_26 = 0.200000002980232

			if var_166_25 <= arg_163_1.time_ and arg_163_1.time_ < var_166_25 + var_166_26 then
				local var_166_27 = (arg_163_1.time_ - var_166_25) / var_166_26

				if arg_163_1.var_.characterEffect2079ui_story then
					local var_166_28 = Mathf.Lerp(0, 0.5, var_166_27)

					arg_163_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_163_1.var_.characterEffect2079ui_story.fillRatio = var_166_28
				end
			end

			if arg_163_1.time_ >= var_166_25 + var_166_26 and arg_163_1.time_ < var_166_25 + var_166_26 + arg_166_0 and arg_163_1.var_.characterEffect2079ui_story then
				local var_166_29 = 0.5

				arg_163_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_163_1.var_.characterEffect2079ui_story.fillRatio = var_166_29
			end

			local var_166_30 = arg_163_1.actors_["1015ui_story"].transform
			local var_166_31 = 0

			if var_166_31 < arg_163_1.time_ and arg_163_1.time_ <= var_166_31 + arg_166_0 then
				arg_163_1.var_.moveOldPos1015ui_story = var_166_30.localPosition
			end

			local var_166_32 = 0.001

			if var_166_31 <= arg_163_1.time_ and arg_163_1.time_ < var_166_31 + var_166_32 then
				local var_166_33 = (arg_163_1.time_ - var_166_31) / var_166_32
				local var_166_34 = Vector3.New(0, -1.15, -6.2)

				var_166_30.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1015ui_story, var_166_34, var_166_33)

				local var_166_35 = manager.ui.mainCamera.transform.position - var_166_30.position

				var_166_30.forward = Vector3.New(var_166_35.x, var_166_35.y, var_166_35.z)

				local var_166_36 = var_166_30.localEulerAngles

				var_166_36.z = 0
				var_166_36.x = 0
				var_166_30.localEulerAngles = var_166_36
			end

			if arg_163_1.time_ >= var_166_31 + var_166_32 and arg_163_1.time_ < var_166_31 + var_166_32 + arg_166_0 then
				var_166_30.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_166_37 = manager.ui.mainCamera.transform.position - var_166_30.position

				var_166_30.forward = Vector3.New(var_166_37.x, var_166_37.y, var_166_37.z)

				local var_166_38 = var_166_30.localEulerAngles

				var_166_38.z = 0
				var_166_38.x = 0
				var_166_30.localEulerAngles = var_166_38
			end

			local var_166_39 = arg_163_1.actors_["1015ui_story"]
			local var_166_40 = 0

			if var_166_40 < arg_163_1.time_ and arg_163_1.time_ <= var_166_40 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story == nil then
				arg_163_1.var_.characterEffect1015ui_story = var_166_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_41 = 0.200000002980232

			if var_166_40 <= arg_163_1.time_ and arg_163_1.time_ < var_166_40 + var_166_41 then
				local var_166_42 = (arg_163_1.time_ - var_166_40) / var_166_41

				if arg_163_1.var_.characterEffect1015ui_story then
					arg_163_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_40 + var_166_41 and arg_163_1.time_ < var_166_40 + var_166_41 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story then
				arg_163_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_166_43 = 0

			if var_166_43 < arg_163_1.time_ and arg_163_1.time_ <= var_166_43 + arg_166_0 then
				arg_163_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_166_44 = 0

			if var_166_44 < arg_163_1.time_ and arg_163_1.time_ <= var_166_44 + arg_166_0 then
				arg_163_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_166_45 = 0
			local var_166_46 = 0.175

			if var_166_45 < arg_163_1.time_ and arg_163_1.time_ <= var_166_45 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_47 = arg_163_1:FormatText(StoryNameCfg[479].name)

				arg_163_1.leftNameTxt_.text = var_166_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_48 = arg_163_1:GetWordFromCfg(317032041)
				local var_166_49 = arg_163_1:FormatText(var_166_48.content)

				arg_163_1.text_.text = var_166_49

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_50 = 7
				local var_166_51 = utf8.len(var_166_49)
				local var_166_52 = var_166_50 <= 0 and var_166_46 or var_166_46 * (var_166_51 / var_166_50)

				if var_166_52 > 0 and var_166_46 < var_166_52 then
					arg_163_1.talkMaxDuration = var_166_52

					if var_166_52 + var_166_45 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_52 + var_166_45
					end
				end

				arg_163_1.text_.text = var_166_49
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032041", "story_v_out_317032.awb") ~= 0 then
					local var_166_53 = manager.audio:GetVoiceLength("story_v_out_317032", "317032041", "story_v_out_317032.awb") / 1000

					if var_166_53 + var_166_45 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_53 + var_166_45
					end

					if var_166_48.prefab_name ~= "" and arg_163_1.actors_[var_166_48.prefab_name] ~= nil then
						local var_166_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_48.prefab_name].transform, "story_v_out_317032", "317032041", "story_v_out_317032.awb")

						arg_163_1:RecordAudio("317032041", var_166_54)
						arg_163_1:RecordAudio("317032041", var_166_54)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_317032", "317032041", "story_v_out_317032.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_317032", "317032041", "story_v_out_317032.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_55 = math.max(var_166_46, arg_163_1.talkMaxDuration)

			if var_166_45 <= arg_163_1.time_ and arg_163_1.time_ < var_166_45 + var_166_55 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_45) / var_166_55

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_45 + var_166_55 and arg_163_1.time_ < var_166_45 + var_166_55 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play317032042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 317032042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play317032043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1015ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1015ui_story == nil then
				arg_167_1.var_.characterEffect1015ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1015ui_story then
					local var_170_4 = Mathf.Lerp(0, 0.5, var_170_3)

					arg_167_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1015ui_story.fillRatio = var_170_4
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1015ui_story then
				local var_170_5 = 0.5

				arg_167_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1015ui_story.fillRatio = var_170_5
			end

			local var_170_6 = 0
			local var_170_7 = 0.175

			if var_170_6 < arg_167_1.time_ and arg_167_1.time_ <= var_170_6 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_8 = arg_167_1:FormatText(StoryNameCfg[7].name)

				arg_167_1.leftNameTxt_.text = var_170_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_9 = arg_167_1:GetWordFromCfg(317032042)
				local var_170_10 = arg_167_1:FormatText(var_170_9.content)

				arg_167_1.text_.text = var_170_10

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_11 = 7
				local var_170_12 = utf8.len(var_170_10)
				local var_170_13 = var_170_11 <= 0 and var_170_7 or var_170_7 * (var_170_12 / var_170_11)

				if var_170_13 > 0 and var_170_7 < var_170_13 then
					arg_167_1.talkMaxDuration = var_170_13

					if var_170_13 + var_170_6 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_13 + var_170_6
					end
				end

				arg_167_1.text_.text = var_170_10
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_14 = math.max(var_170_7, arg_167_1.talkMaxDuration)

			if var_170_6 <= arg_167_1.time_ and arg_167_1.time_ < var_170_6 + var_170_14 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_6) / var_170_14

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_6 + var_170_14 and arg_167_1.time_ < var_170_6 + var_170_14 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play317032043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 317032043
		arg_171_1.duration_ = 8.733

		local var_171_0 = {
			zh = 8.066,
			ja = 8.733
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
				arg_171_0:Play317032044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1015ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1015ui_story == nil then
				arg_171_1.var_.characterEffect1015ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1015ui_story then
					arg_171_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1015ui_story then
				arg_171_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_174_4 = 0
			local var_174_5 = 1.025

			if var_174_4 < arg_171_1.time_ and arg_171_1.time_ <= var_174_4 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_6 = arg_171_1:FormatText(StoryNameCfg[479].name)

				arg_171_1.leftNameTxt_.text = var_174_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_7 = arg_171_1:GetWordFromCfg(317032043)
				local var_174_8 = arg_171_1:FormatText(var_174_7.content)

				arg_171_1.text_.text = var_174_8

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_9 = 41
				local var_174_10 = utf8.len(var_174_8)
				local var_174_11 = var_174_9 <= 0 and var_174_5 or var_174_5 * (var_174_10 / var_174_9)

				if var_174_11 > 0 and var_174_5 < var_174_11 then
					arg_171_1.talkMaxDuration = var_174_11

					if var_174_11 + var_174_4 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_11 + var_174_4
					end
				end

				arg_171_1.text_.text = var_174_8
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032043", "story_v_out_317032.awb") ~= 0 then
					local var_174_12 = manager.audio:GetVoiceLength("story_v_out_317032", "317032043", "story_v_out_317032.awb") / 1000

					if var_174_12 + var_174_4 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_12 + var_174_4
					end

					if var_174_7.prefab_name ~= "" and arg_171_1.actors_[var_174_7.prefab_name] ~= nil then
						local var_174_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_7.prefab_name].transform, "story_v_out_317032", "317032043", "story_v_out_317032.awb")

						arg_171_1:RecordAudio("317032043", var_174_13)
						arg_171_1:RecordAudio("317032043", var_174_13)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_317032", "317032043", "story_v_out_317032.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_317032", "317032043", "story_v_out_317032.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_14 = math.max(var_174_5, arg_171_1.talkMaxDuration)

			if var_174_4 <= arg_171_1.time_ and arg_171_1.time_ < var_174_4 + var_174_14 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_4) / var_174_14

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_4 + var_174_14 and arg_171_1.time_ < var_174_4 + var_174_14 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play317032044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 317032044
		arg_175_1.duration_ = 11.566

		local var_175_0 = {
			zh = 11.566,
			ja = 10.566
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
				arg_175_0:Play317032045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 1.6

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[479].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(317032044)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 64
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032044", "story_v_out_317032.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_317032", "317032044", "story_v_out_317032.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_317032", "317032044", "story_v_out_317032.awb")

						arg_175_1:RecordAudio("317032044", var_178_9)
						arg_175_1:RecordAudio("317032044", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_317032", "317032044", "story_v_out_317032.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_317032", "317032044", "story_v_out_317032.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play317032045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 317032045
		arg_179_1.duration_ = 6.766

		local var_179_0 = {
			zh = 4.766,
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
				arg_179_0:Play317032046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.6

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[479].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(317032045)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 24
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032045", "story_v_out_317032.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_317032", "317032045", "story_v_out_317032.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_317032", "317032045", "story_v_out_317032.awb")

						arg_179_1:RecordAudio("317032045", var_182_9)
						arg_179_1:RecordAudio("317032045", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_317032", "317032045", "story_v_out_317032.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_317032", "317032045", "story_v_out_317032.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play317032046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 317032046
		arg_183_1.duration_ = 0.499999999999

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"

			SetActive(arg_183_1.choicesGo_, true)

			for iter_184_0, iter_184_1 in ipairs(arg_183_1.choices_) do
				local var_184_0 = iter_184_0 <= 1

				SetActive(iter_184_1.go, var_184_0)
			end

			arg_183_1.choices_[1].txt.text = arg_183_1:FormatText(StoryChoiceCfg[524].name)
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play317032047(arg_183_1)
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

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.allBtn_.enabled = false
			end

			local var_186_7 = 0.5

			if arg_183_1.time_ >= var_186_6 + var_186_7 and arg_183_1.time_ < var_186_6 + var_186_7 + arg_186_0 then
				arg_183_1.allBtn_.enabled = true
			end
		end
	end,
	Play317032047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 317032047
		arg_187_1.duration_ = 14.5

		local var_187_0 = {
			zh = 14.5,
			ja = 10.5
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
				arg_187_0:Play317032048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1015ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1015ui_story == nil then
				arg_187_1.var_.characterEffect1015ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1015ui_story then
					arg_187_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1015ui_story then
				arg_187_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_190_4 = 0

			if var_190_4 < arg_187_1.time_ and arg_187_1.time_ <= var_190_4 + arg_190_0 then
				arg_187_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action5_1")
			end

			local var_190_5 = 0
			local var_190_6 = 1.875

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_7 = arg_187_1:FormatText(StoryNameCfg[479].name)

				arg_187_1.leftNameTxt_.text = var_190_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_8 = arg_187_1:GetWordFromCfg(317032047)
				local var_190_9 = arg_187_1:FormatText(var_190_8.content)

				arg_187_1.text_.text = var_190_9

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_10 = 75
				local var_190_11 = utf8.len(var_190_9)
				local var_190_12 = var_190_10 <= 0 and var_190_6 or var_190_6 * (var_190_11 / var_190_10)

				if var_190_12 > 0 and var_190_6 < var_190_12 then
					arg_187_1.talkMaxDuration = var_190_12

					if var_190_12 + var_190_5 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_12 + var_190_5
					end
				end

				arg_187_1.text_.text = var_190_9
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032047", "story_v_out_317032.awb") ~= 0 then
					local var_190_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032047", "story_v_out_317032.awb") / 1000

					if var_190_13 + var_190_5 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_13 + var_190_5
					end

					if var_190_8.prefab_name ~= "" and arg_187_1.actors_[var_190_8.prefab_name] ~= nil then
						local var_190_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_8.prefab_name].transform, "story_v_out_317032", "317032047", "story_v_out_317032.awb")

						arg_187_1:RecordAudio("317032047", var_190_14)
						arg_187_1:RecordAudio("317032047", var_190_14)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_317032", "317032047", "story_v_out_317032.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_317032", "317032047", "story_v_out_317032.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_15 = math.max(var_190_6, arg_187_1.talkMaxDuration)

			if var_190_5 <= arg_187_1.time_ and arg_187_1.time_ < var_190_5 + var_190_15 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_5) / var_190_15

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_5 + var_190_15 and arg_187_1.time_ < var_190_5 + var_190_15 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play317032048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 317032048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play317032049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1015ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1015ui_story == nil then
				arg_191_1.var_.characterEffect1015ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1015ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1015ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1015ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1015ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.6

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

				local var_194_9 = arg_191_1:GetWordFromCfg(317032048)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 24
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
	Play317032049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 317032049
		arg_195_1.duration_ = 6.166

		local var_195_0 = {
			zh = 4.966,
			ja = 6.166
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
				arg_195_0:Play317032050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1015ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1015ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1015ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["1015ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect1015ui_story == nil then
				arg_195_1.var_.characterEffect1015ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.200000002980232

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect1015ui_story then
					local var_198_13 = Mathf.Lerp(0, 0.5, var_198_12)

					arg_195_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1015ui_story.fillRatio = var_198_13
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect1015ui_story then
				local var_198_14 = 0.5

				arg_195_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1015ui_story.fillRatio = var_198_14
			end

			local var_198_15 = arg_195_1.actors_["2078ui_story"].transform
			local var_198_16 = 0

			if var_198_16 < arg_195_1.time_ and arg_195_1.time_ <= var_198_16 + arg_198_0 then
				arg_195_1.var_.moveOldPos2078ui_story = var_198_15.localPosition
			end

			local var_198_17 = 0.001

			if var_198_16 <= arg_195_1.time_ and arg_195_1.time_ < var_198_16 + var_198_17 then
				local var_198_18 = (arg_195_1.time_ - var_198_16) / var_198_17
				local var_198_19 = Vector3.New(0.7, -1.28, -5.6)

				var_198_15.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos2078ui_story, var_198_19, var_198_18)

				local var_198_20 = manager.ui.mainCamera.transform.position - var_198_15.position

				var_198_15.forward = Vector3.New(var_198_20.x, var_198_20.y, var_198_20.z)

				local var_198_21 = var_198_15.localEulerAngles

				var_198_21.z = 0
				var_198_21.x = 0
				var_198_15.localEulerAngles = var_198_21
			end

			if arg_195_1.time_ >= var_198_16 + var_198_17 and arg_195_1.time_ < var_198_16 + var_198_17 + arg_198_0 then
				var_198_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_198_22 = manager.ui.mainCamera.transform.position - var_198_15.position

				var_198_15.forward = Vector3.New(var_198_22.x, var_198_22.y, var_198_22.z)

				local var_198_23 = var_198_15.localEulerAngles

				var_198_23.z = 0
				var_198_23.x = 0
				var_198_15.localEulerAngles = var_198_23
			end

			local var_198_24 = arg_195_1.actors_["2078ui_story"]
			local var_198_25 = 0

			if var_198_25 < arg_195_1.time_ and arg_195_1.time_ <= var_198_25 + arg_198_0 and arg_195_1.var_.characterEffect2078ui_story == nil then
				arg_195_1.var_.characterEffect2078ui_story = var_198_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_26 = 0.200000002980232

			if var_198_25 <= arg_195_1.time_ and arg_195_1.time_ < var_198_25 + var_198_26 then
				local var_198_27 = (arg_195_1.time_ - var_198_25) / var_198_26

				if arg_195_1.var_.characterEffect2078ui_story then
					arg_195_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_25 + var_198_26 and arg_195_1.time_ < var_198_25 + var_198_26 + arg_198_0 and arg_195_1.var_.characterEffect2078ui_story then
				arg_195_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_198_28 = 0

			if var_198_28 < arg_195_1.time_ and arg_195_1.time_ <= var_198_28 + arg_198_0 then
				arg_195_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_198_29 = 0

			if var_198_29 < arg_195_1.time_ and arg_195_1.time_ <= var_198_29 + arg_198_0 then
				arg_195_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_198_30 = 0
			local var_198_31 = 0.6

			if var_198_30 < arg_195_1.time_ and arg_195_1.time_ <= var_198_30 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_32 = arg_195_1:FormatText(StoryNameCfg[528].name)

				arg_195_1.leftNameTxt_.text = var_198_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_33 = arg_195_1:GetWordFromCfg(317032049)
				local var_198_34 = arg_195_1:FormatText(var_198_33.content)

				arg_195_1.text_.text = var_198_34

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_35 = 24
				local var_198_36 = utf8.len(var_198_34)
				local var_198_37 = var_198_35 <= 0 and var_198_31 or var_198_31 * (var_198_36 / var_198_35)

				if var_198_37 > 0 and var_198_31 < var_198_37 then
					arg_195_1.talkMaxDuration = var_198_37

					if var_198_37 + var_198_30 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_37 + var_198_30
					end
				end

				arg_195_1.text_.text = var_198_34
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032049", "story_v_out_317032.awb") ~= 0 then
					local var_198_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032049", "story_v_out_317032.awb") / 1000

					if var_198_38 + var_198_30 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_38 + var_198_30
					end

					if var_198_33.prefab_name ~= "" and arg_195_1.actors_[var_198_33.prefab_name] ~= nil then
						local var_198_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_33.prefab_name].transform, "story_v_out_317032", "317032049", "story_v_out_317032.awb")

						arg_195_1:RecordAudio("317032049", var_198_39)
						arg_195_1:RecordAudio("317032049", var_198_39)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_317032", "317032049", "story_v_out_317032.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_317032", "317032049", "story_v_out_317032.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_40 = math.max(var_198_31, arg_195_1.talkMaxDuration)

			if var_198_30 <= arg_195_1.time_ and arg_195_1.time_ < var_198_30 + var_198_40 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_30) / var_198_40

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_30 + var_198_40 and arg_195_1.time_ < var_198_30 + var_198_40 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play317032050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 317032050
		arg_199_1.duration_ = 8.166

		local var_199_0 = {
			zh = 8.166,
			ja = 7.8
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
				arg_199_0:Play317032051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1015ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1015ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1015ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = arg_199_1.actors_["1015ui_story"]
			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 and arg_199_1.var_.characterEffect1015ui_story == nil then
				arg_199_1.var_.characterEffect1015ui_story = var_202_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_11 = 0.200000002980232

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_10) / var_202_11

				if arg_199_1.var_.characterEffect1015ui_story then
					arg_199_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_10 + var_202_11 and arg_199_1.time_ < var_202_10 + var_202_11 + arg_202_0 and arg_199_1.var_.characterEffect1015ui_story then
				arg_199_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_202_13 = 0

			if var_202_13 < arg_199_1.time_ and arg_199_1.time_ <= var_202_13 + arg_202_0 then
				arg_199_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action5_2")
			end

			local var_202_14 = 0

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 then
				arg_199_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_202_15 = arg_199_1.actors_["2078ui_story"].transform
			local var_202_16 = 0

			if var_202_16 < arg_199_1.time_ and arg_199_1.time_ <= var_202_16 + arg_202_0 then
				arg_199_1.var_.moveOldPos2078ui_story = var_202_15.localPosition
			end

			local var_202_17 = 0.001

			if var_202_16 <= arg_199_1.time_ and arg_199_1.time_ < var_202_16 + var_202_17 then
				local var_202_18 = (arg_199_1.time_ - var_202_16) / var_202_17
				local var_202_19 = Vector3.New(0.7, -1.28, -5.6)

				var_202_15.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos2078ui_story, var_202_19, var_202_18)

				local var_202_20 = manager.ui.mainCamera.transform.position - var_202_15.position

				var_202_15.forward = Vector3.New(var_202_20.x, var_202_20.y, var_202_20.z)

				local var_202_21 = var_202_15.localEulerAngles

				var_202_21.z = 0
				var_202_21.x = 0
				var_202_15.localEulerAngles = var_202_21
			end

			if arg_199_1.time_ >= var_202_16 + var_202_17 and arg_199_1.time_ < var_202_16 + var_202_17 + arg_202_0 then
				var_202_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_202_22 = manager.ui.mainCamera.transform.position - var_202_15.position

				var_202_15.forward = Vector3.New(var_202_22.x, var_202_22.y, var_202_22.z)

				local var_202_23 = var_202_15.localEulerAngles

				var_202_23.z = 0
				var_202_23.x = 0
				var_202_15.localEulerAngles = var_202_23
			end

			local var_202_24 = arg_199_1.actors_["2078ui_story"]
			local var_202_25 = 0

			if var_202_25 < arg_199_1.time_ and arg_199_1.time_ <= var_202_25 + arg_202_0 and arg_199_1.var_.characterEffect2078ui_story == nil then
				arg_199_1.var_.characterEffect2078ui_story = var_202_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_26 = 0.200000002980232

			if var_202_25 <= arg_199_1.time_ and arg_199_1.time_ < var_202_25 + var_202_26 then
				local var_202_27 = (arg_199_1.time_ - var_202_25) / var_202_26

				if arg_199_1.var_.characterEffect2078ui_story then
					local var_202_28 = Mathf.Lerp(0, 0.5, var_202_27)

					arg_199_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_199_1.var_.characterEffect2078ui_story.fillRatio = var_202_28
				end
			end

			if arg_199_1.time_ >= var_202_25 + var_202_26 and arg_199_1.time_ < var_202_25 + var_202_26 + arg_202_0 and arg_199_1.var_.characterEffect2078ui_story then
				local var_202_29 = 0.5

				arg_199_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_199_1.var_.characterEffect2078ui_story.fillRatio = var_202_29
			end

			local var_202_30 = 0
			local var_202_31 = 0.975

			if var_202_30 < arg_199_1.time_ and arg_199_1.time_ <= var_202_30 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_32 = arg_199_1:FormatText(StoryNameCfg[479].name)

				arg_199_1.leftNameTxt_.text = var_202_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_33 = arg_199_1:GetWordFromCfg(317032050)
				local var_202_34 = arg_199_1:FormatText(var_202_33.content)

				arg_199_1.text_.text = var_202_34

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_35 = 39
				local var_202_36 = utf8.len(var_202_34)
				local var_202_37 = var_202_35 <= 0 and var_202_31 or var_202_31 * (var_202_36 / var_202_35)

				if var_202_37 > 0 and var_202_31 < var_202_37 then
					arg_199_1.talkMaxDuration = var_202_37

					if var_202_37 + var_202_30 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_37 + var_202_30
					end
				end

				arg_199_1.text_.text = var_202_34
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032050", "story_v_out_317032.awb") ~= 0 then
					local var_202_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032050", "story_v_out_317032.awb") / 1000

					if var_202_38 + var_202_30 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_38 + var_202_30
					end

					if var_202_33.prefab_name ~= "" and arg_199_1.actors_[var_202_33.prefab_name] ~= nil then
						local var_202_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_33.prefab_name].transform, "story_v_out_317032", "317032050", "story_v_out_317032.awb")

						arg_199_1:RecordAudio("317032050", var_202_39)
						arg_199_1:RecordAudio("317032050", var_202_39)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_317032", "317032050", "story_v_out_317032.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_317032", "317032050", "story_v_out_317032.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_40 = math.max(var_202_31, arg_199_1.talkMaxDuration)

			if var_202_30 <= arg_199_1.time_ and arg_199_1.time_ < var_202_30 + var_202_40 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_30) / var_202_40

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_30 + var_202_40 and arg_199_1.time_ < var_202_30 + var_202_40 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play317032051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 317032051
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play317032052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1015ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1015ui_story == nil then
				arg_203_1.var_.characterEffect1015ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1015ui_story then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1015ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1015ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1015ui_story.fillRatio = var_206_5
			end

			local var_206_6 = 0
			local var_206_7 = 0.225

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

				local var_206_9 = arg_203_1:GetWordFromCfg(317032051)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 9
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
	Play317032052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 317032052
		arg_207_1.duration_ = 2.533

		local var_207_0 = {
			zh = 1.999999999999,
			ja = 2.533
		}
		local var_207_1 = manager.audio:GetLocalizationFlag()

		if var_207_0[var_207_1] ~= nil then
			arg_207_1.duration_ = var_207_0[var_207_1]
		end

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play317032053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1015ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1015ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1015ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["2078ui_story"].transform
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1.var_.moveOldPos2078ui_story = var_210_9.localPosition
			end

			local var_210_11 = 0.001

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11
				local var_210_13 = Vector3.New(0.7, -1.28, -5.6)

				var_210_9.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos2078ui_story, var_210_13, var_210_12)

				local var_210_14 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_14.x, var_210_14.y, var_210_14.z)

				local var_210_15 = var_210_9.localEulerAngles

				var_210_15.z = 0
				var_210_15.x = 0
				var_210_9.localEulerAngles = var_210_15
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 then
				var_210_9.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_210_16 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_16.x, var_210_16.y, var_210_16.z)

				local var_210_17 = var_210_9.localEulerAngles

				var_210_17.z = 0
				var_210_17.x = 0
				var_210_9.localEulerAngles = var_210_17
			end

			local var_210_18 = arg_207_1.actors_["2078ui_story"]
			local var_210_19 = 0

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 and arg_207_1.var_.characterEffect2078ui_story == nil then
				arg_207_1.var_.characterEffect2078ui_story = var_210_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_20 = 0.200000002980232

			if var_210_19 <= arg_207_1.time_ and arg_207_1.time_ < var_210_19 + var_210_20 then
				local var_210_21 = (arg_207_1.time_ - var_210_19) / var_210_20

				if arg_207_1.var_.characterEffect2078ui_story then
					arg_207_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_19 + var_210_20 and arg_207_1.time_ < var_210_19 + var_210_20 + arg_210_0 and arg_207_1.var_.characterEffect2078ui_story then
				arg_207_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_210_22 = 0

			if var_210_22 < arg_207_1.time_ and arg_207_1.time_ <= var_210_22 + arg_210_0 then
				arg_207_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_210_23 = 0

			if var_210_23 < arg_207_1.time_ and arg_207_1.time_ <= var_210_23 + arg_210_0 then
				arg_207_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_210_24 = 0
			local var_210_25 = 0.2

			if var_210_24 < arg_207_1.time_ and arg_207_1.time_ <= var_210_24 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_26 = arg_207_1:FormatText(StoryNameCfg[528].name)

				arg_207_1.leftNameTxt_.text = var_210_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_27 = arg_207_1:GetWordFromCfg(317032052)
				local var_210_28 = arg_207_1:FormatText(var_210_27.content)

				arg_207_1.text_.text = var_210_28

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_29 = 8
				local var_210_30 = utf8.len(var_210_28)
				local var_210_31 = var_210_29 <= 0 and var_210_25 or var_210_25 * (var_210_30 / var_210_29)

				if var_210_31 > 0 and var_210_25 < var_210_31 then
					arg_207_1.talkMaxDuration = var_210_31

					if var_210_31 + var_210_24 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_31 + var_210_24
					end
				end

				arg_207_1.text_.text = var_210_28
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032052", "story_v_out_317032.awb") ~= 0 then
					local var_210_32 = manager.audio:GetVoiceLength("story_v_out_317032", "317032052", "story_v_out_317032.awb") / 1000

					if var_210_32 + var_210_24 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_32 + var_210_24
					end

					if var_210_27.prefab_name ~= "" and arg_207_1.actors_[var_210_27.prefab_name] ~= nil then
						local var_210_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_27.prefab_name].transform, "story_v_out_317032", "317032052", "story_v_out_317032.awb")

						arg_207_1:RecordAudio("317032052", var_210_33)
						arg_207_1:RecordAudio("317032052", var_210_33)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_317032", "317032052", "story_v_out_317032.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_317032", "317032052", "story_v_out_317032.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_34 = math.max(var_210_25, arg_207_1.talkMaxDuration)

			if var_210_24 <= arg_207_1.time_ and arg_207_1.time_ < var_210_24 + var_210_34 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_24) / var_210_34

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_24 + var_210_34 and arg_207_1.time_ < var_210_24 + var_210_34 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play317032053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 317032053
		arg_211_1.duration_ = 6.233

		local var_211_0 = {
			zh = 6.066,
			ja = 6.233
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
				arg_211_0:Play317032054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1015ui_story"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1015ui_story = var_214_0.localPosition
			end

			local var_214_2 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2
				local var_214_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1015ui_story, var_214_4, var_214_3)

				local var_214_5 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_5.x, var_214_5.y, var_214_5.z)

				local var_214_6 = var_214_0.localEulerAngles

				var_214_6.z = 0
				var_214_6.x = 0
				var_214_0.localEulerAngles = var_214_6
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_214_7 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_7.x, var_214_7.y, var_214_7.z)

				local var_214_8 = var_214_0.localEulerAngles

				var_214_8.z = 0
				var_214_8.x = 0
				var_214_0.localEulerAngles = var_214_8
			end

			local var_214_9 = arg_211_1.actors_["1015ui_story"]
			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 and arg_211_1.var_.characterEffect1015ui_story == nil then
				arg_211_1.var_.characterEffect1015ui_story = var_214_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_11 = 0.200000002980232

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_11 then
				local var_214_12 = (arg_211_1.time_ - var_214_10) / var_214_11

				if arg_211_1.var_.characterEffect1015ui_story then
					arg_211_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_10 + var_214_11 and arg_211_1.time_ < var_214_10 + var_214_11 + arg_214_0 and arg_211_1.var_.characterEffect1015ui_story then
				arg_211_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_214_13 = 0

			if var_214_13 < arg_211_1.time_ and arg_211_1.time_ <= var_214_13 + arg_214_0 then
				arg_211_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				arg_211_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_214_15 = arg_211_1.actors_["2078ui_story"].transform
			local var_214_16 = 0

			if var_214_16 < arg_211_1.time_ and arg_211_1.time_ <= var_214_16 + arg_214_0 then
				arg_211_1.var_.moveOldPos2078ui_story = var_214_15.localPosition
			end

			local var_214_17 = 0.001

			if var_214_16 <= arg_211_1.time_ and arg_211_1.time_ < var_214_16 + var_214_17 then
				local var_214_18 = (arg_211_1.time_ - var_214_16) / var_214_17
				local var_214_19 = Vector3.New(0.7, -1.28, -5.6)

				var_214_15.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos2078ui_story, var_214_19, var_214_18)

				local var_214_20 = manager.ui.mainCamera.transform.position - var_214_15.position

				var_214_15.forward = Vector3.New(var_214_20.x, var_214_20.y, var_214_20.z)

				local var_214_21 = var_214_15.localEulerAngles

				var_214_21.z = 0
				var_214_21.x = 0
				var_214_15.localEulerAngles = var_214_21
			end

			if arg_211_1.time_ >= var_214_16 + var_214_17 and arg_211_1.time_ < var_214_16 + var_214_17 + arg_214_0 then
				var_214_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_214_22 = manager.ui.mainCamera.transform.position - var_214_15.position

				var_214_15.forward = Vector3.New(var_214_22.x, var_214_22.y, var_214_22.z)

				local var_214_23 = var_214_15.localEulerAngles

				var_214_23.z = 0
				var_214_23.x = 0
				var_214_15.localEulerAngles = var_214_23
			end

			local var_214_24 = arg_211_1.actors_["2078ui_story"]
			local var_214_25 = 0

			if var_214_25 < arg_211_1.time_ and arg_211_1.time_ <= var_214_25 + arg_214_0 and arg_211_1.var_.characterEffect2078ui_story == nil then
				arg_211_1.var_.characterEffect2078ui_story = var_214_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_26 = 0.200000002980232

			if var_214_25 <= arg_211_1.time_ and arg_211_1.time_ < var_214_25 + var_214_26 then
				local var_214_27 = (arg_211_1.time_ - var_214_25) / var_214_26

				if arg_211_1.var_.characterEffect2078ui_story then
					local var_214_28 = Mathf.Lerp(0, 0.5, var_214_27)

					arg_211_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_211_1.var_.characterEffect2078ui_story.fillRatio = var_214_28
				end
			end

			if arg_211_1.time_ >= var_214_25 + var_214_26 and arg_211_1.time_ < var_214_25 + var_214_26 + arg_214_0 and arg_211_1.var_.characterEffect2078ui_story then
				local var_214_29 = 0.5

				arg_211_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_211_1.var_.characterEffect2078ui_story.fillRatio = var_214_29
			end

			local var_214_30 = 0
			local var_214_31 = 0.7

			if var_214_30 < arg_211_1.time_ and arg_211_1.time_ <= var_214_30 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_32 = arg_211_1:FormatText(StoryNameCfg[479].name)

				arg_211_1.leftNameTxt_.text = var_214_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_33 = arg_211_1:GetWordFromCfg(317032053)
				local var_214_34 = arg_211_1:FormatText(var_214_33.content)

				arg_211_1.text_.text = var_214_34

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_35 = 28
				local var_214_36 = utf8.len(var_214_34)
				local var_214_37 = var_214_35 <= 0 and var_214_31 or var_214_31 * (var_214_36 / var_214_35)

				if var_214_37 > 0 and var_214_31 < var_214_37 then
					arg_211_1.talkMaxDuration = var_214_37

					if var_214_37 + var_214_30 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_37 + var_214_30
					end
				end

				arg_211_1.text_.text = var_214_34
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032053", "story_v_out_317032.awb") ~= 0 then
					local var_214_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032053", "story_v_out_317032.awb") / 1000

					if var_214_38 + var_214_30 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_38 + var_214_30
					end

					if var_214_33.prefab_name ~= "" and arg_211_1.actors_[var_214_33.prefab_name] ~= nil then
						local var_214_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_33.prefab_name].transform, "story_v_out_317032", "317032053", "story_v_out_317032.awb")

						arg_211_1:RecordAudio("317032053", var_214_39)
						arg_211_1:RecordAudio("317032053", var_214_39)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_317032", "317032053", "story_v_out_317032.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_317032", "317032053", "story_v_out_317032.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_40 = math.max(var_214_31, arg_211_1.talkMaxDuration)

			if var_214_30 <= arg_211_1.time_ and arg_211_1.time_ < var_214_30 + var_214_40 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_30) / var_214_40

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_30 + var_214_40 and arg_211_1.time_ < var_214_30 + var_214_40 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play317032054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 317032054
		arg_215_1.duration_ = 5.433

		local var_215_0 = {
			zh = 5.433,
			ja = 4.366
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
				arg_215_0:Play317032055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1015ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1015ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1015ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = arg_215_1.actors_["1015ui_story"]
			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 and arg_215_1.var_.characterEffect1015ui_story == nil then
				arg_215_1.var_.characterEffect1015ui_story = var_218_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_11 = 0.200000002980232

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_11 then
				local var_218_12 = (arg_215_1.time_ - var_218_10) / var_218_11

				if arg_215_1.var_.characterEffect1015ui_story then
					local var_218_13 = Mathf.Lerp(0, 0.5, var_218_12)

					arg_215_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1015ui_story.fillRatio = var_218_13
				end
			end

			if arg_215_1.time_ >= var_218_10 + var_218_11 and arg_215_1.time_ < var_218_10 + var_218_11 + arg_218_0 and arg_215_1.var_.characterEffect1015ui_story then
				local var_218_14 = 0.5

				arg_215_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1015ui_story.fillRatio = var_218_14
			end

			local var_218_15 = arg_215_1.actors_["2078ui_story"].transform
			local var_218_16 = 0

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 then
				arg_215_1.var_.moveOldPos2078ui_story = var_218_15.localPosition
			end

			local var_218_17 = 0.001

			if var_218_16 <= arg_215_1.time_ and arg_215_1.time_ < var_218_16 + var_218_17 then
				local var_218_18 = (arg_215_1.time_ - var_218_16) / var_218_17
				local var_218_19 = Vector3.New(0.7, -1.28, -5.6)

				var_218_15.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos2078ui_story, var_218_19, var_218_18)

				local var_218_20 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_20.x, var_218_20.y, var_218_20.z)

				local var_218_21 = var_218_15.localEulerAngles

				var_218_21.z = 0
				var_218_21.x = 0
				var_218_15.localEulerAngles = var_218_21
			end

			if arg_215_1.time_ >= var_218_16 + var_218_17 and arg_215_1.time_ < var_218_16 + var_218_17 + arg_218_0 then
				var_218_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_218_22 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_22.x, var_218_22.y, var_218_22.z)

				local var_218_23 = var_218_15.localEulerAngles

				var_218_23.z = 0
				var_218_23.x = 0
				var_218_15.localEulerAngles = var_218_23
			end

			local var_218_24 = arg_215_1.actors_["2078ui_story"]
			local var_218_25 = 0

			if var_218_25 < arg_215_1.time_ and arg_215_1.time_ <= var_218_25 + arg_218_0 and arg_215_1.var_.characterEffect2078ui_story == nil then
				arg_215_1.var_.characterEffect2078ui_story = var_218_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_26 = 0.200000002980232

			if var_218_25 <= arg_215_1.time_ and arg_215_1.time_ < var_218_25 + var_218_26 then
				local var_218_27 = (arg_215_1.time_ - var_218_25) / var_218_26

				if arg_215_1.var_.characterEffect2078ui_story then
					arg_215_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_25 + var_218_26 and arg_215_1.time_ < var_218_25 + var_218_26 + arg_218_0 and arg_215_1.var_.characterEffect2078ui_story then
				arg_215_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_218_28 = 0

			if var_218_28 < arg_215_1.time_ and arg_215_1.time_ <= var_218_28 + arg_218_0 then
				arg_215_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_218_29 = 0

			if var_218_29 < arg_215_1.time_ and arg_215_1.time_ <= var_218_29 + arg_218_0 then
				arg_215_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_218_30 = 0
			local var_218_31 = 0.55

			if var_218_30 < arg_215_1.time_ and arg_215_1.time_ <= var_218_30 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_32 = arg_215_1:FormatText(StoryNameCfg[528].name)

				arg_215_1.leftNameTxt_.text = var_218_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_33 = arg_215_1:GetWordFromCfg(317032054)
				local var_218_34 = arg_215_1:FormatText(var_218_33.content)

				arg_215_1.text_.text = var_218_34

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_35 = 22
				local var_218_36 = utf8.len(var_218_34)
				local var_218_37 = var_218_35 <= 0 and var_218_31 or var_218_31 * (var_218_36 / var_218_35)

				if var_218_37 > 0 and var_218_31 < var_218_37 then
					arg_215_1.talkMaxDuration = var_218_37

					if var_218_37 + var_218_30 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_37 + var_218_30
					end
				end

				arg_215_1.text_.text = var_218_34
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032054", "story_v_out_317032.awb") ~= 0 then
					local var_218_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032054", "story_v_out_317032.awb") / 1000

					if var_218_38 + var_218_30 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_38 + var_218_30
					end

					if var_218_33.prefab_name ~= "" and arg_215_1.actors_[var_218_33.prefab_name] ~= nil then
						local var_218_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_33.prefab_name].transform, "story_v_out_317032", "317032054", "story_v_out_317032.awb")

						arg_215_1:RecordAudio("317032054", var_218_39)
						arg_215_1:RecordAudio("317032054", var_218_39)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_317032", "317032054", "story_v_out_317032.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_317032", "317032054", "story_v_out_317032.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_40 = math.max(var_218_31, arg_215_1.talkMaxDuration)

			if var_218_30 <= arg_215_1.time_ and arg_215_1.time_ < var_218_30 + var_218_40 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_30) / var_218_40

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_30 + var_218_40 and arg_215_1.time_ < var_218_30 + var_218_40 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play317032055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 317032055
		arg_219_1.duration_ = 1.666

		local var_219_0 = {
			zh = 1.3,
			ja = 1.666
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
				arg_219_0:Play317032056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1015ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1015ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1015ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["1015ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect1015ui_story == nil then
				arg_219_1.var_.characterEffect1015ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect1015ui_story then
					local var_222_13 = Mathf.Lerp(0, 0.5, var_222_12)

					arg_219_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1015ui_story.fillRatio = var_222_13
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and arg_219_1.var_.characterEffect1015ui_story then
				local var_222_14 = 0.5

				arg_219_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1015ui_story.fillRatio = var_222_14
			end

			local var_222_15 = arg_219_1.actors_["2078ui_story"].transform
			local var_222_16 = 0

			if var_222_16 < arg_219_1.time_ and arg_219_1.time_ <= var_222_16 + arg_222_0 then
				arg_219_1.var_.moveOldPos2078ui_story = var_222_15.localPosition
			end

			local var_222_17 = 0.001

			if var_222_16 <= arg_219_1.time_ and arg_219_1.time_ < var_222_16 + var_222_17 then
				local var_222_18 = (arg_219_1.time_ - var_222_16) / var_222_17
				local var_222_19 = Vector3.New(0.7, -1.28, -5.6)

				var_222_15.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos2078ui_story, var_222_19, var_222_18)

				local var_222_20 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_20.x, var_222_20.y, var_222_20.z)

				local var_222_21 = var_222_15.localEulerAngles

				var_222_21.z = 0
				var_222_21.x = 0
				var_222_15.localEulerAngles = var_222_21
			end

			if arg_219_1.time_ >= var_222_16 + var_222_17 and arg_219_1.time_ < var_222_16 + var_222_17 + arg_222_0 then
				var_222_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_222_22 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_22.x, var_222_22.y, var_222_22.z)

				local var_222_23 = var_222_15.localEulerAngles

				var_222_23.z = 0
				var_222_23.x = 0
				var_222_15.localEulerAngles = var_222_23
			end

			local var_222_24 = arg_219_1.actors_["2078ui_story"]
			local var_222_25 = 0

			if var_222_25 < arg_219_1.time_ and arg_219_1.time_ <= var_222_25 + arg_222_0 and arg_219_1.var_.characterEffect2078ui_story == nil then
				arg_219_1.var_.characterEffect2078ui_story = var_222_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_26 = 0.200000002980232

			if var_222_25 <= arg_219_1.time_ and arg_219_1.time_ < var_222_25 + var_222_26 then
				local var_222_27 = (arg_219_1.time_ - var_222_25) / var_222_26

				if arg_219_1.var_.characterEffect2078ui_story then
					arg_219_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_25 + var_222_26 and arg_219_1.time_ < var_222_25 + var_222_26 + arg_222_0 and arg_219_1.var_.characterEffect2078ui_story then
				arg_219_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_222_28 = 0

			if var_222_28 < arg_219_1.time_ and arg_219_1.time_ <= var_222_28 + arg_222_0 then
				arg_219_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_222_29 = 0

			if var_222_29 < arg_219_1.time_ and arg_219_1.time_ <= var_222_29 + arg_222_0 then
				arg_219_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_222_30 = 0
			local var_222_31 = 0.1

			if var_222_30 < arg_219_1.time_ and arg_219_1.time_ <= var_222_30 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_32 = arg_219_1:FormatText(StoryNameCfg[530].name)

				arg_219_1.leftNameTxt_.text = var_222_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_33 = arg_219_1:GetWordFromCfg(317032055)
				local var_222_34 = arg_219_1:FormatText(var_222_33.content)

				arg_219_1.text_.text = var_222_34

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_35 = 4
				local var_222_36 = utf8.len(var_222_34)
				local var_222_37 = var_222_35 <= 0 and var_222_31 or var_222_31 * (var_222_36 / var_222_35)

				if var_222_37 > 0 and var_222_31 < var_222_37 then
					arg_219_1.talkMaxDuration = var_222_37

					if var_222_37 + var_222_30 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_37 + var_222_30
					end
				end

				arg_219_1.text_.text = var_222_34
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032055", "story_v_out_317032.awb") ~= 0 then
					local var_222_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032055", "story_v_out_317032.awb") / 1000

					if var_222_38 + var_222_30 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_38 + var_222_30
					end

					if var_222_33.prefab_name ~= "" and arg_219_1.actors_[var_222_33.prefab_name] ~= nil then
						local var_222_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_33.prefab_name].transform, "story_v_out_317032", "317032055", "story_v_out_317032.awb")

						arg_219_1:RecordAudio("317032055", var_222_39)
						arg_219_1:RecordAudio("317032055", var_222_39)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_317032", "317032055", "story_v_out_317032.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_317032", "317032055", "story_v_out_317032.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_40 = math.max(var_222_31, arg_219_1.talkMaxDuration)

			if var_222_30 <= arg_219_1.time_ and arg_219_1.time_ < var_222_30 + var_222_40 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_30) / var_222_40

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_30 + var_222_40 and arg_219_1.time_ < var_222_30 + var_222_40 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play317032056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 317032056
		arg_223_1.duration_ = 12.8

		local var_223_0 = {
			zh = 8.466,
			ja = 12.8
		}
		local var_223_1 = manager.audio:GetLocalizationFlag()

		if var_223_0[var_223_1] ~= nil then
			arg_223_1.duration_ = var_223_0[var_223_1]
		end

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play317032057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1015ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1015ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0, 100, 0)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1015ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, 100, 0)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = arg_223_1.actors_["1015ui_story"]
			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 and arg_223_1.var_.characterEffect1015ui_story == nil then
				arg_223_1.var_.characterEffect1015ui_story = var_226_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_11 = 0.200000002980232

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_10) / var_226_11

				if arg_223_1.var_.characterEffect1015ui_story then
					local var_226_13 = Mathf.Lerp(0, 0.5, var_226_12)

					arg_223_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1015ui_story.fillRatio = var_226_13
				end
			end

			if arg_223_1.time_ >= var_226_10 + var_226_11 and arg_223_1.time_ < var_226_10 + var_226_11 + arg_226_0 and arg_223_1.var_.characterEffect1015ui_story then
				local var_226_14 = 0.5

				arg_223_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1015ui_story.fillRatio = var_226_14
			end

			local var_226_15 = arg_223_1.actors_["2078ui_story"].transform
			local var_226_16 = 0

			if var_226_16 < arg_223_1.time_ and arg_223_1.time_ <= var_226_16 + arg_226_0 then
				arg_223_1.var_.moveOldPos2078ui_story = var_226_15.localPosition
			end

			local var_226_17 = 0.001

			if var_226_16 <= arg_223_1.time_ and arg_223_1.time_ < var_226_16 + var_226_17 then
				local var_226_18 = (arg_223_1.time_ - var_226_16) / var_226_17
				local var_226_19 = Vector3.New(0, 100, 0)

				var_226_15.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos2078ui_story, var_226_19, var_226_18)

				local var_226_20 = manager.ui.mainCamera.transform.position - var_226_15.position

				var_226_15.forward = Vector3.New(var_226_20.x, var_226_20.y, var_226_20.z)

				local var_226_21 = var_226_15.localEulerAngles

				var_226_21.z = 0
				var_226_21.x = 0
				var_226_15.localEulerAngles = var_226_21
			end

			if arg_223_1.time_ >= var_226_16 + var_226_17 and arg_223_1.time_ < var_226_16 + var_226_17 + arg_226_0 then
				var_226_15.localPosition = Vector3.New(0, 100, 0)

				local var_226_22 = manager.ui.mainCamera.transform.position - var_226_15.position

				var_226_15.forward = Vector3.New(var_226_22.x, var_226_22.y, var_226_22.z)

				local var_226_23 = var_226_15.localEulerAngles

				var_226_23.z = 0
				var_226_23.x = 0
				var_226_15.localEulerAngles = var_226_23
			end

			local var_226_24 = arg_223_1.actors_["2078ui_story"]
			local var_226_25 = 0

			if var_226_25 < arg_223_1.time_ and arg_223_1.time_ <= var_226_25 + arg_226_0 and arg_223_1.var_.characterEffect2078ui_story == nil then
				arg_223_1.var_.characterEffect2078ui_story = var_226_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_26 = 0.200000002980232

			if var_226_25 <= arg_223_1.time_ and arg_223_1.time_ < var_226_25 + var_226_26 then
				local var_226_27 = (arg_223_1.time_ - var_226_25) / var_226_26

				if arg_223_1.var_.characterEffect2078ui_story then
					local var_226_28 = Mathf.Lerp(0, 0.5, var_226_27)

					arg_223_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_223_1.var_.characterEffect2078ui_story.fillRatio = var_226_28
				end
			end

			if arg_223_1.time_ >= var_226_25 + var_226_26 and arg_223_1.time_ < var_226_25 + var_226_26 + arg_226_0 and arg_223_1.var_.characterEffect2078ui_story then
				local var_226_29 = 0.5

				arg_223_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_223_1.var_.characterEffect2078ui_story.fillRatio = var_226_29
			end

			local var_226_30 = arg_223_1.actors_["2079ui_story"].transform
			local var_226_31 = 0

			if var_226_31 < arg_223_1.time_ and arg_223_1.time_ <= var_226_31 + arg_226_0 then
				arg_223_1.var_.moveOldPos2079ui_story = var_226_30.localPosition
			end

			local var_226_32 = 0.001

			if var_226_31 <= arg_223_1.time_ and arg_223_1.time_ < var_226_31 + var_226_32 then
				local var_226_33 = (arg_223_1.time_ - var_226_31) / var_226_32
				local var_226_34 = Vector3.New(0, -1.28, -5.6)

				var_226_30.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos2079ui_story, var_226_34, var_226_33)

				local var_226_35 = manager.ui.mainCamera.transform.position - var_226_30.position

				var_226_30.forward = Vector3.New(var_226_35.x, var_226_35.y, var_226_35.z)

				local var_226_36 = var_226_30.localEulerAngles

				var_226_36.z = 0
				var_226_36.x = 0
				var_226_30.localEulerAngles = var_226_36
			end

			if arg_223_1.time_ >= var_226_31 + var_226_32 and arg_223_1.time_ < var_226_31 + var_226_32 + arg_226_0 then
				var_226_30.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_226_37 = manager.ui.mainCamera.transform.position - var_226_30.position

				var_226_30.forward = Vector3.New(var_226_37.x, var_226_37.y, var_226_37.z)

				local var_226_38 = var_226_30.localEulerAngles

				var_226_38.z = 0
				var_226_38.x = 0
				var_226_30.localEulerAngles = var_226_38
			end

			local var_226_39 = arg_223_1.actors_["2079ui_story"]
			local var_226_40 = 0

			if var_226_40 < arg_223_1.time_ and arg_223_1.time_ <= var_226_40 + arg_226_0 and arg_223_1.var_.characterEffect2079ui_story == nil then
				arg_223_1.var_.characterEffect2079ui_story = var_226_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_41 = 0.200000002980232

			if var_226_40 <= arg_223_1.time_ and arg_223_1.time_ < var_226_40 + var_226_41 then
				local var_226_42 = (arg_223_1.time_ - var_226_40) / var_226_41

				if arg_223_1.var_.characterEffect2079ui_story then
					arg_223_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_40 + var_226_41 and arg_223_1.time_ < var_226_40 + var_226_41 + arg_226_0 and arg_223_1.var_.characterEffect2079ui_story then
				arg_223_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_226_43 = 0

			if var_226_43 < arg_223_1.time_ and arg_223_1.time_ <= var_226_43 + arg_226_0 then
				arg_223_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_226_44 = 0

			if var_226_44 < arg_223_1.time_ and arg_223_1.time_ <= var_226_44 + arg_226_0 then
				arg_223_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_226_45 = 0
			local var_226_46 = 1.275

			if var_226_45 < arg_223_1.time_ and arg_223_1.time_ <= var_226_45 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_47 = arg_223_1:FormatText(StoryNameCfg[529].name)

				arg_223_1.leftNameTxt_.text = var_226_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_48 = arg_223_1:GetWordFromCfg(317032056)
				local var_226_49 = arg_223_1:FormatText(var_226_48.content)

				arg_223_1.text_.text = var_226_49

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_50 = 51
				local var_226_51 = utf8.len(var_226_49)
				local var_226_52 = var_226_50 <= 0 and var_226_46 or var_226_46 * (var_226_51 / var_226_50)

				if var_226_52 > 0 and var_226_46 < var_226_52 then
					arg_223_1.talkMaxDuration = var_226_52

					if var_226_52 + var_226_45 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_52 + var_226_45
					end
				end

				arg_223_1.text_.text = var_226_49
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032056", "story_v_out_317032.awb") ~= 0 then
					local var_226_53 = manager.audio:GetVoiceLength("story_v_out_317032", "317032056", "story_v_out_317032.awb") / 1000

					if var_226_53 + var_226_45 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_53 + var_226_45
					end

					if var_226_48.prefab_name ~= "" and arg_223_1.actors_[var_226_48.prefab_name] ~= nil then
						local var_226_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_48.prefab_name].transform, "story_v_out_317032", "317032056", "story_v_out_317032.awb")

						arg_223_1:RecordAudio("317032056", var_226_54)
						arg_223_1:RecordAudio("317032056", var_226_54)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_317032", "317032056", "story_v_out_317032.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_317032", "317032056", "story_v_out_317032.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_55 = math.max(var_226_46, arg_223_1.talkMaxDuration)

			if var_226_45 <= arg_223_1.time_ and arg_223_1.time_ < var_226_45 + var_226_55 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_45) / var_226_55

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_45 + var_226_55 and arg_223_1.time_ < var_226_45 + var_226_55 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play317032057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 317032057
		arg_227_1.duration_ = 13.833

		local var_227_0 = {
			zh = 13.833,
			ja = 11.6
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
				arg_227_0:Play317032058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1015ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1015ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1015ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["1015ui_story"]
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 and arg_227_1.var_.characterEffect1015ui_story == nil then
				arg_227_1.var_.characterEffect1015ui_story = var_230_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_11 = 0.200000002980232

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11

				if arg_227_1.var_.characterEffect1015ui_story then
					local var_230_13 = Mathf.Lerp(0, 0.5, var_230_12)

					arg_227_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1015ui_story.fillRatio = var_230_13
				end
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 and arg_227_1.var_.characterEffect1015ui_story then
				local var_230_14 = 0.5

				arg_227_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1015ui_story.fillRatio = var_230_14
			end

			local var_230_15 = arg_227_1.actors_["2078ui_story"].transform
			local var_230_16 = 0

			if var_230_16 < arg_227_1.time_ and arg_227_1.time_ <= var_230_16 + arg_230_0 then
				arg_227_1.var_.moveOldPos2078ui_story = var_230_15.localPosition
			end

			local var_230_17 = 0.001

			if var_230_16 <= arg_227_1.time_ and arg_227_1.time_ < var_230_16 + var_230_17 then
				local var_230_18 = (arg_227_1.time_ - var_230_16) / var_230_17
				local var_230_19 = Vector3.New(0.7, -1.28, -5.6)

				var_230_15.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos2078ui_story, var_230_19, var_230_18)

				local var_230_20 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_20.x, var_230_20.y, var_230_20.z)

				local var_230_21 = var_230_15.localEulerAngles

				var_230_21.z = 0
				var_230_21.x = 0
				var_230_15.localEulerAngles = var_230_21
			end

			if arg_227_1.time_ >= var_230_16 + var_230_17 and arg_227_1.time_ < var_230_16 + var_230_17 + arg_230_0 then
				var_230_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_230_22 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_22.x, var_230_22.y, var_230_22.z)

				local var_230_23 = var_230_15.localEulerAngles

				var_230_23.z = 0
				var_230_23.x = 0
				var_230_15.localEulerAngles = var_230_23
			end

			local var_230_24 = arg_227_1.actors_["2078ui_story"]
			local var_230_25 = 0

			if var_230_25 < arg_227_1.time_ and arg_227_1.time_ <= var_230_25 + arg_230_0 and arg_227_1.var_.characterEffect2078ui_story == nil then
				arg_227_1.var_.characterEffect2078ui_story = var_230_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_26 = 0.200000002980232

			if var_230_25 <= arg_227_1.time_ and arg_227_1.time_ < var_230_25 + var_230_26 then
				local var_230_27 = (arg_227_1.time_ - var_230_25) / var_230_26

				if arg_227_1.var_.characterEffect2078ui_story then
					arg_227_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_25 + var_230_26 and arg_227_1.time_ < var_230_25 + var_230_26 + arg_230_0 and arg_227_1.var_.characterEffect2078ui_story then
				arg_227_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_230_28 = 0

			if var_230_28 < arg_227_1.time_ and arg_227_1.time_ <= var_230_28 + arg_230_0 then
				arg_227_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_230_29 = 0

			if var_230_29 < arg_227_1.time_ and arg_227_1.time_ <= var_230_29 + arg_230_0 then
				arg_227_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_230_30 = arg_227_1.actors_["2079ui_story"].transform
			local var_230_31 = 0

			if var_230_31 < arg_227_1.time_ and arg_227_1.time_ <= var_230_31 + arg_230_0 then
				arg_227_1.var_.moveOldPos2079ui_story = var_230_30.localPosition
			end

			local var_230_32 = 0.001

			if var_230_31 <= arg_227_1.time_ and arg_227_1.time_ < var_230_31 + var_230_32 then
				local var_230_33 = (arg_227_1.time_ - var_230_31) / var_230_32
				local var_230_34 = Vector3.New(0, 100, 0)

				var_230_30.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos2079ui_story, var_230_34, var_230_33)

				local var_230_35 = manager.ui.mainCamera.transform.position - var_230_30.position

				var_230_30.forward = Vector3.New(var_230_35.x, var_230_35.y, var_230_35.z)

				local var_230_36 = var_230_30.localEulerAngles

				var_230_36.z = 0
				var_230_36.x = 0
				var_230_30.localEulerAngles = var_230_36
			end

			if arg_227_1.time_ >= var_230_31 + var_230_32 and arg_227_1.time_ < var_230_31 + var_230_32 + arg_230_0 then
				var_230_30.localPosition = Vector3.New(0, 100, 0)

				local var_230_37 = manager.ui.mainCamera.transform.position - var_230_30.position

				var_230_30.forward = Vector3.New(var_230_37.x, var_230_37.y, var_230_37.z)

				local var_230_38 = var_230_30.localEulerAngles

				var_230_38.z = 0
				var_230_38.x = 0
				var_230_30.localEulerAngles = var_230_38
			end

			local var_230_39 = arg_227_1.actors_["2079ui_story"]
			local var_230_40 = 0

			if var_230_40 < arg_227_1.time_ and arg_227_1.time_ <= var_230_40 + arg_230_0 and arg_227_1.var_.characterEffect2079ui_story == nil then
				arg_227_1.var_.characterEffect2079ui_story = var_230_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_41 = 0.200000002980232

			if var_230_40 <= arg_227_1.time_ and arg_227_1.time_ < var_230_40 + var_230_41 then
				local var_230_42 = (arg_227_1.time_ - var_230_40) / var_230_41

				if arg_227_1.var_.characterEffect2079ui_story then
					local var_230_43 = Mathf.Lerp(0, 0.5, var_230_42)

					arg_227_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_227_1.var_.characterEffect2079ui_story.fillRatio = var_230_43
				end
			end

			if arg_227_1.time_ >= var_230_40 + var_230_41 and arg_227_1.time_ < var_230_40 + var_230_41 + arg_230_0 and arg_227_1.var_.characterEffect2079ui_story then
				local var_230_44 = 0.5

				arg_227_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_227_1.var_.characterEffect2079ui_story.fillRatio = var_230_44
			end

			local var_230_45 = 0
			local var_230_46 = 1.775

			if var_230_45 < arg_227_1.time_ and arg_227_1.time_ <= var_230_45 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_47 = arg_227_1:FormatText(StoryNameCfg[528].name)

				arg_227_1.leftNameTxt_.text = var_230_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_48 = arg_227_1:GetWordFromCfg(317032057)
				local var_230_49 = arg_227_1:FormatText(var_230_48.content)

				arg_227_1.text_.text = var_230_49

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_50 = 67
				local var_230_51 = utf8.len(var_230_49)
				local var_230_52 = var_230_50 <= 0 and var_230_46 or var_230_46 * (var_230_51 / var_230_50)

				if var_230_52 > 0 and var_230_46 < var_230_52 then
					arg_227_1.talkMaxDuration = var_230_52

					if var_230_52 + var_230_45 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_52 + var_230_45
					end
				end

				arg_227_1.text_.text = var_230_49
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032057", "story_v_out_317032.awb") ~= 0 then
					local var_230_53 = manager.audio:GetVoiceLength("story_v_out_317032", "317032057", "story_v_out_317032.awb") / 1000

					if var_230_53 + var_230_45 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_53 + var_230_45
					end

					if var_230_48.prefab_name ~= "" and arg_227_1.actors_[var_230_48.prefab_name] ~= nil then
						local var_230_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_48.prefab_name].transform, "story_v_out_317032", "317032057", "story_v_out_317032.awb")

						arg_227_1:RecordAudio("317032057", var_230_54)
						arg_227_1:RecordAudio("317032057", var_230_54)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_317032", "317032057", "story_v_out_317032.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_317032", "317032057", "story_v_out_317032.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_55 = math.max(var_230_46, arg_227_1.talkMaxDuration)

			if var_230_45 <= arg_227_1.time_ and arg_227_1.time_ < var_230_45 + var_230_55 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_45) / var_230_55

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_45 + var_230_55 and arg_227_1.time_ < var_230_45 + var_230_55 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play317032058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 317032058
		arg_231_1.duration_ = 5.4

		local var_231_0 = {
			zh = 4.6,
			ja = 5.4
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
				arg_231_0:Play317032059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1015ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1015ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1015ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1015ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1015ui_story == nil then
				arg_231_1.var_.characterEffect1015ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1015ui_story then
					arg_231_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1015ui_story then
				arg_231_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_234_13 = 0

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_234_15 = arg_231_1.actors_["2078ui_story"].transform
			local var_234_16 = 0

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 then
				arg_231_1.var_.moveOldPos2078ui_story = var_234_15.localPosition
			end

			local var_234_17 = 0.001

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_17 then
				local var_234_18 = (arg_231_1.time_ - var_234_16) / var_234_17
				local var_234_19 = Vector3.New(0.7, -1.28, -5.6)

				var_234_15.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos2078ui_story, var_234_19, var_234_18)

				local var_234_20 = manager.ui.mainCamera.transform.position - var_234_15.position

				var_234_15.forward = Vector3.New(var_234_20.x, var_234_20.y, var_234_20.z)

				local var_234_21 = var_234_15.localEulerAngles

				var_234_21.z = 0
				var_234_21.x = 0
				var_234_15.localEulerAngles = var_234_21
			end

			if arg_231_1.time_ >= var_234_16 + var_234_17 and arg_231_1.time_ < var_234_16 + var_234_17 + arg_234_0 then
				var_234_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_234_22 = manager.ui.mainCamera.transform.position - var_234_15.position

				var_234_15.forward = Vector3.New(var_234_22.x, var_234_22.y, var_234_22.z)

				local var_234_23 = var_234_15.localEulerAngles

				var_234_23.z = 0
				var_234_23.x = 0
				var_234_15.localEulerAngles = var_234_23
			end

			local var_234_24 = arg_231_1.actors_["2078ui_story"]
			local var_234_25 = 0

			if var_234_25 < arg_231_1.time_ and arg_231_1.time_ <= var_234_25 + arg_234_0 and arg_231_1.var_.characterEffect2078ui_story == nil then
				arg_231_1.var_.characterEffect2078ui_story = var_234_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_26 = 0.200000002980232

			if var_234_25 <= arg_231_1.time_ and arg_231_1.time_ < var_234_25 + var_234_26 then
				local var_234_27 = (arg_231_1.time_ - var_234_25) / var_234_26

				if arg_231_1.var_.characterEffect2078ui_story then
					local var_234_28 = Mathf.Lerp(0, 0.5, var_234_27)

					arg_231_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_231_1.var_.characterEffect2078ui_story.fillRatio = var_234_28
				end
			end

			if arg_231_1.time_ >= var_234_25 + var_234_26 and arg_231_1.time_ < var_234_25 + var_234_26 + arg_234_0 and arg_231_1.var_.characterEffect2078ui_story then
				local var_234_29 = 0.5

				arg_231_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_231_1.var_.characterEffect2078ui_story.fillRatio = var_234_29
			end

			local var_234_30 = 0
			local var_234_31 = 0.625

			if var_234_30 < arg_231_1.time_ and arg_231_1.time_ <= var_234_30 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_32 = arg_231_1:FormatText(StoryNameCfg[479].name)

				arg_231_1.leftNameTxt_.text = var_234_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_33 = arg_231_1:GetWordFromCfg(317032058)
				local var_234_34 = arg_231_1:FormatText(var_234_33.content)

				arg_231_1.text_.text = var_234_34

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_35 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032058", "story_v_out_317032.awb") ~= 0 then
					local var_234_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032058", "story_v_out_317032.awb") / 1000

					if var_234_38 + var_234_30 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_38 + var_234_30
					end

					if var_234_33.prefab_name ~= "" and arg_231_1.actors_[var_234_33.prefab_name] ~= nil then
						local var_234_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_33.prefab_name].transform, "story_v_out_317032", "317032058", "story_v_out_317032.awb")

						arg_231_1:RecordAudio("317032058", var_234_39)
						arg_231_1:RecordAudio("317032058", var_234_39)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_317032", "317032058", "story_v_out_317032.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_317032", "317032058", "story_v_out_317032.awb")
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
	Play317032059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 317032059
		arg_235_1.duration_ = 15.266

		local var_235_0 = {
			zh = 11.566,
			ja = 15.266
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play317032060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1015ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1015ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1015ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["1015ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and arg_235_1.var_.characterEffect1015ui_story == nil then
				arg_235_1.var_.characterEffect1015ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect1015ui_story then
					arg_235_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect1015ui_story then
				arg_235_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_238_13 = 0

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_238_15 = arg_235_1.actors_["2078ui_story"].transform
			local var_238_16 = 0

			if var_238_16 < arg_235_1.time_ and arg_235_1.time_ <= var_238_16 + arg_238_0 then
				arg_235_1.var_.moveOldPos2078ui_story = var_238_15.localPosition
			end

			local var_238_17 = 0.001

			if var_238_16 <= arg_235_1.time_ and arg_235_1.time_ < var_238_16 + var_238_17 then
				local var_238_18 = (arg_235_1.time_ - var_238_16) / var_238_17
				local var_238_19 = Vector3.New(0.7, -1.28, -5.6)

				var_238_15.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos2078ui_story, var_238_19, var_238_18)

				local var_238_20 = manager.ui.mainCamera.transform.position - var_238_15.position

				var_238_15.forward = Vector3.New(var_238_20.x, var_238_20.y, var_238_20.z)

				local var_238_21 = var_238_15.localEulerAngles

				var_238_21.z = 0
				var_238_21.x = 0
				var_238_15.localEulerAngles = var_238_21
			end

			if arg_235_1.time_ >= var_238_16 + var_238_17 and arg_235_1.time_ < var_238_16 + var_238_17 + arg_238_0 then
				var_238_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_238_22 = manager.ui.mainCamera.transform.position - var_238_15.position

				var_238_15.forward = Vector3.New(var_238_22.x, var_238_22.y, var_238_22.z)

				local var_238_23 = var_238_15.localEulerAngles

				var_238_23.z = 0
				var_238_23.x = 0
				var_238_15.localEulerAngles = var_238_23
			end

			local var_238_24 = arg_235_1.actors_["2078ui_story"]
			local var_238_25 = 0

			if var_238_25 < arg_235_1.time_ and arg_235_1.time_ <= var_238_25 + arg_238_0 and arg_235_1.var_.characterEffect2078ui_story == nil then
				arg_235_1.var_.characterEffect2078ui_story = var_238_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_26 = 0.200000002980232

			if var_238_25 <= arg_235_1.time_ and arg_235_1.time_ < var_238_25 + var_238_26 then
				local var_238_27 = (arg_235_1.time_ - var_238_25) / var_238_26

				if arg_235_1.var_.characterEffect2078ui_story then
					local var_238_28 = Mathf.Lerp(0, 0.5, var_238_27)

					arg_235_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_235_1.var_.characterEffect2078ui_story.fillRatio = var_238_28
				end
			end

			if arg_235_1.time_ >= var_238_25 + var_238_26 and arg_235_1.time_ < var_238_25 + var_238_26 + arg_238_0 and arg_235_1.var_.characterEffect2078ui_story then
				local var_238_29 = 0.5

				arg_235_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_235_1.var_.characterEffect2078ui_story.fillRatio = var_238_29
			end

			local var_238_30 = 0
			local var_238_31 = 1.375

			if var_238_30 < arg_235_1.time_ and arg_235_1.time_ <= var_238_30 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_32 = arg_235_1:FormatText(StoryNameCfg[479].name)

				arg_235_1.leftNameTxt_.text = var_238_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_33 = arg_235_1:GetWordFromCfg(317032059)
				local var_238_34 = arg_235_1:FormatText(var_238_33.content)

				arg_235_1.text_.text = var_238_34

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_35 = 55
				local var_238_36 = utf8.len(var_238_34)
				local var_238_37 = var_238_35 <= 0 and var_238_31 or var_238_31 * (var_238_36 / var_238_35)

				if var_238_37 > 0 and var_238_31 < var_238_37 then
					arg_235_1.talkMaxDuration = var_238_37

					if var_238_37 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_37 + var_238_30
					end
				end

				arg_235_1.text_.text = var_238_34
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032059", "story_v_out_317032.awb") ~= 0 then
					local var_238_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032059", "story_v_out_317032.awb") / 1000

					if var_238_38 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_38 + var_238_30
					end

					if var_238_33.prefab_name ~= "" and arg_235_1.actors_[var_238_33.prefab_name] ~= nil then
						local var_238_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_33.prefab_name].transform, "story_v_out_317032", "317032059", "story_v_out_317032.awb")

						arg_235_1:RecordAudio("317032059", var_238_39)
						arg_235_1:RecordAudio("317032059", var_238_39)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_317032", "317032059", "story_v_out_317032.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_317032", "317032059", "story_v_out_317032.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_40 = math.max(var_238_31, arg_235_1.talkMaxDuration)

			if var_238_30 <= arg_235_1.time_ and arg_235_1.time_ < var_238_30 + var_238_40 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_30) / var_238_40

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_30 + var_238_40 and arg_235_1.time_ < var_238_30 + var_238_40 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play317032060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 317032060
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play317032061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1015ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1015ui_story == nil then
				arg_239_1.var_.characterEffect1015ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1015ui_story then
					local var_242_4 = Mathf.Lerp(0, 0.5, var_242_3)

					arg_239_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1015ui_story.fillRatio = var_242_4
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1015ui_story then
				local var_242_5 = 0.5

				arg_239_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1015ui_story.fillRatio = var_242_5
			end

			local var_242_6 = 0
			local var_242_7 = 0.625

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_8 = arg_239_1:GetWordFromCfg(317032060)
				local var_242_9 = arg_239_1:FormatText(var_242_8.content)

				arg_239_1.text_.text = var_242_9

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_10 = 25
				local var_242_11 = utf8.len(var_242_9)
				local var_242_12 = var_242_10 <= 0 and var_242_7 or var_242_7 * (var_242_11 / var_242_10)

				if var_242_12 > 0 and var_242_7 < var_242_12 then
					arg_239_1.talkMaxDuration = var_242_12

					if var_242_12 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_12 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_9
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_13 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_13 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_13

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_13 and arg_239_1.time_ < var_242_6 + var_242_13 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play317032061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 317032061
		arg_243_1.duration_ = 6.033

		local var_243_0 = {
			zh = 5.133,
			ja = 6.033
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
				arg_243_0:Play317032062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1015ui_story"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1015ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1015ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = arg_243_1.actors_["1015ui_story"]
			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 and arg_243_1.var_.characterEffect1015ui_story == nil then
				arg_243_1.var_.characterEffect1015ui_story = var_246_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_11 = 0.200000002980232

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_10) / var_246_11

				if arg_243_1.var_.characterEffect1015ui_story then
					local var_246_13 = Mathf.Lerp(0, 0.5, var_246_12)

					arg_243_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1015ui_story.fillRatio = var_246_13
				end
			end

			if arg_243_1.time_ >= var_246_10 + var_246_11 and arg_243_1.time_ < var_246_10 + var_246_11 + arg_246_0 and arg_243_1.var_.characterEffect1015ui_story then
				local var_246_14 = 0.5

				arg_243_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1015ui_story.fillRatio = var_246_14
			end

			local var_246_15 = arg_243_1.actors_["2078ui_story"].transform
			local var_246_16 = 0

			if var_246_16 < arg_243_1.time_ and arg_243_1.time_ <= var_246_16 + arg_246_0 then
				arg_243_1.var_.moveOldPos2078ui_story = var_246_15.localPosition
			end

			local var_246_17 = 0.001

			if var_246_16 <= arg_243_1.time_ and arg_243_1.time_ < var_246_16 + var_246_17 then
				local var_246_18 = (arg_243_1.time_ - var_246_16) / var_246_17
				local var_246_19 = Vector3.New(0.7, -1.28, -5.6)

				var_246_15.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos2078ui_story, var_246_19, var_246_18)

				local var_246_20 = manager.ui.mainCamera.transform.position - var_246_15.position

				var_246_15.forward = Vector3.New(var_246_20.x, var_246_20.y, var_246_20.z)

				local var_246_21 = var_246_15.localEulerAngles

				var_246_21.z = 0
				var_246_21.x = 0
				var_246_15.localEulerAngles = var_246_21
			end

			if arg_243_1.time_ >= var_246_16 + var_246_17 and arg_243_1.time_ < var_246_16 + var_246_17 + arg_246_0 then
				var_246_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_246_22 = manager.ui.mainCamera.transform.position - var_246_15.position

				var_246_15.forward = Vector3.New(var_246_22.x, var_246_22.y, var_246_22.z)

				local var_246_23 = var_246_15.localEulerAngles

				var_246_23.z = 0
				var_246_23.x = 0
				var_246_15.localEulerAngles = var_246_23
			end

			local var_246_24 = arg_243_1.actors_["2078ui_story"]
			local var_246_25 = 0

			if var_246_25 < arg_243_1.time_ and arg_243_1.time_ <= var_246_25 + arg_246_0 and arg_243_1.var_.characterEffect2078ui_story == nil then
				arg_243_1.var_.characterEffect2078ui_story = var_246_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_26 = 0.200000002980232

			if var_246_25 <= arg_243_1.time_ and arg_243_1.time_ < var_246_25 + var_246_26 then
				local var_246_27 = (arg_243_1.time_ - var_246_25) / var_246_26

				if arg_243_1.var_.characterEffect2078ui_story then
					arg_243_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_25 + var_246_26 and arg_243_1.time_ < var_246_25 + var_246_26 + arg_246_0 and arg_243_1.var_.characterEffect2078ui_story then
				arg_243_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_246_28 = 0

			if var_246_28 < arg_243_1.time_ and arg_243_1.time_ <= var_246_28 + arg_246_0 then
				arg_243_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_246_29 = 0

			if var_246_29 < arg_243_1.time_ and arg_243_1.time_ <= var_246_29 + arg_246_0 then
				arg_243_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_246_30 = 0
			local var_246_31 = 0.55

			if var_246_30 < arg_243_1.time_ and arg_243_1.time_ <= var_246_30 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_32 = arg_243_1:FormatText(StoryNameCfg[528].name)

				arg_243_1.leftNameTxt_.text = var_246_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_33 = arg_243_1:GetWordFromCfg(317032061)
				local var_246_34 = arg_243_1:FormatText(var_246_33.content)

				arg_243_1.text_.text = var_246_34

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_35 = 22
				local var_246_36 = utf8.len(var_246_34)
				local var_246_37 = var_246_35 <= 0 and var_246_31 or var_246_31 * (var_246_36 / var_246_35)

				if var_246_37 > 0 and var_246_31 < var_246_37 then
					arg_243_1.talkMaxDuration = var_246_37

					if var_246_37 + var_246_30 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_37 + var_246_30
					end
				end

				arg_243_1.text_.text = var_246_34
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032061", "story_v_out_317032.awb") ~= 0 then
					local var_246_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032061", "story_v_out_317032.awb") / 1000

					if var_246_38 + var_246_30 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_38 + var_246_30
					end

					if var_246_33.prefab_name ~= "" and arg_243_1.actors_[var_246_33.prefab_name] ~= nil then
						local var_246_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_33.prefab_name].transform, "story_v_out_317032", "317032061", "story_v_out_317032.awb")

						arg_243_1:RecordAudio("317032061", var_246_39)
						arg_243_1:RecordAudio("317032061", var_246_39)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_317032", "317032061", "story_v_out_317032.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_317032", "317032061", "story_v_out_317032.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_40 = math.max(var_246_31, arg_243_1.talkMaxDuration)

			if var_246_30 <= arg_243_1.time_ and arg_243_1.time_ < var_246_30 + var_246_40 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_30) / var_246_40

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_30 + var_246_40 and arg_243_1.time_ < var_246_30 + var_246_40 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play317032062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 317032062
		arg_247_1.duration_ = 13.5

		local var_247_0 = {
			zh = 13.5,
			ja = 11.333
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
				arg_247_0:Play317032063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 1.7

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[528].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(317032062)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 68
				local var_250_6 = utf8.len(var_250_4)
				local var_250_7 = var_250_5 <= 0 and var_250_1 or var_250_1 * (var_250_6 / var_250_5)

				if var_250_7 > 0 and var_250_1 < var_250_7 then
					arg_247_1.talkMaxDuration = var_250_7

					if var_250_7 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_7 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_4
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032062", "story_v_out_317032.awb") ~= 0 then
					local var_250_8 = manager.audio:GetVoiceLength("story_v_out_317032", "317032062", "story_v_out_317032.awb") / 1000

					if var_250_8 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_8 + var_250_0
					end

					if var_250_3.prefab_name ~= "" and arg_247_1.actors_[var_250_3.prefab_name] ~= nil then
						local var_250_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_3.prefab_name].transform, "story_v_out_317032", "317032062", "story_v_out_317032.awb")

						arg_247_1:RecordAudio("317032062", var_250_9)
						arg_247_1:RecordAudio("317032062", var_250_9)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_317032", "317032062", "story_v_out_317032.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_317032", "317032062", "story_v_out_317032.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_10 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_10 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_10

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_10 and arg_247_1.time_ < var_250_0 + var_250_10 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play317032063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 317032063
		arg_251_1.duration_ = 8.6

		local var_251_0 = {
			zh = 6.933,
			ja = 8.6
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
				arg_251_0:Play317032064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1015ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1015ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1015ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["1015ui_story"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and arg_251_1.var_.characterEffect1015ui_story == nil then
				arg_251_1.var_.characterEffect1015ui_story = var_254_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_11 = 0.200000002980232

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.characterEffect1015ui_story then
					arg_251_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and arg_251_1.var_.characterEffect1015ui_story then
				arg_251_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 then
				arg_251_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_254_15 = arg_251_1.actors_["2078ui_story"].transform
			local var_254_16 = 0

			if var_254_16 < arg_251_1.time_ and arg_251_1.time_ <= var_254_16 + arg_254_0 then
				arg_251_1.var_.moveOldPos2078ui_story = var_254_15.localPosition
			end

			local var_254_17 = 0.001

			if var_254_16 <= arg_251_1.time_ and arg_251_1.time_ < var_254_16 + var_254_17 then
				local var_254_18 = (arg_251_1.time_ - var_254_16) / var_254_17
				local var_254_19 = Vector3.New(0.7, -1.28, -5.6)

				var_254_15.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos2078ui_story, var_254_19, var_254_18)

				local var_254_20 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_20.x, var_254_20.y, var_254_20.z)

				local var_254_21 = var_254_15.localEulerAngles

				var_254_21.z = 0
				var_254_21.x = 0
				var_254_15.localEulerAngles = var_254_21
			end

			if arg_251_1.time_ >= var_254_16 + var_254_17 and arg_251_1.time_ < var_254_16 + var_254_17 + arg_254_0 then
				var_254_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_254_22 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_22.x, var_254_22.y, var_254_22.z)

				local var_254_23 = var_254_15.localEulerAngles

				var_254_23.z = 0
				var_254_23.x = 0
				var_254_15.localEulerAngles = var_254_23
			end

			local var_254_24 = arg_251_1.actors_["2078ui_story"]
			local var_254_25 = 0

			if var_254_25 < arg_251_1.time_ and arg_251_1.time_ <= var_254_25 + arg_254_0 and arg_251_1.var_.characterEffect2078ui_story == nil then
				arg_251_1.var_.characterEffect2078ui_story = var_254_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_26 = 0.200000002980232

			if var_254_25 <= arg_251_1.time_ and arg_251_1.time_ < var_254_25 + var_254_26 then
				local var_254_27 = (arg_251_1.time_ - var_254_25) / var_254_26

				if arg_251_1.var_.characterEffect2078ui_story then
					local var_254_28 = Mathf.Lerp(0, 0.5, var_254_27)

					arg_251_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_251_1.var_.characterEffect2078ui_story.fillRatio = var_254_28
				end
			end

			if arg_251_1.time_ >= var_254_25 + var_254_26 and arg_251_1.time_ < var_254_25 + var_254_26 + arg_254_0 and arg_251_1.var_.characterEffect2078ui_story then
				local var_254_29 = 0.5

				arg_251_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_251_1.var_.characterEffect2078ui_story.fillRatio = var_254_29
			end

			local var_254_30 = 0
			local var_254_31 = 0.95

			if var_254_30 < arg_251_1.time_ and arg_251_1.time_ <= var_254_30 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_32 = arg_251_1:FormatText(StoryNameCfg[479].name)

				arg_251_1.leftNameTxt_.text = var_254_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_33 = arg_251_1:GetWordFromCfg(317032063)
				local var_254_34 = arg_251_1:FormatText(var_254_33.content)

				arg_251_1.text_.text = var_254_34

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_35 = 38
				local var_254_36 = utf8.len(var_254_34)
				local var_254_37 = var_254_35 <= 0 and var_254_31 or var_254_31 * (var_254_36 / var_254_35)

				if var_254_37 > 0 and var_254_31 < var_254_37 then
					arg_251_1.talkMaxDuration = var_254_37

					if var_254_37 + var_254_30 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_37 + var_254_30
					end
				end

				arg_251_1.text_.text = var_254_34
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032063", "story_v_out_317032.awb") ~= 0 then
					local var_254_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032063", "story_v_out_317032.awb") / 1000

					if var_254_38 + var_254_30 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_38 + var_254_30
					end

					if var_254_33.prefab_name ~= "" and arg_251_1.actors_[var_254_33.prefab_name] ~= nil then
						local var_254_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_33.prefab_name].transform, "story_v_out_317032", "317032063", "story_v_out_317032.awb")

						arg_251_1:RecordAudio("317032063", var_254_39)
						arg_251_1:RecordAudio("317032063", var_254_39)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_317032", "317032063", "story_v_out_317032.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_317032", "317032063", "story_v_out_317032.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_40 = math.max(var_254_31, arg_251_1.talkMaxDuration)

			if var_254_30 <= arg_251_1.time_ and arg_251_1.time_ < var_254_30 + var_254_40 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_30) / var_254_40

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_30 + var_254_40 and arg_251_1.time_ < var_254_30 + var_254_40 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play317032064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 317032064
		arg_255_1.duration_ = 4.633

		local var_255_0 = {
			zh = 4.633,
			ja = 3.566
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
				arg_255_0:Play317032065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1015ui_story"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1015ui_story = var_258_0.localPosition
			end

			local var_258_2 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2
				local var_258_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1015ui_story, var_258_4, var_258_3)

				local var_258_5 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_5.x, var_258_5.y, var_258_5.z)

				local var_258_6 = var_258_0.localEulerAngles

				var_258_6.z = 0
				var_258_6.x = 0
				var_258_0.localEulerAngles = var_258_6
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_258_7 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_7.x, var_258_7.y, var_258_7.z)

				local var_258_8 = var_258_0.localEulerAngles

				var_258_8.z = 0
				var_258_8.x = 0
				var_258_0.localEulerAngles = var_258_8
			end

			local var_258_9 = arg_255_1.actors_["1015ui_story"]
			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 and arg_255_1.var_.characterEffect1015ui_story == nil then
				arg_255_1.var_.characterEffect1015ui_story = var_258_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_11 = 0.200000002980232

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_10) / var_258_11

				if arg_255_1.var_.characterEffect1015ui_story then
					local var_258_13 = Mathf.Lerp(0, 0.5, var_258_12)

					arg_255_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1015ui_story.fillRatio = var_258_13
				end
			end

			if arg_255_1.time_ >= var_258_10 + var_258_11 and arg_255_1.time_ < var_258_10 + var_258_11 + arg_258_0 and arg_255_1.var_.characterEffect1015ui_story then
				local var_258_14 = 0.5

				arg_255_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1015ui_story.fillRatio = var_258_14
			end

			local var_258_15 = arg_255_1.actors_["2078ui_story"].transform
			local var_258_16 = 0

			if var_258_16 < arg_255_1.time_ and arg_255_1.time_ <= var_258_16 + arg_258_0 then
				arg_255_1.var_.moveOldPos2078ui_story = var_258_15.localPosition
			end

			local var_258_17 = 0.001

			if var_258_16 <= arg_255_1.time_ and arg_255_1.time_ < var_258_16 + var_258_17 then
				local var_258_18 = (arg_255_1.time_ - var_258_16) / var_258_17
				local var_258_19 = Vector3.New(0.7, -1.28, -5.6)

				var_258_15.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos2078ui_story, var_258_19, var_258_18)

				local var_258_20 = manager.ui.mainCamera.transform.position - var_258_15.position

				var_258_15.forward = Vector3.New(var_258_20.x, var_258_20.y, var_258_20.z)

				local var_258_21 = var_258_15.localEulerAngles

				var_258_21.z = 0
				var_258_21.x = 0
				var_258_15.localEulerAngles = var_258_21
			end

			if arg_255_1.time_ >= var_258_16 + var_258_17 and arg_255_1.time_ < var_258_16 + var_258_17 + arg_258_0 then
				var_258_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_258_22 = manager.ui.mainCamera.transform.position - var_258_15.position

				var_258_15.forward = Vector3.New(var_258_22.x, var_258_22.y, var_258_22.z)

				local var_258_23 = var_258_15.localEulerAngles

				var_258_23.z = 0
				var_258_23.x = 0
				var_258_15.localEulerAngles = var_258_23
			end

			local var_258_24 = arg_255_1.actors_["2078ui_story"]
			local var_258_25 = 0

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 and arg_255_1.var_.characterEffect2078ui_story == nil then
				arg_255_1.var_.characterEffect2078ui_story = var_258_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_26 = 0.200000002980232

			if var_258_25 <= arg_255_1.time_ and arg_255_1.time_ < var_258_25 + var_258_26 then
				local var_258_27 = (arg_255_1.time_ - var_258_25) / var_258_26

				if arg_255_1.var_.characterEffect2078ui_story then
					arg_255_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_25 + var_258_26 and arg_255_1.time_ < var_258_25 + var_258_26 + arg_258_0 and arg_255_1.var_.characterEffect2078ui_story then
				arg_255_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_258_28 = 0

			if var_258_28 < arg_255_1.time_ and arg_255_1.time_ <= var_258_28 + arg_258_0 then
				arg_255_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_258_29 = 0

			if var_258_29 < arg_255_1.time_ and arg_255_1.time_ <= var_258_29 + arg_258_0 then
				arg_255_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_258_30 = 0
			local var_258_31 = 0.375

			if var_258_30 < arg_255_1.time_ and arg_255_1.time_ <= var_258_30 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_32 = arg_255_1:FormatText(StoryNameCfg[528].name)

				arg_255_1.leftNameTxt_.text = var_258_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_33 = arg_255_1:GetWordFromCfg(317032064)
				local var_258_34 = arg_255_1:FormatText(var_258_33.content)

				arg_255_1.text_.text = var_258_34

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_35 = 15
				local var_258_36 = utf8.len(var_258_34)
				local var_258_37 = var_258_35 <= 0 and var_258_31 or var_258_31 * (var_258_36 / var_258_35)

				if var_258_37 > 0 and var_258_31 < var_258_37 then
					arg_255_1.talkMaxDuration = var_258_37

					if var_258_37 + var_258_30 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_37 + var_258_30
					end
				end

				arg_255_1.text_.text = var_258_34
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032064", "story_v_out_317032.awb") ~= 0 then
					local var_258_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032064", "story_v_out_317032.awb") / 1000

					if var_258_38 + var_258_30 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_38 + var_258_30
					end

					if var_258_33.prefab_name ~= "" and arg_255_1.actors_[var_258_33.prefab_name] ~= nil then
						local var_258_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_33.prefab_name].transform, "story_v_out_317032", "317032064", "story_v_out_317032.awb")

						arg_255_1:RecordAudio("317032064", var_258_39)
						arg_255_1:RecordAudio("317032064", var_258_39)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_317032", "317032064", "story_v_out_317032.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_317032", "317032064", "story_v_out_317032.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_40 = math.max(var_258_31, arg_255_1.talkMaxDuration)

			if var_258_30 <= arg_255_1.time_ and arg_255_1.time_ < var_258_30 + var_258_40 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_30) / var_258_40

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_30 + var_258_40 and arg_255_1.time_ < var_258_30 + var_258_40 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play317032065 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 317032065
		arg_259_1.duration_ = 3.3

		local var_259_0 = {
			zh = 2.1,
			ja = 3.3
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
				arg_259_0:Play317032066(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1015ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1015ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(0, 100, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1015ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, 100, 0)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = arg_259_1.actors_["1015ui_story"]
			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 and arg_259_1.var_.characterEffect1015ui_story == nil then
				arg_259_1.var_.characterEffect1015ui_story = var_262_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_11 = 0.200000002980232

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_10) / var_262_11

				if arg_259_1.var_.characterEffect1015ui_story then
					local var_262_13 = Mathf.Lerp(0, 0.5, var_262_12)

					arg_259_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1015ui_story.fillRatio = var_262_13
				end
			end

			if arg_259_1.time_ >= var_262_10 + var_262_11 and arg_259_1.time_ < var_262_10 + var_262_11 + arg_262_0 and arg_259_1.var_.characterEffect1015ui_story then
				local var_262_14 = 0.5

				arg_259_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1015ui_story.fillRatio = var_262_14
			end

			local var_262_15 = arg_259_1.actors_["2078ui_story"].transform
			local var_262_16 = 0

			if var_262_16 < arg_259_1.time_ and arg_259_1.time_ <= var_262_16 + arg_262_0 then
				arg_259_1.var_.moveOldPos2078ui_story = var_262_15.localPosition
			end

			local var_262_17 = 0.001

			if var_262_16 <= arg_259_1.time_ and arg_259_1.time_ < var_262_16 + var_262_17 then
				local var_262_18 = (arg_259_1.time_ - var_262_16) / var_262_17
				local var_262_19 = Vector3.New(0, 100, 0)

				var_262_15.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos2078ui_story, var_262_19, var_262_18)

				local var_262_20 = manager.ui.mainCamera.transform.position - var_262_15.position

				var_262_15.forward = Vector3.New(var_262_20.x, var_262_20.y, var_262_20.z)

				local var_262_21 = var_262_15.localEulerAngles

				var_262_21.z = 0
				var_262_21.x = 0
				var_262_15.localEulerAngles = var_262_21
			end

			if arg_259_1.time_ >= var_262_16 + var_262_17 and arg_259_1.time_ < var_262_16 + var_262_17 + arg_262_0 then
				var_262_15.localPosition = Vector3.New(0, 100, 0)

				local var_262_22 = manager.ui.mainCamera.transform.position - var_262_15.position

				var_262_15.forward = Vector3.New(var_262_22.x, var_262_22.y, var_262_22.z)

				local var_262_23 = var_262_15.localEulerAngles

				var_262_23.z = 0
				var_262_23.x = 0
				var_262_15.localEulerAngles = var_262_23
			end

			local var_262_24 = arg_259_1.actors_["2078ui_story"]
			local var_262_25 = 0

			if var_262_25 < arg_259_1.time_ and arg_259_1.time_ <= var_262_25 + arg_262_0 and arg_259_1.var_.characterEffect2078ui_story == nil then
				arg_259_1.var_.characterEffect2078ui_story = var_262_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_26 = 0.200000002980232

			if var_262_25 <= arg_259_1.time_ and arg_259_1.time_ < var_262_25 + var_262_26 then
				local var_262_27 = (arg_259_1.time_ - var_262_25) / var_262_26

				if arg_259_1.var_.characterEffect2078ui_story then
					local var_262_28 = Mathf.Lerp(0, 0.5, var_262_27)

					arg_259_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_259_1.var_.characterEffect2078ui_story.fillRatio = var_262_28
				end
			end

			if arg_259_1.time_ >= var_262_25 + var_262_26 and arg_259_1.time_ < var_262_25 + var_262_26 + arg_262_0 and arg_259_1.var_.characterEffect2078ui_story then
				local var_262_29 = 0.5

				arg_259_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_259_1.var_.characterEffect2078ui_story.fillRatio = var_262_29
			end

			local var_262_30 = arg_259_1.actors_["1093ui_story"].transform
			local var_262_31 = 0

			if var_262_31 < arg_259_1.time_ and arg_259_1.time_ <= var_262_31 + arg_262_0 then
				arg_259_1.var_.moveOldPos1093ui_story = var_262_30.localPosition
			end

			local var_262_32 = 0.001

			if var_262_31 <= arg_259_1.time_ and arg_259_1.time_ < var_262_31 + var_262_32 then
				local var_262_33 = (arg_259_1.time_ - var_262_31) / var_262_32
				local var_262_34 = Vector3.New(0, -1.11, -5.88)

				var_262_30.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1093ui_story, var_262_34, var_262_33)

				local var_262_35 = manager.ui.mainCamera.transform.position - var_262_30.position

				var_262_30.forward = Vector3.New(var_262_35.x, var_262_35.y, var_262_35.z)

				local var_262_36 = var_262_30.localEulerAngles

				var_262_36.z = 0
				var_262_36.x = 0
				var_262_30.localEulerAngles = var_262_36
			end

			if arg_259_1.time_ >= var_262_31 + var_262_32 and arg_259_1.time_ < var_262_31 + var_262_32 + arg_262_0 then
				var_262_30.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_262_37 = manager.ui.mainCamera.transform.position - var_262_30.position

				var_262_30.forward = Vector3.New(var_262_37.x, var_262_37.y, var_262_37.z)

				local var_262_38 = var_262_30.localEulerAngles

				var_262_38.z = 0
				var_262_38.x = 0
				var_262_30.localEulerAngles = var_262_38
			end

			local var_262_39 = arg_259_1.actors_["1093ui_story"]
			local var_262_40 = 0

			if var_262_40 < arg_259_1.time_ and arg_259_1.time_ <= var_262_40 + arg_262_0 and arg_259_1.var_.characterEffect1093ui_story == nil then
				arg_259_1.var_.characterEffect1093ui_story = var_262_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_41 = 0.200000002980232

			if var_262_40 <= arg_259_1.time_ and arg_259_1.time_ < var_262_40 + var_262_41 then
				local var_262_42 = (arg_259_1.time_ - var_262_40) / var_262_41

				if arg_259_1.var_.characterEffect1093ui_story then
					arg_259_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_40 + var_262_41 and arg_259_1.time_ < var_262_40 + var_262_41 + arg_262_0 and arg_259_1.var_.characterEffect1093ui_story then
				arg_259_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_262_43 = 0

			if var_262_43 < arg_259_1.time_ and arg_259_1.time_ <= var_262_43 + arg_262_0 then
				arg_259_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_262_44 = 0
			local var_262_45 = 0.25

			if var_262_44 < arg_259_1.time_ and arg_259_1.time_ <= var_262_44 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_46 = arg_259_1:FormatText(StoryNameCfg[73].name)

				arg_259_1.leftNameTxt_.text = var_262_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_47 = arg_259_1:GetWordFromCfg(317032065)
				local var_262_48 = arg_259_1:FormatText(var_262_47.content)

				arg_259_1.text_.text = var_262_48

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_49 = 10
				local var_262_50 = utf8.len(var_262_48)
				local var_262_51 = var_262_49 <= 0 and var_262_45 or var_262_45 * (var_262_50 / var_262_49)

				if var_262_51 > 0 and var_262_45 < var_262_51 then
					arg_259_1.talkMaxDuration = var_262_51

					if var_262_51 + var_262_44 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_51 + var_262_44
					end
				end

				arg_259_1.text_.text = var_262_48
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032065", "story_v_out_317032.awb") ~= 0 then
					local var_262_52 = manager.audio:GetVoiceLength("story_v_out_317032", "317032065", "story_v_out_317032.awb") / 1000

					if var_262_52 + var_262_44 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_52 + var_262_44
					end

					if var_262_47.prefab_name ~= "" and arg_259_1.actors_[var_262_47.prefab_name] ~= nil then
						local var_262_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_47.prefab_name].transform, "story_v_out_317032", "317032065", "story_v_out_317032.awb")

						arg_259_1:RecordAudio("317032065", var_262_53)
						arg_259_1:RecordAudio("317032065", var_262_53)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_317032", "317032065", "story_v_out_317032.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_317032", "317032065", "story_v_out_317032.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_54 = math.max(var_262_45, arg_259_1.talkMaxDuration)

			if var_262_44 <= arg_259_1.time_ and arg_259_1.time_ < var_262_44 + var_262_54 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_44) / var_262_54

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_44 + var_262_54 and arg_259_1.time_ < var_262_44 + var_262_54 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play317032066 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 317032066
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play317032067(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1093ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect1093ui_story == nil then
				arg_263_1.var_.characterEffect1093ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.200000002980232

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect1093ui_story then
					local var_266_4 = Mathf.Lerp(0, 0.5, var_266_3)

					arg_263_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_263_1.var_.characterEffect1093ui_story.fillRatio = var_266_4
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect1093ui_story then
				local var_266_5 = 0.5

				arg_263_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_263_1.var_.characterEffect1093ui_story.fillRatio = var_266_5
			end

			local var_266_6 = 0
			local var_266_7 = 1.35

			if var_266_6 < arg_263_1.time_ and arg_263_1.time_ <= var_266_6 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_8 = arg_263_1:GetWordFromCfg(317032066)
				local var_266_9 = arg_263_1:FormatText(var_266_8.content)

				arg_263_1.text_.text = var_266_9

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_10 = 54
				local var_266_11 = utf8.len(var_266_9)
				local var_266_12 = var_266_10 <= 0 and var_266_7 or var_266_7 * (var_266_11 / var_266_10)

				if var_266_12 > 0 and var_266_7 < var_266_12 then
					arg_263_1.talkMaxDuration = var_266_12

					if var_266_12 + var_266_6 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_12 + var_266_6
					end
				end

				arg_263_1.text_.text = var_266_9
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_13 = math.max(var_266_7, arg_263_1.talkMaxDuration)

			if var_266_6 <= arg_263_1.time_ and arg_263_1.time_ < var_266_6 + var_266_13 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_6) / var_266_13

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_6 + var_266_13 and arg_263_1.time_ < var_266_6 + var_266_13 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play317032067 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 317032067
		arg_267_1.duration_ = 0.999999999999

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play317032068(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.fswbg_:SetActive(true)
				arg_267_1.dialog_:SetActive(false)

				arg_267_1.fswtw_.percent = 0

				local var_270_1 = arg_267_1:GetWordFromCfg(317032067)
				local var_270_2 = arg_267_1:FormatText(var_270_1.content)

				arg_267_1.fswt_.text = var_270_2

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.fswt_)

				arg_267_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_267_1.fswtw_:SetDirty()

				arg_267_1.typewritterCharCountI18N = 0

				arg_267_1:ShowNextGo(false)
			end

			local var_270_3 = 0.033

			if var_270_3 < arg_267_1.time_ and arg_267_1.time_ <= var_270_3 + arg_270_0 then
				arg_267_1.var_.oldValueTypewriter = arg_267_1.fswtw_.percent

				arg_267_1:ShowNextGo(false)
			end

			local var_270_4 = 10
			local var_270_5 = 0.666666666666667
			local var_270_6 = arg_267_1:GetWordFromCfg(317032067)
			local var_270_7 = arg_267_1:FormatText(var_270_6.content)
			local var_270_8, var_270_9 = arg_267_1:GetPercentByPara(var_270_7, 1)

			if var_270_3 < arg_267_1.time_ and arg_267_1.time_ <= var_270_3 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				local var_270_10 = var_270_4 <= 0 and var_270_5 or var_270_5 * ((var_270_9 - arg_267_1.typewritterCharCountI18N) / var_270_4)

				if var_270_10 > 0 and var_270_5 < var_270_10 then
					arg_267_1.talkMaxDuration = var_270_10

					if var_270_10 + var_270_3 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_10 + var_270_3
					end
				end
			end

			local var_270_11 = 0.666666666666667
			local var_270_12 = math.max(var_270_11, arg_267_1.talkMaxDuration)

			if var_270_3 <= arg_267_1.time_ and arg_267_1.time_ < var_270_3 + var_270_12 then
				local var_270_13 = (arg_267_1.time_ - var_270_3) / var_270_12

				arg_267_1.fswtw_.percent = Mathf.Lerp(arg_267_1.var_.oldValueTypewriter, var_270_8, var_270_13)
				arg_267_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_267_1.fswtw_:SetDirty()
			end

			if arg_267_1.time_ >= var_270_3 + var_270_12 and arg_267_1.time_ < var_270_3 + var_270_12 + arg_270_0 then
				arg_267_1.fswtw_.percent = var_270_8

				arg_267_1.fswtw_:SetDirty()
				arg_267_1:ShowNextGo(true)

				arg_267_1.typewritterCharCountI18N = var_270_9
			end

			local var_270_14 = 0
			local var_270_15 = 1
			local var_270_16 = manager.audio:GetVoiceLength("story_v_out_317032", "317032067", "story_v_out_317032.awb") / 1000

			if var_270_16 > 0 and var_270_15 < var_270_16 and var_270_16 + var_270_14 > arg_267_1.duration_ then
				local var_270_17 = var_270_16

				arg_267_1.duration_ = var_270_16 + var_270_14
			end

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				local var_270_18 = "play"
				local var_270_19 = "voice"

				arg_267_1:AudioAction(var_270_18, var_270_19, "story_v_out_317032", "317032067", "story_v_out_317032.awb")
			end

			local var_270_20 = arg_267_1.actors_["1093ui_story"].transform
			local var_270_21 = 0

			if var_270_21 < arg_267_1.time_ and arg_267_1.time_ <= var_270_21 + arg_270_0 then
				arg_267_1.var_.moveOldPos1093ui_story = var_270_20.localPosition
			end

			local var_270_22 = 0.001

			if var_270_21 <= arg_267_1.time_ and arg_267_1.time_ < var_270_21 + var_270_22 then
				local var_270_23 = (arg_267_1.time_ - var_270_21) / var_270_22
				local var_270_24 = Vector3.New(0, 100, 0)

				var_270_20.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1093ui_story, var_270_24, var_270_23)

				local var_270_25 = manager.ui.mainCamera.transform.position - var_270_20.position

				var_270_20.forward = Vector3.New(var_270_25.x, var_270_25.y, var_270_25.z)

				local var_270_26 = var_270_20.localEulerAngles

				var_270_26.z = 0
				var_270_26.x = 0
				var_270_20.localEulerAngles = var_270_26
			end

			if arg_267_1.time_ >= var_270_21 + var_270_22 and arg_267_1.time_ < var_270_21 + var_270_22 + arg_270_0 then
				var_270_20.localPosition = Vector3.New(0, 100, 0)

				local var_270_27 = manager.ui.mainCamera.transform.position - var_270_20.position

				var_270_20.forward = Vector3.New(var_270_27.x, var_270_27.y, var_270_27.z)

				local var_270_28 = var_270_20.localEulerAngles

				var_270_28.z = 0
				var_270_28.x = 0
				var_270_20.localEulerAngles = var_270_28
			end
		end
	end,
	Play317032068 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 317032068
		arg_271_1.duration_ = 0.999999999999

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play317032069(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.var_.oldValueTypewriter = arg_271_1.fswtw_.percent

				arg_271_1:ShowNextGo(false)
			end

			local var_274_1 = 10
			local var_274_2 = 0.666666666666667
			local var_274_3 = arg_271_1:GetWordFromCfg(317032067)
			local var_274_4 = arg_271_1:FormatText(var_274_3.content)
			local var_274_5, var_274_6 = arg_271_1:GetPercentByPara(var_274_4, 2)

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0

				local var_274_7 = var_274_1 <= 0 and var_274_2 or var_274_2 * ((var_274_6 - arg_271_1.typewritterCharCountI18N) / var_274_1)

				if var_274_7 > 0 and var_274_2 < var_274_7 then
					arg_271_1.talkMaxDuration = var_274_7

					if var_274_7 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_7 + var_274_0
					end
				end
			end

			local var_274_8 = 0.666666666666667
			local var_274_9 = math.max(var_274_8, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_0) / var_274_9

				arg_271_1.fswtw_.percent = Mathf.Lerp(arg_271_1.var_.oldValueTypewriter, var_274_5, var_274_10)
				arg_271_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_271_1.fswtw_:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_9 and arg_271_1.time_ < var_274_0 + var_274_9 + arg_274_0 then
				arg_271_1.fswtw_.percent = var_274_5

				arg_271_1.fswtw_:SetDirty()
				arg_271_1:ShowNextGo(true)

				arg_271_1.typewritterCharCountI18N = var_274_6
			end

			local var_274_11 = 0
			local var_274_12 = 1
			local var_274_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032068", "story_v_out_317032.awb") / 1000

			if var_274_13 > 0 and var_274_12 < var_274_13 and var_274_13 + var_274_11 > arg_271_1.duration_ then
				local var_274_14 = var_274_13

				arg_271_1.duration_ = var_274_13 + var_274_11
			end

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				local var_274_15 = "play"
				local var_274_16 = "voice"

				arg_271_1:AudioAction(var_274_15, var_274_16, "story_v_out_317032", "317032068", "story_v_out_317032.awb")
			end
		end
	end,
	Play317032069 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 317032069
		arg_275_1.duration_ = 1.133333333332

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play317032070(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.var_.oldValueTypewriter = arg_275_1.fswtw_.percent

				arg_275_1:ShowNextGo(false)
			end

			local var_278_1 = 17
			local var_278_2 = 1.13333333333333
			local var_278_3 = arg_275_1:GetWordFromCfg(317032067)
			local var_278_4 = arg_275_1:FormatText(var_278_3.content)
			local var_278_5, var_278_6 = arg_275_1:GetPercentByPara(var_278_4, 3)

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0

				local var_278_7 = var_278_1 <= 0 and var_278_2 or var_278_2 * ((var_278_6 - arg_275_1.typewritterCharCountI18N) / var_278_1)

				if var_278_7 > 0 and var_278_2 < var_278_7 then
					arg_275_1.talkMaxDuration = var_278_7

					if var_278_7 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_7 + var_278_0
					end
				end
			end

			local var_278_8 = 1.13333333333333
			local var_278_9 = math.max(var_278_8, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_0) / var_278_9

				arg_275_1.fswtw_.percent = Mathf.Lerp(arg_275_1.var_.oldValueTypewriter, var_278_5, var_278_10)
				arg_275_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_275_1.fswtw_:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_9 and arg_275_1.time_ < var_278_0 + var_278_9 + arg_278_0 then
				arg_275_1.fswtw_.percent = var_278_5

				arg_275_1.fswtw_:SetDirty()
				arg_275_1:ShowNextGo(true)

				arg_275_1.typewritterCharCountI18N = var_278_6
			end

			local var_278_11 = 0
			local var_278_12 = 1
			local var_278_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032069", "story_v_out_317032.awb") / 1000

			if var_278_13 > 0 and var_278_12 < var_278_13 and var_278_13 + var_278_11 > arg_275_1.duration_ then
				local var_278_14 = var_278_13

				arg_275_1.duration_ = var_278_13 + var_278_11
			end

			if var_278_11 < arg_275_1.time_ and arg_275_1.time_ <= var_278_11 + arg_278_0 then
				local var_278_15 = "play"
				local var_278_16 = "voice"

				arg_275_1:AudioAction(var_278_15, var_278_16, "story_v_out_317032", "317032069", "story_v_out_317032.awb")
			end
		end
	end,
	Play317032070 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 317032070
		arg_279_1.duration_ = 1.933333333332

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play317032071(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.var_.oldValueTypewriter = arg_279_1.fswtw_.percent

				arg_279_1:ShowNextGo(false)
			end

			local var_282_1 = 29
			local var_282_2 = 1.93333333333333
			local var_282_3 = arg_279_1:GetWordFromCfg(317032067)
			local var_282_4 = arg_279_1:FormatText(var_282_3.content)
			local var_282_5, var_282_6 = arg_279_1:GetPercentByPara(var_282_4, 4)

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0

				local var_282_7 = var_282_1 <= 0 and var_282_2 or var_282_2 * ((var_282_6 - arg_279_1.typewritterCharCountI18N) / var_282_1)

				if var_282_7 > 0 and var_282_2 < var_282_7 then
					arg_279_1.talkMaxDuration = var_282_7

					if var_282_7 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_7 + var_282_0
					end
				end
			end

			local var_282_8 = 1.93333333333333
			local var_282_9 = math.max(var_282_8, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_0) / var_282_9

				arg_279_1.fswtw_.percent = Mathf.Lerp(arg_279_1.var_.oldValueTypewriter, var_282_5, var_282_10)
				arg_279_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_279_1.fswtw_:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_9 and arg_279_1.time_ < var_282_0 + var_282_9 + arg_282_0 then
				arg_279_1.fswtw_.percent = var_282_5

				arg_279_1.fswtw_:SetDirty()
				arg_279_1:ShowNextGo(true)

				arg_279_1.typewritterCharCountI18N = var_282_6
			end

			local var_282_11 = 0
			local var_282_12 = 1
			local var_282_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032070", "story_v_out_317032.awb") / 1000

			if var_282_13 > 0 and var_282_12 < var_282_13 and var_282_13 + var_282_11 > arg_279_1.duration_ then
				local var_282_14 = var_282_13

				arg_279_1.duration_ = var_282_13 + var_282_11
			end

			if var_282_11 < arg_279_1.time_ and arg_279_1.time_ <= var_282_11 + arg_282_0 then
				local var_282_15 = "play"
				local var_282_16 = "voice"

				arg_279_1:AudioAction(var_282_15, var_282_16, "story_v_out_317032", "317032070", "story_v_out_317032.awb")
			end
		end
	end,
	Play317032071 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 317032071
		arg_283_1.duration_ = 1.799999999999

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play317032072(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.var_.oldValueTypewriter = arg_283_1.fswtw_.percent

				arg_283_1:ShowNextGo(false)
			end

			local var_286_1 = 27
			local var_286_2 = 1.8
			local var_286_3 = arg_283_1:GetWordFromCfg(317032067)
			local var_286_4 = arg_283_1:FormatText(var_286_3.content)
			local var_286_5, var_286_6 = arg_283_1:GetPercentByPara(var_286_4, 5)

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0

				local var_286_7 = var_286_1 <= 0 and var_286_2 or var_286_2 * ((var_286_6 - arg_283_1.typewritterCharCountI18N) / var_286_1)

				if var_286_7 > 0 and var_286_2 < var_286_7 then
					arg_283_1.talkMaxDuration = var_286_7

					if var_286_7 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_7 + var_286_0
					end
				end
			end

			local var_286_8 = 1.8
			local var_286_9 = math.max(var_286_8, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_9 then
				local var_286_10 = (arg_283_1.time_ - var_286_0) / var_286_9

				arg_283_1.fswtw_.percent = Mathf.Lerp(arg_283_1.var_.oldValueTypewriter, var_286_5, var_286_10)
				arg_283_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_283_1.fswtw_:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_9 and arg_283_1.time_ < var_286_0 + var_286_9 + arg_286_0 then
				arg_283_1.fswtw_.percent = var_286_5

				arg_283_1.fswtw_:SetDirty()
				arg_283_1:ShowNextGo(true)

				arg_283_1.typewritterCharCountI18N = var_286_6
			end

			local var_286_11 = 0
			local var_286_12 = 1
			local var_286_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032071", "story_v_out_317032.awb") / 1000

			if var_286_13 > 0 and var_286_12 < var_286_13 and var_286_13 + var_286_11 > arg_283_1.duration_ then
				local var_286_14 = var_286_13

				arg_283_1.duration_ = var_286_13 + var_286_11
			end

			if var_286_11 < arg_283_1.time_ and arg_283_1.time_ <= var_286_11 + arg_286_0 then
				local var_286_15 = "play"
				local var_286_16 = "voice"

				arg_283_1:AudioAction(var_286_15, var_286_16, "story_v_out_317032", "317032071", "story_v_out_317032.awb")
			end
		end
	end,
	Play317032072 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 317032072
		arg_287_1.duration_ = 0.999999999999

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play317032073(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.var_.oldValueTypewriter = arg_287_1.fswtw_.percent

				arg_287_1:ShowNextGo(false)
			end

			local var_290_1 = 13
			local var_290_2 = 0.866666666666667
			local var_290_3 = arg_287_1:GetWordFromCfg(317032067)
			local var_290_4 = arg_287_1:FormatText(var_290_3.content)
			local var_290_5, var_290_6 = arg_287_1:GetPercentByPara(var_290_4, 6)

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0

				local var_290_7 = var_290_1 <= 0 and var_290_2 or var_290_2 * ((var_290_6 - arg_287_1.typewritterCharCountI18N) / var_290_1)

				if var_290_7 > 0 and var_290_2 < var_290_7 then
					arg_287_1.talkMaxDuration = var_290_7

					if var_290_7 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_7 + var_290_0
					end
				end
			end

			local var_290_8 = 0.866666666666667
			local var_290_9 = math.max(var_290_8, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_9 then
				local var_290_10 = (arg_287_1.time_ - var_290_0) / var_290_9

				arg_287_1.fswtw_.percent = Mathf.Lerp(arg_287_1.var_.oldValueTypewriter, var_290_5, var_290_10)
				arg_287_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_287_1.fswtw_:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_9 and arg_287_1.time_ < var_290_0 + var_290_9 + arg_290_0 then
				arg_287_1.fswtw_.percent = var_290_5

				arg_287_1.fswtw_:SetDirty()
				arg_287_1:ShowNextGo(true)

				arg_287_1.typewritterCharCountI18N = var_290_6
			end

			local var_290_11 = 0
			local var_290_12 = 1
			local var_290_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032072", "story_v_out_317032.awb") / 1000

			if var_290_13 > 0 and var_290_12 < var_290_13 and var_290_13 + var_290_11 > arg_287_1.duration_ then
				local var_290_14 = var_290_13

				arg_287_1.duration_ = var_290_13 + var_290_11
			end

			if var_290_11 < arg_287_1.time_ and arg_287_1.time_ <= var_290_11 + arg_290_0 then
				local var_290_15 = "play"
				local var_290_16 = "voice"

				arg_287_1:AudioAction(var_290_15, var_290_16, "story_v_out_317032", "317032072", "story_v_out_317032.awb")
			end
		end
	end,
	Play317032073 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 317032073
		arg_291_1.duration_ = 1.133333333332

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play317032074(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.var_.oldValueTypewriter = arg_291_1.fswtw_.percent

				arg_291_1:ShowNextGo(false)
			end

			local var_294_1 = 17
			local var_294_2 = 1.13333333333333
			local var_294_3 = arg_291_1:GetWordFromCfg(317032067)
			local var_294_4 = arg_291_1:FormatText(var_294_3.content)
			local var_294_5, var_294_6 = arg_291_1:GetPercentByPara(var_294_4, 7)

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0

				local var_294_7 = var_294_1 <= 0 and var_294_2 or var_294_2 * ((var_294_6 - arg_291_1.typewritterCharCountI18N) / var_294_1)

				if var_294_7 > 0 and var_294_2 < var_294_7 then
					arg_291_1.talkMaxDuration = var_294_7

					if var_294_7 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_7 + var_294_0
					end
				end
			end

			local var_294_8 = 1.13333333333333
			local var_294_9 = math.max(var_294_8, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_9 then
				local var_294_10 = (arg_291_1.time_ - var_294_0) / var_294_9

				arg_291_1.fswtw_.percent = Mathf.Lerp(arg_291_1.var_.oldValueTypewriter, var_294_5, var_294_10)
				arg_291_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_291_1.fswtw_:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_9 and arg_291_1.time_ < var_294_0 + var_294_9 + arg_294_0 then
				arg_291_1.fswtw_.percent = var_294_5

				arg_291_1.fswtw_:SetDirty()
				arg_291_1:ShowNextGo(true)

				arg_291_1.typewritterCharCountI18N = var_294_6
			end

			local var_294_11 = 0
			local var_294_12 = 1
			local var_294_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032073", "story_v_out_317032.awb") / 1000

			if var_294_13 > 0 and var_294_12 < var_294_13 and var_294_13 + var_294_11 > arg_291_1.duration_ then
				local var_294_14 = var_294_13

				arg_291_1.duration_ = var_294_13 + var_294_11
			end

			if var_294_11 < arg_291_1.time_ and arg_291_1.time_ <= var_294_11 + arg_294_0 then
				local var_294_15 = "play"
				local var_294_16 = "voice"

				arg_291_1:AudioAction(var_294_15, var_294_16, "story_v_out_317032", "317032073", "story_v_out_317032.awb")
			end
		end
	end,
	Play317032074 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 317032074
		arg_295_1.duration_ = 1.666666666666

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play317032075(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.var_.oldValueTypewriter = arg_295_1.fswtw_.percent

				arg_295_1:ShowNextGo(false)
			end

			local var_298_1 = 25
			local var_298_2 = 1.66666666666667
			local var_298_3 = arg_295_1:GetWordFromCfg(317032067)
			local var_298_4 = arg_295_1:FormatText(var_298_3.content)
			local var_298_5, var_298_6 = arg_295_1:GetPercentByPara(var_298_4, 8)

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0

				local var_298_7 = var_298_1 <= 0 and var_298_2 or var_298_2 * ((var_298_6 - arg_295_1.typewritterCharCountI18N) / var_298_1)

				if var_298_7 > 0 and var_298_2 < var_298_7 then
					arg_295_1.talkMaxDuration = var_298_7

					if var_298_7 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_7 + var_298_0
					end
				end
			end

			local var_298_8 = 1.66666666666667
			local var_298_9 = math.max(var_298_8, arg_295_1.talkMaxDuration)

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_0) / var_298_9

				arg_295_1.fswtw_.percent = Mathf.Lerp(arg_295_1.var_.oldValueTypewriter, var_298_5, var_298_10)
				arg_295_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_295_1.fswtw_:SetDirty()
			end

			if arg_295_1.time_ >= var_298_0 + var_298_9 and arg_295_1.time_ < var_298_0 + var_298_9 + arg_298_0 then
				arg_295_1.fswtw_.percent = var_298_5

				arg_295_1.fswtw_:SetDirty()
				arg_295_1:ShowNextGo(true)

				arg_295_1.typewritterCharCountI18N = var_298_6
			end

			local var_298_11 = 0
			local var_298_12 = 1
			local var_298_13 = manager.audio:GetVoiceLength("story_v_out_317032", "317032074", "story_v_out_317032.awb") / 1000

			if var_298_13 > 0 and var_298_12 < var_298_13 and var_298_13 + var_298_11 > arg_295_1.duration_ then
				local var_298_14 = var_298_13

				arg_295_1.duration_ = var_298_13 + var_298_11
			end

			if var_298_11 < arg_295_1.time_ and arg_295_1.time_ <= var_298_11 + arg_298_0 then
				local var_298_15 = "play"
				local var_298_16 = "voice"

				arg_295_1:AudioAction(var_298_15, var_298_16, "story_v_out_317032", "317032074", "story_v_out_317032.awb")
			end
		end
	end,
	Play317032075 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 317032075
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play317032076(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.fswbg_:SetActive(false)
				arg_299_1.dialog_:SetActive(true)
				arg_299_1:ShowNextGo(false)
			end

			local var_302_1 = 0
			local var_302_2 = 0.725

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(317032075)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 29
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_2 or var_302_2 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_2 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_1 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_1
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_8 = math.max(var_302_2, arg_299_1.talkMaxDuration)

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_8 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_1) / var_302_8

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_1 + var_302_8 and arg_299_1.time_ < var_302_1 + var_302_8 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play317032076 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 317032076
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play317032077(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 1.15

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

				local var_306_2 = arg_303_1:GetWordFromCfg(317032076)
				local var_306_3 = arg_303_1:FormatText(var_306_2.content)

				arg_303_1.text_.text = var_306_3

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_4 = 46
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
	Play317032077 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 317032077
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play317032078(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 0.775

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_2 = arg_307_1:GetWordFromCfg(317032077)
				local var_310_3 = arg_307_1:FormatText(var_310_2.content)

				arg_307_1.text_.text = var_310_3

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_4 = 31
				local var_310_5 = utf8.len(var_310_3)
				local var_310_6 = var_310_4 <= 0 and var_310_1 or var_310_1 * (var_310_5 / var_310_4)

				if var_310_6 > 0 and var_310_1 < var_310_6 then
					arg_307_1.talkMaxDuration = var_310_6

					if var_310_6 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_6 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_3
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_7 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_7 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_7

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_7 and arg_307_1.time_ < var_310_0 + var_310_7 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play317032078 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 317032078
		arg_311_1.duration_ = 4.5

		local var_311_0 = {
			zh = 4.5,
			ja = 4.333
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
				arg_311_0:Play317032079(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1015ui_story"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos1015ui_story = var_314_0.localPosition
			end

			local var_314_2 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2
				local var_314_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1015ui_story, var_314_4, var_314_3)

				local var_314_5 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_5.x, var_314_5.y, var_314_5.z)

				local var_314_6 = var_314_0.localEulerAngles

				var_314_6.z = 0
				var_314_6.x = 0
				var_314_0.localEulerAngles = var_314_6
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_314_7 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_7.x, var_314_7.y, var_314_7.z)

				local var_314_8 = var_314_0.localEulerAngles

				var_314_8.z = 0
				var_314_8.x = 0
				var_314_0.localEulerAngles = var_314_8
			end

			local var_314_9 = arg_311_1.actors_["1015ui_story"]
			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 and arg_311_1.var_.characterEffect1015ui_story == nil then
				arg_311_1.var_.characterEffect1015ui_story = var_314_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_11 = 0.200000002980232

			if var_314_10 <= arg_311_1.time_ and arg_311_1.time_ < var_314_10 + var_314_11 then
				local var_314_12 = (arg_311_1.time_ - var_314_10) / var_314_11

				if arg_311_1.var_.characterEffect1015ui_story then
					arg_311_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_10 + var_314_11 and arg_311_1.time_ < var_314_10 + var_314_11 + arg_314_0 and arg_311_1.var_.characterEffect1015ui_story then
				arg_311_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_314_13 = 0

			if var_314_13 < arg_311_1.time_ and arg_311_1.time_ <= var_314_13 + arg_314_0 then
				arg_311_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_314_15 = arg_311_1.actors_["2078ui_story"].transform
			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.var_.moveOldPos2078ui_story = var_314_15.localPosition
			end

			local var_314_17 = 0.001

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Vector3.New(0.7, -1.28, -5.6)

				var_314_15.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos2078ui_story, var_314_19, var_314_18)

				local var_314_20 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_20.x, var_314_20.y, var_314_20.z)

				local var_314_21 = var_314_15.localEulerAngles

				var_314_21.z = 0
				var_314_21.x = 0
				var_314_15.localEulerAngles = var_314_21
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				var_314_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_314_22 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_22.x, var_314_22.y, var_314_22.z)

				local var_314_23 = var_314_15.localEulerAngles

				var_314_23.z = 0
				var_314_23.x = 0
				var_314_15.localEulerAngles = var_314_23
			end

			local var_314_24 = arg_311_1.actors_["2078ui_story"]
			local var_314_25 = 0

			if var_314_25 < arg_311_1.time_ and arg_311_1.time_ <= var_314_25 + arg_314_0 and arg_311_1.var_.characterEffect2078ui_story == nil then
				arg_311_1.var_.characterEffect2078ui_story = var_314_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_26 = 0.200000002980232

			if var_314_25 <= arg_311_1.time_ and arg_311_1.time_ < var_314_25 + var_314_26 then
				local var_314_27 = (arg_311_1.time_ - var_314_25) / var_314_26

				if arg_311_1.var_.characterEffect2078ui_story then
					local var_314_28 = Mathf.Lerp(0, 0.5, var_314_27)

					arg_311_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_311_1.var_.characterEffect2078ui_story.fillRatio = var_314_28
				end
			end

			if arg_311_1.time_ >= var_314_25 + var_314_26 and arg_311_1.time_ < var_314_25 + var_314_26 + arg_314_0 and arg_311_1.var_.characterEffect2078ui_story then
				local var_314_29 = 0.5

				arg_311_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_311_1.var_.characterEffect2078ui_story.fillRatio = var_314_29
			end

			local var_314_30 = 0
			local var_314_31 = 0.45

			if var_314_30 < arg_311_1.time_ and arg_311_1.time_ <= var_314_30 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_32 = arg_311_1:FormatText(StoryNameCfg[479].name)

				arg_311_1.leftNameTxt_.text = var_314_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_33 = arg_311_1:GetWordFromCfg(317032078)
				local var_314_34 = arg_311_1:FormatText(var_314_33.content)

				arg_311_1.text_.text = var_314_34

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_35 = 17
				local var_314_36 = utf8.len(var_314_34)
				local var_314_37 = var_314_35 <= 0 and var_314_31 or var_314_31 * (var_314_36 / var_314_35)

				if var_314_37 > 0 and var_314_31 < var_314_37 then
					arg_311_1.talkMaxDuration = var_314_37

					if var_314_37 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_37 + var_314_30
					end
				end

				arg_311_1.text_.text = var_314_34
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032078", "story_v_out_317032.awb") ~= 0 then
					local var_314_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032078", "story_v_out_317032.awb") / 1000

					if var_314_38 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_38 + var_314_30
					end

					if var_314_33.prefab_name ~= "" and arg_311_1.actors_[var_314_33.prefab_name] ~= nil then
						local var_314_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_33.prefab_name].transform, "story_v_out_317032", "317032078", "story_v_out_317032.awb")

						arg_311_1:RecordAudio("317032078", var_314_39)
						arg_311_1:RecordAudio("317032078", var_314_39)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_317032", "317032078", "story_v_out_317032.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_317032", "317032078", "story_v_out_317032.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_40 = math.max(var_314_31, arg_311_1.talkMaxDuration)

			if var_314_30 <= arg_311_1.time_ and arg_311_1.time_ < var_314_30 + var_314_40 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_30) / var_314_40

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_30 + var_314_40 and arg_311_1.time_ < var_314_30 + var_314_40 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play317032079 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 317032079
		arg_315_1.duration_ = 3.2

		local var_315_0 = {
			zh = 3.066,
			ja = 3.2
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
				arg_315_0:Play317032080(arg_315_1)
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
				local var_318_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1015ui_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

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
					local var_318_13 = Mathf.Lerp(0, 0.5, var_318_12)

					arg_315_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1015ui_story.fillRatio = var_318_13
				end
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 and arg_315_1.var_.characterEffect1015ui_story then
				local var_318_14 = 0.5

				arg_315_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1015ui_story.fillRatio = var_318_14
			end

			local var_318_15 = arg_315_1.actors_["2078ui_story"].transform
			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.var_.moveOldPos2078ui_story = var_318_15.localPosition
			end

			local var_318_17 = 0.001

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_17 then
				local var_318_18 = (arg_315_1.time_ - var_318_16) / var_318_17
				local var_318_19 = Vector3.New(0.7, -1.28, -5.6)

				var_318_15.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos2078ui_story, var_318_19, var_318_18)

				local var_318_20 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_20.x, var_318_20.y, var_318_20.z)

				local var_318_21 = var_318_15.localEulerAngles

				var_318_21.z = 0
				var_318_21.x = 0
				var_318_15.localEulerAngles = var_318_21
			end

			if arg_315_1.time_ >= var_318_16 + var_318_17 and arg_315_1.time_ < var_318_16 + var_318_17 + arg_318_0 then
				var_318_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_318_22 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_22.x, var_318_22.y, var_318_22.z)

				local var_318_23 = var_318_15.localEulerAngles

				var_318_23.z = 0
				var_318_23.x = 0
				var_318_15.localEulerAngles = var_318_23
			end

			local var_318_24 = arg_315_1.actors_["2078ui_story"]
			local var_318_25 = 0

			if var_318_25 < arg_315_1.time_ and arg_315_1.time_ <= var_318_25 + arg_318_0 and arg_315_1.var_.characterEffect2078ui_story == nil then
				arg_315_1.var_.characterEffect2078ui_story = var_318_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_26 = 0.200000002980232

			if var_318_25 <= arg_315_1.time_ and arg_315_1.time_ < var_318_25 + var_318_26 then
				local var_318_27 = (arg_315_1.time_ - var_318_25) / var_318_26

				if arg_315_1.var_.characterEffect2078ui_story then
					arg_315_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_25 + var_318_26 and arg_315_1.time_ < var_318_25 + var_318_26 + arg_318_0 and arg_315_1.var_.characterEffect2078ui_story then
				arg_315_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_318_28 = 0

			if var_318_28 < arg_315_1.time_ and arg_315_1.time_ <= var_318_28 + arg_318_0 then
				arg_315_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_318_29 = 0

			if var_318_29 < arg_315_1.time_ and arg_315_1.time_ <= var_318_29 + arg_318_0 then
				arg_315_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_318_30 = 0
			local var_318_31 = 0.3

			if var_318_30 < arg_315_1.time_ and arg_315_1.time_ <= var_318_30 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_32 = arg_315_1:FormatText(StoryNameCfg[528].name)

				arg_315_1.leftNameTxt_.text = var_318_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_33 = arg_315_1:GetWordFromCfg(317032079)
				local var_318_34 = arg_315_1:FormatText(var_318_33.content)

				arg_315_1.text_.text = var_318_34

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_35 = 12
				local var_318_36 = utf8.len(var_318_34)
				local var_318_37 = var_318_35 <= 0 and var_318_31 or var_318_31 * (var_318_36 / var_318_35)

				if var_318_37 > 0 and var_318_31 < var_318_37 then
					arg_315_1.talkMaxDuration = var_318_37

					if var_318_37 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_37 + var_318_30
					end
				end

				arg_315_1.text_.text = var_318_34
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032079", "story_v_out_317032.awb") ~= 0 then
					local var_318_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032079", "story_v_out_317032.awb") / 1000

					if var_318_38 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_38 + var_318_30
					end

					if var_318_33.prefab_name ~= "" and arg_315_1.actors_[var_318_33.prefab_name] ~= nil then
						local var_318_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_33.prefab_name].transform, "story_v_out_317032", "317032079", "story_v_out_317032.awb")

						arg_315_1:RecordAudio("317032079", var_318_39)
						arg_315_1:RecordAudio("317032079", var_318_39)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_317032", "317032079", "story_v_out_317032.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_317032", "317032079", "story_v_out_317032.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_40 = math.max(var_318_31, arg_315_1.talkMaxDuration)

			if var_318_30 <= arg_315_1.time_ and arg_315_1.time_ < var_318_30 + var_318_40 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_30) / var_318_40

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_30 + var_318_40 and arg_315_1.time_ < var_318_30 + var_318_40 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play317032080 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 317032080
		arg_319_1.duration_ = 9.733

		local var_319_0 = {
			zh = 9.133,
			ja = 9.733
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
				arg_319_0:Play317032081(arg_319_1)
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
					arg_319_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1015ui_story then
				arg_319_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_322_4 = arg_319_1.actors_["2078ui_story"]
			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 and arg_319_1.var_.characterEffect2078ui_story == nil then
				arg_319_1.var_.characterEffect2078ui_story = var_322_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_6 = 0.200000002980232

			if var_322_5 <= arg_319_1.time_ and arg_319_1.time_ < var_322_5 + var_322_6 then
				local var_322_7 = (arg_319_1.time_ - var_322_5) / var_322_6

				if arg_319_1.var_.characterEffect2078ui_story then
					local var_322_8 = Mathf.Lerp(0, 0.5, var_322_7)

					arg_319_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_319_1.var_.characterEffect2078ui_story.fillRatio = var_322_8
				end
			end

			if arg_319_1.time_ >= var_322_5 + var_322_6 and arg_319_1.time_ < var_322_5 + var_322_6 + arg_322_0 and arg_319_1.var_.characterEffect2078ui_story then
				local var_322_9 = 0.5

				arg_319_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_319_1.var_.characterEffect2078ui_story.fillRatio = var_322_9
			end

			local var_322_10 = 0
			local var_322_11 = 0.95

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_12 = arg_319_1:FormatText(StoryNameCfg[479].name)

				arg_319_1.leftNameTxt_.text = var_322_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_13 = arg_319_1:GetWordFromCfg(317032080)
				local var_322_14 = arg_319_1:FormatText(var_322_13.content)

				arg_319_1.text_.text = var_322_14

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_15 = 38
				local var_322_16 = utf8.len(var_322_14)
				local var_322_17 = var_322_15 <= 0 and var_322_11 or var_322_11 * (var_322_16 / var_322_15)

				if var_322_17 > 0 and var_322_11 < var_322_17 then
					arg_319_1.talkMaxDuration = var_322_17

					if var_322_17 + var_322_10 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_17 + var_322_10
					end
				end

				arg_319_1.text_.text = var_322_14
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032080", "story_v_out_317032.awb") ~= 0 then
					local var_322_18 = manager.audio:GetVoiceLength("story_v_out_317032", "317032080", "story_v_out_317032.awb") / 1000

					if var_322_18 + var_322_10 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_18 + var_322_10
					end

					if var_322_13.prefab_name ~= "" and arg_319_1.actors_[var_322_13.prefab_name] ~= nil then
						local var_322_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_13.prefab_name].transform, "story_v_out_317032", "317032080", "story_v_out_317032.awb")

						arg_319_1:RecordAudio("317032080", var_322_19)
						arg_319_1:RecordAudio("317032080", var_322_19)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_317032", "317032080", "story_v_out_317032.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_317032", "317032080", "story_v_out_317032.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_20 = math.max(var_322_11, arg_319_1.talkMaxDuration)

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_20 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_10) / var_322_20

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_10 + var_322_20 and arg_319_1.time_ < var_322_10 + var_322_20 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play317032081 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 317032081
		arg_323_1.duration_ = 2.966

		local var_323_0 = {
			zh = 1.1,
			ja = 2.966
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
				arg_323_0:Play317032082(arg_323_1)
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
				local var_326_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1015ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = arg_323_1.actors_["1015ui_story"]
			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 and arg_323_1.var_.characterEffect1015ui_story == nil then
				arg_323_1.var_.characterEffect1015ui_story = var_326_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_11 = 0.200000002980232

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_11 then
				local var_326_12 = (arg_323_1.time_ - var_326_10) / var_326_11

				if arg_323_1.var_.characterEffect1015ui_story then
					local var_326_13 = Mathf.Lerp(0, 0.5, var_326_12)

					arg_323_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1015ui_story.fillRatio = var_326_13
				end
			end

			if arg_323_1.time_ >= var_326_10 + var_326_11 and arg_323_1.time_ < var_326_10 + var_326_11 + arg_326_0 and arg_323_1.var_.characterEffect1015ui_story then
				local var_326_14 = 0.5

				arg_323_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1015ui_story.fillRatio = var_326_14
			end

			local var_326_15 = arg_323_1.actors_["2078ui_story"].transform
			local var_326_16 = 0

			if var_326_16 < arg_323_1.time_ and arg_323_1.time_ <= var_326_16 + arg_326_0 then
				arg_323_1.var_.moveOldPos2078ui_story = var_326_15.localPosition
			end

			local var_326_17 = 0.001

			if var_326_16 <= arg_323_1.time_ and arg_323_1.time_ < var_326_16 + var_326_17 then
				local var_326_18 = (arg_323_1.time_ - var_326_16) / var_326_17
				local var_326_19 = Vector3.New(0.7, -1.28, -5.6)

				var_326_15.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos2078ui_story, var_326_19, var_326_18)

				local var_326_20 = manager.ui.mainCamera.transform.position - var_326_15.position

				var_326_15.forward = Vector3.New(var_326_20.x, var_326_20.y, var_326_20.z)

				local var_326_21 = var_326_15.localEulerAngles

				var_326_21.z = 0
				var_326_21.x = 0
				var_326_15.localEulerAngles = var_326_21
			end

			if arg_323_1.time_ >= var_326_16 + var_326_17 and arg_323_1.time_ < var_326_16 + var_326_17 + arg_326_0 then
				var_326_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_326_22 = manager.ui.mainCamera.transform.position - var_326_15.position

				var_326_15.forward = Vector3.New(var_326_22.x, var_326_22.y, var_326_22.z)

				local var_326_23 = var_326_15.localEulerAngles

				var_326_23.z = 0
				var_326_23.x = 0
				var_326_15.localEulerAngles = var_326_23
			end

			local var_326_24 = arg_323_1.actors_["2078ui_story"]
			local var_326_25 = 0

			if var_326_25 < arg_323_1.time_ and arg_323_1.time_ <= var_326_25 + arg_326_0 and arg_323_1.var_.characterEffect2078ui_story == nil then
				arg_323_1.var_.characterEffect2078ui_story = var_326_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_26 = 0.200000002980232

			if var_326_25 <= arg_323_1.time_ and arg_323_1.time_ < var_326_25 + var_326_26 then
				local var_326_27 = (arg_323_1.time_ - var_326_25) / var_326_26

				if arg_323_1.var_.characterEffect2078ui_story then
					arg_323_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_25 + var_326_26 and arg_323_1.time_ < var_326_25 + var_326_26 + arg_326_0 and arg_323_1.var_.characterEffect2078ui_story then
				arg_323_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_326_28 = 0

			if var_326_28 < arg_323_1.time_ and arg_323_1.time_ <= var_326_28 + arg_326_0 then
				arg_323_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_326_29 = 0

			if var_326_29 < arg_323_1.time_ and arg_323_1.time_ <= var_326_29 + arg_326_0 then
				arg_323_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_326_30 = 0
			local var_326_31 = 0.075

			if var_326_30 < arg_323_1.time_ and arg_323_1.time_ <= var_326_30 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_32 = arg_323_1:FormatText(StoryNameCfg[528].name)

				arg_323_1.leftNameTxt_.text = var_326_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_33 = arg_323_1:GetWordFromCfg(317032081)
				local var_326_34 = arg_323_1:FormatText(var_326_33.content)

				arg_323_1.text_.text = var_326_34

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_35 = 3
				local var_326_36 = utf8.len(var_326_34)
				local var_326_37 = var_326_35 <= 0 and var_326_31 or var_326_31 * (var_326_36 / var_326_35)

				if var_326_37 > 0 and var_326_31 < var_326_37 then
					arg_323_1.talkMaxDuration = var_326_37

					if var_326_37 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_37 + var_326_30
					end
				end

				arg_323_1.text_.text = var_326_34
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032081", "story_v_out_317032.awb") ~= 0 then
					local var_326_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032081", "story_v_out_317032.awb") / 1000

					if var_326_38 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_38 + var_326_30
					end

					if var_326_33.prefab_name ~= "" and arg_323_1.actors_[var_326_33.prefab_name] ~= nil then
						local var_326_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_33.prefab_name].transform, "story_v_out_317032", "317032081", "story_v_out_317032.awb")

						arg_323_1:RecordAudio("317032081", var_326_39)
						arg_323_1:RecordAudio("317032081", var_326_39)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_317032", "317032081", "story_v_out_317032.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_317032", "317032081", "story_v_out_317032.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_40 = math.max(var_326_31, arg_323_1.talkMaxDuration)

			if var_326_30 <= arg_323_1.time_ and arg_323_1.time_ < var_326_30 + var_326_40 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_30) / var_326_40

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_30 + var_326_40 and arg_323_1.time_ < var_326_30 + var_326_40 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play317032082 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 317032082
		arg_327_1.duration_ = 11.1

		local var_327_0 = {
			zh = 7.866,
			ja = 11.1
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
				arg_327_0:Play317032083(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1015ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1015ui_story == nil then
				arg_327_1.var_.characterEffect1015ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1015ui_story then
					arg_327_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1015ui_story then
				arg_327_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_330_4 = arg_327_1.actors_["2078ui_story"]
			local var_330_5 = 0

			if var_330_5 < arg_327_1.time_ and arg_327_1.time_ <= var_330_5 + arg_330_0 and arg_327_1.var_.characterEffect2078ui_story == nil then
				arg_327_1.var_.characterEffect2078ui_story = var_330_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_6 = 0.200000002980232

			if var_330_5 <= arg_327_1.time_ and arg_327_1.time_ < var_330_5 + var_330_6 then
				local var_330_7 = (arg_327_1.time_ - var_330_5) / var_330_6

				if arg_327_1.var_.characterEffect2078ui_story then
					local var_330_8 = Mathf.Lerp(0, 0.5, var_330_7)

					arg_327_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_327_1.var_.characterEffect2078ui_story.fillRatio = var_330_8
				end
			end

			if arg_327_1.time_ >= var_330_5 + var_330_6 and arg_327_1.time_ < var_330_5 + var_330_6 + arg_330_0 and arg_327_1.var_.characterEffect2078ui_story then
				local var_330_9 = 0.5

				arg_327_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_327_1.var_.characterEffect2078ui_story.fillRatio = var_330_9
			end

			local var_330_10 = 0
			local var_330_11 = 0.925

			if var_330_10 < arg_327_1.time_ and arg_327_1.time_ <= var_330_10 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_12 = arg_327_1:FormatText(StoryNameCfg[479].name)

				arg_327_1.leftNameTxt_.text = var_330_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_13 = arg_327_1:GetWordFromCfg(317032082)
				local var_330_14 = arg_327_1:FormatText(var_330_13.content)

				arg_327_1.text_.text = var_330_14

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_15 = 37
				local var_330_16 = utf8.len(var_330_14)
				local var_330_17 = var_330_15 <= 0 and var_330_11 or var_330_11 * (var_330_16 / var_330_15)

				if var_330_17 > 0 and var_330_11 < var_330_17 then
					arg_327_1.talkMaxDuration = var_330_17

					if var_330_17 + var_330_10 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_17 + var_330_10
					end
				end

				arg_327_1.text_.text = var_330_14
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032082", "story_v_out_317032.awb") ~= 0 then
					local var_330_18 = manager.audio:GetVoiceLength("story_v_out_317032", "317032082", "story_v_out_317032.awb") / 1000

					if var_330_18 + var_330_10 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_18 + var_330_10
					end

					if var_330_13.prefab_name ~= "" and arg_327_1.actors_[var_330_13.prefab_name] ~= nil then
						local var_330_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_13.prefab_name].transform, "story_v_out_317032", "317032082", "story_v_out_317032.awb")

						arg_327_1:RecordAudio("317032082", var_330_19)
						arg_327_1:RecordAudio("317032082", var_330_19)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_317032", "317032082", "story_v_out_317032.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_317032", "317032082", "story_v_out_317032.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_20 = math.max(var_330_11, arg_327_1.talkMaxDuration)

			if var_330_10 <= arg_327_1.time_ and arg_327_1.time_ < var_330_10 + var_330_20 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_10) / var_330_20

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_10 + var_330_20 and arg_327_1.time_ < var_330_10 + var_330_20 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play317032083 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 317032083
		arg_331_1.duration_ = 10.366

		local var_331_0 = {
			zh = 8.5,
			ja = 10.366
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
				arg_331_0:Play317032084(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1015ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1015ui_story == nil then
				arg_331_1.var_.characterEffect1015ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1015ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1015ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1015ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1015ui_story.fillRatio = var_334_5
			end

			local var_334_6 = arg_331_1.actors_["2078ui_story"]
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 and arg_331_1.var_.characterEffect2078ui_story == nil then
				arg_331_1.var_.characterEffect2078ui_story = var_334_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_8 = 0.200000002980232

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8

				if arg_331_1.var_.characterEffect2078ui_story then
					arg_331_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 and arg_331_1.var_.characterEffect2078ui_story then
				arg_331_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_334_10 = 0
			local var_334_11 = 1.175

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_12 = arg_331_1:FormatText(StoryNameCfg[528].name)

				arg_331_1.leftNameTxt_.text = var_334_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_13 = arg_331_1:GetWordFromCfg(317032083)
				local var_334_14 = arg_331_1:FormatText(var_334_13.content)

				arg_331_1.text_.text = var_334_14

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_15 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032083", "story_v_out_317032.awb") ~= 0 then
					local var_334_18 = manager.audio:GetVoiceLength("story_v_out_317032", "317032083", "story_v_out_317032.awb") / 1000

					if var_334_18 + var_334_10 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_18 + var_334_10
					end

					if var_334_13.prefab_name ~= "" and arg_331_1.actors_[var_334_13.prefab_name] ~= nil then
						local var_334_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_13.prefab_name].transform, "story_v_out_317032", "317032083", "story_v_out_317032.awb")

						arg_331_1:RecordAudio("317032083", var_334_19)
						arg_331_1:RecordAudio("317032083", var_334_19)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_317032", "317032083", "story_v_out_317032.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_317032", "317032083", "story_v_out_317032.awb")
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
	Play317032084 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 317032084
		arg_335_1.duration_ = 4.2

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play317032085(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1015ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1015ui_story == nil then
				arg_335_1.var_.characterEffect1015ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1015ui_story then
					arg_335_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1015ui_story then
				arg_335_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_338_4 = 0

			if var_338_4 < arg_335_1.time_ and arg_335_1.time_ <= var_338_4 + arg_338_0 then
				arg_335_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_338_5 = arg_335_1.actors_["2078ui_story"]
			local var_338_6 = 0

			if var_338_6 < arg_335_1.time_ and arg_335_1.time_ <= var_338_6 + arg_338_0 and arg_335_1.var_.characterEffect2078ui_story == nil then
				arg_335_1.var_.characterEffect2078ui_story = var_338_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_7 = 0.200000002980232

			if var_338_6 <= arg_335_1.time_ and arg_335_1.time_ < var_338_6 + var_338_7 then
				local var_338_8 = (arg_335_1.time_ - var_338_6) / var_338_7

				if arg_335_1.var_.characterEffect2078ui_story then
					local var_338_9 = Mathf.Lerp(0, 0.5, var_338_8)

					arg_335_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_335_1.var_.characterEffect2078ui_story.fillRatio = var_338_9
				end
			end

			if arg_335_1.time_ >= var_338_6 + var_338_7 and arg_335_1.time_ < var_338_6 + var_338_7 + arg_338_0 and arg_335_1.var_.characterEffect2078ui_story then
				local var_338_10 = 0.5

				arg_335_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_335_1.var_.characterEffect2078ui_story.fillRatio = var_338_10
			end

			local var_338_11 = 0
			local var_338_12 = 0.325

			if var_338_11 < arg_335_1.time_ and arg_335_1.time_ <= var_338_11 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_13 = arg_335_1:FormatText(StoryNameCfg[479].name)

				arg_335_1.leftNameTxt_.text = var_338_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_14 = arg_335_1:GetWordFromCfg(317032084)
				local var_338_15 = arg_335_1:FormatText(var_338_14.content)

				arg_335_1.text_.text = var_338_15

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_16 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032084", "story_v_out_317032.awb") ~= 0 then
					local var_338_19 = manager.audio:GetVoiceLength("story_v_out_317032", "317032084", "story_v_out_317032.awb") / 1000

					if var_338_19 + var_338_11 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_19 + var_338_11
					end

					if var_338_14.prefab_name ~= "" and arg_335_1.actors_[var_338_14.prefab_name] ~= nil then
						local var_338_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_14.prefab_name].transform, "story_v_out_317032", "317032084", "story_v_out_317032.awb")

						arg_335_1:RecordAudio("317032084", var_338_20)
						arg_335_1:RecordAudio("317032084", var_338_20)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_317032", "317032084", "story_v_out_317032.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_317032", "317032084", "story_v_out_317032.awb")
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
	Play317032085 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 317032085
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play317032086(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1015ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1015ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0, 100, 0)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1015ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, 100, 0)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["2078ui_story"].transform
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 then
				arg_339_1.var_.moveOldPos2078ui_story = var_342_9.localPosition
			end

			local var_342_11 = 0.001

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11
				local var_342_13 = Vector3.New(0, 100, 0)

				var_342_9.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos2078ui_story, var_342_13, var_342_12)

				local var_342_14 = manager.ui.mainCamera.transform.position - var_342_9.position

				var_342_9.forward = Vector3.New(var_342_14.x, var_342_14.y, var_342_14.z)

				local var_342_15 = var_342_9.localEulerAngles

				var_342_15.z = 0
				var_342_15.x = 0
				var_342_9.localEulerAngles = var_342_15
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 then
				var_342_9.localPosition = Vector3.New(0, 100, 0)

				local var_342_16 = manager.ui.mainCamera.transform.position - var_342_9.position

				var_342_9.forward = Vector3.New(var_342_16.x, var_342_16.y, var_342_16.z)

				local var_342_17 = var_342_9.localEulerAngles

				var_342_17.z = 0
				var_342_17.x = 0
				var_342_9.localEulerAngles = var_342_17
			end

			local var_342_18 = 0
			local var_342_19 = 0.45

			if var_342_18 < arg_339_1.time_ and arg_339_1.time_ <= var_342_18 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, false)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_20 = arg_339_1:GetWordFromCfg(317032085)
				local var_342_21 = arg_339_1:FormatText(var_342_20.content)

				arg_339_1.text_.text = var_342_21

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_22 = 18
				local var_342_23 = utf8.len(var_342_21)
				local var_342_24 = var_342_22 <= 0 and var_342_19 or var_342_19 * (var_342_23 / var_342_22)

				if var_342_24 > 0 and var_342_19 < var_342_24 then
					arg_339_1.talkMaxDuration = var_342_24

					if var_342_24 + var_342_18 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_24 + var_342_18
					end
				end

				arg_339_1.text_.text = var_342_21
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_25 = math.max(var_342_19, arg_339_1.talkMaxDuration)

			if var_342_18 <= arg_339_1.time_ and arg_339_1.time_ < var_342_18 + var_342_25 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_18) / var_342_25

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_18 + var_342_25 and arg_339_1.time_ < var_342_18 + var_342_25 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play317032086 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 317032086
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play317032087(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 0.25

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_2 = arg_343_1:FormatText(StoryNameCfg[7].name)

				arg_343_1.leftNameTxt_.text = var_346_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_3 = arg_343_1:GetWordFromCfg(317032086)
				local var_346_4 = arg_343_1:FormatText(var_346_3.content)

				arg_343_1.text_.text = var_346_4

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_5 = 10
				local var_346_6 = utf8.len(var_346_4)
				local var_346_7 = var_346_5 <= 0 and var_346_1 or var_346_1 * (var_346_6 / var_346_5)

				if var_346_7 > 0 and var_346_1 < var_346_7 then
					arg_343_1.talkMaxDuration = var_346_7

					if var_346_7 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_7 + var_346_0
					end
				end

				arg_343_1.text_.text = var_346_4
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_8 = math.max(var_346_1, arg_343_1.talkMaxDuration)

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_8 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_0) / var_346_8

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_0 + var_346_8 and arg_343_1.time_ < var_346_0 + var_346_8 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play317032087 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 317032087
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play317032088(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 1.175

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[7].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(317032087)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 47
				local var_350_6 = utf8.len(var_350_4)
				local var_350_7 = var_350_5 <= 0 and var_350_1 or var_350_1 * (var_350_6 / var_350_5)

				if var_350_7 > 0 and var_350_1 < var_350_7 then
					arg_347_1.talkMaxDuration = var_350_7

					if var_350_7 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_7 + var_350_0
					end
				end

				arg_347_1.text_.text = var_350_4
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_8 = math.max(var_350_1, arg_347_1.talkMaxDuration)

			if var_350_0 <= arg_347_1.time_ and arg_347_1.time_ < var_350_0 + var_350_8 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_0) / var_350_8

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_0 + var_350_8 and arg_347_1.time_ < var_350_0 + var_350_8 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play317032088 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 317032088
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play317032089(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 0.2

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_2 = arg_351_1:FormatText(StoryNameCfg[7].name)

				arg_351_1.leftNameTxt_.text = var_354_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_3 = arg_351_1:GetWordFromCfg(317032088)
				local var_354_4 = arg_351_1:FormatText(var_354_3.content)

				arg_351_1.text_.text = var_354_4

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_5 = 8
				local var_354_6 = utf8.len(var_354_4)
				local var_354_7 = var_354_5 <= 0 and var_354_1 or var_354_1 * (var_354_6 / var_354_5)

				if var_354_7 > 0 and var_354_1 < var_354_7 then
					arg_351_1.talkMaxDuration = var_354_7

					if var_354_7 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_7 + var_354_0
					end
				end

				arg_351_1.text_.text = var_354_4
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_8 = math.max(var_354_1, arg_351_1.talkMaxDuration)

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_8 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_0) / var_354_8

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_0 + var_354_8 and arg_351_1.time_ < var_354_0 + var_354_8 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play317032089 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 317032089
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play317032090(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.5

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_2 = arg_355_1:GetWordFromCfg(317032089)
				local var_358_3 = arg_355_1:FormatText(var_358_2.content)

				arg_355_1.text_.text = var_358_3

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_4 = 20
				local var_358_5 = utf8.len(var_358_3)
				local var_358_6 = var_358_4 <= 0 and var_358_1 or var_358_1 * (var_358_5 / var_358_4)

				if var_358_6 > 0 and var_358_1 < var_358_6 then
					arg_355_1.talkMaxDuration = var_358_6

					if var_358_6 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_6 + var_358_0
					end
				end

				arg_355_1.text_.text = var_358_3
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_7 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_7 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_7

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_7 and arg_355_1.time_ < var_358_0 + var_358_7 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play317032090 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 317032090
		arg_359_1.duration_ = 9.1

		local var_359_0 = {
			zh = 9.1,
			ja = 7.8
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
				arg_359_0:Play317032091(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1015ui_story"].transform
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				arg_359_1.var_.moveOldPos1015ui_story = var_362_0.localPosition
			end

			local var_362_2 = 0.001

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2
				local var_362_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_362_0.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1015ui_story, var_362_4, var_362_3)

				local var_362_5 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_5.x, var_362_5.y, var_362_5.z)

				local var_362_6 = var_362_0.localEulerAngles

				var_362_6.z = 0
				var_362_6.x = 0
				var_362_0.localEulerAngles = var_362_6
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 then
				var_362_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_362_7 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_7.x, var_362_7.y, var_362_7.z)

				local var_362_8 = var_362_0.localEulerAngles

				var_362_8.z = 0
				var_362_8.x = 0
				var_362_0.localEulerAngles = var_362_8
			end

			local var_362_9 = arg_359_1.actors_["1015ui_story"]
			local var_362_10 = 0

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 and arg_359_1.var_.characterEffect1015ui_story == nil then
				arg_359_1.var_.characterEffect1015ui_story = var_362_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_11 = 0.200000002980232

			if var_362_10 <= arg_359_1.time_ and arg_359_1.time_ < var_362_10 + var_362_11 then
				local var_362_12 = (arg_359_1.time_ - var_362_10) / var_362_11

				if arg_359_1.var_.characterEffect1015ui_story then
					arg_359_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_10 + var_362_11 and arg_359_1.time_ < var_362_10 + var_362_11 + arg_362_0 and arg_359_1.var_.characterEffect1015ui_story then
				arg_359_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_362_13 = 0

			if var_362_13 < arg_359_1.time_ and arg_359_1.time_ <= var_362_13 + arg_362_0 then
				arg_359_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_362_14 = 0

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 then
				arg_359_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_362_15 = arg_359_1.actors_["2078ui_story"].transform
			local var_362_16 = 0

			if var_362_16 < arg_359_1.time_ and arg_359_1.time_ <= var_362_16 + arg_362_0 then
				arg_359_1.var_.moveOldPos2078ui_story = var_362_15.localPosition
			end

			local var_362_17 = 0.001

			if var_362_16 <= arg_359_1.time_ and arg_359_1.time_ < var_362_16 + var_362_17 then
				local var_362_18 = (arg_359_1.time_ - var_362_16) / var_362_17
				local var_362_19 = Vector3.New(0.7, -1.28, -5.6)

				var_362_15.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos2078ui_story, var_362_19, var_362_18)

				local var_362_20 = manager.ui.mainCamera.transform.position - var_362_15.position

				var_362_15.forward = Vector3.New(var_362_20.x, var_362_20.y, var_362_20.z)

				local var_362_21 = var_362_15.localEulerAngles

				var_362_21.z = 0
				var_362_21.x = 0
				var_362_15.localEulerAngles = var_362_21
			end

			if arg_359_1.time_ >= var_362_16 + var_362_17 and arg_359_1.time_ < var_362_16 + var_362_17 + arg_362_0 then
				var_362_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_362_22 = manager.ui.mainCamera.transform.position - var_362_15.position

				var_362_15.forward = Vector3.New(var_362_22.x, var_362_22.y, var_362_22.z)

				local var_362_23 = var_362_15.localEulerAngles

				var_362_23.z = 0
				var_362_23.x = 0
				var_362_15.localEulerAngles = var_362_23
			end

			local var_362_24 = arg_359_1.actors_["2078ui_story"]
			local var_362_25 = 0

			if var_362_25 < arg_359_1.time_ and arg_359_1.time_ <= var_362_25 + arg_362_0 and arg_359_1.var_.characterEffect2078ui_story == nil then
				arg_359_1.var_.characterEffect2078ui_story = var_362_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_26 = 0.200000002980232

			if var_362_25 <= arg_359_1.time_ and arg_359_1.time_ < var_362_25 + var_362_26 then
				local var_362_27 = (arg_359_1.time_ - var_362_25) / var_362_26

				if arg_359_1.var_.characterEffect2078ui_story then
					local var_362_28 = Mathf.Lerp(0, 0.5, var_362_27)

					arg_359_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_359_1.var_.characterEffect2078ui_story.fillRatio = var_362_28
				end
			end

			if arg_359_1.time_ >= var_362_25 + var_362_26 and arg_359_1.time_ < var_362_25 + var_362_26 + arg_362_0 and arg_359_1.var_.characterEffect2078ui_story then
				local var_362_29 = 0.5

				arg_359_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_359_1.var_.characterEffect2078ui_story.fillRatio = var_362_29
			end

			local var_362_30 = 0
			local var_362_31 = 0.975

			if var_362_30 < arg_359_1.time_ and arg_359_1.time_ <= var_362_30 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_32 = arg_359_1:FormatText(StoryNameCfg[479].name)

				arg_359_1.leftNameTxt_.text = var_362_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_33 = arg_359_1:GetWordFromCfg(317032090)
				local var_362_34 = arg_359_1:FormatText(var_362_33.content)

				arg_359_1.text_.text = var_362_34

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_35 = 40
				local var_362_36 = utf8.len(var_362_34)
				local var_362_37 = var_362_35 <= 0 and var_362_31 or var_362_31 * (var_362_36 / var_362_35)

				if var_362_37 > 0 and var_362_31 < var_362_37 then
					arg_359_1.talkMaxDuration = var_362_37

					if var_362_37 + var_362_30 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_37 + var_362_30
					end
				end

				arg_359_1.text_.text = var_362_34
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032090", "story_v_out_317032.awb") ~= 0 then
					local var_362_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032090", "story_v_out_317032.awb") / 1000

					if var_362_38 + var_362_30 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_38 + var_362_30
					end

					if var_362_33.prefab_name ~= "" and arg_359_1.actors_[var_362_33.prefab_name] ~= nil then
						local var_362_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_33.prefab_name].transform, "story_v_out_317032", "317032090", "story_v_out_317032.awb")

						arg_359_1:RecordAudio("317032090", var_362_39)
						arg_359_1:RecordAudio("317032090", var_362_39)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_317032", "317032090", "story_v_out_317032.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_317032", "317032090", "story_v_out_317032.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_40 = math.max(var_362_31, arg_359_1.talkMaxDuration)

			if var_362_30 <= arg_359_1.time_ and arg_359_1.time_ < var_362_30 + var_362_40 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_30) / var_362_40

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_30 + var_362_40 and arg_359_1.time_ < var_362_30 + var_362_40 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play317032091 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 317032091
		arg_363_1.duration_ = 2.6

		local var_363_0 = {
			zh = 1.3,
			ja = 2.6
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
				arg_363_0:Play317032092(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1015ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect1015ui_story == nil then
				arg_363_1.var_.characterEffect1015ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1015ui_story then
					local var_366_4 = Mathf.Lerp(0, 0.5, var_366_3)

					arg_363_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1015ui_story.fillRatio = var_366_4
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect1015ui_story then
				local var_366_5 = 0.5

				arg_363_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1015ui_story.fillRatio = var_366_5
			end

			local var_366_6 = arg_363_1.actors_["2078ui_story"]
			local var_366_7 = 0

			if var_366_7 < arg_363_1.time_ and arg_363_1.time_ <= var_366_7 + arg_366_0 and arg_363_1.var_.characterEffect2078ui_story == nil then
				arg_363_1.var_.characterEffect2078ui_story = var_366_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_8 = 0.200000002980232

			if var_366_7 <= arg_363_1.time_ and arg_363_1.time_ < var_366_7 + var_366_8 then
				local var_366_9 = (arg_363_1.time_ - var_366_7) / var_366_8

				if arg_363_1.var_.characterEffect2078ui_story then
					arg_363_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_7 + var_366_8 and arg_363_1.time_ < var_366_7 + var_366_8 + arg_366_0 and arg_363_1.var_.characterEffect2078ui_story then
				arg_363_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_366_10 = 0
			local var_366_11 = 0.125

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_12 = arg_363_1:FormatText(StoryNameCfg[528].name)

				arg_363_1.leftNameTxt_.text = var_366_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_13 = arg_363_1:GetWordFromCfg(317032091)
				local var_366_14 = arg_363_1:FormatText(var_366_13.content)

				arg_363_1.text_.text = var_366_14

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_15 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032091", "story_v_out_317032.awb") ~= 0 then
					local var_366_18 = manager.audio:GetVoiceLength("story_v_out_317032", "317032091", "story_v_out_317032.awb") / 1000

					if var_366_18 + var_366_10 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_10
					end

					if var_366_13.prefab_name ~= "" and arg_363_1.actors_[var_366_13.prefab_name] ~= nil then
						local var_366_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_13.prefab_name].transform, "story_v_out_317032", "317032091", "story_v_out_317032.awb")

						arg_363_1:RecordAudio("317032091", var_366_19)
						arg_363_1:RecordAudio("317032091", var_366_19)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_317032", "317032091", "story_v_out_317032.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_317032", "317032091", "story_v_out_317032.awb")
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
	Play317032092 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 317032092
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play317032093(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1015ui_story"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos1015ui_story = var_370_0.localPosition
			end

			local var_370_2 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2
				local var_370_4 = Vector3.New(0, 100, 0)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1015ui_story, var_370_4, var_370_3)

				local var_370_5 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_5.x, var_370_5.y, var_370_5.z)

				local var_370_6 = var_370_0.localEulerAngles

				var_370_6.z = 0
				var_370_6.x = 0
				var_370_0.localEulerAngles = var_370_6
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(0, 100, 0)

				local var_370_7 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_7.x, var_370_7.y, var_370_7.z)

				local var_370_8 = var_370_0.localEulerAngles

				var_370_8.z = 0
				var_370_8.x = 0
				var_370_0.localEulerAngles = var_370_8
			end

			local var_370_9 = arg_367_1.actors_["1015ui_story"]
			local var_370_10 = 0

			if var_370_10 < arg_367_1.time_ and arg_367_1.time_ <= var_370_10 + arg_370_0 and arg_367_1.var_.characterEffect1015ui_story == nil then
				arg_367_1.var_.characterEffect1015ui_story = var_370_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_11 = 0.200000002980232

			if var_370_10 <= arg_367_1.time_ and arg_367_1.time_ < var_370_10 + var_370_11 then
				local var_370_12 = (arg_367_1.time_ - var_370_10) / var_370_11

				if arg_367_1.var_.characterEffect1015ui_story then
					local var_370_13 = Mathf.Lerp(0, 0.5, var_370_12)

					arg_367_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1015ui_story.fillRatio = var_370_13
				end
			end

			if arg_367_1.time_ >= var_370_10 + var_370_11 and arg_367_1.time_ < var_370_10 + var_370_11 + arg_370_0 and arg_367_1.var_.characterEffect1015ui_story then
				local var_370_14 = 0.5

				arg_367_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1015ui_story.fillRatio = var_370_14
			end

			local var_370_15 = arg_367_1.actors_["2078ui_story"].transform
			local var_370_16 = 0

			if var_370_16 < arg_367_1.time_ and arg_367_1.time_ <= var_370_16 + arg_370_0 then
				arg_367_1.var_.moveOldPos2078ui_story = var_370_15.localPosition
			end

			local var_370_17 = 0.001

			if var_370_16 <= arg_367_1.time_ and arg_367_1.time_ < var_370_16 + var_370_17 then
				local var_370_18 = (arg_367_1.time_ - var_370_16) / var_370_17
				local var_370_19 = Vector3.New(0, 100, 0)

				var_370_15.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos2078ui_story, var_370_19, var_370_18)

				local var_370_20 = manager.ui.mainCamera.transform.position - var_370_15.position

				var_370_15.forward = Vector3.New(var_370_20.x, var_370_20.y, var_370_20.z)

				local var_370_21 = var_370_15.localEulerAngles

				var_370_21.z = 0
				var_370_21.x = 0
				var_370_15.localEulerAngles = var_370_21
			end

			if arg_367_1.time_ >= var_370_16 + var_370_17 and arg_367_1.time_ < var_370_16 + var_370_17 + arg_370_0 then
				var_370_15.localPosition = Vector3.New(0, 100, 0)

				local var_370_22 = manager.ui.mainCamera.transform.position - var_370_15.position

				var_370_15.forward = Vector3.New(var_370_22.x, var_370_22.y, var_370_22.z)

				local var_370_23 = var_370_15.localEulerAngles

				var_370_23.z = 0
				var_370_23.x = 0
				var_370_15.localEulerAngles = var_370_23
			end

			local var_370_24 = arg_367_1.actors_["2078ui_story"]
			local var_370_25 = 0

			if var_370_25 < arg_367_1.time_ and arg_367_1.time_ <= var_370_25 + arg_370_0 and arg_367_1.var_.characterEffect2078ui_story == nil then
				arg_367_1.var_.characterEffect2078ui_story = var_370_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_26 = 0.200000002980232

			if var_370_25 <= arg_367_1.time_ and arg_367_1.time_ < var_370_25 + var_370_26 then
				local var_370_27 = (arg_367_1.time_ - var_370_25) / var_370_26

				if arg_367_1.var_.characterEffect2078ui_story then
					local var_370_28 = Mathf.Lerp(0, 0.5, var_370_27)

					arg_367_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_367_1.var_.characterEffect2078ui_story.fillRatio = var_370_28
				end
			end

			if arg_367_1.time_ >= var_370_25 + var_370_26 and arg_367_1.time_ < var_370_25 + var_370_26 + arg_370_0 and arg_367_1.var_.characterEffect2078ui_story then
				local var_370_29 = 0.5

				arg_367_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_367_1.var_.characterEffect2078ui_story.fillRatio = var_370_29
			end

			local var_370_30 = 0
			local var_370_31 = 0.35

			if var_370_30 < arg_367_1.time_ and arg_367_1.time_ <= var_370_30 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, false)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_32 = arg_367_1:GetWordFromCfg(317032092)
				local var_370_33 = arg_367_1:FormatText(var_370_32.content)

				arg_367_1.text_.text = var_370_33

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_34 = 14
				local var_370_35 = utf8.len(var_370_33)
				local var_370_36 = var_370_34 <= 0 and var_370_31 or var_370_31 * (var_370_35 / var_370_34)

				if var_370_36 > 0 and var_370_31 < var_370_36 then
					arg_367_1.talkMaxDuration = var_370_36

					if var_370_36 + var_370_30 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_36 + var_370_30
					end
				end

				arg_367_1.text_.text = var_370_33
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_37 = math.max(var_370_31, arg_367_1.talkMaxDuration)

			if var_370_30 <= arg_367_1.time_ and arg_367_1.time_ < var_370_30 + var_370_37 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_30) / var_370_37

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_30 + var_370_37 and arg_367_1.time_ < var_370_30 + var_370_37 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play317032093 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 317032093
		arg_371_1.duration_ = 15.766

		local var_371_0 = {
			zh = 11.733,
			ja = 15.766
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
				arg_371_0:Play317032094(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1015ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1015ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0, -1.15, -6.2)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1015ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = arg_371_1.actors_["1015ui_story"]
			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 and arg_371_1.var_.characterEffect1015ui_story == nil then
				arg_371_1.var_.characterEffect1015ui_story = var_374_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_11 = 0.200000002980232

			if var_374_10 <= arg_371_1.time_ and arg_371_1.time_ < var_374_10 + var_374_11 then
				local var_374_12 = (arg_371_1.time_ - var_374_10) / var_374_11

				if arg_371_1.var_.characterEffect1015ui_story then
					arg_371_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_371_1.time_ >= var_374_10 + var_374_11 and arg_371_1.time_ < var_374_10 + var_374_11 + arg_374_0 and arg_371_1.var_.characterEffect1015ui_story then
				arg_371_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_374_13 = 0

			if var_374_13 < arg_371_1.time_ and arg_371_1.time_ <= var_374_13 + arg_374_0 then
				arg_371_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_374_14 = 0

			if var_374_14 < arg_371_1.time_ and arg_371_1.time_ <= var_374_14 + arg_374_0 then
				arg_371_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_374_15 = 0
			local var_374_16 = 1.55

			if var_374_15 < arg_371_1.time_ and arg_371_1.time_ <= var_374_15 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_17 = arg_371_1:FormatText(StoryNameCfg[479].name)

				arg_371_1.leftNameTxt_.text = var_374_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_18 = arg_371_1:GetWordFromCfg(317032093)
				local var_374_19 = arg_371_1:FormatText(var_374_18.content)

				arg_371_1.text_.text = var_374_19

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_20 = 60
				local var_374_21 = utf8.len(var_374_19)
				local var_374_22 = var_374_20 <= 0 and var_374_16 or var_374_16 * (var_374_21 / var_374_20)

				if var_374_22 > 0 and var_374_16 < var_374_22 then
					arg_371_1.talkMaxDuration = var_374_22

					if var_374_22 + var_374_15 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_22 + var_374_15
					end
				end

				arg_371_1.text_.text = var_374_19
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032093", "story_v_out_317032.awb") ~= 0 then
					local var_374_23 = manager.audio:GetVoiceLength("story_v_out_317032", "317032093", "story_v_out_317032.awb") / 1000

					if var_374_23 + var_374_15 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_23 + var_374_15
					end

					if var_374_18.prefab_name ~= "" and arg_371_1.actors_[var_374_18.prefab_name] ~= nil then
						local var_374_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_18.prefab_name].transform, "story_v_out_317032", "317032093", "story_v_out_317032.awb")

						arg_371_1:RecordAudio("317032093", var_374_24)
						arg_371_1:RecordAudio("317032093", var_374_24)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_317032", "317032093", "story_v_out_317032.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_317032", "317032093", "story_v_out_317032.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_25 = math.max(var_374_16, arg_371_1.talkMaxDuration)

			if var_374_15 <= arg_371_1.time_ and arg_371_1.time_ < var_374_15 + var_374_25 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_15) / var_374_25

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_15 + var_374_25 and arg_371_1.time_ < var_374_15 + var_374_25 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play317032094 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 317032094
		arg_375_1.duration_ = 7.8

		local var_375_0 = {
			zh = 4.2,
			ja = 7.8
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
				arg_375_0:Play317032095(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1015ui_story"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos1015ui_story = var_378_0.localPosition
			end

			local var_378_2 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2
				local var_378_4 = Vector3.New(0, 100, 0)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1015ui_story, var_378_4, var_378_3)

				local var_378_5 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_5.x, var_378_5.y, var_378_5.z)

				local var_378_6 = var_378_0.localEulerAngles

				var_378_6.z = 0
				var_378_6.x = 0
				var_378_0.localEulerAngles = var_378_6
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(0, 100, 0)

				local var_378_7 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_7.x, var_378_7.y, var_378_7.z)

				local var_378_8 = var_378_0.localEulerAngles

				var_378_8.z = 0
				var_378_8.x = 0
				var_378_0.localEulerAngles = var_378_8
			end

			local var_378_9 = arg_375_1.actors_["1015ui_story"]
			local var_378_10 = 0

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 and arg_375_1.var_.characterEffect1015ui_story == nil then
				arg_375_1.var_.characterEffect1015ui_story = var_378_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_11 = 0.200000002980232

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_11 then
				local var_378_12 = (arg_375_1.time_ - var_378_10) / var_378_11

				if arg_375_1.var_.characterEffect1015ui_story then
					local var_378_13 = Mathf.Lerp(0, 0.5, var_378_12)

					arg_375_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1015ui_story.fillRatio = var_378_13
				end
			end

			if arg_375_1.time_ >= var_378_10 + var_378_11 and arg_375_1.time_ < var_378_10 + var_378_11 + arg_378_0 and arg_375_1.var_.characterEffect1015ui_story then
				local var_378_14 = 0.5

				arg_375_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1015ui_story.fillRatio = var_378_14
			end

			local var_378_15 = arg_375_1.actors_["2078ui_story"].transform
			local var_378_16 = 0

			if var_378_16 < arg_375_1.time_ and arg_375_1.time_ <= var_378_16 + arg_378_0 then
				arg_375_1.var_.moveOldPos2078ui_story = var_378_15.localPosition
			end

			local var_378_17 = 0.001

			if var_378_16 <= arg_375_1.time_ and arg_375_1.time_ < var_378_16 + var_378_17 then
				local var_378_18 = (arg_375_1.time_ - var_378_16) / var_378_17
				local var_378_19 = Vector3.New(-0.7, -1.28, -5.6)

				var_378_15.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos2078ui_story, var_378_19, var_378_18)

				local var_378_20 = manager.ui.mainCamera.transform.position - var_378_15.position

				var_378_15.forward = Vector3.New(var_378_20.x, var_378_20.y, var_378_20.z)

				local var_378_21 = var_378_15.localEulerAngles

				var_378_21.z = 0
				var_378_21.x = 0
				var_378_15.localEulerAngles = var_378_21
			end

			if arg_375_1.time_ >= var_378_16 + var_378_17 and arg_375_1.time_ < var_378_16 + var_378_17 + arg_378_0 then
				var_378_15.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_378_22 = manager.ui.mainCamera.transform.position - var_378_15.position

				var_378_15.forward = Vector3.New(var_378_22.x, var_378_22.y, var_378_22.z)

				local var_378_23 = var_378_15.localEulerAngles

				var_378_23.z = 0
				var_378_23.x = 0
				var_378_15.localEulerAngles = var_378_23
			end

			local var_378_24 = arg_375_1.actors_["2078ui_story"]
			local var_378_25 = 0

			if var_378_25 < arg_375_1.time_ and arg_375_1.time_ <= var_378_25 + arg_378_0 and arg_375_1.var_.characterEffect2078ui_story == nil then
				arg_375_1.var_.characterEffect2078ui_story = var_378_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_26 = 0.200000002980232

			if var_378_25 <= arg_375_1.time_ and arg_375_1.time_ < var_378_25 + var_378_26 then
				local var_378_27 = (arg_375_1.time_ - var_378_25) / var_378_26

				if arg_375_1.var_.characterEffect2078ui_story then
					local var_378_28 = Mathf.Lerp(0, 0.5, var_378_27)

					arg_375_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_375_1.var_.characterEffect2078ui_story.fillRatio = var_378_28
				end
			end

			if arg_375_1.time_ >= var_378_25 + var_378_26 and arg_375_1.time_ < var_378_25 + var_378_26 + arg_378_0 and arg_375_1.var_.characterEffect2078ui_story then
				local var_378_29 = 0.5

				arg_375_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_375_1.var_.characterEffect2078ui_story.fillRatio = var_378_29
			end

			local var_378_30 = arg_375_1.actors_["2079ui_story"].transform
			local var_378_31 = 0

			if var_378_31 < arg_375_1.time_ and arg_375_1.time_ <= var_378_31 + arg_378_0 then
				arg_375_1.var_.moveOldPos2079ui_story = var_378_30.localPosition
			end

			local var_378_32 = 0.001

			if var_378_31 <= arg_375_1.time_ and arg_375_1.time_ < var_378_31 + var_378_32 then
				local var_378_33 = (arg_375_1.time_ - var_378_31) / var_378_32
				local var_378_34 = Vector3.New(0.7, -1.28, -5.6)

				var_378_30.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos2079ui_story, var_378_34, var_378_33)

				local var_378_35 = manager.ui.mainCamera.transform.position - var_378_30.position

				var_378_30.forward = Vector3.New(var_378_35.x, var_378_35.y, var_378_35.z)

				local var_378_36 = var_378_30.localEulerAngles

				var_378_36.z = 0
				var_378_36.x = 0
				var_378_30.localEulerAngles = var_378_36
			end

			if arg_375_1.time_ >= var_378_31 + var_378_32 and arg_375_1.time_ < var_378_31 + var_378_32 + arg_378_0 then
				var_378_30.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_378_37 = manager.ui.mainCamera.transform.position - var_378_30.position

				var_378_30.forward = Vector3.New(var_378_37.x, var_378_37.y, var_378_37.z)

				local var_378_38 = var_378_30.localEulerAngles

				var_378_38.z = 0
				var_378_38.x = 0
				var_378_30.localEulerAngles = var_378_38
			end

			local var_378_39 = arg_375_1.actors_["2079ui_story"]
			local var_378_40 = 0

			if var_378_40 < arg_375_1.time_ and arg_375_1.time_ <= var_378_40 + arg_378_0 and arg_375_1.var_.characterEffect2079ui_story == nil then
				arg_375_1.var_.characterEffect2079ui_story = var_378_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_41 = 0.200000002980232

			if var_378_40 <= arg_375_1.time_ and arg_375_1.time_ < var_378_40 + var_378_41 then
				local var_378_42 = (arg_375_1.time_ - var_378_40) / var_378_41

				if arg_375_1.var_.characterEffect2079ui_story then
					arg_375_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_40 + var_378_41 and arg_375_1.time_ < var_378_40 + var_378_41 + arg_378_0 and arg_375_1.var_.characterEffect2079ui_story then
				arg_375_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_378_43 = 0

			if var_378_43 < arg_375_1.time_ and arg_375_1.time_ <= var_378_43 + arg_378_0 then
				arg_375_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_378_44 = 0

			if var_378_44 < arg_375_1.time_ and arg_375_1.time_ <= var_378_44 + arg_378_0 then
				arg_375_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_378_45 = 0
			local var_378_46 = 0.55

			if var_378_45 < arg_375_1.time_ and arg_375_1.time_ <= var_378_45 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_47 = arg_375_1:FormatText(StoryNameCfg[529].name)

				arg_375_1.leftNameTxt_.text = var_378_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_48 = arg_375_1:GetWordFromCfg(317032094)
				local var_378_49 = arg_375_1:FormatText(var_378_48.content)

				arg_375_1.text_.text = var_378_49

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_50 = 22
				local var_378_51 = utf8.len(var_378_49)
				local var_378_52 = var_378_50 <= 0 and var_378_46 or var_378_46 * (var_378_51 / var_378_50)

				if var_378_52 > 0 and var_378_46 < var_378_52 then
					arg_375_1.talkMaxDuration = var_378_52

					if var_378_52 + var_378_45 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_52 + var_378_45
					end
				end

				arg_375_1.text_.text = var_378_49
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032094", "story_v_out_317032.awb") ~= 0 then
					local var_378_53 = manager.audio:GetVoiceLength("story_v_out_317032", "317032094", "story_v_out_317032.awb") / 1000

					if var_378_53 + var_378_45 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_53 + var_378_45
					end

					if var_378_48.prefab_name ~= "" and arg_375_1.actors_[var_378_48.prefab_name] ~= nil then
						local var_378_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_48.prefab_name].transform, "story_v_out_317032", "317032094", "story_v_out_317032.awb")

						arg_375_1:RecordAudio("317032094", var_378_54)
						arg_375_1:RecordAudio("317032094", var_378_54)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_317032", "317032094", "story_v_out_317032.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_317032", "317032094", "story_v_out_317032.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_55 = math.max(var_378_46, arg_375_1.talkMaxDuration)

			if var_378_45 <= arg_375_1.time_ and arg_375_1.time_ < var_378_45 + var_378_55 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_45) / var_378_55

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_45 + var_378_55 and arg_375_1.time_ < var_378_45 + var_378_55 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play317032095 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 317032095
		arg_379_1.duration_ = 5.4

		local var_379_0 = {
			zh = 5.4,
			ja = 4.3
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
				arg_379_0:Play317032096(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["2078ui_story"].transform
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.var_.moveOldPos2078ui_story = var_382_0.localPosition
			end

			local var_382_2 = 0.001

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2
				local var_382_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_382_0.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos2078ui_story, var_382_4, var_382_3)

				local var_382_5 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_5.x, var_382_5.y, var_382_5.z)

				local var_382_6 = var_382_0.localEulerAngles

				var_382_6.z = 0
				var_382_6.x = 0
				var_382_0.localEulerAngles = var_382_6
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 then
				var_382_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_382_7 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_7.x, var_382_7.y, var_382_7.z)

				local var_382_8 = var_382_0.localEulerAngles

				var_382_8.z = 0
				var_382_8.x = 0
				var_382_0.localEulerAngles = var_382_8
			end

			local var_382_9 = arg_379_1.actors_["2078ui_story"]
			local var_382_10 = 0

			if var_382_10 < arg_379_1.time_ and arg_379_1.time_ <= var_382_10 + arg_382_0 and arg_379_1.var_.characterEffect2078ui_story == nil then
				arg_379_1.var_.characterEffect2078ui_story = var_382_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_11 = 0.200000002980232

			if var_382_10 <= arg_379_1.time_ and arg_379_1.time_ < var_382_10 + var_382_11 then
				local var_382_12 = (arg_379_1.time_ - var_382_10) / var_382_11

				if arg_379_1.var_.characterEffect2078ui_story then
					arg_379_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_10 + var_382_11 and arg_379_1.time_ < var_382_10 + var_382_11 + arg_382_0 and arg_379_1.var_.characterEffect2078ui_story then
				arg_379_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_382_13 = 0

			if var_382_13 < arg_379_1.time_ and arg_379_1.time_ <= var_382_13 + arg_382_0 then
				arg_379_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_382_14 = 0

			if var_382_14 < arg_379_1.time_ and arg_379_1.time_ <= var_382_14 + arg_382_0 then
				arg_379_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_382_15 = arg_379_1.actors_["2079ui_story"].transform
			local var_382_16 = 0

			if var_382_16 < arg_379_1.time_ and arg_379_1.time_ <= var_382_16 + arg_382_0 then
				arg_379_1.var_.moveOldPos2079ui_story = var_382_15.localPosition
			end

			local var_382_17 = 0.001

			if var_382_16 <= arg_379_1.time_ and arg_379_1.time_ < var_382_16 + var_382_17 then
				local var_382_18 = (arg_379_1.time_ - var_382_16) / var_382_17
				local var_382_19 = Vector3.New(0.7, -1.28, -5.6)

				var_382_15.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos2079ui_story, var_382_19, var_382_18)

				local var_382_20 = manager.ui.mainCamera.transform.position - var_382_15.position

				var_382_15.forward = Vector3.New(var_382_20.x, var_382_20.y, var_382_20.z)

				local var_382_21 = var_382_15.localEulerAngles

				var_382_21.z = 0
				var_382_21.x = 0
				var_382_15.localEulerAngles = var_382_21
			end

			if arg_379_1.time_ >= var_382_16 + var_382_17 and arg_379_1.time_ < var_382_16 + var_382_17 + arg_382_0 then
				var_382_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_382_22 = manager.ui.mainCamera.transform.position - var_382_15.position

				var_382_15.forward = Vector3.New(var_382_22.x, var_382_22.y, var_382_22.z)

				local var_382_23 = var_382_15.localEulerAngles

				var_382_23.z = 0
				var_382_23.x = 0
				var_382_15.localEulerAngles = var_382_23
			end

			local var_382_24 = arg_379_1.actors_["2079ui_story"]
			local var_382_25 = 0

			if var_382_25 < arg_379_1.time_ and arg_379_1.time_ <= var_382_25 + arg_382_0 and arg_379_1.var_.characterEffect2079ui_story == nil then
				arg_379_1.var_.characterEffect2079ui_story = var_382_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_26 = 0.200000002980232

			if var_382_25 <= arg_379_1.time_ and arg_379_1.time_ < var_382_25 + var_382_26 then
				local var_382_27 = (arg_379_1.time_ - var_382_25) / var_382_26

				if arg_379_1.var_.characterEffect2079ui_story then
					local var_382_28 = Mathf.Lerp(0, 0.5, var_382_27)

					arg_379_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_379_1.var_.characterEffect2079ui_story.fillRatio = var_382_28
				end
			end

			if arg_379_1.time_ >= var_382_25 + var_382_26 and arg_379_1.time_ < var_382_25 + var_382_26 + arg_382_0 and arg_379_1.var_.characterEffect2079ui_story then
				local var_382_29 = 0.5

				arg_379_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_379_1.var_.characterEffect2079ui_story.fillRatio = var_382_29
			end

			local var_382_30 = 0
			local var_382_31 = 0.55

			if var_382_30 < arg_379_1.time_ and arg_379_1.time_ <= var_382_30 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_32 = arg_379_1:FormatText(StoryNameCfg[528].name)

				arg_379_1.leftNameTxt_.text = var_382_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_33 = arg_379_1:GetWordFromCfg(317032095)
				local var_382_34 = arg_379_1:FormatText(var_382_33.content)

				arg_379_1.text_.text = var_382_34

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_35 = 22
				local var_382_36 = utf8.len(var_382_34)
				local var_382_37 = var_382_35 <= 0 and var_382_31 or var_382_31 * (var_382_36 / var_382_35)

				if var_382_37 > 0 and var_382_31 < var_382_37 then
					arg_379_1.talkMaxDuration = var_382_37

					if var_382_37 + var_382_30 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_37 + var_382_30
					end
				end

				arg_379_1.text_.text = var_382_34
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032095", "story_v_out_317032.awb") ~= 0 then
					local var_382_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032095", "story_v_out_317032.awb") / 1000

					if var_382_38 + var_382_30 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_38 + var_382_30
					end

					if var_382_33.prefab_name ~= "" and arg_379_1.actors_[var_382_33.prefab_name] ~= nil then
						local var_382_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_33.prefab_name].transform, "story_v_out_317032", "317032095", "story_v_out_317032.awb")

						arg_379_1:RecordAudio("317032095", var_382_39)
						arg_379_1:RecordAudio("317032095", var_382_39)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_317032", "317032095", "story_v_out_317032.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_317032", "317032095", "story_v_out_317032.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_40 = math.max(var_382_31, arg_379_1.talkMaxDuration)

			if var_382_30 <= arg_379_1.time_ and arg_379_1.time_ < var_382_30 + var_382_40 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_30) / var_382_40

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_30 + var_382_40 and arg_379_1.time_ < var_382_30 + var_382_40 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play317032096 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 317032096
		arg_383_1.duration_ = 2.933

		local var_383_0 = {
			zh = 2.766,
			ja = 2.933
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play317032097(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1015ui_story"].transform
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 then
				arg_383_1.var_.moveOldPos1015ui_story = var_386_0.localPosition
			end

			local var_386_2 = 0.001

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2
				local var_386_4 = Vector3.New(0, -1.15, -6.2)

				var_386_0.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1015ui_story, var_386_4, var_386_3)

				local var_386_5 = manager.ui.mainCamera.transform.position - var_386_0.position

				var_386_0.forward = Vector3.New(var_386_5.x, var_386_5.y, var_386_5.z)

				local var_386_6 = var_386_0.localEulerAngles

				var_386_6.z = 0
				var_386_6.x = 0
				var_386_0.localEulerAngles = var_386_6
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 then
				var_386_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_386_7 = manager.ui.mainCamera.transform.position - var_386_0.position

				var_386_0.forward = Vector3.New(var_386_7.x, var_386_7.y, var_386_7.z)

				local var_386_8 = var_386_0.localEulerAngles

				var_386_8.z = 0
				var_386_8.x = 0
				var_386_0.localEulerAngles = var_386_8
			end

			local var_386_9 = arg_383_1.actors_["1015ui_story"]
			local var_386_10 = 0

			if var_386_10 < arg_383_1.time_ and arg_383_1.time_ <= var_386_10 + arg_386_0 and arg_383_1.var_.characterEffect1015ui_story == nil then
				arg_383_1.var_.characterEffect1015ui_story = var_386_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_11 = 0.200000002980232

			if var_386_10 <= arg_383_1.time_ and arg_383_1.time_ < var_386_10 + var_386_11 then
				local var_386_12 = (arg_383_1.time_ - var_386_10) / var_386_11

				if arg_383_1.var_.characterEffect1015ui_story then
					arg_383_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_383_1.time_ >= var_386_10 + var_386_11 and arg_383_1.time_ < var_386_10 + var_386_11 + arg_386_0 and arg_383_1.var_.characterEffect1015ui_story then
				arg_383_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_386_13 = 0

			if var_386_13 < arg_383_1.time_ and arg_383_1.time_ <= var_386_13 + arg_386_0 then
				arg_383_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_386_14 = 0

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 then
				arg_383_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_386_15 = arg_383_1.actors_["2078ui_story"].transform
			local var_386_16 = 0

			if var_386_16 < arg_383_1.time_ and arg_383_1.time_ <= var_386_16 + arg_386_0 then
				arg_383_1.var_.moveOldPos2078ui_story = var_386_15.localPosition
			end

			local var_386_17 = 0.001

			if var_386_16 <= arg_383_1.time_ and arg_383_1.time_ < var_386_16 + var_386_17 then
				local var_386_18 = (arg_383_1.time_ - var_386_16) / var_386_17
				local var_386_19 = Vector3.New(0, 100, 0)

				var_386_15.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos2078ui_story, var_386_19, var_386_18)

				local var_386_20 = manager.ui.mainCamera.transform.position - var_386_15.position

				var_386_15.forward = Vector3.New(var_386_20.x, var_386_20.y, var_386_20.z)

				local var_386_21 = var_386_15.localEulerAngles

				var_386_21.z = 0
				var_386_21.x = 0
				var_386_15.localEulerAngles = var_386_21
			end

			if arg_383_1.time_ >= var_386_16 + var_386_17 and arg_383_1.time_ < var_386_16 + var_386_17 + arg_386_0 then
				var_386_15.localPosition = Vector3.New(0, 100, 0)

				local var_386_22 = manager.ui.mainCamera.transform.position - var_386_15.position

				var_386_15.forward = Vector3.New(var_386_22.x, var_386_22.y, var_386_22.z)

				local var_386_23 = var_386_15.localEulerAngles

				var_386_23.z = 0
				var_386_23.x = 0
				var_386_15.localEulerAngles = var_386_23
			end

			local var_386_24 = arg_383_1.actors_["2078ui_story"]
			local var_386_25 = 0

			if var_386_25 < arg_383_1.time_ and arg_383_1.time_ <= var_386_25 + arg_386_0 and arg_383_1.var_.characterEffect2078ui_story == nil then
				arg_383_1.var_.characterEffect2078ui_story = var_386_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_26 = 0.200000002980232

			if var_386_25 <= arg_383_1.time_ and arg_383_1.time_ < var_386_25 + var_386_26 then
				local var_386_27 = (arg_383_1.time_ - var_386_25) / var_386_26

				if arg_383_1.var_.characterEffect2078ui_story then
					local var_386_28 = Mathf.Lerp(0, 0.5, var_386_27)

					arg_383_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_383_1.var_.characterEffect2078ui_story.fillRatio = var_386_28
				end
			end

			if arg_383_1.time_ >= var_386_25 + var_386_26 and arg_383_1.time_ < var_386_25 + var_386_26 + arg_386_0 and arg_383_1.var_.characterEffect2078ui_story then
				local var_386_29 = 0.5

				arg_383_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_383_1.var_.characterEffect2078ui_story.fillRatio = var_386_29
			end

			local var_386_30 = arg_383_1.actors_["2079ui_story"].transform
			local var_386_31 = 0

			if var_386_31 < arg_383_1.time_ and arg_383_1.time_ <= var_386_31 + arg_386_0 then
				arg_383_1.var_.moveOldPos2079ui_story = var_386_30.localPosition
			end

			local var_386_32 = 0.001

			if var_386_31 <= arg_383_1.time_ and arg_383_1.time_ < var_386_31 + var_386_32 then
				local var_386_33 = (arg_383_1.time_ - var_386_31) / var_386_32
				local var_386_34 = Vector3.New(0, 100, 0)

				var_386_30.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos2079ui_story, var_386_34, var_386_33)

				local var_386_35 = manager.ui.mainCamera.transform.position - var_386_30.position

				var_386_30.forward = Vector3.New(var_386_35.x, var_386_35.y, var_386_35.z)

				local var_386_36 = var_386_30.localEulerAngles

				var_386_36.z = 0
				var_386_36.x = 0
				var_386_30.localEulerAngles = var_386_36
			end

			if arg_383_1.time_ >= var_386_31 + var_386_32 and arg_383_1.time_ < var_386_31 + var_386_32 + arg_386_0 then
				var_386_30.localPosition = Vector3.New(0, 100, 0)

				local var_386_37 = manager.ui.mainCamera.transform.position - var_386_30.position

				var_386_30.forward = Vector3.New(var_386_37.x, var_386_37.y, var_386_37.z)

				local var_386_38 = var_386_30.localEulerAngles

				var_386_38.z = 0
				var_386_38.x = 0
				var_386_30.localEulerAngles = var_386_38
			end

			local var_386_39 = arg_383_1.actors_["2079ui_story"]
			local var_386_40 = 0

			if var_386_40 < arg_383_1.time_ and arg_383_1.time_ <= var_386_40 + arg_386_0 and arg_383_1.var_.characterEffect2079ui_story == nil then
				arg_383_1.var_.characterEffect2079ui_story = var_386_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_41 = 0.200000002980232

			if var_386_40 <= arg_383_1.time_ and arg_383_1.time_ < var_386_40 + var_386_41 then
				local var_386_42 = (arg_383_1.time_ - var_386_40) / var_386_41

				if arg_383_1.var_.characterEffect2079ui_story then
					local var_386_43 = Mathf.Lerp(0, 0.5, var_386_42)

					arg_383_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_383_1.var_.characterEffect2079ui_story.fillRatio = var_386_43
				end
			end

			if arg_383_1.time_ >= var_386_40 + var_386_41 and arg_383_1.time_ < var_386_40 + var_386_41 + arg_386_0 and arg_383_1.var_.characterEffect2079ui_story then
				local var_386_44 = 0.5

				arg_383_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_383_1.var_.characterEffect2079ui_story.fillRatio = var_386_44
			end

			local var_386_45 = 0
			local var_386_46 = 0.3

			if var_386_45 < arg_383_1.time_ and arg_383_1.time_ <= var_386_45 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_47 = arg_383_1:FormatText(StoryNameCfg[479].name)

				arg_383_1.leftNameTxt_.text = var_386_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_48 = arg_383_1:GetWordFromCfg(317032096)
				local var_386_49 = arg_383_1:FormatText(var_386_48.content)

				arg_383_1.text_.text = var_386_49

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_50 = 12
				local var_386_51 = utf8.len(var_386_49)
				local var_386_52 = var_386_50 <= 0 and var_386_46 or var_386_46 * (var_386_51 / var_386_50)

				if var_386_52 > 0 and var_386_46 < var_386_52 then
					arg_383_1.talkMaxDuration = var_386_52

					if var_386_52 + var_386_45 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_52 + var_386_45
					end
				end

				arg_383_1.text_.text = var_386_49
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032096", "story_v_out_317032.awb") ~= 0 then
					local var_386_53 = manager.audio:GetVoiceLength("story_v_out_317032", "317032096", "story_v_out_317032.awb") / 1000

					if var_386_53 + var_386_45 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_53 + var_386_45
					end

					if var_386_48.prefab_name ~= "" and arg_383_1.actors_[var_386_48.prefab_name] ~= nil then
						local var_386_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_48.prefab_name].transform, "story_v_out_317032", "317032096", "story_v_out_317032.awb")

						arg_383_1:RecordAudio("317032096", var_386_54)
						arg_383_1:RecordAudio("317032096", var_386_54)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_317032", "317032096", "story_v_out_317032.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_317032", "317032096", "story_v_out_317032.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_55 = math.max(var_386_46, arg_383_1.talkMaxDuration)

			if var_386_45 <= arg_383_1.time_ and arg_383_1.time_ < var_386_45 + var_386_55 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_45) / var_386_55

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_45 + var_386_55 and arg_383_1.time_ < var_386_45 + var_386_55 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play317032097 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 317032097
		arg_387_1.duration_ = 4.466

		local var_387_0 = {
			zh = 4.466,
			ja = 3.766
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
				arg_387_0:Play317032098(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1015ui_story"].transform
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				arg_387_1.var_.moveOldPos1015ui_story = var_390_0.localPosition
			end

			local var_390_2 = 0.001

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2
				local var_390_4 = Vector3.New(0, 100, 0)

				var_390_0.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1015ui_story, var_390_4, var_390_3)

				local var_390_5 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_5.x, var_390_5.y, var_390_5.z)

				local var_390_6 = var_390_0.localEulerAngles

				var_390_6.z = 0
				var_390_6.x = 0
				var_390_0.localEulerAngles = var_390_6
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 then
				var_390_0.localPosition = Vector3.New(0, 100, 0)

				local var_390_7 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_7.x, var_390_7.y, var_390_7.z)

				local var_390_8 = var_390_0.localEulerAngles

				var_390_8.z = 0
				var_390_8.x = 0
				var_390_0.localEulerAngles = var_390_8
			end

			local var_390_9 = arg_387_1.actors_["1015ui_story"]
			local var_390_10 = 0

			if var_390_10 < arg_387_1.time_ and arg_387_1.time_ <= var_390_10 + arg_390_0 and arg_387_1.var_.characterEffect1015ui_story == nil then
				arg_387_1.var_.characterEffect1015ui_story = var_390_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_11 = 0.200000002980232

			if var_390_10 <= arg_387_1.time_ and arg_387_1.time_ < var_390_10 + var_390_11 then
				local var_390_12 = (arg_387_1.time_ - var_390_10) / var_390_11

				if arg_387_1.var_.characterEffect1015ui_story then
					local var_390_13 = Mathf.Lerp(0, 0.5, var_390_12)

					arg_387_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_387_1.var_.characterEffect1015ui_story.fillRatio = var_390_13
				end
			end

			if arg_387_1.time_ >= var_390_10 + var_390_11 and arg_387_1.time_ < var_390_10 + var_390_11 + arg_390_0 and arg_387_1.var_.characterEffect1015ui_story then
				local var_390_14 = 0.5

				arg_387_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_387_1.var_.characterEffect1015ui_story.fillRatio = var_390_14
			end

			local var_390_15 = arg_387_1.actors_["2078ui_story"].transform
			local var_390_16 = 0

			if var_390_16 < arg_387_1.time_ and arg_387_1.time_ <= var_390_16 + arg_390_0 then
				arg_387_1.var_.moveOldPos2078ui_story = var_390_15.localPosition
			end

			local var_390_17 = 0.001

			if var_390_16 <= arg_387_1.time_ and arg_387_1.time_ < var_390_16 + var_390_17 then
				local var_390_18 = (arg_387_1.time_ - var_390_16) / var_390_17
				local var_390_19 = Vector3.New(0, -1.28, -5.6)

				var_390_15.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos2078ui_story, var_390_19, var_390_18)

				local var_390_20 = manager.ui.mainCamera.transform.position - var_390_15.position

				var_390_15.forward = Vector3.New(var_390_20.x, var_390_20.y, var_390_20.z)

				local var_390_21 = var_390_15.localEulerAngles

				var_390_21.z = 0
				var_390_21.x = 0
				var_390_15.localEulerAngles = var_390_21
			end

			if arg_387_1.time_ >= var_390_16 + var_390_17 and arg_387_1.time_ < var_390_16 + var_390_17 + arg_390_0 then
				var_390_15.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_390_22 = manager.ui.mainCamera.transform.position - var_390_15.position

				var_390_15.forward = Vector3.New(var_390_22.x, var_390_22.y, var_390_22.z)

				local var_390_23 = var_390_15.localEulerAngles

				var_390_23.z = 0
				var_390_23.x = 0
				var_390_15.localEulerAngles = var_390_23
			end

			local var_390_24 = arg_387_1.actors_["2078ui_story"]
			local var_390_25 = 0

			if var_390_25 < arg_387_1.time_ and arg_387_1.time_ <= var_390_25 + arg_390_0 and arg_387_1.var_.characterEffect2078ui_story == nil then
				arg_387_1.var_.characterEffect2078ui_story = var_390_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_26 = 0.200000002980232

			if var_390_25 <= arg_387_1.time_ and arg_387_1.time_ < var_390_25 + var_390_26 then
				local var_390_27 = (arg_387_1.time_ - var_390_25) / var_390_26

				if arg_387_1.var_.characterEffect2078ui_story then
					arg_387_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_25 + var_390_26 and arg_387_1.time_ < var_390_25 + var_390_26 + arg_390_0 and arg_387_1.var_.characterEffect2078ui_story then
				arg_387_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_390_28 = 0

			if var_390_28 < arg_387_1.time_ and arg_387_1.time_ <= var_390_28 + arg_390_0 then
				arg_387_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_390_29 = 0

			if var_390_29 < arg_387_1.time_ and arg_387_1.time_ <= var_390_29 + arg_390_0 then
				arg_387_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_390_30 = 0
			local var_390_31 = 0.575

			if var_390_30 < arg_387_1.time_ and arg_387_1.time_ <= var_390_30 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_32 = arg_387_1:FormatText(StoryNameCfg[528].name)

				arg_387_1.leftNameTxt_.text = var_390_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_33 = arg_387_1:GetWordFromCfg(317032097)
				local var_390_34 = arg_387_1:FormatText(var_390_33.content)

				arg_387_1.text_.text = var_390_34

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_35 = 23
				local var_390_36 = utf8.len(var_390_34)
				local var_390_37 = var_390_35 <= 0 and var_390_31 or var_390_31 * (var_390_36 / var_390_35)

				if var_390_37 > 0 and var_390_31 < var_390_37 then
					arg_387_1.talkMaxDuration = var_390_37

					if var_390_37 + var_390_30 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_37 + var_390_30
					end
				end

				arg_387_1.text_.text = var_390_34
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032097", "story_v_out_317032.awb") ~= 0 then
					local var_390_38 = manager.audio:GetVoiceLength("story_v_out_317032", "317032097", "story_v_out_317032.awb") / 1000

					if var_390_38 + var_390_30 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_38 + var_390_30
					end

					if var_390_33.prefab_name ~= "" and arg_387_1.actors_[var_390_33.prefab_name] ~= nil then
						local var_390_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_33.prefab_name].transform, "story_v_out_317032", "317032097", "story_v_out_317032.awb")

						arg_387_1:RecordAudio("317032097", var_390_39)
						arg_387_1:RecordAudio("317032097", var_390_39)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_317032", "317032097", "story_v_out_317032.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_317032", "317032097", "story_v_out_317032.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_40 = math.max(var_390_31, arg_387_1.talkMaxDuration)

			if var_390_30 <= arg_387_1.time_ and arg_387_1.time_ < var_390_30 + var_390_40 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_30) / var_390_40

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_30 + var_390_40 and arg_387_1.time_ < var_390_30 + var_390_40 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play317032098 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 317032098
		arg_391_1.duration_ = 7.3

		local var_391_0 = {
			zh = 5.566,
			ja = 7.3
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
				arg_391_0:Play317032099(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1015ui_story"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1015ui_story = var_394_0.localPosition
			end

			local var_394_2 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2
				local var_394_4 = Vector3.New(0, -1.15, -6.2)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1015ui_story, var_394_4, var_394_3)

				local var_394_5 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_5.x, var_394_5.y, var_394_5.z)

				local var_394_6 = var_394_0.localEulerAngles

				var_394_6.z = 0
				var_394_6.x = 0
				var_394_0.localEulerAngles = var_394_6
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_394_7 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_7.x, var_394_7.y, var_394_7.z)

				local var_394_8 = var_394_0.localEulerAngles

				var_394_8.z = 0
				var_394_8.x = 0
				var_394_0.localEulerAngles = var_394_8
			end

			local var_394_9 = arg_391_1.actors_["1015ui_story"]
			local var_394_10 = 0

			if var_394_10 < arg_391_1.time_ and arg_391_1.time_ <= var_394_10 + arg_394_0 and arg_391_1.var_.characterEffect1015ui_story == nil then
				arg_391_1.var_.characterEffect1015ui_story = var_394_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_11 = 0.200000002980232

			if var_394_10 <= arg_391_1.time_ and arg_391_1.time_ < var_394_10 + var_394_11 then
				local var_394_12 = (arg_391_1.time_ - var_394_10) / var_394_11

				if arg_391_1.var_.characterEffect1015ui_story then
					arg_391_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_10 + var_394_11 and arg_391_1.time_ < var_394_10 + var_394_11 + arg_394_0 and arg_391_1.var_.characterEffect1015ui_story then
				arg_391_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_394_13 = arg_391_1.actors_["2078ui_story"].transform
			local var_394_14 = 0

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 then
				arg_391_1.var_.moveOldPos2078ui_story = var_394_13.localPosition
			end

			local var_394_15 = 0.001

			if var_394_14 <= arg_391_1.time_ and arg_391_1.time_ < var_394_14 + var_394_15 then
				local var_394_16 = (arg_391_1.time_ - var_394_14) / var_394_15
				local var_394_17 = Vector3.New(0, 100, 0)

				var_394_13.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos2078ui_story, var_394_17, var_394_16)

				local var_394_18 = manager.ui.mainCamera.transform.position - var_394_13.position

				var_394_13.forward = Vector3.New(var_394_18.x, var_394_18.y, var_394_18.z)

				local var_394_19 = var_394_13.localEulerAngles

				var_394_19.z = 0
				var_394_19.x = 0
				var_394_13.localEulerAngles = var_394_19
			end

			if arg_391_1.time_ >= var_394_14 + var_394_15 and arg_391_1.time_ < var_394_14 + var_394_15 + arg_394_0 then
				var_394_13.localPosition = Vector3.New(0, 100, 0)

				local var_394_20 = manager.ui.mainCamera.transform.position - var_394_13.position

				var_394_13.forward = Vector3.New(var_394_20.x, var_394_20.y, var_394_20.z)

				local var_394_21 = var_394_13.localEulerAngles

				var_394_21.z = 0
				var_394_21.x = 0
				var_394_13.localEulerAngles = var_394_21
			end

			local var_394_22 = arg_391_1.actors_["2078ui_story"]
			local var_394_23 = 0

			if var_394_23 < arg_391_1.time_ and arg_391_1.time_ <= var_394_23 + arg_394_0 and arg_391_1.var_.characterEffect2078ui_story == nil then
				arg_391_1.var_.characterEffect2078ui_story = var_394_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_24 = 0.200000002980232

			if var_394_23 <= arg_391_1.time_ and arg_391_1.time_ < var_394_23 + var_394_24 then
				local var_394_25 = (arg_391_1.time_ - var_394_23) / var_394_24

				if arg_391_1.var_.characterEffect2078ui_story then
					local var_394_26 = Mathf.Lerp(0, 0.5, var_394_25)

					arg_391_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_391_1.var_.characterEffect2078ui_story.fillRatio = var_394_26
				end
			end

			if arg_391_1.time_ >= var_394_23 + var_394_24 and arg_391_1.time_ < var_394_23 + var_394_24 + arg_394_0 and arg_391_1.var_.characterEffect2078ui_story then
				local var_394_27 = 0.5

				arg_391_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_391_1.var_.characterEffect2078ui_story.fillRatio = var_394_27
			end

			local var_394_28 = 0
			local var_394_29 = 0.75

			if var_394_28 < arg_391_1.time_ and arg_391_1.time_ <= var_394_28 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_30 = arg_391_1:FormatText(StoryNameCfg[479].name)

				arg_391_1.leftNameTxt_.text = var_394_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_31 = arg_391_1:GetWordFromCfg(317032098)
				local var_394_32 = arg_391_1:FormatText(var_394_31.content)

				arg_391_1.text_.text = var_394_32

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_33 = 30
				local var_394_34 = utf8.len(var_394_32)
				local var_394_35 = var_394_33 <= 0 and var_394_29 or var_394_29 * (var_394_34 / var_394_33)

				if var_394_35 > 0 and var_394_29 < var_394_35 then
					arg_391_1.talkMaxDuration = var_394_35

					if var_394_35 + var_394_28 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_35 + var_394_28
					end
				end

				arg_391_1.text_.text = var_394_32
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032098", "story_v_out_317032.awb") ~= 0 then
					local var_394_36 = manager.audio:GetVoiceLength("story_v_out_317032", "317032098", "story_v_out_317032.awb") / 1000

					if var_394_36 + var_394_28 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_36 + var_394_28
					end

					if var_394_31.prefab_name ~= "" and arg_391_1.actors_[var_394_31.prefab_name] ~= nil then
						local var_394_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_31.prefab_name].transform, "story_v_out_317032", "317032098", "story_v_out_317032.awb")

						arg_391_1:RecordAudio("317032098", var_394_37)
						arg_391_1:RecordAudio("317032098", var_394_37)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_317032", "317032098", "story_v_out_317032.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_317032", "317032098", "story_v_out_317032.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_38 = math.max(var_394_29, arg_391_1.talkMaxDuration)

			if var_394_28 <= arg_391_1.time_ and arg_391_1.time_ < var_394_28 + var_394_38 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_28) / var_394_38

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_28 + var_394_38 and arg_391_1.time_ < var_394_28 + var_394_38 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play317032099 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 317032099
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play317032100(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1015ui_story"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and arg_395_1.var_.characterEffect1015ui_story == nil then
				arg_395_1.var_.characterEffect1015ui_story = var_398_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_2 = 0.200000002980232

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.characterEffect1015ui_story then
					local var_398_4 = Mathf.Lerp(0, 0.5, var_398_3)

					arg_395_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1015ui_story.fillRatio = var_398_4
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and arg_395_1.var_.characterEffect1015ui_story then
				local var_398_5 = 0.5

				arg_395_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1015ui_story.fillRatio = var_398_5
			end

			local var_398_6 = 0
			local var_398_7 = 0.275

			if var_398_6 < arg_395_1.time_ and arg_395_1.time_ <= var_398_6 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_8 = arg_395_1:FormatText(StoryNameCfg[7].name)

				arg_395_1.leftNameTxt_.text = var_398_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_9 = arg_395_1:GetWordFromCfg(317032099)
				local var_398_10 = arg_395_1:FormatText(var_398_9.content)

				arg_395_1.text_.text = var_398_10

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_11 = 11
				local var_398_12 = utf8.len(var_398_10)
				local var_398_13 = var_398_11 <= 0 and var_398_7 or var_398_7 * (var_398_12 / var_398_11)

				if var_398_13 > 0 and var_398_7 < var_398_13 then
					arg_395_1.talkMaxDuration = var_398_13

					if var_398_13 + var_398_6 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_13 + var_398_6
					end
				end

				arg_395_1.text_.text = var_398_10
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_14 = math.max(var_398_7, arg_395_1.talkMaxDuration)

			if var_398_6 <= arg_395_1.time_ and arg_395_1.time_ < var_398_6 + var_398_14 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_6) / var_398_14

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_6 + var_398_14 and arg_395_1.time_ < var_398_6 + var_398_14 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play317032100 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 317032100
		arg_399_1.duration_ = 1.7

		local var_399_0 = {
			zh = 0.999999999999,
			ja = 1.7
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
				arg_399_0:Play317032101(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1015ui_story"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 and arg_399_1.var_.characterEffect1015ui_story == nil then
				arg_399_1.var_.characterEffect1015ui_story = var_402_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_2 = 0.200000002980232

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2

				if arg_399_1.var_.characterEffect1015ui_story then
					arg_399_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 and arg_399_1.var_.characterEffect1015ui_story then
				arg_399_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_402_4 = 0
			local var_402_5 = 0.075

			if var_402_4 < arg_399_1.time_ and arg_399_1.time_ <= var_402_4 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_6 = arg_399_1:FormatText(StoryNameCfg[479].name)

				arg_399_1.leftNameTxt_.text = var_402_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_7 = arg_399_1:GetWordFromCfg(317032100)
				local var_402_8 = arg_399_1:FormatText(var_402_7.content)

				arg_399_1.text_.text = var_402_8

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_9 = 3
				local var_402_10 = utf8.len(var_402_8)
				local var_402_11 = var_402_9 <= 0 and var_402_5 or var_402_5 * (var_402_10 / var_402_9)

				if var_402_11 > 0 and var_402_5 < var_402_11 then
					arg_399_1.talkMaxDuration = var_402_11

					if var_402_11 + var_402_4 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_11 + var_402_4
					end
				end

				arg_399_1.text_.text = var_402_8
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317032", "317032100", "story_v_out_317032.awb") ~= 0 then
					local var_402_12 = manager.audio:GetVoiceLength("story_v_out_317032", "317032100", "story_v_out_317032.awb") / 1000

					if var_402_12 + var_402_4 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_12 + var_402_4
					end

					if var_402_7.prefab_name ~= "" and arg_399_1.actors_[var_402_7.prefab_name] ~= nil then
						local var_402_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_7.prefab_name].transform, "story_v_out_317032", "317032100", "story_v_out_317032.awb")

						arg_399_1:RecordAudio("317032100", var_402_13)
						arg_399_1:RecordAudio("317032100", var_402_13)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_317032", "317032100", "story_v_out_317032.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_317032", "317032100", "story_v_out_317032.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_14 = math.max(var_402_5, arg_399_1.talkMaxDuration)

			if var_402_4 <= arg_399_1.time_ and arg_399_1.time_ < var_402_4 + var_402_14 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_4) / var_402_14

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_4 + var_402_14 and arg_399_1.time_ < var_402_4 + var_402_14 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play317032101 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 317032101
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
			arg_403_1.auto_ = false
		end

		function arg_403_1.playNext_(arg_405_0)
			arg_403_1.onStoryFinished_()
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1015ui_story"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and arg_403_1.var_.characterEffect1015ui_story == nil then
				arg_403_1.var_.characterEffect1015ui_story = var_406_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_2 = 0.200000002980232

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.characterEffect1015ui_story then
					local var_406_4 = Mathf.Lerp(0, 0.5, var_406_3)

					arg_403_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1015ui_story.fillRatio = var_406_4
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and arg_403_1.var_.characterEffect1015ui_story then
				local var_406_5 = 0.5

				arg_403_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1015ui_story.fillRatio = var_406_5
			end

			local var_406_6 = 0
			local var_406_7 = 0.325

			if var_406_6 < arg_403_1.time_ and arg_403_1.time_ <= var_406_6 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_8 = arg_403_1:FormatText(StoryNameCfg[7].name)

				arg_403_1.leftNameTxt_.text = var_406_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_9 = arg_403_1:GetWordFromCfg(317032101)
				local var_406_10 = arg_403_1:FormatText(var_406_9.content)

				arg_403_1.text_.text = var_406_10

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_11 = 13
				local var_406_12 = utf8.len(var_406_10)
				local var_406_13 = var_406_11 <= 0 and var_406_7 or var_406_7 * (var_406_12 / var_406_11)

				if var_406_13 > 0 and var_406_7 < var_406_13 then
					arg_403_1.talkMaxDuration = var_406_13

					if var_406_13 + var_406_6 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_13 + var_406_6
					end
				end

				arg_403_1.text_.text = var_406_10
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_14 = math.max(var_406_7, arg_403_1.talkMaxDuration)

			if var_406_6 <= arg_403_1.time_ and arg_403_1.time_ < var_406_6 + var_406_14 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_6) / var_406_14

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_6 + var_406_14 and arg_403_1.time_ < var_406_6 + var_406_14 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K10f"
	},
	voices = {
		"story_v_out_317032.awb"
	}
}
