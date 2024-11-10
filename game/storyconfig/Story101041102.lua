return {
	Play104112001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104112001
		arg_1_1.duration_ = 11.966

		local var_1_0 = {
			ja = 11.966,
			ko = 9.7,
			zh = 8.433,
			en = 8.633
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
				arg_1_0:Play104112002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2")
			end

			local var_4_4 = "1148ui_story"

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

			local var_4_8 = arg_1_1.actors_["1148ui_story"]
			local var_4_9 = 2

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 and arg_1_1.var_.characterEffect1148ui_story == nil then
				arg_1_1.var_.characterEffect1148ui_story = var_4_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_10 = 0.1

			if var_4_9 <= arg_1_1.time_ and arg_1_1.time_ < var_4_9 + var_4_10 then
				local var_4_11 = (arg_1_1.time_ - var_4_9) / var_4_10

				if arg_1_1.var_.characterEffect1148ui_story then
					arg_1_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_9 + var_4_10 and arg_1_1.time_ < var_4_9 + var_4_10 + arg_4_0 and arg_1_1.var_.characterEffect1148ui_story then
				arg_1_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_4_12 = "B14"

			if arg_1_1.bgs_[var_4_12] == nil then
				local var_4_13 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_12)
				var_4_13.name = var_4_12
				var_4_13.transform.parent = arg_1_1.stage_.transform
				var_4_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_12] = var_4_13
			end

			local var_4_14 = arg_1_1.bgs_.B14
			local var_4_15 = 0

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				local var_4_16 = var_4_14:GetComponent("SpriteRenderer")

				if var_4_16 then
					var_4_16.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_17 = var_4_16.material
					local var_4_18 = var_4_17:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB14 = var_4_18.a
					arg_1_1.var_.alphaMatValueB14 = var_4_17
				end

				arg_1_1.var_.alphaOldValueB14 = 0
			end

			local var_4_19 = 1.5

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_15) / var_4_19
				local var_4_21 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB14, 1, var_4_20)

				if arg_1_1.var_.alphaMatValueB14 then
					local var_4_22 = arg_1_1.var_.alphaMatValueB14
					local var_4_23 = var_4_22:GetColor("_Color")

					var_4_23.a = var_4_21

					var_4_22:SetColor("_Color", var_4_23)
				end
			end

			if arg_1_1.time_ >= var_4_15 + var_4_19 and arg_1_1.time_ < var_4_15 + var_4_19 + arg_4_0 and arg_1_1.var_.alphaMatValueB14 then
				local var_4_24 = arg_1_1.var_.alphaMatValueB14
				local var_4_25 = var_4_24:GetColor("_Color")

				var_4_25.a = 1

				var_4_24:SetColor("_Color", var_4_25)
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_27 = manager.ui.mainCamera.transform.localPosition
				local var_4_28 = Vector3.New(0, 0, 10) + Vector3.New(var_4_27.x, var_4_27.y, 0)
				local var_4_29 = arg_1_1.bgs_.B14

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
					if iter_4_0 ~= "B14" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_40 = arg_1_1.actors_["1148ui_story"].transform
			local var_4_41 = 1.79999995231628

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1.var_.moveOldPos1148ui_story = var_4_40.localPosition
			end

			local var_4_42 = 0.001

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42
				local var_4_44 = Vector3.New(-0.7, -0.8, -6.2)

				var_4_40.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1148ui_story, var_4_44, var_4_43)

				local var_4_45 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_45.x, var_4_45.y, var_4_45.z)

				local var_4_46 = var_4_40.localEulerAngles

				var_4_46.z = 0
				var_4_46.x = 0
				var_4_40.localEulerAngles = var_4_46
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				var_4_40.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_4_47 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_47.x, var_4_47.y, var_4_47.z)

				local var_4_48 = var_4_40.localEulerAngles

				var_4_48.z = 0
				var_4_48.x = 0
				var_4_40.localEulerAngles = var_4_48
			end

			local var_4_49 = 0

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
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
				arg_1_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2
			local var_4_54 = 0.875

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

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[8].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(104112001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112001", "story_v_out_104112.awb") ~= 0 then
					local var_4_62 = manager.audio:GetVoiceLength("story_v_out_104112", "104112001", "story_v_out_104112.awb") / 1000

					if var_4_62 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_53
					end

					if var_4_57.prefab_name ~= "" and arg_1_1.actors_[var_4_57.prefab_name] ~= nil then
						local var_4_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_57.prefab_name].transform, "story_v_out_104112", "104112001", "story_v_out_104112.awb")

						arg_1_1:RecordAudio("104112001", var_4_63)
						arg_1_1:RecordAudio("104112001", var_4_63)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_104112", "104112001", "story_v_out_104112.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_104112", "104112001", "story_v_out_104112.awb")
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
	Play104112002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104112002
		arg_7_1.duration_ = 10.4

		local var_7_0 = {
			ja = 8.533,
			ko = 7,
			zh = 10.4,
			en = 8.7
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
				arg_7_0:Play104112003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1059ui_story"

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

			local var_10_4 = arg_7_1.actors_["1059ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1059ui_story == nil then
				arg_7_1.var_.characterEffect1059ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1059ui_story then
					arg_7_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1059ui_story then
				arg_7_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["1148ui_story"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect1148ui_story == nil then
				arg_7_1.var_.characterEffect1148ui_story = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect1148ui_story then
					local var_10_12 = Mathf.Lerp(0, 0.5, var_10_11)

					arg_7_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1148ui_story.fillRatio = var_10_12
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect1148ui_story then
				local var_10_13 = 0.5

				arg_7_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1148ui_story.fillRatio = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["1059ui_story"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos1059ui_story = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -1.05, -6)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1059ui_story, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_10_25 = 0
			local var_10_26 = 1

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[28].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(104112002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112002", "story_v_out_104112.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_104112", "104112002", "story_v_out_104112.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_104112", "104112002", "story_v_out_104112.awb")

						arg_7_1:RecordAudio("104112002", var_10_34)
						arg_7_1:RecordAudio("104112002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_104112", "104112002", "story_v_out_104112.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_104112", "104112002", "story_v_out_104112.awb")
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
	Play104112003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104112003
		arg_11_1.duration_ = 11.566

		local var_11_0 = {
			ja = 11.566,
			ko = 9.766,
			zh = 11.1,
			en = 10.433
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
				arg_11_0:Play104112004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action434")
			end

			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_14_2 = 0
			local var_14_3 = 1.175

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_4 = arg_11_1:FormatText(StoryNameCfg[28].name)

				arg_11_1.leftNameTxt_.text = var_14_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_5 = arg_11_1:GetWordFromCfg(104112003)
				local var_14_6 = arg_11_1:FormatText(var_14_5.content)

				arg_11_1.text_.text = var_14_6

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_7 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112003", "story_v_out_104112.awb") ~= 0 then
					local var_14_10 = manager.audio:GetVoiceLength("story_v_out_104112", "104112003", "story_v_out_104112.awb") / 1000

					if var_14_10 + var_14_2 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_10 + var_14_2
					end

					if var_14_5.prefab_name ~= "" and arg_11_1.actors_[var_14_5.prefab_name] ~= nil then
						local var_14_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_5.prefab_name].transform, "story_v_out_104112", "104112003", "story_v_out_104112.awb")

						arg_11_1:RecordAudio("104112003", var_14_11)
						arg_11_1:RecordAudio("104112003", var_14_11)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104112", "104112003", "story_v_out_104112.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104112", "104112003", "story_v_out_104112.awb")
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
	Play104112004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104112004
		arg_15_1.duration_ = 6.3

		local var_15_0 = {
			ja = 6.3,
			ko = 3.8,
			zh = 5.566,
			en = 4.4
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
				arg_15_0:Play104112005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1027ui_story"

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

			local var_18_4 = arg_15_1.actors_["1027ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1027ui_story == nil then
				arg_15_1.var_.characterEffect1027ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1027ui_story then
					arg_15_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1027ui_story then
				arg_15_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["1059ui_story"]
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 and arg_15_1.var_.characterEffect1059ui_story == nil then
				arg_15_1.var_.characterEffect1059ui_story = var_18_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_10 = 0.1

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10

				if arg_15_1.var_.characterEffect1059ui_story then
					local var_18_12 = Mathf.Lerp(0, 0.5, var_18_11)

					arg_15_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1059ui_story.fillRatio = var_18_12
				end
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1059ui_story then
				local var_18_13 = 0.5

				arg_15_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1059ui_story.fillRatio = var_18_13
			end

			local var_18_14 = arg_15_1.actors_["1059ui_story"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos1059ui_story = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0, 100, 0)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1059ui_story, var_18_18, var_18_17)

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

			local var_18_23 = arg_15_1.actors_["1148ui_story"].transform
			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.var_.moveOldPos1148ui_story = var_18_23.localPosition
			end

			local var_18_25 = 0.001

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_25 then
				local var_18_26 = (arg_15_1.time_ - var_18_24) / var_18_25
				local var_18_27 = Vector3.New(0, 100, 0)

				var_18_23.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1148ui_story, var_18_27, var_18_26)

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

			local var_18_32 = arg_15_1.actors_["1027ui_story"].transform
			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1.var_.moveOldPos1027ui_story = var_18_32.localPosition
			end

			local var_18_34 = 0.001

			if var_18_33 <= arg_15_1.time_ and arg_15_1.time_ < var_18_33 + var_18_34 then
				local var_18_35 = (arg_15_1.time_ - var_18_33) / var_18_34
				local var_18_36 = Vector3.New(-0.7, -0.81, -5.8)

				var_18_32.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1027ui_story, var_18_36, var_18_35)

				local var_18_37 = manager.ui.mainCamera.transform.position - var_18_32.position

				var_18_32.forward = Vector3.New(var_18_37.x, var_18_37.y, var_18_37.z)

				local var_18_38 = var_18_32.localEulerAngles

				var_18_38.z = 0
				var_18_38.x = 0
				var_18_32.localEulerAngles = var_18_38
			end

			if arg_15_1.time_ >= var_18_33 + var_18_34 and arg_15_1.time_ < var_18_33 + var_18_34 + arg_18_0 then
				var_18_32.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_18_39 = manager.ui.mainCamera.transform.position - var_18_32.position

				var_18_32.forward = Vector3.New(var_18_39.x, var_18_39.y, var_18_39.z)

				local var_18_40 = var_18_32.localEulerAngles

				var_18_40.z = 0
				var_18_40.x = 0
				var_18_32.localEulerAngles = var_18_40
			end

			local var_18_41 = 0

			if var_18_41 < arg_15_1.time_ and arg_15_1.time_ <= var_18_41 + arg_18_0 then
				arg_15_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action3_1")
			end

			local var_18_42 = "1080ui_story"

			if arg_15_1.actors_[var_18_42] == nil then
				local var_18_43 = Object.Instantiate(Asset.Load("Char/" .. var_18_42), arg_15_1.stage_.transform)

				var_18_43.name = var_18_42
				var_18_43.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_42] = var_18_43

				local var_18_44 = var_18_43:GetComponentInChildren(typeof(CharacterEffect))

				var_18_44.enabled = true

				local var_18_45 = GameObjectTools.GetOrAddComponent(var_18_43, typeof(DynamicBoneHelper))

				if var_18_45 then
					var_18_45:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_44.transform, false)

				arg_15_1.var_[var_18_42 .. "Animator"] = var_18_44.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_42 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_42 .. "LipSync"] = var_18_44.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_46 = 0

			if var_18_46 < arg_15_1.time_ and arg_15_1.time_ <= var_18_46 + arg_18_0 then
				arg_15_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action7_1")
			end

			local var_18_47 = 0

			if var_18_47 < arg_15_1.time_ and arg_15_1.time_ <= var_18_47 + arg_18_0 then
				arg_15_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_18_48 = 0
			local var_18_49 = 0.5

			if var_18_48 < arg_15_1.time_ and arg_15_1.time_ <= var_18_48 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_50 = arg_15_1:FormatText(StoryNameCfg[56].name)

				arg_15_1.leftNameTxt_.text = var_18_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_51 = arg_15_1:GetWordFromCfg(104112004)
				local var_18_52 = arg_15_1:FormatText(var_18_51.content)

				arg_15_1.text_.text = var_18_52

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_53 = 20
				local var_18_54 = utf8.len(var_18_52)
				local var_18_55 = var_18_53 <= 0 and var_18_49 or var_18_49 * (var_18_54 / var_18_53)

				if var_18_55 > 0 and var_18_49 < var_18_55 then
					arg_15_1.talkMaxDuration = var_18_55

					if var_18_55 + var_18_48 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_55 + var_18_48
					end
				end

				arg_15_1.text_.text = var_18_52
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112004", "story_v_out_104112.awb") ~= 0 then
					local var_18_56 = manager.audio:GetVoiceLength("story_v_out_104112", "104112004", "story_v_out_104112.awb") / 1000

					if var_18_56 + var_18_48 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_56 + var_18_48
					end

					if var_18_51.prefab_name ~= "" and arg_15_1.actors_[var_18_51.prefab_name] ~= nil then
						local var_18_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_51.prefab_name].transform, "story_v_out_104112", "104112004", "story_v_out_104112.awb")

						arg_15_1:RecordAudio("104112004", var_18_57)
						arg_15_1:RecordAudio("104112004", var_18_57)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104112", "104112004", "story_v_out_104112.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104112", "104112004", "story_v_out_104112.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_58 = math.max(var_18_49, arg_15_1.talkMaxDuration)

			if var_18_48 <= arg_15_1.time_ and arg_15_1.time_ < var_18_48 + var_18_58 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_48) / var_18_58

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_48 + var_18_58 and arg_15_1.time_ < var_18_48 + var_18_58 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104112005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104112005
		arg_19_1.duration_ = 8.966

		local var_19_0 = {
			ja = 8.966,
			ko = 6.5,
			zh = 5.233,
			en = 6.066
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
				arg_19_0:Play104112006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1080ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1080ui_story == nil then
				arg_19_1.var_.characterEffect1080ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1080ui_story then
					arg_19_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1080ui_story then
				arg_19_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1027ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1027ui_story == nil then
				arg_19_1.var_.characterEffect1027ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1027ui_story then
					local var_22_8 = Mathf.Lerp(0, 0.5, var_22_7)

					arg_19_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1027ui_story.fillRatio = var_22_8
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1027ui_story then
				local var_22_9 = 0.5

				arg_19_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1027ui_story.fillRatio = var_22_9
			end

			local var_22_10 = arg_19_1.actors_["1080ui_story"].transform
			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.var_.moveOldPos1080ui_story = var_22_10.localPosition
			end

			local var_22_12 = 0.001

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_12 then
				local var_22_13 = (arg_19_1.time_ - var_22_11) / var_22_12
				local var_22_14 = Vector3.New(0.7, -1.01, -6.05)

				var_22_10.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1080ui_story, var_22_14, var_22_13)

				local var_22_15 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_15.x, var_22_15.y, var_22_15.z)

				local var_22_16 = var_22_10.localEulerAngles

				var_22_16.z = 0
				var_22_16.x = 0
				var_22_10.localEulerAngles = var_22_16
			end

			if arg_19_1.time_ >= var_22_11 + var_22_12 and arg_19_1.time_ < var_22_11 + var_22_12 + arg_22_0 then
				var_22_10.localPosition = Vector3.New(0.7, -1.01, -6.05)

				local var_22_17 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_17.x, var_22_17.y, var_22_17.z)

				local var_22_18 = var_22_10.localEulerAngles

				var_22_18.z = 0
				var_22_18.x = 0
				var_22_10.localEulerAngles = var_22_18
			end

			local var_22_19 = 0

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_20 = 0
			local var_22_21 = 0.725

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_22 = arg_19_1:FormatText(StoryNameCfg[55].name)

				arg_19_1.leftNameTxt_.text = var_22_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_23 = arg_19_1:GetWordFromCfg(104112005)
				local var_22_24 = arg_19_1:FormatText(var_22_23.content)

				arg_19_1.text_.text = var_22_24

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_25 = 29
				local var_22_26 = utf8.len(var_22_24)
				local var_22_27 = var_22_25 <= 0 and var_22_21 or var_22_21 * (var_22_26 / var_22_25)

				if var_22_27 > 0 and var_22_21 < var_22_27 then
					arg_19_1.talkMaxDuration = var_22_27

					if var_22_27 + var_22_20 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_20
					end
				end

				arg_19_1.text_.text = var_22_24
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112005", "story_v_out_104112.awb") ~= 0 then
					local var_22_28 = manager.audio:GetVoiceLength("story_v_out_104112", "104112005", "story_v_out_104112.awb") / 1000

					if var_22_28 + var_22_20 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_28 + var_22_20
					end

					if var_22_23.prefab_name ~= "" and arg_19_1.actors_[var_22_23.prefab_name] ~= nil then
						local var_22_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_23.prefab_name].transform, "story_v_out_104112", "104112005", "story_v_out_104112.awb")

						arg_19_1:RecordAudio("104112005", var_22_29)
						arg_19_1:RecordAudio("104112005", var_22_29)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104112", "104112005", "story_v_out_104112.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104112", "104112005", "story_v_out_104112.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_30 = math.max(var_22_21, arg_19_1.talkMaxDuration)

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_30 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_20) / var_22_30

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_20 + var_22_30 and arg_19_1.time_ < var_22_20 + var_22_30 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104112006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104112006
		arg_23_1.duration_ = 3.8

		local var_23_0 = {
			ja = 3.133,
			ko = 2.7,
			zh = 3.8,
			en = 2.966
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
				arg_23_0:Play104112007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1059ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1059ui_story == nil then
				arg_23_1.var_.characterEffect1059ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1059ui_story then
					arg_23_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1059ui_story then
				arg_23_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_26_4 = arg_23_1.actors_["1080ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1080ui_story == nil then
				arg_23_1.var_.characterEffect1080ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1080ui_story then
					local var_26_8 = Mathf.Lerp(0, 0.5, var_26_7)

					arg_23_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1080ui_story.fillRatio = var_26_8
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1080ui_story then
				local var_26_9 = 0.5

				arg_23_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1080ui_story.fillRatio = var_26_9
			end

			local var_26_10 = arg_23_1.actors_["1080ui_story"].transform
			local var_26_11 = 0

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				arg_23_1.var_.moveOldPos1080ui_story = var_26_10.localPosition
			end

			local var_26_12 = 0.001

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_12 then
				local var_26_13 = (arg_23_1.time_ - var_26_11) / var_26_12
				local var_26_14 = Vector3.New(0, 100, 0)

				var_26_10.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1080ui_story, var_26_14, var_26_13)

				local var_26_15 = manager.ui.mainCamera.transform.position - var_26_10.position

				var_26_10.forward = Vector3.New(var_26_15.x, var_26_15.y, var_26_15.z)

				local var_26_16 = var_26_10.localEulerAngles

				var_26_16.z = 0
				var_26_16.x = 0
				var_26_10.localEulerAngles = var_26_16
			end

			if arg_23_1.time_ >= var_26_11 + var_26_12 and arg_23_1.time_ < var_26_11 + var_26_12 + arg_26_0 then
				var_26_10.localPosition = Vector3.New(0, 100, 0)

				local var_26_17 = manager.ui.mainCamera.transform.position - var_26_10.position

				var_26_10.forward = Vector3.New(var_26_17.x, var_26_17.y, var_26_17.z)

				local var_26_18 = var_26_10.localEulerAngles

				var_26_18.z = 0
				var_26_18.x = 0
				var_26_10.localEulerAngles = var_26_18
			end

			local var_26_19 = arg_23_1.actors_["1027ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos1027ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(0, 100, 0)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1027ui_story, var_26_23, var_26_22)

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

			local var_26_28 = arg_23_1.actors_["1059ui_story"].transform
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				arg_23_1.var_.moveOldPos1059ui_story = var_26_28.localPosition
			end

			local var_26_30 = 0.001

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_30 then
				local var_26_31 = (arg_23_1.time_ - var_26_29) / var_26_30
				local var_26_32 = Vector3.New(0, -1.05, -6)

				var_26_28.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1059ui_story, var_26_32, var_26_31)

				local var_26_33 = manager.ui.mainCamera.transform.position - var_26_28.position

				var_26_28.forward = Vector3.New(var_26_33.x, var_26_33.y, var_26_33.z)

				local var_26_34 = var_26_28.localEulerAngles

				var_26_34.z = 0
				var_26_34.x = 0
				var_26_28.localEulerAngles = var_26_34
			end

			if arg_23_1.time_ >= var_26_29 + var_26_30 and arg_23_1.time_ < var_26_29 + var_26_30 + arg_26_0 then
				var_26_28.localPosition = Vector3.New(0, -1.05, -6)

				local var_26_35 = manager.ui.mainCamera.transform.position - var_26_28.position

				var_26_28.forward = Vector3.New(var_26_35.x, var_26_35.y, var_26_35.z)

				local var_26_36 = var_26_28.localEulerAngles

				var_26_36.z = 0
				var_26_36.x = 0
				var_26_28.localEulerAngles = var_26_36
			end

			local var_26_37 = 0

			if var_26_37 < arg_23_1.time_ and arg_23_1.time_ <= var_26_37 + arg_26_0 then
				arg_23_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action4_1")
			end

			local var_26_38 = 0

			if var_26_38 < arg_23_1.time_ and arg_23_1.time_ <= var_26_38 + arg_26_0 then
				arg_23_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_26_39 = 0
			local var_26_40 = 0.475

			if var_26_39 < arg_23_1.time_ and arg_23_1.time_ <= var_26_39 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_41 = arg_23_1:FormatText(StoryNameCfg[28].name)

				arg_23_1.leftNameTxt_.text = var_26_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_42 = arg_23_1:GetWordFromCfg(104112006)
				local var_26_43 = arg_23_1:FormatText(var_26_42.content)

				arg_23_1.text_.text = var_26_43

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_44 = 19
				local var_26_45 = utf8.len(var_26_43)
				local var_26_46 = var_26_44 <= 0 and var_26_40 or var_26_40 * (var_26_45 / var_26_44)

				if var_26_46 > 0 and var_26_40 < var_26_46 then
					arg_23_1.talkMaxDuration = var_26_46

					if var_26_46 + var_26_39 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_46 + var_26_39
					end
				end

				arg_23_1.text_.text = var_26_43
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112006", "story_v_out_104112.awb") ~= 0 then
					local var_26_47 = manager.audio:GetVoiceLength("story_v_out_104112", "104112006", "story_v_out_104112.awb") / 1000

					if var_26_47 + var_26_39 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_47 + var_26_39
					end

					if var_26_42.prefab_name ~= "" and arg_23_1.actors_[var_26_42.prefab_name] ~= nil then
						local var_26_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_42.prefab_name].transform, "story_v_out_104112", "104112006", "story_v_out_104112.awb")

						arg_23_1:RecordAudio("104112006", var_26_48)
						arg_23_1:RecordAudio("104112006", var_26_48)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_104112", "104112006", "story_v_out_104112.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_104112", "104112006", "story_v_out_104112.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_49 = math.max(var_26_40, arg_23_1.talkMaxDuration)

			if var_26_39 <= arg_23_1.time_ and arg_23_1.time_ < var_26_39 + var_26_49 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_39) / var_26_49

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_39 + var_26_49 and arg_23_1.time_ < var_26_39 + var_26_49 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play104112007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104112007
		arg_27_1.duration_ = 9.6

		local var_27_0 = {
			ja = 9.6,
			ko = 4.5,
			zh = 4.933,
			en = 4.7
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
				arg_27_0:Play104112008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_1 = 0
			local var_30_2 = 0.55

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_3 = arg_27_1:FormatText(StoryNameCfg[28].name)

				arg_27_1.leftNameTxt_.text = var_30_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_4 = arg_27_1:GetWordFromCfg(104112007)
				local var_30_5 = arg_27_1:FormatText(var_30_4.content)

				arg_27_1.text_.text = var_30_5

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_6 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112007", "story_v_out_104112.awb") ~= 0 then
					local var_30_9 = manager.audio:GetVoiceLength("story_v_out_104112", "104112007", "story_v_out_104112.awb") / 1000

					if var_30_9 + var_30_1 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_9 + var_30_1
					end

					if var_30_4.prefab_name ~= "" and arg_27_1.actors_[var_30_4.prefab_name] ~= nil then
						local var_30_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_4.prefab_name].transform, "story_v_out_104112", "104112007", "story_v_out_104112.awb")

						arg_27_1:RecordAudio("104112007", var_30_10)
						arg_27_1:RecordAudio("104112007", var_30_10)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_104112", "104112007", "story_v_out_104112.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_104112", "104112007", "story_v_out_104112.awb")
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
	Play104112008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104112008
		arg_31_1.duration_ = 3.7

		local var_31_0 = {
			ja = 3.7,
			ko = 2.3,
			zh = 2.533,
			en = 2.333
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
				arg_31_0:Play104112009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				local var_34_2 = "play"
				local var_34_3 = "effect"

				arg_31_1:AudioAction(var_34_2, var_34_3, "se_story", "se_story_robot_short", "")
			end

			local var_34_4 = "3005_tpose"

			if arg_31_1.actors_[var_34_4] == nil then
				local var_34_5 = Object.Instantiate(Asset.Load("Char/" .. var_34_4), arg_31_1.stage_.transform)

				var_34_5.name = var_34_4
				var_34_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_4] = var_34_5

				local var_34_6 = var_34_5:GetComponentInChildren(typeof(CharacterEffect))

				var_34_6.enabled = true

				local var_34_7 = GameObjectTools.GetOrAddComponent(var_34_5, typeof(DynamicBoneHelper))

				if var_34_7 then
					var_34_7:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_6.transform, false)

				arg_31_1.var_[var_34_4 .. "Animator"] = var_34_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_4 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_4 .. "LipSync"] = var_34_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_8 = arg_31_1.actors_["3005_tpose"]
			local var_34_9 = 0

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 and arg_31_1.var_.characterEffect3005_tpose == nil then
				arg_31_1.var_.characterEffect3005_tpose = var_34_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_10 = 0.1

			if var_34_9 <= arg_31_1.time_ and arg_31_1.time_ < var_34_9 + var_34_10 then
				local var_34_11 = (arg_31_1.time_ - var_34_9) / var_34_10

				if arg_31_1.var_.characterEffect3005_tpose then
					arg_31_1.var_.characterEffect3005_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_9 + var_34_10 and arg_31_1.time_ < var_34_9 + var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect3005_tpose then
				arg_31_1.var_.characterEffect3005_tpose.fillFlat = false
			end

			local var_34_12 = arg_31_1.actors_["1059ui_story"]
			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 and arg_31_1.var_.characterEffect1059ui_story == nil then
				arg_31_1.var_.characterEffect1059ui_story = var_34_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_14 = 0.1

			if var_34_13 <= arg_31_1.time_ and arg_31_1.time_ < var_34_13 + var_34_14 then
				local var_34_15 = (arg_31_1.time_ - var_34_13) / var_34_14

				if arg_31_1.var_.characterEffect1059ui_story then
					local var_34_16 = Mathf.Lerp(0, 0.5, var_34_15)

					arg_31_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1059ui_story.fillRatio = var_34_16
				end
			end

			if arg_31_1.time_ >= var_34_13 + var_34_14 and arg_31_1.time_ < var_34_13 + var_34_14 + arg_34_0 and arg_31_1.var_.characterEffect1059ui_story then
				local var_34_17 = 0.5

				arg_31_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1059ui_story.fillRatio = var_34_17
			end

			local var_34_18 = arg_31_1.actors_["1059ui_story"].transform
			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1.var_.moveOldPos1059ui_story = var_34_18.localPosition
			end

			local var_34_20 = 0.001

			if var_34_19 <= arg_31_1.time_ and arg_31_1.time_ < var_34_19 + var_34_20 then
				local var_34_21 = (arg_31_1.time_ - var_34_19) / var_34_20
				local var_34_22 = Vector3.New(0, 100, 0)

				var_34_18.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1059ui_story, var_34_22, var_34_21)

				local var_34_23 = manager.ui.mainCamera.transform.position - var_34_18.position

				var_34_18.forward = Vector3.New(var_34_23.x, var_34_23.y, var_34_23.z)

				local var_34_24 = var_34_18.localEulerAngles

				var_34_24.z = 0
				var_34_24.x = 0
				var_34_18.localEulerAngles = var_34_24
			end

			if arg_31_1.time_ >= var_34_19 + var_34_20 and arg_31_1.time_ < var_34_19 + var_34_20 + arg_34_0 then
				var_34_18.localPosition = Vector3.New(0, 100, 0)

				local var_34_25 = manager.ui.mainCamera.transform.position - var_34_18.position

				var_34_18.forward = Vector3.New(var_34_25.x, var_34_25.y, var_34_25.z)

				local var_34_26 = var_34_18.localEulerAngles

				var_34_26.z = 0
				var_34_26.x = 0
				var_34_18.localEulerAngles = var_34_26
			end

			local var_34_27 = arg_31_1.actors_["3005_tpose"].transform
			local var_34_28 = 0

			if var_34_28 < arg_31_1.time_ and arg_31_1.time_ <= var_34_28 + arg_34_0 then
				arg_31_1.var_.moveOldPos3005_tpose = var_34_27.localPosition
			end

			local var_34_29 = 0.001

			if var_34_28 <= arg_31_1.time_ and arg_31_1.time_ < var_34_28 + var_34_29 then
				local var_34_30 = (arg_31_1.time_ - var_34_28) / var_34_29
				local var_34_31 = Vector3.New(0, -1.95, -2.63)

				var_34_27.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos3005_tpose, var_34_31, var_34_30)

				local var_34_32 = manager.ui.mainCamera.transform.position - var_34_27.position

				var_34_27.forward = Vector3.New(var_34_32.x, var_34_32.y, var_34_32.z)

				local var_34_33 = var_34_27.localEulerAngles

				var_34_33.z = 0
				var_34_33.x = 0
				var_34_27.localEulerAngles = var_34_33
			end

			if arg_31_1.time_ >= var_34_28 + var_34_29 and arg_31_1.time_ < var_34_28 + var_34_29 + arg_34_0 then
				var_34_27.localPosition = Vector3.New(0, -1.95, -2.63)

				local var_34_34 = manager.ui.mainCamera.transform.position - var_34_27.position

				var_34_27.forward = Vector3.New(var_34_34.x, var_34_34.y, var_34_34.z)

				local var_34_35 = var_34_27.localEulerAngles

				var_34_35.z = 0
				var_34_35.x = 0
				var_34_27.localEulerAngles = var_34_35
			end

			local var_34_36 = 0

			if var_34_36 < arg_31_1.time_ and arg_31_1.time_ <= var_34_36 + arg_34_0 then
				arg_31_1:PlayTimeline("3005_tpose", "StoryTimeline/CharAction/story3005/story3005action/3005action1_1")
			end

			local var_34_37 = 0
			local var_34_38 = 0.175

			if var_34_37 < arg_31_1.time_ and arg_31_1.time_ <= var_34_37 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_39 = arg_31_1:FormatText(StoryNameCfg[58].name)

				arg_31_1.leftNameTxt_.text = var_34_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_40 = arg_31_1:GetWordFromCfg(104112008)
				local var_34_41 = arg_31_1:FormatText(var_34_40.content)

				arg_31_1.text_.text = var_34_41

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_42 = 7
				local var_34_43 = utf8.len(var_34_41)
				local var_34_44 = var_34_42 <= 0 and var_34_38 or var_34_38 * (var_34_43 / var_34_42)

				if var_34_44 > 0 and var_34_38 < var_34_44 then
					arg_31_1.talkMaxDuration = var_34_44

					if var_34_44 + var_34_37 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_44 + var_34_37
					end
				end

				arg_31_1.text_.text = var_34_41
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112008", "story_v_out_104112.awb") ~= 0 then
					local var_34_45 = manager.audio:GetVoiceLength("story_v_out_104112", "104112008", "story_v_out_104112.awb") / 1000

					if var_34_45 + var_34_37 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_45 + var_34_37
					end

					if var_34_40.prefab_name ~= "" and arg_31_1.actors_[var_34_40.prefab_name] ~= nil then
						local var_34_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_40.prefab_name].transform, "story_v_out_104112", "104112008", "story_v_out_104112.awb")

						arg_31_1:RecordAudio("104112008", var_34_46)
						arg_31_1:RecordAudio("104112008", var_34_46)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104112", "104112008", "story_v_out_104112.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104112", "104112008", "story_v_out_104112.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_47 = math.max(var_34_38, arg_31_1.talkMaxDuration)

			if var_34_37 <= arg_31_1.time_ and arg_31_1.time_ < var_34_37 + var_34_47 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_37) / var_34_47

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_37 + var_34_47 and arg_31_1.time_ < var_34_37 + var_34_47 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play104112009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104112009
		arg_35_1.duration_ = 6.233

		local var_35_0 = {
			ja = 5.466,
			ko = 3.9,
			zh = 4.666,
			en = 6.233
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
				arg_35_0:Play104112010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1027ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1027ui_story == nil then
				arg_35_1.var_.characterEffect1027ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1027ui_story then
					arg_35_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1027ui_story then
				arg_35_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["3005_tpose"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect3005_tpose == nil then
				arg_35_1.var_.characterEffect3005_tpose = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect3005_tpose then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect3005_tpose.fillFlat = true
					arg_35_1.var_.characterEffect3005_tpose.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect3005_tpose then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect3005_tpose.fillFlat = true
				arg_35_1.var_.characterEffect3005_tpose.fillRatio = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["3005_tpose"].transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.moveOldPos3005_tpose = var_38_10.localPosition
			end

			local var_38_12 = 0.001

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12
				local var_38_14 = Vector3.New(0, 100, 0)

				var_38_10.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos3005_tpose, var_38_14, var_38_13)

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

			local var_38_19 = 0

			if var_38_19 < arg_35_1.time_ and arg_35_1.time_ <= var_38_19 + arg_38_0 then
				arg_35_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action4_1")
			end

			local var_38_20 = arg_35_1.actors_["1027ui_story"].transform
			local var_38_21 = 0

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.var_.moveOldPos1027ui_story = var_38_20.localPosition
			end

			local var_38_22 = 0.001

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22
				local var_38_24 = Vector3.New(0, -0.81, -5.8)

				var_38_20.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1027ui_story, var_38_24, var_38_23)

				local var_38_25 = manager.ui.mainCamera.transform.position - var_38_20.position

				var_38_20.forward = Vector3.New(var_38_25.x, var_38_25.y, var_38_25.z)

				local var_38_26 = var_38_20.localEulerAngles

				var_38_26.z = 0
				var_38_26.x = 0
				var_38_20.localEulerAngles = var_38_26
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 then
				var_38_20.localPosition = Vector3.New(0, -0.81, -5.8)

				local var_38_27 = manager.ui.mainCamera.transform.position - var_38_20.position

				var_38_20.forward = Vector3.New(var_38_27.x, var_38_27.y, var_38_27.z)

				local var_38_28 = var_38_20.localEulerAngles

				var_38_28.z = 0
				var_38_28.x = 0
				var_38_20.localEulerAngles = var_38_28
			end

			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 then
				arg_35_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_38_30 = 0
			local var_38_31 = 0.55

			if var_38_30 < arg_35_1.time_ and arg_35_1.time_ <= var_38_30 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_32 = arg_35_1:FormatText(StoryNameCfg[56].name)

				arg_35_1.leftNameTxt_.text = var_38_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_33 = arg_35_1:GetWordFromCfg(104112009)
				local var_38_34 = arg_35_1:FormatText(var_38_33.content)

				arg_35_1.text_.text = var_38_34

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_35 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112009", "story_v_out_104112.awb") ~= 0 then
					local var_38_38 = manager.audio:GetVoiceLength("story_v_out_104112", "104112009", "story_v_out_104112.awb") / 1000

					if var_38_38 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_38 + var_38_30
					end

					if var_38_33.prefab_name ~= "" and arg_35_1.actors_[var_38_33.prefab_name] ~= nil then
						local var_38_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_33.prefab_name].transform, "story_v_out_104112", "104112009", "story_v_out_104112.awb")

						arg_35_1:RecordAudio("104112009", var_38_39)
						arg_35_1:RecordAudio("104112009", var_38_39)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_104112", "104112009", "story_v_out_104112.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_104112", "104112009", "story_v_out_104112.awb")
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
	Play104112010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104112010
		arg_39_1.duration_ = 2.3

		local var_39_0 = {
			ja = 2.3,
			ko = 1,
			zh = 1.5,
			en = 1.033
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
				arg_39_0:Play104112011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1027ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1027ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1027ui_story, var_42_4, var_42_3)

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

			local var_42_9 = 0
			local var_42_10 = 0.075

			if var_42_9 < arg_39_1.time_ and arg_39_1.time_ <= var_42_9 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_11 = arg_39_1:FormatText(StoryNameCfg[55].name)

				arg_39_1.leftNameTxt_.text = var_42_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1080")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_12 = arg_39_1:GetWordFromCfg(104112010)
				local var_42_13 = arg_39_1:FormatText(var_42_12.content)

				arg_39_1.text_.text = var_42_13

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_14 = 3
				local var_42_15 = utf8.len(var_42_13)
				local var_42_16 = var_42_14 <= 0 and var_42_10 or var_42_10 * (var_42_15 / var_42_14)

				if var_42_16 > 0 and var_42_10 < var_42_16 then
					arg_39_1.talkMaxDuration = var_42_16

					if var_42_16 + var_42_9 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_16 + var_42_9
					end
				end

				arg_39_1.text_.text = var_42_13
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112010", "story_v_out_104112.awb") ~= 0 then
					local var_42_17 = manager.audio:GetVoiceLength("story_v_out_104112", "104112010", "story_v_out_104112.awb") / 1000

					if var_42_17 + var_42_9 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_17 + var_42_9
					end

					if var_42_12.prefab_name ~= "" and arg_39_1.actors_[var_42_12.prefab_name] ~= nil then
						local var_42_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_12.prefab_name].transform, "story_v_out_104112", "104112010", "story_v_out_104112.awb")

						arg_39_1:RecordAudio("104112010", var_42_18)
						arg_39_1:RecordAudio("104112010", var_42_18)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_104112", "104112010", "story_v_out_104112.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_104112", "104112010", "story_v_out_104112.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_19 = math.max(var_42_10, arg_39_1.talkMaxDuration)

			if var_42_9 <= arg_39_1.time_ and arg_39_1.time_ < var_42_9 + var_42_19 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_9) / var_42_19

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_9 + var_42_19 and arg_39_1.time_ < var_42_9 + var_42_19 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play104112011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104112011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play104112012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.7

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_2 = arg_43_1:GetWordFromCfg(104112011)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 28
				local var_46_5 = utf8.len(var_46_3)
				local var_46_6 = var_46_4 <= 0 and var_46_1 or var_46_1 * (var_46_5 / var_46_4)

				if var_46_6 > 0 and var_46_1 < var_46_6 then
					arg_43_1.talkMaxDuration = var_46_6

					if var_46_6 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_6 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_3
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_7 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_7 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_7

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_7 and arg_43_1.time_ < var_46_0 + var_46_7 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play104112012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 104112012
		arg_47_1.duration_ = 7.7

		local var_47_0 = {
			ja = 7.7,
			ko = 5.066,
			zh = 6.433,
			en = 7.166
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
				arg_47_0:Play104112013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1027ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1027ui_story == nil then
				arg_47_1.var_.characterEffect1027ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1027ui_story then
					arg_47_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1027ui_story then
				arg_47_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1027ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos1027ui_story = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(-0.7, -0.81, -5.8)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1027ui_story, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_50_15 = 0
			local var_50_16 = 0.75

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[56].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(104112012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 30
				local var_50_21 = utf8.len(var_50_19)
				local var_50_22 = var_50_20 <= 0 and var_50_16 or var_50_16 * (var_50_21 / var_50_20)

				if var_50_22 > 0 and var_50_16 < var_50_22 then
					arg_47_1.talkMaxDuration = var_50_22

					if var_50_22 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_22 + var_50_15
					end
				end

				arg_47_1.text_.text = var_50_19
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112012", "story_v_out_104112.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_104112", "104112012", "story_v_out_104112.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_104112", "104112012", "story_v_out_104112.awb")

						arg_47_1:RecordAudio("104112012", var_50_24)
						arg_47_1:RecordAudio("104112012", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_104112", "104112012", "story_v_out_104112.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_104112", "104112012", "story_v_out_104112.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_25 = math.max(var_50_16, arg_47_1.talkMaxDuration)

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_25 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_15) / var_50_25

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_15 + var_50_25 and arg_47_1.time_ < var_50_15 + var_50_25 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play104112013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 104112013
		arg_51_1.duration_ = 1.733

		local var_51_0 = {
			ja = 1.733,
			ko = 1.1,
			zh = 1.466,
			en = 0.7
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
				arg_51_0:Play104112014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1027ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1027ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1027ui_story, var_54_4, var_54_3)

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

			local var_54_9 = 0
			local var_54_10 = 0.05

			if var_54_9 < arg_51_1.time_ and arg_51_1.time_ <= var_54_9 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_11 = arg_51_1:FormatText(StoryNameCfg[55].name)

				arg_51_1.leftNameTxt_.text = var_54_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1080")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_12 = arg_51_1:GetWordFromCfg(104112013)
				local var_54_13 = arg_51_1:FormatText(var_54_12.content)

				arg_51_1.text_.text = var_54_13

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_14 = 2
				local var_54_15 = utf8.len(var_54_13)
				local var_54_16 = var_54_14 <= 0 and var_54_10 or var_54_10 * (var_54_15 / var_54_14)

				if var_54_16 > 0 and var_54_10 < var_54_16 then
					arg_51_1.talkMaxDuration = var_54_16

					if var_54_16 + var_54_9 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_16 + var_54_9
					end
				end

				arg_51_1.text_.text = var_54_13
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112013", "story_v_out_104112.awb") ~= 0 then
					local var_54_17 = manager.audio:GetVoiceLength("story_v_out_104112", "104112013", "story_v_out_104112.awb") / 1000

					if var_54_17 + var_54_9 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_9
					end

					if var_54_12.prefab_name ~= "" and arg_51_1.actors_[var_54_12.prefab_name] ~= nil then
						local var_54_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_12.prefab_name].transform, "story_v_out_104112", "104112013", "story_v_out_104112.awb")

						arg_51_1:RecordAudio("104112013", var_54_18)
						arg_51_1:RecordAudio("104112013", var_54_18)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_104112", "104112013", "story_v_out_104112.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_104112", "104112013", "story_v_out_104112.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_19 = math.max(var_54_10, arg_51_1.talkMaxDuration)

			if var_54_9 <= arg_51_1.time_ and arg_51_1.time_ < var_54_9 + var_54_19 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_9) / var_54_19

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_9 + var_54_19 and arg_51_1.time_ < var_54_9 + var_54_19 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play104112014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 104112014
		arg_55_1.duration_ = 9

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play104112015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_1 = 2

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_1 then
				local var_58_2 = (arg_55_1.time_ - var_58_0) / var_58_1
				local var_58_3 = Color.New(0, 0, 0)

				var_58_3.a = Mathf.Lerp(0, 1, var_58_2)
				arg_55_1.mask_.color = var_58_3
			end

			if arg_55_1.time_ >= var_58_0 + var_58_1 and arg_55_1.time_ < var_58_0 + var_58_1 + arg_58_0 then
				local var_58_4 = Color.New(0, 0, 0)

				var_58_4.a = 1
				arg_55_1.mask_.color = var_58_4
			end

			local var_58_5 = 2

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_6 = 2

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6
				local var_58_8 = Color.New(0, 0, 0)

				var_58_8.a = Mathf.Lerp(1, 0, var_58_7)
				arg_55_1.mask_.color = var_58_8
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 then
				local var_58_9 = Color.New(0, 0, 0)
				local var_58_10 = 0

				arg_55_1.mask_.enabled = false
				var_58_9.a = var_58_10
				arg_55_1.mask_.color = var_58_9
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_11 = 4
			local var_58_12 = 0.375

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_13 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_13:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_13:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_13:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_14 = arg_55_1:GetWordFromCfg(104112014)
				local var_58_15 = arg_55_1:FormatText(var_58_14.content)

				arg_55_1.text_.text = var_58_15

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_16 = 15
				local var_58_17 = utf8.len(var_58_15)
				local var_58_18 = var_58_16 <= 0 and var_58_12 or var_58_12 * (var_58_17 / var_58_16)

				if var_58_18 > 0 and var_58_12 < var_58_18 then
					arg_55_1.talkMaxDuration = var_58_18
					var_58_11 = var_58_11 + 0.3

					if var_58_18 + var_58_11 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_18 + var_58_11
					end
				end

				arg_55_1.text_.text = var_58_15
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_19 = var_58_11 + 0.3
			local var_58_20 = math.max(var_58_12, arg_55_1.talkMaxDuration)

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_20 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_19) / var_58_20

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_19 + var_58_20 and arg_55_1.time_ < var_58_19 + var_58_20 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play104112015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 104112015
		arg_61_1.duration_ = 8.5

		local var_61_0 = {
			ja = 8.5,
			ko = 5.9,
			zh = 6.8,
			en = 5.633
		}
		local var_61_1 = manager.audio:GetLocalizationFlag()

		if var_61_0[var_61_1] ~= nil then
			arg_61_1.duration_ = var_61_0[var_61_1]
		end

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play104112016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "3008ui_story"

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

			local var_64_4 = arg_61_1.actors_["3008ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect3008ui_story == nil then
				arg_61_1.var_.characterEffect3008ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.1

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect3008ui_story then
					arg_61_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect3008ui_story then
				arg_61_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_64_8 = "1035ui_story"

			if arg_61_1.actors_[var_64_8] == nil then
				local var_64_9 = Object.Instantiate(Asset.Load("Char/" .. var_64_8), arg_61_1.stage_.transform)

				var_64_9.name = var_64_8
				var_64_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.actors_[var_64_8] = var_64_9

				local var_64_10 = var_64_9:GetComponentInChildren(typeof(CharacterEffect))

				var_64_10.enabled = true

				local var_64_11 = GameObjectTools.GetOrAddComponent(var_64_9, typeof(DynamicBoneHelper))

				if var_64_11 then
					var_64_11:EnableDynamicBone(false)
				end

				arg_61_1:ShowWeapon(var_64_10.transform, false)

				arg_61_1.var_[var_64_8 .. "Animator"] = var_64_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_61_1.var_[var_64_8 .. "Animator"].applyRootMotion = true
				arg_61_1.var_[var_64_8 .. "LipSync"] = var_64_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_64_12 = arg_61_1.actors_["1035ui_story"]
			local var_64_13 = 0

			if var_64_13 < arg_61_1.time_ and arg_61_1.time_ <= var_64_13 + arg_64_0 and arg_61_1.var_.characterEffect1035ui_story == nil then
				arg_61_1.var_.characterEffect1035ui_story = var_64_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_14 = 0.1

			if var_64_13 <= arg_61_1.time_ and arg_61_1.time_ < var_64_13 + var_64_14 then
				local var_64_15 = (arg_61_1.time_ - var_64_13) / var_64_14

				if arg_61_1.var_.characterEffect1035ui_story then
					local var_64_16 = Mathf.Lerp(0, 0.5, var_64_15)

					arg_61_1.var_.characterEffect1035ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1035ui_story.fillRatio = var_64_16
				end
			end

			if arg_61_1.time_ >= var_64_13 + var_64_14 and arg_61_1.time_ < var_64_13 + var_64_14 + arg_64_0 and arg_61_1.var_.characterEffect1035ui_story then
				local var_64_17 = 0.5

				arg_61_1.var_.characterEffect1035ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1035ui_story.fillRatio = var_64_17
			end

			local var_64_18 = arg_61_1.actors_["3008ui_story"].transform
			local var_64_19 = 0

			if var_64_19 < arg_61_1.time_ and arg_61_1.time_ <= var_64_19 + arg_64_0 then
				arg_61_1.var_.moveOldPos3008ui_story = var_64_18.localPosition
			end

			local var_64_20 = 0.001

			if var_64_19 <= arg_61_1.time_ and arg_61_1.time_ < var_64_19 + var_64_20 then
				local var_64_21 = (arg_61_1.time_ - var_64_19) / var_64_20
				local var_64_22 = Vector3.New(0.7, -1.51, -4.3)

				var_64_18.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos3008ui_story, var_64_22, var_64_21)

				local var_64_23 = manager.ui.mainCamera.transform.position - var_64_18.position

				var_64_18.forward = Vector3.New(var_64_23.x, var_64_23.y, var_64_23.z)

				local var_64_24 = var_64_18.localEulerAngles

				var_64_24.z = 0
				var_64_24.x = 0
				var_64_18.localEulerAngles = var_64_24
			end

			if arg_61_1.time_ >= var_64_19 + var_64_20 and arg_61_1.time_ < var_64_19 + var_64_20 + arg_64_0 then
				var_64_18.localPosition = Vector3.New(0.7, -1.51, -4.3)

				local var_64_25 = manager.ui.mainCamera.transform.position - var_64_18.position

				var_64_18.forward = Vector3.New(var_64_25.x, var_64_25.y, var_64_25.z)

				local var_64_26 = var_64_18.localEulerAngles

				var_64_26.z = 0
				var_64_26.x = 0
				var_64_18.localEulerAngles = var_64_26
			end

			local var_64_27 = arg_61_1.actors_["1035ui_story"].transform
			local var_64_28 = 0

			if var_64_28 < arg_61_1.time_ and arg_61_1.time_ <= var_64_28 + arg_64_0 then
				arg_61_1.var_.moveOldPos1035ui_story = var_64_27.localPosition
			end

			local var_64_29 = 0.001

			if var_64_28 <= arg_61_1.time_ and arg_61_1.time_ < var_64_28 + var_64_29 then
				local var_64_30 = (arg_61_1.time_ - var_64_28) / var_64_29
				local var_64_31 = Vector3.New(-0.7, -1.05, -5.6)

				var_64_27.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1035ui_story, var_64_31, var_64_30)

				local var_64_32 = manager.ui.mainCamera.transform.position - var_64_27.position

				var_64_27.forward = Vector3.New(var_64_32.x, var_64_32.y, var_64_32.z)

				local var_64_33 = var_64_27.localEulerAngles

				var_64_33.z = 0
				var_64_33.x = 0
				var_64_27.localEulerAngles = var_64_33
			end

			if arg_61_1.time_ >= var_64_28 + var_64_29 and arg_61_1.time_ < var_64_28 + var_64_29 + arg_64_0 then
				var_64_27.localPosition = Vector3.New(-0.7, -1.05, -5.6)

				local var_64_34 = manager.ui.mainCamera.transform.position - var_64_27.position

				var_64_27.forward = Vector3.New(var_64_34.x, var_64_34.y, var_64_34.z)

				local var_64_35 = var_64_27.localEulerAngles

				var_64_35.z = 0
				var_64_35.x = 0
				var_64_27.localEulerAngles = var_64_35
			end

			local var_64_36 = 0

			if var_64_36 < arg_61_1.time_ and arg_61_1.time_ <= var_64_36 + arg_64_0 then
				arg_61_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action4_1")
			end

			local var_64_37 = 0

			if var_64_37 < arg_61_1.time_ and arg_61_1.time_ <= var_64_37 + arg_64_0 then
				arg_61_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action1_1")
			end

			local var_64_38 = 0

			if var_64_38 < arg_61_1.time_ and arg_61_1.time_ <= var_64_38 + arg_64_0 then
				arg_61_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_64_39 = 0
			local var_64_40 = 0.55

			if var_64_39 < arg_61_1.time_ and arg_61_1.time_ <= var_64_39 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_41 = arg_61_1:FormatText(StoryNameCfg[20].name)

				arg_61_1.leftNameTxt_.text = var_64_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_42 = arg_61_1:GetWordFromCfg(104112015)
				local var_64_43 = arg_61_1:FormatText(var_64_42.content)

				arg_61_1.text_.text = var_64_43

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_44 = 21
				local var_64_45 = utf8.len(var_64_43)
				local var_64_46 = var_64_44 <= 0 and var_64_40 or var_64_40 * (var_64_45 / var_64_44)

				if var_64_46 > 0 and var_64_40 < var_64_46 then
					arg_61_1.talkMaxDuration = var_64_46

					if var_64_46 + var_64_39 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_46 + var_64_39
					end
				end

				arg_61_1.text_.text = var_64_43
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112015", "story_v_out_104112.awb") ~= 0 then
					local var_64_47 = manager.audio:GetVoiceLength("story_v_out_104112", "104112015", "story_v_out_104112.awb") / 1000

					if var_64_47 + var_64_39 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_47 + var_64_39
					end

					if var_64_42.prefab_name ~= "" and arg_61_1.actors_[var_64_42.prefab_name] ~= nil then
						local var_64_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_42.prefab_name].transform, "story_v_out_104112", "104112015", "story_v_out_104112.awb")

						arg_61_1:RecordAudio("104112015", var_64_48)
						arg_61_1:RecordAudio("104112015", var_64_48)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_104112", "104112015", "story_v_out_104112.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_104112", "104112015", "story_v_out_104112.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_49 = math.max(var_64_40, arg_61_1.talkMaxDuration)

			if var_64_39 <= arg_61_1.time_ and arg_61_1.time_ < var_64_39 + var_64_49 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_39) / var_64_49

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_39 + var_64_49 and arg_61_1.time_ < var_64_39 + var_64_49 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play104112016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 104112016
		arg_65_1.duration_ = 9.2

		local var_65_0 = {
			ja = 7.1,
			ko = 4.533,
			zh = 9.2,
			en = 6.733
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
				arg_65_0:Play104112017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["3008ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect3008ui_story == nil then
				arg_65_1.var_.characterEffect3008ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.1

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect3008ui_story then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_65_1.var_.characterEffect3008ui_story.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect3008ui_story then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_65_1.var_.characterEffect3008ui_story.fillRatio = var_68_5
			end

			local var_68_6 = arg_65_1.actors_["1035ui_story"]
			local var_68_7 = 0

			if var_68_7 < arg_65_1.time_ and arg_65_1.time_ <= var_68_7 + arg_68_0 and arg_65_1.var_.characterEffect1035ui_story == nil then
				arg_65_1.var_.characterEffect1035ui_story = var_68_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_8 = 0.1

			if var_68_7 <= arg_65_1.time_ and arg_65_1.time_ < var_68_7 + var_68_8 then
				local var_68_9 = (arg_65_1.time_ - var_68_7) / var_68_8

				if arg_65_1.var_.characterEffect1035ui_story then
					arg_65_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_7 + var_68_8 and arg_65_1.time_ < var_68_7 + var_68_8 + arg_68_0 and arg_65_1.var_.characterEffect1035ui_story then
				arg_65_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_68_10 = 0

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 then
				arg_65_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action9_1")
			end

			local var_68_11 = 0
			local var_68_12 = 0.625

			if var_68_11 < arg_65_1.time_ and arg_65_1.time_ <= var_68_11 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_13 = arg_65_1:FormatText(StoryNameCfg[21].name)

				arg_65_1.leftNameTxt_.text = var_68_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_14 = arg_65_1:GetWordFromCfg(104112016)
				local var_68_15 = arg_65_1:FormatText(var_68_14.content)

				arg_65_1.text_.text = var_68_15

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_16 = 24
				local var_68_17 = utf8.len(var_68_15)
				local var_68_18 = var_68_16 <= 0 and var_68_12 or var_68_12 * (var_68_17 / var_68_16)

				if var_68_18 > 0 and var_68_12 < var_68_18 then
					arg_65_1.talkMaxDuration = var_68_18

					if var_68_18 + var_68_11 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_18 + var_68_11
					end
				end

				arg_65_1.text_.text = var_68_15
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112016", "story_v_out_104112.awb") ~= 0 then
					local var_68_19 = manager.audio:GetVoiceLength("story_v_out_104112", "104112016", "story_v_out_104112.awb") / 1000

					if var_68_19 + var_68_11 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_19 + var_68_11
					end

					if var_68_14.prefab_name ~= "" and arg_65_1.actors_[var_68_14.prefab_name] ~= nil then
						local var_68_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_14.prefab_name].transform, "story_v_out_104112", "104112016", "story_v_out_104112.awb")

						arg_65_1:RecordAudio("104112016", var_68_20)
						arg_65_1:RecordAudio("104112016", var_68_20)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_104112", "104112016", "story_v_out_104112.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_104112", "104112016", "story_v_out_104112.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_21 = math.max(var_68_12, arg_65_1.talkMaxDuration)

			if var_68_11 <= arg_65_1.time_ and arg_65_1.time_ < var_68_11 + var_68_21 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_11) / var_68_21

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_11 + var_68_21 and arg_65_1.time_ < var_68_11 + var_68_21 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play104112017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 104112017
		arg_69_1.duration_ = 9.1

		local var_69_0 = {
			ja = 9.1,
			ko = 4.3,
			zh = 5.833,
			en = 5
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
				arg_69_0:Play104112018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["3008ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect3008ui_story == nil then
				arg_69_1.var_.characterEffect3008ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.1

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect3008ui_story then
					arg_69_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect3008ui_story then
				arg_69_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_72_4 = arg_69_1.actors_["1035ui_story"]
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and arg_69_1.var_.characterEffect1035ui_story == nil then
				arg_69_1.var_.characterEffect1035ui_story = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.1

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect1035ui_story then
					local var_72_8 = Mathf.Lerp(0, 0.5, var_72_7)

					arg_69_1.var_.characterEffect1035ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1035ui_story.fillRatio = var_72_8
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and arg_69_1.var_.characterEffect1035ui_story then
				local var_72_9 = 0.5

				arg_69_1.var_.characterEffect1035ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1035ui_story.fillRatio = var_72_9
			end

			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				arg_69_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008actionlink/3008action442")
			end

			local var_72_11 = 0

			if var_72_11 < arg_69_1.time_ and arg_69_1.time_ <= var_72_11 + arg_72_0 then
				arg_69_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_72_12 = 0
			local var_72_13 = 0.525

			if var_72_12 < arg_69_1.time_ and arg_69_1.time_ <= var_72_12 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_14 = arg_69_1:FormatText(StoryNameCfg[20].name)

				arg_69_1.leftNameTxt_.text = var_72_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_15 = arg_69_1:GetWordFromCfg(104112017)
				local var_72_16 = arg_69_1:FormatText(var_72_15.content)

				arg_69_1.text_.text = var_72_16

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_17 = 21
				local var_72_18 = utf8.len(var_72_16)
				local var_72_19 = var_72_17 <= 0 and var_72_13 or var_72_13 * (var_72_18 / var_72_17)

				if var_72_19 > 0 and var_72_13 < var_72_19 then
					arg_69_1.talkMaxDuration = var_72_19

					if var_72_19 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_19 + var_72_12
					end
				end

				arg_69_1.text_.text = var_72_16
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112017", "story_v_out_104112.awb") ~= 0 then
					local var_72_20 = manager.audio:GetVoiceLength("story_v_out_104112", "104112017", "story_v_out_104112.awb") / 1000

					if var_72_20 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_12
					end

					if var_72_15.prefab_name ~= "" and arg_69_1.actors_[var_72_15.prefab_name] ~= nil then
						local var_72_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_15.prefab_name].transform, "story_v_out_104112", "104112017", "story_v_out_104112.awb")

						arg_69_1:RecordAudio("104112017", var_72_21)
						arg_69_1:RecordAudio("104112017", var_72_21)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_104112", "104112017", "story_v_out_104112.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_104112", "104112017", "story_v_out_104112.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_22 = math.max(var_72_13, arg_69_1.talkMaxDuration)

			if var_72_12 <= arg_69_1.time_ and arg_69_1.time_ < var_72_12 + var_72_22 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_12) / var_72_22

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_12 + var_72_22 and arg_69_1.time_ < var_72_12 + var_72_22 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play104112018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 104112018
		arg_73_1.duration_ = 3.266

		local var_73_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 3.266,
			en = 2.366
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
				arg_73_0:Play104112019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["3008ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect3008ui_story == nil then
				arg_73_1.var_.characterEffect3008ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect3008ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_73_1.var_.characterEffect3008ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect3008ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_73_1.var_.characterEffect3008ui_story.fillRatio = var_76_5
			end

			local var_76_6 = arg_73_1.actors_["1035ui_story"]
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 and arg_73_1.var_.characterEffect1035ui_story == nil then
				arg_73_1.var_.characterEffect1035ui_story = var_76_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_8 = 0.1

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_7) / var_76_8

				if arg_73_1.var_.characterEffect1035ui_story then
					arg_73_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_7 + var_76_8 and arg_73_1.time_ < var_76_7 + var_76_8 + arg_76_0 and arg_73_1.var_.characterEffect1035ui_story then
				arg_73_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035actionlink/1035action494")
			end

			local var_76_11 = 0
			local var_76_12 = 0.1

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_13 = arg_73_1:FormatText(StoryNameCfg[21].name)

				arg_73_1.leftNameTxt_.text = var_76_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_14 = arg_73_1:GetWordFromCfg(104112018)
				local var_76_15 = arg_73_1:FormatText(var_76_14.content)

				arg_73_1.text_.text = var_76_15

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_16 = 4
				local var_76_17 = utf8.len(var_76_15)
				local var_76_18 = var_76_16 <= 0 and var_76_12 or var_76_12 * (var_76_17 / var_76_16)

				if var_76_18 > 0 and var_76_12 < var_76_18 then
					arg_73_1.talkMaxDuration = var_76_18

					if var_76_18 + var_76_11 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_18 + var_76_11
					end
				end

				arg_73_1.text_.text = var_76_15
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112018", "story_v_out_104112.awb") ~= 0 then
					local var_76_19 = manager.audio:GetVoiceLength("story_v_out_104112", "104112018", "story_v_out_104112.awb") / 1000

					if var_76_19 + var_76_11 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_11
					end

					if var_76_14.prefab_name ~= "" and arg_73_1.actors_[var_76_14.prefab_name] ~= nil then
						local var_76_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_14.prefab_name].transform, "story_v_out_104112", "104112018", "story_v_out_104112.awb")

						arg_73_1:RecordAudio("104112018", var_76_20)
						arg_73_1:RecordAudio("104112018", var_76_20)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_104112", "104112018", "story_v_out_104112.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_104112", "104112018", "story_v_out_104112.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_21 = math.max(var_76_12, arg_73_1.talkMaxDuration)

			if var_76_11 <= arg_73_1.time_ and arg_73_1.time_ < var_76_11 + var_76_21 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_11) / var_76_21

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_11 + var_76_21 and arg_73_1.time_ < var_76_11 + var_76_21 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play104112019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 104112019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play104112020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["3008ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos3008ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, 100, 0)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos3008ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, 100, 0)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["1035ui_story"].transform
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1.var_.moveOldPos1035ui_story = var_80_9.localPosition
			end

			local var_80_11 = 0.001

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11
				local var_80_13 = Vector3.New(0, 100, 0)

				var_80_9.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1035ui_story, var_80_13, var_80_12)

				local var_80_14 = manager.ui.mainCamera.transform.position - var_80_9.position

				var_80_9.forward = Vector3.New(var_80_14.x, var_80_14.y, var_80_14.z)

				local var_80_15 = var_80_9.localEulerAngles

				var_80_15.z = 0
				var_80_15.x = 0
				var_80_9.localEulerAngles = var_80_15
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 then
				var_80_9.localPosition = Vector3.New(0, 100, 0)

				local var_80_16 = manager.ui.mainCamera.transform.position - var_80_9.position

				var_80_9.forward = Vector3.New(var_80_16.x, var_80_16.y, var_80_16.z)

				local var_80_17 = var_80_9.localEulerAngles

				var_80_17.z = 0
				var_80_17.x = 0
				var_80_9.localEulerAngles = var_80_17
			end

			local var_80_18 = 0
			local var_80_19 = 0.475

			if var_80_18 < arg_77_1.time_ and arg_77_1.time_ <= var_80_18 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_20 = arg_77_1:GetWordFromCfg(104112019)
				local var_80_21 = arg_77_1:FormatText(var_80_20.content)

				arg_77_1.text_.text = var_80_21

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_22 = 19
				local var_80_23 = utf8.len(var_80_21)
				local var_80_24 = var_80_22 <= 0 and var_80_19 or var_80_19 * (var_80_23 / var_80_22)

				if var_80_24 > 0 and var_80_19 < var_80_24 then
					arg_77_1.talkMaxDuration = var_80_24

					if var_80_24 + var_80_18 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_24 + var_80_18
					end
				end

				arg_77_1.text_.text = var_80_21
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_25 = math.max(var_80_19, arg_77_1.talkMaxDuration)

			if var_80_18 <= arg_77_1.time_ and arg_77_1.time_ < var_80_18 + var_80_25 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_18) / var_80_25

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_18 + var_80_25 and arg_77_1.time_ < var_80_18 + var_80_25 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play104112020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 104112020
		arg_81_1.duration_ = 10.133

		local var_81_0 = {
			ja = 10.133,
			ko = 6.166,
			zh = 7.366,
			en = 6.3
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
				arg_81_0:Play104112021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = "4010ui_story"

			if arg_81_1.actors_[var_84_0] == nil then
				local var_84_1 = Object.Instantiate(Asset.Load("Char/" .. var_84_0), arg_81_1.stage_.transform)

				var_84_1.name = var_84_0
				var_84_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_81_1.actors_[var_84_0] = var_84_1

				local var_84_2 = var_84_1:GetComponentInChildren(typeof(CharacterEffect))

				var_84_2.enabled = true

				local var_84_3 = GameObjectTools.GetOrAddComponent(var_84_1, typeof(DynamicBoneHelper))

				if var_84_3 then
					var_84_3:EnableDynamicBone(false)
				end

				arg_81_1:ShowWeapon(var_84_2.transform, false)

				arg_81_1.var_[var_84_0 .. "Animator"] = var_84_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_81_1.var_[var_84_0 .. "Animator"].applyRootMotion = true
				arg_81_1.var_[var_84_0 .. "LipSync"] = var_84_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_84_4 = arg_81_1.actors_["4010ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect4010ui_story == nil then
				arg_81_1.var_.characterEffect4010ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.1

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect4010ui_story then
					arg_81_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect4010ui_story then
				arg_81_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_84_8 = arg_81_1.actors_["4010ui_story"].transform
			local var_84_9 = 0

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 then
				arg_81_1.var_.moveOldPos4010ui_story = var_84_8.localPosition
			end

			local var_84_10 = 0.001

			if var_84_9 <= arg_81_1.time_ and arg_81_1.time_ < var_84_9 + var_84_10 then
				local var_84_11 = (arg_81_1.time_ - var_84_9) / var_84_10
				local var_84_12 = Vector3.New(-0.7, -1.59, -5.2)

				var_84_8.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos4010ui_story, var_84_12, var_84_11)

				local var_84_13 = manager.ui.mainCamera.transform.position - var_84_8.position

				var_84_8.forward = Vector3.New(var_84_13.x, var_84_13.y, var_84_13.z)

				local var_84_14 = var_84_8.localEulerAngles

				var_84_14.z = 0
				var_84_14.x = 0
				var_84_8.localEulerAngles = var_84_14
			end

			if arg_81_1.time_ >= var_84_9 + var_84_10 and arg_81_1.time_ < var_84_9 + var_84_10 + arg_84_0 then
				var_84_8.localPosition = Vector3.New(-0.7, -1.59, -5.2)

				local var_84_15 = manager.ui.mainCamera.transform.position - var_84_8.position

				var_84_8.forward = Vector3.New(var_84_15.x, var_84_15.y, var_84_15.z)

				local var_84_16 = var_84_8.localEulerAngles

				var_84_16.z = 0
				var_84_16.x = 0
				var_84_8.localEulerAngles = var_84_16
			end

			local var_84_17 = 0

			if var_84_17 < arg_81_1.time_ and arg_81_1.time_ <= var_84_17 + arg_84_0 then
				arg_81_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_84_18 = 0

			if var_84_18 < arg_81_1.time_ and arg_81_1.time_ <= var_84_18 + arg_84_0 then
				arg_81_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_84_19 = 0
			local var_84_20 = 0.95

			if var_84_19 < arg_81_1.time_ and arg_81_1.time_ <= var_84_19 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_21 = arg_81_1:FormatText(StoryNameCfg[42].name)

				arg_81_1.leftNameTxt_.text = var_84_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_22 = arg_81_1:GetWordFromCfg(104112020)
				local var_84_23 = arg_81_1:FormatText(var_84_22.content)

				arg_81_1.text_.text = var_84_23

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_24 = 38
				local var_84_25 = utf8.len(var_84_23)
				local var_84_26 = var_84_24 <= 0 and var_84_20 or var_84_20 * (var_84_25 / var_84_24)

				if var_84_26 > 0 and var_84_20 < var_84_26 then
					arg_81_1.talkMaxDuration = var_84_26

					if var_84_26 + var_84_19 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_26 + var_84_19
					end
				end

				arg_81_1.text_.text = var_84_23
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112020", "story_v_out_104112.awb") ~= 0 then
					local var_84_27 = manager.audio:GetVoiceLength("story_v_out_104112", "104112020", "story_v_out_104112.awb") / 1000

					if var_84_27 + var_84_19 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_27 + var_84_19
					end

					if var_84_22.prefab_name ~= "" and arg_81_1.actors_[var_84_22.prefab_name] ~= nil then
						local var_84_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_22.prefab_name].transform, "story_v_out_104112", "104112020", "story_v_out_104112.awb")

						arg_81_1:RecordAudio("104112020", var_84_28)
						arg_81_1:RecordAudio("104112020", var_84_28)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_104112", "104112020", "story_v_out_104112.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_104112", "104112020", "story_v_out_104112.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_29 = math.max(var_84_20, arg_81_1.talkMaxDuration)

			if var_84_19 <= arg_81_1.time_ and arg_81_1.time_ < var_84_19 + var_84_29 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_19) / var_84_29

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_19 + var_84_29 and arg_81_1.time_ < var_84_19 + var_84_29 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play104112021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 104112021
		arg_85_1.duration_ = 5.5

		local var_85_0 = {
			ja = 5.5,
			ko = 4.6,
			zh = 4.733,
			en = 5.433
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
				arg_85_0:Play104112022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = "3009ui_story"

			if arg_85_1.actors_[var_88_0] == nil then
				local var_88_1 = Object.Instantiate(Asset.Load("Char/" .. var_88_0), arg_85_1.stage_.transform)

				var_88_1.name = var_88_0
				var_88_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_85_1.actors_[var_88_0] = var_88_1

				local var_88_2 = var_88_1:GetComponentInChildren(typeof(CharacterEffect))

				var_88_2.enabled = true

				local var_88_3 = GameObjectTools.GetOrAddComponent(var_88_1, typeof(DynamicBoneHelper))

				if var_88_3 then
					var_88_3:EnableDynamicBone(false)
				end

				arg_85_1:ShowWeapon(var_88_2.transform, false)

				arg_85_1.var_[var_88_0 .. "Animator"] = var_88_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_85_1.var_[var_88_0 .. "Animator"].applyRootMotion = true
				arg_85_1.var_[var_88_0 .. "LipSync"] = var_88_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_88_4 = arg_85_1.actors_["3009ui_story"]
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 and arg_85_1.var_.characterEffect3009ui_story == nil then
				arg_85_1.var_.characterEffect3009ui_story = var_88_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_6 = 0.1

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6

				if arg_85_1.var_.characterEffect3009ui_story then
					arg_85_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 and arg_85_1.var_.characterEffect3009ui_story then
				arg_85_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_88_8 = arg_85_1.actors_["4010ui_story"]
			local var_88_9 = 0

			if var_88_9 < arg_85_1.time_ and arg_85_1.time_ <= var_88_9 + arg_88_0 and arg_85_1.var_.characterEffect4010ui_story == nil then
				arg_85_1.var_.characterEffect4010ui_story = var_88_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_10 = 0.1

			if var_88_9 <= arg_85_1.time_ and arg_85_1.time_ < var_88_9 + var_88_10 then
				local var_88_11 = (arg_85_1.time_ - var_88_9) / var_88_10

				if arg_85_1.var_.characterEffect4010ui_story then
					local var_88_12 = Mathf.Lerp(0, 0.5, var_88_11)

					arg_85_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_85_1.var_.characterEffect4010ui_story.fillRatio = var_88_12
				end
			end

			if arg_85_1.time_ >= var_88_9 + var_88_10 and arg_85_1.time_ < var_88_9 + var_88_10 + arg_88_0 and arg_85_1.var_.characterEffect4010ui_story then
				local var_88_13 = 0.5

				arg_85_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_85_1.var_.characterEffect4010ui_story.fillRatio = var_88_13
			end

			local var_88_14 = arg_85_1.actors_["3009ui_story"].transform
			local var_88_15 = 0

			if var_88_15 < arg_85_1.time_ and arg_85_1.time_ <= var_88_15 + arg_88_0 then
				arg_85_1.var_.moveOldPos3009ui_story = var_88_14.localPosition

				local var_88_16 = "3009ui_story"

				arg_85_1:ShowWeapon(arg_85_1.var_[var_88_16 .. "Animator"].transform, true)
			end

			local var_88_17 = 0.001

			if var_88_15 <= arg_85_1.time_ and arg_85_1.time_ < var_88_15 + var_88_17 then
				local var_88_18 = (arg_85_1.time_ - var_88_15) / var_88_17
				local var_88_19 = Vector3.New(0.7, -1.75, -4.8)

				var_88_14.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos3009ui_story, var_88_19, var_88_18)

				local var_88_20 = manager.ui.mainCamera.transform.position - var_88_14.position

				var_88_14.forward = Vector3.New(var_88_20.x, var_88_20.y, var_88_20.z)

				local var_88_21 = var_88_14.localEulerAngles

				var_88_21.z = 0
				var_88_21.x = 0
				var_88_14.localEulerAngles = var_88_21
			end

			if arg_85_1.time_ >= var_88_15 + var_88_17 and arg_85_1.time_ < var_88_15 + var_88_17 + arg_88_0 then
				var_88_14.localPosition = Vector3.New(0.7, -1.75, -4.8)

				local var_88_22 = manager.ui.mainCamera.transform.position - var_88_14.position

				var_88_14.forward = Vector3.New(var_88_22.x, var_88_22.y, var_88_22.z)

				local var_88_23 = var_88_14.localEulerAngles

				var_88_23.z = 0
				var_88_23.x = 0
				var_88_14.localEulerAngles = var_88_23
			end

			local var_88_24 = 0

			if var_88_24 < arg_85_1.time_ and arg_85_1.time_ <= var_88_24 + arg_88_0 then
				arg_85_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action1_1")
			end

			local var_88_25 = 0

			if var_88_25 < arg_85_1.time_ and arg_85_1.time_ <= var_88_25 + arg_88_0 then
				arg_85_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_88_26 = 0
			local var_88_27 = 0.65

			if var_88_26 < arg_85_1.time_ and arg_85_1.time_ <= var_88_26 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_28 = arg_85_1:FormatText(StoryNameCfg[43].name)

				arg_85_1.leftNameTxt_.text = var_88_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_29 = arg_85_1:GetWordFromCfg(104112021)
				local var_88_30 = arg_85_1:FormatText(var_88_29.content)

				arg_85_1.text_.text = var_88_30

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_31 = 26
				local var_88_32 = utf8.len(var_88_30)
				local var_88_33 = var_88_31 <= 0 and var_88_27 or var_88_27 * (var_88_32 / var_88_31)

				if var_88_33 > 0 and var_88_27 < var_88_33 then
					arg_85_1.talkMaxDuration = var_88_33

					if var_88_33 + var_88_26 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_33 + var_88_26
					end
				end

				arg_85_1.text_.text = var_88_30
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112021", "story_v_out_104112.awb") ~= 0 then
					local var_88_34 = manager.audio:GetVoiceLength("story_v_out_104112", "104112021", "story_v_out_104112.awb") / 1000

					if var_88_34 + var_88_26 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_34 + var_88_26
					end

					if var_88_29.prefab_name ~= "" and arg_85_1.actors_[var_88_29.prefab_name] ~= nil then
						local var_88_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_29.prefab_name].transform, "story_v_out_104112", "104112021", "story_v_out_104112.awb")

						arg_85_1:RecordAudio("104112021", var_88_35)
						arg_85_1:RecordAudio("104112021", var_88_35)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_104112", "104112021", "story_v_out_104112.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_104112", "104112021", "story_v_out_104112.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_36 = math.max(var_88_27, arg_85_1.talkMaxDuration)

			if var_88_26 <= arg_85_1.time_ and arg_85_1.time_ < var_88_26 + var_88_36 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_26) / var_88_36

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_26 + var_88_36 and arg_85_1.time_ < var_88_26 + var_88_36 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play104112022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 104112022
		arg_89_1.duration_ = 4.433

		local var_89_0 = {
			ja = 4.433,
			ko = 2.633,
			zh = 2.599999999999,
			en = 2.599999999999
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
				arg_89_0:Play104112023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["4010ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect4010ui_story == nil then
				arg_89_1.var_.characterEffect4010ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.1

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect4010ui_story then
					arg_89_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect4010ui_story then
				arg_89_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_92_4 = 0

			if var_92_4 < arg_89_1.time_ and arg_89_1.time_ <= var_92_4 + arg_92_0 then
				arg_89_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_2")
			end

			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 then
				arg_89_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_92_6 = arg_89_1.actors_["3009ui_story"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 and arg_89_1.var_.characterEffect3009ui_story == nil then
				arg_89_1.var_.characterEffect3009ui_story = var_92_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_8 = 0.1

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_8 then
				local var_92_9 = (arg_89_1.time_ - var_92_7) / var_92_8

				if arg_89_1.var_.characterEffect3009ui_story then
					local var_92_10 = Mathf.Lerp(0, 0.5, var_92_9)

					arg_89_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_89_1.var_.characterEffect3009ui_story.fillRatio = var_92_10
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_8 and arg_89_1.time_ < var_92_7 + var_92_8 + arg_92_0 and arg_89_1.var_.characterEffect3009ui_story then
				local var_92_11 = 0.5

				arg_89_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_89_1.var_.characterEffect3009ui_story.fillRatio = var_92_11
			end

			local var_92_12 = 0
			local var_92_13 = 0.275

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[42].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(104112022)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 11
				local var_92_18 = utf8.len(var_92_16)
				local var_92_19 = var_92_17 <= 0 and var_92_13 or var_92_13 * (var_92_18 / var_92_17)

				if var_92_19 > 0 and var_92_13 < var_92_19 then
					arg_89_1.talkMaxDuration = var_92_19

					if var_92_19 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_19 + var_92_12
					end
				end

				arg_89_1.text_.text = var_92_16
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112022", "story_v_out_104112.awb") ~= 0 then
					local var_92_20 = manager.audio:GetVoiceLength("story_v_out_104112", "104112022", "story_v_out_104112.awb") / 1000

					if var_92_20 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_12
					end

					if var_92_15.prefab_name ~= "" and arg_89_1.actors_[var_92_15.prefab_name] ~= nil then
						local var_92_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_15.prefab_name].transform, "story_v_out_104112", "104112022", "story_v_out_104112.awb")

						arg_89_1:RecordAudio("104112022", var_92_21)
						arg_89_1:RecordAudio("104112022", var_92_21)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_104112", "104112022", "story_v_out_104112.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_104112", "104112022", "story_v_out_104112.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_22 = math.max(var_92_13, arg_89_1.talkMaxDuration)

			if var_92_12 <= arg_89_1.time_ and arg_89_1.time_ < var_92_12 + var_92_22 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_12) / var_92_22

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_12 + var_92_22 and arg_89_1.time_ < var_92_12 + var_92_22 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play104112023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 104112023
		arg_93_1.duration_ = 6.2

		local var_93_0 = {
			ja = 6.2,
			ko = 4.9,
			zh = 5.5,
			en = 5.2
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
				arg_93_0:Play104112024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["3009ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect3009ui_story == nil then
				arg_93_1.var_.characterEffect3009ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.1

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect3009ui_story then
					arg_93_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect3009ui_story then
				arg_93_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_96_4 = arg_93_1.actors_["4010ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect4010ui_story == nil then
				arg_93_1.var_.characterEffect4010ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect4010ui_story then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_93_1.var_.characterEffect4010ui_story.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect4010ui_story then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_93_1.var_.characterEffect4010ui_story.fillRatio = var_96_9
			end

			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 then
				arg_93_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action1_1")
			end

			local var_96_11 = 0

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_96_12 = 0
			local var_96_13 = 0.675

			if var_96_12 < arg_93_1.time_ and arg_93_1.time_ <= var_96_12 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_14 = arg_93_1:FormatText(StoryNameCfg[43].name)

				arg_93_1.leftNameTxt_.text = var_96_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_15 = arg_93_1:GetWordFromCfg(104112023)
				local var_96_16 = arg_93_1:FormatText(var_96_15.content)

				arg_93_1.text_.text = var_96_16

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_17 = 27
				local var_96_18 = utf8.len(var_96_16)
				local var_96_19 = var_96_17 <= 0 and var_96_13 or var_96_13 * (var_96_18 / var_96_17)

				if var_96_19 > 0 and var_96_13 < var_96_19 then
					arg_93_1.talkMaxDuration = var_96_19

					if var_96_19 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_19 + var_96_12
					end
				end

				arg_93_1.text_.text = var_96_16
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112023", "story_v_out_104112.awb") ~= 0 then
					local var_96_20 = manager.audio:GetVoiceLength("story_v_out_104112", "104112023", "story_v_out_104112.awb") / 1000

					if var_96_20 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_20 + var_96_12
					end

					if var_96_15.prefab_name ~= "" and arg_93_1.actors_[var_96_15.prefab_name] ~= nil then
						local var_96_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_15.prefab_name].transform, "story_v_out_104112", "104112023", "story_v_out_104112.awb")

						arg_93_1:RecordAudio("104112023", var_96_21)
						arg_93_1:RecordAudio("104112023", var_96_21)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_104112", "104112023", "story_v_out_104112.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_104112", "104112023", "story_v_out_104112.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_22 = math.max(var_96_13, arg_93_1.talkMaxDuration)

			if var_96_12 <= arg_93_1.time_ and arg_93_1.time_ < var_96_12 + var_96_22 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_12) / var_96_22

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_12 + var_96_22 and arg_93_1.time_ < var_96_12 + var_96_22 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play104112024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 104112024
		arg_97_1.duration_ = 3.433

		local var_97_0 = {
			ja = 3.433,
			ko = 2.733,
			zh = 3,
			en = 3.4
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
				arg_97_0:Play104112025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["4010ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect4010ui_story == nil then
				arg_97_1.var_.characterEffect4010ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect4010ui_story then
					arg_97_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect4010ui_story then
				arg_97_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["3009ui_story"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect3009ui_story == nil then
				arg_97_1.var_.characterEffect3009ui_story = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.1

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect3009ui_story then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_97_1.var_.characterEffect3009ui_story.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect3009ui_story then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_97_1.var_.characterEffect3009ui_story.fillRatio = var_100_9
			end

			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_100_11 = 0
			local var_100_12 = 0.3

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_13 = arg_97_1:FormatText(StoryNameCfg[42].name)

				arg_97_1.leftNameTxt_.text = var_100_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_14 = arg_97_1:GetWordFromCfg(104112024)
				local var_100_15 = arg_97_1:FormatText(var_100_14.content)

				arg_97_1.text_.text = var_100_15

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_16 = 12
				local var_100_17 = utf8.len(var_100_15)
				local var_100_18 = var_100_16 <= 0 and var_100_12 or var_100_12 * (var_100_17 / var_100_16)

				if var_100_18 > 0 and var_100_12 < var_100_18 then
					arg_97_1.talkMaxDuration = var_100_18

					if var_100_18 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_11
					end
				end

				arg_97_1.text_.text = var_100_15
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112024", "story_v_out_104112.awb") ~= 0 then
					local var_100_19 = manager.audio:GetVoiceLength("story_v_out_104112", "104112024", "story_v_out_104112.awb") / 1000

					if var_100_19 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_19 + var_100_11
					end

					if var_100_14.prefab_name ~= "" and arg_97_1.actors_[var_100_14.prefab_name] ~= nil then
						local var_100_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_14.prefab_name].transform, "story_v_out_104112", "104112024", "story_v_out_104112.awb")

						arg_97_1:RecordAudio("104112024", var_100_20)
						arg_97_1:RecordAudio("104112024", var_100_20)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_104112", "104112024", "story_v_out_104112.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_104112", "104112024", "story_v_out_104112.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_21 = math.max(var_100_12, arg_97_1.talkMaxDuration)

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_21 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_11) / var_100_21

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_11 + var_100_21 and arg_97_1.time_ < var_100_11 + var_100_21 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play104112025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 104112025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play104112026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["4010ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect4010ui_story == nil then
				arg_101_1.var_.characterEffect4010ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect4010ui_story then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_101_1.var_.characterEffect4010ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect4010ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_101_1.var_.characterEffect4010ui_story.fillRatio = var_104_5
			end

			local var_104_6 = arg_101_1.actors_["4010ui_story"].transform
			local var_104_7 = 0

			if var_104_7 < arg_101_1.time_ and arg_101_1.time_ <= var_104_7 + arg_104_0 then
				arg_101_1.var_.moveOldPos4010ui_story = var_104_6.localPosition
			end

			local var_104_8 = 0.001

			if var_104_7 <= arg_101_1.time_ and arg_101_1.time_ < var_104_7 + var_104_8 then
				local var_104_9 = (arg_101_1.time_ - var_104_7) / var_104_8
				local var_104_10 = Vector3.New(0, 100, 0)

				var_104_6.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos4010ui_story, var_104_10, var_104_9)

				local var_104_11 = manager.ui.mainCamera.transform.position - var_104_6.position

				var_104_6.forward = Vector3.New(var_104_11.x, var_104_11.y, var_104_11.z)

				local var_104_12 = var_104_6.localEulerAngles

				var_104_12.z = 0
				var_104_12.x = 0
				var_104_6.localEulerAngles = var_104_12
			end

			if arg_101_1.time_ >= var_104_7 + var_104_8 and arg_101_1.time_ < var_104_7 + var_104_8 + arg_104_0 then
				var_104_6.localPosition = Vector3.New(0, 100, 0)

				local var_104_13 = manager.ui.mainCamera.transform.position - var_104_6.position

				var_104_6.forward = Vector3.New(var_104_13.x, var_104_13.y, var_104_13.z)

				local var_104_14 = var_104_6.localEulerAngles

				var_104_14.z = 0
				var_104_14.x = 0
				var_104_6.localEulerAngles = var_104_14
			end

			local var_104_15 = arg_101_1.actors_["3009ui_story"].transform
			local var_104_16 = 0

			if var_104_16 < arg_101_1.time_ and arg_101_1.time_ <= var_104_16 + arg_104_0 then
				arg_101_1.var_.moveOldPos3009ui_story = var_104_15.localPosition
			end

			local var_104_17 = 0.001

			if var_104_16 <= arg_101_1.time_ and arg_101_1.time_ < var_104_16 + var_104_17 then
				local var_104_18 = (arg_101_1.time_ - var_104_16) / var_104_17
				local var_104_19 = Vector3.New(0, 100, 0)

				var_104_15.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos3009ui_story, var_104_19, var_104_18)

				local var_104_20 = manager.ui.mainCamera.transform.position - var_104_15.position

				var_104_15.forward = Vector3.New(var_104_20.x, var_104_20.y, var_104_20.z)

				local var_104_21 = var_104_15.localEulerAngles

				var_104_21.z = 0
				var_104_21.x = 0
				var_104_15.localEulerAngles = var_104_21
			end

			if arg_101_1.time_ >= var_104_16 + var_104_17 and arg_101_1.time_ < var_104_16 + var_104_17 + arg_104_0 then
				var_104_15.localPosition = Vector3.New(0, 100, 0)

				local var_104_22 = manager.ui.mainCamera.transform.position - var_104_15.position

				var_104_15.forward = Vector3.New(var_104_22.x, var_104_22.y, var_104_22.z)

				local var_104_23 = var_104_15.localEulerAngles

				var_104_23.z = 0
				var_104_23.x = 0
				var_104_15.localEulerAngles = var_104_23
			end

			local var_104_24 = 0
			local var_104_25 = 0.7

			if var_104_24 < arg_101_1.time_ and arg_101_1.time_ <= var_104_24 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_26 = arg_101_1:GetWordFromCfg(104112025)
				local var_104_27 = arg_101_1:FormatText(var_104_26.content)

				arg_101_1.text_.text = var_104_27

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_28 = 28
				local var_104_29 = utf8.len(var_104_27)
				local var_104_30 = var_104_28 <= 0 and var_104_25 or var_104_25 * (var_104_29 / var_104_28)

				if var_104_30 > 0 and var_104_25 < var_104_30 then
					arg_101_1.talkMaxDuration = var_104_30

					if var_104_30 + var_104_24 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_30 + var_104_24
					end
				end

				arg_101_1.text_.text = var_104_27
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_31 = math.max(var_104_25, arg_101_1.talkMaxDuration)

			if var_104_24 <= arg_101_1.time_ and arg_101_1.time_ < var_104_24 + var_104_31 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_24) / var_104_31

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_24 + var_104_31 and arg_101_1.time_ < var_104_24 + var_104_31 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play104112026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 104112026
		arg_105_1.duration_ = 18.733

		local var_105_0 = {
			ja = 14.833,
			ko = 12.3,
			zh = 12.833,
			en = 18.733
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
				arg_105_0:Play104112027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["4010ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect4010ui_story == nil then
				arg_105_1.var_.characterEffect4010ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.1

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect4010ui_story then
					arg_105_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect4010ui_story then
				arg_105_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_108_4 = arg_105_1.actors_["4010ui_story"].transform
			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1.var_.moveOldPos4010ui_story = var_108_4.localPosition
			end

			local var_108_6 = 0.001

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6
				local var_108_8 = Vector3.New(0, -1.59, -5.2)

				var_108_4.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos4010ui_story, var_108_8, var_108_7)

				local var_108_9 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_9.x, var_108_9.y, var_108_9.z)

				local var_108_10 = var_108_4.localEulerAngles

				var_108_10.z = 0
				var_108_10.x = 0
				var_108_4.localEulerAngles = var_108_10
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 then
				var_108_4.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_108_11 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_11.x, var_108_11.y, var_108_11.z)

				local var_108_12 = var_108_4.localEulerAngles

				var_108_12.z = 0
				var_108_12.x = 0
				var_108_4.localEulerAngles = var_108_12
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_108_15 = 0
			local var_108_16 = 1.3

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_17 = arg_105_1:FormatText(StoryNameCfg[42].name)

				arg_105_1.leftNameTxt_.text = var_108_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_18 = arg_105_1:GetWordFromCfg(104112026)
				local var_108_19 = arg_105_1:FormatText(var_108_18.content)

				arg_105_1.text_.text = var_108_19

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_20 = 52
				local var_108_21 = utf8.len(var_108_19)
				local var_108_22 = var_108_20 <= 0 and var_108_16 or var_108_16 * (var_108_21 / var_108_20)

				if var_108_22 > 0 and var_108_16 < var_108_22 then
					arg_105_1.talkMaxDuration = var_108_22

					if var_108_22 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_15
					end
				end

				arg_105_1.text_.text = var_108_19
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112026", "story_v_out_104112.awb") ~= 0 then
					local var_108_23 = manager.audio:GetVoiceLength("story_v_out_104112", "104112026", "story_v_out_104112.awb") / 1000

					if var_108_23 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_23 + var_108_15
					end

					if var_108_18.prefab_name ~= "" and arg_105_1.actors_[var_108_18.prefab_name] ~= nil then
						local var_108_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_18.prefab_name].transform, "story_v_out_104112", "104112026", "story_v_out_104112.awb")

						arg_105_1:RecordAudio("104112026", var_108_24)
						arg_105_1:RecordAudio("104112026", var_108_24)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_104112", "104112026", "story_v_out_104112.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_104112", "104112026", "story_v_out_104112.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_25 = math.max(var_108_16, arg_105_1.talkMaxDuration)

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_25 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_15) / var_108_25

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_15 + var_108_25 and arg_105_1.time_ < var_108_15 + var_108_25 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play104112027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 104112027
		arg_109_1.duration_ = 5.033

		local var_109_0 = {
			ja = 5.033,
			ko = 3.566,
			zh = 3.666,
			en = 2.866
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
				arg_109_0:Play104112028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = "2020_tpose"

			if arg_109_1.actors_[var_112_0] == nil then
				local var_112_1 = Object.Instantiate(Asset.Load("Char/" .. var_112_0), arg_109_1.stage_.transform)

				var_112_1.name = var_112_0
				var_112_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_109_1.actors_[var_112_0] = var_112_1

				local var_112_2 = var_112_1:GetComponentInChildren(typeof(CharacterEffect))

				var_112_2.enabled = true

				local var_112_3 = GameObjectTools.GetOrAddComponent(var_112_1, typeof(DynamicBoneHelper))

				if var_112_3 then
					var_112_3:EnableDynamicBone(false)
				end

				arg_109_1:ShowWeapon(var_112_2.transform, false)

				arg_109_1.var_[var_112_0 .. "Animator"] = var_112_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_109_1.var_[var_112_0 .. "Animator"].applyRootMotion = true
				arg_109_1.var_[var_112_0 .. "LipSync"] = var_112_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_112_4 = arg_109_1.actors_["2020_tpose"]
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 and arg_109_1.var_.characterEffect2020_tpose == nil then
				arg_109_1.var_.characterEffect2020_tpose = var_112_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_6 = 0.1

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6

				if arg_109_1.var_.characterEffect2020_tpose then
					arg_109_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 and arg_109_1.var_.characterEffect2020_tpose then
				arg_109_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_112_8 = arg_109_1.actors_["4010ui_story"]
			local var_112_9 = 0

			if var_112_9 < arg_109_1.time_ and arg_109_1.time_ <= var_112_9 + arg_112_0 and arg_109_1.var_.characterEffect4010ui_story == nil then
				arg_109_1.var_.characterEffect4010ui_story = var_112_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_10 = 0.1

			if var_112_9 <= arg_109_1.time_ and arg_109_1.time_ < var_112_9 + var_112_10 then
				local var_112_11 = (arg_109_1.time_ - var_112_9) / var_112_10

				if arg_109_1.var_.characterEffect4010ui_story then
					local var_112_12 = Mathf.Lerp(0, 0.5, var_112_11)

					arg_109_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_109_1.var_.characterEffect4010ui_story.fillRatio = var_112_12
				end
			end

			if arg_109_1.time_ >= var_112_9 + var_112_10 and arg_109_1.time_ < var_112_9 + var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect4010ui_story then
				local var_112_13 = 0.5

				arg_109_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_109_1.var_.characterEffect4010ui_story.fillRatio = var_112_13
			end

			local var_112_14 = arg_109_1.actors_["4010ui_story"].transform
			local var_112_15 = 0

			if var_112_15 < arg_109_1.time_ and arg_109_1.time_ <= var_112_15 + arg_112_0 then
				arg_109_1.var_.moveOldPos4010ui_story = var_112_14.localPosition
			end

			local var_112_16 = 0.001

			if var_112_15 <= arg_109_1.time_ and arg_109_1.time_ < var_112_15 + var_112_16 then
				local var_112_17 = (arg_109_1.time_ - var_112_15) / var_112_16
				local var_112_18 = Vector3.New(0, 100, 0)

				var_112_14.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos4010ui_story, var_112_18, var_112_17)

				local var_112_19 = manager.ui.mainCamera.transform.position - var_112_14.position

				var_112_14.forward = Vector3.New(var_112_19.x, var_112_19.y, var_112_19.z)

				local var_112_20 = var_112_14.localEulerAngles

				var_112_20.z = 0
				var_112_20.x = 0
				var_112_14.localEulerAngles = var_112_20
			end

			if arg_109_1.time_ >= var_112_15 + var_112_16 and arg_109_1.time_ < var_112_15 + var_112_16 + arg_112_0 then
				var_112_14.localPosition = Vector3.New(0, 100, 0)

				local var_112_21 = manager.ui.mainCamera.transform.position - var_112_14.position

				var_112_14.forward = Vector3.New(var_112_21.x, var_112_21.y, var_112_21.z)

				local var_112_22 = var_112_14.localEulerAngles

				var_112_22.z = 0
				var_112_22.x = 0
				var_112_14.localEulerAngles = var_112_22
			end

			local var_112_23 = 0
			local var_112_24 = 0.4

			if var_112_23 < arg_109_1.time_ and arg_109_1.time_ <= var_112_23 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_25 = arg_109_1:FormatText(StoryNameCfg[19].name)

				arg_109_1.leftNameTxt_.text = var_112_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_26 = arg_109_1:GetWordFromCfg(104112027)
				local var_112_27 = arg_109_1:FormatText(var_112_26.content)

				arg_109_1.text_.text = var_112_27

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_28 = 16
				local var_112_29 = utf8.len(var_112_27)
				local var_112_30 = var_112_28 <= 0 and var_112_24 or var_112_24 * (var_112_29 / var_112_28)

				if var_112_30 > 0 and var_112_24 < var_112_30 then
					arg_109_1.talkMaxDuration = var_112_30

					if var_112_30 + var_112_23 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_30 + var_112_23
					end
				end

				arg_109_1.text_.text = var_112_27
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112027", "story_v_out_104112.awb") ~= 0 then
					local var_112_31 = manager.audio:GetVoiceLength("story_v_out_104112", "104112027", "story_v_out_104112.awb") / 1000

					if var_112_31 + var_112_23 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_31 + var_112_23
					end

					if var_112_26.prefab_name ~= "" and arg_109_1.actors_[var_112_26.prefab_name] ~= nil then
						local var_112_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_26.prefab_name].transform, "story_v_out_104112", "104112027", "story_v_out_104112.awb")

						arg_109_1:RecordAudio("104112027", var_112_32)
						arg_109_1:RecordAudio("104112027", var_112_32)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_104112", "104112027", "story_v_out_104112.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_104112", "104112027", "story_v_out_104112.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_33 = math.max(var_112_24, arg_109_1.talkMaxDuration)

			if var_112_23 <= arg_109_1.time_ and arg_109_1.time_ < var_112_23 + var_112_33 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_23) / var_112_33

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_23 + var_112_33 and arg_109_1.time_ < var_112_23 + var_112_33 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play104112028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 104112028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play104112029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["2020_tpose"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect2020_tpose == nil then
				arg_113_1.var_.characterEffect2020_tpose = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.1

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect2020_tpose then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_113_1.var_.characterEffect2020_tpose.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect2020_tpose then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_113_1.var_.characterEffect2020_tpose.fillRatio = var_116_5
			end

			local var_116_6 = arg_113_1.actors_["4010ui_story"].transform
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 then
				arg_113_1.var_.moveOldPos4010ui_story = var_116_6.localPosition
			end

			local var_116_8 = 0.001

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8
				local var_116_10 = Vector3.New(0, 100, 0)

				var_116_6.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos4010ui_story, var_116_10, var_116_9)

				local var_116_11 = manager.ui.mainCamera.transform.position - var_116_6.position

				var_116_6.forward = Vector3.New(var_116_11.x, var_116_11.y, var_116_11.z)

				local var_116_12 = var_116_6.localEulerAngles

				var_116_12.z = 0
				var_116_12.x = 0
				var_116_6.localEulerAngles = var_116_12
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 then
				var_116_6.localPosition = Vector3.New(0, 100, 0)

				local var_116_13 = manager.ui.mainCamera.transform.position - var_116_6.position

				var_116_6.forward = Vector3.New(var_116_13.x, var_116_13.y, var_116_13.z)

				local var_116_14 = var_116_6.localEulerAngles

				var_116_14.z = 0
				var_116_14.x = 0
				var_116_6.localEulerAngles = var_116_14
			end

			local var_116_15 = 0
			local var_116_16 = 0.225

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_17 = arg_113_1:GetWordFromCfg(104112028)
				local var_116_18 = arg_113_1:FormatText(var_116_17.content)

				arg_113_1.text_.text = var_116_18

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_19 = 9
				local var_116_20 = utf8.len(var_116_18)
				local var_116_21 = var_116_19 <= 0 and var_116_16 or var_116_16 * (var_116_20 / var_116_19)

				if var_116_21 > 0 and var_116_16 < var_116_21 then
					arg_113_1.talkMaxDuration = var_116_21

					if var_116_21 + var_116_15 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_21 + var_116_15
					end
				end

				arg_113_1.text_.text = var_116_18
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_22 = math.max(var_116_16, arg_113_1.talkMaxDuration)

			if var_116_15 <= arg_113_1.time_ and arg_113_1.time_ < var_116_15 + var_116_22 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_15) / var_116_22

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_15 + var_116_22 and arg_113_1.time_ < var_116_15 + var_116_22 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play104112029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 104112029
		arg_117_1.duration_ = 3.833

		local var_117_0 = {
			ja = 3.833,
			ko = 3.433,
			zh = 2.633,
			en = 3.066
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
				arg_117_0:Play104112030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = "2030_tpose"

			if arg_117_1.actors_[var_120_0] == nil then
				local var_120_1 = Object.Instantiate(Asset.Load("Char/" .. var_120_0), arg_117_1.stage_.transform)

				var_120_1.name = var_120_0
				var_120_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_117_1.actors_[var_120_0] = var_120_1

				local var_120_2 = var_120_1:GetComponentInChildren(typeof(CharacterEffect))

				var_120_2.enabled = true

				local var_120_3 = GameObjectTools.GetOrAddComponent(var_120_1, typeof(DynamicBoneHelper))

				if var_120_3 then
					var_120_3:EnableDynamicBone(false)
				end

				arg_117_1:ShowWeapon(var_120_2.transform, false)

				arg_117_1.var_[var_120_0 .. "Animator"] = var_120_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_117_1.var_[var_120_0 .. "Animator"].applyRootMotion = true
				arg_117_1.var_[var_120_0 .. "LipSync"] = var_120_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_120_4 = arg_117_1.actors_["2030_tpose"]
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 and arg_117_1.var_.characterEffect2030_tpose == nil then
				arg_117_1.var_.characterEffect2030_tpose = var_120_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_6 = 0.1

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6

				if arg_117_1.var_.characterEffect2030_tpose then
					arg_117_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 and arg_117_1.var_.characterEffect2030_tpose then
				arg_117_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_120_8 = arg_117_1.actors_["2030_tpose"].transform
			local var_120_9 = 0

			if var_120_9 < arg_117_1.time_ and arg_117_1.time_ <= var_120_9 + arg_120_0 then
				arg_117_1.var_.moveOldPos2030_tpose = var_120_8.localPosition
			end

			local var_120_10 = 0.001

			if var_120_9 <= arg_117_1.time_ and arg_117_1.time_ < var_120_9 + var_120_10 then
				local var_120_11 = (arg_117_1.time_ - var_120_9) / var_120_10
				local var_120_12 = Vector3.New(0, 100, 0)

				var_120_8.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos2030_tpose, var_120_12, var_120_11)

				local var_120_13 = manager.ui.mainCamera.transform.position - var_120_8.position

				var_120_8.forward = Vector3.New(var_120_13.x, var_120_13.y, var_120_13.z)

				local var_120_14 = var_120_8.localEulerAngles

				var_120_14.z = 0
				var_120_14.x = 0
				var_120_8.localEulerAngles = var_120_14
			end

			if arg_117_1.time_ >= var_120_9 + var_120_10 and arg_117_1.time_ < var_120_9 + var_120_10 + arg_120_0 then
				var_120_8.localPosition = Vector3.New(0, 100, 0)

				local var_120_15 = manager.ui.mainCamera.transform.position - var_120_8.position

				var_120_8.forward = Vector3.New(var_120_15.x, var_120_15.y, var_120_15.z)

				local var_120_16 = var_120_8.localEulerAngles

				var_120_16.z = 0
				var_120_16.x = 0
				var_120_8.localEulerAngles = var_120_16
			end

			local var_120_17 = 0

			if var_120_17 < arg_117_1.time_ and arg_117_1.time_ <= var_120_17 + arg_120_0 then
				arg_117_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_120_18 = 0
			local var_120_19 = 0.325

			if var_120_18 < arg_117_1.time_ and arg_117_1.time_ <= var_120_18 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_20 = arg_117_1:FormatText(StoryNameCfg[33].name)

				arg_117_1.leftNameTxt_.text = var_120_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_21 = arg_117_1:GetWordFromCfg(104112029)
				local var_120_22 = arg_117_1:FormatText(var_120_21.content)

				arg_117_1.text_.text = var_120_22

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_23 = 13
				local var_120_24 = utf8.len(var_120_22)
				local var_120_25 = var_120_23 <= 0 and var_120_19 or var_120_19 * (var_120_24 / var_120_23)

				if var_120_25 > 0 and var_120_19 < var_120_25 then
					arg_117_1.talkMaxDuration = var_120_25

					if var_120_25 + var_120_18 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_25 + var_120_18
					end
				end

				arg_117_1.text_.text = var_120_22
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112029", "story_v_out_104112.awb") ~= 0 then
					local var_120_26 = manager.audio:GetVoiceLength("story_v_out_104112", "104112029", "story_v_out_104112.awb") / 1000

					if var_120_26 + var_120_18 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_26 + var_120_18
					end

					if var_120_21.prefab_name ~= "" and arg_117_1.actors_[var_120_21.prefab_name] ~= nil then
						local var_120_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_21.prefab_name].transform, "story_v_out_104112", "104112029", "story_v_out_104112.awb")

						arg_117_1:RecordAudio("104112029", var_120_27)
						arg_117_1:RecordAudio("104112029", var_120_27)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_104112", "104112029", "story_v_out_104112.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_104112", "104112029", "story_v_out_104112.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_28 = math.max(var_120_19, arg_117_1.talkMaxDuration)

			if var_120_18 <= arg_117_1.time_ and arg_117_1.time_ < var_120_18 + var_120_28 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_18) / var_120_28

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_18 + var_120_28 and arg_117_1.time_ < var_120_18 + var_120_28 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play104112030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 104112030
		arg_121_1.duration_ = 7.333

		local var_121_0 = {
			ja = 7.333,
			ko = 2.766,
			zh = 2.6,
			en = 3
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
				arg_121_0:Play104112031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["2020_tpose"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect2020_tpose == nil then
				arg_121_1.var_.characterEffect2020_tpose = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.1

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect2020_tpose then
					arg_121_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect2020_tpose then
				arg_121_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_124_4 = arg_121_1.actors_["2030_tpose"]
			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 and arg_121_1.var_.characterEffect2030_tpose == nil then
				arg_121_1.var_.characterEffect2030_tpose = var_124_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_6 = 0.1

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6

				if arg_121_1.var_.characterEffect2030_tpose then
					local var_124_8 = Mathf.Lerp(0, 0.5, var_124_7)

					arg_121_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_121_1.var_.characterEffect2030_tpose.fillRatio = var_124_8
				end
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect2030_tpose then
				local var_124_9 = 0.5

				arg_121_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_121_1.var_.characterEffect2030_tpose.fillRatio = var_124_9
			end

			local var_124_10 = arg_121_1.actors_["2020_tpose"].transform
			local var_124_11 = 0

			if var_124_11 < arg_121_1.time_ and arg_121_1.time_ <= var_124_11 + arg_124_0 then
				arg_121_1.var_.moveOldPos2020_tpose = var_124_10.localPosition
			end

			local var_124_12 = 0.001

			if var_124_11 <= arg_121_1.time_ and arg_121_1.time_ < var_124_11 + var_124_12 then
				local var_124_13 = (arg_121_1.time_ - var_124_11) / var_124_12
				local var_124_14 = Vector3.New(0.7, -1.2, -4.1)

				var_124_10.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos2020_tpose, var_124_14, var_124_13)

				local var_124_15 = manager.ui.mainCamera.transform.position - var_124_10.position

				var_124_10.forward = Vector3.New(var_124_15.x, var_124_15.y, var_124_15.z)

				local var_124_16 = var_124_10.localEulerAngles

				var_124_16.z = 0
				var_124_16.x = 0
				var_124_10.localEulerAngles = var_124_16
			end

			if arg_121_1.time_ >= var_124_11 + var_124_12 and arg_121_1.time_ < var_124_11 + var_124_12 + arg_124_0 then
				var_124_10.localPosition = Vector3.New(0.7, -1.2, -4.1)

				local var_124_17 = manager.ui.mainCamera.transform.position - var_124_10.position

				var_124_10.forward = Vector3.New(var_124_17.x, var_124_17.y, var_124_17.z)

				local var_124_18 = var_124_10.localEulerAngles

				var_124_18.z = 0
				var_124_18.x = 0
				var_124_10.localEulerAngles = var_124_18
			end

			local var_124_19 = 0

			if var_124_19 < arg_121_1.time_ and arg_121_1.time_ <= var_124_19 + arg_124_0 then
				arg_121_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_124_20 = 0
			local var_124_21 = 0.3

			if var_124_20 < arg_121_1.time_ and arg_121_1.time_ <= var_124_20 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_22 = arg_121_1:FormatText(StoryNameCfg[65].name)

				arg_121_1.leftNameTxt_.text = var_124_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_23 = arg_121_1:GetWordFromCfg(104112030)
				local var_124_24 = arg_121_1:FormatText(var_124_23.content)

				arg_121_1.text_.text = var_124_24

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_25 = 12
				local var_124_26 = utf8.len(var_124_24)
				local var_124_27 = var_124_25 <= 0 and var_124_21 or var_124_21 * (var_124_26 / var_124_25)

				if var_124_27 > 0 and var_124_21 < var_124_27 then
					arg_121_1.talkMaxDuration = var_124_27

					if var_124_27 + var_124_20 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_27 + var_124_20
					end
				end

				arg_121_1.text_.text = var_124_24
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112030", "story_v_out_104112.awb") ~= 0 then
					local var_124_28 = manager.audio:GetVoiceLength("story_v_out_104112", "104112030", "story_v_out_104112.awb") / 1000

					if var_124_28 + var_124_20 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_28 + var_124_20
					end

					if var_124_23.prefab_name ~= "" and arg_121_1.actors_[var_124_23.prefab_name] ~= nil then
						local var_124_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_23.prefab_name].transform, "story_v_out_104112", "104112030", "story_v_out_104112.awb")

						arg_121_1:RecordAudio("104112030", var_124_29)
						arg_121_1:RecordAudio("104112030", var_124_29)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_104112", "104112030", "story_v_out_104112.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_104112", "104112030", "story_v_out_104112.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_30 = math.max(var_124_21, arg_121_1.talkMaxDuration)

			if var_124_20 <= arg_121_1.time_ and arg_121_1.time_ < var_124_20 + var_124_30 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_20) / var_124_30

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_20 + var_124_30 and arg_121_1.time_ < var_124_20 + var_124_30 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play104112031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 104112031
		arg_125_1.duration_ = 6.166

		local var_125_0 = {
			ja = 4.366,
			ko = 4.9,
			zh = 6.166,
			en = 5.533
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
				arg_125_0:Play104112032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["4010ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect4010ui_story == nil then
				arg_125_1.var_.characterEffect4010ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.1

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect4010ui_story then
					arg_125_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect4010ui_story then
				arg_125_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["2020_tpose"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect2020_tpose == nil then
				arg_125_1.var_.characterEffect2020_tpose = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.1

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect2020_tpose then
					local var_128_8 = Mathf.Lerp(0, 0.5, var_128_7)

					arg_125_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_125_1.var_.characterEffect2020_tpose.fillRatio = var_128_8
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect2020_tpose then
				local var_128_9 = 0.5

				arg_125_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_125_1.var_.characterEffect2020_tpose.fillRatio = var_128_9
			end

			local var_128_10 = arg_125_1.actors_["2020_tpose"].transform
			local var_128_11 = 0

			if var_128_11 < arg_125_1.time_ and arg_125_1.time_ <= var_128_11 + arg_128_0 then
				arg_125_1.var_.moveOldPos2020_tpose = var_128_10.localPosition
			end

			local var_128_12 = 0.001

			if var_128_11 <= arg_125_1.time_ and arg_125_1.time_ < var_128_11 + var_128_12 then
				local var_128_13 = (arg_125_1.time_ - var_128_11) / var_128_12
				local var_128_14 = Vector3.New(0, 100, 0)

				var_128_10.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos2020_tpose, var_128_14, var_128_13)

				local var_128_15 = manager.ui.mainCamera.transform.position - var_128_10.position

				var_128_10.forward = Vector3.New(var_128_15.x, var_128_15.y, var_128_15.z)

				local var_128_16 = var_128_10.localEulerAngles

				var_128_16.z = 0
				var_128_16.x = 0
				var_128_10.localEulerAngles = var_128_16
			end

			if arg_125_1.time_ >= var_128_11 + var_128_12 and arg_125_1.time_ < var_128_11 + var_128_12 + arg_128_0 then
				var_128_10.localPosition = Vector3.New(0, 100, 0)

				local var_128_17 = manager.ui.mainCamera.transform.position - var_128_10.position

				var_128_10.forward = Vector3.New(var_128_17.x, var_128_17.y, var_128_17.z)

				local var_128_18 = var_128_10.localEulerAngles

				var_128_18.z = 0
				var_128_18.x = 0
				var_128_10.localEulerAngles = var_128_18
			end

			local var_128_19 = arg_125_1.actors_["2030_tpose"].transform
			local var_128_20 = 0

			if var_128_20 < arg_125_1.time_ and arg_125_1.time_ <= var_128_20 + arg_128_0 then
				arg_125_1.var_.moveOldPos2030_tpose = var_128_19.localPosition
			end

			local var_128_21 = 0.001

			if var_128_20 <= arg_125_1.time_ and arg_125_1.time_ < var_128_20 + var_128_21 then
				local var_128_22 = (arg_125_1.time_ - var_128_20) / var_128_21
				local var_128_23 = Vector3.New(0, 100, 0)

				var_128_19.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos2030_tpose, var_128_23, var_128_22)

				local var_128_24 = manager.ui.mainCamera.transform.position - var_128_19.position

				var_128_19.forward = Vector3.New(var_128_24.x, var_128_24.y, var_128_24.z)

				local var_128_25 = var_128_19.localEulerAngles

				var_128_25.z = 0
				var_128_25.x = 0
				var_128_19.localEulerAngles = var_128_25
			end

			if arg_125_1.time_ >= var_128_20 + var_128_21 and arg_125_1.time_ < var_128_20 + var_128_21 + arg_128_0 then
				var_128_19.localPosition = Vector3.New(0, 100, 0)

				local var_128_26 = manager.ui.mainCamera.transform.position - var_128_19.position

				var_128_19.forward = Vector3.New(var_128_26.x, var_128_26.y, var_128_26.z)

				local var_128_27 = var_128_19.localEulerAngles

				var_128_27.z = 0
				var_128_27.x = 0
				var_128_19.localEulerAngles = var_128_27
			end

			local var_128_28 = arg_125_1.actors_["4010ui_story"].transform
			local var_128_29 = 0

			if var_128_29 < arg_125_1.time_ and arg_125_1.time_ <= var_128_29 + arg_128_0 then
				arg_125_1.var_.moveOldPos4010ui_story = var_128_28.localPosition
			end

			local var_128_30 = 0.001

			if var_128_29 <= arg_125_1.time_ and arg_125_1.time_ < var_128_29 + var_128_30 then
				local var_128_31 = (arg_125_1.time_ - var_128_29) / var_128_30
				local var_128_32 = Vector3.New(0, -1.59, -5.2)

				var_128_28.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos4010ui_story, var_128_32, var_128_31)

				local var_128_33 = manager.ui.mainCamera.transform.position - var_128_28.position

				var_128_28.forward = Vector3.New(var_128_33.x, var_128_33.y, var_128_33.z)

				local var_128_34 = var_128_28.localEulerAngles

				var_128_34.z = 0
				var_128_34.x = 0
				var_128_28.localEulerAngles = var_128_34
			end

			if arg_125_1.time_ >= var_128_29 + var_128_30 and arg_125_1.time_ < var_128_29 + var_128_30 + arg_128_0 then
				var_128_28.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_128_35 = manager.ui.mainCamera.transform.position - var_128_28.position

				var_128_28.forward = Vector3.New(var_128_35.x, var_128_35.y, var_128_35.z)

				local var_128_36 = var_128_28.localEulerAngles

				var_128_36.z = 0
				var_128_36.x = 0
				var_128_28.localEulerAngles = var_128_36
			end

			local var_128_37 = 0

			if var_128_37 < arg_125_1.time_ and arg_125_1.time_ <= var_128_37 + arg_128_0 then
				arg_125_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_128_38 = 0

			if var_128_38 < arg_125_1.time_ and arg_125_1.time_ <= var_128_38 + arg_128_0 then
				arg_125_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_128_39 = 0
			local var_128_40 = 0.475

			if var_128_39 < arg_125_1.time_ and arg_125_1.time_ <= var_128_39 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_41 = arg_125_1:FormatText(StoryNameCfg[42].name)

				arg_125_1.leftNameTxt_.text = var_128_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_42 = arg_125_1:GetWordFromCfg(104112031)
				local var_128_43 = arg_125_1:FormatText(var_128_42.content)

				arg_125_1.text_.text = var_128_43

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_44 = 19
				local var_128_45 = utf8.len(var_128_43)
				local var_128_46 = var_128_44 <= 0 and var_128_40 or var_128_40 * (var_128_45 / var_128_44)

				if var_128_46 > 0 and var_128_40 < var_128_46 then
					arg_125_1.talkMaxDuration = var_128_46

					if var_128_46 + var_128_39 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_46 + var_128_39
					end
				end

				arg_125_1.text_.text = var_128_43
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112031", "story_v_out_104112.awb") ~= 0 then
					local var_128_47 = manager.audio:GetVoiceLength("story_v_out_104112", "104112031", "story_v_out_104112.awb") / 1000

					if var_128_47 + var_128_39 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_47 + var_128_39
					end

					if var_128_42.prefab_name ~= "" and arg_125_1.actors_[var_128_42.prefab_name] ~= nil then
						local var_128_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_42.prefab_name].transform, "story_v_out_104112", "104112031", "story_v_out_104112.awb")

						arg_125_1:RecordAudio("104112031", var_128_48)
						arg_125_1:RecordAudio("104112031", var_128_48)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_104112", "104112031", "story_v_out_104112.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_104112", "104112031", "story_v_out_104112.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_49 = math.max(var_128_40, arg_125_1.talkMaxDuration)

			if var_128_39 <= arg_125_1.time_ and arg_125_1.time_ < var_128_39 + var_128_49 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_39) / var_128_49

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_39 + var_128_49 and arg_125_1.time_ < var_128_39 + var_128_49 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play104112032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 104112032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play104112033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["4010ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect4010ui_story == nil then
				arg_129_1.var_.characterEffect4010ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.1

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect4010ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_129_1.var_.characterEffect4010ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect4010ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_129_1.var_.characterEffect4010ui_story.fillRatio = var_132_5
			end

			local var_132_6 = 0
			local var_132_7 = 0.4

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_8 = arg_129_1:GetWordFromCfg(104112032)
				local var_132_9 = arg_129_1:FormatText(var_132_8.content)

				arg_129_1.text_.text = var_132_9

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_10 = 16
				local var_132_11 = utf8.len(var_132_9)
				local var_132_12 = var_132_10 <= 0 and var_132_7 or var_132_7 * (var_132_11 / var_132_10)

				if var_132_12 > 0 and var_132_7 < var_132_12 then
					arg_129_1.talkMaxDuration = var_132_12

					if var_132_12 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_12 + var_132_6
					end
				end

				arg_129_1.text_.text = var_132_9
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_13 = math.max(var_132_7, arg_129_1.talkMaxDuration)

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_13 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_6) / var_132_13

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_6 + var_132_13 and arg_129_1.time_ < var_132_6 + var_132_13 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play104112033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 104112033
		arg_133_1.duration_ = 18.966

		local var_133_0 = {
			ja = 13.033,
			ko = 12.733,
			zh = 14.5,
			en = 18.966
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
				arg_133_0:Play104112034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["4010ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect4010ui_story == nil then
				arg_133_1.var_.characterEffect4010ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.1

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect4010ui_story then
					arg_133_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect4010ui_story then
				arg_133_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_136_4 = 0

			if var_136_4 < arg_133_1.time_ and arg_133_1.time_ <= var_136_4 + arg_136_0 then
				arg_133_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_2")
			end

			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 then
				arg_133_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_136_6 = 0
			local var_136_7 = 1.55

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_8 = arg_133_1:FormatText(StoryNameCfg[42].name)

				arg_133_1.leftNameTxt_.text = var_136_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_9 = arg_133_1:GetWordFromCfg(104112033)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 61
				local var_136_12 = utf8.len(var_136_10)
				local var_136_13 = var_136_11 <= 0 and var_136_7 or var_136_7 * (var_136_12 / var_136_11)

				if var_136_13 > 0 and var_136_7 < var_136_13 then
					arg_133_1.talkMaxDuration = var_136_13

					if var_136_13 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_13 + var_136_6
					end
				end

				arg_133_1.text_.text = var_136_10
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112033", "story_v_out_104112.awb") ~= 0 then
					local var_136_14 = manager.audio:GetVoiceLength("story_v_out_104112", "104112033", "story_v_out_104112.awb") / 1000

					if var_136_14 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_14 + var_136_6
					end

					if var_136_9.prefab_name ~= "" and arg_133_1.actors_[var_136_9.prefab_name] ~= nil then
						local var_136_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_9.prefab_name].transform, "story_v_out_104112", "104112033", "story_v_out_104112.awb")

						arg_133_1:RecordAudio("104112033", var_136_15)
						arg_133_1:RecordAudio("104112033", var_136_15)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_104112", "104112033", "story_v_out_104112.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_104112", "104112033", "story_v_out_104112.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_16 = math.max(var_136_7, arg_133_1.talkMaxDuration)

			if var_136_6 <= arg_133_1.time_ and arg_133_1.time_ < var_136_6 + var_136_16 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_6) / var_136_16

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_6 + var_136_16 and arg_133_1.time_ < var_136_6 + var_136_16 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play104112034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 104112034
		arg_137_1.duration_ = 10.733

		local var_137_0 = {
			ja = 10.533,
			ko = 9.066,
			zh = 10.266,
			en = 10.733
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
				arg_137_0:Play104112035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_140_1 = 0
			local var_140_2 = 0.975

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_3 = arg_137_1:FormatText(StoryNameCfg[42].name)

				arg_137_1.leftNameTxt_.text = var_140_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_4 = arg_137_1:GetWordFromCfg(104112034)
				local var_140_5 = arg_137_1:FormatText(var_140_4.content)

				arg_137_1.text_.text = var_140_5

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_6 = 39
				local var_140_7 = utf8.len(var_140_5)
				local var_140_8 = var_140_6 <= 0 and var_140_2 or var_140_2 * (var_140_7 / var_140_6)

				if var_140_8 > 0 and var_140_2 < var_140_8 then
					arg_137_1.talkMaxDuration = var_140_8

					if var_140_8 + var_140_1 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_1
					end
				end

				arg_137_1.text_.text = var_140_5
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112034", "story_v_out_104112.awb") ~= 0 then
					local var_140_9 = manager.audio:GetVoiceLength("story_v_out_104112", "104112034", "story_v_out_104112.awb") / 1000

					if var_140_9 + var_140_1 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_9 + var_140_1
					end

					if var_140_4.prefab_name ~= "" and arg_137_1.actors_[var_140_4.prefab_name] ~= nil then
						local var_140_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_4.prefab_name].transform, "story_v_out_104112", "104112034", "story_v_out_104112.awb")

						arg_137_1:RecordAudio("104112034", var_140_10)
						arg_137_1:RecordAudio("104112034", var_140_10)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_104112", "104112034", "story_v_out_104112.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_104112", "104112034", "story_v_out_104112.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_11 = math.max(var_140_2, arg_137_1.talkMaxDuration)

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_11 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_1) / var_140_11

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_1 + var_140_11 and arg_137_1.time_ < var_140_1 + var_140_11 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play104112035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 104112035
		arg_141_1.duration_ = 12.9

		local var_141_0 = {
			ja = 11.8,
			ko = 10.933,
			zh = 12.9,
			en = 11.9
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
				arg_141_0:Play104112036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action6_1")
			end

			local var_144_2 = 0
			local var_144_3 = 1.125

			if var_144_2 < arg_141_1.time_ and arg_141_1.time_ <= var_144_2 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_4 = arg_141_1:FormatText(StoryNameCfg[42].name)

				arg_141_1.leftNameTxt_.text = var_144_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_5 = arg_141_1:GetWordFromCfg(104112035)
				local var_144_6 = arg_141_1:FormatText(var_144_5.content)

				arg_141_1.text_.text = var_144_6

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_7 = 45
				local var_144_8 = utf8.len(var_144_6)
				local var_144_9 = var_144_7 <= 0 and var_144_3 or var_144_3 * (var_144_8 / var_144_7)

				if var_144_9 > 0 and var_144_3 < var_144_9 then
					arg_141_1.talkMaxDuration = var_144_9

					if var_144_9 + var_144_2 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_9 + var_144_2
					end
				end

				arg_141_1.text_.text = var_144_6
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112035", "story_v_out_104112.awb") ~= 0 then
					local var_144_10 = manager.audio:GetVoiceLength("story_v_out_104112", "104112035", "story_v_out_104112.awb") / 1000

					if var_144_10 + var_144_2 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_10 + var_144_2
					end

					if var_144_5.prefab_name ~= "" and arg_141_1.actors_[var_144_5.prefab_name] ~= nil then
						local var_144_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_5.prefab_name].transform, "story_v_out_104112", "104112035", "story_v_out_104112.awb")

						arg_141_1:RecordAudio("104112035", var_144_11)
						arg_141_1:RecordAudio("104112035", var_144_11)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_104112", "104112035", "story_v_out_104112.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_104112", "104112035", "story_v_out_104112.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_12 = math.max(var_144_3, arg_141_1.talkMaxDuration)

			if var_144_2 <= arg_141_1.time_ and arg_141_1.time_ < var_144_2 + var_144_12 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_2) / var_144_12

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_2 + var_144_12 and arg_141_1.time_ < var_144_2 + var_144_12 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play104112036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 104112036
		arg_145_1.duration_ = 5.1

		local var_145_0 = {
			ja = 5.1,
			ko = 1.999999999999,
			zh = 2.166,
			en = 2.366
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play104112037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["2020_tpose"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect2020_tpose == nil then
				arg_145_1.var_.characterEffect2020_tpose = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.1

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect2020_tpose then
					arg_145_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect2020_tpose then
				arg_145_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_148_4 = arg_145_1.actors_["4010ui_story"]
			local var_148_5 = 0

			if var_148_5 < arg_145_1.time_ and arg_145_1.time_ <= var_148_5 + arg_148_0 and arg_145_1.var_.characterEffect4010ui_story == nil then
				arg_145_1.var_.characterEffect4010ui_story = var_148_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_6 = 0.1

			if var_148_5 <= arg_145_1.time_ and arg_145_1.time_ < var_148_5 + var_148_6 then
				local var_148_7 = (arg_145_1.time_ - var_148_5) / var_148_6

				if arg_145_1.var_.characterEffect4010ui_story then
					local var_148_8 = Mathf.Lerp(0, 0.5, var_148_7)

					arg_145_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_145_1.var_.characterEffect4010ui_story.fillRatio = var_148_8
				end
			end

			if arg_145_1.time_ >= var_148_5 + var_148_6 and arg_145_1.time_ < var_148_5 + var_148_6 + arg_148_0 and arg_145_1.var_.characterEffect4010ui_story then
				local var_148_9 = 0.5

				arg_145_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_145_1.var_.characterEffect4010ui_story.fillRatio = var_148_9
			end

			local var_148_10 = arg_145_1.actors_["4010ui_story"].transform
			local var_148_11 = 0

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1.var_.moveOldPos4010ui_story = var_148_10.localPosition
			end

			local var_148_12 = 0.001

			if var_148_11 <= arg_145_1.time_ and arg_145_1.time_ < var_148_11 + var_148_12 then
				local var_148_13 = (arg_145_1.time_ - var_148_11) / var_148_12
				local var_148_14 = Vector3.New(0, 100, 0)

				var_148_10.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos4010ui_story, var_148_14, var_148_13)

				local var_148_15 = manager.ui.mainCamera.transform.position - var_148_10.position

				var_148_10.forward = Vector3.New(var_148_15.x, var_148_15.y, var_148_15.z)

				local var_148_16 = var_148_10.localEulerAngles

				var_148_16.z = 0
				var_148_16.x = 0
				var_148_10.localEulerAngles = var_148_16
			end

			if arg_145_1.time_ >= var_148_11 + var_148_12 and arg_145_1.time_ < var_148_11 + var_148_12 + arg_148_0 then
				var_148_10.localPosition = Vector3.New(0, 100, 0)

				local var_148_17 = manager.ui.mainCamera.transform.position - var_148_10.position

				var_148_10.forward = Vector3.New(var_148_17.x, var_148_17.y, var_148_17.z)

				local var_148_18 = var_148_10.localEulerAngles

				var_148_18.z = 0
				var_148_18.x = 0
				var_148_10.localEulerAngles = var_148_18
			end

			local var_148_19 = arg_145_1.actors_["2020_tpose"].transform
			local var_148_20 = 0

			if var_148_20 < arg_145_1.time_ and arg_145_1.time_ <= var_148_20 + arg_148_0 then
				arg_145_1.var_.moveOldPos2020_tpose = var_148_19.localPosition
			end

			local var_148_21 = 0.001

			if var_148_20 <= arg_145_1.time_ and arg_145_1.time_ < var_148_20 + var_148_21 then
				local var_148_22 = (arg_145_1.time_ - var_148_20) / var_148_21
				local var_148_23 = Vector3.New(-0.7, -1.2, -4.1)

				var_148_19.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos2020_tpose, var_148_23, var_148_22)

				local var_148_24 = manager.ui.mainCamera.transform.position - var_148_19.position

				var_148_19.forward = Vector3.New(var_148_24.x, var_148_24.y, var_148_24.z)

				local var_148_25 = var_148_19.localEulerAngles

				var_148_25.z = 0
				var_148_25.x = 0
				var_148_19.localEulerAngles = var_148_25
			end

			if arg_145_1.time_ >= var_148_20 + var_148_21 and arg_145_1.time_ < var_148_20 + var_148_21 + arg_148_0 then
				var_148_19.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_148_26 = manager.ui.mainCamera.transform.position - var_148_19.position

				var_148_19.forward = Vector3.New(var_148_26.x, var_148_26.y, var_148_26.z)

				local var_148_27 = var_148_19.localEulerAngles

				var_148_27.z = 0
				var_148_27.x = 0
				var_148_19.localEulerAngles = var_148_27
			end

			local var_148_28 = 0

			if var_148_28 < arg_145_1.time_ and arg_145_1.time_ <= var_148_28 + arg_148_0 then
				arg_145_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_148_29 = 0
			local var_148_30 = 0.125

			if var_148_29 < arg_145_1.time_ and arg_145_1.time_ <= var_148_29 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_31 = arg_145_1:FormatText(StoryNameCfg[19].name)

				arg_145_1.leftNameTxt_.text = var_148_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_32 = arg_145_1:GetWordFromCfg(104112036)
				local var_148_33 = arg_145_1:FormatText(var_148_32.content)

				arg_145_1.text_.text = var_148_33

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_34 = 5
				local var_148_35 = utf8.len(var_148_33)
				local var_148_36 = var_148_34 <= 0 and var_148_30 or var_148_30 * (var_148_35 / var_148_34)

				if var_148_36 > 0 and var_148_30 < var_148_36 then
					arg_145_1.talkMaxDuration = var_148_36

					if var_148_36 + var_148_29 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_36 + var_148_29
					end
				end

				arg_145_1.text_.text = var_148_33
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112036", "story_v_out_104112.awb") ~= 0 then
					local var_148_37 = manager.audio:GetVoiceLength("story_v_out_104112", "104112036", "story_v_out_104112.awb") / 1000

					if var_148_37 + var_148_29 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_37 + var_148_29
					end

					if var_148_32.prefab_name ~= "" and arg_145_1.actors_[var_148_32.prefab_name] ~= nil then
						local var_148_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_32.prefab_name].transform, "story_v_out_104112", "104112036", "story_v_out_104112.awb")

						arg_145_1:RecordAudio("104112036", var_148_38)
						arg_145_1:RecordAudio("104112036", var_148_38)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_104112", "104112036", "story_v_out_104112.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_104112", "104112036", "story_v_out_104112.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_39 = math.max(var_148_30, arg_145_1.talkMaxDuration)

			if var_148_29 <= arg_145_1.time_ and arg_145_1.time_ < var_148_29 + var_148_39 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_29) / var_148_39

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_29 + var_148_39 and arg_145_1.time_ < var_148_29 + var_148_39 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play104112037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 104112037
		arg_149_1.duration_ = 3.3

		local var_149_0 = {
			ja = 3.3,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_149_0:Play104112038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["2030_tpose"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect2030_tpose == nil then
				arg_149_1.var_.characterEffect2030_tpose = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.1

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect2030_tpose then
					arg_149_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect2030_tpose then
				arg_149_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_152_4 = arg_149_1.actors_["2020_tpose"]
			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 and arg_149_1.var_.characterEffect2020_tpose == nil then
				arg_149_1.var_.characterEffect2020_tpose = var_152_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_6 = 0.1

			if var_152_5 <= arg_149_1.time_ and arg_149_1.time_ < var_152_5 + var_152_6 then
				local var_152_7 = (arg_149_1.time_ - var_152_5) / var_152_6

				if arg_149_1.var_.characterEffect2020_tpose then
					local var_152_8 = Mathf.Lerp(0, 0.5, var_152_7)

					arg_149_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_149_1.var_.characterEffect2020_tpose.fillRatio = var_152_8
				end
			end

			if arg_149_1.time_ >= var_152_5 + var_152_6 and arg_149_1.time_ < var_152_5 + var_152_6 + arg_152_0 and arg_149_1.var_.characterEffect2020_tpose then
				local var_152_9 = 0.5

				arg_149_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_149_1.var_.characterEffect2020_tpose.fillRatio = var_152_9
			end

			local var_152_10 = arg_149_1.actors_["2030_tpose"].transform
			local var_152_11 = 0

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1.var_.moveOldPos2030_tpose = var_152_10.localPosition
			end

			local var_152_12 = 0.001

			if var_152_11 <= arg_149_1.time_ and arg_149_1.time_ < var_152_11 + var_152_12 then
				local var_152_13 = (arg_149_1.time_ - var_152_11) / var_152_12
				local var_152_14 = Vector3.New(0.7, -1.2, -4.2)

				var_152_10.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos2030_tpose, var_152_14, var_152_13)

				local var_152_15 = manager.ui.mainCamera.transform.position - var_152_10.position

				var_152_10.forward = Vector3.New(var_152_15.x, var_152_15.y, var_152_15.z)

				local var_152_16 = var_152_10.localEulerAngles

				var_152_16.z = 0
				var_152_16.x = 0
				var_152_10.localEulerAngles = var_152_16
			end

			if arg_149_1.time_ >= var_152_11 + var_152_12 and arg_149_1.time_ < var_152_11 + var_152_12 + arg_152_0 then
				var_152_10.localPosition = Vector3.New(0.7, -1.2, -4.2)

				local var_152_17 = manager.ui.mainCamera.transform.position - var_152_10.position

				var_152_10.forward = Vector3.New(var_152_17.x, var_152_17.y, var_152_17.z)

				local var_152_18 = var_152_10.localEulerAngles

				var_152_18.z = 0
				var_152_18.x = 0
				var_152_10.localEulerAngles = var_152_18
			end

			local var_152_19 = 0

			if var_152_19 < arg_149_1.time_ and arg_149_1.time_ <= var_152_19 + arg_152_0 then
				arg_149_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_152_20 = 0
			local var_152_21 = 0.2

			if var_152_20 < arg_149_1.time_ and arg_149_1.time_ <= var_152_20 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_22 = arg_149_1:FormatText(StoryNameCfg[33].name)

				arg_149_1.leftNameTxt_.text = var_152_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_23 = arg_149_1:GetWordFromCfg(104112037)
				local var_152_24 = arg_149_1:FormatText(var_152_23.content)

				arg_149_1.text_.text = var_152_24

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_25 = 8
				local var_152_26 = utf8.len(var_152_24)
				local var_152_27 = var_152_25 <= 0 and var_152_21 or var_152_21 * (var_152_26 / var_152_25)

				if var_152_27 > 0 and var_152_21 < var_152_27 then
					arg_149_1.talkMaxDuration = var_152_27

					if var_152_27 + var_152_20 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_27 + var_152_20
					end
				end

				arg_149_1.text_.text = var_152_24
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112037", "story_v_out_104112.awb") ~= 0 then
					local var_152_28 = manager.audio:GetVoiceLength("story_v_out_104112", "104112037", "story_v_out_104112.awb") / 1000

					if var_152_28 + var_152_20 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_28 + var_152_20
					end

					if var_152_23.prefab_name ~= "" and arg_149_1.actors_[var_152_23.prefab_name] ~= nil then
						local var_152_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_23.prefab_name].transform, "story_v_out_104112", "104112037", "story_v_out_104112.awb")

						arg_149_1:RecordAudio("104112037", var_152_29)
						arg_149_1:RecordAudio("104112037", var_152_29)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_104112", "104112037", "story_v_out_104112.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_104112", "104112037", "story_v_out_104112.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_30 = math.max(var_152_21, arg_149_1.talkMaxDuration)

			if var_152_20 <= arg_149_1.time_ and arg_149_1.time_ < var_152_20 + var_152_30 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_20) / var_152_30

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_20 + var_152_30 and arg_149_1.time_ < var_152_20 + var_152_30 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play104112038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 104112038
		arg_153_1.duration_ = 4.1

		local var_153_0 = {
			ja = 4.1,
			ko = 2,
			zh = 2.366,
			en = 1.833
		}
		local var_153_1 = manager.audio:GetLocalizationFlag()

		if var_153_0[var_153_1] ~= nil then
			arg_153_1.duration_ = var_153_0[var_153_1]
		end

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play104112039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["2020_tpose"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect2020_tpose == nil then
				arg_153_1.var_.characterEffect2020_tpose = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.1

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect2020_tpose then
					arg_153_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect2020_tpose then
				arg_153_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_156_4 = arg_153_1.actors_["2030_tpose"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect2030_tpose == nil then
				arg_153_1.var_.characterEffect2030_tpose = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.1

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect2030_tpose then
					local var_156_8 = Mathf.Lerp(0, 0.5, var_156_7)

					arg_153_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_153_1.var_.characterEffect2030_tpose.fillRatio = var_156_8
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect2030_tpose then
				local var_156_9 = 0.5

				arg_153_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_153_1.var_.characterEffect2030_tpose.fillRatio = var_156_9
			end

			local var_156_10 = 0
			local var_156_11 = 0.25

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_12 = arg_153_1:FormatText(StoryNameCfg[19].name)

				arg_153_1.leftNameTxt_.text = var_156_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_13 = arg_153_1:GetWordFromCfg(104112038)
				local var_156_14 = arg_153_1:FormatText(var_156_13.content)

				arg_153_1.text_.text = var_156_14

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_15 = 10
				local var_156_16 = utf8.len(var_156_14)
				local var_156_17 = var_156_15 <= 0 and var_156_11 or var_156_11 * (var_156_16 / var_156_15)

				if var_156_17 > 0 and var_156_11 < var_156_17 then
					arg_153_1.talkMaxDuration = var_156_17

					if var_156_17 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_17 + var_156_10
					end
				end

				arg_153_1.text_.text = var_156_14
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112038", "story_v_out_104112.awb") ~= 0 then
					local var_156_18 = manager.audio:GetVoiceLength("story_v_out_104112", "104112038", "story_v_out_104112.awb") / 1000

					if var_156_18 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_18 + var_156_10
					end

					if var_156_13.prefab_name ~= "" and arg_153_1.actors_[var_156_13.prefab_name] ~= nil then
						local var_156_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_13.prefab_name].transform, "story_v_out_104112", "104112038", "story_v_out_104112.awb")

						arg_153_1:RecordAudio("104112038", var_156_19)
						arg_153_1:RecordAudio("104112038", var_156_19)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_104112", "104112038", "story_v_out_104112.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_104112", "104112038", "story_v_out_104112.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_20 = math.max(var_156_11, arg_153_1.talkMaxDuration)

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_20 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_10) / var_156_20

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_10 + var_156_20 and arg_153_1.time_ < var_156_10 + var_156_20 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play104112039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 104112039
		arg_157_1.duration_ = 2

		local var_157_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2,
			en = 1.999999999999
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
				arg_157_0:Play104112040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["4010ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect4010ui_story == nil then
				arg_157_1.var_.characterEffect4010ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.1

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect4010ui_story then
					arg_157_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect4010ui_story then
				arg_157_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_160_4 = arg_157_1.actors_["2020_tpose"]
			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 and arg_157_1.var_.characterEffect2020_tpose == nil then
				arg_157_1.var_.characterEffect2020_tpose = var_160_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_6 = 0.1

			if var_160_5 <= arg_157_1.time_ and arg_157_1.time_ < var_160_5 + var_160_6 then
				local var_160_7 = (arg_157_1.time_ - var_160_5) / var_160_6

				if arg_157_1.var_.characterEffect2020_tpose then
					local var_160_8 = Mathf.Lerp(0, 0.5, var_160_7)

					arg_157_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_157_1.var_.characterEffect2020_tpose.fillRatio = var_160_8
				end
			end

			if arg_157_1.time_ >= var_160_5 + var_160_6 and arg_157_1.time_ < var_160_5 + var_160_6 + arg_160_0 and arg_157_1.var_.characterEffect2020_tpose then
				local var_160_9 = 0.5

				arg_157_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_157_1.var_.characterEffect2020_tpose.fillRatio = var_160_9
			end

			local var_160_10 = arg_157_1.actors_["2030_tpose"].transform
			local var_160_11 = 0

			if var_160_11 < arg_157_1.time_ and arg_157_1.time_ <= var_160_11 + arg_160_0 then
				arg_157_1.var_.moveOldPos2030_tpose = var_160_10.localPosition
			end

			local var_160_12 = 0.001

			if var_160_11 <= arg_157_1.time_ and arg_157_1.time_ < var_160_11 + var_160_12 then
				local var_160_13 = (arg_157_1.time_ - var_160_11) / var_160_12
				local var_160_14 = Vector3.New(0, 100, 0)

				var_160_10.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos2030_tpose, var_160_14, var_160_13)

				local var_160_15 = manager.ui.mainCamera.transform.position - var_160_10.position

				var_160_10.forward = Vector3.New(var_160_15.x, var_160_15.y, var_160_15.z)

				local var_160_16 = var_160_10.localEulerAngles

				var_160_16.z = 0
				var_160_16.x = 0
				var_160_10.localEulerAngles = var_160_16
			end

			if arg_157_1.time_ >= var_160_11 + var_160_12 and arg_157_1.time_ < var_160_11 + var_160_12 + arg_160_0 then
				var_160_10.localPosition = Vector3.New(0, 100, 0)

				local var_160_17 = manager.ui.mainCamera.transform.position - var_160_10.position

				var_160_10.forward = Vector3.New(var_160_17.x, var_160_17.y, var_160_17.z)

				local var_160_18 = var_160_10.localEulerAngles

				var_160_18.z = 0
				var_160_18.x = 0
				var_160_10.localEulerAngles = var_160_18
			end

			local var_160_19 = arg_157_1.actors_["2020_tpose"].transform
			local var_160_20 = 0

			if var_160_20 < arg_157_1.time_ and arg_157_1.time_ <= var_160_20 + arg_160_0 then
				arg_157_1.var_.moveOldPos2020_tpose = var_160_19.localPosition
			end

			local var_160_21 = 0.001

			if var_160_20 <= arg_157_1.time_ and arg_157_1.time_ < var_160_20 + var_160_21 then
				local var_160_22 = (arg_157_1.time_ - var_160_20) / var_160_21
				local var_160_23 = Vector3.New(0, 100, 0)

				var_160_19.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos2020_tpose, var_160_23, var_160_22)

				local var_160_24 = manager.ui.mainCamera.transform.position - var_160_19.position

				var_160_19.forward = Vector3.New(var_160_24.x, var_160_24.y, var_160_24.z)

				local var_160_25 = var_160_19.localEulerAngles

				var_160_25.z = 0
				var_160_25.x = 0
				var_160_19.localEulerAngles = var_160_25
			end

			if arg_157_1.time_ >= var_160_20 + var_160_21 and arg_157_1.time_ < var_160_20 + var_160_21 + arg_160_0 then
				var_160_19.localPosition = Vector3.New(0, 100, 0)

				local var_160_26 = manager.ui.mainCamera.transform.position - var_160_19.position

				var_160_19.forward = Vector3.New(var_160_26.x, var_160_26.y, var_160_26.z)

				local var_160_27 = var_160_19.localEulerAngles

				var_160_27.z = 0
				var_160_27.x = 0
				var_160_19.localEulerAngles = var_160_27
			end

			local var_160_28 = arg_157_1.actors_["4010ui_story"].transform
			local var_160_29 = 0

			if var_160_29 < arg_157_1.time_ and arg_157_1.time_ <= var_160_29 + arg_160_0 then
				arg_157_1.var_.moveOldPos4010ui_story = var_160_28.localPosition
			end

			local var_160_30 = 0.001

			if var_160_29 <= arg_157_1.time_ and arg_157_1.time_ < var_160_29 + var_160_30 then
				local var_160_31 = (arg_157_1.time_ - var_160_29) / var_160_30
				local var_160_32 = Vector3.New(0, -1.59, -5.2)

				var_160_28.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos4010ui_story, var_160_32, var_160_31)

				local var_160_33 = manager.ui.mainCamera.transform.position - var_160_28.position

				var_160_28.forward = Vector3.New(var_160_33.x, var_160_33.y, var_160_33.z)

				local var_160_34 = var_160_28.localEulerAngles

				var_160_34.z = 0
				var_160_34.x = 0
				var_160_28.localEulerAngles = var_160_34
			end

			if arg_157_1.time_ >= var_160_29 + var_160_30 and arg_157_1.time_ < var_160_29 + var_160_30 + arg_160_0 then
				var_160_28.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_160_35 = manager.ui.mainCamera.transform.position - var_160_28.position

				var_160_28.forward = Vector3.New(var_160_35.x, var_160_35.y, var_160_35.z)

				local var_160_36 = var_160_28.localEulerAngles

				var_160_36.z = 0
				var_160_36.x = 0
				var_160_28.localEulerAngles = var_160_36
			end

			local var_160_37 = 0

			if var_160_37 < arg_157_1.time_ and arg_157_1.time_ <= var_160_37 + arg_160_0 then
				arg_157_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_160_38 = 0

			if var_160_38 < arg_157_1.time_ and arg_157_1.time_ <= var_160_38 + arg_160_0 then
				arg_157_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_160_39 = 0
			local var_160_40 = 0.075

			if var_160_39 < arg_157_1.time_ and arg_157_1.time_ <= var_160_39 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_41 = arg_157_1:FormatText(StoryNameCfg[42].name)

				arg_157_1.leftNameTxt_.text = var_160_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_42 = arg_157_1:GetWordFromCfg(104112039)
				local var_160_43 = arg_157_1:FormatText(var_160_42.content)

				arg_157_1.text_.text = var_160_43

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_44 = 3
				local var_160_45 = utf8.len(var_160_43)
				local var_160_46 = var_160_44 <= 0 and var_160_40 or var_160_40 * (var_160_45 / var_160_44)

				if var_160_46 > 0 and var_160_40 < var_160_46 then
					arg_157_1.talkMaxDuration = var_160_46

					if var_160_46 + var_160_39 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_46 + var_160_39
					end
				end

				arg_157_1.text_.text = var_160_43
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112039", "story_v_out_104112.awb") ~= 0 then
					local var_160_47 = manager.audio:GetVoiceLength("story_v_out_104112", "104112039", "story_v_out_104112.awb") / 1000

					if var_160_47 + var_160_39 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_47 + var_160_39
					end

					if var_160_42.prefab_name ~= "" and arg_157_1.actors_[var_160_42.prefab_name] ~= nil then
						local var_160_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_42.prefab_name].transform, "story_v_out_104112", "104112039", "story_v_out_104112.awb")

						arg_157_1:RecordAudio("104112039", var_160_48)
						arg_157_1:RecordAudio("104112039", var_160_48)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_104112", "104112039", "story_v_out_104112.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_104112", "104112039", "story_v_out_104112.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_49 = math.max(var_160_40, arg_157_1.talkMaxDuration)

			if var_160_39 <= arg_157_1.time_ and arg_157_1.time_ < var_160_39 + var_160_49 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_39) / var_160_49

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_39 + var_160_49 and arg_157_1.time_ < var_160_39 + var_160_49 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play104112040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 104112040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play104112041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["4010ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect4010ui_story == nil then
				arg_161_1.var_.characterEffect4010ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.1

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect4010ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_161_1.var_.characterEffect4010ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect4010ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_161_1.var_.characterEffect4010ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 0.675

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_8 = arg_161_1:GetWordFromCfg(104112040)
				local var_164_9 = arg_161_1:FormatText(var_164_8.content)

				arg_161_1.text_.text = var_164_9

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_10 = 27
				local var_164_11 = utf8.len(var_164_9)
				local var_164_12 = var_164_10 <= 0 and var_164_7 or var_164_7 * (var_164_11 / var_164_10)

				if var_164_12 > 0 and var_164_7 < var_164_12 then
					arg_161_1.talkMaxDuration = var_164_12

					if var_164_12 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_12 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_9
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_13 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_13 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_13

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_13 and arg_161_1.time_ < var_164_6 + var_164_13 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play104112041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 104112041
		arg_165_1.duration_ = 8.1

		local var_165_0 = {
			ja = 8.1,
			ko = 6.9,
			zh = 6.566,
			en = 7.766
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
				arg_165_0:Play104112042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["4010ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect4010ui_story == nil then
				arg_165_1.var_.characterEffect4010ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.1

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect4010ui_story then
					arg_165_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect4010ui_story then
				arg_165_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_168_4 = 0

			if var_168_4 < arg_165_1.time_ and arg_165_1.time_ <= var_168_4 + arg_168_0 then
				arg_165_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_168_5 = 0
			local var_168_6 = 0.65

			if var_168_5 < arg_165_1.time_ and arg_165_1.time_ <= var_168_5 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_7 = arg_165_1:FormatText(StoryNameCfg[42].name)

				arg_165_1.leftNameTxt_.text = var_168_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_8 = arg_165_1:GetWordFromCfg(104112041)
				local var_168_9 = arg_165_1:FormatText(var_168_8.content)

				arg_165_1.text_.text = var_168_9

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_10 = 26
				local var_168_11 = utf8.len(var_168_9)
				local var_168_12 = var_168_10 <= 0 and var_168_6 or var_168_6 * (var_168_11 / var_168_10)

				if var_168_12 > 0 and var_168_6 < var_168_12 then
					arg_165_1.talkMaxDuration = var_168_12

					if var_168_12 + var_168_5 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_12 + var_168_5
					end
				end

				arg_165_1.text_.text = var_168_9
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112041", "story_v_out_104112.awb") ~= 0 then
					local var_168_13 = manager.audio:GetVoiceLength("story_v_out_104112", "104112041", "story_v_out_104112.awb") / 1000

					if var_168_13 + var_168_5 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_5
					end

					if var_168_8.prefab_name ~= "" and arg_165_1.actors_[var_168_8.prefab_name] ~= nil then
						local var_168_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_8.prefab_name].transform, "story_v_out_104112", "104112041", "story_v_out_104112.awb")

						arg_165_1:RecordAudio("104112041", var_168_14)
						arg_165_1:RecordAudio("104112041", var_168_14)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_104112", "104112041", "story_v_out_104112.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_104112", "104112041", "story_v_out_104112.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_15 = math.max(var_168_6, arg_165_1.talkMaxDuration)

			if var_168_5 <= arg_165_1.time_ and arg_165_1.time_ < var_168_5 + var_168_15 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_5) / var_168_15

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_5 + var_168_15 and arg_165_1.time_ < var_168_5 + var_168_15 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play104112042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 104112042
		arg_169_1.duration_ = 9.766

		local var_169_0 = {
			ja = 8.933,
			ko = 9.333,
			zh = 8.833,
			en = 9.766
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
				arg_169_0:Play104112043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action2_1")
			end

			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_172_2 = 0
			local var_172_3 = 1

			if var_172_2 < arg_169_1.time_ and arg_169_1.time_ <= var_172_2 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_4 = arg_169_1:FormatText(StoryNameCfg[42].name)

				arg_169_1.leftNameTxt_.text = var_172_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_5 = arg_169_1:GetWordFromCfg(104112042)
				local var_172_6 = arg_169_1:FormatText(var_172_5.content)

				arg_169_1.text_.text = var_172_6

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_7 = 40
				local var_172_8 = utf8.len(var_172_6)
				local var_172_9 = var_172_7 <= 0 and var_172_3 or var_172_3 * (var_172_8 / var_172_7)

				if var_172_9 > 0 and var_172_3 < var_172_9 then
					arg_169_1.talkMaxDuration = var_172_9

					if var_172_9 + var_172_2 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_9 + var_172_2
					end
				end

				arg_169_1.text_.text = var_172_6
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112042", "story_v_out_104112.awb") ~= 0 then
					local var_172_10 = manager.audio:GetVoiceLength("story_v_out_104112", "104112042", "story_v_out_104112.awb") / 1000

					if var_172_10 + var_172_2 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_10 + var_172_2
					end

					if var_172_5.prefab_name ~= "" and arg_169_1.actors_[var_172_5.prefab_name] ~= nil then
						local var_172_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_5.prefab_name].transform, "story_v_out_104112", "104112042", "story_v_out_104112.awb")

						arg_169_1:RecordAudio("104112042", var_172_11)
						arg_169_1:RecordAudio("104112042", var_172_11)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_104112", "104112042", "story_v_out_104112.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_104112", "104112042", "story_v_out_104112.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_12 = math.max(var_172_3, arg_169_1.talkMaxDuration)

			if var_172_2 <= arg_169_1.time_ and arg_169_1.time_ < var_172_2 + var_172_12 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_2) / var_172_12

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_2 + var_172_12 and arg_169_1.time_ < var_172_2 + var_172_12 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play104112043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 104112043
		arg_173_1.duration_ = 4.9

		local var_173_0 = {
			ja = 4.9,
			ko = 2.6,
			zh = 3.333,
			en = 2.6
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
				arg_173_0:Play104112044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["4010ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect4010ui_story == nil then
				arg_173_1.var_.characterEffect4010ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.1

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect4010ui_story then
					local var_176_4 = Mathf.Lerp(0, 0.5, var_176_3)

					arg_173_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_173_1.var_.characterEffect4010ui_story.fillRatio = var_176_4
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect4010ui_story then
				local var_176_5 = 0.5

				arg_173_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_173_1.var_.characterEffect4010ui_story.fillRatio = var_176_5
			end

			local var_176_6 = arg_173_1.actors_["4010ui_story"].transform
			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 then
				arg_173_1.var_.moveOldPos4010ui_story = var_176_6.localPosition
			end

			local var_176_8 = 0.001

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_8 then
				local var_176_9 = (arg_173_1.time_ - var_176_7) / var_176_8
				local var_176_10 = Vector3.New(0, 100, 0)

				var_176_6.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos4010ui_story, var_176_10, var_176_9)

				local var_176_11 = manager.ui.mainCamera.transform.position - var_176_6.position

				var_176_6.forward = Vector3.New(var_176_11.x, var_176_11.y, var_176_11.z)

				local var_176_12 = var_176_6.localEulerAngles

				var_176_12.z = 0
				var_176_12.x = 0
				var_176_6.localEulerAngles = var_176_12
			end

			if arg_173_1.time_ >= var_176_7 + var_176_8 and arg_173_1.time_ < var_176_7 + var_176_8 + arg_176_0 then
				var_176_6.localPosition = Vector3.New(0, 100, 0)

				local var_176_13 = manager.ui.mainCamera.transform.position - var_176_6.position

				var_176_6.forward = Vector3.New(var_176_13.x, var_176_13.y, var_176_13.z)

				local var_176_14 = var_176_6.localEulerAngles

				var_176_14.z = 0
				var_176_14.x = 0
				var_176_6.localEulerAngles = var_176_14
			end

			local var_176_15 = 0
			local var_176_16 = 0.3

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_17 = arg_173_1:FormatText(StoryNameCfg[19].name)

				arg_173_1.leftNameTxt_.text = var_176_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_18 = arg_173_1:GetWordFromCfg(104112043)
				local var_176_19 = arg_173_1:FormatText(var_176_18.content)

				arg_173_1.text_.text = var_176_19

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_20 = 12
				local var_176_21 = utf8.len(var_176_19)
				local var_176_22 = var_176_20 <= 0 and var_176_16 or var_176_16 * (var_176_21 / var_176_20)

				if var_176_22 > 0 and var_176_16 < var_176_22 then
					arg_173_1.talkMaxDuration = var_176_22

					if var_176_22 + var_176_15 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_22 + var_176_15
					end
				end

				arg_173_1.text_.text = var_176_19
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112043", "story_v_out_104112.awb") ~= 0 then
					local var_176_23 = manager.audio:GetVoiceLength("story_v_out_104112", "104112043", "story_v_out_104112.awb") / 1000

					if var_176_23 + var_176_15 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_23 + var_176_15
					end

					if var_176_18.prefab_name ~= "" and arg_173_1.actors_[var_176_18.prefab_name] ~= nil then
						local var_176_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_18.prefab_name].transform, "story_v_out_104112", "104112043", "story_v_out_104112.awb")

						arg_173_1:RecordAudio("104112043", var_176_24)
						arg_173_1:RecordAudio("104112043", var_176_24)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_104112", "104112043", "story_v_out_104112.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_104112", "104112043", "story_v_out_104112.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_25 = math.max(var_176_16, arg_173_1.talkMaxDuration)

			if var_176_15 <= arg_173_1.time_ and arg_173_1.time_ < var_176_15 + var_176_25 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_15) / var_176_25

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_15 + var_176_25 and arg_173_1.time_ < var_176_15 + var_176_25 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play104112044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 104112044
		arg_177_1.duration_ = 8.1

		local var_177_0 = {
			ja = 6.2,
			ko = 8.1,
			zh = 7.166,
			en = 6.333
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
				arg_177_0:Play104112045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.95

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[33].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20302")

				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(104112044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112044", "story_v_out_104112.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_104112", "104112044", "story_v_out_104112.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_104112", "104112044", "story_v_out_104112.awb")

						arg_177_1:RecordAudio("104112044", var_180_9)
						arg_177_1:RecordAudio("104112044", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_104112", "104112044", "story_v_out_104112.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_104112", "104112044", "story_v_out_104112.awb")
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
	Play104112045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 104112045
		arg_181_1.duration_ = 5.1

		local var_181_0 = {
			ja = 3.1,
			ko = 3.066,
			zh = 3.733,
			en = 5.1
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
				arg_181_0:Play104112046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.425

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[65].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, true)
				arg_181_1.iconController_:SetSelectedState("hero")

				arg_181_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(104112045)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 17
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112045", "story_v_out_104112.awb") ~= 0 then
					local var_184_8 = manager.audio:GetVoiceLength("story_v_out_104112", "104112045", "story_v_out_104112.awb") / 1000

					if var_184_8 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_0
					end

					if var_184_3.prefab_name ~= "" and arg_181_1.actors_[var_184_3.prefab_name] ~= nil then
						local var_184_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_3.prefab_name].transform, "story_v_out_104112", "104112045", "story_v_out_104112.awb")

						arg_181_1:RecordAudio("104112045", var_184_9)
						arg_181_1:RecordAudio("104112045", var_184_9)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_104112", "104112045", "story_v_out_104112.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_104112", "104112045", "story_v_out_104112.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_10 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_10 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_10

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_10 and arg_181_1.time_ < var_184_0 + var_184_10 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play104112046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 104112046
		arg_185_1.duration_ = 7.833

		local var_185_0 = {
			ja = 4.166,
			ko = 2.833,
			zh = 1.999999999999,
			en = 7.833
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
				arg_185_0:Play104112047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 1

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				local var_188_2 = "play"
				local var_188_3 = "effect"

				arg_185_1:AudioAction(var_188_2, var_188_3, "se_story", "se_story_robot_short", "")
			end

			local var_188_4 = "2043_tpose"

			if arg_185_1.actors_[var_188_4] == nil then
				local var_188_5 = Object.Instantiate(Asset.Load("Char/" .. var_188_4), arg_185_1.stage_.transform)

				var_188_5.name = var_188_4
				var_188_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_185_1.actors_[var_188_4] = var_188_5

				local var_188_6 = var_188_5:GetComponentInChildren(typeof(CharacterEffect))

				var_188_6.enabled = true

				local var_188_7 = GameObjectTools.GetOrAddComponent(var_188_5, typeof(DynamicBoneHelper))

				if var_188_7 then
					var_188_7:EnableDynamicBone(false)
				end

				arg_185_1:ShowWeapon(var_188_6.transform, false)

				arg_185_1.var_[var_188_4 .. "Animator"] = var_188_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_185_1.var_[var_188_4 .. "Animator"].applyRootMotion = true
				arg_185_1.var_[var_188_4 .. "LipSync"] = var_188_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_188_8 = arg_185_1.actors_["2043_tpose"]
			local var_188_9 = 0

			if var_188_9 < arg_185_1.time_ and arg_185_1.time_ <= var_188_9 + arg_188_0 and arg_185_1.var_.characterEffect2043_tpose == nil then
				arg_185_1.var_.characterEffect2043_tpose = var_188_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_10 = 0.1

			if var_188_9 <= arg_185_1.time_ and arg_185_1.time_ < var_188_9 + var_188_10 then
				local var_188_11 = (arg_185_1.time_ - var_188_9) / var_188_10

				if arg_185_1.var_.characterEffect2043_tpose then
					arg_185_1.var_.characterEffect2043_tpose.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_9 + var_188_10 and arg_185_1.time_ < var_188_9 + var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect2043_tpose then
				arg_185_1.var_.characterEffect2043_tpose.fillFlat = false
			end

			local var_188_12 = arg_185_1.actors_["2043_tpose"].transform
			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1.var_.moveOldPos2043_tpose = var_188_12.localPosition
			end

			local var_188_14 = 0.001

			if var_188_13 <= arg_185_1.time_ and arg_185_1.time_ < var_188_13 + var_188_14 then
				local var_188_15 = (arg_185_1.time_ - var_188_13) / var_188_14
				local var_188_16 = Vector3.New(0, -0.95, -3.2)

				var_188_12.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos2043_tpose, var_188_16, var_188_15)

				local var_188_17 = manager.ui.mainCamera.transform.position - var_188_12.position

				var_188_12.forward = Vector3.New(var_188_17.x, var_188_17.y, var_188_17.z)

				local var_188_18 = var_188_12.localEulerAngles

				var_188_18.z = 0
				var_188_18.x = 0
				var_188_12.localEulerAngles = var_188_18
			end

			if arg_185_1.time_ >= var_188_13 + var_188_14 and arg_185_1.time_ < var_188_13 + var_188_14 + arg_188_0 then
				var_188_12.localPosition = Vector3.New(0, -0.95, -3.2)

				local var_188_19 = manager.ui.mainCamera.transform.position - var_188_12.position

				var_188_12.forward = Vector3.New(var_188_19.x, var_188_19.y, var_188_19.z)

				local var_188_20 = var_188_12.localEulerAngles

				var_188_20.z = 0
				var_188_20.x = 0
				var_188_12.localEulerAngles = var_188_20
			end

			local var_188_21 = 0

			if var_188_21 < arg_185_1.time_ and arg_185_1.time_ <= var_188_21 + arg_188_0 then
				arg_185_1:PlayTimeline("2043_tpose", "StoryTimeline/CharAction/story2043/story2043action/2043action1_1")
			end

			local var_188_22 = 0
			local var_188_23 = 0.225

			if var_188_22 < arg_185_1.time_ and arg_185_1.time_ <= var_188_22 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_24 = arg_185_1:FormatText(StoryNameCfg[29].name)

				arg_185_1.leftNameTxt_.text = var_188_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_25 = arg_185_1:GetWordFromCfg(104112046)
				local var_188_26 = arg_185_1:FormatText(var_188_25.content)

				arg_185_1.text_.text = var_188_26

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_27 = 9
				local var_188_28 = utf8.len(var_188_26)
				local var_188_29 = var_188_27 <= 0 and var_188_23 or var_188_23 * (var_188_28 / var_188_27)

				if var_188_29 > 0 and var_188_23 < var_188_29 then
					arg_185_1.talkMaxDuration = var_188_29

					if var_188_29 + var_188_22 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_29 + var_188_22
					end
				end

				arg_185_1.text_.text = var_188_26
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112046", "story_v_out_104112.awb") ~= 0 then
					local var_188_30 = manager.audio:GetVoiceLength("story_v_out_104112", "104112046", "story_v_out_104112.awb") / 1000

					if var_188_30 + var_188_22 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_30 + var_188_22
					end

					if var_188_25.prefab_name ~= "" and arg_185_1.actors_[var_188_25.prefab_name] ~= nil then
						local var_188_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_25.prefab_name].transform, "story_v_out_104112", "104112046", "story_v_out_104112.awb")

						arg_185_1:RecordAudio("104112046", var_188_31)
						arg_185_1:RecordAudio("104112046", var_188_31)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_104112", "104112046", "story_v_out_104112.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_104112", "104112046", "story_v_out_104112.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_32 = math.max(var_188_23, arg_185_1.talkMaxDuration)

			if var_188_22 <= arg_185_1.time_ and arg_185_1.time_ < var_188_22 + var_188_32 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_22) / var_188_32

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_22 + var_188_32 and arg_185_1.time_ < var_188_22 + var_188_32 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play104112047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 104112047
		arg_189_1.duration_ = 3.4

		local var_189_0 = {
			ja = 3.4,
			ko = 3.1,
			zh = 3.333,
			en = 2.833
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
				arg_189_0:Play104112048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["3009ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect3009ui_story == nil then
				arg_189_1.var_.characterEffect3009ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.1

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect3009ui_story then
					arg_189_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect3009ui_story then
				arg_189_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_192_4 = arg_189_1.actors_["2043_tpose"]
			local var_192_5 = 0

			if var_192_5 < arg_189_1.time_ and arg_189_1.time_ <= var_192_5 + arg_192_0 and arg_189_1.var_.characterEffect2043_tpose == nil then
				arg_189_1.var_.characterEffect2043_tpose = var_192_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_6 = 0.1

			if var_192_5 <= arg_189_1.time_ and arg_189_1.time_ < var_192_5 + var_192_6 then
				local var_192_7 = (arg_189_1.time_ - var_192_5) / var_192_6

				if arg_189_1.var_.characterEffect2043_tpose then
					local var_192_8 = Mathf.Lerp(0, 0.5, var_192_7)

					arg_189_1.var_.characterEffect2043_tpose.fillFlat = true
					arg_189_1.var_.characterEffect2043_tpose.fillRatio = var_192_8
				end
			end

			if arg_189_1.time_ >= var_192_5 + var_192_6 and arg_189_1.time_ < var_192_5 + var_192_6 + arg_192_0 and arg_189_1.var_.characterEffect2043_tpose then
				local var_192_9 = 0.5

				arg_189_1.var_.characterEffect2043_tpose.fillFlat = true
				arg_189_1.var_.characterEffect2043_tpose.fillRatio = var_192_9
			end

			local var_192_10 = arg_189_1.actors_["2043_tpose"].transform
			local var_192_11 = 0

			if var_192_11 < arg_189_1.time_ and arg_189_1.time_ <= var_192_11 + arg_192_0 then
				arg_189_1.var_.moveOldPos2043_tpose = var_192_10.localPosition
			end

			local var_192_12 = 0.001

			if var_192_11 <= arg_189_1.time_ and arg_189_1.time_ < var_192_11 + var_192_12 then
				local var_192_13 = (arg_189_1.time_ - var_192_11) / var_192_12
				local var_192_14 = Vector3.New(0, 100, 0)

				var_192_10.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos2043_tpose, var_192_14, var_192_13)

				local var_192_15 = manager.ui.mainCamera.transform.position - var_192_10.position

				var_192_10.forward = Vector3.New(var_192_15.x, var_192_15.y, var_192_15.z)

				local var_192_16 = var_192_10.localEulerAngles

				var_192_16.z = 0
				var_192_16.x = 0
				var_192_10.localEulerAngles = var_192_16
			end

			if arg_189_1.time_ >= var_192_11 + var_192_12 and arg_189_1.time_ < var_192_11 + var_192_12 + arg_192_0 then
				var_192_10.localPosition = Vector3.New(0, 100, 0)

				local var_192_17 = manager.ui.mainCamera.transform.position - var_192_10.position

				var_192_10.forward = Vector3.New(var_192_17.x, var_192_17.y, var_192_17.z)

				local var_192_18 = var_192_10.localEulerAngles

				var_192_18.z = 0
				var_192_18.x = 0
				var_192_10.localEulerAngles = var_192_18
			end

			local var_192_19 = arg_189_1.actors_["3009ui_story"].transform
			local var_192_20 = 0

			if var_192_20 < arg_189_1.time_ and arg_189_1.time_ <= var_192_20 + arg_192_0 then
				arg_189_1.var_.moveOldPos3009ui_story = var_192_19.localPosition

				local var_192_21 = "3009ui_story"

				arg_189_1:ShowWeapon(arg_189_1.var_[var_192_21 .. "Animator"].transform, true)
			end

			local var_192_22 = 0.001

			if var_192_20 <= arg_189_1.time_ and arg_189_1.time_ < var_192_20 + var_192_22 then
				local var_192_23 = (arg_189_1.time_ - var_192_20) / var_192_22
				local var_192_24 = Vector3.New(0.7, -1.75, -4.8)

				var_192_19.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos3009ui_story, var_192_24, var_192_23)

				local var_192_25 = manager.ui.mainCamera.transform.position - var_192_19.position

				var_192_19.forward = Vector3.New(var_192_25.x, var_192_25.y, var_192_25.z)

				local var_192_26 = var_192_19.localEulerAngles

				var_192_26.z = 0
				var_192_26.x = 0
				var_192_19.localEulerAngles = var_192_26
			end

			if arg_189_1.time_ >= var_192_20 + var_192_22 and arg_189_1.time_ < var_192_20 + var_192_22 + arg_192_0 then
				var_192_19.localPosition = Vector3.New(0.7, -1.75, -4.8)

				local var_192_27 = manager.ui.mainCamera.transform.position - var_192_19.position

				var_192_19.forward = Vector3.New(var_192_27.x, var_192_27.y, var_192_27.z)

				local var_192_28 = var_192_19.localEulerAngles

				var_192_28.z = 0
				var_192_28.x = 0
				var_192_19.localEulerAngles = var_192_28
			end

			local var_192_29 = 0

			if var_192_29 < arg_189_1.time_ and arg_189_1.time_ <= var_192_29 + arg_192_0 then
				arg_189_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action1_1")
			end

			local var_192_30 = 0

			if var_192_30 < arg_189_1.time_ and arg_189_1.time_ <= var_192_30 + arg_192_0 then
				arg_189_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_192_31 = 0
			local var_192_32 = 0.35

			if var_192_31 < arg_189_1.time_ and arg_189_1.time_ <= var_192_31 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_33 = arg_189_1:FormatText(StoryNameCfg[43].name)

				arg_189_1.leftNameTxt_.text = var_192_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_34 = arg_189_1:GetWordFromCfg(104112047)
				local var_192_35 = arg_189_1:FormatText(var_192_34.content)

				arg_189_1.text_.text = var_192_35

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_36 = 14
				local var_192_37 = utf8.len(var_192_35)
				local var_192_38 = var_192_36 <= 0 and var_192_32 or var_192_32 * (var_192_37 / var_192_36)

				if var_192_38 > 0 and var_192_32 < var_192_38 then
					arg_189_1.talkMaxDuration = var_192_38

					if var_192_38 + var_192_31 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_38 + var_192_31
					end
				end

				arg_189_1.text_.text = var_192_35
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112047", "story_v_out_104112.awb") ~= 0 then
					local var_192_39 = manager.audio:GetVoiceLength("story_v_out_104112", "104112047", "story_v_out_104112.awb") / 1000

					if var_192_39 + var_192_31 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_39 + var_192_31
					end

					if var_192_34.prefab_name ~= "" and arg_189_1.actors_[var_192_34.prefab_name] ~= nil then
						local var_192_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_34.prefab_name].transform, "story_v_out_104112", "104112047", "story_v_out_104112.awb")

						arg_189_1:RecordAudio("104112047", var_192_40)
						arg_189_1:RecordAudio("104112047", var_192_40)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_104112", "104112047", "story_v_out_104112.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_104112", "104112047", "story_v_out_104112.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_41 = math.max(var_192_32, arg_189_1.talkMaxDuration)

			if var_192_31 <= arg_189_1.time_ and arg_189_1.time_ < var_192_31 + var_192_41 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_31) / var_192_41

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_31 + var_192_41 and arg_189_1.time_ < var_192_31 + var_192_41 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play104112048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 104112048
		arg_193_1.duration_ = 9.933

		local var_193_0 = {
			ja = 9.933,
			ko = 4.366,
			zh = 6.5,
			en = 3.966
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
				arg_193_0:Play104112049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["4010ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect4010ui_story == nil then
				arg_193_1.var_.characterEffect4010ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.1

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect4010ui_story then
					arg_193_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect4010ui_story then
				arg_193_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_196_4 = arg_193_1.actors_["3009ui_story"]
			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 and arg_193_1.var_.characterEffect3009ui_story == nil then
				arg_193_1.var_.characterEffect3009ui_story = var_196_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_6 = 0.1

			if var_196_5 <= arg_193_1.time_ and arg_193_1.time_ < var_196_5 + var_196_6 then
				local var_196_7 = (arg_193_1.time_ - var_196_5) / var_196_6

				if arg_193_1.var_.characterEffect3009ui_story then
					local var_196_8 = Mathf.Lerp(0, 0.5, var_196_7)

					arg_193_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_193_1.var_.characterEffect3009ui_story.fillRatio = var_196_8
				end
			end

			if arg_193_1.time_ >= var_196_5 + var_196_6 and arg_193_1.time_ < var_196_5 + var_196_6 + arg_196_0 and arg_193_1.var_.characterEffect3009ui_story then
				local var_196_9 = 0.5

				arg_193_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_193_1.var_.characterEffect3009ui_story.fillRatio = var_196_9
			end

			local var_196_10 = arg_193_1.actors_["4010ui_story"].transform
			local var_196_11 = 0

			if var_196_11 < arg_193_1.time_ and arg_193_1.time_ <= var_196_11 + arg_196_0 then
				arg_193_1.var_.moveOldPos4010ui_story = var_196_10.localPosition
			end

			local var_196_12 = 0.001

			if var_196_11 <= arg_193_1.time_ and arg_193_1.time_ < var_196_11 + var_196_12 then
				local var_196_13 = (arg_193_1.time_ - var_196_11) / var_196_12
				local var_196_14 = Vector3.New(-0.7, -1.59, -5.2)

				var_196_10.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos4010ui_story, var_196_14, var_196_13)

				local var_196_15 = manager.ui.mainCamera.transform.position - var_196_10.position

				var_196_10.forward = Vector3.New(var_196_15.x, var_196_15.y, var_196_15.z)

				local var_196_16 = var_196_10.localEulerAngles

				var_196_16.z = 0
				var_196_16.x = 0
				var_196_10.localEulerAngles = var_196_16
			end

			if arg_193_1.time_ >= var_196_11 + var_196_12 and arg_193_1.time_ < var_196_11 + var_196_12 + arg_196_0 then
				var_196_10.localPosition = Vector3.New(-0.7, -1.59, -5.2)

				local var_196_17 = manager.ui.mainCamera.transform.position - var_196_10.position

				var_196_10.forward = Vector3.New(var_196_17.x, var_196_17.y, var_196_17.z)

				local var_196_18 = var_196_10.localEulerAngles

				var_196_18.z = 0
				var_196_18.x = 0
				var_196_10.localEulerAngles = var_196_18
			end

			local var_196_19 = 0

			if var_196_19 < arg_193_1.time_ and arg_193_1.time_ <= var_196_19 + arg_196_0 then
				arg_193_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_196_20 = 0

			if var_196_20 < arg_193_1.time_ and arg_193_1.time_ <= var_196_20 + arg_196_0 then
				arg_193_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_196_21 = 0
			local var_196_22 = 0.525

			if var_196_21 < arg_193_1.time_ and arg_193_1.time_ <= var_196_21 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_23 = arg_193_1:FormatText(StoryNameCfg[42].name)

				arg_193_1.leftNameTxt_.text = var_196_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_24 = arg_193_1:GetWordFromCfg(104112048)
				local var_196_25 = arg_193_1:FormatText(var_196_24.content)

				arg_193_1.text_.text = var_196_25

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_26 = 21
				local var_196_27 = utf8.len(var_196_25)
				local var_196_28 = var_196_26 <= 0 and var_196_22 or var_196_22 * (var_196_27 / var_196_26)

				if var_196_28 > 0 and var_196_22 < var_196_28 then
					arg_193_1.talkMaxDuration = var_196_28

					if var_196_28 + var_196_21 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_28 + var_196_21
					end
				end

				arg_193_1.text_.text = var_196_25
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112048", "story_v_out_104112.awb") ~= 0 then
					local var_196_29 = manager.audio:GetVoiceLength("story_v_out_104112", "104112048", "story_v_out_104112.awb") / 1000

					if var_196_29 + var_196_21 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_29 + var_196_21
					end

					if var_196_24.prefab_name ~= "" and arg_193_1.actors_[var_196_24.prefab_name] ~= nil then
						local var_196_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_24.prefab_name].transform, "story_v_out_104112", "104112048", "story_v_out_104112.awb")

						arg_193_1:RecordAudio("104112048", var_196_30)
						arg_193_1:RecordAudio("104112048", var_196_30)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_104112", "104112048", "story_v_out_104112.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_104112", "104112048", "story_v_out_104112.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_31 = math.max(var_196_22, arg_193_1.talkMaxDuration)

			if var_196_21 <= arg_193_1.time_ and arg_193_1.time_ < var_196_21 + var_196_31 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_21) / var_196_31

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_21 + var_196_31 and arg_193_1.time_ < var_196_21 + var_196_31 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play104112049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 104112049
		arg_197_1.duration_ = 5.6

		local var_197_0 = {
			ja = 5.6,
			ko = 3.133,
			zh = 5.033,
			en = 5
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
				arg_197_0:Play104112050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["3009ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect3009ui_story == nil then
				arg_197_1.var_.characterEffect3009ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.1

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect3009ui_story then
					arg_197_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect3009ui_story then
				arg_197_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_200_4 = arg_197_1.actors_["4010ui_story"]
			local var_200_5 = 0

			if var_200_5 < arg_197_1.time_ and arg_197_1.time_ <= var_200_5 + arg_200_0 and arg_197_1.var_.characterEffect4010ui_story == nil then
				arg_197_1.var_.characterEffect4010ui_story = var_200_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_6 = 0.1

			if var_200_5 <= arg_197_1.time_ and arg_197_1.time_ < var_200_5 + var_200_6 then
				local var_200_7 = (arg_197_1.time_ - var_200_5) / var_200_6

				if arg_197_1.var_.characterEffect4010ui_story then
					local var_200_8 = Mathf.Lerp(0, 0.5, var_200_7)

					arg_197_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_197_1.var_.characterEffect4010ui_story.fillRatio = var_200_8
				end
			end

			if arg_197_1.time_ >= var_200_5 + var_200_6 and arg_197_1.time_ < var_200_5 + var_200_6 + arg_200_0 and arg_197_1.var_.characterEffect4010ui_story then
				local var_200_9 = 0.5

				arg_197_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_197_1.var_.characterEffect4010ui_story.fillRatio = var_200_9
			end

			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 then
				arg_197_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_200_11 = 0

			if var_200_11 < arg_197_1.time_ and arg_197_1.time_ <= var_200_11 + arg_200_0 then
				arg_197_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action2_1")
			end

			local var_200_12 = 0
			local var_200_13 = 0.525

			if var_200_12 < arg_197_1.time_ and arg_197_1.time_ <= var_200_12 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_14 = arg_197_1:FormatText(StoryNameCfg[43].name)

				arg_197_1.leftNameTxt_.text = var_200_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_15 = arg_197_1:GetWordFromCfg(104112049)
				local var_200_16 = arg_197_1:FormatText(var_200_15.content)

				arg_197_1.text_.text = var_200_16

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_17 = 28
				local var_200_18 = utf8.len(var_200_16)
				local var_200_19 = var_200_17 <= 0 and var_200_13 or var_200_13 * (var_200_18 / var_200_17)

				if var_200_19 > 0 and var_200_13 < var_200_19 then
					arg_197_1.talkMaxDuration = var_200_19

					if var_200_19 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_19 + var_200_12
					end
				end

				arg_197_1.text_.text = var_200_16
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112049", "story_v_out_104112.awb") ~= 0 then
					local var_200_20 = manager.audio:GetVoiceLength("story_v_out_104112", "104112049", "story_v_out_104112.awb") / 1000

					if var_200_20 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_20 + var_200_12
					end

					if var_200_15.prefab_name ~= "" and arg_197_1.actors_[var_200_15.prefab_name] ~= nil then
						local var_200_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_15.prefab_name].transform, "story_v_out_104112", "104112049", "story_v_out_104112.awb")

						arg_197_1:RecordAudio("104112049", var_200_21)
						arg_197_1:RecordAudio("104112049", var_200_21)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_104112", "104112049", "story_v_out_104112.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_104112", "104112049", "story_v_out_104112.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_22 = math.max(var_200_13, arg_197_1.talkMaxDuration)

			if var_200_12 <= arg_197_1.time_ and arg_197_1.time_ < var_200_12 + var_200_22 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_12) / var_200_22

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_12 + var_200_22 and arg_197_1.time_ < var_200_12 + var_200_22 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play104112050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 104112050
		arg_201_1.duration_ = 7.466

		local var_201_0 = {
			ja = 5.833,
			ko = 5.9,
			zh = 7.466,
			en = 5.066
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
			arg_201_1.auto_ = false
		end

		function arg_201_1.playNext_(arg_203_0)
			arg_201_1.onStoryFinished_()
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["4010ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect4010ui_story == nil then
				arg_201_1.var_.characterEffect4010ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.1

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect4010ui_story then
					arg_201_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect4010ui_story then
				arg_201_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_204_4 = arg_201_1.actors_["3009ui_story"]
			local var_204_5 = 0

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 and arg_201_1.var_.characterEffect3009ui_story == nil then
				arg_201_1.var_.characterEffect3009ui_story = var_204_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_6 = 0.1

			if var_204_5 <= arg_201_1.time_ and arg_201_1.time_ < var_204_5 + var_204_6 then
				local var_204_7 = (arg_201_1.time_ - var_204_5) / var_204_6

				if arg_201_1.var_.characterEffect3009ui_story then
					local var_204_8 = Mathf.Lerp(0, 0.5, var_204_7)

					arg_201_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_201_1.var_.characterEffect3009ui_story.fillRatio = var_204_8
				end
			end

			if arg_201_1.time_ >= var_204_5 + var_204_6 and arg_201_1.time_ < var_204_5 + var_204_6 + arg_204_0 and arg_201_1.var_.characterEffect3009ui_story then
				local var_204_9 = 0.5

				arg_201_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_201_1.var_.characterEffect3009ui_story.fillRatio = var_204_9
			end

			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 then
				arg_201_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_204_11 = 0

			if var_204_11 < arg_201_1.time_ and arg_201_1.time_ <= var_204_11 + arg_204_0 then
				arg_201_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_204_12 = 0
			local var_204_13 = 0.55

			if var_204_12 < arg_201_1.time_ and arg_201_1.time_ <= var_204_12 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_14 = arg_201_1:FormatText(StoryNameCfg[42].name)

				arg_201_1.leftNameTxt_.text = var_204_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_15 = arg_201_1:GetWordFromCfg(104112050)
				local var_204_16 = arg_201_1:FormatText(var_204_15.content)

				arg_201_1.text_.text = var_204_16

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_17 = 22
				local var_204_18 = utf8.len(var_204_16)
				local var_204_19 = var_204_17 <= 0 and var_204_13 or var_204_13 * (var_204_18 / var_204_17)

				if var_204_19 > 0 and var_204_13 < var_204_19 then
					arg_201_1.talkMaxDuration = var_204_19

					if var_204_19 + var_204_12 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_19 + var_204_12
					end
				end

				arg_201_1.text_.text = var_204_16
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104112", "104112050", "story_v_out_104112.awb") ~= 0 then
					local var_204_20 = manager.audio:GetVoiceLength("story_v_out_104112", "104112050", "story_v_out_104112.awb") / 1000

					if var_204_20 + var_204_12 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_20 + var_204_12
					end

					if var_204_15.prefab_name ~= "" and arg_201_1.actors_[var_204_15.prefab_name] ~= nil then
						local var_204_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_15.prefab_name].transform, "story_v_out_104112", "104112050", "story_v_out_104112.awb")

						arg_201_1:RecordAudio("104112050", var_204_21)
						arg_201_1:RecordAudio("104112050", var_204_21)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_104112", "104112050", "story_v_out_104112.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_104112", "104112050", "story_v_out_104112.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_22 = math.max(var_204_13, arg_201_1.talkMaxDuration)

			if var_204_12 <= arg_201_1.time_ and arg_201_1.time_ < var_204_12 + var_204_22 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_12) / var_204_22

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_12 + var_204_22 and arg_201_1.time_ < var_204_12 + var_204_22 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B14"
	},
	voices = {
		"story_v_out_104112.awb"
	}
}
