return {
	Play102111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 102111001
		arg_1_1.duration_ = 8.766

		local var_1_0 = {
			ja = 7.2,
			ko = 7.666,
			zh = 8.766,
			en = 7.666
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
				arg_1_0:Play102111002(arg_1_1)
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
			local var_4_13 = 2

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

			local var_4_16 = "B08b"

			if arg_1_1.bgs_[var_4_16] == nil then
				local var_4_17 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_17:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_16)
				var_4_17.name = var_4_16
				var_4_17.transform.parent = arg_1_1.stage_.transform
				var_4_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_16] = var_4_17
			end

			local var_4_18 = arg_1_1.bgs_.B08b
			local var_4_19 = 0

			if var_4_19 < arg_1_1.time_ and arg_1_1.time_ <= var_4_19 + arg_4_0 then
				local var_4_20 = var_4_18:GetComponent("SpriteRenderer")

				if var_4_20 then
					var_4_20.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_21 = var_4_20.material
					local var_4_22 = var_4_21:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB08b = var_4_22.a
					arg_1_1.var_.alphaMatValueB08b = var_4_21
				end

				arg_1_1.var_.alphaOldValueB08b = 0
			end

			local var_4_23 = 1.5

			if var_4_19 <= arg_1_1.time_ and arg_1_1.time_ < var_4_19 + var_4_23 then
				local var_4_24 = (arg_1_1.time_ - var_4_19) / var_4_23
				local var_4_25 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB08b, 1, var_4_24)

				if arg_1_1.var_.alphaMatValueB08b then
					local var_4_26 = arg_1_1.var_.alphaMatValueB08b
					local var_4_27 = var_4_26:GetColor("_Color")

					var_4_27.a = var_4_25

					var_4_26:SetColor("_Color", var_4_27)
				end
			end

			if arg_1_1.time_ >= var_4_19 + var_4_23 and arg_1_1.time_ < var_4_19 + var_4_23 + arg_4_0 and arg_1_1.var_.alphaMatValueB08b then
				local var_4_28 = arg_1_1.var_.alphaMatValueB08b
				local var_4_29 = var_4_28:GetColor("_Color")

				var_4_29.a = 1

				var_4_28:SetColor("_Color", var_4_29)
			end

			local var_4_30 = 0

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_31 = manager.ui.mainCamera.transform.localPosition
				local var_4_32 = Vector3.New(0, 0, 10) + Vector3.New(var_4_31.x, var_4_31.y, 0)
				local var_4_33 = arg_1_1.bgs_.B08b

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
					if iter_4_0 ~= "B08b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_44 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_45 = 1.79999995231628

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

			local var_4_53 = 1.79999995231628

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_4_54 = 0

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_55 = 2

			if arg_1_1.time_ >= var_4_54 + var_4_55 and arg_1_1.time_ < var_4_54 + var_4_55 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_56 = 0

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_57 = 2
			local var_4_58 = 0.675

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

				local var_4_61 = arg_1_1:GetWordFromCfg(102111001)
				local var_4_62 = arg_1_1:FormatText(var_4_61.content)

				arg_1_1.text_.text = var_4_62

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_63 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111001", "story_v_out_102111.awb") ~= 0 then
					local var_4_66 = manager.audio:GetVoiceLength("story_v_out_102111", "102111001", "story_v_out_102111.awb") / 1000

					if var_4_66 + var_4_57 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_66 + var_4_57
					end

					if var_4_61.prefab_name ~= "" and arg_1_1.actors_[var_4_61.prefab_name] ~= nil then
						local var_4_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_61.prefab_name].transform, "story_v_out_102111", "102111001", "story_v_out_102111.awb")

						arg_1_1:RecordAudio("102111001", var_4_67)
						arg_1_1:RecordAudio("102111001", var_4_67)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_102111", "102111001", "story_v_out_102111.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_102111", "102111001", "story_v_out_102111.awb")
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
	Play102111002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 102111002
		arg_7_1.duration_ = 2.8

		local var_7_0 = {
			ja = 2.6,
			ko = 2.5,
			zh = 2.8,
			en = 2.666
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
				arg_7_0:Play102111003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1011ui_story"

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

			local var_10_4 = arg_7_1.actors_["1011ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1011ui_story == nil then
				arg_7_1.var_.characterEffect1011ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1011ui_story then
					arg_7_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1011ui_story then
				arg_7_1.var_.characterEffect1011ui_story.fillFlat = false
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

			local var_10_14 = arg_7_1.actors_["1011ui_story"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos1011ui_story = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -0.71, -6)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1011ui_story, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_25 = 0
			local var_10_26 = 0.25

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[37].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(102111002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111002", "story_v_out_102111.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_102111", "102111002", "story_v_out_102111.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_102111", "102111002", "story_v_out_102111.awb")

						arg_7_1:RecordAudio("102111002", var_10_34)
						arg_7_1:RecordAudio("102111002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_102111", "102111002", "story_v_out_102111.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_102111", "102111002", "story_v_out_102111.awb")
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
	Play102111003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 102111003
		arg_11_1.duration_ = 5.833

		local var_11_0 = {
			ja = 5.433,
			ko = 5.066,
			zh = 4.4,
			en = 5.833
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
				arg_11_0:Play102111004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "3008ui_story"

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

			local var_14_4 = arg_11_1.actors_["3008ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect3008ui_story == nil then
				arg_11_1.var_.characterEffect3008ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect3008ui_story then
					arg_11_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect3008ui_story then
				arg_11_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_14_8 = arg_11_1.actors_["1011ui_story"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story == nil then
				arg_11_1.var_.characterEffect1011ui_story = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect1011ui_story then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1011ui_story.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1011ui_story.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["1011ui_story"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos1011ui_story = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0, 100, 0)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1011ui_story, var_14_18, var_14_17)

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

			local var_14_23 = arg_11_1.actors_["1084ui_story"].transform
			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.var_.moveOldPos1084ui_story = var_14_23.localPosition
			end

			local var_14_25 = 0.001

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_25 then
				local var_14_26 = (arg_11_1.time_ - var_14_24) / var_14_25
				local var_14_27 = Vector3.New(0, 100, 0)

				var_14_23.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1084ui_story, var_14_27, var_14_26)

				local var_14_28 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_28.x, var_14_28.y, var_14_28.z)

				local var_14_29 = var_14_23.localEulerAngles

				var_14_29.z = 0
				var_14_29.x = 0
				var_14_23.localEulerAngles = var_14_29
			end

			if arg_11_1.time_ >= var_14_24 + var_14_25 and arg_11_1.time_ < var_14_24 + var_14_25 + arg_14_0 then
				var_14_23.localPosition = Vector3.New(0, 100, 0)

				local var_14_30 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_30.x, var_14_30.y, var_14_30.z)

				local var_14_31 = var_14_23.localEulerAngles

				var_14_31.z = 0
				var_14_31.x = 0
				var_14_23.localEulerAngles = var_14_31
			end

			local var_14_32 = arg_11_1.actors_["3008ui_story"].transform
			local var_14_33 = 0

			if var_14_33 < arg_11_1.time_ and arg_11_1.time_ <= var_14_33 + arg_14_0 then
				arg_11_1.var_.moveOldPos3008ui_story = var_14_32.localPosition
			end

			local var_14_34 = 0.001

			if var_14_33 <= arg_11_1.time_ and arg_11_1.time_ < var_14_33 + var_14_34 then
				local var_14_35 = (arg_11_1.time_ - var_14_33) / var_14_34
				local var_14_36 = Vector3.New(0, -1.51, -4.3)

				var_14_32.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos3008ui_story, var_14_36, var_14_35)

				local var_14_37 = manager.ui.mainCamera.transform.position - var_14_32.position

				var_14_32.forward = Vector3.New(var_14_37.x, var_14_37.y, var_14_37.z)

				local var_14_38 = var_14_32.localEulerAngles

				var_14_38.z = 0
				var_14_38.x = 0
				var_14_32.localEulerAngles = var_14_38
			end

			if arg_11_1.time_ >= var_14_33 + var_14_34 and arg_11_1.time_ < var_14_33 + var_14_34 + arg_14_0 then
				var_14_32.localPosition = Vector3.New(0, -1.51, -4.3)

				local var_14_39 = manager.ui.mainCamera.transform.position - var_14_32.position

				var_14_32.forward = Vector3.New(var_14_39.x, var_14_39.y, var_14_39.z)

				local var_14_40 = var_14_32.localEulerAngles

				var_14_40.z = 0
				var_14_40.x = 0
				var_14_32.localEulerAngles = var_14_40
			end

			local var_14_41 = 0

			if var_14_41 < arg_11_1.time_ and arg_11_1.time_ <= var_14_41 + arg_14_0 then
				arg_11_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action1_1")
			end

			local var_14_42 = 0

			if var_14_42 < arg_11_1.time_ and arg_11_1.time_ <= var_14_42 + arg_14_0 then
				arg_11_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_14_43 = 0
			local var_14_44 = 0.45

			if var_14_43 < arg_11_1.time_ and arg_11_1.time_ <= var_14_43 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_45 = arg_11_1:FormatText(StoryNameCfg[20].name)

				arg_11_1.leftNameTxt_.text = var_14_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_46 = arg_11_1:GetWordFromCfg(102111003)
				local var_14_47 = arg_11_1:FormatText(var_14_46.content)

				arg_11_1.text_.text = var_14_47

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_48 = 18
				local var_14_49 = utf8.len(var_14_47)
				local var_14_50 = var_14_48 <= 0 and var_14_44 or var_14_44 * (var_14_49 / var_14_48)

				if var_14_50 > 0 and var_14_44 < var_14_50 then
					arg_11_1.talkMaxDuration = var_14_50

					if var_14_50 + var_14_43 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_50 + var_14_43
					end
				end

				arg_11_1.text_.text = var_14_47
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111003", "story_v_out_102111.awb") ~= 0 then
					local var_14_51 = manager.audio:GetVoiceLength("story_v_out_102111", "102111003", "story_v_out_102111.awb") / 1000

					if var_14_51 + var_14_43 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_51 + var_14_43
					end

					if var_14_46.prefab_name ~= "" and arg_11_1.actors_[var_14_46.prefab_name] ~= nil then
						local var_14_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_46.prefab_name].transform, "story_v_out_102111", "102111003", "story_v_out_102111.awb")

						arg_11_1:RecordAudio("102111003", var_14_52)
						arg_11_1:RecordAudio("102111003", var_14_52)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_102111", "102111003", "story_v_out_102111.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_102111", "102111003", "story_v_out_102111.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_53 = math.max(var_14_44, arg_11_1.talkMaxDuration)

			if var_14_43 <= arg_11_1.time_ and arg_11_1.time_ < var_14_43 + var_14_53 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_43) / var_14_53

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_43 + var_14_53 and arg_11_1.time_ < var_14_43 + var_14_53 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play102111004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 102111004
		arg_15_1.duration_ = 3.366

		local var_15_0 = {
			ja = 1.999999999999,
			ko = 3.366,
			zh = 2.266,
			en = 2.166
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
				arg_15_0:Play102111005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1084ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1084ui_story then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_4 = arg_15_1.actors_["3008ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos3008ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0, 100, 0)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos3008ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0, 100, 0)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_13.localPosition
			end

			local var_18_15 = 0.001

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15
				local var_18_17 = Vector3.New(0, -0.97, -6)

				var_18_13.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_17, var_18_16)

				local var_18_18 = manager.ui.mainCamera.transform.position - var_18_13.position

				var_18_13.forward = Vector3.New(var_18_18.x, var_18_18.y, var_18_18.z)

				local var_18_19 = var_18_13.localEulerAngles

				var_18_19.z = 0
				var_18_19.x = 0
				var_18_13.localEulerAngles = var_18_19
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 then
				var_18_13.localPosition = Vector3.New(0, -0.97, -6)

				local var_18_20 = manager.ui.mainCamera.transform.position - var_18_13.position

				var_18_13.forward = Vector3.New(var_18_20.x, var_18_20.y, var_18_20.z)

				local var_18_21 = var_18_13.localEulerAngles

				var_18_21.z = 0
				var_18_21.x = 0
				var_18_13.localEulerAngles = var_18_21
			end

			local var_18_22 = 0

			if var_18_22 < arg_15_1.time_ and arg_15_1.time_ <= var_18_22 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_24 = 0
			local var_18_25 = 0.175

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_26 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_27 = arg_15_1:GetWordFromCfg(102111004)
				local var_18_28 = arg_15_1:FormatText(var_18_27.content)

				arg_15_1.text_.text = var_18_28

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_29 = 7
				local var_18_30 = utf8.len(var_18_28)
				local var_18_31 = var_18_29 <= 0 and var_18_25 or var_18_25 * (var_18_30 / var_18_29)

				if var_18_31 > 0 and var_18_25 < var_18_31 then
					arg_15_1.talkMaxDuration = var_18_31

					if var_18_31 + var_18_24 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_31 + var_18_24
					end
				end

				arg_15_1.text_.text = var_18_28
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111004", "story_v_out_102111.awb") ~= 0 then
					local var_18_32 = manager.audio:GetVoiceLength("story_v_out_102111", "102111004", "story_v_out_102111.awb") / 1000

					if var_18_32 + var_18_24 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_32 + var_18_24
					end

					if var_18_27.prefab_name ~= "" and arg_15_1.actors_[var_18_27.prefab_name] ~= nil then
						local var_18_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_27.prefab_name].transform, "story_v_out_102111", "102111004", "story_v_out_102111.awb")

						arg_15_1:RecordAudio("102111004", var_18_33)
						arg_15_1:RecordAudio("102111004", var_18_33)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_102111", "102111004", "story_v_out_102111.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_102111", "102111004", "story_v_out_102111.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_34 = math.max(var_18_25, arg_15_1.talkMaxDuration)

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_34 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_24) / var_18_34

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_24 + var_18_34 and arg_15_1.time_ < var_18_24 + var_18_34 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play102111005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 102111005
		arg_19_1.duration_ = 4.7

		local var_19_0 = {
			ja = 4,
			ko = 3.7,
			zh = 3.8,
			en = 4.7
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
				arg_19_0:Play102111006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action459")
			end

			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_22_2 = 0
			local var_22_3 = 0.375

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_4 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_5 = arg_19_1:GetWordFromCfg(102111005)
				local var_22_6 = arg_19_1:FormatText(var_22_5.content)

				arg_19_1.text_.text = var_22_6

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_7 = 15
				local var_22_8 = utf8.len(var_22_6)
				local var_22_9 = var_22_7 <= 0 and var_22_3 or var_22_3 * (var_22_8 / var_22_7)

				if var_22_9 > 0 and var_22_3 < var_22_9 then
					arg_19_1.talkMaxDuration = var_22_9

					if var_22_9 + var_22_2 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_2
					end
				end

				arg_19_1.text_.text = var_22_6
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111005", "story_v_out_102111.awb") ~= 0 then
					local var_22_10 = manager.audio:GetVoiceLength("story_v_out_102111", "102111005", "story_v_out_102111.awb") / 1000

					if var_22_10 + var_22_2 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_10 + var_22_2
					end

					if var_22_5.prefab_name ~= "" and arg_19_1.actors_[var_22_5.prefab_name] ~= nil then
						local var_22_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_5.prefab_name].transform, "story_v_out_102111", "102111005", "story_v_out_102111.awb")

						arg_19_1:RecordAudio("102111005", var_22_11)
						arg_19_1:RecordAudio("102111005", var_22_11)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_102111", "102111005", "story_v_out_102111.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_102111", "102111005", "story_v_out_102111.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_12 = math.max(var_22_3, arg_19_1.talkMaxDuration)

			if var_22_2 <= arg_19_1.time_ and arg_19_1.time_ < var_22_2 + var_22_12 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_2) / var_22_12

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_2 + var_22_12 and arg_19_1.time_ < var_22_2 + var_22_12 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play102111006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 102111006
		arg_23_1.duration_ = 6.866

		local var_23_0 = {
			ja = 4.466,
			ko = 6.866,
			zh = 5.4,
			en = 4.533
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
				arg_23_0:Play102111007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["3008ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect3008ui_story == nil then
				arg_23_1.var_.characterEffect3008ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect3008ui_story then
					arg_23_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect3008ui_story then
				arg_23_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_26_4 = arg_23_1.actors_["1084ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_8 = Mathf.Lerp(0, 0.5, var_26_7)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_8
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_9 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_9
			end

			local var_26_10 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_11 = 0

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_10.localPosition
			end

			local var_26_12 = 0.001

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_12 then
				local var_26_13 = (arg_23_1.time_ - var_26_11) / var_26_12
				local var_26_14 = Vector3.New(0, 100, 0)

				var_26_10.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_14, var_26_13)

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

			local var_26_19 = arg_23_1.actors_["3008ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos3008ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(0, -1.51, -4.3)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos3008ui_story, var_26_23, var_26_22)

				local var_26_24 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_24.x, var_26_24.y, var_26_24.z)

				local var_26_25 = var_26_19.localEulerAngles

				var_26_25.z = 0
				var_26_25.x = 0
				var_26_19.localEulerAngles = var_26_25
			end

			if arg_23_1.time_ >= var_26_20 + var_26_21 and arg_23_1.time_ < var_26_20 + var_26_21 + arg_26_0 then
				var_26_19.localPosition = Vector3.New(0, -1.51, -4.3)

				local var_26_26 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_26.x, var_26_26.y, var_26_26.z)

				local var_26_27 = var_26_19.localEulerAngles

				var_26_27.z = 0
				var_26_27.x = 0
				var_26_19.localEulerAngles = var_26_27
			end

			local var_26_28 = 0

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action7_1")
			end

			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				arg_23_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_26_30 = 0
			local var_26_31 = 0.55

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_32 = arg_23_1:FormatText(StoryNameCfg[20].name)

				arg_23_1.leftNameTxt_.text = var_26_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_33 = arg_23_1:GetWordFromCfg(102111006)
				local var_26_34 = arg_23_1:FormatText(var_26_33.content)

				arg_23_1.text_.text = var_26_34

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_35 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111006", "story_v_out_102111.awb") ~= 0 then
					local var_26_38 = manager.audio:GetVoiceLength("story_v_out_102111", "102111006", "story_v_out_102111.awb") / 1000

					if var_26_38 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_38 + var_26_30
					end

					if var_26_33.prefab_name ~= "" and arg_23_1.actors_[var_26_33.prefab_name] ~= nil then
						local var_26_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_33.prefab_name].transform, "story_v_out_102111", "102111006", "story_v_out_102111.awb")

						arg_23_1:RecordAudio("102111006", var_26_39)
						arg_23_1:RecordAudio("102111006", var_26_39)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_102111", "102111006", "story_v_out_102111.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_102111", "102111006", "story_v_out_102111.awb")
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
	Play102111007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 102111007
		arg_27_1.duration_ = 7

		local var_27_0 = {
			ja = 6.6,
			ko = 4.233,
			zh = 5.4,
			en = 7
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
				arg_27_0:Play102111008(arg_27_1)
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

			local var_30_4 = arg_27_1.actors_["3008ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect3008ui_story == nil then
				arg_27_1.var_.characterEffect3008ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect3008ui_story then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_27_1.var_.characterEffect3008ui_story.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect3008ui_story then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_27_1.var_.characterEffect3008ui_story.fillRatio = var_30_9
			end

			local var_30_10 = arg_27_1.actors_["3008ui_story"].transform
			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.var_.moveOldPos3008ui_story = var_30_10.localPosition
			end

			local var_30_12 = 0.001

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_12 then
				local var_30_13 = (arg_27_1.time_ - var_30_11) / var_30_12
				local var_30_14 = Vector3.New(0, 100, 0)

				var_30_10.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos3008ui_story, var_30_14, var_30_13)

				local var_30_15 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_15.x, var_30_15.y, var_30_15.z)

				local var_30_16 = var_30_10.localEulerAngles

				var_30_16.z = 0
				var_30_16.x = 0
				var_30_10.localEulerAngles = var_30_16
			end

			if arg_27_1.time_ >= var_30_11 + var_30_12 and arg_27_1.time_ < var_30_11 + var_30_12 + arg_30_0 then
				var_30_10.localPosition = Vector3.New(0, 100, 0)

				local var_30_17 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_17.x, var_30_17.y, var_30_17.z)

				local var_30_18 = var_30_10.localEulerAngles

				var_30_18.z = 0
				var_30_18.x = 0
				var_30_10.localEulerAngles = var_30_18
			end

			local var_30_19 = 0

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_30_20 = arg_27_1.actors_["1011ui_story"].transform
			local var_30_21 = 0

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 then
				arg_27_1.var_.moveOldPos1011ui_story = var_30_20.localPosition
			end

			local var_30_22 = 0.001

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_21) / var_30_22
				local var_30_24 = Vector3.New(-0.7, -0.71, -6)

				var_30_20.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1011ui_story, var_30_24, var_30_23)

				local var_30_25 = manager.ui.mainCamera.transform.position - var_30_20.position

				var_30_20.forward = Vector3.New(var_30_25.x, var_30_25.y, var_30_25.z)

				local var_30_26 = var_30_20.localEulerAngles

				var_30_26.z = 0
				var_30_26.x = 0
				var_30_20.localEulerAngles = var_30_26
			end

			if arg_27_1.time_ >= var_30_21 + var_30_22 and arg_27_1.time_ < var_30_21 + var_30_22 + arg_30_0 then
				var_30_20.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_30_27 = manager.ui.mainCamera.transform.position - var_30_20.position

				var_30_20.forward = Vector3.New(var_30_27.x, var_30_27.y, var_30_27.z)

				local var_30_28 = var_30_20.localEulerAngles

				var_30_28.z = 0
				var_30_28.x = 0
				var_30_20.localEulerAngles = var_30_28
			end

			local var_30_29 = 0

			if var_30_29 < arg_27_1.time_ and arg_27_1.time_ <= var_30_29 + arg_30_0 then
				arg_27_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_30_30 = 0
			local var_30_31 = 0.575

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_32 = arg_27_1:FormatText(StoryNameCfg[37].name)

				arg_27_1.leftNameTxt_.text = var_30_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_33 = arg_27_1:GetWordFromCfg(102111007)
				local var_30_34 = arg_27_1:FormatText(var_30_33.content)

				arg_27_1.text_.text = var_30_34

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_35 = 23
				local var_30_36 = utf8.len(var_30_34)
				local var_30_37 = var_30_35 <= 0 and var_30_31 or var_30_31 * (var_30_36 / var_30_35)

				if var_30_37 > 0 and var_30_31 < var_30_37 then
					arg_27_1.talkMaxDuration = var_30_37

					if var_30_37 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_37 + var_30_30
					end
				end

				arg_27_1.text_.text = var_30_34
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111007", "story_v_out_102111.awb") ~= 0 then
					local var_30_38 = manager.audio:GetVoiceLength("story_v_out_102111", "102111007", "story_v_out_102111.awb") / 1000

					if var_30_38 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_38 + var_30_30
					end

					if var_30_33.prefab_name ~= "" and arg_27_1.actors_[var_30_33.prefab_name] ~= nil then
						local var_30_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_33.prefab_name].transform, "story_v_out_102111", "102111007", "story_v_out_102111.awb")

						arg_27_1:RecordAudio("102111007", var_30_39)
						arg_27_1:RecordAudio("102111007", var_30_39)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_102111", "102111007", "story_v_out_102111.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_102111", "102111007", "story_v_out_102111.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_40 = math.max(var_30_31, arg_27_1.talkMaxDuration)

			if var_30_30 <= arg_27_1.time_ and arg_27_1.time_ < var_30_30 + var_30_40 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_30) / var_30_40

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_30 + var_30_40 and arg_27_1.time_ < var_30_30 + var_30_40 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play102111008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 102111008
		arg_31_1.duration_ = 2.566

		local var_31_0 = {
			ja = 2.566,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_31_0:Play102111009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "1019ui_story"

			if arg_31_1.actors_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(Asset.Load("Char/" .. var_34_0), arg_31_1.stage_.transform)

				var_34_1.name = var_34_0
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_0] = var_34_1

				local var_34_2 = var_34_1:GetComponentInChildren(typeof(CharacterEffect))

				var_34_2.enabled = true

				local var_34_3 = GameObjectTools.GetOrAddComponent(var_34_1, typeof(DynamicBoneHelper))

				if var_34_3 then
					var_34_3:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_2.transform, false)

				arg_31_1.var_[var_34_0 .. "Animator"] = var_34_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_0 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_0 .. "LipSync"] = var_34_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_4 = arg_31_1.actors_["1019ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story == nil then
				arg_31_1.var_.characterEffect1019ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1019ui_story then
					arg_31_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story then
				arg_31_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_34_8 = arg_31_1.actors_["1011ui_story"]
			local var_34_9 = 0

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 and arg_31_1.var_.characterEffect1011ui_story == nil then
				arg_31_1.var_.characterEffect1011ui_story = var_34_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_10 = 0.1

			if var_34_9 <= arg_31_1.time_ and arg_31_1.time_ < var_34_9 + var_34_10 then
				local var_34_11 = (arg_31_1.time_ - var_34_9) / var_34_10

				if arg_31_1.var_.characterEffect1011ui_story then
					local var_34_12 = Mathf.Lerp(0, 0.5, var_34_11)

					arg_31_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1011ui_story.fillRatio = var_34_12
				end
			end

			if arg_31_1.time_ >= var_34_9 + var_34_10 and arg_31_1.time_ < var_34_9 + var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1011ui_story then
				local var_34_13 = 0.5

				arg_31_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1011ui_story.fillRatio = var_34_13
			end

			local var_34_14 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_15 = 0

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_14.localPosition
			end

			local var_34_16 = 0.001

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_16 then
				local var_34_17 = (arg_31_1.time_ - var_34_15) / var_34_16
				local var_34_18 = Vector3.New(0.7, -1.08, -5.9)

				var_34_14.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_18, var_34_17)

				local var_34_19 = manager.ui.mainCamera.transform.position - var_34_14.position

				var_34_14.forward = Vector3.New(var_34_19.x, var_34_19.y, var_34_19.z)

				local var_34_20 = var_34_14.localEulerAngles

				var_34_20.z = 0
				var_34_20.x = 0
				var_34_14.localEulerAngles = var_34_20
			end

			if arg_31_1.time_ >= var_34_15 + var_34_16 and arg_31_1.time_ < var_34_15 + var_34_16 + arg_34_0 then
				var_34_14.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_34_21 = manager.ui.mainCamera.transform.position - var_34_14.position

				var_34_14.forward = Vector3.New(var_34_21.x, var_34_21.y, var_34_21.z)

				local var_34_22 = var_34_14.localEulerAngles

				var_34_22.z = 0
				var_34_22.x = 0
				var_34_14.localEulerAngles = var_34_22
			end

			local var_34_23 = 0

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 then
				arg_31_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_34_24 = 0

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_25 = 0
			local var_34_26 = 0.175

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_27 = arg_31_1:FormatText(StoryNameCfg[13].name)

				arg_31_1.leftNameTxt_.text = var_34_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_28 = arg_31_1:GetWordFromCfg(102111008)
				local var_34_29 = arg_31_1:FormatText(var_34_28.content)

				arg_31_1.text_.text = var_34_29

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_30 = 7
				local var_34_31 = utf8.len(var_34_29)
				local var_34_32 = var_34_30 <= 0 and var_34_26 or var_34_26 * (var_34_31 / var_34_30)

				if var_34_32 > 0 and var_34_26 < var_34_32 then
					arg_31_1.talkMaxDuration = var_34_32

					if var_34_32 + var_34_25 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_32 + var_34_25
					end
				end

				arg_31_1.text_.text = var_34_29
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111008", "story_v_out_102111.awb") ~= 0 then
					local var_34_33 = manager.audio:GetVoiceLength("story_v_out_102111", "102111008", "story_v_out_102111.awb") / 1000

					if var_34_33 + var_34_25 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_33 + var_34_25
					end

					if var_34_28.prefab_name ~= "" and arg_31_1.actors_[var_34_28.prefab_name] ~= nil then
						local var_34_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_28.prefab_name].transform, "story_v_out_102111", "102111008", "story_v_out_102111.awb")

						arg_31_1:RecordAudio("102111008", var_34_34)
						arg_31_1:RecordAudio("102111008", var_34_34)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_102111", "102111008", "story_v_out_102111.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_102111", "102111008", "story_v_out_102111.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_35 = math.max(var_34_26, arg_31_1.talkMaxDuration)

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_35 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_25) / var_34_35

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_25 + var_34_35 and arg_31_1.time_ < var_34_25 + var_34_35 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play102111009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 102111009
		arg_35_1.duration_ = 3.066

		local var_35_0 = {
			ja = 3.066,
			ko = 2.4,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_35_0:Play102111010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1084ui_story then
					arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1019ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1019ui_story == nil then
				arg_35_1.var_.characterEffect1019ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1019ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1019ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1019ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1019ui_story.fillRatio = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["1019ui_story"].transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.moveOldPos1019ui_story = var_38_10.localPosition
			end

			local var_38_12 = 0.001

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12
				local var_38_14 = Vector3.New(0, 100, 0)

				var_38_10.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1019ui_story, var_38_14, var_38_13)

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
				local var_38_23 = Vector3.New(0, 100, 0)

				var_38_19.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1011ui_story, var_38_23, var_38_22)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_19.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_19.localEulerAngles = var_38_25
			end

			if arg_35_1.time_ >= var_38_20 + var_38_21 and arg_35_1.time_ < var_38_20 + var_38_21 + arg_38_0 then
				var_38_19.localPosition = Vector3.New(0, 100, 0)

				local var_38_26 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_26.x, var_38_26.y, var_38_26.z)

				local var_38_27 = var_38_19.localEulerAngles

				var_38_27.z = 0
				var_38_27.x = 0
				var_38_19.localEulerAngles = var_38_27
			end

			local var_38_28 = arg_35_1.actors_["1084ui_story"].transform
			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 then
				arg_35_1.var_.moveOldPos1084ui_story = var_38_28.localPosition
			end

			local var_38_30 = 0.001

			if var_38_29 <= arg_35_1.time_ and arg_35_1.time_ < var_38_29 + var_38_30 then
				local var_38_31 = (arg_35_1.time_ - var_38_29) / var_38_30
				local var_38_32 = Vector3.New(0, -0.97, -6)

				var_38_28.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1084ui_story, var_38_32, var_38_31)

				local var_38_33 = manager.ui.mainCamera.transform.position - var_38_28.position

				var_38_28.forward = Vector3.New(var_38_33.x, var_38_33.y, var_38_33.z)

				local var_38_34 = var_38_28.localEulerAngles

				var_38_34.z = 0
				var_38_34.x = 0
				var_38_28.localEulerAngles = var_38_34
			end

			if arg_35_1.time_ >= var_38_29 + var_38_30 and arg_35_1.time_ < var_38_29 + var_38_30 + arg_38_0 then
				var_38_28.localPosition = Vector3.New(0, -0.97, -6)

				local var_38_35 = manager.ui.mainCamera.transform.position - var_38_28.position

				var_38_28.forward = Vector3.New(var_38_35.x, var_38_35.y, var_38_35.z)

				local var_38_36 = var_38_28.localEulerAngles

				var_38_36.z = 0
				var_38_36.x = 0
				var_38_28.localEulerAngles = var_38_36
			end

			local var_38_37 = 0

			if var_38_37 < arg_35_1.time_ and arg_35_1.time_ <= var_38_37 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_38_38 = 0

			if var_38_38 < arg_35_1.time_ and arg_35_1.time_ <= var_38_38 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_38_39 = 0
			local var_38_40 = 0.175

			if var_38_39 < arg_35_1.time_ and arg_35_1.time_ <= var_38_39 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_41 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_42 = arg_35_1:GetWordFromCfg(102111009)
				local var_38_43 = arg_35_1:FormatText(var_38_42.content)

				arg_35_1.text_.text = var_38_43

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_44 = 7
				local var_38_45 = utf8.len(var_38_43)
				local var_38_46 = var_38_44 <= 0 and var_38_40 or var_38_40 * (var_38_45 / var_38_44)

				if var_38_46 > 0 and var_38_40 < var_38_46 then
					arg_35_1.talkMaxDuration = var_38_46

					if var_38_46 + var_38_39 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_46 + var_38_39
					end
				end

				arg_35_1.text_.text = var_38_43
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111009", "story_v_out_102111.awb") ~= 0 then
					local var_38_47 = manager.audio:GetVoiceLength("story_v_out_102111", "102111009", "story_v_out_102111.awb") / 1000

					if var_38_47 + var_38_39 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_47 + var_38_39
					end

					if var_38_42.prefab_name ~= "" and arg_35_1.actors_[var_38_42.prefab_name] ~= nil then
						local var_38_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_42.prefab_name].transform, "story_v_out_102111", "102111009", "story_v_out_102111.awb")

						arg_35_1:RecordAudio("102111009", var_38_48)
						arg_35_1:RecordAudio("102111009", var_38_48)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_102111", "102111009", "story_v_out_102111.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_102111", "102111009", "story_v_out_102111.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_49 = math.max(var_38_40, arg_35_1.talkMaxDuration)

			if var_38_39 <= arg_35_1.time_ and arg_35_1.time_ < var_38_39 + var_38_49 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_39) / var_38_49

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_39 + var_38_49 and arg_35_1.time_ < var_38_39 + var_38_49 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play102111010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 102111010
		arg_39_1.duration_ = 4.966

		local var_39_0 = {
			ja = 2.633,
			ko = 3.433,
			zh = 3.8,
			en = 4.966
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
				arg_39_0:Play102111011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1011ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1011ui_story == nil then
				arg_39_1.var_.characterEffect1011ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1011ui_story then
					arg_39_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1011ui_story then
				arg_39_1.var_.characterEffect1011ui_story.fillFlat = false
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

			local var_42_10 = arg_39_1.actors_["1084ui_story"].transform
			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.var_.moveOldPos1084ui_story = var_42_10.localPosition
			end

			local var_42_12 = 0.001

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_12 then
				local var_42_13 = (arg_39_1.time_ - var_42_11) / var_42_12
				local var_42_14 = Vector3.New(0, 100, 0)

				var_42_10.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1084ui_story, var_42_14, var_42_13)

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

			local var_42_19 = arg_39_1.actors_["1011ui_story"].transform
			local var_42_20 = 0

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1.var_.moveOldPos1011ui_story = var_42_19.localPosition
			end

			local var_42_21 = 0.001

			if var_42_20 <= arg_39_1.time_ and arg_39_1.time_ < var_42_20 + var_42_21 then
				local var_42_22 = (arg_39_1.time_ - var_42_20) / var_42_21
				local var_42_23 = Vector3.New(-0.7, -0.71, -6)

				var_42_19.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1011ui_story, var_42_23, var_42_22)

				local var_42_24 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_24.x, var_42_24.y, var_42_24.z)

				local var_42_25 = var_42_19.localEulerAngles

				var_42_25.z = 0
				var_42_25.x = 0
				var_42_19.localEulerAngles = var_42_25
			end

			if arg_39_1.time_ >= var_42_20 + var_42_21 and arg_39_1.time_ < var_42_20 + var_42_21 + arg_42_0 then
				var_42_19.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_42_26 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_26.x, var_42_26.y, var_42_26.z)

				local var_42_27 = var_42_19.localEulerAngles

				var_42_27.z = 0
				var_42_27.x = 0
				var_42_19.localEulerAngles = var_42_27
			end

			local var_42_28 = 0

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_42_29 = 0

			if var_42_29 < arg_39_1.time_ and arg_39_1.time_ <= var_42_29 + arg_42_0 then
				arg_39_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_42_30 = 0
			local var_42_31 = 0.55

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[37].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(102111010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111010", "story_v_out_102111.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_102111", "102111010", "story_v_out_102111.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_102111", "102111010", "story_v_out_102111.awb")

						arg_39_1:RecordAudio("102111010", var_42_39)
						arg_39_1:RecordAudio("102111010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_102111", "102111010", "story_v_out_102111.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_102111", "102111010", "story_v_out_102111.awb")
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
	Play102111011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 102111011
		arg_43_1.duration_ = 7.9

		local var_43_0 = {
			ja = 7.9,
			ko = 3.833,
			zh = 3.5,
			en = 3.633
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
				arg_43_0:Play102111012(arg_43_1)
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

			local var_46_10 = arg_43_1.actors_["1019ui_story"].transform
			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.var_.moveOldPos1019ui_story = var_46_10.localPosition
			end

			local var_46_12 = 0.001

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_11) / var_46_12
				local var_46_14 = Vector3.New(0.7, -1.08, -5.9)

				var_46_10.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1019ui_story, var_46_14, var_46_13)

				local var_46_15 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_15.x, var_46_15.y, var_46_15.z)

				local var_46_16 = var_46_10.localEulerAngles

				var_46_16.z = 0
				var_46_16.x = 0
				var_46_10.localEulerAngles = var_46_16
			end

			if arg_43_1.time_ >= var_46_11 + var_46_12 and arg_43_1.time_ < var_46_11 + var_46_12 + arg_46_0 then
				var_46_10.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_46_17 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_17.x, var_46_17.y, var_46_17.z)

				local var_46_18 = var_46_10.localEulerAngles

				var_46_18.z = 0
				var_46_18.x = 0
				var_46_10.localEulerAngles = var_46_18
			end

			local var_46_19 = 0

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_46_21 = 0
			local var_46_22 = 0.475

			if var_46_21 < arg_43_1.time_ and arg_43_1.time_ <= var_46_21 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_23 = arg_43_1:FormatText(StoryNameCfg[13].name)

				arg_43_1.leftNameTxt_.text = var_46_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_24 = arg_43_1:GetWordFromCfg(102111011)
				local var_46_25 = arg_43_1:FormatText(var_46_24.content)

				arg_43_1.text_.text = var_46_25

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_26 = 19
				local var_46_27 = utf8.len(var_46_25)
				local var_46_28 = var_46_26 <= 0 and var_46_22 or var_46_22 * (var_46_27 / var_46_26)

				if var_46_28 > 0 and var_46_22 < var_46_28 then
					arg_43_1.talkMaxDuration = var_46_28

					if var_46_28 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_28 + var_46_21
					end
				end

				arg_43_1.text_.text = var_46_25
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111011", "story_v_out_102111.awb") ~= 0 then
					local var_46_29 = manager.audio:GetVoiceLength("story_v_out_102111", "102111011", "story_v_out_102111.awb") / 1000

					if var_46_29 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_29 + var_46_21
					end

					if var_46_24.prefab_name ~= "" and arg_43_1.actors_[var_46_24.prefab_name] ~= nil then
						local var_46_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_24.prefab_name].transform, "story_v_out_102111", "102111011", "story_v_out_102111.awb")

						arg_43_1:RecordAudio("102111011", var_46_30)
						arg_43_1:RecordAudio("102111011", var_46_30)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_102111", "102111011", "story_v_out_102111.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_102111", "102111011", "story_v_out_102111.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_31 = math.max(var_46_22, arg_43_1.talkMaxDuration)

			if var_46_21 <= arg_43_1.time_ and arg_43_1.time_ < var_46_21 + var_46_31 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_21) / var_46_31

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_21 + var_46_31 and arg_43_1.time_ < var_46_21 + var_46_31 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play102111012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 102111012
		arg_47_1.duration_ = 7.466

		local var_47_0 = {
			ja = 7.466,
			ko = 3.533,
			zh = 3.166,
			en = 4.166
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
				arg_47_0:Play102111013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["3008ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect3008ui_story == nil then
				arg_47_1.var_.characterEffect3008ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect3008ui_story then
					arg_47_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect3008ui_story then
				arg_47_1.var_.characterEffect3008ui_story.fillFlat = false
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

			local var_50_10 = arg_47_1.actors_["1019ui_story"].transform
			local var_50_11 = 0

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1.var_.moveOldPos1019ui_story = var_50_10.localPosition
			end

			local var_50_12 = 0.001

			if var_50_11 <= arg_47_1.time_ and arg_47_1.time_ < var_50_11 + var_50_12 then
				local var_50_13 = (arg_47_1.time_ - var_50_11) / var_50_12
				local var_50_14 = Vector3.New(0, 100, 0)

				var_50_10.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1019ui_story, var_50_14, var_50_13)

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
				local var_50_23 = Vector3.New(0, 100, 0)

				var_50_19.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1011ui_story, var_50_23, var_50_22)

				local var_50_24 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_24.x, var_50_24.y, var_50_24.z)

				local var_50_25 = var_50_19.localEulerAngles

				var_50_25.z = 0
				var_50_25.x = 0
				var_50_19.localEulerAngles = var_50_25
			end

			if arg_47_1.time_ >= var_50_20 + var_50_21 and arg_47_1.time_ < var_50_20 + var_50_21 + arg_50_0 then
				var_50_19.localPosition = Vector3.New(0, 100, 0)

				local var_50_26 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_26.x, var_50_26.y, var_50_26.z)

				local var_50_27 = var_50_19.localEulerAngles

				var_50_27.z = 0
				var_50_27.x = 0
				var_50_19.localEulerAngles = var_50_27
			end

			local var_50_28 = arg_47_1.actors_["3008ui_story"].transform
			local var_50_29 = 0

			if var_50_29 < arg_47_1.time_ and arg_47_1.time_ <= var_50_29 + arg_50_0 then
				arg_47_1.var_.moveOldPos3008ui_story = var_50_28.localPosition
			end

			local var_50_30 = 0.001

			if var_50_29 <= arg_47_1.time_ and arg_47_1.time_ < var_50_29 + var_50_30 then
				local var_50_31 = (arg_47_1.time_ - var_50_29) / var_50_30
				local var_50_32 = Vector3.New(0, -1.51, -4.3)

				var_50_28.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos3008ui_story, var_50_32, var_50_31)

				local var_50_33 = manager.ui.mainCamera.transform.position - var_50_28.position

				var_50_28.forward = Vector3.New(var_50_33.x, var_50_33.y, var_50_33.z)

				local var_50_34 = var_50_28.localEulerAngles

				var_50_34.z = 0
				var_50_34.x = 0
				var_50_28.localEulerAngles = var_50_34
			end

			if arg_47_1.time_ >= var_50_29 + var_50_30 and arg_47_1.time_ < var_50_29 + var_50_30 + arg_50_0 then
				var_50_28.localPosition = Vector3.New(0, -1.51, -4.3)

				local var_50_35 = manager.ui.mainCamera.transform.position - var_50_28.position

				var_50_28.forward = Vector3.New(var_50_35.x, var_50_35.y, var_50_35.z)

				local var_50_36 = var_50_28.localEulerAngles

				var_50_36.z = 0
				var_50_36.x = 0
				var_50_28.localEulerAngles = var_50_36
			end

			local var_50_37 = 0

			if var_50_37 < arg_47_1.time_ and arg_47_1.time_ <= var_50_37 + arg_50_0 then
				arg_47_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action1_1")
			end

			local var_50_38 = 0

			if var_50_38 < arg_47_1.time_ and arg_47_1.time_ <= var_50_38 + arg_50_0 then
				arg_47_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_50_39 = 0
			local var_50_40 = 0.3

			if var_50_39 < arg_47_1.time_ and arg_47_1.time_ <= var_50_39 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_41 = arg_47_1:FormatText(StoryNameCfg[20].name)

				arg_47_1.leftNameTxt_.text = var_50_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_42 = arg_47_1:GetWordFromCfg(102111012)
				local var_50_43 = arg_47_1:FormatText(var_50_42.content)

				arg_47_1.text_.text = var_50_43

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_44 = 12
				local var_50_45 = utf8.len(var_50_43)
				local var_50_46 = var_50_44 <= 0 and var_50_40 or var_50_40 * (var_50_45 / var_50_44)

				if var_50_46 > 0 and var_50_40 < var_50_46 then
					arg_47_1.talkMaxDuration = var_50_46

					if var_50_46 + var_50_39 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_46 + var_50_39
					end
				end

				arg_47_1.text_.text = var_50_43
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111012", "story_v_out_102111.awb") ~= 0 then
					local var_50_47 = manager.audio:GetVoiceLength("story_v_out_102111", "102111012", "story_v_out_102111.awb") / 1000

					if var_50_47 + var_50_39 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_47 + var_50_39
					end

					if var_50_42.prefab_name ~= "" and arg_47_1.actors_[var_50_42.prefab_name] ~= nil then
						local var_50_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_42.prefab_name].transform, "story_v_out_102111", "102111012", "story_v_out_102111.awb")

						arg_47_1:RecordAudio("102111012", var_50_48)
						arg_47_1:RecordAudio("102111012", var_50_48)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_102111", "102111012", "story_v_out_102111.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_102111", "102111012", "story_v_out_102111.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_49 = math.max(var_50_40, arg_47_1.talkMaxDuration)

			if var_50_39 <= arg_47_1.time_ and arg_47_1.time_ < var_50_39 + var_50_49 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_39) / var_50_49

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_39 + var_50_49 and arg_47_1.time_ < var_50_39 + var_50_49 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play102111013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 102111013
		arg_51_1.duration_ = 4.533

		local var_51_0 = {
			ja = 4.533,
			ko = 3.566,
			zh = 3.4,
			en = 3.266
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
				arg_51_0:Play102111014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "2020_tpose"

			if arg_51_1.actors_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(Asset.Load("Char/" .. var_54_0), arg_51_1.stage_.transform)

				var_54_1.name = var_54_0
				var_54_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.actors_[var_54_0] = var_54_1

				local var_54_2 = var_54_1:GetComponentInChildren(typeof(CharacterEffect))

				var_54_2.enabled = true

				local var_54_3 = GameObjectTools.GetOrAddComponent(var_54_1, typeof(DynamicBoneHelper))

				if var_54_3 then
					var_54_3:EnableDynamicBone(false)
				end

				arg_51_1:ShowWeapon(var_54_2.transform, false)

				arg_51_1.var_[var_54_0 .. "Animator"] = var_54_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_51_1.var_[var_54_0 .. "Animator"].applyRootMotion = true
				arg_51_1.var_[var_54_0 .. "LipSync"] = var_54_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_54_4 = arg_51_1.actors_["2020_tpose"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect2020_tpose == nil then
				arg_51_1.var_.characterEffect2020_tpose = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect2020_tpose then
					arg_51_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect2020_tpose then
				arg_51_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_54_8 = arg_51_1.actors_["3008ui_story"]
			local var_54_9 = 0

			if var_54_9 < arg_51_1.time_ and arg_51_1.time_ <= var_54_9 + arg_54_0 and arg_51_1.var_.characterEffect3008ui_story == nil then
				arg_51_1.var_.characterEffect3008ui_story = var_54_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_10 = 0.1

			if var_54_9 <= arg_51_1.time_ and arg_51_1.time_ < var_54_9 + var_54_10 then
				local var_54_11 = (arg_51_1.time_ - var_54_9) / var_54_10

				if arg_51_1.var_.characterEffect3008ui_story then
					local var_54_12 = Mathf.Lerp(0, 0.5, var_54_11)

					arg_51_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_51_1.var_.characterEffect3008ui_story.fillRatio = var_54_12
				end
			end

			if arg_51_1.time_ >= var_54_9 + var_54_10 and arg_51_1.time_ < var_54_9 + var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect3008ui_story then
				local var_54_13 = 0.5

				arg_51_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_51_1.var_.characterEffect3008ui_story.fillRatio = var_54_13
			end

			local var_54_14 = arg_51_1.actors_["3008ui_story"].transform
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.var_.moveOldPos3008ui_story = var_54_14.localPosition
			end

			local var_54_16 = 0.001

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_16 then
				local var_54_17 = (arg_51_1.time_ - var_54_15) / var_54_16
				local var_54_18 = Vector3.New(0, 100, 0)

				var_54_14.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos3008ui_story, var_54_18, var_54_17)

				local var_54_19 = manager.ui.mainCamera.transform.position - var_54_14.position

				var_54_14.forward = Vector3.New(var_54_19.x, var_54_19.y, var_54_19.z)

				local var_54_20 = var_54_14.localEulerAngles

				var_54_20.z = 0
				var_54_20.x = 0
				var_54_14.localEulerAngles = var_54_20
			end

			if arg_51_1.time_ >= var_54_15 + var_54_16 and arg_51_1.time_ < var_54_15 + var_54_16 + arg_54_0 then
				var_54_14.localPosition = Vector3.New(0, 100, 0)

				local var_54_21 = manager.ui.mainCamera.transform.position - var_54_14.position

				var_54_14.forward = Vector3.New(var_54_21.x, var_54_21.y, var_54_21.z)

				local var_54_22 = var_54_14.localEulerAngles

				var_54_22.z = 0
				var_54_22.x = 0
				var_54_14.localEulerAngles = var_54_22
			end

			local var_54_23 = arg_51_1.actors_["2020_tpose"].transform
			local var_54_24 = 0

			if var_54_24 < arg_51_1.time_ and arg_51_1.time_ <= var_54_24 + arg_54_0 then
				arg_51_1.var_.moveOldPos2020_tpose = var_54_23.localPosition
			end

			local var_54_25 = 0.001

			if var_54_24 <= arg_51_1.time_ and arg_51_1.time_ < var_54_24 + var_54_25 then
				local var_54_26 = (arg_51_1.time_ - var_54_24) / var_54_25
				local var_54_27 = Vector3.New(-0.7, -1.2, -4.1)

				var_54_23.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos2020_tpose, var_54_27, var_54_26)

				local var_54_28 = manager.ui.mainCamera.transform.position - var_54_23.position

				var_54_23.forward = Vector3.New(var_54_28.x, var_54_28.y, var_54_28.z)

				local var_54_29 = var_54_23.localEulerAngles

				var_54_29.z = 0
				var_54_29.x = 0
				var_54_23.localEulerAngles = var_54_29
			end

			if arg_51_1.time_ >= var_54_24 + var_54_25 and arg_51_1.time_ < var_54_24 + var_54_25 + arg_54_0 then
				var_54_23.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_54_30 = manager.ui.mainCamera.transform.position - var_54_23.position

				var_54_23.forward = Vector3.New(var_54_30.x, var_54_30.y, var_54_30.z)

				local var_54_31 = var_54_23.localEulerAngles

				var_54_31.z = 0
				var_54_31.x = 0
				var_54_23.localEulerAngles = var_54_31
			end

			local var_54_32 = 0

			if var_54_32 < arg_51_1.time_ and arg_51_1.time_ <= var_54_32 + arg_54_0 then
				arg_51_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_54_33 = "2030_tpose"

			if arg_51_1.actors_[var_54_33] == nil then
				local var_54_34 = Object.Instantiate(Asset.Load("Char/" .. var_54_33), arg_51_1.stage_.transform)

				var_54_34.name = var_54_33
				var_54_34.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.actors_[var_54_33] = var_54_34

				local var_54_35 = var_54_34:GetComponentInChildren(typeof(CharacterEffect))

				var_54_35.enabled = true

				local var_54_36 = GameObjectTools.GetOrAddComponent(var_54_34, typeof(DynamicBoneHelper))

				if var_54_36 then
					var_54_36:EnableDynamicBone(false)
				end

				arg_51_1:ShowWeapon(var_54_35.transform, false)

				arg_51_1.var_[var_54_33 .. "Animator"] = var_54_35.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_51_1.var_[var_54_33 .. "Animator"].applyRootMotion = true
				arg_51_1.var_[var_54_33 .. "LipSync"] = var_54_35.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_54_37 = arg_51_1.actors_["2030_tpose"].transform
			local var_54_38 = 0

			if var_54_38 < arg_51_1.time_ and arg_51_1.time_ <= var_54_38 + arg_54_0 then
				arg_51_1.var_.moveOldPos2030_tpose = var_54_37.localPosition
			end

			local var_54_39 = 0.001

			if var_54_38 <= arg_51_1.time_ and arg_51_1.time_ < var_54_38 + var_54_39 then
				local var_54_40 = (arg_51_1.time_ - var_54_38) / var_54_39
				local var_54_41 = Vector3.New(0.7, -1.2, -4.2)

				var_54_37.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos2030_tpose, var_54_41, var_54_40)

				local var_54_42 = manager.ui.mainCamera.transform.position - var_54_37.position

				var_54_37.forward = Vector3.New(var_54_42.x, var_54_42.y, var_54_42.z)

				local var_54_43 = var_54_37.localEulerAngles

				var_54_43.z = 0
				var_54_43.x = 0
				var_54_37.localEulerAngles = var_54_43
			end

			if arg_51_1.time_ >= var_54_38 + var_54_39 and arg_51_1.time_ < var_54_38 + var_54_39 + arg_54_0 then
				var_54_37.localPosition = Vector3.New(0.7, -1.2, -4.2)

				local var_54_44 = manager.ui.mainCamera.transform.position - var_54_37.position

				var_54_37.forward = Vector3.New(var_54_44.x, var_54_44.y, var_54_44.z)

				local var_54_45 = var_54_37.localEulerAngles

				var_54_45.z = 0
				var_54_45.x = 0
				var_54_37.localEulerAngles = var_54_45
			end

			local var_54_46 = 0

			if var_54_46 < arg_51_1.time_ and arg_51_1.time_ <= var_54_46 + arg_54_0 then
				arg_51_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_54_47 = 0
			local var_54_48 = 0.325

			if var_54_47 < arg_51_1.time_ and arg_51_1.time_ <= var_54_47 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_49 = arg_51_1:FormatText(StoryNameCfg[19].name)

				arg_51_1.leftNameTxt_.text = var_54_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_50 = arg_51_1:GetWordFromCfg(102111013)
				local var_54_51 = arg_51_1:FormatText(var_54_50.content)

				arg_51_1.text_.text = var_54_51

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_52 = 13
				local var_54_53 = utf8.len(var_54_51)
				local var_54_54 = var_54_52 <= 0 and var_54_48 or var_54_48 * (var_54_53 / var_54_52)

				if var_54_54 > 0 and var_54_48 < var_54_54 then
					arg_51_1.talkMaxDuration = var_54_54

					if var_54_54 + var_54_47 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_54 + var_54_47
					end
				end

				arg_51_1.text_.text = var_54_51
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111013", "story_v_out_102111.awb") ~= 0 then
					local var_54_55 = manager.audio:GetVoiceLength("story_v_out_102111", "102111013", "story_v_out_102111.awb") / 1000

					if var_54_55 + var_54_47 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_55 + var_54_47
					end

					if var_54_50.prefab_name ~= "" and arg_51_1.actors_[var_54_50.prefab_name] ~= nil then
						local var_54_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_50.prefab_name].transform, "story_v_out_102111", "102111013", "story_v_out_102111.awb")

						arg_51_1:RecordAudio("102111013", var_54_56)
						arg_51_1:RecordAudio("102111013", var_54_56)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_102111", "102111013", "story_v_out_102111.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_102111", "102111013", "story_v_out_102111.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_57 = math.max(var_54_48, arg_51_1.talkMaxDuration)

			if var_54_47 <= arg_51_1.time_ and arg_51_1.time_ < var_54_47 + var_54_57 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_47) / var_54_57

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_47 + var_54_57 and arg_51_1.time_ < var_54_47 + var_54_57 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play102111014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 102111014
		arg_55_1.duration_ = 4.833

		local var_55_0 = {
			ja = 4.833,
			ko = 4.3,
			zh = 3.8,
			en = 3.633
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
				arg_55_0:Play102111015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["2020_tpose"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect2020_tpose == nil then
				arg_55_1.var_.characterEffect2020_tpose = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect2020_tpose then
					arg_55_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect2020_tpose then
				arg_55_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["2030_tpose"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect2030_tpose == nil then
				arg_55_1.var_.characterEffect2030_tpose = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect2030_tpose then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_55_1.var_.characterEffect2030_tpose.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect2030_tpose then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_55_1.var_.characterEffect2030_tpose.fillRatio = var_58_9
			end

			local var_58_10 = 0
			local var_58_11 = 0.5

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_12 = arg_55_1:FormatText(StoryNameCfg[33].name)

				arg_55_1.leftNameTxt_.text = var_58_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_13 = arg_55_1:GetWordFromCfg(102111014)
				local var_58_14 = arg_55_1:FormatText(var_58_13.content)

				arg_55_1.text_.text = var_58_14

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_15 = 20
				local var_58_16 = utf8.len(var_58_14)
				local var_58_17 = var_58_15 <= 0 and var_58_11 or var_58_11 * (var_58_16 / var_58_15)

				if var_58_17 > 0 and var_58_11 < var_58_17 then
					arg_55_1.talkMaxDuration = var_58_17

					if var_58_17 + var_58_10 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_17 + var_58_10
					end
				end

				arg_55_1.text_.text = var_58_14
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111014", "story_v_out_102111.awb") ~= 0 then
					local var_58_18 = manager.audio:GetVoiceLength("story_v_out_102111", "102111014", "story_v_out_102111.awb") / 1000

					if var_58_18 + var_58_10 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_18 + var_58_10
					end

					if var_58_13.prefab_name ~= "" and arg_55_1.actors_[var_58_13.prefab_name] ~= nil then
						local var_58_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_13.prefab_name].transform, "story_v_out_102111", "102111014", "story_v_out_102111.awb")

						arg_55_1:RecordAudio("102111014", var_58_19)
						arg_55_1:RecordAudio("102111014", var_58_19)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_102111", "102111014", "story_v_out_102111.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_102111", "102111014", "story_v_out_102111.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_20 = math.max(var_58_11, arg_55_1.talkMaxDuration)

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_20 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_10) / var_58_20

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_10 + var_58_20 and arg_55_1.time_ < var_58_10 + var_58_20 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play102111015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 102111015
		arg_59_1.duration_ = 5

		local var_59_0 = {
			ja = 5,
			ko = 3.733,
			zh = 3.033,
			en = 3.233
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
				arg_59_0:Play102111016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["2030_tpose"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect2030_tpose == nil then
				arg_59_1.var_.characterEffect2030_tpose = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect2030_tpose then
					arg_59_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect2030_tpose then
				arg_59_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["2020_tpose"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect2020_tpose == nil then
				arg_59_1.var_.characterEffect2020_tpose = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect2020_tpose then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_59_1.var_.characterEffect2020_tpose.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect2020_tpose then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_59_1.var_.characterEffect2020_tpose.fillRatio = var_62_9
			end

			local var_62_10 = 0
			local var_62_11 = 0.5

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_12 = arg_59_1:FormatText(StoryNameCfg[19].name)

				arg_59_1.leftNameTxt_.text = var_62_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_13 = arg_59_1:GetWordFromCfg(102111015)
				local var_62_14 = arg_59_1:FormatText(var_62_13.content)

				arg_59_1.text_.text = var_62_14

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_15 = 20
				local var_62_16 = utf8.len(var_62_14)
				local var_62_17 = var_62_15 <= 0 and var_62_11 or var_62_11 * (var_62_16 / var_62_15)

				if var_62_17 > 0 and var_62_11 < var_62_17 then
					arg_59_1.talkMaxDuration = var_62_17

					if var_62_17 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_17 + var_62_10
					end
				end

				arg_59_1.text_.text = var_62_14
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111015", "story_v_out_102111.awb") ~= 0 then
					local var_62_18 = manager.audio:GetVoiceLength("story_v_out_102111", "102111015", "story_v_out_102111.awb") / 1000

					if var_62_18 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_18 + var_62_10
					end

					if var_62_13.prefab_name ~= "" and arg_59_1.actors_[var_62_13.prefab_name] ~= nil then
						local var_62_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_13.prefab_name].transform, "story_v_out_102111", "102111015", "story_v_out_102111.awb")

						arg_59_1:RecordAudio("102111015", var_62_19)
						arg_59_1:RecordAudio("102111015", var_62_19)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_102111", "102111015", "story_v_out_102111.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_102111", "102111015", "story_v_out_102111.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_20 = math.max(var_62_11, arg_59_1.talkMaxDuration)

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_20 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_10) / var_62_20

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_10 + var_62_20 and arg_59_1.time_ < var_62_10 + var_62_20 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play102111016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 102111016
		arg_63_1.duration_ = 6.433

		local var_63_0 = {
			ja = 6.433,
			ko = 2.233,
			zh = 2.8,
			en = 2.533
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
				arg_63_0:Play102111017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1084ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1084ui_story then
					arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["2030_tpose"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect2030_tpose == nil then
				arg_63_1.var_.characterEffect2030_tpose = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect2030_tpose then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_63_1.var_.characterEffect2030_tpose.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect2030_tpose then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_63_1.var_.characterEffect2030_tpose.fillRatio = var_66_9
			end

			local var_66_10 = arg_63_1.actors_["2030_tpose"].transform
			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.var_.moveOldPos2030_tpose = var_66_10.localPosition
			end

			local var_66_12 = 0.001

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_12 then
				local var_66_13 = (arg_63_1.time_ - var_66_11) / var_66_12
				local var_66_14 = Vector3.New(0, 100, 0)

				var_66_10.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2030_tpose, var_66_14, var_66_13)

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

			local var_66_19 = arg_63_1.actors_["2020_tpose"].transform
			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1.var_.moveOldPos2020_tpose = var_66_19.localPosition
			end

			local var_66_21 = 0.001

			if var_66_20 <= arg_63_1.time_ and arg_63_1.time_ < var_66_20 + var_66_21 then
				local var_66_22 = (arg_63_1.time_ - var_66_20) / var_66_21
				local var_66_23 = Vector3.New(0, 100, 0)

				var_66_19.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2020_tpose, var_66_23, var_66_22)

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

			local var_66_28 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_29 = 0

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_28.localPosition
			end

			local var_66_30 = 0.001

			if var_66_29 <= arg_63_1.time_ and arg_63_1.time_ < var_66_29 + var_66_30 then
				local var_66_31 = (arg_63_1.time_ - var_66_29) / var_66_30
				local var_66_32 = Vector3.New(0, -0.97, -6)

				var_66_28.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_32, var_66_31)

				local var_66_33 = manager.ui.mainCamera.transform.position - var_66_28.position

				var_66_28.forward = Vector3.New(var_66_33.x, var_66_33.y, var_66_33.z)

				local var_66_34 = var_66_28.localEulerAngles

				var_66_34.z = 0
				var_66_34.x = 0
				var_66_28.localEulerAngles = var_66_34
			end

			if arg_63_1.time_ >= var_66_29 + var_66_30 and arg_63_1.time_ < var_66_29 + var_66_30 + arg_66_0 then
				var_66_28.localPosition = Vector3.New(0, -0.97, -6)

				local var_66_35 = manager.ui.mainCamera.transform.position - var_66_28.position

				var_66_28.forward = Vector3.New(var_66_35.x, var_66_35.y, var_66_35.z)

				local var_66_36 = var_66_28.localEulerAngles

				var_66_36.z = 0
				var_66_36.x = 0
				var_66_28.localEulerAngles = var_66_36
			end

			local var_66_37 = 0

			if var_66_37 < arg_63_1.time_ and arg_63_1.time_ <= var_66_37 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_66_38 = 0

			if var_66_38 < arg_63_1.time_ and arg_63_1.time_ <= var_66_38 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_66_39 = 0
			local var_66_40 = 0.25

			if var_66_39 < arg_63_1.time_ and arg_63_1.time_ <= var_66_39 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_41 = arg_63_1:FormatText(StoryNameCfg[6].name)

				arg_63_1.leftNameTxt_.text = var_66_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_42 = arg_63_1:GetWordFromCfg(102111016)
				local var_66_43 = arg_63_1:FormatText(var_66_42.content)

				arg_63_1.text_.text = var_66_43

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_44 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111016", "story_v_out_102111.awb") ~= 0 then
					local var_66_47 = manager.audio:GetVoiceLength("story_v_out_102111", "102111016", "story_v_out_102111.awb") / 1000

					if var_66_47 + var_66_39 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_47 + var_66_39
					end

					if var_66_42.prefab_name ~= "" and arg_63_1.actors_[var_66_42.prefab_name] ~= nil then
						local var_66_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_42.prefab_name].transform, "story_v_out_102111", "102111016", "story_v_out_102111.awb")

						arg_63_1:RecordAudio("102111016", var_66_48)
						arg_63_1:RecordAudio("102111016", var_66_48)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_102111", "102111016", "story_v_out_102111.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_102111", "102111016", "story_v_out_102111.awb")
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
	Play102111017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 102111017
		arg_67_1.duration_ = 2.266

		local var_67_0 = {
			ja = 2.266,
			ko = 1.433,
			zh = 2.033,
			en = 1.6
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
				arg_67_0:Play102111018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1084ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1084ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.2

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[41].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(102111017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111017", "story_v_out_102111.awb") ~= 0 then
					local var_70_14 = manager.audio:GetVoiceLength("story_v_out_102111", "102111017", "story_v_out_102111.awb") / 1000

					if var_70_14 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_14 + var_70_6
					end

					if var_70_9.prefab_name ~= "" and arg_67_1.actors_[var_70_9.prefab_name] ~= nil then
						local var_70_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_9.prefab_name].transform, "story_v_out_102111", "102111017", "story_v_out_102111.awb")

						arg_67_1:RecordAudio("102111017", var_70_15)
						arg_67_1:RecordAudio("102111017", var_70_15)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_102111", "102111017", "story_v_out_102111.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_102111", "102111017", "story_v_out_102111.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_16 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_16 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_16

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_16 and arg_67_1.time_ < var_70_6 + var_70_16 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play102111018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 102111018
		arg_71_1.duration_ = 2.8

		local var_71_0 = {
			ja = 2.8,
			ko = 1.866,
			zh = 1.7,
			en = 1.9
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
				arg_71_0:Play102111019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1084ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1084ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, 100, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1084ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, 100, 0)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = 0
			local var_74_10 = 0.2

			if var_74_9 < arg_71_1.time_ and arg_71_1.time_ <= var_74_9 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_11 = arg_71_1:FormatText(StoryNameCfg[13].name)

				arg_71_1.leftNameTxt_.text = var_74_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_12 = arg_71_1:GetWordFromCfg(102111018)
				local var_74_13 = arg_71_1:FormatText(var_74_12.content)

				arg_71_1.text_.text = var_74_13

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_14 = 8
				local var_74_15 = utf8.len(var_74_13)
				local var_74_16 = var_74_14 <= 0 and var_74_10 or var_74_10 * (var_74_15 / var_74_14)

				if var_74_16 > 0 and var_74_10 < var_74_16 then
					arg_71_1.talkMaxDuration = var_74_16

					if var_74_16 + var_74_9 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_16 + var_74_9
					end
				end

				arg_71_1.text_.text = var_74_13
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111018", "story_v_out_102111.awb") ~= 0 then
					local var_74_17 = manager.audio:GetVoiceLength("story_v_out_102111", "102111018", "story_v_out_102111.awb") / 1000

					if var_74_17 + var_74_9 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_17 + var_74_9
					end

					if var_74_12.prefab_name ~= "" and arg_71_1.actors_[var_74_12.prefab_name] ~= nil then
						local var_74_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_12.prefab_name].transform, "story_v_out_102111", "102111018", "story_v_out_102111.awb")

						arg_71_1:RecordAudio("102111018", var_74_18)
						arg_71_1:RecordAudio("102111018", var_74_18)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_102111", "102111018", "story_v_out_102111.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_102111", "102111018", "story_v_out_102111.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_19 = math.max(var_74_10, arg_71_1.talkMaxDuration)

			if var_74_9 <= arg_71_1.time_ and arg_71_1.time_ < var_74_9 + var_74_19 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_9) / var_74_19

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_9 + var_74_19 and arg_71_1.time_ < var_74_9 + var_74_19 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play102111019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 102111019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play102111020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				local var_78_2 = "play"
				local var_78_3 = "effect"

				arg_75_1:AudioAction(var_78_2, var_78_3, "se_story_2", "se_story_2_knives", "")
			end

			local var_78_4 = 0
			local var_78_5 = 0.15

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_6 = arg_75_1:GetWordFromCfg(102111019)
				local var_78_7 = arg_75_1:FormatText(var_78_6.content)

				arg_75_1.text_.text = var_78_7

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_8 = 6
				local var_78_9 = utf8.len(var_78_7)
				local var_78_10 = var_78_8 <= 0 and var_78_5 or var_78_5 * (var_78_9 / var_78_8)

				if var_78_10 > 0 and var_78_5 < var_78_10 then
					arg_75_1.talkMaxDuration = var_78_10

					if var_78_10 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_10 + var_78_4
					end
				end

				arg_75_1.text_.text = var_78_7
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_11 = math.max(var_78_5, arg_75_1.talkMaxDuration)

			if var_78_4 <= arg_75_1.time_ and arg_75_1.time_ < var_78_4 + var_78_11 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_4) / var_78_11

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_4 + var_78_11 and arg_75_1.time_ < var_78_4 + var_78_11 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play102111020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 102111020
		arg_79_1.duration_ = 2.466

		local var_79_0 = {
			ja = 2.233,
			ko = 2.266,
			zh = 2.166,
			en = 2.466
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
				arg_79_0:Play102111021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["1084ui_story"].transform
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.var_.moveOldPos1084ui_story = var_82_4.localPosition
			end

			local var_82_6 = 0.001

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6
				local var_82_8 = Vector3.New(0, -0.97, -6)

				var_82_4.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1084ui_story, var_82_8, var_82_7)

				local var_82_9 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_9.x, var_82_9.y, var_82_9.z)

				local var_82_10 = var_82_4.localEulerAngles

				var_82_10.z = 0
				var_82_10.x = 0
				var_82_4.localEulerAngles = var_82_10
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 then
				var_82_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_4.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_4.localEulerAngles = var_82_12
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_82_15 = 0
			local var_82_16 = 0.25

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_17 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_18 = arg_79_1:GetWordFromCfg(102111020)
				local var_82_19 = arg_79_1:FormatText(var_82_18.content)

				arg_79_1.text_.text = var_82_19

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_20 = 10
				local var_82_21 = utf8.len(var_82_19)
				local var_82_22 = var_82_20 <= 0 and var_82_16 or var_82_16 * (var_82_21 / var_82_20)

				if var_82_22 > 0 and var_82_16 < var_82_22 then
					arg_79_1.talkMaxDuration = var_82_22

					if var_82_22 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_19
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111020", "story_v_out_102111.awb") ~= 0 then
					local var_82_23 = manager.audio:GetVoiceLength("story_v_out_102111", "102111020", "story_v_out_102111.awb") / 1000

					if var_82_23 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_15
					end

					if var_82_18.prefab_name ~= "" and arg_79_1.actors_[var_82_18.prefab_name] ~= nil then
						local var_82_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_18.prefab_name].transform, "story_v_out_102111", "102111020", "story_v_out_102111.awb")

						arg_79_1:RecordAudio("102111020", var_82_24)
						arg_79_1:RecordAudio("102111020", var_82_24)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_102111", "102111020", "story_v_out_102111.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_102111", "102111020", "story_v_out_102111.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_25 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_25 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_25

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_25 and arg_79_1.time_ < var_82_15 + var_82_25 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play102111021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 102111021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play102111022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.1

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1084ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_6.localPosition
			end

			local var_86_8 = 0.001

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8
				local var_86_10 = Vector3.New(0, 100, 0)

				var_86_6.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_10, var_86_9)

				local var_86_11 = manager.ui.mainCamera.transform.position - var_86_6.position

				var_86_6.forward = Vector3.New(var_86_11.x, var_86_11.y, var_86_11.z)

				local var_86_12 = var_86_6.localEulerAngles

				var_86_12.z = 0
				var_86_12.x = 0
				var_86_6.localEulerAngles = var_86_12
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 then
				var_86_6.localPosition = Vector3.New(0, 100, 0)

				local var_86_13 = manager.ui.mainCamera.transform.position - var_86_6.position

				var_86_6.forward = Vector3.New(var_86_13.x, var_86_13.y, var_86_13.z)

				local var_86_14 = var_86_6.localEulerAngles

				var_86_14.z = 0
				var_86_14.x = 0
				var_86_6.localEulerAngles = var_86_14
			end

			local var_86_15 = 0
			local var_86_16 = 0.8

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_17 = arg_83_1:GetWordFromCfg(102111021)
				local var_86_18 = arg_83_1:FormatText(var_86_17.content)

				arg_83_1.text_.text = var_86_18

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_19 = 32
				local var_86_20 = utf8.len(var_86_18)
				local var_86_21 = var_86_19 <= 0 and var_86_16 or var_86_16 * (var_86_20 / var_86_19)

				if var_86_21 > 0 and var_86_16 < var_86_21 then
					arg_83_1.talkMaxDuration = var_86_21

					if var_86_21 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_18
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_22 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_22 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_22

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_22 and arg_83_1.time_ < var_86_15 + var_86_22 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play102111022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 102111022
		arg_87_1.duration_ = 10.1

		local var_87_0 = {
			ja = 10.1,
			ko = 6.933,
			zh = 8.666,
			en = 9
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
				arg_87_0:Play102111023(arg_87_1)
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

			local var_90_4 = 0

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_90_5 = arg_87_1.actors_["1019ui_story"].transform
			local var_90_6 = 0

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.var_.moveOldPos1019ui_story = var_90_5.localPosition
			end

			local var_90_7 = 0.001

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_7 then
				local var_90_8 = (arg_87_1.time_ - var_90_6) / var_90_7
				local var_90_9 = Vector3.New(0, -1.08, -5.9)

				var_90_5.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1019ui_story, var_90_9, var_90_8)

				local var_90_10 = manager.ui.mainCamera.transform.position - var_90_5.position

				var_90_5.forward = Vector3.New(var_90_10.x, var_90_10.y, var_90_10.z)

				local var_90_11 = var_90_5.localEulerAngles

				var_90_11.z = 0
				var_90_11.x = 0
				var_90_5.localEulerAngles = var_90_11
			end

			if arg_87_1.time_ >= var_90_6 + var_90_7 and arg_87_1.time_ < var_90_6 + var_90_7 + arg_90_0 then
				var_90_5.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_90_12 = manager.ui.mainCamera.transform.position - var_90_5.position

				var_90_5.forward = Vector3.New(var_90_12.x, var_90_12.y, var_90_12.z)

				local var_90_13 = var_90_5.localEulerAngles

				var_90_13.z = 0
				var_90_13.x = 0
				var_90_5.localEulerAngles = var_90_13
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_90_15 = 0
			local var_90_16 = 0.9

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_17 = arg_87_1:FormatText(StoryNameCfg[13].name)

				arg_87_1.leftNameTxt_.text = var_90_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_18 = arg_87_1:GetWordFromCfg(102111022)
				local var_90_19 = arg_87_1:FormatText(var_90_18.content)

				arg_87_1.text_.text = var_90_19

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_20 = 36
				local var_90_21 = utf8.len(var_90_19)
				local var_90_22 = var_90_20 <= 0 and var_90_16 or var_90_16 * (var_90_21 / var_90_20)

				if var_90_22 > 0 and var_90_16 < var_90_22 then
					arg_87_1.talkMaxDuration = var_90_22

					if var_90_22 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_22 + var_90_15
					end
				end

				arg_87_1.text_.text = var_90_19
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111022", "story_v_out_102111.awb") ~= 0 then
					local var_90_23 = manager.audio:GetVoiceLength("story_v_out_102111", "102111022", "story_v_out_102111.awb") / 1000

					if var_90_23 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_23 + var_90_15
					end

					if var_90_18.prefab_name ~= "" and arg_87_1.actors_[var_90_18.prefab_name] ~= nil then
						local var_90_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_18.prefab_name].transform, "story_v_out_102111", "102111022", "story_v_out_102111.awb")

						arg_87_1:RecordAudio("102111022", var_90_24)
						arg_87_1:RecordAudio("102111022", var_90_24)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_102111", "102111022", "story_v_out_102111.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_102111", "102111022", "story_v_out_102111.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_25 = math.max(var_90_16, arg_87_1.talkMaxDuration)

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_25 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_15) / var_90_25

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_15 + var_90_25 and arg_87_1.time_ < var_90_15 + var_90_25 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play102111023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 102111023
		arg_91_1.duration_ = 6.733

		local var_91_0 = {
			ja = 6.733,
			ko = 5.433,
			zh = 5.9,
			en = 4.533
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
				arg_91_0:Play102111024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["3008ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect3008ui_story == nil then
				arg_91_1.var_.characterEffect3008ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.1

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect3008ui_story then
					arg_91_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect3008ui_story then
				arg_91_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["1019ui_story"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect1019ui_story == nil then
				arg_91_1.var_.characterEffect1019ui_story = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.1

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect1019ui_story then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1019ui_story.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect1019ui_story then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1019ui_story.fillRatio = var_94_9
			end

			local var_94_10 = arg_91_1.actors_["1019ui_story"].transform
			local var_94_11 = 0

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.var_.moveOldPos1019ui_story = var_94_10.localPosition
			end

			local var_94_12 = 0.001

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_12 then
				local var_94_13 = (arg_91_1.time_ - var_94_11) / var_94_12
				local var_94_14 = Vector3.New(0, 100, 0)

				var_94_10.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1019ui_story, var_94_14, var_94_13)

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

			local var_94_19 = arg_91_1.actors_["3008ui_story"].transform
			local var_94_20 = 0

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.var_.moveOldPos3008ui_story = var_94_19.localPosition
			end

			local var_94_21 = 0.001

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_21 then
				local var_94_22 = (arg_91_1.time_ - var_94_20) / var_94_21
				local var_94_23 = Vector3.New(-0.7, -1.51, -4.3)

				var_94_19.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos3008ui_story, var_94_23, var_94_22)

				local var_94_24 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_24.x, var_94_24.y, var_94_24.z)

				local var_94_25 = var_94_19.localEulerAngles

				var_94_25.z = 0
				var_94_25.x = 0
				var_94_19.localEulerAngles = var_94_25
			end

			if arg_91_1.time_ >= var_94_20 + var_94_21 and arg_91_1.time_ < var_94_20 + var_94_21 + arg_94_0 then
				var_94_19.localPosition = Vector3.New(-0.7, -1.51, -4.3)

				local var_94_26 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_26.x, var_94_26.y, var_94_26.z)

				local var_94_27 = var_94_19.localEulerAngles

				var_94_27.z = 0
				var_94_27.x = 0
				var_94_19.localEulerAngles = var_94_27
			end

			local var_94_28 = 0

			if var_94_28 < arg_91_1.time_ and arg_91_1.time_ <= var_94_28 + arg_94_0 then
				arg_91_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action7_1")
			end

			local var_94_29 = 0

			if var_94_29 < arg_91_1.time_ and arg_91_1.time_ <= var_94_29 + arg_94_0 then
				arg_91_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_94_30 = 0
			local var_94_31 = 0.625

			if var_94_30 < arg_91_1.time_ and arg_91_1.time_ <= var_94_30 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_32 = arg_91_1:FormatText(StoryNameCfg[20].name)

				arg_91_1.leftNameTxt_.text = var_94_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_33 = arg_91_1:GetWordFromCfg(102111023)
				local var_94_34 = arg_91_1:FormatText(var_94_33.content)

				arg_91_1.text_.text = var_94_34

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_35 = 24
				local var_94_36 = utf8.len(var_94_34)
				local var_94_37 = var_94_35 <= 0 and var_94_31 or var_94_31 * (var_94_36 / var_94_35)

				if var_94_37 > 0 and var_94_31 < var_94_37 then
					arg_91_1.talkMaxDuration = var_94_37

					if var_94_37 + var_94_30 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_37 + var_94_30
					end
				end

				arg_91_1.text_.text = var_94_34
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111023", "story_v_out_102111.awb") ~= 0 then
					local var_94_38 = manager.audio:GetVoiceLength("story_v_out_102111", "102111023", "story_v_out_102111.awb") / 1000

					if var_94_38 + var_94_30 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_38 + var_94_30
					end

					if var_94_33.prefab_name ~= "" and arg_91_1.actors_[var_94_33.prefab_name] ~= nil then
						local var_94_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_33.prefab_name].transform, "story_v_out_102111", "102111023", "story_v_out_102111.awb")

						arg_91_1:RecordAudio("102111023", var_94_39)
						arg_91_1:RecordAudio("102111023", var_94_39)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_102111", "102111023", "story_v_out_102111.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_102111", "102111023", "story_v_out_102111.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_40 = math.max(var_94_31, arg_91_1.talkMaxDuration)

			if var_94_30 <= arg_91_1.time_ and arg_91_1.time_ < var_94_30 + var_94_40 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_30) / var_94_40

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_30 + var_94_40 and arg_91_1.time_ < var_94_30 + var_94_40 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play102111024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 102111024
		arg_95_1.duration_ = 6.566

		local var_95_0 = {
			ja = 6.566,
			ko = 4.3,
			zh = 5.433,
			en = 5.066
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
				arg_95_0:Play102111025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = "3009ui_story"

			if arg_95_1.actors_[var_98_0] == nil then
				local var_98_1 = Object.Instantiate(Asset.Load("Char/" .. var_98_0), arg_95_1.stage_.transform)

				var_98_1.name = var_98_0
				var_98_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_95_1.actors_[var_98_0] = var_98_1

				local var_98_2 = var_98_1:GetComponentInChildren(typeof(CharacterEffect))

				var_98_2.enabled = true

				local var_98_3 = GameObjectTools.GetOrAddComponent(var_98_1, typeof(DynamicBoneHelper))

				if var_98_3 then
					var_98_3:EnableDynamicBone(false)
				end

				arg_95_1:ShowWeapon(var_98_2.transform, false)

				arg_95_1.var_[var_98_0 .. "Animator"] = var_98_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_95_1.var_[var_98_0 .. "Animator"].applyRootMotion = true
				arg_95_1.var_[var_98_0 .. "LipSync"] = var_98_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_98_4 = arg_95_1.actors_["3009ui_story"]
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 and arg_95_1.var_.characterEffect3009ui_story == nil then
				arg_95_1.var_.characterEffect3009ui_story = var_98_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_6 = 0.1

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6

				if arg_95_1.var_.characterEffect3009ui_story then
					arg_95_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect3009ui_story then
				arg_95_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_98_8 = arg_95_1.actors_["3008ui_story"]
			local var_98_9 = 0

			if var_98_9 < arg_95_1.time_ and arg_95_1.time_ <= var_98_9 + arg_98_0 and arg_95_1.var_.characterEffect3008ui_story == nil then
				arg_95_1.var_.characterEffect3008ui_story = var_98_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_10 = 0.1

			if var_98_9 <= arg_95_1.time_ and arg_95_1.time_ < var_98_9 + var_98_10 then
				local var_98_11 = (arg_95_1.time_ - var_98_9) / var_98_10

				if arg_95_1.var_.characterEffect3008ui_story then
					local var_98_12 = Mathf.Lerp(0, 0.5, var_98_11)

					arg_95_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_95_1.var_.characterEffect3008ui_story.fillRatio = var_98_12
				end
			end

			if arg_95_1.time_ >= var_98_9 + var_98_10 and arg_95_1.time_ < var_98_9 + var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect3008ui_story then
				local var_98_13 = 0.5

				arg_95_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_95_1.var_.characterEffect3008ui_story.fillRatio = var_98_13
			end

			local var_98_14 = arg_95_1.actors_["3009ui_story"].transform
			local var_98_15 = 0

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1.var_.moveOldPos3009ui_story = var_98_14.localPosition

				local var_98_16 = "3009ui_story"

				arg_95_1:ShowWeapon(arg_95_1.var_[var_98_16 .. "Animator"].transform, true)
			end

			local var_98_17 = 0.001

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_15) / var_98_17
				local var_98_19 = Vector3.New(0.7, -1.75, -4.8)

				var_98_14.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos3009ui_story, var_98_19, var_98_18)

				local var_98_20 = manager.ui.mainCamera.transform.position - var_98_14.position

				var_98_14.forward = Vector3.New(var_98_20.x, var_98_20.y, var_98_20.z)

				local var_98_21 = var_98_14.localEulerAngles

				var_98_21.z = 0
				var_98_21.x = 0
				var_98_14.localEulerAngles = var_98_21
			end

			if arg_95_1.time_ >= var_98_15 + var_98_17 and arg_95_1.time_ < var_98_15 + var_98_17 + arg_98_0 then
				var_98_14.localPosition = Vector3.New(0.7, -1.75, -4.8)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_14.position

				var_98_14.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_14.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_14.localEulerAngles = var_98_23
			end

			local var_98_24 = 0

			if var_98_24 < arg_95_1.time_ and arg_95_1.time_ <= var_98_24 + arg_98_0 then
				arg_95_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action2_1")
			end

			local var_98_25 = 0

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 then
				arg_95_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_98_26 = 0
			local var_98_27 = 0.675

			if var_98_26 < arg_95_1.time_ and arg_95_1.time_ <= var_98_26 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_28 = arg_95_1:FormatText(StoryNameCfg[43].name)

				arg_95_1.leftNameTxt_.text = var_98_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_29 = arg_95_1:GetWordFromCfg(102111024)
				local var_98_30 = arg_95_1:FormatText(var_98_29.content)

				arg_95_1.text_.text = var_98_30

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_31 = 27
				local var_98_32 = utf8.len(var_98_30)
				local var_98_33 = var_98_31 <= 0 and var_98_27 or var_98_27 * (var_98_32 / var_98_31)

				if var_98_33 > 0 and var_98_27 < var_98_33 then
					arg_95_1.talkMaxDuration = var_98_33

					if var_98_33 + var_98_26 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_33 + var_98_26
					end
				end

				arg_95_1.text_.text = var_98_30
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111024", "story_v_out_102111.awb") ~= 0 then
					local var_98_34 = manager.audio:GetVoiceLength("story_v_out_102111", "102111024", "story_v_out_102111.awb") / 1000

					if var_98_34 + var_98_26 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_34 + var_98_26
					end

					if var_98_29.prefab_name ~= "" and arg_95_1.actors_[var_98_29.prefab_name] ~= nil then
						local var_98_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_29.prefab_name].transform, "story_v_out_102111", "102111024", "story_v_out_102111.awb")

						arg_95_1:RecordAudio("102111024", var_98_35)
						arg_95_1:RecordAudio("102111024", var_98_35)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_102111", "102111024", "story_v_out_102111.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_102111", "102111024", "story_v_out_102111.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_36 = math.max(var_98_27, arg_95_1.talkMaxDuration)

			if var_98_26 <= arg_95_1.time_ and arg_95_1.time_ < var_98_26 + var_98_36 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_26) / var_98_36

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_26 + var_98_36 and arg_95_1.time_ < var_98_26 + var_98_36 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play102111025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 102111025
		arg_99_1.duration_ = 6.466

		local var_99_0 = {
			ja = 6.2,
			ko = 5.766,
			zh = 6.466,
			en = 5.866
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
				arg_99_0:Play102111026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["3008ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect3008ui_story == nil then
				arg_99_1.var_.characterEffect3008ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.1

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect3008ui_story then
					arg_99_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect3008ui_story then
				arg_99_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["3009ui_story"]
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 and arg_99_1.var_.characterEffect3009ui_story == nil then
				arg_99_1.var_.characterEffect3009ui_story = var_102_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_6 = 0.1

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6

				if arg_99_1.var_.characterEffect3009ui_story then
					local var_102_8 = Mathf.Lerp(0, 0.5, var_102_7)

					arg_99_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_99_1.var_.characterEffect3009ui_story.fillRatio = var_102_8
				end
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 and arg_99_1.var_.characterEffect3009ui_story then
				local var_102_9 = 0.5

				arg_99_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_99_1.var_.characterEffect3009ui_story.fillRatio = var_102_9
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action7_2")
			end

			local var_102_12 = 0
			local var_102_13 = 0.825

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[20].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(102111025)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 33
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111025", "story_v_out_102111.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_102111", "102111025", "story_v_out_102111.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_102111", "102111025", "story_v_out_102111.awb")

						arg_99_1:RecordAudio("102111025", var_102_21)
						arg_99_1:RecordAudio("102111025", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_102111", "102111025", "story_v_out_102111.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_102111", "102111025", "story_v_out_102111.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_22 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_22 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_22

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_22 and arg_99_1.time_ < var_102_12 + var_102_22 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play102111026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 102111026
		arg_103_1.duration_ = 4.533

		local var_103_0 = {
			ja = 4.4,
			ko = 4.166,
			zh = 4.533,
			en = 3.6
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
				arg_103_0:Play102111027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["3009ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect3009ui_story == nil then
				arg_103_1.var_.characterEffect3009ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.1

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect3009ui_story then
					arg_103_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect3009ui_story then
				arg_103_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["3008ui_story"]
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 and arg_103_1.var_.characterEffect3008ui_story == nil then
				arg_103_1.var_.characterEffect3008ui_story = var_106_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_6 = 0.1

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6

				if arg_103_1.var_.characterEffect3008ui_story then
					local var_106_8 = Mathf.Lerp(0, 0.5, var_106_7)

					arg_103_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_103_1.var_.characterEffect3008ui_story.fillRatio = var_106_8
				end
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 and arg_103_1.var_.characterEffect3008ui_story then
				local var_106_9 = 0.5

				arg_103_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_103_1.var_.characterEffect3008ui_story.fillRatio = var_106_9
			end

			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				arg_103_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_106_11 = 0
			local var_106_12 = 0.5

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_13 = arg_103_1:FormatText(StoryNameCfg[43].name)

				arg_103_1.leftNameTxt_.text = var_106_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_14 = arg_103_1:GetWordFromCfg(102111026)
				local var_106_15 = arg_103_1:FormatText(var_106_14.content)

				arg_103_1.text_.text = var_106_15

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_16 = 20
				local var_106_17 = utf8.len(var_106_15)
				local var_106_18 = var_106_16 <= 0 and var_106_12 or var_106_12 * (var_106_17 / var_106_16)

				if var_106_18 > 0 and var_106_12 < var_106_18 then
					arg_103_1.talkMaxDuration = var_106_18

					if var_106_18 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_18 + var_106_11
					end
				end

				arg_103_1.text_.text = var_106_15
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111026", "story_v_out_102111.awb") ~= 0 then
					local var_106_19 = manager.audio:GetVoiceLength("story_v_out_102111", "102111026", "story_v_out_102111.awb") / 1000

					if var_106_19 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_11
					end

					if var_106_14.prefab_name ~= "" and arg_103_1.actors_[var_106_14.prefab_name] ~= nil then
						local var_106_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_14.prefab_name].transform, "story_v_out_102111", "102111026", "story_v_out_102111.awb")

						arg_103_1:RecordAudio("102111026", var_106_20)
						arg_103_1:RecordAudio("102111026", var_106_20)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_102111", "102111026", "story_v_out_102111.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_102111", "102111026", "story_v_out_102111.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_21 = math.max(var_106_12, arg_103_1.talkMaxDuration)

			if var_106_11 <= arg_103_1.time_ and arg_103_1.time_ < var_106_11 + var_106_21 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_11) / var_106_21

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_11 + var_106_21 and arg_103_1.time_ < var_106_11 + var_106_21 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play102111027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 102111027
		arg_107_1.duration_ = 4.566

		local var_107_0 = {
			ja = 4.566,
			ko = 3.7,
			zh = 3.9,
			en = 3.3
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
				arg_107_0:Play102111028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["3008ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect3008ui_story == nil then
				arg_107_1.var_.characterEffect3008ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect3008ui_story then
					arg_107_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect3008ui_story then
				arg_107_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_110_4 = arg_107_1.actors_["3009ui_story"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect3009ui_story == nil then
				arg_107_1.var_.characterEffect3009ui_story = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.1

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect3009ui_story then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_107_1.var_.characterEffect3009ui_story.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect3009ui_story then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_107_1.var_.characterEffect3009ui_story.fillRatio = var_110_9
			end

			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_110_11 = 0

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action2_1")
			end

			local var_110_12 = 0
			local var_110_13 = 0.3

			if var_110_12 < arg_107_1.time_ and arg_107_1.time_ <= var_110_12 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_14 = arg_107_1:FormatText(StoryNameCfg[20].name)

				arg_107_1.leftNameTxt_.text = var_110_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_15 = arg_107_1:GetWordFromCfg(102111027)
				local var_110_16 = arg_107_1:FormatText(var_110_15.content)

				arg_107_1.text_.text = var_110_16

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_17 = 12
				local var_110_18 = utf8.len(var_110_16)
				local var_110_19 = var_110_17 <= 0 and var_110_13 or var_110_13 * (var_110_18 / var_110_17)

				if var_110_19 > 0 and var_110_13 < var_110_19 then
					arg_107_1.talkMaxDuration = var_110_19

					if var_110_19 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_12
					end
				end

				arg_107_1.text_.text = var_110_16
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111027", "story_v_out_102111.awb") ~= 0 then
					local var_110_20 = manager.audio:GetVoiceLength("story_v_out_102111", "102111027", "story_v_out_102111.awb") / 1000

					if var_110_20 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_20 + var_110_12
					end

					if var_110_15.prefab_name ~= "" and arg_107_1.actors_[var_110_15.prefab_name] ~= nil then
						local var_110_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_15.prefab_name].transform, "story_v_out_102111", "102111027", "story_v_out_102111.awb")

						arg_107_1:RecordAudio("102111027", var_110_21)
						arg_107_1:RecordAudio("102111027", var_110_21)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_102111", "102111027", "story_v_out_102111.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_102111", "102111027", "story_v_out_102111.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_22 = math.max(var_110_13, arg_107_1.talkMaxDuration)

			if var_110_12 <= arg_107_1.time_ and arg_107_1.time_ < var_110_12 + var_110_22 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_12) / var_110_22

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_12 + var_110_22 and arg_107_1.time_ < var_110_12 + var_110_22 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play102111028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 102111028
		arg_111_1.duration_ = 6.066

		local var_111_0 = {
			ja = 6.066,
			ko = 3.533,
			zh = 4.1,
			en = 3.433
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
				arg_111_0:Play102111029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["3009ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect3009ui_story == nil then
				arg_111_1.var_.characterEffect3009ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.1

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect3009ui_story then
					arg_111_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect3009ui_story then
				arg_111_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_114_4 = arg_111_1.actors_["3008ui_story"]
			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 and arg_111_1.var_.characterEffect3008ui_story == nil then
				arg_111_1.var_.characterEffect3008ui_story = var_114_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_6 = 0.1

			if var_114_5 <= arg_111_1.time_ and arg_111_1.time_ < var_114_5 + var_114_6 then
				local var_114_7 = (arg_111_1.time_ - var_114_5) / var_114_6

				if arg_111_1.var_.characterEffect3008ui_story then
					local var_114_8 = Mathf.Lerp(0, 0.5, var_114_7)

					arg_111_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_111_1.var_.characterEffect3008ui_story.fillRatio = var_114_8
				end
			end

			if arg_111_1.time_ >= var_114_5 + var_114_6 and arg_111_1.time_ < var_114_5 + var_114_6 + arg_114_0 and arg_111_1.var_.characterEffect3008ui_story then
				local var_114_9 = 0.5

				arg_111_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_111_1.var_.characterEffect3008ui_story.fillRatio = var_114_9
			end

			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_114_11 = 0
			local var_114_12 = 0.4

			if var_114_11 < arg_111_1.time_ and arg_111_1.time_ <= var_114_11 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_13 = arg_111_1:FormatText(StoryNameCfg[43].name)

				arg_111_1.leftNameTxt_.text = var_114_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_14 = arg_111_1:GetWordFromCfg(102111028)
				local var_114_15 = arg_111_1:FormatText(var_114_14.content)

				arg_111_1.text_.text = var_114_15

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_16 = 16
				local var_114_17 = utf8.len(var_114_15)
				local var_114_18 = var_114_16 <= 0 and var_114_12 or var_114_12 * (var_114_17 / var_114_16)

				if var_114_18 > 0 and var_114_12 < var_114_18 then
					arg_111_1.talkMaxDuration = var_114_18

					if var_114_18 + var_114_11 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_11
					end
				end

				arg_111_1.text_.text = var_114_15
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111028", "story_v_out_102111.awb") ~= 0 then
					local var_114_19 = manager.audio:GetVoiceLength("story_v_out_102111", "102111028", "story_v_out_102111.awb") / 1000

					if var_114_19 + var_114_11 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_19 + var_114_11
					end

					if var_114_14.prefab_name ~= "" and arg_111_1.actors_[var_114_14.prefab_name] ~= nil then
						local var_114_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_14.prefab_name].transform, "story_v_out_102111", "102111028", "story_v_out_102111.awb")

						arg_111_1:RecordAudio("102111028", var_114_20)
						arg_111_1:RecordAudio("102111028", var_114_20)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_102111", "102111028", "story_v_out_102111.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_102111", "102111028", "story_v_out_102111.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_21 = math.max(var_114_12, arg_111_1.talkMaxDuration)

			if var_114_11 <= arg_111_1.time_ and arg_111_1.time_ < var_114_11 + var_114_21 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_11) / var_114_21

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_11 + var_114_21 and arg_111_1.time_ < var_114_11 + var_114_21 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play102111029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 102111029
		arg_115_1.duration_ = 5.533

		local var_115_0 = {
			ja = 5.533,
			ko = 4.233,
			zh = 4.533,
			en = 3.6
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
				arg_115_0:Play102111030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1019ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1019ui_story == nil then
				arg_115_1.var_.characterEffect1019ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.1

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1019ui_story then
					arg_115_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1019ui_story then
				arg_115_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_118_4 = arg_115_1.actors_["3009ui_story"]
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 and arg_115_1.var_.characterEffect3009ui_story == nil then
				arg_115_1.var_.characterEffect3009ui_story = var_118_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_6 = 0.1

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6

				if arg_115_1.var_.characterEffect3009ui_story then
					local var_118_8 = Mathf.Lerp(0, 0.5, var_118_7)

					arg_115_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_115_1.var_.characterEffect3009ui_story.fillRatio = var_118_8
				end
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect3009ui_story then
				local var_118_9 = 0.5

				arg_115_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_115_1.var_.characterEffect3009ui_story.fillRatio = var_118_9
			end

			local var_118_10 = arg_115_1.actors_["3009ui_story"].transform
			local var_118_11 = 0

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1.var_.moveOldPos3009ui_story = var_118_10.localPosition
			end

			local var_118_12 = 0.001

			if var_118_11 <= arg_115_1.time_ and arg_115_1.time_ < var_118_11 + var_118_12 then
				local var_118_13 = (arg_115_1.time_ - var_118_11) / var_118_12
				local var_118_14 = Vector3.New(0, 100, 0)

				var_118_10.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos3009ui_story, var_118_14, var_118_13)

				local var_118_15 = manager.ui.mainCamera.transform.position - var_118_10.position

				var_118_10.forward = Vector3.New(var_118_15.x, var_118_15.y, var_118_15.z)

				local var_118_16 = var_118_10.localEulerAngles

				var_118_16.z = 0
				var_118_16.x = 0
				var_118_10.localEulerAngles = var_118_16
			end

			if arg_115_1.time_ >= var_118_11 + var_118_12 and arg_115_1.time_ < var_118_11 + var_118_12 + arg_118_0 then
				var_118_10.localPosition = Vector3.New(0, 100, 0)

				local var_118_17 = manager.ui.mainCamera.transform.position - var_118_10.position

				var_118_10.forward = Vector3.New(var_118_17.x, var_118_17.y, var_118_17.z)

				local var_118_18 = var_118_10.localEulerAngles

				var_118_18.z = 0
				var_118_18.x = 0
				var_118_10.localEulerAngles = var_118_18
			end

			local var_118_19 = 0

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_118_20 = arg_115_1.actors_["1019ui_story"].transform
			local var_118_21 = 0

			if var_118_21 < arg_115_1.time_ and arg_115_1.time_ <= var_118_21 + arg_118_0 then
				arg_115_1.var_.moveOldPos1019ui_story = var_118_20.localPosition
			end

			local var_118_22 = 0.001

			if var_118_21 <= arg_115_1.time_ and arg_115_1.time_ < var_118_21 + var_118_22 then
				local var_118_23 = (arg_115_1.time_ - var_118_21) / var_118_22
				local var_118_24 = Vector3.New(0, -1.08, -5.9)

				var_118_20.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1019ui_story, var_118_24, var_118_23)

				local var_118_25 = manager.ui.mainCamera.transform.position - var_118_20.position

				var_118_20.forward = Vector3.New(var_118_25.x, var_118_25.y, var_118_25.z)

				local var_118_26 = var_118_20.localEulerAngles

				var_118_26.z = 0
				var_118_26.x = 0
				var_118_20.localEulerAngles = var_118_26
			end

			if arg_115_1.time_ >= var_118_21 + var_118_22 and arg_115_1.time_ < var_118_21 + var_118_22 + arg_118_0 then
				var_118_20.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_118_27 = manager.ui.mainCamera.transform.position - var_118_20.position

				var_118_20.forward = Vector3.New(var_118_27.x, var_118_27.y, var_118_27.z)

				local var_118_28 = var_118_20.localEulerAngles

				var_118_28.z = 0
				var_118_28.x = 0
				var_118_20.localEulerAngles = var_118_28
			end

			local var_118_29 = 0

			if var_118_29 < arg_115_1.time_ and arg_115_1.time_ <= var_118_29 + arg_118_0 then
				arg_115_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_118_30 = arg_115_1.actors_["3008ui_story"].transform
			local var_118_31 = 0

			if var_118_31 < arg_115_1.time_ and arg_115_1.time_ <= var_118_31 + arg_118_0 then
				arg_115_1.var_.moveOldPos3008ui_story = var_118_30.localPosition
			end

			local var_118_32 = 0.001

			if var_118_31 <= arg_115_1.time_ and arg_115_1.time_ < var_118_31 + var_118_32 then
				local var_118_33 = (arg_115_1.time_ - var_118_31) / var_118_32
				local var_118_34 = Vector3.New(0, 100, 0)

				var_118_30.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos3008ui_story, var_118_34, var_118_33)

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

			local var_118_39 = 0
			local var_118_40 = 0.55

			if var_118_39 < arg_115_1.time_ and arg_115_1.time_ <= var_118_39 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_41 = arg_115_1:FormatText(StoryNameCfg[13].name)

				arg_115_1.leftNameTxt_.text = var_118_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_42 = arg_115_1:GetWordFromCfg(102111029)
				local var_118_43 = arg_115_1:FormatText(var_118_42.content)

				arg_115_1.text_.text = var_118_43

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_44 = 22
				local var_118_45 = utf8.len(var_118_43)
				local var_118_46 = var_118_44 <= 0 and var_118_40 or var_118_40 * (var_118_45 / var_118_44)

				if var_118_46 > 0 and var_118_40 < var_118_46 then
					arg_115_1.talkMaxDuration = var_118_46

					if var_118_46 + var_118_39 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_46 + var_118_39
					end
				end

				arg_115_1.text_.text = var_118_43
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111029", "story_v_out_102111.awb") ~= 0 then
					local var_118_47 = manager.audio:GetVoiceLength("story_v_out_102111", "102111029", "story_v_out_102111.awb") / 1000

					if var_118_47 + var_118_39 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_47 + var_118_39
					end

					if var_118_42.prefab_name ~= "" and arg_115_1.actors_[var_118_42.prefab_name] ~= nil then
						local var_118_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_42.prefab_name].transform, "story_v_out_102111", "102111029", "story_v_out_102111.awb")

						arg_115_1:RecordAudio("102111029", var_118_48)
						arg_115_1:RecordAudio("102111029", var_118_48)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_102111", "102111029", "story_v_out_102111.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_102111", "102111029", "story_v_out_102111.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_49 = math.max(var_118_40, arg_115_1.talkMaxDuration)

			if var_118_39 <= arg_115_1.time_ and arg_115_1.time_ < var_118_39 + var_118_49 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_39) / var_118_49

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_39 + var_118_49 and arg_115_1.time_ < var_118_39 + var_118_49 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play102111030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 102111030
		arg_119_1.duration_ = 3.866

		local var_119_0 = {
			ja = 3.866,
			ko = 2.733,
			zh = 3.4,
			en = 2.133
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
				arg_119_0:Play102111031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["3009ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect3009ui_story == nil then
				arg_119_1.var_.characterEffect3009ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.1

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect3009ui_story then
					arg_119_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect3009ui_story then
				arg_119_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_122_4 = arg_119_1.actors_["1019ui_story"]
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 and arg_119_1.var_.characterEffect1019ui_story == nil then
				arg_119_1.var_.characterEffect1019ui_story = var_122_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_6 = 0.1

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6

				if arg_119_1.var_.characterEffect1019ui_story then
					local var_122_8 = Mathf.Lerp(0, 0.5, var_122_7)

					arg_119_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1019ui_story.fillRatio = var_122_8
				end
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 and arg_119_1.var_.characterEffect1019ui_story then
				local var_122_9 = 0.5

				arg_119_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1019ui_story.fillRatio = var_122_9
			end

			local var_122_10 = arg_119_1.actors_["1019ui_story"].transform
			local var_122_11 = 0

			if var_122_11 < arg_119_1.time_ and arg_119_1.time_ <= var_122_11 + arg_122_0 then
				arg_119_1.var_.moveOldPos1019ui_story = var_122_10.localPosition
			end

			local var_122_12 = 0.001

			if var_122_11 <= arg_119_1.time_ and arg_119_1.time_ < var_122_11 + var_122_12 then
				local var_122_13 = (arg_119_1.time_ - var_122_11) / var_122_12
				local var_122_14 = Vector3.New(0, 100, 0)

				var_122_10.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1019ui_story, var_122_14, var_122_13)

				local var_122_15 = manager.ui.mainCamera.transform.position - var_122_10.position

				var_122_10.forward = Vector3.New(var_122_15.x, var_122_15.y, var_122_15.z)

				local var_122_16 = var_122_10.localEulerAngles

				var_122_16.z = 0
				var_122_16.x = 0
				var_122_10.localEulerAngles = var_122_16
			end

			if arg_119_1.time_ >= var_122_11 + var_122_12 and arg_119_1.time_ < var_122_11 + var_122_12 + arg_122_0 then
				var_122_10.localPosition = Vector3.New(0, 100, 0)

				local var_122_17 = manager.ui.mainCamera.transform.position - var_122_10.position

				var_122_10.forward = Vector3.New(var_122_17.x, var_122_17.y, var_122_17.z)

				local var_122_18 = var_122_10.localEulerAngles

				var_122_18.z = 0
				var_122_18.x = 0
				var_122_10.localEulerAngles = var_122_18
			end

			local var_122_19 = arg_119_1.actors_["3009ui_story"].transform
			local var_122_20 = 0

			if var_122_20 < arg_119_1.time_ and arg_119_1.time_ <= var_122_20 + arg_122_0 then
				arg_119_1.var_.moveOldPos3009ui_story = var_122_19.localPosition

				local var_122_21 = "3009ui_story"

				arg_119_1:ShowWeapon(arg_119_1.var_[var_122_21 .. "Animator"].transform, true)
			end

			local var_122_22 = 0.001

			if var_122_20 <= arg_119_1.time_ and arg_119_1.time_ < var_122_20 + var_122_22 then
				local var_122_23 = (arg_119_1.time_ - var_122_20) / var_122_22
				local var_122_24 = Vector3.New(0, -1.75, -4.8)

				var_122_19.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos3009ui_story, var_122_24, var_122_23)

				local var_122_25 = manager.ui.mainCamera.transform.position - var_122_19.position

				var_122_19.forward = Vector3.New(var_122_25.x, var_122_25.y, var_122_25.z)

				local var_122_26 = var_122_19.localEulerAngles

				var_122_26.z = 0
				var_122_26.x = 0
				var_122_19.localEulerAngles = var_122_26
			end

			if arg_119_1.time_ >= var_122_20 + var_122_22 and arg_119_1.time_ < var_122_20 + var_122_22 + arg_122_0 then
				var_122_19.localPosition = Vector3.New(0, -1.75, -4.8)

				local var_122_27 = manager.ui.mainCamera.transform.position - var_122_19.position

				var_122_19.forward = Vector3.New(var_122_27.x, var_122_27.y, var_122_27.z)

				local var_122_28 = var_122_19.localEulerAngles

				var_122_28.z = 0
				var_122_28.x = 0
				var_122_19.localEulerAngles = var_122_28
			end

			local var_122_29 = 0

			if var_122_29 < arg_119_1.time_ and arg_119_1.time_ <= var_122_29 + arg_122_0 then
				arg_119_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_122_30 = 0
			local var_122_31 = 0.225

			if var_122_30 < arg_119_1.time_ and arg_119_1.time_ <= var_122_30 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_32 = arg_119_1:FormatText(StoryNameCfg[43].name)

				arg_119_1.leftNameTxt_.text = var_122_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_33 = arg_119_1:GetWordFromCfg(102111030)
				local var_122_34 = arg_119_1:FormatText(var_122_33.content)

				arg_119_1.text_.text = var_122_34

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_35 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111030", "story_v_out_102111.awb") ~= 0 then
					local var_122_38 = manager.audio:GetVoiceLength("story_v_out_102111", "102111030", "story_v_out_102111.awb") / 1000

					if var_122_38 + var_122_30 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_38 + var_122_30
					end

					if var_122_33.prefab_name ~= "" and arg_119_1.actors_[var_122_33.prefab_name] ~= nil then
						local var_122_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_33.prefab_name].transform, "story_v_out_102111", "102111030", "story_v_out_102111.awb")

						arg_119_1:RecordAudio("102111030", var_122_39)
						arg_119_1:RecordAudio("102111030", var_122_39)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_102111", "102111030", "story_v_out_102111.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_102111", "102111030", "story_v_out_102111.awb")
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
	Play102111031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 102111031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play102111032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["3009ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect3009ui_story == nil then
				arg_123_1.var_.characterEffect3009ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.1

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect3009ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_123_1.var_.characterEffect3009ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect3009ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_123_1.var_.characterEffect3009ui_story.fillRatio = var_126_5
			end

			local var_126_6 = arg_123_1.actors_["3009ui_story"].transform
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 then
				arg_123_1.var_.moveOldPos3009ui_story = var_126_6.localPosition
			end

			local var_126_8 = 0.001

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8
				local var_126_10 = Vector3.New(0, 100, 0)

				var_126_6.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos3009ui_story, var_126_10, var_126_9)

				local var_126_11 = manager.ui.mainCamera.transform.position - var_126_6.position

				var_126_6.forward = Vector3.New(var_126_11.x, var_126_11.y, var_126_11.z)

				local var_126_12 = var_126_6.localEulerAngles

				var_126_12.z = 0
				var_126_12.x = 0
				var_126_6.localEulerAngles = var_126_12
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 then
				var_126_6.localPosition = Vector3.New(0, 100, 0)

				local var_126_13 = manager.ui.mainCamera.transform.position - var_126_6.position

				var_126_6.forward = Vector3.New(var_126_13.x, var_126_13.y, var_126_13.z)

				local var_126_14 = var_126_6.localEulerAngles

				var_126_14.z = 0
				var_126_14.x = 0
				var_126_6.localEulerAngles = var_126_14
			end

			local var_126_15 = 0

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_126_16 = 0
			local var_126_17 = 0.775

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(102111031)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 31
				local var_126_21 = utf8.len(var_126_19)
				local var_126_22 = var_126_20 <= 0 and var_126_17 or var_126_17 * (var_126_21 / var_126_20)

				if var_126_22 > 0 and var_126_17 < var_126_22 then
					arg_123_1.talkMaxDuration = var_126_22

					if var_126_22 + var_126_16 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_22 + var_126_16
					end
				end

				arg_123_1.text_.text = var_126_19
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_23 = math.max(var_126_17, arg_123_1.talkMaxDuration)

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_23 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_16) / var_126_23

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_16 + var_126_23 and arg_123_1.time_ < var_126_16 + var_126_23 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play102111032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 102111032
		arg_127_1.duration_ = 6.466

		local var_127_0 = {
			ja = 6.466,
			ko = 2.866,
			zh = 5.666,
			en = 5.533
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
			arg_127_1.auto_ = false
		end

		function arg_127_1.playNext_(arg_129_0)
			arg_127_1.onStoryFinished_()
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1019ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1019ui_story == nil then
				arg_127_1.var_.characterEffect1019ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.1

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1019ui_story then
					arg_127_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1019ui_story then
				arg_127_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_130_4 = arg_127_1.actors_["1019ui_story"].transform
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 then
				arg_127_1.var_.moveOldPos1019ui_story = var_130_4.localPosition
			end

			local var_130_6 = 0.001

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6
				local var_130_8 = Vector3.New(0, -1.08, -5.9)

				var_130_4.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1019ui_story, var_130_8, var_130_7)

				local var_130_9 = manager.ui.mainCamera.transform.position - var_130_4.position

				var_130_4.forward = Vector3.New(var_130_9.x, var_130_9.y, var_130_9.z)

				local var_130_10 = var_130_4.localEulerAngles

				var_130_10.z = 0
				var_130_10.x = 0
				var_130_4.localEulerAngles = var_130_10
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 then
				var_130_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_130_11 = manager.ui.mainCamera.transform.position - var_130_4.position

				var_130_4.forward = Vector3.New(var_130_11.x, var_130_11.y, var_130_11.z)

				local var_130_12 = var_130_4.localEulerAngles

				var_130_12.z = 0
				var_130_12.x = 0
				var_130_4.localEulerAngles = var_130_12
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_130_14 = 0
			local var_130_15 = 0.5

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_16 = arg_127_1:FormatText(StoryNameCfg[13].name)

				arg_127_1.leftNameTxt_.text = var_130_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_17 = arg_127_1:GetWordFromCfg(102111032)
				local var_130_18 = arg_127_1:FormatText(var_130_17.content)

				arg_127_1.text_.text = var_130_18

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_19 = 20
				local var_130_20 = utf8.len(var_130_18)
				local var_130_21 = var_130_19 <= 0 and var_130_15 or var_130_15 * (var_130_20 / var_130_19)

				if var_130_21 > 0 and var_130_15 < var_130_21 then
					arg_127_1.talkMaxDuration = var_130_21

					if var_130_21 + var_130_14 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_21 + var_130_14
					end
				end

				arg_127_1.text_.text = var_130_18
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102111", "102111032", "story_v_out_102111.awb") ~= 0 then
					local var_130_22 = manager.audio:GetVoiceLength("story_v_out_102111", "102111032", "story_v_out_102111.awb") / 1000

					if var_130_22 + var_130_14 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_22 + var_130_14
					end

					if var_130_17.prefab_name ~= "" and arg_127_1.actors_[var_130_17.prefab_name] ~= nil then
						local var_130_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_17.prefab_name].transform, "story_v_out_102111", "102111032", "story_v_out_102111.awb")

						arg_127_1:RecordAudio("102111032", var_130_23)
						arg_127_1:RecordAudio("102111032", var_130_23)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_102111", "102111032", "story_v_out_102111.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_102111", "102111032", "story_v_out_102111.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_24 = math.max(var_130_15, arg_127_1.talkMaxDuration)

			if var_130_14 <= arg_127_1.time_ and arg_127_1.time_ < var_130_14 + var_130_24 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_14) / var_130_24

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_14 + var_130_24 and arg_127_1.time_ < var_130_14 + var_130_24 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B08b"
	},
	voices = {
		"story_v_out_102111.awb"
	}
}
