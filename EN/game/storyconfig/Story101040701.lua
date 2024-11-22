return {
	Play104071001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104071001
		arg_1_1.duration_ = 7.033

		local var_1_0 = {
			ja = 7.033,
			ko = 5.7,
			zh = 5.833,
			en = 7.033
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
				arg_1_0:Play104071002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1")
			end

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_4_8 = "1019ui_story"

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

			local var_4_12 = arg_1_1.actors_["1019ui_story"]
			local var_4_13 = 2

			if var_4_13 < arg_1_1.time_ and arg_1_1.time_ <= var_4_13 + arg_4_0 and arg_1_1.var_.characterEffect1019ui_story == nil then
				arg_1_1.var_.characterEffect1019ui_story = var_4_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_14 = 0.1

			if var_4_13 <= arg_1_1.time_ and arg_1_1.time_ < var_4_13 + var_4_14 then
				local var_4_15 = (arg_1_1.time_ - var_4_13) / var_4_14

				if arg_1_1.var_.characterEffect1019ui_story then
					arg_1_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_13 + var_4_14 and arg_1_1.time_ < var_4_13 + var_4_14 + arg_4_0 and arg_1_1.var_.characterEffect1019ui_story then
				arg_1_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_4_16 = "B06a"

			if arg_1_1.bgs_[var_4_16] == nil then
				local var_4_17 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_17:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_16)
				var_4_17.name = var_4_16
				var_4_17.transform.parent = arg_1_1.stage_.transform
				var_4_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_16] = var_4_17
			end

			local var_4_18 = arg_1_1.bgs_.B06a
			local var_4_19 = 0

			if var_4_19 < arg_1_1.time_ and arg_1_1.time_ <= var_4_19 + arg_4_0 then
				local var_4_20 = var_4_18:GetComponent("SpriteRenderer")

				if var_4_20 then
					var_4_20.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_21 = var_4_20.material
					local var_4_22 = var_4_21:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB06a = var_4_22.a
					arg_1_1.var_.alphaMatValueB06a = var_4_21
				end

				arg_1_1.var_.alphaOldValueB06a = 0
			end

			local var_4_23 = 1.5

			if var_4_19 <= arg_1_1.time_ and arg_1_1.time_ < var_4_19 + var_4_23 then
				local var_4_24 = (arg_1_1.time_ - var_4_19) / var_4_23
				local var_4_25 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB06a, 1, var_4_24)

				if arg_1_1.var_.alphaMatValueB06a then
					local var_4_26 = arg_1_1.var_.alphaMatValueB06a
					local var_4_27 = var_4_26:GetColor("_Color")

					var_4_27.a = var_4_25

					var_4_26:SetColor("_Color", var_4_27)
				end
			end

			if arg_1_1.time_ >= var_4_19 + var_4_23 and arg_1_1.time_ < var_4_19 + var_4_23 + arg_4_0 and arg_1_1.var_.alphaMatValueB06a then
				local var_4_28 = arg_1_1.var_.alphaMatValueB06a
				local var_4_29 = var_4_28:GetColor("_Color")

				var_4_29.a = 1

				var_4_28:SetColor("_Color", var_4_29)
			end

			local var_4_30 = 0

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_31 = manager.ui.mainCamera.transform.localPosition
				local var_4_32 = Vector3.New(0, 0, 10) + Vector3.New(var_4_31.x, var_4_31.y, 0)
				local var_4_33 = arg_1_1.bgs_.B06a

				var_4_33.transform.localPosition = var_4_32
				var_4_33.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_34 = var_4_33:GetComponent("SpriteRenderer")

				if var_4_34 and var_4_34.sprite then
					local var_4_35 = (var_4_33.transform.localPosition - var_4_31).z
					local var_4_36 = manager.ui.mainCameraCom_
					local var_4_37 = 2 * var_4_35 * Mathf.Tan(var_4_36.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_38 = var_4_37 * var_4_36.aspect
					local var_4_39 = var_4_34.sprite.bounds.size.x
					local var_4_40 = var_4_34.sprite.bounds.size.y
					local var_4_41 = var_4_38 / var_4_39
					local var_4_42 = var_4_37 / var_4_40
					local var_4_43 = var_4_42 < var_4_41 and var_4_41 or var_4_42

					var_4_33.transform.localScale = Vector3.New(var_4_43, var_4_43, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B06a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_44 = arg_1_1.actors_["1019ui_story"].transform
			local var_4_45 = 1.79999995231628

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1.var_.moveOldPos1019ui_story = var_4_44.localPosition
			end

			local var_4_46 = 0.001

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				local var_4_47 = (arg_1_1.time_ - var_4_45) / var_4_46
				local var_4_48 = Vector3.New(-0.7, -1.08, -5.9)

				var_4_44.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1019ui_story, var_4_48, var_4_47)

				local var_4_49 = manager.ui.mainCamera.transform.position - var_4_44.position

				var_4_44.forward = Vector3.New(var_4_49.x, var_4_49.y, var_4_49.z)

				local var_4_50 = var_4_44.localEulerAngles

				var_4_50.z = 0
				var_4_50.x = 0
				var_4_44.localEulerAngles = var_4_50
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				var_4_44.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_4_51 = manager.ui.mainCamera.transform.position - var_4_44.position

				var_4_44.forward = Vector3.New(var_4_51.x, var_4_51.y, var_4_51.z)

				local var_4_52 = var_4_44.localEulerAngles

				var_4_52.z = 0
				var_4_52.x = 0
				var_4_44.localEulerAngles = var_4_52
			end

			local var_4_53 = 0

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_4_54 = 0

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_55 = 2

			if arg_1_1.time_ >= var_4_54 + var_4_55 and arg_1_1.time_ < var_4_54 + var_4_55 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_56 = 2
			local var_4_57 = 0.475

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_58 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_58:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_59 = arg_1_1:FormatText(StoryNameCfg[13].name)

				arg_1_1.leftNameTxt_.text = var_4_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_60 = arg_1_1:GetWordFromCfg(104071001)
				local var_4_61 = arg_1_1:FormatText(var_4_60.content)

				arg_1_1.text_.text = var_4_61

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_62 = 19
				local var_4_63 = utf8.len(var_4_61)
				local var_4_64 = var_4_62 <= 0 and var_4_57 or var_4_57 * (var_4_63 / var_4_62)

				if var_4_64 > 0 and var_4_57 < var_4_64 then
					arg_1_1.talkMaxDuration = var_4_64
					var_4_56 = var_4_56 + 0.3

					if var_4_64 + var_4_56 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_64 + var_4_56
					end
				end

				arg_1_1.text_.text = var_4_61
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071001", "story_v_out_104071.awb") ~= 0 then
					local var_4_65 = manager.audio:GetVoiceLength("story_v_out_104071", "104071001", "story_v_out_104071.awb") / 1000

					if var_4_65 + var_4_56 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_65 + var_4_56
					end

					if var_4_60.prefab_name ~= "" and arg_1_1.actors_[var_4_60.prefab_name] ~= nil then
						local var_4_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_60.prefab_name].transform, "story_v_out_104071", "104071001", "story_v_out_104071.awb")

						arg_1_1:RecordAudio("104071001", var_4_66)
						arg_1_1:RecordAudio("104071001", var_4_66)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_104071", "104071001", "story_v_out_104071.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_104071", "104071001", "story_v_out_104071.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_67 = var_4_56 + 0.3
			local var_4_68 = math.max(var_4_57, arg_1_1.talkMaxDuration)

			if var_4_67 <= arg_1_1.time_ and arg_1_1.time_ < var_4_67 + var_4_68 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_67) / var_4_68

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_67 + var_4_68 and arg_1_1.time_ < var_4_67 + var_4_68 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play104071002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104071002
		arg_7_1.duration_ = 16.666

		local var_7_0 = {
			ja = 16.666,
			ko = 15,
			zh = 13.966,
			en = 13.866
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
				arg_7_0:Play104071003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10001_tpose"

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

			local var_10_4 = arg_7_1.actors_["10001_tpose"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect10001_tpose == nil then
				arg_7_1.var_.characterEffect10001_tpose = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect10001_tpose then
					arg_7_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect10001_tpose then
				arg_7_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["1019ui_story"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story == nil then
				arg_7_1.var_.characterEffect1019ui_story = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect1019ui_story then
					local var_10_12 = Mathf.Lerp(0, 0.5, var_10_11)

					arg_7_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1019ui_story.fillRatio = var_10_12
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story then
				local var_10_13 = 0.5

				arg_7_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1019ui_story.fillRatio = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["10001_tpose"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos10001_tpose = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -1.23, -5.8)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10001_tpose, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -1.23, -5.8)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action2_1")
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_10_25 = 0
			local var_10_26 = 1.7

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[31].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(104071002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 68
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071002", "story_v_out_104071.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_104071", "104071002", "story_v_out_104071.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_104071", "104071002", "story_v_out_104071.awb")

						arg_7_1:RecordAudio("104071002", var_10_34)
						arg_7_1:RecordAudio("104071002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_104071", "104071002", "story_v_out_104071.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_104071", "104071002", "story_v_out_104071.awb")
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
	Play104071003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104071003
		arg_11_1.duration_ = 8.466

		local var_11_0 = {
			ja = 8.366,
			ko = 8.466,
			zh = 8.066,
			en = 8.033
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
				arg_11_0:Play104071004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action425")
			end

			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_14_2 = 0
			local var_14_3 = 1

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_4 = arg_11_1:FormatText(StoryNameCfg[31].name)

				arg_11_1.leftNameTxt_.text = var_14_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_5 = arg_11_1:GetWordFromCfg(104071003)
				local var_14_6 = arg_11_1:FormatText(var_14_5.content)

				arg_11_1.text_.text = var_14_6

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_7 = 40
				local var_14_8 = utf8.len(var_14_6)
				local var_14_9 = var_14_7 <= 0 and var_14_3 or var_14_3 * (var_14_8 / var_14_7)

				if var_14_9 > 0 and var_14_3 < var_14_9 then
					arg_11_1.talkMaxDuration = var_14_9

					if var_14_9 + var_14_2 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_9 + var_14_2
					end
				end

				arg_11_1.text_.text = var_14_6
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071003", "story_v_out_104071.awb") ~= 0 then
					local var_14_10 = manager.audio:GetVoiceLength("story_v_out_104071", "104071003", "story_v_out_104071.awb") / 1000

					if var_14_10 + var_14_2 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_10 + var_14_2
					end

					if var_14_5.prefab_name ~= "" and arg_11_1.actors_[var_14_5.prefab_name] ~= nil then
						local var_14_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_5.prefab_name].transform, "story_v_out_104071", "104071003", "story_v_out_104071.awb")

						arg_11_1:RecordAudio("104071003", var_14_11)
						arg_11_1:RecordAudio("104071003", var_14_11)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104071", "104071003", "story_v_out_104071.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104071", "104071003", "story_v_out_104071.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_12 = math.max(var_14_3, arg_11_1.talkMaxDuration)

			if var_14_2 <= arg_11_1.time_ and arg_11_1.time_ < var_14_2 + var_14_12 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_2) / var_14_12

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_2 + var_14_12 and arg_11_1.time_ < var_14_2 + var_14_12 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play104071004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104071004
		arg_15_1.duration_ = 7.6

		local var_15_0 = {
			ja = 7.6,
			ko = 6.6,
			zh = 4.933,
			en = 4.533
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
				arg_15_0:Play104071005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1084ui_story"

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

			local var_18_4 = arg_15_1.actors_["1084ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1084ui_story then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["10001_tpose"]
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 and arg_15_1.var_.characterEffect10001_tpose == nil then
				arg_15_1.var_.characterEffect10001_tpose = var_18_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_10 = 0.1

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10

				if arg_15_1.var_.characterEffect10001_tpose then
					local var_18_12 = Mathf.Lerp(0, 0.5, var_18_11)

					arg_15_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_15_1.var_.characterEffect10001_tpose.fillRatio = var_18_12
				end
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect10001_tpose then
				local var_18_13 = 0.5

				arg_15_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_15_1.var_.characterEffect10001_tpose.fillRatio = var_18_13
			end

			local var_18_14 = arg_15_1.actors_["10001_tpose"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos10001_tpose = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0, 100, 0)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10001_tpose, var_18_18, var_18_17)

				local var_18_19 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_19.x, var_18_19.y, var_18_19.z)

				local var_18_20 = var_18_14.localEulerAngles

				var_18_20.z = 0
				var_18_20.x = 0
				var_18_14.localEulerAngles = var_18_20
			end

			if arg_15_1.time_ >= var_18_15 + var_18_16 and arg_15_1.time_ < var_18_15 + var_18_16 + arg_18_0 then
				var_18_14.localPosition = Vector3.New(0, 100, 0)

				local var_18_21 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_21.x, var_18_21.y, var_18_21.z)

				local var_18_22 = var_18_14.localEulerAngles

				var_18_22.z = 0
				var_18_22.x = 0
				var_18_14.localEulerAngles = var_18_22
			end

			local var_18_23 = arg_15_1.actors_["1019ui_story"].transform
			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.var_.moveOldPos1019ui_story = var_18_23.localPosition
			end

			local var_18_25 = 0.001

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_25 then
				local var_18_26 = (arg_15_1.time_ - var_18_24) / var_18_25
				local var_18_27 = Vector3.New(0, 100, 0)

				var_18_23.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1019ui_story, var_18_27, var_18_26)

				local var_18_28 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_28.x, var_18_28.y, var_18_28.z)

				local var_18_29 = var_18_23.localEulerAngles

				var_18_29.z = 0
				var_18_29.x = 0
				var_18_23.localEulerAngles = var_18_29
			end

			if arg_15_1.time_ >= var_18_24 + var_18_25 and arg_15_1.time_ < var_18_24 + var_18_25 + arg_18_0 then
				var_18_23.localPosition = Vector3.New(0, 100, 0)

				local var_18_30 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_30.x, var_18_30.y, var_18_30.z)

				local var_18_31 = var_18_23.localEulerAngles

				var_18_31.z = 0
				var_18_31.x = 0
				var_18_23.localEulerAngles = var_18_31
			end

			local var_18_32 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_32.localPosition
			end

			local var_18_34 = 0.001

			if var_18_33 <= arg_15_1.time_ and arg_15_1.time_ < var_18_33 + var_18_34 then
				local var_18_35 = (arg_15_1.time_ - var_18_33) / var_18_34
				local var_18_36 = Vector3.New(0, -0.97, -6)

				var_18_32.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_36, var_18_35)

				local var_18_37 = manager.ui.mainCamera.transform.position - var_18_32.position

				var_18_32.forward = Vector3.New(var_18_37.x, var_18_37.y, var_18_37.z)

				local var_18_38 = var_18_32.localEulerAngles

				var_18_38.z = 0
				var_18_38.x = 0
				var_18_32.localEulerAngles = var_18_38
			end

			if arg_15_1.time_ >= var_18_33 + var_18_34 and arg_15_1.time_ < var_18_33 + var_18_34 + arg_18_0 then
				var_18_32.localPosition = Vector3.New(0, -0.97, -6)

				local var_18_39 = manager.ui.mainCamera.transform.position - var_18_32.position

				var_18_32.forward = Vector3.New(var_18_39.x, var_18_39.y, var_18_39.z)

				local var_18_40 = var_18_32.localEulerAngles

				var_18_40.z = 0
				var_18_40.x = 0
				var_18_32.localEulerAngles = var_18_40
			end

			local var_18_41 = 0

			if var_18_41 < arg_15_1.time_ and arg_15_1.time_ <= var_18_41 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action9_1")
			end

			local var_18_42 = 0

			if var_18_42 < arg_15_1.time_ and arg_15_1.time_ <= var_18_42 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_18_43 = 0
			local var_18_44 = 0.65

			if var_18_43 < arg_15_1.time_ and arg_15_1.time_ <= var_18_43 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_45 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_46 = arg_15_1:GetWordFromCfg(104071004)
				local var_18_47 = arg_15_1:FormatText(var_18_46.content)

				arg_15_1.text_.text = var_18_47

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_48 = 26
				local var_18_49 = utf8.len(var_18_47)
				local var_18_50 = var_18_48 <= 0 and var_18_44 or var_18_44 * (var_18_49 / var_18_48)

				if var_18_50 > 0 and var_18_44 < var_18_50 then
					arg_15_1.talkMaxDuration = var_18_50

					if var_18_50 + var_18_43 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_50 + var_18_43
					end
				end

				arg_15_1.text_.text = var_18_47
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071004", "story_v_out_104071.awb") ~= 0 then
					local var_18_51 = manager.audio:GetVoiceLength("story_v_out_104071", "104071004", "story_v_out_104071.awb") / 1000

					if var_18_51 + var_18_43 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_51 + var_18_43
					end

					if var_18_46.prefab_name ~= "" and arg_15_1.actors_[var_18_46.prefab_name] ~= nil then
						local var_18_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_46.prefab_name].transform, "story_v_out_104071", "104071004", "story_v_out_104071.awb")

						arg_15_1:RecordAudio("104071004", var_18_52)
						arg_15_1:RecordAudio("104071004", var_18_52)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104071", "104071004", "story_v_out_104071.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104071", "104071004", "story_v_out_104071.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_53 = math.max(var_18_44, arg_15_1.talkMaxDuration)

			if var_18_43 <= arg_15_1.time_ and arg_15_1.time_ < var_18_43 + var_18_53 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_43) / var_18_53

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_43 + var_18_53 and arg_15_1.time_ < var_18_43 + var_18_53 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104071005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104071005
		arg_19_1.duration_ = 3.566

		local var_19_0 = {
			ja = 3.2,
			ko = 3.1,
			zh = 3.566,
			en = 3.433
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
				arg_19_0:Play104071006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1019ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story == nil then
				arg_19_1.var_.characterEffect1019ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1019ui_story then
					arg_19_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story then
				arg_19_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1084ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1084ui_story then
					local var_22_8 = Mathf.Lerp(0, 0.5, var_22_7)

					arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_8
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				local var_22_9 = 0.5

				arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_9
			end

			local var_22_10 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_10.localPosition
			end

			local var_22_12 = 0.001

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_12 then
				local var_22_13 = (arg_19_1.time_ - var_22_11) / var_22_12
				local var_22_14 = Vector3.New(0, 100, 0)

				var_22_10.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_14, var_22_13)

				local var_22_15 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_15.x, var_22_15.y, var_22_15.z)

				local var_22_16 = var_22_10.localEulerAngles

				var_22_16.z = 0
				var_22_16.x = 0
				var_22_10.localEulerAngles = var_22_16
			end

			if arg_19_1.time_ >= var_22_11 + var_22_12 and arg_19_1.time_ < var_22_11 + var_22_12 + arg_22_0 then
				var_22_10.localPosition = Vector3.New(0, 100, 0)

				local var_22_17 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_17.x, var_22_17.y, var_22_17.z)

				local var_22_18 = var_22_10.localEulerAngles

				var_22_18.z = 0
				var_22_18.x = 0
				var_22_10.localEulerAngles = var_22_18
			end

			local var_22_19 = arg_19_1.actors_["1019ui_story"].transform
			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1.var_.moveOldPos1019ui_story = var_22_19.localPosition
			end

			local var_22_21 = 0.001

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_21 then
				local var_22_22 = (arg_19_1.time_ - var_22_20) / var_22_21
				local var_22_23 = Vector3.New(0, -1.08, -5.9)

				var_22_19.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1019ui_story, var_22_23, var_22_22)

				local var_22_24 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_24.x, var_22_24.y, var_22_24.z)

				local var_22_25 = var_22_19.localEulerAngles

				var_22_25.z = 0
				var_22_25.x = 0
				var_22_19.localEulerAngles = var_22_25
			end

			if arg_19_1.time_ >= var_22_20 + var_22_21 and arg_19_1.time_ < var_22_20 + var_22_21 + arg_22_0 then
				var_22_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_22_26 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_26.x, var_22_26.y, var_22_26.z)

				local var_22_27 = var_22_19.localEulerAngles

				var_22_27.z = 0
				var_22_27.x = 0
				var_22_19.localEulerAngles = var_22_27
			end

			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_22_29 = 0

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				arg_19_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_30 = 0
			local var_22_31 = 0.425

			if var_22_30 < arg_19_1.time_ and arg_19_1.time_ <= var_22_30 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_32 = arg_19_1:FormatText(StoryNameCfg[13].name)

				arg_19_1.leftNameTxt_.text = var_22_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_33 = arg_19_1:GetWordFromCfg(104071005)
				local var_22_34 = arg_19_1:FormatText(var_22_33.content)

				arg_19_1.text_.text = var_22_34

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_35 = 17
				local var_22_36 = utf8.len(var_22_34)
				local var_22_37 = var_22_35 <= 0 and var_22_31 or var_22_31 * (var_22_36 / var_22_35)

				if var_22_37 > 0 and var_22_31 < var_22_37 then
					arg_19_1.talkMaxDuration = var_22_37

					if var_22_37 + var_22_30 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_37 + var_22_30
					end
				end

				arg_19_1.text_.text = var_22_34
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071005", "story_v_out_104071.awb") ~= 0 then
					local var_22_38 = manager.audio:GetVoiceLength("story_v_out_104071", "104071005", "story_v_out_104071.awb") / 1000

					if var_22_38 + var_22_30 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_38 + var_22_30
					end

					if var_22_33.prefab_name ~= "" and arg_19_1.actors_[var_22_33.prefab_name] ~= nil then
						local var_22_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_33.prefab_name].transform, "story_v_out_104071", "104071005", "story_v_out_104071.awb")

						arg_19_1:RecordAudio("104071005", var_22_39)
						arg_19_1:RecordAudio("104071005", var_22_39)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104071", "104071005", "story_v_out_104071.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104071", "104071005", "story_v_out_104071.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_40 = math.max(var_22_31, arg_19_1.talkMaxDuration)

			if var_22_30 <= arg_19_1.time_ and arg_19_1.time_ < var_22_30 + var_22_40 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_30) / var_22_40

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_30 + var_22_40 and arg_19_1.time_ < var_22_30 + var_22_40 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104071006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104071006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play104071007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1019ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story == nil then
				arg_23_1.var_.characterEffect1019ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1019ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1019ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1019ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 1.3

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[7].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(104071006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 52
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
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_14 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_14 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_14

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_14 and arg_23_1.time_ < var_26_6 + var_26_14 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play104071007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104071007
		arg_27_1.duration_ = 4.633

		local var_27_0 = {
			ja = 4.633,
			ko = 2.4,
			zh = 2.2,
			en = 2.3
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
				arg_27_0:Play104071008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1036ui_story"

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

			local var_30_4 = arg_27_1.actors_["1036ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect1036ui_story == nil then
				arg_27_1.var_.characterEffect1036ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1036ui_story then
					arg_27_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1036ui_story then
				arg_27_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_30_8 = arg_27_1.actors_["1019ui_story"].transform
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1.var_.moveOldPos1019ui_story = var_30_8.localPosition
			end

			local var_30_10 = 0.001

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_10 then
				local var_30_11 = (arg_27_1.time_ - var_30_9) / var_30_10
				local var_30_12 = Vector3.New(0, 100, 0)

				var_30_8.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1019ui_story, var_30_12, var_30_11)

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

			local var_30_17 = arg_27_1.actors_["1036ui_story"].transform
			local var_30_18 = 0

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1.var_.moveOldPos1036ui_story = var_30_17.localPosition
			end

			local var_30_19 = 0.001

			if var_30_18 <= arg_27_1.time_ and arg_27_1.time_ < var_30_18 + var_30_19 then
				local var_30_20 = (arg_27_1.time_ - var_30_18) / var_30_19
				local var_30_21 = Vector3.New(0, -1.09, -5.78)

				var_30_17.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1036ui_story, var_30_21, var_30_20)

				local var_30_22 = manager.ui.mainCamera.transform.position - var_30_17.position

				var_30_17.forward = Vector3.New(var_30_22.x, var_30_22.y, var_30_22.z)

				local var_30_23 = var_30_17.localEulerAngles

				var_30_23.z = 0
				var_30_23.x = 0
				var_30_17.localEulerAngles = var_30_23
			end

			if arg_27_1.time_ >= var_30_18 + var_30_19 and arg_27_1.time_ < var_30_18 + var_30_19 + arg_30_0 then
				var_30_17.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_30_24 = manager.ui.mainCamera.transform.position - var_30_17.position

				var_30_17.forward = Vector3.New(var_30_24.x, var_30_24.y, var_30_24.z)

				local var_30_25 = var_30_17.localEulerAngles

				var_30_25.z = 0
				var_30_25.x = 0
				var_30_17.localEulerAngles = var_30_25
			end

			local var_30_26 = 0

			if var_30_26 < arg_27_1.time_ and arg_27_1.time_ <= var_30_26 + arg_30_0 then
				arg_27_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_30_27 = 0

			if var_30_27 < arg_27_1.time_ and arg_27_1.time_ <= var_30_27 + arg_30_0 then
				arg_27_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_30_28 = 0
			local var_30_29 = 0.4

			if var_30_28 < arg_27_1.time_ and arg_27_1.time_ <= var_30_28 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_30 = arg_27_1:FormatText(StoryNameCfg[5].name)

				arg_27_1.leftNameTxt_.text = var_30_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_31 = arg_27_1:GetWordFromCfg(104071007)
				local var_30_32 = arg_27_1:FormatText(var_30_31.content)

				arg_27_1.text_.text = var_30_32

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_33 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071007", "story_v_out_104071.awb") ~= 0 then
					local var_30_36 = manager.audio:GetVoiceLength("story_v_out_104071", "104071007", "story_v_out_104071.awb") / 1000

					if var_30_36 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_28
					end

					if var_30_31.prefab_name ~= "" and arg_27_1.actors_[var_30_31.prefab_name] ~= nil then
						local var_30_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_31.prefab_name].transform, "story_v_out_104071", "104071007", "story_v_out_104071.awb")

						arg_27_1:RecordAudio("104071007", var_30_37)
						arg_27_1:RecordAudio("104071007", var_30_37)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_104071", "104071007", "story_v_out_104071.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_104071", "104071007", "story_v_out_104071.awb")
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
	Play104071008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104071008
		arg_31_1.duration_ = 3.866

		local var_31_0 = {
			ja = 2.133,
			ko = 2.766,
			zh = 3.866,
			en = 2.7
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
				arg_31_0:Play104071009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1036ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1036ui_story == nil then
				arg_31_1.var_.characterEffect1036ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1036ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1036ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1036ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1036ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.3

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[15].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1037")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(104071008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071008", "story_v_out_104071.awb") ~= 0 then
					local var_34_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071008", "story_v_out_104071.awb") / 1000

					if var_34_14 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_14 + var_34_6
					end

					if var_34_9.prefab_name ~= "" and arg_31_1.actors_[var_34_9.prefab_name] ~= nil then
						local var_34_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_9.prefab_name].transform, "story_v_out_104071", "104071008", "story_v_out_104071.awb")

						arg_31_1:RecordAudio("104071008", var_34_15)
						arg_31_1:RecordAudio("104071008", var_34_15)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104071", "104071008", "story_v_out_104071.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104071", "104071008", "story_v_out_104071.awb")
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
	Play104071009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104071009
		arg_35_1.duration_ = 1.999999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play104071010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1036ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1036ui_story == nil then
				arg_35_1.var_.characterEffect1036ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1036ui_story then
					arg_35_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1036ui_story then
				arg_35_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_2")
			end

			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_38_6 = 0
			local var_38_7 = 0.15

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[5].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(104071009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 6
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071009", "story_v_out_104071.awb") ~= 0 then
					local var_38_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071009", "story_v_out_104071.awb") / 1000

					if var_38_14 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_14 + var_38_6
					end

					if var_38_9.prefab_name ~= "" and arg_35_1.actors_[var_38_9.prefab_name] ~= nil then
						local var_38_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_9.prefab_name].transform, "story_v_out_104071", "104071009", "story_v_out_104071.awb")

						arg_35_1:RecordAudio("104071009", var_38_15)
						arg_35_1:RecordAudio("104071009", var_38_15)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_104071", "104071009", "story_v_out_104071.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_104071", "104071009", "story_v_out_104071.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_16 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_16 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_16

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_16 and arg_35_1.time_ < var_38_6 + var_38_16 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play104071010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104071010
		arg_39_1.duration_ = 5.8

		local var_39_0 = {
			ja = 4.466,
			ko = 4.4,
			zh = 5.8,
			en = 4.6
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
				arg_39_0:Play104071011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1036ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1036ui_story == nil then
				arg_39_1.var_.characterEffect1036ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1036ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1036ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1036ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1036ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.55

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[15].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1037")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(104071010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071010", "story_v_out_104071.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071010", "story_v_out_104071.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_104071", "104071010", "story_v_out_104071.awb")

						arg_39_1:RecordAudio("104071010", var_42_15)
						arg_39_1:RecordAudio("104071010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_104071", "104071010", "story_v_out_104071.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_104071", "104071010", "story_v_out_104071.awb")
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
	Play104071011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104071011
		arg_43_1.duration_ = 3.433

		local var_43_0 = {
			ja = 3.433,
			ko = 3.4,
			zh = 3.166,
			en = 3.233
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
				arg_43_0:Play104071012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1036ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1036ui_story == nil then
				arg_43_1.var_.characterEffect1036ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1036ui_story then
					arg_43_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1036ui_story then
				arg_43_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_46_4 = 0

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action4_1")
			end

			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_46_6 = 0
			local var_46_7 = 0.35

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[5].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(104071011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071011", "story_v_out_104071.awb") ~= 0 then
					local var_46_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071011", "story_v_out_104071.awb") / 1000

					if var_46_14 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_14 + var_46_6
					end

					if var_46_9.prefab_name ~= "" and arg_43_1.actors_[var_46_9.prefab_name] ~= nil then
						local var_46_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_9.prefab_name].transform, "story_v_out_104071", "104071011", "story_v_out_104071.awb")

						arg_43_1:RecordAudio("104071011", var_46_15)
						arg_43_1:RecordAudio("104071011", var_46_15)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_104071", "104071011", "story_v_out_104071.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_104071", "104071011", "story_v_out_104071.awb")
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
	Play104071012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 104071012
		arg_47_1.duration_ = 3.533

		local var_47_0 = {
			ja = 3.066,
			ko = 2.4,
			zh = 3.533,
			en = 2.8
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
				arg_47_0:Play104071013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_50_1 = 0
			local var_50_2 = 0.375

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_3 = arg_47_1:FormatText(StoryNameCfg[5].name)

				arg_47_1.leftNameTxt_.text = var_50_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_4 = arg_47_1:GetWordFromCfg(104071012)
				local var_50_5 = arg_47_1:FormatText(var_50_4.content)

				arg_47_1.text_.text = var_50_5

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_6 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071012", "story_v_out_104071.awb") ~= 0 then
					local var_50_9 = manager.audio:GetVoiceLength("story_v_out_104071", "104071012", "story_v_out_104071.awb") / 1000

					if var_50_9 + var_50_1 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_9 + var_50_1
					end

					if var_50_4.prefab_name ~= "" and arg_47_1.actors_[var_50_4.prefab_name] ~= nil then
						local var_50_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_4.prefab_name].transform, "story_v_out_104071", "104071012", "story_v_out_104071.awb")

						arg_47_1:RecordAudio("104071012", var_50_10)
						arg_47_1:RecordAudio("104071012", var_50_10)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_104071", "104071012", "story_v_out_104071.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_104071", "104071012", "story_v_out_104071.awb")
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
	Play104071013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 104071013
		arg_51_1.duration_ = 7.3

		local var_51_0 = {
			ja = 7.266,
			ko = 6.933,
			zh = 7.3,
			en = 6.3
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
				arg_51_0:Play104071014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1036ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1036ui_story == nil then
				arg_51_1.var_.characterEffect1036ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1036ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1036ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1036ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1036ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.9

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[15].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1037")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(104071013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071013", "story_v_out_104071.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071013", "story_v_out_104071.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_104071", "104071013", "story_v_out_104071.awb")

						arg_51_1:RecordAudio("104071013", var_54_15)
						arg_51_1:RecordAudio("104071013", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_104071", "104071013", "story_v_out_104071.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_104071", "104071013", "story_v_out_104071.awb")
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
	Play104071014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 104071014
		arg_55_1.duration_ = 1.999999999999

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play104071015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1036ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1036ui_story == nil then
				arg_55_1.var_.characterEffect1036ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1036ui_story then
					arg_55_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1036ui_story then
				arg_55_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action447")
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_58_6 = 0
			local var_58_7 = 0.05

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[5].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(104071014)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 2
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071014", "story_v_out_104071.awb") ~= 0 then
					local var_58_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071014", "story_v_out_104071.awb") / 1000

					if var_58_14 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_6
					end

					if var_58_9.prefab_name ~= "" and arg_55_1.actors_[var_58_9.prefab_name] ~= nil then
						local var_58_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_9.prefab_name].transform, "story_v_out_104071", "104071014", "story_v_out_104071.awb")

						arg_55_1:RecordAudio("104071014", var_58_15)
						arg_55_1:RecordAudio("104071014", var_58_15)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_104071", "104071014", "story_v_out_104071.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_104071", "104071014", "story_v_out_104071.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_16 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_16 and arg_55_1.time_ < var_58_6 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play104071015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 104071015
		arg_59_1.duration_ = 2.933

		local var_59_0 = {
			ja = 2.3,
			ko = 2.033,
			zh = 2.933,
			en = 2.866
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
				arg_59_0:Play104071016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1019ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1019ui_story == nil then
				arg_59_1.var_.characterEffect1019ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1019ui_story then
					arg_59_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1019ui_story then
				arg_59_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["1036ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1036ui_story == nil then
				arg_59_1.var_.characterEffect1036ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1036ui_story then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1036ui_story.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1036ui_story then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1036ui_story.fillRatio = var_62_9
			end

			local var_62_10 = arg_59_1.actors_["1036ui_story"].transform
			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1.var_.moveOldPos1036ui_story = var_62_10.localPosition
			end

			local var_62_12 = 0.001

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				local var_62_13 = (arg_59_1.time_ - var_62_11) / var_62_12
				local var_62_14 = Vector3.New(0, 100, 0)

				var_62_10.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1036ui_story, var_62_14, var_62_13)

				local var_62_15 = manager.ui.mainCamera.transform.position - var_62_10.position

				var_62_10.forward = Vector3.New(var_62_15.x, var_62_15.y, var_62_15.z)

				local var_62_16 = var_62_10.localEulerAngles

				var_62_16.z = 0
				var_62_16.x = 0
				var_62_10.localEulerAngles = var_62_16
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 then
				var_62_10.localPosition = Vector3.New(0, 100, 0)

				local var_62_17 = manager.ui.mainCamera.transform.position - var_62_10.position

				var_62_10.forward = Vector3.New(var_62_17.x, var_62_17.y, var_62_17.z)

				local var_62_18 = var_62_10.localEulerAngles

				var_62_18.z = 0
				var_62_18.x = 0
				var_62_10.localEulerAngles = var_62_18
			end

			local var_62_19 = arg_59_1.actors_["1019ui_story"].transform
			local var_62_20 = 0

			if var_62_20 < arg_59_1.time_ and arg_59_1.time_ <= var_62_20 + arg_62_0 then
				arg_59_1.var_.moveOldPos1019ui_story = var_62_19.localPosition
			end

			local var_62_21 = 0.001

			if var_62_20 <= arg_59_1.time_ and arg_59_1.time_ < var_62_20 + var_62_21 then
				local var_62_22 = (arg_59_1.time_ - var_62_20) / var_62_21
				local var_62_23 = Vector3.New(0, -1.08, -5.9)

				var_62_19.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1019ui_story, var_62_23, var_62_22)

				local var_62_24 = manager.ui.mainCamera.transform.position - var_62_19.position

				var_62_19.forward = Vector3.New(var_62_24.x, var_62_24.y, var_62_24.z)

				local var_62_25 = var_62_19.localEulerAngles

				var_62_25.z = 0
				var_62_25.x = 0
				var_62_19.localEulerAngles = var_62_25
			end

			if arg_59_1.time_ >= var_62_20 + var_62_21 and arg_59_1.time_ < var_62_20 + var_62_21 + arg_62_0 then
				var_62_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_62_26 = manager.ui.mainCamera.transform.position - var_62_19.position

				var_62_19.forward = Vector3.New(var_62_26.x, var_62_26.y, var_62_26.z)

				local var_62_27 = var_62_19.localEulerAngles

				var_62_27.z = 0
				var_62_27.x = 0
				var_62_19.localEulerAngles = var_62_27
			end

			local var_62_28 = 0

			if var_62_28 < arg_59_1.time_ and arg_59_1.time_ <= var_62_28 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_62_29 = 0

			if var_62_29 < arg_59_1.time_ and arg_59_1.time_ <= var_62_29 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_62_30 = 0
			local var_62_31 = 0.35

			if var_62_30 < arg_59_1.time_ and arg_59_1.time_ <= var_62_30 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_32 = arg_59_1:FormatText(StoryNameCfg[13].name)

				arg_59_1.leftNameTxt_.text = var_62_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_33 = arg_59_1:GetWordFromCfg(104071015)
				local var_62_34 = arg_59_1:FormatText(var_62_33.content)

				arg_59_1.text_.text = var_62_34

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_35 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071015", "story_v_out_104071.awb") ~= 0 then
					local var_62_38 = manager.audio:GetVoiceLength("story_v_out_104071", "104071015", "story_v_out_104071.awb") / 1000

					if var_62_38 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_38 + var_62_30
					end

					if var_62_33.prefab_name ~= "" and arg_59_1.actors_[var_62_33.prefab_name] ~= nil then
						local var_62_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_33.prefab_name].transform, "story_v_out_104071", "104071015", "story_v_out_104071.awb")

						arg_59_1:RecordAudio("104071015", var_62_39)
						arg_59_1:RecordAudio("104071015", var_62_39)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_104071", "104071015", "story_v_out_104071.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_104071", "104071015", "story_v_out_104071.awb")
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
	Play104071016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 104071016
		arg_63_1.duration_ = 10.133

		local var_63_0 = {
			ja = 9.4,
			ko = 9.366,
			zh = 10.133,
			en = 8.266
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
				arg_63_0:Play104071017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1019ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1019ui_story == nil then
				arg_63_1.var_.characterEffect1019ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1019ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1019ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1019ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1019ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 0.95

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[44].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(104071016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071016", "story_v_out_104071.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071016", "story_v_out_104071.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_104071", "104071016", "story_v_out_104071.awb")

						arg_63_1:RecordAudio("104071016", var_66_15)
						arg_63_1:RecordAudio("104071016", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_104071", "104071016", "story_v_out_104071.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_104071", "104071016", "story_v_out_104071.awb")
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
	Play104071017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 104071017
		arg_67_1.duration_ = 2.233

		local var_67_0 = {
			ja = 2.233,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_67_0:Play104071018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "1011ui_story"

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

			local var_70_4 = arg_67_1.actors_["1011ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect1011ui_story == nil then
				arg_67_1.var_.characterEffect1011ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1011ui_story then
					arg_67_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1011ui_story then
				arg_67_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_70_8 = arg_67_1.actors_["1019ui_story"].transform
			local var_70_9 = 0

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.var_.moveOldPos1019ui_story = var_70_8.localPosition
			end

			local var_70_10 = 0.001

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_10 then
				local var_70_11 = (arg_67_1.time_ - var_70_9) / var_70_10
				local var_70_12 = Vector3.New(0, 100, 0)

				var_70_8.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1019ui_story, var_70_12, var_70_11)

				local var_70_13 = manager.ui.mainCamera.transform.position - var_70_8.position

				var_70_8.forward = Vector3.New(var_70_13.x, var_70_13.y, var_70_13.z)

				local var_70_14 = var_70_8.localEulerAngles

				var_70_14.z = 0
				var_70_14.x = 0
				var_70_8.localEulerAngles = var_70_14
			end

			if arg_67_1.time_ >= var_70_9 + var_70_10 and arg_67_1.time_ < var_70_9 + var_70_10 + arg_70_0 then
				var_70_8.localPosition = Vector3.New(0, 100, 0)

				local var_70_15 = manager.ui.mainCamera.transform.position - var_70_8.position

				var_70_8.forward = Vector3.New(var_70_15.x, var_70_15.y, var_70_15.z)

				local var_70_16 = var_70_8.localEulerAngles

				var_70_16.z = 0
				var_70_16.x = 0
				var_70_8.localEulerAngles = var_70_16
			end

			local var_70_17 = arg_67_1.actors_["1011ui_story"].transform
			local var_70_18 = 0

			if var_70_18 < arg_67_1.time_ and arg_67_1.time_ <= var_70_18 + arg_70_0 then
				arg_67_1.var_.moveOldPos1011ui_story = var_70_17.localPosition
			end

			local var_70_19 = 0.001

			if var_70_18 <= arg_67_1.time_ and arg_67_1.time_ < var_70_18 + var_70_19 then
				local var_70_20 = (arg_67_1.time_ - var_70_18) / var_70_19
				local var_70_21 = Vector3.New(-0.7, -0.71, -6)

				var_70_17.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1011ui_story, var_70_21, var_70_20)

				local var_70_22 = manager.ui.mainCamera.transform.position - var_70_17.position

				var_70_17.forward = Vector3.New(var_70_22.x, var_70_22.y, var_70_22.z)

				local var_70_23 = var_70_17.localEulerAngles

				var_70_23.z = 0
				var_70_23.x = 0
				var_70_17.localEulerAngles = var_70_23
			end

			if arg_67_1.time_ >= var_70_18 + var_70_19 and arg_67_1.time_ < var_70_18 + var_70_19 + arg_70_0 then
				var_70_17.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_70_24 = manager.ui.mainCamera.transform.position - var_70_17.position

				var_70_17.forward = Vector3.New(var_70_24.x, var_70_24.y, var_70_24.z)

				local var_70_25 = var_70_17.localEulerAngles

				var_70_25.z = 0
				var_70_25.x = 0
				var_70_17.localEulerAngles = var_70_25
			end

			local var_70_26 = 0

			if var_70_26 < arg_67_1.time_ and arg_67_1.time_ <= var_70_26 + arg_70_0 then
				arg_67_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_70_27 = 0

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_70_28 = 0
			local var_70_29 = 0.15

			if var_70_28 < arg_67_1.time_ and arg_67_1.time_ <= var_70_28 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_30 = arg_67_1:FormatText(StoryNameCfg[37].name)

				arg_67_1.leftNameTxt_.text = var_70_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_31 = arg_67_1:GetWordFromCfg(104071017)
				local var_70_32 = arg_67_1:FormatText(var_70_31.content)

				arg_67_1.text_.text = var_70_32

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_33 = 6
				local var_70_34 = utf8.len(var_70_32)
				local var_70_35 = var_70_33 <= 0 and var_70_29 or var_70_29 * (var_70_34 / var_70_33)

				if var_70_35 > 0 and var_70_29 < var_70_35 then
					arg_67_1.talkMaxDuration = var_70_35

					if var_70_35 + var_70_28 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_35 + var_70_28
					end
				end

				arg_67_1.text_.text = var_70_32
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071017", "story_v_out_104071.awb") ~= 0 then
					local var_70_36 = manager.audio:GetVoiceLength("story_v_out_104071", "104071017", "story_v_out_104071.awb") / 1000

					if var_70_36 + var_70_28 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_36 + var_70_28
					end

					if var_70_31.prefab_name ~= "" and arg_67_1.actors_[var_70_31.prefab_name] ~= nil then
						local var_70_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_31.prefab_name].transform, "story_v_out_104071", "104071017", "story_v_out_104071.awb")

						arg_67_1:RecordAudio("104071017", var_70_37)
						arg_67_1:RecordAudio("104071017", var_70_37)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_104071", "104071017", "story_v_out_104071.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_104071", "104071017", "story_v_out_104071.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_38 = math.max(var_70_29, arg_67_1.talkMaxDuration)

			if var_70_28 <= arg_67_1.time_ and arg_67_1.time_ < var_70_28 + var_70_38 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_28) / var_70_38

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_28 + var_70_38 and arg_67_1.time_ < var_70_28 + var_70_38 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play104071018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 104071018
		arg_71_1.duration_ = 3.566

		local var_71_0 = {
			ja = 3.533,
			ko = 3.566,
			zh = 2.9,
			en = 3.2
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
				arg_71_0:Play104071019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1084ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story == nil then
				arg_71_1.var_.characterEffect1084ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.1

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1084ui_story then
					arg_71_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story then
				arg_71_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_74_4 = arg_71_1.actors_["1011ui_story"]
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 and arg_71_1.var_.characterEffect1011ui_story == nil then
				arg_71_1.var_.characterEffect1011ui_story = var_74_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_6 = 0.1

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6

				if arg_71_1.var_.characterEffect1011ui_story then
					local var_74_8 = Mathf.Lerp(0, 0.5, var_74_7)

					arg_71_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1011ui_story.fillRatio = var_74_8
				end
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 and arg_71_1.var_.characterEffect1011ui_story then
				local var_74_9 = 0.5

				arg_71_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1011ui_story.fillRatio = var_74_9
			end

			local var_74_10 = arg_71_1.actors_["1084ui_story"].transform
			local var_74_11 = 0

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1.var_.moveOldPos1084ui_story = var_74_10.localPosition
			end

			local var_74_12 = 0.001

			if var_74_11 <= arg_71_1.time_ and arg_71_1.time_ < var_74_11 + var_74_12 then
				local var_74_13 = (arg_71_1.time_ - var_74_11) / var_74_12
				local var_74_14 = Vector3.New(0.7, -0.97, -6)

				var_74_10.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1084ui_story, var_74_14, var_74_13)

				local var_74_15 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_15.x, var_74_15.y, var_74_15.z)

				local var_74_16 = var_74_10.localEulerAngles

				var_74_16.z = 0
				var_74_16.x = 0
				var_74_10.localEulerAngles = var_74_16
			end

			if arg_71_1.time_ >= var_74_11 + var_74_12 and arg_71_1.time_ < var_74_11 + var_74_12 + arg_74_0 then
				var_74_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_74_17 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_17.x, var_74_17.y, var_74_17.z)

				local var_74_18 = var_74_10.localEulerAngles

				var_74_18.z = 0
				var_74_18.x = 0
				var_74_10.localEulerAngles = var_74_18
			end

			local var_74_19 = 0

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_74_20 = 0

			if var_74_20 < arg_71_1.time_ and arg_71_1.time_ <= var_74_20 + arg_74_0 then
				arg_71_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_74_21 = 0
			local var_74_22 = 0.3

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_23 = arg_71_1:FormatText(StoryNameCfg[6].name)

				arg_71_1.leftNameTxt_.text = var_74_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_24 = arg_71_1:GetWordFromCfg(104071018)
				local var_74_25 = arg_71_1:FormatText(var_74_24.content)

				arg_71_1.text_.text = var_74_25

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_26 = 12
				local var_74_27 = utf8.len(var_74_25)
				local var_74_28 = var_74_26 <= 0 and var_74_22 or var_74_22 * (var_74_27 / var_74_26)

				if var_74_28 > 0 and var_74_22 < var_74_28 then
					arg_71_1.talkMaxDuration = var_74_28

					if var_74_28 + var_74_21 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_28 + var_74_21
					end
				end

				arg_71_1.text_.text = var_74_25
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071018", "story_v_out_104071.awb") ~= 0 then
					local var_74_29 = manager.audio:GetVoiceLength("story_v_out_104071", "104071018", "story_v_out_104071.awb") / 1000

					if var_74_29 + var_74_21 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_29 + var_74_21
					end

					if var_74_24.prefab_name ~= "" and arg_71_1.actors_[var_74_24.prefab_name] ~= nil then
						local var_74_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_24.prefab_name].transform, "story_v_out_104071", "104071018", "story_v_out_104071.awb")

						arg_71_1:RecordAudio("104071018", var_74_30)
						arg_71_1:RecordAudio("104071018", var_74_30)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_104071", "104071018", "story_v_out_104071.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_104071", "104071018", "story_v_out_104071.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_31 = math.max(var_74_22, arg_71_1.talkMaxDuration)

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_31 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_21) / var_74_31

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_21 + var_74_31 and arg_71_1.time_ < var_74_21 + var_74_31 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play104071019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 104071019
		arg_75_1.duration_ = 5.066

		local var_75_0 = {
			ja = 5.033,
			ko = 3.666,
			zh = 5,
			en = 5.066
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
				arg_75_0:Play104071020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1019ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1019ui_story == nil then
				arg_75_1.var_.characterEffect1019ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1019ui_story then
					arg_75_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1019ui_story then
				arg_75_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["1084ui_story"]
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story == nil then
				arg_75_1.var_.characterEffect1084ui_story = var_78_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_6 = 0.1

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6

				if arg_75_1.var_.characterEffect1084ui_story then
					local var_78_8 = Mathf.Lerp(0, 0.5, var_78_7)

					arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_8
				end
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story then
				local var_78_9 = 0.5

				arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_9
			end

			local var_78_10 = arg_75_1.actors_["1084ui_story"].transform
			local var_78_11 = 0

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1.var_.moveOldPos1084ui_story = var_78_10.localPosition
			end

			local var_78_12 = 0.001

			if var_78_11 <= arg_75_1.time_ and arg_75_1.time_ < var_78_11 + var_78_12 then
				local var_78_13 = (arg_75_1.time_ - var_78_11) / var_78_12
				local var_78_14 = Vector3.New(0, 100, 0)

				var_78_10.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1084ui_story, var_78_14, var_78_13)

				local var_78_15 = manager.ui.mainCamera.transform.position - var_78_10.position

				var_78_10.forward = Vector3.New(var_78_15.x, var_78_15.y, var_78_15.z)

				local var_78_16 = var_78_10.localEulerAngles

				var_78_16.z = 0
				var_78_16.x = 0
				var_78_10.localEulerAngles = var_78_16
			end

			if arg_75_1.time_ >= var_78_11 + var_78_12 and arg_75_1.time_ < var_78_11 + var_78_12 + arg_78_0 then
				var_78_10.localPosition = Vector3.New(0, 100, 0)

				local var_78_17 = manager.ui.mainCamera.transform.position - var_78_10.position

				var_78_10.forward = Vector3.New(var_78_17.x, var_78_17.y, var_78_17.z)

				local var_78_18 = var_78_10.localEulerAngles

				var_78_18.z = 0
				var_78_18.x = 0
				var_78_10.localEulerAngles = var_78_18
			end

			local var_78_19 = arg_75_1.actors_["1011ui_story"].transform
			local var_78_20 = 0

			if var_78_20 < arg_75_1.time_ and arg_75_1.time_ <= var_78_20 + arg_78_0 then
				arg_75_1.var_.moveOldPos1011ui_story = var_78_19.localPosition
			end

			local var_78_21 = 0.001

			if var_78_20 <= arg_75_1.time_ and arg_75_1.time_ < var_78_20 + var_78_21 then
				local var_78_22 = (arg_75_1.time_ - var_78_20) / var_78_21
				local var_78_23 = Vector3.New(0, 100, 0)

				var_78_19.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1011ui_story, var_78_23, var_78_22)

				local var_78_24 = manager.ui.mainCamera.transform.position - var_78_19.position

				var_78_19.forward = Vector3.New(var_78_24.x, var_78_24.y, var_78_24.z)

				local var_78_25 = var_78_19.localEulerAngles

				var_78_25.z = 0
				var_78_25.x = 0
				var_78_19.localEulerAngles = var_78_25
			end

			if arg_75_1.time_ >= var_78_20 + var_78_21 and arg_75_1.time_ < var_78_20 + var_78_21 + arg_78_0 then
				var_78_19.localPosition = Vector3.New(0, 100, 0)

				local var_78_26 = manager.ui.mainCamera.transform.position - var_78_19.position

				var_78_19.forward = Vector3.New(var_78_26.x, var_78_26.y, var_78_26.z)

				local var_78_27 = var_78_19.localEulerAngles

				var_78_27.z = 0
				var_78_27.x = 0
				var_78_19.localEulerAngles = var_78_27
			end

			local var_78_28 = arg_75_1.actors_["1019ui_story"].transform
			local var_78_29 = 0

			if var_78_29 < arg_75_1.time_ and arg_75_1.time_ <= var_78_29 + arg_78_0 then
				arg_75_1.var_.moveOldPos1019ui_story = var_78_28.localPosition
			end

			local var_78_30 = 0.001

			if var_78_29 <= arg_75_1.time_ and arg_75_1.time_ < var_78_29 + var_78_30 then
				local var_78_31 = (arg_75_1.time_ - var_78_29) / var_78_30
				local var_78_32 = Vector3.New(0, -1.08, -5.9)

				var_78_28.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1019ui_story, var_78_32, var_78_31)

				local var_78_33 = manager.ui.mainCamera.transform.position - var_78_28.position

				var_78_28.forward = Vector3.New(var_78_33.x, var_78_33.y, var_78_33.z)

				local var_78_34 = var_78_28.localEulerAngles

				var_78_34.z = 0
				var_78_34.x = 0
				var_78_28.localEulerAngles = var_78_34
			end

			if arg_75_1.time_ >= var_78_29 + var_78_30 and arg_75_1.time_ < var_78_29 + var_78_30 + arg_78_0 then
				var_78_28.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_78_35 = manager.ui.mainCamera.transform.position - var_78_28.position

				var_78_28.forward = Vector3.New(var_78_35.x, var_78_35.y, var_78_35.z)

				local var_78_36 = var_78_28.localEulerAngles

				var_78_36.z = 0
				var_78_36.x = 0
				var_78_28.localEulerAngles = var_78_36
			end

			local var_78_37 = 0

			if var_78_37 < arg_75_1.time_ and arg_75_1.time_ <= var_78_37 + arg_78_0 then
				arg_75_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_78_38 = 0

			if var_78_38 < arg_75_1.time_ and arg_75_1.time_ <= var_78_38 + arg_78_0 then
				arg_75_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_78_39 = 0
			local var_78_40 = 0.65

			if var_78_39 < arg_75_1.time_ and arg_75_1.time_ <= var_78_39 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_41 = arg_75_1:FormatText(StoryNameCfg[13].name)

				arg_75_1.leftNameTxt_.text = var_78_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_42 = arg_75_1:GetWordFromCfg(104071019)
				local var_78_43 = arg_75_1:FormatText(var_78_42.content)

				arg_75_1.text_.text = var_78_43

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_44 = 26
				local var_78_45 = utf8.len(var_78_43)
				local var_78_46 = var_78_44 <= 0 and var_78_40 or var_78_40 * (var_78_45 / var_78_44)

				if var_78_46 > 0 and var_78_40 < var_78_46 then
					arg_75_1.talkMaxDuration = var_78_46

					if var_78_46 + var_78_39 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_46 + var_78_39
					end
				end

				arg_75_1.text_.text = var_78_43
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071019", "story_v_out_104071.awb") ~= 0 then
					local var_78_47 = manager.audio:GetVoiceLength("story_v_out_104071", "104071019", "story_v_out_104071.awb") / 1000

					if var_78_47 + var_78_39 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_47 + var_78_39
					end

					if var_78_42.prefab_name ~= "" and arg_75_1.actors_[var_78_42.prefab_name] ~= nil then
						local var_78_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_42.prefab_name].transform, "story_v_out_104071", "104071019", "story_v_out_104071.awb")

						arg_75_1:RecordAudio("104071019", var_78_48)
						arg_75_1:RecordAudio("104071019", var_78_48)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_104071", "104071019", "story_v_out_104071.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_104071", "104071019", "story_v_out_104071.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_49 = math.max(var_78_40, arg_75_1.talkMaxDuration)

			if var_78_39 <= arg_75_1.time_ and arg_75_1.time_ < var_78_39 + var_78_49 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_39) / var_78_49

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_39 + var_78_49 and arg_75_1.time_ < var_78_39 + var_78_49 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play104071020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 104071020
		arg_79_1.duration_ = 1.766

		local var_79_0 = {
			ja = 1.633,
			ko = 1.766,
			zh = 1.266,
			en = 1.3
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
				arg_79_0:Play104071021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1019ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1019ui_story == nil then
				arg_79_1.var_.characterEffect1019ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1019ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1019ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1019ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1019ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.075

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[44].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(104071020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 3
				local var_82_12 = utf8.len(var_82_10)
				local var_82_13 = var_82_11 <= 0 and var_82_7 or var_82_7 * (var_82_12 / var_82_11)

				if var_82_13 > 0 and var_82_7 < var_82_13 then
					arg_79_1.talkMaxDuration = var_82_13

					if var_82_13 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_10
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071020", "story_v_out_104071.awb") ~= 0 then
					local var_82_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071020", "story_v_out_104071.awb") / 1000

					if var_82_14 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_6
					end

					if var_82_9.prefab_name ~= "" and arg_79_1.actors_[var_82_9.prefab_name] ~= nil then
						local var_82_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_9.prefab_name].transform, "story_v_out_104071", "104071020", "story_v_out_104071.awb")

						arg_79_1:RecordAudio("104071020", var_82_15)
						arg_79_1:RecordAudio("104071020", var_82_15)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_104071", "104071020", "story_v_out_104071.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_104071", "104071020", "story_v_out_104071.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_16 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_16 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_16

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_16 and arg_79_1.time_ < var_82_6 + var_82_16 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play104071021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 104071021
		arg_83_1.duration_ = 4.2

		local var_83_0 = {
			ja = 4.2,
			ko = 3.333,
			zh = 3.333,
			en = 3.266
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
				arg_83_0:Play104071022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1011ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1011ui_story == nil then
				arg_83_1.var_.characterEffect1011ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.1

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1011ui_story then
					arg_83_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1011ui_story then
				arg_83_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_86_4 = arg_83_1.actors_["1019ui_story"].transform
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 then
				arg_83_1.var_.moveOldPos1019ui_story = var_86_4.localPosition
			end

			local var_86_6 = 0.001

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6
				local var_86_8 = Vector3.New(0, 100, 0)

				var_86_4.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1019ui_story, var_86_8, var_86_7)

				local var_86_9 = manager.ui.mainCamera.transform.position - var_86_4.position

				var_86_4.forward = Vector3.New(var_86_9.x, var_86_9.y, var_86_9.z)

				local var_86_10 = var_86_4.localEulerAngles

				var_86_10.z = 0
				var_86_10.x = 0
				var_86_4.localEulerAngles = var_86_10
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 then
				var_86_4.localPosition = Vector3.New(0, 100, 0)

				local var_86_11 = manager.ui.mainCamera.transform.position - var_86_4.position

				var_86_4.forward = Vector3.New(var_86_11.x, var_86_11.y, var_86_11.z)

				local var_86_12 = var_86_4.localEulerAngles

				var_86_12.z = 0
				var_86_12.x = 0
				var_86_4.localEulerAngles = var_86_12
			end

			local var_86_13 = arg_83_1.actors_["1011ui_story"].transform
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1.var_.moveOldPos1011ui_story = var_86_13.localPosition
			end

			local var_86_15 = 0.001

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_15 then
				local var_86_16 = (arg_83_1.time_ - var_86_14) / var_86_15
				local var_86_17 = Vector3.New(0, -0.71, -6)

				var_86_13.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1011ui_story, var_86_17, var_86_16)

				local var_86_18 = manager.ui.mainCamera.transform.position - var_86_13.position

				var_86_13.forward = Vector3.New(var_86_18.x, var_86_18.y, var_86_18.z)

				local var_86_19 = var_86_13.localEulerAngles

				var_86_19.z = 0
				var_86_19.x = 0
				var_86_13.localEulerAngles = var_86_19
			end

			if arg_83_1.time_ >= var_86_14 + var_86_15 and arg_83_1.time_ < var_86_14 + var_86_15 + arg_86_0 then
				var_86_13.localPosition = Vector3.New(0, -0.71, -6)

				local var_86_20 = manager.ui.mainCamera.transform.position - var_86_13.position

				var_86_13.forward = Vector3.New(var_86_20.x, var_86_20.y, var_86_20.z)

				local var_86_21 = var_86_13.localEulerAngles

				var_86_21.z = 0
				var_86_21.x = 0
				var_86_13.localEulerAngles = var_86_21
			end

			local var_86_22 = 0

			if var_86_22 < arg_83_1.time_ and arg_83_1.time_ <= var_86_22 + arg_86_0 then
				arg_83_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_86_23 = 0

			if var_86_23 < arg_83_1.time_ and arg_83_1.time_ <= var_86_23 + arg_86_0 then
				arg_83_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_86_24 = 0
			local var_86_25 = 0.375

			if var_86_24 < arg_83_1.time_ and arg_83_1.time_ <= var_86_24 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_26 = arg_83_1:FormatText(StoryNameCfg[37].name)

				arg_83_1.leftNameTxt_.text = var_86_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_27 = arg_83_1:GetWordFromCfg(104071021)
				local var_86_28 = arg_83_1:FormatText(var_86_27.content)

				arg_83_1.text_.text = var_86_28

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_29 = 15
				local var_86_30 = utf8.len(var_86_28)
				local var_86_31 = var_86_29 <= 0 and var_86_25 or var_86_25 * (var_86_30 / var_86_29)

				if var_86_31 > 0 and var_86_25 < var_86_31 then
					arg_83_1.talkMaxDuration = var_86_31

					if var_86_31 + var_86_24 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_31 + var_86_24
					end
				end

				arg_83_1.text_.text = var_86_28
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071021", "story_v_out_104071.awb") ~= 0 then
					local var_86_32 = manager.audio:GetVoiceLength("story_v_out_104071", "104071021", "story_v_out_104071.awb") / 1000

					if var_86_32 + var_86_24 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_32 + var_86_24
					end

					if var_86_27.prefab_name ~= "" and arg_83_1.actors_[var_86_27.prefab_name] ~= nil then
						local var_86_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_27.prefab_name].transform, "story_v_out_104071", "104071021", "story_v_out_104071.awb")

						arg_83_1:RecordAudio("104071021", var_86_33)
						arg_83_1:RecordAudio("104071021", var_86_33)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_104071", "104071021", "story_v_out_104071.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_104071", "104071021", "story_v_out_104071.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_34 = math.max(var_86_25, arg_83_1.talkMaxDuration)

			if var_86_24 <= arg_83_1.time_ and arg_83_1.time_ < var_86_24 + var_86_34 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_24) / var_86_34

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_24 + var_86_34 and arg_83_1.time_ < var_86_24 + var_86_34 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play104071022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 104071022
		arg_87_1.duration_ = 4.333

		local var_87_0 = {
			ja = 4.333,
			ko = 4.066,
			zh = 3.533,
			en = 4.133
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
				arg_87_0:Play104071023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1019ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1019ui_story == nil then
				arg_87_1.var_.characterEffect1019ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1019ui_story then
					arg_87_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1019ui_story then
				arg_87_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["1011ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect1011ui_story == nil then
				arg_87_1.var_.characterEffect1011ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.1

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect1011ui_story then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1011ui_story.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect1011ui_story then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1011ui_story.fillRatio = var_90_9
			end

			local var_90_10 = arg_87_1.actors_["1011ui_story"].transform
			local var_90_11 = 0

			if var_90_11 < arg_87_1.time_ and arg_87_1.time_ <= var_90_11 + arg_90_0 then
				arg_87_1.var_.moveOldPos1011ui_story = var_90_10.localPosition
			end

			local var_90_12 = 0.001

			if var_90_11 <= arg_87_1.time_ and arg_87_1.time_ < var_90_11 + var_90_12 then
				local var_90_13 = (arg_87_1.time_ - var_90_11) / var_90_12
				local var_90_14 = Vector3.New(0, 100, 0)

				var_90_10.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1011ui_story, var_90_14, var_90_13)

				local var_90_15 = manager.ui.mainCamera.transform.position - var_90_10.position

				var_90_10.forward = Vector3.New(var_90_15.x, var_90_15.y, var_90_15.z)

				local var_90_16 = var_90_10.localEulerAngles

				var_90_16.z = 0
				var_90_16.x = 0
				var_90_10.localEulerAngles = var_90_16
			end

			if arg_87_1.time_ >= var_90_11 + var_90_12 and arg_87_1.time_ < var_90_11 + var_90_12 + arg_90_0 then
				var_90_10.localPosition = Vector3.New(0, 100, 0)

				local var_90_17 = manager.ui.mainCamera.transform.position - var_90_10.position

				var_90_10.forward = Vector3.New(var_90_17.x, var_90_17.y, var_90_17.z)

				local var_90_18 = var_90_10.localEulerAngles

				var_90_18.z = 0
				var_90_18.x = 0
				var_90_10.localEulerAngles = var_90_18
			end

			local var_90_19 = arg_87_1.actors_["1019ui_story"].transform
			local var_90_20 = 0

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.var_.moveOldPos1019ui_story = var_90_19.localPosition
			end

			local var_90_21 = 0.001

			if var_90_20 <= arg_87_1.time_ and arg_87_1.time_ < var_90_20 + var_90_21 then
				local var_90_22 = (arg_87_1.time_ - var_90_20) / var_90_21
				local var_90_23 = Vector3.New(0, -1.08, -5.9)

				var_90_19.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1019ui_story, var_90_23, var_90_22)

				local var_90_24 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_24.x, var_90_24.y, var_90_24.z)

				local var_90_25 = var_90_19.localEulerAngles

				var_90_25.z = 0
				var_90_25.x = 0
				var_90_19.localEulerAngles = var_90_25
			end

			if arg_87_1.time_ >= var_90_20 + var_90_21 and arg_87_1.time_ < var_90_20 + var_90_21 + arg_90_0 then
				var_90_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_90_26 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_26.x, var_90_26.y, var_90_26.z)

				local var_90_27 = var_90_19.localEulerAngles

				var_90_27.z = 0
				var_90_27.x = 0
				var_90_19.localEulerAngles = var_90_27
			end

			local var_90_28 = 0

			if var_90_28 < arg_87_1.time_ and arg_87_1.time_ <= var_90_28 + arg_90_0 then
				arg_87_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_90_29 = 0

			if var_90_29 < arg_87_1.time_ and arg_87_1.time_ <= var_90_29 + arg_90_0 then
				arg_87_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_90_30 = 0
			local var_90_31 = 0.45

			if var_90_30 < arg_87_1.time_ and arg_87_1.time_ <= var_90_30 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_32 = arg_87_1:FormatText(StoryNameCfg[13].name)

				arg_87_1.leftNameTxt_.text = var_90_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_33 = arg_87_1:GetWordFromCfg(104071022)
				local var_90_34 = arg_87_1:FormatText(var_90_33.content)

				arg_87_1.text_.text = var_90_34

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_35 = 18
				local var_90_36 = utf8.len(var_90_34)
				local var_90_37 = var_90_35 <= 0 and var_90_31 or var_90_31 * (var_90_36 / var_90_35)

				if var_90_37 > 0 and var_90_31 < var_90_37 then
					arg_87_1.talkMaxDuration = var_90_37

					if var_90_37 + var_90_30 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_37 + var_90_30
					end
				end

				arg_87_1.text_.text = var_90_34
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071022", "story_v_out_104071.awb") ~= 0 then
					local var_90_38 = manager.audio:GetVoiceLength("story_v_out_104071", "104071022", "story_v_out_104071.awb") / 1000

					if var_90_38 + var_90_30 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_38 + var_90_30
					end

					if var_90_33.prefab_name ~= "" and arg_87_1.actors_[var_90_33.prefab_name] ~= nil then
						local var_90_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_33.prefab_name].transform, "story_v_out_104071", "104071022", "story_v_out_104071.awb")

						arg_87_1:RecordAudio("104071022", var_90_39)
						arg_87_1:RecordAudio("104071022", var_90_39)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_104071", "104071022", "story_v_out_104071.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_104071", "104071022", "story_v_out_104071.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_40 = math.max(var_90_31, arg_87_1.talkMaxDuration)

			if var_90_30 <= arg_87_1.time_ and arg_87_1.time_ < var_90_30 + var_90_40 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_30) / var_90_40

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_30 + var_90_40 and arg_87_1.time_ < var_90_30 + var_90_40 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play104071023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 104071023
		arg_91_1.duration_ = 8.966

		local var_91_0 = {
			ja = 8.133,
			ko = 6.666,
			zh = 7.066,
			en = 8.966
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
				arg_91_0:Play104071024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action425")
			end

			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_94_2 = 0
			local var_94_3 = 1

			if var_94_2 < arg_91_1.time_ and arg_91_1.time_ <= var_94_2 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_4 = arg_91_1:FormatText(StoryNameCfg[13].name)

				arg_91_1.leftNameTxt_.text = var_94_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_5 = arg_91_1:GetWordFromCfg(104071023)
				local var_94_6 = arg_91_1:FormatText(var_94_5.content)

				arg_91_1.text_.text = var_94_6

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_7 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071023", "story_v_out_104071.awb") ~= 0 then
					local var_94_10 = manager.audio:GetVoiceLength("story_v_out_104071", "104071023", "story_v_out_104071.awb") / 1000

					if var_94_10 + var_94_2 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_10 + var_94_2
					end

					if var_94_5.prefab_name ~= "" and arg_91_1.actors_[var_94_5.prefab_name] ~= nil then
						local var_94_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_5.prefab_name].transform, "story_v_out_104071", "104071023", "story_v_out_104071.awb")

						arg_91_1:RecordAudio("104071023", var_94_11)
						arg_91_1:RecordAudio("104071023", var_94_11)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_104071", "104071023", "story_v_out_104071.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_104071", "104071023", "story_v_out_104071.awb")
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
	Play104071024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 104071024
		arg_95_1.duration_ = 6.5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play104071025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.bgs_.B06a
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				local var_98_2 = var_98_0:GetComponent("SpriteRenderer")

				if var_98_2 then
					var_98_2.material = arg_95_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_98_3 = var_98_2.material
					local var_98_4 = var_98_3:GetColor("_Color")

					arg_95_1.var_.alphaOldValueB06a = var_98_4.a
					arg_95_1.var_.alphaMatValueB06a = var_98_3
				end

				arg_95_1.var_.alphaOldValueB06a = 1
			end

			local var_98_5 = 1.5

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_5 then
				local var_98_6 = (arg_95_1.time_ - var_98_1) / var_98_5
				local var_98_7 = Mathf.Lerp(arg_95_1.var_.alphaOldValueB06a, 0, var_98_6)

				if arg_95_1.var_.alphaMatValueB06a then
					local var_98_8 = arg_95_1.var_.alphaMatValueB06a
					local var_98_9 = var_98_8:GetColor("_Color")

					var_98_9.a = var_98_7

					var_98_8:SetColor("_Color", var_98_9)
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_5 and arg_95_1.time_ < var_98_1 + var_98_5 + arg_98_0 and arg_95_1.var_.alphaMatValueB06a then
				local var_98_10 = arg_95_1.var_.alphaMatValueB06a
				local var_98_11 = var_98_10:GetColor("_Color")

				var_98_11.a = 0

				var_98_10:SetColor("_Color", var_98_11)
			end

			local var_98_12 = arg_95_1.bgs_.B06a.transform
			local var_98_13 = 1.5

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1.var_.moveOldPosB06a = var_98_12.localPosition
			end

			local var_98_14 = 0.001

			if var_98_13 <= arg_95_1.time_ and arg_95_1.time_ < var_98_13 + var_98_14 then
				local var_98_15 = (arg_95_1.time_ - var_98_13) / var_98_14
				local var_98_16 = Vector3.New(0, -100, 10)

				var_98_12.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPosB06a, var_98_16, var_98_15)
			end

			if arg_95_1.time_ >= var_98_13 + var_98_14 and arg_95_1.time_ < var_98_13 + var_98_14 + arg_98_0 then
				var_98_12.localPosition = Vector3.New(0, -100, 10)
			end

			local var_98_17 = "A00"

			if arg_95_1.bgs_[var_98_17] == nil then
				local var_98_18 = Object.Instantiate(arg_95_1.paintGo_)

				var_98_18:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_98_17)
				var_98_18.name = var_98_17
				var_98_18.transform.parent = arg_95_1.stage_.transform
				var_98_18.transform.localPosition = Vector3.New(0, 100, 0)
				arg_95_1.bgs_[var_98_17] = var_98_18
			end

			local var_98_19 = arg_95_1.bgs_.A00
			local var_98_20 = 1.5

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				local var_98_21 = var_98_19:GetComponent("SpriteRenderer")

				if var_98_21 then
					var_98_21.material = arg_95_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_98_22 = var_98_21.material
					local var_98_23 = var_98_22:GetColor("_Color")

					arg_95_1.var_.alphaOldValueA00 = var_98_23.a
					arg_95_1.var_.alphaMatValueA00 = var_98_22
				end

				arg_95_1.var_.alphaOldValueA00 = 0
			end

			local var_98_24 = 1.5

			if var_98_20 <= arg_95_1.time_ and arg_95_1.time_ < var_98_20 + var_98_24 then
				local var_98_25 = (arg_95_1.time_ - var_98_20) / var_98_24
				local var_98_26 = Mathf.Lerp(arg_95_1.var_.alphaOldValueA00, 1, var_98_25)

				if arg_95_1.var_.alphaMatValueA00 then
					local var_98_27 = arg_95_1.var_.alphaMatValueA00
					local var_98_28 = var_98_27:GetColor("_Color")

					var_98_28.a = var_98_26

					var_98_27:SetColor("_Color", var_98_28)
				end
			end

			if arg_95_1.time_ >= var_98_20 + var_98_24 and arg_95_1.time_ < var_98_20 + var_98_24 + arg_98_0 and arg_95_1.var_.alphaMatValueA00 then
				local var_98_29 = arg_95_1.var_.alphaMatValueA00
				local var_98_30 = var_98_29:GetColor("_Color")

				var_98_30.a = 1

				var_98_29:SetColor("_Color", var_98_30)
			end

			local var_98_31 = 1.5

			if var_98_31 < arg_95_1.time_ and arg_95_1.time_ <= var_98_31 + arg_98_0 then
				local var_98_32 = manager.ui.mainCamera.transform.localPosition
				local var_98_33 = Vector3.New(0, 0, 10) + Vector3.New(var_98_32.x, var_98_32.y, 0)
				local var_98_34 = arg_95_1.bgs_.A00

				var_98_34.transform.localPosition = var_98_33
				var_98_34.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_98_35 = var_98_34:GetComponent("SpriteRenderer")

				if var_98_35 and var_98_35.sprite then
					local var_98_36 = (var_98_34.transform.localPosition - var_98_32).z
					local var_98_37 = manager.ui.mainCameraCom_
					local var_98_38 = 2 * var_98_36 * Mathf.Tan(var_98_37.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_98_39 = var_98_38 * var_98_37.aspect
					local var_98_40 = var_98_35.sprite.bounds.size.x
					local var_98_41 = var_98_35.sprite.bounds.size.y
					local var_98_42 = var_98_39 / var_98_40
					local var_98_43 = var_98_38 / var_98_41
					local var_98_44 = var_98_43 < var_98_42 and var_98_42 or var_98_43

					var_98_34.transform.localScale = Vector3.New(var_98_44, var_98_44, 0)
				end

				for iter_98_0, iter_98_1 in pairs(arg_95_1.bgs_) do
					if iter_98_0 ~= "A00" then
						iter_98_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_98_45 = arg_95_1.actors_["1019ui_story"].transform
			local var_98_46 = 0

			if var_98_46 < arg_95_1.time_ and arg_95_1.time_ <= var_98_46 + arg_98_0 then
				arg_95_1.var_.moveOldPos1019ui_story = var_98_45.localPosition
			end

			local var_98_47 = 0.001

			if var_98_46 <= arg_95_1.time_ and arg_95_1.time_ < var_98_46 + var_98_47 then
				local var_98_48 = (arg_95_1.time_ - var_98_46) / var_98_47
				local var_98_49 = Vector3.New(0, 100, 0)

				var_98_45.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1019ui_story, var_98_49, var_98_48)

				local var_98_50 = manager.ui.mainCamera.transform.position - var_98_45.position

				var_98_45.forward = Vector3.New(var_98_50.x, var_98_50.y, var_98_50.z)

				local var_98_51 = var_98_45.localEulerAngles

				var_98_51.z = 0
				var_98_51.x = 0
				var_98_45.localEulerAngles = var_98_51
			end

			if arg_95_1.time_ >= var_98_46 + var_98_47 and arg_95_1.time_ < var_98_46 + var_98_47 + arg_98_0 then
				var_98_45.localPosition = Vector3.New(0, 100, 0)

				local var_98_52 = manager.ui.mainCamera.transform.position - var_98_45.position

				var_98_45.forward = Vector3.New(var_98_52.x, var_98_52.y, var_98_52.z)

				local var_98_53 = var_98_45.localEulerAngles

				var_98_53.z = 0
				var_98_53.x = 0
				var_98_45.localEulerAngles = var_98_53
			end

			local var_98_54 = 0

			if var_98_54 < arg_95_1.time_ and arg_95_1.time_ <= var_98_54 + arg_98_0 then
				arg_95_1.allBtn_.enabled = false
			end

			local var_98_55 = 1.5

			if arg_95_1.time_ >= var_98_54 + var_98_55 and arg_95_1.time_ < var_98_54 + var_98_55 + arg_98_0 then
				arg_95_1.allBtn_.enabled = true
			end

			local var_98_56 = 1.5
			local var_98_57 = 0.275

			if var_98_56 < arg_95_1.time_ and arg_95_1.time_ <= var_98_56 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_58 = arg_95_1:GetWordFromCfg(104071024)
				local var_98_59 = arg_95_1:FormatText(var_98_58.content)

				arg_95_1.text_.text = var_98_59

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_60 = 11
				local var_98_61 = utf8.len(var_98_59)
				local var_98_62 = var_98_60 <= 0 and var_98_57 or var_98_57 * (var_98_61 / var_98_60)

				if var_98_62 > 0 and var_98_57 < var_98_62 then
					arg_95_1.talkMaxDuration = var_98_62

					if var_98_62 + var_98_56 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_62 + var_98_56
					end
				end

				arg_95_1.text_.text = var_98_59
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_63 = math.max(var_98_57, arg_95_1.talkMaxDuration)

			if var_98_56 <= arg_95_1.time_ and arg_95_1.time_ < var_98_56 + var_98_63 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_56) / var_98_63

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_56 + var_98_63 and arg_95_1.time_ < var_98_56 + var_98_63 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play104071025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 104071025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play104071026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.45

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[7].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(104071025)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 18
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
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_8 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_8 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_8

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_8 and arg_99_1.time_ < var_102_0 + var_102_8 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play104071026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 104071026
		arg_103_1.duration_ = 9.366

		local var_103_0 = {
			ja = 9.366,
			ko = 6.966,
			zh = 5.7,
			en = 9.333
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
				arg_103_0:Play104071027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.725

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[10].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(104071026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071026", "story_v_out_104071.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_104071", "104071026", "story_v_out_104071.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_104071", "104071026", "story_v_out_104071.awb")

						arg_103_1:RecordAudio("104071026", var_106_9)
						arg_103_1:RecordAudio("104071026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_104071", "104071026", "story_v_out_104071.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_104071", "104071026", "story_v_out_104071.awb")
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
	Play104071027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 104071027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play104071028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.125

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(104071027)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 5
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_8 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_8 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_8

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_8 and arg_107_1.time_ < var_110_0 + var_110_8 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play104071028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 104071028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play104071029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = manager.ui.mainCamera.transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.shakeOldPosMainCamera = var_114_0.localPosition
			end

			local var_114_2 = 0.600000023841858

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / 0.066
				local var_114_4, var_114_5 = math.modf(var_114_3)

				var_114_0.localPosition = Vector3.New(var_114_5 * 0.13, var_114_5 * 0.13, var_114_5 * 0.13) + arg_111_1.var_.shakeOldPosMainCamera
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = arg_111_1.var_.shakeOldPosMainCamera
			end

			local var_114_6 = 0
			local var_114_7 = 1.225

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

				local var_114_8 = arg_111_1:GetWordFromCfg(104071028)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 49
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
	Play104071029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 104071029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play104071030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 1

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_2 = arg_115_1:GetWordFromCfg(104071029)
				local var_118_3 = arg_115_1:FormatText(var_118_2.content)

				arg_115_1.text_.text = var_118_3

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_4 = 40
				local var_118_5 = utf8.len(var_118_3)
				local var_118_6 = var_118_4 <= 0 and var_118_1 or var_118_1 * (var_118_5 / var_118_4)

				if var_118_6 > 0 and var_118_1 < var_118_6 then
					arg_115_1.talkMaxDuration = var_118_6

					if var_118_6 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_6 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_3
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_7 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_7 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_7

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_7 and arg_115_1.time_ < var_118_0 + var_118_7 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play104071030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 104071030
		arg_119_1.duration_ = 8.6

		local var_119_0 = {
			ja = 8.3,
			ko = 8.6,
			zh = 8.066,
			en = 8.6
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
				arg_119_0:Play104071031(arg_119_1)
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

				local var_122_3 = arg_119_1:GetWordFromCfg(104071030)
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071030", "story_v_out_104071.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_104071", "104071030", "story_v_out_104071.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_104071", "104071030", "story_v_out_104071.awb")

						arg_119_1:RecordAudio("104071030", var_122_9)
						arg_119_1:RecordAudio("104071030", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_104071", "104071030", "story_v_out_104071.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_104071", "104071030", "story_v_out_104071.awb")
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
	Play104071031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 104071031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play104071032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.475

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[7].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(104071031)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 19
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_8 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_8 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_8

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_8 and arg_123_1.time_ < var_126_0 + var_126_8 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play104071032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 104071032
		arg_127_1.duration_ = 14.033

		local var_127_0 = {
			ja = 14.033,
			ko = 11.266,
			zh = 9,
			en = 11.166
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
				arg_127_0:Play104071033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = "1037ui_story"

			if arg_127_1.actors_[var_130_0] == nil then
				local var_130_1 = Object.Instantiate(Asset.Load("Char/" .. var_130_0), arg_127_1.stage_.transform)

				var_130_1.name = var_130_0
				var_130_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_127_1.actors_[var_130_0] = var_130_1

				local var_130_2 = var_130_1:GetComponentInChildren(typeof(CharacterEffect))

				var_130_2.enabled = true

				local var_130_3 = GameObjectTools.GetOrAddComponent(var_130_1, typeof(DynamicBoneHelper))

				if var_130_3 then
					var_130_3:EnableDynamicBone(false)
				end

				arg_127_1:ShowWeapon(var_130_2.transform, false)

				arg_127_1.var_[var_130_0 .. "Animator"] = var_130_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_127_1.var_[var_130_0 .. "Animator"].applyRootMotion = true
				arg_127_1.var_[var_130_0 .. "LipSync"] = var_130_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_130_4 = arg_127_1.actors_["1037ui_story"]
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 and arg_127_1.var_.characterEffect1037ui_story == nil then
				arg_127_1.var_.characterEffect1037ui_story = var_130_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_6 = 0.1

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6

				if arg_127_1.var_.characterEffect1037ui_story then
					arg_127_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect1037ui_story then
				arg_127_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_130_8 = arg_127_1.actors_["1037ui_story"].transform
			local var_130_9 = 0

			if var_130_9 < arg_127_1.time_ and arg_127_1.time_ <= var_130_9 + arg_130_0 then
				arg_127_1.var_.moveOldPos1037ui_story = var_130_8.localPosition
			end

			local var_130_10 = 0.001

			if var_130_9 <= arg_127_1.time_ and arg_127_1.time_ < var_130_9 + var_130_10 then
				local var_130_11 = (arg_127_1.time_ - var_130_9) / var_130_10
				local var_130_12 = Vector3.New(0, -1.09, -5.81)

				var_130_8.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1037ui_story, var_130_12, var_130_11)

				local var_130_13 = manager.ui.mainCamera.transform.position - var_130_8.position

				var_130_8.forward = Vector3.New(var_130_13.x, var_130_13.y, var_130_13.z)

				local var_130_14 = var_130_8.localEulerAngles

				var_130_14.z = 0
				var_130_14.x = 0
				var_130_8.localEulerAngles = var_130_14
			end

			if arg_127_1.time_ >= var_130_9 + var_130_10 and arg_127_1.time_ < var_130_9 + var_130_10 + arg_130_0 then
				var_130_8.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_130_15 = manager.ui.mainCamera.transform.position - var_130_8.position

				var_130_8.forward = Vector3.New(var_130_15.x, var_130_15.y, var_130_15.z)

				local var_130_16 = var_130_8.localEulerAngles

				var_130_16.z = 0
				var_130_16.x = 0
				var_130_8.localEulerAngles = var_130_16
			end

			local var_130_17 = 0

			if var_130_17 < arg_127_1.time_ and arg_127_1.time_ <= var_130_17 + arg_130_0 then
				arg_127_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action5_1")
			end

			local var_130_18 = 0

			if var_130_18 < arg_127_1.time_ and arg_127_1.time_ <= var_130_18 + arg_130_0 then
				arg_127_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface9903cva")
			end

			local var_130_19 = 0
			local var_130_20 = 1.125

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_21 = arg_127_1:FormatText(StoryNameCfg[15].name)

				arg_127_1.leftNameTxt_.text = var_130_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_22 = arg_127_1:GetWordFromCfg(104071032)
				local var_130_23 = arg_127_1:FormatText(var_130_22.content)

				arg_127_1.text_.text = var_130_23

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_24 = 45
				local var_130_25 = utf8.len(var_130_23)
				local var_130_26 = var_130_24 <= 0 and var_130_20 or var_130_20 * (var_130_25 / var_130_24)

				if var_130_26 > 0 and var_130_20 < var_130_26 then
					arg_127_1.talkMaxDuration = var_130_26

					if var_130_26 + var_130_19 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_26 + var_130_19
					end
				end

				arg_127_1.text_.text = var_130_23
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071032", "story_v_out_104071.awb") ~= 0 then
					local var_130_27 = manager.audio:GetVoiceLength("story_v_out_104071", "104071032", "story_v_out_104071.awb") / 1000

					if var_130_27 + var_130_19 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_27 + var_130_19
					end

					if var_130_22.prefab_name ~= "" and arg_127_1.actors_[var_130_22.prefab_name] ~= nil then
						local var_130_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_22.prefab_name].transform, "story_v_out_104071", "104071032", "story_v_out_104071.awb")

						arg_127_1:RecordAudio("104071032", var_130_28)
						arg_127_1:RecordAudio("104071032", var_130_28)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_104071", "104071032", "story_v_out_104071.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_104071", "104071032", "story_v_out_104071.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_29 = math.max(var_130_20, arg_127_1.talkMaxDuration)

			if var_130_19 <= arg_127_1.time_ and arg_127_1.time_ < var_130_19 + var_130_29 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_19) / var_130_29

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_19 + var_130_29 and arg_127_1.time_ < var_130_19 + var_130_29 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play104071033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 104071033
		arg_131_1.duration_ = 10.3

		local var_131_0 = {
			ja = 10.3,
			ko = 5.533,
			zh = 4.8,
			en = 7.2
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
				arg_131_0:Play104071034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1037ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1037ui_story == nil then
				arg_131_1.var_.characterEffect1037ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.1

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1037ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1037ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1037ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1037ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 0.625

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_8 = arg_131_1:FormatText(StoryNameCfg[10].name)

				arg_131_1.leftNameTxt_.text = var_134_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, true)
				arg_131_1.iconController_:SetSelectedState("hero")

				arg_131_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_9 = arg_131_1:GetWordFromCfg(104071033)
				local var_134_10 = arg_131_1:FormatText(var_134_9.content)

				arg_131_1.text_.text = var_134_10

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_11 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071033", "story_v_out_104071.awb") ~= 0 then
					local var_134_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071033", "story_v_out_104071.awb") / 1000

					if var_134_14 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_14 + var_134_6
					end

					if var_134_9.prefab_name ~= "" and arg_131_1.actors_[var_134_9.prefab_name] ~= nil then
						local var_134_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_9.prefab_name].transform, "story_v_out_104071", "104071033", "story_v_out_104071.awb")

						arg_131_1:RecordAudio("104071033", var_134_15)
						arg_131_1:RecordAudio("104071033", var_134_15)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_104071", "104071033", "story_v_out_104071.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_104071", "104071033", "story_v_out_104071.awb")
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
	Play104071034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 104071034
		arg_135_1.duration_ = 6.4

		local var_135_0 = {
			ja = 6.4,
			ko = 2.6,
			zh = 2.333,
			en = 3.033
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
				arg_135_0:Play104071035(arg_135_1)
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
				arg_135_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action456")
			end

			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_138_6 = 0
			local var_138_7 = 0.275

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_8 = arg_135_1:FormatText(StoryNameCfg[15].name)

				arg_135_1.leftNameTxt_.text = var_138_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_9 = arg_135_1:GetWordFromCfg(104071034)
				local var_138_10 = arg_135_1:FormatText(var_138_9.content)

				arg_135_1.text_.text = var_138_10

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_11 = 11
				local var_138_12 = utf8.len(var_138_10)
				local var_138_13 = var_138_11 <= 0 and var_138_7 or var_138_7 * (var_138_12 / var_138_11)

				if var_138_13 > 0 and var_138_7 < var_138_13 then
					arg_135_1.talkMaxDuration = var_138_13

					if var_138_13 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_13 + var_138_6
					end
				end

				arg_135_1.text_.text = var_138_10
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104071", "104071034", "story_v_out_104071.awb") ~= 0 then
					local var_138_14 = manager.audio:GetVoiceLength("story_v_out_104071", "104071034", "story_v_out_104071.awb") / 1000

					if var_138_14 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_14 + var_138_6
					end

					if var_138_9.prefab_name ~= "" and arg_135_1.actors_[var_138_9.prefab_name] ~= nil then
						local var_138_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_9.prefab_name].transform, "story_v_out_104071", "104071034", "story_v_out_104071.awb")

						arg_135_1:RecordAudio("104071034", var_138_15)
						arg_135_1:RecordAudio("104071034", var_138_15)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_104071", "104071034", "story_v_out_104071.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_104071", "104071034", "story_v_out_104071.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_16 = math.max(var_138_7, arg_135_1.talkMaxDuration)

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_16 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_6) / var_138_16

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_6 + var_138_16 and arg_135_1.time_ < var_138_6 + var_138_16 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play104071035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 104071035
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play104071036(arg_139_1)
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

			local var_142_6 = arg_139_1.actors_["1037ui_story"].transform
			local var_142_7 = 0

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 then
				arg_139_1.var_.moveOldPos1037ui_story = var_142_6.localPosition
			end

			local var_142_8 = 0.001

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_8 then
				local var_142_9 = (arg_139_1.time_ - var_142_7) / var_142_8
				local var_142_10 = Vector3.New(0, 100, 0)

				var_142_6.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1037ui_story, var_142_10, var_142_9)

				local var_142_11 = manager.ui.mainCamera.transform.position - var_142_6.position

				var_142_6.forward = Vector3.New(var_142_11.x, var_142_11.y, var_142_11.z)

				local var_142_12 = var_142_6.localEulerAngles

				var_142_12.z = 0
				var_142_12.x = 0
				var_142_6.localEulerAngles = var_142_12
			end

			if arg_139_1.time_ >= var_142_7 + var_142_8 and arg_139_1.time_ < var_142_7 + var_142_8 + arg_142_0 then
				var_142_6.localPosition = Vector3.New(0, 100, 0)

				local var_142_13 = manager.ui.mainCamera.transform.position - var_142_6.position

				var_142_6.forward = Vector3.New(var_142_13.x, var_142_13.y, var_142_13.z)

				local var_142_14 = var_142_6.localEulerAngles

				var_142_14.z = 0
				var_142_14.x = 0
				var_142_6.localEulerAngles = var_142_14
			end

			local var_142_15 = 0
			local var_142_16 = 0.075

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_17 = arg_139_1:FormatText(StoryNameCfg[7].name)

				arg_139_1.leftNameTxt_.text = var_142_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_18 = arg_139_1:GetWordFromCfg(104071035)
				local var_142_19 = arg_139_1:FormatText(var_142_18.content)

				arg_139_1.text_.text = var_142_19

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_20 = 3
				local var_142_21 = utf8.len(var_142_19)
				local var_142_22 = var_142_20 <= 0 and var_142_16 or var_142_16 * (var_142_21 / var_142_20)

				if var_142_22 > 0 and var_142_16 < var_142_22 then
					arg_139_1.talkMaxDuration = var_142_22

					if var_142_22 + var_142_15 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_22 + var_142_15
					end
				end

				arg_139_1.text_.text = var_142_19
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_23 = math.max(var_142_16, arg_139_1.talkMaxDuration)

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_23 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_15) / var_142_23

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_15 + var_142_23 and arg_139_1.time_ < var_142_15 + var_142_23 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play104071036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 104071036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
			arg_143_1.auto_ = false
		end

		function arg_143_1.playNext_(arg_145_0)
			arg_143_1.onStoryFinished_()
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.425

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[7].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(104071036)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 17
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
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_8 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_8 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_8

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_8 and arg_143_1.time_ < var_146_0 + var_146_8 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B06a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00"
	},
	voices = {
		"story_v_out_104071.awb"
	}
}
