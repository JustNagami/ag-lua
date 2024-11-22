return {
	Play104041001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104041001
		arg_1_1.duration_ = 5.066

		local var_1_0 = {
			ja = 4.6,
			ko = 4.566,
			zh = 5.066,
			en = 3.8
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
				arg_1_0:Play104041002(arg_1_1)
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

			local var_4_8 = "1084ui_story"

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

			local var_4_12 = arg_1_1.actors_["1084ui_story"]
			local var_4_13 = 1.5

			if var_4_13 < arg_1_1.time_ and arg_1_1.time_ <= var_4_13 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_14 = 0.1

			if var_4_13 <= arg_1_1.time_ and arg_1_1.time_ < var_4_13 + var_4_14 then
				local var_4_15 = (arg_1_1.time_ - var_4_13) / var_4_14

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_13 + var_4_14 and arg_1_1.time_ < var_4_13 + var_4_14 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_16 = "B04b"

			if arg_1_1.bgs_[var_4_16] == nil then
				local var_4_17 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_17:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_16)
				var_4_17.name = var_4_16
				var_4_17.transform.parent = arg_1_1.stage_.transform
				var_4_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_16] = var_4_17
			end

			local var_4_18 = arg_1_1.bgs_.B04b
			local var_4_19 = 0

			if var_4_19 < arg_1_1.time_ and arg_1_1.time_ <= var_4_19 + arg_4_0 then
				local var_4_20 = var_4_18:GetComponent("SpriteRenderer")

				if var_4_20 then
					var_4_20.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_21 = var_4_20.material
					local var_4_22 = var_4_21:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB04b = var_4_22.a
					arg_1_1.var_.alphaMatValueB04b = var_4_21
				end

				arg_1_1.var_.alphaOldValueB04b = 0
			end

			local var_4_23 = 1.5

			if var_4_19 <= arg_1_1.time_ and arg_1_1.time_ < var_4_19 + var_4_23 then
				local var_4_24 = (arg_1_1.time_ - var_4_19) / var_4_23
				local var_4_25 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB04b, 1, var_4_24)

				if arg_1_1.var_.alphaMatValueB04b then
					local var_4_26 = arg_1_1.var_.alphaMatValueB04b
					local var_4_27 = var_4_26:GetColor("_Color")

					var_4_27.a = var_4_25

					var_4_26:SetColor("_Color", var_4_27)
				end
			end

			if arg_1_1.time_ >= var_4_19 + var_4_23 and arg_1_1.time_ < var_4_19 + var_4_23 + arg_4_0 and arg_1_1.var_.alphaMatValueB04b then
				local var_4_28 = arg_1_1.var_.alphaMatValueB04b
				local var_4_29 = var_4_28:GetColor("_Color")

				var_4_29.a = 1

				var_4_28:SetColor("_Color", var_4_29)
			end

			local var_4_30 = 0

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_31 = manager.ui.mainCamera.transform.localPosition
				local var_4_32 = Vector3.New(0, 0, 10) + Vector3.New(var_4_31.x, var_4_31.y, 0)
				local var_4_33 = arg_1_1.bgs_.B04b

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
					if iter_4_0 ~= "B04b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_44 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_45 = 1.5

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1.var_.moveOldPos1084ui_story = var_4_44.localPosition
			end

			local var_4_46 = 0.001

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				local var_4_47 = (arg_1_1.time_ - var_4_45) / var_4_46
				local var_4_48 = Vector3.New(-0.7, -0.97, -6)

				var_4_44.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1084ui_story, var_4_48, var_4_47)

				local var_4_49 = manager.ui.mainCamera.transform.position - var_4_44.position

				var_4_44.forward = Vector3.New(var_4_49.x, var_4_49.y, var_4_49.z)

				local var_4_50 = var_4_44.localEulerAngles

				var_4_50.z = 0
				var_4_50.x = 0
				var_4_44.localEulerAngles = var_4_50
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				var_4_44.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_4_51 = manager.ui.mainCamera.transform.position - var_4_44.position

				var_4_44.forward = Vector3.New(var_4_51.x, var_4_51.y, var_4_51.z)

				local var_4_52 = var_4_44.localEulerAngles

				var_4_52.z = 0
				var_4_52.x = 0
				var_4_44.localEulerAngles = var_4_52
			end

			local var_4_53 = 1.5

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_4_54 = 0

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_55 = 1.5

			if arg_1_1.time_ >= var_4_54 + var_4_55 and arg_1_1.time_ < var_4_54 + var_4_55 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_56 = 0

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_57 = 1.5
			local var_4_58 = 0.375

			if var_4_57 < arg_1_1.time_ and arg_1_1.time_ <= var_4_57 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_59 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_59:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_60 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_61 = arg_1_1:GetWordFromCfg(104041001)
				local var_4_62 = arg_1_1:FormatText(var_4_61.content)

				arg_1_1.text_.text = var_4_62

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_63 = 14
				local var_4_64 = utf8.len(var_4_62)
				local var_4_65 = var_4_63 <= 0 and var_4_58 or var_4_58 * (var_4_64 / var_4_63)

				if var_4_65 > 0 and var_4_58 < var_4_65 then
					arg_1_1.talkMaxDuration = var_4_65
					var_4_57 = var_4_57 + 0.3

					if var_4_65 + var_4_57 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_65 + var_4_57
					end
				end

				arg_1_1.text_.text = var_4_62
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041001", "story_v_out_104041.awb") ~= 0 then
					local var_4_66 = manager.audio:GetVoiceLength("story_v_out_104041", "104041001", "story_v_out_104041.awb") / 1000

					if var_4_66 + var_4_57 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_66 + var_4_57
					end

					if var_4_61.prefab_name ~= "" and arg_1_1.actors_[var_4_61.prefab_name] ~= nil then
						local var_4_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_61.prefab_name].transform, "story_v_out_104041", "104041001", "story_v_out_104041.awb")

						arg_1_1:RecordAudio("104041001", var_4_67)
						arg_1_1:RecordAudio("104041001", var_4_67)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_104041", "104041001", "story_v_out_104041.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_104041", "104041001", "story_v_out_104041.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_68 = var_4_57 + 0.3
			local var_4_69 = math.max(var_4_58, arg_1_1.talkMaxDuration)

			if var_4_68 <= arg_1_1.time_ and arg_1_1.time_ < var_4_68 + var_4_69 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_68) / var_4_69

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_68 + var_4_69 and arg_1_1.time_ < var_4_68 + var_4_69 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play104041002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104041002
		arg_7_1.duration_ = 14.633

		local var_7_0 = {
			ja = 13.4,
			ko = 14.633,
			zh = 10.933,
			en = 13.5
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
				arg_7_0:Play104041003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1036ui_story"

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

			local var_10_4 = arg_7_1.actors_["1036ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1036ui_story == nil then
				arg_7_1.var_.characterEffect1036ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1036ui_story then
					arg_7_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1036ui_story then
				arg_7_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["1084ui_story"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect1084ui_story then
					local var_10_12 = Mathf.Lerp(0, 0.5, var_10_11)

					arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_12
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				local var_10_13 = 0.5

				arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["1036ui_story"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos1036ui_story = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -1.09, -5.78)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1036ui_story, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -1.09, -5.78)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action2_1")
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_10_25 = 0
			local var_10_26 = 1.45

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[5].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(104041002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 57
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

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041002", "story_v_out_104041.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_104041", "104041002", "story_v_out_104041.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_104041", "104041002", "story_v_out_104041.awb")

						arg_7_1:RecordAudio("104041002", var_10_34)
						arg_7_1:RecordAudio("104041002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_104041", "104041002", "story_v_out_104041.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_104041", "104041002", "story_v_out_104041.awb")
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
	Play104041003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104041003
		arg_11_1.duration_ = 9.433

		local var_11_0 = {
			ja = 9.433,
			ko = 5.2,
			zh = 1.4,
			en = 4.033
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
				arg_11_0:Play104041004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1036ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1036ui_story == nil then
				arg_11_1.var_.characterEffect1036ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.1

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1036ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1036ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1036ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1036ui_story.fillRatio = var_14_5
			end

			local var_14_6 = arg_11_1.actors_["1036ui_story"].transform
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.var_.moveOldPos1036ui_story = var_14_6.localPosition
			end

			local var_14_8 = 0.001

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_8 then
				local var_14_9 = (arg_11_1.time_ - var_14_7) / var_14_8
				local var_14_10 = Vector3.New(0, 100, 0)

				var_14_6.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1036ui_story, var_14_10, var_14_9)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_6.position

				var_14_6.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_6.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_6.localEulerAngles = var_14_12
			end

			if arg_11_1.time_ >= var_14_7 + var_14_8 and arg_11_1.time_ < var_14_7 + var_14_8 + arg_14_0 then
				var_14_6.localPosition = Vector3.New(0, 100, 0)

				local var_14_13 = manager.ui.mainCamera.transform.position - var_14_6.position

				var_14_6.forward = Vector3.New(var_14_13.x, var_14_13.y, var_14_13.z)

				local var_14_14 = var_14_6.localEulerAngles

				var_14_14.z = 0
				var_14_14.x = 0
				var_14_6.localEulerAngles = var_14_14
			end

			local var_14_15 = arg_11_1.actors_["1084ui_story"].transform
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 then
				arg_11_1.var_.moveOldPos1084ui_story = var_14_15.localPosition
			end

			local var_14_17 = 0.001

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17
				local var_14_19 = Vector3.New(0, 100, 0)

				var_14_15.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1084ui_story, var_14_19, var_14_18)

				local var_14_20 = manager.ui.mainCamera.transform.position - var_14_15.position

				var_14_15.forward = Vector3.New(var_14_20.x, var_14_20.y, var_14_20.z)

				local var_14_21 = var_14_15.localEulerAngles

				var_14_21.z = 0
				var_14_21.x = 0
				var_14_15.localEulerAngles = var_14_21
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 then
				var_14_15.localPosition = Vector3.New(0, 100, 0)

				local var_14_22 = manager.ui.mainCamera.transform.position - var_14_15.position

				var_14_15.forward = Vector3.New(var_14_22.x, var_14_22.y, var_14_22.z)

				local var_14_23 = var_14_15.localEulerAngles

				var_14_23.z = 0
				var_14_23.x = 0
				var_14_15.localEulerAngles = var_14_23
			end

			local var_14_24 = 0
			local var_14_25 = 0.45

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_26 = arg_11_1:FormatText(StoryNameCfg[57].name)

				arg_11_1.leftNameTxt_.text = var_14_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2026")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_27 = arg_11_1:GetWordFromCfg(104041003)
				local var_14_28 = arg_11_1:FormatText(var_14_27.content)

				arg_11_1.text_.text = var_14_28

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_29 = 18
				local var_14_30 = utf8.len(var_14_28)
				local var_14_31 = var_14_29 <= 0 and var_14_25 or var_14_25 * (var_14_30 / var_14_29)

				if var_14_31 > 0 and var_14_25 < var_14_31 then
					arg_11_1.talkMaxDuration = var_14_31

					if var_14_31 + var_14_24 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_31 + var_14_24
					end
				end

				arg_11_1.text_.text = var_14_28
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041003", "story_v_out_104041.awb") ~= 0 then
					local var_14_32 = manager.audio:GetVoiceLength("story_v_out_104041", "104041003", "story_v_out_104041.awb") / 1000

					if var_14_32 + var_14_24 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_32 + var_14_24
					end

					if var_14_27.prefab_name ~= "" and arg_11_1.actors_[var_14_27.prefab_name] ~= nil then
						local var_14_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_27.prefab_name].transform, "story_v_out_104041", "104041003", "story_v_out_104041.awb")

						arg_11_1:RecordAudio("104041003", var_14_33)
						arg_11_1:RecordAudio("104041003", var_14_33)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104041", "104041003", "story_v_out_104041.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104041", "104041003", "story_v_out_104041.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_34 = math.max(var_14_25, arg_11_1.talkMaxDuration)

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_34 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_24) / var_14_34

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_24 + var_14_34 and arg_11_1.time_ < var_14_24 + var_14_34 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play104041004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104041004
		arg_15_1.duration_ = 1.999999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play104041005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1011ui_story"

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

			local var_18_4 = arg_15_1.actors_["1011ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story == nil then
				arg_15_1.var_.characterEffect1011ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1011ui_story then
					arg_15_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story then
				arg_15_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["1011ui_story"].transform
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 then
				arg_15_1.var_.moveOldPos1011ui_story = var_18_8.localPosition
			end

			local var_18_10 = 0.001

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10
				local var_18_12 = Vector3.New(-0.7, -0.71, -6)

				var_18_8.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1011ui_story, var_18_12, var_18_11)

				local var_18_13 = manager.ui.mainCamera.transform.position - var_18_8.position

				var_18_8.forward = Vector3.New(var_18_13.x, var_18_13.y, var_18_13.z)

				local var_18_14 = var_18_8.localEulerAngles

				var_18_14.z = 0
				var_18_14.x = 0
				var_18_8.localEulerAngles = var_18_14
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 then
				var_18_8.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_18_15 = manager.ui.mainCamera.transform.position - var_18_8.position

				var_18_8.forward = Vector3.New(var_18_15.x, var_18_15.y, var_18_15.z)

				local var_18_16 = var_18_8.localEulerAngles

				var_18_16.z = 0
				var_18_16.x = 0
				var_18_8.localEulerAngles = var_18_16
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_18_19 = 0
			local var_18_20 = 0.075

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_21 = arg_15_1:FormatText(StoryNameCfg[37].name)

				arg_15_1.leftNameTxt_.text = var_18_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(104041004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041004", "story_v_out_104041.awb") ~= 0 then
					local var_18_27 = manager.audio:GetVoiceLength("story_v_out_104041", "104041004", "story_v_out_104041.awb") / 1000

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end

					if var_18_22.prefab_name ~= "" and arg_15_1.actors_[var_18_22.prefab_name] ~= nil then
						local var_18_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_22.prefab_name].transform, "story_v_out_104041", "104041004", "story_v_out_104041.awb")

						arg_15_1:RecordAudio("104041004", var_18_28)
						arg_15_1:RecordAudio("104041004", var_18_28)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104041", "104041004", "story_v_out_104041.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104041", "104041004", "story_v_out_104041.awb")
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
	Play104041005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104041005
		arg_19_1.duration_ = 3.566

		local var_19_0 = {
			ja = 3.566,
			ko = 2.066,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_19_0:Play104041006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1084ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1084ui_story then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1011ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1011ui_story == nil then
				arg_19_1.var_.characterEffect1011ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1011ui_story then
					local var_22_8 = Mathf.Lerp(0, 0.5, var_22_7)

					arg_19_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1011ui_story.fillRatio = var_22_8
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1011ui_story then
				local var_22_9 = 0.5

				arg_19_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1011ui_story.fillRatio = var_22_9
			end

			local var_22_10 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_10.localPosition
			end

			local var_22_12 = 0.001

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_12 then
				local var_22_13 = (arg_19_1.time_ - var_22_11) / var_22_12
				local var_22_14 = Vector3.New(0.7, -0.97, -6)

				var_22_10.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_14, var_22_13)

				local var_22_15 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_15.x, var_22_15.y, var_22_15.z)

				local var_22_16 = var_22_10.localEulerAngles

				var_22_16.z = 0
				var_22_16.x = 0
				var_22_10.localEulerAngles = var_22_16
			end

			if arg_19_1.time_ >= var_22_11 + var_22_12 and arg_19_1.time_ < var_22_11 + var_22_12 + arg_22_0 then
				var_22_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_22_17 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_17.x, var_22_17.y, var_22_17.z)

				local var_22_18 = var_22_10.localEulerAngles

				var_22_18.z = 0
				var_22_18.x = 0
				var_22_10.localEulerAngles = var_22_18
			end

			local var_22_19 = 0

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_22_21 = 0
			local var_22_22 = 0.175

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_23 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_24 = arg_19_1:GetWordFromCfg(104041005)
				local var_22_25 = arg_19_1:FormatText(var_22_24.content)

				arg_19_1.text_.text = var_22_25

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_26 = 7
				local var_22_27 = utf8.len(var_22_25)
				local var_22_28 = var_22_26 <= 0 and var_22_22 or var_22_22 * (var_22_27 / var_22_26)

				if var_22_28 > 0 and var_22_22 < var_22_28 then
					arg_19_1.talkMaxDuration = var_22_28

					if var_22_28 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_28 + var_22_21
					end
				end

				arg_19_1.text_.text = var_22_25
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041005", "story_v_out_104041.awb") ~= 0 then
					local var_22_29 = manager.audio:GetVoiceLength("story_v_out_104041", "104041005", "story_v_out_104041.awb") / 1000

					if var_22_29 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_29 + var_22_21
					end

					if var_22_24.prefab_name ~= "" and arg_19_1.actors_[var_22_24.prefab_name] ~= nil then
						local var_22_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_24.prefab_name].transform, "story_v_out_104041", "104041005", "story_v_out_104041.awb")

						arg_19_1:RecordAudio("104041005", var_22_30)
						arg_19_1:RecordAudio("104041005", var_22_30)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104041", "104041005", "story_v_out_104041.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104041", "104041005", "story_v_out_104041.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_31 = math.max(var_22_22, arg_19_1.talkMaxDuration)

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_31 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_21) / var_22_31

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_21 + var_22_31 and arg_19_1.time_ < var_22_21 + var_22_31 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104041006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104041006
		arg_23_1.duration_ = 17.966

		local var_23_0 = {
			ja = 17.966,
			ko = 7.733,
			zh = 7.833,
			en = 9.4
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
				arg_23_0:Play104041007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1019ui_story"

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

			local var_26_4 = arg_23_1.actors_["1019ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story == nil then
				arg_23_1.var_.characterEffect1019ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1019ui_story then
					arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["1084ui_story"]
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_10 = 0.1

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_12 = Mathf.Lerp(0, 0.5, var_26_11)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_12
				end
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_13 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_13
			end

			local var_26_14 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_14.localPosition
			end

			local var_26_16 = 0.001

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16
				local var_26_18 = Vector3.New(0, 100, 0)

				var_26_14.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_18, var_26_17)

				local var_26_19 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_19.x, var_26_19.y, var_26_19.z)

				local var_26_20 = var_26_14.localEulerAngles

				var_26_20.z = 0
				var_26_20.x = 0
				var_26_14.localEulerAngles = var_26_20
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 then
				var_26_14.localPosition = Vector3.New(0, 100, 0)

				local var_26_21 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_21.x, var_26_21.y, var_26_21.z)

				local var_26_22 = var_26_14.localEulerAngles

				var_26_22.z = 0
				var_26_22.x = 0
				var_26_14.localEulerAngles = var_26_22
			end

			local var_26_23 = arg_23_1.actors_["1011ui_story"].transform
			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.var_.moveOldPos1011ui_story = var_26_23.localPosition
			end

			local var_26_25 = 0.001

			if var_26_24 <= arg_23_1.time_ and arg_23_1.time_ < var_26_24 + var_26_25 then
				local var_26_26 = (arg_23_1.time_ - var_26_24) / var_26_25
				local var_26_27 = Vector3.New(0, 100, 0)

				var_26_23.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1011ui_story, var_26_27, var_26_26)

				local var_26_28 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_28.x, var_26_28.y, var_26_28.z)

				local var_26_29 = var_26_23.localEulerAngles

				var_26_29.z = 0
				var_26_29.x = 0
				var_26_23.localEulerAngles = var_26_29
			end

			if arg_23_1.time_ >= var_26_24 + var_26_25 and arg_23_1.time_ < var_26_24 + var_26_25 + arg_26_0 then
				var_26_23.localPosition = Vector3.New(0, 100, 0)

				local var_26_30 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_30.x, var_26_30.y, var_26_30.z)

				local var_26_31 = var_26_23.localEulerAngles

				var_26_31.z = 0
				var_26_31.x = 0
				var_26_23.localEulerAngles = var_26_31
			end

			local var_26_32 = arg_23_1.actors_["1019ui_story"].transform
			local var_26_33 = 0

			if var_26_33 < arg_23_1.time_ and arg_23_1.time_ <= var_26_33 + arg_26_0 then
				arg_23_1.var_.moveOldPos1019ui_story = var_26_32.localPosition
			end

			local var_26_34 = 0.001

			if var_26_33 <= arg_23_1.time_ and arg_23_1.time_ < var_26_33 + var_26_34 then
				local var_26_35 = (arg_23_1.time_ - var_26_33) / var_26_34
				local var_26_36 = Vector3.New(0, -1.08, -5.9)

				var_26_32.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1019ui_story, var_26_36, var_26_35)

				local var_26_37 = manager.ui.mainCamera.transform.position - var_26_32.position

				var_26_32.forward = Vector3.New(var_26_37.x, var_26_37.y, var_26_37.z)

				local var_26_38 = var_26_32.localEulerAngles

				var_26_38.z = 0
				var_26_38.x = 0
				var_26_32.localEulerAngles = var_26_38
			end

			if arg_23_1.time_ >= var_26_33 + var_26_34 and arg_23_1.time_ < var_26_33 + var_26_34 + arg_26_0 then
				var_26_32.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_26_39 = manager.ui.mainCamera.transform.position - var_26_32.position

				var_26_32.forward = Vector3.New(var_26_39.x, var_26_39.y, var_26_39.z)

				local var_26_40 = var_26_32.localEulerAngles

				var_26_40.z = 0
				var_26_40.x = 0
				var_26_32.localEulerAngles = var_26_40
			end

			local var_26_41 = 0

			if var_26_41 < arg_23_1.time_ and arg_23_1.time_ <= var_26_41 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_26_42 = 0

			if var_26_42 < arg_23_1.time_ and arg_23_1.time_ <= var_26_42 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_26_43 = 0
			local var_26_44 = 0.925

			if var_26_43 < arg_23_1.time_ and arg_23_1.time_ <= var_26_43 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_45 = arg_23_1:FormatText(StoryNameCfg[13].name)

				arg_23_1.leftNameTxt_.text = var_26_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_46 = arg_23_1:GetWordFromCfg(104041006)
				local var_26_47 = arg_23_1:FormatText(var_26_46.content)

				arg_23_1.text_.text = var_26_47

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_48 = 37
				local var_26_49 = utf8.len(var_26_47)
				local var_26_50 = var_26_48 <= 0 and var_26_44 or var_26_44 * (var_26_49 / var_26_48)

				if var_26_50 > 0 and var_26_44 < var_26_50 then
					arg_23_1.talkMaxDuration = var_26_50

					if var_26_50 + var_26_43 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_50 + var_26_43
					end
				end

				arg_23_1.text_.text = var_26_47
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041006", "story_v_out_104041.awb") ~= 0 then
					local var_26_51 = manager.audio:GetVoiceLength("story_v_out_104041", "104041006", "story_v_out_104041.awb") / 1000

					if var_26_51 + var_26_43 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_51 + var_26_43
					end

					if var_26_46.prefab_name ~= "" and arg_23_1.actors_[var_26_46.prefab_name] ~= nil then
						local var_26_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_46.prefab_name].transform, "story_v_out_104041", "104041006", "story_v_out_104041.awb")

						arg_23_1:RecordAudio("104041006", var_26_52)
						arg_23_1:RecordAudio("104041006", var_26_52)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_104041", "104041006", "story_v_out_104041.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_104041", "104041006", "story_v_out_104041.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_53 = math.max(var_26_44, arg_23_1.talkMaxDuration)

			if var_26_43 <= arg_23_1.time_ and arg_23_1.time_ < var_26_43 + var_26_53 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_43) / var_26_53

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_43 + var_26_53 and arg_23_1.time_ < var_26_43 + var_26_53 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play104041007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104041007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play104041008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1019ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1019ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_5
			end

			local var_30_6 = arg_27_1.actors_["1019ui_story"].transform
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 then
				arg_27_1.var_.moveOldPos1019ui_story = var_30_6.localPosition
			end

			local var_30_8 = 0.001

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8
				local var_30_10 = Vector3.New(0, 100, 0)

				var_30_6.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1019ui_story, var_30_10, var_30_9)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_6.position

				var_30_6.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_6.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_6.localEulerAngles = var_30_12
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 then
				var_30_6.localPosition = Vector3.New(0, 100, 0)

				local var_30_13 = manager.ui.mainCamera.transform.position - var_30_6.position

				var_30_6.forward = Vector3.New(var_30_13.x, var_30_13.y, var_30_13.z)

				local var_30_14 = var_30_6.localEulerAngles

				var_30_14.z = 0
				var_30_14.x = 0
				var_30_6.localEulerAngles = var_30_14
			end

			local var_30_15 = 0
			local var_30_16 = 1.3

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_17 = arg_27_1:GetWordFromCfg(104041007)
				local var_30_18 = arg_27_1:FormatText(var_30_17.content)

				arg_27_1.text_.text = var_30_18

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_19 = 52
				local var_30_20 = utf8.len(var_30_18)
				local var_30_21 = var_30_19 <= 0 and var_30_16 or var_30_16 * (var_30_20 / var_30_19)

				if var_30_21 > 0 and var_30_16 < var_30_21 then
					arg_27_1.talkMaxDuration = var_30_21

					if var_30_21 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_15
					end
				end

				arg_27_1.text_.text = var_30_18
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_22 = math.max(var_30_16, arg_27_1.talkMaxDuration)

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_22 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_15) / var_30_22

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_15 + var_30_22 and arg_27_1.time_ < var_30_15 + var_30_22 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play104041008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104041008
		arg_31_1.duration_ = 2.866

		local var_31_0 = {
			ja = 2.266,
			ko = 2.2,
			zh = 2.5,
			en = 2.866
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
				arg_31_0:Play104041009(arg_31_1)
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
					arg_31_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1036ui_story then
				arg_31_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1036ui_story"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos1036ui_story = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0, -1.09, -5.78)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1036ui_story, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action7_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_15 = 0
			local var_34_16 = 0.275

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[5].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(104041008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041008", "story_v_out_104041.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_out_104041", "104041008", "story_v_out_104041.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_out_104041", "104041008", "story_v_out_104041.awb")

						arg_31_1:RecordAudio("104041008", var_34_24)
						arg_31_1:RecordAudio("104041008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104041", "104041008", "story_v_out_104041.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104041", "104041008", "story_v_out_104041.awb")
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
	Play104041009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104041009
		arg_35_1.duration_ = 5.466

		local var_35_0 = {
			ja = 4.766,
			ko = 4.266,
			zh = 5.466,
			en = 4.733
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
				arg_35_0:Play104041010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1011ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1011ui_story == nil then
				arg_35_1.var_.characterEffect1011ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1011ui_story then
					arg_35_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1011ui_story then
				arg_35_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1036ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1036ui_story == nil then
				arg_35_1.var_.characterEffect1036ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1036ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1036ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1036ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1036ui_story.fillRatio = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["1036ui_story"].transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.moveOldPos1036ui_story = var_38_10.localPosition
			end

			local var_38_12 = 0.001

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12
				local var_38_14 = Vector3.New(0, 100, 0)

				var_38_10.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1036ui_story, var_38_14, var_38_13)

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

			local var_38_19 = arg_35_1.actors_["1011ui_story"].transform
			local var_38_20 = 0

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.var_.moveOldPos1011ui_story = var_38_19.localPosition
			end

			local var_38_21 = 0.001

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_21 then
				local var_38_22 = (arg_35_1.time_ - var_38_20) / var_38_21
				local var_38_23 = Vector3.New(0, -0.71, -6)

				var_38_19.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1011ui_story, var_38_23, var_38_22)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_19.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_19.localEulerAngles = var_38_25
			end

			if arg_35_1.time_ >= var_38_20 + var_38_21 and arg_35_1.time_ < var_38_20 + var_38_21 + arg_38_0 then
				var_38_19.localPosition = Vector3.New(0, -0.71, -6)

				local var_38_26 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_26.x, var_38_26.y, var_38_26.z)

				local var_38_27 = var_38_19.localEulerAngles

				var_38_27.z = 0
				var_38_27.x = 0
				var_38_19.localEulerAngles = var_38_27
			end

			local var_38_28 = 0

			if var_38_28 < arg_35_1.time_ and arg_35_1.time_ <= var_38_28 + arg_38_0 then
				arg_35_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 then
				arg_35_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_38_30 = 0
			local var_38_31 = 0.425

			if var_38_30 < arg_35_1.time_ and arg_35_1.time_ <= var_38_30 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_32 = arg_35_1:FormatText(StoryNameCfg[37].name)

				arg_35_1.leftNameTxt_.text = var_38_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_33 = arg_35_1:GetWordFromCfg(104041009)
				local var_38_34 = arg_35_1:FormatText(var_38_33.content)

				arg_35_1.text_.text = var_38_34

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_35 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041009", "story_v_out_104041.awb") ~= 0 then
					local var_38_38 = manager.audio:GetVoiceLength("story_v_out_104041", "104041009", "story_v_out_104041.awb") / 1000

					if var_38_38 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_38 + var_38_30
					end

					if var_38_33.prefab_name ~= "" and arg_35_1.actors_[var_38_33.prefab_name] ~= nil then
						local var_38_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_33.prefab_name].transform, "story_v_out_104041", "104041009", "story_v_out_104041.awb")

						arg_35_1:RecordAudio("104041009", var_38_39)
						arg_35_1:RecordAudio("104041009", var_38_39)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_104041", "104041009", "story_v_out_104041.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_104041", "104041009", "story_v_out_104041.awb")
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
	Play104041010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104041010
		arg_39_1.duration_ = 11.566

		local var_39_0 = {
			ja = 11.566,
			ko = 8.166,
			zh = 10.166,
			en = 10.166
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
				arg_39_0:Play104041011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_42_2 = 0
			local var_42_3 = 0.975

			if var_42_2 < arg_39_1.time_ and arg_39_1.time_ <= var_42_2 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_4 = arg_39_1:FormatText(StoryNameCfg[37].name)

				arg_39_1.leftNameTxt_.text = var_42_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_5 = arg_39_1:GetWordFromCfg(104041010)
				local var_42_6 = arg_39_1:FormatText(var_42_5.content)

				arg_39_1.text_.text = var_42_6

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_7 = 39
				local var_42_8 = utf8.len(var_42_6)
				local var_42_9 = var_42_7 <= 0 and var_42_3 or var_42_3 * (var_42_8 / var_42_7)

				if var_42_9 > 0 and var_42_3 < var_42_9 then
					arg_39_1.talkMaxDuration = var_42_9

					if var_42_9 + var_42_2 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_9 + var_42_2
					end
				end

				arg_39_1.text_.text = var_42_6
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041010", "story_v_out_104041.awb") ~= 0 then
					local var_42_10 = manager.audio:GetVoiceLength("story_v_out_104041", "104041010", "story_v_out_104041.awb") / 1000

					if var_42_10 + var_42_2 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_10 + var_42_2
					end

					if var_42_5.prefab_name ~= "" and arg_39_1.actors_[var_42_5.prefab_name] ~= nil then
						local var_42_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_5.prefab_name].transform, "story_v_out_104041", "104041010", "story_v_out_104041.awb")

						arg_39_1:RecordAudio("104041010", var_42_11)
						arg_39_1:RecordAudio("104041010", var_42_11)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_104041", "104041010", "story_v_out_104041.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_104041", "104041010", "story_v_out_104041.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_12 = math.max(var_42_3, arg_39_1.talkMaxDuration)

			if var_42_2 <= arg_39_1.time_ and arg_39_1.time_ < var_42_2 + var_42_12 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_2) / var_42_12

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_2 + var_42_12 and arg_39_1.time_ < var_42_2 + var_42_12 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play104041011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104041011
		arg_43_1.duration_ = 2.866

		local var_43_0 = {
			ja = 1.3,
			ko = 1.066,
			zh = 2.866,
			en = 1.4
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
			arg_43_1.auto_ = false
		end

		function arg_43_1.playNext_(arg_45_0)
			arg_43_1.onStoryFinished_()
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

			local var_46_4 = arg_43_1.actors_["1011ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect1011ui_story == nil then
				arg_43_1.var_.characterEffect1011ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1011ui_story then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1011ui_story.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1011ui_story then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1011ui_story.fillRatio = var_46_9
			end

			local var_46_10 = arg_43_1.actors_["1011ui_story"].transform
			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.var_.moveOldPos1011ui_story = var_46_10.localPosition
			end

			local var_46_12 = 0.001

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_11) / var_46_12
				local var_46_14 = Vector3.New(0, 100, 0)

				var_46_10.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1011ui_story, var_46_14, var_46_13)

				local var_46_15 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_15.x, var_46_15.y, var_46_15.z)

				local var_46_16 = var_46_10.localEulerAngles

				var_46_16.z = 0
				var_46_16.x = 0
				var_46_10.localEulerAngles = var_46_16
			end

			if arg_43_1.time_ >= var_46_11 + var_46_12 and arg_43_1.time_ < var_46_11 + var_46_12 + arg_46_0 then
				var_46_10.localPosition = Vector3.New(0, 100, 0)

				local var_46_17 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_17.x, var_46_17.y, var_46_17.z)

				local var_46_18 = var_46_10.localEulerAngles

				var_46_18.z = 0
				var_46_18.x = 0
				var_46_10.localEulerAngles = var_46_18
			end

			local var_46_19 = arg_43_1.actors_["1019ui_story"].transform
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.var_.moveOldPos1019ui_story = var_46_19.localPosition
			end

			local var_46_21 = 0.001

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / var_46_21
				local var_46_23 = Vector3.New(0, -1.08, -5.9)

				var_46_19.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1019ui_story, var_46_23, var_46_22)

				local var_46_24 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_24.x, var_46_24.y, var_46_24.z)

				local var_46_25 = var_46_19.localEulerAngles

				var_46_25.z = 0
				var_46_25.x = 0
				var_46_19.localEulerAngles = var_46_25
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 then
				var_46_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_46_26 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_26.x, var_46_26.y, var_46_26.z)

				local var_46_27 = var_46_19.localEulerAngles

				var_46_27.z = 0
				var_46_27.x = 0
				var_46_19.localEulerAngles = var_46_27
			end

			local var_46_28 = 0

			if var_46_28 < arg_43_1.time_ and arg_43_1.time_ <= var_46_28 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_46_29 = 0
			local var_46_30 = 0.05

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_31 = arg_43_1:FormatText(StoryNameCfg[13].name)

				arg_43_1.leftNameTxt_.text = var_46_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_32 = arg_43_1:GetWordFromCfg(104041011)
				local var_46_33 = arg_43_1:FormatText(var_46_32.content)

				arg_43_1.text_.text = var_46_33

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_34 = 2
				local var_46_35 = utf8.len(var_46_33)
				local var_46_36 = var_46_34 <= 0 and var_46_30 or var_46_30 * (var_46_35 / var_46_34)

				if var_46_36 > 0 and var_46_30 < var_46_36 then
					arg_43_1.talkMaxDuration = var_46_36

					if var_46_36 + var_46_29 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_36 + var_46_29
					end
				end

				arg_43_1.text_.text = var_46_33
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104041", "104041011", "story_v_out_104041.awb") ~= 0 then
					local var_46_37 = manager.audio:GetVoiceLength("story_v_out_104041", "104041011", "story_v_out_104041.awb") / 1000

					if var_46_37 + var_46_29 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_37 + var_46_29
					end

					if var_46_32.prefab_name ~= "" and arg_43_1.actors_[var_46_32.prefab_name] ~= nil then
						local var_46_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_32.prefab_name].transform, "story_v_out_104041", "104041011", "story_v_out_104041.awb")

						arg_43_1:RecordAudio("104041011", var_46_38)
						arg_43_1:RecordAudio("104041011", var_46_38)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_104041", "104041011", "story_v_out_104041.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_104041", "104041011", "story_v_out_104041.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_39 = math.max(var_46_30, arg_43_1.talkMaxDuration)

			if var_46_29 <= arg_43_1.time_ and arg_43_1.time_ < var_46_29 + var_46_39 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_29) / var_46_39

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_29 + var_46_39 and arg_43_1.time_ < var_46_29 + var_46_39 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B04b"
	},
	voices = {
		"story_v_out_104041.awb"
	}
}
