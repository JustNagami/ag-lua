return {
	Play102101001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 102101001
		arg_1_1.duration_ = 6.566

		local var_1_0 = {
			ja = 5.133,
			ko = 5.833,
			zh = 6.566,
			en = 5.766
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
				arg_1_0:Play102101002(arg_1_1)
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

			local var_4_4 = "1019ui_story"

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

			local var_4_8 = arg_1_1.actors_["1019ui_story"]
			local var_4_9 = 2

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 and arg_1_1.var_.characterEffect1019ui_story == nil then
				arg_1_1.var_.characterEffect1019ui_story = var_4_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_10 = 0.1

			if var_4_9 <= arg_1_1.time_ and arg_1_1.time_ < var_4_9 + var_4_10 then
				local var_4_11 = (arg_1_1.time_ - var_4_9) / var_4_10

				if arg_1_1.var_.characterEffect1019ui_story then
					arg_1_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_9 + var_4_10 and arg_1_1.time_ < var_4_9 + var_4_10 + arg_4_0 and arg_1_1.var_.characterEffect1019ui_story then
				arg_1_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_4_12 = "B02c"

			if arg_1_1.bgs_[var_4_12] == nil then
				local var_4_13 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_12)
				var_4_13.name = var_4_12
				var_4_13.transform.parent = arg_1_1.stage_.transform
				var_4_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_12] = var_4_13
			end

			local var_4_14 = arg_1_1.bgs_.B02c
			local var_4_15 = 0

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				local var_4_16 = var_4_14:GetComponent("SpriteRenderer")

				if var_4_16 then
					var_4_16.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_17 = var_4_16.material
					local var_4_18 = var_4_17:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB02c = var_4_18.a
					arg_1_1.var_.alphaMatValueB02c = var_4_17
				end

				arg_1_1.var_.alphaOldValueB02c = 0
			end

			local var_4_19 = 1.5

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_15) / var_4_19
				local var_4_21 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB02c, 1, var_4_20)

				if arg_1_1.var_.alphaMatValueB02c then
					local var_4_22 = arg_1_1.var_.alphaMatValueB02c
					local var_4_23 = var_4_22:GetColor("_Color")

					var_4_23.a = var_4_21

					var_4_22:SetColor("_Color", var_4_23)
				end
			end

			if arg_1_1.time_ >= var_4_15 + var_4_19 and arg_1_1.time_ < var_4_15 + var_4_19 + arg_4_0 and arg_1_1.var_.alphaMatValueB02c then
				local var_4_24 = arg_1_1.var_.alphaMatValueB02c
				local var_4_25 = var_4_24:GetColor("_Color")

				var_4_25.a = 1

				var_4_24:SetColor("_Color", var_4_25)
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_27 = manager.ui.mainCamera.transform.localPosition
				local var_4_28 = Vector3.New(0, 0, 10) + Vector3.New(var_4_27.x, var_4_27.y, 0)
				local var_4_29 = arg_1_1.bgs_.B02c

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
					if iter_4_0 ~= "B02c" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_40 = arg_1_1.actors_["1019ui_story"].transform
			local var_4_41 = 1.79999995231628

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1.var_.moveOldPos1019ui_story = var_4_40.localPosition
			end

			local var_4_42 = 0.001

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42
				local var_4_44 = Vector3.New(-0.7, -1.08, -5.9)

				var_4_40.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1019ui_story, var_4_44, var_4_43)

				local var_4_45 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_45.x, var_4_45.y, var_4_45.z)

				local var_4_46 = var_4_40.localEulerAngles

				var_4_46.z = 0
				var_4_46.x = 0
				var_4_40.localEulerAngles = var_4_46
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				var_4_40.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_4_47 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_47.x, var_4_47.y, var_4_47.z)

				local var_4_48 = var_4_40.localEulerAngles

				var_4_48.z = 0
				var_4_48.x = 0
				var_4_40.localEulerAngles = var_4_48
			end

			local var_4_49 = 1.79999995231628

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
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
				arg_1_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2
			local var_4_54 = 0.5

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

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[13].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(102101001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101001", "story_v_out_102101.awb") ~= 0 then
					local var_4_62 = manager.audio:GetVoiceLength("story_v_out_102101", "102101001", "story_v_out_102101.awb") / 1000

					if var_4_62 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_53
					end

					if var_4_57.prefab_name ~= "" and arg_1_1.actors_[var_4_57.prefab_name] ~= nil then
						local var_4_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_57.prefab_name].transform, "story_v_out_102101", "102101001", "story_v_out_102101.awb")

						arg_1_1:RecordAudio("102101001", var_4_63)
						arg_1_1:RecordAudio("102101001", var_4_63)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_102101", "102101001", "story_v_out_102101.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_102101", "102101001", "story_v_out_102101.awb")
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
	Play102101002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 102101002
		arg_7_1.duration_ = 5.6

		local var_7_0 = {
			ja = 4.4,
			ko = 4.9,
			zh = 5.6,
			en = 4.233
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
				arg_7_0:Play102101003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "effect"

				arg_7_1:AudioAction(var_10_2, var_10_3, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
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

			local var_10_12 = arg_7_1.actors_["1019ui_story"]
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story == nil then
				arg_7_1.var_.characterEffect1019ui_story = var_10_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_14 = 0.1

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14

				if arg_7_1.var_.characterEffect1019ui_story then
					local var_10_16 = Mathf.Lerp(0, 0.5, var_10_15)

					arg_7_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1019ui_story.fillRatio = var_10_16
				end
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story then
				local var_10_17 = 0.5

				arg_7_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1019ui_story.fillRatio = var_10_17
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
				arg_7_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_10_28 = 0

			if var_10_28 < arg_7_1.time_ and arg_7_1.time_ <= var_10_28 + arg_10_0 then
				arg_7_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_29 = 0
			local var_10_30 = 0.45

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

				local var_10_32 = arg_7_1:GetWordFromCfg(102101002)
				local var_10_33 = arg_7_1:FormatText(var_10_32.content)

				arg_7_1.text_.text = var_10_33

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_34 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101002", "story_v_out_102101.awb") ~= 0 then
					local var_10_37 = manager.audio:GetVoiceLength("story_v_out_102101", "102101002", "story_v_out_102101.awb") / 1000

					if var_10_37 + var_10_29 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_37 + var_10_29
					end

					if var_10_32.prefab_name ~= "" and arg_7_1.actors_[var_10_32.prefab_name] ~= nil then
						local var_10_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_32.prefab_name].transform, "story_v_out_102101", "102101002", "story_v_out_102101.awb")

						arg_7_1:RecordAudio("102101002", var_10_38)
						arg_7_1:RecordAudio("102101002", var_10_38)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_102101", "102101002", "story_v_out_102101.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_102101", "102101002", "story_v_out_102101.awb")
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
	Play102101003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 102101003
		arg_11_1.duration_ = 9.533

		local var_11_0 = {
			ja = 8.3,
			ko = 6.033,
			zh = 6.166,
			en = 9.533
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
				arg_11_0:Play102101004(arg_11_1)
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

			local var_14_8 = arg_11_1.actors_["10002_tpose"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect10002_tpose == nil then
				arg_11_1.var_.characterEffect10002_tpose = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect10002_tpose then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_11_1.var_.characterEffect10002_tpose.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect10002_tpose then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_11_1.var_.characterEffect10002_tpose.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["1019ui_story"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos1019ui_story = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0, 100, 0)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1019ui_story, var_14_18, var_14_17)

				local var_14_19 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_19.x, var_14_19.y, var_14_19.z)

				local var_14_20 = var_14_14.localEulerAngles

				var_14_20.z = 0
				var_14_20.x = 0
				var_14_14.localEulerAngles = var_14_20
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 then
				var_14_14.localPosition = Vector3.New(0, 100, 0)

				local var_14_21 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_21.x, var_14_21.y, var_14_21.z)

				local var_14_22 = var_14_14.localEulerAngles

				var_14_22.z = 0
				var_14_22.x = 0
				var_14_14.localEulerAngles = var_14_22
			end

			local var_14_23 = arg_11_1.actors_["1011ui_story"].transform
			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.var_.moveOldPos1011ui_story = var_14_23.localPosition
			end

			local var_14_25 = 0.001

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_25 then
				local var_14_26 = (arg_11_1.time_ - var_14_24) / var_14_25
				local var_14_27 = Vector3.New(-0.7, -0.71, -6)

				var_14_23.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1011ui_story, var_14_27, var_14_26)

				local var_14_28 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_28.x, var_14_28.y, var_14_28.z)

				local var_14_29 = var_14_23.localEulerAngles

				var_14_29.z = 0
				var_14_29.x = 0
				var_14_23.localEulerAngles = var_14_29
			end

			if arg_11_1.time_ >= var_14_24 + var_14_25 and arg_11_1.time_ < var_14_24 + var_14_25 + arg_14_0 then
				var_14_23.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_14_30 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_30.x, var_14_30.y, var_14_30.z)

				local var_14_31 = var_14_23.localEulerAngles

				var_14_31.z = 0
				var_14_31.x = 0
				var_14_23.localEulerAngles = var_14_31
			end

			local var_14_32 = 0

			if var_14_32 < arg_11_1.time_ and arg_11_1.time_ <= var_14_32 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_14_33 = 0

			if var_14_33 < arg_11_1.time_ and arg_11_1.time_ <= var_14_33 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_14_34 = 0
			local var_14_35 = 0.675

			if var_14_34 < arg_11_1.time_ and arg_11_1.time_ <= var_14_34 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_36 = arg_11_1:FormatText(StoryNameCfg[37].name)

				arg_11_1.leftNameTxt_.text = var_14_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_37 = arg_11_1:GetWordFromCfg(102101003)
				local var_14_38 = arg_11_1:FormatText(var_14_37.content)

				arg_11_1.text_.text = var_14_38

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_39 = 27
				local var_14_40 = utf8.len(var_14_38)
				local var_14_41 = var_14_39 <= 0 and var_14_35 or var_14_35 * (var_14_40 / var_14_39)

				if var_14_41 > 0 and var_14_35 < var_14_41 then
					arg_11_1.talkMaxDuration = var_14_41

					if var_14_41 + var_14_34 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_41 + var_14_34
					end
				end

				arg_11_1.text_.text = var_14_38
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101003", "story_v_out_102101.awb") ~= 0 then
					local var_14_42 = manager.audio:GetVoiceLength("story_v_out_102101", "102101003", "story_v_out_102101.awb") / 1000

					if var_14_42 + var_14_34 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_42 + var_14_34
					end

					if var_14_37.prefab_name ~= "" and arg_11_1.actors_[var_14_37.prefab_name] ~= nil then
						local var_14_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_37.prefab_name].transform, "story_v_out_102101", "102101003", "story_v_out_102101.awb")

						arg_11_1:RecordAudio("102101003", var_14_43)
						arg_11_1:RecordAudio("102101003", var_14_43)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_102101", "102101003", "story_v_out_102101.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_102101", "102101003", "story_v_out_102101.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_44 = math.max(var_14_35, arg_11_1.talkMaxDuration)

			if var_14_34 <= arg_11_1.time_ and arg_11_1.time_ < var_14_34 + var_14_44 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_34) / var_14_44

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_34 + var_14_44 and arg_11_1.time_ < var_14_34 + var_14_44 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play102101004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 102101004
		arg_15_1.duration_ = 7.566

		local var_15_0 = {
			ja = 7.566,
			ko = 5.366,
			zh = 4.7,
			en = 4.666
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
				arg_15_0:Play102101005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10002_tpose"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect10002_tpose == nil then
				arg_15_1.var_.characterEffect10002_tpose = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect10002_tpose then
					arg_15_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect10002_tpose then
				arg_15_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_18_4 = arg_15_1.actors_["1011ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story == nil then
				arg_15_1.var_.characterEffect1011ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1011ui_story then
					local var_18_8 = Mathf.Lerp(0, 0.5, var_18_7)

					arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_8
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story then
				local var_18_9 = 0.5

				arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_9
			end

			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_18_11 = 0

			if var_18_11 < arg_15_1.time_ and arg_15_1.time_ <= var_18_11 + arg_18_0 then
				arg_15_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_12 = 0
			local var_18_13 = 0.475

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_14 = arg_15_1:FormatText(StoryNameCfg[39].name)

				arg_15_1.leftNameTxt_.text = var_18_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_15 = arg_15_1:GetWordFromCfg(102101004)
				local var_18_16 = arg_15_1:FormatText(var_18_15.content)

				arg_15_1.text_.text = var_18_16

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_17 = 19
				local var_18_18 = utf8.len(var_18_16)
				local var_18_19 = var_18_17 <= 0 and var_18_13 or var_18_13 * (var_18_18 / var_18_17)

				if var_18_19 > 0 and var_18_13 < var_18_19 then
					arg_15_1.talkMaxDuration = var_18_19

					if var_18_19 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_19 + var_18_12
					end
				end

				arg_15_1.text_.text = var_18_16
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101004", "story_v_out_102101.awb") ~= 0 then
					local var_18_20 = manager.audio:GetVoiceLength("story_v_out_102101", "102101004", "story_v_out_102101.awb") / 1000

					if var_18_20 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_12
					end

					if var_18_15.prefab_name ~= "" and arg_15_1.actors_[var_18_15.prefab_name] ~= nil then
						local var_18_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_15.prefab_name].transform, "story_v_out_102101", "102101004", "story_v_out_102101.awb")

						arg_15_1:RecordAudio("102101004", var_18_21)
						arg_15_1:RecordAudio("102101004", var_18_21)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_102101", "102101004", "story_v_out_102101.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_102101", "102101004", "story_v_out_102101.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_13, arg_15_1.talkMaxDuration)

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_12) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_12 + var_18_22 and arg_15_1.time_ < var_18_12 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play102101005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 102101005
		arg_19_1.duration_ = 18.066

		local var_19_0 = {
			ja = 14.2,
			ko = 18.066,
			zh = 12.966,
			en = 15.4
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
				arg_19_0:Play102101006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_1 = 0
			local var_22_2 = 1.125

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_3 = arg_19_1:FormatText(StoryNameCfg[39].name)

				arg_19_1.leftNameTxt_.text = var_22_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_4 = arg_19_1:GetWordFromCfg(102101005)
				local var_22_5 = arg_19_1:FormatText(var_22_4.content)

				arg_19_1.text_.text = var_22_5

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_6 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101005", "story_v_out_102101.awb") ~= 0 then
					local var_22_9 = manager.audio:GetVoiceLength("story_v_out_102101", "102101005", "story_v_out_102101.awb") / 1000

					if var_22_9 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_1
					end

					if var_22_4.prefab_name ~= "" and arg_19_1.actors_[var_22_4.prefab_name] ~= nil then
						local var_22_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_4.prefab_name].transform, "story_v_out_102101", "102101005", "story_v_out_102101.awb")

						arg_19_1:RecordAudio("102101005", var_22_10)
						arg_19_1:RecordAudio("102101005", var_22_10)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_102101", "102101005", "story_v_out_102101.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_102101", "102101005", "story_v_out_102101.awb")
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
	Play102101006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 102101006
		arg_23_1.duration_ = 16.633

		local var_23_0 = {
			ja = 16.366,
			ko = 16.633,
			zh = 11.9,
			en = 15.733
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
				arg_23_0:Play102101007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_26_1 = 0
			local var_26_2 = 1.35

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_3 = arg_23_1:FormatText(StoryNameCfg[39].name)

				arg_23_1.leftNameTxt_.text = var_26_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_4 = arg_23_1:GetWordFromCfg(102101006)
				local var_26_5 = arg_23_1:FormatText(var_26_4.content)

				arg_23_1.text_.text = var_26_5

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_6 = 54
				local var_26_7 = utf8.len(var_26_5)
				local var_26_8 = var_26_6 <= 0 and var_26_2 or var_26_2 * (var_26_7 / var_26_6)

				if var_26_8 > 0 and var_26_2 < var_26_8 then
					arg_23_1.talkMaxDuration = var_26_8

					if var_26_8 + var_26_1 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_1
					end
				end

				arg_23_1.text_.text = var_26_5
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101006", "story_v_out_102101.awb") ~= 0 then
					local var_26_9 = manager.audio:GetVoiceLength("story_v_out_102101", "102101006", "story_v_out_102101.awb") / 1000

					if var_26_9 + var_26_1 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_9 + var_26_1
					end

					if var_26_4.prefab_name ~= "" and arg_23_1.actors_[var_26_4.prefab_name] ~= nil then
						local var_26_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_4.prefab_name].transform, "story_v_out_102101", "102101006", "story_v_out_102101.awb")

						arg_23_1:RecordAudio("102101006", var_26_10)
						arg_23_1:RecordAudio("102101006", var_26_10)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_102101", "102101006", "story_v_out_102101.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_102101", "102101006", "story_v_out_102101.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_11 = math.max(var_26_2, arg_23_1.talkMaxDuration)

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_11 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_1) / var_26_11

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_1 + var_26_11 and arg_23_1.time_ < var_26_1 + var_26_11 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play102101007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 102101007
		arg_27_1.duration_ = 5.466

		local var_27_0 = {
			ja = 5.466,
			ko = 4.233,
			zh = 3.133,
			en = 5.133
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
				arg_27_0:Play102101008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1011ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1011ui_story == nil then
				arg_27_1.var_.characterEffect1011ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1011ui_story then
					arg_27_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1011ui_story then
				arg_27_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_30_5 = 0
			local var_30_6 = 0.375

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_7 = arg_27_1:FormatText(StoryNameCfg[37].name)

				arg_27_1.leftNameTxt_.text = var_30_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(102101007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 15
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_6 or var_30_6 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_6 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_5 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_5
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101007", "story_v_out_102101.awb") ~= 0 then
					local var_30_13 = manager.audio:GetVoiceLength("story_v_out_102101", "102101007", "story_v_out_102101.awb") / 1000

					if var_30_13 + var_30_5 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_13 + var_30_5
					end

					if var_30_8.prefab_name ~= "" and arg_27_1.actors_[var_30_8.prefab_name] ~= nil then
						local var_30_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_8.prefab_name].transform, "story_v_out_102101", "102101007", "story_v_out_102101.awb")

						arg_27_1:RecordAudio("102101007", var_30_14)
						arg_27_1:RecordAudio("102101007", var_30_14)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_102101", "102101007", "story_v_out_102101.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_102101", "102101007", "story_v_out_102101.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_15 = math.max(var_30_6, arg_27_1.talkMaxDuration)

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_15 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_5) / var_30_15

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_5 + var_30_15 and arg_27_1.time_ < var_30_5 + var_30_15 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play102101008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 102101008
		arg_31_1.duration_ = 6.566

		local var_31_0 = {
			ja = 6.566,
			ko = 4.966,
			zh = 3.866,
			en = 5
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
				arg_31_0:Play102101009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10002_tpose"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10002_tpose == nil then
				arg_31_1.var_.characterEffect10002_tpose = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10002_tpose then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_31_1.var_.characterEffect10002_tpose.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10002_tpose then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_31_1.var_.characterEffect10002_tpose.fillRatio = var_34_5
			end

			local var_34_6 = arg_31_1.actors_["1019ui_story"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story == nil then
				arg_31_1.var_.characterEffect1019ui_story = var_34_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_8 = 0.1

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8

				if arg_31_1.var_.characterEffect1019ui_story then
					arg_31_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story then
				arg_31_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_34_11 = arg_31_1.actors_["1011ui_story"].transform
			local var_34_12 = 0

			if var_34_12 < arg_31_1.time_ and arg_31_1.time_ <= var_34_12 + arg_34_0 then
				arg_31_1.var_.moveOldPos1011ui_story = var_34_11.localPosition
			end

			local var_34_13 = 0.001

			if var_34_12 <= arg_31_1.time_ and arg_31_1.time_ < var_34_12 + var_34_13 then
				local var_34_14 = (arg_31_1.time_ - var_34_12) / var_34_13
				local var_34_15 = Vector3.New(0, 100, 0)

				var_34_11.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1011ui_story, var_34_15, var_34_14)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_11.position

				var_34_11.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_11.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_11.localEulerAngles = var_34_17
			end

			if arg_31_1.time_ >= var_34_12 + var_34_13 and arg_31_1.time_ < var_34_12 + var_34_13 + arg_34_0 then
				var_34_11.localPosition = Vector3.New(0, 100, 0)

				local var_34_18 = manager.ui.mainCamera.transform.position - var_34_11.position

				var_34_11.forward = Vector3.New(var_34_18.x, var_34_18.y, var_34_18.z)

				local var_34_19 = var_34_11.localEulerAngles

				var_34_19.z = 0
				var_34_19.x = 0
				var_34_11.localEulerAngles = var_34_19
			end

			local var_34_20 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_21 = 0

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_20.localPosition
			end

			local var_34_22 = 0.001

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22
				local var_34_24 = Vector3.New(-0.7, -1.08, -5.9)

				var_34_20.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_24, var_34_23)

				local var_34_25 = manager.ui.mainCamera.transform.position - var_34_20.position

				var_34_20.forward = Vector3.New(var_34_25.x, var_34_25.y, var_34_25.z)

				local var_34_26 = var_34_20.localEulerAngles

				var_34_26.z = 0
				var_34_26.x = 0
				var_34_20.localEulerAngles = var_34_26
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 then
				var_34_20.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_34_27 = manager.ui.mainCamera.transform.position - var_34_20.position

				var_34_20.forward = Vector3.New(var_34_27.x, var_34_27.y, var_34_27.z)

				local var_34_28 = var_34_20.localEulerAngles

				var_34_28.z = 0
				var_34_28.x = 0
				var_34_20.localEulerAngles = var_34_28
			end

			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_34_30 = 0
			local var_34_31 = 0.475

			if var_34_30 < arg_31_1.time_ and arg_31_1.time_ <= var_34_30 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_32 = arg_31_1:FormatText(StoryNameCfg[13].name)

				arg_31_1.leftNameTxt_.text = var_34_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_33 = arg_31_1:GetWordFromCfg(102101008)
				local var_34_34 = arg_31_1:FormatText(var_34_33.content)

				arg_31_1.text_.text = var_34_34

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_35 = 19
				local var_34_36 = utf8.len(var_34_34)
				local var_34_37 = var_34_35 <= 0 and var_34_31 or var_34_31 * (var_34_36 / var_34_35)

				if var_34_37 > 0 and var_34_31 < var_34_37 then
					arg_31_1.talkMaxDuration = var_34_37

					if var_34_37 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_30
					end
				end

				arg_31_1.text_.text = var_34_34
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101008", "story_v_out_102101.awb") ~= 0 then
					local var_34_38 = manager.audio:GetVoiceLength("story_v_out_102101", "102101008", "story_v_out_102101.awb") / 1000

					if var_34_38 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_38 + var_34_30
					end

					if var_34_33.prefab_name ~= "" and arg_31_1.actors_[var_34_33.prefab_name] ~= nil then
						local var_34_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_33.prefab_name].transform, "story_v_out_102101", "102101008", "story_v_out_102101.awb")

						arg_31_1:RecordAudio("102101008", var_34_39)
						arg_31_1:RecordAudio("102101008", var_34_39)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_102101", "102101008", "story_v_out_102101.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_102101", "102101008", "story_v_out_102101.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_40 = math.max(var_34_31, arg_31_1.talkMaxDuration)

			if var_34_30 <= arg_31_1.time_ and arg_31_1.time_ < var_34_30 + var_34_40 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_30) / var_34_40

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_30 + var_34_40 and arg_31_1.time_ < var_34_30 + var_34_40 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play102101009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 102101009
		arg_35_1.duration_ = 20.733

		local var_35_0 = {
			ja = 20.733,
			ko = 11.566,
			zh = 11.066,
			en = 12.166
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
				arg_35_0:Play102101010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_38_1 = 0
			local var_38_2 = 1.15

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_3 = arg_35_1:FormatText(StoryNameCfg[39].name)

				arg_35_1.leftNameTxt_.text = var_38_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_4 = arg_35_1:GetWordFromCfg(102101009)
				local var_38_5 = arg_35_1:FormatText(var_38_4.content)

				arg_35_1.text_.text = var_38_5

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_6 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101009", "story_v_out_102101.awb") ~= 0 then
					local var_38_9 = manager.audio:GetVoiceLength("story_v_out_102101", "102101009", "story_v_out_102101.awb") / 1000

					if var_38_9 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_9 + var_38_1
					end

					if var_38_4.prefab_name ~= "" and arg_35_1.actors_[var_38_4.prefab_name] ~= nil then
						local var_38_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_4.prefab_name].transform, "story_v_out_102101", "102101009", "story_v_out_102101.awb")

						arg_35_1:RecordAudio("102101009", var_38_10)
						arg_35_1:RecordAudio("102101009", var_38_10)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_102101", "102101009", "story_v_out_102101.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_102101", "102101009", "story_v_out_102101.awb")
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
	Play102101010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 102101010
		arg_39_1.duration_ = 3.4

		local var_39_0 = {
			ja = 2.533,
			ko = 3.4,
			zh = 2.766,
			en = 2
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
				arg_39_0:Play102101011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = "1084ui_story"

			if arg_39_1.actors_[var_42_0] == nil then
				local var_42_1 = Object.Instantiate(Asset.Load("Char/" .. var_42_0), arg_39_1.stage_.transform)

				var_42_1.name = var_42_0
				var_42_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_39_1.actors_[var_42_0] = var_42_1

				local var_42_2 = var_42_1:GetComponentInChildren(typeof(CharacterEffect))

				var_42_2.enabled = true

				local var_42_3 = GameObjectTools.GetOrAddComponent(var_42_1, typeof(DynamicBoneHelper))

				if var_42_3 then
					var_42_3:EnableDynamicBone(false)
				end

				arg_39_1:ShowWeapon(var_42_2.transform, false)

				arg_39_1.var_[var_42_0 .. "Animator"] = var_42_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_39_1.var_[var_42_0 .. "Animator"].applyRootMotion = true
				arg_39_1.var_[var_42_0 .. "LipSync"] = var_42_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
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
					arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_42_8 = arg_39_1.actors_["10002_tpose"]
			local var_42_9 = 0

			if var_42_9 < arg_39_1.time_ and arg_39_1.time_ <= var_42_9 + arg_42_0 and arg_39_1.var_.characterEffect10002_tpose == nil then
				arg_39_1.var_.characterEffect10002_tpose = var_42_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_10 = 0.1

			if var_42_9 <= arg_39_1.time_ and arg_39_1.time_ < var_42_9 + var_42_10 then
				local var_42_11 = (arg_39_1.time_ - var_42_9) / var_42_10

				if arg_39_1.var_.characterEffect10002_tpose then
					local var_42_12 = Mathf.Lerp(0, 0.5, var_42_11)

					arg_39_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_39_1.var_.characterEffect10002_tpose.fillRatio = var_42_12
				end
			end

			if arg_39_1.time_ >= var_42_9 + var_42_10 and arg_39_1.time_ < var_42_9 + var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect10002_tpose then
				local var_42_13 = 0.5

				arg_39_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_39_1.var_.characterEffect10002_tpose.fillRatio = var_42_13
			end

			local var_42_14 = arg_39_1.actors_["10002_tpose"].transform
			local var_42_15 = 0

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 then
				arg_39_1.var_.moveOldPos10002_tpose = var_42_14.localPosition
			end

			local var_42_16 = 0.001

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_15) / var_42_16
				local var_42_18 = Vector3.New(0, 100, 0)

				var_42_14.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10002_tpose, var_42_18, var_42_17)

				local var_42_19 = manager.ui.mainCamera.transform.position - var_42_14.position

				var_42_14.forward = Vector3.New(var_42_19.x, var_42_19.y, var_42_19.z)

				local var_42_20 = var_42_14.localEulerAngles

				var_42_20.z = 0
				var_42_20.x = 0
				var_42_14.localEulerAngles = var_42_20
			end

			if arg_39_1.time_ >= var_42_15 + var_42_16 and arg_39_1.time_ < var_42_15 + var_42_16 + arg_42_0 then
				var_42_14.localPosition = Vector3.New(0, 100, 0)

				local var_42_21 = manager.ui.mainCamera.transform.position - var_42_14.position

				var_42_14.forward = Vector3.New(var_42_21.x, var_42_21.y, var_42_21.z)

				local var_42_22 = var_42_14.localEulerAngles

				var_42_22.z = 0
				var_42_22.x = 0
				var_42_14.localEulerAngles = var_42_22
			end

			local var_42_23 = 0

			if var_42_23 < arg_39_1.time_ and arg_39_1.time_ <= var_42_23 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_42_24 = arg_39_1.actors_["1084ui_story"].transform
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 then
				arg_39_1.var_.moveOldPos1084ui_story = var_42_24.localPosition
			end

			local var_42_26 = 0.001

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26
				local var_42_28 = Vector3.New(0.7, -0.97, -6)

				var_42_24.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1084ui_story, var_42_28, var_42_27)

				local var_42_29 = manager.ui.mainCamera.transform.position - var_42_24.position

				var_42_24.forward = Vector3.New(var_42_29.x, var_42_29.y, var_42_29.z)

				local var_42_30 = var_42_24.localEulerAngles

				var_42_30.z = 0
				var_42_30.x = 0
				var_42_24.localEulerAngles = var_42_30
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 then
				var_42_24.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_42_31 = manager.ui.mainCamera.transform.position - var_42_24.position

				var_42_24.forward = Vector3.New(var_42_31.x, var_42_31.y, var_42_31.z)

				local var_42_32 = var_42_24.localEulerAngles

				var_42_32.z = 0
				var_42_32.x = 0
				var_42_24.localEulerAngles = var_42_32
			end

			local var_42_33 = 0

			if var_42_33 < arg_39_1.time_ and arg_39_1.time_ <= var_42_33 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_42_34 = 0
			local var_42_35 = 0.25

			if var_42_34 < arg_39_1.time_ and arg_39_1.time_ <= var_42_34 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_36 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_37 = arg_39_1:GetWordFromCfg(102101010)
				local var_42_38 = arg_39_1:FormatText(var_42_37.content)

				arg_39_1.text_.text = var_42_38

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_39 = 10
				local var_42_40 = utf8.len(var_42_38)
				local var_42_41 = var_42_39 <= 0 and var_42_35 or var_42_35 * (var_42_40 / var_42_39)

				if var_42_41 > 0 and var_42_35 < var_42_41 then
					arg_39_1.talkMaxDuration = var_42_41

					if var_42_41 + var_42_34 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_41 + var_42_34
					end
				end

				arg_39_1.text_.text = var_42_38
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101010", "story_v_out_102101.awb") ~= 0 then
					local var_42_42 = manager.audio:GetVoiceLength("story_v_out_102101", "102101010", "story_v_out_102101.awb") / 1000

					if var_42_42 + var_42_34 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_42 + var_42_34
					end

					if var_42_37.prefab_name ~= "" and arg_39_1.actors_[var_42_37.prefab_name] ~= nil then
						local var_42_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_37.prefab_name].transform, "story_v_out_102101", "102101010", "story_v_out_102101.awb")

						arg_39_1:RecordAudio("102101010", var_42_43)
						arg_39_1:RecordAudio("102101010", var_42_43)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_102101", "102101010", "story_v_out_102101.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_102101", "102101010", "story_v_out_102101.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_44 = math.max(var_42_35, arg_39_1.talkMaxDuration)

			if var_42_34 <= arg_39_1.time_ and arg_39_1.time_ < var_42_34 + var_42_44 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_34) / var_42_44

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_34 + var_42_44 and arg_39_1.time_ < var_42_34 + var_42_44 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play102101011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 102101011
		arg_43_1.duration_ = 8.633

		local var_43_0 = {
			ja = 7.4,
			ko = 6.2,
			zh = 6.266,
			en = 8.633
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
				arg_43_0:Play102101012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1019ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1019ui_story == nil then
				arg_43_1.var_.characterEffect1019ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1019ui_story then
					arg_43_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1019ui_story then
				arg_43_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1084ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1084ui_story then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_9
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_46_12 = 0
			local var_46_13 = 0.825

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_14 = arg_43_1:FormatText(StoryNameCfg[13].name)

				arg_43_1.leftNameTxt_.text = var_46_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_15 = arg_43_1:GetWordFromCfg(102101011)
				local var_46_16 = arg_43_1:FormatText(var_46_15.content)

				arg_43_1.text_.text = var_46_16

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_17 = 34
				local var_46_18 = utf8.len(var_46_16)
				local var_46_19 = var_46_17 <= 0 and var_46_13 or var_46_13 * (var_46_18 / var_46_17)

				if var_46_19 > 0 and var_46_13 < var_46_19 then
					arg_43_1.talkMaxDuration = var_46_19

					if var_46_19 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_12
					end
				end

				arg_43_1.text_.text = var_46_16
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101011", "story_v_out_102101.awb") ~= 0 then
					local var_46_20 = manager.audio:GetVoiceLength("story_v_out_102101", "102101011", "story_v_out_102101.awb") / 1000

					if var_46_20 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_12
					end

					if var_46_15.prefab_name ~= "" and arg_43_1.actors_[var_46_15.prefab_name] ~= nil then
						local var_46_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_15.prefab_name].transform, "story_v_out_102101", "102101011", "story_v_out_102101.awb")

						arg_43_1:RecordAudio("102101011", var_46_21)
						arg_43_1:RecordAudio("102101011", var_46_21)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_102101", "102101011", "story_v_out_102101.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_102101", "102101011", "story_v_out_102101.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_13, arg_43_1.talkMaxDuration)

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_12) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_12 + var_46_22 and arg_43_1.time_ < var_46_12 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play102101012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 102101012
		arg_47_1.duration_ = 9

		local var_47_0 = {
			ja = 9,
			ko = 3.633,
			zh = 3.833,
			en = 3.566
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
				arg_47_0:Play102101013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1011ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1011ui_story == nil then
				arg_47_1.var_.characterEffect1011ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1011ui_story then
					arg_47_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1011ui_story then
				arg_47_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1019ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect1019ui_story == nil then
				arg_47_1.var_.characterEffect1019ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.1

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect1019ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1019ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect1019ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1019ui_story.fillRatio = var_50_9
			end

			local var_50_10 = arg_47_1.actors_["1084ui_story"].transform
			local var_50_11 = 0

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1.var_.moveOldPos1084ui_story = var_50_10.localPosition
			end

			local var_50_12 = 0.001

			if var_50_11 <= arg_47_1.time_ and arg_47_1.time_ < var_50_11 + var_50_12 then
				local var_50_13 = (arg_47_1.time_ - var_50_11) / var_50_12
				local var_50_14 = Vector3.New(0, 100, 0)

				var_50_10.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1084ui_story, var_50_14, var_50_13)

				local var_50_15 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_15.x, var_50_15.y, var_50_15.z)

				local var_50_16 = var_50_10.localEulerAngles

				var_50_16.z = 0
				var_50_16.x = 0
				var_50_10.localEulerAngles = var_50_16
			end

			if arg_47_1.time_ >= var_50_11 + var_50_12 and arg_47_1.time_ < var_50_11 + var_50_12 + arg_50_0 then
				var_50_10.localPosition = Vector3.New(0, 100, 0)

				local var_50_17 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_17.x, var_50_17.y, var_50_17.z)

				local var_50_18 = var_50_10.localEulerAngles

				var_50_18.z = 0
				var_50_18.x = 0
				var_50_10.localEulerAngles = var_50_18
			end

			local var_50_19 = arg_47_1.actors_["1011ui_story"].transform
			local var_50_20 = 0

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.var_.moveOldPos1011ui_story = var_50_19.localPosition
			end

			local var_50_21 = 0.001

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_21 then
				local var_50_22 = (arg_47_1.time_ - var_50_20) / var_50_21
				local var_50_23 = Vector3.New(0.7, -0.71, -6)

				var_50_19.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1011ui_story, var_50_23, var_50_22)

				local var_50_24 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_24.x, var_50_24.y, var_50_24.z)

				local var_50_25 = var_50_19.localEulerAngles

				var_50_25.z = 0
				var_50_25.x = 0
				var_50_19.localEulerAngles = var_50_25
			end

			if arg_47_1.time_ >= var_50_20 + var_50_21 and arg_47_1.time_ < var_50_20 + var_50_21 + arg_50_0 then
				var_50_19.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_50_26 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_26.x, var_50_26.y, var_50_26.z)

				local var_50_27 = var_50_19.localEulerAngles

				var_50_27.z = 0
				var_50_27.x = 0
				var_50_19.localEulerAngles = var_50_27
			end

			local var_50_28 = 0

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				arg_47_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_50_29 = 0

			if var_50_29 < arg_47_1.time_ and arg_47_1.time_ <= var_50_29 + arg_50_0 then
				arg_47_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_50_30 = 0
			local var_50_31 = 0.4

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_32 = arg_47_1:FormatText(StoryNameCfg[37].name)

				arg_47_1.leftNameTxt_.text = var_50_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_33 = arg_47_1:GetWordFromCfg(102101012)
				local var_50_34 = arg_47_1:FormatText(var_50_33.content)

				arg_47_1.text_.text = var_50_34

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_35 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101012", "story_v_out_102101.awb") ~= 0 then
					local var_50_38 = manager.audio:GetVoiceLength("story_v_out_102101", "102101012", "story_v_out_102101.awb") / 1000

					if var_50_38 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_38 + var_50_30
					end

					if var_50_33.prefab_name ~= "" and arg_47_1.actors_[var_50_33.prefab_name] ~= nil then
						local var_50_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_33.prefab_name].transform, "story_v_out_102101", "102101012", "story_v_out_102101.awb")

						arg_47_1:RecordAudio("102101012", var_50_39)
						arg_47_1:RecordAudio("102101012", var_50_39)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_102101", "102101012", "story_v_out_102101.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_102101", "102101012", "story_v_out_102101.awb")
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
	Play102101013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 102101013
		arg_51_1.duration_ = 11.333

		local var_51_0 = {
			ja = 10.333,
			ko = 9.166,
			zh = 8.533,
			en = 11.333
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
				arg_51_0:Play102101014(arg_51_1)
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

			local var_54_4 = arg_51_1.actors_["1011ui_story"].transform
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1.var_.moveOldPos1011ui_story = var_54_4.localPosition
			end

			local var_54_6 = 0.001

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6
				local var_54_8 = Vector3.New(0, 100, 0)

				var_54_4.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1011ui_story, var_54_8, var_54_7)

				local var_54_9 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_9.x, var_54_9.y, var_54_9.z)

				local var_54_10 = var_54_4.localEulerAngles

				var_54_10.z = 0
				var_54_10.x = 0
				var_54_4.localEulerAngles = var_54_10
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 then
				var_54_4.localPosition = Vector3.New(0, 100, 0)

				local var_54_11 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_11.x, var_54_11.y, var_54_11.z)

				local var_54_12 = var_54_4.localEulerAngles

				var_54_12.z = 0
				var_54_12.x = 0
				var_54_4.localEulerAngles = var_54_12
			end

			local var_54_13 = arg_51_1.actors_["1019ui_story"].transform
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1.var_.moveOldPos1019ui_story = var_54_13.localPosition
			end

			local var_54_15 = 0.001

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15
				local var_54_17 = Vector3.New(0, 100, 0)

				var_54_13.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1019ui_story, var_54_17, var_54_16)

				local var_54_18 = manager.ui.mainCamera.transform.position - var_54_13.position

				var_54_13.forward = Vector3.New(var_54_18.x, var_54_18.y, var_54_18.z)

				local var_54_19 = var_54_13.localEulerAngles

				var_54_19.z = 0
				var_54_19.x = 0
				var_54_13.localEulerAngles = var_54_19
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 then
				var_54_13.localPosition = Vector3.New(0, 100, 0)

				local var_54_20 = manager.ui.mainCamera.transform.position - var_54_13.position

				var_54_13.forward = Vector3.New(var_54_20.x, var_54_20.y, var_54_20.z)

				local var_54_21 = var_54_13.localEulerAngles

				var_54_21.z = 0
				var_54_21.x = 0
				var_54_13.localEulerAngles = var_54_21
			end

			local var_54_22 = arg_51_1.actors_["10002_tpose"].transform
			local var_54_23 = 0

			if var_54_23 < arg_51_1.time_ and arg_51_1.time_ <= var_54_23 + arg_54_0 then
				arg_51_1.var_.moveOldPos10002_tpose = var_54_22.localPosition
			end

			local var_54_24 = 0.001

			if var_54_23 <= arg_51_1.time_ and arg_51_1.time_ < var_54_23 + var_54_24 then
				local var_54_25 = (arg_51_1.time_ - var_54_23) / var_54_24
				local var_54_26 = Vector3.New(0, -1.2, -5.8)

				var_54_22.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10002_tpose, var_54_26, var_54_25)

				local var_54_27 = manager.ui.mainCamera.transform.position - var_54_22.position

				var_54_22.forward = Vector3.New(var_54_27.x, var_54_27.y, var_54_27.z)

				local var_54_28 = var_54_22.localEulerAngles

				var_54_28.z = 0
				var_54_28.x = 0
				var_54_22.localEulerAngles = var_54_28
			end

			if arg_51_1.time_ >= var_54_23 + var_54_24 and arg_51_1.time_ < var_54_23 + var_54_24 + arg_54_0 then
				var_54_22.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_54_29 = manager.ui.mainCamera.transform.position - var_54_22.position

				var_54_22.forward = Vector3.New(var_54_29.x, var_54_29.y, var_54_29.z)

				local var_54_30 = var_54_22.localEulerAngles

				var_54_30.z = 0
				var_54_30.x = 0
				var_54_22.localEulerAngles = var_54_30
			end

			local var_54_31 = 0

			if var_54_31 < arg_51_1.time_ and arg_51_1.time_ <= var_54_31 + arg_54_0 then
				arg_51_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_54_32 = 0

			if var_54_32 < arg_51_1.time_ and arg_51_1.time_ <= var_54_32 + arg_54_0 then
				arg_51_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_54_33 = 0
			local var_54_34 = 0.875

			if var_54_33 < arg_51_1.time_ and arg_51_1.time_ <= var_54_33 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_35 = arg_51_1:FormatText(StoryNameCfg[39].name)

				arg_51_1.leftNameTxt_.text = var_54_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_36 = arg_51_1:GetWordFromCfg(102101013)
				local var_54_37 = arg_51_1:FormatText(var_54_36.content)

				arg_51_1.text_.text = var_54_37

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_38 = 33
				local var_54_39 = utf8.len(var_54_37)
				local var_54_40 = var_54_38 <= 0 and var_54_34 or var_54_34 * (var_54_39 / var_54_38)

				if var_54_40 > 0 and var_54_34 < var_54_40 then
					arg_51_1.talkMaxDuration = var_54_40

					if var_54_40 + var_54_33 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_40 + var_54_33
					end
				end

				arg_51_1.text_.text = var_54_37
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101013", "story_v_out_102101.awb") ~= 0 then
					local var_54_41 = manager.audio:GetVoiceLength("story_v_out_102101", "102101013", "story_v_out_102101.awb") / 1000

					if var_54_41 + var_54_33 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_41 + var_54_33
					end

					if var_54_36.prefab_name ~= "" and arg_51_1.actors_[var_54_36.prefab_name] ~= nil then
						local var_54_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_36.prefab_name].transform, "story_v_out_102101", "102101013", "story_v_out_102101.awb")

						arg_51_1:RecordAudio("102101013", var_54_42)
						arg_51_1:RecordAudio("102101013", var_54_42)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_102101", "102101013", "story_v_out_102101.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_102101", "102101013", "story_v_out_102101.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_43 = math.max(var_54_34, arg_51_1.talkMaxDuration)

			if var_54_33 <= arg_51_1.time_ and arg_51_1.time_ < var_54_33 + var_54_43 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_33) / var_54_43

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_33 + var_54_43 and arg_51_1.time_ < var_54_33 + var_54_43 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play102101014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 102101014
		arg_55_1.duration_ = 5.333

		local var_55_0 = {
			ja = 5.333,
			ko = 4.766,
			zh = 4.233,
			en = 4.3
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
				arg_55_0:Play102101015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1084ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1084ui_story then
					arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story then
				arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["10002_tpose"].transform
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.var_.moveOldPos10002_tpose = var_58_4.localPosition
			end

			local var_58_6 = 0.001

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6
				local var_58_8 = Vector3.New(0, 100, 0)

				var_58_4.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10002_tpose, var_58_8, var_58_7)

				local var_58_9 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_9.x, var_58_9.y, var_58_9.z)

				local var_58_10 = var_58_4.localEulerAngles

				var_58_10.z = 0
				var_58_10.x = 0
				var_58_4.localEulerAngles = var_58_10
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 then
				var_58_4.localPosition = Vector3.New(0, 100, 0)

				local var_58_11 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_11.x, var_58_11.y, var_58_11.z)

				local var_58_12 = var_58_4.localEulerAngles

				var_58_12.z = 0
				var_58_12.x = 0
				var_58_4.localEulerAngles = var_58_12
			end

			local var_58_13 = arg_55_1.actors_["1084ui_story"].transform
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.var_.moveOldPos1084ui_story = var_58_13.localPosition
			end

			local var_58_15 = 0.001

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_14) / var_58_15
				local var_58_17 = Vector3.New(-0.7, -0.97, -6)

				var_58_13.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1084ui_story, var_58_17, var_58_16)

				local var_58_18 = manager.ui.mainCamera.transform.position - var_58_13.position

				var_58_13.forward = Vector3.New(var_58_18.x, var_58_18.y, var_58_18.z)

				local var_58_19 = var_58_13.localEulerAngles

				var_58_19.z = 0
				var_58_19.x = 0
				var_58_13.localEulerAngles = var_58_19
			end

			if arg_55_1.time_ >= var_58_14 + var_58_15 and arg_55_1.time_ < var_58_14 + var_58_15 + arg_58_0 then
				var_58_13.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_58_20 = manager.ui.mainCamera.transform.position - var_58_13.position

				var_58_13.forward = Vector3.New(var_58_20.x, var_58_20.y, var_58_20.z)

				local var_58_21 = var_58_13.localEulerAngles

				var_58_21.z = 0
				var_58_21.x = 0
				var_58_13.localEulerAngles = var_58_21
			end

			local var_58_22 = 0

			if var_58_22 < arg_55_1.time_ and arg_55_1.time_ <= var_58_22 + arg_58_0 then
				arg_55_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_58_23 = 0

			if var_58_23 < arg_55_1.time_ and arg_55_1.time_ <= var_58_23 + arg_58_0 then
				arg_55_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_58_24 = 0
			local var_58_25 = 0.375

			if var_58_24 < arg_55_1.time_ and arg_55_1.time_ <= var_58_24 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_26 = arg_55_1:FormatText(StoryNameCfg[6].name)

				arg_55_1.leftNameTxt_.text = var_58_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_27 = arg_55_1:GetWordFromCfg(102101014)
				local var_58_28 = arg_55_1:FormatText(var_58_27.content)

				arg_55_1.text_.text = var_58_28

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_29 = 15
				local var_58_30 = utf8.len(var_58_28)
				local var_58_31 = var_58_29 <= 0 and var_58_25 or var_58_25 * (var_58_30 / var_58_29)

				if var_58_31 > 0 and var_58_25 < var_58_31 then
					arg_55_1.talkMaxDuration = var_58_31

					if var_58_31 + var_58_24 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_31 + var_58_24
					end
				end

				arg_55_1.text_.text = var_58_28
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101014", "story_v_out_102101.awb") ~= 0 then
					local var_58_32 = manager.audio:GetVoiceLength("story_v_out_102101", "102101014", "story_v_out_102101.awb") / 1000

					if var_58_32 + var_58_24 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_32 + var_58_24
					end

					if var_58_27.prefab_name ~= "" and arg_55_1.actors_[var_58_27.prefab_name] ~= nil then
						local var_58_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_27.prefab_name].transform, "story_v_out_102101", "102101014", "story_v_out_102101.awb")

						arg_55_1:RecordAudio("102101014", var_58_33)
						arg_55_1:RecordAudio("102101014", var_58_33)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_102101", "102101014", "story_v_out_102101.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_102101", "102101014", "story_v_out_102101.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_34 = math.max(var_58_25, arg_55_1.talkMaxDuration)

			if var_58_24 <= arg_55_1.time_ and arg_55_1.time_ < var_58_24 + var_58_34 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_24) / var_58_34

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_24 + var_58_34 and arg_55_1.time_ < var_58_24 + var_58_34 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play102101015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 102101015
		arg_59_1.duration_ = 9.366

		local var_59_0 = {
			ja = 9.366,
			ko = 6.4,
			zh = 7.033,
			en = 8.5
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
				arg_59_0:Play102101016(arg_59_1)
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

			local var_62_4 = arg_59_1.actors_["1084ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story == nil then
				arg_59_1.var_.characterEffect1084ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1084ui_story then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1084ui_story.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1084ui_story.fillRatio = var_62_9
			end

			local var_62_10 = arg_59_1.actors_["1019ui_story"].transform
			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1.var_.moveOldPos1019ui_story = var_62_10.localPosition
			end

			local var_62_12 = 0.001

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				local var_62_13 = (arg_59_1.time_ - var_62_11) / var_62_12
				local var_62_14 = Vector3.New(0.7, -1.08, -5.9)

				var_62_10.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1019ui_story, var_62_14, var_62_13)

				local var_62_15 = manager.ui.mainCamera.transform.position - var_62_10.position

				var_62_10.forward = Vector3.New(var_62_15.x, var_62_15.y, var_62_15.z)

				local var_62_16 = var_62_10.localEulerAngles

				var_62_16.z = 0
				var_62_16.x = 0
				var_62_10.localEulerAngles = var_62_16
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 then
				var_62_10.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_62_17 = manager.ui.mainCamera.transform.position - var_62_10.position

				var_62_10.forward = Vector3.New(var_62_17.x, var_62_17.y, var_62_17.z)

				local var_62_18 = var_62_10.localEulerAngles

				var_62_18.z = 0
				var_62_18.x = 0
				var_62_10.localEulerAngles = var_62_18
			end

			local var_62_19 = 0

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_62_20 = 0

			if var_62_20 < arg_59_1.time_ and arg_59_1.time_ <= var_62_20 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_62_21 = 0
			local var_62_22 = 0.85

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_23 = arg_59_1:FormatText(StoryNameCfg[13].name)

				arg_59_1.leftNameTxt_.text = var_62_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_24 = arg_59_1:GetWordFromCfg(102101015)
				local var_62_25 = arg_59_1:FormatText(var_62_24.content)

				arg_59_1.text_.text = var_62_25

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_26 = 34
				local var_62_27 = utf8.len(var_62_25)
				local var_62_28 = var_62_26 <= 0 and var_62_22 or var_62_22 * (var_62_27 / var_62_26)

				if var_62_28 > 0 and var_62_22 < var_62_28 then
					arg_59_1.talkMaxDuration = var_62_28

					if var_62_28 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_28 + var_62_21
					end
				end

				arg_59_1.text_.text = var_62_25
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101015", "story_v_out_102101.awb") ~= 0 then
					local var_62_29 = manager.audio:GetVoiceLength("story_v_out_102101", "102101015", "story_v_out_102101.awb") / 1000

					if var_62_29 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_29 + var_62_21
					end

					if var_62_24.prefab_name ~= "" and arg_59_1.actors_[var_62_24.prefab_name] ~= nil then
						local var_62_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_24.prefab_name].transform, "story_v_out_102101", "102101015", "story_v_out_102101.awb")

						arg_59_1:RecordAudio("102101015", var_62_30)
						arg_59_1:RecordAudio("102101015", var_62_30)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_102101", "102101015", "story_v_out_102101.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_102101", "102101015", "story_v_out_102101.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_31 = math.max(var_62_22, arg_59_1.talkMaxDuration)

			if var_62_21 <= arg_59_1.time_ and arg_59_1.time_ < var_62_21 + var_62_31 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_21) / var_62_31

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_21 + var_62_31 and arg_59_1.time_ < var_62_21 + var_62_31 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play102101016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 102101016
		arg_63_1.duration_ = 5

		local var_63_0 = {
			ja = 5,
			ko = 3.6,
			zh = 3,
			en = 3.166
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
				arg_63_0:Play102101017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1011ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1011ui_story == nil then
				arg_63_1.var_.characterEffect1011ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1011ui_story then
					arg_63_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1011ui_story then
				arg_63_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1019ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1019ui_story == nil then
				arg_63_1.var_.characterEffect1019ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1019ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1019ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1019ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1019ui_story.fillRatio = var_66_9
			end

			local var_66_10 = arg_63_1.actors_["1019ui_story"].transform
			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.var_.moveOldPos1019ui_story = var_66_10.localPosition
			end

			local var_66_12 = 0.001

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_12 then
				local var_66_13 = (arg_63_1.time_ - var_66_11) / var_66_12
				local var_66_14 = Vector3.New(0, 100, 0)

				var_66_10.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1019ui_story, var_66_14, var_66_13)

				local var_66_15 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_15.x, var_66_15.y, var_66_15.z)

				local var_66_16 = var_66_10.localEulerAngles

				var_66_16.z = 0
				var_66_16.x = 0
				var_66_10.localEulerAngles = var_66_16
			end

			if arg_63_1.time_ >= var_66_11 + var_66_12 and arg_63_1.time_ < var_66_11 + var_66_12 + arg_66_0 then
				var_66_10.localPosition = Vector3.New(0, 100, 0)

				local var_66_17 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_17.x, var_66_17.y, var_66_17.z)

				local var_66_18 = var_66_10.localEulerAngles

				var_66_18.z = 0
				var_66_18.x = 0
				var_66_10.localEulerAngles = var_66_18
			end

			local var_66_19 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_19.localPosition
			end

			local var_66_21 = 0.001

			if var_66_20 <= arg_63_1.time_ and arg_63_1.time_ < var_66_20 + var_66_21 then
				local var_66_22 = (arg_63_1.time_ - var_66_20) / var_66_21
				local var_66_23 = Vector3.New(0, 100, 0)

				var_66_19.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_23, var_66_22)

				local var_66_24 = manager.ui.mainCamera.transform.position - var_66_19.position

				var_66_19.forward = Vector3.New(var_66_24.x, var_66_24.y, var_66_24.z)

				local var_66_25 = var_66_19.localEulerAngles

				var_66_25.z = 0
				var_66_25.x = 0
				var_66_19.localEulerAngles = var_66_25
			end

			if arg_63_1.time_ >= var_66_20 + var_66_21 and arg_63_1.time_ < var_66_20 + var_66_21 + arg_66_0 then
				var_66_19.localPosition = Vector3.New(0, 100, 0)

				local var_66_26 = manager.ui.mainCamera.transform.position - var_66_19.position

				var_66_19.forward = Vector3.New(var_66_26.x, var_66_26.y, var_66_26.z)

				local var_66_27 = var_66_19.localEulerAngles

				var_66_27.z = 0
				var_66_27.x = 0
				var_66_19.localEulerAngles = var_66_27
			end

			local var_66_28 = 0

			if var_66_28 < arg_63_1.time_ and arg_63_1.time_ <= var_66_28 + arg_66_0 then
				arg_63_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_66_29 = arg_63_1.actors_["1011ui_story"].transform
			local var_66_30 = 0

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.var_.moveOldPos1011ui_story = var_66_29.localPosition
			end

			local var_66_31 = 0.001

			if var_66_30 <= arg_63_1.time_ and arg_63_1.time_ < var_66_30 + var_66_31 then
				local var_66_32 = (arg_63_1.time_ - var_66_30) / var_66_31
				local var_66_33 = Vector3.New(-0.7, -0.71, -6)

				var_66_29.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1011ui_story, var_66_33, var_66_32)

				local var_66_34 = manager.ui.mainCamera.transform.position - var_66_29.position

				var_66_29.forward = Vector3.New(var_66_34.x, var_66_34.y, var_66_34.z)

				local var_66_35 = var_66_29.localEulerAngles

				var_66_35.z = 0
				var_66_35.x = 0
				var_66_29.localEulerAngles = var_66_35
			end

			if arg_63_1.time_ >= var_66_30 + var_66_31 and arg_63_1.time_ < var_66_30 + var_66_31 + arg_66_0 then
				var_66_29.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_66_36 = manager.ui.mainCamera.transform.position - var_66_29.position

				var_66_29.forward = Vector3.New(var_66_36.x, var_66_36.y, var_66_36.z)

				local var_66_37 = var_66_29.localEulerAngles

				var_66_37.z = 0
				var_66_37.x = 0
				var_66_29.localEulerAngles = var_66_37
			end

			local var_66_38 = 0

			if var_66_38 < arg_63_1.time_ and arg_63_1.time_ <= var_66_38 + arg_66_0 then
				arg_63_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_39 = 0
			local var_66_40 = 0.375

			if var_66_39 < arg_63_1.time_ and arg_63_1.time_ <= var_66_39 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_41 = arg_63_1:FormatText(StoryNameCfg[37].name)

				arg_63_1.leftNameTxt_.text = var_66_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_42 = arg_63_1:GetWordFromCfg(102101016)
				local var_66_43 = arg_63_1:FormatText(var_66_42.content)

				arg_63_1.text_.text = var_66_43

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_44 = 15
				local var_66_45 = utf8.len(var_66_43)
				local var_66_46 = var_66_44 <= 0 and var_66_40 or var_66_40 * (var_66_45 / var_66_44)

				if var_66_46 > 0 and var_66_40 < var_66_46 then
					arg_63_1.talkMaxDuration = var_66_46

					if var_66_46 + var_66_39 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_46 + var_66_39
					end
				end

				arg_63_1.text_.text = var_66_43
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101016", "story_v_out_102101.awb") ~= 0 then
					local var_66_47 = manager.audio:GetVoiceLength("story_v_out_102101", "102101016", "story_v_out_102101.awb") / 1000

					if var_66_47 + var_66_39 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_47 + var_66_39
					end

					if var_66_42.prefab_name ~= "" and arg_63_1.actors_[var_66_42.prefab_name] ~= nil then
						local var_66_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_42.prefab_name].transform, "story_v_out_102101", "102101016", "story_v_out_102101.awb")

						arg_63_1:RecordAudio("102101016", var_66_48)
						arg_63_1:RecordAudio("102101016", var_66_48)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_102101", "102101016", "story_v_out_102101.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_102101", "102101016", "story_v_out_102101.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_49 = math.max(var_66_40, arg_63_1.talkMaxDuration)

			if var_66_39 <= arg_63_1.time_ and arg_63_1.time_ < var_66_39 + var_66_49 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_39) / var_66_49

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_39 + var_66_49 and arg_63_1.time_ < var_66_39 + var_66_49 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play102101017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 102101017
		arg_67_1.duration_ = 15.566

		local var_67_0 = {
			ja = 11.366,
			ko = 15.566,
			zh = 12.8,
			en = 14.166
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
				arg_67_0:Play102101018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10002_tpose"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect10002_tpose == nil then
				arg_67_1.var_.characterEffect10002_tpose = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect10002_tpose then
					arg_67_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect10002_tpose then
				arg_67_1.var_.characterEffect10002_tpose.fillFlat = false
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
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1011ui_story.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1011ui_story then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1011ui_story.fillRatio = var_70_9
			end

			local var_70_10 = arg_67_1.actors_["10002_tpose"].transform
			local var_70_11 = 0

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1.var_.moveOldPos10002_tpose = var_70_10.localPosition
			end

			local var_70_12 = 0.001

			if var_70_11 <= arg_67_1.time_ and arg_67_1.time_ < var_70_11 + var_70_12 then
				local var_70_13 = (arg_67_1.time_ - var_70_11) / var_70_12
				local var_70_14 = Vector3.New(0.7, -1.2, -5.8)

				var_70_10.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10002_tpose, var_70_14, var_70_13)

				local var_70_15 = manager.ui.mainCamera.transform.position - var_70_10.position

				var_70_10.forward = Vector3.New(var_70_15.x, var_70_15.y, var_70_15.z)

				local var_70_16 = var_70_10.localEulerAngles

				var_70_16.z = 0
				var_70_16.x = 0
				var_70_10.localEulerAngles = var_70_16
			end

			if arg_67_1.time_ >= var_70_11 + var_70_12 and arg_67_1.time_ < var_70_11 + var_70_12 + arg_70_0 then
				var_70_10.localPosition = Vector3.New(0.7, -1.2, -5.8)

				local var_70_17 = manager.ui.mainCamera.transform.position - var_70_10.position

				var_70_10.forward = Vector3.New(var_70_17.x, var_70_17.y, var_70_17.z)

				local var_70_18 = var_70_10.localEulerAngles

				var_70_18.z = 0
				var_70_18.x = 0
				var_70_10.localEulerAngles = var_70_18
			end

			local var_70_19 = 0

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_70_20 = 0

			if var_70_20 < arg_67_1.time_ and arg_67_1.time_ <= var_70_20 + arg_70_0 then
				arg_67_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_70_21 = 0
			local var_70_22 = 1.4

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_23 = arg_67_1:FormatText(StoryNameCfg[39].name)

				arg_67_1.leftNameTxt_.text = var_70_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_24 = arg_67_1:GetWordFromCfg(102101017)
				local var_70_25 = arg_67_1:FormatText(var_70_24.content)

				arg_67_1.text_.text = var_70_25

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_26 = 56
				local var_70_27 = utf8.len(var_70_25)
				local var_70_28 = var_70_26 <= 0 and var_70_22 or var_70_22 * (var_70_27 / var_70_26)

				if var_70_28 > 0 and var_70_22 < var_70_28 then
					arg_67_1.talkMaxDuration = var_70_28

					if var_70_28 + var_70_21 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_28 + var_70_21
					end
				end

				arg_67_1.text_.text = var_70_25
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101017", "story_v_out_102101.awb") ~= 0 then
					local var_70_29 = manager.audio:GetVoiceLength("story_v_out_102101", "102101017", "story_v_out_102101.awb") / 1000

					if var_70_29 + var_70_21 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_29 + var_70_21
					end

					if var_70_24.prefab_name ~= "" and arg_67_1.actors_[var_70_24.prefab_name] ~= nil then
						local var_70_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_24.prefab_name].transform, "story_v_out_102101", "102101017", "story_v_out_102101.awb")

						arg_67_1:RecordAudio("102101017", var_70_30)
						arg_67_1:RecordAudio("102101017", var_70_30)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_102101", "102101017", "story_v_out_102101.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_102101", "102101017", "story_v_out_102101.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_31 = math.max(var_70_22, arg_67_1.talkMaxDuration)

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_31 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_21) / var_70_31

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_21 + var_70_31 and arg_67_1.time_ < var_70_21 + var_70_31 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play102101018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 102101018
		arg_71_1.duration_ = 6.833

		local var_71_0 = {
			ja = 6.833,
			ko = 3.933,
			zh = 3.6,
			en = 4.066
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
				arg_71_0:Play102101019(arg_71_1)
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

			local var_74_4 = arg_71_1.actors_["10002_tpose"]
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 and arg_71_1.var_.characterEffect10002_tpose == nil then
				arg_71_1.var_.characterEffect10002_tpose = var_74_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_6 = 0.1

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6

				if arg_71_1.var_.characterEffect10002_tpose then
					local var_74_8 = Mathf.Lerp(0, 0.5, var_74_7)

					arg_71_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_71_1.var_.characterEffect10002_tpose.fillRatio = var_74_8
				end
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 and arg_71_1.var_.characterEffect10002_tpose then
				local var_74_9 = 0.5

				arg_71_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_71_1.var_.characterEffect10002_tpose.fillRatio = var_74_9
			end

			local var_74_10 = arg_71_1.actors_["1011ui_story"].transform
			local var_74_11 = 0

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1.var_.moveOldPos1011ui_story = var_74_10.localPosition
			end

			local var_74_12 = 0.001

			if var_74_11 <= arg_71_1.time_ and arg_71_1.time_ < var_74_11 + var_74_12 then
				local var_74_13 = (arg_71_1.time_ - var_74_11) / var_74_12
				local var_74_14 = Vector3.New(0, 100, 0)

				var_74_10.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1011ui_story, var_74_14, var_74_13)

				local var_74_15 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_15.x, var_74_15.y, var_74_15.z)

				local var_74_16 = var_74_10.localEulerAngles

				var_74_16.z = 0
				var_74_16.x = 0
				var_74_10.localEulerAngles = var_74_16
			end

			if arg_71_1.time_ >= var_74_11 + var_74_12 and arg_71_1.time_ < var_74_11 + var_74_12 + arg_74_0 then
				var_74_10.localPosition = Vector3.New(0, 100, 0)

				local var_74_17 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_17.x, var_74_17.y, var_74_17.z)

				local var_74_18 = var_74_10.localEulerAngles

				var_74_18.z = 0
				var_74_18.x = 0
				var_74_10.localEulerAngles = var_74_18
			end

			local var_74_19 = arg_71_1.actors_["1084ui_story"].transform
			local var_74_20 = 0

			if var_74_20 < arg_71_1.time_ and arg_71_1.time_ <= var_74_20 + arg_74_0 then
				arg_71_1.var_.moveOldPos1084ui_story = var_74_19.localPosition
			end

			local var_74_21 = 0.001

			if var_74_20 <= arg_71_1.time_ and arg_71_1.time_ < var_74_20 + var_74_21 then
				local var_74_22 = (arg_71_1.time_ - var_74_20) / var_74_21
				local var_74_23 = Vector3.New(-0.7, -0.97, -6)

				var_74_19.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1084ui_story, var_74_23, var_74_22)

				local var_74_24 = manager.ui.mainCamera.transform.position - var_74_19.position

				var_74_19.forward = Vector3.New(var_74_24.x, var_74_24.y, var_74_24.z)

				local var_74_25 = var_74_19.localEulerAngles

				var_74_25.z = 0
				var_74_25.x = 0
				var_74_19.localEulerAngles = var_74_25
			end

			if arg_71_1.time_ >= var_74_20 + var_74_21 and arg_71_1.time_ < var_74_20 + var_74_21 + arg_74_0 then
				var_74_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_74_26 = manager.ui.mainCamera.transform.position - var_74_19.position

				var_74_19.forward = Vector3.New(var_74_26.x, var_74_26.y, var_74_26.z)

				local var_74_27 = var_74_19.localEulerAngles

				var_74_27.z = 0
				var_74_27.x = 0
				var_74_19.localEulerAngles = var_74_27
			end

			local var_74_28 = 0

			if var_74_28 < arg_71_1.time_ and arg_71_1.time_ <= var_74_28 + arg_74_0 then
				arg_71_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action9_1")
			end

			local var_74_29 = 0

			if var_74_29 < arg_71_1.time_ and arg_71_1.time_ <= var_74_29 + arg_74_0 then
				arg_71_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_74_30 = 0
			local var_74_31 = 0.375

			if var_74_30 < arg_71_1.time_ and arg_71_1.time_ <= var_74_30 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_32 = arg_71_1:FormatText(StoryNameCfg[6].name)

				arg_71_1.leftNameTxt_.text = var_74_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_33 = arg_71_1:GetWordFromCfg(102101018)
				local var_74_34 = arg_71_1:FormatText(var_74_33.content)

				arg_71_1.text_.text = var_74_34

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_35 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101018", "story_v_out_102101.awb") ~= 0 then
					local var_74_38 = manager.audio:GetVoiceLength("story_v_out_102101", "102101018", "story_v_out_102101.awb") / 1000

					if var_74_38 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_38 + var_74_30
					end

					if var_74_33.prefab_name ~= "" and arg_71_1.actors_[var_74_33.prefab_name] ~= nil then
						local var_74_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_33.prefab_name].transform, "story_v_out_102101", "102101018", "story_v_out_102101.awb")

						arg_71_1:RecordAudio("102101018", var_74_39)
						arg_71_1:RecordAudio("102101018", var_74_39)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_102101", "102101018", "story_v_out_102101.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_102101", "102101018", "story_v_out_102101.awb")
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
	Play102101019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 102101019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play102101020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1084ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story == nil then
				arg_75_1.var_.characterEffect1084ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1084ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_5
			end

			local var_78_6 = arg_75_1.actors_["1084ui_story"].transform
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 then
				arg_75_1.var_.moveOldPos1084ui_story = var_78_6.localPosition
			end

			local var_78_8 = 0.001

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8
				local var_78_10 = Vector3.New(0, 100, 0)

				var_78_6.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1084ui_story, var_78_10, var_78_9)

				local var_78_11 = manager.ui.mainCamera.transform.position - var_78_6.position

				var_78_6.forward = Vector3.New(var_78_11.x, var_78_11.y, var_78_11.z)

				local var_78_12 = var_78_6.localEulerAngles

				var_78_12.z = 0
				var_78_12.x = 0
				var_78_6.localEulerAngles = var_78_12
			end

			if arg_75_1.time_ >= var_78_7 + var_78_8 and arg_75_1.time_ < var_78_7 + var_78_8 + arg_78_0 then
				var_78_6.localPosition = Vector3.New(0, 100, 0)

				local var_78_13 = manager.ui.mainCamera.transform.position - var_78_6.position

				var_78_6.forward = Vector3.New(var_78_13.x, var_78_13.y, var_78_13.z)

				local var_78_14 = var_78_6.localEulerAngles

				var_78_14.z = 0
				var_78_14.x = 0
				var_78_6.localEulerAngles = var_78_14
			end

			local var_78_15 = arg_75_1.actors_["10002_tpose"].transform
			local var_78_16 = 0.033

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.var_.moveOldPos10002_tpose = var_78_15.localPosition
			end

			local var_78_17 = 0.5

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Vector3.New(0, -1.2, -5.8)

				var_78_15.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10002_tpose, var_78_19, var_78_18)

				local var_78_20 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_20.x, var_78_20.y, var_78_20.z)

				local var_78_21 = var_78_15.localEulerAngles

				var_78_21.z = 0
				var_78_21.x = 0
				var_78_15.localEulerAngles = var_78_21
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				var_78_15.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_78_22 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_22.x, var_78_22.y, var_78_22.z)

				local var_78_23 = var_78_15.localEulerAngles

				var_78_23.z = 0
				var_78_23.x = 0
				var_78_15.localEulerAngles = var_78_23
			end

			local var_78_24 = arg_75_1.actors_["10002_tpose"].transform
			local var_78_25 = 0

			if var_78_25 < arg_75_1.time_ and arg_75_1.time_ <= var_78_25 + arg_78_0 then
				arg_75_1.var_.moveOldPos10002_tpose = var_78_24.localPosition
			end

			local var_78_26 = 0.001

			if var_78_25 <= arg_75_1.time_ and arg_75_1.time_ < var_78_25 + var_78_26 then
				local var_78_27 = (arg_75_1.time_ - var_78_25) / var_78_26
				local var_78_28 = Vector3.New(0.7, -1.2, -5.8)

				var_78_24.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10002_tpose, var_78_28, var_78_27)

				local var_78_29 = manager.ui.mainCamera.transform.position - var_78_24.position

				var_78_24.forward = Vector3.New(var_78_29.x, var_78_29.y, var_78_29.z)

				local var_78_30 = var_78_24.localEulerAngles

				var_78_30.z = 0
				var_78_30.x = 0
				var_78_24.localEulerAngles = var_78_30
			end

			if arg_75_1.time_ >= var_78_25 + var_78_26 and arg_75_1.time_ < var_78_25 + var_78_26 + arg_78_0 then
				var_78_24.localPosition = Vector3.New(0.7, -1.2, -5.8)

				local var_78_31 = manager.ui.mainCamera.transform.position - var_78_24.position

				var_78_24.forward = Vector3.New(var_78_31.x, var_78_31.y, var_78_31.z)

				local var_78_32 = var_78_24.localEulerAngles

				var_78_32.z = 0
				var_78_32.x = 0
				var_78_24.localEulerAngles = var_78_32
			end

			local var_78_33 = 0

			if var_78_33 < arg_75_1.time_ and arg_75_1.time_ <= var_78_33 + arg_78_0 then
				arg_75_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_78_34 = 0
			local var_78_35 = 0.875

			if var_78_34 < arg_75_1.time_ and arg_75_1.time_ <= var_78_34 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_36 = arg_75_1:FormatText(StoryNameCfg[48].name)

				arg_75_1.leftNameTxt_.text = var_78_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_37 = arg_75_1:GetWordFromCfg(102101019)
				local var_78_38 = arg_75_1:FormatText(var_78_37.content)

				arg_75_1.text_.text = var_78_38

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_39 = 35
				local var_78_40 = utf8.len(var_78_38)
				local var_78_41 = var_78_39 <= 0 and var_78_35 or var_78_35 * (var_78_40 / var_78_39)

				if var_78_41 > 0 and var_78_35 < var_78_41 then
					arg_75_1.talkMaxDuration = var_78_41

					if var_78_41 + var_78_34 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_41 + var_78_34
					end
				end

				arg_75_1.text_.text = var_78_38
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_42 = math.max(var_78_35, arg_75_1.talkMaxDuration)

			if var_78_34 <= arg_75_1.time_ and arg_75_1.time_ < var_78_34 + var_78_42 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_34) / var_78_42

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_34 + var_78_42 and arg_75_1.time_ < var_78_34 + var_78_42 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play102101020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 102101020
		arg_79_1.duration_ = 15.4

		local var_79_0 = {
			ja = 6.6,
			ko = 11,
			zh = 11.566,
			en = 15.4
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
				arg_79_0:Play102101021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10002_tpose"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect10002_tpose == nil then
				arg_79_1.var_.characterEffect10002_tpose = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect10002_tpose then
					arg_79_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect10002_tpose then
				arg_79_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_82_6 = 0
			local var_82_7 = 1.2

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[39].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(102101020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101020", "story_v_out_102101.awb") ~= 0 then
					local var_82_14 = manager.audio:GetVoiceLength("story_v_out_102101", "102101020", "story_v_out_102101.awb") / 1000

					if var_82_14 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_6
					end

					if var_82_9.prefab_name ~= "" and arg_79_1.actors_[var_82_9.prefab_name] ~= nil then
						local var_82_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_9.prefab_name].transform, "story_v_out_102101", "102101020", "story_v_out_102101.awb")

						arg_79_1:RecordAudio("102101020", var_82_15)
						arg_79_1:RecordAudio("102101020", var_82_15)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_102101", "102101020", "story_v_out_102101.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_102101", "102101020", "story_v_out_102101.awb")
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
	Play102101021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 102101021
		arg_83_1.duration_ = 6.033

		local var_83_0 = {
			ja = 6.033,
			ko = 5.033,
			zh = 4.766,
			en = 4.266
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
				arg_83_0:Play102101022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_86_2 = 0
			local var_86_3 = 0.55

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_4 = arg_83_1:FormatText(StoryNameCfg[39].name)

				arg_83_1.leftNameTxt_.text = var_86_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_5 = arg_83_1:GetWordFromCfg(102101021)
				local var_86_6 = arg_83_1:FormatText(var_86_5.content)

				arg_83_1.text_.text = var_86_6

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_7 = 23
				local var_86_8 = utf8.len(var_86_6)
				local var_86_9 = var_86_7 <= 0 and var_86_3 or var_86_3 * (var_86_8 / var_86_7)

				if var_86_9 > 0 and var_86_3 < var_86_9 then
					arg_83_1.talkMaxDuration = var_86_9

					if var_86_9 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_9 + var_86_2
					end
				end

				arg_83_1.text_.text = var_86_6
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101021", "story_v_out_102101.awb") ~= 0 then
					local var_86_10 = manager.audio:GetVoiceLength("story_v_out_102101", "102101021", "story_v_out_102101.awb") / 1000

					if var_86_10 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_2
					end

					if var_86_5.prefab_name ~= "" and arg_83_1.actors_[var_86_5.prefab_name] ~= nil then
						local var_86_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_5.prefab_name].transform, "story_v_out_102101", "102101021", "story_v_out_102101.awb")

						arg_83_1:RecordAudio("102101021", var_86_11)
						arg_83_1:RecordAudio("102101021", var_86_11)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_102101", "102101021", "story_v_out_102101.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_102101", "102101021", "story_v_out_102101.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_12 = math.max(var_86_3, arg_83_1.talkMaxDuration)

			if var_86_2 <= arg_83_1.time_ and arg_83_1.time_ < var_86_2 + var_86_12 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_2) / var_86_12

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_2 + var_86_12 and arg_83_1.time_ < var_86_2 + var_86_12 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play102101022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 102101022
		arg_87_1.duration_ = 2.6

		local var_87_0 = {
			ja = 2.4,
			ko = 2.2,
			zh = 2.6,
			en = 1.999999999999
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
				arg_87_0:Play102101023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1084ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1084ui_story then
					arg_87_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story then
				arg_87_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["10002_tpose"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect10002_tpose == nil then
				arg_87_1.var_.characterEffect10002_tpose = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.1

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect10002_tpose then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_87_1.var_.characterEffect10002_tpose.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect10002_tpose then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_87_1.var_.characterEffect10002_tpose.fillRatio = var_90_9
			end

			local var_90_10 = arg_87_1.actors_["10002_tpose"].transform
			local var_90_11 = 0

			if var_90_11 < arg_87_1.time_ and arg_87_1.time_ <= var_90_11 + arg_90_0 then
				arg_87_1.var_.moveOldPos10002_tpose = var_90_10.localPosition
			end

			local var_90_12 = 0.001

			if var_90_11 <= arg_87_1.time_ and arg_87_1.time_ < var_90_11 + var_90_12 then
				local var_90_13 = (arg_87_1.time_ - var_90_11) / var_90_12
				local var_90_14 = Vector3.New(0, 100, 0)

				var_90_10.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10002_tpose, var_90_14, var_90_13)

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

			local var_90_19 = arg_87_1.actors_["1084ui_story"].transform
			local var_90_20 = 0

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.var_.moveOldPos1084ui_story = var_90_19.localPosition
			end

			local var_90_21 = 0.001

			if var_90_20 <= arg_87_1.time_ and arg_87_1.time_ < var_90_20 + var_90_21 then
				local var_90_22 = (arg_87_1.time_ - var_90_20) / var_90_21
				local var_90_23 = Vector3.New(0, -0.97, -6)

				var_90_19.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1084ui_story, var_90_23, var_90_22)

				local var_90_24 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_24.x, var_90_24.y, var_90_24.z)

				local var_90_25 = var_90_19.localEulerAngles

				var_90_25.z = 0
				var_90_25.x = 0
				var_90_19.localEulerAngles = var_90_25
			end

			if arg_87_1.time_ >= var_90_20 + var_90_21 and arg_87_1.time_ < var_90_20 + var_90_21 + arg_90_0 then
				var_90_19.localPosition = Vector3.New(0, -0.97, -6)

				local var_90_26 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_26.x, var_90_26.y, var_90_26.z)

				local var_90_27 = var_90_19.localEulerAngles

				var_90_27.z = 0
				var_90_27.x = 0
				var_90_19.localEulerAngles = var_90_27
			end

			local var_90_28 = 0

			if var_90_28 < arg_87_1.time_ and arg_87_1.time_ <= var_90_28 + arg_90_0 then
				arg_87_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_90_29 = 0

			if var_90_29 < arg_87_1.time_ and arg_87_1.time_ <= var_90_29 + arg_90_0 then
				arg_87_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_90_30 = 0
			local var_90_31 = 0.15

			if var_90_30 < arg_87_1.time_ and arg_87_1.time_ <= var_90_30 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_32 = arg_87_1:FormatText(StoryNameCfg[6].name)

				arg_87_1.leftNameTxt_.text = var_90_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_33 = arg_87_1:GetWordFromCfg(102101022)
				local var_90_34 = arg_87_1:FormatText(var_90_33.content)

				arg_87_1.text_.text = var_90_34

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_35 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101022", "story_v_out_102101.awb") ~= 0 then
					local var_90_38 = manager.audio:GetVoiceLength("story_v_out_102101", "102101022", "story_v_out_102101.awb") / 1000

					if var_90_38 + var_90_30 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_38 + var_90_30
					end

					if var_90_33.prefab_name ~= "" and arg_87_1.actors_[var_90_33.prefab_name] ~= nil then
						local var_90_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_33.prefab_name].transform, "story_v_out_102101", "102101022", "story_v_out_102101.awb")

						arg_87_1:RecordAudio("102101022", var_90_39)
						arg_87_1:RecordAudio("102101022", var_90_39)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_102101", "102101022", "story_v_out_102101.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_102101", "102101022", "story_v_out_102101.awb")
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
	Play102101023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 102101023
		arg_91_1.duration_ = 16.266

		local var_91_0 = {
			ja = 14.3,
			ko = 16.266,
			zh = 12,
			en = 11.3
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
				arg_91_0:Play102101024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10002_tpose"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect10002_tpose == nil then
				arg_91_1.var_.characterEffect10002_tpose = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.1

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect10002_tpose then
					arg_91_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect10002_tpose then
				arg_91_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["1084ui_story"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.1

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect1084ui_story then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_9
			end

			local var_94_10 = arg_91_1.actors_["1084ui_story"].transform
			local var_94_11 = 0

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.var_.moveOldPos1084ui_story = var_94_10.localPosition
			end

			local var_94_12 = 0.001

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_12 then
				local var_94_13 = (arg_91_1.time_ - var_94_11) / var_94_12
				local var_94_14 = Vector3.New(0, 100, 0)

				var_94_10.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1084ui_story, var_94_14, var_94_13)

				local var_94_15 = manager.ui.mainCamera.transform.position - var_94_10.position

				var_94_10.forward = Vector3.New(var_94_15.x, var_94_15.y, var_94_15.z)

				local var_94_16 = var_94_10.localEulerAngles

				var_94_16.z = 0
				var_94_16.x = 0
				var_94_10.localEulerAngles = var_94_16
			end

			if arg_91_1.time_ >= var_94_11 + var_94_12 and arg_91_1.time_ < var_94_11 + var_94_12 + arg_94_0 then
				var_94_10.localPosition = Vector3.New(0, 100, 0)

				local var_94_17 = manager.ui.mainCamera.transform.position - var_94_10.position

				var_94_10.forward = Vector3.New(var_94_17.x, var_94_17.y, var_94_17.z)

				local var_94_18 = var_94_10.localEulerAngles

				var_94_18.z = 0
				var_94_18.x = 0
				var_94_10.localEulerAngles = var_94_18
			end

			local var_94_19 = arg_91_1.actors_["10002_tpose"].transform
			local var_94_20 = 0

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.var_.moveOldPos10002_tpose = var_94_19.localPosition
			end

			local var_94_21 = 0.001

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_21 then
				local var_94_22 = (arg_91_1.time_ - var_94_20) / var_94_21
				local var_94_23 = Vector3.New(0, -1.2, -5.8)

				var_94_19.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10002_tpose, var_94_23, var_94_22)

				local var_94_24 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_24.x, var_94_24.y, var_94_24.z)

				local var_94_25 = var_94_19.localEulerAngles

				var_94_25.z = 0
				var_94_25.x = 0
				var_94_19.localEulerAngles = var_94_25
			end

			if arg_91_1.time_ >= var_94_20 + var_94_21 and arg_91_1.time_ < var_94_20 + var_94_21 + arg_94_0 then
				var_94_19.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_94_26 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_26.x, var_94_26.y, var_94_26.z)

				local var_94_27 = var_94_19.localEulerAngles

				var_94_27.z = 0
				var_94_27.x = 0
				var_94_19.localEulerAngles = var_94_27
			end

			local var_94_28 = 0

			if var_94_28 < arg_91_1.time_ and arg_91_1.time_ <= var_94_28 + arg_94_0 then
				arg_91_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_94_29 = 0

			if var_94_29 < arg_91_1.time_ and arg_91_1.time_ <= var_94_29 + arg_94_0 then
				arg_91_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_94_30 = 0

			if var_94_30 < arg_91_1.time_ and arg_91_1.time_ <= var_94_30 + arg_94_0 then
				arg_91_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_94_31 = 0
			local var_94_32 = 1.25

			if var_94_31 < arg_91_1.time_ and arg_91_1.time_ <= var_94_31 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_33 = arg_91_1:FormatText(StoryNameCfg[39].name)

				arg_91_1.leftNameTxt_.text = var_94_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_34 = arg_91_1:GetWordFromCfg(102101023)
				local var_94_35 = arg_91_1:FormatText(var_94_34.content)

				arg_91_1.text_.text = var_94_35

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_36 = 49
				local var_94_37 = utf8.len(var_94_35)
				local var_94_38 = var_94_36 <= 0 and var_94_32 or var_94_32 * (var_94_37 / var_94_36)

				if var_94_38 > 0 and var_94_32 < var_94_38 then
					arg_91_1.talkMaxDuration = var_94_38

					if var_94_38 + var_94_31 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_38 + var_94_31
					end
				end

				arg_91_1.text_.text = var_94_35
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101023", "story_v_out_102101.awb") ~= 0 then
					local var_94_39 = manager.audio:GetVoiceLength("story_v_out_102101", "102101023", "story_v_out_102101.awb") / 1000

					if var_94_39 + var_94_31 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_39 + var_94_31
					end

					if var_94_34.prefab_name ~= "" and arg_91_1.actors_[var_94_34.prefab_name] ~= nil then
						local var_94_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_34.prefab_name].transform, "story_v_out_102101", "102101023", "story_v_out_102101.awb")

						arg_91_1:RecordAudio("102101023", var_94_40)
						arg_91_1:RecordAudio("102101023", var_94_40)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_102101", "102101023", "story_v_out_102101.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_102101", "102101023", "story_v_out_102101.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_41 = math.max(var_94_32, arg_91_1.talkMaxDuration)

			if var_94_31 <= arg_91_1.time_ and arg_91_1.time_ < var_94_31 + var_94_41 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_31) / var_94_41

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_31 + var_94_41 and arg_91_1.time_ < var_94_31 + var_94_41 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play102101024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 102101024
		arg_95_1.duration_ = 1.266

		local var_95_0 = {
			ja = 1.166,
			ko = 0.999999999999,
			zh = 1.266,
			en = 1
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
				arg_95_0:Play102101025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1019ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1019ui_story == nil then
				arg_95_1.var_.characterEffect1019ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.1

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1019ui_story then
					arg_95_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1019ui_story then
				arg_95_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_98_4 = arg_95_1.actors_["10002_tpose"]
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 and arg_95_1.var_.characterEffect10002_tpose == nil then
				arg_95_1.var_.characterEffect10002_tpose = var_98_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_6 = 0.1

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6

				if arg_95_1.var_.characterEffect10002_tpose then
					local var_98_8 = Mathf.Lerp(0, 0.5, var_98_7)

					arg_95_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_95_1.var_.characterEffect10002_tpose.fillRatio = var_98_8
				end
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect10002_tpose then
				local var_98_9 = 0.5

				arg_95_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_95_1.var_.characterEffect10002_tpose.fillRatio = var_98_9
			end

			local var_98_10 = arg_95_1.actors_["10002_tpose"].transform
			local var_98_11 = 0

			if var_98_11 < arg_95_1.time_ and arg_95_1.time_ <= var_98_11 + arg_98_0 then
				arg_95_1.var_.moveOldPos10002_tpose = var_98_10.localPosition
			end

			local var_98_12 = 0.001

			if var_98_11 <= arg_95_1.time_ and arg_95_1.time_ < var_98_11 + var_98_12 then
				local var_98_13 = (arg_95_1.time_ - var_98_11) / var_98_12
				local var_98_14 = Vector3.New(0, 100, 0)

				var_98_10.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10002_tpose, var_98_14, var_98_13)

				local var_98_15 = manager.ui.mainCamera.transform.position - var_98_10.position

				var_98_10.forward = Vector3.New(var_98_15.x, var_98_15.y, var_98_15.z)

				local var_98_16 = var_98_10.localEulerAngles

				var_98_16.z = 0
				var_98_16.x = 0
				var_98_10.localEulerAngles = var_98_16
			end

			if arg_95_1.time_ >= var_98_11 + var_98_12 and arg_95_1.time_ < var_98_11 + var_98_12 + arg_98_0 then
				var_98_10.localPosition = Vector3.New(0, 100, 0)

				local var_98_17 = manager.ui.mainCamera.transform.position - var_98_10.position

				var_98_10.forward = Vector3.New(var_98_17.x, var_98_17.y, var_98_17.z)

				local var_98_18 = var_98_10.localEulerAngles

				var_98_18.z = 0
				var_98_18.x = 0
				var_98_10.localEulerAngles = var_98_18
			end

			local var_98_19 = arg_95_1.actors_["1019ui_story"].transform
			local var_98_20 = 0

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				arg_95_1.var_.moveOldPos1019ui_story = var_98_19.localPosition
			end

			local var_98_21 = 0.001

			if var_98_20 <= arg_95_1.time_ and arg_95_1.time_ < var_98_20 + var_98_21 then
				local var_98_22 = (arg_95_1.time_ - var_98_20) / var_98_21
				local var_98_23 = Vector3.New(0, -1.08, -5.9)

				var_98_19.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1019ui_story, var_98_23, var_98_22)

				local var_98_24 = manager.ui.mainCamera.transform.position - var_98_19.position

				var_98_19.forward = Vector3.New(var_98_24.x, var_98_24.y, var_98_24.z)

				local var_98_25 = var_98_19.localEulerAngles

				var_98_25.z = 0
				var_98_25.x = 0
				var_98_19.localEulerAngles = var_98_25
			end

			if arg_95_1.time_ >= var_98_20 + var_98_21 and arg_95_1.time_ < var_98_20 + var_98_21 + arg_98_0 then
				var_98_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_98_26 = manager.ui.mainCamera.transform.position - var_98_19.position

				var_98_19.forward = Vector3.New(var_98_26.x, var_98_26.y, var_98_26.z)

				local var_98_27 = var_98_19.localEulerAngles

				var_98_27.z = 0
				var_98_27.x = 0
				var_98_19.localEulerAngles = var_98_27
			end

			local var_98_28 = 0

			if var_98_28 < arg_95_1.time_ and arg_95_1.time_ <= var_98_28 + arg_98_0 then
				arg_95_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_98_29 = 0
			local var_98_30 = 0.05

			if var_98_29 < arg_95_1.time_ and arg_95_1.time_ <= var_98_29 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_31 = arg_95_1:FormatText(StoryNameCfg[13].name)

				arg_95_1.leftNameTxt_.text = var_98_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_32 = arg_95_1:GetWordFromCfg(102101024)
				local var_98_33 = arg_95_1:FormatText(var_98_32.content)

				arg_95_1.text_.text = var_98_33

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_34 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101024", "story_v_out_102101.awb") ~= 0 then
					local var_98_37 = manager.audio:GetVoiceLength("story_v_out_102101", "102101024", "story_v_out_102101.awb") / 1000

					if var_98_37 + var_98_29 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_37 + var_98_29
					end

					if var_98_32.prefab_name ~= "" and arg_95_1.actors_[var_98_32.prefab_name] ~= nil then
						local var_98_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_32.prefab_name].transform, "story_v_out_102101", "102101024", "story_v_out_102101.awb")

						arg_95_1:RecordAudio("102101024", var_98_38)
						arg_95_1:RecordAudio("102101024", var_98_38)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_102101", "102101024", "story_v_out_102101.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_102101", "102101024", "story_v_out_102101.awb")
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
	Play102101025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 102101025
		arg_99_1.duration_ = 7.666

		local var_99_0 = {
			ja = 6.6,
			ko = 7.1,
			zh = 7.666,
			en = 6.533
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
			arg_99_1.auto_ = false
		end

		function arg_99_1.playNext_(arg_101_0)
			arg_99_1.onStoryFinished_()
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_102_2 = 0
			local var_102_3 = 0.875

			if var_102_2 < arg_99_1.time_ and arg_99_1.time_ <= var_102_2 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_4 = arg_99_1:FormatText(StoryNameCfg[13].name)

				arg_99_1.leftNameTxt_.text = var_102_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_5 = arg_99_1:GetWordFromCfg(102101025)
				local var_102_6 = arg_99_1:FormatText(var_102_5.content)

				arg_99_1.text_.text = var_102_6

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_7 = 35
				local var_102_8 = utf8.len(var_102_6)
				local var_102_9 = var_102_7 <= 0 and var_102_3 or var_102_3 * (var_102_8 / var_102_7)

				if var_102_9 > 0 and var_102_3 < var_102_9 then
					arg_99_1.talkMaxDuration = var_102_9

					if var_102_9 + var_102_2 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_9 + var_102_2
					end
				end

				arg_99_1.text_.text = var_102_6
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102101", "102101025", "story_v_out_102101.awb") ~= 0 then
					local var_102_10 = manager.audio:GetVoiceLength("story_v_out_102101", "102101025", "story_v_out_102101.awb") / 1000

					if var_102_10 + var_102_2 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_10 + var_102_2
					end

					if var_102_5.prefab_name ~= "" and arg_99_1.actors_[var_102_5.prefab_name] ~= nil then
						local var_102_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_5.prefab_name].transform, "story_v_out_102101", "102101025", "story_v_out_102101.awb")

						arg_99_1:RecordAudio("102101025", var_102_11)
						arg_99_1:RecordAudio("102101025", var_102_11)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_102101", "102101025", "story_v_out_102101.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_102101", "102101025", "story_v_out_102101.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_12 = math.max(var_102_3, arg_99_1.talkMaxDuration)

			if var_102_2 <= arg_99_1.time_ and arg_99_1.time_ < var_102_2 + var_102_12 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_2) / var_102_12

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_2 + var_102_12 and arg_99_1.time_ < var_102_2 + var_102_12 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B02c"
	},
	voices = {
		"story_v_out_102101.awb"
	}
}
