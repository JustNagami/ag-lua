return {
	Play105071001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 105071001
		arg_1_1.duration_ = 5.4

		local var_1_0 = {
			ja = 5.166,
			ko = 3.799999952315,
			zh = 5.4,
			en = 4.2
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
				arg_1_0:Play105071002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "effect"

				arg_1_1:AudioAction(var_4_2, var_4_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_4 = "1013ui_story"

			if arg_1_1.actors_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(Asset.Load("Char/" .. var_4_4), arg_1_1.stage_.transform)

				var_4_5.name = var_4_4
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_4] = var_4_5

				local var_4_6 = var_4_5:GetComponentInChildren(typeof(CharacterEffect))

				var_4_6.enabled = true

				local var_4_7 = GameObjectTools.GetOrAddComponent(var_4_5, typeof(DynamicBoneHelper))

				if var_4_7 then
					var_4_7:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_6.transform, false)

				arg_1_1.var_[var_4_4 .. "Animator"] = var_4_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_4 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_4 .. "LipSync"] = var_4_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_8 = arg_1_1.actors_["1013ui_story"]
			local var_4_9 = 2

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 and arg_1_1.var_.characterEffect1013ui_story == nil then
				arg_1_1.var_.characterEffect1013ui_story = var_4_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_10 = 0.1

			if var_4_9 <= arg_1_1.time_ and arg_1_1.time_ < var_4_9 + var_4_10 then
				local var_4_11 = (arg_1_1.time_ - var_4_9) / var_4_10

				if arg_1_1.var_.characterEffect1013ui_story then
					arg_1_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_9 + var_4_10 and arg_1_1.time_ < var_4_9 + var_4_10 + arg_4_0 and arg_1_1.var_.characterEffect1013ui_story then
				arg_1_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_4_12 = "B01c"

			if arg_1_1.bgs_[var_4_12] == nil then
				local var_4_13 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_12)
				var_4_13.name = var_4_12
				var_4_13.transform.parent = arg_1_1.stage_.transform
				var_4_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_12] = var_4_13
			end

			local var_4_14 = arg_1_1.bgs_.B01c
			local var_4_15 = 0

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				local var_4_16 = var_4_14:GetComponent("SpriteRenderer")

				if var_4_16 then
					var_4_16.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_17 = var_4_16.material
					local var_4_18 = var_4_17:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB01c = var_4_18.a
					arg_1_1.var_.alphaMatValueB01c = var_4_17
				end

				arg_1_1.var_.alphaOldValueB01c = 0
			end

			local var_4_19 = 1.5

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_15) / var_4_19
				local var_4_21 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB01c, 1, var_4_20)

				if arg_1_1.var_.alphaMatValueB01c then
					local var_4_22 = arg_1_1.var_.alphaMatValueB01c
					local var_4_23 = var_4_22:GetColor("_Color")

					var_4_23.a = var_4_21

					var_4_22:SetColor("_Color", var_4_23)
				end
			end

			if arg_1_1.time_ >= var_4_15 + var_4_19 and arg_1_1.time_ < var_4_15 + var_4_19 + arg_4_0 and arg_1_1.var_.alphaMatValueB01c then
				local var_4_24 = arg_1_1.var_.alphaMatValueB01c
				local var_4_25 = var_4_24:GetColor("_Color")

				var_4_25.a = 1

				var_4_24:SetColor("_Color", var_4_25)
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_27 = manager.ui.mainCamera.transform.localPosition
				local var_4_28 = Vector3.New(0, 0, 10) + Vector3.New(var_4_27.x, var_4_27.y, 0)
				local var_4_29 = arg_1_1.bgs_.B01c

				var_4_29.transform.localPosition = var_4_28
				var_4_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_30 = var_4_29:GetComponent("SpriteRenderer")

				if var_4_30 and var_4_30.sprite then
					local var_4_31 = (var_4_29.transform.localPosition - var_4_27).z
					local var_4_32 = manager.ui.mainCameraCom_
					local var_4_33 = 2 * var_4_31 * Mathf.Tan(var_4_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_34 = var_4_33 * var_4_32.aspect
					local var_4_35 = var_4_30.sprite.bounds.size.x
					local var_4_36 = var_4_30.sprite.bounds.size.y
					local var_4_37 = var_4_34 / var_4_35
					local var_4_38 = var_4_33 / var_4_36
					local var_4_39 = var_4_38 < var_4_37 and var_4_37 or var_4_38

					var_4_29.transform.localScale = Vector3.New(var_4_39, var_4_39, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B01c" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_40 = arg_1_1.actors_["1013ui_story"].transform
			local var_4_41 = 1.79999995231628

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1.var_.moveOldPos1013ui_story = var_4_40.localPosition
			end

			local var_4_42 = 0.001

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42
				local var_4_44 = Vector3.New(-0.7, -0.66, -6.15)

				var_4_40.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1013ui_story, var_4_44, var_4_43)

				local var_4_45 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_45.x, var_4_45.y, var_4_45.z)

				local var_4_46 = var_4_40.localEulerAngles

				var_4_46.z = 0
				var_4_46.x = 0
				var_4_40.localEulerAngles = var_4_46
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				var_4_40.localPosition = Vector3.New(-0.7, -0.66, -6.15)

				local var_4_47 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_47.x, var_4_47.y, var_4_47.z)

				local var_4_48 = var_4_40.localEulerAngles

				var_4_48.z = 0
				var_4_48.x = 0
				var_4_40.localEulerAngles = var_4_48
			end

			local var_4_49 = 1.79999995231628

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action10_1")
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
				arg_1_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2
			local var_4_54 = 0.1

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

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[35].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(105071001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071001", "story_v_out_105071.awb") ~= 0 then
					local var_4_62 = manager.audio:GetVoiceLength("story_v_out_105071", "105071001", "story_v_out_105071.awb") / 1000

					if var_4_62 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_53
					end

					if var_4_57.prefab_name ~= "" and arg_1_1.actors_[var_4_57.prefab_name] ~= nil then
						local var_4_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_57.prefab_name].transform, "story_v_out_105071", "105071001", "story_v_out_105071.awb")

						arg_1_1:RecordAudio("105071001", var_4_63)
						arg_1_1:RecordAudio("105071001", var_4_63)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_105071", "105071001", "story_v_out_105071.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_105071", "105071001", "story_v_out_105071.awb")
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
	Play105071002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 105071002
		arg_7_1.duration_ = 4.533

		local var_7_0 = {
			ja = 4.533,
			ko = 2.633,
			zh = 2.6,
			en = 1.999999999999
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
				arg_7_0:Play105071003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "music"

				arg_7_1:AudioAction(var_10_2, var_10_3, "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin")
			end

			local var_10_4 = "10002_tpose"

			if arg_7_1.actors_[var_10_4] == nil then
				local var_10_5 = Object.Instantiate(Asset.Load("Char/" .. var_10_4), arg_7_1.stage_.transform)

				var_10_5.name = var_10_4
				var_10_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_4] = var_10_5

				local var_10_6 = var_10_5:GetComponentInChildren(typeof(CharacterEffect))

				var_10_6.enabled = true

				local var_10_7 = GameObjectTools.GetOrAddComponent(var_10_5, typeof(DynamicBoneHelper))

				if var_10_7 then
					var_10_7:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_6.transform, false)

				arg_7_1.var_[var_10_4 .. "Animator"] = var_10_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_4 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_4 .. "LipSync"] = var_10_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_8 = arg_7_1.actors_["10002_tpose"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect10002_tpose == nil then
				arg_7_1.var_.characterEffect10002_tpose = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect10002_tpose then
					arg_7_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect10002_tpose then
				arg_7_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_10_12 = arg_7_1.actors_["1013ui_story"]
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 and arg_7_1.var_.characterEffect1013ui_story == nil then
				arg_7_1.var_.characterEffect1013ui_story = var_10_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_14 = 0.1

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14

				if arg_7_1.var_.characterEffect1013ui_story then
					local var_10_16 = Mathf.Lerp(0, 0.5, var_10_15)

					arg_7_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1013ui_story.fillRatio = var_10_16
				end
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1013ui_story then
				local var_10_17 = 0.5

				arg_7_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1013ui_story.fillRatio = var_10_17
			end

			local var_10_18 = arg_7_1.actors_["10002_tpose"].transform
			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.var_.moveOldPos10002_tpose = var_10_18.localPosition
			end

			local var_10_20 = 0.001

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_20 then
				local var_10_21 = (arg_7_1.time_ - var_10_19) / var_10_20
				local var_10_22 = Vector3.New(0.7, -1.2, -5.8)

				var_10_18.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10002_tpose, var_10_22, var_10_21)

				local var_10_23 = manager.ui.mainCamera.transform.position - var_10_18.position

				var_10_18.forward = Vector3.New(var_10_23.x, var_10_23.y, var_10_23.z)

				local var_10_24 = var_10_18.localEulerAngles

				var_10_24.z = 0
				var_10_24.x = 0
				var_10_18.localEulerAngles = var_10_24
			end

			if arg_7_1.time_ >= var_10_19 + var_10_20 and arg_7_1.time_ < var_10_19 + var_10_20 + arg_10_0 then
				var_10_18.localPosition = Vector3.New(0.7, -1.2, -5.8)

				local var_10_25 = manager.ui.mainCamera.transform.position - var_10_18.position

				var_10_18.forward = Vector3.New(var_10_25.x, var_10_25.y, var_10_25.z)

				local var_10_26 = var_10_18.localEulerAngles

				var_10_26.z = 0
				var_10_26.x = 0
				var_10_18.localEulerAngles = var_10_26
			end

			local var_10_27 = 0

			if var_10_27 < arg_7_1.time_ and arg_7_1.time_ <= var_10_27 + arg_10_0 then
				arg_7_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_10_28 = 0

			if var_10_28 < arg_7_1.time_ and arg_7_1.time_ <= var_10_28 + arg_10_0 then
				arg_7_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_10_29 = 0
			local var_10_30 = 0.25

			if var_10_29 < arg_7_1.time_ and arg_7_1.time_ <= var_10_29 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_31 = arg_7_1:FormatText(StoryNameCfg[39].name)

				arg_7_1.leftNameTxt_.text = var_10_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_32 = arg_7_1:GetWordFromCfg(105071002)
				local var_10_33 = arg_7_1:FormatText(var_10_32.content)

				arg_7_1.text_.text = var_10_33

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_34 = 8
				local var_10_35 = utf8.len(var_10_33)
				local var_10_36 = var_10_34 <= 0 and var_10_30 or var_10_30 * (var_10_35 / var_10_34)

				if var_10_36 > 0 and var_10_30 < var_10_36 then
					arg_7_1.talkMaxDuration = var_10_36

					if var_10_36 + var_10_29 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_36 + var_10_29
					end
				end

				arg_7_1.text_.text = var_10_33
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071002", "story_v_out_105071.awb") ~= 0 then
					local var_10_37 = manager.audio:GetVoiceLength("story_v_out_105071", "105071002", "story_v_out_105071.awb") / 1000

					if var_10_37 + var_10_29 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_37 + var_10_29
					end

					if var_10_32.prefab_name ~= "" and arg_7_1.actors_[var_10_32.prefab_name] ~= nil then
						local var_10_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_32.prefab_name].transform, "story_v_out_105071", "105071002", "story_v_out_105071.awb")

						arg_7_1:RecordAudio("105071002", var_10_38)
						arg_7_1:RecordAudio("105071002", var_10_38)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_105071", "105071002", "story_v_out_105071.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_105071", "105071002", "story_v_out_105071.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_39 = math.max(var_10_30, arg_7_1.talkMaxDuration)

			if var_10_29 <= arg_7_1.time_ and arg_7_1.time_ < var_10_29 + var_10_39 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_29) / var_10_39

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_29 + var_10_39 and arg_7_1.time_ < var_10_29 + var_10_39 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play105071003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 105071003
		arg_11_1.duration_ = 5.033

		local var_11_0 = {
			ja = 5.033,
			ko = 2.3,
			zh = 4.166,
			en = 4.233
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
				arg_11_0:Play105071004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1013ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1013ui_story == nil then
				arg_11_1.var_.characterEffect1013ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.1

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1013ui_story then
					arg_11_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1013ui_story then
				arg_11_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_14_4 = arg_11_1.actors_["10002_tpose"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect10002_tpose == nil then
				arg_11_1.var_.characterEffect10002_tpose = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect10002_tpose then
					local var_14_8 = Mathf.Lerp(0, 0.5, var_14_7)

					arg_11_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_11_1.var_.characterEffect10002_tpose.fillRatio = var_14_8
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect10002_tpose then
				local var_14_9 = 0.5

				arg_11_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_11_1.var_.characterEffect10002_tpose.fillRatio = var_14_9
			end

			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action4104")
			end

			local var_14_11 = 0

			if var_14_11 < arg_11_1.time_ and arg_11_1.time_ <= var_14_11 + arg_14_0 then
				arg_11_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_14_12 = 0
			local var_14_13 = 0.25

			if var_14_12 < arg_11_1.time_ and arg_11_1.time_ <= var_14_12 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_14 = arg_11_1:FormatText(StoryNameCfg[35].name)

				arg_11_1.leftNameTxt_.text = var_14_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_15 = arg_11_1:GetWordFromCfg(105071003)
				local var_14_16 = arg_11_1:FormatText(var_14_15.content)

				arg_11_1.text_.text = var_14_16

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_17 = 10
				local var_14_18 = utf8.len(var_14_16)
				local var_14_19 = var_14_17 <= 0 and var_14_13 or var_14_13 * (var_14_18 / var_14_17)

				if var_14_19 > 0 and var_14_13 < var_14_19 then
					arg_11_1.talkMaxDuration = var_14_19

					if var_14_19 + var_14_12 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_19 + var_14_12
					end
				end

				arg_11_1.text_.text = var_14_16
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071003", "story_v_out_105071.awb") ~= 0 then
					local var_14_20 = manager.audio:GetVoiceLength("story_v_out_105071", "105071003", "story_v_out_105071.awb") / 1000

					if var_14_20 + var_14_12 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_20 + var_14_12
					end

					if var_14_15.prefab_name ~= "" and arg_11_1.actors_[var_14_15.prefab_name] ~= nil then
						local var_14_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_15.prefab_name].transform, "story_v_out_105071", "105071003", "story_v_out_105071.awb")

						arg_11_1:RecordAudio("105071003", var_14_21)
						arg_11_1:RecordAudio("105071003", var_14_21)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_105071", "105071003", "story_v_out_105071.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_105071", "105071003", "story_v_out_105071.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_22 = math.max(var_14_13, arg_11_1.talkMaxDuration)

			if var_14_12 <= arg_11_1.time_ and arg_11_1.time_ < var_14_12 + var_14_22 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_12) / var_14_22

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_12 + var_14_22 and arg_11_1.time_ < var_14_12 + var_14_22 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play105071004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 105071004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play105071005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10002_tpose"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos10002_tpose = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10002_tpose, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, 100, 0)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1013ui_story"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos1013ui_story = var_18_9.localPosition
			end

			local var_18_11 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11
				local var_18_13 = Vector3.New(0, 100, 0)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1013ui_story, var_18_13, var_18_12)

				local var_18_14 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_14.x, var_18_14.y, var_18_14.z)

				local var_18_15 = var_18_9.localEulerAngles

				var_18_15.z = 0
				var_18_15.x = 0
				var_18_9.localEulerAngles = var_18_15
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(0, 100, 0)

				local var_18_16 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_16.x, var_18_16.y, var_18_16.z)

				local var_18_17 = var_18_9.localEulerAngles

				var_18_17.z = 0
				var_18_17.x = 0
				var_18_9.localEulerAngles = var_18_17
			end

			local var_18_18 = 0
			local var_18_19 = 0.825

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_20 = arg_15_1:GetWordFromCfg(105071004)
				local var_18_21 = arg_15_1:FormatText(var_18_20.content)

				arg_15_1.text_.text = var_18_21

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_22 = 33
				local var_18_23 = utf8.len(var_18_21)
				local var_18_24 = var_18_22 <= 0 and var_18_19 or var_18_19 * (var_18_23 / var_18_22)

				if var_18_24 > 0 and var_18_19 < var_18_24 then
					arg_15_1.talkMaxDuration = var_18_24

					if var_18_24 + var_18_18 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_24 + var_18_18
					end
				end

				arg_15_1.text_.text = var_18_21
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_25 = math.max(var_18_19, arg_15_1.talkMaxDuration)

			if var_18_18 <= arg_15_1.time_ and arg_15_1.time_ < var_18_18 + var_18_25 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_18) / var_18_25

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_18 + var_18_25 and arg_15_1.time_ < var_18_18 + var_18_25 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play105071005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 105071005
		arg_19_1.duration_ = 2

		local var_19_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2
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
				arg_19_0:Play105071006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1013ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1013ui_story == nil then
				arg_19_1.var_.characterEffect1013ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1013ui_story then
					arg_19_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1013ui_story then
				arg_19_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1013ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1013ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0, -0.66, -6.15)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1013ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action5_1")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_22_15 = 0
			local var_22_16 = 0.1

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_17 = arg_19_1:FormatText(StoryNameCfg[35].name)

				arg_19_1.leftNameTxt_.text = var_22_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_18 = arg_19_1:GetWordFromCfg(105071005)
				local var_22_19 = arg_19_1:FormatText(var_22_18.content)

				arg_19_1.text_.text = var_22_19

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_20 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071005", "story_v_out_105071.awb") ~= 0 then
					local var_22_23 = manager.audio:GetVoiceLength("story_v_out_105071", "105071005", "story_v_out_105071.awb") / 1000

					if var_22_23 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_23 + var_22_15
					end

					if var_22_18.prefab_name ~= "" and arg_19_1.actors_[var_22_18.prefab_name] ~= nil then
						local var_22_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_18.prefab_name].transform, "story_v_out_105071", "105071005", "story_v_out_105071.awb")

						arg_19_1:RecordAudio("105071005", var_22_24)
						arg_19_1:RecordAudio("105071005", var_22_24)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_105071", "105071005", "story_v_out_105071.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_105071", "105071005", "story_v_out_105071.awb")
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
	Play105071006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 105071006
		arg_23_1.duration_ = 1.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play105071007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = manager.ui.mainCamera.transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.shakeOldPosMainCamera = var_26_0.localPosition
			end

			local var_26_2 = 0.600000023841858

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / 0.066
				local var_26_4, var_26_5 = math.modf(var_26_3)

				var_26_0.localPosition = Vector3.New(var_26_5 * 0.13, var_26_5 * 0.13, var_26_5 * 0.13) + arg_23_1.var_.shakeOldPosMainCamera
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = arg_23_1.var_.shakeOldPosMainCamera
			end

			local var_26_6 = 0

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action459")
			end

			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 then
				arg_23_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_26_8 = 0
			local var_26_9 = 0.1

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_10 = arg_23_1:FormatText(StoryNameCfg[35].name)

				arg_23_1.leftNameTxt_.text = var_26_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_11 = arg_23_1:GetWordFromCfg(105071006)
				local var_26_12 = arg_23_1:FormatText(var_26_11.content)

				arg_23_1.text_.text = var_26_12

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_13 = 4
				local var_26_14 = utf8.len(var_26_12)
				local var_26_15 = var_26_13 <= 0 and var_26_9 or var_26_9 * (var_26_14 / var_26_13)

				if var_26_15 > 0 and var_26_9 < var_26_15 then
					arg_23_1.talkMaxDuration = var_26_15

					if var_26_15 + var_26_8 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_15 + var_26_8
					end
				end

				arg_23_1.text_.text = var_26_12
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071006", "story_v_out_105071.awb") ~= 0 then
					local var_26_16 = manager.audio:GetVoiceLength("story_v_out_105071", "105071006", "story_v_out_105071.awb") / 1000

					if var_26_16 + var_26_8 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_16 + var_26_8
					end

					if var_26_11.prefab_name ~= "" and arg_23_1.actors_[var_26_11.prefab_name] ~= nil then
						local var_26_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_11.prefab_name].transform, "story_v_out_105071", "105071006", "story_v_out_105071.awb")

						arg_23_1:RecordAudio("105071006", var_26_17)
						arg_23_1:RecordAudio("105071006", var_26_17)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_105071", "105071006", "story_v_out_105071.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_105071", "105071006", "story_v_out_105071.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_18 = math.max(var_26_9, arg_23_1.talkMaxDuration)

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_18 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_8) / var_26_18

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_8 + var_26_18 and arg_23_1.time_ < var_26_8 + var_26_18 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play105071007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 105071007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play105071008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				local var_30_2 = "play"
				local var_30_3 = "effect"

				arg_27_1:AudioAction(var_30_2, var_30_3, "se_story_5", "se_story_5_fist", "")
			end

			local var_30_4 = arg_27_1.actors_["1013ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect1013ui_story == nil then
				arg_27_1.var_.characterEffect1013ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1013ui_story then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1013ui_story.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1013ui_story then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1013ui_story.fillRatio = var_30_9
			end

			local var_30_10 = manager.ui.mainCamera.transform
			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.var_.shakeOldPosMainCamera = var_30_10.localPosition
			end

			local var_30_12 = 0.600000023841858

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_12 then
				local var_30_13 = (arg_27_1.time_ - var_30_11) / 0.066
				local var_30_14, var_30_15 = math.modf(var_30_13)

				var_30_10.localPosition = Vector3.New(var_30_15 * 0.13, var_30_15 * 0.13, var_30_15 * 0.13) + arg_27_1.var_.shakeOldPosMainCamera
			end

			if arg_27_1.time_ >= var_30_11 + var_30_12 and arg_27_1.time_ < var_30_11 + var_30_12 + arg_30_0 then
				var_30_10.localPosition = arg_27_1.var_.shakeOldPosMainCamera
			end

			local var_30_16 = arg_27_1.actors_["1013ui_story"].transform
			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 then
				arg_27_1.var_.moveOldPos1013ui_story = var_30_16.localPosition
			end

			local var_30_18 = 0.001

			if var_30_17 <= arg_27_1.time_ and arg_27_1.time_ < var_30_17 + var_30_18 then
				local var_30_19 = (arg_27_1.time_ - var_30_17) / var_30_18
				local var_30_20 = Vector3.New(0, 100, 0)

				var_30_16.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1013ui_story, var_30_20, var_30_19)

				local var_30_21 = manager.ui.mainCamera.transform.position - var_30_16.position

				var_30_16.forward = Vector3.New(var_30_21.x, var_30_21.y, var_30_21.z)

				local var_30_22 = var_30_16.localEulerAngles

				var_30_22.z = 0
				var_30_22.x = 0
				var_30_16.localEulerAngles = var_30_22
			end

			if arg_27_1.time_ >= var_30_17 + var_30_18 and arg_27_1.time_ < var_30_17 + var_30_18 + arg_30_0 then
				var_30_16.localPosition = Vector3.New(0, 100, 0)

				local var_30_23 = manager.ui.mainCamera.transform.position - var_30_16.position

				var_30_16.forward = Vector3.New(var_30_23.x, var_30_23.y, var_30_23.z)

				local var_30_24 = var_30_16.localEulerAngles

				var_30_24.z = 0
				var_30_24.x = 0
				var_30_16.localEulerAngles = var_30_24
			end

			local var_30_25 = 0
			local var_30_26 = 1.55

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_27 = arg_27_1:GetWordFromCfg(105071007)
				local var_30_28 = arg_27_1:FormatText(var_30_27.content)

				arg_27_1.text_.text = var_30_28

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_29 = 62
				local var_30_30 = utf8.len(var_30_28)
				local var_30_31 = var_30_29 <= 0 and var_30_26 or var_30_26 * (var_30_30 / var_30_29)

				if var_30_31 > 0 and var_30_26 < var_30_31 then
					arg_27_1.talkMaxDuration = var_30_31

					if var_30_31 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_31 + var_30_25
					end
				end

				arg_27_1.text_.text = var_30_28
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_32 = math.max(var_30_26, arg_27_1.talkMaxDuration)

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_32 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_25) / var_30_32

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_25 + var_30_32 and arg_27_1.time_ < var_30_25 + var_30_32 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play105071008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 105071008
		arg_31_1.duration_ = 3.8

		local var_31_0 = {
			ja = 1.999999999999,
			ko = 2.833,
			zh = 3.8,
			en = 3.566
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
				arg_31_0:Play105071009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1013ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1013ui_story == nil then
				arg_31_1.var_.characterEffect1013ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1013ui_story then
					arg_31_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1013ui_story then
				arg_31_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1013ui_story"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos1013ui_story = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0, -0.66, -6.15)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1013ui_story, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action13_2")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_34_15 = 0
			local var_34_16 = 0.25

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[35].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(105071008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071008", "story_v_out_105071.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_out_105071", "105071008", "story_v_out_105071.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_out_105071", "105071008", "story_v_out_105071.awb")

						arg_31_1:RecordAudio("105071008", var_34_24)
						arg_31_1:RecordAudio("105071008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_105071", "105071008", "story_v_out_105071.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_105071", "105071008", "story_v_out_105071.awb")
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
	Play105071009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 105071009
		arg_35_1.duration_ = 1.999999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play105071010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10002_tpose"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect10002_tpose == nil then
				arg_35_1.var_.characterEffect10002_tpose = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect10002_tpose then
					arg_35_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect10002_tpose then
				arg_35_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1013ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1013ui_story == nil then
				arg_35_1.var_.characterEffect1013ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1013ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1013ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1013ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1013ui_story.fillRatio = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["1013ui_story"].transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.moveOldPos1013ui_story = var_38_10.localPosition
			end

			local var_38_12 = 0.001

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12
				local var_38_14 = Vector3.New(0, 100, 0)

				var_38_10.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1013ui_story, var_38_14, var_38_13)

				local var_38_15 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_15.x, var_38_15.y, var_38_15.z)

				local var_38_16 = var_38_10.localEulerAngles

				var_38_16.z = 0
				var_38_16.x = 0
				var_38_10.localEulerAngles = var_38_16
			end

			if arg_35_1.time_ >= var_38_11 + var_38_12 and arg_35_1.time_ < var_38_11 + var_38_12 + arg_38_0 then
				var_38_10.localPosition = Vector3.New(0, 100, 0)

				local var_38_17 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_17.x, var_38_17.y, var_38_17.z)

				local var_38_18 = var_38_10.localEulerAngles

				var_38_18.z = 0
				var_38_18.x = 0
				var_38_10.localEulerAngles = var_38_18
			end

			local var_38_19 = arg_35_1.actors_["10002_tpose"].transform
			local var_38_20 = 0

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.var_.moveOldPos10002_tpose = var_38_19.localPosition
			end

			local var_38_21 = 0.001

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_21 then
				local var_38_22 = (arg_35_1.time_ - var_38_20) / var_38_21
				local var_38_23 = Vector3.New(0, -1.2, -5.8)

				var_38_19.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10002_tpose, var_38_23, var_38_22)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_19.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_19.localEulerAngles = var_38_25
			end

			if arg_35_1.time_ >= var_38_20 + var_38_21 and arg_35_1.time_ < var_38_20 + var_38_21 + arg_38_0 then
				var_38_19.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_38_26 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_26.x, var_38_26.y, var_38_26.z)

				local var_38_27 = var_38_19.localEulerAngles

				var_38_27.z = 0
				var_38_27.x = 0
				var_38_19.localEulerAngles = var_38_27
			end

			local var_38_28 = 0

			if var_38_28 < arg_35_1.time_ and arg_35_1.time_ <= var_38_28 + arg_38_0 then
				arg_35_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 then
				arg_35_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_38_30 = 0
			local var_38_31 = 0.1

			if var_38_30 < arg_35_1.time_ and arg_35_1.time_ <= var_38_30 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_32 = arg_35_1:FormatText(StoryNameCfg[39].name)

				arg_35_1.leftNameTxt_.text = var_38_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_33 = arg_35_1:GetWordFromCfg(105071009)
				local var_38_34 = arg_35_1:FormatText(var_38_33.content)

				arg_35_1.text_.text = var_38_34

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_35 = 4
				local var_38_36 = utf8.len(var_38_34)
				local var_38_37 = var_38_35 <= 0 and var_38_31 or var_38_31 * (var_38_36 / var_38_35)

				if var_38_37 > 0 and var_38_31 < var_38_37 then
					arg_35_1.talkMaxDuration = var_38_37

					if var_38_37 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_37 + var_38_30
					end
				end

				arg_35_1.text_.text = var_38_34
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071009", "story_v_out_105071.awb") ~= 0 then
					local var_38_38 = manager.audio:GetVoiceLength("story_v_out_105071", "105071009", "story_v_out_105071.awb") / 1000

					if var_38_38 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_38 + var_38_30
					end

					if var_38_33.prefab_name ~= "" and arg_35_1.actors_[var_38_33.prefab_name] ~= nil then
						local var_38_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_33.prefab_name].transform, "story_v_out_105071", "105071009", "story_v_out_105071.awb")

						arg_35_1:RecordAudio("105071009", var_38_39)
						arg_35_1:RecordAudio("105071009", var_38_39)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_105071", "105071009", "story_v_out_105071.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_105071", "105071009", "story_v_out_105071.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_40 = math.max(var_38_31, arg_35_1.talkMaxDuration)

			if var_38_30 <= arg_35_1.time_ and arg_35_1.time_ < var_38_30 + var_38_40 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_30) / var_38_40

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_30 + var_38_40 and arg_35_1.time_ < var_38_30 + var_38_40 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play105071010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 105071010
		arg_39_1.duration_ = 4.366

		local var_39_0 = {
			ja = 3.5,
			ko = 2.566,
			zh = 4.366,
			en = 2.1
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
				arg_39_0:Play105071011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1013ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1013ui_story == nil then
				arg_39_1.var_.characterEffect1013ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1013ui_story then
					arg_39_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1013ui_story then
				arg_39_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["10002_tpose"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect10002_tpose == nil then
				arg_39_1.var_.characterEffect10002_tpose = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect10002_tpose then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_39_1.var_.characterEffect10002_tpose.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect10002_tpose then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_39_1.var_.characterEffect10002_tpose.fillRatio = var_42_9
			end

			local var_42_10 = arg_39_1.actors_["10002_tpose"].transform
			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.var_.moveOldPos10002_tpose = var_42_10.localPosition
			end

			local var_42_12 = 0.001

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_12 then
				local var_42_13 = (arg_39_1.time_ - var_42_11) / var_42_12
				local var_42_14 = Vector3.New(0, 100, 0)

				var_42_10.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10002_tpose, var_42_14, var_42_13)

				local var_42_15 = manager.ui.mainCamera.transform.position - var_42_10.position

				var_42_10.forward = Vector3.New(var_42_15.x, var_42_15.y, var_42_15.z)

				local var_42_16 = var_42_10.localEulerAngles

				var_42_16.z = 0
				var_42_16.x = 0
				var_42_10.localEulerAngles = var_42_16
			end

			if arg_39_1.time_ >= var_42_11 + var_42_12 and arg_39_1.time_ < var_42_11 + var_42_12 + arg_42_0 then
				var_42_10.localPosition = Vector3.New(0, 100, 0)

				local var_42_17 = manager.ui.mainCamera.transform.position - var_42_10.position

				var_42_10.forward = Vector3.New(var_42_17.x, var_42_17.y, var_42_17.z)

				local var_42_18 = var_42_10.localEulerAngles

				var_42_18.z = 0
				var_42_18.x = 0
				var_42_10.localEulerAngles = var_42_18
			end

			local var_42_19 = arg_39_1.actors_["1013ui_story"].transform
			local var_42_20 = 0

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1.var_.moveOldPos1013ui_story = var_42_19.localPosition
			end

			local var_42_21 = 0.001

			if var_42_20 <= arg_39_1.time_ and arg_39_1.time_ < var_42_20 + var_42_21 then
				local var_42_22 = (arg_39_1.time_ - var_42_20) / var_42_21
				local var_42_23 = Vector3.New(0, -0.66, -6.15)

				var_42_19.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1013ui_story, var_42_23, var_42_22)

				local var_42_24 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_24.x, var_42_24.y, var_42_24.z)

				local var_42_25 = var_42_19.localEulerAngles

				var_42_25.z = 0
				var_42_25.x = 0
				var_42_19.localEulerAngles = var_42_25
			end

			if arg_39_1.time_ >= var_42_20 + var_42_21 and arg_39_1.time_ < var_42_20 + var_42_21 + arg_42_0 then
				var_42_19.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_42_26 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_26.x, var_42_26.y, var_42_26.z)

				local var_42_27 = var_42_19.localEulerAngles

				var_42_27.z = 0
				var_42_27.x = 0
				var_42_19.localEulerAngles = var_42_27
			end

			local var_42_28 = 0

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action12_1")
			end

			local var_42_29 = 0

			if var_42_29 < arg_39_1.time_ and arg_39_1.time_ <= var_42_29 + arg_42_0 then
				arg_39_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_42_30 = 0
			local var_42_31 = 0.25

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[35].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(105071010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071010", "story_v_out_105071.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_105071", "105071010", "story_v_out_105071.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_105071", "105071010", "story_v_out_105071.awb")

						arg_39_1:RecordAudio("105071010", var_42_39)
						arg_39_1:RecordAudio("105071010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_105071", "105071010", "story_v_out_105071.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_105071", "105071010", "story_v_out_105071.awb")
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
	Play105071011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 105071011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play105071012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1013ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1013ui_story == nil then
				arg_43_1.var_.characterEffect1013ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1013ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1013ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1013ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1013ui_story.fillRatio = var_46_5
			end

			local var_46_6 = arg_43_1.actors_["1013ui_story"].transform
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 then
				arg_43_1.var_.moveOldPos1013ui_story = var_46_6.localPosition
			end

			local var_46_8 = 0.001

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8
				local var_46_10 = Vector3.New(0, 100, 0)

				var_46_6.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1013ui_story, var_46_10, var_46_9)

				local var_46_11 = manager.ui.mainCamera.transform.position - var_46_6.position

				var_46_6.forward = Vector3.New(var_46_11.x, var_46_11.y, var_46_11.z)

				local var_46_12 = var_46_6.localEulerAngles

				var_46_12.z = 0
				var_46_12.x = 0
				var_46_6.localEulerAngles = var_46_12
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 then
				var_46_6.localPosition = Vector3.New(0, 100, 0)

				local var_46_13 = manager.ui.mainCamera.transform.position - var_46_6.position

				var_46_6.forward = Vector3.New(var_46_13.x, var_46_13.y, var_46_13.z)

				local var_46_14 = var_46_6.localEulerAngles

				var_46_14.z = 0
				var_46_14.x = 0
				var_46_6.localEulerAngles = var_46_14
			end

			local var_46_15 = 0
			local var_46_16 = 1.05

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_17 = arg_43_1:GetWordFromCfg(105071011)
				local var_46_18 = arg_43_1:FormatText(var_46_17.content)

				arg_43_1.text_.text = var_46_18

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_19 = 42
				local var_46_20 = utf8.len(var_46_18)
				local var_46_21 = var_46_19 <= 0 and var_46_16 or var_46_16 * (var_46_20 / var_46_19)

				if var_46_21 > 0 and var_46_16 < var_46_21 then
					arg_43_1.talkMaxDuration = var_46_21

					if var_46_21 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_21 + var_46_15
					end
				end

				arg_43_1.text_.text = var_46_18
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_16, arg_43_1.talkMaxDuration)

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_15) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_15 + var_46_22 and arg_43_1.time_ < var_46_15 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play105071012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 105071012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play105071013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				local var_50_2 = "play"
				local var_50_3 = "effect"

				arg_47_1:AudioAction(var_50_2, var_50_3, "se_story_5", "se_story_5_wall", "")
			end

			local var_50_4 = 0
			local var_50_5 = 0.9

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_6 = arg_47_1:GetWordFromCfg(105071012)
				local var_50_7 = arg_47_1:FormatText(var_50_6.content)

				arg_47_1.text_.text = var_50_7

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_8 = 36
				local var_50_9 = utf8.len(var_50_7)
				local var_50_10 = var_50_8 <= 0 and var_50_5 or var_50_5 * (var_50_9 / var_50_8)

				if var_50_10 > 0 and var_50_5 < var_50_10 then
					arg_47_1.talkMaxDuration = var_50_10

					if var_50_10 + var_50_4 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_10 + var_50_4
					end
				end

				arg_47_1.text_.text = var_50_7
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_11 = math.max(var_50_5, arg_47_1.talkMaxDuration)

			if var_50_4 <= arg_47_1.time_ and arg_47_1.time_ < var_50_4 + var_50_11 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_4) / var_50_11

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_4 + var_50_11 and arg_47_1.time_ < var_50_4 + var_50_11 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play105071013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 105071013
		arg_51_1.duration_ = 3.7

		local var_51_0 = {
			ja = 3.7,
			ko = 2.2,
			zh = 2.666,
			en = 3.166
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
				arg_51_0:Play105071014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10002_tpose"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect10002_tpose == nil then
				arg_51_1.var_.characterEffect10002_tpose = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect10002_tpose then
					arg_51_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect10002_tpose then
				arg_51_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["10002_tpose"].transform
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1.var_.moveOldPos10002_tpose = var_54_4.localPosition
			end

			local var_54_6 = 0.001

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6
				local var_54_8 = Vector3.New(-0.7, -1.2, -5.8)

				var_54_4.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10002_tpose, var_54_8, var_54_7)

				local var_54_9 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_9.x, var_54_9.y, var_54_9.z)

				local var_54_10 = var_54_4.localEulerAngles

				var_54_10.z = 0
				var_54_10.x = 0
				var_54_4.localEulerAngles = var_54_10
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 then
				var_54_4.localPosition = Vector3.New(-0.7, -1.2, -5.8)

				local var_54_11 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_11.x, var_54_11.y, var_54_11.z)

				local var_54_12 = var_54_4.localEulerAngles

				var_54_12.z = 0
				var_54_12.x = 0
				var_54_4.localEulerAngles = var_54_12
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_54_15 = 0
			local var_54_16 = 0.225

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_17 = arg_51_1:FormatText(StoryNameCfg[39].name)

				arg_51_1.leftNameTxt_.text = var_54_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_18 = arg_51_1:GetWordFromCfg(105071013)
				local var_54_19 = arg_51_1:FormatText(var_54_18.content)

				arg_51_1.text_.text = var_54_19

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_20 = 9
				local var_54_21 = utf8.len(var_54_19)
				local var_54_22 = var_54_20 <= 0 and var_54_16 or var_54_16 * (var_54_21 / var_54_20)

				if var_54_22 > 0 and var_54_16 < var_54_22 then
					arg_51_1.talkMaxDuration = var_54_22

					if var_54_22 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_22 + var_54_15
					end
				end

				arg_51_1.text_.text = var_54_19
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071013", "story_v_out_105071.awb") ~= 0 then
					local var_54_23 = manager.audio:GetVoiceLength("story_v_out_105071", "105071013", "story_v_out_105071.awb") / 1000

					if var_54_23 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_15
					end

					if var_54_18.prefab_name ~= "" and arg_51_1.actors_[var_54_18.prefab_name] ~= nil then
						local var_54_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_18.prefab_name].transform, "story_v_out_105071", "105071013", "story_v_out_105071.awb")

						arg_51_1:RecordAudio("105071013", var_54_24)
						arg_51_1:RecordAudio("105071013", var_54_24)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_105071", "105071013", "story_v_out_105071.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_105071", "105071013", "story_v_out_105071.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_25 = math.max(var_54_16, arg_51_1.talkMaxDuration)

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_25 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_15) / var_54_25

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_15 + var_54_25 and arg_51_1.time_ < var_54_15 + var_54_25 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play105071014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 105071014
		arg_55_1.duration_ = 8.7

		local var_55_0 = {
			ja = 8,
			ko = 7.866,
			zh = 8.7,
			en = 8.166
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
				arg_55_0:Play105071015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1013ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1013ui_story == nil then
				arg_55_1.var_.characterEffect1013ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1013ui_story then
					arg_55_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1013ui_story then
				arg_55_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["10002_tpose"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect10002_tpose == nil then
				arg_55_1.var_.characterEffect10002_tpose = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect10002_tpose then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_55_1.var_.characterEffect10002_tpose.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect10002_tpose then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_55_1.var_.characterEffect10002_tpose.fillRatio = var_58_9
			end

			local var_58_10 = arg_55_1.actors_["1013ui_story"].transform
			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1.var_.moveOldPos1013ui_story = var_58_10.localPosition
			end

			local var_58_12 = 0.001

			if var_58_11 <= arg_55_1.time_ and arg_55_1.time_ < var_58_11 + var_58_12 then
				local var_58_13 = (arg_55_1.time_ - var_58_11) / var_58_12
				local var_58_14 = Vector3.New(0.7, -0.66, -6.15)

				var_58_10.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1013ui_story, var_58_14, var_58_13)

				local var_58_15 = manager.ui.mainCamera.transform.position - var_58_10.position

				var_58_10.forward = Vector3.New(var_58_15.x, var_58_15.y, var_58_15.z)

				local var_58_16 = var_58_10.localEulerAngles

				var_58_16.z = 0
				var_58_16.x = 0
				var_58_10.localEulerAngles = var_58_16
			end

			if arg_55_1.time_ >= var_58_11 + var_58_12 and arg_55_1.time_ < var_58_11 + var_58_12 + arg_58_0 then
				var_58_10.localPosition = Vector3.New(0.7, -0.66, -6.15)

				local var_58_17 = manager.ui.mainCamera.transform.position - var_58_10.position

				var_58_10.forward = Vector3.New(var_58_17.x, var_58_17.y, var_58_17.z)

				local var_58_18 = var_58_10.localEulerAngles

				var_58_18.z = 0
				var_58_18.x = 0
				var_58_10.localEulerAngles = var_58_18
			end

			local var_58_19 = 0

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action7_1")
			end

			local var_58_20 = 0

			if var_58_20 < arg_55_1.time_ and arg_55_1.time_ <= var_58_20 + arg_58_0 then
				arg_55_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_58_21 = 0
			local var_58_22 = 0.7

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_23 = arg_55_1:FormatText(StoryNameCfg[35].name)

				arg_55_1.leftNameTxt_.text = var_58_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_24 = arg_55_1:GetWordFromCfg(105071014)
				local var_58_25 = arg_55_1:FormatText(var_58_24.content)

				arg_55_1.text_.text = var_58_25

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_26 = 28
				local var_58_27 = utf8.len(var_58_25)
				local var_58_28 = var_58_26 <= 0 and var_58_22 or var_58_22 * (var_58_27 / var_58_26)

				if var_58_28 > 0 and var_58_22 < var_58_28 then
					arg_55_1.talkMaxDuration = var_58_28

					if var_58_28 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_28 + var_58_21
					end
				end

				arg_55_1.text_.text = var_58_25
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071014", "story_v_out_105071.awb") ~= 0 then
					local var_58_29 = manager.audio:GetVoiceLength("story_v_out_105071", "105071014", "story_v_out_105071.awb") / 1000

					if var_58_29 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_29 + var_58_21
					end

					if var_58_24.prefab_name ~= "" and arg_55_1.actors_[var_58_24.prefab_name] ~= nil then
						local var_58_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_24.prefab_name].transform, "story_v_out_105071", "105071014", "story_v_out_105071.awb")

						arg_55_1:RecordAudio("105071014", var_58_30)
						arg_55_1:RecordAudio("105071014", var_58_30)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_105071", "105071014", "story_v_out_105071.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_105071", "105071014", "story_v_out_105071.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_31 = math.max(var_58_22, arg_55_1.talkMaxDuration)

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_31 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_21) / var_58_31

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_21 + var_58_31 and arg_55_1.time_ < var_58_21 + var_58_31 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play105071015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 105071015
		arg_59_1.duration_ = 7

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play105071016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1013ui_story"]
			local var_62_1 = 2

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1013ui_story == nil then
				arg_59_1.var_.characterEffect1013ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1013ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1013ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1013ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1013ui_story.fillRatio = var_62_5
			end

			local var_62_6 = arg_59_1.bgs_.B01c
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 then
				local var_62_8 = var_62_6:GetComponent("SpriteRenderer")

				if var_62_8 then
					var_62_8.material = arg_59_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_62_9 = var_62_8.material
					local var_62_10 = var_62_9:GetColor("_Color")

					arg_59_1.var_.alphaOldValueB01c = var_62_10.a
					arg_59_1.var_.alphaMatValueB01c = var_62_9
				end

				arg_59_1.var_.alphaOldValueB01c = 1
			end

			local var_62_11 = 1.5

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_7) / var_62_11
				local var_62_13 = Mathf.Lerp(arg_59_1.var_.alphaOldValueB01c, 0, var_62_12)

				if arg_59_1.var_.alphaMatValueB01c then
					local var_62_14 = arg_59_1.var_.alphaMatValueB01c
					local var_62_15 = var_62_14:GetColor("_Color")

					var_62_15.a = var_62_13

					var_62_14:SetColor("_Color", var_62_15)
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_11 and arg_59_1.time_ < var_62_7 + var_62_11 + arg_62_0 and arg_59_1.var_.alphaMatValueB01c then
				local var_62_16 = arg_59_1.var_.alphaMatValueB01c
				local var_62_17 = var_62_16:GetColor("_Color")

				var_62_17.a = 0

				var_62_16:SetColor("_Color", var_62_17)
			end

			local var_62_18 = arg_59_1.bgs_.B01c.transform
			local var_62_19 = 1.5

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.var_.moveOldPosB01c = var_62_18.localPosition
			end

			local var_62_20 = 0.001

			if var_62_19 <= arg_59_1.time_ and arg_59_1.time_ < var_62_19 + var_62_20 then
				local var_62_21 = (arg_59_1.time_ - var_62_19) / var_62_20
				local var_62_22 = Vector3.New(0, -100, 10)

				var_62_18.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPosB01c, var_62_22, var_62_21)
			end

			if arg_59_1.time_ >= var_62_19 + var_62_20 and arg_59_1.time_ < var_62_19 + var_62_20 + arg_62_0 then
				var_62_18.localPosition = Vector3.New(0, -100, 10)
			end

			local var_62_23 = "B03f"

			if arg_59_1.bgs_[var_62_23] == nil then
				local var_62_24 = Object.Instantiate(arg_59_1.paintGo_)

				var_62_24:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_62_23)
				var_62_24.name = var_62_23
				var_62_24.transform.parent = arg_59_1.stage_.transform
				var_62_24.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.bgs_[var_62_23] = var_62_24
			end

			local var_62_25 = arg_59_1.bgs_.B03f
			local var_62_26 = 1.5

			if var_62_26 < arg_59_1.time_ and arg_59_1.time_ <= var_62_26 + arg_62_0 then
				local var_62_27 = var_62_25:GetComponent("SpriteRenderer")

				if var_62_27 then
					var_62_27.material = arg_59_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_62_28 = var_62_27.material
					local var_62_29 = var_62_28:GetColor("_Color")

					arg_59_1.var_.alphaOldValueB03f = var_62_29.a
					arg_59_1.var_.alphaMatValueB03f = var_62_28
				end

				arg_59_1.var_.alphaOldValueB03f = 0
			end

			local var_62_30 = 1.5

			if var_62_26 <= arg_59_1.time_ and arg_59_1.time_ < var_62_26 + var_62_30 then
				local var_62_31 = (arg_59_1.time_ - var_62_26) / var_62_30
				local var_62_32 = Mathf.Lerp(arg_59_1.var_.alphaOldValueB03f, 1, var_62_31)

				if arg_59_1.var_.alphaMatValueB03f then
					local var_62_33 = arg_59_1.var_.alphaMatValueB03f
					local var_62_34 = var_62_33:GetColor("_Color")

					var_62_34.a = var_62_32

					var_62_33:SetColor("_Color", var_62_34)
				end
			end

			if arg_59_1.time_ >= var_62_26 + var_62_30 and arg_59_1.time_ < var_62_26 + var_62_30 + arg_62_0 and arg_59_1.var_.alphaMatValueB03f then
				local var_62_35 = arg_59_1.var_.alphaMatValueB03f
				local var_62_36 = var_62_35:GetColor("_Color")

				var_62_36.a = 1

				var_62_35:SetColor("_Color", var_62_36)
			end

			local var_62_37 = 1.5

			if var_62_37 < arg_59_1.time_ and arg_59_1.time_ <= var_62_37 + arg_62_0 then
				local var_62_38 = manager.ui.mainCamera.transform.localPosition
				local var_62_39 = Vector3.New(0, 0, 10) + Vector3.New(var_62_38.x, var_62_38.y, 0)
				local var_62_40 = arg_59_1.bgs_.B03f

				var_62_40.transform.localPosition = var_62_39
				var_62_40.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_62_41 = var_62_40:GetComponent("SpriteRenderer")

				if var_62_41 and var_62_41.sprite then
					local var_62_42 = (var_62_40.transform.localPosition - var_62_38).z
					local var_62_43 = manager.ui.mainCameraCom_
					local var_62_44 = 2 * var_62_42 * Mathf.Tan(var_62_43.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_62_45 = var_62_44 * var_62_43.aspect
					local var_62_46 = var_62_41.sprite.bounds.size.x
					local var_62_47 = var_62_41.sprite.bounds.size.y
					local var_62_48 = var_62_45 / var_62_46
					local var_62_49 = var_62_44 / var_62_47
					local var_62_50 = var_62_49 < var_62_48 and var_62_48 or var_62_49

					var_62_40.transform.localScale = Vector3.New(var_62_50, var_62_50, 0)
				end

				for iter_62_0, iter_62_1 in pairs(arg_59_1.bgs_) do
					if iter_62_0 ~= "B03f" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_51 = arg_59_1.actors_["10002_tpose"].transform
			local var_62_52 = 0

			if var_62_52 < arg_59_1.time_ and arg_59_1.time_ <= var_62_52 + arg_62_0 then
				arg_59_1.var_.moveOldPos10002_tpose = var_62_51.localPosition
			end

			local var_62_53 = 0.001

			if var_62_52 <= arg_59_1.time_ and arg_59_1.time_ < var_62_52 + var_62_53 then
				local var_62_54 = (arg_59_1.time_ - var_62_52) / var_62_53
				local var_62_55 = Vector3.New(0, 100, 0)

				var_62_51.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10002_tpose, var_62_55, var_62_54)

				local var_62_56 = manager.ui.mainCamera.transform.position - var_62_51.position

				var_62_51.forward = Vector3.New(var_62_56.x, var_62_56.y, var_62_56.z)

				local var_62_57 = var_62_51.localEulerAngles

				var_62_57.z = 0
				var_62_57.x = 0
				var_62_51.localEulerAngles = var_62_57
			end

			if arg_59_1.time_ >= var_62_52 + var_62_53 and arg_59_1.time_ < var_62_52 + var_62_53 + arg_62_0 then
				var_62_51.localPosition = Vector3.New(0, 100, 0)

				local var_62_58 = manager.ui.mainCamera.transform.position - var_62_51.position

				var_62_51.forward = Vector3.New(var_62_58.x, var_62_58.y, var_62_58.z)

				local var_62_59 = var_62_51.localEulerAngles

				var_62_59.z = 0
				var_62_59.x = 0
				var_62_51.localEulerAngles = var_62_59
			end

			local var_62_60 = arg_59_1.actors_["1013ui_story"].transform
			local var_62_61 = 0

			if var_62_61 < arg_59_1.time_ and arg_59_1.time_ <= var_62_61 + arg_62_0 then
				arg_59_1.var_.moveOldPos1013ui_story = var_62_60.localPosition
			end

			local var_62_62 = 0.001

			if var_62_61 <= arg_59_1.time_ and arg_59_1.time_ < var_62_61 + var_62_62 then
				local var_62_63 = (arg_59_1.time_ - var_62_61) / var_62_62
				local var_62_64 = Vector3.New(0, 100, 0)

				var_62_60.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1013ui_story, var_62_64, var_62_63)

				local var_62_65 = manager.ui.mainCamera.transform.position - var_62_60.position

				var_62_60.forward = Vector3.New(var_62_65.x, var_62_65.y, var_62_65.z)

				local var_62_66 = var_62_60.localEulerAngles

				var_62_66.z = 0
				var_62_66.x = 0
				var_62_60.localEulerAngles = var_62_66
			end

			if arg_59_1.time_ >= var_62_61 + var_62_62 and arg_59_1.time_ < var_62_61 + var_62_62 + arg_62_0 then
				var_62_60.localPosition = Vector3.New(0, 100, 0)

				local var_62_67 = manager.ui.mainCamera.transform.position - var_62_60.position

				var_62_60.forward = Vector3.New(var_62_67.x, var_62_67.y, var_62_67.z)

				local var_62_68 = var_62_60.localEulerAngles

				var_62_68.z = 0
				var_62_68.x = 0
				var_62_60.localEulerAngles = var_62_68
			end

			local var_62_69 = 0

			if var_62_69 < arg_59_1.time_ and arg_59_1.time_ <= var_62_69 + arg_62_0 then
				arg_59_1.allBtn_.enabled = false
			end

			local var_62_70 = 2

			if arg_59_1.time_ >= var_62_69 + var_62_70 and arg_59_1.time_ < var_62_69 + var_62_70 + arg_62_0 then
				arg_59_1.allBtn_.enabled = true
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_71 = 2
			local var_62_72 = 1.4

			if var_62_71 < arg_59_1.time_ and arg_59_1.time_ <= var_62_71 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_73 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_73:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_73:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_73:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_74 = arg_59_1:GetWordFromCfg(105071015)
				local var_62_75 = arg_59_1:FormatText(var_62_74.content)

				arg_59_1.text_.text = var_62_75

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_76 = 55
				local var_62_77 = utf8.len(var_62_75)
				local var_62_78 = var_62_76 <= 0 and var_62_72 or var_62_72 * (var_62_77 / var_62_76)

				if var_62_78 > 0 and var_62_72 < var_62_78 then
					arg_59_1.talkMaxDuration = var_62_78
					var_62_71 = var_62_71 + 0.3

					if var_62_78 + var_62_71 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_78 + var_62_71
					end
				end

				arg_59_1.text_.text = var_62_75
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_79 = var_62_71 + 0.3
			local var_62_80 = math.max(var_62_72, arg_59_1.talkMaxDuration)

			if var_62_79 <= arg_59_1.time_ and arg_59_1.time_ < var_62_79 + var_62_80 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_79) / var_62_80

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_79 + var_62_80 and arg_59_1.time_ < var_62_79 + var_62_80 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play105071016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 105071016
		arg_65_1.duration_ = 5.2

		local var_65_0 = {
			ja = 5.2,
			ko = 4.4,
			zh = 4.566,
			en = 4.833
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
				arg_65_0:Play105071017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10002_tpose"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect10002_tpose == nil then
				arg_65_1.var_.characterEffect10002_tpose = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.1

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect10002_tpose then
					arg_65_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect10002_tpose then
				arg_65_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_68_4 = arg_65_1.actors_["10002_tpose"].transform
			local var_68_5 = 0

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 then
				arg_65_1.var_.moveOldPos10002_tpose = var_68_4.localPosition
			end

			local var_68_6 = 0.001

			if var_68_5 <= arg_65_1.time_ and arg_65_1.time_ < var_68_5 + var_68_6 then
				local var_68_7 = (arg_65_1.time_ - var_68_5) / var_68_6
				local var_68_8 = Vector3.New(-0.7, -1.2, -5.8)

				var_68_4.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos10002_tpose, var_68_8, var_68_7)

				local var_68_9 = manager.ui.mainCamera.transform.position - var_68_4.position

				var_68_4.forward = Vector3.New(var_68_9.x, var_68_9.y, var_68_9.z)

				local var_68_10 = var_68_4.localEulerAngles

				var_68_10.z = 0
				var_68_10.x = 0
				var_68_4.localEulerAngles = var_68_10
			end

			if arg_65_1.time_ >= var_68_5 + var_68_6 and arg_65_1.time_ < var_68_5 + var_68_6 + arg_68_0 then
				var_68_4.localPosition = Vector3.New(-0.7, -1.2, -5.8)

				local var_68_11 = manager.ui.mainCamera.transform.position - var_68_4.position

				var_68_4.forward = Vector3.New(var_68_11.x, var_68_11.y, var_68_11.z)

				local var_68_12 = var_68_4.localEulerAngles

				var_68_12.z = 0
				var_68_12.x = 0
				var_68_4.localEulerAngles = var_68_12
			end

			local var_68_13 = 0

			if var_68_13 < arg_65_1.time_ and arg_65_1.time_ <= var_68_13 + arg_68_0 then
				arg_65_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action2_1")
			end

			local var_68_14 = 0

			if var_68_14 < arg_65_1.time_ and arg_65_1.time_ <= var_68_14 + arg_68_0 then
				arg_65_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_68_15 = 0
			local var_68_16 = 0.5

			if var_68_15 < arg_65_1.time_ and arg_65_1.time_ <= var_68_15 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_17 = arg_65_1:FormatText(StoryNameCfg[39].name)

				arg_65_1.leftNameTxt_.text = var_68_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_18 = arg_65_1:GetWordFromCfg(105071016)
				local var_68_19 = arg_65_1:FormatText(var_68_18.content)

				arg_65_1.text_.text = var_68_19

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_20 = 20
				local var_68_21 = utf8.len(var_68_19)
				local var_68_22 = var_68_20 <= 0 and var_68_16 or var_68_16 * (var_68_21 / var_68_20)

				if var_68_22 > 0 and var_68_16 < var_68_22 then
					arg_65_1.talkMaxDuration = var_68_22

					if var_68_22 + var_68_15 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_22 + var_68_15
					end
				end

				arg_65_1.text_.text = var_68_19
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071016", "story_v_out_105071.awb") ~= 0 then
					local var_68_23 = manager.audio:GetVoiceLength("story_v_out_105071", "105071016", "story_v_out_105071.awb") / 1000

					if var_68_23 + var_68_15 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_23 + var_68_15
					end

					if var_68_18.prefab_name ~= "" and arg_65_1.actors_[var_68_18.prefab_name] ~= nil then
						local var_68_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_18.prefab_name].transform, "story_v_out_105071", "105071016", "story_v_out_105071.awb")

						arg_65_1:RecordAudio("105071016", var_68_24)
						arg_65_1:RecordAudio("105071016", var_68_24)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_105071", "105071016", "story_v_out_105071.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_105071", "105071016", "story_v_out_105071.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_25 = math.max(var_68_16, arg_65_1.talkMaxDuration)

			if var_68_15 <= arg_65_1.time_ and arg_65_1.time_ < var_68_15 + var_68_25 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_15) / var_68_25

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_15 + var_68_25 and arg_65_1.time_ < var_68_15 + var_68_25 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play105071017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 105071017
		arg_69_1.duration_ = 1.999999999999

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play105071018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1013ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1013ui_story == nil then
				arg_69_1.var_.characterEffect1013ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.1

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1013ui_story then
					arg_69_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1013ui_story then
				arg_69_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_72_4 = arg_69_1.actors_["1013ui_story"].transform
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1.var_.moveOldPos1013ui_story = var_72_4.localPosition
			end

			local var_72_6 = 0.001

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6
				local var_72_8 = Vector3.New(0.7, -0.66, -6.15)

				var_72_4.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1013ui_story, var_72_8, var_72_7)

				local var_72_9 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_9.x, var_72_9.y, var_72_9.z)

				local var_72_10 = var_72_4.localEulerAngles

				var_72_10.z = 0
				var_72_10.x = 0
				var_72_4.localEulerAngles = var_72_10
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 then
				var_72_4.localPosition = Vector3.New(0.7, -0.66, -6.15)

				local var_72_11 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_11.x, var_72_11.y, var_72_11.z)

				local var_72_12 = var_72_4.localEulerAngles

				var_72_12.z = 0
				var_72_12.x = 0
				var_72_4.localEulerAngles = var_72_12
			end

			local var_72_13 = 0

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action3_1")
			end

			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_72_15 = 0
			local var_72_16 = 0.075

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_17 = arg_69_1:FormatText(StoryNameCfg[35].name)

				arg_69_1.leftNameTxt_.text = var_72_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_18 = arg_69_1:GetWordFromCfg(105071017)
				local var_72_19 = arg_69_1:FormatText(var_72_18.content)

				arg_69_1.text_.text = var_72_19

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_20 = 3
				local var_72_21 = utf8.len(var_72_19)
				local var_72_22 = var_72_20 <= 0 and var_72_16 or var_72_16 * (var_72_21 / var_72_20)

				if var_72_22 > 0 and var_72_16 < var_72_22 then
					arg_69_1.talkMaxDuration = var_72_22

					if var_72_22 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_22 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_19
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071017", "story_v_out_105071.awb") ~= 0 then
					local var_72_23 = manager.audio:GetVoiceLength("story_v_out_105071", "105071017", "story_v_out_105071.awb") / 1000

					if var_72_23 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_23 + var_72_15
					end

					if var_72_18.prefab_name ~= "" and arg_69_1.actors_[var_72_18.prefab_name] ~= nil then
						local var_72_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_18.prefab_name].transform, "story_v_out_105071", "105071017", "story_v_out_105071.awb")

						arg_69_1:RecordAudio("105071017", var_72_24)
						arg_69_1:RecordAudio("105071017", var_72_24)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_105071", "105071017", "story_v_out_105071.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_105071", "105071017", "story_v_out_105071.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_25 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_25 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_25

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_25 and arg_69_1.time_ < var_72_15 + var_72_25 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play105071018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 105071018
		arg_73_1.duration_ = 1.999999999999

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play105071019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10002_tpose"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect10002_tpose == nil then
				arg_73_1.var_.characterEffect10002_tpose = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect10002_tpose then
					arg_73_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect10002_tpose then
				arg_73_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1013ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and arg_73_1.var_.characterEffect1013ui_story == nil then
				arg_73_1.var_.characterEffect1013ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.1

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect1013ui_story then
					local var_76_8 = Mathf.Lerp(0, 0.5, var_76_7)

					arg_73_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1013ui_story.fillRatio = var_76_8
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and arg_73_1.var_.characterEffect1013ui_story then
				local var_76_9 = 0.5

				arg_73_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1013ui_story.fillRatio = var_76_9
			end

			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action2_2")
			end

			local var_76_11 = 0

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				arg_73_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_76_12 = 0
			local var_76_13 = 0.1

			if var_76_12 < arg_73_1.time_ and arg_73_1.time_ <= var_76_12 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_14 = arg_73_1:FormatText(StoryNameCfg[39].name)

				arg_73_1.leftNameTxt_.text = var_76_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_15 = arg_73_1:GetWordFromCfg(105071018)
				local var_76_16 = arg_73_1:FormatText(var_76_15.content)

				arg_73_1.text_.text = var_76_16

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_17 = 4
				local var_76_18 = utf8.len(var_76_16)
				local var_76_19 = var_76_17 <= 0 and var_76_13 or var_76_13 * (var_76_18 / var_76_17)

				if var_76_19 > 0 and var_76_13 < var_76_19 then
					arg_73_1.talkMaxDuration = var_76_19

					if var_76_19 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_12
					end
				end

				arg_73_1.text_.text = var_76_16
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071018", "story_v_out_105071.awb") ~= 0 then
					local var_76_20 = manager.audio:GetVoiceLength("story_v_out_105071", "105071018", "story_v_out_105071.awb") / 1000

					if var_76_20 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_12
					end

					if var_76_15.prefab_name ~= "" and arg_73_1.actors_[var_76_15.prefab_name] ~= nil then
						local var_76_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_15.prefab_name].transform, "story_v_out_105071", "105071018", "story_v_out_105071.awb")

						arg_73_1:RecordAudio("105071018", var_76_21)
						arg_73_1:RecordAudio("105071018", var_76_21)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_105071", "105071018", "story_v_out_105071.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_105071", "105071018", "story_v_out_105071.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_22 = math.max(var_76_13, arg_73_1.talkMaxDuration)

			if var_76_12 <= arg_73_1.time_ and arg_73_1.time_ < var_76_12 + var_76_22 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_12) / var_76_22

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_12 + var_76_22 and arg_73_1.time_ < var_76_12 + var_76_22 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play105071019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 105071019
		arg_77_1.duration_ = 7.8

		local var_77_0 = {
			ja = 6,
			ko = 5.2,
			zh = 7.8,
			en = 4.933
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
				arg_77_0:Play105071020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1013ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1013ui_story == nil then
				arg_77_1.var_.characterEffect1013ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.1

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1013ui_story then
					arg_77_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1013ui_story then
				arg_77_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_80_4 = arg_77_1.actors_["10002_tpose"]
			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 and arg_77_1.var_.characterEffect10002_tpose == nil then
				arg_77_1.var_.characterEffect10002_tpose = var_80_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_6 = 0.1

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_6 then
				local var_80_7 = (arg_77_1.time_ - var_80_5) / var_80_6

				if arg_77_1.var_.characterEffect10002_tpose then
					local var_80_8 = Mathf.Lerp(0, 0.5, var_80_7)

					arg_77_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_77_1.var_.characterEffect10002_tpose.fillRatio = var_80_8
				end
			end

			if arg_77_1.time_ >= var_80_5 + var_80_6 and arg_77_1.time_ < var_80_5 + var_80_6 + arg_80_0 and arg_77_1.var_.characterEffect10002_tpose then
				local var_80_9 = 0.5

				arg_77_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_77_1.var_.characterEffect10002_tpose.fillRatio = var_80_9
			end

			local var_80_10 = arg_77_1.actors_["1013ui_story"].transform
			local var_80_11 = 0

			if var_80_11 < arg_77_1.time_ and arg_77_1.time_ <= var_80_11 + arg_80_0 then
				arg_77_1.var_.moveOldPos1013ui_story = var_80_10.localPosition
			end

			local var_80_12 = 0.001

			if var_80_11 <= arg_77_1.time_ and arg_77_1.time_ < var_80_11 + var_80_12 then
				local var_80_13 = (arg_77_1.time_ - var_80_11) / var_80_12
				local var_80_14 = Vector3.New(0.7, -0.66, -6.15)

				var_80_10.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1013ui_story, var_80_14, var_80_13)

				local var_80_15 = manager.ui.mainCamera.transform.position - var_80_10.position

				var_80_10.forward = Vector3.New(var_80_15.x, var_80_15.y, var_80_15.z)

				local var_80_16 = var_80_10.localEulerAngles

				var_80_16.z = 0
				var_80_16.x = 0
				var_80_10.localEulerAngles = var_80_16
			end

			if arg_77_1.time_ >= var_80_11 + var_80_12 and arg_77_1.time_ < var_80_11 + var_80_12 + arg_80_0 then
				var_80_10.localPosition = Vector3.New(0.7, -0.66, -6.15)

				local var_80_17 = manager.ui.mainCamera.transform.position - var_80_10.position

				var_80_10.forward = Vector3.New(var_80_17.x, var_80_17.y, var_80_17.z)

				local var_80_18 = var_80_10.localEulerAngles

				var_80_18.z = 0
				var_80_18.x = 0
				var_80_10.localEulerAngles = var_80_18
			end

			local var_80_19 = 0

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action4311")
			end

			local var_80_20 = 0

			if var_80_20 < arg_77_1.time_ and arg_77_1.time_ <= var_80_20 + arg_80_0 then
				arg_77_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_80_21 = 0
			local var_80_22 = 0.6

			if var_80_21 < arg_77_1.time_ and arg_77_1.time_ <= var_80_21 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_23 = arg_77_1:FormatText(StoryNameCfg[35].name)

				arg_77_1.leftNameTxt_.text = var_80_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_24 = arg_77_1:GetWordFromCfg(105071019)
				local var_80_25 = arg_77_1:FormatText(var_80_24.content)

				arg_77_1.text_.text = var_80_25

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_26 = 23
				local var_80_27 = utf8.len(var_80_25)
				local var_80_28 = var_80_26 <= 0 and var_80_22 or var_80_22 * (var_80_27 / var_80_26)

				if var_80_28 > 0 and var_80_22 < var_80_28 then
					arg_77_1.talkMaxDuration = var_80_28

					if var_80_28 + var_80_21 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_28 + var_80_21
					end
				end

				arg_77_1.text_.text = var_80_25
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071019", "story_v_out_105071.awb") ~= 0 then
					local var_80_29 = manager.audio:GetVoiceLength("story_v_out_105071", "105071019", "story_v_out_105071.awb") / 1000

					if var_80_29 + var_80_21 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_29 + var_80_21
					end

					if var_80_24.prefab_name ~= "" and arg_77_1.actors_[var_80_24.prefab_name] ~= nil then
						local var_80_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_24.prefab_name].transform, "story_v_out_105071", "105071019", "story_v_out_105071.awb")

						arg_77_1:RecordAudio("105071019", var_80_30)
						arg_77_1:RecordAudio("105071019", var_80_30)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_105071", "105071019", "story_v_out_105071.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_105071", "105071019", "story_v_out_105071.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_31 = math.max(var_80_22, arg_77_1.talkMaxDuration)

			if var_80_21 <= arg_77_1.time_ and arg_77_1.time_ < var_80_21 + var_80_31 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_21) / var_80_31

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_21 + var_80_31 and arg_77_1.time_ < var_80_21 + var_80_31 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play105071020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 105071020
		arg_81_1.duration_ = 2.2

		local var_81_0 = {
			ja = 1.433,
			ko = 1.6,
			zh = 1.866,
			en = 2.2
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
				arg_81_0:Play105071021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10002_tpose"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect10002_tpose == nil then
				arg_81_1.var_.characterEffect10002_tpose = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.1

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect10002_tpose then
					arg_81_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect10002_tpose then
				arg_81_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1013ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1013ui_story == nil then
				arg_81_1.var_.characterEffect1013ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.1

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1013ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1013ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1013ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1013ui_story.fillRatio = var_84_9
			end

			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_84_11 = 0
			local var_84_12 = 0.075

			if var_84_11 < arg_81_1.time_ and arg_81_1.time_ <= var_84_11 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_13 = arg_81_1:FormatText(StoryNameCfg[39].name)

				arg_81_1.leftNameTxt_.text = var_84_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_14 = arg_81_1:GetWordFromCfg(105071020)
				local var_84_15 = arg_81_1:FormatText(var_84_14.content)

				arg_81_1.text_.text = var_84_15

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_16 = 3
				local var_84_17 = utf8.len(var_84_15)
				local var_84_18 = var_84_16 <= 0 and var_84_12 or var_84_12 * (var_84_17 / var_84_16)

				if var_84_18 > 0 and var_84_12 < var_84_18 then
					arg_81_1.talkMaxDuration = var_84_18

					if var_84_18 + var_84_11 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_11
					end
				end

				arg_81_1.text_.text = var_84_15
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071020", "story_v_out_105071.awb") ~= 0 then
					local var_84_19 = manager.audio:GetVoiceLength("story_v_out_105071", "105071020", "story_v_out_105071.awb") / 1000

					if var_84_19 + var_84_11 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_19 + var_84_11
					end

					if var_84_14.prefab_name ~= "" and arg_81_1.actors_[var_84_14.prefab_name] ~= nil then
						local var_84_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_14.prefab_name].transform, "story_v_out_105071", "105071020", "story_v_out_105071.awb")

						arg_81_1:RecordAudio("105071020", var_84_20)
						arg_81_1:RecordAudio("105071020", var_84_20)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_105071", "105071020", "story_v_out_105071.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_105071", "105071020", "story_v_out_105071.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_21 = math.max(var_84_12, arg_81_1.talkMaxDuration)

			if var_84_11 <= arg_81_1.time_ and arg_81_1.time_ < var_84_11 + var_84_21 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_11) / var_84_21

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_11 + var_84_21 and arg_81_1.time_ < var_84_11 + var_84_21 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play105071021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 105071021
		arg_85_1.duration_ = 5.833

		local var_85_0 = {
			ja = 5.366,
			ko = 4.2,
			zh = 5.833,
			en = 3.6
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
				arg_85_0:Play105071022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1013ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1013ui_story == nil then
				arg_85_1.var_.characterEffect1013ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.1

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1013ui_story then
					arg_85_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1013ui_story then
				arg_85_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_88_4 = arg_85_1.actors_["10002_tpose"]
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 and arg_85_1.var_.characterEffect10002_tpose == nil then
				arg_85_1.var_.characterEffect10002_tpose = var_88_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_6 = 0.1

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6

				if arg_85_1.var_.characterEffect10002_tpose then
					local var_88_8 = Mathf.Lerp(0, 0.5, var_88_7)

					arg_85_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_85_1.var_.characterEffect10002_tpose.fillRatio = var_88_8
				end
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 and arg_85_1.var_.characterEffect10002_tpose then
				local var_88_9 = 0.5

				arg_85_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_85_1.var_.characterEffect10002_tpose.fillRatio = var_88_9
			end

			local var_88_10 = arg_85_1.actors_["1013ui_story"].transform
			local var_88_11 = 0.033

			if var_88_11 < arg_85_1.time_ and arg_85_1.time_ <= var_88_11 + arg_88_0 then
				arg_85_1.var_.moveOldPos1013ui_story = var_88_10.localPosition
			end

			local var_88_12 = 0.5

			if var_88_11 <= arg_85_1.time_ and arg_85_1.time_ < var_88_11 + var_88_12 then
				local var_88_13 = (arg_85_1.time_ - var_88_11) / var_88_12
				local var_88_14 = Vector3.New(0, -0.66, -6.15)

				var_88_10.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1013ui_story, var_88_14, var_88_13)

				local var_88_15 = manager.ui.mainCamera.transform.position - var_88_10.position

				var_88_10.forward = Vector3.New(var_88_15.x, var_88_15.y, var_88_15.z)

				local var_88_16 = var_88_10.localEulerAngles

				var_88_16.z = 0
				var_88_16.x = 0
				var_88_10.localEulerAngles = var_88_16
			end

			if arg_85_1.time_ >= var_88_11 + var_88_12 and arg_85_1.time_ < var_88_11 + var_88_12 + arg_88_0 then
				var_88_10.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_88_17 = manager.ui.mainCamera.transform.position - var_88_10.position

				var_88_10.forward = Vector3.New(var_88_17.x, var_88_17.y, var_88_17.z)

				local var_88_18 = var_88_10.localEulerAngles

				var_88_18.z = 0
				var_88_18.x = 0
				var_88_10.localEulerAngles = var_88_18
			end

			local var_88_19 = arg_85_1.actors_["1013ui_story"].transform
			local var_88_20 = 0

			if var_88_20 < arg_85_1.time_ and arg_85_1.time_ <= var_88_20 + arg_88_0 then
				arg_85_1.var_.moveOldPos1013ui_story = var_88_19.localPosition
			end

			local var_88_21 = 0.001

			if var_88_20 <= arg_85_1.time_ and arg_85_1.time_ < var_88_20 + var_88_21 then
				local var_88_22 = (arg_85_1.time_ - var_88_20) / var_88_21
				local var_88_23 = Vector3.New(0.7, -0.66, -6.15)

				var_88_19.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1013ui_story, var_88_23, var_88_22)

				local var_88_24 = manager.ui.mainCamera.transform.position - var_88_19.position

				var_88_19.forward = Vector3.New(var_88_24.x, var_88_24.y, var_88_24.z)

				local var_88_25 = var_88_19.localEulerAngles

				var_88_25.z = 0
				var_88_25.x = 0
				var_88_19.localEulerAngles = var_88_25
			end

			if arg_85_1.time_ >= var_88_20 + var_88_21 and arg_85_1.time_ < var_88_20 + var_88_21 + arg_88_0 then
				var_88_19.localPosition = Vector3.New(0.7, -0.66, -6.15)

				local var_88_26 = manager.ui.mainCamera.transform.position - var_88_19.position

				var_88_19.forward = Vector3.New(var_88_26.x, var_88_26.y, var_88_26.z)

				local var_88_27 = var_88_19.localEulerAngles

				var_88_27.z = 0
				var_88_27.x = 0
				var_88_19.localEulerAngles = var_88_27
			end

			local var_88_28 = 0

			if var_88_28 < arg_85_1.time_ and arg_85_1.time_ <= var_88_28 + arg_88_0 then
				arg_85_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action11_2")
			end

			local var_88_29 = arg_85_1.actors_["10002_tpose"].transform
			local var_88_30 = 0

			if var_88_30 < arg_85_1.time_ and arg_85_1.time_ <= var_88_30 + arg_88_0 then
				arg_85_1.var_.moveOldPos10002_tpose = var_88_29.localPosition
			end

			local var_88_31 = 0.001

			if var_88_30 <= arg_85_1.time_ and arg_85_1.time_ < var_88_30 + var_88_31 then
				local var_88_32 = (arg_85_1.time_ - var_88_30) / var_88_31
				local var_88_33 = Vector3.New(0, 100, 0)

				var_88_29.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10002_tpose, var_88_33, var_88_32)

				local var_88_34 = manager.ui.mainCamera.transform.position - var_88_29.position

				var_88_29.forward = Vector3.New(var_88_34.x, var_88_34.y, var_88_34.z)

				local var_88_35 = var_88_29.localEulerAngles

				var_88_35.z = 0
				var_88_35.x = 0
				var_88_29.localEulerAngles = var_88_35
			end

			if arg_85_1.time_ >= var_88_30 + var_88_31 and arg_85_1.time_ < var_88_30 + var_88_31 + arg_88_0 then
				var_88_29.localPosition = Vector3.New(0, 100, 0)

				local var_88_36 = manager.ui.mainCamera.transform.position - var_88_29.position

				var_88_29.forward = Vector3.New(var_88_36.x, var_88_36.y, var_88_36.z)

				local var_88_37 = var_88_29.localEulerAngles

				var_88_37.z = 0
				var_88_37.x = 0
				var_88_29.localEulerAngles = var_88_37
			end

			local var_88_38 = 0

			if var_88_38 < arg_85_1.time_ and arg_85_1.time_ <= var_88_38 + arg_88_0 then
				arg_85_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_88_39 = 0
			local var_88_40 = 0.45

			if var_88_39 < arg_85_1.time_ and arg_85_1.time_ <= var_88_39 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_41 = arg_85_1:FormatText(StoryNameCfg[35].name)

				arg_85_1.leftNameTxt_.text = var_88_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_42 = arg_85_1:GetWordFromCfg(105071021)
				local var_88_43 = arg_85_1:FormatText(var_88_42.content)

				arg_85_1.text_.text = var_88_43

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_44 = 18
				local var_88_45 = utf8.len(var_88_43)
				local var_88_46 = var_88_44 <= 0 and var_88_40 or var_88_40 * (var_88_45 / var_88_44)

				if var_88_46 > 0 and var_88_40 < var_88_46 then
					arg_85_1.talkMaxDuration = var_88_46

					if var_88_46 + var_88_39 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_46 + var_88_39
					end
				end

				arg_85_1.text_.text = var_88_43
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071021", "story_v_out_105071.awb") ~= 0 then
					local var_88_47 = manager.audio:GetVoiceLength("story_v_out_105071", "105071021", "story_v_out_105071.awb") / 1000

					if var_88_47 + var_88_39 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_47 + var_88_39
					end

					if var_88_42.prefab_name ~= "" and arg_85_1.actors_[var_88_42.prefab_name] ~= nil then
						local var_88_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_42.prefab_name].transform, "story_v_out_105071", "105071021", "story_v_out_105071.awb")

						arg_85_1:RecordAudio("105071021", var_88_48)
						arg_85_1:RecordAudio("105071021", var_88_48)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_105071", "105071021", "story_v_out_105071.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_105071", "105071021", "story_v_out_105071.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_49 = math.max(var_88_40, arg_85_1.talkMaxDuration)

			if var_88_39 <= arg_85_1.time_ and arg_85_1.time_ < var_88_39 + var_88_49 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_39) / var_88_49

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_39 + var_88_49 and arg_85_1.time_ < var_88_39 + var_88_49 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play105071022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 105071022
		arg_89_1.duration_ = 7.733

		local var_89_0 = {
			ja = 5.5,
			ko = 6.9,
			zh = 7.733,
			en = 5.3
		}
		local var_89_1 = manager.audio:GetLocalizationFlag()

		if var_89_0[var_89_1] ~= nil then
			arg_89_1.duration_ = var_89_0[var_89_1]
		end

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play105071023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action3_1")
			end

			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_92_2 = 0
			local var_92_3 = 0.6

			if var_92_2 < arg_89_1.time_ and arg_89_1.time_ <= var_92_2 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_4 = arg_89_1:FormatText(StoryNameCfg[35].name)

				arg_89_1.leftNameTxt_.text = var_92_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_5 = arg_89_1:GetWordFromCfg(105071022)
				local var_92_6 = arg_89_1:FormatText(var_92_5.content)

				arg_89_1.text_.text = var_92_6

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_7 = 24
				local var_92_8 = utf8.len(var_92_6)
				local var_92_9 = var_92_7 <= 0 and var_92_3 or var_92_3 * (var_92_8 / var_92_7)

				if var_92_9 > 0 and var_92_3 < var_92_9 then
					arg_89_1.talkMaxDuration = var_92_9

					if var_92_9 + var_92_2 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_9 + var_92_2
					end
				end

				arg_89_1.text_.text = var_92_6
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071022", "story_v_out_105071.awb") ~= 0 then
					local var_92_10 = manager.audio:GetVoiceLength("story_v_out_105071", "105071022", "story_v_out_105071.awb") / 1000

					if var_92_10 + var_92_2 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_10 + var_92_2
					end

					if var_92_5.prefab_name ~= "" and arg_89_1.actors_[var_92_5.prefab_name] ~= nil then
						local var_92_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_5.prefab_name].transform, "story_v_out_105071", "105071022", "story_v_out_105071.awb")

						arg_89_1:RecordAudio("105071022", var_92_11)
						arg_89_1:RecordAudio("105071022", var_92_11)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_105071", "105071022", "story_v_out_105071.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_105071", "105071022", "story_v_out_105071.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_12 = math.max(var_92_3, arg_89_1.talkMaxDuration)

			if var_92_2 <= arg_89_1.time_ and arg_89_1.time_ < var_92_2 + var_92_12 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_2) / var_92_12

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_2 + var_92_12 and arg_89_1.time_ < var_92_2 + var_92_12 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play105071023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 105071023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play105071024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 1

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				local var_96_2 = "play"
				local var_96_3 = "effect"

				arg_93_1:AudioAction(var_96_2, var_96_3, "se_story_5", "se_story_5_stone", "")
			end

			local var_96_4 = arg_93_1.actors_["1013ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect1013ui_story == nil then
				arg_93_1.var_.characterEffect1013ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect1013ui_story then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1013ui_story.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect1013ui_story then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1013ui_story.fillRatio = var_96_9
			end

			local var_96_10 = arg_93_1.actors_["1013ui_story"].transform
			local var_96_11 = 0

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1.var_.moveOldPos1013ui_story = var_96_10.localPosition
			end

			local var_96_12 = 0.001

			if var_96_11 <= arg_93_1.time_ and arg_93_1.time_ < var_96_11 + var_96_12 then
				local var_96_13 = (arg_93_1.time_ - var_96_11) / var_96_12
				local var_96_14 = Vector3.New(0, 100, 0)

				var_96_10.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1013ui_story, var_96_14, var_96_13)

				local var_96_15 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_15.x, var_96_15.y, var_96_15.z)

				local var_96_16 = var_96_10.localEulerAngles

				var_96_16.z = 0
				var_96_16.x = 0
				var_96_10.localEulerAngles = var_96_16
			end

			if arg_93_1.time_ >= var_96_11 + var_96_12 and arg_93_1.time_ < var_96_11 + var_96_12 + arg_96_0 then
				var_96_10.localPosition = Vector3.New(0, 100, 0)

				local var_96_17 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_17.x, var_96_17.y, var_96_17.z)

				local var_96_18 = var_96_10.localEulerAngles

				var_96_18.z = 0
				var_96_18.x = 0
				var_96_10.localEulerAngles = var_96_18
			end

			local var_96_19 = 0
			local var_96_20 = 0.925

			if var_96_19 < arg_93_1.time_ and arg_93_1.time_ <= var_96_19 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_21 = arg_93_1:GetWordFromCfg(105071023)
				local var_96_22 = arg_93_1:FormatText(var_96_21.content)

				arg_93_1.text_.text = var_96_22

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_23 = 37
				local var_96_24 = utf8.len(var_96_22)
				local var_96_25 = var_96_23 <= 0 and var_96_20 or var_96_20 * (var_96_24 / var_96_23)

				if var_96_25 > 0 and var_96_20 < var_96_25 then
					arg_93_1.talkMaxDuration = var_96_25

					if var_96_25 + var_96_19 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_25 + var_96_19
					end
				end

				arg_93_1.text_.text = var_96_22
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_26 = math.max(var_96_20, arg_93_1.talkMaxDuration)

			if var_96_19 <= arg_93_1.time_ and arg_93_1.time_ < var_96_19 + var_96_26 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_19) / var_96_26

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_19 + var_96_26 and arg_93_1.time_ < var_96_19 + var_96_26 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play105071024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 105071024
		arg_97_1.duration_ = 6.9

		local var_97_0 = {
			ja = 6.9,
			ko = 2.7,
			zh = 3.7,
			en = 3.833
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
				arg_97_0:Play105071025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1013ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1013ui_story == nil then
				arg_97_1.var_.characterEffect1013ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1013ui_story then
					arg_97_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1013ui_story then
				arg_97_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["1013ui_story"].transform
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.var_.moveOldPos1013ui_story = var_100_4.localPosition
			end

			local var_100_6 = 0.001

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6
				local var_100_8 = Vector3.New(0, -0.66, -6.15)

				var_100_4.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1013ui_story, var_100_8, var_100_7)

				local var_100_9 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_9.x, var_100_9.y, var_100_9.z)

				local var_100_10 = var_100_4.localEulerAngles

				var_100_10.z = 0
				var_100_10.x = 0
				var_100_4.localEulerAngles = var_100_10
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 then
				var_100_4.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_100_11 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_11.x, var_100_11.y, var_100_11.z)

				local var_100_12 = var_100_4.localEulerAngles

				var_100_12.z = 0
				var_100_12.x = 0
				var_100_4.localEulerAngles = var_100_12
			end

			local var_100_13 = 0

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action2_1")
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_100_15 = 0
			local var_100_16 = 0.35

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_17 = arg_97_1:FormatText(StoryNameCfg[35].name)

				arg_97_1.leftNameTxt_.text = var_100_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_18 = arg_97_1:GetWordFromCfg(105071024)
				local var_100_19 = arg_97_1:FormatText(var_100_18.content)

				arg_97_1.text_.text = var_100_19

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_20 = 14
				local var_100_21 = utf8.len(var_100_19)
				local var_100_22 = var_100_20 <= 0 and var_100_16 or var_100_16 * (var_100_21 / var_100_20)

				if var_100_22 > 0 and var_100_16 < var_100_22 then
					arg_97_1.talkMaxDuration = var_100_22

					if var_100_22 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_22 + var_100_15
					end
				end

				arg_97_1.text_.text = var_100_19
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071024", "story_v_out_105071.awb") ~= 0 then
					local var_100_23 = manager.audio:GetVoiceLength("story_v_out_105071", "105071024", "story_v_out_105071.awb") / 1000

					if var_100_23 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_23 + var_100_15
					end

					if var_100_18.prefab_name ~= "" and arg_97_1.actors_[var_100_18.prefab_name] ~= nil then
						local var_100_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_18.prefab_name].transform, "story_v_out_105071", "105071024", "story_v_out_105071.awb")

						arg_97_1:RecordAudio("105071024", var_100_24)
						arg_97_1:RecordAudio("105071024", var_100_24)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_105071", "105071024", "story_v_out_105071.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_105071", "105071024", "story_v_out_105071.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_25 = math.max(var_100_16, arg_97_1.talkMaxDuration)

			if var_100_15 <= arg_97_1.time_ and arg_97_1.time_ < var_100_15 + var_100_25 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_15) / var_100_25

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_15 + var_100_25 and arg_97_1.time_ < var_100_15 + var_100_25 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play105071025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 105071025
		arg_101_1.duration_ = 5.7

		local var_101_0 = {
			ja = 4.633,
			ko = 4.066,
			zh = 4.333,
			en = 5.7
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
				arg_101_0:Play105071026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10002_tpose"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect10002_tpose == nil then
				arg_101_1.var_.characterEffect10002_tpose = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect10002_tpose then
					arg_101_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect10002_tpose then
				arg_101_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_104_4 = arg_101_1.actors_["1013ui_story"]
			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 and arg_101_1.var_.characterEffect1013ui_story == nil then
				arg_101_1.var_.characterEffect1013ui_story = var_104_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_6 = 0.1

			if var_104_5 <= arg_101_1.time_ and arg_101_1.time_ < var_104_5 + var_104_6 then
				local var_104_7 = (arg_101_1.time_ - var_104_5) / var_104_6

				if arg_101_1.var_.characterEffect1013ui_story then
					local var_104_8 = Mathf.Lerp(0, 0.5, var_104_7)

					arg_101_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1013ui_story.fillRatio = var_104_8
				end
			end

			if arg_101_1.time_ >= var_104_5 + var_104_6 and arg_101_1.time_ < var_104_5 + var_104_6 + arg_104_0 and arg_101_1.var_.characterEffect1013ui_story then
				local var_104_9 = 0.5

				arg_101_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1013ui_story.fillRatio = var_104_9
			end

			local var_104_10 = arg_101_1.actors_["1013ui_story"].transform
			local var_104_11 = 0

			if var_104_11 < arg_101_1.time_ and arg_101_1.time_ <= var_104_11 + arg_104_0 then
				arg_101_1.var_.moveOldPos1013ui_story = var_104_10.localPosition
			end

			local var_104_12 = 0.001

			if var_104_11 <= arg_101_1.time_ and arg_101_1.time_ < var_104_11 + var_104_12 then
				local var_104_13 = (arg_101_1.time_ - var_104_11) / var_104_12
				local var_104_14 = Vector3.New(0, 100, 0)

				var_104_10.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1013ui_story, var_104_14, var_104_13)

				local var_104_15 = manager.ui.mainCamera.transform.position - var_104_10.position

				var_104_10.forward = Vector3.New(var_104_15.x, var_104_15.y, var_104_15.z)

				local var_104_16 = var_104_10.localEulerAngles

				var_104_16.z = 0
				var_104_16.x = 0
				var_104_10.localEulerAngles = var_104_16
			end

			if arg_101_1.time_ >= var_104_11 + var_104_12 and arg_101_1.time_ < var_104_11 + var_104_12 + arg_104_0 then
				var_104_10.localPosition = Vector3.New(0, 100, 0)

				local var_104_17 = manager.ui.mainCamera.transform.position - var_104_10.position

				var_104_10.forward = Vector3.New(var_104_17.x, var_104_17.y, var_104_17.z)

				local var_104_18 = var_104_10.localEulerAngles

				var_104_18.z = 0
				var_104_18.x = 0
				var_104_10.localEulerAngles = var_104_18
			end

			local var_104_19 = arg_101_1.actors_["10002_tpose"].transform
			local var_104_20 = 0

			if var_104_20 < arg_101_1.time_ and arg_101_1.time_ <= var_104_20 + arg_104_0 then
				arg_101_1.var_.moveOldPos10002_tpose = var_104_19.localPosition
			end

			local var_104_21 = 0.001

			if var_104_20 <= arg_101_1.time_ and arg_101_1.time_ < var_104_20 + var_104_21 then
				local var_104_22 = (arg_101_1.time_ - var_104_20) / var_104_21
				local var_104_23 = Vector3.New(0, -1.2, -5.8)

				var_104_19.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10002_tpose, var_104_23, var_104_22)

				local var_104_24 = manager.ui.mainCamera.transform.position - var_104_19.position

				var_104_19.forward = Vector3.New(var_104_24.x, var_104_24.y, var_104_24.z)

				local var_104_25 = var_104_19.localEulerAngles

				var_104_25.z = 0
				var_104_25.x = 0
				var_104_19.localEulerAngles = var_104_25
			end

			if arg_101_1.time_ >= var_104_20 + var_104_21 and arg_101_1.time_ < var_104_20 + var_104_21 + arg_104_0 then
				var_104_19.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_104_26 = manager.ui.mainCamera.transform.position - var_104_19.position

				var_104_19.forward = Vector3.New(var_104_26.x, var_104_26.y, var_104_26.z)

				local var_104_27 = var_104_19.localEulerAngles

				var_104_27.z = 0
				var_104_27.x = 0
				var_104_19.localEulerAngles = var_104_27
			end

			local var_104_28 = 0

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 then
				arg_101_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_104_29 = 0

			if var_104_29 < arg_101_1.time_ and arg_101_1.time_ <= var_104_29 + arg_104_0 then
				arg_101_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_104_30 = 0
			local var_104_31 = 0.3

			if var_104_30 < arg_101_1.time_ and arg_101_1.time_ <= var_104_30 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_32 = arg_101_1:FormatText(StoryNameCfg[39].name)

				arg_101_1.leftNameTxt_.text = var_104_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_33 = arg_101_1:GetWordFromCfg(105071025)
				local var_104_34 = arg_101_1:FormatText(var_104_33.content)

				arg_101_1.text_.text = var_104_34

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_35 = 12
				local var_104_36 = utf8.len(var_104_34)
				local var_104_37 = var_104_35 <= 0 and var_104_31 or var_104_31 * (var_104_36 / var_104_35)

				if var_104_37 > 0 and var_104_31 < var_104_37 then
					arg_101_1.talkMaxDuration = var_104_37

					if var_104_37 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_37 + var_104_30
					end
				end

				arg_101_1.text_.text = var_104_34
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071025", "story_v_out_105071.awb") ~= 0 then
					local var_104_38 = manager.audio:GetVoiceLength("story_v_out_105071", "105071025", "story_v_out_105071.awb") / 1000

					if var_104_38 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_38 + var_104_30
					end

					if var_104_33.prefab_name ~= "" and arg_101_1.actors_[var_104_33.prefab_name] ~= nil then
						local var_104_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_33.prefab_name].transform, "story_v_out_105071", "105071025", "story_v_out_105071.awb")

						arg_101_1:RecordAudio("105071025", var_104_39)
						arg_101_1:RecordAudio("105071025", var_104_39)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_105071", "105071025", "story_v_out_105071.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_105071", "105071025", "story_v_out_105071.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_40 = math.max(var_104_31, arg_101_1.talkMaxDuration)

			if var_104_30 <= arg_101_1.time_ and arg_101_1.time_ < var_104_30 + var_104_40 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_30) / var_104_40

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_30 + var_104_40 and arg_101_1.time_ < var_104_30 + var_104_40 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play105071026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 105071026
		arg_105_1.duration_ = 9.7

		local var_105_0 = {
			ja = 9.7,
			ko = 3.866,
			zh = 4.333,
			en = 5.2
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
				arg_105_0:Play105071027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 1

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				local var_108_2 = "play"
				local var_108_3 = "effect"

				arg_105_1:AudioAction(var_108_2, var_108_3, "se_story", "se_story_robot_short", "")
			end

			local var_108_4 = "3005_tpose"

			if arg_105_1.actors_[var_108_4] == nil then
				local var_108_5 = Object.Instantiate(Asset.Load("Char/" .. var_108_4), arg_105_1.stage_.transform)

				var_108_5.name = var_108_4
				var_108_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_105_1.actors_[var_108_4] = var_108_5

				local var_108_6 = var_108_5:GetComponentInChildren(typeof(CharacterEffect))

				var_108_6.enabled = true

				local var_108_7 = GameObjectTools.GetOrAddComponent(var_108_5, typeof(DynamicBoneHelper))

				if var_108_7 then
					var_108_7:EnableDynamicBone(false)
				end

				arg_105_1:ShowWeapon(var_108_6.transform, false)

				arg_105_1.var_[var_108_4 .. "Animator"] = var_108_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_105_1.var_[var_108_4 .. "Animator"].applyRootMotion = true
				arg_105_1.var_[var_108_4 .. "LipSync"] = var_108_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_108_8 = arg_105_1.actors_["3005_tpose"]
			local var_108_9 = 0

			if var_108_9 < arg_105_1.time_ and arg_105_1.time_ <= var_108_9 + arg_108_0 and arg_105_1.var_.characterEffect3005_tpose == nil then
				arg_105_1.var_.characterEffect3005_tpose = var_108_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_10 = 0.1

			if var_108_9 <= arg_105_1.time_ and arg_105_1.time_ < var_108_9 + var_108_10 then
				local var_108_11 = (arg_105_1.time_ - var_108_9) / var_108_10

				if arg_105_1.var_.characterEffect3005_tpose then
					arg_105_1.var_.characterEffect3005_tpose.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_9 + var_108_10 and arg_105_1.time_ < var_108_9 + var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect3005_tpose then
				arg_105_1.var_.characterEffect3005_tpose.fillFlat = false
			end

			local var_108_12 = arg_105_1.actors_["10002_tpose"]
			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 and arg_105_1.var_.characterEffect10002_tpose == nil then
				arg_105_1.var_.characterEffect10002_tpose = var_108_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_14 = 0.1

			if var_108_13 <= arg_105_1.time_ and arg_105_1.time_ < var_108_13 + var_108_14 then
				local var_108_15 = (arg_105_1.time_ - var_108_13) / var_108_14

				if arg_105_1.var_.characterEffect10002_tpose then
					local var_108_16 = Mathf.Lerp(0, 0.5, var_108_15)

					arg_105_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_105_1.var_.characterEffect10002_tpose.fillRatio = var_108_16
				end
			end

			if arg_105_1.time_ >= var_108_13 + var_108_14 and arg_105_1.time_ < var_108_13 + var_108_14 + arg_108_0 and arg_105_1.var_.characterEffect10002_tpose then
				local var_108_17 = 0.5

				arg_105_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_105_1.var_.characterEffect10002_tpose.fillRatio = var_108_17
			end

			local var_108_18 = arg_105_1.actors_["10002_tpose"].transform
			local var_108_19 = 0

			if var_108_19 < arg_105_1.time_ and arg_105_1.time_ <= var_108_19 + arg_108_0 then
				arg_105_1.var_.moveOldPos10002_tpose = var_108_18.localPosition
			end

			local var_108_20 = 0.001

			if var_108_19 <= arg_105_1.time_ and arg_105_1.time_ < var_108_19 + var_108_20 then
				local var_108_21 = (arg_105_1.time_ - var_108_19) / var_108_20
				local var_108_22 = Vector3.New(0, 100, 0)

				var_108_18.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10002_tpose, var_108_22, var_108_21)

				local var_108_23 = manager.ui.mainCamera.transform.position - var_108_18.position

				var_108_18.forward = Vector3.New(var_108_23.x, var_108_23.y, var_108_23.z)

				local var_108_24 = var_108_18.localEulerAngles

				var_108_24.z = 0
				var_108_24.x = 0
				var_108_18.localEulerAngles = var_108_24
			end

			if arg_105_1.time_ >= var_108_19 + var_108_20 and arg_105_1.time_ < var_108_19 + var_108_20 + arg_108_0 then
				var_108_18.localPosition = Vector3.New(0, 100, 0)

				local var_108_25 = manager.ui.mainCamera.transform.position - var_108_18.position

				var_108_18.forward = Vector3.New(var_108_25.x, var_108_25.y, var_108_25.z)

				local var_108_26 = var_108_18.localEulerAngles

				var_108_26.z = 0
				var_108_26.x = 0
				var_108_18.localEulerAngles = var_108_26
			end

			local var_108_27 = arg_105_1.actors_["3005_tpose"].transform
			local var_108_28 = 0

			if var_108_28 < arg_105_1.time_ and arg_105_1.time_ <= var_108_28 + arg_108_0 then
				arg_105_1.var_.moveOldPos3005_tpose = var_108_27.localPosition
			end

			local var_108_29 = 0.001

			if var_108_28 <= arg_105_1.time_ and arg_105_1.time_ < var_108_28 + var_108_29 then
				local var_108_30 = (arg_105_1.time_ - var_108_28) / var_108_29
				local var_108_31 = Vector3.New(-0.7, -1.95, -3.4)

				var_108_27.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos3005_tpose, var_108_31, var_108_30)

				local var_108_32 = manager.ui.mainCamera.transform.position - var_108_27.position

				var_108_27.forward = Vector3.New(var_108_32.x, var_108_32.y, var_108_32.z)

				local var_108_33 = var_108_27.localEulerAngles

				var_108_33.z = 0
				var_108_33.x = 0
				var_108_27.localEulerAngles = var_108_33
			end

			if arg_105_1.time_ >= var_108_28 + var_108_29 and arg_105_1.time_ < var_108_28 + var_108_29 + arg_108_0 then
				var_108_27.localPosition = Vector3.New(-0.7, -1.95, -3.4)

				local var_108_34 = manager.ui.mainCamera.transform.position - var_108_27.position

				var_108_27.forward = Vector3.New(var_108_34.x, var_108_34.y, var_108_34.z)

				local var_108_35 = var_108_27.localEulerAngles

				var_108_35.z = 0
				var_108_35.x = 0
				var_108_27.localEulerAngles = var_108_35
			end

			local var_108_36 = 0

			if var_108_36 < arg_105_1.time_ and arg_105_1.time_ <= var_108_36 + arg_108_0 then
				arg_105_1:PlayTimeline("3005_tpose", "StoryTimeline/CharAction/story3005/story3005action/3005action1_1")
			end

			local var_108_37 = 0
			local var_108_38 = 0.35

			if var_108_37 < arg_105_1.time_ and arg_105_1.time_ <= var_108_37 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_39 = arg_105_1:FormatText(StoryNameCfg[69].name)

				arg_105_1.leftNameTxt_.text = var_108_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_40 = arg_105_1:GetWordFromCfg(105071026)
				local var_108_41 = arg_105_1:FormatText(var_108_40.content)

				arg_105_1.text_.text = var_108_41

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_42 = 14
				local var_108_43 = utf8.len(var_108_41)
				local var_108_44 = var_108_42 <= 0 and var_108_38 or var_108_38 * (var_108_43 / var_108_42)

				if var_108_44 > 0 and var_108_38 < var_108_44 then
					arg_105_1.talkMaxDuration = var_108_44

					if var_108_44 + var_108_37 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_44 + var_108_37
					end
				end

				arg_105_1.text_.text = var_108_41
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071026", "story_v_out_105071.awb") ~= 0 then
					local var_108_45 = manager.audio:GetVoiceLength("story_v_out_105071", "105071026", "story_v_out_105071.awb") / 1000

					if var_108_45 + var_108_37 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_45 + var_108_37
					end

					if var_108_40.prefab_name ~= "" and arg_105_1.actors_[var_108_40.prefab_name] ~= nil then
						local var_108_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_40.prefab_name].transform, "story_v_out_105071", "105071026", "story_v_out_105071.awb")

						arg_105_1:RecordAudio("105071026", var_108_46)
						arg_105_1:RecordAudio("105071026", var_108_46)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_105071", "105071026", "story_v_out_105071.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_105071", "105071026", "story_v_out_105071.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_47 = math.max(var_108_38, arg_105_1.talkMaxDuration)

			if var_108_37 <= arg_105_1.time_ and arg_105_1.time_ < var_108_37 + var_108_47 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_37) / var_108_47

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_37 + var_108_47 and arg_105_1.time_ < var_108_37 + var_108_47 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play105071027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 105071027
		arg_109_1.duration_ = 5.433

		local var_109_0 = {
			ja = 4.3,
			ko = 2.5,
			zh = 5.433,
			en = 5
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
				arg_109_0:Play105071028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				local var_112_2 = "play"
				local var_112_3 = "effect"

				arg_109_1:AudioAction(var_112_2, var_112_3, "se_story", "se_story_robot_short", "")
			end

			local var_112_4 = "2043_tpose"

			if arg_109_1.actors_[var_112_4] == nil then
				local var_112_5 = Object.Instantiate(Asset.Load("Char/" .. var_112_4), arg_109_1.stage_.transform)

				var_112_5.name = var_112_4
				var_112_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_109_1.actors_[var_112_4] = var_112_5

				local var_112_6 = var_112_5:GetComponentInChildren(typeof(CharacterEffect))

				var_112_6.enabled = true

				local var_112_7 = GameObjectTools.GetOrAddComponent(var_112_5, typeof(DynamicBoneHelper))

				if var_112_7 then
					var_112_7:EnableDynamicBone(false)
				end

				arg_109_1:ShowWeapon(var_112_6.transform, false)

				arg_109_1.var_[var_112_4 .. "Animator"] = var_112_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_109_1.var_[var_112_4 .. "Animator"].applyRootMotion = true
				arg_109_1.var_[var_112_4 .. "LipSync"] = var_112_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_112_8 = arg_109_1.actors_["2043_tpose"]
			local var_112_9 = 0

			if var_112_9 < arg_109_1.time_ and arg_109_1.time_ <= var_112_9 + arg_112_0 and arg_109_1.var_.characterEffect2043_tpose == nil then
				arg_109_1.var_.characterEffect2043_tpose = var_112_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_10 = 0.1

			if var_112_9 <= arg_109_1.time_ and arg_109_1.time_ < var_112_9 + var_112_10 then
				local var_112_11 = (arg_109_1.time_ - var_112_9) / var_112_10

				if arg_109_1.var_.characterEffect2043_tpose then
					arg_109_1.var_.characterEffect2043_tpose.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_9 + var_112_10 and arg_109_1.time_ < var_112_9 + var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect2043_tpose then
				arg_109_1.var_.characterEffect2043_tpose.fillFlat = false
			end

			local var_112_12 = arg_109_1.actors_["3005_tpose"]
			local var_112_13 = 0

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 and arg_109_1.var_.characterEffect3005_tpose == nil then
				arg_109_1.var_.characterEffect3005_tpose = var_112_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_14 = 0.1

			if var_112_13 <= arg_109_1.time_ and arg_109_1.time_ < var_112_13 + var_112_14 then
				local var_112_15 = (arg_109_1.time_ - var_112_13) / var_112_14

				if arg_109_1.var_.characterEffect3005_tpose then
					local var_112_16 = Mathf.Lerp(0, 0.5, var_112_15)

					arg_109_1.var_.characterEffect3005_tpose.fillFlat = true
					arg_109_1.var_.characterEffect3005_tpose.fillRatio = var_112_16
				end
			end

			if arg_109_1.time_ >= var_112_13 + var_112_14 and arg_109_1.time_ < var_112_13 + var_112_14 + arg_112_0 and arg_109_1.var_.characterEffect3005_tpose then
				local var_112_17 = 0.5

				arg_109_1.var_.characterEffect3005_tpose.fillFlat = true
				arg_109_1.var_.characterEffect3005_tpose.fillRatio = var_112_17
			end

			local var_112_18 = arg_109_1.actors_["2043_tpose"].transform
			local var_112_19 = 0

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 then
				arg_109_1.var_.moveOldPos2043_tpose = var_112_18.localPosition
			end

			local var_112_20 = 0.001

			if var_112_19 <= arg_109_1.time_ and arg_109_1.time_ < var_112_19 + var_112_20 then
				local var_112_21 = (arg_109_1.time_ - var_112_19) / var_112_20
				local var_112_22 = Vector3.New(0.7, -0.95, -2)

				var_112_18.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos2043_tpose, var_112_22, var_112_21)

				local var_112_23 = manager.ui.mainCamera.transform.position - var_112_18.position

				var_112_18.forward = Vector3.New(var_112_23.x, var_112_23.y, var_112_23.z)

				local var_112_24 = var_112_18.localEulerAngles

				var_112_24.z = 0
				var_112_24.x = 0
				var_112_18.localEulerAngles = var_112_24
			end

			if arg_109_1.time_ >= var_112_19 + var_112_20 and arg_109_1.time_ < var_112_19 + var_112_20 + arg_112_0 then
				var_112_18.localPosition = Vector3.New(0.7, -0.95, -2)

				local var_112_25 = manager.ui.mainCamera.transform.position - var_112_18.position

				var_112_18.forward = Vector3.New(var_112_25.x, var_112_25.y, var_112_25.z)

				local var_112_26 = var_112_18.localEulerAngles

				var_112_26.z = 0
				var_112_26.x = 0
				var_112_18.localEulerAngles = var_112_26
			end

			local var_112_27 = 0

			if var_112_27 < arg_109_1.time_ and arg_109_1.time_ <= var_112_27 + arg_112_0 then
				arg_109_1:PlayTimeline("2043_tpose", "StoryTimeline/CharAction/story2043/story2043action/2043action1_1")
			end

			local var_112_28 = 0
			local var_112_29 = 0.3

			if var_112_28 < arg_109_1.time_ and arg_109_1.time_ <= var_112_28 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_30 = arg_109_1:FormatText(StoryNameCfg[69].name)

				arg_109_1.leftNameTxt_.text = var_112_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_31 = arg_109_1:GetWordFromCfg(105071027)
				local var_112_32 = arg_109_1:FormatText(var_112_31.content)

				arg_109_1.text_.text = var_112_32

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_33 = 12
				local var_112_34 = utf8.len(var_112_32)
				local var_112_35 = var_112_33 <= 0 and var_112_29 or var_112_29 * (var_112_34 / var_112_33)

				if var_112_35 > 0 and var_112_29 < var_112_35 then
					arg_109_1.talkMaxDuration = var_112_35

					if var_112_35 + var_112_28 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_35 + var_112_28
					end
				end

				arg_109_1.text_.text = var_112_32
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071027", "story_v_out_105071.awb") ~= 0 then
					local var_112_36 = manager.audio:GetVoiceLength("story_v_out_105071", "105071027", "story_v_out_105071.awb") / 1000

					if var_112_36 + var_112_28 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_36 + var_112_28
					end

					if var_112_31.prefab_name ~= "" and arg_109_1.actors_[var_112_31.prefab_name] ~= nil then
						local var_112_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_31.prefab_name].transform, "story_v_out_105071", "105071027", "story_v_out_105071.awb")

						arg_109_1:RecordAudio("105071027", var_112_37)
						arg_109_1:RecordAudio("105071027", var_112_37)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_105071", "105071027", "story_v_out_105071.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_105071", "105071027", "story_v_out_105071.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_38 = math.max(var_112_29, arg_109_1.talkMaxDuration)

			if var_112_28 <= arg_109_1.time_ and arg_109_1.time_ < var_112_28 + var_112_38 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_28) / var_112_38

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_28 + var_112_38 and arg_109_1.time_ < var_112_28 + var_112_38 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play105071028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 105071028
		arg_113_1.duration_ = 8.166

		local var_113_0 = {
			ja = 8.166,
			ko = 5.1,
			zh = 6.1,
			en = 6.866
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
				arg_113_0:Play105071029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1013ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1013ui_story == nil then
				arg_113_1.var_.characterEffect1013ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.1

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1013ui_story then
					arg_113_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1013ui_story then
				arg_113_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_116_4 = arg_113_1.actors_["2043_tpose"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect2043_tpose == nil then
				arg_113_1.var_.characterEffect2043_tpose = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.1

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect2043_tpose then
					local var_116_8 = Mathf.Lerp(0, 0.5, var_116_7)

					arg_113_1.var_.characterEffect2043_tpose.fillFlat = true
					arg_113_1.var_.characterEffect2043_tpose.fillRatio = var_116_8
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect2043_tpose then
				local var_116_9 = 0.5

				arg_113_1.var_.characterEffect2043_tpose.fillFlat = true
				arg_113_1.var_.characterEffect2043_tpose.fillRatio = var_116_9
			end

			local var_116_10 = arg_113_1.actors_["3005_tpose"].transform
			local var_116_11 = 0

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 then
				arg_113_1.var_.moveOldPos3005_tpose = var_116_10.localPosition
			end

			local var_116_12 = 0.001

			if var_116_11 <= arg_113_1.time_ and arg_113_1.time_ < var_116_11 + var_116_12 then
				local var_116_13 = (arg_113_1.time_ - var_116_11) / var_116_12
				local var_116_14 = Vector3.New(0, 100, 0)

				var_116_10.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos3005_tpose, var_116_14, var_116_13)

				local var_116_15 = manager.ui.mainCamera.transform.position - var_116_10.position

				var_116_10.forward = Vector3.New(var_116_15.x, var_116_15.y, var_116_15.z)

				local var_116_16 = var_116_10.localEulerAngles

				var_116_16.z = 0
				var_116_16.x = 0
				var_116_10.localEulerAngles = var_116_16
			end

			if arg_113_1.time_ >= var_116_11 + var_116_12 and arg_113_1.time_ < var_116_11 + var_116_12 + arg_116_0 then
				var_116_10.localPosition = Vector3.New(0, 100, 0)

				local var_116_17 = manager.ui.mainCamera.transform.position - var_116_10.position

				var_116_10.forward = Vector3.New(var_116_17.x, var_116_17.y, var_116_17.z)

				local var_116_18 = var_116_10.localEulerAngles

				var_116_18.z = 0
				var_116_18.x = 0
				var_116_10.localEulerAngles = var_116_18
			end

			local var_116_19 = arg_113_1.actors_["2043_tpose"].transform
			local var_116_20 = 0

			if var_116_20 < arg_113_1.time_ and arg_113_1.time_ <= var_116_20 + arg_116_0 then
				arg_113_1.var_.moveOldPos2043_tpose = var_116_19.localPosition
			end

			local var_116_21 = 0.001

			if var_116_20 <= arg_113_1.time_ and arg_113_1.time_ < var_116_20 + var_116_21 then
				local var_116_22 = (arg_113_1.time_ - var_116_20) / var_116_21
				local var_116_23 = Vector3.New(0, 100, 0)

				var_116_19.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos2043_tpose, var_116_23, var_116_22)

				local var_116_24 = manager.ui.mainCamera.transform.position - var_116_19.position

				var_116_19.forward = Vector3.New(var_116_24.x, var_116_24.y, var_116_24.z)

				local var_116_25 = var_116_19.localEulerAngles

				var_116_25.z = 0
				var_116_25.x = 0
				var_116_19.localEulerAngles = var_116_25
			end

			if arg_113_1.time_ >= var_116_20 + var_116_21 and arg_113_1.time_ < var_116_20 + var_116_21 + arg_116_0 then
				var_116_19.localPosition = Vector3.New(0, 100, 0)

				local var_116_26 = manager.ui.mainCamera.transform.position - var_116_19.position

				var_116_19.forward = Vector3.New(var_116_26.x, var_116_26.y, var_116_26.z)

				local var_116_27 = var_116_19.localEulerAngles

				var_116_27.z = 0
				var_116_27.x = 0
				var_116_19.localEulerAngles = var_116_27
			end

			local var_116_28 = arg_113_1.actors_["1013ui_story"].transform
			local var_116_29 = 0

			if var_116_29 < arg_113_1.time_ and arg_113_1.time_ <= var_116_29 + arg_116_0 then
				arg_113_1.var_.moveOldPos1013ui_story = var_116_28.localPosition
			end

			local var_116_30 = 0.001

			if var_116_29 <= arg_113_1.time_ and arg_113_1.time_ < var_116_29 + var_116_30 then
				local var_116_31 = (arg_113_1.time_ - var_116_29) / var_116_30
				local var_116_32 = Vector3.New(0, -0.66, -6.15)

				var_116_28.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1013ui_story, var_116_32, var_116_31)

				local var_116_33 = manager.ui.mainCamera.transform.position - var_116_28.position

				var_116_28.forward = Vector3.New(var_116_33.x, var_116_33.y, var_116_33.z)

				local var_116_34 = var_116_28.localEulerAngles

				var_116_34.z = 0
				var_116_34.x = 0
				var_116_28.localEulerAngles = var_116_34
			end

			if arg_113_1.time_ >= var_116_29 + var_116_30 and arg_113_1.time_ < var_116_29 + var_116_30 + arg_116_0 then
				var_116_28.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_116_35 = manager.ui.mainCamera.transform.position - var_116_28.position

				var_116_28.forward = Vector3.New(var_116_35.x, var_116_35.y, var_116_35.z)

				local var_116_36 = var_116_28.localEulerAngles

				var_116_36.z = 0
				var_116_36.x = 0
				var_116_28.localEulerAngles = var_116_36
			end

			local var_116_37 = 0

			if var_116_37 < arg_113_1.time_ and arg_113_1.time_ <= var_116_37 + arg_116_0 then
				arg_113_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action4_1")
			end

			local var_116_38 = 0

			if var_116_38 < arg_113_1.time_ and arg_113_1.time_ <= var_116_38 + arg_116_0 then
				arg_113_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_116_39 = 0
			local var_116_40 = 0.55

			if var_116_39 < arg_113_1.time_ and arg_113_1.time_ <= var_116_39 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_41 = arg_113_1:FormatText(StoryNameCfg[35].name)

				arg_113_1.leftNameTxt_.text = var_116_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_42 = arg_113_1:GetWordFromCfg(105071028)
				local var_116_43 = arg_113_1:FormatText(var_116_42.content)

				arg_113_1.text_.text = var_116_43

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_44 = 22
				local var_116_45 = utf8.len(var_116_43)
				local var_116_46 = var_116_44 <= 0 and var_116_40 or var_116_40 * (var_116_45 / var_116_44)

				if var_116_46 > 0 and var_116_40 < var_116_46 then
					arg_113_1.talkMaxDuration = var_116_46

					if var_116_46 + var_116_39 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_46 + var_116_39
					end
				end

				arg_113_1.text_.text = var_116_43
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071028", "story_v_out_105071.awb") ~= 0 then
					local var_116_47 = manager.audio:GetVoiceLength("story_v_out_105071", "105071028", "story_v_out_105071.awb") / 1000

					if var_116_47 + var_116_39 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_47 + var_116_39
					end

					if var_116_42.prefab_name ~= "" and arg_113_1.actors_[var_116_42.prefab_name] ~= nil then
						local var_116_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_42.prefab_name].transform, "story_v_out_105071", "105071028", "story_v_out_105071.awb")

						arg_113_1:RecordAudio("105071028", var_116_48)
						arg_113_1:RecordAudio("105071028", var_116_48)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_105071", "105071028", "story_v_out_105071.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_105071", "105071028", "story_v_out_105071.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_49 = math.max(var_116_40, arg_113_1.talkMaxDuration)

			if var_116_39 <= arg_113_1.time_ and arg_113_1.time_ < var_116_39 + var_116_49 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_39) / var_116_49

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_39 + var_116_49 and arg_113_1.time_ < var_116_39 + var_116_49 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play105071029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 105071029
		arg_117_1.duration_ = 9

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play105071030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1013ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1013ui_story == nil then
				arg_117_1.var_.characterEffect1013ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.1

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1013ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1013ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1013ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1013ui_story.fillRatio = var_120_5
			end

			local var_120_6 = arg_117_1.actors_["1013ui_story"].transform
			local var_120_7 = 0

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 then
				arg_117_1.var_.moveOldPos1013ui_story = var_120_6.localPosition
			end

			local var_120_8 = 0.001

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_8 then
				local var_120_9 = (arg_117_1.time_ - var_120_7) / var_120_8
				local var_120_10 = Vector3.New(10, -0.78, -5.4)

				var_120_6.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1013ui_story, var_120_10, var_120_9)

				local var_120_11 = manager.ui.mainCamera.transform.position - var_120_6.position

				var_120_6.forward = Vector3.New(var_120_11.x, var_120_11.y, var_120_11.z)

				local var_120_12 = var_120_6.localEulerAngles

				var_120_12.z = 0
				var_120_12.x = 0
				var_120_6.localEulerAngles = var_120_12
			end

			if arg_117_1.time_ >= var_120_7 + var_120_8 and arg_117_1.time_ < var_120_7 + var_120_8 + arg_120_0 then
				var_120_6.localPosition = Vector3.New(10, -0.78, -5.4)

				local var_120_13 = manager.ui.mainCamera.transform.position - var_120_6.position

				var_120_6.forward = Vector3.New(var_120_13.x, var_120_13.y, var_120_13.z)

				local var_120_14 = var_120_6.localEulerAngles

				var_120_14.z = 0
				var_120_14.x = 0
				var_120_6.localEulerAngles = var_120_14
			end

			local var_120_15 = 0

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.mask_.enabled = true
				arg_117_1.mask_.raycastTarget = true

				arg_117_1:SetGaussion(false)
			end

			local var_120_16 = 2

			if var_120_15 <= arg_117_1.time_ and arg_117_1.time_ < var_120_15 + var_120_16 then
				local var_120_17 = (arg_117_1.time_ - var_120_15) / var_120_16
				local var_120_18 = Color.New(0, 0, 0)

				var_120_18.a = Mathf.Lerp(0, 1, var_120_17)
				arg_117_1.mask_.color = var_120_18
			end

			if arg_117_1.time_ >= var_120_15 + var_120_16 and arg_117_1.time_ < var_120_15 + var_120_16 + arg_120_0 then
				local var_120_19 = Color.New(0, 0, 0)

				var_120_19.a = 1
				arg_117_1.mask_.color = var_120_19
			end

			local var_120_20 = 2

			if var_120_20 < arg_117_1.time_ and arg_117_1.time_ <= var_120_20 + arg_120_0 then
				arg_117_1.mask_.enabled = true
				arg_117_1.mask_.raycastTarget = true

				arg_117_1:SetGaussion(false)
			end

			local var_120_21 = 2

			if var_120_20 <= arg_117_1.time_ and arg_117_1.time_ < var_120_20 + var_120_21 then
				local var_120_22 = (arg_117_1.time_ - var_120_20) / var_120_21
				local var_120_23 = Color.New(0, 0, 0)

				var_120_23.a = Mathf.Lerp(1, 0, var_120_22)
				arg_117_1.mask_.color = var_120_23
			end

			if arg_117_1.time_ >= var_120_20 + var_120_21 and arg_117_1.time_ < var_120_20 + var_120_21 + arg_120_0 then
				local var_120_24 = Color.New(0, 0, 0)
				local var_120_25 = 0

				arg_117_1.mask_.enabled = false
				var_120_24.a = var_120_25
				arg_117_1.mask_.color = var_120_24
			end

			local var_120_26 = "S0507"

			if arg_117_1.bgs_[var_120_26] == nil then
				local var_120_27 = Object.Instantiate(arg_117_1.paintGo_)

				var_120_27:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_120_26)
				var_120_27.name = var_120_26
				var_120_27.transform.parent = arg_117_1.stage_.transform
				var_120_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_117_1.bgs_[var_120_26] = var_120_27
			end

			local var_120_28 = 2

			if var_120_28 < arg_117_1.time_ and arg_117_1.time_ <= var_120_28 + arg_120_0 then
				local var_120_29 = manager.ui.mainCamera.transform.localPosition
				local var_120_30 = Vector3.New(0, 0, 10) + Vector3.New(var_120_29.x, var_120_29.y, 0)
				local var_120_31 = arg_117_1.bgs_.S0507

				var_120_31.transform.localPosition = var_120_30
				var_120_31.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_120_32 = var_120_31:GetComponent("SpriteRenderer")

				if var_120_32 and var_120_32.sprite then
					local var_120_33 = (var_120_31.transform.localPosition - var_120_29).z
					local var_120_34 = manager.ui.mainCameraCom_
					local var_120_35 = 2 * var_120_33 * Mathf.Tan(var_120_34.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_120_36 = var_120_35 * var_120_34.aspect
					local var_120_37 = var_120_32.sprite.bounds.size.x
					local var_120_38 = var_120_32.sprite.bounds.size.y
					local var_120_39 = var_120_36 / var_120_37
					local var_120_40 = var_120_35 / var_120_38
					local var_120_41 = var_120_40 < var_120_39 and var_120_39 or var_120_40

					var_120_31.transform.localScale = Vector3.New(var_120_41, var_120_41, 0)
				end

				for iter_120_0, iter_120_1 in pairs(arg_117_1.bgs_) do
					if iter_120_0 ~= "S0507" then
						iter_120_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_120_42 = arg_117_1.bgs_.S0507.transform
			local var_120_43 = 2

			if var_120_43 < arg_117_1.time_ and arg_117_1.time_ <= var_120_43 + arg_120_0 then
				arg_117_1.var_.moveOldPosS0507 = var_120_42.localPosition
			end

			local var_120_44 = 0.001

			if var_120_43 <= arg_117_1.time_ and arg_117_1.time_ < var_120_43 + var_120_44 then
				local var_120_45 = (arg_117_1.time_ - var_120_43) / var_120_44
				local var_120_46 = Vector3.New(4.65, 3.19, -4.27)

				var_120_42.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPosS0507, var_120_46, var_120_45)
			end

			if arg_117_1.time_ >= var_120_43 + var_120_44 and arg_117_1.time_ < var_120_43 + var_120_44 + arg_120_0 then
				var_120_42.localPosition = Vector3.New(4.65, 3.19, -4.27)
			end

			local var_120_47 = arg_117_1.bgs_.S0507.transform
			local var_120_48 = 2.01666666666667

			if var_120_48 < arg_117_1.time_ and arg_117_1.time_ <= var_120_48 + arg_120_0 then
				arg_117_1.var_.moveOldPosS0507 = var_120_47.localPosition
			end

			local var_120_49 = 4

			if var_120_48 <= arg_117_1.time_ and arg_117_1.time_ < var_120_48 + var_120_49 then
				local var_120_50 = (arg_117_1.time_ - var_120_48) / var_120_49
				local var_120_51 = Vector3.New(4.65, 3.19, -3.01)

				var_120_47.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPosS0507, var_120_51, var_120_50)
			end

			if arg_117_1.time_ >= var_120_48 + var_120_49 and arg_117_1.time_ < var_120_48 + var_120_49 + arg_120_0 then
				var_120_47.localPosition = Vector3.New(4.65, 3.19, -3.01)
			end

			if arg_117_1.frameCnt_ <= 1 then
				arg_117_1.dialog_:SetActive(false)
			end

			local var_120_52 = 4
			local var_120_53 = 0.6

			if var_120_52 < arg_117_1.time_ and arg_117_1.time_ <= var_120_52 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0

				arg_117_1.dialog_:SetActive(true)

				local var_120_54 = LeanTween.value(arg_117_1.dialog_, 0, 1, 0.3)

				var_120_54:setOnUpdate(LuaHelper.FloatAction(function(arg_121_0)
					arg_117_1.dialogCg_.alpha = arg_121_0
				end))
				var_120_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_117_1.dialog_)
					var_120_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_117_1.duration_ = arg_117_1.duration_ + 0.3

				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_55 = arg_117_1:GetWordFromCfg(105071029)
				local var_120_56 = arg_117_1:FormatText(var_120_55.content)

				arg_117_1.text_.text = var_120_56

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_57 = 24
				local var_120_58 = utf8.len(var_120_56)
				local var_120_59 = var_120_57 <= 0 and var_120_53 or var_120_53 * (var_120_58 / var_120_57)

				if var_120_59 > 0 and var_120_53 < var_120_59 then
					arg_117_1.talkMaxDuration = var_120_59
					var_120_52 = var_120_52 + 0.3

					if var_120_59 + var_120_52 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_59 + var_120_52
					end
				end

				arg_117_1.text_.text = var_120_56
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_60 = var_120_52 + 0.3
			local var_120_61 = math.max(var_120_53, arg_117_1.talkMaxDuration)

			if var_120_60 <= arg_117_1.time_ and arg_117_1.time_ < var_120_60 + var_120_61 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_60) / var_120_61

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_60 + var_120_61 and arg_117_1.time_ < var_120_60 + var_120_61 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play105071030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 105071030
		arg_123_1.duration_ = 7.533

		local var_123_0 = {
			ja = 7.533,
			ko = 4.966,
			zh = 6.466,
			en = 6.266
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
				arg_123_0:Play105071031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.8

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[39].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Jolin")

				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(105071030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071030", "story_v_out_105071.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_105071", "105071030", "story_v_out_105071.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_105071", "105071030", "story_v_out_105071.awb")

						arg_123_1:RecordAudio("105071030", var_126_9)
						arg_123_1:RecordAudio("105071030", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_105071", "105071030", "story_v_out_105071.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_105071", "105071030", "story_v_out_105071.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_10 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_10 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_10

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_10 and arg_123_1.time_ < var_126_0 + var_126_10 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play105071031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 105071031
		arg_127_1.duration_ = 6

		local var_127_0 = {
			ja = 3.266,
			ko = 4.966,
			zh = 4.3,
			en = 6
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
				arg_127_0:Play105071032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.4

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[39].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Jolin")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(105071031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071031", "story_v_out_105071.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_105071", "105071031", "story_v_out_105071.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_105071", "105071031", "story_v_out_105071.awb")

						arg_127_1:RecordAudio("105071031", var_130_9)
						arg_127_1:RecordAudio("105071031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_105071", "105071031", "story_v_out_105071.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_105071", "105071031", "story_v_out_105071.awb")
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
	Play105071032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 105071032
		arg_131_1.duration_ = 12.2

		local var_131_0 = {
			ja = 12.2,
			ko = 10.4,
			zh = 11.133,
			en = 9.666
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
			arg_131_1.auto_ = false
		end

		function arg_131_1.playNext_(arg_133_0)
			arg_131_1.onStoryFinished_()
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_1 = 2

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_1 then
				local var_134_2 = (arg_131_1.time_ - var_134_0) / var_134_1
				local var_134_3 = Color.New(0, 0, 0)

				var_134_3.a = Mathf.Lerp(0, 1, var_134_2)
				arg_131_1.mask_.color = var_134_3
			end

			if arg_131_1.time_ >= var_134_0 + var_134_1 and arg_131_1.time_ < var_134_0 + var_134_1 + arg_134_0 then
				local var_134_4 = Color.New(0, 0, 0)

				var_134_4.a = 1
				arg_131_1.mask_.color = var_134_4
			end

			local var_134_5 = 2

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_6 = 2

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6
				local var_134_8 = Color.New(0, 0, 0)

				var_134_8.a = Mathf.Lerp(1, 0, var_134_7)
				arg_131_1.mask_.color = var_134_8
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 then
				local var_134_9 = Color.New(0, 0, 0)
				local var_134_10 = 0

				arg_131_1.mask_.enabled = false
				var_134_9.a = var_134_10
				arg_131_1.mask_.color = var_134_9
			end

			local var_134_11 = 2

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				local var_134_12 = manager.ui.mainCamera.transform.localPosition
				local var_134_13 = Vector3.New(0, 0, 10) + Vector3.New(var_134_12.x, var_134_12.y, 0)
				local var_134_14 = arg_131_1.bgs_.S0507

				var_134_14.transform.localPosition = var_134_13
				var_134_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_134_15 = var_134_14:GetComponent("SpriteRenderer")

				if var_134_15 and var_134_15.sprite then
					local var_134_16 = (var_134_14.transform.localPosition - var_134_12).z
					local var_134_17 = manager.ui.mainCameraCom_
					local var_134_18 = 2 * var_134_16 * Mathf.Tan(var_134_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_134_19 = var_134_18 * var_134_17.aspect
					local var_134_20 = var_134_15.sprite.bounds.size.x
					local var_134_21 = var_134_15.sprite.bounds.size.y
					local var_134_22 = var_134_19 / var_134_20
					local var_134_23 = var_134_18 / var_134_21
					local var_134_24 = var_134_23 < var_134_22 and var_134_22 or var_134_23

					var_134_14.transform.localScale = Vector3.New(var_134_24, var_134_24, 0)
				end

				for iter_134_0, iter_134_1 in pairs(arg_131_1.bgs_) do
					if iter_134_0 ~= "S0507" then
						iter_134_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_131_1.frameCnt_ <= 1 then
				arg_131_1.dialog_:SetActive(false)
			end

			local var_134_25 = 4
			local var_134_26 = 0.85

			if var_134_25 < arg_131_1.time_ and arg_131_1.time_ <= var_134_25 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				arg_131_1.dialog_:SetActive(true)

				local var_134_27 = LeanTween.value(arg_131_1.dialog_, 0, 1, 0.3)

				var_134_27:setOnUpdate(LuaHelper.FloatAction(function(arg_135_0)
					arg_131_1.dialogCg_.alpha = arg_135_0
				end))
				var_134_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_131_1.dialog_)
					var_134_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_131_1.duration_ = arg_131_1.duration_ + 0.3

				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_28 = arg_131_1:FormatText(StoryNameCfg[35].name)

				arg_131_1.leftNameTxt_.text = var_134_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_29 = arg_131_1:GetWordFromCfg(105071032)
				local var_134_30 = arg_131_1:FormatText(var_134_29.content)

				arg_131_1.text_.text = var_134_30

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_31 = 33
				local var_134_32 = utf8.len(var_134_30)
				local var_134_33 = var_134_31 <= 0 and var_134_26 or var_134_26 * (var_134_32 / var_134_31)

				if var_134_33 > 0 and var_134_26 < var_134_33 then
					arg_131_1.talkMaxDuration = var_134_33
					var_134_25 = var_134_25 + 0.3

					if var_134_33 + var_134_25 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_33 + var_134_25
					end
				end

				arg_131_1.text_.text = var_134_30
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105071", "105071032", "story_v_out_105071.awb") ~= 0 then
					local var_134_34 = manager.audio:GetVoiceLength("story_v_out_105071", "105071032", "story_v_out_105071.awb") / 1000

					if var_134_34 + var_134_25 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_34 + var_134_25
					end

					if var_134_29.prefab_name ~= "" and arg_131_1.actors_[var_134_29.prefab_name] ~= nil then
						local var_134_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_29.prefab_name].transform, "story_v_out_105071", "105071032", "story_v_out_105071.awb")

						arg_131_1:RecordAudio("105071032", var_134_35)
						arg_131_1:RecordAudio("105071032", var_134_35)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_105071", "105071032", "story_v_out_105071.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_105071", "105071032", "story_v_out_105071.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_36 = var_134_25 + 0.3
			local var_134_37 = math.max(var_134_26, arg_131_1.talkMaxDuration)

			if var_134_36 <= arg_131_1.time_ and arg_131_1.time_ < var_134_36 + var_134_37 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_36) / var_134_37

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_36 + var_134_37 and arg_131_1.time_ < var_134_36 + var_134_37 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B01c",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B03f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0507"
	},
	voices = {
		"story_v_out_105071.awb"
	}
}
