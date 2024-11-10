return {
	Play102112001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 102112001
		arg_1_1.duration_ = 6.7

		local var_1_0 = {
			ja = 6.7,
			ko = 6.366,
			zh = 4.933,
			en = 4.5
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
				arg_1_0:Play102112002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_victory_count", "bgm_count", "bgm_victory_count")
			end

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_4_8 = "3009ui_story"

			if arg_1_1.actors_[var_4_8] == nil then
				local var_4_9 = Object.Instantiate(Asset.Load("Char/" .. var_4_8), arg_1_1.stage_.transform)

				var_4_9.name = var_4_8
				var_4_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_8] = var_4_9

				local var_4_10 = var_4_9:GetComponentInChildren(typeof(CharacterEffect))

				var_4_10.enabled = true

				local var_4_11 = GameObjectTools.GetOrAddComponent(var_4_9, typeof(DynamicBoneHelper))

				if var_4_11 then
					var_4_11:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_10.transform, false)

				arg_1_1.var_[var_4_8 .. "Animator"] = var_4_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_8 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_8 .. "LipSync"] = var_4_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_12 = arg_1_1.actors_["3009ui_story"]
			local var_4_13 = 1.8

			if var_4_13 < arg_1_1.time_ and arg_1_1.time_ <= var_4_13 + arg_4_0 and arg_1_1.var_.characterEffect3009ui_story == nil then
				arg_1_1.var_.characterEffect3009ui_story = var_4_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_14 = 0.1

			if var_4_13 <= arg_1_1.time_ and arg_1_1.time_ < var_4_13 + var_4_14 then
				local var_4_15 = (arg_1_1.time_ - var_4_13) / var_4_14

				if arg_1_1.var_.characterEffect3009ui_story then
					arg_1_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_13 + var_4_14 and arg_1_1.time_ < var_4_13 + var_4_14 + arg_4_0 and arg_1_1.var_.characterEffect3009ui_story then
				arg_1_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_4_16 = "B08b"

			if arg_1_1.bgs_[var_4_16] == nil then
				local var_4_17 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_17:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_16)
				var_4_17.name = var_4_16
				var_4_17.transform.parent = arg_1_1.stage_.transform
				var_4_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_16] = var_4_17
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_19 = manager.ui.mainCamera.transform.localPosition
				local var_4_20 = Vector3.New(0, 0, 10) + Vector3.New(var_4_19.x, var_4_19.y, 0)
				local var_4_21 = arg_1_1.bgs_.B08b

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
					if iter_4_0 ~= "B08b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_32 = arg_1_1.actors_["3009ui_story"].transform
			local var_4_33 = 1.79999995231628

			if var_4_33 < arg_1_1.time_ and arg_1_1.time_ <= var_4_33 + arg_4_0 then
				arg_1_1.var_.moveOldPos3009ui_story = var_4_32.localPosition

				local var_4_34 = "3009ui_story"

				arg_1_1:ShowWeapon(arg_1_1.var_[var_4_34 .. "Animator"].transform, true)
			end

			local var_4_35 = 0.001

			if var_4_33 <= arg_1_1.time_ and arg_1_1.time_ < var_4_33 + var_4_35 then
				local var_4_36 = (arg_1_1.time_ - var_4_33) / var_4_35
				local var_4_37 = Vector3.New(-0.7, -1.75, -4.8)

				var_4_32.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos3009ui_story, var_4_37, var_4_36)

				local var_4_38 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_38.x, var_4_38.y, var_4_38.z)

				local var_4_39 = var_4_32.localEulerAngles

				var_4_39.z = 0
				var_4_39.x = 0
				var_4_32.localEulerAngles = var_4_39
			end

			if arg_1_1.time_ >= var_4_33 + var_4_35 and arg_1_1.time_ < var_4_33 + var_4_35 + arg_4_0 then
				var_4_32.localPosition = Vector3.New(-0.7, -1.75, -4.8)

				local var_4_40 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_40.x, var_4_40.y, var_4_40.z)

				local var_4_41 = var_4_32.localEulerAngles

				var_4_41.z = 0
				var_4_41.x = 0
				var_4_32.localEulerAngles = var_4_41
			end

			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action2_1")
			end

			local var_4_43 = 0

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_44 = 2

			if var_4_43 <= arg_1_1.time_ and arg_1_1.time_ < var_4_43 + var_4_44 then
				local var_4_45 = (arg_1_1.time_ - var_4_43) / var_4_44
				local var_4_46 = Color.New(0, 0, 0)

				var_4_46.a = Mathf.Lerp(1, 0, var_4_45)
				arg_1_1.mask_.color = var_4_46
			end

			if arg_1_1.time_ >= var_4_43 + var_4_44 and arg_1_1.time_ < var_4_43 + var_4_44 + arg_4_0 then
				local var_4_47 = Color.New(0, 0, 0)
				local var_4_48 = 0

				arg_1_1.mask_.enabled = false
				var_4_47.a = var_4_48
				arg_1_1.mask_.color = var_4_47
			end

			local var_4_49 = 1.8

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_50 = 2
			local var_4_51 = 0.375

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_52 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_52:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_53 = arg_1_1:FormatText(StoryNameCfg[43].name)

				arg_1_1.leftNameTxt_.text = var_4_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_54 = arg_1_1:GetWordFromCfg(102112001)
				local var_4_55 = arg_1_1:FormatText(var_4_54.content)

				arg_1_1.text_.text = var_4_55

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_56 = 15
				local var_4_57 = utf8.len(var_4_55)
				local var_4_58 = var_4_56 <= 0 and var_4_51 or var_4_51 * (var_4_57 / var_4_56)

				if var_4_58 > 0 and var_4_51 < var_4_58 then
					arg_1_1.talkMaxDuration = var_4_58
					var_4_50 = var_4_50 + 0.3

					if var_4_58 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_50
					end
				end

				arg_1_1.text_.text = var_4_55
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112001", "story_v_out_102112.awb") ~= 0 then
					local var_4_59 = manager.audio:GetVoiceLength("story_v_out_102112", "102112001", "story_v_out_102112.awb") / 1000

					if var_4_59 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_50
					end

					if var_4_54.prefab_name ~= "" and arg_1_1.actors_[var_4_54.prefab_name] ~= nil then
						local var_4_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_54.prefab_name].transform, "story_v_out_102112", "102112001", "story_v_out_102112.awb")

						arg_1_1:RecordAudio("102112001", var_4_60)
						arg_1_1:RecordAudio("102112001", var_4_60)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_102112", "102112001", "story_v_out_102112.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_102112", "102112001", "story_v_out_102112.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_61 = var_4_50 + 0.3
			local var_4_62 = math.max(var_4_51, arg_1_1.talkMaxDuration)

			if var_4_61 <= arg_1_1.time_ and arg_1_1.time_ < var_4_61 + var_4_62 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_61) / var_4_62

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_61 + var_4_62 and arg_1_1.time_ < var_4_61 + var_4_62 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play102112002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 102112002
		arg_7_1.duration_ = 8.366

		local var_7_0 = {
			ja = 3.9,
			ko = 6.933,
			zh = 6.5,
			en = 8.366
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
				arg_7_0:Play102112003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "3008ui_story"

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

			local var_10_4 = arg_7_1.actors_["3008ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect3008ui_story == nil then
				arg_7_1.var_.characterEffect3008ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect3008ui_story then
					arg_7_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect3008ui_story then
				arg_7_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["3009ui_story"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect3009ui_story == nil then
				arg_7_1.var_.characterEffect3009ui_story = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect3009ui_story then
					local var_10_12 = Mathf.Lerp(0, 0.5, var_10_11)

					arg_7_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_7_1.var_.characterEffect3009ui_story.fillRatio = var_10_12
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect3009ui_story then
				local var_10_13 = 0.5

				arg_7_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_7_1.var_.characterEffect3009ui_story.fillRatio = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["3008ui_story"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos3008ui_story = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -1.51, -4.3)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos3008ui_story, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -1.51, -4.3)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action2_1")
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_10_25 = 0
			local var_10_26 = 0.8

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[20].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(102112002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 32
				local var_10_31 = utf8.len(var_10_29)
				local var_10_32 = var_10_30 <= 0 and var_10_26 or var_10_26 * (var_10_31 / var_10_30)

				if var_10_32 > 0 and var_10_26 < var_10_32 then
					arg_7_1.talkMaxDuration = var_10_32

					if var_10_32 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_32 + var_10_25
					end
				end

				arg_7_1.text_.text = var_10_29
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112002", "story_v_out_102112.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_102112", "102112002", "story_v_out_102112.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_102112", "102112002", "story_v_out_102112.awb")

						arg_7_1:RecordAudio("102112002", var_10_34)
						arg_7_1:RecordAudio("102112002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_102112", "102112002", "story_v_out_102112.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_102112", "102112002", "story_v_out_102112.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_35 = math.max(var_10_26, arg_7_1.talkMaxDuration)

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_35 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_25) / var_10_35

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_25 + var_10_35 and arg_7_1.time_ < var_10_25 + var_10_35 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play102112003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 102112003
		arg_11_1.duration_ = 4.3

		local var_11_0 = {
			ja = 4.3,
			ko = 2.5,
			zh = 2.833,
			en = 3.333
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
				arg_11_0:Play102112004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1011ui_story"

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

			local var_14_4 = arg_11_1.actors_["1011ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story == nil then
				arg_11_1.var_.characterEffect1011ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect1011ui_story then
					arg_11_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story then
				arg_11_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_14_8 = arg_11_1.actors_["3008ui_story"].transform
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 then
				arg_11_1.var_.moveOldPos3008ui_story = var_14_8.localPosition
			end

			local var_14_10 = 0.001

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10
				local var_14_12 = Vector3.New(0, 100, 0)

				var_14_8.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos3008ui_story, var_14_12, var_14_11)

				local var_14_13 = manager.ui.mainCamera.transform.position - var_14_8.position

				var_14_8.forward = Vector3.New(var_14_13.x, var_14_13.y, var_14_13.z)

				local var_14_14 = var_14_8.localEulerAngles

				var_14_14.z = 0
				var_14_14.x = 0
				var_14_8.localEulerAngles = var_14_14
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 then
				var_14_8.localPosition = Vector3.New(0, 100, 0)

				local var_14_15 = manager.ui.mainCamera.transform.position - var_14_8.position

				var_14_8.forward = Vector3.New(var_14_15.x, var_14_15.y, var_14_15.z)

				local var_14_16 = var_14_8.localEulerAngles

				var_14_16.z = 0
				var_14_16.x = 0
				var_14_8.localEulerAngles = var_14_16
			end

			local var_14_17 = arg_11_1.actors_["3009ui_story"].transform
			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1.var_.moveOldPos3009ui_story = var_14_17.localPosition
			end

			local var_14_19 = 0.001

			if var_14_18 <= arg_11_1.time_ and arg_11_1.time_ < var_14_18 + var_14_19 then
				local var_14_20 = (arg_11_1.time_ - var_14_18) / var_14_19
				local var_14_21 = Vector3.New(0, 100, 0)

				var_14_17.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos3009ui_story, var_14_21, var_14_20)

				local var_14_22 = manager.ui.mainCamera.transform.position - var_14_17.position

				var_14_17.forward = Vector3.New(var_14_22.x, var_14_22.y, var_14_22.z)

				local var_14_23 = var_14_17.localEulerAngles

				var_14_23.z = 0
				var_14_23.x = 0
				var_14_17.localEulerAngles = var_14_23
			end

			if arg_11_1.time_ >= var_14_18 + var_14_19 and arg_11_1.time_ < var_14_18 + var_14_19 + arg_14_0 then
				var_14_17.localPosition = Vector3.New(0, 100, 0)

				local var_14_24 = manager.ui.mainCamera.transform.position - var_14_17.position

				var_14_17.forward = Vector3.New(var_14_24.x, var_14_24.y, var_14_24.z)

				local var_14_25 = var_14_17.localEulerAngles

				var_14_25.z = 0
				var_14_25.x = 0
				var_14_17.localEulerAngles = var_14_25
			end

			local var_14_26 = 0

			if var_14_26 < arg_11_1.time_ and arg_11_1.time_ <= var_14_26 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_14_27 = arg_11_1.actors_["1011ui_story"].transform
			local var_14_28 = 0

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1.var_.moveOldPos1011ui_story = var_14_27.localPosition
			end

			local var_14_29 = 0.001

			if var_14_28 <= arg_11_1.time_ and arg_11_1.time_ < var_14_28 + var_14_29 then
				local var_14_30 = (arg_11_1.time_ - var_14_28) / var_14_29
				local var_14_31 = Vector3.New(-0.7, -0.71, -6)

				var_14_27.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1011ui_story, var_14_31, var_14_30)

				local var_14_32 = manager.ui.mainCamera.transform.position - var_14_27.position

				var_14_27.forward = Vector3.New(var_14_32.x, var_14_32.y, var_14_32.z)

				local var_14_33 = var_14_27.localEulerAngles

				var_14_33.z = 0
				var_14_33.x = 0
				var_14_27.localEulerAngles = var_14_33
			end

			if arg_11_1.time_ >= var_14_28 + var_14_29 and arg_11_1.time_ < var_14_28 + var_14_29 + arg_14_0 then
				var_14_27.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_14_34 = manager.ui.mainCamera.transform.position - var_14_27.position

				var_14_27.forward = Vector3.New(var_14_34.x, var_14_34.y, var_14_34.z)

				local var_14_35 = var_14_27.localEulerAngles

				var_14_35.z = 0
				var_14_35.x = 0
				var_14_27.localEulerAngles = var_14_35
			end

			local var_14_36 = 0

			if var_14_36 < arg_11_1.time_ and arg_11_1.time_ <= var_14_36 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_14_37 = 0
			local var_14_38 = 0.225

			if var_14_37 < arg_11_1.time_ and arg_11_1.time_ <= var_14_37 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_39 = arg_11_1:FormatText(StoryNameCfg[37].name)

				arg_11_1.leftNameTxt_.text = var_14_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_40 = arg_11_1:GetWordFromCfg(102112003)
				local var_14_41 = arg_11_1:FormatText(var_14_40.content)

				arg_11_1.text_.text = var_14_41

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_42 = 9
				local var_14_43 = utf8.len(var_14_41)
				local var_14_44 = var_14_42 <= 0 and var_14_38 or var_14_38 * (var_14_43 / var_14_42)

				if var_14_44 > 0 and var_14_38 < var_14_44 then
					arg_11_1.talkMaxDuration = var_14_44

					if var_14_44 + var_14_37 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_44 + var_14_37
					end
				end

				arg_11_1.text_.text = var_14_41
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112003", "story_v_out_102112.awb") ~= 0 then
					local var_14_45 = manager.audio:GetVoiceLength("story_v_out_102112", "102112003", "story_v_out_102112.awb") / 1000

					if var_14_45 + var_14_37 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_45 + var_14_37
					end

					if var_14_40.prefab_name ~= "" and arg_11_1.actors_[var_14_40.prefab_name] ~= nil then
						local var_14_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_40.prefab_name].transform, "story_v_out_102112", "102112003", "story_v_out_102112.awb")

						arg_11_1:RecordAudio("102112003", var_14_46)
						arg_11_1:RecordAudio("102112003", var_14_46)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_102112", "102112003", "story_v_out_102112.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_102112", "102112003", "story_v_out_102112.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_47 = math.max(var_14_38, arg_11_1.talkMaxDuration)

			if var_14_37 <= arg_11_1.time_ and arg_11_1.time_ < var_14_37 + var_14_47 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_37) / var_14_47

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_37 + var_14_47 and arg_11_1.time_ < var_14_37 + var_14_47 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play102112004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 102112004
		arg_15_1.duration_ = 8.666

		local var_15_0 = {
			ja = 8.666,
			ko = 4.466,
			zh = 4.266,
			en = 6.466
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
				arg_15_0:Play102112005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1019ui_story"

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

			local var_18_4 = arg_15_1.actors_["1019ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story == nil then
				arg_15_1.var_.characterEffect1019ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1019ui_story then
					arg_15_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story then
				arg_15_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["1011ui_story"]
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story == nil then
				arg_15_1.var_.characterEffect1011ui_story = var_18_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_10 = 0.1

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10

				if arg_15_1.var_.characterEffect1011ui_story then
					local var_18_12 = Mathf.Lerp(0, 0.5, var_18_11)

					arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_12
				end
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story then
				local var_18_13 = 0.5

				arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_13
			end

			local var_18_14 = arg_15_1.actors_["1019ui_story"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos1019ui_story = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0.7, -1.08, -5.9)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1019ui_story, var_18_18, var_18_17)

				local var_18_19 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_19.x, var_18_19.y, var_18_19.z)

				local var_18_20 = var_18_14.localEulerAngles

				var_18_20.z = 0
				var_18_20.x = 0
				var_18_14.localEulerAngles = var_18_20
			end

			if arg_15_1.time_ >= var_18_15 + var_18_16 and arg_15_1.time_ < var_18_15 + var_18_16 + arg_18_0 then
				var_18_14.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_18_21 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_21.x, var_18_21.y, var_18_21.z)

				local var_18_22 = var_18_14.localEulerAngles

				var_18_22.z = 0
				var_18_22.x = 0
				var_18_14.localEulerAngles = var_18_22
			end

			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_18_25 = 0
			local var_18_26 = 0.5

			if var_18_25 < arg_15_1.time_ and arg_15_1.time_ <= var_18_25 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_27 = arg_15_1:FormatText(StoryNameCfg[13].name)

				arg_15_1.leftNameTxt_.text = var_18_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_28 = arg_15_1:GetWordFromCfg(102112004)
				local var_18_29 = arg_15_1:FormatText(var_18_28.content)

				arg_15_1.text_.text = var_18_29

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_30 = 20
				local var_18_31 = utf8.len(var_18_29)
				local var_18_32 = var_18_30 <= 0 and var_18_26 or var_18_26 * (var_18_31 / var_18_30)

				if var_18_32 > 0 and var_18_26 < var_18_32 then
					arg_15_1.talkMaxDuration = var_18_32

					if var_18_32 + var_18_25 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_32 + var_18_25
					end
				end

				arg_15_1.text_.text = var_18_29
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112004", "story_v_out_102112.awb") ~= 0 then
					local var_18_33 = manager.audio:GetVoiceLength("story_v_out_102112", "102112004", "story_v_out_102112.awb") / 1000

					if var_18_33 + var_18_25 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_33 + var_18_25
					end

					if var_18_28.prefab_name ~= "" and arg_15_1.actors_[var_18_28.prefab_name] ~= nil then
						local var_18_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_28.prefab_name].transform, "story_v_out_102112", "102112004", "story_v_out_102112.awb")

						arg_15_1:RecordAudio("102112004", var_18_34)
						arg_15_1:RecordAudio("102112004", var_18_34)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_102112", "102112004", "story_v_out_102112.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_102112", "102112004", "story_v_out_102112.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_35 = math.max(var_18_26, arg_15_1.talkMaxDuration)

			if var_18_25 <= arg_15_1.time_ and arg_15_1.time_ < var_18_25 + var_18_35 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_25) / var_18_35

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_25 + var_18_35 and arg_15_1.time_ < var_18_25 + var_18_35 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play102112005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 102112005
		arg_19_1.duration_ = 6.666

		local var_19_0 = {
			ja = 6.666,
			ko = 3.9,
			zh = 3.233,
			en = 3.866
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
				arg_19_0:Play102112006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["3008ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect3008ui_story == nil then
				arg_19_1.var_.characterEffect3008ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect3008ui_story then
					arg_19_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect3008ui_story then
				arg_19_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1019ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1019ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0, 100, 0)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1019ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, 100, 0)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = arg_19_1.actors_["1011ui_story"].transform
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1.var_.moveOldPos1011ui_story = var_22_13.localPosition
			end

			local var_22_15 = 0.001

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15
				local var_22_17 = Vector3.New(0, 100, 0)

				var_22_13.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1011ui_story, var_22_17, var_22_16)

				local var_22_18 = manager.ui.mainCamera.transform.position - var_22_13.position

				var_22_13.forward = Vector3.New(var_22_18.x, var_22_18.y, var_22_18.z)

				local var_22_19 = var_22_13.localEulerAngles

				var_22_19.z = 0
				var_22_19.x = 0
				var_22_13.localEulerAngles = var_22_19
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 then
				var_22_13.localPosition = Vector3.New(0, 100, 0)

				local var_22_20 = manager.ui.mainCamera.transform.position - var_22_13.position

				var_22_13.forward = Vector3.New(var_22_20.x, var_22_20.y, var_22_20.z)

				local var_22_21 = var_22_13.localEulerAngles

				var_22_21.z = 0
				var_22_21.x = 0
				var_22_13.localEulerAngles = var_22_21
			end

			local var_22_22 = arg_19_1.actors_["3008ui_story"].transform
			local var_22_23 = 0

			if var_22_23 < arg_19_1.time_ and arg_19_1.time_ <= var_22_23 + arg_22_0 then
				arg_19_1.var_.moveOldPos3008ui_story = var_22_22.localPosition
			end

			local var_22_24 = 0.001

			if var_22_23 <= arg_19_1.time_ and arg_19_1.time_ < var_22_23 + var_22_24 then
				local var_22_25 = (arg_19_1.time_ - var_22_23) / var_22_24
				local var_22_26 = Vector3.New(0, -1.51, -4.3)

				var_22_22.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos3008ui_story, var_22_26, var_22_25)

				local var_22_27 = manager.ui.mainCamera.transform.position - var_22_22.position

				var_22_22.forward = Vector3.New(var_22_27.x, var_22_27.y, var_22_27.z)

				local var_22_28 = var_22_22.localEulerAngles

				var_22_28.z = 0
				var_22_28.x = 0
				var_22_22.localEulerAngles = var_22_28
			end

			if arg_19_1.time_ >= var_22_23 + var_22_24 and arg_19_1.time_ < var_22_23 + var_22_24 + arg_22_0 then
				var_22_22.localPosition = Vector3.New(0, -1.51, -4.3)

				local var_22_29 = manager.ui.mainCamera.transform.position - var_22_22.position

				var_22_22.forward = Vector3.New(var_22_29.x, var_22_29.y, var_22_29.z)

				local var_22_30 = var_22_22.localEulerAngles

				var_22_30.z = 0
				var_22_30.x = 0
				var_22_22.localEulerAngles = var_22_30
			end

			local var_22_31 = 0

			if var_22_31 < arg_19_1.time_ and arg_19_1.time_ <= var_22_31 + arg_22_0 then
				arg_19_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action7_1")
			end

			local var_22_32 = 0

			if var_22_32 < arg_19_1.time_ and arg_19_1.time_ <= var_22_32 + arg_22_0 then
				arg_19_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_22_33 = 0
			local var_22_34 = 0.375

			if var_22_33 < arg_19_1.time_ and arg_19_1.time_ <= var_22_33 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_35 = arg_19_1:FormatText(StoryNameCfg[20].name)

				arg_19_1.leftNameTxt_.text = var_22_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_36 = arg_19_1:GetWordFromCfg(102112005)
				local var_22_37 = arg_19_1:FormatText(var_22_36.content)

				arg_19_1.text_.text = var_22_37

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_38 = 15
				local var_22_39 = utf8.len(var_22_37)
				local var_22_40 = var_22_38 <= 0 and var_22_34 or var_22_34 * (var_22_39 / var_22_38)

				if var_22_40 > 0 and var_22_34 < var_22_40 then
					arg_19_1.talkMaxDuration = var_22_40

					if var_22_40 + var_22_33 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_40 + var_22_33
					end
				end

				arg_19_1.text_.text = var_22_37
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112005", "story_v_out_102112.awb") ~= 0 then
					local var_22_41 = manager.audio:GetVoiceLength("story_v_out_102112", "102112005", "story_v_out_102112.awb") / 1000

					if var_22_41 + var_22_33 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_41 + var_22_33
					end

					if var_22_36.prefab_name ~= "" and arg_19_1.actors_[var_22_36.prefab_name] ~= nil then
						local var_22_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_36.prefab_name].transform, "story_v_out_102112", "102112005", "story_v_out_102112.awb")

						arg_19_1:RecordAudio("102112005", var_22_42)
						arg_19_1:RecordAudio("102112005", var_22_42)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_102112", "102112005", "story_v_out_102112.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_102112", "102112005", "story_v_out_102112.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_43 = math.max(var_22_34, arg_19_1.talkMaxDuration)

			if var_22_33 <= arg_19_1.time_ and arg_19_1.time_ < var_22_33 + var_22_43 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_33) / var_22_43

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_33 + var_22_43 and arg_19_1.time_ < var_22_33 + var_22_43 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play102112006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 102112006
		arg_23_1.duration_ = 4.333

		local var_23_0 = {
			ja = 3.9,
			ko = 3.8,
			zh = 3.166,
			en = 4.333
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
				arg_23_0:Play102112007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1011ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1011ui_story == nil then
				arg_23_1.var_.characterEffect1011ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1011ui_story then
					arg_23_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1011ui_story then
				arg_23_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_26_4 = arg_23_1.actors_["3008ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect3008ui_story == nil then
				arg_23_1.var_.characterEffect3008ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect3008ui_story then
					local var_26_8 = Mathf.Lerp(0, 0.5, var_26_7)

					arg_23_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_23_1.var_.characterEffect3008ui_story.fillRatio = var_26_8
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect3008ui_story then
				local var_26_9 = 0.5

				arg_23_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_23_1.var_.characterEffect3008ui_story.fillRatio = var_26_9
			end

			local var_26_10 = 0
			local var_26_11 = 0.3

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_12 = arg_23_1:FormatText(StoryNameCfg[37].name)

				arg_23_1.leftNameTxt_.text = var_26_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_13 = arg_23_1:GetWordFromCfg(102112006)
				local var_26_14 = arg_23_1:FormatText(var_26_13.content)

				arg_23_1.text_.text = var_26_14

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_15 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112006", "story_v_out_102112.awb") ~= 0 then
					local var_26_18 = manager.audio:GetVoiceLength("story_v_out_102112", "102112006", "story_v_out_102112.awb") / 1000

					if var_26_18 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_18 + var_26_10
					end

					if var_26_13.prefab_name ~= "" and arg_23_1.actors_[var_26_13.prefab_name] ~= nil then
						local var_26_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_13.prefab_name].transform, "story_v_out_102112", "102112006", "story_v_out_102112.awb")

						arg_23_1:RecordAudio("102112006", var_26_19)
						arg_23_1:RecordAudio("102112006", var_26_19)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_102112", "102112006", "story_v_out_102112.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_102112", "102112006", "story_v_out_102112.awb")
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
	Play102112007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 102112007
		arg_27_1.duration_ = 7.666

		local var_27_0 = {
			ja = 7.666,
			ko = 5.566,
			zh = 5,
			en = 4.233
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
				arg_27_0:Play102112008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "4010ui_story"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("Char/" .. var_30_0), arg_27_1.stage_.transform)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_0] = var_30_1

				local var_30_2 = var_30_1:GetComponentInChildren(typeof(CharacterEffect))

				var_30_2.enabled = true

				local var_30_3 = GameObjectTools.GetOrAddComponent(var_30_1, typeof(DynamicBoneHelper))

				if var_30_3 then
					var_30_3:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_2.transform, false)

				arg_27_1.var_[var_30_0 .. "Animator"] = var_30_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_0 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_0 .. "LipSync"] = var_30_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_4 = arg_27_1.actors_["4010ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect4010ui_story == nil then
				arg_27_1.var_.characterEffect4010ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect4010ui_story then
					arg_27_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect4010ui_story then
				arg_27_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_30_8 = arg_27_1.actors_["3008ui_story"].transform
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1.var_.moveOldPos3008ui_story = var_30_8.localPosition
			end

			local var_30_10 = 0.001

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_10 then
				local var_30_11 = (arg_27_1.time_ - var_30_9) / var_30_10
				local var_30_12 = Vector3.New(0, 100, 0)

				var_30_8.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos3008ui_story, var_30_12, var_30_11)

				local var_30_13 = manager.ui.mainCamera.transform.position - var_30_8.position

				var_30_8.forward = Vector3.New(var_30_13.x, var_30_13.y, var_30_13.z)

				local var_30_14 = var_30_8.localEulerAngles

				var_30_14.z = 0
				var_30_14.x = 0
				var_30_8.localEulerAngles = var_30_14
			end

			if arg_27_1.time_ >= var_30_9 + var_30_10 and arg_27_1.time_ < var_30_9 + var_30_10 + arg_30_0 then
				var_30_8.localPosition = Vector3.New(0, 100, 0)

				local var_30_15 = manager.ui.mainCamera.transform.position - var_30_8.position

				var_30_8.forward = Vector3.New(var_30_15.x, var_30_15.y, var_30_15.z)

				local var_30_16 = var_30_8.localEulerAngles

				var_30_16.z = 0
				var_30_16.x = 0
				var_30_8.localEulerAngles = var_30_16
			end

			local var_30_17 = arg_27_1.actors_["4010ui_story"].transform
			local var_30_18 = 0

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1.var_.moveOldPos4010ui_story = var_30_17.localPosition
			end

			local var_30_19 = 0.001

			if var_30_18 <= arg_27_1.time_ and arg_27_1.time_ < var_30_18 + var_30_19 then
				local var_30_20 = (arg_27_1.time_ - var_30_18) / var_30_19
				local var_30_21 = Vector3.New(0, -1.59, -5.2)

				var_30_17.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos4010ui_story, var_30_21, var_30_20)

				local var_30_22 = manager.ui.mainCamera.transform.position - var_30_17.position

				var_30_17.forward = Vector3.New(var_30_22.x, var_30_22.y, var_30_22.z)

				local var_30_23 = var_30_17.localEulerAngles

				var_30_23.z = 0
				var_30_23.x = 0
				var_30_17.localEulerAngles = var_30_23
			end

			if arg_27_1.time_ >= var_30_18 + var_30_19 and arg_27_1.time_ < var_30_18 + var_30_19 + arg_30_0 then
				var_30_17.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_30_24 = manager.ui.mainCamera.transform.position - var_30_17.position

				var_30_17.forward = Vector3.New(var_30_24.x, var_30_24.y, var_30_24.z)

				local var_30_25 = var_30_17.localEulerAngles

				var_30_25.z = 0
				var_30_25.x = 0
				var_30_17.localEulerAngles = var_30_25
			end

			local var_30_26 = 0

			if var_30_26 < arg_27_1.time_ and arg_27_1.time_ <= var_30_26 + arg_30_0 then
				arg_27_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_30_27 = 0

			if var_30_27 < arg_27_1.time_ and arg_27_1.time_ <= var_30_27 + arg_30_0 then
				arg_27_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_30_28 = 0
			local var_30_29 = 0.425

			if var_30_28 < arg_27_1.time_ and arg_27_1.time_ <= var_30_28 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_30 = arg_27_1:FormatText(StoryNameCfg[42].name)

				arg_27_1.leftNameTxt_.text = var_30_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_31 = arg_27_1:GetWordFromCfg(102112007)
				local var_30_32 = arg_27_1:FormatText(var_30_31.content)

				arg_27_1.text_.text = var_30_32

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_33 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112007", "story_v_out_102112.awb") ~= 0 then
					local var_30_36 = manager.audio:GetVoiceLength("story_v_out_102112", "102112007", "story_v_out_102112.awb") / 1000

					if var_30_36 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_28
					end

					if var_30_31.prefab_name ~= "" and arg_27_1.actors_[var_30_31.prefab_name] ~= nil then
						local var_30_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_31.prefab_name].transform, "story_v_out_102112", "102112007", "story_v_out_102112.awb")

						arg_27_1:RecordAudio("102112007", var_30_37)
						arg_27_1:RecordAudio("102112007", var_30_37)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_102112", "102112007", "story_v_out_102112.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_102112", "102112007", "story_v_out_102112.awb")
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
	Play102112008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 102112008
		arg_31_1.duration_ = 2.6

		local var_31_0 = {
			ja = 2.2,
			ko = 2.6,
			zh = 2,
			en = 2.066
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
				arg_31_0:Play102112009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["3008ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect3008ui_story == nil then
				arg_31_1.var_.characterEffect3008ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect3008ui_story then
					arg_31_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect3008ui_story then
				arg_31_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["4010ui_story"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos4010ui_story = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0, 100, 0)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos4010ui_story, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0, 100, 0)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = arg_31_1.actors_["3008ui_story"].transform
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1.var_.moveOldPos3008ui_story = var_34_13.localPosition
			end

			local var_34_15 = 0.001

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15
				local var_34_17 = Vector3.New(0, -1.51, -4.3)

				var_34_13.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos3008ui_story, var_34_17, var_34_16)

				local var_34_18 = manager.ui.mainCamera.transform.position - var_34_13.position

				var_34_13.forward = Vector3.New(var_34_18.x, var_34_18.y, var_34_18.z)

				local var_34_19 = var_34_13.localEulerAngles

				var_34_19.z = 0
				var_34_19.x = 0
				var_34_13.localEulerAngles = var_34_19
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 then
				var_34_13.localPosition = Vector3.New(0, -1.51, -4.3)

				local var_34_20 = manager.ui.mainCamera.transform.position - var_34_13.position

				var_34_13.forward = Vector3.New(var_34_20.x, var_34_20.y, var_34_20.z)

				local var_34_21 = var_34_13.localEulerAngles

				var_34_21.z = 0
				var_34_21.x = 0
				var_34_13.localEulerAngles = var_34_21
			end

			local var_34_22 = 0

			if var_34_22 < arg_31_1.time_ and arg_31_1.time_ <= var_34_22 + arg_34_0 then
				arg_31_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action7_2")
			end

			local var_34_23 = 0

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 then
				arg_31_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_34_24 = 0
			local var_34_25 = 0.15

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_26 = arg_31_1:FormatText(StoryNameCfg[20].name)

				arg_31_1.leftNameTxt_.text = var_34_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_27 = arg_31_1:GetWordFromCfg(102112008)
				local var_34_28 = arg_31_1:FormatText(var_34_27.content)

				arg_31_1.text_.text = var_34_28

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_29 = 6
				local var_34_30 = utf8.len(var_34_28)
				local var_34_31 = var_34_29 <= 0 and var_34_25 or var_34_25 * (var_34_30 / var_34_29)

				if var_34_31 > 0 and var_34_25 < var_34_31 then
					arg_31_1.talkMaxDuration = var_34_31

					if var_34_31 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_31 + var_34_24
					end
				end

				arg_31_1.text_.text = var_34_28
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112008", "story_v_out_102112.awb") ~= 0 then
					local var_34_32 = manager.audio:GetVoiceLength("story_v_out_102112", "102112008", "story_v_out_102112.awb") / 1000

					if var_34_32 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_32 + var_34_24
					end

					if var_34_27.prefab_name ~= "" and arg_31_1.actors_[var_34_27.prefab_name] ~= nil then
						local var_34_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_27.prefab_name].transform, "story_v_out_102112", "102112008", "story_v_out_102112.awb")

						arg_31_1:RecordAudio("102112008", var_34_33)
						arg_31_1:RecordAudio("102112008", var_34_33)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_102112", "102112008", "story_v_out_102112.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_102112", "102112008", "story_v_out_102112.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_34 = math.max(var_34_25, arg_31_1.talkMaxDuration)

			if var_34_24 <= arg_31_1.time_ and arg_31_1.time_ < var_34_24 + var_34_34 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_24) / var_34_34

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_24 + var_34_34 and arg_31_1.time_ < var_34_24 + var_34_34 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play102112009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 102112009
		arg_35_1.duration_ = 3.466

		local var_35_0 = {
			ja = 2.7,
			ko = 2.266,
			zh = 2.866,
			en = 3.466
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
				arg_35_0:Play102112010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "1084ui_story"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("Char/" .. var_38_0), arg_35_1.stage_.transform)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_0] = var_38_1

				local var_38_2 = var_38_1:GetComponentInChildren(typeof(CharacterEffect))

				var_38_2.enabled = true

				local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_1, typeof(DynamicBoneHelper))

				if var_38_3 then
					var_38_3:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_2.transform, false)

				arg_35_1.var_[var_38_0 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_0 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_0 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_4 = arg_35_1.actors_["1084ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1084ui_story then
					arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_38_8 = arg_35_1.actors_["3008ui_story"].transform
			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 then
				arg_35_1.var_.moveOldPos3008ui_story = var_38_8.localPosition
			end

			local var_38_10 = 0.001

			if var_38_9 <= arg_35_1.time_ and arg_35_1.time_ < var_38_9 + var_38_10 then
				local var_38_11 = (arg_35_1.time_ - var_38_9) / var_38_10
				local var_38_12 = Vector3.New(0, 100, 0)

				var_38_8.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos3008ui_story, var_38_12, var_38_11)

				local var_38_13 = manager.ui.mainCamera.transform.position - var_38_8.position

				var_38_8.forward = Vector3.New(var_38_13.x, var_38_13.y, var_38_13.z)

				local var_38_14 = var_38_8.localEulerAngles

				var_38_14.z = 0
				var_38_14.x = 0
				var_38_8.localEulerAngles = var_38_14
			end

			if arg_35_1.time_ >= var_38_9 + var_38_10 and arg_35_1.time_ < var_38_9 + var_38_10 + arg_38_0 then
				var_38_8.localPosition = Vector3.New(0, 100, 0)

				local var_38_15 = manager.ui.mainCamera.transform.position - var_38_8.position

				var_38_8.forward = Vector3.New(var_38_15.x, var_38_15.y, var_38_15.z)

				local var_38_16 = var_38_8.localEulerAngles

				var_38_16.z = 0
				var_38_16.x = 0
				var_38_8.localEulerAngles = var_38_16
			end

			local var_38_17 = 0

			if var_38_17 < arg_35_1.time_ and arg_35_1.time_ <= var_38_17 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_38_18 = arg_35_1.actors_["1084ui_story"].transform
			local var_38_19 = 0

			if var_38_19 < arg_35_1.time_ and arg_35_1.time_ <= var_38_19 + arg_38_0 then
				arg_35_1.var_.moveOldPos1084ui_story = var_38_18.localPosition
			end

			local var_38_20 = 0.001

			if var_38_19 <= arg_35_1.time_ and arg_35_1.time_ < var_38_19 + var_38_20 then
				local var_38_21 = (arg_35_1.time_ - var_38_19) / var_38_20
				local var_38_22 = Vector3.New(-0.7, -0.97, -6)

				var_38_18.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1084ui_story, var_38_22, var_38_21)

				local var_38_23 = manager.ui.mainCamera.transform.position - var_38_18.position

				var_38_18.forward = Vector3.New(var_38_23.x, var_38_23.y, var_38_23.z)

				local var_38_24 = var_38_18.localEulerAngles

				var_38_24.z = 0
				var_38_24.x = 0
				var_38_18.localEulerAngles = var_38_24
			end

			if arg_35_1.time_ >= var_38_19 + var_38_20 and arg_35_1.time_ < var_38_19 + var_38_20 + arg_38_0 then
				var_38_18.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_38_25 = manager.ui.mainCamera.transform.position - var_38_18.position

				var_38_18.forward = Vector3.New(var_38_25.x, var_38_25.y, var_38_25.z)

				local var_38_26 = var_38_18.localEulerAngles

				var_38_26.z = 0
				var_38_26.x = 0
				var_38_18.localEulerAngles = var_38_26
			end

			local var_38_27 = 0

			if var_38_27 < arg_35_1.time_ and arg_35_1.time_ <= var_38_27 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_38_28 = 0
			local var_38_29 = 0.2

			if var_38_28 < arg_35_1.time_ and arg_35_1.time_ <= var_38_28 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_30 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_31 = arg_35_1:GetWordFromCfg(102112009)
				local var_38_32 = arg_35_1:FormatText(var_38_31.content)

				arg_35_1.text_.text = var_38_32

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_33 = 8
				local var_38_34 = utf8.len(var_38_32)
				local var_38_35 = var_38_33 <= 0 and var_38_29 or var_38_29 * (var_38_34 / var_38_33)

				if var_38_35 > 0 and var_38_29 < var_38_35 then
					arg_35_1.talkMaxDuration = var_38_35

					if var_38_35 + var_38_28 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_35 + var_38_28
					end
				end

				arg_35_1.text_.text = var_38_32
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112009", "story_v_out_102112.awb") ~= 0 then
					local var_38_36 = manager.audio:GetVoiceLength("story_v_out_102112", "102112009", "story_v_out_102112.awb") / 1000

					if var_38_36 + var_38_28 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_36 + var_38_28
					end

					if var_38_31.prefab_name ~= "" and arg_35_1.actors_[var_38_31.prefab_name] ~= nil then
						local var_38_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_31.prefab_name].transform, "story_v_out_102112", "102112009", "story_v_out_102112.awb")

						arg_35_1:RecordAudio("102112009", var_38_37)
						arg_35_1:RecordAudio("102112009", var_38_37)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_102112", "102112009", "story_v_out_102112.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_102112", "102112009", "story_v_out_102112.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_38 = math.max(var_38_29, arg_35_1.talkMaxDuration)

			if var_38_28 <= arg_35_1.time_ and arg_35_1.time_ < var_38_28 + var_38_38 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_28) / var_38_38

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_28 + var_38_38 and arg_35_1.time_ < var_38_28 + var_38_38 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play102112010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 102112010
		arg_39_1.duration_ = 3

		local var_39_0 = {
			ja = 2.366,
			ko = 2.3,
			zh = 3,
			en = 3
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
				arg_39_0:Play102112011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1019ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1019ui_story == nil then
				arg_39_1.var_.characterEffect1019ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1019ui_story then
					arg_39_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1019ui_story then
				arg_39_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1084ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1084ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1084ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1084ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_42_11 = arg_39_1.actors_["1019ui_story"].transform
			local var_42_12 = 0

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.var_.moveOldPos1019ui_story = var_42_11.localPosition
			end

			local var_42_13 = 0.001

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_13 then
				local var_42_14 = (arg_39_1.time_ - var_42_12) / var_42_13
				local var_42_15 = Vector3.New(0.7, -1.08, -5.9)

				var_42_11.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1019ui_story, var_42_15, var_42_14)

				local var_42_16 = manager.ui.mainCamera.transform.position - var_42_11.position

				var_42_11.forward = Vector3.New(var_42_16.x, var_42_16.y, var_42_16.z)

				local var_42_17 = var_42_11.localEulerAngles

				var_42_17.z = 0
				var_42_17.x = 0
				var_42_11.localEulerAngles = var_42_17
			end

			if arg_39_1.time_ >= var_42_12 + var_42_13 and arg_39_1.time_ < var_42_12 + var_42_13 + arg_42_0 then
				var_42_11.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_42_18 = manager.ui.mainCamera.transform.position - var_42_11.position

				var_42_11.forward = Vector3.New(var_42_18.x, var_42_18.y, var_42_18.z)

				local var_42_19 = var_42_11.localEulerAngles

				var_42_19.z = 0
				var_42_19.x = 0
				var_42_11.localEulerAngles = var_42_19
			end

			local var_42_20 = 0

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_42_21 = 0
			local var_42_22 = 0.4

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_23 = arg_39_1:FormatText(StoryNameCfg[13].name)

				arg_39_1.leftNameTxt_.text = var_42_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_24 = arg_39_1:GetWordFromCfg(102112010)
				local var_42_25 = arg_39_1:FormatText(var_42_24.content)

				arg_39_1.text_.text = var_42_25

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_26 = 16
				local var_42_27 = utf8.len(var_42_25)
				local var_42_28 = var_42_26 <= 0 and var_42_22 or var_42_22 * (var_42_27 / var_42_26)

				if var_42_28 > 0 and var_42_22 < var_42_28 then
					arg_39_1.talkMaxDuration = var_42_28

					if var_42_28 + var_42_21 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_28 + var_42_21
					end
				end

				arg_39_1.text_.text = var_42_25
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112010", "story_v_out_102112.awb") ~= 0 then
					local var_42_29 = manager.audio:GetVoiceLength("story_v_out_102112", "102112010", "story_v_out_102112.awb") / 1000

					if var_42_29 + var_42_21 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_29 + var_42_21
					end

					if var_42_24.prefab_name ~= "" and arg_39_1.actors_[var_42_24.prefab_name] ~= nil then
						local var_42_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_24.prefab_name].transform, "story_v_out_102112", "102112010", "story_v_out_102112.awb")

						arg_39_1:RecordAudio("102112010", var_42_30)
						arg_39_1:RecordAudio("102112010", var_42_30)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_102112", "102112010", "story_v_out_102112.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_102112", "102112010", "story_v_out_102112.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_31 = math.max(var_42_22, arg_39_1.talkMaxDuration)

			if var_42_21 <= arg_39_1.time_ and arg_39_1.time_ < var_42_21 + var_42_31 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_21) / var_42_31

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_21 + var_42_31 and arg_39_1.time_ < var_42_21 + var_42_31 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play102112011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 102112011
		arg_43_1.duration_ = 4.833

		local var_43_0 = {
			ja = 4.833,
			ko = 4,
			zh = 3.733,
			en = 3.066
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
				arg_43_0:Play102112012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["3008ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect3008ui_story == nil then
				arg_43_1.var_.characterEffect3008ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect3008ui_story then
					arg_43_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect3008ui_story then
				arg_43_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1019ui_story"].transform
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1.var_.moveOldPos1019ui_story = var_46_4.localPosition
			end

			local var_46_6 = 0.001

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6
				local var_46_8 = Vector3.New(0, 100, 0)

				var_46_4.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1019ui_story, var_46_8, var_46_7)

				local var_46_9 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_9.x, var_46_9.y, var_46_9.z)

				local var_46_10 = var_46_4.localEulerAngles

				var_46_10.z = 0
				var_46_10.x = 0
				var_46_4.localEulerAngles = var_46_10
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 then
				var_46_4.localPosition = Vector3.New(0, 100, 0)

				local var_46_11 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_11.x, var_46_11.y, var_46_11.z)

				local var_46_12 = var_46_4.localEulerAngles

				var_46_12.z = 0
				var_46_12.x = 0
				var_46_4.localEulerAngles = var_46_12
			end

			local var_46_13 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_13.localPosition
			end

			local var_46_15 = 0.001

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15
				local var_46_17 = Vector3.New(0, 100, 0)

				var_46_13.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_17, var_46_16)

				local var_46_18 = manager.ui.mainCamera.transform.position - var_46_13.position

				var_46_13.forward = Vector3.New(var_46_18.x, var_46_18.y, var_46_18.z)

				local var_46_19 = var_46_13.localEulerAngles

				var_46_19.z = 0
				var_46_19.x = 0
				var_46_13.localEulerAngles = var_46_19
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 then
				var_46_13.localPosition = Vector3.New(0, 100, 0)

				local var_46_20 = manager.ui.mainCamera.transform.position - var_46_13.position

				var_46_13.forward = Vector3.New(var_46_20.x, var_46_20.y, var_46_20.z)

				local var_46_21 = var_46_13.localEulerAngles

				var_46_21.z = 0
				var_46_21.x = 0
				var_46_13.localEulerAngles = var_46_21
			end

			local var_46_22 = arg_43_1.actors_["3008ui_story"].transform
			local var_46_23 = 0

			if var_46_23 < arg_43_1.time_ and arg_43_1.time_ <= var_46_23 + arg_46_0 then
				arg_43_1.var_.moveOldPos3008ui_story = var_46_22.localPosition
			end

			local var_46_24 = 0.001

			if var_46_23 <= arg_43_1.time_ and arg_43_1.time_ < var_46_23 + var_46_24 then
				local var_46_25 = (arg_43_1.time_ - var_46_23) / var_46_24
				local var_46_26 = Vector3.New(-0.7, -1.51, -4.3)

				var_46_22.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos3008ui_story, var_46_26, var_46_25)

				local var_46_27 = manager.ui.mainCamera.transform.position - var_46_22.position

				var_46_22.forward = Vector3.New(var_46_27.x, var_46_27.y, var_46_27.z)

				local var_46_28 = var_46_22.localEulerAngles

				var_46_28.z = 0
				var_46_28.x = 0
				var_46_22.localEulerAngles = var_46_28
			end

			if arg_43_1.time_ >= var_46_23 + var_46_24 and arg_43_1.time_ < var_46_23 + var_46_24 + arg_46_0 then
				var_46_22.localPosition = Vector3.New(-0.7, -1.51, -4.3)

				local var_46_29 = manager.ui.mainCamera.transform.position - var_46_22.position

				var_46_22.forward = Vector3.New(var_46_29.x, var_46_29.y, var_46_29.z)

				local var_46_30 = var_46_22.localEulerAngles

				var_46_30.z = 0
				var_46_30.x = 0
				var_46_22.localEulerAngles = var_46_30
			end

			local var_46_31 = 0

			if var_46_31 < arg_43_1.time_ and arg_43_1.time_ <= var_46_31 + arg_46_0 then
				arg_43_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action1_1")
			end

			local var_46_32 = 0

			if var_46_32 < arg_43_1.time_ and arg_43_1.time_ <= var_46_32 + arg_46_0 then
				arg_43_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_46_33 = 0
			local var_46_34 = 0.425

			if var_46_33 < arg_43_1.time_ and arg_43_1.time_ <= var_46_33 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_35 = arg_43_1:FormatText(StoryNameCfg[20].name)

				arg_43_1.leftNameTxt_.text = var_46_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_36 = arg_43_1:GetWordFromCfg(102112011)
				local var_46_37 = arg_43_1:FormatText(var_46_36.content)

				arg_43_1.text_.text = var_46_37

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_38 = 17
				local var_46_39 = utf8.len(var_46_37)
				local var_46_40 = var_46_38 <= 0 and var_46_34 or var_46_34 * (var_46_39 / var_46_38)

				if var_46_40 > 0 and var_46_34 < var_46_40 then
					arg_43_1.talkMaxDuration = var_46_40

					if var_46_40 + var_46_33 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_40 + var_46_33
					end
				end

				arg_43_1.text_.text = var_46_37
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112011", "story_v_out_102112.awb") ~= 0 then
					local var_46_41 = manager.audio:GetVoiceLength("story_v_out_102112", "102112011", "story_v_out_102112.awb") / 1000

					if var_46_41 + var_46_33 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_41 + var_46_33
					end

					if var_46_36.prefab_name ~= "" and arg_43_1.actors_[var_46_36.prefab_name] ~= nil then
						local var_46_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_36.prefab_name].transform, "story_v_out_102112", "102112011", "story_v_out_102112.awb")

						arg_43_1:RecordAudio("102112011", var_46_42)
						arg_43_1:RecordAudio("102112011", var_46_42)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_102112", "102112011", "story_v_out_102112.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_102112", "102112011", "story_v_out_102112.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_43 = math.max(var_46_34, arg_43_1.talkMaxDuration)

			if var_46_33 <= arg_43_1.time_ and arg_43_1.time_ < var_46_33 + var_46_43 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_33) / var_46_43

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_33 + var_46_43 and arg_43_1.time_ < var_46_33 + var_46_43 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play102112012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 102112012
		arg_47_1.duration_ = 10.966

		local var_47_0 = {
			ja = 10.966,
			ko = 7.6,
			zh = 8.8,
			en = 6.766
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
				arg_47_0:Play102112013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["4010ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story == nil then
				arg_47_1.var_.characterEffect4010ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect4010ui_story then
					arg_47_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story then
				arg_47_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["3008ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect3008ui_story == nil then
				arg_47_1.var_.characterEffect3008ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.1

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect3008ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_47_1.var_.characterEffect3008ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect3008ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_47_1.var_.characterEffect3008ui_story.fillRatio = var_50_9
			end

			local var_50_10 = arg_47_1.actors_["4010ui_story"].transform
			local var_50_11 = 0

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1.var_.moveOldPos4010ui_story = var_50_10.localPosition
			end

			local var_50_12 = 0.001

			if var_50_11 <= arg_47_1.time_ and arg_47_1.time_ < var_50_11 + var_50_12 then
				local var_50_13 = (arg_47_1.time_ - var_50_11) / var_50_12
				local var_50_14 = Vector3.New(0.7, -1.59, -5.2)

				var_50_10.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos4010ui_story, var_50_14, var_50_13)

				local var_50_15 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_15.x, var_50_15.y, var_50_15.z)

				local var_50_16 = var_50_10.localEulerAngles

				var_50_16.z = 0
				var_50_16.x = 0
				var_50_10.localEulerAngles = var_50_16
			end

			if arg_47_1.time_ >= var_50_11 + var_50_12 and arg_47_1.time_ < var_50_11 + var_50_12 + arg_50_0 then
				var_50_10.localPosition = Vector3.New(0.7, -1.59, -5.2)

				local var_50_17 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_17.x, var_50_17.y, var_50_17.z)

				local var_50_18 = var_50_10.localEulerAngles

				var_50_18.z = 0
				var_50_18.x = 0
				var_50_10.localEulerAngles = var_50_18
			end

			local var_50_19 = 0

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_50_20 = 0

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_50_21 = 0
			local var_50_22 = 1.05

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_23 = arg_47_1:FormatText(StoryNameCfg[42].name)

				arg_47_1.leftNameTxt_.text = var_50_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_24 = arg_47_1:GetWordFromCfg(102112012)
				local var_50_25 = arg_47_1:FormatText(var_50_24.content)

				arg_47_1.text_.text = var_50_25

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_26 = 42
				local var_50_27 = utf8.len(var_50_25)
				local var_50_28 = var_50_26 <= 0 and var_50_22 or var_50_22 * (var_50_27 / var_50_26)

				if var_50_28 > 0 and var_50_22 < var_50_28 then
					arg_47_1.talkMaxDuration = var_50_28

					if var_50_28 + var_50_21 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_21
					end
				end

				arg_47_1.text_.text = var_50_25
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112012", "story_v_out_102112.awb") ~= 0 then
					local var_50_29 = manager.audio:GetVoiceLength("story_v_out_102112", "102112012", "story_v_out_102112.awb") / 1000

					if var_50_29 + var_50_21 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_29 + var_50_21
					end

					if var_50_24.prefab_name ~= "" and arg_47_1.actors_[var_50_24.prefab_name] ~= nil then
						local var_50_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_24.prefab_name].transform, "story_v_out_102112", "102112012", "story_v_out_102112.awb")

						arg_47_1:RecordAudio("102112012", var_50_30)
						arg_47_1:RecordAudio("102112012", var_50_30)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_102112", "102112012", "story_v_out_102112.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_102112", "102112012", "story_v_out_102112.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_31 = math.max(var_50_22, arg_47_1.talkMaxDuration)

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_31 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_21) / var_50_31

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_21 + var_50_31 and arg_47_1.time_ < var_50_21 + var_50_31 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play102112013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 102112013
		arg_51_1.duration_ = 1.999999999999

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play102112014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1019ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1019ui_story == nil then
				arg_51_1.var_.characterEffect1019ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1019ui_story then
					arg_51_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1019ui_story then
				arg_51_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["4010ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect4010ui_story == nil then
				arg_51_1.var_.characterEffect4010ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect4010ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_51_1.var_.characterEffect4010ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect4010ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_51_1.var_.characterEffect4010ui_story.fillRatio = var_54_9
			end

			local var_54_10 = arg_51_1.actors_["4010ui_story"].transform
			local var_54_11 = 0

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.var_.moveOldPos4010ui_story = var_54_10.localPosition
			end

			local var_54_12 = 0.001

			if var_54_11 <= arg_51_1.time_ and arg_51_1.time_ < var_54_11 + var_54_12 then
				local var_54_13 = (arg_51_1.time_ - var_54_11) / var_54_12
				local var_54_14 = Vector3.New(0, 100, 0)

				var_54_10.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos4010ui_story, var_54_14, var_54_13)

				local var_54_15 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_15.x, var_54_15.y, var_54_15.z)

				local var_54_16 = var_54_10.localEulerAngles

				var_54_16.z = 0
				var_54_16.x = 0
				var_54_10.localEulerAngles = var_54_16
			end

			if arg_51_1.time_ >= var_54_11 + var_54_12 and arg_51_1.time_ < var_54_11 + var_54_12 + arg_54_0 then
				var_54_10.localPosition = Vector3.New(0, 100, 0)

				local var_54_17 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_17.x, var_54_17.y, var_54_17.z)

				local var_54_18 = var_54_10.localEulerAngles

				var_54_18.z = 0
				var_54_18.x = 0
				var_54_10.localEulerAngles = var_54_18
			end

			local var_54_19 = arg_51_1.actors_["1019ui_story"].transform
			local var_54_20 = 0

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1.var_.moveOldPos1019ui_story = var_54_19.localPosition
			end

			local var_54_21 = 0.001

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_21 then
				local var_54_22 = (arg_51_1.time_ - var_54_20) / var_54_21
				local var_54_23 = Vector3.New(0, -1.08, -5.9)

				var_54_19.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1019ui_story, var_54_23, var_54_22)

				local var_54_24 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_24.x, var_54_24.y, var_54_24.z)

				local var_54_25 = var_54_19.localEulerAngles

				var_54_25.z = 0
				var_54_25.x = 0
				var_54_19.localEulerAngles = var_54_25
			end

			if arg_51_1.time_ >= var_54_20 + var_54_21 and arg_51_1.time_ < var_54_20 + var_54_21 + arg_54_0 then
				var_54_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_54_26 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_26.x, var_54_26.y, var_54_26.z)

				local var_54_27 = var_54_19.localEulerAngles

				var_54_27.z = 0
				var_54_27.x = 0
				var_54_19.localEulerAngles = var_54_27
			end

			local var_54_28 = 0

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_54_29 = arg_51_1.actors_["3008ui_story"].transform
			local var_54_30 = 0

			if var_54_30 < arg_51_1.time_ and arg_51_1.time_ <= var_54_30 + arg_54_0 then
				arg_51_1.var_.moveOldPos3008ui_story = var_54_29.localPosition
			end

			local var_54_31 = 0.001

			if var_54_30 <= arg_51_1.time_ and arg_51_1.time_ < var_54_30 + var_54_31 then
				local var_54_32 = (arg_51_1.time_ - var_54_30) / var_54_31
				local var_54_33 = Vector3.New(0, 100, 0)

				var_54_29.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos3008ui_story, var_54_33, var_54_32)

				local var_54_34 = manager.ui.mainCamera.transform.position - var_54_29.position

				var_54_29.forward = Vector3.New(var_54_34.x, var_54_34.y, var_54_34.z)

				local var_54_35 = var_54_29.localEulerAngles

				var_54_35.z = 0
				var_54_35.x = 0
				var_54_29.localEulerAngles = var_54_35
			end

			if arg_51_1.time_ >= var_54_30 + var_54_31 and arg_51_1.time_ < var_54_30 + var_54_31 + arg_54_0 then
				var_54_29.localPosition = Vector3.New(0, 100, 0)

				local var_54_36 = manager.ui.mainCamera.transform.position - var_54_29.position

				var_54_29.forward = Vector3.New(var_54_36.x, var_54_36.y, var_54_36.z)

				local var_54_37 = var_54_29.localEulerAngles

				var_54_37.z = 0
				var_54_37.x = 0
				var_54_29.localEulerAngles = var_54_37
			end

			local var_54_38 = 0
			local var_54_39 = 0.075

			if var_54_38 < arg_51_1.time_ and arg_51_1.time_ <= var_54_38 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_40 = arg_51_1:FormatText(StoryNameCfg[13].name)

				arg_51_1.leftNameTxt_.text = var_54_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_41 = arg_51_1:GetWordFromCfg(102112013)
				local var_54_42 = arg_51_1:FormatText(var_54_41.content)

				arg_51_1.text_.text = var_54_42

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_43 = 3
				local var_54_44 = utf8.len(var_54_42)
				local var_54_45 = var_54_43 <= 0 and var_54_39 or var_54_39 * (var_54_44 / var_54_43)

				if var_54_45 > 0 and var_54_39 < var_54_45 then
					arg_51_1.talkMaxDuration = var_54_45

					if var_54_45 + var_54_38 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_45 + var_54_38
					end
				end

				arg_51_1.text_.text = var_54_42
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112013", "story_v_out_102112.awb") ~= 0 then
					local var_54_46 = manager.audio:GetVoiceLength("story_v_out_102112", "102112013", "story_v_out_102112.awb") / 1000

					if var_54_46 + var_54_38 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_46 + var_54_38
					end

					if var_54_41.prefab_name ~= "" and arg_51_1.actors_[var_54_41.prefab_name] ~= nil then
						local var_54_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_41.prefab_name].transform, "story_v_out_102112", "102112013", "story_v_out_102112.awb")

						arg_51_1:RecordAudio("102112013", var_54_47)
						arg_51_1:RecordAudio("102112013", var_54_47)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_102112", "102112013", "story_v_out_102112.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_102112", "102112013", "story_v_out_102112.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_48 = math.max(var_54_39, arg_51_1.talkMaxDuration)

			if var_54_38 <= arg_51_1.time_ and arg_51_1.time_ < var_54_38 + var_54_48 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_38) / var_54_48

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_38 + var_54_48 and arg_51_1.time_ < var_54_38 + var_54_48 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play102112014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 102112014
		arg_55_1.duration_ = 15.566

		local var_55_0 = {
			ja = 15.566,
			ko = 7.633,
			zh = 10.133,
			en = 13.366
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
			arg_55_1.auto_ = false
		end

		function arg_55_1.playNext_(arg_57_0)
			arg_55_1.onStoryFinished_()
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["4010ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect4010ui_story == nil then
				arg_55_1.var_.characterEffect4010ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect4010ui_story then
					arg_55_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect4010ui_story then
				arg_55_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1019ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect1019ui_story == nil then
				arg_55_1.var_.characterEffect1019ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1019ui_story then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1019ui_story.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect1019ui_story then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1019ui_story.fillRatio = var_58_9
			end

			local var_58_10 = arg_55_1.actors_["1019ui_story"].transform
			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1.var_.moveOldPos1019ui_story = var_58_10.localPosition
			end

			local var_58_12 = 0.001

			if var_58_11 <= arg_55_1.time_ and arg_55_1.time_ < var_58_11 + var_58_12 then
				local var_58_13 = (arg_55_1.time_ - var_58_11) / var_58_12
				local var_58_14 = Vector3.New(0, 100, 0)

				var_58_10.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1019ui_story, var_58_14, var_58_13)

				local var_58_15 = manager.ui.mainCamera.transform.position - var_58_10.position

				var_58_10.forward = Vector3.New(var_58_15.x, var_58_15.y, var_58_15.z)

				local var_58_16 = var_58_10.localEulerAngles

				var_58_16.z = 0
				var_58_16.x = 0
				var_58_10.localEulerAngles = var_58_16
			end

			if arg_55_1.time_ >= var_58_11 + var_58_12 and arg_55_1.time_ < var_58_11 + var_58_12 + arg_58_0 then
				var_58_10.localPosition = Vector3.New(0, 100, 0)

				local var_58_17 = manager.ui.mainCamera.transform.position - var_58_10.position

				var_58_10.forward = Vector3.New(var_58_17.x, var_58_17.y, var_58_17.z)

				local var_58_18 = var_58_10.localEulerAngles

				var_58_18.z = 0
				var_58_18.x = 0
				var_58_10.localEulerAngles = var_58_18
			end

			local var_58_19 = arg_55_1.actors_["4010ui_story"].transform
			local var_58_20 = 0

			if var_58_20 < arg_55_1.time_ and arg_55_1.time_ <= var_58_20 + arg_58_0 then
				arg_55_1.var_.moveOldPos4010ui_story = var_58_19.localPosition
			end

			local var_58_21 = 0.001

			if var_58_20 <= arg_55_1.time_ and arg_55_1.time_ < var_58_20 + var_58_21 then
				local var_58_22 = (arg_55_1.time_ - var_58_20) / var_58_21
				local var_58_23 = Vector3.New(0, -1.59, -5.2)

				var_58_19.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos4010ui_story, var_58_23, var_58_22)

				local var_58_24 = manager.ui.mainCamera.transform.position - var_58_19.position

				var_58_19.forward = Vector3.New(var_58_24.x, var_58_24.y, var_58_24.z)

				local var_58_25 = var_58_19.localEulerAngles

				var_58_25.z = 0
				var_58_25.x = 0
				var_58_19.localEulerAngles = var_58_25
			end

			if arg_55_1.time_ >= var_58_20 + var_58_21 and arg_55_1.time_ < var_58_20 + var_58_21 + arg_58_0 then
				var_58_19.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_58_26 = manager.ui.mainCamera.transform.position - var_58_19.position

				var_58_19.forward = Vector3.New(var_58_26.x, var_58_26.y, var_58_26.z)

				local var_58_27 = var_58_19.localEulerAngles

				var_58_27.z = 0
				var_58_27.x = 0
				var_58_19.localEulerAngles = var_58_27
			end

			local var_58_28 = 0

			if var_58_28 < arg_55_1.time_ and arg_55_1.time_ <= var_58_28 + arg_58_0 then
				arg_55_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action7_1")
			end

			local var_58_29 = 0

			if var_58_29 < arg_55_1.time_ and arg_55_1.time_ <= var_58_29 + arg_58_0 then
				arg_55_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_58_30 = 0
			local var_58_31 = 1.05

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_32 = arg_55_1:FormatText(StoryNameCfg[42].name)

				arg_55_1.leftNameTxt_.text = var_58_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_33 = arg_55_1:GetWordFromCfg(102112014)
				local var_58_34 = arg_55_1:FormatText(var_58_33.content)

				arg_55_1.text_.text = var_58_34

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_35 = 42
				local var_58_36 = utf8.len(var_58_34)
				local var_58_37 = var_58_35 <= 0 and var_58_31 or var_58_31 * (var_58_36 / var_58_35)

				if var_58_37 > 0 and var_58_31 < var_58_37 then
					arg_55_1.talkMaxDuration = var_58_37

					if var_58_37 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_37 + var_58_30
					end
				end

				arg_55_1.text_.text = var_58_34
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102112", "102112014", "story_v_out_102112.awb") ~= 0 then
					local var_58_38 = manager.audio:GetVoiceLength("story_v_out_102112", "102112014", "story_v_out_102112.awb") / 1000

					if var_58_38 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_38 + var_58_30
					end

					if var_58_33.prefab_name ~= "" and arg_55_1.actors_[var_58_33.prefab_name] ~= nil then
						local var_58_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_33.prefab_name].transform, "story_v_out_102112", "102112014", "story_v_out_102112.awb")

						arg_55_1:RecordAudio("102112014", var_58_39)
						arg_55_1:RecordAudio("102112014", var_58_39)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_102112", "102112014", "story_v_out_102112.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_102112", "102112014", "story_v_out_102112.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_40 = math.max(var_58_31, arg_55_1.talkMaxDuration)

			if var_58_30 <= arg_55_1.time_ and arg_55_1.time_ < var_58_30 + var_58_40 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_30) / var_58_40

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_30 + var_58_40 and arg_55_1.time_ < var_58_30 + var_58_40 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B08b"
	},
	voices = {
		"story_v_out_102112.awb"
	}
}
