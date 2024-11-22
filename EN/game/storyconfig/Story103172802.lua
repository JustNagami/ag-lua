return {
	Play317282001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317282001
		arg_1_1.duration_ = 4.566

		local var_1_0 = {
			zh = 4.566,
			ja = 3.999999999999
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
				arg_1_0:Play317282002(arg_1_1)
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

			local var_4_22 = "2079ui_story"

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

			local var_4_26 = arg_1_1.actors_["2079ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos2079ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -1.28, -5.6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos2079ui_story, var_4_30, var_4_29)

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

			local var_4_35 = arg_1_1.actors_["2079ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect2079ui_story == nil then
				arg_1_1.var_.characterEffect2079ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect2079ui_story then
					arg_1_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect2079ui_story then
				arg_1_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_4_39 = "2078ui_story"

			if arg_1_1.actors_[var_4_39] == nil then
				local var_4_40 = Object.Instantiate(Asset.Load("Char/" .. var_4_39), arg_1_1.stage_.transform)

				var_4_40.name = var_4_39
				var_4_40.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_39] = var_4_40

				local var_4_41 = var_4_40:GetComponentInChildren(typeof(CharacterEffect))

				var_4_41.enabled = true

				local var_4_42 = GameObjectTools.GetOrAddComponent(var_4_40, typeof(DynamicBoneHelper))

				if var_4_42 then
					var_4_42:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_41.transform, false)

				arg_1_1.var_[var_4_39 .. "Animator"] = var_4_41.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_39 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_39 .. "LipSync"] = var_4_41.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_43 = 2

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_4_44 = 0
			local var_4_45 = 0.6

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				local var_4_46 = "play"
				local var_4_47 = "music"

				arg_1_1:AudioAction(var_4_46, var_4_47, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_48 = 0.733333333333333
			local var_4_49 = 1

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				local var_4_50 = "play"
				local var_4_51 = "music"

				arg_1_1:AudioAction(var_4_50, var_4_51, "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_52 = 2
			local var_4_53 = 0.3

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_54 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_54:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_55 = arg_1_1:FormatText(StoryNameCfg[530].name)

				arg_1_1.leftNameTxt_.text = var_4_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_56 = arg_1_1:GetWordFromCfg(317282001)
				local var_4_57 = arg_1_1:FormatText(var_4_56.content)

				arg_1_1.text_.text = var_4_57

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_58 = 12
				local var_4_59 = utf8.len(var_4_57)
				local var_4_60 = var_4_58 <= 0 and var_4_53 or var_4_53 * (var_4_59 / var_4_58)

				if var_4_60 > 0 and var_4_53 < var_4_60 then
					arg_1_1.talkMaxDuration = var_4_60
					var_4_52 = var_4_52 + 0.3

					if var_4_60 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_52
					end
				end

				arg_1_1.text_.text = var_4_57
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282001", "story_v_out_317282.awb") ~= 0 then
					local var_4_61 = manager.audio:GetVoiceLength("story_v_out_317282", "317282001", "story_v_out_317282.awb") / 1000

					if var_4_61 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_52
					end

					if var_4_56.prefab_name ~= "" and arg_1_1.actors_[var_4_56.prefab_name] ~= nil then
						local var_4_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_56.prefab_name].transform, "story_v_out_317282", "317282001", "story_v_out_317282.awb")

						arg_1_1:RecordAudio("317282001", var_4_62)
						arg_1_1:RecordAudio("317282001", var_4_62)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_317282", "317282001", "story_v_out_317282.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_317282", "317282001", "story_v_out_317282.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_63 = var_4_52 + 0.3
			local var_4_64 = math.max(var_4_53, arg_1_1.talkMaxDuration)

			if var_4_63 <= arg_1_1.time_ and arg_1_1.time_ < var_4_63 + var_4_64 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_63) / var_4_64

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_63 + var_4_64 and arg_1_1.time_ < var_4_63 + var_4_64 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play317282002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317282002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play317282003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["2079ui_story"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos2079ui_story = var_10_0.localPosition
			end

			local var_10_2 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2
				local var_10_4 = Vector3.New(0, 100, 0)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2079ui_story, var_10_4, var_10_3)

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
			local var_10_16 = 0.65

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

				local var_10_17 = arg_7_1:GetWordFromCfg(317282002)
				local var_10_18 = arg_7_1:FormatText(var_10_17.content)

				arg_7_1.text_.text = var_10_18

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_19 = 26
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
	Play317282003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317282003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play317282004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.025

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

				local var_14_2 = arg_11_1:GetWordFromCfg(317282003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 41
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
	Play317282004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317282004
		arg_15_1.duration_ = 1.999999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play317282005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1093ui_story"

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

			local var_18_4 = arg_15_1.actors_["1093ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1093ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0, -1.11, -5.88)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1093ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = arg_15_1.actors_["1093ui_story"]
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story == nil then
				arg_15_1.var_.characterEffect1093ui_story = var_18_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_15 = 0.200000002980232

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15

				if arg_15_1.var_.characterEffect1093ui_story then
					arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story then
				arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_19 = 0
			local var_18_20 = 0.225

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_21 = arg_15_1:FormatText(StoryNameCfg[73].name)

				arg_15_1.leftNameTxt_.text = var_18_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(317282004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 9
				local var_18_25 = utf8.len(var_18_23)
				local var_18_26 = var_18_24 <= 0 and var_18_20 or var_18_20 * (var_18_25 / var_18_24)

				if var_18_26 > 0 and var_18_20 < var_18_26 then
					arg_15_1.talkMaxDuration = var_18_26

					if var_18_26 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_26 + var_18_19
					end
				end

				arg_15_1.text_.text = var_18_23
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282004", "story_v_out_317282.awb") ~= 0 then
					local var_18_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282004", "story_v_out_317282.awb") / 1000

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end

					if var_18_22.prefab_name ~= "" and arg_15_1.actors_[var_18_22.prefab_name] ~= nil then
						local var_18_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_22.prefab_name].transform, "story_v_out_317282", "317282004", "story_v_out_317282.awb")

						arg_15_1:RecordAudio("317282004", var_18_28)
						arg_15_1:RecordAudio("317282004", var_18_28)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317282", "317282004", "story_v_out_317282.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317282", "317282004", "story_v_out_317282.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_29 = math.max(var_18_20, arg_15_1.talkMaxDuration)

			if var_18_19 <= arg_15_1.time_ and arg_15_1.time_ < var_18_19 + var_18_29 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_19) / var_18_29

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_19 + var_18_29 and arg_15_1.time_ < var_18_19 + var_18_29 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play317282005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317282005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play317282006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1093ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1093ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1093ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, 100, 0)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["1093ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story == nil then
				arg_19_1.var_.characterEffect1093ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect1093ui_story then
					local var_22_13 = Mathf.Lerp(0, 0.5, var_22_12)

					arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_13
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story then
				local var_22_14 = 0.5

				arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_14
			end

			local var_22_15 = 0
			local var_22_16 = 1.275

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_17 = arg_19_1:GetWordFromCfg(317282005)
				local var_22_18 = arg_19_1:FormatText(var_22_17.content)

				arg_19_1.text_.text = var_22_18

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_19 = 51
				local var_22_20 = utf8.len(var_22_18)
				local var_22_21 = var_22_19 <= 0 and var_22_16 or var_22_16 * (var_22_20 / var_22_19)

				if var_22_21 > 0 and var_22_16 < var_22_21 then
					arg_19_1.talkMaxDuration = var_22_21

					if var_22_21 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_15
					end
				end

				arg_19_1.text_.text = var_22_18
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_22 = math.max(var_22_16, arg_19_1.talkMaxDuration)

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_22 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_15) / var_22_22

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_15 + var_22_22 and arg_19_1.time_ < var_22_15 + var_22_22 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317282006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317282006
		arg_23_1.duration_ = 1.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play317282007(arg_23_1)
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
				local var_26_4 = Vector3.New(0, -1.28, -5.6)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos2078ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -1.28, -5.6)

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
					arg_23_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect2078ui_story then
				arg_23_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_26_14 = 0
			local var_26_15 = 0.075

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_16 = arg_23_1:FormatText(StoryNameCfg[528].name)

				arg_23_1.leftNameTxt_.text = var_26_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_17 = arg_23_1:GetWordFromCfg(317282006)
				local var_26_18 = arg_23_1:FormatText(var_26_17.content)

				arg_23_1.text_.text = var_26_18

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_19 = 3
				local var_26_20 = utf8.len(var_26_18)
				local var_26_21 = var_26_19 <= 0 and var_26_15 or var_26_15 * (var_26_20 / var_26_19)

				if var_26_21 > 0 and var_26_15 < var_26_21 then
					arg_23_1.talkMaxDuration = var_26_21

					if var_26_21 + var_26_14 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_14
					end
				end

				arg_23_1.text_.text = var_26_18
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282006", "story_v_out_317282.awb") ~= 0 then
					local var_26_22 = manager.audio:GetVoiceLength("story_v_out_317282", "317282006", "story_v_out_317282.awb") / 1000

					if var_26_22 + var_26_14 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_22 + var_26_14
					end

					if var_26_17.prefab_name ~= "" and arg_23_1.actors_[var_26_17.prefab_name] ~= nil then
						local var_26_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_17.prefab_name].transform, "story_v_out_317282", "317282006", "story_v_out_317282.awb")

						arg_23_1:RecordAudio("317282006", var_26_23)
						arg_23_1:RecordAudio("317282006", var_26_23)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_317282", "317282006", "story_v_out_317282.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_317282", "317282006", "story_v_out_317282.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_24 = math.max(var_26_15, arg_23_1.talkMaxDuration)

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_24 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_14) / var_26_24

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_14 + var_26_24 and arg_23_1.time_ < var_26_14 + var_26_24 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play317282007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317282007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play317282008(arg_27_1)
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
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos2078ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, 100, 0)

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

			local var_30_11 = 0.166000001132488

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect2078ui_story then
					local var_30_13 = Mathf.Lerp(0, 0.5, var_30_12)

					arg_27_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_27_1.var_.characterEffect2078ui_story.fillRatio = var_30_13
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect2078ui_story then
				local var_30_14 = 0.5

				arg_27_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_27_1.var_.characterEffect2078ui_story.fillRatio = var_30_14
			end

			local var_30_15 = 0
			local var_30_16 = 0.6

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				local var_30_17 = "play"
				local var_30_18 = "effect"

				arg_27_1:AudioAction(var_30_17, var_30_18, "se_story_120_00", "se_story_120_00_gunshot", "")
			end

			local var_30_19 = 0
			local var_30_20 = 1.425

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_21 = arg_27_1:GetWordFromCfg(317282007)
				local var_30_22 = arg_27_1:FormatText(var_30_21.content)

				arg_27_1.text_.text = var_30_22

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_23 = 57
				local var_30_24 = utf8.len(var_30_22)
				local var_30_25 = var_30_23 <= 0 and var_30_20 or var_30_20 * (var_30_24 / var_30_23)

				if var_30_25 > 0 and var_30_20 < var_30_25 then
					arg_27_1.talkMaxDuration = var_30_25

					if var_30_25 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_25 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_22
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_26 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_26 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_26

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_26 and arg_27_1.time_ < var_30_19 + var_30_26 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play317282008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 317282008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play317282009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.325

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_2 = arg_31_1:GetWordFromCfg(317282008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 53
				local var_34_5 = utf8.len(var_34_3)
				local var_34_6 = var_34_4 <= 0 and var_34_1 or var_34_1 * (var_34_5 / var_34_4)

				if var_34_6 > 0 and var_34_1 < var_34_6 then
					arg_31_1.talkMaxDuration = var_34_6

					if var_34_6 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_6 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_3
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_7 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_7 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_7

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_7 and arg_31_1.time_ < var_34_0 + var_34_7 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play317282009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317282009
		arg_35_1.duration_ = 5.1

		local var_35_0 = {
			zh = 2.4,
			ja = 5.1
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
				arg_35_0:Play317282010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1093ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1093ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, -1.11, -5.88)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1093ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1093ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story == nil then
				arg_35_1.var_.characterEffect1093ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1093ui_story then
					arg_35_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story then
				arg_35_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_2")
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_38_15 = 0
			local var_38_16 = 0.275

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_17 = arg_35_1:FormatText(StoryNameCfg[73].name)

				arg_35_1.leftNameTxt_.text = var_38_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_18 = arg_35_1:GetWordFromCfg(317282009)
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282009", "story_v_out_317282.awb") ~= 0 then
					local var_38_23 = manager.audio:GetVoiceLength("story_v_out_317282", "317282009", "story_v_out_317282.awb") / 1000

					if var_38_23 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_15
					end

					if var_38_18.prefab_name ~= "" and arg_35_1.actors_[var_38_18.prefab_name] ~= nil then
						local var_38_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_18.prefab_name].transform, "story_v_out_317282", "317282009", "story_v_out_317282.awb")

						arg_35_1:RecordAudio("317282009", var_38_24)
						arg_35_1:RecordAudio("317282009", var_38_24)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_317282", "317282009", "story_v_out_317282.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_317282", "317282009", "story_v_out_317282.awb")
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
	Play317282010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317282010
		arg_39_1.duration_ = 5.133

		local var_39_0 = {
			zh = 5.133,
			ja = 3.933
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
				arg_39_0:Play317282011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1093ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1093ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1093ui_story, var_42_4, var_42_3)

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

			local var_42_9 = arg_39_1.actors_["1093ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1093ui_story == nil then
				arg_39_1.var_.characterEffect1093ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1093ui_story then
					local var_42_13 = Mathf.Lerp(0, 0.5, var_42_12)

					arg_39_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1093ui_story.fillRatio = var_42_13
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1093ui_story then
				local var_42_14 = 0.5

				arg_39_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1093ui_story.fillRatio = var_42_14
			end

			local var_42_15 = arg_39_1.actors_["2079ui_story"].transform
			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.var_.moveOldPos2079ui_story = var_42_15.localPosition
			end

			local var_42_17 = 0.001

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / var_42_17
				local var_42_19 = Vector3.New(-0.7, -1.28, -5.6)

				var_42_15.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos2079ui_story, var_42_19, var_42_18)

				local var_42_20 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_20.x, var_42_20.y, var_42_20.z)

				local var_42_21 = var_42_15.localEulerAngles

				var_42_21.z = 0
				var_42_21.x = 0
				var_42_15.localEulerAngles = var_42_21
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 then
				var_42_15.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_42_22 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_22.x, var_42_22.y, var_42_22.z)

				local var_42_23 = var_42_15.localEulerAngles

				var_42_23.z = 0
				var_42_23.x = 0
				var_42_15.localEulerAngles = var_42_23
			end

			local var_42_24 = arg_39_1.actors_["2079ui_story"]
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 and arg_39_1.var_.characterEffect2079ui_story == nil then
				arg_39_1.var_.characterEffect2079ui_story = var_42_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_26 = 0.200000002980232

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26

				if arg_39_1.var_.characterEffect2079ui_story then
					arg_39_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 and arg_39_1.var_.characterEffect2079ui_story then
				arg_39_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_42_28 = 0

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_42_29 = arg_39_1.actors_["2078ui_story"].transform
			local var_42_30 = 0

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.var_.moveOldPos2078ui_story = var_42_29.localPosition
			end

			local var_42_31 = 0.001

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_31 then
				local var_42_32 = (arg_39_1.time_ - var_42_30) / var_42_31
				local var_42_33 = Vector3.New(0.7, -1.28, -5.6)

				var_42_29.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos2078ui_story, var_42_33, var_42_32)

				local var_42_34 = manager.ui.mainCamera.transform.position - var_42_29.position

				var_42_29.forward = Vector3.New(var_42_34.x, var_42_34.y, var_42_34.z)

				local var_42_35 = var_42_29.localEulerAngles

				var_42_35.z = 0
				var_42_35.x = 0
				var_42_29.localEulerAngles = var_42_35
			end

			if arg_39_1.time_ >= var_42_30 + var_42_31 and arg_39_1.time_ < var_42_30 + var_42_31 + arg_42_0 then
				var_42_29.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_42_36 = manager.ui.mainCamera.transform.position - var_42_29.position

				var_42_29.forward = Vector3.New(var_42_36.x, var_42_36.y, var_42_36.z)

				local var_42_37 = var_42_29.localEulerAngles

				var_42_37.z = 0
				var_42_37.x = 0
				var_42_29.localEulerAngles = var_42_37
			end

			local var_42_38 = arg_39_1.actors_["2078ui_story"]
			local var_42_39 = 0

			if var_42_39 < arg_39_1.time_ and arg_39_1.time_ <= var_42_39 + arg_42_0 and arg_39_1.var_.characterEffect2078ui_story == nil then
				arg_39_1.var_.characterEffect2078ui_story = var_42_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_40 = 0.200000002980232

			if var_42_39 <= arg_39_1.time_ and arg_39_1.time_ < var_42_39 + var_42_40 then
				local var_42_41 = (arg_39_1.time_ - var_42_39) / var_42_40

				if arg_39_1.var_.characterEffect2078ui_story then
					local var_42_42 = Mathf.Lerp(0, 0.5, var_42_41)

					arg_39_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_39_1.var_.characterEffect2078ui_story.fillRatio = var_42_42
				end
			end

			if arg_39_1.time_ >= var_42_39 + var_42_40 and arg_39_1.time_ < var_42_39 + var_42_40 + arg_42_0 and arg_39_1.var_.characterEffect2078ui_story then
				local var_42_43 = 0.5

				arg_39_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_39_1.var_.characterEffect2078ui_story.fillRatio = var_42_43
			end

			local var_42_44 = 0

			if var_42_44 < arg_39_1.time_ and arg_39_1.time_ <= var_42_44 + arg_42_0 then
				arg_39_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_42_45 = 0
			local var_42_46 = 0.3

			if var_42_45 < arg_39_1.time_ and arg_39_1.time_ <= var_42_45 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_47 = arg_39_1:FormatText(StoryNameCfg[571].name)

				arg_39_1.leftNameTxt_.text = var_42_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_48 = arg_39_1:GetWordFromCfg(317282010)
				local var_42_49 = arg_39_1:FormatText(var_42_48.content)

				arg_39_1.text_.text = var_42_49

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_50 = 12
				local var_42_51 = utf8.len(var_42_49)
				local var_42_52 = var_42_50 <= 0 and var_42_46 or var_42_46 * (var_42_51 / var_42_50)

				if var_42_52 > 0 and var_42_46 < var_42_52 then
					arg_39_1.talkMaxDuration = var_42_52

					if var_42_52 + var_42_45 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_52 + var_42_45
					end
				end

				arg_39_1.text_.text = var_42_49
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282010", "story_v_out_317282.awb") ~= 0 then
					local var_42_53 = manager.audio:GetVoiceLength("story_v_out_317282", "317282010", "story_v_out_317282.awb") / 1000

					if var_42_53 + var_42_45 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_53 + var_42_45
					end

					if var_42_48.prefab_name ~= "" and arg_39_1.actors_[var_42_48.prefab_name] ~= nil then
						local var_42_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_48.prefab_name].transform, "story_v_out_317282", "317282010", "story_v_out_317282.awb")

						arg_39_1:RecordAudio("317282010", var_42_54)
						arg_39_1:RecordAudio("317282010", var_42_54)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_317282", "317282010", "story_v_out_317282.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_317282", "317282010", "story_v_out_317282.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_55 = math.max(var_42_46, arg_39_1.talkMaxDuration)

			if var_42_45 <= arg_39_1.time_ and arg_39_1.time_ < var_42_45 + var_42_55 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_45) / var_42_55

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_45 + var_42_55 and arg_39_1.time_ < var_42_45 + var_42_55 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play317282011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 317282011
		arg_43_1.duration_ = 2.1

		local var_43_0 = {
			zh = 2.1,
			ja = 1.766
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
				arg_43_0:Play317282012(arg_43_1)
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
				local var_46_4 = Vector3.New(0.7, -1.28, -5.6)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos2078ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

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
					arg_43_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect2078ui_story then
				arg_43_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_46_13 = arg_43_1.actors_["2079ui_story"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.characterEffect2079ui_story == nil then
				arg_43_1.var_.characterEffect2079ui_story = var_46_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_15 = 0.200000002980232

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.characterEffect2079ui_story then
					local var_46_17 = Mathf.Lerp(0, 0.5, var_46_16)

					arg_43_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_43_1.var_.characterEffect2079ui_story.fillRatio = var_46_17
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.characterEffect2079ui_story then
				local var_46_18 = 0.5

				arg_43_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_43_1.var_.characterEffect2079ui_story.fillRatio = var_46_18
			end

			local var_46_19 = 0
			local var_46_20 = 0.15

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[528].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(317282011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 6
				local var_46_25 = utf8.len(var_46_23)
				local var_46_26 = var_46_24 <= 0 and var_46_20 or var_46_20 * (var_46_25 / var_46_24)

				if var_46_26 > 0 and var_46_20 < var_46_26 then
					arg_43_1.talkMaxDuration = var_46_26

					if var_46_26 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_26 + var_46_19
					end
				end

				arg_43_1.text_.text = var_46_23
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282011", "story_v_out_317282.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282011", "story_v_out_317282.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_317282", "317282011", "story_v_out_317282.awb")

						arg_43_1:RecordAudio("317282011", var_46_28)
						arg_43_1:RecordAudio("317282011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_317282", "317282011", "story_v_out_317282.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_317282", "317282011", "story_v_out_317282.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_29 = math.max(var_46_20, arg_43_1.talkMaxDuration)

			if var_46_19 <= arg_43_1.time_ and arg_43_1.time_ < var_46_19 + var_46_29 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_19) / var_46_29

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_19 + var_46_29 and arg_43_1.time_ < var_46_19 + var_46_29 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play317282012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 317282012
		arg_47_1.duration_ = 3.266

		local var_47_0 = {
			zh = 3.266,
			ja = 2.1
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
				arg_47_0:Play317282013(arg_47_1)
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
					arg_47_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect2079ui_story then
				arg_47_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_50_13 = arg_47_1.actors_["2078ui_story"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.characterEffect2078ui_story == nil then
				arg_47_1.var_.characterEffect2078ui_story = var_50_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_15 = 0.200000002980232

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.characterEffect2078ui_story then
					local var_50_17 = Mathf.Lerp(0, 0.5, var_50_16)

					arg_47_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_47_1.var_.characterEffect2078ui_story.fillRatio = var_50_17
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect2078ui_story then
				local var_50_18 = 0.5

				arg_47_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_47_1.var_.characterEffect2078ui_story.fillRatio = var_50_18
			end

			local var_50_19 = 0
			local var_50_20 = 0.25

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_21 = arg_47_1:FormatText(StoryNameCfg[571].name)

				arg_47_1.leftNameTxt_.text = var_50_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_22 = arg_47_1:GetWordFromCfg(317282012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 10
				local var_50_25 = utf8.len(var_50_23)
				local var_50_26 = var_50_24 <= 0 and var_50_20 or var_50_20 * (var_50_25 / var_50_24)

				if var_50_26 > 0 and var_50_20 < var_50_26 then
					arg_47_1.talkMaxDuration = var_50_26

					if var_50_26 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_26 + var_50_19
					end
				end

				arg_47_1.text_.text = var_50_23
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282012", "story_v_out_317282.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282012", "story_v_out_317282.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_317282", "317282012", "story_v_out_317282.awb")

						arg_47_1:RecordAudio("317282012", var_50_28)
						arg_47_1:RecordAudio("317282012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_317282", "317282012", "story_v_out_317282.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_317282", "317282012", "story_v_out_317282.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_29 = math.max(var_50_20, arg_47_1.talkMaxDuration)

			if var_50_19 <= arg_47_1.time_ and arg_47_1.time_ < var_50_19 + var_50_29 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_19) / var_50_29

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_19 + var_50_29 and arg_47_1.time_ < var_50_19 + var_50_29 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play317282013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317282013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play317282014(arg_51_1)
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
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos2079ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, 100, 0)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["2078ui_story"].transform
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.var_.moveOldPos2078ui_story = var_54_9.localPosition
			end

			local var_54_11 = 0.001

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11
				local var_54_13 = Vector3.New(0, 100, 0)

				var_54_9.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos2078ui_story, var_54_13, var_54_12)

				local var_54_14 = manager.ui.mainCamera.transform.position - var_54_9.position

				var_54_9.forward = Vector3.New(var_54_14.x, var_54_14.y, var_54_14.z)

				local var_54_15 = var_54_9.localEulerAngles

				var_54_15.z = 0
				var_54_15.x = 0
				var_54_9.localEulerAngles = var_54_15
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 then
				var_54_9.localPosition = Vector3.New(0, 100, 0)

				local var_54_16 = manager.ui.mainCamera.transform.position - var_54_9.position

				var_54_9.forward = Vector3.New(var_54_16.x, var_54_16.y, var_54_16.z)

				local var_54_17 = var_54_9.localEulerAngles

				var_54_17.z = 0
				var_54_17.x = 0
				var_54_9.localEulerAngles = var_54_17
			end

			local var_54_18 = 0
			local var_54_19 = 0.275

			if var_54_18 < arg_51_1.time_ and arg_51_1.time_ <= var_54_18 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_20 = arg_51_1:GetWordFromCfg(317282013)
				local var_54_21 = arg_51_1:FormatText(var_54_20.content)

				arg_51_1.text_.text = var_54_21

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_22 = 11
				local var_54_23 = utf8.len(var_54_21)
				local var_54_24 = var_54_22 <= 0 and var_54_19 or var_54_19 * (var_54_23 / var_54_22)

				if var_54_24 > 0 and var_54_19 < var_54_24 then
					arg_51_1.talkMaxDuration = var_54_24

					if var_54_24 + var_54_18 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_24 + var_54_18
					end
				end

				arg_51_1.text_.text = var_54_21
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_25 = math.max(var_54_19, arg_51_1.talkMaxDuration)

			if var_54_18 <= arg_51_1.time_ and arg_51_1.time_ < var_54_18 + var_54_25 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_18) / var_54_25

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_18 + var_54_25 and arg_51_1.time_ < var_54_18 + var_54_25 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play317282014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317282014
		arg_55_1.duration_ = 3.7

		local var_55_0 = {
			zh = 3.1,
			ja = 3.7
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
				arg_55_0:Play317282015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = "1015ui_story"

			if arg_55_1.actors_[var_58_0] == nil then
				local var_58_1 = Object.Instantiate(Asset.Load("Char/" .. var_58_0), arg_55_1.stage_.transform)

				var_58_1.name = var_58_0
				var_58_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.actors_[var_58_0] = var_58_1

				local var_58_2 = var_58_1:GetComponentInChildren(typeof(CharacterEffect))

				var_58_2.enabled = true

				local var_58_3 = GameObjectTools.GetOrAddComponent(var_58_1, typeof(DynamicBoneHelper))

				if var_58_3 then
					var_58_3:EnableDynamicBone(false)
				end

				arg_55_1:ShowWeapon(var_58_2.transform, false)

				arg_55_1.var_[var_58_0 .. "Animator"] = var_58_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_55_1.var_[var_58_0 .. "Animator"].applyRootMotion = true
				arg_55_1.var_[var_58_0 .. "LipSync"] = var_58_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_58_4 = arg_55_1.actors_["1015ui_story"].transform
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.var_.moveOldPos1015ui_story = var_58_4.localPosition
			end

			local var_58_6 = 0.001

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6
				local var_58_8 = Vector3.New(0, -1.15, -6.2)

				var_58_4.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1015ui_story, var_58_8, var_58_7)

				local var_58_9 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_9.x, var_58_9.y, var_58_9.z)

				local var_58_10 = var_58_4.localEulerAngles

				var_58_10.z = 0
				var_58_10.x = 0
				var_58_4.localEulerAngles = var_58_10
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 then
				var_58_4.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_58_11 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_11.x, var_58_11.y, var_58_11.z)

				local var_58_12 = var_58_4.localEulerAngles

				var_58_12.z = 0
				var_58_12.x = 0
				var_58_4.localEulerAngles = var_58_12
			end

			local var_58_13 = arg_55_1.actors_["1015ui_story"]
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 and arg_55_1.var_.characterEffect1015ui_story == nil then
				arg_55_1.var_.characterEffect1015ui_story = var_58_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_15 = 0.200000002980232

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_14) / var_58_15

				if arg_55_1.var_.characterEffect1015ui_story then
					arg_55_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_14 + var_58_15 and arg_55_1.time_ < var_58_14 + var_58_15 + arg_58_0 and arg_55_1.var_.characterEffect1015ui_story then
				arg_55_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_58_17 = 0

			if var_58_17 < arg_55_1.time_ and arg_55_1.time_ <= var_58_17 + arg_58_0 then
				arg_55_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_58_18 = 0

			if var_58_18 < arg_55_1.time_ and arg_55_1.time_ <= var_58_18 + arg_58_0 then
				arg_55_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_19 = 0
			local var_58_20 = 0.35

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_21 = arg_55_1:FormatText(StoryNameCfg[479].name)

				arg_55_1.leftNameTxt_.text = var_58_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_22 = arg_55_1:GetWordFromCfg(317282014)
				local var_58_23 = arg_55_1:FormatText(var_58_22.content)

				arg_55_1.text_.text = var_58_23

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_24 = 14
				local var_58_25 = utf8.len(var_58_23)
				local var_58_26 = var_58_24 <= 0 and var_58_20 or var_58_20 * (var_58_25 / var_58_24)

				if var_58_26 > 0 and var_58_20 < var_58_26 then
					arg_55_1.talkMaxDuration = var_58_26

					if var_58_26 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_26 + var_58_19
					end
				end

				arg_55_1.text_.text = var_58_23
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282014", "story_v_out_317282.awb") ~= 0 then
					local var_58_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282014", "story_v_out_317282.awb") / 1000

					if var_58_27 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_27 + var_58_19
					end

					if var_58_22.prefab_name ~= "" and arg_55_1.actors_[var_58_22.prefab_name] ~= nil then
						local var_58_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_22.prefab_name].transform, "story_v_out_317282", "317282014", "story_v_out_317282.awb")

						arg_55_1:RecordAudio("317282014", var_58_28)
						arg_55_1:RecordAudio("317282014", var_58_28)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_317282", "317282014", "story_v_out_317282.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_317282", "317282014", "story_v_out_317282.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_29 = math.max(var_58_20, arg_55_1.talkMaxDuration)

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_29 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_19) / var_58_29

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_19 + var_58_29 and arg_55_1.time_ < var_58_19 + var_58_29 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play317282015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 317282015
		arg_59_1.duration_ = 3.7

		local var_59_0 = {
			zh = 2.7,
			ja = 3.7
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
				arg_59_0:Play317282016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["2079ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos2079ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0, -1.28, -5.6)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos2079ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["2079ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect2079ui_story == nil then
				arg_59_1.var_.characterEffect2079ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect2079ui_story then
					arg_59_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect2079ui_story then
				arg_59_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_62_14 = arg_59_1.actors_["1015ui_story"].transform
			local var_62_15 = 0

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1.var_.moveOldPos1015ui_story = var_62_14.localPosition
			end

			local var_62_16 = 0.001

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_16 then
				local var_62_17 = (arg_59_1.time_ - var_62_15) / var_62_16
				local var_62_18 = Vector3.New(0, 100, 0)

				var_62_14.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1015ui_story, var_62_18, var_62_17)

				local var_62_19 = manager.ui.mainCamera.transform.position - var_62_14.position

				var_62_14.forward = Vector3.New(var_62_19.x, var_62_19.y, var_62_19.z)

				local var_62_20 = var_62_14.localEulerAngles

				var_62_20.z = 0
				var_62_20.x = 0
				var_62_14.localEulerAngles = var_62_20
			end

			if arg_59_1.time_ >= var_62_15 + var_62_16 and arg_59_1.time_ < var_62_15 + var_62_16 + arg_62_0 then
				var_62_14.localPosition = Vector3.New(0, 100, 0)

				local var_62_21 = manager.ui.mainCamera.transform.position - var_62_14.position

				var_62_14.forward = Vector3.New(var_62_21.x, var_62_21.y, var_62_21.z)

				local var_62_22 = var_62_14.localEulerAngles

				var_62_22.z = 0
				var_62_22.x = 0
				var_62_14.localEulerAngles = var_62_22
			end

			local var_62_23 = arg_59_1.actors_["1015ui_story"]
			local var_62_24 = 0

			if var_62_24 < arg_59_1.time_ and arg_59_1.time_ <= var_62_24 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story == nil then
				arg_59_1.var_.characterEffect1015ui_story = var_62_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_25 = 0.200000002980232

			if var_62_24 <= arg_59_1.time_ and arg_59_1.time_ < var_62_24 + var_62_25 then
				local var_62_26 = (arg_59_1.time_ - var_62_24) / var_62_25

				if arg_59_1.var_.characterEffect1015ui_story then
					local var_62_27 = Mathf.Lerp(0, 0.5, var_62_26)

					arg_59_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1015ui_story.fillRatio = var_62_27
				end
			end

			if arg_59_1.time_ >= var_62_24 + var_62_25 and arg_59_1.time_ < var_62_24 + var_62_25 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story then
				local var_62_28 = 0.5

				arg_59_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1015ui_story.fillRatio = var_62_28
			end

			local var_62_29 = 0
			local var_62_30 = 0.3

			if var_62_29 < arg_59_1.time_ and arg_59_1.time_ <= var_62_29 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_31 = arg_59_1:FormatText(StoryNameCfg[571].name)

				arg_59_1.leftNameTxt_.text = var_62_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_32 = arg_59_1:GetWordFromCfg(317282015)
				local var_62_33 = arg_59_1:FormatText(var_62_32.content)

				arg_59_1.text_.text = var_62_33

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_34 = 12
				local var_62_35 = utf8.len(var_62_33)
				local var_62_36 = var_62_34 <= 0 and var_62_30 or var_62_30 * (var_62_35 / var_62_34)

				if var_62_36 > 0 and var_62_30 < var_62_36 then
					arg_59_1.talkMaxDuration = var_62_36

					if var_62_36 + var_62_29 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_36 + var_62_29
					end
				end

				arg_59_1.text_.text = var_62_33
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282015", "story_v_out_317282.awb") ~= 0 then
					local var_62_37 = manager.audio:GetVoiceLength("story_v_out_317282", "317282015", "story_v_out_317282.awb") / 1000

					if var_62_37 + var_62_29 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_37 + var_62_29
					end

					if var_62_32.prefab_name ~= "" and arg_59_1.actors_[var_62_32.prefab_name] ~= nil then
						local var_62_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_32.prefab_name].transform, "story_v_out_317282", "317282015", "story_v_out_317282.awb")

						arg_59_1:RecordAudio("317282015", var_62_38)
						arg_59_1:RecordAudio("317282015", var_62_38)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_317282", "317282015", "story_v_out_317282.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_317282", "317282015", "story_v_out_317282.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_39 = math.max(var_62_30, arg_59_1.talkMaxDuration)

			if var_62_29 <= arg_59_1.time_ and arg_59_1.time_ < var_62_29 + var_62_39 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_29) / var_62_39

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_29 + var_62_39 and arg_59_1.time_ < var_62_29 + var_62_39 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play317282016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317282016
		arg_63_1.duration_ = 1.999999999999

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play317282017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1015ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1015ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, -1.15, -6.2)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1015ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1015ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1015ui_story == nil then
				arg_63_1.var_.characterEffect1015ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1015ui_story then
					arg_63_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1015ui_story then
				arg_63_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_66_15 = arg_63_1.actors_["2079ui_story"].transform
			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 then
				arg_63_1.var_.moveOldPos2079ui_story = var_66_15.localPosition
			end

			local var_66_17 = 0.001

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17
				local var_66_19 = Vector3.New(0, 100, 0)

				var_66_15.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2079ui_story, var_66_19, var_66_18)

				local var_66_20 = manager.ui.mainCamera.transform.position - var_66_15.position

				var_66_15.forward = Vector3.New(var_66_20.x, var_66_20.y, var_66_20.z)

				local var_66_21 = var_66_15.localEulerAngles

				var_66_21.z = 0
				var_66_21.x = 0
				var_66_15.localEulerAngles = var_66_21
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 then
				var_66_15.localPosition = Vector3.New(0, 100, 0)

				local var_66_22 = manager.ui.mainCamera.transform.position - var_66_15.position

				var_66_15.forward = Vector3.New(var_66_22.x, var_66_22.y, var_66_22.z)

				local var_66_23 = var_66_15.localEulerAngles

				var_66_23.z = 0
				var_66_23.x = 0
				var_66_15.localEulerAngles = var_66_23
			end

			local var_66_24 = arg_63_1.actors_["2079ui_story"]
			local var_66_25 = 0

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story == nil then
				arg_63_1.var_.characterEffect2079ui_story = var_66_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_26 = 0.200000002980232

			if var_66_25 <= arg_63_1.time_ and arg_63_1.time_ < var_66_25 + var_66_26 then
				local var_66_27 = (arg_63_1.time_ - var_66_25) / var_66_26

				if arg_63_1.var_.characterEffect2079ui_story then
					local var_66_28 = Mathf.Lerp(0, 0.5, var_66_27)

					arg_63_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_63_1.var_.characterEffect2079ui_story.fillRatio = var_66_28
				end
			end

			if arg_63_1.time_ >= var_66_25 + var_66_26 and arg_63_1.time_ < var_66_25 + var_66_26 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story then
				local var_66_29 = 0.5

				arg_63_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_63_1.var_.characterEffect2079ui_story.fillRatio = var_66_29
			end

			local var_66_30 = 0
			local var_66_31 = 0.1

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_32 = arg_63_1:FormatText(StoryNameCfg[479].name)

				arg_63_1.leftNameTxt_.text = var_66_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_33 = arg_63_1:GetWordFromCfg(317282016)
				local var_66_34 = arg_63_1:FormatText(var_66_33.content)

				arg_63_1.text_.text = var_66_34

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_35 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282016", "story_v_out_317282.awb") ~= 0 then
					local var_66_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282016", "story_v_out_317282.awb") / 1000

					if var_66_38 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_38 + var_66_30
					end

					if var_66_33.prefab_name ~= "" and arg_63_1.actors_[var_66_33.prefab_name] ~= nil then
						local var_66_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_33.prefab_name].transform, "story_v_out_317282", "317282016", "story_v_out_317282.awb")

						arg_63_1:RecordAudio("317282016", var_66_39)
						arg_63_1:RecordAudio("317282016", var_66_39)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317282", "317282016", "story_v_out_317282.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317282", "317282016", "story_v_out_317282.awb")
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
	Play317282017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317282017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play317282018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1015ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1015ui_story == nil then
				arg_67_1.var_.characterEffect1015ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1015ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1015ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1015ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1015ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.625

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[7].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(317282017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 25
				local var_70_12 = utf8.len(var_70_10)
				local var_70_13 = var_70_11 <= 0 and var_70_7 or var_70_7 * (var_70_12 / var_70_11)

				if var_70_13 > 0 and var_70_7 < var_70_13 then
					arg_67_1.talkMaxDuration = var_70_13

					if var_70_13 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_13 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_10
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_14 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_14 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_14

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_14 and arg_67_1.time_ < var_70_6 + var_70_14 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317282018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317282018
		arg_71_1.duration_ = 6.7

		local var_71_0 = {
			zh = 5.233,
			ja = 6.7
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
				arg_71_0:Play317282019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1015ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1015ui_story == nil then
				arg_71_1.var_.characterEffect1015ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1015ui_story then
					arg_71_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1015ui_story then
				arg_71_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_74_4 = 0
			local var_74_5 = 0.725

			if var_74_4 < arg_71_1.time_ and arg_71_1.time_ <= var_74_4 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_6 = arg_71_1:FormatText(StoryNameCfg[479].name)

				arg_71_1.leftNameTxt_.text = var_74_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_7 = arg_71_1:GetWordFromCfg(317282018)
				local var_74_8 = arg_71_1:FormatText(var_74_7.content)

				arg_71_1.text_.text = var_74_8

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_9 = 29
				local var_74_10 = utf8.len(var_74_8)
				local var_74_11 = var_74_9 <= 0 and var_74_5 or var_74_5 * (var_74_10 / var_74_9)

				if var_74_11 > 0 and var_74_5 < var_74_11 then
					arg_71_1.talkMaxDuration = var_74_11

					if var_74_11 + var_74_4 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_11 + var_74_4
					end
				end

				arg_71_1.text_.text = var_74_8
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282018", "story_v_out_317282.awb") ~= 0 then
					local var_74_12 = manager.audio:GetVoiceLength("story_v_out_317282", "317282018", "story_v_out_317282.awb") / 1000

					if var_74_12 + var_74_4 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_4
					end

					if var_74_7.prefab_name ~= "" and arg_71_1.actors_[var_74_7.prefab_name] ~= nil then
						local var_74_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_7.prefab_name].transform, "story_v_out_317282", "317282018", "story_v_out_317282.awb")

						arg_71_1:RecordAudio("317282018", var_74_13)
						arg_71_1:RecordAudio("317282018", var_74_13)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_317282", "317282018", "story_v_out_317282.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_317282", "317282018", "story_v_out_317282.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_14 = math.max(var_74_5, arg_71_1.talkMaxDuration)

			if var_74_4 <= arg_71_1.time_ and arg_71_1.time_ < var_74_4 + var_74_14 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_4) / var_74_14

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_4 + var_74_14 and arg_71_1.time_ < var_74_4 + var_74_14 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317282019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 317282019
		arg_75_1.duration_ = 2.866

		local var_75_0 = {
			zh = 2.866,
			ja = 2.3
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
				arg_75_0:Play317282020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1015ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1015ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1015ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, 100, 0)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1015ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1015ui_story == nil then
				arg_75_1.var_.characterEffect1015ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1015ui_story then
					local var_78_13 = Mathf.Lerp(0, 0.5, var_78_12)

					arg_75_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1015ui_story.fillRatio = var_78_13
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1015ui_story then
				local var_78_14 = 0.5

				arg_75_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1015ui_story.fillRatio = var_78_14
			end

			local var_78_15 = arg_75_1.actors_["2079ui_story"].transform
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.var_.moveOldPos2079ui_story = var_78_15.localPosition
			end

			local var_78_17 = 0.001

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Vector3.New(0, -1.28, -5.6)

				var_78_15.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos2079ui_story, var_78_19, var_78_18)

				local var_78_20 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_20.x, var_78_20.y, var_78_20.z)

				local var_78_21 = var_78_15.localEulerAngles

				var_78_21.z = 0
				var_78_21.x = 0
				var_78_15.localEulerAngles = var_78_21
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				var_78_15.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_78_22 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_22.x, var_78_22.y, var_78_22.z)

				local var_78_23 = var_78_15.localEulerAngles

				var_78_23.z = 0
				var_78_23.x = 0
				var_78_15.localEulerAngles = var_78_23
			end

			local var_78_24 = arg_75_1.actors_["2079ui_story"]
			local var_78_25 = 0

			if var_78_25 < arg_75_1.time_ and arg_75_1.time_ <= var_78_25 + arg_78_0 and arg_75_1.var_.characterEffect2079ui_story == nil then
				arg_75_1.var_.characterEffect2079ui_story = var_78_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_26 = 0.200000002980232

			if var_78_25 <= arg_75_1.time_ and arg_75_1.time_ < var_78_25 + var_78_26 then
				local var_78_27 = (arg_75_1.time_ - var_78_25) / var_78_26

				if arg_75_1.var_.characterEffect2079ui_story then
					arg_75_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_25 + var_78_26 and arg_75_1.time_ < var_78_25 + var_78_26 + arg_78_0 and arg_75_1.var_.characterEffect2079ui_story then
				arg_75_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_78_28 = 0

			if var_78_28 < arg_75_1.time_ and arg_75_1.time_ <= var_78_28 + arg_78_0 then
				arg_75_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_78_29 = 0
			local var_78_30 = 0.25

			if var_78_29 < arg_75_1.time_ and arg_75_1.time_ <= var_78_29 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_31 = arg_75_1:FormatText(StoryNameCfg[571].name)

				arg_75_1.leftNameTxt_.text = var_78_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_32 = arg_75_1:GetWordFromCfg(317282019)
				local var_78_33 = arg_75_1:FormatText(var_78_32.content)

				arg_75_1.text_.text = var_78_33

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_34 = 10
				local var_78_35 = utf8.len(var_78_33)
				local var_78_36 = var_78_34 <= 0 and var_78_30 or var_78_30 * (var_78_35 / var_78_34)

				if var_78_36 > 0 and var_78_30 < var_78_36 then
					arg_75_1.talkMaxDuration = var_78_36

					if var_78_36 + var_78_29 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_36 + var_78_29
					end
				end

				arg_75_1.text_.text = var_78_33
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282019", "story_v_out_317282.awb") ~= 0 then
					local var_78_37 = manager.audio:GetVoiceLength("story_v_out_317282", "317282019", "story_v_out_317282.awb") / 1000

					if var_78_37 + var_78_29 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_37 + var_78_29
					end

					if var_78_32.prefab_name ~= "" and arg_75_1.actors_[var_78_32.prefab_name] ~= nil then
						local var_78_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_32.prefab_name].transform, "story_v_out_317282", "317282019", "story_v_out_317282.awb")

						arg_75_1:RecordAudio("317282019", var_78_38)
						arg_75_1:RecordAudio("317282019", var_78_38)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_317282", "317282019", "story_v_out_317282.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_317282", "317282019", "story_v_out_317282.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_39 = math.max(var_78_30, arg_75_1.talkMaxDuration)

			if var_78_29 <= arg_75_1.time_ and arg_75_1.time_ < var_78_29 + var_78_39 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_29) / var_78_39

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_29 + var_78_39 and arg_75_1.time_ < var_78_29 + var_78_39 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play317282020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317282020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play317282021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["2079ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos2079ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos2079ui_story, var_82_4, var_82_3)

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

			local var_82_9 = arg_79_1.actors_["2079ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect2079ui_story == nil then
				arg_79_1.var_.characterEffect2079ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect2079ui_story then
					local var_82_13 = Mathf.Lerp(0, 0.5, var_82_12)

					arg_79_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_79_1.var_.characterEffect2079ui_story.fillRatio = var_82_13
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect2079ui_story then
				local var_82_14 = 0.5

				arg_79_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_79_1.var_.characterEffect2079ui_story.fillRatio = var_82_14
			end

			local var_82_15 = 0
			local var_82_16 = 1

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

				local var_82_17 = arg_79_1:GetWordFromCfg(317282020)
				local var_82_18 = arg_79_1:FormatText(var_82_17.content)

				arg_79_1.text_.text = var_82_18

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_19 = 40
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
	Play317282021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 317282021
		arg_83_1.duration_ = 3.333

		local var_83_0 = {
			zh = 3.333,
			ja = 3.2
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
				arg_83_0:Play317282022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["2078ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos2078ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos2078ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["2078ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect2078ui_story == nil then
				arg_83_1.var_.characterEffect2078ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect2078ui_story then
					arg_83_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect2078ui_story then
				arg_83_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_86_14 = 0
			local var_86_15 = 0.275

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_16 = arg_83_1:FormatText(StoryNameCfg[528].name)

				arg_83_1.leftNameTxt_.text = var_86_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_17 = arg_83_1:GetWordFromCfg(317282021)
				local var_86_18 = arg_83_1:FormatText(var_86_17.content)

				arg_83_1.text_.text = var_86_18

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_19 = 11
				local var_86_20 = utf8.len(var_86_18)
				local var_86_21 = var_86_19 <= 0 and var_86_15 or var_86_15 * (var_86_20 / var_86_19)

				if var_86_21 > 0 and var_86_15 < var_86_21 then
					arg_83_1.talkMaxDuration = var_86_21

					if var_86_21 + var_86_14 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_14
					end
				end

				arg_83_1.text_.text = var_86_18
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282021", "story_v_out_317282.awb") ~= 0 then
					local var_86_22 = manager.audio:GetVoiceLength("story_v_out_317282", "317282021", "story_v_out_317282.awb") / 1000

					if var_86_22 + var_86_14 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_14
					end

					if var_86_17.prefab_name ~= "" and arg_83_1.actors_[var_86_17.prefab_name] ~= nil then
						local var_86_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_17.prefab_name].transform, "story_v_out_317282", "317282021", "story_v_out_317282.awb")

						arg_83_1:RecordAudio("317282021", var_86_23)
						arg_83_1:RecordAudio("317282021", var_86_23)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_317282", "317282021", "story_v_out_317282.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_317282", "317282021", "story_v_out_317282.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_24 = math.max(var_86_15, arg_83_1.talkMaxDuration)

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_24 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_14) / var_86_24

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_14 + var_86_24 and arg_83_1.time_ < var_86_14 + var_86_24 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play317282022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 317282022
		arg_87_1.duration_ = 5.833

		local var_87_0 = {
			zh = 4.6,
			ja = 5.833
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
				arg_87_0:Play317282023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["2079ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos2079ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0.7, -1.28, -5.6)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos2079ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["2079ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect2079ui_story == nil then
				arg_87_1.var_.characterEffect2079ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect2079ui_story then
					arg_87_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect2079ui_story then
				arg_87_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_90_14 = arg_87_1.actors_["2078ui_story"]
			local var_90_15 = 0

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 and arg_87_1.var_.characterEffect2078ui_story == nil then
				arg_87_1.var_.characterEffect2078ui_story = var_90_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_16 = 0.200000002980232

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_16 then
				local var_90_17 = (arg_87_1.time_ - var_90_15) / var_90_16

				if arg_87_1.var_.characterEffect2078ui_story then
					local var_90_18 = Mathf.Lerp(0, 0.5, var_90_17)

					arg_87_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_87_1.var_.characterEffect2078ui_story.fillRatio = var_90_18
				end
			end

			if arg_87_1.time_ >= var_90_15 + var_90_16 and arg_87_1.time_ < var_90_15 + var_90_16 + arg_90_0 and arg_87_1.var_.characterEffect2078ui_story then
				local var_90_19 = 0.5

				arg_87_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_87_1.var_.characterEffect2078ui_story.fillRatio = var_90_19
			end

			local var_90_20 = 0
			local var_90_21 = 0.125

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_22 = arg_87_1:FormatText(StoryNameCfg[571].name)

				arg_87_1.leftNameTxt_.text = var_90_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_23 = arg_87_1:GetWordFromCfg(317282022)
				local var_90_24 = arg_87_1:FormatText(var_90_23.content)

				arg_87_1.text_.text = var_90_24

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_25 = 5
				local var_90_26 = utf8.len(var_90_24)
				local var_90_27 = var_90_25 <= 0 and var_90_21 or var_90_21 * (var_90_26 / var_90_25)

				if var_90_27 > 0 and var_90_21 < var_90_27 then
					arg_87_1.talkMaxDuration = var_90_27

					if var_90_27 + var_90_20 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_20
					end
				end

				arg_87_1.text_.text = var_90_24
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282022", "story_v_out_317282.awb") ~= 0 then
					local var_90_28 = manager.audio:GetVoiceLength("story_v_out_317282", "317282022", "story_v_out_317282.awb") / 1000

					if var_90_28 + var_90_20 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_28 + var_90_20
					end

					if var_90_23.prefab_name ~= "" and arg_87_1.actors_[var_90_23.prefab_name] ~= nil then
						local var_90_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_23.prefab_name].transform, "story_v_out_317282", "317282022", "story_v_out_317282.awb")

						arg_87_1:RecordAudio("317282022", var_90_29)
						arg_87_1:RecordAudio("317282022", var_90_29)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_317282", "317282022", "story_v_out_317282.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_317282", "317282022", "story_v_out_317282.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_30 = math.max(var_90_21, arg_87_1.talkMaxDuration)

			if var_90_20 <= arg_87_1.time_ and arg_87_1.time_ < var_90_20 + var_90_30 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_20) / var_90_30

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_20 + var_90_30 and arg_87_1.time_ < var_90_20 + var_90_30 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play317282023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 317282023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play317282024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["2079ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect2079ui_story == nil then
				arg_91_1.var_.characterEffect2079ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect2079ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_91_1.var_.characterEffect2079ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect2079ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_91_1.var_.characterEffect2079ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 0.325

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

				local var_94_8 = arg_91_1:GetWordFromCfg(317282023)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 13
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
	Play317282024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 317282024
		arg_95_1.duration_ = 7.233

		local var_95_0 = {
			zh = 5.6,
			ja = 7.233
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
				arg_95_0:Play317282025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["2078ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos2078ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos2078ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["2078ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect2078ui_story == nil then
				arg_95_1.var_.characterEffect2078ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect2078ui_story then
					arg_95_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect2078ui_story then
				arg_95_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_98_13 = 0
			local var_98_14 = 0.8

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_15 = arg_95_1:FormatText(StoryNameCfg[528].name)

				arg_95_1.leftNameTxt_.text = var_98_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_16 = arg_95_1:GetWordFromCfg(317282024)
				local var_98_17 = arg_95_1:FormatText(var_98_16.content)

				arg_95_1.text_.text = var_98_17

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_18 = 32
				local var_98_19 = utf8.len(var_98_17)
				local var_98_20 = var_98_18 <= 0 and var_98_14 or var_98_14 * (var_98_19 / var_98_18)

				if var_98_20 > 0 and var_98_14 < var_98_20 then
					arg_95_1.talkMaxDuration = var_98_20

					if var_98_20 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_13
					end
				end

				arg_95_1.text_.text = var_98_17
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282024", "story_v_out_317282.awb") ~= 0 then
					local var_98_21 = manager.audio:GetVoiceLength("story_v_out_317282", "317282024", "story_v_out_317282.awb") / 1000

					if var_98_21 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_13
					end

					if var_98_16.prefab_name ~= "" and arg_95_1.actors_[var_98_16.prefab_name] ~= nil then
						local var_98_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_16.prefab_name].transform, "story_v_out_317282", "317282024", "story_v_out_317282.awb")

						arg_95_1:RecordAudio("317282024", var_98_22)
						arg_95_1:RecordAudio("317282024", var_98_22)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_317282", "317282024", "story_v_out_317282.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_317282", "317282024", "story_v_out_317282.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_23 = math.max(var_98_14, arg_95_1.talkMaxDuration)

			if var_98_13 <= arg_95_1.time_ and arg_95_1.time_ < var_98_13 + var_98_23 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_13) / var_98_23

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_13 + var_98_23 and arg_95_1.time_ < var_98_13 + var_98_23 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play317282025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 317282025
		arg_99_1.duration_ = 8.866

		local var_99_0 = {
			zh = 8.866,
			ja = 6.5
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
				arg_99_0:Play317282026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["2079ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos2079ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0.7, -1.28, -5.6)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos2079ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["2079ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect2079ui_story == nil then
				arg_99_1.var_.characterEffect2079ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect2079ui_story then
					arg_99_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect2079ui_story then
				arg_99_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_102_13 = arg_99_1.actors_["2078ui_story"]
			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 and arg_99_1.var_.characterEffect2078ui_story == nil then
				arg_99_1.var_.characterEffect2078ui_story = var_102_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_15 = 0.200000002980232

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_15 then
				local var_102_16 = (arg_99_1.time_ - var_102_14) / var_102_15

				if arg_99_1.var_.characterEffect2078ui_story then
					local var_102_17 = Mathf.Lerp(0, 0.5, var_102_16)

					arg_99_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_99_1.var_.characterEffect2078ui_story.fillRatio = var_102_17
				end
			end

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 and arg_99_1.var_.characterEffect2078ui_story then
				local var_102_18 = 0.5

				arg_99_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_99_1.var_.characterEffect2078ui_story.fillRatio = var_102_18
			end

			local var_102_19 = 0
			local var_102_20 = 0.7

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_21 = arg_99_1:FormatText(StoryNameCfg[571].name)

				arg_99_1.leftNameTxt_.text = var_102_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(317282025)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 28
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_20 or var_102_20 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_20 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_19
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282025", "story_v_out_317282.awb") ~= 0 then
					local var_102_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282025", "story_v_out_317282.awb") / 1000

					if var_102_27 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_27 + var_102_19
					end

					if var_102_22.prefab_name ~= "" and arg_99_1.actors_[var_102_22.prefab_name] ~= nil then
						local var_102_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_22.prefab_name].transform, "story_v_out_317282", "317282025", "story_v_out_317282.awb")

						arg_99_1:RecordAudio("317282025", var_102_28)
						arg_99_1:RecordAudio("317282025", var_102_28)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_317282", "317282025", "story_v_out_317282.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_317282", "317282025", "story_v_out_317282.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_29 = math.max(var_102_20, arg_99_1.talkMaxDuration)

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_29 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_19) / var_102_29

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_19 + var_102_29 and arg_99_1.time_ < var_102_19 + var_102_29 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play317282026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 317282026
		arg_103_1.duration_ = 3.966

		local var_103_0 = {
			zh = 2.633,
			ja = 3.966
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
				arg_103_0:Play317282027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["2078ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos2078ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 100, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos2078ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, 100, 0)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["2078ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect2078ui_story == nil then
				arg_103_1.var_.characterEffect2078ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect2078ui_story then
					local var_106_13 = Mathf.Lerp(0, 0.5, var_106_12)

					arg_103_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_103_1.var_.characterEffect2078ui_story.fillRatio = var_106_13
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect2078ui_story then
				local var_106_14 = 0.5

				arg_103_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_103_1.var_.characterEffect2078ui_story.fillRatio = var_106_14
			end

			local var_106_15 = arg_103_1.actors_["2079ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos2079ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0, 100, 0)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos2079ui_story, var_106_19, var_106_18)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_15.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_15.localEulerAngles = var_106_21
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = Vector3.New(0, 100, 0)

				local var_106_22 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_22.x, var_106_22.y, var_106_22.z)

				local var_106_23 = var_106_15.localEulerAngles

				var_106_23.z = 0
				var_106_23.x = 0
				var_106_15.localEulerAngles = var_106_23
			end

			local var_106_24 = arg_103_1.actors_["2079ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect2079ui_story == nil then
				arg_103_1.var_.characterEffect2079ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect2079ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_103_1.var_.characterEffect2079ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect2079ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_103_1.var_.characterEffect2079ui_story.fillRatio = var_106_29
			end

			local var_106_30 = arg_103_1.actors_["1093ui_story"].transform
			local var_106_31 = 0

			if var_106_31 < arg_103_1.time_ and arg_103_1.time_ <= var_106_31 + arg_106_0 then
				arg_103_1.var_.moveOldPos1093ui_story = var_106_30.localPosition
			end

			local var_106_32 = 0.001

			if var_106_31 <= arg_103_1.time_ and arg_103_1.time_ < var_106_31 + var_106_32 then
				local var_106_33 = (arg_103_1.time_ - var_106_31) / var_106_32
				local var_106_34 = Vector3.New(0, -1.11, -5.88)

				var_106_30.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1093ui_story, var_106_34, var_106_33)

				local var_106_35 = manager.ui.mainCamera.transform.position - var_106_30.position

				var_106_30.forward = Vector3.New(var_106_35.x, var_106_35.y, var_106_35.z)

				local var_106_36 = var_106_30.localEulerAngles

				var_106_36.z = 0
				var_106_36.x = 0
				var_106_30.localEulerAngles = var_106_36
			end

			if arg_103_1.time_ >= var_106_31 + var_106_32 and arg_103_1.time_ < var_106_31 + var_106_32 + arg_106_0 then
				var_106_30.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_106_37 = manager.ui.mainCamera.transform.position - var_106_30.position

				var_106_30.forward = Vector3.New(var_106_37.x, var_106_37.y, var_106_37.z)

				local var_106_38 = var_106_30.localEulerAngles

				var_106_38.z = 0
				var_106_38.x = 0
				var_106_30.localEulerAngles = var_106_38
			end

			local var_106_39 = arg_103_1.actors_["1093ui_story"]
			local var_106_40 = 0

			if var_106_40 < arg_103_1.time_ and arg_103_1.time_ <= var_106_40 + arg_106_0 and arg_103_1.var_.characterEffect1093ui_story == nil then
				arg_103_1.var_.characterEffect1093ui_story = var_106_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_41 = 0.200000002980232

			if var_106_40 <= arg_103_1.time_ and arg_103_1.time_ < var_106_40 + var_106_41 then
				local var_106_42 = (arg_103_1.time_ - var_106_40) / var_106_41

				if arg_103_1.var_.characterEffect1093ui_story then
					arg_103_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_40 + var_106_41 and arg_103_1.time_ < var_106_40 + var_106_41 + arg_106_0 and arg_103_1.var_.characterEffect1093ui_story then
				arg_103_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_106_43 = 0

			if var_106_43 < arg_103_1.time_ and arg_103_1.time_ <= var_106_43 + arg_106_0 then
				arg_103_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_106_44 = 0

			if var_106_44 < arg_103_1.time_ and arg_103_1.time_ <= var_106_44 + arg_106_0 then
				arg_103_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_106_45 = 0
			local var_106_46 = 0.35

			if var_106_45 < arg_103_1.time_ and arg_103_1.time_ <= var_106_45 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_47 = arg_103_1:FormatText(StoryNameCfg[73].name)

				arg_103_1.leftNameTxt_.text = var_106_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_48 = arg_103_1:GetWordFromCfg(317282026)
				local var_106_49 = arg_103_1:FormatText(var_106_48.content)

				arg_103_1.text_.text = var_106_49

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_50 = 14
				local var_106_51 = utf8.len(var_106_49)
				local var_106_52 = var_106_50 <= 0 and var_106_46 or var_106_46 * (var_106_51 / var_106_50)

				if var_106_52 > 0 and var_106_46 < var_106_52 then
					arg_103_1.talkMaxDuration = var_106_52

					if var_106_52 + var_106_45 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_52 + var_106_45
					end
				end

				arg_103_1.text_.text = var_106_49
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282026", "story_v_out_317282.awb") ~= 0 then
					local var_106_53 = manager.audio:GetVoiceLength("story_v_out_317282", "317282026", "story_v_out_317282.awb") / 1000

					if var_106_53 + var_106_45 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_53 + var_106_45
					end

					if var_106_48.prefab_name ~= "" and arg_103_1.actors_[var_106_48.prefab_name] ~= nil then
						local var_106_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_48.prefab_name].transform, "story_v_out_317282", "317282026", "story_v_out_317282.awb")

						arg_103_1:RecordAudio("317282026", var_106_54)
						arg_103_1:RecordAudio("317282026", var_106_54)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_317282", "317282026", "story_v_out_317282.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_317282", "317282026", "story_v_out_317282.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_55 = math.max(var_106_46, arg_103_1.talkMaxDuration)

			if var_106_45 <= arg_103_1.time_ and arg_103_1.time_ < var_106_45 + var_106_55 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_45) / var_106_55

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_45 + var_106_55 and arg_103_1.time_ < var_106_45 + var_106_55 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play317282027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 317282027
		arg_107_1.duration_ = 9.7

		local var_107_0 = {
			zh = 6.066,
			ja = 9.7
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
				arg_107_0:Play317282028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1093ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1093ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, 100, 0)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1093ui_story, var_110_4, var_110_3)

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

			local var_110_9 = arg_107_1.actors_["1093ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1093ui_story == nil then
				arg_107_1.var_.characterEffect1093ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1093ui_story then
					local var_110_13 = Mathf.Lerp(0, 0.5, var_110_12)

					arg_107_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1093ui_story.fillRatio = var_110_13
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1093ui_story then
				local var_110_14 = 0.5

				arg_107_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1093ui_story.fillRatio = var_110_14
			end

			local var_110_15 = arg_107_1.actors_["1015ui_story"].transform
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.var_.moveOldPos1015ui_story = var_110_15.localPosition
			end

			local var_110_17 = 0.001

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Vector3.New(0, -1.15, -6.2)

				var_110_15.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1015ui_story, var_110_19, var_110_18)

				local var_110_20 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_20.x, var_110_20.y, var_110_20.z)

				local var_110_21 = var_110_15.localEulerAngles

				var_110_21.z = 0
				var_110_21.x = 0
				var_110_15.localEulerAngles = var_110_21
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				var_110_15.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_110_22 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_22.x, var_110_22.y, var_110_22.z)

				local var_110_23 = var_110_15.localEulerAngles

				var_110_23.z = 0
				var_110_23.x = 0
				var_110_15.localEulerAngles = var_110_23
			end

			local var_110_24 = arg_107_1.actors_["1015ui_story"]
			local var_110_25 = 0

			if var_110_25 < arg_107_1.time_ and arg_107_1.time_ <= var_110_25 + arg_110_0 and arg_107_1.var_.characterEffect1015ui_story == nil then
				arg_107_1.var_.characterEffect1015ui_story = var_110_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_26 = 0.200000002980232

			if var_110_25 <= arg_107_1.time_ and arg_107_1.time_ < var_110_25 + var_110_26 then
				local var_110_27 = (arg_107_1.time_ - var_110_25) / var_110_26

				if arg_107_1.var_.characterEffect1015ui_story then
					arg_107_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_25 + var_110_26 and arg_107_1.time_ < var_110_25 + var_110_26 + arg_110_0 and arg_107_1.var_.characterEffect1015ui_story then
				arg_107_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_110_28 = 0

			if var_110_28 < arg_107_1.time_ and arg_107_1.time_ <= var_110_28 + arg_110_0 then
				arg_107_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_110_29 = 0

			if var_110_29 < arg_107_1.time_ and arg_107_1.time_ <= var_110_29 + arg_110_0 then
				arg_107_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_30 = 0
			local var_110_31 = 0.6

			if var_110_30 < arg_107_1.time_ and arg_107_1.time_ <= var_110_30 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_32 = arg_107_1:FormatText(StoryNameCfg[479].name)

				arg_107_1.leftNameTxt_.text = var_110_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_33 = arg_107_1:GetWordFromCfg(317282027)
				local var_110_34 = arg_107_1:FormatText(var_110_33.content)

				arg_107_1.text_.text = var_110_34

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_35 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282027", "story_v_out_317282.awb") ~= 0 then
					local var_110_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282027", "story_v_out_317282.awb") / 1000

					if var_110_38 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_38 + var_110_30
					end

					if var_110_33.prefab_name ~= "" and arg_107_1.actors_[var_110_33.prefab_name] ~= nil then
						local var_110_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_33.prefab_name].transform, "story_v_out_317282", "317282027", "story_v_out_317282.awb")

						arg_107_1:RecordAudio("317282027", var_110_39)
						arg_107_1:RecordAudio("317282027", var_110_39)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_317282", "317282027", "story_v_out_317282.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_317282", "317282027", "story_v_out_317282.awb")
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
	Play317282028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 317282028
		arg_111_1.duration_ = 3.266

		local var_111_0 = {
			zh = 2.033,
			ja = 3.266
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
				arg_111_0:Play317282029(arg_111_1)
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
				local var_114_4 = Vector3.New(0, 100, 0)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1015ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, 100, 0)

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
					local var_114_13 = Mathf.Lerp(0, 0.5, var_114_12)

					arg_111_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1015ui_story.fillRatio = var_114_13
				end
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 and arg_111_1.var_.characterEffect1015ui_story then
				local var_114_14 = 0.5

				arg_111_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1015ui_story.fillRatio = var_114_14
			end

			local var_114_15 = arg_111_1.actors_["2079ui_story"].transform
			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.var_.moveOldPos2079ui_story = var_114_15.localPosition
			end

			local var_114_17 = 0.001

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17
				local var_114_19 = Vector3.New(0, -1.28, -5.6)

				var_114_15.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos2079ui_story, var_114_19, var_114_18)

				local var_114_20 = manager.ui.mainCamera.transform.position - var_114_15.position

				var_114_15.forward = Vector3.New(var_114_20.x, var_114_20.y, var_114_20.z)

				local var_114_21 = var_114_15.localEulerAngles

				var_114_21.z = 0
				var_114_21.x = 0
				var_114_15.localEulerAngles = var_114_21
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 then
				var_114_15.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_114_22 = manager.ui.mainCamera.transform.position - var_114_15.position

				var_114_15.forward = Vector3.New(var_114_22.x, var_114_22.y, var_114_22.z)

				local var_114_23 = var_114_15.localEulerAngles

				var_114_23.z = 0
				var_114_23.x = 0
				var_114_15.localEulerAngles = var_114_23
			end

			local var_114_24 = arg_111_1.actors_["2079ui_story"]
			local var_114_25 = 0

			if var_114_25 < arg_111_1.time_ and arg_111_1.time_ <= var_114_25 + arg_114_0 and arg_111_1.var_.characterEffect2079ui_story == nil then
				arg_111_1.var_.characterEffect2079ui_story = var_114_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_26 = 0.200000002980232

			if var_114_25 <= arg_111_1.time_ and arg_111_1.time_ < var_114_25 + var_114_26 then
				local var_114_27 = (arg_111_1.time_ - var_114_25) / var_114_26

				if arg_111_1.var_.characterEffect2079ui_story then
					arg_111_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_25 + var_114_26 and arg_111_1.time_ < var_114_25 + var_114_26 + arg_114_0 and arg_111_1.var_.characterEffect2079ui_story then
				arg_111_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_114_28 = 0

			if var_114_28 < arg_111_1.time_ and arg_111_1.time_ <= var_114_28 + arg_114_0 then
				arg_111_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_114_29 = 0
			local var_114_30 = 0.175

			if var_114_29 < arg_111_1.time_ and arg_111_1.time_ <= var_114_29 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_31 = arg_111_1:FormatText(StoryNameCfg[571].name)

				arg_111_1.leftNameTxt_.text = var_114_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_32 = arg_111_1:GetWordFromCfg(317282028)
				local var_114_33 = arg_111_1:FormatText(var_114_32.content)

				arg_111_1.text_.text = var_114_33

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_34 = 7
				local var_114_35 = utf8.len(var_114_33)
				local var_114_36 = var_114_34 <= 0 and var_114_30 or var_114_30 * (var_114_35 / var_114_34)

				if var_114_36 > 0 and var_114_30 < var_114_36 then
					arg_111_1.talkMaxDuration = var_114_36

					if var_114_36 + var_114_29 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_36 + var_114_29
					end
				end

				arg_111_1.text_.text = var_114_33
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282028", "story_v_out_317282.awb") ~= 0 then
					local var_114_37 = manager.audio:GetVoiceLength("story_v_out_317282", "317282028", "story_v_out_317282.awb") / 1000

					if var_114_37 + var_114_29 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_37 + var_114_29
					end

					if var_114_32.prefab_name ~= "" and arg_111_1.actors_[var_114_32.prefab_name] ~= nil then
						local var_114_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_32.prefab_name].transform, "story_v_out_317282", "317282028", "story_v_out_317282.awb")

						arg_111_1:RecordAudio("317282028", var_114_38)
						arg_111_1:RecordAudio("317282028", var_114_38)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_317282", "317282028", "story_v_out_317282.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_317282", "317282028", "story_v_out_317282.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_39 = math.max(var_114_30, arg_111_1.talkMaxDuration)

			if var_114_29 <= arg_111_1.time_ and arg_111_1.time_ < var_114_29 + var_114_39 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_29) / var_114_39

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_29 + var_114_39 and arg_111_1.time_ < var_114_29 + var_114_39 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play317282029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 317282029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play317282030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["2079ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos2079ui_story = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(0, 100, 0)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos2079ui_story, var_118_4, var_118_3)

				local var_118_5 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_5.x, var_118_5.y, var_118_5.z)

				local var_118_6 = var_118_0.localEulerAngles

				var_118_6.z = 0
				var_118_6.x = 0
				var_118_0.localEulerAngles = var_118_6
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, 100, 0)

				local var_118_7 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_7.x, var_118_7.y, var_118_7.z)

				local var_118_8 = var_118_0.localEulerAngles

				var_118_8.z = 0
				var_118_8.x = 0
				var_118_0.localEulerAngles = var_118_8
			end

			local var_118_9 = 0
			local var_118_10 = 0.8

			if var_118_9 < arg_115_1.time_ and arg_115_1.time_ <= var_118_9 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_11 = arg_115_1:GetWordFromCfg(317282029)
				local var_118_12 = arg_115_1:FormatText(var_118_11.content)

				arg_115_1.text_.text = var_118_12

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_13 = 32
				local var_118_14 = utf8.len(var_118_12)
				local var_118_15 = var_118_13 <= 0 and var_118_10 or var_118_10 * (var_118_14 / var_118_13)

				if var_118_15 > 0 and var_118_10 < var_118_15 then
					arg_115_1.talkMaxDuration = var_118_15

					if var_118_15 + var_118_9 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_15 + var_118_9
					end
				end

				arg_115_1.text_.text = var_118_12
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_16 = math.max(var_118_10, arg_115_1.talkMaxDuration)

			if var_118_9 <= arg_115_1.time_ and arg_115_1.time_ < var_118_9 + var_118_16 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_9) / var_118_16

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_9 + var_118_16 and arg_115_1.time_ < var_118_9 + var_118_16 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play317282030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 317282030
		arg_119_1.duration_ = 3.933

		local var_119_0 = {
			zh = 3.666,
			ja = 3.933
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
				arg_119_0:Play317282031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1093ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1093ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1093ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1093ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1093ui_story == nil then
				arg_119_1.var_.characterEffect1093ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1093ui_story then
					arg_119_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1093ui_story then
				arg_119_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_122_13 = 0

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_122_15 = 0
			local var_122_16 = 0.4

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_17 = arg_119_1:FormatText(StoryNameCfg[73].name)

				arg_119_1.leftNameTxt_.text = var_122_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_18 = arg_119_1:GetWordFromCfg(317282030)
				local var_122_19 = arg_119_1:FormatText(var_122_18.content)

				arg_119_1.text_.text = var_122_19

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_20 = 16
				local var_122_21 = utf8.len(var_122_19)
				local var_122_22 = var_122_20 <= 0 and var_122_16 or var_122_16 * (var_122_21 / var_122_20)

				if var_122_22 > 0 and var_122_16 < var_122_22 then
					arg_119_1.talkMaxDuration = var_122_22

					if var_122_22 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_22 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_19
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282030", "story_v_out_317282.awb") ~= 0 then
					local var_122_23 = manager.audio:GetVoiceLength("story_v_out_317282", "317282030", "story_v_out_317282.awb") / 1000

					if var_122_23 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_15
					end

					if var_122_18.prefab_name ~= "" and arg_119_1.actors_[var_122_18.prefab_name] ~= nil then
						local var_122_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_18.prefab_name].transform, "story_v_out_317282", "317282030", "story_v_out_317282.awb")

						arg_119_1:RecordAudio("317282030", var_122_24)
						arg_119_1:RecordAudio("317282030", var_122_24)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_317282", "317282030", "story_v_out_317282.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_317282", "317282030", "story_v_out_317282.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_25 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_25 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_25

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_25 and arg_119_1.time_ < var_122_15 + var_122_25 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play317282031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 317282031
		arg_123_1.duration_ = 6.966

		local var_123_0 = {
			zh = 4.2,
			ja = 6.966
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
				arg_123_0:Play317282032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1093ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1093ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1093ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["1093ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect1093ui_story == nil then
				arg_123_1.var_.characterEffect1093ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect1093ui_story then
					local var_126_13 = Mathf.Lerp(0, 0.5, var_126_12)

					arg_123_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1093ui_story.fillRatio = var_126_13
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect1093ui_story then
				local var_126_14 = 0.5

				arg_123_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1093ui_story.fillRatio = var_126_14
			end

			local var_126_15 = arg_123_1.actors_["1015ui_story"].transform
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.var_.moveOldPos1015ui_story = var_126_15.localPosition
			end

			local var_126_17 = 0.001

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Vector3.New(0.7, -1.15, -6.2)

				var_126_15.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1015ui_story, var_126_19, var_126_18)

				local var_126_20 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_20.x, var_126_20.y, var_126_20.z)

				local var_126_21 = var_126_15.localEulerAngles

				var_126_21.z = 0
				var_126_21.x = 0
				var_126_15.localEulerAngles = var_126_21
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				var_126_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_126_22 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_22.x, var_126_22.y, var_126_22.z)

				local var_126_23 = var_126_15.localEulerAngles

				var_126_23.z = 0
				var_126_23.x = 0
				var_126_15.localEulerAngles = var_126_23
			end

			local var_126_24 = arg_123_1.actors_["1015ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect1015ui_story == nil then
				arg_123_1.var_.characterEffect1015ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.200000002980232

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect1015ui_story then
					arg_123_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect1015ui_story then
				arg_123_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_126_28 = 0

			if var_126_28 < arg_123_1.time_ and arg_123_1.time_ <= var_126_28 + arg_126_0 then
				arg_123_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_126_29 = 0

			if var_126_29 < arg_123_1.time_ and arg_123_1.time_ <= var_126_29 + arg_126_0 then
				arg_123_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_30 = 0
			local var_126_31 = 0.45

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_32 = arg_123_1:FormatText(StoryNameCfg[479].name)

				arg_123_1.leftNameTxt_.text = var_126_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_33 = arg_123_1:GetWordFromCfg(317282031)
				local var_126_34 = arg_123_1:FormatText(var_126_33.content)

				arg_123_1.text_.text = var_126_34

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_35 = 18
				local var_126_36 = utf8.len(var_126_34)
				local var_126_37 = var_126_35 <= 0 and var_126_31 or var_126_31 * (var_126_36 / var_126_35)

				if var_126_37 > 0 and var_126_31 < var_126_37 then
					arg_123_1.talkMaxDuration = var_126_37

					if var_126_37 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_37 + var_126_30
					end
				end

				arg_123_1.text_.text = var_126_34
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282031", "story_v_out_317282.awb") ~= 0 then
					local var_126_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282031", "story_v_out_317282.awb") / 1000

					if var_126_38 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_38 + var_126_30
					end

					if var_126_33.prefab_name ~= "" and arg_123_1.actors_[var_126_33.prefab_name] ~= nil then
						local var_126_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_33.prefab_name].transform, "story_v_out_317282", "317282031", "story_v_out_317282.awb")

						arg_123_1:RecordAudio("317282031", var_126_39)
						arg_123_1:RecordAudio("317282031", var_126_39)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_317282", "317282031", "story_v_out_317282.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_317282", "317282031", "story_v_out_317282.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_40 = math.max(var_126_31, arg_123_1.talkMaxDuration)

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_40 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_30) / var_126_40

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_30 + var_126_40 and arg_123_1.time_ < var_126_30 + var_126_40 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play317282032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 317282032
		arg_127_1.duration_ = 3.466

		local var_127_0 = {
			zh = 1.999999999999,
			ja = 3.466
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
				arg_127_0:Play317282033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1093ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1093ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1093ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1093ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect1093ui_story == nil then
				arg_127_1.var_.characterEffect1093ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect1093ui_story then
					arg_127_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect1093ui_story then
				arg_127_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_130_15 = arg_127_1.actors_["1015ui_story"]
			local var_130_16 = 0

			if var_130_16 < arg_127_1.time_ and arg_127_1.time_ <= var_130_16 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story == nil then
				arg_127_1.var_.characterEffect1015ui_story = var_130_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_17 = 0.200000002980232

			if var_130_16 <= arg_127_1.time_ and arg_127_1.time_ < var_130_16 + var_130_17 then
				local var_130_18 = (arg_127_1.time_ - var_130_16) / var_130_17

				if arg_127_1.var_.characterEffect1015ui_story then
					local var_130_19 = Mathf.Lerp(0, 0.5, var_130_18)

					arg_127_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1015ui_story.fillRatio = var_130_19
				end
			end

			if arg_127_1.time_ >= var_130_16 + var_130_17 and arg_127_1.time_ < var_130_16 + var_130_17 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story then
				local var_130_20 = 0.5

				arg_127_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1015ui_story.fillRatio = var_130_20
			end

			local var_130_21 = 0
			local var_130_22 = 0.175

			if var_130_21 < arg_127_1.time_ and arg_127_1.time_ <= var_130_21 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_23 = arg_127_1:FormatText(StoryNameCfg[73].name)

				arg_127_1.leftNameTxt_.text = var_130_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_24 = arg_127_1:GetWordFromCfg(317282032)
				local var_130_25 = arg_127_1:FormatText(var_130_24.content)

				arg_127_1.text_.text = var_130_25

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_26 = 7
				local var_130_27 = utf8.len(var_130_25)
				local var_130_28 = var_130_26 <= 0 and var_130_22 or var_130_22 * (var_130_27 / var_130_26)

				if var_130_28 > 0 and var_130_22 < var_130_28 then
					arg_127_1.talkMaxDuration = var_130_28

					if var_130_28 + var_130_21 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_28 + var_130_21
					end
				end

				arg_127_1.text_.text = var_130_25
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282032", "story_v_out_317282.awb") ~= 0 then
					local var_130_29 = manager.audio:GetVoiceLength("story_v_out_317282", "317282032", "story_v_out_317282.awb") / 1000

					if var_130_29 + var_130_21 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_29 + var_130_21
					end

					if var_130_24.prefab_name ~= "" and arg_127_1.actors_[var_130_24.prefab_name] ~= nil then
						local var_130_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_24.prefab_name].transform, "story_v_out_317282", "317282032", "story_v_out_317282.awb")

						arg_127_1:RecordAudio("317282032", var_130_30)
						arg_127_1:RecordAudio("317282032", var_130_30)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_317282", "317282032", "story_v_out_317282.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_317282", "317282032", "story_v_out_317282.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_31 = math.max(var_130_22, arg_127_1.talkMaxDuration)

			if var_130_21 <= arg_127_1.time_ and arg_127_1.time_ < var_130_21 + var_130_31 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_21) / var_130_31

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_21 + var_130_31 and arg_127_1.time_ < var_130_21 + var_130_31 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play317282033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 317282033
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play317282034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1093ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos1093ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, 100, 0)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1093ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, 100, 0)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["1015ui_story"].transform
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 then
				arg_131_1.var_.moveOldPos1015ui_story = var_134_9.localPosition
			end

			local var_134_11 = 0.001

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11
				local var_134_13 = Vector3.New(0, 100, 0)

				var_134_9.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1015ui_story, var_134_13, var_134_12)

				local var_134_14 = manager.ui.mainCamera.transform.position - var_134_9.position

				var_134_9.forward = Vector3.New(var_134_14.x, var_134_14.y, var_134_14.z)

				local var_134_15 = var_134_9.localEulerAngles

				var_134_15.z = 0
				var_134_15.x = 0
				var_134_9.localEulerAngles = var_134_15
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 then
				var_134_9.localPosition = Vector3.New(0, 100, 0)

				local var_134_16 = manager.ui.mainCamera.transform.position - var_134_9.position

				var_134_9.forward = Vector3.New(var_134_16.x, var_134_16.y, var_134_16.z)

				local var_134_17 = var_134_9.localEulerAngles

				var_134_17.z = 0
				var_134_17.x = 0
				var_134_9.localEulerAngles = var_134_17
			end

			local var_134_18 = 0
			local var_134_19 = 1.025

			if var_134_18 < arg_131_1.time_ and arg_131_1.time_ <= var_134_18 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_20 = arg_131_1:GetWordFromCfg(317282033)
				local var_134_21 = arg_131_1:FormatText(var_134_20.content)

				arg_131_1.text_.text = var_134_21

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_22 = 41
				local var_134_23 = utf8.len(var_134_21)
				local var_134_24 = var_134_22 <= 0 and var_134_19 or var_134_19 * (var_134_23 / var_134_22)

				if var_134_24 > 0 and var_134_19 < var_134_24 then
					arg_131_1.talkMaxDuration = var_134_24

					if var_134_24 + var_134_18 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_24 + var_134_18
					end
				end

				arg_131_1.text_.text = var_134_21
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_25 = math.max(var_134_19, arg_131_1.talkMaxDuration)

			if var_134_18 <= arg_131_1.time_ and arg_131_1.time_ < var_134_18 + var_134_25 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_18) / var_134_25

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_18 + var_134_25 and arg_131_1.time_ < var_134_18 + var_134_25 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play317282034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 317282034
		arg_135_1.duration_ = 1.999999999999

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play317282035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["2078ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos2078ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, -1.28, -5.6)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos2078ui_story, var_138_4, var_138_3)

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

			local var_138_9 = arg_135_1.actors_["2078ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect2078ui_story == nil then
				arg_135_1.var_.characterEffect2078ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect2078ui_story then
					arg_135_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect2078ui_story then
				arg_135_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_138_14 = 0
			local var_138_15 = 0.175

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_16 = arg_135_1:FormatText(StoryNameCfg[528].name)

				arg_135_1.leftNameTxt_.text = var_138_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_17 = arg_135_1:GetWordFromCfg(317282034)
				local var_138_18 = arg_135_1:FormatText(var_138_17.content)

				arg_135_1.text_.text = var_138_18

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_19 = 7
				local var_138_20 = utf8.len(var_138_18)
				local var_138_21 = var_138_19 <= 0 and var_138_15 or var_138_15 * (var_138_20 / var_138_19)

				if var_138_21 > 0 and var_138_15 < var_138_21 then
					arg_135_1.talkMaxDuration = var_138_21

					if var_138_21 + var_138_14 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_14
					end
				end

				arg_135_1.text_.text = var_138_18
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282034", "story_v_out_317282.awb") ~= 0 then
					local var_138_22 = manager.audio:GetVoiceLength("story_v_out_317282", "317282034", "story_v_out_317282.awb") / 1000

					if var_138_22 + var_138_14 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_22 + var_138_14
					end

					if var_138_17.prefab_name ~= "" and arg_135_1.actors_[var_138_17.prefab_name] ~= nil then
						local var_138_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_17.prefab_name].transform, "story_v_out_317282", "317282034", "story_v_out_317282.awb")

						arg_135_1:RecordAudio("317282034", var_138_23)
						arg_135_1:RecordAudio("317282034", var_138_23)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_317282", "317282034", "story_v_out_317282.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_317282", "317282034", "story_v_out_317282.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_24 = math.max(var_138_15, arg_135_1.talkMaxDuration)

			if var_138_14 <= arg_135_1.time_ and arg_135_1.time_ < var_138_14 + var_138_24 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_14) / var_138_24

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_14 + var_138_24 and arg_135_1.time_ < var_138_14 + var_138_24 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play317282035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 317282035
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play317282036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["2078ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos2078ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, 100, 0)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos2078ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, 100, 0)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = 0
			local var_142_10 = 1.35

			if var_142_9 < arg_139_1.time_ and arg_139_1.time_ <= var_142_9 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_11 = arg_139_1:GetWordFromCfg(317282035)
				local var_142_12 = arg_139_1:FormatText(var_142_11.content)

				arg_139_1.text_.text = var_142_12

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_13 = 54
				local var_142_14 = utf8.len(var_142_12)
				local var_142_15 = var_142_13 <= 0 and var_142_10 or var_142_10 * (var_142_14 / var_142_13)

				if var_142_15 > 0 and var_142_10 < var_142_15 then
					arg_139_1.talkMaxDuration = var_142_15

					if var_142_15 + var_142_9 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_15 + var_142_9
					end
				end

				arg_139_1.text_.text = var_142_12
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_16 = math.max(var_142_10, arg_139_1.talkMaxDuration)

			if var_142_9 <= arg_139_1.time_ and arg_139_1.time_ < var_142_9 + var_142_16 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_9) / var_142_16

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_9 + var_142_16 and arg_139_1.time_ < var_142_9 + var_142_16 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play317282036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 317282036
		arg_143_1.duration_ = 5.933

		local var_143_0 = {
			zh = 3.066,
			ja = 5.933
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
				arg_143_0:Play317282037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.175

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[571].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, true)
				arg_143_1.iconController_:SetSelectedState("hero")

				arg_143_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(317282036)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282036", "story_v_out_317282.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282036", "story_v_out_317282.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_317282", "317282036", "story_v_out_317282.awb")

						arg_143_1:RecordAudio("317282036", var_146_9)
						arg_143_1:RecordAudio("317282036", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_317282", "317282036", "story_v_out_317282.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_317282", "317282036", "story_v_out_317282.awb")
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
	Play317282037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 317282037
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play317282038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.725

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_2 = arg_147_1:GetWordFromCfg(317282037)
				local var_150_3 = arg_147_1:FormatText(var_150_2.content)

				arg_147_1.text_.text = var_150_3

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_4 = 29
				local var_150_5 = utf8.len(var_150_3)
				local var_150_6 = var_150_4 <= 0 and var_150_1 or var_150_1 * (var_150_5 / var_150_4)

				if var_150_6 > 0 and var_150_1 < var_150_6 then
					arg_147_1.talkMaxDuration = var_150_6

					if var_150_6 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_6 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_3
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_7 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_7 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_7

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_7 and arg_147_1.time_ < var_150_0 + var_150_7 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play317282038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 317282038
		arg_151_1.duration_ = 3.6

		local var_151_0 = {
			zh = 2.3,
			ja = 3.6
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
				arg_151_0:Play317282039(arg_151_1)
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
				local var_154_4 = Vector3.New(0, -1.28, -5.6)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos2078ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0, -1.28, -5.6)

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
			local var_154_15 = 0.3

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_16 = arg_151_1:FormatText(StoryNameCfg[528].name)

				arg_151_1.leftNameTxt_.text = var_154_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_17 = arg_151_1:GetWordFromCfg(317282038)
				local var_154_18 = arg_151_1:FormatText(var_154_17.content)

				arg_151_1.text_.text = var_154_18

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_19 = 12
				local var_154_20 = utf8.len(var_154_18)
				local var_154_21 = var_154_19 <= 0 and var_154_15 or var_154_15 * (var_154_20 / var_154_19)

				if var_154_21 > 0 and var_154_15 < var_154_21 then
					arg_151_1.talkMaxDuration = var_154_21

					if var_154_21 + var_154_14 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_21 + var_154_14
					end
				end

				arg_151_1.text_.text = var_154_18
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282038", "story_v_out_317282.awb") ~= 0 then
					local var_154_22 = manager.audio:GetVoiceLength("story_v_out_317282", "317282038", "story_v_out_317282.awb") / 1000

					if var_154_22 + var_154_14 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_22 + var_154_14
					end

					if var_154_17.prefab_name ~= "" and arg_151_1.actors_[var_154_17.prefab_name] ~= nil then
						local var_154_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_17.prefab_name].transform, "story_v_out_317282", "317282038", "story_v_out_317282.awb")

						arg_151_1:RecordAudio("317282038", var_154_23)
						arg_151_1:RecordAudio("317282038", var_154_23)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_317282", "317282038", "story_v_out_317282.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_317282", "317282038", "story_v_out_317282.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_24 = math.max(var_154_15, arg_151_1.talkMaxDuration)

			if var_154_14 <= arg_151_1.time_ and arg_151_1.time_ < var_154_14 + var_154_24 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_14) / var_154_24

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_14 + var_154_24 and arg_151_1.time_ < var_154_14 + var_154_24 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play317282039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 317282039
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play317282040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["2078ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect2078ui_story == nil then
				arg_155_1.var_.characterEffect2078ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect2078ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_155_1.var_.characterEffect2078ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect2078ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_155_1.var_.characterEffect2078ui_story.fillRatio = var_158_5
			end

			local var_158_6 = 0
			local var_158_7 = 0.9

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

				local var_158_8 = arg_155_1:GetWordFromCfg(317282039)
				local var_158_9 = arg_155_1:FormatText(var_158_8.content)

				arg_155_1.text_.text = var_158_9

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_10 = 36
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
	Play317282040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 317282040
		arg_159_1.duration_ = 6.5

		local var_159_0 = {
			zh = 6.1,
			ja = 6.5
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
				arg_159_0:Play317282041(arg_159_1)
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
				local var_162_4 = Vector3.New(0, 100, 0)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos2078ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, 100, 0)

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

			local var_162_15 = arg_159_1.actors_["1015ui_story"].transform
			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 then
				arg_159_1.var_.moveOldPos1015ui_story = var_162_15.localPosition
			end

			local var_162_17 = 0.001

			if var_162_16 <= arg_159_1.time_ and arg_159_1.time_ < var_162_16 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_16) / var_162_17
				local var_162_19 = Vector3.New(0, -1.15, -6.2)

				var_162_15.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1015ui_story, var_162_19, var_162_18)

				local var_162_20 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_20.x, var_162_20.y, var_162_20.z)

				local var_162_21 = var_162_15.localEulerAngles

				var_162_21.z = 0
				var_162_21.x = 0
				var_162_15.localEulerAngles = var_162_21
			end

			if arg_159_1.time_ >= var_162_16 + var_162_17 and arg_159_1.time_ < var_162_16 + var_162_17 + arg_162_0 then
				var_162_15.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_162_22 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_22.x, var_162_22.y, var_162_22.z)

				local var_162_23 = var_162_15.localEulerAngles

				var_162_23.z = 0
				var_162_23.x = 0
				var_162_15.localEulerAngles = var_162_23
			end

			local var_162_24 = arg_159_1.actors_["1015ui_story"]
			local var_162_25 = 0

			if var_162_25 < arg_159_1.time_ and arg_159_1.time_ <= var_162_25 + arg_162_0 and arg_159_1.var_.characterEffect1015ui_story == nil then
				arg_159_1.var_.characterEffect1015ui_story = var_162_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_26 = 0.200000002980232

			if var_162_25 <= arg_159_1.time_ and arg_159_1.time_ < var_162_25 + var_162_26 then
				local var_162_27 = (arg_159_1.time_ - var_162_25) / var_162_26

				if arg_159_1.var_.characterEffect1015ui_story then
					arg_159_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_25 + var_162_26 and arg_159_1.time_ < var_162_25 + var_162_26 + arg_162_0 and arg_159_1.var_.characterEffect1015ui_story then
				arg_159_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_162_28 = 0

			if var_162_28 < arg_159_1.time_ and arg_159_1.time_ <= var_162_28 + arg_162_0 then
				arg_159_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_162_29 = 0

			if var_162_29 < arg_159_1.time_ and arg_159_1.time_ <= var_162_29 + arg_162_0 then
				arg_159_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_162_30 = 0
			local var_162_31 = 0.925

			if var_162_30 < arg_159_1.time_ and arg_159_1.time_ <= var_162_30 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_32 = arg_159_1:FormatText(StoryNameCfg[479].name)

				arg_159_1.leftNameTxt_.text = var_162_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_33 = arg_159_1:GetWordFromCfg(317282040)
				local var_162_34 = arg_159_1:FormatText(var_162_33.content)

				arg_159_1.text_.text = var_162_34

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_35 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282040", "story_v_out_317282.awb") ~= 0 then
					local var_162_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282040", "story_v_out_317282.awb") / 1000

					if var_162_38 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_38 + var_162_30
					end

					if var_162_33.prefab_name ~= "" and arg_159_1.actors_[var_162_33.prefab_name] ~= nil then
						local var_162_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_33.prefab_name].transform, "story_v_out_317282", "317282040", "story_v_out_317282.awb")

						arg_159_1:RecordAudio("317282040", var_162_39)
						arg_159_1:RecordAudio("317282040", var_162_39)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_317282", "317282040", "story_v_out_317282.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_317282", "317282040", "story_v_out_317282.awb")
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
	Play317282041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 317282041
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play317282042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1015ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1015ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, 100, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1015ui_story, var_166_4, var_166_3)

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

			local var_166_9 = arg_163_1.actors_["1015ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story == nil then
				arg_163_1.var_.characterEffect1015ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect1015ui_story then
					local var_166_13 = Mathf.Lerp(0, 0.5, var_166_12)

					arg_163_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1015ui_story.fillRatio = var_166_13
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story then
				local var_166_14 = 0.5

				arg_163_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1015ui_story.fillRatio = var_166_14
			end

			local var_166_15 = 0
			local var_166_16 = 1.025

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_17 = arg_163_1:GetWordFromCfg(317282041)
				local var_166_18 = arg_163_1:FormatText(var_166_17.content)

				arg_163_1.text_.text = var_166_18

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_19 = 41
				local var_166_20 = utf8.len(var_166_18)
				local var_166_21 = var_166_19 <= 0 and var_166_16 or var_166_16 * (var_166_20 / var_166_19)

				if var_166_21 > 0 and var_166_16 < var_166_21 then
					arg_163_1.talkMaxDuration = var_166_21

					if var_166_21 + var_166_15 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_21 + var_166_15
					end
				end

				arg_163_1.text_.text = var_166_18
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_22 = math.max(var_166_16, arg_163_1.talkMaxDuration)

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_22 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_15) / var_166_22

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_15 + var_166_22 and arg_163_1.time_ < var_166_15 + var_166_22 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play317282042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 317282042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play317282043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.55

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_2 = arg_167_1:GetWordFromCfg(317282042)
				local var_170_3 = arg_167_1:FormatText(var_170_2.content)

				arg_167_1.text_.text = var_170_3

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_4 = 22
				local var_170_5 = utf8.len(var_170_3)
				local var_170_6 = var_170_4 <= 0 and var_170_1 or var_170_1 * (var_170_5 / var_170_4)

				if var_170_6 > 0 and var_170_1 < var_170_6 then
					arg_167_1.talkMaxDuration = var_170_6

					if var_170_6 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_6 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_3
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_7 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_7 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_7

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_7 and arg_167_1.time_ < var_170_0 + var_170_7 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play317282043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 317282043
		arg_171_1.duration_ = 16.9

		local var_171_0 = {
			zh = 16.9,
			ja = 15.5
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
				arg_171_0:Play317282044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = "K11f"

			if arg_171_1.bgs_[var_174_0] == nil then
				local var_174_1 = Object.Instantiate(arg_171_1.paintGo_)

				var_174_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_174_0)
				var_174_1.name = var_174_0
				var_174_1.transform.parent = arg_171_1.stage_.transform
				var_174_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_171_1.bgs_[var_174_0] = var_174_1
			end

			local var_174_2 = 2

			if var_174_2 < arg_171_1.time_ and arg_171_1.time_ <= var_174_2 + arg_174_0 then
				local var_174_3 = manager.ui.mainCamera.transform.localPosition
				local var_174_4 = Vector3.New(0, 0, 10) + Vector3.New(var_174_3.x, var_174_3.y, 0)
				local var_174_5 = arg_171_1.bgs_.K11f

				var_174_5.transform.localPosition = var_174_4
				var_174_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_174_6 = var_174_5:GetComponent("SpriteRenderer")

				if var_174_6 and var_174_6.sprite then
					local var_174_7 = (var_174_5.transform.localPosition - var_174_3).z
					local var_174_8 = manager.ui.mainCameraCom_
					local var_174_9 = 2 * var_174_7 * Mathf.Tan(var_174_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_174_10 = var_174_9 * var_174_8.aspect
					local var_174_11 = var_174_6.sprite.bounds.size.x
					local var_174_12 = var_174_6.sprite.bounds.size.y
					local var_174_13 = var_174_10 / var_174_11
					local var_174_14 = var_174_9 / var_174_12
					local var_174_15 = var_174_14 < var_174_13 and var_174_13 or var_174_14

					var_174_5.transform.localScale = Vector3.New(var_174_15, var_174_15, 0)
				end

				for iter_174_0, iter_174_1 in pairs(arg_171_1.bgs_) do
					if iter_174_0 ~= "K11f" then
						iter_174_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1.mask_.enabled = true
				arg_171_1.mask_.raycastTarget = true

				arg_171_1:SetGaussion(false)
			end

			local var_174_17 = 2

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17
				local var_174_19 = Color.New(0, 0, 0)

				var_174_19.a = Mathf.Lerp(0, 1, var_174_18)
				arg_171_1.mask_.color = var_174_19
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 then
				local var_174_20 = Color.New(0, 0, 0)

				var_174_20.a = 1
				arg_171_1.mask_.color = var_174_20
			end

			local var_174_21 = 2

			if var_174_21 < arg_171_1.time_ and arg_171_1.time_ <= var_174_21 + arg_174_0 then
				arg_171_1.mask_.enabled = true
				arg_171_1.mask_.raycastTarget = true

				arg_171_1:SetGaussion(false)
			end

			local var_174_22 = 2

			if var_174_21 <= arg_171_1.time_ and arg_171_1.time_ < var_174_21 + var_174_22 then
				local var_174_23 = (arg_171_1.time_ - var_174_21) / var_174_22
				local var_174_24 = Color.New(0, 0, 0)

				var_174_24.a = Mathf.Lerp(1, 0, var_174_23)
				arg_171_1.mask_.color = var_174_24
			end

			if arg_171_1.time_ >= var_174_21 + var_174_22 and arg_171_1.time_ < var_174_21 + var_174_22 + arg_174_0 then
				local var_174_25 = Color.New(0, 0, 0)
				local var_174_26 = 0

				arg_171_1.mask_.enabled = false
				var_174_25.a = var_174_26
				arg_171_1.mask_.color = var_174_25
			end

			local var_174_27 = arg_171_1.actors_["2078ui_story"].transform
			local var_174_28 = 4

			if var_174_28 < arg_171_1.time_ and arg_171_1.time_ <= var_174_28 + arg_174_0 then
				arg_171_1.var_.moveOldPos2078ui_story = var_174_27.localPosition
			end

			local var_174_29 = 0.001

			if var_174_28 <= arg_171_1.time_ and arg_171_1.time_ < var_174_28 + var_174_29 then
				local var_174_30 = (arg_171_1.time_ - var_174_28) / var_174_29
				local var_174_31 = Vector3.New(-0.7, -1.28, -5.6)

				var_174_27.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos2078ui_story, var_174_31, var_174_30)

				local var_174_32 = manager.ui.mainCamera.transform.position - var_174_27.position

				var_174_27.forward = Vector3.New(var_174_32.x, var_174_32.y, var_174_32.z)

				local var_174_33 = var_174_27.localEulerAngles

				var_174_33.z = 0
				var_174_33.x = 0
				var_174_27.localEulerAngles = var_174_33
			end

			if arg_171_1.time_ >= var_174_28 + var_174_29 and arg_171_1.time_ < var_174_28 + var_174_29 + arg_174_0 then
				var_174_27.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_174_34 = manager.ui.mainCamera.transform.position - var_174_27.position

				var_174_27.forward = Vector3.New(var_174_34.x, var_174_34.y, var_174_34.z)

				local var_174_35 = var_174_27.localEulerAngles

				var_174_35.z = 0
				var_174_35.x = 0
				var_174_27.localEulerAngles = var_174_35
			end

			local var_174_36 = arg_171_1.actors_["2078ui_story"]
			local var_174_37 = 4

			if var_174_37 < arg_171_1.time_ and arg_171_1.time_ <= var_174_37 + arg_174_0 and arg_171_1.var_.characterEffect2078ui_story == nil then
				arg_171_1.var_.characterEffect2078ui_story = var_174_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_38 = 0.200000002980232

			if var_174_37 <= arg_171_1.time_ and arg_171_1.time_ < var_174_37 + var_174_38 then
				local var_174_39 = (arg_171_1.time_ - var_174_37) / var_174_38

				if arg_171_1.var_.characterEffect2078ui_story then
					arg_171_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_37 + var_174_38 and arg_171_1.time_ < var_174_37 + var_174_38 + arg_174_0 and arg_171_1.var_.characterEffect2078ui_story then
				arg_171_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_174_40 = 4

			if var_174_40 < arg_171_1.time_ and arg_171_1.time_ <= var_174_40 + arg_174_0 then
				arg_171_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_174_41 = arg_171_1.actors_["2079ui_story"].transform
			local var_174_42 = 4

			if var_174_42 < arg_171_1.time_ and arg_171_1.time_ <= var_174_42 + arg_174_0 then
				arg_171_1.var_.moveOldPos2079ui_story = var_174_41.localPosition
			end

			local var_174_43 = 0.001

			if var_174_42 <= arg_171_1.time_ and arg_171_1.time_ < var_174_42 + var_174_43 then
				local var_174_44 = (arg_171_1.time_ - var_174_42) / var_174_43
				local var_174_45 = Vector3.New(0.7, -1.28, -5.6)

				var_174_41.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos2079ui_story, var_174_45, var_174_44)

				local var_174_46 = manager.ui.mainCamera.transform.position - var_174_41.position

				var_174_41.forward = Vector3.New(var_174_46.x, var_174_46.y, var_174_46.z)

				local var_174_47 = var_174_41.localEulerAngles

				var_174_47.z = 0
				var_174_47.x = 0
				var_174_41.localEulerAngles = var_174_47
			end

			if arg_171_1.time_ >= var_174_42 + var_174_43 and arg_171_1.time_ < var_174_42 + var_174_43 + arg_174_0 then
				var_174_41.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_174_48 = manager.ui.mainCamera.transform.position - var_174_41.position

				var_174_41.forward = Vector3.New(var_174_48.x, var_174_48.y, var_174_48.z)

				local var_174_49 = var_174_41.localEulerAngles

				var_174_49.z = 0
				var_174_49.x = 0
				var_174_41.localEulerAngles = var_174_49
			end

			local var_174_50 = arg_171_1.actors_["2079ui_story"]
			local var_174_51 = 4

			if var_174_51 < arg_171_1.time_ and arg_171_1.time_ <= var_174_51 + arg_174_0 and arg_171_1.var_.characterEffect2079ui_story == nil then
				arg_171_1.var_.characterEffect2079ui_story = var_174_50:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_52 = 0.200000002980232

			if var_174_51 <= arg_171_1.time_ and arg_171_1.time_ < var_174_51 + var_174_52 then
				local var_174_53 = (arg_171_1.time_ - var_174_51) / var_174_52

				if arg_171_1.var_.characterEffect2079ui_story then
					local var_174_54 = Mathf.Lerp(0, 0.5, var_174_53)

					arg_171_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_171_1.var_.characterEffect2079ui_story.fillRatio = var_174_54
				end
			end

			if arg_171_1.time_ >= var_174_51 + var_174_52 and arg_171_1.time_ < var_174_51 + var_174_52 + arg_174_0 and arg_171_1.var_.characterEffect2079ui_story then
				local var_174_55 = 0.5

				arg_171_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_171_1.var_.characterEffect2079ui_story.fillRatio = var_174_55
			end

			local var_174_56 = 4

			if var_174_56 < arg_171_1.time_ and arg_171_1.time_ <= var_174_56 + arg_174_0 then
				arg_171_1.screenFilterGo_:SetActive(true)

				arg_171_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_174_57 = 0.0166666666666667

			if var_174_56 <= arg_171_1.time_ and arg_171_1.time_ < var_174_56 + var_174_57 then
				local var_174_58 = (arg_171_1.time_ - var_174_56) / var_174_57

				arg_171_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_174_58)
			end

			if arg_171_1.time_ >= var_174_56 + var_174_57 and arg_171_1.time_ < var_174_56 + var_174_57 + arg_174_0 then
				arg_171_1.screenFilterEffect_.weight = 1
			end

			if arg_171_1.frameCnt_ <= 1 then
				arg_171_1.dialog_:SetActive(false)
			end

			local var_174_59 = 4
			local var_174_60 = 1.4

			if var_174_59 < arg_171_1.time_ and arg_171_1.time_ <= var_174_59 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0

				arg_171_1.dialog_:SetActive(true)

				local var_174_61 = LeanTween.value(arg_171_1.dialog_, 0, 1, 0.3)

				var_174_61:setOnUpdate(LuaHelper.FloatAction(function(arg_175_0)
					arg_171_1.dialogCg_.alpha = arg_175_0
				end))
				var_174_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_171_1.dialog_)
					var_174_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_171_1.duration_ = arg_171_1.duration_ + 0.3

				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_62 = arg_171_1:FormatText(StoryNameCfg[528].name)

				arg_171_1.leftNameTxt_.text = var_174_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_63 = arg_171_1:GetWordFromCfg(317282043)
				local var_174_64 = arg_171_1:FormatText(var_174_63.content)

				arg_171_1.text_.text = var_174_64

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_65 = 55
				local var_174_66 = utf8.len(var_174_64)
				local var_174_67 = var_174_65 <= 0 and var_174_60 or var_174_60 * (var_174_66 / var_174_65)

				if var_174_67 > 0 and var_174_60 < var_174_67 then
					arg_171_1.talkMaxDuration = var_174_67
					var_174_59 = var_174_59 + 0.3

					if var_174_67 + var_174_59 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_67 + var_174_59
					end
				end

				arg_171_1.text_.text = var_174_64
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282043", "story_v_out_317282.awb") ~= 0 then
					local var_174_68 = manager.audio:GetVoiceLength("story_v_out_317282", "317282043", "story_v_out_317282.awb") / 1000

					if var_174_68 + var_174_59 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_68 + var_174_59
					end

					if var_174_63.prefab_name ~= "" and arg_171_1.actors_[var_174_63.prefab_name] ~= nil then
						local var_174_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_63.prefab_name].transform, "story_v_out_317282", "317282043", "story_v_out_317282.awb")

						arg_171_1:RecordAudio("317282043", var_174_69)
						arg_171_1:RecordAudio("317282043", var_174_69)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_317282", "317282043", "story_v_out_317282.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_317282", "317282043", "story_v_out_317282.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_70 = var_174_59 + 0.3
			local var_174_71 = math.max(var_174_60, arg_171_1.talkMaxDuration)

			if var_174_70 <= arg_171_1.time_ and arg_171_1.time_ < var_174_70 + var_174_71 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_70) / var_174_71

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_70 + var_174_71 and arg_171_1.time_ < var_174_70 + var_174_71 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play317282044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 317282044
		arg_177_1.duration_ = 7.3

		local var_177_0 = {
			zh = 7.3,
			ja = 4.733
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
				arg_177_0:Play317282045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.85

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[528].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(317282044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282044", "story_v_out_317282.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282044", "story_v_out_317282.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_317282", "317282044", "story_v_out_317282.awb")

						arg_177_1:RecordAudio("317282044", var_180_9)
						arg_177_1:RecordAudio("317282044", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_317282", "317282044", "story_v_out_317282.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_317282", "317282044", "story_v_out_317282.awb")
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
	Play317282045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 317282045
		arg_181_1.duration_ = 3.466

		local var_181_0 = {
			zh = 2,
			ja = 3.466
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
				arg_181_0:Play317282046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["2079ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect2079ui_story == nil then
				arg_181_1.var_.characterEffect2079ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect2079ui_story then
					arg_181_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect2079ui_story then
				arg_181_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_184_4 = arg_181_1.actors_["2078ui_story"]
			local var_184_5 = 0

			if var_184_5 < arg_181_1.time_ and arg_181_1.time_ <= var_184_5 + arg_184_0 and arg_181_1.var_.characterEffect2078ui_story == nil then
				arg_181_1.var_.characterEffect2078ui_story = var_184_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_6 = 0.200000002980232

			if var_184_5 <= arg_181_1.time_ and arg_181_1.time_ < var_184_5 + var_184_6 then
				local var_184_7 = (arg_181_1.time_ - var_184_5) / var_184_6

				if arg_181_1.var_.characterEffect2078ui_story then
					local var_184_8 = Mathf.Lerp(0, 0.5, var_184_7)

					arg_181_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_181_1.var_.characterEffect2078ui_story.fillRatio = var_184_8
				end
			end

			if arg_181_1.time_ >= var_184_5 + var_184_6 and arg_181_1.time_ < var_184_5 + var_184_6 + arg_184_0 and arg_181_1.var_.characterEffect2078ui_story then
				local var_184_9 = 0.5

				arg_181_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_181_1.var_.characterEffect2078ui_story.fillRatio = var_184_9
			end

			local var_184_10 = 0
			local var_184_11 = 0.225

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_12 = arg_181_1:FormatText(StoryNameCfg[571].name)

				arg_181_1.leftNameTxt_.text = var_184_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_13 = arg_181_1:GetWordFromCfg(317282045)
				local var_184_14 = arg_181_1:FormatText(var_184_13.content)

				arg_181_1.text_.text = var_184_14

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_15 = 9
				local var_184_16 = utf8.len(var_184_14)
				local var_184_17 = var_184_15 <= 0 and var_184_11 or var_184_11 * (var_184_16 / var_184_15)

				if var_184_17 > 0 and var_184_11 < var_184_17 then
					arg_181_1.talkMaxDuration = var_184_17

					if var_184_17 + var_184_10 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_17 + var_184_10
					end
				end

				arg_181_1.text_.text = var_184_14
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282045", "story_v_out_317282.awb") ~= 0 then
					local var_184_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282045", "story_v_out_317282.awb") / 1000

					if var_184_18 + var_184_10 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_10
					end

					if var_184_13.prefab_name ~= "" and arg_181_1.actors_[var_184_13.prefab_name] ~= nil then
						local var_184_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_13.prefab_name].transform, "story_v_out_317282", "317282045", "story_v_out_317282.awb")

						arg_181_1:RecordAudio("317282045", var_184_19)
						arg_181_1:RecordAudio("317282045", var_184_19)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_317282", "317282045", "story_v_out_317282.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_317282", "317282045", "story_v_out_317282.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_20 = math.max(var_184_11, arg_181_1.talkMaxDuration)

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_20 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_10) / var_184_20

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_10 + var_184_20 and arg_181_1.time_ < var_184_10 + var_184_20 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play317282046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 317282046
		arg_185_1.duration_ = 8.966

		local var_185_0 = {
			zh = 8.966,
			ja = 8.1
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
				arg_185_0:Play317282047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["2078ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect2078ui_story == nil then
				arg_185_1.var_.characterEffect2078ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect2078ui_story then
					arg_185_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect2078ui_story then
				arg_185_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_188_4 = arg_185_1.actors_["2079ui_story"]
			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 and arg_185_1.var_.characterEffect2079ui_story == nil then
				arg_185_1.var_.characterEffect2079ui_story = var_188_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_6 = 0.200000002980232

			if var_188_5 <= arg_185_1.time_ and arg_185_1.time_ < var_188_5 + var_188_6 then
				local var_188_7 = (arg_185_1.time_ - var_188_5) / var_188_6

				if arg_185_1.var_.characterEffect2079ui_story then
					local var_188_8 = Mathf.Lerp(0, 0.5, var_188_7)

					arg_185_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_185_1.var_.characterEffect2079ui_story.fillRatio = var_188_8
				end
			end

			if arg_185_1.time_ >= var_188_5 + var_188_6 and arg_185_1.time_ < var_188_5 + var_188_6 + arg_188_0 and arg_185_1.var_.characterEffect2079ui_story then
				local var_188_9 = 0.5

				arg_185_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_185_1.var_.characterEffect2079ui_story.fillRatio = var_188_9
			end

			local var_188_10 = 0
			local var_188_11 = 1.075

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_12 = arg_185_1:FormatText(StoryNameCfg[528].name)

				arg_185_1.leftNameTxt_.text = var_188_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_13 = arg_185_1:GetWordFromCfg(317282046)
				local var_188_14 = arg_185_1:FormatText(var_188_13.content)

				arg_185_1.text_.text = var_188_14

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_15 = 43
				local var_188_16 = utf8.len(var_188_14)
				local var_188_17 = var_188_15 <= 0 and var_188_11 or var_188_11 * (var_188_16 / var_188_15)

				if var_188_17 > 0 and var_188_11 < var_188_17 then
					arg_185_1.talkMaxDuration = var_188_17

					if var_188_17 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_17 + var_188_10
					end
				end

				arg_185_1.text_.text = var_188_14
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282046", "story_v_out_317282.awb") ~= 0 then
					local var_188_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282046", "story_v_out_317282.awb") / 1000

					if var_188_18 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_18 + var_188_10
					end

					if var_188_13.prefab_name ~= "" and arg_185_1.actors_[var_188_13.prefab_name] ~= nil then
						local var_188_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_13.prefab_name].transform, "story_v_out_317282", "317282046", "story_v_out_317282.awb")

						arg_185_1:RecordAudio("317282046", var_188_19)
						arg_185_1:RecordAudio("317282046", var_188_19)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_317282", "317282046", "story_v_out_317282.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_317282", "317282046", "story_v_out_317282.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_20 = math.max(var_188_11, arg_185_1.talkMaxDuration)

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_20 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_10) / var_188_20

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_10 + var_188_20 and arg_185_1.time_ < var_188_10 + var_188_20 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play317282047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 317282047
		arg_189_1.duration_ = 13.1

		local var_189_0 = {
			zh = 13.1,
			ja = 10.833
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
				arg_189_0:Play317282048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 1.4

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[528].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(317282047)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282047", "story_v_out_317282.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282047", "story_v_out_317282.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_317282", "317282047", "story_v_out_317282.awb")

						arg_189_1:RecordAudio("317282047", var_192_9)
						arg_189_1:RecordAudio("317282047", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_317282", "317282047", "story_v_out_317282.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_317282", "317282047", "story_v_out_317282.awb")
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
	Play317282048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 317282048
		arg_193_1.duration_ = 4.733

		local var_193_0 = {
			zh = 4.333,
			ja = 4.733
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
				arg_193_0:Play317282049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["2079ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect2079ui_story == nil then
				arg_193_1.var_.characterEffect2079ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect2079ui_story then
					arg_193_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect2079ui_story then
				arg_193_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_196_4 = arg_193_1.actors_["2078ui_story"]
			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 and arg_193_1.var_.characterEffect2078ui_story == nil then
				arg_193_1.var_.characterEffect2078ui_story = var_196_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_6 = 0.200000002980232

			if var_196_5 <= arg_193_1.time_ and arg_193_1.time_ < var_196_5 + var_196_6 then
				local var_196_7 = (arg_193_1.time_ - var_196_5) / var_196_6

				if arg_193_1.var_.characterEffect2078ui_story then
					local var_196_8 = Mathf.Lerp(0, 0.5, var_196_7)

					arg_193_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_193_1.var_.characterEffect2078ui_story.fillRatio = var_196_8
				end
			end

			if arg_193_1.time_ >= var_196_5 + var_196_6 and arg_193_1.time_ < var_196_5 + var_196_6 + arg_196_0 and arg_193_1.var_.characterEffect2078ui_story then
				local var_196_9 = 0.5

				arg_193_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_193_1.var_.characterEffect2078ui_story.fillRatio = var_196_9
			end

			local var_196_10 = 0
			local var_196_11 = 0.375

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_12 = arg_193_1:FormatText(StoryNameCfg[571].name)

				arg_193_1.leftNameTxt_.text = var_196_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_13 = arg_193_1:GetWordFromCfg(317282048)
				local var_196_14 = arg_193_1:FormatText(var_196_13.content)

				arg_193_1.text_.text = var_196_14

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_15 = 15
				local var_196_16 = utf8.len(var_196_14)
				local var_196_17 = var_196_15 <= 0 and var_196_11 or var_196_11 * (var_196_16 / var_196_15)

				if var_196_17 > 0 and var_196_11 < var_196_17 then
					arg_193_1.talkMaxDuration = var_196_17

					if var_196_17 + var_196_10 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_17 + var_196_10
					end
				end

				arg_193_1.text_.text = var_196_14
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282048", "story_v_out_317282.awb") ~= 0 then
					local var_196_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282048", "story_v_out_317282.awb") / 1000

					if var_196_18 + var_196_10 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_18 + var_196_10
					end

					if var_196_13.prefab_name ~= "" and arg_193_1.actors_[var_196_13.prefab_name] ~= nil then
						local var_196_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_13.prefab_name].transform, "story_v_out_317282", "317282048", "story_v_out_317282.awb")

						arg_193_1:RecordAudio("317282048", var_196_19)
						arg_193_1:RecordAudio("317282048", var_196_19)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_317282", "317282048", "story_v_out_317282.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_317282", "317282048", "story_v_out_317282.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_20 = math.max(var_196_11, arg_193_1.talkMaxDuration)

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_20 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_10) / var_196_20

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_10 + var_196_20 and arg_193_1.time_ < var_196_10 + var_196_20 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play317282049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 317282049
		arg_197_1.duration_ = 13.766

		local var_197_0 = {
			zh = 13.766,
			ja = 9.433
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
				arg_197_0:Play317282050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["2078ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos2078ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos2078ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["2078ui_story"]
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect2078ui_story == nil then
				arg_197_1.var_.characterEffect2078ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.200000002980232

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect2078ui_story then
					arg_197_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect2078ui_story then
				arg_197_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_200_13 = arg_197_1.actors_["2079ui_story"]
			local var_200_14 = 0

			if var_200_14 < arg_197_1.time_ and arg_197_1.time_ <= var_200_14 + arg_200_0 and arg_197_1.var_.characterEffect2079ui_story == nil then
				arg_197_1.var_.characterEffect2079ui_story = var_200_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_15 = 0.200000002980232

			if var_200_14 <= arg_197_1.time_ and arg_197_1.time_ < var_200_14 + var_200_15 then
				local var_200_16 = (arg_197_1.time_ - var_200_14) / var_200_15

				if arg_197_1.var_.characterEffect2079ui_story then
					local var_200_17 = Mathf.Lerp(0, 0.5, var_200_16)

					arg_197_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_197_1.var_.characterEffect2079ui_story.fillRatio = var_200_17
				end
			end

			if arg_197_1.time_ >= var_200_14 + var_200_15 and arg_197_1.time_ < var_200_14 + var_200_15 + arg_200_0 and arg_197_1.var_.characterEffect2079ui_story then
				local var_200_18 = 0.5

				arg_197_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_197_1.var_.characterEffect2079ui_story.fillRatio = var_200_18
			end

			local var_200_19 = 0
			local var_200_20 = 1.475

			if var_200_19 < arg_197_1.time_ and arg_197_1.time_ <= var_200_19 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_21 = arg_197_1:FormatText(StoryNameCfg[528].name)

				arg_197_1.leftNameTxt_.text = var_200_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_22 = arg_197_1:GetWordFromCfg(317282049)
				local var_200_23 = arg_197_1:FormatText(var_200_22.content)

				arg_197_1.text_.text = var_200_23

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_24 = 59
				local var_200_25 = utf8.len(var_200_23)
				local var_200_26 = var_200_24 <= 0 and var_200_20 or var_200_20 * (var_200_25 / var_200_24)

				if var_200_26 > 0 and var_200_20 < var_200_26 then
					arg_197_1.talkMaxDuration = var_200_26

					if var_200_26 + var_200_19 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_26 + var_200_19
					end
				end

				arg_197_1.text_.text = var_200_23
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282049", "story_v_out_317282.awb") ~= 0 then
					local var_200_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282049", "story_v_out_317282.awb") / 1000

					if var_200_27 + var_200_19 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_27 + var_200_19
					end

					if var_200_22.prefab_name ~= "" and arg_197_1.actors_[var_200_22.prefab_name] ~= nil then
						local var_200_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_22.prefab_name].transform, "story_v_out_317282", "317282049", "story_v_out_317282.awb")

						arg_197_1:RecordAudio("317282049", var_200_28)
						arg_197_1:RecordAudio("317282049", var_200_28)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_317282", "317282049", "story_v_out_317282.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_317282", "317282049", "story_v_out_317282.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_29 = math.max(var_200_20, arg_197_1.talkMaxDuration)

			if var_200_19 <= arg_197_1.time_ and arg_197_1.time_ < var_200_19 + var_200_29 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_19) / var_200_29

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_19 + var_200_29 and arg_197_1.time_ < var_200_19 + var_200_29 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play317282050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 317282050
		arg_201_1.duration_ = 8.066

		local var_201_0 = {
			zh = 5.133,
			ja = 8.066
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
				arg_201_0:Play317282051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["2079ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos2079ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0.7, -1.28, -5.6)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos2079ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["2079ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect2079ui_story == nil then
				arg_201_1.var_.characterEffect2079ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect2079ui_story then
					arg_201_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect2079ui_story then
				arg_201_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_204_13 = arg_201_1.actors_["2078ui_story"]
			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 and arg_201_1.var_.characterEffect2078ui_story == nil then
				arg_201_1.var_.characterEffect2078ui_story = var_204_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_15 = 0.200000002980232

			if var_204_14 <= arg_201_1.time_ and arg_201_1.time_ < var_204_14 + var_204_15 then
				local var_204_16 = (arg_201_1.time_ - var_204_14) / var_204_15

				if arg_201_1.var_.characterEffect2078ui_story then
					local var_204_17 = Mathf.Lerp(0, 0.5, var_204_16)

					arg_201_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_201_1.var_.characterEffect2078ui_story.fillRatio = var_204_17
				end
			end

			if arg_201_1.time_ >= var_204_14 + var_204_15 and arg_201_1.time_ < var_204_14 + var_204_15 + arg_204_0 and arg_201_1.var_.characterEffect2078ui_story then
				local var_204_18 = 0.5

				arg_201_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_201_1.var_.characterEffect2078ui_story.fillRatio = var_204_18
			end

			local var_204_19 = 0
			local var_204_20 = 0.65

			if var_204_19 < arg_201_1.time_ and arg_201_1.time_ <= var_204_19 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_21 = arg_201_1:FormatText(StoryNameCfg[571].name)

				arg_201_1.leftNameTxt_.text = var_204_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_22 = arg_201_1:GetWordFromCfg(317282050)
				local var_204_23 = arg_201_1:FormatText(var_204_22.content)

				arg_201_1.text_.text = var_204_23

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_24 = 26
				local var_204_25 = utf8.len(var_204_23)
				local var_204_26 = var_204_24 <= 0 and var_204_20 or var_204_20 * (var_204_25 / var_204_24)

				if var_204_26 > 0 and var_204_20 < var_204_26 then
					arg_201_1.talkMaxDuration = var_204_26

					if var_204_26 + var_204_19 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_26 + var_204_19
					end
				end

				arg_201_1.text_.text = var_204_23
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282050", "story_v_out_317282.awb") ~= 0 then
					local var_204_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282050", "story_v_out_317282.awb") / 1000

					if var_204_27 + var_204_19 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_27 + var_204_19
					end

					if var_204_22.prefab_name ~= "" and arg_201_1.actors_[var_204_22.prefab_name] ~= nil then
						local var_204_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_22.prefab_name].transform, "story_v_out_317282", "317282050", "story_v_out_317282.awb")

						arg_201_1:RecordAudio("317282050", var_204_28)
						arg_201_1:RecordAudio("317282050", var_204_28)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_317282", "317282050", "story_v_out_317282.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_317282", "317282050", "story_v_out_317282.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_29 = math.max(var_204_20, arg_201_1.talkMaxDuration)

			if var_204_19 <= arg_201_1.time_ and arg_201_1.time_ < var_204_19 + var_204_29 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_19) / var_204_29

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_19 + var_204_29 and arg_201_1.time_ < var_204_19 + var_204_29 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play317282051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 317282051
		arg_205_1.duration_ = 3.8

		local var_205_0 = {
			zh = 3.8,
			ja = 3.7
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
				arg_205_0:Play317282052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["2078ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos2078ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos2078ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = arg_205_1.actors_["2078ui_story"]
			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 and arg_205_1.var_.characterEffect2078ui_story == nil then
				arg_205_1.var_.characterEffect2078ui_story = var_208_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_11 = 0.200000002980232

			if var_208_10 <= arg_205_1.time_ and arg_205_1.time_ < var_208_10 + var_208_11 then
				local var_208_12 = (arg_205_1.time_ - var_208_10) / var_208_11

				if arg_205_1.var_.characterEffect2078ui_story then
					arg_205_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_10 + var_208_11 and arg_205_1.time_ < var_208_10 + var_208_11 + arg_208_0 and arg_205_1.var_.characterEffect2078ui_story then
				arg_205_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_208_13 = arg_205_1.actors_["2079ui_story"]
			local var_208_14 = 0

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 and arg_205_1.var_.characterEffect2079ui_story == nil then
				arg_205_1.var_.characterEffect2079ui_story = var_208_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_15 = 0.200000002980232

			if var_208_14 <= arg_205_1.time_ and arg_205_1.time_ < var_208_14 + var_208_15 then
				local var_208_16 = (arg_205_1.time_ - var_208_14) / var_208_15

				if arg_205_1.var_.characterEffect2079ui_story then
					local var_208_17 = Mathf.Lerp(0, 0.5, var_208_16)

					arg_205_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_205_1.var_.characterEffect2079ui_story.fillRatio = var_208_17
				end
			end

			if arg_205_1.time_ >= var_208_14 + var_208_15 and arg_205_1.time_ < var_208_14 + var_208_15 + arg_208_0 and arg_205_1.var_.characterEffect2079ui_story then
				local var_208_18 = 0.5

				arg_205_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_205_1.var_.characterEffect2079ui_story.fillRatio = var_208_18
			end

			local var_208_19 = 0
			local var_208_20 = 0.375

			if var_208_19 < arg_205_1.time_ and arg_205_1.time_ <= var_208_19 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_21 = arg_205_1:FormatText(StoryNameCfg[528].name)

				arg_205_1.leftNameTxt_.text = var_208_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_22 = arg_205_1:GetWordFromCfg(317282051)
				local var_208_23 = arg_205_1:FormatText(var_208_22.content)

				arg_205_1.text_.text = var_208_23

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_24 = 14
				local var_208_25 = utf8.len(var_208_23)
				local var_208_26 = var_208_24 <= 0 and var_208_20 or var_208_20 * (var_208_25 / var_208_24)

				if var_208_26 > 0 and var_208_20 < var_208_26 then
					arg_205_1.talkMaxDuration = var_208_26

					if var_208_26 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_26 + var_208_19
					end
				end

				arg_205_1.text_.text = var_208_23
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282051", "story_v_out_317282.awb") ~= 0 then
					local var_208_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282051", "story_v_out_317282.awb") / 1000

					if var_208_27 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_27 + var_208_19
					end

					if var_208_22.prefab_name ~= "" and arg_205_1.actors_[var_208_22.prefab_name] ~= nil then
						local var_208_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_22.prefab_name].transform, "story_v_out_317282", "317282051", "story_v_out_317282.awb")

						arg_205_1:RecordAudio("317282051", var_208_28)
						arg_205_1:RecordAudio("317282051", var_208_28)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_317282", "317282051", "story_v_out_317282.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_317282", "317282051", "story_v_out_317282.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_29 = math.max(var_208_20, arg_205_1.talkMaxDuration)

			if var_208_19 <= arg_205_1.time_ and arg_205_1.time_ < var_208_19 + var_208_29 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_19) / var_208_29

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_19 + var_208_29 and arg_205_1.time_ < var_208_19 + var_208_29 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play317282052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 317282052
		arg_209_1.duration_ = 1.5

		local var_209_0 = {
			zh = 1.433,
			ja = 1.5
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
				arg_209_0:Play317282053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["2079ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos2079ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0.7, -1.28, -5.6)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos2079ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["2079ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect2079ui_story == nil then
				arg_209_1.var_.characterEffect2079ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect2079ui_story then
					arg_209_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect2079ui_story then
				arg_209_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_212_13 = arg_209_1.actors_["2078ui_story"]
			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 and arg_209_1.var_.characterEffect2078ui_story == nil then
				arg_209_1.var_.characterEffect2078ui_story = var_212_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_15 = 0.200000002980232

			if var_212_14 <= arg_209_1.time_ and arg_209_1.time_ < var_212_14 + var_212_15 then
				local var_212_16 = (arg_209_1.time_ - var_212_14) / var_212_15

				if arg_209_1.var_.characterEffect2078ui_story then
					local var_212_17 = Mathf.Lerp(0, 0.5, var_212_16)

					arg_209_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_209_1.var_.characterEffect2078ui_story.fillRatio = var_212_17
				end
			end

			if arg_209_1.time_ >= var_212_14 + var_212_15 and arg_209_1.time_ < var_212_14 + var_212_15 + arg_212_0 and arg_209_1.var_.characterEffect2078ui_story then
				local var_212_18 = 0.5

				arg_209_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_209_1.var_.characterEffect2078ui_story.fillRatio = var_212_18
			end

			local var_212_19 = 0
			local var_212_20 = 0.15

			if var_212_19 < arg_209_1.time_ and arg_209_1.time_ <= var_212_19 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_21 = arg_209_1:FormatText(StoryNameCfg[571].name)

				arg_209_1.leftNameTxt_.text = var_212_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_22 = arg_209_1:GetWordFromCfg(317282052)
				local var_212_23 = arg_209_1:FormatText(var_212_22.content)

				arg_209_1.text_.text = var_212_23

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_24 = 6
				local var_212_25 = utf8.len(var_212_23)
				local var_212_26 = var_212_24 <= 0 and var_212_20 or var_212_20 * (var_212_25 / var_212_24)

				if var_212_26 > 0 and var_212_20 < var_212_26 then
					arg_209_1.talkMaxDuration = var_212_26

					if var_212_26 + var_212_19 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_26 + var_212_19
					end
				end

				arg_209_1.text_.text = var_212_23
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282052", "story_v_out_317282.awb") ~= 0 then
					local var_212_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282052", "story_v_out_317282.awb") / 1000

					if var_212_27 + var_212_19 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_27 + var_212_19
					end

					if var_212_22.prefab_name ~= "" and arg_209_1.actors_[var_212_22.prefab_name] ~= nil then
						local var_212_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_22.prefab_name].transform, "story_v_out_317282", "317282052", "story_v_out_317282.awb")

						arg_209_1:RecordAudio("317282052", var_212_28)
						arg_209_1:RecordAudio("317282052", var_212_28)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_317282", "317282052", "story_v_out_317282.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_317282", "317282052", "story_v_out_317282.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_29 = math.max(var_212_20, arg_209_1.talkMaxDuration)

			if var_212_19 <= arg_209_1.time_ and arg_209_1.time_ < var_212_19 + var_212_29 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_19) / var_212_29

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_19 + var_212_29 and arg_209_1.time_ < var_212_19 + var_212_29 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play317282053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 317282053
		arg_213_1.duration_ = 6.5

		local var_213_0 = {
			zh = 6.5,
			ja = 6.433
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
				arg_213_0:Play317282054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["2078ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos2078ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos2078ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["2078ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect2078ui_story == nil then
				arg_213_1.var_.characterEffect2078ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect2078ui_story then
					arg_213_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect2078ui_story then
				arg_213_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_216_13 = arg_213_1.actors_["2079ui_story"]
			local var_216_14 = 0

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 and arg_213_1.var_.characterEffect2079ui_story == nil then
				arg_213_1.var_.characterEffect2079ui_story = var_216_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_15 = 0.200000002980232

			if var_216_14 <= arg_213_1.time_ and arg_213_1.time_ < var_216_14 + var_216_15 then
				local var_216_16 = (arg_213_1.time_ - var_216_14) / var_216_15

				if arg_213_1.var_.characterEffect2079ui_story then
					local var_216_17 = Mathf.Lerp(0, 0.5, var_216_16)

					arg_213_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_213_1.var_.characterEffect2079ui_story.fillRatio = var_216_17
				end
			end

			if arg_213_1.time_ >= var_216_14 + var_216_15 and arg_213_1.time_ < var_216_14 + var_216_15 + arg_216_0 and arg_213_1.var_.characterEffect2079ui_story then
				local var_216_18 = 0.5

				arg_213_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_213_1.var_.characterEffect2079ui_story.fillRatio = var_216_18
			end

			local var_216_19 = 0
			local var_216_20 = 0.65

			if var_216_19 < arg_213_1.time_ and arg_213_1.time_ <= var_216_19 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_21 = arg_213_1:FormatText(StoryNameCfg[528].name)

				arg_213_1.leftNameTxt_.text = var_216_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_22 = arg_213_1:GetWordFromCfg(317282053)
				local var_216_23 = arg_213_1:FormatText(var_216_22.content)

				arg_213_1.text_.text = var_216_23

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_24 = 26
				local var_216_25 = utf8.len(var_216_23)
				local var_216_26 = var_216_24 <= 0 and var_216_20 or var_216_20 * (var_216_25 / var_216_24)

				if var_216_26 > 0 and var_216_20 < var_216_26 then
					arg_213_1.talkMaxDuration = var_216_26

					if var_216_26 + var_216_19 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_26 + var_216_19
					end
				end

				arg_213_1.text_.text = var_216_23
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282053", "story_v_out_317282.awb") ~= 0 then
					local var_216_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282053", "story_v_out_317282.awb") / 1000

					if var_216_27 + var_216_19 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_27 + var_216_19
					end

					if var_216_22.prefab_name ~= "" and arg_213_1.actors_[var_216_22.prefab_name] ~= nil then
						local var_216_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_22.prefab_name].transform, "story_v_out_317282", "317282053", "story_v_out_317282.awb")

						arg_213_1:RecordAudio("317282053", var_216_28)
						arg_213_1:RecordAudio("317282053", var_216_28)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_317282", "317282053", "story_v_out_317282.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_317282", "317282053", "story_v_out_317282.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_29 = math.max(var_216_20, arg_213_1.talkMaxDuration)

			if var_216_19 <= arg_213_1.time_ and arg_213_1.time_ < var_216_19 + var_216_29 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_19) / var_216_29

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_19 + var_216_29 and arg_213_1.time_ < var_216_19 + var_216_29 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play317282054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 317282054
		arg_217_1.duration_ = 4.6

		local var_217_0 = {
			zh = 3.366,
			ja = 4.6
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
				arg_217_0:Play317282055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["2079ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos2079ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(0.7, -1.28, -5.6)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos2079ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = arg_217_1.actors_["2079ui_story"]
			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect2079ui_story == nil then
				arg_217_1.var_.characterEffect2079ui_story = var_220_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_11 = 0.200000002980232

			if var_220_10 <= arg_217_1.time_ and arg_217_1.time_ < var_220_10 + var_220_11 then
				local var_220_12 = (arg_217_1.time_ - var_220_10) / var_220_11

				if arg_217_1.var_.characterEffect2079ui_story then
					arg_217_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_10 + var_220_11 and arg_217_1.time_ < var_220_10 + var_220_11 + arg_220_0 and arg_217_1.var_.characterEffect2079ui_story then
				arg_217_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_220_13 = arg_217_1.actors_["2078ui_story"]
			local var_220_14 = 0

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 and arg_217_1.var_.characterEffect2078ui_story == nil then
				arg_217_1.var_.characterEffect2078ui_story = var_220_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_15 = 0.200000002980232

			if var_220_14 <= arg_217_1.time_ and arg_217_1.time_ < var_220_14 + var_220_15 then
				local var_220_16 = (arg_217_1.time_ - var_220_14) / var_220_15

				if arg_217_1.var_.characterEffect2078ui_story then
					local var_220_17 = Mathf.Lerp(0, 0.5, var_220_16)

					arg_217_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_217_1.var_.characterEffect2078ui_story.fillRatio = var_220_17
				end
			end

			if arg_217_1.time_ >= var_220_14 + var_220_15 and arg_217_1.time_ < var_220_14 + var_220_15 + arg_220_0 and arg_217_1.var_.characterEffect2078ui_story then
				local var_220_18 = 0.5

				arg_217_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_217_1.var_.characterEffect2078ui_story.fillRatio = var_220_18
			end

			local var_220_19 = 0
			local var_220_20 = 0.15

			if var_220_19 < arg_217_1.time_ and arg_217_1.time_ <= var_220_19 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_21 = arg_217_1:FormatText(StoryNameCfg[571].name)

				arg_217_1.leftNameTxt_.text = var_220_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_22 = arg_217_1:GetWordFromCfg(317282054)
				local var_220_23 = arg_217_1:FormatText(var_220_22.content)

				arg_217_1.text_.text = var_220_23

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_24 = 6
				local var_220_25 = utf8.len(var_220_23)
				local var_220_26 = var_220_24 <= 0 and var_220_20 or var_220_20 * (var_220_25 / var_220_24)

				if var_220_26 > 0 and var_220_20 < var_220_26 then
					arg_217_1.talkMaxDuration = var_220_26

					if var_220_26 + var_220_19 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_26 + var_220_19
					end
				end

				arg_217_1.text_.text = var_220_23
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282054", "story_v_out_317282.awb") ~= 0 then
					local var_220_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282054", "story_v_out_317282.awb") / 1000

					if var_220_27 + var_220_19 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_27 + var_220_19
					end

					if var_220_22.prefab_name ~= "" and arg_217_1.actors_[var_220_22.prefab_name] ~= nil then
						local var_220_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_22.prefab_name].transform, "story_v_out_317282", "317282054", "story_v_out_317282.awb")

						arg_217_1:RecordAudio("317282054", var_220_28)
						arg_217_1:RecordAudio("317282054", var_220_28)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_317282", "317282054", "story_v_out_317282.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_317282", "317282054", "story_v_out_317282.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_29 = math.max(var_220_20, arg_217_1.talkMaxDuration)

			if var_220_19 <= arg_217_1.time_ and arg_217_1.time_ < var_220_19 + var_220_29 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_19) / var_220_29

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_19 + var_220_29 and arg_217_1.time_ < var_220_19 + var_220_29 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play317282055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 317282055
		arg_221_1.duration_ = 11.233

		local var_221_0 = {
			zh = 11.233,
			ja = 8.666
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
				arg_221_0:Play317282056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["2078ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos2078ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos2078ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["2078ui_story"]
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 and arg_221_1.var_.characterEffect2078ui_story == nil then
				arg_221_1.var_.characterEffect2078ui_story = var_224_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_11 = 0.200000002980232

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11

				if arg_221_1.var_.characterEffect2078ui_story then
					arg_221_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect2078ui_story then
				arg_221_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_224_13 = arg_221_1.actors_["2079ui_story"]
			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 and arg_221_1.var_.characterEffect2079ui_story == nil then
				arg_221_1.var_.characterEffect2079ui_story = var_224_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_15 = 0.200000002980232

			if var_224_14 <= arg_221_1.time_ and arg_221_1.time_ < var_224_14 + var_224_15 then
				local var_224_16 = (arg_221_1.time_ - var_224_14) / var_224_15

				if arg_221_1.var_.characterEffect2079ui_story then
					local var_224_17 = Mathf.Lerp(0, 0.5, var_224_16)

					arg_221_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_221_1.var_.characterEffect2079ui_story.fillRatio = var_224_17
				end
			end

			if arg_221_1.time_ >= var_224_14 + var_224_15 and arg_221_1.time_ < var_224_14 + var_224_15 + arg_224_0 and arg_221_1.var_.characterEffect2079ui_story then
				local var_224_18 = 0.5

				arg_221_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_221_1.var_.characterEffect2079ui_story.fillRatio = var_224_18
			end

			local var_224_19 = 0
			local var_224_20 = 1.225

			if var_224_19 < arg_221_1.time_ and arg_221_1.time_ <= var_224_19 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_21 = arg_221_1:FormatText(StoryNameCfg[528].name)

				arg_221_1.leftNameTxt_.text = var_224_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_22 = arg_221_1:GetWordFromCfg(317282055)
				local var_224_23 = arg_221_1:FormatText(var_224_22.content)

				arg_221_1.text_.text = var_224_23

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_24 = 49
				local var_224_25 = utf8.len(var_224_23)
				local var_224_26 = var_224_24 <= 0 and var_224_20 or var_224_20 * (var_224_25 / var_224_24)

				if var_224_26 > 0 and var_224_20 < var_224_26 then
					arg_221_1.talkMaxDuration = var_224_26

					if var_224_26 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_26 + var_224_19
					end
				end

				arg_221_1.text_.text = var_224_23
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282055", "story_v_out_317282.awb") ~= 0 then
					local var_224_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282055", "story_v_out_317282.awb") / 1000

					if var_224_27 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_27 + var_224_19
					end

					if var_224_22.prefab_name ~= "" and arg_221_1.actors_[var_224_22.prefab_name] ~= nil then
						local var_224_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_22.prefab_name].transform, "story_v_out_317282", "317282055", "story_v_out_317282.awb")

						arg_221_1:RecordAudio("317282055", var_224_28)
						arg_221_1:RecordAudio("317282055", var_224_28)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_317282", "317282055", "story_v_out_317282.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_317282", "317282055", "story_v_out_317282.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_29 = math.max(var_224_20, arg_221_1.talkMaxDuration)

			if var_224_19 <= arg_221_1.time_ and arg_221_1.time_ < var_224_19 + var_224_29 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_19) / var_224_29

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_19 + var_224_29 and arg_221_1.time_ < var_224_19 + var_224_29 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play317282056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 317282056
		arg_225_1.duration_ = 8.8

		local var_225_0 = {
			zh = 8.466,
			ja = 8.8
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
				arg_225_0:Play317282057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.95

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[528].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(317282056)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 38
				local var_228_6 = utf8.len(var_228_4)
				local var_228_7 = var_228_5 <= 0 and var_228_1 or var_228_1 * (var_228_6 / var_228_5)

				if var_228_7 > 0 and var_228_1 < var_228_7 then
					arg_225_1.talkMaxDuration = var_228_7

					if var_228_7 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_7 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_4
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282056", "story_v_out_317282.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282056", "story_v_out_317282.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_317282", "317282056", "story_v_out_317282.awb")

						arg_225_1:RecordAudio("317282056", var_228_9)
						arg_225_1:RecordAudio("317282056", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_317282", "317282056", "story_v_out_317282.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_317282", "317282056", "story_v_out_317282.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_10 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_10 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_10

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_10 and arg_225_1.time_ < var_228_0 + var_228_10 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play317282057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 317282057
		arg_229_1.duration_ = 2.766

		local var_229_0 = {
			zh = 2.266,
			ja = 2.766
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
				arg_229_0:Play317282058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["2079ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos2079ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0.7, -1.28, -5.6)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos2079ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["2079ui_story"]
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 and arg_229_1.var_.characterEffect2079ui_story == nil then
				arg_229_1.var_.characterEffect2079ui_story = var_232_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_11 = 0.200000002980232

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11

				if arg_229_1.var_.characterEffect2079ui_story then
					arg_229_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 and arg_229_1.var_.characterEffect2079ui_story then
				arg_229_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_232_13 = arg_229_1.actors_["2078ui_story"]
			local var_232_14 = 0

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 and arg_229_1.var_.characterEffect2078ui_story == nil then
				arg_229_1.var_.characterEffect2078ui_story = var_232_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_15 = 0.200000002980232

			if var_232_14 <= arg_229_1.time_ and arg_229_1.time_ < var_232_14 + var_232_15 then
				local var_232_16 = (arg_229_1.time_ - var_232_14) / var_232_15

				if arg_229_1.var_.characterEffect2078ui_story then
					local var_232_17 = Mathf.Lerp(0, 0.5, var_232_16)

					arg_229_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_229_1.var_.characterEffect2078ui_story.fillRatio = var_232_17
				end
			end

			if arg_229_1.time_ >= var_232_14 + var_232_15 and arg_229_1.time_ < var_232_14 + var_232_15 + arg_232_0 and arg_229_1.var_.characterEffect2078ui_story then
				local var_232_18 = 0.5

				arg_229_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_229_1.var_.characterEffect2078ui_story.fillRatio = var_232_18
			end

			local var_232_19 = 0
			local var_232_20 = 0.25

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_21 = arg_229_1:FormatText(StoryNameCfg[571].name)

				arg_229_1.leftNameTxt_.text = var_232_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_22 = arg_229_1:GetWordFromCfg(317282057)
				local var_232_23 = arg_229_1:FormatText(var_232_22.content)

				arg_229_1.text_.text = var_232_23

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_24 = 10
				local var_232_25 = utf8.len(var_232_23)
				local var_232_26 = var_232_24 <= 0 and var_232_20 or var_232_20 * (var_232_25 / var_232_24)

				if var_232_26 > 0 and var_232_20 < var_232_26 then
					arg_229_1.talkMaxDuration = var_232_26

					if var_232_26 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_26 + var_232_19
					end
				end

				arg_229_1.text_.text = var_232_23
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282057", "story_v_out_317282.awb") ~= 0 then
					local var_232_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282057", "story_v_out_317282.awb") / 1000

					if var_232_27 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_27 + var_232_19
					end

					if var_232_22.prefab_name ~= "" and arg_229_1.actors_[var_232_22.prefab_name] ~= nil then
						local var_232_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_22.prefab_name].transform, "story_v_out_317282", "317282057", "story_v_out_317282.awb")

						arg_229_1:RecordAudio("317282057", var_232_28)
						arg_229_1:RecordAudio("317282057", var_232_28)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_317282", "317282057", "story_v_out_317282.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_317282", "317282057", "story_v_out_317282.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_29 = math.max(var_232_20, arg_229_1.talkMaxDuration)

			if var_232_19 <= arg_229_1.time_ and arg_229_1.time_ < var_232_19 + var_232_29 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_19) / var_232_29

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_19 + var_232_29 and arg_229_1.time_ < var_232_19 + var_232_29 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play317282058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 317282058
		arg_233_1.duration_ = 9.133

		local var_233_0 = {
			zh = 5.133,
			ja = 9.133
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
				arg_233_0:Play317282059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["2078ui_story"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos2078ui_story = var_236_0.localPosition
			end

			local var_236_2 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2
				local var_236_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos2078ui_story, var_236_4, var_236_3)

				local var_236_5 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_5.x, var_236_5.y, var_236_5.z)

				local var_236_6 = var_236_0.localEulerAngles

				var_236_6.z = 0
				var_236_6.x = 0
				var_236_0.localEulerAngles = var_236_6
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_236_7 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_7.x, var_236_7.y, var_236_7.z)

				local var_236_8 = var_236_0.localEulerAngles

				var_236_8.z = 0
				var_236_8.x = 0
				var_236_0.localEulerAngles = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["2078ui_story"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 and arg_233_1.var_.characterEffect2078ui_story == nil then
				arg_233_1.var_.characterEffect2078ui_story = var_236_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_11 = 0.200000002980232

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_11 then
				local var_236_12 = (arg_233_1.time_ - var_236_10) / var_236_11

				if arg_233_1.var_.characterEffect2078ui_story then
					arg_233_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_11 and arg_233_1.time_ < var_236_10 + var_236_11 + arg_236_0 and arg_233_1.var_.characterEffect2078ui_story then
				arg_233_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_236_13 = arg_233_1.actors_["2079ui_story"]
			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 and arg_233_1.var_.characterEffect2079ui_story == nil then
				arg_233_1.var_.characterEffect2079ui_story = var_236_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_15 = 0.200000002980232

			if var_236_14 <= arg_233_1.time_ and arg_233_1.time_ < var_236_14 + var_236_15 then
				local var_236_16 = (arg_233_1.time_ - var_236_14) / var_236_15

				if arg_233_1.var_.characterEffect2079ui_story then
					local var_236_17 = Mathf.Lerp(0, 0.5, var_236_16)

					arg_233_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_233_1.var_.characterEffect2079ui_story.fillRatio = var_236_17
				end
			end

			if arg_233_1.time_ >= var_236_14 + var_236_15 and arg_233_1.time_ < var_236_14 + var_236_15 + arg_236_0 and arg_233_1.var_.characterEffect2079ui_story then
				local var_236_18 = 0.5

				arg_233_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_233_1.var_.characterEffect2079ui_story.fillRatio = var_236_18
			end

			local var_236_19 = 0
			local var_236_20 = 0.55

			if var_236_19 < arg_233_1.time_ and arg_233_1.time_ <= var_236_19 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_21 = arg_233_1:FormatText(StoryNameCfg[528].name)

				arg_233_1.leftNameTxt_.text = var_236_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_22 = arg_233_1:GetWordFromCfg(317282058)
				local var_236_23 = arg_233_1:FormatText(var_236_22.content)

				arg_233_1.text_.text = var_236_23

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_24 = 22
				local var_236_25 = utf8.len(var_236_23)
				local var_236_26 = var_236_24 <= 0 and var_236_20 or var_236_20 * (var_236_25 / var_236_24)

				if var_236_26 > 0 and var_236_20 < var_236_26 then
					arg_233_1.talkMaxDuration = var_236_26

					if var_236_26 + var_236_19 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_26 + var_236_19
					end
				end

				arg_233_1.text_.text = var_236_23
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282058", "story_v_out_317282.awb") ~= 0 then
					local var_236_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282058", "story_v_out_317282.awb") / 1000

					if var_236_27 + var_236_19 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_27 + var_236_19
					end

					if var_236_22.prefab_name ~= "" and arg_233_1.actors_[var_236_22.prefab_name] ~= nil then
						local var_236_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_22.prefab_name].transform, "story_v_out_317282", "317282058", "story_v_out_317282.awb")

						arg_233_1:RecordAudio("317282058", var_236_28)
						arg_233_1:RecordAudio("317282058", var_236_28)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_317282", "317282058", "story_v_out_317282.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_317282", "317282058", "story_v_out_317282.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_29 = math.max(var_236_20, arg_233_1.talkMaxDuration)

			if var_236_19 <= arg_233_1.time_ and arg_233_1.time_ < var_236_19 + var_236_29 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_19) / var_236_29

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_19 + var_236_29 and arg_233_1.time_ < var_236_19 + var_236_29 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play317282059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 317282059
		arg_237_1.duration_ = 9.9

		local var_237_0 = {
			zh = 7.6,
			ja = 9.9
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
				arg_237_0:Play317282060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.95

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[528].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(317282059)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 38
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282059", "story_v_out_317282.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282059", "story_v_out_317282.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_317282", "317282059", "story_v_out_317282.awb")

						arg_237_1:RecordAudio("317282059", var_240_9)
						arg_237_1:RecordAudio("317282059", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_317282", "317282059", "story_v_out_317282.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_317282", "317282059", "story_v_out_317282.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_10 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_10 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_10

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_10 and arg_237_1.time_ < var_240_0 + var_240_10 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play317282060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 317282060
		arg_241_1.duration_ = 16.566

		local var_241_0 = {
			zh = 16.566,
			ja = 11.8
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
				arg_241_0:Play317282061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["2079ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos2079ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(0.7, -1.28, -5.6)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos2079ui_story, var_244_4, var_244_3)

				local var_244_5 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_5.x, var_244_5.y, var_244_5.z)

				local var_244_6 = var_244_0.localEulerAngles

				var_244_6.z = 0
				var_244_6.x = 0
				var_244_0.localEulerAngles = var_244_6
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_244_7 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_7.x, var_244_7.y, var_244_7.z)

				local var_244_8 = var_244_0.localEulerAngles

				var_244_8.z = 0
				var_244_8.x = 0
				var_244_0.localEulerAngles = var_244_8
			end

			local var_244_9 = arg_241_1.actors_["2079ui_story"]
			local var_244_10 = 0

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 and arg_241_1.var_.characterEffect2079ui_story == nil then
				arg_241_1.var_.characterEffect2079ui_story = var_244_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_11 = 0.200000002980232

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_10) / var_244_11

				if arg_241_1.var_.characterEffect2079ui_story then
					arg_241_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_10 + var_244_11 and arg_241_1.time_ < var_244_10 + var_244_11 + arg_244_0 and arg_241_1.var_.characterEffect2079ui_story then
				arg_241_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_244_13 = arg_241_1.actors_["2078ui_story"]
			local var_244_14 = 0

			if var_244_14 < arg_241_1.time_ and arg_241_1.time_ <= var_244_14 + arg_244_0 and arg_241_1.var_.characterEffect2078ui_story == nil then
				arg_241_1.var_.characterEffect2078ui_story = var_244_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_15 = 0.200000002980232

			if var_244_14 <= arg_241_1.time_ and arg_241_1.time_ < var_244_14 + var_244_15 then
				local var_244_16 = (arg_241_1.time_ - var_244_14) / var_244_15

				if arg_241_1.var_.characterEffect2078ui_story then
					local var_244_17 = Mathf.Lerp(0, 0.5, var_244_16)

					arg_241_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_241_1.var_.characterEffect2078ui_story.fillRatio = var_244_17
				end
			end

			if arg_241_1.time_ >= var_244_14 + var_244_15 and arg_241_1.time_ < var_244_14 + var_244_15 + arg_244_0 and arg_241_1.var_.characterEffect2078ui_story then
				local var_244_18 = 0.5

				arg_241_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_241_1.var_.characterEffect2078ui_story.fillRatio = var_244_18
			end

			local var_244_19 = 0
			local var_244_20 = 1.925

			if var_244_19 < arg_241_1.time_ and arg_241_1.time_ <= var_244_19 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_21 = arg_241_1:FormatText(StoryNameCfg[571].name)

				arg_241_1.leftNameTxt_.text = var_244_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_22 = arg_241_1:GetWordFromCfg(317282060)
				local var_244_23 = arg_241_1:FormatText(var_244_22.content)

				arg_241_1.text_.text = var_244_23

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_24 = 77
				local var_244_25 = utf8.len(var_244_23)
				local var_244_26 = var_244_24 <= 0 and var_244_20 or var_244_20 * (var_244_25 / var_244_24)

				if var_244_26 > 0 and var_244_20 < var_244_26 then
					arg_241_1.talkMaxDuration = var_244_26

					if var_244_26 + var_244_19 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_26 + var_244_19
					end
				end

				arg_241_1.text_.text = var_244_23
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282060", "story_v_out_317282.awb") ~= 0 then
					local var_244_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282060", "story_v_out_317282.awb") / 1000

					if var_244_27 + var_244_19 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_27 + var_244_19
					end

					if var_244_22.prefab_name ~= "" and arg_241_1.actors_[var_244_22.prefab_name] ~= nil then
						local var_244_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_22.prefab_name].transform, "story_v_out_317282", "317282060", "story_v_out_317282.awb")

						arg_241_1:RecordAudio("317282060", var_244_28)
						arg_241_1:RecordAudio("317282060", var_244_28)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_317282", "317282060", "story_v_out_317282.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_317282", "317282060", "story_v_out_317282.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_29 = math.max(var_244_20, arg_241_1.talkMaxDuration)

			if var_244_19 <= arg_241_1.time_ and arg_241_1.time_ < var_244_19 + var_244_29 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_19) / var_244_29

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_19 + var_244_29 and arg_241_1.time_ < var_244_19 + var_244_29 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play317282061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 317282061
		arg_245_1.duration_ = 3.4

		local var_245_0 = {
			zh = 1.433,
			ja = 3.4
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
				arg_245_0:Play317282062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["2078ui_story"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos2078ui_story = var_248_0.localPosition
			end

			local var_248_2 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2
				local var_248_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos2078ui_story, var_248_4, var_248_3)

				local var_248_5 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_5.x, var_248_5.y, var_248_5.z)

				local var_248_6 = var_248_0.localEulerAngles

				var_248_6.z = 0
				var_248_6.x = 0
				var_248_0.localEulerAngles = var_248_6
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_248_7 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_7.x, var_248_7.y, var_248_7.z)

				local var_248_8 = var_248_0.localEulerAngles

				var_248_8.z = 0
				var_248_8.x = 0
				var_248_0.localEulerAngles = var_248_8
			end

			local var_248_9 = arg_245_1.actors_["2078ui_story"]
			local var_248_10 = 0

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 and arg_245_1.var_.characterEffect2078ui_story == nil then
				arg_245_1.var_.characterEffect2078ui_story = var_248_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_11 = 0.200000002980232

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_11 then
				local var_248_12 = (arg_245_1.time_ - var_248_10) / var_248_11

				if arg_245_1.var_.characterEffect2078ui_story then
					arg_245_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_10 + var_248_11 and arg_245_1.time_ < var_248_10 + var_248_11 + arg_248_0 and arg_245_1.var_.characterEffect2078ui_story then
				arg_245_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_248_13 = arg_245_1.actors_["2079ui_story"]
			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 and arg_245_1.var_.characterEffect2079ui_story == nil then
				arg_245_1.var_.characterEffect2079ui_story = var_248_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_15 = 0.200000002980232

			if var_248_14 <= arg_245_1.time_ and arg_245_1.time_ < var_248_14 + var_248_15 then
				local var_248_16 = (arg_245_1.time_ - var_248_14) / var_248_15

				if arg_245_1.var_.characterEffect2079ui_story then
					local var_248_17 = Mathf.Lerp(0, 0.5, var_248_16)

					arg_245_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_245_1.var_.characterEffect2079ui_story.fillRatio = var_248_17
				end
			end

			if arg_245_1.time_ >= var_248_14 + var_248_15 and arg_245_1.time_ < var_248_14 + var_248_15 + arg_248_0 and arg_245_1.var_.characterEffect2079ui_story then
				local var_248_18 = 0.5

				arg_245_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_245_1.var_.characterEffect2079ui_story.fillRatio = var_248_18
			end

			local var_248_19 = 0
			local var_248_20 = 0.125

			if var_248_19 < arg_245_1.time_ and arg_245_1.time_ <= var_248_19 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_21 = arg_245_1:FormatText(StoryNameCfg[528].name)

				arg_245_1.leftNameTxt_.text = var_248_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_22 = arg_245_1:GetWordFromCfg(317282061)
				local var_248_23 = arg_245_1:FormatText(var_248_22.content)

				arg_245_1.text_.text = var_248_23

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_24 = 5
				local var_248_25 = utf8.len(var_248_23)
				local var_248_26 = var_248_24 <= 0 and var_248_20 or var_248_20 * (var_248_25 / var_248_24)

				if var_248_26 > 0 and var_248_20 < var_248_26 then
					arg_245_1.talkMaxDuration = var_248_26

					if var_248_26 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_26 + var_248_19
					end
				end

				arg_245_1.text_.text = var_248_23
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282061", "story_v_out_317282.awb") ~= 0 then
					local var_248_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282061", "story_v_out_317282.awb") / 1000

					if var_248_27 + var_248_19 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_27 + var_248_19
					end

					if var_248_22.prefab_name ~= "" and arg_245_1.actors_[var_248_22.prefab_name] ~= nil then
						local var_248_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_22.prefab_name].transform, "story_v_out_317282", "317282061", "story_v_out_317282.awb")

						arg_245_1:RecordAudio("317282061", var_248_28)
						arg_245_1:RecordAudio("317282061", var_248_28)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_317282", "317282061", "story_v_out_317282.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_317282", "317282061", "story_v_out_317282.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_29 = math.max(var_248_20, arg_245_1.talkMaxDuration)

			if var_248_19 <= arg_245_1.time_ and arg_245_1.time_ < var_248_19 + var_248_29 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_19) / var_248_29

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_19 + var_248_29 and arg_245_1.time_ < var_248_19 + var_248_29 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play317282062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 317282062
		arg_249_1.duration_ = 3.7

		local var_249_0 = {
			zh = 3.7,
			ja = 3.666
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
				arg_249_0:Play317282063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["2079ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos2079ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0.7, -1.28, -5.6)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos2079ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["2079ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect2079ui_story == nil then
				arg_249_1.var_.characterEffect2079ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect2079ui_story then
					arg_249_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect2079ui_story then
				arg_249_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_252_13 = arg_249_1.actors_["2078ui_story"]
			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 and arg_249_1.var_.characterEffect2078ui_story == nil then
				arg_249_1.var_.characterEffect2078ui_story = var_252_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_15 = 0.200000002980232

			if var_252_14 <= arg_249_1.time_ and arg_249_1.time_ < var_252_14 + var_252_15 then
				local var_252_16 = (arg_249_1.time_ - var_252_14) / var_252_15

				if arg_249_1.var_.characterEffect2078ui_story then
					local var_252_17 = Mathf.Lerp(0, 0.5, var_252_16)

					arg_249_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_249_1.var_.characterEffect2078ui_story.fillRatio = var_252_17
				end
			end

			if arg_249_1.time_ >= var_252_14 + var_252_15 and arg_249_1.time_ < var_252_14 + var_252_15 + arg_252_0 and arg_249_1.var_.characterEffect2078ui_story then
				local var_252_18 = 0.5

				arg_249_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_249_1.var_.characterEffect2078ui_story.fillRatio = var_252_18
			end

			local var_252_19 = 0
			local var_252_20 = 0.4

			if var_252_19 < arg_249_1.time_ and arg_249_1.time_ <= var_252_19 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_21 = arg_249_1:FormatText(StoryNameCfg[571].name)

				arg_249_1.leftNameTxt_.text = var_252_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_22 = arg_249_1:GetWordFromCfg(317282062)
				local var_252_23 = arg_249_1:FormatText(var_252_22.content)

				arg_249_1.text_.text = var_252_23

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_24 = 16
				local var_252_25 = utf8.len(var_252_23)
				local var_252_26 = var_252_24 <= 0 and var_252_20 or var_252_20 * (var_252_25 / var_252_24)

				if var_252_26 > 0 and var_252_20 < var_252_26 then
					arg_249_1.talkMaxDuration = var_252_26

					if var_252_26 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_26 + var_252_19
					end
				end

				arg_249_1.text_.text = var_252_23
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282062", "story_v_out_317282.awb") ~= 0 then
					local var_252_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282062", "story_v_out_317282.awb") / 1000

					if var_252_27 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_27 + var_252_19
					end

					if var_252_22.prefab_name ~= "" and arg_249_1.actors_[var_252_22.prefab_name] ~= nil then
						local var_252_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_22.prefab_name].transform, "story_v_out_317282", "317282062", "story_v_out_317282.awb")

						arg_249_1:RecordAudio("317282062", var_252_28)
						arg_249_1:RecordAudio("317282062", var_252_28)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_317282", "317282062", "story_v_out_317282.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_317282", "317282062", "story_v_out_317282.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_29 = math.max(var_252_20, arg_249_1.talkMaxDuration)

			if var_252_19 <= arg_249_1.time_ and arg_249_1.time_ < var_252_19 + var_252_29 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_19) / var_252_29

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_19 + var_252_29 and arg_249_1.time_ < var_252_19 + var_252_29 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play317282063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 317282063
		arg_253_1.duration_ = 6.033

		local var_253_0 = {
			zh = 6.033,
			ja = 5.566
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
				arg_253_0:Play317282064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["2078ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos2078ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos2078ui_story, var_256_4, var_256_3)

				local var_256_5 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_5.x, var_256_5.y, var_256_5.z)

				local var_256_6 = var_256_0.localEulerAngles

				var_256_6.z = 0
				var_256_6.x = 0
				var_256_0.localEulerAngles = var_256_6
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_256_7 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_7.x, var_256_7.y, var_256_7.z)

				local var_256_8 = var_256_0.localEulerAngles

				var_256_8.z = 0
				var_256_8.x = 0
				var_256_0.localEulerAngles = var_256_8
			end

			local var_256_9 = arg_253_1.actors_["2078ui_story"]
			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 and arg_253_1.var_.characterEffect2078ui_story == nil then
				arg_253_1.var_.characterEffect2078ui_story = var_256_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_11 = 0.200000002980232

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 then
				local var_256_12 = (arg_253_1.time_ - var_256_10) / var_256_11

				if arg_253_1.var_.characterEffect2078ui_story then
					arg_253_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 and arg_253_1.var_.characterEffect2078ui_story then
				arg_253_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_256_13 = arg_253_1.actors_["2079ui_story"]
			local var_256_14 = 0

			if var_256_14 < arg_253_1.time_ and arg_253_1.time_ <= var_256_14 + arg_256_0 and arg_253_1.var_.characterEffect2079ui_story == nil then
				arg_253_1.var_.characterEffect2079ui_story = var_256_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_15 = 0.200000002980232

			if var_256_14 <= arg_253_1.time_ and arg_253_1.time_ < var_256_14 + var_256_15 then
				local var_256_16 = (arg_253_1.time_ - var_256_14) / var_256_15

				if arg_253_1.var_.characterEffect2079ui_story then
					local var_256_17 = Mathf.Lerp(0, 0.5, var_256_16)

					arg_253_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_253_1.var_.characterEffect2079ui_story.fillRatio = var_256_17
				end
			end

			if arg_253_1.time_ >= var_256_14 + var_256_15 and arg_253_1.time_ < var_256_14 + var_256_15 + arg_256_0 and arg_253_1.var_.characterEffect2079ui_story then
				local var_256_18 = 0.5

				arg_253_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_253_1.var_.characterEffect2079ui_story.fillRatio = var_256_18
			end

			local var_256_19 = 0
			local var_256_20 = 0.7

			if var_256_19 < arg_253_1.time_ and arg_253_1.time_ <= var_256_19 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_21 = arg_253_1:FormatText(StoryNameCfg[528].name)

				arg_253_1.leftNameTxt_.text = var_256_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_22 = arg_253_1:GetWordFromCfg(317282063)
				local var_256_23 = arg_253_1:FormatText(var_256_22.content)

				arg_253_1.text_.text = var_256_23

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_24 = 28
				local var_256_25 = utf8.len(var_256_23)
				local var_256_26 = var_256_24 <= 0 and var_256_20 or var_256_20 * (var_256_25 / var_256_24)

				if var_256_26 > 0 and var_256_20 < var_256_26 then
					arg_253_1.talkMaxDuration = var_256_26

					if var_256_26 + var_256_19 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_26 + var_256_19
					end
				end

				arg_253_1.text_.text = var_256_23
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282063", "story_v_out_317282.awb") ~= 0 then
					local var_256_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282063", "story_v_out_317282.awb") / 1000

					if var_256_27 + var_256_19 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_27 + var_256_19
					end

					if var_256_22.prefab_name ~= "" and arg_253_1.actors_[var_256_22.prefab_name] ~= nil then
						local var_256_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_22.prefab_name].transform, "story_v_out_317282", "317282063", "story_v_out_317282.awb")

						arg_253_1:RecordAudio("317282063", var_256_28)
						arg_253_1:RecordAudio("317282063", var_256_28)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_317282", "317282063", "story_v_out_317282.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_317282", "317282063", "story_v_out_317282.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_29 = math.max(var_256_20, arg_253_1.talkMaxDuration)

			if var_256_19 <= arg_253_1.time_ and arg_253_1.time_ < var_256_19 + var_256_29 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_19) / var_256_29

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_19 + var_256_29 and arg_253_1.time_ < var_256_19 + var_256_29 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play317282064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 317282064
		arg_257_1.duration_ = 14.033

		local var_257_0 = {
			zh = 14.033,
			ja = 11.4
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
				arg_257_0:Play317282065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 1.7

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[528].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(317282064)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 69
				local var_260_6 = utf8.len(var_260_4)
				local var_260_7 = var_260_5 <= 0 and var_260_1 or var_260_1 * (var_260_6 / var_260_5)

				if var_260_7 > 0 and var_260_1 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_4
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282064", "story_v_out_317282.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282064", "story_v_out_317282.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_317282", "317282064", "story_v_out_317282.awb")

						arg_257_1:RecordAudio("317282064", var_260_9)
						arg_257_1:RecordAudio("317282064", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_317282", "317282064", "story_v_out_317282.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_317282", "317282064", "story_v_out_317282.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_10 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_10 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_10

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_10 and arg_257_1.time_ < var_260_0 + var_260_10 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play317282065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 317282065
		arg_261_1.duration_ = 2.433

		local var_261_0 = {
			zh = 2,
			ja = 2.433
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
				arg_261_0:Play317282066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["2079ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos2079ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0.7, -1.28, -5.6)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos2079ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = arg_261_1.actors_["2079ui_story"]
			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 and arg_261_1.var_.characterEffect2079ui_story == nil then
				arg_261_1.var_.characterEffect2079ui_story = var_264_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_11 = 0.200000002980232

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_11 then
				local var_264_12 = (arg_261_1.time_ - var_264_10) / var_264_11

				if arg_261_1.var_.characterEffect2079ui_story then
					arg_261_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_10 + var_264_11 and arg_261_1.time_ < var_264_10 + var_264_11 + arg_264_0 and arg_261_1.var_.characterEffect2079ui_story then
				arg_261_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_264_13 = arg_261_1.actors_["2078ui_story"]
			local var_264_14 = 0

			if var_264_14 < arg_261_1.time_ and arg_261_1.time_ <= var_264_14 + arg_264_0 and arg_261_1.var_.characterEffect2078ui_story == nil then
				arg_261_1.var_.characterEffect2078ui_story = var_264_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_15 = 0.200000002980232

			if var_264_14 <= arg_261_1.time_ and arg_261_1.time_ < var_264_14 + var_264_15 then
				local var_264_16 = (arg_261_1.time_ - var_264_14) / var_264_15

				if arg_261_1.var_.characterEffect2078ui_story then
					local var_264_17 = Mathf.Lerp(0, 0.5, var_264_16)

					arg_261_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_261_1.var_.characterEffect2078ui_story.fillRatio = var_264_17
				end
			end

			if arg_261_1.time_ >= var_264_14 + var_264_15 and arg_261_1.time_ < var_264_14 + var_264_15 + arg_264_0 and arg_261_1.var_.characterEffect2078ui_story then
				local var_264_18 = 0.5

				arg_261_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_261_1.var_.characterEffect2078ui_story.fillRatio = var_264_18
			end

			local var_264_19 = 0
			local var_264_20 = 0.25

			if var_264_19 < arg_261_1.time_ and arg_261_1.time_ <= var_264_19 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_21 = arg_261_1:FormatText(StoryNameCfg[571].name)

				arg_261_1.leftNameTxt_.text = var_264_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_22 = arg_261_1:GetWordFromCfg(317282065)
				local var_264_23 = arg_261_1:FormatText(var_264_22.content)

				arg_261_1.text_.text = var_264_23

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_24 = 10
				local var_264_25 = utf8.len(var_264_23)
				local var_264_26 = var_264_24 <= 0 and var_264_20 or var_264_20 * (var_264_25 / var_264_24)

				if var_264_26 > 0 and var_264_20 < var_264_26 then
					arg_261_1.talkMaxDuration = var_264_26

					if var_264_26 + var_264_19 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_26 + var_264_19
					end
				end

				arg_261_1.text_.text = var_264_23
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282065", "story_v_out_317282.awb") ~= 0 then
					local var_264_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282065", "story_v_out_317282.awb") / 1000

					if var_264_27 + var_264_19 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_27 + var_264_19
					end

					if var_264_22.prefab_name ~= "" and arg_261_1.actors_[var_264_22.prefab_name] ~= nil then
						local var_264_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_22.prefab_name].transform, "story_v_out_317282", "317282065", "story_v_out_317282.awb")

						arg_261_1:RecordAudio("317282065", var_264_28)
						arg_261_1:RecordAudio("317282065", var_264_28)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_317282", "317282065", "story_v_out_317282.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_317282", "317282065", "story_v_out_317282.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_29 = math.max(var_264_20, arg_261_1.talkMaxDuration)

			if var_264_19 <= arg_261_1.time_ and arg_261_1.time_ < var_264_19 + var_264_29 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_19) / var_264_29

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_19 + var_264_29 and arg_261_1.time_ < var_264_19 + var_264_29 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play317282066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 317282066
		arg_265_1.duration_ = 6.4

		local var_265_0 = {
			zh = 6.233,
			ja = 6.4
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
				arg_265_0:Play317282067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["2078ui_story"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos2078ui_story = var_268_0.localPosition
			end

			local var_268_2 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2
				local var_268_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos2078ui_story, var_268_4, var_268_3)

				local var_268_5 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_5.x, var_268_5.y, var_268_5.z)

				local var_268_6 = var_268_0.localEulerAngles

				var_268_6.z = 0
				var_268_6.x = 0
				var_268_0.localEulerAngles = var_268_6
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_268_7 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_7.x, var_268_7.y, var_268_7.z)

				local var_268_8 = var_268_0.localEulerAngles

				var_268_8.z = 0
				var_268_8.x = 0
				var_268_0.localEulerAngles = var_268_8
			end

			local var_268_9 = arg_265_1.actors_["2078ui_story"]
			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 and arg_265_1.var_.characterEffect2078ui_story == nil then
				arg_265_1.var_.characterEffect2078ui_story = var_268_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_11 = 0.200000002980232

			if var_268_10 <= arg_265_1.time_ and arg_265_1.time_ < var_268_10 + var_268_11 then
				local var_268_12 = (arg_265_1.time_ - var_268_10) / var_268_11

				if arg_265_1.var_.characterEffect2078ui_story then
					arg_265_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_10 + var_268_11 and arg_265_1.time_ < var_268_10 + var_268_11 + arg_268_0 and arg_265_1.var_.characterEffect2078ui_story then
				arg_265_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_268_13 = arg_265_1.actors_["2079ui_story"]
			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 and arg_265_1.var_.characterEffect2079ui_story == nil then
				arg_265_1.var_.characterEffect2079ui_story = var_268_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_15 = 0.200000002980232

			if var_268_14 <= arg_265_1.time_ and arg_265_1.time_ < var_268_14 + var_268_15 then
				local var_268_16 = (arg_265_1.time_ - var_268_14) / var_268_15

				if arg_265_1.var_.characterEffect2079ui_story then
					local var_268_17 = Mathf.Lerp(0, 0.5, var_268_16)

					arg_265_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_265_1.var_.characterEffect2079ui_story.fillRatio = var_268_17
				end
			end

			if arg_265_1.time_ >= var_268_14 + var_268_15 and arg_265_1.time_ < var_268_14 + var_268_15 + arg_268_0 and arg_265_1.var_.characterEffect2079ui_story then
				local var_268_18 = 0.5

				arg_265_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_265_1.var_.characterEffect2079ui_story.fillRatio = var_268_18
			end

			local var_268_19 = 0
			local var_268_20 = 0.425

			if var_268_19 < arg_265_1.time_ and arg_265_1.time_ <= var_268_19 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_21 = arg_265_1:FormatText(StoryNameCfg[528].name)

				arg_265_1.leftNameTxt_.text = var_268_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_22 = arg_265_1:GetWordFromCfg(317282066)
				local var_268_23 = arg_265_1:FormatText(var_268_22.content)

				arg_265_1.text_.text = var_268_23

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_24 = 17
				local var_268_25 = utf8.len(var_268_23)
				local var_268_26 = var_268_24 <= 0 and var_268_20 or var_268_20 * (var_268_25 / var_268_24)

				if var_268_26 > 0 and var_268_20 < var_268_26 then
					arg_265_1.talkMaxDuration = var_268_26

					if var_268_26 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_26 + var_268_19
					end
				end

				arg_265_1.text_.text = var_268_23
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282066", "story_v_out_317282.awb") ~= 0 then
					local var_268_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282066", "story_v_out_317282.awb") / 1000

					if var_268_27 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_27 + var_268_19
					end

					if var_268_22.prefab_name ~= "" and arg_265_1.actors_[var_268_22.prefab_name] ~= nil then
						local var_268_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_22.prefab_name].transform, "story_v_out_317282", "317282066", "story_v_out_317282.awb")

						arg_265_1:RecordAudio("317282066", var_268_28)
						arg_265_1:RecordAudio("317282066", var_268_28)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_317282", "317282066", "story_v_out_317282.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_317282", "317282066", "story_v_out_317282.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_29 = math.max(var_268_20, arg_265_1.talkMaxDuration)

			if var_268_19 <= arg_265_1.time_ and arg_265_1.time_ < var_268_19 + var_268_29 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_19) / var_268_29

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_19 + var_268_29 and arg_265_1.time_ < var_268_19 + var_268_29 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play317282067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 317282067
		arg_269_1.duration_ = 6.3

		local var_269_0 = {
			zh = 4.866,
			ja = 6.3
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
				arg_269_0:Play317282068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["2079ui_story"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos2079ui_story = var_272_0.localPosition
			end

			local var_272_2 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2
				local var_272_4 = Vector3.New(0.7, -1.28, -5.6)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos2079ui_story, var_272_4, var_272_3)

				local var_272_5 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_5.x, var_272_5.y, var_272_5.z)

				local var_272_6 = var_272_0.localEulerAngles

				var_272_6.z = 0
				var_272_6.x = 0
				var_272_0.localEulerAngles = var_272_6
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_272_7 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_7.x, var_272_7.y, var_272_7.z)

				local var_272_8 = var_272_0.localEulerAngles

				var_272_8.z = 0
				var_272_8.x = 0
				var_272_0.localEulerAngles = var_272_8
			end

			local var_272_9 = arg_269_1.actors_["2079ui_story"]
			local var_272_10 = 0

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 and arg_269_1.var_.characterEffect2079ui_story == nil then
				arg_269_1.var_.characterEffect2079ui_story = var_272_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_11 = 0.200000002980232

			if var_272_10 <= arg_269_1.time_ and arg_269_1.time_ < var_272_10 + var_272_11 then
				local var_272_12 = (arg_269_1.time_ - var_272_10) / var_272_11

				if arg_269_1.var_.characterEffect2079ui_story then
					arg_269_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_10 + var_272_11 and arg_269_1.time_ < var_272_10 + var_272_11 + arg_272_0 and arg_269_1.var_.characterEffect2079ui_story then
				arg_269_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_272_13 = arg_269_1.actors_["2078ui_story"]
			local var_272_14 = 0

			if var_272_14 < arg_269_1.time_ and arg_269_1.time_ <= var_272_14 + arg_272_0 and arg_269_1.var_.characterEffect2078ui_story == nil then
				arg_269_1.var_.characterEffect2078ui_story = var_272_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_15 = 0.200000002980232

			if var_272_14 <= arg_269_1.time_ and arg_269_1.time_ < var_272_14 + var_272_15 then
				local var_272_16 = (arg_269_1.time_ - var_272_14) / var_272_15

				if arg_269_1.var_.characterEffect2078ui_story then
					local var_272_17 = Mathf.Lerp(0, 0.5, var_272_16)

					arg_269_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_269_1.var_.characterEffect2078ui_story.fillRatio = var_272_17
				end
			end

			if arg_269_1.time_ >= var_272_14 + var_272_15 and arg_269_1.time_ < var_272_14 + var_272_15 + arg_272_0 and arg_269_1.var_.characterEffect2078ui_story then
				local var_272_18 = 0.5

				arg_269_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_269_1.var_.characterEffect2078ui_story.fillRatio = var_272_18
			end

			local var_272_19 = 0
			local var_272_20 = 0.725

			if var_272_19 < arg_269_1.time_ and arg_269_1.time_ <= var_272_19 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_21 = arg_269_1:FormatText(StoryNameCfg[571].name)

				arg_269_1.leftNameTxt_.text = var_272_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_22 = arg_269_1:GetWordFromCfg(317282067)
				local var_272_23 = arg_269_1:FormatText(var_272_22.content)

				arg_269_1.text_.text = var_272_23

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_24 = 29
				local var_272_25 = utf8.len(var_272_23)
				local var_272_26 = var_272_24 <= 0 and var_272_20 or var_272_20 * (var_272_25 / var_272_24)

				if var_272_26 > 0 and var_272_20 < var_272_26 then
					arg_269_1.talkMaxDuration = var_272_26

					if var_272_26 + var_272_19 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_26 + var_272_19
					end
				end

				arg_269_1.text_.text = var_272_23
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282067", "story_v_out_317282.awb") ~= 0 then
					local var_272_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282067", "story_v_out_317282.awb") / 1000

					if var_272_27 + var_272_19 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_27 + var_272_19
					end

					if var_272_22.prefab_name ~= "" and arg_269_1.actors_[var_272_22.prefab_name] ~= nil then
						local var_272_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_22.prefab_name].transform, "story_v_out_317282", "317282067", "story_v_out_317282.awb")

						arg_269_1:RecordAudio("317282067", var_272_28)
						arg_269_1:RecordAudio("317282067", var_272_28)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_317282", "317282067", "story_v_out_317282.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_317282", "317282067", "story_v_out_317282.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_29 = math.max(var_272_20, arg_269_1.talkMaxDuration)

			if var_272_19 <= arg_269_1.time_ and arg_269_1.time_ < var_272_19 + var_272_29 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_19) / var_272_29

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_19 + var_272_29 and arg_269_1.time_ < var_272_19 + var_272_29 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play317282068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 317282068
		arg_273_1.duration_ = 13.033

		local var_273_0 = {
			zh = 12.566,
			ja = 13.033
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
				arg_273_0:Play317282069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["2078ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos2078ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos2078ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["2078ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect2078ui_story == nil then
				arg_273_1.var_.characterEffect2078ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.200000002980232

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect2078ui_story then
					arg_273_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect2078ui_story then
				arg_273_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_276_13 = arg_273_1.actors_["2079ui_story"]
			local var_276_14 = 0

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 and arg_273_1.var_.characterEffect2079ui_story == nil then
				arg_273_1.var_.characterEffect2079ui_story = var_276_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_15 = 0.200000002980232

			if var_276_14 <= arg_273_1.time_ and arg_273_1.time_ < var_276_14 + var_276_15 then
				local var_276_16 = (arg_273_1.time_ - var_276_14) / var_276_15

				if arg_273_1.var_.characterEffect2079ui_story then
					local var_276_17 = Mathf.Lerp(0, 0.5, var_276_16)

					arg_273_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_273_1.var_.characterEffect2079ui_story.fillRatio = var_276_17
				end
			end

			if arg_273_1.time_ >= var_276_14 + var_276_15 and arg_273_1.time_ < var_276_14 + var_276_15 + arg_276_0 and arg_273_1.var_.characterEffect2079ui_story then
				local var_276_18 = 0.5

				arg_273_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_273_1.var_.characterEffect2079ui_story.fillRatio = var_276_18
			end

			local var_276_19 = 0
			local var_276_20 = 1.325

			if var_276_19 < arg_273_1.time_ and arg_273_1.time_ <= var_276_19 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_21 = arg_273_1:FormatText(StoryNameCfg[528].name)

				arg_273_1.leftNameTxt_.text = var_276_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_22 = arg_273_1:GetWordFromCfg(317282068)
				local var_276_23 = arg_273_1:FormatText(var_276_22.content)

				arg_273_1.text_.text = var_276_23

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_24 = 53
				local var_276_25 = utf8.len(var_276_23)
				local var_276_26 = var_276_24 <= 0 and var_276_20 or var_276_20 * (var_276_25 / var_276_24)

				if var_276_26 > 0 and var_276_20 < var_276_26 then
					arg_273_1.talkMaxDuration = var_276_26

					if var_276_26 + var_276_19 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_26 + var_276_19
					end
				end

				arg_273_1.text_.text = var_276_23
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282068", "story_v_out_317282.awb") ~= 0 then
					local var_276_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282068", "story_v_out_317282.awb") / 1000

					if var_276_27 + var_276_19 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_27 + var_276_19
					end

					if var_276_22.prefab_name ~= "" and arg_273_1.actors_[var_276_22.prefab_name] ~= nil then
						local var_276_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_22.prefab_name].transform, "story_v_out_317282", "317282068", "story_v_out_317282.awb")

						arg_273_1:RecordAudio("317282068", var_276_28)
						arg_273_1:RecordAudio("317282068", var_276_28)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_317282", "317282068", "story_v_out_317282.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_317282", "317282068", "story_v_out_317282.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_29 = math.max(var_276_20, arg_273_1.talkMaxDuration)

			if var_276_19 <= arg_273_1.time_ and arg_273_1.time_ < var_276_19 + var_276_29 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_19) / var_276_29

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_19 + var_276_29 and arg_273_1.time_ < var_276_19 + var_276_29 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play317282069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 317282069
		arg_277_1.duration_ = 12.766

		local var_277_0 = {
			zh = 12.766,
			ja = 12.433
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
				arg_277_0:Play317282070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 1.625

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[528].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(317282069)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 65
				local var_280_6 = utf8.len(var_280_4)
				local var_280_7 = var_280_5 <= 0 and var_280_1 or var_280_1 * (var_280_6 / var_280_5)

				if var_280_7 > 0 and var_280_1 < var_280_7 then
					arg_277_1.talkMaxDuration = var_280_7

					if var_280_7 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_7 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_4
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282069", "story_v_out_317282.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282069", "story_v_out_317282.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_317282", "317282069", "story_v_out_317282.awb")

						arg_277_1:RecordAudio("317282069", var_280_9)
						arg_277_1:RecordAudio("317282069", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_317282", "317282069", "story_v_out_317282.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_317282", "317282069", "story_v_out_317282.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_10 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_10 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_10

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_10 and arg_277_1.time_ < var_280_0 + var_280_10 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play317282070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 317282070
		arg_281_1.duration_ = 5.8

		local var_281_0 = {
			zh = 5.8,
			ja = 2.966
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
				arg_281_0:Play317282071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["2079ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos2079ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0.7, -1.28, -5.6)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos2079ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["2079ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect2079ui_story == nil then
				arg_281_1.var_.characterEffect2079ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect2079ui_story then
					arg_281_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and arg_281_1.var_.characterEffect2079ui_story then
				arg_281_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_284_13 = arg_281_1.actors_["2078ui_story"]
			local var_284_14 = 0

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 and arg_281_1.var_.characterEffect2078ui_story == nil then
				arg_281_1.var_.characterEffect2078ui_story = var_284_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_15 = 0.200000002980232

			if var_284_14 <= arg_281_1.time_ and arg_281_1.time_ < var_284_14 + var_284_15 then
				local var_284_16 = (arg_281_1.time_ - var_284_14) / var_284_15

				if arg_281_1.var_.characterEffect2078ui_story then
					local var_284_17 = Mathf.Lerp(0, 0.5, var_284_16)

					arg_281_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_281_1.var_.characterEffect2078ui_story.fillRatio = var_284_17
				end
			end

			if arg_281_1.time_ >= var_284_14 + var_284_15 and arg_281_1.time_ < var_284_14 + var_284_15 + arg_284_0 and arg_281_1.var_.characterEffect2078ui_story then
				local var_284_18 = 0.5

				arg_281_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_281_1.var_.characterEffect2078ui_story.fillRatio = var_284_18
			end

			local var_284_19 = 0
			local var_284_20 = 0.7

			if var_284_19 < arg_281_1.time_ and arg_281_1.time_ <= var_284_19 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_21 = arg_281_1:FormatText(StoryNameCfg[571].name)

				arg_281_1.leftNameTxt_.text = var_284_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_22 = arg_281_1:GetWordFromCfg(317282070)
				local var_284_23 = arg_281_1:FormatText(var_284_22.content)

				arg_281_1.text_.text = var_284_23

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_24 = 28
				local var_284_25 = utf8.len(var_284_23)
				local var_284_26 = var_284_24 <= 0 and var_284_20 or var_284_20 * (var_284_25 / var_284_24)

				if var_284_26 > 0 and var_284_20 < var_284_26 then
					arg_281_1.talkMaxDuration = var_284_26

					if var_284_26 + var_284_19 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_26 + var_284_19
					end
				end

				arg_281_1.text_.text = var_284_23
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282070", "story_v_out_317282.awb") ~= 0 then
					local var_284_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282070", "story_v_out_317282.awb") / 1000

					if var_284_27 + var_284_19 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_27 + var_284_19
					end

					if var_284_22.prefab_name ~= "" and arg_281_1.actors_[var_284_22.prefab_name] ~= nil then
						local var_284_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_22.prefab_name].transform, "story_v_out_317282", "317282070", "story_v_out_317282.awb")

						arg_281_1:RecordAudio("317282070", var_284_28)
						arg_281_1:RecordAudio("317282070", var_284_28)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_317282", "317282070", "story_v_out_317282.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_317282", "317282070", "story_v_out_317282.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_29 = math.max(var_284_20, arg_281_1.talkMaxDuration)

			if var_284_19 <= arg_281_1.time_ and arg_281_1.time_ < var_284_19 + var_284_29 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_19) / var_284_29

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_19 + var_284_29 and arg_281_1.time_ < var_284_19 + var_284_29 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play317282071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 317282071
		arg_285_1.duration_ = 4.366

		local var_285_0 = {
			zh = 4.233,
			ja = 4.366
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
				arg_285_0:Play317282072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.575

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[571].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(317282071)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282071", "story_v_out_317282.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282071", "story_v_out_317282.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_317282", "317282071", "story_v_out_317282.awb")

						arg_285_1:RecordAudio("317282071", var_288_9)
						arg_285_1:RecordAudio("317282071", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_317282", "317282071", "story_v_out_317282.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_317282", "317282071", "story_v_out_317282.awb")
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
	Play317282072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 317282072
		arg_289_1.duration_ = 2.6

		local var_289_0 = {
			zh = 2.6,
			ja = 1.966
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
				arg_289_0:Play317282073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["2078ui_story"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos2078ui_story = var_292_0.localPosition
			end

			local var_292_2 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2
				local var_292_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos2078ui_story, var_292_4, var_292_3)

				local var_292_5 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_5.x, var_292_5.y, var_292_5.z)

				local var_292_6 = var_292_0.localEulerAngles

				var_292_6.z = 0
				var_292_6.x = 0
				var_292_0.localEulerAngles = var_292_6
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_292_7 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_7.x, var_292_7.y, var_292_7.z)

				local var_292_8 = var_292_0.localEulerAngles

				var_292_8.z = 0
				var_292_8.x = 0
				var_292_0.localEulerAngles = var_292_8
			end

			local var_292_9 = arg_289_1.actors_["2079ui_story"]
			local var_292_10 = 0

			if var_292_10 < arg_289_1.time_ and arg_289_1.time_ <= var_292_10 + arg_292_0 and arg_289_1.var_.characterEffect2079ui_story == nil then
				arg_289_1.var_.characterEffect2079ui_story = var_292_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_11 = 0.200000002980232

			if var_292_10 <= arg_289_1.time_ and arg_289_1.time_ < var_292_10 + var_292_11 then
				local var_292_12 = (arg_289_1.time_ - var_292_10) / var_292_11

				if arg_289_1.var_.characterEffect2079ui_story then
					local var_292_13 = Mathf.Lerp(0, 0.5, var_292_12)

					arg_289_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_289_1.var_.characterEffect2079ui_story.fillRatio = var_292_13
				end
			end

			if arg_289_1.time_ >= var_292_10 + var_292_11 and arg_289_1.time_ < var_292_10 + var_292_11 + arg_292_0 and arg_289_1.var_.characterEffect2079ui_story then
				local var_292_14 = 0.5

				arg_289_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_289_1.var_.characterEffect2079ui_story.fillRatio = var_292_14
			end

			local var_292_15 = arg_289_1.actors_["2078ui_story"]
			local var_292_16 = 0

			if var_292_16 < arg_289_1.time_ and arg_289_1.time_ <= var_292_16 + arg_292_0 and arg_289_1.var_.characterEffect2078ui_story == nil then
				arg_289_1.var_.characterEffect2078ui_story = var_292_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_17 = 0.200000002980232

			if var_292_16 <= arg_289_1.time_ and arg_289_1.time_ < var_292_16 + var_292_17 then
				local var_292_18 = (arg_289_1.time_ - var_292_16) / var_292_17

				if arg_289_1.var_.characterEffect2078ui_story then
					arg_289_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_16 + var_292_17 and arg_289_1.time_ < var_292_16 + var_292_17 + arg_292_0 and arg_289_1.var_.characterEffect2078ui_story then
				arg_289_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_292_19 = 0
			local var_292_20 = 0.2

			if var_292_19 < arg_289_1.time_ and arg_289_1.time_ <= var_292_19 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_21 = arg_289_1:FormatText(StoryNameCfg[528].name)

				arg_289_1.leftNameTxt_.text = var_292_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_22 = arg_289_1:GetWordFromCfg(317282072)
				local var_292_23 = arg_289_1:FormatText(var_292_22.content)

				arg_289_1.text_.text = var_292_23

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_24 = 8
				local var_292_25 = utf8.len(var_292_23)
				local var_292_26 = var_292_24 <= 0 and var_292_20 or var_292_20 * (var_292_25 / var_292_24)

				if var_292_26 > 0 and var_292_20 < var_292_26 then
					arg_289_1.talkMaxDuration = var_292_26

					if var_292_26 + var_292_19 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_26 + var_292_19
					end
				end

				arg_289_1.text_.text = var_292_23
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282072", "story_v_out_317282.awb") ~= 0 then
					local var_292_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282072", "story_v_out_317282.awb") / 1000

					if var_292_27 + var_292_19 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_27 + var_292_19
					end

					if var_292_22.prefab_name ~= "" and arg_289_1.actors_[var_292_22.prefab_name] ~= nil then
						local var_292_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_22.prefab_name].transform, "story_v_out_317282", "317282072", "story_v_out_317282.awb")

						arg_289_1:RecordAudio("317282072", var_292_28)
						arg_289_1:RecordAudio("317282072", var_292_28)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_317282", "317282072", "story_v_out_317282.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_317282", "317282072", "story_v_out_317282.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_29 = math.max(var_292_20, arg_289_1.talkMaxDuration)

			if var_292_19 <= arg_289_1.time_ and arg_289_1.time_ < var_292_19 + var_292_29 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_19) / var_292_29

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_19 + var_292_29 and arg_289_1.time_ < var_292_19 + var_292_29 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play317282073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 317282073
		arg_293_1.duration_ = 13.466

		local var_293_0 = {
			zh = 10.6,
			ja = 13.466
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
				arg_293_0:Play317282074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["2079ui_story"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.characterEffect2079ui_story == nil then
				arg_293_1.var_.characterEffect2079ui_story = var_296_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_2 = 0.200000002980232

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.characterEffect2079ui_story then
					arg_293_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.characterEffect2079ui_story then
				arg_293_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_296_4 = arg_293_1.actors_["2078ui_story"]
			local var_296_5 = 0

			if var_296_5 < arg_293_1.time_ and arg_293_1.time_ <= var_296_5 + arg_296_0 and arg_293_1.var_.characterEffect2078ui_story == nil then
				arg_293_1.var_.characterEffect2078ui_story = var_296_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_6 = 0.200000002980232

			if var_296_5 <= arg_293_1.time_ and arg_293_1.time_ < var_296_5 + var_296_6 then
				local var_296_7 = (arg_293_1.time_ - var_296_5) / var_296_6

				if arg_293_1.var_.characterEffect2078ui_story then
					local var_296_8 = Mathf.Lerp(0, 0.5, var_296_7)

					arg_293_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_293_1.var_.characterEffect2078ui_story.fillRatio = var_296_8
				end
			end

			if arg_293_1.time_ >= var_296_5 + var_296_6 and arg_293_1.time_ < var_296_5 + var_296_6 + arg_296_0 and arg_293_1.var_.characterEffect2078ui_story then
				local var_296_9 = 0.5

				arg_293_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_293_1.var_.characterEffect2078ui_story.fillRatio = var_296_9
			end

			local var_296_10 = 0
			local var_296_11 = 1.45

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_12 = arg_293_1:FormatText(StoryNameCfg[571].name)

				arg_293_1.leftNameTxt_.text = var_296_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_13 = arg_293_1:GetWordFromCfg(317282073)
				local var_296_14 = arg_293_1:FormatText(var_296_13.content)

				arg_293_1.text_.text = var_296_14

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_15 = 58
				local var_296_16 = utf8.len(var_296_14)
				local var_296_17 = var_296_15 <= 0 and var_296_11 or var_296_11 * (var_296_16 / var_296_15)

				if var_296_17 > 0 and var_296_11 < var_296_17 then
					arg_293_1.talkMaxDuration = var_296_17

					if var_296_17 + var_296_10 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_17 + var_296_10
					end
				end

				arg_293_1.text_.text = var_296_14
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282073", "story_v_out_317282.awb") ~= 0 then
					local var_296_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282073", "story_v_out_317282.awb") / 1000

					if var_296_18 + var_296_10 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_18 + var_296_10
					end

					if var_296_13.prefab_name ~= "" and arg_293_1.actors_[var_296_13.prefab_name] ~= nil then
						local var_296_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_13.prefab_name].transform, "story_v_out_317282", "317282073", "story_v_out_317282.awb")

						arg_293_1:RecordAudio("317282073", var_296_19)
						arg_293_1:RecordAudio("317282073", var_296_19)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_317282", "317282073", "story_v_out_317282.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_317282", "317282073", "story_v_out_317282.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_20 = math.max(var_296_11, arg_293_1.talkMaxDuration)

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_20 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_10) / var_296_20

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_10 + var_296_20 and arg_293_1.time_ < var_296_10 + var_296_20 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play317282074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 317282074
		arg_297_1.duration_ = 10.833

		local var_297_0 = {
			zh = 9.366,
			ja = 10.833
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
				arg_297_0:Play317282075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 1.2

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[571].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(317282074)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 48
				local var_300_6 = utf8.len(var_300_4)
				local var_300_7 = var_300_5 <= 0 and var_300_1 or var_300_1 * (var_300_6 / var_300_5)

				if var_300_7 > 0 and var_300_1 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_4
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282074", "story_v_out_317282.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282074", "story_v_out_317282.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_317282", "317282074", "story_v_out_317282.awb")

						arg_297_1:RecordAudio("317282074", var_300_9)
						arg_297_1:RecordAudio("317282074", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_317282", "317282074", "story_v_out_317282.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_317282", "317282074", "story_v_out_317282.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_10 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_10 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_10

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_10 and arg_297_1.time_ < var_300_0 + var_300_10 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play317282075 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 317282075
		arg_301_1.duration_ = 4.433

		local var_301_0 = {
			zh = 3.6,
			ja = 4.433
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
				arg_301_0:Play317282076(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.45

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[571].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(317282075)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282075", "story_v_out_317282.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282075", "story_v_out_317282.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_317282", "317282075", "story_v_out_317282.awb")

						arg_301_1:RecordAudio("317282075", var_304_9)
						arg_301_1:RecordAudio("317282075", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_317282", "317282075", "story_v_out_317282.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_317282", "317282075", "story_v_out_317282.awb")
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
	Play317282076 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 317282076
		arg_305_1.duration_ = 8.2

		local var_305_0 = {
			zh = 8.2,
			ja = 5.6
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
				arg_305_0:Play317282077(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["2079ui_story"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.characterEffect2079ui_story == nil then
				arg_305_1.var_.characterEffect2079ui_story = var_308_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_2 = 0.200000002980232

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.characterEffect2079ui_story then
					local var_308_4 = Mathf.Lerp(0, 0.5, var_308_3)

					arg_305_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_305_1.var_.characterEffect2079ui_story.fillRatio = var_308_4
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.characterEffect2079ui_story then
				local var_308_5 = 0.5

				arg_305_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_305_1.var_.characterEffect2079ui_story.fillRatio = var_308_5
			end

			local var_308_6 = arg_305_1.actors_["2078ui_story"]
			local var_308_7 = 0

			if var_308_7 < arg_305_1.time_ and arg_305_1.time_ <= var_308_7 + arg_308_0 and arg_305_1.var_.characterEffect2078ui_story == nil then
				arg_305_1.var_.characterEffect2078ui_story = var_308_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_8 = 0.200000002980232

			if var_308_7 <= arg_305_1.time_ and arg_305_1.time_ < var_308_7 + var_308_8 then
				local var_308_9 = (arg_305_1.time_ - var_308_7) / var_308_8

				if arg_305_1.var_.characterEffect2078ui_story then
					arg_305_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_7 + var_308_8 and arg_305_1.time_ < var_308_7 + var_308_8 + arg_308_0 and arg_305_1.var_.characterEffect2078ui_story then
				arg_305_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_308_10 = 0
			local var_308_11 = 1.125

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_12 = arg_305_1:FormatText(StoryNameCfg[528].name)

				arg_305_1.leftNameTxt_.text = var_308_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_13 = arg_305_1:GetWordFromCfg(317282076)
				local var_308_14 = arg_305_1:FormatText(var_308_13.content)

				arg_305_1.text_.text = var_308_14

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_15 = 45
				local var_308_16 = utf8.len(var_308_14)
				local var_308_17 = var_308_15 <= 0 and var_308_11 or var_308_11 * (var_308_16 / var_308_15)

				if var_308_17 > 0 and var_308_11 < var_308_17 then
					arg_305_1.talkMaxDuration = var_308_17

					if var_308_17 + var_308_10 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_17 + var_308_10
					end
				end

				arg_305_1.text_.text = var_308_14
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282076", "story_v_out_317282.awb") ~= 0 then
					local var_308_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282076", "story_v_out_317282.awb") / 1000

					if var_308_18 + var_308_10 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_18 + var_308_10
					end

					if var_308_13.prefab_name ~= "" and arg_305_1.actors_[var_308_13.prefab_name] ~= nil then
						local var_308_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_13.prefab_name].transform, "story_v_out_317282", "317282076", "story_v_out_317282.awb")

						arg_305_1:RecordAudio("317282076", var_308_19)
						arg_305_1:RecordAudio("317282076", var_308_19)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_317282", "317282076", "story_v_out_317282.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_317282", "317282076", "story_v_out_317282.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_20 = math.max(var_308_11, arg_305_1.talkMaxDuration)

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_20 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_10) / var_308_20

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_10 + var_308_20 and arg_305_1.time_ < var_308_10 + var_308_20 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play317282077 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 317282077
		arg_309_1.duration_ = 7.966

		local var_309_0 = {
			zh = 3,
			ja = 7.966
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
				arg_309_0:Play317282078(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["2079ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos2079ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0.7, -1.28, -5.6)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos2079ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["2079ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect2079ui_story == nil then
				arg_309_1.var_.characterEffect2079ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect2079ui_story then
					arg_309_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect2079ui_story then
				arg_309_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_312_13 = arg_309_1.actors_["2078ui_story"]
			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 and arg_309_1.var_.characterEffect2078ui_story == nil then
				arg_309_1.var_.characterEffect2078ui_story = var_312_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_15 = 0.200000002980232

			if var_312_14 <= arg_309_1.time_ and arg_309_1.time_ < var_312_14 + var_312_15 then
				local var_312_16 = (arg_309_1.time_ - var_312_14) / var_312_15

				if arg_309_1.var_.characterEffect2078ui_story then
					local var_312_17 = Mathf.Lerp(0, 0.5, var_312_16)

					arg_309_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_309_1.var_.characterEffect2078ui_story.fillRatio = var_312_17
				end
			end

			if arg_309_1.time_ >= var_312_14 + var_312_15 and arg_309_1.time_ < var_312_14 + var_312_15 + arg_312_0 and arg_309_1.var_.characterEffect2078ui_story then
				local var_312_18 = 0.5

				arg_309_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_309_1.var_.characterEffect2078ui_story.fillRatio = var_312_18
			end

			local var_312_19 = 0
			local var_312_20 = 0.3

			if var_312_19 < arg_309_1.time_ and arg_309_1.time_ <= var_312_19 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_21 = arg_309_1:FormatText(StoryNameCfg[571].name)

				arg_309_1.leftNameTxt_.text = var_312_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_22 = arg_309_1:GetWordFromCfg(317282077)
				local var_312_23 = arg_309_1:FormatText(var_312_22.content)

				arg_309_1.text_.text = var_312_23

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_24 = 12
				local var_312_25 = utf8.len(var_312_23)
				local var_312_26 = var_312_24 <= 0 and var_312_20 or var_312_20 * (var_312_25 / var_312_24)

				if var_312_26 > 0 and var_312_20 < var_312_26 then
					arg_309_1.talkMaxDuration = var_312_26

					if var_312_26 + var_312_19 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_26 + var_312_19
					end
				end

				arg_309_1.text_.text = var_312_23
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282077", "story_v_out_317282.awb") ~= 0 then
					local var_312_27 = manager.audio:GetVoiceLength("story_v_out_317282", "317282077", "story_v_out_317282.awb") / 1000

					if var_312_27 + var_312_19 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_27 + var_312_19
					end

					if var_312_22.prefab_name ~= "" and arg_309_1.actors_[var_312_22.prefab_name] ~= nil then
						local var_312_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_22.prefab_name].transform, "story_v_out_317282", "317282077", "story_v_out_317282.awb")

						arg_309_1:RecordAudio("317282077", var_312_28)
						arg_309_1:RecordAudio("317282077", var_312_28)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_317282", "317282077", "story_v_out_317282.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_317282", "317282077", "story_v_out_317282.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_29 = math.max(var_312_20, arg_309_1.talkMaxDuration)

			if var_312_19 <= arg_309_1.time_ and arg_309_1.time_ < var_312_19 + var_312_29 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_19) / var_312_29

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_19 + var_312_29 and arg_309_1.time_ < var_312_19 + var_312_29 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play317282078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 317282078
		arg_313_1.duration_ = 14.3

		local var_313_0 = {
			zh = 14.3,
			ja = 8.166
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play317282079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["2078ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect2078ui_story == nil then
				arg_313_1.var_.characterEffect2078ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect2078ui_story then
					arg_313_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect2078ui_story then
				arg_313_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_316_4 = arg_313_1.actors_["2079ui_story"]
			local var_316_5 = 0

			if var_316_5 < arg_313_1.time_ and arg_313_1.time_ <= var_316_5 + arg_316_0 and arg_313_1.var_.characterEffect2079ui_story == nil then
				arg_313_1.var_.characterEffect2079ui_story = var_316_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_6 = 0.200000002980232

			if var_316_5 <= arg_313_1.time_ and arg_313_1.time_ < var_316_5 + var_316_6 then
				local var_316_7 = (arg_313_1.time_ - var_316_5) / var_316_6

				if arg_313_1.var_.characterEffect2079ui_story then
					local var_316_8 = Mathf.Lerp(0, 0.5, var_316_7)

					arg_313_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_313_1.var_.characterEffect2079ui_story.fillRatio = var_316_8
				end
			end

			if arg_313_1.time_ >= var_316_5 + var_316_6 and arg_313_1.time_ < var_316_5 + var_316_6 + arg_316_0 and arg_313_1.var_.characterEffect2079ui_story then
				local var_316_9 = 0.5

				arg_313_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_313_1.var_.characterEffect2079ui_story.fillRatio = var_316_9
			end

			local var_316_10 = 0
			local var_316_11 = 1.875

			if var_316_10 < arg_313_1.time_ and arg_313_1.time_ <= var_316_10 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_12 = arg_313_1:FormatText(StoryNameCfg[528].name)

				arg_313_1.leftNameTxt_.text = var_316_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_13 = arg_313_1:GetWordFromCfg(317282078)
				local var_316_14 = arg_313_1:FormatText(var_316_13.content)

				arg_313_1.text_.text = var_316_14

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_15 = 75
				local var_316_16 = utf8.len(var_316_14)
				local var_316_17 = var_316_15 <= 0 and var_316_11 or var_316_11 * (var_316_16 / var_316_15)

				if var_316_17 > 0 and var_316_11 < var_316_17 then
					arg_313_1.talkMaxDuration = var_316_17

					if var_316_17 + var_316_10 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_17 + var_316_10
					end
				end

				arg_313_1.text_.text = var_316_14
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282078", "story_v_out_317282.awb") ~= 0 then
					local var_316_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282078", "story_v_out_317282.awb") / 1000

					if var_316_18 + var_316_10 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_18 + var_316_10
					end

					if var_316_13.prefab_name ~= "" and arg_313_1.actors_[var_316_13.prefab_name] ~= nil then
						local var_316_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_13.prefab_name].transform, "story_v_out_317282", "317282078", "story_v_out_317282.awb")

						arg_313_1:RecordAudio("317282078", var_316_19)
						arg_313_1:RecordAudio("317282078", var_316_19)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_317282", "317282078", "story_v_out_317282.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_317282", "317282078", "story_v_out_317282.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_20 = math.max(var_316_11, arg_313_1.talkMaxDuration)

			if var_316_10 <= arg_313_1.time_ and arg_313_1.time_ < var_316_10 + var_316_20 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_10) / var_316_20

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_10 + var_316_20 and arg_313_1.time_ < var_316_10 + var_316_20 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play317282079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 317282079
		arg_317_1.duration_ = 8.966

		local var_317_0 = {
			zh = 4.466,
			ja = 8.966
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
				arg_317_0:Play317282080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["2079ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect2079ui_story == nil then
				arg_317_1.var_.characterEffect2079ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect2079ui_story then
					arg_317_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect2079ui_story then
				arg_317_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_320_4 = arg_317_1.actors_["2078ui_story"]
			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 and arg_317_1.var_.characterEffect2078ui_story == nil then
				arg_317_1.var_.characterEffect2078ui_story = var_320_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_6 = 0.200000002980232

			if var_320_5 <= arg_317_1.time_ and arg_317_1.time_ < var_320_5 + var_320_6 then
				local var_320_7 = (arg_317_1.time_ - var_320_5) / var_320_6

				if arg_317_1.var_.characterEffect2078ui_story then
					local var_320_8 = Mathf.Lerp(0, 0.5, var_320_7)

					arg_317_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_317_1.var_.characterEffect2078ui_story.fillRatio = var_320_8
				end
			end

			if arg_317_1.time_ >= var_320_5 + var_320_6 and arg_317_1.time_ < var_320_5 + var_320_6 + arg_320_0 and arg_317_1.var_.characterEffect2078ui_story then
				local var_320_9 = 0.5

				arg_317_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_317_1.var_.characterEffect2078ui_story.fillRatio = var_320_9
			end

			local var_320_10 = 0
			local var_320_11 = 0.5

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_12 = arg_317_1:FormatText(StoryNameCfg[571].name)

				arg_317_1.leftNameTxt_.text = var_320_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_13 = arg_317_1:GetWordFromCfg(317282079)
				local var_320_14 = arg_317_1:FormatText(var_320_13.content)

				arg_317_1.text_.text = var_320_14

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_15 = 20
				local var_320_16 = utf8.len(var_320_14)
				local var_320_17 = var_320_15 <= 0 and var_320_11 or var_320_11 * (var_320_16 / var_320_15)

				if var_320_17 > 0 and var_320_11 < var_320_17 then
					arg_317_1.talkMaxDuration = var_320_17

					if var_320_17 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_17 + var_320_10
					end
				end

				arg_317_1.text_.text = var_320_14
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282079", "story_v_out_317282.awb") ~= 0 then
					local var_320_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282079", "story_v_out_317282.awb") / 1000

					if var_320_18 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_18 + var_320_10
					end

					if var_320_13.prefab_name ~= "" and arg_317_1.actors_[var_320_13.prefab_name] ~= nil then
						local var_320_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_13.prefab_name].transform, "story_v_out_317282", "317282079", "story_v_out_317282.awb")

						arg_317_1:RecordAudio("317282079", var_320_19)
						arg_317_1:RecordAudio("317282079", var_320_19)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_317282", "317282079", "story_v_out_317282.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_317282", "317282079", "story_v_out_317282.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_20 = math.max(var_320_11, arg_317_1.talkMaxDuration)

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_20 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_10) / var_320_20

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_10 + var_320_20 and arg_317_1.time_ < var_320_10 + var_320_20 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play317282080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 317282080
		arg_321_1.duration_ = 1.6

		local var_321_0 = {
			zh = 1.6,
			ja = 1.433
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play317282081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["2078ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect2078ui_story == nil then
				arg_321_1.var_.characterEffect2078ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.200000002980232

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect2078ui_story then
					arg_321_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect2078ui_story then
				arg_321_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_324_4 = arg_321_1.actors_["2079ui_story"]
			local var_324_5 = 0

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 and arg_321_1.var_.characterEffect2079ui_story == nil then
				arg_321_1.var_.characterEffect2079ui_story = var_324_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_6 = 0.200000002980232

			if var_324_5 <= arg_321_1.time_ and arg_321_1.time_ < var_324_5 + var_324_6 then
				local var_324_7 = (arg_321_1.time_ - var_324_5) / var_324_6

				if arg_321_1.var_.characterEffect2079ui_story then
					local var_324_8 = Mathf.Lerp(0, 0.5, var_324_7)

					arg_321_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_321_1.var_.characterEffect2079ui_story.fillRatio = var_324_8
				end
			end

			if arg_321_1.time_ >= var_324_5 + var_324_6 and arg_321_1.time_ < var_324_5 + var_324_6 + arg_324_0 and arg_321_1.var_.characterEffect2079ui_story then
				local var_324_9 = 0.5

				arg_321_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_321_1.var_.characterEffect2079ui_story.fillRatio = var_324_9
			end

			local var_324_10 = 0
			local var_324_11 = 0.125

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_12 = arg_321_1:FormatText(StoryNameCfg[528].name)

				arg_321_1.leftNameTxt_.text = var_324_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_13 = arg_321_1:GetWordFromCfg(317282080)
				local var_324_14 = arg_321_1:FormatText(var_324_13.content)

				arg_321_1.text_.text = var_324_14

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_15 = 5
				local var_324_16 = utf8.len(var_324_14)
				local var_324_17 = var_324_15 <= 0 and var_324_11 or var_324_11 * (var_324_16 / var_324_15)

				if var_324_17 > 0 and var_324_11 < var_324_17 then
					arg_321_1.talkMaxDuration = var_324_17

					if var_324_17 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_17 + var_324_10
					end
				end

				arg_321_1.text_.text = var_324_14
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282080", "story_v_out_317282.awb") ~= 0 then
					local var_324_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282080", "story_v_out_317282.awb") / 1000

					if var_324_18 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_18 + var_324_10
					end

					if var_324_13.prefab_name ~= "" and arg_321_1.actors_[var_324_13.prefab_name] ~= nil then
						local var_324_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_13.prefab_name].transform, "story_v_out_317282", "317282080", "story_v_out_317282.awb")

						arg_321_1:RecordAudio("317282080", var_324_19)
						arg_321_1:RecordAudio("317282080", var_324_19)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_317282", "317282080", "story_v_out_317282.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_317282", "317282080", "story_v_out_317282.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_20 = math.max(var_324_11, arg_321_1.talkMaxDuration)

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_20 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_10) / var_324_20

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_10 + var_324_20 and arg_321_1.time_ < var_324_10 + var_324_20 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play317282081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 317282081
		arg_325_1.duration_ = 11.9

		local var_325_0 = {
			zh = 11.9,
			ja = 8.5
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
				arg_325_0:Play317282082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["2079ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect2079ui_story == nil then
				arg_325_1.var_.characterEffect2079ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.200000002980232

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect2079ui_story then
					arg_325_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect2079ui_story then
				arg_325_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_328_4 = arg_325_1.actors_["2078ui_story"]
			local var_328_5 = 0

			if var_328_5 < arg_325_1.time_ and arg_325_1.time_ <= var_328_5 + arg_328_0 and arg_325_1.var_.characterEffect2078ui_story == nil then
				arg_325_1.var_.characterEffect2078ui_story = var_328_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_6 = 0.200000002980232

			if var_328_5 <= arg_325_1.time_ and arg_325_1.time_ < var_328_5 + var_328_6 then
				local var_328_7 = (arg_325_1.time_ - var_328_5) / var_328_6

				if arg_325_1.var_.characterEffect2078ui_story then
					local var_328_8 = Mathf.Lerp(0, 0.5, var_328_7)

					arg_325_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_325_1.var_.characterEffect2078ui_story.fillRatio = var_328_8
				end
			end

			if arg_325_1.time_ >= var_328_5 + var_328_6 and arg_325_1.time_ < var_328_5 + var_328_6 + arg_328_0 and arg_325_1.var_.characterEffect2078ui_story then
				local var_328_9 = 0.5

				arg_325_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_325_1.var_.characterEffect2078ui_story.fillRatio = var_328_9
			end

			local var_328_10 = 0
			local var_328_11 = 1.4

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_12 = arg_325_1:FormatText(StoryNameCfg[571].name)

				arg_325_1.leftNameTxt_.text = var_328_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_13 = arg_325_1:GetWordFromCfg(317282081)
				local var_328_14 = arg_325_1:FormatText(var_328_13.content)

				arg_325_1.text_.text = var_328_14

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_15 = 56
				local var_328_16 = utf8.len(var_328_14)
				local var_328_17 = var_328_15 <= 0 and var_328_11 or var_328_11 * (var_328_16 / var_328_15)

				if var_328_17 > 0 and var_328_11 < var_328_17 then
					arg_325_1.talkMaxDuration = var_328_17

					if var_328_17 + var_328_10 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_17 + var_328_10
					end
				end

				arg_325_1.text_.text = var_328_14
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282081", "story_v_out_317282.awb") ~= 0 then
					local var_328_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282081", "story_v_out_317282.awb") / 1000

					if var_328_18 + var_328_10 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_18 + var_328_10
					end

					if var_328_13.prefab_name ~= "" and arg_325_1.actors_[var_328_13.prefab_name] ~= nil then
						local var_328_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_13.prefab_name].transform, "story_v_out_317282", "317282081", "story_v_out_317282.awb")

						arg_325_1:RecordAudio("317282081", var_328_19)
						arg_325_1:RecordAudio("317282081", var_328_19)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_317282", "317282081", "story_v_out_317282.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_317282", "317282081", "story_v_out_317282.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_20 = math.max(var_328_11, arg_325_1.talkMaxDuration)

			if var_328_10 <= arg_325_1.time_ and arg_325_1.time_ < var_328_10 + var_328_20 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_10) / var_328_20

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_10 + var_328_20 and arg_325_1.time_ < var_328_10 + var_328_20 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play317282082 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 317282082
		arg_329_1.duration_ = 14.3

		local var_329_0 = {
			zh = 14.3,
			ja = 12.1
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
				arg_329_0:Play317282083(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 1.775

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_2 = arg_329_1:FormatText(StoryNameCfg[571].name)

				arg_329_1.leftNameTxt_.text = var_332_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_3 = arg_329_1:GetWordFromCfg(317282082)
				local var_332_4 = arg_329_1:FormatText(var_332_3.content)

				arg_329_1.text_.text = var_332_4

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_5 = 71
				local var_332_6 = utf8.len(var_332_4)
				local var_332_7 = var_332_5 <= 0 and var_332_1 or var_332_1 * (var_332_6 / var_332_5)

				if var_332_7 > 0 and var_332_1 < var_332_7 then
					arg_329_1.talkMaxDuration = var_332_7

					if var_332_7 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_7 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_4
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282082", "story_v_out_317282.awb") ~= 0 then
					local var_332_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282082", "story_v_out_317282.awb") / 1000

					if var_332_8 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_8 + var_332_0
					end

					if var_332_3.prefab_name ~= "" and arg_329_1.actors_[var_332_3.prefab_name] ~= nil then
						local var_332_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_3.prefab_name].transform, "story_v_out_317282", "317282082", "story_v_out_317282.awb")

						arg_329_1:RecordAudio("317282082", var_332_9)
						arg_329_1:RecordAudio("317282082", var_332_9)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_317282", "317282082", "story_v_out_317282.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_317282", "317282082", "story_v_out_317282.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_10 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_10 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_10

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_10 and arg_329_1.time_ < var_332_0 + var_332_10 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play317282083 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 317282083
		arg_333_1.duration_ = 8.766

		local var_333_0 = {
			zh = 5.7,
			ja = 8.766
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play317282084(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.8

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_2 = arg_333_1:FormatText(StoryNameCfg[571].name)

				arg_333_1.leftNameTxt_.text = var_336_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_3 = arg_333_1:GetWordFromCfg(317282083)
				local var_336_4 = arg_333_1:FormatText(var_336_3.content)

				arg_333_1.text_.text = var_336_4

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_5 = 32
				local var_336_6 = utf8.len(var_336_4)
				local var_336_7 = var_336_5 <= 0 and var_336_1 or var_336_1 * (var_336_6 / var_336_5)

				if var_336_7 > 0 and var_336_1 < var_336_7 then
					arg_333_1.talkMaxDuration = var_336_7

					if var_336_7 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_7 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_4
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282083", "story_v_out_317282.awb") ~= 0 then
					local var_336_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282083", "story_v_out_317282.awb") / 1000

					if var_336_8 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_8 + var_336_0
					end

					if var_336_3.prefab_name ~= "" and arg_333_1.actors_[var_336_3.prefab_name] ~= nil then
						local var_336_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_3.prefab_name].transform, "story_v_out_317282", "317282083", "story_v_out_317282.awb")

						arg_333_1:RecordAudio("317282083", var_336_9)
						arg_333_1:RecordAudio("317282083", var_336_9)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_317282", "317282083", "story_v_out_317282.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_317282", "317282083", "story_v_out_317282.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_10 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_10 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_10

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_10 and arg_333_1.time_ < var_336_0 + var_336_10 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play317282084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 317282084
		arg_337_1.duration_ = 7.7

		local var_337_0 = {
			zh = 7.7,
			ja = 7.433
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
				arg_337_0:Play317282085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["2079ui_story"]
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 and arg_337_1.var_.characterEffect2079ui_story == nil then
				arg_337_1.var_.characterEffect2079ui_story = var_340_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_2 = 0.200000002980232

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2

				if arg_337_1.var_.characterEffect2079ui_story then
					local var_340_4 = Mathf.Lerp(0, 0.5, var_340_3)

					arg_337_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_337_1.var_.characterEffect2079ui_story.fillRatio = var_340_4
				end
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 and arg_337_1.var_.characterEffect2079ui_story then
				local var_340_5 = 0.5

				arg_337_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_337_1.var_.characterEffect2079ui_story.fillRatio = var_340_5
			end

			local var_340_6 = arg_337_1.actors_["2078ui_story"]
			local var_340_7 = 0

			if var_340_7 < arg_337_1.time_ and arg_337_1.time_ <= var_340_7 + arg_340_0 and arg_337_1.var_.characterEffect2078ui_story == nil then
				arg_337_1.var_.characterEffect2078ui_story = var_340_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_8 = 0.200000002980232

			if var_340_7 <= arg_337_1.time_ and arg_337_1.time_ < var_340_7 + var_340_8 then
				local var_340_9 = (arg_337_1.time_ - var_340_7) / var_340_8

				if arg_337_1.var_.characterEffect2078ui_story then
					arg_337_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_7 + var_340_8 and arg_337_1.time_ < var_340_7 + var_340_8 + arg_340_0 and arg_337_1.var_.characterEffect2078ui_story then
				arg_337_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_340_10 = 0
			local var_340_11 = 0.85

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_12 = arg_337_1:FormatText(StoryNameCfg[528].name)

				arg_337_1.leftNameTxt_.text = var_340_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_13 = arg_337_1:GetWordFromCfg(317282084)
				local var_340_14 = arg_337_1:FormatText(var_340_13.content)

				arg_337_1.text_.text = var_340_14

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_15 = 34
				local var_340_16 = utf8.len(var_340_14)
				local var_340_17 = var_340_15 <= 0 and var_340_11 or var_340_11 * (var_340_16 / var_340_15)

				if var_340_17 > 0 and var_340_11 < var_340_17 then
					arg_337_1.talkMaxDuration = var_340_17

					if var_340_17 + var_340_10 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_17 + var_340_10
					end
				end

				arg_337_1.text_.text = var_340_14
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282084", "story_v_out_317282.awb") ~= 0 then
					local var_340_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282084", "story_v_out_317282.awb") / 1000

					if var_340_18 + var_340_10 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_18 + var_340_10
					end

					if var_340_13.prefab_name ~= "" and arg_337_1.actors_[var_340_13.prefab_name] ~= nil then
						local var_340_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_13.prefab_name].transform, "story_v_out_317282", "317282084", "story_v_out_317282.awb")

						arg_337_1:RecordAudio("317282084", var_340_19)
						arg_337_1:RecordAudio("317282084", var_340_19)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_317282", "317282084", "story_v_out_317282.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_317282", "317282084", "story_v_out_317282.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_20 = math.max(var_340_11, arg_337_1.talkMaxDuration)

			if var_340_10 <= arg_337_1.time_ and arg_337_1.time_ < var_340_10 + var_340_20 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_10) / var_340_20

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_10 + var_340_20 and arg_337_1.time_ < var_340_10 + var_340_20 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play317282085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 317282085
		arg_341_1.duration_ = 12.566

		local var_341_0 = {
			zh = 12.566,
			ja = 9.266
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
				arg_341_0:Play317282086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 1.475

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_2 = arg_341_1:FormatText(StoryNameCfg[528].name)

				arg_341_1.leftNameTxt_.text = var_344_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_3 = arg_341_1:GetWordFromCfg(317282085)
				local var_344_4 = arg_341_1:FormatText(var_344_3.content)

				arg_341_1.text_.text = var_344_4

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_5 = 60
				local var_344_6 = utf8.len(var_344_4)
				local var_344_7 = var_344_5 <= 0 and var_344_1 or var_344_1 * (var_344_6 / var_344_5)

				if var_344_7 > 0 and var_344_1 < var_344_7 then
					arg_341_1.talkMaxDuration = var_344_7

					if var_344_7 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_7 + var_344_0
					end
				end

				arg_341_1.text_.text = var_344_4
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282085", "story_v_out_317282.awb") ~= 0 then
					local var_344_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282085", "story_v_out_317282.awb") / 1000

					if var_344_8 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_8 + var_344_0
					end

					if var_344_3.prefab_name ~= "" and arg_341_1.actors_[var_344_3.prefab_name] ~= nil then
						local var_344_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_3.prefab_name].transform, "story_v_out_317282", "317282085", "story_v_out_317282.awb")

						arg_341_1:RecordAudio("317282085", var_344_9)
						arg_341_1:RecordAudio("317282085", var_344_9)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_317282", "317282085", "story_v_out_317282.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_317282", "317282085", "story_v_out_317282.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_10 = math.max(var_344_1, arg_341_1.talkMaxDuration)

			if var_344_0 <= arg_341_1.time_ and arg_341_1.time_ < var_344_0 + var_344_10 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_0) / var_344_10

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_0 + var_344_10 and arg_341_1.time_ < var_344_0 + var_344_10 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play317282086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 317282086
		arg_345_1.duration_ = 5.833

		local var_345_0 = {
			zh = 3.9,
			ja = 5.833
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
				arg_345_0:Play317282087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["2079ui_story"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and arg_345_1.var_.characterEffect2079ui_story == nil then
				arg_345_1.var_.characterEffect2079ui_story = var_348_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_2 = 0.200000002980232

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.characterEffect2079ui_story then
					arg_345_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and arg_345_1.var_.characterEffect2079ui_story then
				arg_345_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_348_4 = arg_345_1.actors_["2078ui_story"]
			local var_348_5 = 0

			if var_348_5 < arg_345_1.time_ and arg_345_1.time_ <= var_348_5 + arg_348_0 and arg_345_1.var_.characterEffect2078ui_story == nil then
				arg_345_1.var_.characterEffect2078ui_story = var_348_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_6 = 0.200000002980232

			if var_348_5 <= arg_345_1.time_ and arg_345_1.time_ < var_348_5 + var_348_6 then
				local var_348_7 = (arg_345_1.time_ - var_348_5) / var_348_6

				if arg_345_1.var_.characterEffect2078ui_story then
					local var_348_8 = Mathf.Lerp(0, 0.5, var_348_7)

					arg_345_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_345_1.var_.characterEffect2078ui_story.fillRatio = var_348_8
				end
			end

			if arg_345_1.time_ >= var_348_5 + var_348_6 and arg_345_1.time_ < var_348_5 + var_348_6 + arg_348_0 and arg_345_1.var_.characterEffect2078ui_story then
				local var_348_9 = 0.5

				arg_345_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_345_1.var_.characterEffect2078ui_story.fillRatio = var_348_9
			end

			local var_348_10 = 0
			local var_348_11 = 0.375

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_12 = arg_345_1:FormatText(StoryNameCfg[571].name)

				arg_345_1.leftNameTxt_.text = var_348_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_13 = arg_345_1:GetWordFromCfg(317282086)
				local var_348_14 = arg_345_1:FormatText(var_348_13.content)

				arg_345_1.text_.text = var_348_14

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_15 = 15
				local var_348_16 = utf8.len(var_348_14)
				local var_348_17 = var_348_15 <= 0 and var_348_11 or var_348_11 * (var_348_16 / var_348_15)

				if var_348_17 > 0 and var_348_11 < var_348_17 then
					arg_345_1.talkMaxDuration = var_348_17

					if var_348_17 + var_348_10 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_17 + var_348_10
					end
				end

				arg_345_1.text_.text = var_348_14
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282086", "story_v_out_317282.awb") ~= 0 then
					local var_348_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282086", "story_v_out_317282.awb") / 1000

					if var_348_18 + var_348_10 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_18 + var_348_10
					end

					if var_348_13.prefab_name ~= "" and arg_345_1.actors_[var_348_13.prefab_name] ~= nil then
						local var_348_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_13.prefab_name].transform, "story_v_out_317282", "317282086", "story_v_out_317282.awb")

						arg_345_1:RecordAudio("317282086", var_348_19)
						arg_345_1:RecordAudio("317282086", var_348_19)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_317282", "317282086", "story_v_out_317282.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_317282", "317282086", "story_v_out_317282.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_20 = math.max(var_348_11, arg_345_1.talkMaxDuration)

			if var_348_10 <= arg_345_1.time_ and arg_345_1.time_ < var_348_10 + var_348_20 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_10) / var_348_20

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_10 + var_348_20 and arg_345_1.time_ < var_348_10 + var_348_20 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play317282087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 317282087
		arg_349_1.duration_ = 10.533

		local var_349_0 = {
			zh = 10.533,
			ja = 7.633
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
				arg_349_0:Play317282088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 1.25

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[571].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(317282087)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 50
				local var_352_6 = utf8.len(var_352_4)
				local var_352_7 = var_352_5 <= 0 and var_352_1 or var_352_1 * (var_352_6 / var_352_5)

				if var_352_7 > 0 and var_352_1 < var_352_7 then
					arg_349_1.talkMaxDuration = var_352_7

					if var_352_7 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_7 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_4
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282087", "story_v_out_317282.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282087", "story_v_out_317282.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_317282", "317282087", "story_v_out_317282.awb")

						arg_349_1:RecordAudio("317282087", var_352_9)
						arg_349_1:RecordAudio("317282087", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_317282", "317282087", "story_v_out_317282.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_317282", "317282087", "story_v_out_317282.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_10 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_10 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_10

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_10 and arg_349_1.time_ < var_352_0 + var_352_10 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play317282088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 317282088
		arg_353_1.duration_ = 1.633

		local var_353_0 = {
			zh = 1.566,
			ja = 1.633
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
				arg_353_0:Play317282089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["2079ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect2079ui_story == nil then
				arg_353_1.var_.characterEffect2079ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect2079ui_story then
					local var_356_4 = Mathf.Lerp(0, 0.5, var_356_3)

					arg_353_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_353_1.var_.characterEffect2079ui_story.fillRatio = var_356_4
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect2079ui_story then
				local var_356_5 = 0.5

				arg_353_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_353_1.var_.characterEffect2079ui_story.fillRatio = var_356_5
			end

			local var_356_6 = arg_353_1.actors_["2078ui_story"]
			local var_356_7 = 0

			if var_356_7 < arg_353_1.time_ and arg_353_1.time_ <= var_356_7 + arg_356_0 and arg_353_1.var_.characterEffect2078ui_story == nil then
				arg_353_1.var_.characterEffect2078ui_story = var_356_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_8 = 0.200000002980232

			if var_356_7 <= arg_353_1.time_ and arg_353_1.time_ < var_356_7 + var_356_8 then
				local var_356_9 = (arg_353_1.time_ - var_356_7) / var_356_8

				if arg_353_1.var_.characterEffect2078ui_story then
					arg_353_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_7 + var_356_8 and arg_353_1.time_ < var_356_7 + var_356_8 + arg_356_0 and arg_353_1.var_.characterEffect2078ui_story then
				arg_353_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_356_10 = 0
			local var_356_11 = 0.1

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_12 = arg_353_1:FormatText(StoryNameCfg[528].name)

				arg_353_1.leftNameTxt_.text = var_356_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_13 = arg_353_1:GetWordFromCfg(317282088)
				local var_356_14 = arg_353_1:FormatText(var_356_13.content)

				arg_353_1.text_.text = var_356_14

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_15 = 4
				local var_356_16 = utf8.len(var_356_14)
				local var_356_17 = var_356_15 <= 0 and var_356_11 or var_356_11 * (var_356_16 / var_356_15)

				if var_356_17 > 0 and var_356_11 < var_356_17 then
					arg_353_1.talkMaxDuration = var_356_17

					if var_356_17 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_17 + var_356_10
					end
				end

				arg_353_1.text_.text = var_356_14
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282088", "story_v_out_317282.awb") ~= 0 then
					local var_356_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282088", "story_v_out_317282.awb") / 1000

					if var_356_18 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_18 + var_356_10
					end

					if var_356_13.prefab_name ~= "" and arg_353_1.actors_[var_356_13.prefab_name] ~= nil then
						local var_356_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_13.prefab_name].transform, "story_v_out_317282", "317282088", "story_v_out_317282.awb")

						arg_353_1:RecordAudio("317282088", var_356_19)
						arg_353_1:RecordAudio("317282088", var_356_19)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_317282", "317282088", "story_v_out_317282.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_317282", "317282088", "story_v_out_317282.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_20 = math.max(var_356_11, arg_353_1.talkMaxDuration)

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_20 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_10) / var_356_20

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_10 + var_356_20 and arg_353_1.time_ < var_356_10 + var_356_20 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play317282089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 317282089
		arg_357_1.duration_ = 12.233

		local var_357_0 = {
			zh = 11.133,
			ja = 12.233
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
				arg_357_0:Play317282090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["2079ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect2079ui_story == nil then
				arg_357_1.var_.characterEffect2079ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.200000002980232

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect2079ui_story then
					arg_357_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect2079ui_story then
				arg_357_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_360_4 = arg_357_1.actors_["2078ui_story"]
			local var_360_5 = 0

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 and arg_357_1.var_.characterEffect2078ui_story == nil then
				arg_357_1.var_.characterEffect2078ui_story = var_360_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_6 = 0.200000002980232

			if var_360_5 <= arg_357_1.time_ and arg_357_1.time_ < var_360_5 + var_360_6 then
				local var_360_7 = (arg_357_1.time_ - var_360_5) / var_360_6

				if arg_357_1.var_.characterEffect2078ui_story then
					local var_360_8 = Mathf.Lerp(0, 0.5, var_360_7)

					arg_357_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_357_1.var_.characterEffect2078ui_story.fillRatio = var_360_8
				end
			end

			if arg_357_1.time_ >= var_360_5 + var_360_6 and arg_357_1.time_ < var_360_5 + var_360_6 + arg_360_0 and arg_357_1.var_.characterEffect2078ui_story then
				local var_360_9 = 0.5

				arg_357_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_357_1.var_.characterEffect2078ui_story.fillRatio = var_360_9
			end

			local var_360_10 = 0
			local var_360_11 = 1.175

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_12 = arg_357_1:FormatText(StoryNameCfg[571].name)

				arg_357_1.leftNameTxt_.text = var_360_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_13 = arg_357_1:GetWordFromCfg(317282089)
				local var_360_14 = arg_357_1:FormatText(var_360_13.content)

				arg_357_1.text_.text = var_360_14

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_15 = 47
				local var_360_16 = utf8.len(var_360_14)
				local var_360_17 = var_360_15 <= 0 and var_360_11 or var_360_11 * (var_360_16 / var_360_15)

				if var_360_17 > 0 and var_360_11 < var_360_17 then
					arg_357_1.talkMaxDuration = var_360_17

					if var_360_17 + var_360_10 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_17 + var_360_10
					end
				end

				arg_357_1.text_.text = var_360_14
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282089", "story_v_out_317282.awb") ~= 0 then
					local var_360_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282089", "story_v_out_317282.awb") / 1000

					if var_360_18 + var_360_10 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_18 + var_360_10
					end

					if var_360_13.prefab_name ~= "" and arg_357_1.actors_[var_360_13.prefab_name] ~= nil then
						local var_360_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_13.prefab_name].transform, "story_v_out_317282", "317282089", "story_v_out_317282.awb")

						arg_357_1:RecordAudio("317282089", var_360_19)
						arg_357_1:RecordAudio("317282089", var_360_19)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_317282", "317282089", "story_v_out_317282.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_317282", "317282089", "story_v_out_317282.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_20 = math.max(var_360_11, arg_357_1.talkMaxDuration)

			if var_360_10 <= arg_357_1.time_ and arg_357_1.time_ < var_360_10 + var_360_20 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_10) / var_360_20

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_10 + var_360_20 and arg_357_1.time_ < var_360_10 + var_360_20 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play317282090 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 317282090
		arg_361_1.duration_ = 6.433

		local var_361_0 = {
			zh = 6.433,
			ja = 5.033
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
				arg_361_0:Play317282091(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.65

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[571].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(317282090)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282090", "story_v_out_317282.awb") ~= 0 then
					local var_364_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282090", "story_v_out_317282.awb") / 1000

					if var_364_8 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_8 + var_364_0
					end

					if var_364_3.prefab_name ~= "" and arg_361_1.actors_[var_364_3.prefab_name] ~= nil then
						local var_364_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_3.prefab_name].transform, "story_v_out_317282", "317282090", "story_v_out_317282.awb")

						arg_361_1:RecordAudio("317282090", var_364_9)
						arg_361_1:RecordAudio("317282090", var_364_9)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_317282", "317282090", "story_v_out_317282.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_317282", "317282090", "story_v_out_317282.awb")
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
	Play317282091 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 317282091
		arg_365_1.duration_ = 5.666

		local var_365_0 = {
			zh = 5.666,
			ja = 5.633
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
				arg_365_0:Play317282092(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.65

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_2 = arg_365_1:FormatText(StoryNameCfg[571].name)

				arg_365_1.leftNameTxt_.text = var_368_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_3 = arg_365_1:GetWordFromCfg(317282091)
				local var_368_4 = arg_365_1:FormatText(var_368_3.content)

				arg_365_1.text_.text = var_368_4

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_5 = 26
				local var_368_6 = utf8.len(var_368_4)
				local var_368_7 = var_368_5 <= 0 and var_368_1 or var_368_1 * (var_368_6 / var_368_5)

				if var_368_7 > 0 and var_368_1 < var_368_7 then
					arg_365_1.talkMaxDuration = var_368_7

					if var_368_7 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_7 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_4
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282091", "story_v_out_317282.awb") ~= 0 then
					local var_368_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282091", "story_v_out_317282.awb") / 1000

					if var_368_8 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_8 + var_368_0
					end

					if var_368_3.prefab_name ~= "" and arg_365_1.actors_[var_368_3.prefab_name] ~= nil then
						local var_368_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_3.prefab_name].transform, "story_v_out_317282", "317282091", "story_v_out_317282.awb")

						arg_365_1:RecordAudio("317282091", var_368_9)
						arg_365_1:RecordAudio("317282091", var_368_9)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_317282", "317282091", "story_v_out_317282.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_317282", "317282091", "story_v_out_317282.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_10 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_10 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_10

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_10 and arg_365_1.time_ < var_368_0 + var_368_10 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play317282092 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 317282092
		arg_369_1.duration_ = 3.7

		local var_369_0 = {
			zh = 3.7,
			ja = 3.133
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play317282093(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["2079ui_story"]
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 and arg_369_1.var_.characterEffect2079ui_story == nil then
				arg_369_1.var_.characterEffect2079ui_story = var_372_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_2 = 0.200000002980232

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2

				if arg_369_1.var_.characterEffect2079ui_story then
					local var_372_4 = Mathf.Lerp(0, 0.5, var_372_3)

					arg_369_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_369_1.var_.characterEffect2079ui_story.fillRatio = var_372_4
				end
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 and arg_369_1.var_.characterEffect2079ui_story then
				local var_372_5 = 0.5

				arg_369_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_369_1.var_.characterEffect2079ui_story.fillRatio = var_372_5
			end

			local var_372_6 = arg_369_1.actors_["2078ui_story"]
			local var_372_7 = 0

			if var_372_7 < arg_369_1.time_ and arg_369_1.time_ <= var_372_7 + arg_372_0 and arg_369_1.var_.characterEffect2078ui_story == nil then
				arg_369_1.var_.characterEffect2078ui_story = var_372_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_8 = 0.200000002980232

			if var_372_7 <= arg_369_1.time_ and arg_369_1.time_ < var_372_7 + var_372_8 then
				local var_372_9 = (arg_369_1.time_ - var_372_7) / var_372_8

				if arg_369_1.var_.characterEffect2078ui_story then
					arg_369_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_7 + var_372_8 and arg_369_1.time_ < var_372_7 + var_372_8 + arg_372_0 and arg_369_1.var_.characterEffect2078ui_story then
				arg_369_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_372_10 = 0
			local var_372_11 = 0.275

			if var_372_10 < arg_369_1.time_ and arg_369_1.time_ <= var_372_10 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_12 = arg_369_1:FormatText(StoryNameCfg[528].name)

				arg_369_1.leftNameTxt_.text = var_372_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_13 = arg_369_1:GetWordFromCfg(317282092)
				local var_372_14 = arg_369_1:FormatText(var_372_13.content)

				arg_369_1.text_.text = var_372_14

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_15 = 11
				local var_372_16 = utf8.len(var_372_14)
				local var_372_17 = var_372_15 <= 0 and var_372_11 or var_372_11 * (var_372_16 / var_372_15)

				if var_372_17 > 0 and var_372_11 < var_372_17 then
					arg_369_1.talkMaxDuration = var_372_17

					if var_372_17 + var_372_10 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_17 + var_372_10
					end
				end

				arg_369_1.text_.text = var_372_14
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282092", "story_v_out_317282.awb") ~= 0 then
					local var_372_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282092", "story_v_out_317282.awb") / 1000

					if var_372_18 + var_372_10 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_18 + var_372_10
					end

					if var_372_13.prefab_name ~= "" and arg_369_1.actors_[var_372_13.prefab_name] ~= nil then
						local var_372_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_13.prefab_name].transform, "story_v_out_317282", "317282092", "story_v_out_317282.awb")

						arg_369_1:RecordAudio("317282092", var_372_19)
						arg_369_1:RecordAudio("317282092", var_372_19)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_317282", "317282092", "story_v_out_317282.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_317282", "317282092", "story_v_out_317282.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_20 = math.max(var_372_11, arg_369_1.talkMaxDuration)

			if var_372_10 <= arg_369_1.time_ and arg_369_1.time_ < var_372_10 + var_372_20 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_10) / var_372_20

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_10 + var_372_20 and arg_369_1.time_ < var_372_10 + var_372_20 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play317282093 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 317282093
		arg_373_1.duration_ = 4.366

		local var_373_0 = {
			zh = 3.766,
			ja = 4.366
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
				arg_373_0:Play317282094(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["2079ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect2079ui_story == nil then
				arg_373_1.var_.characterEffect2079ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.200000002980232

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect2079ui_story then
					arg_373_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect2079ui_story then
				arg_373_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_376_4 = arg_373_1.actors_["2078ui_story"]
			local var_376_5 = 0

			if var_376_5 < arg_373_1.time_ and arg_373_1.time_ <= var_376_5 + arg_376_0 and arg_373_1.var_.characterEffect2078ui_story == nil then
				arg_373_1.var_.characterEffect2078ui_story = var_376_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_6 = 0.200000002980232

			if var_376_5 <= arg_373_1.time_ and arg_373_1.time_ < var_376_5 + var_376_6 then
				local var_376_7 = (arg_373_1.time_ - var_376_5) / var_376_6

				if arg_373_1.var_.characterEffect2078ui_story then
					local var_376_8 = Mathf.Lerp(0, 0.5, var_376_7)

					arg_373_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_373_1.var_.characterEffect2078ui_story.fillRatio = var_376_8
				end
			end

			if arg_373_1.time_ >= var_376_5 + var_376_6 and arg_373_1.time_ < var_376_5 + var_376_6 + arg_376_0 and arg_373_1.var_.characterEffect2078ui_story then
				local var_376_9 = 0.5

				arg_373_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_373_1.var_.characterEffect2078ui_story.fillRatio = var_376_9
			end

			local var_376_10 = 0
			local var_376_11 = 0.275

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_12 = arg_373_1:FormatText(StoryNameCfg[571].name)

				arg_373_1.leftNameTxt_.text = var_376_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_13 = arg_373_1:GetWordFromCfg(317282093)
				local var_376_14 = arg_373_1:FormatText(var_376_13.content)

				arg_373_1.text_.text = var_376_14

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_15 = 11
				local var_376_16 = utf8.len(var_376_14)
				local var_376_17 = var_376_15 <= 0 and var_376_11 or var_376_11 * (var_376_16 / var_376_15)

				if var_376_17 > 0 and var_376_11 < var_376_17 then
					arg_373_1.talkMaxDuration = var_376_17

					if var_376_17 + var_376_10 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_17 + var_376_10
					end
				end

				arg_373_1.text_.text = var_376_14
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282093", "story_v_out_317282.awb") ~= 0 then
					local var_376_18 = manager.audio:GetVoiceLength("story_v_out_317282", "317282093", "story_v_out_317282.awb") / 1000

					if var_376_18 + var_376_10 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_18 + var_376_10
					end

					if var_376_13.prefab_name ~= "" and arg_373_1.actors_[var_376_13.prefab_name] ~= nil then
						local var_376_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_13.prefab_name].transform, "story_v_out_317282", "317282093", "story_v_out_317282.awb")

						arg_373_1:RecordAudio("317282093", var_376_19)
						arg_373_1:RecordAudio("317282093", var_376_19)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_317282", "317282093", "story_v_out_317282.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_317282", "317282093", "story_v_out_317282.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_20 = math.max(var_376_11, arg_373_1.talkMaxDuration)

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_20 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_10) / var_376_20

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_10 + var_376_20 and arg_373_1.time_ < var_376_10 + var_376_20 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play317282094 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 317282094
		arg_377_1.duration_ = 9

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play317282095(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 2

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				local var_380_1 = manager.ui.mainCamera.transform.localPosition
				local var_380_2 = Vector3.New(0, 0, 10) + Vector3.New(var_380_1.x, var_380_1.y, 0)
				local var_380_3 = arg_377_1.bgs_.K10f

				var_380_3.transform.localPosition = var_380_2
				var_380_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_380_4 = var_380_3:GetComponent("SpriteRenderer")

				if var_380_4 and var_380_4.sprite then
					local var_380_5 = (var_380_3.transform.localPosition - var_380_1).z
					local var_380_6 = manager.ui.mainCameraCom_
					local var_380_7 = 2 * var_380_5 * Mathf.Tan(var_380_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_380_8 = var_380_7 * var_380_6.aspect
					local var_380_9 = var_380_4.sprite.bounds.size.x
					local var_380_10 = var_380_4.sprite.bounds.size.y
					local var_380_11 = var_380_8 / var_380_9
					local var_380_12 = var_380_7 / var_380_10
					local var_380_13 = var_380_12 < var_380_11 and var_380_11 or var_380_12

					var_380_3.transform.localScale = Vector3.New(var_380_13, var_380_13, 0)
				end

				for iter_380_0, iter_380_1 in pairs(arg_377_1.bgs_) do
					if iter_380_0 ~= "K10f" then
						iter_380_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_380_14 = 0

			if var_380_14 < arg_377_1.time_ and arg_377_1.time_ <= var_380_14 + arg_380_0 then
				arg_377_1.mask_.enabled = true
				arg_377_1.mask_.raycastTarget = true

				arg_377_1:SetGaussion(false)
			end

			local var_380_15 = 2

			if var_380_14 <= arg_377_1.time_ and arg_377_1.time_ < var_380_14 + var_380_15 then
				local var_380_16 = (arg_377_1.time_ - var_380_14) / var_380_15
				local var_380_17 = Color.New(0, 0, 0)

				var_380_17.a = Mathf.Lerp(0, 1, var_380_16)
				arg_377_1.mask_.color = var_380_17
			end

			if arg_377_1.time_ >= var_380_14 + var_380_15 and arg_377_1.time_ < var_380_14 + var_380_15 + arg_380_0 then
				local var_380_18 = Color.New(0, 0, 0)

				var_380_18.a = 1
				arg_377_1.mask_.color = var_380_18
			end

			local var_380_19 = 2

			if var_380_19 < arg_377_1.time_ and arg_377_1.time_ <= var_380_19 + arg_380_0 then
				arg_377_1.mask_.enabled = true
				arg_377_1.mask_.raycastTarget = true

				arg_377_1:SetGaussion(false)
			end

			local var_380_20 = 2

			if var_380_19 <= arg_377_1.time_ and arg_377_1.time_ < var_380_19 + var_380_20 then
				local var_380_21 = (arg_377_1.time_ - var_380_19) / var_380_20
				local var_380_22 = Color.New(0, 0, 0)

				var_380_22.a = Mathf.Lerp(1, 0, var_380_21)
				arg_377_1.mask_.color = var_380_22
			end

			if arg_377_1.time_ >= var_380_19 + var_380_20 and arg_377_1.time_ < var_380_19 + var_380_20 + arg_380_0 then
				local var_380_23 = Color.New(0, 0, 0)
				local var_380_24 = 0

				arg_377_1.mask_.enabled = false
				var_380_23.a = var_380_24
				arg_377_1.mask_.color = var_380_23
			end

			local var_380_25 = arg_377_1.actors_["2079ui_story"].transform
			local var_380_26 = 2

			if var_380_26 < arg_377_1.time_ and arg_377_1.time_ <= var_380_26 + arg_380_0 then
				arg_377_1.var_.moveOldPos2079ui_story = var_380_25.localPosition
			end

			local var_380_27 = 0.001

			if var_380_26 <= arg_377_1.time_ and arg_377_1.time_ < var_380_26 + var_380_27 then
				local var_380_28 = (arg_377_1.time_ - var_380_26) / var_380_27
				local var_380_29 = Vector3.New(0, 100, 0)

				var_380_25.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos2079ui_story, var_380_29, var_380_28)

				local var_380_30 = manager.ui.mainCamera.transform.position - var_380_25.position

				var_380_25.forward = Vector3.New(var_380_30.x, var_380_30.y, var_380_30.z)

				local var_380_31 = var_380_25.localEulerAngles

				var_380_31.z = 0
				var_380_31.x = 0
				var_380_25.localEulerAngles = var_380_31
			end

			if arg_377_1.time_ >= var_380_26 + var_380_27 and arg_377_1.time_ < var_380_26 + var_380_27 + arg_380_0 then
				var_380_25.localPosition = Vector3.New(0, 100, 0)

				local var_380_32 = manager.ui.mainCamera.transform.position - var_380_25.position

				var_380_25.forward = Vector3.New(var_380_32.x, var_380_32.y, var_380_32.z)

				local var_380_33 = var_380_25.localEulerAngles

				var_380_33.z = 0
				var_380_33.x = 0
				var_380_25.localEulerAngles = var_380_33
			end

			local var_380_34 = arg_377_1.actors_["2079ui_story"]
			local var_380_35 = 4

			if var_380_35 < arg_377_1.time_ and arg_377_1.time_ <= var_380_35 + arg_380_0 and arg_377_1.var_.characterEffect2079ui_story == nil then
				arg_377_1.var_.characterEffect2079ui_story = var_380_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_36 = 0.200000002980232

			if var_380_35 <= arg_377_1.time_ and arg_377_1.time_ < var_380_35 + var_380_36 then
				local var_380_37 = (arg_377_1.time_ - var_380_35) / var_380_36

				if arg_377_1.var_.characterEffect2079ui_story then
					arg_377_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_35 + var_380_36 and arg_377_1.time_ < var_380_35 + var_380_36 + arg_380_0 and arg_377_1.var_.characterEffect2079ui_story then
				arg_377_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_380_38 = arg_377_1.actors_["2078ui_story"].transform
			local var_380_39 = 2

			if var_380_39 < arg_377_1.time_ and arg_377_1.time_ <= var_380_39 + arg_380_0 then
				arg_377_1.var_.moveOldPos2078ui_story = var_380_38.localPosition
			end

			local var_380_40 = 0.001

			if var_380_39 <= arg_377_1.time_ and arg_377_1.time_ < var_380_39 + var_380_40 then
				local var_380_41 = (arg_377_1.time_ - var_380_39) / var_380_40
				local var_380_42 = Vector3.New(0, 100, 0)

				var_380_38.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos2078ui_story, var_380_42, var_380_41)

				local var_380_43 = manager.ui.mainCamera.transform.position - var_380_38.position

				var_380_38.forward = Vector3.New(var_380_43.x, var_380_43.y, var_380_43.z)

				local var_380_44 = var_380_38.localEulerAngles

				var_380_44.z = 0
				var_380_44.x = 0
				var_380_38.localEulerAngles = var_380_44
			end

			if arg_377_1.time_ >= var_380_39 + var_380_40 and arg_377_1.time_ < var_380_39 + var_380_40 + arg_380_0 then
				var_380_38.localPosition = Vector3.New(0, 100, 0)

				local var_380_45 = manager.ui.mainCamera.transform.position - var_380_38.position

				var_380_38.forward = Vector3.New(var_380_45.x, var_380_45.y, var_380_45.z)

				local var_380_46 = var_380_38.localEulerAngles

				var_380_46.z = 0
				var_380_46.x = 0
				var_380_38.localEulerAngles = var_380_46
			end

			local var_380_47 = 2

			if var_380_47 < arg_377_1.time_ and arg_377_1.time_ <= var_380_47 + arg_380_0 then
				arg_377_1.screenFilterGo_:SetActive(false)
			end

			local var_380_48 = 0.0166666666666667

			if var_380_47 <= arg_377_1.time_ and arg_377_1.time_ < var_380_47 + var_380_48 then
				local var_380_49 = (arg_377_1.time_ - var_380_47) / var_380_48

				arg_377_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_380_49)
			end

			if arg_377_1.time_ >= var_380_47 + var_380_48 and arg_377_1.time_ < var_380_47 + var_380_48 + arg_380_0 then
				arg_377_1.screenFilterEffect_.weight = 0
			end

			local var_380_50 = arg_377_1.actors_["2079ui_story"].transform
			local var_380_51 = 4

			if var_380_51 < arg_377_1.time_ and arg_377_1.time_ <= var_380_51 + arg_380_0 then
				arg_377_1.var_.moveOldPos2079ui_story = var_380_50.localPosition
			end

			local var_380_52 = 0.001

			if var_380_51 <= arg_377_1.time_ and arg_377_1.time_ < var_380_51 + var_380_52 then
				local var_380_53 = (arg_377_1.time_ - var_380_51) / var_380_52
				local var_380_54 = Vector3.New(0, -1.28, -5.6)

				var_380_50.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos2079ui_story, var_380_54, var_380_53)

				local var_380_55 = manager.ui.mainCamera.transform.position - var_380_50.position

				var_380_50.forward = Vector3.New(var_380_55.x, var_380_55.y, var_380_55.z)

				local var_380_56 = var_380_50.localEulerAngles

				var_380_56.z = 0
				var_380_56.x = 0
				var_380_50.localEulerAngles = var_380_56
			end

			if arg_377_1.time_ >= var_380_51 + var_380_52 and arg_377_1.time_ < var_380_51 + var_380_52 + arg_380_0 then
				var_380_50.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_380_57 = manager.ui.mainCamera.transform.position - var_380_50.position

				var_380_50.forward = Vector3.New(var_380_57.x, var_380_57.y, var_380_57.z)

				local var_380_58 = var_380_50.localEulerAngles

				var_380_58.z = 0
				var_380_58.x = 0
				var_380_50.localEulerAngles = var_380_58
			end

			if arg_377_1.frameCnt_ <= 1 then
				arg_377_1.dialog_:SetActive(false)
			end

			local var_380_59 = 4
			local var_380_60 = 0.95

			if var_380_59 < arg_377_1.time_ and arg_377_1.time_ <= var_380_59 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0

				arg_377_1.dialog_:SetActive(true)

				local var_380_61 = LeanTween.value(arg_377_1.dialog_, 0, 1, 0.3)

				var_380_61:setOnUpdate(LuaHelper.FloatAction(function(arg_381_0)
					arg_377_1.dialogCg_.alpha = arg_381_0
				end))
				var_380_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_377_1.dialog_)
					var_380_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_377_1.duration_ = arg_377_1.duration_ + 0.3

				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_62 = arg_377_1:GetWordFromCfg(317282094)
				local var_380_63 = arg_377_1:FormatText(var_380_62.content)

				arg_377_1.text_.text = var_380_63

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_64 = 38
				local var_380_65 = utf8.len(var_380_63)
				local var_380_66 = var_380_64 <= 0 and var_380_60 or var_380_60 * (var_380_65 / var_380_64)

				if var_380_66 > 0 and var_380_60 < var_380_66 then
					arg_377_1.talkMaxDuration = var_380_66
					var_380_59 = var_380_59 + 0.3

					if var_380_66 + var_380_59 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_66 + var_380_59
					end
				end

				arg_377_1.text_.text = var_380_63
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_67 = var_380_59 + 0.3
			local var_380_68 = math.max(var_380_60, arg_377_1.talkMaxDuration)

			if var_380_67 <= arg_377_1.time_ and arg_377_1.time_ < var_380_67 + var_380_68 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_67) / var_380_68

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_67 + var_380_68 and arg_377_1.time_ < var_380_67 + var_380_68 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play317282095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 317282095
		arg_383_1.duration_ = 6.2

		local var_383_0 = {
			zh = 6.2,
			ja = 5.9
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
				arg_383_0:Play317282096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = "1199ui_story"

			if arg_383_1.actors_[var_386_0] == nil then
				local var_386_1 = Object.Instantiate(Asset.Load("Char/" .. var_386_0), arg_383_1.stage_.transform)

				var_386_1.name = var_386_0
				var_386_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_383_1.actors_[var_386_0] = var_386_1

				local var_386_2 = var_386_1:GetComponentInChildren(typeof(CharacterEffect))

				var_386_2.enabled = true

				local var_386_3 = GameObjectTools.GetOrAddComponent(var_386_1, typeof(DynamicBoneHelper))

				if var_386_3 then
					var_386_3:EnableDynamicBone(false)
				end

				arg_383_1:ShowWeapon(var_386_2.transform, false)

				arg_383_1.var_[var_386_0 .. "Animator"] = var_386_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_383_1.var_[var_386_0 .. "Animator"].applyRootMotion = true
				arg_383_1.var_[var_386_0 .. "LipSync"] = var_386_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_386_4 = arg_383_1.actors_["1199ui_story"].transform
			local var_386_5 = 0

			if var_386_5 < arg_383_1.time_ and arg_383_1.time_ <= var_386_5 + arg_386_0 then
				arg_383_1.var_.moveOldPos1199ui_story = var_386_4.localPosition
			end

			local var_386_6 = 0.001

			if var_386_5 <= arg_383_1.time_ and arg_383_1.time_ < var_386_5 + var_386_6 then
				local var_386_7 = (arg_383_1.time_ - var_386_5) / var_386_6
				local var_386_8 = Vector3.New(0, -1.08, -5.9)

				var_386_4.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1199ui_story, var_386_8, var_386_7)

				local var_386_9 = manager.ui.mainCamera.transform.position - var_386_4.position

				var_386_4.forward = Vector3.New(var_386_9.x, var_386_9.y, var_386_9.z)

				local var_386_10 = var_386_4.localEulerAngles

				var_386_10.z = 0
				var_386_10.x = 0
				var_386_4.localEulerAngles = var_386_10
			end

			if arg_383_1.time_ >= var_386_5 + var_386_6 and arg_383_1.time_ < var_386_5 + var_386_6 + arg_386_0 then
				var_386_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_386_11 = manager.ui.mainCamera.transform.position - var_386_4.position

				var_386_4.forward = Vector3.New(var_386_11.x, var_386_11.y, var_386_11.z)

				local var_386_12 = var_386_4.localEulerAngles

				var_386_12.z = 0
				var_386_12.x = 0
				var_386_4.localEulerAngles = var_386_12
			end

			local var_386_13 = arg_383_1.actors_["1199ui_story"]
			local var_386_14 = 0

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 and arg_383_1.var_.characterEffect1199ui_story == nil then
				arg_383_1.var_.characterEffect1199ui_story = var_386_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_15 = 0.200000002980232

			if var_386_14 <= arg_383_1.time_ and arg_383_1.time_ < var_386_14 + var_386_15 then
				local var_386_16 = (arg_383_1.time_ - var_386_14) / var_386_15

				if arg_383_1.var_.characterEffect1199ui_story then
					arg_383_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_383_1.time_ >= var_386_14 + var_386_15 and arg_383_1.time_ < var_386_14 + var_386_15 + arg_386_0 and arg_383_1.var_.characterEffect1199ui_story then
				arg_383_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_386_17 = 0

			if var_386_17 < arg_383_1.time_ and arg_383_1.time_ <= var_386_17 + arg_386_0 then
				arg_383_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_1")
			end

			local var_386_18 = 0

			if var_386_18 < arg_383_1.time_ and arg_383_1.time_ <= var_386_18 + arg_386_0 then
				arg_383_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_386_19 = arg_383_1.actors_["2079ui_story"].transform
			local var_386_20 = 0

			if var_386_20 < arg_383_1.time_ and arg_383_1.time_ <= var_386_20 + arg_386_0 then
				arg_383_1.var_.moveOldPos2079ui_story = var_386_19.localPosition
			end

			local var_386_21 = 0.001

			if var_386_20 <= arg_383_1.time_ and arg_383_1.time_ < var_386_20 + var_386_21 then
				local var_386_22 = (arg_383_1.time_ - var_386_20) / var_386_21
				local var_386_23 = Vector3.New(0, 100, 0)

				var_386_19.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos2079ui_story, var_386_23, var_386_22)

				local var_386_24 = manager.ui.mainCamera.transform.position - var_386_19.position

				var_386_19.forward = Vector3.New(var_386_24.x, var_386_24.y, var_386_24.z)

				local var_386_25 = var_386_19.localEulerAngles

				var_386_25.z = 0
				var_386_25.x = 0
				var_386_19.localEulerAngles = var_386_25
			end

			if arg_383_1.time_ >= var_386_20 + var_386_21 and arg_383_1.time_ < var_386_20 + var_386_21 + arg_386_0 then
				var_386_19.localPosition = Vector3.New(0, 100, 0)

				local var_386_26 = manager.ui.mainCamera.transform.position - var_386_19.position

				var_386_19.forward = Vector3.New(var_386_26.x, var_386_26.y, var_386_26.z)

				local var_386_27 = var_386_19.localEulerAngles

				var_386_27.z = 0
				var_386_27.x = 0
				var_386_19.localEulerAngles = var_386_27
			end

			local var_386_28 = 0
			local var_386_29 = 0.7

			if var_386_28 < arg_383_1.time_ and arg_383_1.time_ <= var_386_28 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_30 = arg_383_1:FormatText(StoryNameCfg[84].name)

				arg_383_1.leftNameTxt_.text = var_386_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_31 = arg_383_1:GetWordFromCfg(317282095)
				local var_386_32 = arg_383_1:FormatText(var_386_31.content)

				arg_383_1.text_.text = var_386_32

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_33 = 28
				local var_386_34 = utf8.len(var_386_32)
				local var_386_35 = var_386_33 <= 0 and var_386_29 or var_386_29 * (var_386_34 / var_386_33)

				if var_386_35 > 0 and var_386_29 < var_386_35 then
					arg_383_1.talkMaxDuration = var_386_35

					if var_386_35 + var_386_28 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_35 + var_386_28
					end
				end

				arg_383_1.text_.text = var_386_32
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282095", "story_v_out_317282.awb") ~= 0 then
					local var_386_36 = manager.audio:GetVoiceLength("story_v_out_317282", "317282095", "story_v_out_317282.awb") / 1000

					if var_386_36 + var_386_28 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_36 + var_386_28
					end

					if var_386_31.prefab_name ~= "" and arg_383_1.actors_[var_386_31.prefab_name] ~= nil then
						local var_386_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_31.prefab_name].transform, "story_v_out_317282", "317282095", "story_v_out_317282.awb")

						arg_383_1:RecordAudio("317282095", var_386_37)
						arg_383_1:RecordAudio("317282095", var_386_37)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_317282", "317282095", "story_v_out_317282.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_317282", "317282095", "story_v_out_317282.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_38 = math.max(var_386_29, arg_383_1.talkMaxDuration)

			if var_386_28 <= arg_383_1.time_ and arg_383_1.time_ < var_386_28 + var_386_38 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_28) / var_386_38

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_28 + var_386_38 and arg_383_1.time_ < var_386_28 + var_386_38 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play317282096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 317282096
		arg_387_1.duration_ = 3.2

		local var_387_0 = {
			zh = 3.2,
			ja = 1.6
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
				arg_387_0:Play317282097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.175

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[84].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(317282096)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 7
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282096", "story_v_out_317282.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282096", "story_v_out_317282.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_317282", "317282096", "story_v_out_317282.awb")

						arg_387_1:RecordAudio("317282096", var_390_9)
						arg_387_1:RecordAudio("317282096", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_317282", "317282096", "story_v_out_317282.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_317282", "317282096", "story_v_out_317282.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_10 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_10

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_10 and arg_387_1.time_ < var_390_0 + var_390_10 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play317282097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 317282097
		arg_391_1.duration_ = 5

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play317282098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1199ui_story"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 and arg_391_1.var_.characterEffect1199ui_story == nil then
				arg_391_1.var_.characterEffect1199ui_story = var_394_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_2 = 0.200000002980232

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2

				if arg_391_1.var_.characterEffect1199ui_story then
					local var_394_4 = Mathf.Lerp(0, 0.5, var_394_3)

					arg_391_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_391_1.var_.characterEffect1199ui_story.fillRatio = var_394_4
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 and arg_391_1.var_.characterEffect1199ui_story then
				local var_394_5 = 0.5

				arg_391_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_391_1.var_.characterEffect1199ui_story.fillRatio = var_394_5
			end

			local var_394_6 = 0
			local var_394_7 = 0.6

			if var_394_6 < arg_391_1.time_ and arg_391_1.time_ <= var_394_6 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, false)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_8 = arg_391_1:GetWordFromCfg(317282097)
				local var_394_9 = arg_391_1:FormatText(var_394_8.content)

				arg_391_1.text_.text = var_394_9

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_10 = 24
				local var_394_11 = utf8.len(var_394_9)
				local var_394_12 = var_394_10 <= 0 and var_394_7 or var_394_7 * (var_394_11 / var_394_10)

				if var_394_12 > 0 and var_394_7 < var_394_12 then
					arg_391_1.talkMaxDuration = var_394_12

					if var_394_12 + var_394_6 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_12 + var_394_6
					end
				end

				arg_391_1.text_.text = var_394_9
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_13 = math.max(var_394_7, arg_391_1.talkMaxDuration)

			if var_394_6 <= arg_391_1.time_ and arg_391_1.time_ < var_394_6 + var_394_13 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_6) / var_394_13

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_6 + var_394_13 and arg_391_1.time_ < var_394_6 + var_394_13 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play317282098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 317282098
		arg_395_1.duration_ = 9.166

		local var_395_0 = {
			zh = 8.6,
			ja = 9.166
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
				arg_395_0:Play317282099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1199ui_story"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos1199ui_story = var_398_0.localPosition
			end

			local var_398_2 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2
				local var_398_4 = Vector3.New(0, 100, 0)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1199ui_story, var_398_4, var_398_3)

				local var_398_5 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_5.x, var_398_5.y, var_398_5.z)

				local var_398_6 = var_398_0.localEulerAngles

				var_398_6.z = 0
				var_398_6.x = 0
				var_398_0.localEulerAngles = var_398_6
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(0, 100, 0)

				local var_398_7 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_7.x, var_398_7.y, var_398_7.z)

				local var_398_8 = var_398_0.localEulerAngles

				var_398_8.z = 0
				var_398_8.x = 0
				var_398_0.localEulerAngles = var_398_8
			end

			local var_398_9 = arg_395_1.actors_["1199ui_story"]
			local var_398_10 = 0

			if var_398_10 < arg_395_1.time_ and arg_395_1.time_ <= var_398_10 + arg_398_0 and arg_395_1.var_.characterEffect1199ui_story == nil then
				arg_395_1.var_.characterEffect1199ui_story = var_398_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_11 = 0.200000002980232

			if var_398_10 <= arg_395_1.time_ and arg_395_1.time_ < var_398_10 + var_398_11 then
				local var_398_12 = (arg_395_1.time_ - var_398_10) / var_398_11

				if arg_395_1.var_.characterEffect1199ui_story then
					local var_398_13 = Mathf.Lerp(0, 0.5, var_398_12)

					arg_395_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1199ui_story.fillRatio = var_398_13
				end
			end

			if arg_395_1.time_ >= var_398_10 + var_398_11 and arg_395_1.time_ < var_398_10 + var_398_11 + arg_398_0 and arg_395_1.var_.characterEffect1199ui_story then
				local var_398_14 = 0.5

				arg_395_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1199ui_story.fillRatio = var_398_14
			end

			local var_398_15 = arg_395_1.actors_["1015ui_story"].transform
			local var_398_16 = 0

			if var_398_16 < arg_395_1.time_ and arg_395_1.time_ <= var_398_16 + arg_398_0 then
				arg_395_1.var_.moveOldPos1015ui_story = var_398_15.localPosition
			end

			local var_398_17 = 0.001

			if var_398_16 <= arg_395_1.time_ and arg_395_1.time_ < var_398_16 + var_398_17 then
				local var_398_18 = (arg_395_1.time_ - var_398_16) / var_398_17
				local var_398_19 = Vector3.New(0, -1.15, -6.2)

				var_398_15.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1015ui_story, var_398_19, var_398_18)

				local var_398_20 = manager.ui.mainCamera.transform.position - var_398_15.position

				var_398_15.forward = Vector3.New(var_398_20.x, var_398_20.y, var_398_20.z)

				local var_398_21 = var_398_15.localEulerAngles

				var_398_21.z = 0
				var_398_21.x = 0
				var_398_15.localEulerAngles = var_398_21
			end

			if arg_395_1.time_ >= var_398_16 + var_398_17 and arg_395_1.time_ < var_398_16 + var_398_17 + arg_398_0 then
				var_398_15.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_398_22 = manager.ui.mainCamera.transform.position - var_398_15.position

				var_398_15.forward = Vector3.New(var_398_22.x, var_398_22.y, var_398_22.z)

				local var_398_23 = var_398_15.localEulerAngles

				var_398_23.z = 0
				var_398_23.x = 0
				var_398_15.localEulerAngles = var_398_23
			end

			local var_398_24 = arg_395_1.actors_["1015ui_story"]
			local var_398_25 = 0

			if var_398_25 < arg_395_1.time_ and arg_395_1.time_ <= var_398_25 + arg_398_0 and arg_395_1.var_.characterEffect1015ui_story == nil then
				arg_395_1.var_.characterEffect1015ui_story = var_398_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_26 = 0.200000002980232

			if var_398_25 <= arg_395_1.time_ and arg_395_1.time_ < var_398_25 + var_398_26 then
				local var_398_27 = (arg_395_1.time_ - var_398_25) / var_398_26

				if arg_395_1.var_.characterEffect1015ui_story then
					arg_395_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_395_1.time_ >= var_398_25 + var_398_26 and arg_395_1.time_ < var_398_25 + var_398_26 + arg_398_0 and arg_395_1.var_.characterEffect1015ui_story then
				arg_395_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_398_28 = 0

			if var_398_28 < arg_395_1.time_ and arg_395_1.time_ <= var_398_28 + arg_398_0 then
				arg_395_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_398_29 = 0

			if var_398_29 < arg_395_1.time_ and arg_395_1.time_ <= var_398_29 + arg_398_0 then
				arg_395_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_398_30 = 0
			local var_398_31 = 1.1

			if var_398_30 < arg_395_1.time_ and arg_395_1.time_ <= var_398_30 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_32 = arg_395_1:FormatText(StoryNameCfg[479].name)

				arg_395_1.leftNameTxt_.text = var_398_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_33 = arg_395_1:GetWordFromCfg(317282098)
				local var_398_34 = arg_395_1:FormatText(var_398_33.content)

				arg_395_1.text_.text = var_398_34

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_35 = 44
				local var_398_36 = utf8.len(var_398_34)
				local var_398_37 = var_398_35 <= 0 and var_398_31 or var_398_31 * (var_398_36 / var_398_35)

				if var_398_37 > 0 and var_398_31 < var_398_37 then
					arg_395_1.talkMaxDuration = var_398_37

					if var_398_37 + var_398_30 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_37 + var_398_30
					end
				end

				arg_395_1.text_.text = var_398_34
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282098", "story_v_out_317282.awb") ~= 0 then
					local var_398_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282098", "story_v_out_317282.awb") / 1000

					if var_398_38 + var_398_30 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_38 + var_398_30
					end

					if var_398_33.prefab_name ~= "" and arg_395_1.actors_[var_398_33.prefab_name] ~= nil then
						local var_398_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_33.prefab_name].transform, "story_v_out_317282", "317282098", "story_v_out_317282.awb")

						arg_395_1:RecordAudio("317282098", var_398_39)
						arg_395_1:RecordAudio("317282098", var_398_39)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_317282", "317282098", "story_v_out_317282.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_317282", "317282098", "story_v_out_317282.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_40 = math.max(var_398_31, arg_395_1.talkMaxDuration)

			if var_398_30 <= arg_395_1.time_ and arg_395_1.time_ < var_398_30 + var_398_40 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_30) / var_398_40

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_30 + var_398_40 and arg_395_1.time_ < var_398_30 + var_398_40 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play317282099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 317282099
		arg_399_1.duration_ = 16.633

		local var_399_0 = {
			zh = 16.633,
			ja = 14.333
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
				arg_399_0:Play317282100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0
			local var_402_1 = 2.025

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_2 = arg_399_1:FormatText(StoryNameCfg[479].name)

				arg_399_1.leftNameTxt_.text = var_402_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_3 = arg_399_1:GetWordFromCfg(317282099)
				local var_402_4 = arg_399_1:FormatText(var_402_3.content)

				arg_399_1.text_.text = var_402_4

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_5 = 80
				local var_402_6 = utf8.len(var_402_4)
				local var_402_7 = var_402_5 <= 0 and var_402_1 or var_402_1 * (var_402_6 / var_402_5)

				if var_402_7 > 0 and var_402_1 < var_402_7 then
					arg_399_1.talkMaxDuration = var_402_7

					if var_402_7 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_7 + var_402_0
					end
				end

				arg_399_1.text_.text = var_402_4
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282099", "story_v_out_317282.awb") ~= 0 then
					local var_402_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282099", "story_v_out_317282.awb") / 1000

					if var_402_8 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_8 + var_402_0
					end

					if var_402_3.prefab_name ~= "" and arg_399_1.actors_[var_402_3.prefab_name] ~= nil then
						local var_402_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_3.prefab_name].transform, "story_v_out_317282", "317282099", "story_v_out_317282.awb")

						arg_399_1:RecordAudio("317282099", var_402_9)
						arg_399_1:RecordAudio("317282099", var_402_9)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_317282", "317282099", "story_v_out_317282.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_317282", "317282099", "story_v_out_317282.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_10 = math.max(var_402_1, arg_399_1.talkMaxDuration)

			if var_402_0 <= arg_399_1.time_ and arg_399_1.time_ < var_402_0 + var_402_10 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_0) / var_402_10

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_0 + var_402_10 and arg_399_1.time_ < var_402_0 + var_402_10 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play317282100 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 317282100
		arg_403_1.duration_ = 16

		local var_403_0 = {
			zh = 12.633,
			ja = 16
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
				arg_403_0:Play317282101(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = 0
			local var_406_1 = 1.575

			if var_406_0 < arg_403_1.time_ and arg_403_1.time_ <= var_406_0 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_2 = arg_403_1:FormatText(StoryNameCfg[479].name)

				arg_403_1.leftNameTxt_.text = var_406_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_3 = arg_403_1:GetWordFromCfg(317282100)
				local var_406_4 = arg_403_1:FormatText(var_406_3.content)

				arg_403_1.text_.text = var_406_4

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_5 = 63
				local var_406_6 = utf8.len(var_406_4)
				local var_406_7 = var_406_5 <= 0 and var_406_1 or var_406_1 * (var_406_6 / var_406_5)

				if var_406_7 > 0 and var_406_1 < var_406_7 then
					arg_403_1.talkMaxDuration = var_406_7

					if var_406_7 + var_406_0 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_7 + var_406_0
					end
				end

				arg_403_1.text_.text = var_406_4
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282100", "story_v_out_317282.awb") ~= 0 then
					local var_406_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282100", "story_v_out_317282.awb") / 1000

					if var_406_8 + var_406_0 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_8 + var_406_0
					end

					if var_406_3.prefab_name ~= "" and arg_403_1.actors_[var_406_3.prefab_name] ~= nil then
						local var_406_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_3.prefab_name].transform, "story_v_out_317282", "317282100", "story_v_out_317282.awb")

						arg_403_1:RecordAudio("317282100", var_406_9)
						arg_403_1:RecordAudio("317282100", var_406_9)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_317282", "317282100", "story_v_out_317282.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_317282", "317282100", "story_v_out_317282.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_10 = math.max(var_406_1, arg_403_1.talkMaxDuration)

			if var_406_0 <= arg_403_1.time_ and arg_403_1.time_ < var_406_0 + var_406_10 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_0) / var_406_10

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_0 + var_406_10 and arg_403_1.time_ < var_406_0 + var_406_10 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play317282101 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 317282101
		arg_407_1.duration_ = 9.066

		local var_407_0 = {
			zh = 7.2,
			ja = 9.066
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
				arg_407_0:Play317282102(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0
			local var_410_1 = 0.9

			if var_410_0 < arg_407_1.time_ and arg_407_1.time_ <= var_410_0 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_2 = arg_407_1:FormatText(StoryNameCfg[479].name)

				arg_407_1.leftNameTxt_.text = var_410_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_3 = arg_407_1:GetWordFromCfg(317282101)
				local var_410_4 = arg_407_1:FormatText(var_410_3.content)

				arg_407_1.text_.text = var_410_4

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_5 = 36
				local var_410_6 = utf8.len(var_410_4)
				local var_410_7 = var_410_5 <= 0 and var_410_1 or var_410_1 * (var_410_6 / var_410_5)

				if var_410_7 > 0 and var_410_1 < var_410_7 then
					arg_407_1.talkMaxDuration = var_410_7

					if var_410_7 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_7 + var_410_0
					end
				end

				arg_407_1.text_.text = var_410_4
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282101", "story_v_out_317282.awb") ~= 0 then
					local var_410_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282101", "story_v_out_317282.awb") / 1000

					if var_410_8 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_8 + var_410_0
					end

					if var_410_3.prefab_name ~= "" and arg_407_1.actors_[var_410_3.prefab_name] ~= nil then
						local var_410_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_3.prefab_name].transform, "story_v_out_317282", "317282101", "story_v_out_317282.awb")

						arg_407_1:RecordAudio("317282101", var_410_9)
						arg_407_1:RecordAudio("317282101", var_410_9)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_317282", "317282101", "story_v_out_317282.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_317282", "317282101", "story_v_out_317282.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_10 = math.max(var_410_1, arg_407_1.talkMaxDuration)

			if var_410_0 <= arg_407_1.time_ and arg_407_1.time_ < var_410_0 + var_410_10 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_0) / var_410_10

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_0 + var_410_10 and arg_407_1.time_ < var_410_0 + var_410_10 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play317282102 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 317282102
		arg_411_1.duration_ = 4.866

		local var_411_0 = {
			zh = 4.233,
			ja = 4.866
		}
		local var_411_1 = manager.audio:GetLocalizationFlag()

		if var_411_0[var_411_1] ~= nil then
			arg_411_1.duration_ = var_411_0[var_411_1]
		end

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play317282103(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1015ui_story"].transform
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.var_.moveOldPos1015ui_story = var_414_0.localPosition
			end

			local var_414_2 = 0.001

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2
				local var_414_4 = Vector3.New(0, 100, 0)

				var_414_0.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1015ui_story, var_414_4, var_414_3)

				local var_414_5 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_5.x, var_414_5.y, var_414_5.z)

				local var_414_6 = var_414_0.localEulerAngles

				var_414_6.z = 0
				var_414_6.x = 0
				var_414_0.localEulerAngles = var_414_6
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 then
				var_414_0.localPosition = Vector3.New(0, 100, 0)

				local var_414_7 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_7.x, var_414_7.y, var_414_7.z)

				local var_414_8 = var_414_0.localEulerAngles

				var_414_8.z = 0
				var_414_8.x = 0
				var_414_0.localEulerAngles = var_414_8
			end

			local var_414_9 = arg_411_1.actors_["1015ui_story"]
			local var_414_10 = 0

			if var_414_10 < arg_411_1.time_ and arg_411_1.time_ <= var_414_10 + arg_414_0 and arg_411_1.var_.characterEffect1015ui_story == nil then
				arg_411_1.var_.characterEffect1015ui_story = var_414_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_11 = 0.200000002980232

			if var_414_10 <= arg_411_1.time_ and arg_411_1.time_ < var_414_10 + var_414_11 then
				local var_414_12 = (arg_411_1.time_ - var_414_10) / var_414_11

				if arg_411_1.var_.characterEffect1015ui_story then
					local var_414_13 = Mathf.Lerp(0, 0.5, var_414_12)

					arg_411_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_411_1.var_.characterEffect1015ui_story.fillRatio = var_414_13
				end
			end

			if arg_411_1.time_ >= var_414_10 + var_414_11 and arg_411_1.time_ < var_414_10 + var_414_11 + arg_414_0 and arg_411_1.var_.characterEffect1015ui_story then
				local var_414_14 = 0.5

				arg_411_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_411_1.var_.characterEffect1015ui_story.fillRatio = var_414_14
			end

			local var_414_15 = arg_411_1.actors_["1199ui_story"].transform
			local var_414_16 = 0

			if var_414_16 < arg_411_1.time_ and arg_411_1.time_ <= var_414_16 + arg_414_0 then
				arg_411_1.var_.moveOldPos1199ui_story = var_414_15.localPosition
			end

			local var_414_17 = 0.001

			if var_414_16 <= arg_411_1.time_ and arg_411_1.time_ < var_414_16 + var_414_17 then
				local var_414_18 = (arg_411_1.time_ - var_414_16) / var_414_17
				local var_414_19 = Vector3.New(0, -1.08, -5.9)

				var_414_15.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1199ui_story, var_414_19, var_414_18)

				local var_414_20 = manager.ui.mainCamera.transform.position - var_414_15.position

				var_414_15.forward = Vector3.New(var_414_20.x, var_414_20.y, var_414_20.z)

				local var_414_21 = var_414_15.localEulerAngles

				var_414_21.z = 0
				var_414_21.x = 0
				var_414_15.localEulerAngles = var_414_21
			end

			if arg_411_1.time_ >= var_414_16 + var_414_17 and arg_411_1.time_ < var_414_16 + var_414_17 + arg_414_0 then
				var_414_15.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_414_22 = manager.ui.mainCamera.transform.position - var_414_15.position

				var_414_15.forward = Vector3.New(var_414_22.x, var_414_22.y, var_414_22.z)

				local var_414_23 = var_414_15.localEulerAngles

				var_414_23.z = 0
				var_414_23.x = 0
				var_414_15.localEulerAngles = var_414_23
			end

			local var_414_24 = arg_411_1.actors_["1199ui_story"]
			local var_414_25 = 0

			if var_414_25 < arg_411_1.time_ and arg_411_1.time_ <= var_414_25 + arg_414_0 and arg_411_1.var_.characterEffect1199ui_story == nil then
				arg_411_1.var_.characterEffect1199ui_story = var_414_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_26 = 0.200000002980232

			if var_414_25 <= arg_411_1.time_ and arg_411_1.time_ < var_414_25 + var_414_26 then
				local var_414_27 = (arg_411_1.time_ - var_414_25) / var_414_26

				if arg_411_1.var_.characterEffect1199ui_story then
					arg_411_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_411_1.time_ >= var_414_25 + var_414_26 and arg_411_1.time_ < var_414_25 + var_414_26 + arg_414_0 and arg_411_1.var_.characterEffect1199ui_story then
				arg_411_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_414_28 = 0

			if var_414_28 < arg_411_1.time_ and arg_411_1.time_ <= var_414_28 + arg_414_0 then
				arg_411_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_2")
			end

			local var_414_29 = 0

			if var_414_29 < arg_411_1.time_ and arg_411_1.time_ <= var_414_29 + arg_414_0 then
				arg_411_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_414_30 = 0
			local var_414_31 = 0.575

			if var_414_30 < arg_411_1.time_ and arg_411_1.time_ <= var_414_30 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_32 = arg_411_1:FormatText(StoryNameCfg[84].name)

				arg_411_1.leftNameTxt_.text = var_414_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_33 = arg_411_1:GetWordFromCfg(317282102)
				local var_414_34 = arg_411_1:FormatText(var_414_33.content)

				arg_411_1.text_.text = var_414_34

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_35 = 23
				local var_414_36 = utf8.len(var_414_34)
				local var_414_37 = var_414_35 <= 0 and var_414_31 or var_414_31 * (var_414_36 / var_414_35)

				if var_414_37 > 0 and var_414_31 < var_414_37 then
					arg_411_1.talkMaxDuration = var_414_37

					if var_414_37 + var_414_30 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_37 + var_414_30
					end
				end

				arg_411_1.text_.text = var_414_34
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282102", "story_v_out_317282.awb") ~= 0 then
					local var_414_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282102", "story_v_out_317282.awb") / 1000

					if var_414_38 + var_414_30 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_38 + var_414_30
					end

					if var_414_33.prefab_name ~= "" and arg_411_1.actors_[var_414_33.prefab_name] ~= nil then
						local var_414_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_33.prefab_name].transform, "story_v_out_317282", "317282102", "story_v_out_317282.awb")

						arg_411_1:RecordAudio("317282102", var_414_39)
						arg_411_1:RecordAudio("317282102", var_414_39)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_out_317282", "317282102", "story_v_out_317282.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_out_317282", "317282102", "story_v_out_317282.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_40 = math.max(var_414_31, arg_411_1.talkMaxDuration)

			if var_414_30 <= arg_411_1.time_ and arg_411_1.time_ < var_414_30 + var_414_40 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_30) / var_414_40

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_30 + var_414_40 and arg_411_1.time_ < var_414_30 + var_414_40 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play317282103 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 317282103
		arg_415_1.duration_ = 14.8

		local var_415_0 = {
			zh = 14.8,
			ja = 12.233
		}
		local var_415_1 = manager.audio:GetLocalizationFlag()

		if var_415_0[var_415_1] ~= nil then
			arg_415_1.duration_ = var_415_0[var_415_1]
		end

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play317282104(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1015ui_story"].transform
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 then
				arg_415_1.var_.moveOldPos1015ui_story = var_418_0.localPosition
			end

			local var_418_2 = 0.001

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2
				local var_418_4 = Vector3.New(0, -1.15, -6.2)

				var_418_0.localPosition = Vector3.Lerp(arg_415_1.var_.moveOldPos1015ui_story, var_418_4, var_418_3)

				local var_418_5 = manager.ui.mainCamera.transform.position - var_418_0.position

				var_418_0.forward = Vector3.New(var_418_5.x, var_418_5.y, var_418_5.z)

				local var_418_6 = var_418_0.localEulerAngles

				var_418_6.z = 0
				var_418_6.x = 0
				var_418_0.localEulerAngles = var_418_6
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 then
				var_418_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_418_7 = manager.ui.mainCamera.transform.position - var_418_0.position

				var_418_0.forward = Vector3.New(var_418_7.x, var_418_7.y, var_418_7.z)

				local var_418_8 = var_418_0.localEulerAngles

				var_418_8.z = 0
				var_418_8.x = 0
				var_418_0.localEulerAngles = var_418_8
			end

			local var_418_9 = arg_415_1.actors_["1015ui_story"]
			local var_418_10 = 0

			if var_418_10 < arg_415_1.time_ and arg_415_1.time_ <= var_418_10 + arg_418_0 and arg_415_1.var_.characterEffect1015ui_story == nil then
				arg_415_1.var_.characterEffect1015ui_story = var_418_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_11 = 0.200000002980232

			if var_418_10 <= arg_415_1.time_ and arg_415_1.time_ < var_418_10 + var_418_11 then
				local var_418_12 = (arg_415_1.time_ - var_418_10) / var_418_11

				if arg_415_1.var_.characterEffect1015ui_story then
					arg_415_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_415_1.time_ >= var_418_10 + var_418_11 and arg_415_1.time_ < var_418_10 + var_418_11 + arg_418_0 and arg_415_1.var_.characterEffect1015ui_story then
				arg_415_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_418_13 = 0

			if var_418_13 < arg_415_1.time_ and arg_415_1.time_ <= var_418_13 + arg_418_0 then
				arg_415_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_418_14 = 0

			if var_418_14 < arg_415_1.time_ and arg_415_1.time_ <= var_418_14 + arg_418_0 then
				arg_415_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_418_15 = arg_415_1.actors_["1199ui_story"].transform
			local var_418_16 = 0

			if var_418_16 < arg_415_1.time_ and arg_415_1.time_ <= var_418_16 + arg_418_0 then
				arg_415_1.var_.moveOldPos1199ui_story = var_418_15.localPosition
			end

			local var_418_17 = 0.001

			if var_418_16 <= arg_415_1.time_ and arg_415_1.time_ < var_418_16 + var_418_17 then
				local var_418_18 = (arg_415_1.time_ - var_418_16) / var_418_17
				local var_418_19 = Vector3.New(0, 100, 0)

				var_418_15.localPosition = Vector3.Lerp(arg_415_1.var_.moveOldPos1199ui_story, var_418_19, var_418_18)

				local var_418_20 = manager.ui.mainCamera.transform.position - var_418_15.position

				var_418_15.forward = Vector3.New(var_418_20.x, var_418_20.y, var_418_20.z)

				local var_418_21 = var_418_15.localEulerAngles

				var_418_21.z = 0
				var_418_21.x = 0
				var_418_15.localEulerAngles = var_418_21
			end

			if arg_415_1.time_ >= var_418_16 + var_418_17 and arg_415_1.time_ < var_418_16 + var_418_17 + arg_418_0 then
				var_418_15.localPosition = Vector3.New(0, 100, 0)

				local var_418_22 = manager.ui.mainCamera.transform.position - var_418_15.position

				var_418_15.forward = Vector3.New(var_418_22.x, var_418_22.y, var_418_22.z)

				local var_418_23 = var_418_15.localEulerAngles

				var_418_23.z = 0
				var_418_23.x = 0
				var_418_15.localEulerAngles = var_418_23
			end

			local var_418_24 = arg_415_1.actors_["1199ui_story"]
			local var_418_25 = 0

			if var_418_25 < arg_415_1.time_ and arg_415_1.time_ <= var_418_25 + arg_418_0 and arg_415_1.var_.characterEffect1199ui_story == nil then
				arg_415_1.var_.characterEffect1199ui_story = var_418_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_26 = 0.200000002980232

			if var_418_25 <= arg_415_1.time_ and arg_415_1.time_ < var_418_25 + var_418_26 then
				local var_418_27 = (arg_415_1.time_ - var_418_25) / var_418_26

				if arg_415_1.var_.characterEffect1199ui_story then
					local var_418_28 = Mathf.Lerp(0, 0.5, var_418_27)

					arg_415_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_415_1.var_.characterEffect1199ui_story.fillRatio = var_418_28
				end
			end

			if arg_415_1.time_ >= var_418_25 + var_418_26 and arg_415_1.time_ < var_418_25 + var_418_26 + arg_418_0 and arg_415_1.var_.characterEffect1199ui_story then
				local var_418_29 = 0.5

				arg_415_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_415_1.var_.characterEffect1199ui_story.fillRatio = var_418_29
			end

			local var_418_30 = 0
			local var_418_31 = 1.825

			if var_418_30 < arg_415_1.time_ and arg_415_1.time_ <= var_418_30 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_32 = arg_415_1:FormatText(StoryNameCfg[479].name)

				arg_415_1.leftNameTxt_.text = var_418_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_33 = arg_415_1:GetWordFromCfg(317282103)
				local var_418_34 = arg_415_1:FormatText(var_418_33.content)

				arg_415_1.text_.text = var_418_34

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_35 = 73
				local var_418_36 = utf8.len(var_418_34)
				local var_418_37 = var_418_35 <= 0 and var_418_31 or var_418_31 * (var_418_36 / var_418_35)

				if var_418_37 > 0 and var_418_31 < var_418_37 then
					arg_415_1.talkMaxDuration = var_418_37

					if var_418_37 + var_418_30 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_37 + var_418_30
					end
				end

				arg_415_1.text_.text = var_418_34
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282103", "story_v_out_317282.awb") ~= 0 then
					local var_418_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282103", "story_v_out_317282.awb") / 1000

					if var_418_38 + var_418_30 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_38 + var_418_30
					end

					if var_418_33.prefab_name ~= "" and arg_415_1.actors_[var_418_33.prefab_name] ~= nil then
						local var_418_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_33.prefab_name].transform, "story_v_out_317282", "317282103", "story_v_out_317282.awb")

						arg_415_1:RecordAudio("317282103", var_418_39)
						arg_415_1:RecordAudio("317282103", var_418_39)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_out_317282", "317282103", "story_v_out_317282.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_out_317282", "317282103", "story_v_out_317282.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_40 = math.max(var_418_31, arg_415_1.talkMaxDuration)

			if var_418_30 <= arg_415_1.time_ and arg_415_1.time_ < var_418_30 + var_418_40 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_30) / var_418_40

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_30 + var_418_40 and arg_415_1.time_ < var_418_30 + var_418_40 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play317282104 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 317282104
		arg_419_1.duration_ = 13.7

		local var_419_0 = {
			zh = 8.766,
			ja = 13.7
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
				arg_419_0:Play317282105(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0
			local var_422_1 = 1

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_2 = arg_419_1:FormatText(StoryNameCfg[479].name)

				arg_419_1.leftNameTxt_.text = var_422_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_3 = arg_419_1:GetWordFromCfg(317282104)
				local var_422_4 = arg_419_1:FormatText(var_422_3.content)

				arg_419_1.text_.text = var_422_4

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282104", "story_v_out_317282.awb") ~= 0 then
					local var_422_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282104", "story_v_out_317282.awb") / 1000

					if var_422_8 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_8 + var_422_0
					end

					if var_422_3.prefab_name ~= "" and arg_419_1.actors_[var_422_3.prefab_name] ~= nil then
						local var_422_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_3.prefab_name].transform, "story_v_out_317282", "317282104", "story_v_out_317282.awb")

						arg_419_1:RecordAudio("317282104", var_422_9)
						arg_419_1:RecordAudio("317282104", var_422_9)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_317282", "317282104", "story_v_out_317282.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_317282", "317282104", "story_v_out_317282.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_10 = math.max(var_422_1, arg_419_1.talkMaxDuration)

			if var_422_0 <= arg_419_1.time_ and arg_419_1.time_ < var_422_0 + var_422_10 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_0) / var_422_10

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_0 + var_422_10 and arg_419_1.time_ < var_422_0 + var_422_10 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play317282105 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 317282105
		arg_423_1.duration_ = 15.533

		local var_423_0 = {
			zh = 15.533,
			ja = 9.666
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
				arg_423_0:Play317282106(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 1.725

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_2 = arg_423_1:FormatText(StoryNameCfg[479].name)

				arg_423_1.leftNameTxt_.text = var_426_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_3 = arg_423_1:GetWordFromCfg(317282105)
				local var_426_4 = arg_423_1:FormatText(var_426_3.content)

				arg_423_1.text_.text = var_426_4

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_5 = 69
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282105", "story_v_out_317282.awb") ~= 0 then
					local var_426_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282105", "story_v_out_317282.awb") / 1000

					if var_426_8 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_8 + var_426_0
					end

					if var_426_3.prefab_name ~= "" and arg_423_1.actors_[var_426_3.prefab_name] ~= nil then
						local var_426_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_3.prefab_name].transform, "story_v_out_317282", "317282105", "story_v_out_317282.awb")

						arg_423_1:RecordAudio("317282105", var_426_9)
						arg_423_1:RecordAudio("317282105", var_426_9)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_317282", "317282105", "story_v_out_317282.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_317282", "317282105", "story_v_out_317282.awb")
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
	Play317282106 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 317282106
		arg_427_1.duration_ = 6.633

		local var_427_0 = {
			zh = 5.7,
			ja = 6.633
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
				arg_427_0:Play317282107(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 0.75

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_2 = arg_427_1:FormatText(StoryNameCfg[479].name)

				arg_427_1.leftNameTxt_.text = var_430_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_3 = arg_427_1:GetWordFromCfg(317282106)
				local var_430_4 = arg_427_1:FormatText(var_430_3.content)

				arg_427_1.text_.text = var_430_4

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282106", "story_v_out_317282.awb") ~= 0 then
					local var_430_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282106", "story_v_out_317282.awb") / 1000

					if var_430_8 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_8 + var_430_0
					end

					if var_430_3.prefab_name ~= "" and arg_427_1.actors_[var_430_3.prefab_name] ~= nil then
						local var_430_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_3.prefab_name].transform, "story_v_out_317282", "317282106", "story_v_out_317282.awb")

						arg_427_1:RecordAudio("317282106", var_430_9)
						arg_427_1:RecordAudio("317282106", var_430_9)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_317282", "317282106", "story_v_out_317282.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_317282", "317282106", "story_v_out_317282.awb")
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
	Play317282107 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 317282107
		arg_431_1.duration_ = 2.933

		local var_431_0 = {
			zh = 1.9,
			ja = 2.933
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
				arg_431_0:Play317282108(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1015ui_story"].transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.moveOldPos1015ui_story = var_434_0.localPosition
			end

			local var_434_2 = 0.001

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2
				local var_434_4 = Vector3.New(0, 100, 0)

				var_434_0.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1015ui_story, var_434_4, var_434_3)

				local var_434_5 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_5.x, var_434_5.y, var_434_5.z)

				local var_434_6 = var_434_0.localEulerAngles

				var_434_6.z = 0
				var_434_6.x = 0
				var_434_0.localEulerAngles = var_434_6
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 then
				var_434_0.localPosition = Vector3.New(0, 100, 0)

				local var_434_7 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_7.x, var_434_7.y, var_434_7.z)

				local var_434_8 = var_434_0.localEulerAngles

				var_434_8.z = 0
				var_434_8.x = 0
				var_434_0.localEulerAngles = var_434_8
			end

			local var_434_9 = arg_431_1.actors_["1015ui_story"]
			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 and arg_431_1.var_.characterEffect1015ui_story == nil then
				arg_431_1.var_.characterEffect1015ui_story = var_434_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_11 = 0.200000002980232

			if var_434_10 <= arg_431_1.time_ and arg_431_1.time_ < var_434_10 + var_434_11 then
				local var_434_12 = (arg_431_1.time_ - var_434_10) / var_434_11

				if arg_431_1.var_.characterEffect1015ui_story then
					local var_434_13 = Mathf.Lerp(0, 0.5, var_434_12)

					arg_431_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_431_1.var_.characterEffect1015ui_story.fillRatio = var_434_13
				end
			end

			if arg_431_1.time_ >= var_434_10 + var_434_11 and arg_431_1.time_ < var_434_10 + var_434_11 + arg_434_0 and arg_431_1.var_.characterEffect1015ui_story then
				local var_434_14 = 0.5

				arg_431_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_431_1.var_.characterEffect1015ui_story.fillRatio = var_434_14
			end

			local var_434_15 = arg_431_1.actors_["1199ui_story"].transform
			local var_434_16 = 0

			if var_434_16 < arg_431_1.time_ and arg_431_1.time_ <= var_434_16 + arg_434_0 then
				arg_431_1.var_.moveOldPos1199ui_story = var_434_15.localPosition
			end

			local var_434_17 = 0.001

			if var_434_16 <= arg_431_1.time_ and arg_431_1.time_ < var_434_16 + var_434_17 then
				local var_434_18 = (arg_431_1.time_ - var_434_16) / var_434_17
				local var_434_19 = Vector3.New(0, -1.08, -5.9)

				var_434_15.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1199ui_story, var_434_19, var_434_18)

				local var_434_20 = manager.ui.mainCamera.transform.position - var_434_15.position

				var_434_15.forward = Vector3.New(var_434_20.x, var_434_20.y, var_434_20.z)

				local var_434_21 = var_434_15.localEulerAngles

				var_434_21.z = 0
				var_434_21.x = 0
				var_434_15.localEulerAngles = var_434_21
			end

			if arg_431_1.time_ >= var_434_16 + var_434_17 and arg_431_1.time_ < var_434_16 + var_434_17 + arg_434_0 then
				var_434_15.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_434_22 = manager.ui.mainCamera.transform.position - var_434_15.position

				var_434_15.forward = Vector3.New(var_434_22.x, var_434_22.y, var_434_22.z)

				local var_434_23 = var_434_15.localEulerAngles

				var_434_23.z = 0
				var_434_23.x = 0
				var_434_15.localEulerAngles = var_434_23
			end

			local var_434_24 = arg_431_1.actors_["1199ui_story"]
			local var_434_25 = 0

			if var_434_25 < arg_431_1.time_ and arg_431_1.time_ <= var_434_25 + arg_434_0 and arg_431_1.var_.characterEffect1199ui_story == nil then
				arg_431_1.var_.characterEffect1199ui_story = var_434_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_26 = 0.200000002980232

			if var_434_25 <= arg_431_1.time_ and arg_431_1.time_ < var_434_25 + var_434_26 then
				local var_434_27 = (arg_431_1.time_ - var_434_25) / var_434_26

				if arg_431_1.var_.characterEffect1199ui_story then
					arg_431_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_25 + var_434_26 and arg_431_1.time_ < var_434_25 + var_434_26 + arg_434_0 and arg_431_1.var_.characterEffect1199ui_story then
				arg_431_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_434_28 = 0

			if var_434_28 < arg_431_1.time_ and arg_431_1.time_ <= var_434_28 + arg_434_0 then
				arg_431_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_434_29 = 0

			if var_434_29 < arg_431_1.time_ and arg_431_1.time_ <= var_434_29 + arg_434_0 then
				arg_431_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_434_30 = 0
			local var_434_31 = 0.25

			if var_434_30 < arg_431_1.time_ and arg_431_1.time_ <= var_434_30 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_32 = arg_431_1:FormatText(StoryNameCfg[84].name)

				arg_431_1.leftNameTxt_.text = var_434_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_33 = arg_431_1:GetWordFromCfg(317282107)
				local var_434_34 = arg_431_1:FormatText(var_434_33.content)

				arg_431_1.text_.text = var_434_34

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_35 = 10
				local var_434_36 = utf8.len(var_434_34)
				local var_434_37 = var_434_35 <= 0 and var_434_31 or var_434_31 * (var_434_36 / var_434_35)

				if var_434_37 > 0 and var_434_31 < var_434_37 then
					arg_431_1.talkMaxDuration = var_434_37

					if var_434_37 + var_434_30 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_37 + var_434_30
					end
				end

				arg_431_1.text_.text = var_434_34
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282107", "story_v_out_317282.awb") ~= 0 then
					local var_434_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282107", "story_v_out_317282.awb") / 1000

					if var_434_38 + var_434_30 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_38 + var_434_30
					end

					if var_434_33.prefab_name ~= "" and arg_431_1.actors_[var_434_33.prefab_name] ~= nil then
						local var_434_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_33.prefab_name].transform, "story_v_out_317282", "317282107", "story_v_out_317282.awb")

						arg_431_1:RecordAudio("317282107", var_434_39)
						arg_431_1:RecordAudio("317282107", var_434_39)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_317282", "317282107", "story_v_out_317282.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_317282", "317282107", "story_v_out_317282.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_40 = math.max(var_434_31, arg_431_1.talkMaxDuration)

			if var_434_30 <= arg_431_1.time_ and arg_431_1.time_ < var_434_30 + var_434_40 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_30) / var_434_40

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_30 + var_434_40 and arg_431_1.time_ < var_434_30 + var_434_40 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play317282108 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 317282108
		arg_435_1.duration_ = 8.6

		local var_435_0 = {
			zh = 5.5,
			ja = 8.6
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
				arg_435_0:Play317282109(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["1015ui_story"].transform
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 then
				arg_435_1.var_.moveOldPos1015ui_story = var_438_0.localPosition
			end

			local var_438_2 = 0.001

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2
				local var_438_4 = Vector3.New(0, -1.15, -6.2)

				var_438_0.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos1015ui_story, var_438_4, var_438_3)

				local var_438_5 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_5.x, var_438_5.y, var_438_5.z)

				local var_438_6 = var_438_0.localEulerAngles

				var_438_6.z = 0
				var_438_6.x = 0
				var_438_0.localEulerAngles = var_438_6
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 then
				var_438_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_438_7 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_7.x, var_438_7.y, var_438_7.z)

				local var_438_8 = var_438_0.localEulerAngles

				var_438_8.z = 0
				var_438_8.x = 0
				var_438_0.localEulerAngles = var_438_8
			end

			local var_438_9 = arg_435_1.actors_["1015ui_story"]
			local var_438_10 = 0

			if var_438_10 < arg_435_1.time_ and arg_435_1.time_ <= var_438_10 + arg_438_0 and arg_435_1.var_.characterEffect1015ui_story == nil then
				arg_435_1.var_.characterEffect1015ui_story = var_438_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_11 = 0.200000002980232

			if var_438_10 <= arg_435_1.time_ and arg_435_1.time_ < var_438_10 + var_438_11 then
				local var_438_12 = (arg_435_1.time_ - var_438_10) / var_438_11

				if arg_435_1.var_.characterEffect1015ui_story then
					arg_435_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_435_1.time_ >= var_438_10 + var_438_11 and arg_435_1.time_ < var_438_10 + var_438_11 + arg_438_0 and arg_435_1.var_.characterEffect1015ui_story then
				arg_435_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_438_13 = 0

			if var_438_13 < arg_435_1.time_ and arg_435_1.time_ <= var_438_13 + arg_438_0 then
				arg_435_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_438_14 = 0

			if var_438_14 < arg_435_1.time_ and arg_435_1.time_ <= var_438_14 + arg_438_0 then
				arg_435_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_438_15 = arg_435_1.actors_["1199ui_story"].transform
			local var_438_16 = 0

			if var_438_16 < arg_435_1.time_ and arg_435_1.time_ <= var_438_16 + arg_438_0 then
				arg_435_1.var_.moveOldPos1199ui_story = var_438_15.localPosition
			end

			local var_438_17 = 0.001

			if var_438_16 <= arg_435_1.time_ and arg_435_1.time_ < var_438_16 + var_438_17 then
				local var_438_18 = (arg_435_1.time_ - var_438_16) / var_438_17
				local var_438_19 = Vector3.New(0, 100, 0)

				var_438_15.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos1199ui_story, var_438_19, var_438_18)

				local var_438_20 = manager.ui.mainCamera.transform.position - var_438_15.position

				var_438_15.forward = Vector3.New(var_438_20.x, var_438_20.y, var_438_20.z)

				local var_438_21 = var_438_15.localEulerAngles

				var_438_21.z = 0
				var_438_21.x = 0
				var_438_15.localEulerAngles = var_438_21
			end

			if arg_435_1.time_ >= var_438_16 + var_438_17 and arg_435_1.time_ < var_438_16 + var_438_17 + arg_438_0 then
				var_438_15.localPosition = Vector3.New(0, 100, 0)

				local var_438_22 = manager.ui.mainCamera.transform.position - var_438_15.position

				var_438_15.forward = Vector3.New(var_438_22.x, var_438_22.y, var_438_22.z)

				local var_438_23 = var_438_15.localEulerAngles

				var_438_23.z = 0
				var_438_23.x = 0
				var_438_15.localEulerAngles = var_438_23
			end

			local var_438_24 = arg_435_1.actors_["1199ui_story"]
			local var_438_25 = 0

			if var_438_25 < arg_435_1.time_ and arg_435_1.time_ <= var_438_25 + arg_438_0 and arg_435_1.var_.characterEffect1199ui_story == nil then
				arg_435_1.var_.characterEffect1199ui_story = var_438_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_26 = 0.200000002980232

			if var_438_25 <= arg_435_1.time_ and arg_435_1.time_ < var_438_25 + var_438_26 then
				local var_438_27 = (arg_435_1.time_ - var_438_25) / var_438_26

				if arg_435_1.var_.characterEffect1199ui_story then
					local var_438_28 = Mathf.Lerp(0, 0.5, var_438_27)

					arg_435_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_435_1.var_.characterEffect1199ui_story.fillRatio = var_438_28
				end
			end

			if arg_435_1.time_ >= var_438_25 + var_438_26 and arg_435_1.time_ < var_438_25 + var_438_26 + arg_438_0 and arg_435_1.var_.characterEffect1199ui_story then
				local var_438_29 = 0.5

				arg_435_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_435_1.var_.characterEffect1199ui_story.fillRatio = var_438_29
			end

			local var_438_30 = 0
			local var_438_31 = 0.65

			if var_438_30 < arg_435_1.time_ and arg_435_1.time_ <= var_438_30 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_32 = arg_435_1:FormatText(StoryNameCfg[479].name)

				arg_435_1.leftNameTxt_.text = var_438_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_33 = arg_435_1:GetWordFromCfg(317282108)
				local var_438_34 = arg_435_1:FormatText(var_438_33.content)

				arg_435_1.text_.text = var_438_34

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_35 = 26
				local var_438_36 = utf8.len(var_438_34)
				local var_438_37 = var_438_35 <= 0 and var_438_31 or var_438_31 * (var_438_36 / var_438_35)

				if var_438_37 > 0 and var_438_31 < var_438_37 then
					arg_435_1.talkMaxDuration = var_438_37

					if var_438_37 + var_438_30 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_37 + var_438_30
					end
				end

				arg_435_1.text_.text = var_438_34
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282108", "story_v_out_317282.awb") ~= 0 then
					local var_438_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282108", "story_v_out_317282.awb") / 1000

					if var_438_38 + var_438_30 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_38 + var_438_30
					end

					if var_438_33.prefab_name ~= "" and arg_435_1.actors_[var_438_33.prefab_name] ~= nil then
						local var_438_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_33.prefab_name].transform, "story_v_out_317282", "317282108", "story_v_out_317282.awb")

						arg_435_1:RecordAudio("317282108", var_438_39)
						arg_435_1:RecordAudio("317282108", var_438_39)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_317282", "317282108", "story_v_out_317282.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_317282", "317282108", "story_v_out_317282.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_40 = math.max(var_438_31, arg_435_1.talkMaxDuration)

			if var_438_30 <= arg_435_1.time_ and arg_435_1.time_ < var_438_30 + var_438_40 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_30) / var_438_40

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_30 + var_438_40 and arg_435_1.time_ < var_438_30 + var_438_40 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play317282109 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 317282109
		arg_439_1.duration_ = 9.2

		local var_439_0 = {
			zh = 9.2,
			ja = 4.833
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
				arg_439_0:Play317282110(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 1.125

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_2 = arg_439_1:FormatText(StoryNameCfg[479].name)

				arg_439_1.leftNameTxt_.text = var_442_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_3 = arg_439_1:GetWordFromCfg(317282109)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282109", "story_v_out_317282.awb") ~= 0 then
					local var_442_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282109", "story_v_out_317282.awb") / 1000

					if var_442_8 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_8 + var_442_0
					end

					if var_442_3.prefab_name ~= "" and arg_439_1.actors_[var_442_3.prefab_name] ~= nil then
						local var_442_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_3.prefab_name].transform, "story_v_out_317282", "317282109", "story_v_out_317282.awb")

						arg_439_1:RecordAudio("317282109", var_442_9)
						arg_439_1:RecordAudio("317282109", var_442_9)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_317282", "317282109", "story_v_out_317282.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_317282", "317282109", "story_v_out_317282.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_10 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_10 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_10

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_10 and arg_439_1.time_ < var_442_0 + var_442_10 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play317282110 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 317282110
		arg_443_1.duration_ = 8.066

		local var_443_0 = {
			zh = 8.066,
			ja = 6.866
		}
		local var_443_1 = manager.audio:GetLocalizationFlag()

		if var_443_0[var_443_1] ~= nil then
			arg_443_1.duration_ = var_443_0[var_443_1]
		end

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play317282111(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0
			local var_446_1 = 1.075

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_2 = arg_443_1:FormatText(StoryNameCfg[479].name)

				arg_443_1.leftNameTxt_.text = var_446_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_3 = arg_443_1:GetWordFromCfg(317282110)
				local var_446_4 = arg_443_1:FormatText(var_446_3.content)

				arg_443_1.text_.text = var_446_4

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282110", "story_v_out_317282.awb") ~= 0 then
					local var_446_8 = manager.audio:GetVoiceLength("story_v_out_317282", "317282110", "story_v_out_317282.awb") / 1000

					if var_446_8 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_8 + var_446_0
					end

					if var_446_3.prefab_name ~= "" and arg_443_1.actors_[var_446_3.prefab_name] ~= nil then
						local var_446_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_3.prefab_name].transform, "story_v_out_317282", "317282110", "story_v_out_317282.awb")

						arg_443_1:RecordAudio("317282110", var_446_9)
						arg_443_1:RecordAudio("317282110", var_446_9)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_317282", "317282110", "story_v_out_317282.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_317282", "317282110", "story_v_out_317282.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_10 = math.max(var_446_1, arg_443_1.talkMaxDuration)

			if var_446_0 <= arg_443_1.time_ and arg_443_1.time_ < var_446_0 + var_446_10 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_0) / var_446_10

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_0 + var_446_10 and arg_443_1.time_ < var_446_0 + var_446_10 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play317282111 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 317282111
		arg_447_1.duration_ = 7.233

		local var_447_0 = {
			zh = 4.7,
			ja = 7.233
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
				arg_447_0:Play317282112(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["1015ui_story"].transform
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				arg_447_1.var_.moveOldPos1015ui_story = var_450_0.localPosition
			end

			local var_450_2 = 0.001

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2
				local var_450_4 = Vector3.New(0, 100, 0)

				var_450_0.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos1015ui_story, var_450_4, var_450_3)

				local var_450_5 = manager.ui.mainCamera.transform.position - var_450_0.position

				var_450_0.forward = Vector3.New(var_450_5.x, var_450_5.y, var_450_5.z)

				local var_450_6 = var_450_0.localEulerAngles

				var_450_6.z = 0
				var_450_6.x = 0
				var_450_0.localEulerAngles = var_450_6
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 then
				var_450_0.localPosition = Vector3.New(0, 100, 0)

				local var_450_7 = manager.ui.mainCamera.transform.position - var_450_0.position

				var_450_0.forward = Vector3.New(var_450_7.x, var_450_7.y, var_450_7.z)

				local var_450_8 = var_450_0.localEulerAngles

				var_450_8.z = 0
				var_450_8.x = 0
				var_450_0.localEulerAngles = var_450_8
			end

			local var_450_9 = arg_447_1.actors_["1015ui_story"]
			local var_450_10 = 0

			if var_450_10 < arg_447_1.time_ and arg_447_1.time_ <= var_450_10 + arg_450_0 and arg_447_1.var_.characterEffect1015ui_story == nil then
				arg_447_1.var_.characterEffect1015ui_story = var_450_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_11 = 0.200000002980232

			if var_450_10 <= arg_447_1.time_ and arg_447_1.time_ < var_450_10 + var_450_11 then
				local var_450_12 = (arg_447_1.time_ - var_450_10) / var_450_11

				if arg_447_1.var_.characterEffect1015ui_story then
					local var_450_13 = Mathf.Lerp(0, 0.5, var_450_12)

					arg_447_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_447_1.var_.characterEffect1015ui_story.fillRatio = var_450_13
				end
			end

			if arg_447_1.time_ >= var_450_10 + var_450_11 and arg_447_1.time_ < var_450_10 + var_450_11 + arg_450_0 and arg_447_1.var_.characterEffect1015ui_story then
				local var_450_14 = 0.5

				arg_447_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_447_1.var_.characterEffect1015ui_story.fillRatio = var_450_14
			end

			local var_450_15 = arg_447_1.actors_["1199ui_story"].transform
			local var_450_16 = 0

			if var_450_16 < arg_447_1.time_ and arg_447_1.time_ <= var_450_16 + arg_450_0 then
				arg_447_1.var_.moveOldPos1199ui_story = var_450_15.localPosition
			end

			local var_450_17 = 0.001

			if var_450_16 <= arg_447_1.time_ and arg_447_1.time_ < var_450_16 + var_450_17 then
				local var_450_18 = (arg_447_1.time_ - var_450_16) / var_450_17
				local var_450_19 = Vector3.New(0, -1.08, -5.9)

				var_450_15.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos1199ui_story, var_450_19, var_450_18)

				local var_450_20 = manager.ui.mainCamera.transform.position - var_450_15.position

				var_450_15.forward = Vector3.New(var_450_20.x, var_450_20.y, var_450_20.z)

				local var_450_21 = var_450_15.localEulerAngles

				var_450_21.z = 0
				var_450_21.x = 0
				var_450_15.localEulerAngles = var_450_21
			end

			if arg_447_1.time_ >= var_450_16 + var_450_17 and arg_447_1.time_ < var_450_16 + var_450_17 + arg_450_0 then
				var_450_15.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_450_22 = manager.ui.mainCamera.transform.position - var_450_15.position

				var_450_15.forward = Vector3.New(var_450_22.x, var_450_22.y, var_450_22.z)

				local var_450_23 = var_450_15.localEulerAngles

				var_450_23.z = 0
				var_450_23.x = 0
				var_450_15.localEulerAngles = var_450_23
			end

			local var_450_24 = arg_447_1.actors_["1199ui_story"]
			local var_450_25 = 0

			if var_450_25 < arg_447_1.time_ and arg_447_1.time_ <= var_450_25 + arg_450_0 and arg_447_1.var_.characterEffect1199ui_story == nil then
				arg_447_1.var_.characterEffect1199ui_story = var_450_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_26 = 0.200000002980232

			if var_450_25 <= arg_447_1.time_ and arg_447_1.time_ < var_450_25 + var_450_26 then
				local var_450_27 = (arg_447_1.time_ - var_450_25) / var_450_26

				if arg_447_1.var_.characterEffect1199ui_story then
					arg_447_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_447_1.time_ >= var_450_25 + var_450_26 and arg_447_1.time_ < var_450_25 + var_450_26 + arg_450_0 and arg_447_1.var_.characterEffect1199ui_story then
				arg_447_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_450_28 = 0

			if var_450_28 < arg_447_1.time_ and arg_447_1.time_ <= var_450_28 + arg_450_0 then
				arg_447_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_1")
			end

			local var_450_29 = 0

			if var_450_29 < arg_447_1.time_ and arg_447_1.time_ <= var_450_29 + arg_450_0 then
				arg_447_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_450_30 = 0
			local var_450_31 = 0.65

			if var_450_30 < arg_447_1.time_ and arg_447_1.time_ <= var_450_30 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_32 = arg_447_1:FormatText(StoryNameCfg[84].name)

				arg_447_1.leftNameTxt_.text = var_450_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_33 = arg_447_1:GetWordFromCfg(317282111)
				local var_450_34 = arg_447_1:FormatText(var_450_33.content)

				arg_447_1.text_.text = var_450_34

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_35 = 26
				local var_450_36 = utf8.len(var_450_34)
				local var_450_37 = var_450_35 <= 0 and var_450_31 or var_450_31 * (var_450_36 / var_450_35)

				if var_450_37 > 0 and var_450_31 < var_450_37 then
					arg_447_1.talkMaxDuration = var_450_37

					if var_450_37 + var_450_30 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_37 + var_450_30
					end
				end

				arg_447_1.text_.text = var_450_34
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282111", "story_v_out_317282.awb") ~= 0 then
					local var_450_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282111", "story_v_out_317282.awb") / 1000

					if var_450_38 + var_450_30 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_38 + var_450_30
					end

					if var_450_33.prefab_name ~= "" and arg_447_1.actors_[var_450_33.prefab_name] ~= nil then
						local var_450_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_33.prefab_name].transform, "story_v_out_317282", "317282111", "story_v_out_317282.awb")

						arg_447_1:RecordAudio("317282111", var_450_39)
						arg_447_1:RecordAudio("317282111", var_450_39)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_317282", "317282111", "story_v_out_317282.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_317282", "317282111", "story_v_out_317282.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_40 = math.max(var_450_31, arg_447_1.talkMaxDuration)

			if var_450_30 <= arg_447_1.time_ and arg_447_1.time_ < var_450_30 + var_450_40 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_30) / var_450_40

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_30 + var_450_40 and arg_447_1.time_ < var_450_30 + var_450_40 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play317282112 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 317282112
		arg_451_1.duration_ = 8.8

		local var_451_0 = {
			zh = 5.3,
			ja = 8.8
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
				arg_451_0:Play317282113(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["1015ui_story"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos1015ui_story = var_454_0.localPosition
			end

			local var_454_2 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2
				local var_454_4 = Vector3.New(0, -1.15, -6.2)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1015ui_story, var_454_4, var_454_3)

				local var_454_5 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_5.x, var_454_5.y, var_454_5.z)

				local var_454_6 = var_454_0.localEulerAngles

				var_454_6.z = 0
				var_454_6.x = 0
				var_454_0.localEulerAngles = var_454_6
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_454_7 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_7.x, var_454_7.y, var_454_7.z)

				local var_454_8 = var_454_0.localEulerAngles

				var_454_8.z = 0
				var_454_8.x = 0
				var_454_0.localEulerAngles = var_454_8
			end

			local var_454_9 = arg_451_1.actors_["1015ui_story"]
			local var_454_10 = 0

			if var_454_10 < arg_451_1.time_ and arg_451_1.time_ <= var_454_10 + arg_454_0 and arg_451_1.var_.characterEffect1015ui_story == nil then
				arg_451_1.var_.characterEffect1015ui_story = var_454_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_11 = 0.200000002980232

			if var_454_10 <= arg_451_1.time_ and arg_451_1.time_ < var_454_10 + var_454_11 then
				local var_454_12 = (arg_451_1.time_ - var_454_10) / var_454_11

				if arg_451_1.var_.characterEffect1015ui_story then
					arg_451_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_451_1.time_ >= var_454_10 + var_454_11 and arg_451_1.time_ < var_454_10 + var_454_11 + arg_454_0 and arg_451_1.var_.characterEffect1015ui_story then
				arg_451_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_454_13 = 0

			if var_454_13 < arg_451_1.time_ and arg_451_1.time_ <= var_454_13 + arg_454_0 then
				arg_451_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_454_14 = 0

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				arg_451_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_454_15 = arg_451_1.actors_["1199ui_story"].transform
			local var_454_16 = 0

			if var_454_16 < arg_451_1.time_ and arg_451_1.time_ <= var_454_16 + arg_454_0 then
				arg_451_1.var_.moveOldPos1199ui_story = var_454_15.localPosition
			end

			local var_454_17 = 0.001

			if var_454_16 <= arg_451_1.time_ and arg_451_1.time_ < var_454_16 + var_454_17 then
				local var_454_18 = (arg_451_1.time_ - var_454_16) / var_454_17
				local var_454_19 = Vector3.New(0, 100, 0)

				var_454_15.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1199ui_story, var_454_19, var_454_18)

				local var_454_20 = manager.ui.mainCamera.transform.position - var_454_15.position

				var_454_15.forward = Vector3.New(var_454_20.x, var_454_20.y, var_454_20.z)

				local var_454_21 = var_454_15.localEulerAngles

				var_454_21.z = 0
				var_454_21.x = 0
				var_454_15.localEulerAngles = var_454_21
			end

			if arg_451_1.time_ >= var_454_16 + var_454_17 and arg_451_1.time_ < var_454_16 + var_454_17 + arg_454_0 then
				var_454_15.localPosition = Vector3.New(0, 100, 0)

				local var_454_22 = manager.ui.mainCamera.transform.position - var_454_15.position

				var_454_15.forward = Vector3.New(var_454_22.x, var_454_22.y, var_454_22.z)

				local var_454_23 = var_454_15.localEulerAngles

				var_454_23.z = 0
				var_454_23.x = 0
				var_454_15.localEulerAngles = var_454_23
			end

			local var_454_24 = arg_451_1.actors_["1199ui_story"]
			local var_454_25 = 0

			if var_454_25 < arg_451_1.time_ and arg_451_1.time_ <= var_454_25 + arg_454_0 and arg_451_1.var_.characterEffect1199ui_story == nil then
				arg_451_1.var_.characterEffect1199ui_story = var_454_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_26 = 0.200000002980232

			if var_454_25 <= arg_451_1.time_ and arg_451_1.time_ < var_454_25 + var_454_26 then
				local var_454_27 = (arg_451_1.time_ - var_454_25) / var_454_26

				if arg_451_1.var_.characterEffect1199ui_story then
					local var_454_28 = Mathf.Lerp(0, 0.5, var_454_27)

					arg_451_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_451_1.var_.characterEffect1199ui_story.fillRatio = var_454_28
				end
			end

			if arg_451_1.time_ >= var_454_25 + var_454_26 and arg_451_1.time_ < var_454_25 + var_454_26 + arg_454_0 and arg_451_1.var_.characterEffect1199ui_story then
				local var_454_29 = 0.5

				arg_451_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_451_1.var_.characterEffect1199ui_story.fillRatio = var_454_29
			end

			local var_454_30 = 0
			local var_454_31 = 0.7

			if var_454_30 < arg_451_1.time_ and arg_451_1.time_ <= var_454_30 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_32 = arg_451_1:FormatText(StoryNameCfg[479].name)

				arg_451_1.leftNameTxt_.text = var_454_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_33 = arg_451_1:GetWordFromCfg(317282112)
				local var_454_34 = arg_451_1:FormatText(var_454_33.content)

				arg_451_1.text_.text = var_454_34

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_35 = 28
				local var_454_36 = utf8.len(var_454_34)
				local var_454_37 = var_454_35 <= 0 and var_454_31 or var_454_31 * (var_454_36 / var_454_35)

				if var_454_37 > 0 and var_454_31 < var_454_37 then
					arg_451_1.talkMaxDuration = var_454_37

					if var_454_37 + var_454_30 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_37 + var_454_30
					end
				end

				arg_451_1.text_.text = var_454_34
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282112", "story_v_out_317282.awb") ~= 0 then
					local var_454_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282112", "story_v_out_317282.awb") / 1000

					if var_454_38 + var_454_30 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_38 + var_454_30
					end

					if var_454_33.prefab_name ~= "" and arg_451_1.actors_[var_454_33.prefab_name] ~= nil then
						local var_454_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_33.prefab_name].transform, "story_v_out_317282", "317282112", "story_v_out_317282.awb")

						arg_451_1:RecordAudio("317282112", var_454_39)
						arg_451_1:RecordAudio("317282112", var_454_39)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_317282", "317282112", "story_v_out_317282.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_317282", "317282112", "story_v_out_317282.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_40 = math.max(var_454_31, arg_451_1.talkMaxDuration)

			if var_454_30 <= arg_451_1.time_ and arg_451_1.time_ < var_454_30 + var_454_40 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_30) / var_454_40

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_30 + var_454_40 and arg_451_1.time_ < var_454_30 + var_454_40 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play317282113 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 317282113
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play317282114(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["1015ui_story"]
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 and arg_455_1.var_.characterEffect1015ui_story == nil then
				arg_455_1.var_.characterEffect1015ui_story = var_458_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_2 = 0.200000002980232

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2

				if arg_455_1.var_.characterEffect1015ui_story then
					local var_458_4 = Mathf.Lerp(0, 0.5, var_458_3)

					arg_455_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_455_1.var_.characterEffect1015ui_story.fillRatio = var_458_4
				end
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 and arg_455_1.var_.characterEffect1015ui_story then
				local var_458_5 = 0.5

				arg_455_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_455_1.var_.characterEffect1015ui_story.fillRatio = var_458_5
			end

			local var_458_6 = 0
			local var_458_7 = 0.65

			if var_458_6 < arg_455_1.time_ and arg_455_1.time_ <= var_458_6 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_8 = arg_455_1:FormatText(StoryNameCfg[7].name)

				arg_455_1.leftNameTxt_.text = var_458_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_9 = arg_455_1:GetWordFromCfg(317282113)
				local var_458_10 = arg_455_1:FormatText(var_458_9.content)

				arg_455_1.text_.text = var_458_10

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_11 = 26
				local var_458_12 = utf8.len(var_458_10)
				local var_458_13 = var_458_11 <= 0 and var_458_7 or var_458_7 * (var_458_12 / var_458_11)

				if var_458_13 > 0 and var_458_7 < var_458_13 then
					arg_455_1.talkMaxDuration = var_458_13

					if var_458_13 + var_458_6 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_13 + var_458_6
					end
				end

				arg_455_1.text_.text = var_458_10
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_14 = math.max(var_458_7, arg_455_1.talkMaxDuration)

			if var_458_6 <= arg_455_1.time_ and arg_455_1.time_ < var_458_6 + var_458_14 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_6) / var_458_14

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_6 + var_458_14 and arg_455_1.time_ < var_458_6 + var_458_14 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play317282114 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 317282114
		arg_459_1.duration_ = 7.1

		local var_459_0 = {
			zh = 7.1,
			ja = 5.166
		}
		local var_459_1 = manager.audio:GetLocalizationFlag()

		if var_459_0[var_459_1] ~= nil then
			arg_459_1.duration_ = var_459_0[var_459_1]
		end

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play317282115(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1015ui_story"].transform
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.var_.moveOldPos1015ui_story = var_462_0.localPosition
			end

			local var_462_2 = 0.001

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2
				local var_462_4 = Vector3.New(0, -1.15, -6.2)

				var_462_0.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos1015ui_story, var_462_4, var_462_3)

				local var_462_5 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_5.x, var_462_5.y, var_462_5.z)

				local var_462_6 = var_462_0.localEulerAngles

				var_462_6.z = 0
				var_462_6.x = 0
				var_462_0.localEulerAngles = var_462_6
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 then
				var_462_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_462_7 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_7.x, var_462_7.y, var_462_7.z)

				local var_462_8 = var_462_0.localEulerAngles

				var_462_8.z = 0
				var_462_8.x = 0
				var_462_0.localEulerAngles = var_462_8
			end

			local var_462_9 = arg_459_1.actors_["1015ui_story"]
			local var_462_10 = 0

			if var_462_10 < arg_459_1.time_ and arg_459_1.time_ <= var_462_10 + arg_462_0 and arg_459_1.var_.characterEffect1015ui_story == nil then
				arg_459_1.var_.characterEffect1015ui_story = var_462_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_11 = 0.200000002980232

			if var_462_10 <= arg_459_1.time_ and arg_459_1.time_ < var_462_10 + var_462_11 then
				local var_462_12 = (arg_459_1.time_ - var_462_10) / var_462_11

				if arg_459_1.var_.characterEffect1015ui_story then
					arg_459_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_459_1.time_ >= var_462_10 + var_462_11 and arg_459_1.time_ < var_462_10 + var_462_11 + arg_462_0 and arg_459_1.var_.characterEffect1015ui_story then
				arg_459_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_462_13 = 0

			if var_462_13 < arg_459_1.time_ and arg_459_1.time_ <= var_462_13 + arg_462_0 then
				arg_459_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_462_14 = 0

			if var_462_14 < arg_459_1.time_ and arg_459_1.time_ <= var_462_14 + arg_462_0 then
				arg_459_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_462_15 = 0
			local var_462_16 = 0.925

			if var_462_15 < arg_459_1.time_ and arg_459_1.time_ <= var_462_15 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_17 = arg_459_1:FormatText(StoryNameCfg[479].name)

				arg_459_1.leftNameTxt_.text = var_462_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_18 = arg_459_1:GetWordFromCfg(317282114)
				local var_462_19 = arg_459_1:FormatText(var_462_18.content)

				arg_459_1.text_.text = var_462_19

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_20 = 37
				local var_462_21 = utf8.len(var_462_19)
				local var_462_22 = var_462_20 <= 0 and var_462_16 or var_462_16 * (var_462_21 / var_462_20)

				if var_462_22 > 0 and var_462_16 < var_462_22 then
					arg_459_1.talkMaxDuration = var_462_22

					if var_462_22 + var_462_15 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_22 + var_462_15
					end
				end

				arg_459_1.text_.text = var_462_19
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282114", "story_v_out_317282.awb") ~= 0 then
					local var_462_23 = manager.audio:GetVoiceLength("story_v_out_317282", "317282114", "story_v_out_317282.awb") / 1000

					if var_462_23 + var_462_15 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_23 + var_462_15
					end

					if var_462_18.prefab_name ~= "" and arg_459_1.actors_[var_462_18.prefab_name] ~= nil then
						local var_462_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_18.prefab_name].transform, "story_v_out_317282", "317282114", "story_v_out_317282.awb")

						arg_459_1:RecordAudio("317282114", var_462_24)
						arg_459_1:RecordAudio("317282114", var_462_24)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_317282", "317282114", "story_v_out_317282.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_317282", "317282114", "story_v_out_317282.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_25 = math.max(var_462_16, arg_459_1.talkMaxDuration)

			if var_462_15 <= arg_459_1.time_ and arg_459_1.time_ < var_462_15 + var_462_25 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_15) / var_462_25

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_15 + var_462_25 and arg_459_1.time_ < var_462_15 + var_462_25 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play317282115 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 317282115
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play317282116(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["1015ui_story"].transform
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.var_.moveOldPos1015ui_story = var_466_0.localPosition
			end

			local var_466_2 = 0.001

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2
				local var_466_4 = Vector3.New(0, 100, 0)

				var_466_0.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos1015ui_story, var_466_4, var_466_3)

				local var_466_5 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_5.x, var_466_5.y, var_466_5.z)

				local var_466_6 = var_466_0.localEulerAngles

				var_466_6.z = 0
				var_466_6.x = 0
				var_466_0.localEulerAngles = var_466_6
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 then
				var_466_0.localPosition = Vector3.New(0, 100, 0)

				local var_466_7 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_7.x, var_466_7.y, var_466_7.z)

				local var_466_8 = var_466_0.localEulerAngles

				var_466_8.z = 0
				var_466_8.x = 0
				var_466_0.localEulerAngles = var_466_8
			end

			local var_466_9 = arg_463_1.actors_["1015ui_story"]
			local var_466_10 = 0

			if var_466_10 < arg_463_1.time_ and arg_463_1.time_ <= var_466_10 + arg_466_0 and arg_463_1.var_.characterEffect1015ui_story == nil then
				arg_463_1.var_.characterEffect1015ui_story = var_466_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_11 = 0.200000002980232

			if var_466_10 <= arg_463_1.time_ and arg_463_1.time_ < var_466_10 + var_466_11 then
				local var_466_12 = (arg_463_1.time_ - var_466_10) / var_466_11

				if arg_463_1.var_.characterEffect1015ui_story then
					local var_466_13 = Mathf.Lerp(0, 0.5, var_466_12)

					arg_463_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_463_1.var_.characterEffect1015ui_story.fillRatio = var_466_13
				end
			end

			if arg_463_1.time_ >= var_466_10 + var_466_11 and arg_463_1.time_ < var_466_10 + var_466_11 + arg_466_0 and arg_463_1.var_.characterEffect1015ui_story then
				local var_466_14 = 0.5

				arg_463_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_463_1.var_.characterEffect1015ui_story.fillRatio = var_466_14
			end

			local var_466_15 = 0
			local var_466_16 = 0.6

			if var_466_15 < arg_463_1.time_ and arg_463_1.time_ <= var_466_15 + arg_466_0 then
				local var_466_17 = "play"
				local var_466_18 = "effect"

				arg_463_1:AudioAction(var_466_17, var_466_18, "se_story", "se_story_communication", "")
			end

			local var_466_19 = 0
			local var_466_20 = 0.725

			if var_466_19 < arg_463_1.time_ and arg_463_1.time_ <= var_466_19 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, false)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_21 = arg_463_1:GetWordFromCfg(317282115)
				local var_466_22 = arg_463_1:FormatText(var_466_21.content)

				arg_463_1.text_.text = var_466_22

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_23 = 29
				local var_466_24 = utf8.len(var_466_22)
				local var_466_25 = var_466_23 <= 0 and var_466_20 or var_466_20 * (var_466_24 / var_466_23)

				if var_466_25 > 0 and var_466_20 < var_466_25 then
					arg_463_1.talkMaxDuration = var_466_25

					if var_466_25 + var_466_19 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_25 + var_466_19
					end
				end

				arg_463_1.text_.text = var_466_22
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_26 = math.max(var_466_20, arg_463_1.talkMaxDuration)

			if var_466_19 <= arg_463_1.time_ and arg_463_1.time_ < var_466_19 + var_466_26 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_19) / var_466_26

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_19 + var_466_26 and arg_463_1.time_ < var_466_19 + var_466_26 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play317282116 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 317282116
		arg_467_1.duration_ = 1.933

		local var_467_0 = {
			zh = 1.9,
			ja = 1.933
		}
		local var_467_1 = manager.audio:GetLocalizationFlag()

		if var_467_0[var_467_1] ~= nil then
			arg_467_1.duration_ = var_467_0[var_467_1]
		end

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play317282117(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["2078ui_story"].transform
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 then
				arg_467_1.var_.moveOldPos2078ui_story = var_470_0.localPosition
			end

			local var_470_2 = 0.001

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2
				local var_470_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_470_0.localPosition = Vector3.Lerp(arg_467_1.var_.moveOldPos2078ui_story, var_470_4, var_470_3)

				local var_470_5 = manager.ui.mainCamera.transform.position - var_470_0.position

				var_470_0.forward = Vector3.New(var_470_5.x, var_470_5.y, var_470_5.z)

				local var_470_6 = var_470_0.localEulerAngles

				var_470_6.z = 0
				var_470_6.x = 0
				var_470_0.localEulerAngles = var_470_6
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 then
				var_470_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_470_7 = manager.ui.mainCamera.transform.position - var_470_0.position

				var_470_0.forward = Vector3.New(var_470_7.x, var_470_7.y, var_470_7.z)

				local var_470_8 = var_470_0.localEulerAngles

				var_470_8.z = 0
				var_470_8.x = 0
				var_470_0.localEulerAngles = var_470_8
			end

			local var_470_9 = arg_467_1.actors_["2078ui_story"]
			local var_470_10 = 0

			if var_470_10 < arg_467_1.time_ and arg_467_1.time_ <= var_470_10 + arg_470_0 and arg_467_1.var_.characterEffect2078ui_story == nil then
				arg_467_1.var_.characterEffect2078ui_story = var_470_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_11 = 0.200000002980232

			if var_470_10 <= arg_467_1.time_ and arg_467_1.time_ < var_470_10 + var_470_11 then
				local var_470_12 = (arg_467_1.time_ - var_470_10) / var_470_11

				if arg_467_1.var_.characterEffect2078ui_story then
					arg_467_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_467_1.time_ >= var_470_10 + var_470_11 and arg_467_1.time_ < var_470_10 + var_470_11 + arg_470_0 and arg_467_1.var_.characterEffect2078ui_story then
				arg_467_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_470_13 = 0

			if var_470_13 < arg_467_1.time_ and arg_467_1.time_ <= var_470_13 + arg_470_0 then
				arg_467_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_470_14 = 0

			if var_470_14 < arg_467_1.time_ and arg_467_1.time_ <= var_470_14 + arg_470_0 then
				arg_467_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_470_15 = 0
			local var_470_16 = 0.25

			if var_470_15 < arg_467_1.time_ and arg_467_1.time_ <= var_470_15 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_17 = arg_467_1:FormatText(StoryNameCfg[528].name)

				arg_467_1.leftNameTxt_.text = var_470_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_18 = arg_467_1:GetWordFromCfg(317282116)
				local var_470_19 = arg_467_1:FormatText(var_470_18.content)

				arg_467_1.text_.text = var_470_19

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_20 = 10
				local var_470_21 = utf8.len(var_470_19)
				local var_470_22 = var_470_20 <= 0 and var_470_16 or var_470_16 * (var_470_21 / var_470_20)

				if var_470_22 > 0 and var_470_16 < var_470_22 then
					arg_467_1.talkMaxDuration = var_470_22

					if var_470_22 + var_470_15 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_22 + var_470_15
					end
				end

				arg_467_1.text_.text = var_470_19
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282116", "story_v_out_317282.awb") ~= 0 then
					local var_470_23 = manager.audio:GetVoiceLength("story_v_out_317282", "317282116", "story_v_out_317282.awb") / 1000

					if var_470_23 + var_470_15 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_23 + var_470_15
					end

					if var_470_18.prefab_name ~= "" and arg_467_1.actors_[var_470_18.prefab_name] ~= nil then
						local var_470_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_18.prefab_name].transform, "story_v_out_317282", "317282116", "story_v_out_317282.awb")

						arg_467_1:RecordAudio("317282116", var_470_24)
						arg_467_1:RecordAudio("317282116", var_470_24)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_317282", "317282116", "story_v_out_317282.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_317282", "317282116", "story_v_out_317282.awb")
				end

				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_25 = math.max(var_470_16, arg_467_1.talkMaxDuration)

			if var_470_15 <= arg_467_1.time_ and arg_467_1.time_ < var_470_15 + var_470_25 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_15) / var_470_25

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_15 + var_470_25 and arg_467_1.time_ < var_470_15 + var_470_25 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play317282117 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 317282117
		arg_471_1.duration_ = 5.5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play317282118(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["2079ui_story"].transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos2079ui_story = var_474_0.localPosition
			end

			local var_474_2 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2
				local var_474_4 = Vector3.New(0.7, -1.28, -5.6)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos2079ui_story, var_474_4, var_474_3)

				local var_474_5 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_5.x, var_474_5.y, var_474_5.z)

				local var_474_6 = var_474_0.localEulerAngles

				var_474_6.z = 0
				var_474_6.x = 0
				var_474_0.localEulerAngles = var_474_6
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_474_7 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_7.x, var_474_7.y, var_474_7.z)

				local var_474_8 = var_474_0.localEulerAngles

				var_474_8.z = 0
				var_474_8.x = 0
				var_474_0.localEulerAngles = var_474_8
			end

			local var_474_9 = arg_471_1.actors_["2079ui_story"]
			local var_474_10 = 0

			if var_474_10 < arg_471_1.time_ and arg_471_1.time_ <= var_474_10 + arg_474_0 and arg_471_1.var_.characterEffect2079ui_story == nil then
				arg_471_1.var_.characterEffect2079ui_story = var_474_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_11 = 0.200000002980232

			if var_474_10 <= arg_471_1.time_ and arg_471_1.time_ < var_474_10 + var_474_11 then
				local var_474_12 = (arg_471_1.time_ - var_474_10) / var_474_11

				if arg_471_1.var_.characterEffect2079ui_story then
					arg_471_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_10 + var_474_11 and arg_471_1.time_ < var_474_10 + var_474_11 + arg_474_0 and arg_471_1.var_.characterEffect2079ui_story then
				arg_471_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_474_13 = 0

			if var_474_13 < arg_471_1.time_ and arg_471_1.time_ <= var_474_13 + arg_474_0 then
				arg_471_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_474_14 = 0

			if var_474_14 < arg_471_1.time_ and arg_471_1.time_ <= var_474_14 + arg_474_0 then
				arg_471_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_474_15 = arg_471_1.actors_["2078ui_story"]
			local var_474_16 = 0

			if var_474_16 < arg_471_1.time_ and arg_471_1.time_ <= var_474_16 + arg_474_0 and arg_471_1.var_.characterEffect2078ui_story == nil then
				arg_471_1.var_.characterEffect2078ui_story = var_474_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_17 = 0.200000002980232

			if var_474_16 <= arg_471_1.time_ and arg_471_1.time_ < var_474_16 + var_474_17 then
				local var_474_18 = (arg_471_1.time_ - var_474_16) / var_474_17

				if arg_471_1.var_.characterEffect2078ui_story then
					local var_474_19 = Mathf.Lerp(0, 0.5, var_474_18)

					arg_471_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_471_1.var_.characterEffect2078ui_story.fillRatio = var_474_19
				end
			end

			if arg_471_1.time_ >= var_474_16 + var_474_17 and arg_471_1.time_ < var_474_16 + var_474_17 + arg_474_0 and arg_471_1.var_.characterEffect2078ui_story then
				local var_474_20 = 0.5

				arg_471_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_471_1.var_.characterEffect2078ui_story.fillRatio = var_474_20
			end

			local var_474_21 = 0
			local var_474_22 = 0.35

			if var_474_21 < arg_471_1.time_ and arg_471_1.time_ <= var_474_21 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_23 = arg_471_1:FormatText(StoryNameCfg[529].name)

				arg_471_1.leftNameTxt_.text = var_474_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_24 = arg_471_1:GetWordFromCfg(317282117)
				local var_474_25 = arg_471_1:FormatText(var_474_24.content)

				arg_471_1.text_.text = var_474_25

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_26 = 14
				local var_474_27 = utf8.len(var_474_25)
				local var_474_28 = var_474_26 <= 0 and var_474_22 or var_474_22 * (var_474_27 / var_474_26)

				if var_474_28 > 0 and var_474_22 < var_474_28 then
					arg_471_1.talkMaxDuration = var_474_28

					if var_474_28 + var_474_21 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_28 + var_474_21
					end
				end

				arg_471_1.text_.text = var_474_25
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282117", "story_v_out_317282.awb") ~= 0 then
					local var_474_29 = manager.audio:GetVoiceLength("story_v_out_317282", "317282117", "story_v_out_317282.awb") / 1000

					if var_474_29 + var_474_21 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_29 + var_474_21
					end

					if var_474_24.prefab_name ~= "" and arg_471_1.actors_[var_474_24.prefab_name] ~= nil then
						local var_474_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_24.prefab_name].transform, "story_v_out_317282", "317282117", "story_v_out_317282.awb")

						arg_471_1:RecordAudio("317282117", var_474_30)
						arg_471_1:RecordAudio("317282117", var_474_30)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_317282", "317282117", "story_v_out_317282.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_317282", "317282117", "story_v_out_317282.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_31 = math.max(var_474_22, arg_471_1.talkMaxDuration)

			if var_474_21 <= arg_471_1.time_ and arg_471_1.time_ < var_474_21 + var_474_31 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_21) / var_474_31

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_21 + var_474_31 and arg_471_1.time_ < var_474_21 + var_474_31 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play317282118 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 317282118
		arg_475_1.duration_ = 5.1

		local var_475_0 = {
			zh = 2.233,
			ja = 5.1
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play317282119(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["2078ui_story"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos2078ui_story = var_478_0.localPosition
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, 100, 0)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos2078ui_story, var_478_4, var_478_3)

				local var_478_5 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_5.x, var_478_5.y, var_478_5.z)

				local var_478_6 = var_478_0.localEulerAngles

				var_478_6.z = 0
				var_478_6.x = 0
				var_478_0.localEulerAngles = var_478_6
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, 100, 0)

				local var_478_7 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_7.x, var_478_7.y, var_478_7.z)

				local var_478_8 = var_478_0.localEulerAngles

				var_478_8.z = 0
				var_478_8.x = 0
				var_478_0.localEulerAngles = var_478_8
			end

			local var_478_9 = 0

			if var_478_9 < arg_475_1.time_ and arg_475_1.time_ <= var_478_9 + arg_478_0 then
				arg_475_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_478_10 = arg_475_1.actors_["2079ui_story"].transform
			local var_478_11 = 0

			if var_478_11 < arg_475_1.time_ and arg_475_1.time_ <= var_478_11 + arg_478_0 then
				arg_475_1.var_.moveOldPos2079ui_story = var_478_10.localPosition
			end

			local var_478_12 = 0.001

			if var_478_11 <= arg_475_1.time_ and arg_475_1.time_ < var_478_11 + var_478_12 then
				local var_478_13 = (arg_475_1.time_ - var_478_11) / var_478_12
				local var_478_14 = Vector3.New(0, -1.28, -5.6)

				var_478_10.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos2079ui_story, var_478_14, var_478_13)

				local var_478_15 = manager.ui.mainCamera.transform.position - var_478_10.position

				var_478_10.forward = Vector3.New(var_478_15.x, var_478_15.y, var_478_15.z)

				local var_478_16 = var_478_10.localEulerAngles

				var_478_16.z = 0
				var_478_16.x = 0
				var_478_10.localEulerAngles = var_478_16
			end

			if arg_475_1.time_ >= var_478_11 + var_478_12 and arg_475_1.time_ < var_478_11 + var_478_12 + arg_478_0 then
				var_478_10.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_478_17 = manager.ui.mainCamera.transform.position - var_478_10.position

				var_478_10.forward = Vector3.New(var_478_17.x, var_478_17.y, var_478_17.z)

				local var_478_18 = var_478_10.localEulerAngles

				var_478_18.z = 0
				var_478_18.x = 0
				var_478_10.localEulerAngles = var_478_18
			end

			local var_478_19 = arg_475_1.actors_["2079ui_story"]
			local var_478_20 = 0

			if var_478_20 < arg_475_1.time_ and arg_475_1.time_ <= var_478_20 + arg_478_0 and arg_475_1.var_.characterEffect2079ui_story == nil then
				arg_475_1.var_.characterEffect2079ui_story = var_478_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_21 = 0.200000002980232

			if var_478_20 <= arg_475_1.time_ and arg_475_1.time_ < var_478_20 + var_478_21 then
				local var_478_22 = (arg_475_1.time_ - var_478_20) / var_478_21

				if arg_475_1.var_.characterEffect2079ui_story then
					arg_475_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_475_1.time_ >= var_478_20 + var_478_21 and arg_475_1.time_ < var_478_20 + var_478_21 + arg_478_0 and arg_475_1.var_.characterEffect2079ui_story then
				arg_475_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_478_23 = 0
			local var_478_24 = 0.15

			if var_478_23 < arg_475_1.time_ and arg_475_1.time_ <= var_478_23 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_25 = arg_475_1:FormatText(StoryNameCfg[530].name)

				arg_475_1.leftNameTxt_.text = var_478_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_26 = arg_475_1:GetWordFromCfg(317282118)
				local var_478_27 = arg_475_1:FormatText(var_478_26.content)

				arg_475_1.text_.text = var_478_27

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_28 = 6
				local var_478_29 = utf8.len(var_478_27)
				local var_478_30 = var_478_28 <= 0 and var_478_24 or var_478_24 * (var_478_29 / var_478_28)

				if var_478_30 > 0 and var_478_24 < var_478_30 then
					arg_475_1.talkMaxDuration = var_478_30

					if var_478_30 + var_478_23 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_30 + var_478_23
					end
				end

				arg_475_1.text_.text = var_478_27
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282118", "story_v_out_317282.awb") ~= 0 then
					local var_478_31 = manager.audio:GetVoiceLength("story_v_out_317282", "317282118", "story_v_out_317282.awb") / 1000

					if var_478_31 + var_478_23 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_31 + var_478_23
					end

					if var_478_26.prefab_name ~= "" and arg_475_1.actors_[var_478_26.prefab_name] ~= nil then
						local var_478_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_26.prefab_name].transform, "story_v_out_317282", "317282118", "story_v_out_317282.awb")

						arg_475_1:RecordAudio("317282118", var_478_32)
						arg_475_1:RecordAudio("317282118", var_478_32)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_317282", "317282118", "story_v_out_317282.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_317282", "317282118", "story_v_out_317282.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_33 = math.max(var_478_24, arg_475_1.talkMaxDuration)

			if var_478_23 <= arg_475_1.time_ and arg_475_1.time_ < var_478_23 + var_478_33 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_23) / var_478_33

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_23 + var_478_33 and arg_475_1.time_ < var_478_23 + var_478_33 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play317282119 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 317282119
		arg_479_1.duration_ = 3.6

		local var_479_0 = {
			zh = 2.566,
			ja = 3.6
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play317282120(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["1015ui_story"].transform
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1.var_.moveOldPos1015ui_story = var_482_0.localPosition
			end

			local var_482_2 = 0.001

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2
				local var_482_4 = Vector3.New(0, -1.15, -6.2)

				var_482_0.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1015ui_story, var_482_4, var_482_3)

				local var_482_5 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_5.x, var_482_5.y, var_482_5.z)

				local var_482_6 = var_482_0.localEulerAngles

				var_482_6.z = 0
				var_482_6.x = 0
				var_482_0.localEulerAngles = var_482_6
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 then
				var_482_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_482_7 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_7.x, var_482_7.y, var_482_7.z)

				local var_482_8 = var_482_0.localEulerAngles

				var_482_8.z = 0
				var_482_8.x = 0
				var_482_0.localEulerAngles = var_482_8
			end

			local var_482_9 = arg_479_1.actors_["1015ui_story"]
			local var_482_10 = 0

			if var_482_10 < arg_479_1.time_ and arg_479_1.time_ <= var_482_10 + arg_482_0 and arg_479_1.var_.characterEffect1015ui_story == nil then
				arg_479_1.var_.characterEffect1015ui_story = var_482_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_11 = 0.200000002980232

			if var_482_10 <= arg_479_1.time_ and arg_479_1.time_ < var_482_10 + var_482_11 then
				local var_482_12 = (arg_479_1.time_ - var_482_10) / var_482_11

				if arg_479_1.var_.characterEffect1015ui_story then
					arg_479_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_10 + var_482_11 and arg_479_1.time_ < var_482_10 + var_482_11 + arg_482_0 and arg_479_1.var_.characterEffect1015ui_story then
				arg_479_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_482_13 = 0

			if var_482_13 < arg_479_1.time_ and arg_479_1.time_ <= var_482_13 + arg_482_0 then
				arg_479_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_482_14 = 0

			if var_482_14 < arg_479_1.time_ and arg_479_1.time_ <= var_482_14 + arg_482_0 then
				arg_479_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_482_15 = arg_479_1.actors_["2079ui_story"].transform
			local var_482_16 = 0

			if var_482_16 < arg_479_1.time_ and arg_479_1.time_ <= var_482_16 + arg_482_0 then
				arg_479_1.var_.moveOldPos2079ui_story = var_482_15.localPosition
			end

			local var_482_17 = 0.001

			if var_482_16 <= arg_479_1.time_ and arg_479_1.time_ < var_482_16 + var_482_17 then
				local var_482_18 = (arg_479_1.time_ - var_482_16) / var_482_17
				local var_482_19 = Vector3.New(0, 100, 0)

				var_482_15.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos2079ui_story, var_482_19, var_482_18)

				local var_482_20 = manager.ui.mainCamera.transform.position - var_482_15.position

				var_482_15.forward = Vector3.New(var_482_20.x, var_482_20.y, var_482_20.z)

				local var_482_21 = var_482_15.localEulerAngles

				var_482_21.z = 0
				var_482_21.x = 0
				var_482_15.localEulerAngles = var_482_21
			end

			if arg_479_1.time_ >= var_482_16 + var_482_17 and arg_479_1.time_ < var_482_16 + var_482_17 + arg_482_0 then
				var_482_15.localPosition = Vector3.New(0, 100, 0)

				local var_482_22 = manager.ui.mainCamera.transform.position - var_482_15.position

				var_482_15.forward = Vector3.New(var_482_22.x, var_482_22.y, var_482_22.z)

				local var_482_23 = var_482_15.localEulerAngles

				var_482_23.z = 0
				var_482_23.x = 0
				var_482_15.localEulerAngles = var_482_23
			end

			local var_482_24 = arg_479_1.actors_["2078ui_story"]
			local var_482_25 = 0

			if var_482_25 < arg_479_1.time_ and arg_479_1.time_ <= var_482_25 + arg_482_0 and arg_479_1.var_.characterEffect2078ui_story == nil then
				arg_479_1.var_.characterEffect2078ui_story = var_482_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_26 = 0.200000002980232

			if var_482_25 <= arg_479_1.time_ and arg_479_1.time_ < var_482_25 + var_482_26 then
				local var_482_27 = (arg_479_1.time_ - var_482_25) / var_482_26

				if arg_479_1.var_.characterEffect2078ui_story then
					local var_482_28 = Mathf.Lerp(0, 0.5, var_482_27)

					arg_479_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_479_1.var_.characterEffect2078ui_story.fillRatio = var_482_28
				end
			end

			if arg_479_1.time_ >= var_482_25 + var_482_26 and arg_479_1.time_ < var_482_25 + var_482_26 + arg_482_0 and arg_479_1.var_.characterEffect2078ui_story then
				local var_482_29 = 0.5

				arg_479_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_479_1.var_.characterEffect2078ui_story.fillRatio = var_482_29
			end

			local var_482_30 = 0
			local var_482_31 = 0.35

			if var_482_30 < arg_479_1.time_ and arg_479_1.time_ <= var_482_30 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_32 = arg_479_1:FormatText(StoryNameCfg[479].name)

				arg_479_1.leftNameTxt_.text = var_482_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_33 = arg_479_1:GetWordFromCfg(317282119)
				local var_482_34 = arg_479_1:FormatText(var_482_33.content)

				arg_479_1.text_.text = var_482_34

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_35 = 14
				local var_482_36 = utf8.len(var_482_34)
				local var_482_37 = var_482_35 <= 0 and var_482_31 or var_482_31 * (var_482_36 / var_482_35)

				if var_482_37 > 0 and var_482_31 < var_482_37 then
					arg_479_1.talkMaxDuration = var_482_37

					if var_482_37 + var_482_30 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_37 + var_482_30
					end
				end

				arg_479_1.text_.text = var_482_34
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282119", "story_v_out_317282.awb") ~= 0 then
					local var_482_38 = manager.audio:GetVoiceLength("story_v_out_317282", "317282119", "story_v_out_317282.awb") / 1000

					if var_482_38 + var_482_30 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_38 + var_482_30
					end

					if var_482_33.prefab_name ~= "" and arg_479_1.actors_[var_482_33.prefab_name] ~= nil then
						local var_482_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_33.prefab_name].transform, "story_v_out_317282", "317282119", "story_v_out_317282.awb")

						arg_479_1:RecordAudio("317282119", var_482_39)
						arg_479_1:RecordAudio("317282119", var_482_39)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_317282", "317282119", "story_v_out_317282.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_317282", "317282119", "story_v_out_317282.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_40 = math.max(var_482_31, arg_479_1.talkMaxDuration)

			if var_482_30 <= arg_479_1.time_ and arg_479_1.time_ < var_482_30 + var_482_40 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_30) / var_482_40

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_30 + var_482_40 and arg_479_1.time_ < var_482_30 + var_482_40 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play317282120 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 317282120
		arg_483_1.duration_ = 7.733

		local var_483_0 = {
			zh = 7.733,
			ja = 7.066
		}
		local var_483_1 = manager.audio:GetLocalizationFlag()

		if var_483_0[var_483_1] ~= nil then
			arg_483_1.duration_ = var_483_0[var_483_1]
		end

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play317282121(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1015ui_story"].transform
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos1015ui_story = var_486_0.localPosition
			end

			local var_486_2 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2
				local var_486_4 = Vector3.New(0, 100, 0)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos1015ui_story, var_486_4, var_486_3)

				local var_486_5 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_5.x, var_486_5.y, var_486_5.z)

				local var_486_6 = var_486_0.localEulerAngles

				var_486_6.z = 0
				var_486_6.x = 0
				var_486_0.localEulerAngles = var_486_6
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(0, 100, 0)

				local var_486_7 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_7.x, var_486_7.y, var_486_7.z)

				local var_486_8 = var_486_0.localEulerAngles

				var_486_8.z = 0
				var_486_8.x = 0
				var_486_0.localEulerAngles = var_486_8
			end

			local var_486_9 = 0

			if var_486_9 < arg_483_1.time_ and arg_483_1.time_ <= var_486_9 + arg_486_0 then
				arg_483_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_486_10 = arg_483_1.actors_["2079ui_story"].transform
			local var_486_11 = 0

			if var_486_11 < arg_483_1.time_ and arg_483_1.time_ <= var_486_11 + arg_486_0 then
				arg_483_1.var_.moveOldPos2079ui_story = var_486_10.localPosition
			end

			local var_486_12 = 0.001

			if var_486_11 <= arg_483_1.time_ and arg_483_1.time_ < var_486_11 + var_486_12 then
				local var_486_13 = (arg_483_1.time_ - var_486_11) / var_486_12
				local var_486_14 = Vector3.New(0, -1.28, -5.6)

				var_486_10.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos2079ui_story, var_486_14, var_486_13)

				local var_486_15 = manager.ui.mainCamera.transform.position - var_486_10.position

				var_486_10.forward = Vector3.New(var_486_15.x, var_486_15.y, var_486_15.z)

				local var_486_16 = var_486_10.localEulerAngles

				var_486_16.z = 0
				var_486_16.x = 0
				var_486_10.localEulerAngles = var_486_16
			end

			if arg_483_1.time_ >= var_486_11 + var_486_12 and arg_483_1.time_ < var_486_11 + var_486_12 + arg_486_0 then
				var_486_10.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_486_17 = manager.ui.mainCamera.transform.position - var_486_10.position

				var_486_10.forward = Vector3.New(var_486_17.x, var_486_17.y, var_486_17.z)

				local var_486_18 = var_486_10.localEulerAngles

				var_486_18.z = 0
				var_486_18.x = 0
				var_486_10.localEulerAngles = var_486_18
			end

			local var_486_19 = arg_483_1.actors_["2079ui_story"]
			local var_486_20 = 0

			if var_486_20 < arg_483_1.time_ and arg_483_1.time_ <= var_486_20 + arg_486_0 and arg_483_1.var_.characterEffect2079ui_story == nil then
				arg_483_1.var_.characterEffect2079ui_story = var_486_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_21 = 0.200000002980232

			if var_486_20 <= arg_483_1.time_ and arg_483_1.time_ < var_486_20 + var_486_21 then
				local var_486_22 = (arg_483_1.time_ - var_486_20) / var_486_21

				if arg_483_1.var_.characterEffect2079ui_story then
					arg_483_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_483_1.time_ >= var_486_20 + var_486_21 and arg_483_1.time_ < var_486_20 + var_486_21 + arg_486_0 and arg_483_1.var_.characterEffect2079ui_story then
				arg_483_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_486_23 = 0
			local var_486_24 = 0.6

			if var_486_23 < arg_483_1.time_ and arg_483_1.time_ <= var_486_23 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_25 = arg_483_1:FormatText(StoryNameCfg[530].name)

				arg_483_1.leftNameTxt_.text = var_486_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_26 = arg_483_1:GetWordFromCfg(317282120)
				local var_486_27 = arg_483_1:FormatText(var_486_26.content)

				arg_483_1.text_.text = var_486_27

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_28 = 24
				local var_486_29 = utf8.len(var_486_27)
				local var_486_30 = var_486_28 <= 0 and var_486_24 or var_486_24 * (var_486_29 / var_486_28)

				if var_486_30 > 0 and var_486_24 < var_486_30 then
					arg_483_1.talkMaxDuration = var_486_30

					if var_486_30 + var_486_23 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_30 + var_486_23
					end
				end

				arg_483_1.text_.text = var_486_27
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282120", "story_v_out_317282.awb") ~= 0 then
					local var_486_31 = manager.audio:GetVoiceLength("story_v_out_317282", "317282120", "story_v_out_317282.awb") / 1000

					if var_486_31 + var_486_23 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_31 + var_486_23
					end

					if var_486_26.prefab_name ~= "" and arg_483_1.actors_[var_486_26.prefab_name] ~= nil then
						local var_486_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_26.prefab_name].transform, "story_v_out_317282", "317282120", "story_v_out_317282.awb")

						arg_483_1:RecordAudio("317282120", var_486_32)
						arg_483_1:RecordAudio("317282120", var_486_32)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_out_317282", "317282120", "story_v_out_317282.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_out_317282", "317282120", "story_v_out_317282.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_33 = math.max(var_486_24, arg_483_1.talkMaxDuration)

			if var_486_23 <= arg_483_1.time_ and arg_483_1.time_ < var_486_23 + var_486_33 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_23) / var_486_33

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_23 + var_486_33 and arg_483_1.time_ < var_486_23 + var_486_33 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play317282121 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 317282121
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play317282122(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["2079ui_story"].transform
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 then
				arg_487_1.var_.moveOldPos2079ui_story = var_490_0.localPosition
			end

			local var_490_2 = 0.001

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2
				local var_490_4 = Vector3.New(0, 100, 0)

				var_490_0.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos2079ui_story, var_490_4, var_490_3)

				local var_490_5 = manager.ui.mainCamera.transform.position - var_490_0.position

				var_490_0.forward = Vector3.New(var_490_5.x, var_490_5.y, var_490_5.z)

				local var_490_6 = var_490_0.localEulerAngles

				var_490_6.z = 0
				var_490_6.x = 0
				var_490_0.localEulerAngles = var_490_6
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 then
				var_490_0.localPosition = Vector3.New(0, 100, 0)

				local var_490_7 = manager.ui.mainCamera.transform.position - var_490_0.position

				var_490_0.forward = Vector3.New(var_490_7.x, var_490_7.y, var_490_7.z)

				local var_490_8 = var_490_0.localEulerAngles

				var_490_8.z = 0
				var_490_8.x = 0
				var_490_0.localEulerAngles = var_490_8
			end

			local var_490_9 = 0
			local var_490_10 = 1.15

			if var_490_9 < arg_487_1.time_ and arg_487_1.time_ <= var_490_9 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, false)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_11 = arg_487_1:GetWordFromCfg(317282121)
				local var_490_12 = arg_487_1:FormatText(var_490_11.content)

				arg_487_1.text_.text = var_490_12

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_13 = 46
				local var_490_14 = utf8.len(var_490_12)
				local var_490_15 = var_490_13 <= 0 and var_490_10 or var_490_10 * (var_490_14 / var_490_13)

				if var_490_15 > 0 and var_490_10 < var_490_15 then
					arg_487_1.talkMaxDuration = var_490_15

					if var_490_15 + var_490_9 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_15 + var_490_9
					end
				end

				arg_487_1.text_.text = var_490_12
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_16 = math.max(var_490_10, arg_487_1.talkMaxDuration)

			if var_490_9 <= arg_487_1.time_ and arg_487_1.time_ < var_490_9 + var_490_16 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_9) / var_490_16

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_9 + var_490_16 and arg_487_1.time_ < var_490_9 + var_490_16 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play317282122 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 317282122
		arg_491_1.duration_ = 2.8

		local var_491_0 = {
			zh = 2.1,
			ja = 2.8
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
				arg_491_0:Play317282123(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1093ui_story"].transform
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 then
				arg_491_1.var_.moveOldPos1093ui_story = var_494_0.localPosition
			end

			local var_494_2 = 0.001

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2
				local var_494_4 = Vector3.New(0, -1.11, -5.88)

				var_494_0.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos1093ui_story, var_494_4, var_494_3)

				local var_494_5 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_5.x, var_494_5.y, var_494_5.z)

				local var_494_6 = var_494_0.localEulerAngles

				var_494_6.z = 0
				var_494_6.x = 0
				var_494_0.localEulerAngles = var_494_6
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 then
				var_494_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_494_7 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_7.x, var_494_7.y, var_494_7.z)

				local var_494_8 = var_494_0.localEulerAngles

				var_494_8.z = 0
				var_494_8.x = 0
				var_494_0.localEulerAngles = var_494_8
			end

			local var_494_9 = arg_491_1.actors_["1093ui_story"]
			local var_494_10 = 0

			if var_494_10 < arg_491_1.time_ and arg_491_1.time_ <= var_494_10 + arg_494_0 and arg_491_1.var_.characterEffect1093ui_story == nil then
				arg_491_1.var_.characterEffect1093ui_story = var_494_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_11 = 0.200000002980232

			if var_494_10 <= arg_491_1.time_ and arg_491_1.time_ < var_494_10 + var_494_11 then
				local var_494_12 = (arg_491_1.time_ - var_494_10) / var_494_11

				if arg_491_1.var_.characterEffect1093ui_story then
					arg_491_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_10 + var_494_11 and arg_491_1.time_ < var_494_10 + var_494_11 + arg_494_0 and arg_491_1.var_.characterEffect1093ui_story then
				arg_491_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_494_13 = 0

			if var_494_13 < arg_491_1.time_ and arg_491_1.time_ <= var_494_13 + arg_494_0 then
				arg_491_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_494_14 = 0

			if var_494_14 < arg_491_1.time_ and arg_491_1.time_ <= var_494_14 + arg_494_0 then
				arg_491_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_494_15 = 0
			local var_494_16 = 0.125

			if var_494_15 < arg_491_1.time_ and arg_491_1.time_ <= var_494_15 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_17 = arg_491_1:FormatText(StoryNameCfg[73].name)

				arg_491_1.leftNameTxt_.text = var_494_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_18 = arg_491_1:GetWordFromCfg(317282122)
				local var_494_19 = arg_491_1:FormatText(var_494_18.content)

				arg_491_1.text_.text = var_494_19

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_20 = 5
				local var_494_21 = utf8.len(var_494_19)
				local var_494_22 = var_494_20 <= 0 and var_494_16 or var_494_16 * (var_494_21 / var_494_20)

				if var_494_22 > 0 and var_494_16 < var_494_22 then
					arg_491_1.talkMaxDuration = var_494_22

					if var_494_22 + var_494_15 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_22 + var_494_15
					end
				end

				arg_491_1.text_.text = var_494_19
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282122", "story_v_out_317282.awb") ~= 0 then
					local var_494_23 = manager.audio:GetVoiceLength("story_v_out_317282", "317282122", "story_v_out_317282.awb") / 1000

					if var_494_23 + var_494_15 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_23 + var_494_15
					end

					if var_494_18.prefab_name ~= "" and arg_491_1.actors_[var_494_18.prefab_name] ~= nil then
						local var_494_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_18.prefab_name].transform, "story_v_out_317282", "317282122", "story_v_out_317282.awb")

						arg_491_1:RecordAudio("317282122", var_494_24)
						arg_491_1:RecordAudio("317282122", var_494_24)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_317282", "317282122", "story_v_out_317282.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_317282", "317282122", "story_v_out_317282.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_25 = math.max(var_494_16, arg_491_1.talkMaxDuration)

			if var_494_15 <= arg_491_1.time_ and arg_491_1.time_ < var_494_15 + var_494_25 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_15) / var_494_25

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_15 + var_494_25 and arg_491_1.time_ < var_494_15 + var_494_25 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play317282123 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 317282123
		arg_495_1.duration_ = 5

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play317282124(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1093ui_story"].transform
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 then
				arg_495_1.var_.moveOldPos1093ui_story = var_498_0.localPosition
			end

			local var_498_2 = 0.001

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2
				local var_498_4 = Vector3.New(0, 100, 0)

				var_498_0.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos1093ui_story, var_498_4, var_498_3)

				local var_498_5 = manager.ui.mainCamera.transform.position - var_498_0.position

				var_498_0.forward = Vector3.New(var_498_5.x, var_498_5.y, var_498_5.z)

				local var_498_6 = var_498_0.localEulerAngles

				var_498_6.z = 0
				var_498_6.x = 0
				var_498_0.localEulerAngles = var_498_6
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 then
				var_498_0.localPosition = Vector3.New(0, 100, 0)

				local var_498_7 = manager.ui.mainCamera.transform.position - var_498_0.position

				var_498_0.forward = Vector3.New(var_498_7.x, var_498_7.y, var_498_7.z)

				local var_498_8 = var_498_0.localEulerAngles

				var_498_8.z = 0
				var_498_8.x = 0
				var_498_0.localEulerAngles = var_498_8
			end

			local var_498_9 = arg_495_1.actors_["1093ui_story"]
			local var_498_10 = 0

			if var_498_10 < arg_495_1.time_ and arg_495_1.time_ <= var_498_10 + arg_498_0 and arg_495_1.var_.characterEffect1093ui_story == nil then
				arg_495_1.var_.characterEffect1093ui_story = var_498_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_11 = 0.200000002980232

			if var_498_10 <= arg_495_1.time_ and arg_495_1.time_ < var_498_10 + var_498_11 then
				local var_498_12 = (arg_495_1.time_ - var_498_10) / var_498_11

				if arg_495_1.var_.characterEffect1093ui_story then
					local var_498_13 = Mathf.Lerp(0, 0.5, var_498_12)

					arg_495_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_495_1.var_.characterEffect1093ui_story.fillRatio = var_498_13
				end
			end

			if arg_495_1.time_ >= var_498_10 + var_498_11 and arg_495_1.time_ < var_498_10 + var_498_11 + arg_498_0 and arg_495_1.var_.characterEffect1093ui_story then
				local var_498_14 = 0.5

				arg_495_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_495_1.var_.characterEffect1093ui_story.fillRatio = var_498_14
			end

			local var_498_15 = 0
			local var_498_16 = 0.875

			if var_498_15 < arg_495_1.time_ and arg_495_1.time_ <= var_498_15 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, false)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_17 = arg_495_1:GetWordFromCfg(317282123)
				local var_498_18 = arg_495_1:FormatText(var_498_17.content)

				arg_495_1.text_.text = var_498_18

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_19 = 35
				local var_498_20 = utf8.len(var_498_18)
				local var_498_21 = var_498_19 <= 0 and var_498_16 or var_498_16 * (var_498_20 / var_498_19)

				if var_498_21 > 0 and var_498_16 < var_498_21 then
					arg_495_1.talkMaxDuration = var_498_21

					if var_498_21 + var_498_15 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_21 + var_498_15
					end
				end

				arg_495_1.text_.text = var_498_18
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)
				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_22 = math.max(var_498_16, arg_495_1.talkMaxDuration)

			if var_498_15 <= arg_495_1.time_ and arg_495_1.time_ < var_498_15 + var_498_22 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_15) / var_498_22

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_15 + var_498_22 and arg_495_1.time_ < var_498_15 + var_498_22 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play317282124 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 317282124
		arg_499_1.duration_ = 7.1

		local var_499_0 = {
			zh = 5.333,
			ja = 7.1
		}
		local var_499_1 = manager.audio:GetLocalizationFlag()

		if var_499_0[var_499_1] ~= nil then
			arg_499_1.duration_ = var_499_0[var_499_1]
		end

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
			arg_499_1.auto_ = false
		end

		function arg_499_1.playNext_(arg_501_0)
			arg_499_1.onStoryFinished_()
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1199ui_story"].transform
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 then
				arg_499_1.var_.moveOldPos1199ui_story = var_502_0.localPosition
			end

			local var_502_2 = 0.001

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2
				local var_502_4 = Vector3.New(0, -1.08, -5.9)

				var_502_0.localPosition = Vector3.Lerp(arg_499_1.var_.moveOldPos1199ui_story, var_502_4, var_502_3)

				local var_502_5 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_5.x, var_502_5.y, var_502_5.z)

				local var_502_6 = var_502_0.localEulerAngles

				var_502_6.z = 0
				var_502_6.x = 0
				var_502_0.localEulerAngles = var_502_6
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 then
				var_502_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_502_7 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_7.x, var_502_7.y, var_502_7.z)

				local var_502_8 = var_502_0.localEulerAngles

				var_502_8.z = 0
				var_502_8.x = 0
				var_502_0.localEulerAngles = var_502_8
			end

			local var_502_9 = arg_499_1.actors_["1199ui_story"]
			local var_502_10 = 0

			if var_502_10 < arg_499_1.time_ and arg_499_1.time_ <= var_502_10 + arg_502_0 and arg_499_1.var_.characterEffect1199ui_story == nil then
				arg_499_1.var_.characterEffect1199ui_story = var_502_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_11 = 0.200000002980232

			if var_502_10 <= arg_499_1.time_ and arg_499_1.time_ < var_502_10 + var_502_11 then
				local var_502_12 = (arg_499_1.time_ - var_502_10) / var_502_11

				if arg_499_1.var_.characterEffect1199ui_story then
					arg_499_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_499_1.time_ >= var_502_10 + var_502_11 and arg_499_1.time_ < var_502_10 + var_502_11 + arg_502_0 and arg_499_1.var_.characterEffect1199ui_story then
				arg_499_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_502_13 = 0

			if var_502_13 < arg_499_1.time_ and arg_499_1.time_ <= var_502_13 + arg_502_0 then
				arg_499_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_502_14 = 0

			if var_502_14 < arg_499_1.time_ and arg_499_1.time_ <= var_502_14 + arg_502_0 then
				arg_499_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_502_15 = 0
			local var_502_16 = 0.775

			if var_502_15 < arg_499_1.time_ and arg_499_1.time_ <= var_502_15 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_17 = arg_499_1:FormatText(StoryNameCfg[84].name)

				arg_499_1.leftNameTxt_.text = var_502_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_18 = arg_499_1:GetWordFromCfg(317282124)
				local var_502_19 = arg_499_1:FormatText(var_502_18.content)

				arg_499_1.text_.text = var_502_19

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_20 = 31
				local var_502_21 = utf8.len(var_502_19)
				local var_502_22 = var_502_20 <= 0 and var_502_16 or var_502_16 * (var_502_21 / var_502_20)

				if var_502_22 > 0 and var_502_16 < var_502_22 then
					arg_499_1.talkMaxDuration = var_502_22

					if var_502_22 + var_502_15 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_22 + var_502_15
					end
				end

				arg_499_1.text_.text = var_502_19
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317282", "317282124", "story_v_out_317282.awb") ~= 0 then
					local var_502_23 = manager.audio:GetVoiceLength("story_v_out_317282", "317282124", "story_v_out_317282.awb") / 1000

					if var_502_23 + var_502_15 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_23 + var_502_15
					end

					if var_502_18.prefab_name ~= "" and arg_499_1.actors_[var_502_18.prefab_name] ~= nil then
						local var_502_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_18.prefab_name].transform, "story_v_out_317282", "317282124", "story_v_out_317282.awb")

						arg_499_1:RecordAudio("317282124", var_502_24)
						arg_499_1:RecordAudio("317282124", var_502_24)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_317282", "317282124", "story_v_out_317282.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_317282", "317282124", "story_v_out_317282.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_25 = math.max(var_502_16, arg_499_1.talkMaxDuration)

			if var_502_15 <= arg_499_1.time_ and arg_499_1.time_ < var_502_15 + var_502_25 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_15) / var_502_25

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_15 + var_502_25 and arg_499_1.time_ < var_502_15 + var_502_25 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K10f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K11f"
	},
	voices = {
		"story_v_out_317282.awb"
	}
}
