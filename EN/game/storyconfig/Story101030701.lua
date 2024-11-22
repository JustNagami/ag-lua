return {
	Play103071001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 103071001
		arg_1_1.duration_ = 5.566

		local var_1_0 = {
			ja = 5.1,
			ko = 4.8,
			zh = 4.566,
			en = 5.566
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
				arg_1_0:Play103071002(arg_1_1)
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

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_4_8 = 0
			local var_4_9 = 1

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				local var_4_10 = "play"
				local var_4_11 = "effect"

				arg_1_1:AudioAction(var_4_10, var_4_11, "se_story", "se_story_machinegun", "")
			end

			local var_4_12 = "1148ui_story"

			if arg_1_1.actors_[var_4_12] == nil then
				local var_4_13 = Object.Instantiate(Asset.Load("Char/" .. var_4_12), arg_1_1.stage_.transform)

				var_4_13.name = var_4_12
				var_4_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_12] = var_4_13

				local var_4_14 = var_4_13:GetComponentInChildren(typeof(CharacterEffect))

				var_4_14.enabled = true

				local var_4_15 = GameObjectTools.GetOrAddComponent(var_4_13, typeof(DynamicBoneHelper))

				if var_4_15 then
					var_4_15:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_14.transform, false)

				arg_1_1.var_[var_4_12 .. "Animator"] = var_4_14.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_12 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_12 .. "LipSync"] = var_4_14.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_16 = arg_1_1.actors_["1148ui_story"]
			local var_4_17 = 2

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 and arg_1_1.var_.characterEffect1148ui_story == nil then
				arg_1_1.var_.characterEffect1148ui_story = var_4_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_18 = 0.1

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_18 then
				local var_4_19 = (arg_1_1.time_ - var_4_17) / var_4_18

				if arg_1_1.var_.characterEffect1148ui_story then
					arg_1_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_18 and arg_1_1.time_ < var_4_17 + var_4_18 + arg_4_0 and arg_1_1.var_.characterEffect1148ui_story then
				arg_1_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_4_20 = "B06b"

			if arg_1_1.bgs_[var_4_20] == nil then
				local var_4_21 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_21:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_20)
				var_4_21.name = var_4_20
				var_4_21.transform.parent = arg_1_1.stage_.transform
				var_4_21.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_20] = var_4_21
			end

			local var_4_22 = arg_1_1.bgs_.B06b
			local var_4_23 = 0

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				local var_4_24 = var_4_22:GetComponent("SpriteRenderer")

				if var_4_24 then
					var_4_24.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_25 = var_4_24.material
					local var_4_26 = var_4_25:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB06b = var_4_26.a
					arg_1_1.var_.alphaMatValueB06b = var_4_25
				end

				arg_1_1.var_.alphaOldValueB06b = 0
			end

			local var_4_27 = 1.5

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_27 then
				local var_4_28 = (arg_1_1.time_ - var_4_23) / var_4_27
				local var_4_29 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB06b, 1, var_4_28)

				if arg_1_1.var_.alphaMatValueB06b then
					local var_4_30 = arg_1_1.var_.alphaMatValueB06b
					local var_4_31 = var_4_30:GetColor("_Color")

					var_4_31.a = var_4_29

					var_4_30:SetColor("_Color", var_4_31)
				end
			end

			if arg_1_1.time_ >= var_4_23 + var_4_27 and arg_1_1.time_ < var_4_23 + var_4_27 + arg_4_0 and arg_1_1.var_.alphaMatValueB06b then
				local var_4_32 = arg_1_1.var_.alphaMatValueB06b
				local var_4_33 = var_4_32:GetColor("_Color")

				var_4_33.a = 1

				var_4_32:SetColor("_Color", var_4_33)
			end

			local var_4_34 = 0

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_35 = manager.ui.mainCamera.transform.localPosition
				local var_4_36 = Vector3.New(0, 0, 10) + Vector3.New(var_4_35.x, var_4_35.y, 0)
				local var_4_37 = arg_1_1.bgs_.B06b

				var_4_37.transform.localPosition = var_4_36
				var_4_37.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_38 = var_4_37:GetComponent("SpriteRenderer")

				if var_4_38 and var_4_38.sprite then
					local var_4_39 = (var_4_37.transform.localPosition - var_4_35).z
					local var_4_40 = manager.ui.mainCameraCom_
					local var_4_41 = 2 * var_4_39 * Mathf.Tan(var_4_40.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_42 = var_4_41 * var_4_40.aspect
					local var_4_43 = var_4_38.sprite.bounds.size.x
					local var_4_44 = var_4_38.sprite.bounds.size.y
					local var_4_45 = var_4_42 / var_4_43
					local var_4_46 = var_4_41 / var_4_44
					local var_4_47 = var_4_46 < var_4_45 and var_4_45 or var_4_46

					var_4_37.transform.localScale = Vector3.New(var_4_47, var_4_47, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B06b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_48 = arg_1_1.actors_["1148ui_story"].transform
			local var_4_49 = 1

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.var_.moveOldPos1148ui_story = var_4_48.localPosition
			end

			local var_4_50 = 0.001

			if var_4_49 <= arg_1_1.time_ and arg_1_1.time_ < var_4_49 + var_4_50 then
				local var_4_51 = (arg_1_1.time_ - var_4_49) / var_4_50
				local var_4_52 = Vector3.New(0, -0.8, -6.2)

				var_4_48.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1148ui_story, var_4_52, var_4_51)

				local var_4_53 = manager.ui.mainCamera.transform.position - var_4_48.position

				var_4_48.forward = Vector3.New(var_4_53.x, var_4_53.y, var_4_53.z)

				local var_4_54 = var_4_48.localEulerAngles

				var_4_54.z = 0
				var_4_54.x = 0
				var_4_48.localEulerAngles = var_4_54
			end

			if arg_1_1.time_ >= var_4_49 + var_4_50 and arg_1_1.time_ < var_4_49 + var_4_50 + arg_4_0 then
				var_4_48.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_4_55 = manager.ui.mainCamera.transform.position - var_4_48.position

				var_4_48.forward = Vector3.New(var_4_55.x, var_4_55.y, var_4_55.z)

				local var_4_56 = var_4_48.localEulerAngles

				var_4_56.z = 0
				var_4_56.x = 0
				var_4_48.localEulerAngles = var_4_56
			end

			local var_4_57 = 1

			if var_4_57 < arg_1_1.time_ and arg_1_1.time_ <= var_4_57 + arg_4_0 then
				arg_1_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action3_1")
			end

			local var_4_58 = 0

			if var_4_58 < arg_1_1.time_ and arg_1_1.time_ <= var_4_58 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_59 = 2

			if arg_1_1.time_ >= var_4_58 + var_4_59 and arg_1_1.time_ < var_4_58 + var_4_59 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_60 = 0

			if var_4_60 < arg_1_1.time_ and arg_1_1.time_ <= var_4_60 + arg_4_0 then
				arg_1_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_61 = 2
			local var_4_62 = 0.3

			if var_4_61 < arg_1_1.time_ and arg_1_1.time_ <= var_4_61 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_63 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_63:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_64 = arg_1_1:FormatText(StoryNameCfg[8].name)

				arg_1_1.leftNameTxt_.text = var_4_64

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_65 = arg_1_1:GetWordFromCfg(103071001)
				local var_4_66 = arg_1_1:FormatText(var_4_65.content)

				arg_1_1.text_.text = var_4_66

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_67 = 12
				local var_4_68 = utf8.len(var_4_66)
				local var_4_69 = var_4_67 <= 0 and var_4_62 or var_4_62 * (var_4_68 / var_4_67)

				if var_4_69 > 0 and var_4_62 < var_4_69 then
					arg_1_1.talkMaxDuration = var_4_69
					var_4_61 = var_4_61 + 0.3

					if var_4_69 + var_4_61 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_69 + var_4_61
					end
				end

				arg_1_1.text_.text = var_4_66
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071001", "story_v_out_103071.awb") ~= 0 then
					local var_4_70 = manager.audio:GetVoiceLength("story_v_out_103071", "103071001", "story_v_out_103071.awb") / 1000

					if var_4_70 + var_4_61 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_70 + var_4_61
					end

					if var_4_65.prefab_name ~= "" and arg_1_1.actors_[var_4_65.prefab_name] ~= nil then
						local var_4_71 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_65.prefab_name].transform, "story_v_out_103071", "103071001", "story_v_out_103071.awb")

						arg_1_1:RecordAudio("103071001", var_4_71)
						arg_1_1:RecordAudio("103071001", var_4_71)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_103071", "103071001", "story_v_out_103071.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_103071", "103071001", "story_v_out_103071.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_72 = var_4_61 + 0.3
			local var_4_73 = math.max(var_4_62, arg_1_1.talkMaxDuration)

			if var_4_72 <= arg_1_1.time_ and arg_1_1.time_ < var_4_72 + var_4_73 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_72) / var_4_73

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_72 + var_4_73 and arg_1_1.time_ < var_4_72 + var_4_73 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play103071002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 103071002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play103071003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1148ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1148ui_story == nil then
				arg_7_1.var_.characterEffect1148ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.1

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1148ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1148ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1148ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1148ui_story.fillRatio = var_10_5
			end

			local var_10_6 = arg_7_1.actors_["1148ui_story"].transform
			local var_10_7 = 0

			if var_10_7 < arg_7_1.time_ and arg_7_1.time_ <= var_10_7 + arg_10_0 then
				arg_7_1.var_.moveOldPos1148ui_story = var_10_6.localPosition
			end

			local var_10_8 = 0.001

			if var_10_7 <= arg_7_1.time_ and arg_7_1.time_ < var_10_7 + var_10_8 then
				local var_10_9 = (arg_7_1.time_ - var_10_7) / var_10_8
				local var_10_10 = Vector3.New(0, 100, 0)

				var_10_6.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1148ui_story, var_10_10, var_10_9)

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
			local var_10_16 = 0.85

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

				local var_10_17 = arg_7_1:GetWordFromCfg(103071002)
				local var_10_18 = arg_7_1:FormatText(var_10_17.content)

				arg_7_1.text_.text = var_10_18

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_19 = 34
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
	Play103071003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 103071003
		arg_11_1.duration_ = 4.9

		local var_11_0 = {
			ja = 4.4,
			ko = 4.9,
			zh = 3.9,
			en = 4.166
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
				arg_11_0:Play103071004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1059ui_story"

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

			local var_14_4 = arg_11_1.actors_["1059ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect1059ui_story == nil then
				arg_11_1.var_.characterEffect1059ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect1059ui_story then
					arg_11_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect1059ui_story then
				arg_11_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_14_8 = 0

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 then
				arg_11_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_14_9 = arg_11_1.actors_["1059ui_story"].transform
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1.var_.moveOldPos1059ui_story = var_14_9.localPosition
			end

			local var_14_11 = 0.001

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11
				local var_14_13 = Vector3.New(-0.7, -1.05, -6)

				var_14_9.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1059ui_story, var_14_13, var_14_12)

				local var_14_14 = manager.ui.mainCamera.transform.position - var_14_9.position

				var_14_9.forward = Vector3.New(var_14_14.x, var_14_14.y, var_14_14.z)

				local var_14_15 = var_14_9.localEulerAngles

				var_14_15.z = 0
				var_14_15.x = 0
				var_14_9.localEulerAngles = var_14_15
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 then
				var_14_9.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_14_16 = manager.ui.mainCamera.transform.position - var_14_9.position

				var_14_9.forward = Vector3.New(var_14_16.x, var_14_16.y, var_14_16.z)

				local var_14_17 = var_14_9.localEulerAngles

				var_14_17.z = 0
				var_14_17.x = 0
				var_14_9.localEulerAngles = var_14_17
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_14_19 = 0
			local var_14_20 = 0.525

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_21 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_21:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_21:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_21:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_22 = arg_11_1:FormatText(StoryNameCfg[28].name)

				arg_11_1.leftNameTxt_.text = var_14_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_23 = arg_11_1:GetWordFromCfg(103071003)
				local var_14_24 = arg_11_1:FormatText(var_14_23.content)

				arg_11_1.text_.text = var_14_24

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_25 = 21
				local var_14_26 = utf8.len(var_14_24)
				local var_14_27 = var_14_25 <= 0 and var_14_20 or var_14_20 * (var_14_26 / var_14_25)

				if var_14_27 > 0 and var_14_20 < var_14_27 then
					arg_11_1.talkMaxDuration = var_14_27
					var_14_19 = var_14_19 + 0.3

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end
				end

				arg_11_1.text_.text = var_14_24
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071003", "story_v_out_103071.awb") ~= 0 then
					local var_14_28 = manager.audio:GetVoiceLength("story_v_out_103071", "103071003", "story_v_out_103071.awb") / 1000

					if var_14_28 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_19
					end

					if var_14_23.prefab_name ~= "" and arg_11_1.actors_[var_14_23.prefab_name] ~= nil then
						local var_14_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_23.prefab_name].transform, "story_v_out_103071", "103071003", "story_v_out_103071.awb")

						arg_11_1:RecordAudio("103071003", var_14_29)
						arg_11_1:RecordAudio("103071003", var_14_29)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_103071", "103071003", "story_v_out_103071.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_103071", "103071003", "story_v_out_103071.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_30 = var_14_19 + 0.3
			local var_14_31 = math.max(var_14_20, arg_11_1.talkMaxDuration)

			if var_14_30 <= arg_11_1.time_ and arg_11_1.time_ < var_14_30 + var_14_31 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_30) / var_14_31

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_30 + var_14_31 and arg_11_1.time_ < var_14_30 + var_14_31 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play103071004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 103071004
		arg_17_1.duration_ = 4.7

		local var_17_0 = {
			ja = 3.666,
			ko = 3.166,
			zh = 3.033,
			en = 4.7
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play103071005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1148ui_story"]
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 and arg_17_1.var_.characterEffect1148ui_story == nil then
				arg_17_1.var_.characterEffect1148ui_story = var_20_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_2 = 0.1

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2

				if arg_17_1.var_.characterEffect1148ui_story then
					arg_17_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 and arg_17_1.var_.characterEffect1148ui_story then
				arg_17_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_20_4 = arg_17_1.actors_["1059ui_story"]
			local var_20_5 = 0

			if var_20_5 < arg_17_1.time_ and arg_17_1.time_ <= var_20_5 + arg_20_0 and arg_17_1.var_.characterEffect1059ui_story == nil then
				arg_17_1.var_.characterEffect1059ui_story = var_20_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_6 = 0.1

			if var_20_5 <= arg_17_1.time_ and arg_17_1.time_ < var_20_5 + var_20_6 then
				local var_20_7 = (arg_17_1.time_ - var_20_5) / var_20_6

				if arg_17_1.var_.characterEffect1059ui_story then
					local var_20_8 = Mathf.Lerp(0, 0.5, var_20_7)

					arg_17_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_17_1.var_.characterEffect1059ui_story.fillRatio = var_20_8
				end
			end

			if arg_17_1.time_ >= var_20_5 + var_20_6 and arg_17_1.time_ < var_20_5 + var_20_6 + arg_20_0 and arg_17_1.var_.characterEffect1059ui_story then
				local var_20_9 = 0.5

				arg_17_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_17_1.var_.characterEffect1059ui_story.fillRatio = var_20_9
			end

			local var_20_10 = arg_17_1.actors_["1148ui_story"].transform
			local var_20_11 = 0

			if var_20_11 < arg_17_1.time_ and arg_17_1.time_ <= var_20_11 + arg_20_0 then
				arg_17_1.var_.moveOldPos1148ui_story = var_20_10.localPosition
			end

			local var_20_12 = 0.001

			if var_20_11 <= arg_17_1.time_ and arg_17_1.time_ < var_20_11 + var_20_12 then
				local var_20_13 = (arg_17_1.time_ - var_20_11) / var_20_12
				local var_20_14 = Vector3.New(0.7, -0.8, -6.2)

				var_20_10.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1148ui_story, var_20_14, var_20_13)

				local var_20_15 = manager.ui.mainCamera.transform.position - var_20_10.position

				var_20_10.forward = Vector3.New(var_20_15.x, var_20_15.y, var_20_15.z)

				local var_20_16 = var_20_10.localEulerAngles

				var_20_16.z = 0
				var_20_16.x = 0
				var_20_10.localEulerAngles = var_20_16
			end

			if arg_17_1.time_ >= var_20_11 + var_20_12 and arg_17_1.time_ < var_20_11 + var_20_12 + arg_20_0 then
				var_20_10.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_20_17 = manager.ui.mainCamera.transform.position - var_20_10.position

				var_20_10.forward = Vector3.New(var_20_17.x, var_20_17.y, var_20_17.z)

				local var_20_18 = var_20_10.localEulerAngles

				var_20_18.z = 0
				var_20_18.x = 0
				var_20_10.localEulerAngles = var_20_18
			end

			local var_20_19 = 0

			if var_20_19 < arg_17_1.time_ and arg_17_1.time_ <= var_20_19 + arg_20_0 then
				arg_17_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_20_20 = 0

			if var_20_20 < arg_17_1.time_ and arg_17_1.time_ <= var_20_20 + arg_20_0 then
				arg_17_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_20_21 = 0
			local var_20_22 = 0.325

			if var_20_21 < arg_17_1.time_ and arg_17_1.time_ <= var_20_21 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_23 = arg_17_1:FormatText(StoryNameCfg[8].name)

				arg_17_1.leftNameTxt_.text = var_20_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_24 = arg_17_1:GetWordFromCfg(103071004)
				local var_20_25 = arg_17_1:FormatText(var_20_24.content)

				arg_17_1.text_.text = var_20_25

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_26 = 13
				local var_20_27 = utf8.len(var_20_25)
				local var_20_28 = var_20_26 <= 0 and var_20_22 or var_20_22 * (var_20_27 / var_20_26)

				if var_20_28 > 0 and var_20_22 < var_20_28 then
					arg_17_1.talkMaxDuration = var_20_28

					if var_20_28 + var_20_21 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_28 + var_20_21
					end
				end

				arg_17_1.text_.text = var_20_25
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071004", "story_v_out_103071.awb") ~= 0 then
					local var_20_29 = manager.audio:GetVoiceLength("story_v_out_103071", "103071004", "story_v_out_103071.awb") / 1000

					if var_20_29 + var_20_21 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_29 + var_20_21
					end

					if var_20_24.prefab_name ~= "" and arg_17_1.actors_[var_20_24.prefab_name] ~= nil then
						local var_20_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_24.prefab_name].transform, "story_v_out_103071", "103071004", "story_v_out_103071.awb")

						arg_17_1:RecordAudio("103071004", var_20_30)
						arg_17_1:RecordAudio("103071004", var_20_30)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_103071", "103071004", "story_v_out_103071.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_103071", "103071004", "story_v_out_103071.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_31 = math.max(var_20_22, arg_17_1.talkMaxDuration)

			if var_20_21 <= arg_17_1.time_ and arg_17_1.time_ < var_20_21 + var_20_31 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_21) / var_20_31

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_21 + var_20_31 and arg_17_1.time_ < var_20_21 + var_20_31 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play103071005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 103071005
		arg_21_1.duration_ = 5.066

		local var_21_0 = {
			ja = 5.066,
			ko = 2.6,
			zh = 2.866,
			en = 2.733
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play103071006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1059ui_story"]
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 and arg_21_1.var_.characterEffect1059ui_story == nil then
				arg_21_1.var_.characterEffect1059ui_story = var_24_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_2 = 0.1

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2

				if arg_21_1.var_.characterEffect1059ui_story then
					arg_21_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 and arg_21_1.var_.characterEffect1059ui_story then
				arg_21_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_24_4 = arg_21_1.actors_["1148ui_story"]
			local var_24_5 = 0

			if var_24_5 < arg_21_1.time_ and arg_21_1.time_ <= var_24_5 + arg_24_0 and arg_21_1.var_.characterEffect1148ui_story == nil then
				arg_21_1.var_.characterEffect1148ui_story = var_24_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_6 = 0.1

			if var_24_5 <= arg_21_1.time_ and arg_21_1.time_ < var_24_5 + var_24_6 then
				local var_24_7 = (arg_21_1.time_ - var_24_5) / var_24_6

				if arg_21_1.var_.characterEffect1148ui_story then
					local var_24_8 = Mathf.Lerp(0, 0.5, var_24_7)

					arg_21_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_21_1.var_.characterEffect1148ui_story.fillRatio = var_24_8
				end
			end

			if arg_21_1.time_ >= var_24_5 + var_24_6 and arg_21_1.time_ < var_24_5 + var_24_6 + arg_24_0 and arg_21_1.var_.characterEffect1148ui_story then
				local var_24_9 = 0.5

				arg_21_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_21_1.var_.characterEffect1148ui_story.fillRatio = var_24_9
			end

			local var_24_10 = 0

			if var_24_10 < arg_21_1.time_ and arg_21_1.time_ <= var_24_10 + arg_24_0 then
				arg_21_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action424")
			end

			local var_24_11 = 0

			if var_24_11 < arg_21_1.time_ and arg_21_1.time_ <= var_24_11 + arg_24_0 then
				arg_21_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_24_12 = 0
			local var_24_13 = 0.275

			if var_24_12 < arg_21_1.time_ and arg_21_1.time_ <= var_24_12 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_14 = arg_21_1:FormatText(StoryNameCfg[28].name)

				arg_21_1.leftNameTxt_.text = var_24_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_15 = arg_21_1:GetWordFromCfg(103071005)
				local var_24_16 = arg_21_1:FormatText(var_24_15.content)

				arg_21_1.text_.text = var_24_16

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_17 = 11
				local var_24_18 = utf8.len(var_24_16)
				local var_24_19 = var_24_17 <= 0 and var_24_13 or var_24_13 * (var_24_18 / var_24_17)

				if var_24_19 > 0 and var_24_13 < var_24_19 then
					arg_21_1.talkMaxDuration = var_24_19

					if var_24_19 + var_24_12 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_19 + var_24_12
					end
				end

				arg_21_1.text_.text = var_24_16
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071005", "story_v_out_103071.awb") ~= 0 then
					local var_24_20 = manager.audio:GetVoiceLength("story_v_out_103071", "103071005", "story_v_out_103071.awb") / 1000

					if var_24_20 + var_24_12 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_20 + var_24_12
					end

					if var_24_15.prefab_name ~= "" and arg_21_1.actors_[var_24_15.prefab_name] ~= nil then
						local var_24_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_15.prefab_name].transform, "story_v_out_103071", "103071005", "story_v_out_103071.awb")

						arg_21_1:RecordAudio("103071005", var_24_21)
						arg_21_1:RecordAudio("103071005", var_24_21)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_103071", "103071005", "story_v_out_103071.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_103071", "103071005", "story_v_out_103071.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_22 = math.max(var_24_13, arg_21_1.talkMaxDuration)

			if var_24_12 <= arg_21_1.time_ and arg_21_1.time_ < var_24_12 + var_24_22 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_12) / var_24_22

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_12 + var_24_22 and arg_21_1.time_ < var_24_12 + var_24_22 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play103071006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 103071006
		arg_25_1.duration_ = 6.466

		local var_25_0 = {
			ja = 6.466,
			ko = 3.366,
			zh = 3,
			en = 3.9
		}
		local var_25_1 = manager.audio:GetLocalizationFlag()

		if var_25_0[var_25_1] ~= nil then
			arg_25_1.duration_ = var_25_0[var_25_1]
		end

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play103071007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1148ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.characterEffect1148ui_story == nil then
				arg_25_1.var_.characterEffect1148ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.1

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect1148ui_story then
					arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.characterEffect1148ui_story then
				arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_28_4 = arg_25_1.actors_["1059ui_story"]
			local var_28_5 = 0

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 and arg_25_1.var_.characterEffect1059ui_story == nil then
				arg_25_1.var_.characterEffect1059ui_story = var_28_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_6 = 0.1

			if var_28_5 <= arg_25_1.time_ and arg_25_1.time_ < var_28_5 + var_28_6 then
				local var_28_7 = (arg_25_1.time_ - var_28_5) / var_28_6

				if arg_25_1.var_.characterEffect1059ui_story then
					local var_28_8 = Mathf.Lerp(0, 0.5, var_28_7)

					arg_25_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_25_1.var_.characterEffect1059ui_story.fillRatio = var_28_8
				end
			end

			if arg_25_1.time_ >= var_28_5 + var_28_6 and arg_25_1.time_ < var_28_5 + var_28_6 + arg_28_0 and arg_25_1.var_.characterEffect1059ui_story then
				local var_28_9 = 0.5

				arg_25_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_25_1.var_.characterEffect1059ui_story.fillRatio = var_28_9
			end

			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 then
				arg_25_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action454")
			end

			local var_28_11 = 0

			if var_28_11 < arg_25_1.time_ and arg_25_1.time_ <= var_28_11 + arg_28_0 then
				arg_25_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_28_12 = 0
			local var_28_13 = 0.375

			if var_28_12 < arg_25_1.time_ and arg_25_1.time_ <= var_28_12 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_14 = arg_25_1:FormatText(StoryNameCfg[8].name)

				arg_25_1.leftNameTxt_.text = var_28_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_15 = arg_25_1:GetWordFromCfg(103071006)
				local var_28_16 = arg_25_1:FormatText(var_28_15.content)

				arg_25_1.text_.text = var_28_16

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_17 = 15
				local var_28_18 = utf8.len(var_28_16)
				local var_28_19 = var_28_17 <= 0 and var_28_13 or var_28_13 * (var_28_18 / var_28_17)

				if var_28_19 > 0 and var_28_13 < var_28_19 then
					arg_25_1.talkMaxDuration = var_28_19

					if var_28_19 + var_28_12 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_19 + var_28_12
					end
				end

				arg_25_1.text_.text = var_28_16
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071006", "story_v_out_103071.awb") ~= 0 then
					local var_28_20 = manager.audio:GetVoiceLength("story_v_out_103071", "103071006", "story_v_out_103071.awb") / 1000

					if var_28_20 + var_28_12 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_20 + var_28_12
					end

					if var_28_15.prefab_name ~= "" and arg_25_1.actors_[var_28_15.prefab_name] ~= nil then
						local var_28_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_15.prefab_name].transform, "story_v_out_103071", "103071006", "story_v_out_103071.awb")

						arg_25_1:RecordAudio("103071006", var_28_21)
						arg_25_1:RecordAudio("103071006", var_28_21)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_103071", "103071006", "story_v_out_103071.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_103071", "103071006", "story_v_out_103071.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_22 = math.max(var_28_13, arg_25_1.talkMaxDuration)

			if var_28_12 <= arg_25_1.time_ and arg_25_1.time_ < var_28_12 + var_28_22 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_12) / var_28_22

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_12 + var_28_22 and arg_25_1.time_ < var_28_12 + var_28_22 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play103071007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 103071007
		arg_29_1.duration_ = 5.166

		local var_29_0 = {
			ja = 5.166,
			ko = 3.366,
			zh = 3.433,
			en = 4.566
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play103071008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 1

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				local var_32_2 = "play"
				local var_32_3 = "effect"

				arg_29_1:AudioAction(var_32_2, var_32_3, "se_story_3", "se_story_3_shoot", "")
			end

			local var_32_4 = 0

			if var_32_4 < arg_29_1.time_ and arg_29_1.time_ <= var_32_4 + arg_32_0 then
				arg_29_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action3_1")
			end

			local var_32_5 = 0

			if var_32_5 < arg_29_1.time_ and arg_29_1.time_ <= var_32_5 + arg_32_0 then
				arg_29_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_32_6 = 0
			local var_32_7 = 0.325

			if var_32_6 < arg_29_1.time_ and arg_29_1.time_ <= var_32_6 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_8 = arg_29_1:FormatText(StoryNameCfg[8].name)

				arg_29_1.leftNameTxt_.text = var_32_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_9 = arg_29_1:GetWordFromCfg(103071007)
				local var_32_10 = arg_29_1:FormatText(var_32_9.content)

				arg_29_1.text_.text = var_32_10

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_11 = 12
				local var_32_12 = utf8.len(var_32_10)
				local var_32_13 = var_32_11 <= 0 and var_32_7 or var_32_7 * (var_32_12 / var_32_11)

				if var_32_13 > 0 and var_32_7 < var_32_13 then
					arg_29_1.talkMaxDuration = var_32_13

					if var_32_13 + var_32_6 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_13 + var_32_6
					end
				end

				arg_29_1.text_.text = var_32_10
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071007", "story_v_out_103071.awb") ~= 0 then
					local var_32_14 = manager.audio:GetVoiceLength("story_v_out_103071", "103071007", "story_v_out_103071.awb") / 1000

					if var_32_14 + var_32_6 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_14 + var_32_6
					end

					if var_32_9.prefab_name ~= "" and arg_29_1.actors_[var_32_9.prefab_name] ~= nil then
						local var_32_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_9.prefab_name].transform, "story_v_out_103071", "103071007", "story_v_out_103071.awb")

						arg_29_1:RecordAudio("103071007", var_32_15)
						arg_29_1:RecordAudio("103071007", var_32_15)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_103071", "103071007", "story_v_out_103071.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_103071", "103071007", "story_v_out_103071.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_16 = math.max(var_32_7, arg_29_1.talkMaxDuration)

			if var_32_6 <= arg_29_1.time_ and arg_29_1.time_ < var_32_6 + var_32_16 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_6) / var_32_16

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_6 + var_32_16 and arg_29_1.time_ < var_32_6 + var_32_16 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play103071008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 103071008
		arg_33_1.duration_ = 2.233

		local var_33_0 = {
			ja = 2.233,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_33_1 = manager.audio:GetLocalizationFlag()

		if var_33_0[var_33_1] ~= nil then
			arg_33_1.duration_ = var_33_0[var_33_1]
		end

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play103071009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = manager.ui.mainCamera.transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.shakeOldPosMainCamera = var_36_0.localPosition
			end

			local var_36_2 = 0.600000023841858

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / 0.066
				local var_36_4, var_36_5 = math.modf(var_36_3)

				var_36_0.localPosition = Vector3.New(var_36_5 * 0.13, var_36_5 * 0.13, var_36_5 * 0.13) + arg_33_1.var_.shakeOldPosMainCamera
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = arg_33_1.var_.shakeOldPosMainCamera
			end

			local var_36_6 = "1035ui_story"

			if arg_33_1.actors_[var_36_6] == nil then
				local var_36_7 = Object.Instantiate(Asset.Load("Char/" .. var_36_6), arg_33_1.stage_.transform)

				var_36_7.name = var_36_6
				var_36_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_33_1.actors_[var_36_6] = var_36_7

				local var_36_8 = var_36_7:GetComponentInChildren(typeof(CharacterEffect))

				var_36_8.enabled = true

				local var_36_9 = GameObjectTools.GetOrAddComponent(var_36_7, typeof(DynamicBoneHelper))

				if var_36_9 then
					var_36_9:EnableDynamicBone(false)
				end

				arg_33_1:ShowWeapon(var_36_8.transform, false)

				arg_33_1.var_[var_36_6 .. "Animator"] = var_36_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_33_1.var_[var_36_6 .. "Animator"].applyRootMotion = true
				arg_33_1.var_[var_36_6 .. "LipSync"] = var_36_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 then
				arg_33_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action3_1")
			end

			local var_36_11 = arg_33_1.actors_["1035ui_story"].transform
			local var_36_12 = 0

			if var_36_12 < arg_33_1.time_ and arg_33_1.time_ <= var_36_12 + arg_36_0 then
				arg_33_1.var_.moveOldPos1035ui_story = var_36_11.localPosition
			end

			local var_36_13 = 0.001

			if var_36_12 <= arg_33_1.time_ and arg_33_1.time_ < var_36_12 + var_36_13 then
				local var_36_14 = (arg_33_1.time_ - var_36_12) / var_36_13
				local var_36_15 = Vector3.New(0, -1.05, -5.6)

				var_36_11.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1035ui_story, var_36_15, var_36_14)

				local var_36_16 = manager.ui.mainCamera.transform.position - var_36_11.position

				var_36_11.forward = Vector3.New(var_36_16.x, var_36_16.y, var_36_16.z)

				local var_36_17 = var_36_11.localEulerAngles

				var_36_17.z = 0
				var_36_17.x = 0
				var_36_11.localEulerAngles = var_36_17
			end

			if arg_33_1.time_ >= var_36_12 + var_36_13 and arg_33_1.time_ < var_36_12 + var_36_13 + arg_36_0 then
				var_36_11.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_36_18 = manager.ui.mainCamera.transform.position - var_36_11.position

				var_36_11.forward = Vector3.New(var_36_18.x, var_36_18.y, var_36_18.z)

				local var_36_19 = var_36_11.localEulerAngles

				var_36_19.z = 0
				var_36_19.x = 0
				var_36_11.localEulerAngles = var_36_19
			end

			local var_36_20 = arg_33_1.actors_["1148ui_story"].transform
			local var_36_21 = 0

			if var_36_21 < arg_33_1.time_ and arg_33_1.time_ <= var_36_21 + arg_36_0 then
				arg_33_1.var_.moveOldPos1148ui_story = var_36_20.localPosition
			end

			local var_36_22 = 0.001

			if var_36_21 <= arg_33_1.time_ and arg_33_1.time_ < var_36_21 + var_36_22 then
				local var_36_23 = (arg_33_1.time_ - var_36_21) / var_36_22
				local var_36_24 = Vector3.New(0, 100, 0)

				var_36_20.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1148ui_story, var_36_24, var_36_23)

				local var_36_25 = manager.ui.mainCamera.transform.position - var_36_20.position

				var_36_20.forward = Vector3.New(var_36_25.x, var_36_25.y, var_36_25.z)

				local var_36_26 = var_36_20.localEulerAngles

				var_36_26.z = 0
				var_36_26.x = 0
				var_36_20.localEulerAngles = var_36_26
			end

			if arg_33_1.time_ >= var_36_21 + var_36_22 and arg_33_1.time_ < var_36_21 + var_36_22 + arg_36_0 then
				var_36_20.localPosition = Vector3.New(0, 100, 0)

				local var_36_27 = manager.ui.mainCamera.transform.position - var_36_20.position

				var_36_20.forward = Vector3.New(var_36_27.x, var_36_27.y, var_36_27.z)

				local var_36_28 = var_36_20.localEulerAngles

				var_36_28.z = 0
				var_36_28.x = 0
				var_36_20.localEulerAngles = var_36_28
			end

			local var_36_29 = arg_33_1.actors_["1059ui_story"].transform
			local var_36_30 = 0

			if var_36_30 < arg_33_1.time_ and arg_33_1.time_ <= var_36_30 + arg_36_0 then
				arg_33_1.var_.moveOldPos1059ui_story = var_36_29.localPosition
			end

			local var_36_31 = 0.001

			if var_36_30 <= arg_33_1.time_ and arg_33_1.time_ < var_36_30 + var_36_31 then
				local var_36_32 = (arg_33_1.time_ - var_36_30) / var_36_31
				local var_36_33 = Vector3.New(0, 100, 0)

				var_36_29.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1059ui_story, var_36_33, var_36_32)

				local var_36_34 = manager.ui.mainCamera.transform.position - var_36_29.position

				var_36_29.forward = Vector3.New(var_36_34.x, var_36_34.y, var_36_34.z)

				local var_36_35 = var_36_29.localEulerAngles

				var_36_35.z = 0
				var_36_35.x = 0
				var_36_29.localEulerAngles = var_36_35
			end

			if arg_33_1.time_ >= var_36_30 + var_36_31 and arg_33_1.time_ < var_36_30 + var_36_31 + arg_36_0 then
				var_36_29.localPosition = Vector3.New(0, 100, 0)

				local var_36_36 = manager.ui.mainCamera.transform.position - var_36_29.position

				var_36_29.forward = Vector3.New(var_36_36.x, var_36_36.y, var_36_36.z)

				local var_36_37 = var_36_29.localEulerAngles

				var_36_37.z = 0
				var_36_37.x = 0
				var_36_29.localEulerAngles = var_36_37
			end

			local var_36_38 = arg_33_1.actors_["1035ui_story"]
			local var_36_39 = 0

			if var_36_39 < arg_33_1.time_ and arg_33_1.time_ <= var_36_39 + arg_36_0 and arg_33_1.var_.characterEffect1035ui_story == nil then
				arg_33_1.var_.characterEffect1035ui_story = var_36_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_40 = 0.2

			if var_36_39 <= arg_33_1.time_ and arg_33_1.time_ < var_36_39 + var_36_40 then
				local var_36_41 = (arg_33_1.time_ - var_36_39) / var_36_40

				if arg_33_1.var_.characterEffect1035ui_story then
					arg_33_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_39 + var_36_40 and arg_33_1.time_ < var_36_39 + var_36_40 + arg_36_0 and arg_33_1.var_.characterEffect1035ui_story then
				arg_33_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_36_42 = 0
			local var_36_43 = 0.125

			if var_36_42 < arg_33_1.time_ and arg_33_1.time_ <= var_36_42 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_44 = arg_33_1:FormatText(StoryNameCfg[21].name)

				arg_33_1.leftNameTxt_.text = var_36_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_45 = arg_33_1:GetWordFromCfg(103071008)
				local var_36_46 = arg_33_1:FormatText(var_36_45.content)

				arg_33_1.text_.text = var_36_46

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_47 = 5
				local var_36_48 = utf8.len(var_36_46)
				local var_36_49 = var_36_47 <= 0 and var_36_43 or var_36_43 * (var_36_48 / var_36_47)

				if var_36_49 > 0 and var_36_43 < var_36_49 then
					arg_33_1.talkMaxDuration = var_36_49

					if var_36_49 + var_36_42 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_49 + var_36_42
					end
				end

				arg_33_1.text_.text = var_36_46
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071008", "story_v_out_103071.awb") ~= 0 then
					local var_36_50 = manager.audio:GetVoiceLength("story_v_out_103071", "103071008", "story_v_out_103071.awb") / 1000

					if var_36_50 + var_36_42 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_50 + var_36_42
					end

					if var_36_45.prefab_name ~= "" and arg_33_1.actors_[var_36_45.prefab_name] ~= nil then
						local var_36_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_45.prefab_name].transform, "story_v_out_103071", "103071008", "story_v_out_103071.awb")

						arg_33_1:RecordAudio("103071008", var_36_51)
						arg_33_1:RecordAudio("103071008", var_36_51)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_103071", "103071008", "story_v_out_103071.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_103071", "103071008", "story_v_out_103071.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_52 = math.max(var_36_43, arg_33_1.talkMaxDuration)

			if var_36_42 <= arg_33_1.time_ and arg_33_1.time_ < var_36_42 + var_36_52 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_42) / var_36_52

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_42 + var_36_52 and arg_33_1.time_ < var_36_42 + var_36_52 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play103071009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 103071009
		arg_37_1.duration_ = 10.466

		local var_37_0 = {
			ja = 10.466,
			ko = 7.933,
			zh = 7.266,
			en = 9.7
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play103071010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1148ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1148ui_story == nil then
				arg_37_1.var_.characterEffect1148ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.1

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1148ui_story then
					arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1148ui_story then
				arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_40_4 = 0

			if var_40_4 < arg_37_1.time_ and arg_37_1.time_ <= var_40_4 + arg_40_0 then
				arg_37_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action465")
			end

			local var_40_5 = arg_37_1.actors_["1035ui_story"].transform
			local var_40_6 = 0

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.var_.moveOldPos1035ui_story = var_40_5.localPosition
			end

			local var_40_7 = 0.001

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_7 then
				local var_40_8 = (arg_37_1.time_ - var_40_6) / var_40_7
				local var_40_9 = Vector3.New(0, 100, 0)

				var_40_5.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1035ui_story, var_40_9, var_40_8)

				local var_40_10 = manager.ui.mainCamera.transform.position - var_40_5.position

				var_40_5.forward = Vector3.New(var_40_10.x, var_40_10.y, var_40_10.z)

				local var_40_11 = var_40_5.localEulerAngles

				var_40_11.z = 0
				var_40_11.x = 0
				var_40_5.localEulerAngles = var_40_11
			end

			if arg_37_1.time_ >= var_40_6 + var_40_7 and arg_37_1.time_ < var_40_6 + var_40_7 + arg_40_0 then
				var_40_5.localPosition = Vector3.New(0, 100, 0)

				local var_40_12 = manager.ui.mainCamera.transform.position - var_40_5.position

				var_40_5.forward = Vector3.New(var_40_12.x, var_40_12.y, var_40_12.z)

				local var_40_13 = var_40_5.localEulerAngles

				var_40_13.z = 0
				var_40_13.x = 0
				var_40_5.localEulerAngles = var_40_13
			end

			local var_40_14 = arg_37_1.actors_["1148ui_story"].transform
			local var_40_15 = 0

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.var_.moveOldPos1148ui_story = var_40_14.localPosition
			end

			local var_40_16 = 0.001

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_16 then
				local var_40_17 = (arg_37_1.time_ - var_40_15) / var_40_16
				local var_40_18 = Vector3.New(0, -0.8, -6.2)

				var_40_14.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1148ui_story, var_40_18, var_40_17)

				local var_40_19 = manager.ui.mainCamera.transform.position - var_40_14.position

				var_40_14.forward = Vector3.New(var_40_19.x, var_40_19.y, var_40_19.z)

				local var_40_20 = var_40_14.localEulerAngles

				var_40_20.z = 0
				var_40_20.x = 0
				var_40_14.localEulerAngles = var_40_20
			end

			if arg_37_1.time_ >= var_40_15 + var_40_16 and arg_37_1.time_ < var_40_15 + var_40_16 + arg_40_0 then
				var_40_14.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_40_21 = manager.ui.mainCamera.transform.position - var_40_14.position

				var_40_14.forward = Vector3.New(var_40_21.x, var_40_21.y, var_40_21.z)

				local var_40_22 = var_40_14.localEulerAngles

				var_40_22.z = 0
				var_40_22.x = 0
				var_40_14.localEulerAngles = var_40_22
			end

			local var_40_23 = 0

			if var_40_23 < arg_37_1.time_ and arg_37_1.time_ <= var_40_23 + arg_40_0 then
				arg_37_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_40_24 = 0
			local var_40_25 = 0.875

			if var_40_24 < arg_37_1.time_ and arg_37_1.time_ <= var_40_24 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_26 = arg_37_1:FormatText(StoryNameCfg[8].name)

				arg_37_1.leftNameTxt_.text = var_40_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_27 = arg_37_1:GetWordFromCfg(103071009)
				local var_40_28 = arg_37_1:FormatText(var_40_27.content)

				arg_37_1.text_.text = var_40_28

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_29 = 35
				local var_40_30 = utf8.len(var_40_28)
				local var_40_31 = var_40_29 <= 0 and var_40_25 or var_40_25 * (var_40_30 / var_40_29)

				if var_40_31 > 0 and var_40_25 < var_40_31 then
					arg_37_1.talkMaxDuration = var_40_31

					if var_40_31 + var_40_24 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_31 + var_40_24
					end
				end

				arg_37_1.text_.text = var_40_28
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071009", "story_v_out_103071.awb") ~= 0 then
					local var_40_32 = manager.audio:GetVoiceLength("story_v_out_103071", "103071009", "story_v_out_103071.awb") / 1000

					if var_40_32 + var_40_24 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_32 + var_40_24
					end

					if var_40_27.prefab_name ~= "" and arg_37_1.actors_[var_40_27.prefab_name] ~= nil then
						local var_40_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_27.prefab_name].transform, "story_v_out_103071", "103071009", "story_v_out_103071.awb")

						arg_37_1:RecordAudio("103071009", var_40_33)
						arg_37_1:RecordAudio("103071009", var_40_33)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_103071", "103071009", "story_v_out_103071.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_103071", "103071009", "story_v_out_103071.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_34 = math.max(var_40_25, arg_37_1.talkMaxDuration)

			if var_40_24 <= arg_37_1.time_ and arg_37_1.time_ < var_40_24 + var_40_34 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_24) / var_40_34

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_24 + var_40_34 and arg_37_1.time_ < var_40_24 + var_40_34 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play103071010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 103071010
		arg_41_1.duration_ = 9.833

		local var_41_0 = {
			ja = 9.833,
			ko = 6.566,
			zh = 6.1,
			en = 7.866
		}
		local var_41_1 = manager.audio:GetLocalizationFlag()

		if var_41_0[var_41_1] ~= nil then
			arg_41_1.duration_ = var_41_0[var_41_1]
		end

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play103071011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action457")
			end

			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_44_2 = 0
			local var_44_3 = 0.575

			if var_44_2 < arg_41_1.time_ and arg_41_1.time_ <= var_44_2 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_4 = arg_41_1:FormatText(StoryNameCfg[8].name)

				arg_41_1.leftNameTxt_.text = var_44_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_5 = arg_41_1:GetWordFromCfg(103071010)
				local var_44_6 = arg_41_1:FormatText(var_44_5.content)

				arg_41_1.text_.text = var_44_6

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_7 = 24
				local var_44_8 = utf8.len(var_44_6)
				local var_44_9 = var_44_7 <= 0 and var_44_3 or var_44_3 * (var_44_8 / var_44_7)

				if var_44_9 > 0 and var_44_3 < var_44_9 then
					arg_41_1.talkMaxDuration = var_44_9

					if var_44_9 + var_44_2 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_9 + var_44_2
					end
				end

				arg_41_1.text_.text = var_44_6
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071010", "story_v_out_103071.awb") ~= 0 then
					local var_44_10 = manager.audio:GetVoiceLength("story_v_out_103071", "103071010", "story_v_out_103071.awb") / 1000

					if var_44_10 + var_44_2 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_10 + var_44_2
					end

					if var_44_5.prefab_name ~= "" and arg_41_1.actors_[var_44_5.prefab_name] ~= nil then
						local var_44_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_5.prefab_name].transform, "story_v_out_103071", "103071010", "story_v_out_103071.awb")

						arg_41_1:RecordAudio("103071010", var_44_11)
						arg_41_1:RecordAudio("103071010", var_44_11)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_103071", "103071010", "story_v_out_103071.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_103071", "103071010", "story_v_out_103071.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_12 = math.max(var_44_3, arg_41_1.talkMaxDuration)

			if var_44_2 <= arg_41_1.time_ and arg_41_1.time_ < var_44_2 + var_44_12 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_2) / var_44_12

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_2 + var_44_12 and arg_41_1.time_ < var_44_2 + var_44_12 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play103071011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 103071011
		arg_45_1.duration_ = 4.366

		local var_45_0 = {
			ja = 3.966,
			ko = 4.166,
			zh = 3.233,
			en = 4.366
		}
		local var_45_1 = manager.audio:GetLocalizationFlag()

		if var_45_0[var_45_1] ~= nil then
			arg_45_1.duration_ = var_45_0[var_45_1]
		end

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play103071012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1035ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1035ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, -1.05, -5.6)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1035ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = arg_45_1.actors_["1148ui_story"].transform
			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 then
				arg_45_1.var_.moveOldPos1148ui_story = var_48_9.localPosition
			end

			local var_48_11 = 0.001

			if var_48_10 <= arg_45_1.time_ and arg_45_1.time_ < var_48_10 + var_48_11 then
				local var_48_12 = (arg_45_1.time_ - var_48_10) / var_48_11
				local var_48_13 = Vector3.New(0, 100, 0)

				var_48_9.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1148ui_story, var_48_13, var_48_12)

				local var_48_14 = manager.ui.mainCamera.transform.position - var_48_9.position

				var_48_9.forward = Vector3.New(var_48_14.x, var_48_14.y, var_48_14.z)

				local var_48_15 = var_48_9.localEulerAngles

				var_48_15.z = 0
				var_48_15.x = 0
				var_48_9.localEulerAngles = var_48_15
			end

			if arg_45_1.time_ >= var_48_10 + var_48_11 and arg_45_1.time_ < var_48_10 + var_48_11 + arg_48_0 then
				var_48_9.localPosition = Vector3.New(0, 100, 0)

				local var_48_16 = manager.ui.mainCamera.transform.position - var_48_9.position

				var_48_9.forward = Vector3.New(var_48_16.x, var_48_16.y, var_48_16.z)

				local var_48_17 = var_48_9.localEulerAngles

				var_48_17.z = 0
				var_48_17.x = 0
				var_48_9.localEulerAngles = var_48_17
			end

			local var_48_18 = 0

			if var_48_18 < arg_45_1.time_ and arg_45_1.time_ <= var_48_18 + arg_48_0 then
				arg_45_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action6_1")
			end

			local var_48_19 = 0
			local var_48_20 = 0.375

			if var_48_19 < arg_45_1.time_ and arg_45_1.time_ <= var_48_19 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_21 = arg_45_1:FormatText(StoryNameCfg[21].name)

				arg_45_1.leftNameTxt_.text = var_48_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_22 = arg_45_1:GetWordFromCfg(103071011)
				local var_48_23 = arg_45_1:FormatText(var_48_22.content)

				arg_45_1.text_.text = var_48_23

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_24 = 15
				local var_48_25 = utf8.len(var_48_23)
				local var_48_26 = var_48_24 <= 0 and var_48_20 or var_48_20 * (var_48_25 / var_48_24)

				if var_48_26 > 0 and var_48_20 < var_48_26 then
					arg_45_1.talkMaxDuration = var_48_26

					if var_48_26 + var_48_19 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_26 + var_48_19
					end
				end

				arg_45_1.text_.text = var_48_23
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071011", "story_v_out_103071.awb") ~= 0 then
					local var_48_27 = manager.audio:GetVoiceLength("story_v_out_103071", "103071011", "story_v_out_103071.awb") / 1000

					if var_48_27 + var_48_19 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_27 + var_48_19
					end

					if var_48_22.prefab_name ~= "" and arg_45_1.actors_[var_48_22.prefab_name] ~= nil then
						local var_48_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_22.prefab_name].transform, "story_v_out_103071", "103071011", "story_v_out_103071.awb")

						arg_45_1:RecordAudio("103071011", var_48_28)
						arg_45_1:RecordAudio("103071011", var_48_28)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_103071", "103071011", "story_v_out_103071.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_103071", "103071011", "story_v_out_103071.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_29 = math.max(var_48_20, arg_45_1.talkMaxDuration)

			if var_48_19 <= arg_45_1.time_ and arg_45_1.time_ < var_48_19 + var_48_29 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_19) / var_48_29

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_19 + var_48_29 and arg_45_1.time_ < var_48_19 + var_48_29 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play103071012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 103071012
		arg_49_1.duration_ = 4.066

		local var_49_0 = {
			ja = 3,
			ko = 3,
			zh = 2.333,
			en = 4.066
		}
		local var_49_1 = manager.audio:GetLocalizationFlag()

		if var_49_0[var_49_1] ~= nil then
			arg_49_1.duration_ = var_49_0[var_49_1]
		end

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play103071013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1148ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect1148ui_story == nil then
				arg_49_1.var_.characterEffect1148ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.1

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1148ui_story then
					arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect1148ui_story then
				arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_52_4 = 0

			if var_52_4 < arg_49_1.time_ and arg_49_1.time_ <= var_52_4 + arg_52_0 then
				arg_49_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action472")
			end

			local var_52_5 = arg_49_1.actors_["1035ui_story"].transform
			local var_52_6 = 0

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				arg_49_1.var_.moveOldPos1035ui_story = var_52_5.localPosition
			end

			local var_52_7 = 0.001

			if var_52_6 <= arg_49_1.time_ and arg_49_1.time_ < var_52_6 + var_52_7 then
				local var_52_8 = (arg_49_1.time_ - var_52_6) / var_52_7
				local var_52_9 = Vector3.New(0, 100, 0)

				var_52_5.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1035ui_story, var_52_9, var_52_8)

				local var_52_10 = manager.ui.mainCamera.transform.position - var_52_5.position

				var_52_5.forward = Vector3.New(var_52_10.x, var_52_10.y, var_52_10.z)

				local var_52_11 = var_52_5.localEulerAngles

				var_52_11.z = 0
				var_52_11.x = 0
				var_52_5.localEulerAngles = var_52_11
			end

			if arg_49_1.time_ >= var_52_6 + var_52_7 and arg_49_1.time_ < var_52_6 + var_52_7 + arg_52_0 then
				var_52_5.localPosition = Vector3.New(0, 100, 0)

				local var_52_12 = manager.ui.mainCamera.transform.position - var_52_5.position

				var_52_5.forward = Vector3.New(var_52_12.x, var_52_12.y, var_52_12.z)

				local var_52_13 = var_52_5.localEulerAngles

				var_52_13.z = 0
				var_52_13.x = 0
				var_52_5.localEulerAngles = var_52_13
			end

			local var_52_14 = arg_49_1.actors_["1148ui_story"].transform
			local var_52_15 = 0

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.var_.moveOldPos1148ui_story = var_52_14.localPosition
			end

			local var_52_16 = 0.001

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_16 then
				local var_52_17 = (arg_49_1.time_ - var_52_15) / var_52_16
				local var_52_18 = Vector3.New(0, -0.8, -6.2)

				var_52_14.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1148ui_story, var_52_18, var_52_17)

				local var_52_19 = manager.ui.mainCamera.transform.position - var_52_14.position

				var_52_14.forward = Vector3.New(var_52_19.x, var_52_19.y, var_52_19.z)

				local var_52_20 = var_52_14.localEulerAngles

				var_52_20.z = 0
				var_52_20.x = 0
				var_52_14.localEulerAngles = var_52_20
			end

			if arg_49_1.time_ >= var_52_15 + var_52_16 and arg_49_1.time_ < var_52_15 + var_52_16 + arg_52_0 then
				var_52_14.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_52_21 = manager.ui.mainCamera.transform.position - var_52_14.position

				var_52_14.forward = Vector3.New(var_52_21.x, var_52_21.y, var_52_21.z)

				local var_52_22 = var_52_14.localEulerAngles

				var_52_22.z = 0
				var_52_22.x = 0
				var_52_14.localEulerAngles = var_52_22
			end

			local var_52_23 = 0

			if var_52_23 < arg_49_1.time_ and arg_49_1.time_ <= var_52_23 + arg_52_0 then
				arg_49_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_52_24 = 0
			local var_52_25 = 0.225

			if var_52_24 < arg_49_1.time_ and arg_49_1.time_ <= var_52_24 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_26 = arg_49_1:FormatText(StoryNameCfg[8].name)

				arg_49_1.leftNameTxt_.text = var_52_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_27 = arg_49_1:GetWordFromCfg(103071012)
				local var_52_28 = arg_49_1:FormatText(var_52_27.content)

				arg_49_1.text_.text = var_52_28

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_29 = 9
				local var_52_30 = utf8.len(var_52_28)
				local var_52_31 = var_52_29 <= 0 and var_52_25 or var_52_25 * (var_52_30 / var_52_29)

				if var_52_31 > 0 and var_52_25 < var_52_31 then
					arg_49_1.talkMaxDuration = var_52_31

					if var_52_31 + var_52_24 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_31 + var_52_24
					end
				end

				arg_49_1.text_.text = var_52_28
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071012", "story_v_out_103071.awb") ~= 0 then
					local var_52_32 = manager.audio:GetVoiceLength("story_v_out_103071", "103071012", "story_v_out_103071.awb") / 1000

					if var_52_32 + var_52_24 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_32 + var_52_24
					end

					if var_52_27.prefab_name ~= "" and arg_49_1.actors_[var_52_27.prefab_name] ~= nil then
						local var_52_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_27.prefab_name].transform, "story_v_out_103071", "103071012", "story_v_out_103071.awb")

						arg_49_1:RecordAudio("103071012", var_52_33)
						arg_49_1:RecordAudio("103071012", var_52_33)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_103071", "103071012", "story_v_out_103071.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_103071", "103071012", "story_v_out_103071.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_34 = math.max(var_52_25, arg_49_1.talkMaxDuration)

			if var_52_24 <= arg_49_1.time_ and arg_49_1.time_ < var_52_24 + var_52_34 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_24) / var_52_34

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_24 + var_52_34 and arg_49_1.time_ < var_52_24 + var_52_34 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play103071013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 103071013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play103071014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1148ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect1148ui_story == nil then
				arg_53_1.var_.characterEffect1148ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.1

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect1148ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1148ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect1148ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1148ui_story.fillRatio = var_56_5
			end

			local var_56_6 = arg_53_1.actors_["1148ui_story"].transform
			local var_56_7 = 0

			if var_56_7 < arg_53_1.time_ and arg_53_1.time_ <= var_56_7 + arg_56_0 then
				arg_53_1.var_.moveOldPos1148ui_story = var_56_6.localPosition
			end

			local var_56_8 = 0.001

			if var_56_7 <= arg_53_1.time_ and arg_53_1.time_ < var_56_7 + var_56_8 then
				local var_56_9 = (arg_53_1.time_ - var_56_7) / var_56_8
				local var_56_10 = Vector3.New(0, 100, 0)

				var_56_6.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1148ui_story, var_56_10, var_56_9)

				local var_56_11 = manager.ui.mainCamera.transform.position - var_56_6.position

				var_56_6.forward = Vector3.New(var_56_11.x, var_56_11.y, var_56_11.z)

				local var_56_12 = var_56_6.localEulerAngles

				var_56_12.z = 0
				var_56_12.x = 0
				var_56_6.localEulerAngles = var_56_12
			end

			if arg_53_1.time_ >= var_56_7 + var_56_8 and arg_53_1.time_ < var_56_7 + var_56_8 + arg_56_0 then
				var_56_6.localPosition = Vector3.New(0, 100, 0)

				local var_56_13 = manager.ui.mainCamera.transform.position - var_56_6.position

				var_56_6.forward = Vector3.New(var_56_13.x, var_56_13.y, var_56_13.z)

				local var_56_14 = var_56_6.localEulerAngles

				var_56_14.z = 0
				var_56_14.x = 0
				var_56_6.localEulerAngles = var_56_14
			end

			local var_56_15 = 0
			local var_56_16 = 0.625

			if var_56_15 < arg_53_1.time_ and arg_53_1.time_ <= var_56_15 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_17 = arg_53_1:GetWordFromCfg(103071013)
				local var_56_18 = arg_53_1:FormatText(var_56_17.content)

				arg_53_1.text_.text = var_56_18

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_19 = 25
				local var_56_20 = utf8.len(var_56_18)
				local var_56_21 = var_56_19 <= 0 and var_56_16 or var_56_16 * (var_56_20 / var_56_19)

				if var_56_21 > 0 and var_56_16 < var_56_21 then
					arg_53_1.talkMaxDuration = var_56_21

					if var_56_21 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_21 + var_56_15
					end
				end

				arg_53_1.text_.text = var_56_18
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_22 = math.max(var_56_16, arg_53_1.talkMaxDuration)

			if var_56_15 <= arg_53_1.time_ and arg_53_1.time_ < var_56_15 + var_56_22 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_15) / var_56_22

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_15 + var_56_22 and arg_53_1.time_ < var_56_15 + var_56_22 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play103071014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 103071014
		arg_57_1.duration_ = 4.4

		local var_57_0 = {
			ja = 4.4,
			ko = 2.866,
			zh = 3.166,
			en = 3.9
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
				arg_57_0:Play103071015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action4_1")
			end

			local var_60_1 = arg_57_1.actors_["1035ui_story"].transform
			local var_60_2 = 0

			if var_60_2 < arg_57_1.time_ and arg_57_1.time_ <= var_60_2 + arg_60_0 then
				arg_57_1.var_.moveOldPos1035ui_story = var_60_1.localPosition
			end

			local var_60_3 = 0.001

			if var_60_2 <= arg_57_1.time_ and arg_57_1.time_ < var_60_2 + var_60_3 then
				local var_60_4 = (arg_57_1.time_ - var_60_2) / var_60_3
				local var_60_5 = Vector3.New(0, -1.05, -5.6)

				var_60_1.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1035ui_story, var_60_5, var_60_4)

				local var_60_6 = manager.ui.mainCamera.transform.position - var_60_1.position

				var_60_1.forward = Vector3.New(var_60_6.x, var_60_6.y, var_60_6.z)

				local var_60_7 = var_60_1.localEulerAngles

				var_60_7.z = 0
				var_60_7.x = 0
				var_60_1.localEulerAngles = var_60_7
			end

			if arg_57_1.time_ >= var_60_2 + var_60_3 and arg_57_1.time_ < var_60_2 + var_60_3 + arg_60_0 then
				var_60_1.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_60_8 = manager.ui.mainCamera.transform.position - var_60_1.position

				var_60_1.forward = Vector3.New(var_60_8.x, var_60_8.y, var_60_8.z)

				local var_60_9 = var_60_1.localEulerAngles

				var_60_9.z = 0
				var_60_9.x = 0
				var_60_1.localEulerAngles = var_60_9
			end

			local var_60_10 = 0
			local var_60_11 = 0.175

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0

				arg_57_1.dialog_:SetActive(true)

				local var_60_12 = LeanTween.value(arg_57_1.dialog_, 0, 1, 0.3)

				var_60_12:setOnUpdate(LuaHelper.FloatAction(function(arg_61_0)
					arg_57_1.dialogCg_.alpha = arg_61_0
				end))
				var_60_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_57_1.dialog_)
					var_60_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_57_1.duration_ = arg_57_1.duration_ + 0.3

				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_13 = arg_57_1:FormatText(StoryNameCfg[21].name)

				arg_57_1.leftNameTxt_.text = var_60_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_14 = arg_57_1:GetWordFromCfg(103071014)
				local var_60_15 = arg_57_1:FormatText(var_60_14.content)

				arg_57_1.text_.text = var_60_15

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_16 = 7
				local var_60_17 = utf8.len(var_60_15)
				local var_60_18 = var_60_16 <= 0 and var_60_11 or var_60_11 * (var_60_17 / var_60_16)

				if var_60_18 > 0 and var_60_11 < var_60_18 then
					arg_57_1.talkMaxDuration = var_60_18
					var_60_10 = var_60_10 + 0.3

					if var_60_18 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_18 + var_60_10
					end
				end

				arg_57_1.text_.text = var_60_15
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071014", "story_v_out_103071.awb") ~= 0 then
					local var_60_19 = manager.audio:GetVoiceLength("story_v_out_103071", "103071014", "story_v_out_103071.awb") / 1000

					if var_60_19 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_19 + var_60_10
					end

					if var_60_14.prefab_name ~= "" and arg_57_1.actors_[var_60_14.prefab_name] ~= nil then
						local var_60_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_14.prefab_name].transform, "story_v_out_103071", "103071014", "story_v_out_103071.awb")

						arg_57_1:RecordAudio("103071014", var_60_20)
						arg_57_1:RecordAudio("103071014", var_60_20)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_103071", "103071014", "story_v_out_103071.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_103071", "103071014", "story_v_out_103071.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_21 = var_60_10 + 0.3
			local var_60_22 = math.max(var_60_11, arg_57_1.talkMaxDuration)

			if var_60_21 <= arg_57_1.time_ and arg_57_1.time_ < var_60_21 + var_60_22 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_21) / var_60_22

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_21 + var_60_22 and arg_57_1.time_ < var_60_21 + var_60_22 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play103071015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 103071015
		arg_63_1.duration_ = 4.633

		local var_63_0 = {
			ja = 3.8,
			ko = 3.766,
			zh = 2.066,
			en = 4.633
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
				arg_63_0:Play103071016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action4_2")
			end

			local var_66_1 = 0
			local var_66_2 = 0.275

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_3 = arg_63_1:FormatText(StoryNameCfg[21].name)

				arg_63_1.leftNameTxt_.text = var_66_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_4 = arg_63_1:GetWordFromCfg(103071015)
				local var_66_5 = arg_63_1:FormatText(var_66_4.content)

				arg_63_1.text_.text = var_66_5

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_6 = 11
				local var_66_7 = utf8.len(var_66_5)
				local var_66_8 = var_66_6 <= 0 and var_66_2 or var_66_2 * (var_66_7 / var_66_6)

				if var_66_8 > 0 and var_66_2 < var_66_8 then
					arg_63_1.talkMaxDuration = var_66_8

					if var_66_8 + var_66_1 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_1
					end
				end

				arg_63_1.text_.text = var_66_5
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071015", "story_v_out_103071.awb") ~= 0 then
					local var_66_9 = manager.audio:GetVoiceLength("story_v_out_103071", "103071015", "story_v_out_103071.awb") / 1000

					if var_66_9 + var_66_1 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_9 + var_66_1
					end

					if var_66_4.prefab_name ~= "" and arg_63_1.actors_[var_66_4.prefab_name] ~= nil then
						local var_66_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_4.prefab_name].transform, "story_v_out_103071", "103071015", "story_v_out_103071.awb")

						arg_63_1:RecordAudio("103071015", var_66_10)
						arg_63_1:RecordAudio("103071015", var_66_10)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_103071", "103071015", "story_v_out_103071.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_103071", "103071015", "story_v_out_103071.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_11 = math.max(var_66_2, arg_63_1.talkMaxDuration)

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_11 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_1) / var_66_11

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_1 + var_66_11 and arg_63_1.time_ < var_66_1 + var_66_11 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play103071016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 103071016
		arg_67_1.duration_ = 9.466

		local var_67_0 = {
			ja = 9.466,
			ko = 8.033,
			zh = 6.733,
			en = 7.766
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
				arg_67_0:Play103071017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1148ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1148ui_story == nil then
				arg_67_1.var_.characterEffect1148ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1148ui_story then
					arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1148ui_story then
				arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1148ui_story"].transform
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.var_.moveOldPos1148ui_story = var_70_4.localPosition
			end

			local var_70_6 = 0.001

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6
				local var_70_8 = Vector3.New(0, -0.8, -6.2)

				var_70_4.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1148ui_story, var_70_8, var_70_7)

				local var_70_9 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_9.x, var_70_9.y, var_70_9.z)

				local var_70_10 = var_70_4.localEulerAngles

				var_70_10.z = 0
				var_70_10.x = 0
				var_70_4.localEulerAngles = var_70_10
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 then
				var_70_4.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_4.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_4.localEulerAngles = var_70_12
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_70_14 = arg_67_1.actors_["1035ui_story"].transform
			local var_70_15 = 0

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				arg_67_1.var_.moveOldPos1035ui_story = var_70_14.localPosition
			end

			local var_70_16 = 0.001

			if var_70_15 <= arg_67_1.time_ and arg_67_1.time_ < var_70_15 + var_70_16 then
				local var_70_17 = (arg_67_1.time_ - var_70_15) / var_70_16
				local var_70_18 = Vector3.New(0, 100, 0)

				var_70_14.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1035ui_story, var_70_18, var_70_17)

				local var_70_19 = manager.ui.mainCamera.transform.position - var_70_14.position

				var_70_14.forward = Vector3.New(var_70_19.x, var_70_19.y, var_70_19.z)

				local var_70_20 = var_70_14.localEulerAngles

				var_70_20.z = 0
				var_70_20.x = 0
				var_70_14.localEulerAngles = var_70_20
			end

			if arg_67_1.time_ >= var_70_15 + var_70_16 and arg_67_1.time_ < var_70_15 + var_70_16 + arg_70_0 then
				var_70_14.localPosition = Vector3.New(0, 100, 0)

				local var_70_21 = manager.ui.mainCamera.transform.position - var_70_14.position

				var_70_14.forward = Vector3.New(var_70_21.x, var_70_21.y, var_70_21.z)

				local var_70_22 = var_70_14.localEulerAngles

				var_70_22.z = 0
				var_70_22.x = 0
				var_70_14.localEulerAngles = var_70_22
			end

			local var_70_23 = 0

			if var_70_23 < arg_67_1.time_ and arg_67_1.time_ <= var_70_23 + arg_70_0 then
				arg_67_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_70_24 = 0
			local var_70_25 = 0.8

			if var_70_24 < arg_67_1.time_ and arg_67_1.time_ <= var_70_24 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_26 = arg_67_1:FormatText(StoryNameCfg[8].name)

				arg_67_1.leftNameTxt_.text = var_70_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_27 = arg_67_1:GetWordFromCfg(103071016)
				local var_70_28 = arg_67_1:FormatText(var_70_27.content)

				arg_67_1.text_.text = var_70_28

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_29 = 32
				local var_70_30 = utf8.len(var_70_28)
				local var_70_31 = var_70_29 <= 0 and var_70_25 or var_70_25 * (var_70_30 / var_70_29)

				if var_70_31 > 0 and var_70_25 < var_70_31 then
					arg_67_1.talkMaxDuration = var_70_31

					if var_70_31 + var_70_24 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_31 + var_70_24
					end
				end

				arg_67_1.text_.text = var_70_28
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071016", "story_v_out_103071.awb") ~= 0 then
					local var_70_32 = manager.audio:GetVoiceLength("story_v_out_103071", "103071016", "story_v_out_103071.awb") / 1000

					if var_70_32 + var_70_24 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_32 + var_70_24
					end

					if var_70_27.prefab_name ~= "" and arg_67_1.actors_[var_70_27.prefab_name] ~= nil then
						local var_70_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_27.prefab_name].transform, "story_v_out_103071", "103071016", "story_v_out_103071.awb")

						arg_67_1:RecordAudio("103071016", var_70_33)
						arg_67_1:RecordAudio("103071016", var_70_33)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_103071", "103071016", "story_v_out_103071.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_103071", "103071016", "story_v_out_103071.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_34 = math.max(var_70_25, arg_67_1.talkMaxDuration)

			if var_70_24 <= arg_67_1.time_ and arg_67_1.time_ < var_70_24 + var_70_34 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_24) / var_70_34

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_24 + var_70_34 and arg_67_1.time_ < var_70_24 + var_70_34 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play103071017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 103071017
		arg_71_1.duration_ = 11.933

		local var_71_0 = {
			ja = 11.666,
			ko = 11.933,
			zh = 7.7,
			en = 10.466
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
				arg_71_0:Play103071018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				local var_74_2 = "play"
				local var_74_3 = "effect"

				arg_71_1:AudioAction(var_74_2, var_74_3, "se_story_3", "se_story_3_snipe", "")
			end

			local var_74_4 = arg_71_1.actors_["1148ui_story"].transform
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 then
				arg_71_1.var_.moveOldPos1148ui_story = var_74_4.localPosition
			end

			local var_74_6 = 0.001

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6
				local var_74_8 = Vector3.New(0, 100, 0)

				var_74_4.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1148ui_story, var_74_8, var_74_7)

				local var_74_9 = manager.ui.mainCamera.transform.position - var_74_4.position

				var_74_4.forward = Vector3.New(var_74_9.x, var_74_9.y, var_74_9.z)

				local var_74_10 = var_74_4.localEulerAngles

				var_74_10.z = 0
				var_74_10.x = 0
				var_74_4.localEulerAngles = var_74_10
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 then
				var_74_4.localPosition = Vector3.New(0, 100, 0)

				local var_74_11 = manager.ui.mainCamera.transform.position - var_74_4.position

				var_74_4.forward = Vector3.New(var_74_11.x, var_74_11.y, var_74_11.z)

				local var_74_12 = var_74_4.localEulerAngles

				var_74_12.z = 0
				var_74_12.x = 0
				var_74_4.localEulerAngles = var_74_12
			end

			local var_74_13 = arg_71_1.actors_["1035ui_story"].transform
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1.var_.moveOldPos1035ui_story = var_74_13.localPosition
			end

			local var_74_15 = 0.001

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_15 then
				local var_74_16 = (arg_71_1.time_ - var_74_14) / var_74_15
				local var_74_17 = Vector3.New(0, -1.05, -5.6)

				var_74_13.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1035ui_story, var_74_17, var_74_16)

				local var_74_18 = manager.ui.mainCamera.transform.position - var_74_13.position

				var_74_13.forward = Vector3.New(var_74_18.x, var_74_18.y, var_74_18.z)

				local var_74_19 = var_74_13.localEulerAngles

				var_74_19.z = 0
				var_74_19.x = 0
				var_74_13.localEulerAngles = var_74_19
			end

			if arg_71_1.time_ >= var_74_14 + var_74_15 and arg_71_1.time_ < var_74_14 + var_74_15 + arg_74_0 then
				var_74_13.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_74_20 = manager.ui.mainCamera.transform.position - var_74_13.position

				var_74_13.forward = Vector3.New(var_74_20.x, var_74_20.y, var_74_20.z)

				local var_74_21 = var_74_13.localEulerAngles

				var_74_21.z = 0
				var_74_21.x = 0
				var_74_13.localEulerAngles = var_74_21
			end

			local var_74_22 = 0

			if var_74_22 < arg_71_1.time_ and arg_71_1.time_ <= var_74_22 + arg_74_0 then
				arg_71_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action2_1")
			end

			local var_74_23 = 1.5

			if var_74_23 < arg_71_1.time_ and arg_71_1.time_ <= var_74_23 + arg_74_0 then
				arg_71_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035actionlink/1035action423")
			end

			local var_74_24 = manager.ui.mainCamera.transform
			local var_74_25 = 1.025

			if var_74_25 < arg_71_1.time_ and arg_71_1.time_ <= var_74_25 + arg_74_0 then
				arg_71_1.var_.shakeOldPos = var_74_24.localPosition
			end

			local var_74_26 = 0.4

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_26 then
				local var_74_27 = (arg_71_1.time_ - var_74_25) / 0.099
				local var_74_28, var_74_29 = math.modf(var_74_27)

				var_74_24.localPosition = Vector3.New(var_74_29 * 0.13, var_74_29 * 0.13, var_74_29 * 0.13) + arg_71_1.var_.shakeOldPos
			end

			if arg_71_1.time_ >= var_74_25 + var_74_26 and arg_71_1.time_ < var_74_25 + var_74_26 + arg_74_0 then
				var_74_24.localPosition = arg_71_1.var_.shakeOldPos
			end

			local var_74_30 = 0
			local var_74_31 = 1.025

			if var_74_30 < arg_71_1.time_ and arg_71_1.time_ <= var_74_30 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_32 = arg_71_1:FormatText(StoryNameCfg[21].name)

				arg_71_1.leftNameTxt_.text = var_74_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_33 = arg_71_1:GetWordFromCfg(103071017)
				local var_74_34 = arg_71_1:FormatText(var_74_33.content)

				arg_71_1.text_.text = var_74_34

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_35 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071017", "story_v_out_103071.awb") ~= 0 then
					local var_74_38 = manager.audio:GetVoiceLength("story_v_out_103071", "103071017", "story_v_out_103071.awb") / 1000

					if var_74_38 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_38 + var_74_30
					end

					if var_74_33.prefab_name ~= "" and arg_71_1.actors_[var_74_33.prefab_name] ~= nil then
						local var_74_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_33.prefab_name].transform, "story_v_out_103071", "103071017", "story_v_out_103071.awb")

						arg_71_1:RecordAudio("103071017", var_74_39)
						arg_71_1:RecordAudio("103071017", var_74_39)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_103071", "103071017", "story_v_out_103071.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_103071", "103071017", "story_v_out_103071.awb")
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
	Play103071018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 103071018
		arg_75_1.duration_ = 5.666

		local var_75_0 = {
			ja = 5.666,
			ko = 4.6,
			zh = 3.666,
			en = 4.933
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
				arg_75_0:Play103071019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1148ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1148ui_story == nil then
				arg_75_1.var_.characterEffect1148ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1148ui_story then
					arg_75_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1148ui_story then
				arg_75_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_78_4 = 0

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action497")
			end

			local var_78_5 = arg_75_1.actors_["1148ui_story"].transform
			local var_78_6 = 0

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.var_.moveOldPos1148ui_story = var_78_5.localPosition
			end

			local var_78_7 = 0.001

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_7 then
				local var_78_8 = (arg_75_1.time_ - var_78_6) / var_78_7
				local var_78_9 = Vector3.New(0, -0.8, -6.2)

				var_78_5.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1148ui_story, var_78_9, var_78_8)

				local var_78_10 = manager.ui.mainCamera.transform.position - var_78_5.position

				var_78_5.forward = Vector3.New(var_78_10.x, var_78_10.y, var_78_10.z)

				local var_78_11 = var_78_5.localEulerAngles

				var_78_11.z = 0
				var_78_11.x = 0
				var_78_5.localEulerAngles = var_78_11
			end

			if arg_75_1.time_ >= var_78_6 + var_78_7 and arg_75_1.time_ < var_78_6 + var_78_7 + arg_78_0 then
				var_78_5.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_78_12 = manager.ui.mainCamera.transform.position - var_78_5.position

				var_78_5.forward = Vector3.New(var_78_12.x, var_78_12.y, var_78_12.z)

				local var_78_13 = var_78_5.localEulerAngles

				var_78_13.z = 0
				var_78_13.x = 0
				var_78_5.localEulerAngles = var_78_13
			end

			local var_78_14 = arg_75_1.actors_["1035ui_story"].transform
			local var_78_15 = 0

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1.var_.moveOldPos1035ui_story = var_78_14.localPosition
			end

			local var_78_16 = 0.001

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_16 then
				local var_78_17 = (arg_75_1.time_ - var_78_15) / var_78_16
				local var_78_18 = Vector3.New(0, 100, 0)

				var_78_14.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1035ui_story, var_78_18, var_78_17)

				local var_78_19 = manager.ui.mainCamera.transform.position - var_78_14.position

				var_78_14.forward = Vector3.New(var_78_19.x, var_78_19.y, var_78_19.z)

				local var_78_20 = var_78_14.localEulerAngles

				var_78_20.z = 0
				var_78_20.x = 0
				var_78_14.localEulerAngles = var_78_20
			end

			if arg_75_1.time_ >= var_78_15 + var_78_16 and arg_75_1.time_ < var_78_15 + var_78_16 + arg_78_0 then
				var_78_14.localPosition = Vector3.New(0, 100, 0)

				local var_78_21 = manager.ui.mainCamera.transform.position - var_78_14.position

				var_78_14.forward = Vector3.New(var_78_21.x, var_78_21.y, var_78_21.z)

				local var_78_22 = var_78_14.localEulerAngles

				var_78_22.z = 0
				var_78_22.x = 0
				var_78_14.localEulerAngles = var_78_22
			end

			local var_78_23 = 0

			if var_78_23 < arg_75_1.time_ and arg_75_1.time_ <= var_78_23 + arg_78_0 then
				arg_75_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_78_24 = 0
			local var_78_25 = 0.35

			if var_78_24 < arg_75_1.time_ and arg_75_1.time_ <= var_78_24 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_26 = arg_75_1:FormatText(StoryNameCfg[8].name)

				arg_75_1.leftNameTxt_.text = var_78_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_27 = arg_75_1:GetWordFromCfg(103071018)
				local var_78_28 = arg_75_1:FormatText(var_78_27.content)

				arg_75_1.text_.text = var_78_28

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_29 = 14
				local var_78_30 = utf8.len(var_78_28)
				local var_78_31 = var_78_29 <= 0 and var_78_25 or var_78_25 * (var_78_30 / var_78_29)

				if var_78_31 > 0 and var_78_25 < var_78_31 then
					arg_75_1.talkMaxDuration = var_78_31

					if var_78_31 + var_78_24 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_31 + var_78_24
					end
				end

				arg_75_1.text_.text = var_78_28
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071018", "story_v_out_103071.awb") ~= 0 then
					local var_78_32 = manager.audio:GetVoiceLength("story_v_out_103071", "103071018", "story_v_out_103071.awb") / 1000

					if var_78_32 + var_78_24 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_32 + var_78_24
					end

					if var_78_27.prefab_name ~= "" and arg_75_1.actors_[var_78_27.prefab_name] ~= nil then
						local var_78_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_27.prefab_name].transform, "story_v_out_103071", "103071018", "story_v_out_103071.awb")

						arg_75_1:RecordAudio("103071018", var_78_33)
						arg_75_1:RecordAudio("103071018", var_78_33)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_103071", "103071018", "story_v_out_103071.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_103071", "103071018", "story_v_out_103071.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_34 = math.max(var_78_25, arg_75_1.talkMaxDuration)

			if var_78_24 <= arg_75_1.time_ and arg_75_1.time_ < var_78_24 + var_78_34 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_24) / var_78_34

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_24 + var_78_34 and arg_75_1.time_ < var_78_24 + var_78_34 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play103071019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 103071019
		arg_79_1.duration_ = 4.533

		local var_79_0 = {
			ja = 4.066,
			ko = 4.533,
			zh = 3.533,
			en = 2.733
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
				arg_79_0:Play103071020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1059ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1059ui_story == nil then
				arg_79_1.var_.characterEffect1059ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1059ui_story then
					arg_79_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1059ui_story then
				arg_79_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["1148ui_story"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect1148ui_story == nil then
				arg_79_1.var_.characterEffect1148ui_story = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.1

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect1148ui_story then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1148ui_story.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect1148ui_story then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1148ui_story.fillRatio = var_82_9
			end

			local var_82_10 = arg_79_1.actors_["1148ui_story"].transform
			local var_82_11 = 0.033

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1.var_.moveOldPos1148ui_story = var_82_10.localPosition
			end

			local var_82_12 = 0.5

			if var_82_11 <= arg_79_1.time_ and arg_79_1.time_ < var_82_11 + var_82_12 then
				local var_82_13 = (arg_79_1.time_ - var_82_11) / var_82_12
				local var_82_14 = Vector3.New(-0.7, -0.8, -6.2)

				var_82_10.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1148ui_story, var_82_14, var_82_13)

				local var_82_15 = manager.ui.mainCamera.transform.position - var_82_10.position

				var_82_10.forward = Vector3.New(var_82_15.x, var_82_15.y, var_82_15.z)

				local var_82_16 = var_82_10.localEulerAngles

				var_82_16.z = 0
				var_82_16.x = 0
				var_82_10.localEulerAngles = var_82_16
			end

			if arg_79_1.time_ >= var_82_11 + var_82_12 and arg_79_1.time_ < var_82_11 + var_82_12 + arg_82_0 then
				var_82_10.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_82_17 = manager.ui.mainCamera.transform.position - var_82_10.position

				var_82_10.forward = Vector3.New(var_82_17.x, var_82_17.y, var_82_17.z)

				local var_82_18 = var_82_10.localEulerAngles

				var_82_18.z = 0
				var_82_18.x = 0
				var_82_10.localEulerAngles = var_82_18
			end

			local var_82_19 = arg_79_1.actors_["1148ui_story"].transform
			local var_82_20 = 0

			if var_82_20 < arg_79_1.time_ and arg_79_1.time_ <= var_82_20 + arg_82_0 then
				arg_79_1.var_.moveOldPos1148ui_story = var_82_19.localPosition
			end

			local var_82_21 = 0.001

			if var_82_20 <= arg_79_1.time_ and arg_79_1.time_ < var_82_20 + var_82_21 then
				local var_82_22 = (arg_79_1.time_ - var_82_20) / var_82_21
				local var_82_23 = Vector3.New(0, -0.8, -6.2)

				var_82_19.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1148ui_story, var_82_23, var_82_22)

				local var_82_24 = manager.ui.mainCamera.transform.position - var_82_19.position

				var_82_19.forward = Vector3.New(var_82_24.x, var_82_24.y, var_82_24.z)

				local var_82_25 = var_82_19.localEulerAngles

				var_82_25.z = 0
				var_82_25.x = 0
				var_82_19.localEulerAngles = var_82_25
			end

			if arg_79_1.time_ >= var_82_20 + var_82_21 and arg_79_1.time_ < var_82_20 + var_82_21 + arg_82_0 then
				var_82_19.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_82_26 = manager.ui.mainCamera.transform.position - var_82_19.position

				var_82_19.forward = Vector3.New(var_82_26.x, var_82_26.y, var_82_26.z)

				local var_82_27 = var_82_19.localEulerAngles

				var_82_27.z = 0
				var_82_27.x = 0
				var_82_19.localEulerAngles = var_82_27
			end

			local var_82_28 = arg_79_1.actors_["1059ui_story"].transform
			local var_82_29 = 0

			if var_82_29 < arg_79_1.time_ and arg_79_1.time_ <= var_82_29 + arg_82_0 then
				arg_79_1.var_.moveOldPos1059ui_story = var_82_28.localPosition
			end

			local var_82_30 = 0.001

			if var_82_29 <= arg_79_1.time_ and arg_79_1.time_ < var_82_29 + var_82_30 then
				local var_82_31 = (arg_79_1.time_ - var_82_29) / var_82_30
				local var_82_32 = Vector3.New(0.7, -1.05, -6)

				var_82_28.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1059ui_story, var_82_32, var_82_31)

				local var_82_33 = manager.ui.mainCamera.transform.position - var_82_28.position

				var_82_28.forward = Vector3.New(var_82_33.x, var_82_33.y, var_82_33.z)

				local var_82_34 = var_82_28.localEulerAngles

				var_82_34.z = 0
				var_82_34.x = 0
				var_82_28.localEulerAngles = var_82_34
			end

			if arg_79_1.time_ >= var_82_29 + var_82_30 and arg_79_1.time_ < var_82_29 + var_82_30 + arg_82_0 then
				var_82_28.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_82_35 = manager.ui.mainCamera.transform.position - var_82_28.position

				var_82_28.forward = Vector3.New(var_82_35.x, var_82_35.y, var_82_35.z)

				local var_82_36 = var_82_28.localEulerAngles

				var_82_36.z = 0
				var_82_36.x = 0
				var_82_28.localEulerAngles = var_82_36
			end

			local var_82_37 = 0

			if var_82_37 < arg_79_1.time_ and arg_79_1.time_ <= var_82_37 + arg_82_0 then
				arg_79_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action7_1")
			end

			local var_82_38 = 0

			if var_82_38 < arg_79_1.time_ and arg_79_1.time_ <= var_82_38 + arg_82_0 then
				arg_79_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_82_39 = 0
			local var_82_40 = 0.375

			if var_82_39 < arg_79_1.time_ and arg_79_1.time_ <= var_82_39 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_41 = arg_79_1:FormatText(StoryNameCfg[28].name)

				arg_79_1.leftNameTxt_.text = var_82_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_42 = arg_79_1:GetWordFromCfg(103071019)
				local var_82_43 = arg_79_1:FormatText(var_82_42.content)

				arg_79_1.text_.text = var_82_43

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_44 = 15
				local var_82_45 = utf8.len(var_82_43)
				local var_82_46 = var_82_44 <= 0 and var_82_40 or var_82_40 * (var_82_45 / var_82_44)

				if var_82_46 > 0 and var_82_40 < var_82_46 then
					arg_79_1.talkMaxDuration = var_82_46

					if var_82_46 + var_82_39 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_46 + var_82_39
					end
				end

				arg_79_1.text_.text = var_82_43
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071019", "story_v_out_103071.awb") ~= 0 then
					local var_82_47 = manager.audio:GetVoiceLength("story_v_out_103071", "103071019", "story_v_out_103071.awb") / 1000

					if var_82_47 + var_82_39 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_47 + var_82_39
					end

					if var_82_42.prefab_name ~= "" and arg_79_1.actors_[var_82_42.prefab_name] ~= nil then
						local var_82_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_42.prefab_name].transform, "story_v_out_103071", "103071019", "story_v_out_103071.awb")

						arg_79_1:RecordAudio("103071019", var_82_48)
						arg_79_1:RecordAudio("103071019", var_82_48)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_103071", "103071019", "story_v_out_103071.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_103071", "103071019", "story_v_out_103071.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_49 = math.max(var_82_40, arg_79_1.talkMaxDuration)

			if var_82_39 <= arg_79_1.time_ and arg_79_1.time_ < var_82_39 + var_82_49 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_39) / var_82_49

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_39 + var_82_49 and arg_79_1.time_ < var_82_39 + var_82_49 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play103071020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 103071020
		arg_83_1.duration_ = 9

		local var_83_0 = {
			ja = 9,
			ko = 7.1,
			zh = 5.9,
			en = 8.9
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
				arg_83_0:Play103071021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1148ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1148ui_story == nil then
				arg_83_1.var_.characterEffect1148ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.1

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1148ui_story then
					arg_83_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1148ui_story then
				arg_83_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_86_4 = arg_83_1.actors_["1059ui_story"]
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story == nil then
				arg_83_1.var_.characterEffect1059ui_story = var_86_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_6 = 0.1

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6

				if arg_83_1.var_.characterEffect1059ui_story then
					local var_86_8 = Mathf.Lerp(0, 0.5, var_86_7)

					arg_83_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1059ui_story.fillRatio = var_86_8
				end
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story then
				local var_86_9 = 0.5

				arg_83_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1059ui_story.fillRatio = var_86_9
			end

			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action473")
			end

			local var_86_11 = 0

			if var_86_11 < arg_83_1.time_ and arg_83_1.time_ <= var_86_11 + arg_86_0 then
				arg_83_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_86_12 = 0
			local var_86_13 = 0.7

			if var_86_12 < arg_83_1.time_ and arg_83_1.time_ <= var_86_12 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_14 = arg_83_1:FormatText(StoryNameCfg[8].name)

				arg_83_1.leftNameTxt_.text = var_86_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_15 = arg_83_1:GetWordFromCfg(103071020)
				local var_86_16 = arg_83_1:FormatText(var_86_15.content)

				arg_83_1.text_.text = var_86_16

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_17 = 28
				local var_86_18 = utf8.len(var_86_16)
				local var_86_19 = var_86_17 <= 0 and var_86_13 or var_86_13 * (var_86_18 / var_86_17)

				if var_86_19 > 0 and var_86_13 < var_86_19 then
					arg_83_1.talkMaxDuration = var_86_19

					if var_86_19 + var_86_12 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_19 + var_86_12
					end
				end

				arg_83_1.text_.text = var_86_16
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071020", "story_v_out_103071.awb") ~= 0 then
					local var_86_20 = manager.audio:GetVoiceLength("story_v_out_103071", "103071020", "story_v_out_103071.awb") / 1000

					if var_86_20 + var_86_12 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_20 + var_86_12
					end

					if var_86_15.prefab_name ~= "" and arg_83_1.actors_[var_86_15.prefab_name] ~= nil then
						local var_86_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_15.prefab_name].transform, "story_v_out_103071", "103071020", "story_v_out_103071.awb")

						arg_83_1:RecordAudio("103071020", var_86_21)
						arg_83_1:RecordAudio("103071020", var_86_21)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_103071", "103071020", "story_v_out_103071.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_103071", "103071020", "story_v_out_103071.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_22 = math.max(var_86_13, arg_83_1.talkMaxDuration)

			if var_86_12 <= arg_83_1.time_ and arg_83_1.time_ < var_86_12 + var_86_22 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_12) / var_86_22

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_12 + var_86_22 and arg_83_1.time_ < var_86_12 + var_86_22 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play103071021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 103071021
		arg_87_1.duration_ = 6.1

		local var_87_0 = {
			ja = 6.1,
			ko = 4.833,
			zh = 3.133,
			en = 3.833
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
				arg_87_0:Play103071022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1035ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1035ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, -1.05, -5.6)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1035ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1059ui_story"].transform
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.var_.moveOldPos1059ui_story = var_90_9.localPosition
			end

			local var_90_11 = 0.001

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11
				local var_90_13 = Vector3.New(0, 100, 0)

				var_90_9.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1059ui_story, var_90_13, var_90_12)

				local var_90_14 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_14.x, var_90_14.y, var_90_14.z)

				local var_90_15 = var_90_9.localEulerAngles

				var_90_15.z = 0
				var_90_15.x = 0
				var_90_9.localEulerAngles = var_90_15
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 then
				var_90_9.localPosition = Vector3.New(0, 100, 0)

				local var_90_16 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_16.x, var_90_16.y, var_90_16.z)

				local var_90_17 = var_90_9.localEulerAngles

				var_90_17.z = 0
				var_90_17.x = 0
				var_90_9.localEulerAngles = var_90_17
			end

			local var_90_18 = arg_87_1.actors_["1148ui_story"].transform
			local var_90_19 = 0

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.var_.moveOldPos1148ui_story = var_90_18.localPosition
			end

			local var_90_20 = 0.001

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_20 then
				local var_90_21 = (arg_87_1.time_ - var_90_19) / var_90_20
				local var_90_22 = Vector3.New(0, 100, 0)

				var_90_18.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1148ui_story, var_90_22, var_90_21)

				local var_90_23 = manager.ui.mainCamera.transform.position - var_90_18.position

				var_90_18.forward = Vector3.New(var_90_23.x, var_90_23.y, var_90_23.z)

				local var_90_24 = var_90_18.localEulerAngles

				var_90_24.z = 0
				var_90_24.x = 0
				var_90_18.localEulerAngles = var_90_24
			end

			if arg_87_1.time_ >= var_90_19 + var_90_20 and arg_87_1.time_ < var_90_19 + var_90_20 + arg_90_0 then
				var_90_18.localPosition = Vector3.New(0, 100, 0)

				local var_90_25 = manager.ui.mainCamera.transform.position - var_90_18.position

				var_90_18.forward = Vector3.New(var_90_25.x, var_90_25.y, var_90_25.z)

				local var_90_26 = var_90_18.localEulerAngles

				var_90_26.z = 0
				var_90_26.x = 0
				var_90_18.localEulerAngles = var_90_26
			end

			local var_90_27 = 0

			if var_90_27 < arg_87_1.time_ and arg_87_1.time_ <= var_90_27 + arg_90_0 then
				arg_87_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action11_1")
			end

			local var_90_28 = arg_87_1.actors_["1035ui_story"]
			local var_90_29 = 0

			if var_90_29 < arg_87_1.time_ and arg_87_1.time_ <= var_90_29 + arg_90_0 and arg_87_1.var_.characterEffect1035ui_story == nil then
				arg_87_1.var_.characterEffect1035ui_story = var_90_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_30 = 0.2

			if var_90_29 <= arg_87_1.time_ and arg_87_1.time_ < var_90_29 + var_90_30 then
				local var_90_31 = (arg_87_1.time_ - var_90_29) / var_90_30

				if arg_87_1.var_.characterEffect1035ui_story then
					arg_87_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_29 + var_90_30 and arg_87_1.time_ < var_90_29 + var_90_30 + arg_90_0 and arg_87_1.var_.characterEffect1035ui_story then
				arg_87_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_90_32 = 0
			local var_90_33 = 0.375

			if var_90_32 < arg_87_1.time_ and arg_87_1.time_ <= var_90_32 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_34 = arg_87_1:FormatText(StoryNameCfg[21].name)

				arg_87_1.leftNameTxt_.text = var_90_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_35 = arg_87_1:GetWordFromCfg(103071021)
				local var_90_36 = arg_87_1:FormatText(var_90_35.content)

				arg_87_1.text_.text = var_90_36

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_37 = 15
				local var_90_38 = utf8.len(var_90_36)
				local var_90_39 = var_90_37 <= 0 and var_90_33 or var_90_33 * (var_90_38 / var_90_37)

				if var_90_39 > 0 and var_90_33 < var_90_39 then
					arg_87_1.talkMaxDuration = var_90_39

					if var_90_39 + var_90_32 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_39 + var_90_32
					end
				end

				arg_87_1.text_.text = var_90_36
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071021", "story_v_out_103071.awb") ~= 0 then
					local var_90_40 = manager.audio:GetVoiceLength("story_v_out_103071", "103071021", "story_v_out_103071.awb") / 1000

					if var_90_40 + var_90_32 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_40 + var_90_32
					end

					if var_90_35.prefab_name ~= "" and arg_87_1.actors_[var_90_35.prefab_name] ~= nil then
						local var_90_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_35.prefab_name].transform, "story_v_out_103071", "103071021", "story_v_out_103071.awb")

						arg_87_1:RecordAudio("103071021", var_90_41)
						arg_87_1:RecordAudio("103071021", var_90_41)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_103071", "103071021", "story_v_out_103071.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_103071", "103071021", "story_v_out_103071.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_42 = math.max(var_90_33, arg_87_1.talkMaxDuration)

			if var_90_32 <= arg_87_1.time_ and arg_87_1.time_ < var_90_32 + var_90_42 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_32) / var_90_42

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_32 + var_90_42 and arg_87_1.time_ < var_90_32 + var_90_42 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play103071022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 103071022
		arg_91_1.duration_ = 6.6

		local var_91_0 = {
			ja = 6.6,
			ko = 5.266,
			zh = 4.2,
			en = 5.433
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
				arg_91_0:Play103071023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035actionlink/1035action442")
			end

			local var_94_1 = 0
			local var_94_2 = 0.475

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_3 = arg_91_1:FormatText(StoryNameCfg[21].name)

				arg_91_1.leftNameTxt_.text = var_94_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_4 = arg_91_1:GetWordFromCfg(103071022)
				local var_94_5 = arg_91_1:FormatText(var_94_4.content)

				arg_91_1.text_.text = var_94_5

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_6 = 19
				local var_94_7 = utf8.len(var_94_5)
				local var_94_8 = var_94_6 <= 0 and var_94_2 or var_94_2 * (var_94_7 / var_94_6)

				if var_94_8 > 0 and var_94_2 < var_94_8 then
					arg_91_1.talkMaxDuration = var_94_8

					if var_94_8 + var_94_1 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_1
					end
				end

				arg_91_1.text_.text = var_94_5
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071022", "story_v_out_103071.awb") ~= 0 then
					local var_94_9 = manager.audio:GetVoiceLength("story_v_out_103071", "103071022", "story_v_out_103071.awb") / 1000

					if var_94_9 + var_94_1 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_9 + var_94_1
					end

					if var_94_4.prefab_name ~= "" and arg_91_1.actors_[var_94_4.prefab_name] ~= nil then
						local var_94_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_4.prefab_name].transform, "story_v_out_103071", "103071022", "story_v_out_103071.awb")

						arg_91_1:RecordAudio("103071022", var_94_10)
						arg_91_1:RecordAudio("103071022", var_94_10)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_103071", "103071022", "story_v_out_103071.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_103071", "103071022", "story_v_out_103071.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_11 = math.max(var_94_2, arg_91_1.talkMaxDuration)

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_11 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_1) / var_94_11

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_1 + var_94_11 and arg_91_1.time_ < var_94_1 + var_94_11 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play103071023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 103071023
		arg_95_1.duration_ = 9.033

		local var_95_0 = {
			ja = 9.033,
			ko = 6.066,
			zh = 6.933,
			en = 6.133
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
				arg_95_0:Play103071024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035actionlink/1035action426")
			end

			local var_98_1 = 1.5

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035actionlink/1035action467")
			end

			local var_98_2 = 0
			local var_98_3 = 0.675

			if var_98_2 < arg_95_1.time_ and arg_95_1.time_ <= var_98_2 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_4 = arg_95_1:FormatText(StoryNameCfg[21].name)

				arg_95_1.leftNameTxt_.text = var_98_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_5 = arg_95_1:GetWordFromCfg(103071023)
				local var_98_6 = arg_95_1:FormatText(var_98_5.content)

				arg_95_1.text_.text = var_98_6

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_7 = 27
				local var_98_8 = utf8.len(var_98_6)
				local var_98_9 = var_98_7 <= 0 and var_98_3 or var_98_3 * (var_98_8 / var_98_7)

				if var_98_9 > 0 and var_98_3 < var_98_9 then
					arg_95_1.talkMaxDuration = var_98_9

					if var_98_9 + var_98_2 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_9 + var_98_2
					end
				end

				arg_95_1.text_.text = var_98_6
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071023", "story_v_out_103071.awb") ~= 0 then
					local var_98_10 = manager.audio:GetVoiceLength("story_v_out_103071", "103071023", "story_v_out_103071.awb") / 1000

					if var_98_10 + var_98_2 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_10 + var_98_2
					end

					if var_98_5.prefab_name ~= "" and arg_95_1.actors_[var_98_5.prefab_name] ~= nil then
						local var_98_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_5.prefab_name].transform, "story_v_out_103071", "103071023", "story_v_out_103071.awb")

						arg_95_1:RecordAudio("103071023", var_98_11)
						arg_95_1:RecordAudio("103071023", var_98_11)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_103071", "103071023", "story_v_out_103071.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_103071", "103071023", "story_v_out_103071.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_12 = math.max(var_98_3, arg_95_1.talkMaxDuration)

			if var_98_2 <= arg_95_1.time_ and arg_95_1.time_ < var_98_2 + var_98_12 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_2) / var_98_12

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_2 + var_98_12 and arg_95_1.time_ < var_98_2 + var_98_12 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play103071024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 103071024
		arg_99_1.duration_ = 2.9

		local var_99_0 = {
			ja = 1.999999999999,
			ko = 2.533,
			zh = 1.999999999999,
			en = 2.9
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
				arg_99_0:Play103071025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1148ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1148ui_story == nil then
				arg_99_1.var_.characterEffect1148ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.1

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1148ui_story then
					arg_99_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1148ui_story then
				arg_99_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["1148ui_story"].transform
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1.var_.moveOldPos1148ui_story = var_102_4.localPosition
			end

			local var_102_6 = 0.001

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6
				local var_102_8 = Vector3.New(-0.7, -0.8, -6.2)

				var_102_4.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1148ui_story, var_102_8, var_102_7)

				local var_102_9 = manager.ui.mainCamera.transform.position - var_102_4.position

				var_102_4.forward = Vector3.New(var_102_9.x, var_102_9.y, var_102_9.z)

				local var_102_10 = var_102_4.localEulerAngles

				var_102_10.z = 0
				var_102_10.x = 0
				var_102_4.localEulerAngles = var_102_10
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 then
				var_102_4.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_102_11 = manager.ui.mainCamera.transform.position - var_102_4.position

				var_102_4.forward = Vector3.New(var_102_11.x, var_102_11.y, var_102_11.z)

				local var_102_12 = var_102_4.localEulerAngles

				var_102_12.z = 0
				var_102_12.x = 0
				var_102_4.localEulerAngles = var_102_12
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_102_14 = arg_99_1.actors_["1035ui_story"].transform
			local var_102_15 = 0

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.var_.moveOldPos1035ui_story = var_102_14.localPosition
			end

			local var_102_16 = 0.001

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_16 then
				local var_102_17 = (arg_99_1.time_ - var_102_15) / var_102_16
				local var_102_18 = Vector3.New(0, 100, 0)

				var_102_14.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1035ui_story, var_102_18, var_102_17)

				local var_102_19 = manager.ui.mainCamera.transform.position - var_102_14.position

				var_102_14.forward = Vector3.New(var_102_19.x, var_102_19.y, var_102_19.z)

				local var_102_20 = var_102_14.localEulerAngles

				var_102_20.z = 0
				var_102_20.x = 0
				var_102_14.localEulerAngles = var_102_20
			end

			if arg_99_1.time_ >= var_102_15 + var_102_16 and arg_99_1.time_ < var_102_15 + var_102_16 + arg_102_0 then
				var_102_14.localPosition = Vector3.New(0, 100, 0)

				local var_102_21 = manager.ui.mainCamera.transform.position - var_102_14.position

				var_102_14.forward = Vector3.New(var_102_21.x, var_102_21.y, var_102_21.z)

				local var_102_22 = var_102_14.localEulerAngles

				var_102_22.z = 0
				var_102_22.x = 0
				var_102_14.localEulerAngles = var_102_22
			end

			local var_102_23 = 0

			if var_102_23 < arg_99_1.time_ and arg_99_1.time_ <= var_102_23 + arg_102_0 then
				arg_99_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_102_24 = 0
			local var_102_25 = 0.2

			if var_102_24 < arg_99_1.time_ and arg_99_1.time_ <= var_102_24 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_26 = arg_99_1:FormatText(StoryNameCfg[8].name)

				arg_99_1.leftNameTxt_.text = var_102_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_27 = arg_99_1:GetWordFromCfg(103071024)
				local var_102_28 = arg_99_1:FormatText(var_102_27.content)

				arg_99_1.text_.text = var_102_28

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_29 = 8
				local var_102_30 = utf8.len(var_102_28)
				local var_102_31 = var_102_29 <= 0 and var_102_25 or var_102_25 * (var_102_30 / var_102_29)

				if var_102_31 > 0 and var_102_25 < var_102_31 then
					arg_99_1.talkMaxDuration = var_102_31

					if var_102_31 + var_102_24 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_31 + var_102_24
					end
				end

				arg_99_1.text_.text = var_102_28
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071024", "story_v_out_103071.awb") ~= 0 then
					local var_102_32 = manager.audio:GetVoiceLength("story_v_out_103071", "103071024", "story_v_out_103071.awb") / 1000

					if var_102_32 + var_102_24 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_32 + var_102_24
					end

					if var_102_27.prefab_name ~= "" and arg_99_1.actors_[var_102_27.prefab_name] ~= nil then
						local var_102_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_27.prefab_name].transform, "story_v_out_103071", "103071024", "story_v_out_103071.awb")

						arg_99_1:RecordAudio("103071024", var_102_33)
						arg_99_1:RecordAudio("103071024", var_102_33)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_103071", "103071024", "story_v_out_103071.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_103071", "103071024", "story_v_out_103071.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_34 = math.max(var_102_25, arg_99_1.talkMaxDuration)

			if var_102_24 <= arg_99_1.time_ and arg_99_1.time_ < var_102_24 + var_102_34 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_24) / var_102_34

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_24 + var_102_34 and arg_99_1.time_ < var_102_24 + var_102_34 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play103071025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 103071025
		arg_103_1.duration_ = 1.999999999999

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play103071026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1059ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1059ui_story == nil then
				arg_103_1.var_.characterEffect1059ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.1

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1059ui_story then
					arg_103_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1059ui_story then
				arg_103_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["1148ui_story"]
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 and arg_103_1.var_.characterEffect1148ui_story == nil then
				arg_103_1.var_.characterEffect1148ui_story = var_106_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_6 = 0.1

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6

				if arg_103_1.var_.characterEffect1148ui_story then
					local var_106_8 = Mathf.Lerp(0, 0.5, var_106_7)

					arg_103_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1148ui_story.fillRatio = var_106_8
				end
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 and arg_103_1.var_.characterEffect1148ui_story then
				local var_106_9 = 0.5

				arg_103_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1148ui_story.fillRatio = var_106_9
			end

			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				arg_103_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_106_11 = arg_103_1.actors_["1059ui_story"].transform
			local var_106_12 = 0

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				arg_103_1.var_.moveOldPos1059ui_story = var_106_11.localPosition
			end

			local var_106_13 = 0.001

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_13 then
				local var_106_14 = (arg_103_1.time_ - var_106_12) / var_106_13
				local var_106_15 = Vector3.New(0.7, -1.05, -6)

				var_106_11.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1059ui_story, var_106_15, var_106_14)

				local var_106_16 = manager.ui.mainCamera.transform.position - var_106_11.position

				var_106_11.forward = Vector3.New(var_106_16.x, var_106_16.y, var_106_16.z)

				local var_106_17 = var_106_11.localEulerAngles

				var_106_17.z = 0
				var_106_17.x = 0
				var_106_11.localEulerAngles = var_106_17
			end

			if arg_103_1.time_ >= var_106_12 + var_106_13 and arg_103_1.time_ < var_106_12 + var_106_13 + arg_106_0 then
				var_106_11.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_106_18 = manager.ui.mainCamera.transform.position - var_106_11.position

				var_106_11.forward = Vector3.New(var_106_18.x, var_106_18.y, var_106_18.z)

				local var_106_19 = var_106_11.localEulerAngles

				var_106_19.z = 0
				var_106_19.x = 0
				var_106_11.localEulerAngles = var_106_19
			end

			local var_106_20 = 0

			if var_106_20 < arg_103_1.time_ and arg_103_1.time_ <= var_106_20 + arg_106_0 then
				arg_103_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_106_21 = 0
			local var_106_22 = 0.175

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_23 = arg_103_1:FormatText(StoryNameCfg[28].name)

				arg_103_1.leftNameTxt_.text = var_106_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_24 = arg_103_1:GetWordFromCfg(103071025)
				local var_106_25 = arg_103_1:FormatText(var_106_24.content)

				arg_103_1.text_.text = var_106_25

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_26 = 7
				local var_106_27 = utf8.len(var_106_25)
				local var_106_28 = var_106_26 <= 0 and var_106_22 or var_106_22 * (var_106_27 / var_106_26)

				if var_106_28 > 0 and var_106_22 < var_106_28 then
					arg_103_1.talkMaxDuration = var_106_28

					if var_106_28 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_28 + var_106_21
					end
				end

				arg_103_1.text_.text = var_106_25
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071025", "story_v_out_103071.awb") ~= 0 then
					local var_106_29 = manager.audio:GetVoiceLength("story_v_out_103071", "103071025", "story_v_out_103071.awb") / 1000

					if var_106_29 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_29 + var_106_21
					end

					if var_106_24.prefab_name ~= "" and arg_103_1.actors_[var_106_24.prefab_name] ~= nil then
						local var_106_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_24.prefab_name].transform, "story_v_out_103071", "103071025", "story_v_out_103071.awb")

						arg_103_1:RecordAudio("103071025", var_106_30)
						arg_103_1:RecordAudio("103071025", var_106_30)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_103071", "103071025", "story_v_out_103071.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_103071", "103071025", "story_v_out_103071.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_31 = math.max(var_106_22, arg_103_1.talkMaxDuration)

			if var_106_21 <= arg_103_1.time_ and arg_103_1.time_ < var_106_21 + var_106_31 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_21) / var_106_31

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_21 + var_106_31 and arg_103_1.time_ < var_106_21 + var_106_31 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play103071026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 103071026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play103071027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1059ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1059ui_story == nil then
				arg_107_1.var_.characterEffect1059ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1059ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1059ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1059ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1059ui_story.fillRatio = var_110_5
			end

			local var_110_6 = arg_107_1.actors_["1148ui_story"].transform
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 then
				arg_107_1.var_.moveOldPos1148ui_story = var_110_6.localPosition
			end

			local var_110_8 = 0.001

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8
				local var_110_10 = Vector3.New(0, 100, 0)

				var_110_6.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1148ui_story, var_110_10, var_110_9)

				local var_110_11 = manager.ui.mainCamera.transform.position - var_110_6.position

				var_110_6.forward = Vector3.New(var_110_11.x, var_110_11.y, var_110_11.z)

				local var_110_12 = var_110_6.localEulerAngles

				var_110_12.z = 0
				var_110_12.x = 0
				var_110_6.localEulerAngles = var_110_12
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 then
				var_110_6.localPosition = Vector3.New(0, 100, 0)

				local var_110_13 = manager.ui.mainCamera.transform.position - var_110_6.position

				var_110_6.forward = Vector3.New(var_110_13.x, var_110_13.y, var_110_13.z)

				local var_110_14 = var_110_6.localEulerAngles

				var_110_14.z = 0
				var_110_14.x = 0
				var_110_6.localEulerAngles = var_110_14
			end

			local var_110_15 = arg_107_1.actors_["1059ui_story"].transform
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.var_.moveOldPos1059ui_story = var_110_15.localPosition
			end

			local var_110_17 = 0.001

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Vector3.New(0, 100, 0)

				var_110_15.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1059ui_story, var_110_19, var_110_18)

				local var_110_20 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_20.x, var_110_20.y, var_110_20.z)

				local var_110_21 = var_110_15.localEulerAngles

				var_110_21.z = 0
				var_110_21.x = 0
				var_110_15.localEulerAngles = var_110_21
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				var_110_15.localPosition = Vector3.New(0, 100, 0)

				local var_110_22 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_22.x, var_110_22.y, var_110_22.z)

				local var_110_23 = var_110_15.localEulerAngles

				var_110_23.z = 0
				var_110_23.x = 0
				var_110_15.localEulerAngles = var_110_23
			end

			local var_110_24 = 0
			local var_110_25 = 0.425

			if var_110_24 < arg_107_1.time_ and arg_107_1.time_ <= var_110_24 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_26 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_26:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_27 = arg_107_1:GetWordFromCfg(103071026)
				local var_110_28 = arg_107_1:FormatText(var_110_27.content)

				arg_107_1.text_.text = var_110_28

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_29 = 17
				local var_110_30 = utf8.len(var_110_28)
				local var_110_31 = var_110_29 <= 0 and var_110_25 or var_110_25 * (var_110_30 / var_110_29)

				if var_110_31 > 0 and var_110_25 < var_110_31 then
					arg_107_1.talkMaxDuration = var_110_31
					var_110_24 = var_110_24 + 0.3

					if var_110_31 + var_110_24 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_31 + var_110_24
					end
				end

				arg_107_1.text_.text = var_110_28
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_32 = var_110_24 + 0.3
			local var_110_33 = math.max(var_110_25, arg_107_1.talkMaxDuration)

			if var_110_32 <= arg_107_1.time_ and arg_107_1.time_ < var_110_32 + var_110_33 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_32) / var_110_33

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_32 + var_110_33 and arg_107_1.time_ < var_110_32 + var_110_33 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play103071027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 103071027
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play103071028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.mask_.enabled = true
				arg_113_1.mask_.raycastTarget = false

				arg_113_1:SetGaussion(false)
			end

			local var_116_1 = 0.5

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_1 then
				local var_116_2 = (arg_113_1.time_ - var_116_0) / var_116_1
				local var_116_3 = Color.New(1, 1, 1)

				var_116_3.a = Mathf.Lerp(1, 0, var_116_2)
				arg_113_1.mask_.color = var_116_3
			end

			if arg_113_1.time_ >= var_116_0 + var_116_1 and arg_113_1.time_ < var_116_0 + var_116_1 + arg_116_0 then
				local var_116_4 = Color.New(1, 1, 1)
				local var_116_5 = 0

				arg_113_1.mask_.enabled = false
				var_116_4.a = var_116_5
				arg_113_1.mask_.color = var_116_4
			end

			local var_116_6 = manager.ui.mainCamera.transform
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 then
				arg_113_1.var_.shakeOldPosMainCamera = var_116_6.localPosition
			end

			local var_116_8 = 0.600000023841858

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / 0.066
				local var_116_10, var_116_11 = math.modf(var_116_9)

				var_116_6.localPosition = Vector3.New(var_116_11 * 0.13, var_116_11 * 0.13, var_116_11 * 0.13) + arg_113_1.var_.shakeOldPosMainCamera
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 then
				var_116_6.localPosition = arg_113_1.var_.shakeOldPosMainCamera
			end

			local var_116_12 = 0
			local var_116_13 = 1.325

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_14 = arg_113_1:GetWordFromCfg(103071027)
				local var_116_15 = arg_113_1:FormatText(var_116_14.content)

				arg_113_1.text_.text = var_116_15

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_16 = 53
				local var_116_17 = utf8.len(var_116_15)
				local var_116_18 = var_116_16 <= 0 and var_116_13 or var_116_13 * (var_116_17 / var_116_16)

				if var_116_18 > 0 and var_116_13 < var_116_18 then
					arg_113_1.talkMaxDuration = var_116_18

					if var_116_18 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_18 + var_116_12
					end
				end

				arg_113_1.text_.text = var_116_15
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_19 = math.max(var_116_13, arg_113_1.talkMaxDuration)

			if var_116_12 <= arg_113_1.time_ and arg_113_1.time_ < var_116_12 + var_116_19 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_12) / var_116_19

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_12 + var_116_19 and arg_113_1.time_ < var_116_12 + var_116_19 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play103071028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 103071028
		arg_117_1.duration_ = 1.999999999999

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play103071029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1059ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1059ui_story == nil then
				arg_117_1.var_.characterEffect1059ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.1

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1059ui_story then
					arg_117_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1059ui_story then
				arg_117_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["1059ui_story"].transform
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1.var_.moveOldPos1059ui_story = var_120_4.localPosition
			end

			local var_120_6 = 0.001

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6
				local var_120_8 = Vector3.New(-0.7, -1.05, -6)

				var_120_4.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1059ui_story, var_120_8, var_120_7)

				local var_120_9 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_9.x, var_120_9.y, var_120_9.z)

				local var_120_10 = var_120_4.localEulerAngles

				var_120_10.z = 0
				var_120_10.x = 0
				var_120_4.localEulerAngles = var_120_10
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 then
				var_120_4.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_120_11 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_11.x, var_120_11.y, var_120_11.z)

				local var_120_12 = var_120_4.localEulerAngles

				var_120_12.z = 0
				var_120_12.x = 0
				var_120_4.localEulerAngles = var_120_12
			end

			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_120_15 = 0
			local var_120_16 = 0.1

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_17 = arg_117_1:FormatText(StoryNameCfg[28].name)

				arg_117_1.leftNameTxt_.text = var_120_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_18 = arg_117_1:GetWordFromCfg(103071028)
				local var_120_19 = arg_117_1:FormatText(var_120_18.content)

				arg_117_1.text_.text = var_120_19

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_20 = 4
				local var_120_21 = utf8.len(var_120_19)
				local var_120_22 = var_120_20 <= 0 and var_120_16 or var_120_16 * (var_120_21 / var_120_20)

				if var_120_22 > 0 and var_120_16 < var_120_22 then
					arg_117_1.talkMaxDuration = var_120_22

					if var_120_22 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_22 + var_120_15
					end
				end

				arg_117_1.text_.text = var_120_19
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071028", "story_v_out_103071.awb") ~= 0 then
					local var_120_23 = manager.audio:GetVoiceLength("story_v_out_103071", "103071028", "story_v_out_103071.awb") / 1000

					if var_120_23 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_23 + var_120_15
					end

					if var_120_18.prefab_name ~= "" and arg_117_1.actors_[var_120_18.prefab_name] ~= nil then
						local var_120_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_18.prefab_name].transform, "story_v_out_103071", "103071028", "story_v_out_103071.awb")

						arg_117_1:RecordAudio("103071028", var_120_24)
						arg_117_1:RecordAudio("103071028", var_120_24)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_103071", "103071028", "story_v_out_103071.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_103071", "103071028", "story_v_out_103071.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_25 = math.max(var_120_16, arg_117_1.talkMaxDuration)

			if var_120_15 <= arg_117_1.time_ and arg_117_1.time_ < var_120_15 + var_120_25 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_15) / var_120_25

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_15 + var_120_25 and arg_117_1.time_ < var_120_15 + var_120_25 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play103071029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 103071029
		arg_121_1.duration_ = 1.999999999999

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play103071030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 1

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				local var_124_2 = "play"
				local var_124_3 = "effect"

				arg_121_1:AudioAction(var_124_2, var_124_3, "se_story_1", "se_story_1_apollo_bow", "")
			end

			local var_124_4 = arg_121_1.actors_["1148ui_story"]
			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 and arg_121_1.var_.characterEffect1148ui_story == nil then
				arg_121_1.var_.characterEffect1148ui_story = var_124_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_6 = 0.1

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6

				if arg_121_1.var_.characterEffect1148ui_story then
					arg_121_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect1148ui_story then
				arg_121_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_124_8 = arg_121_1.actors_["1059ui_story"]
			local var_124_9 = 0

			if var_124_9 < arg_121_1.time_ and arg_121_1.time_ <= var_124_9 + arg_124_0 and arg_121_1.var_.characterEffect1059ui_story == nil then
				arg_121_1.var_.characterEffect1059ui_story = var_124_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_10 = 0.1

			if var_124_9 <= arg_121_1.time_ and arg_121_1.time_ < var_124_9 + var_124_10 then
				local var_124_11 = (arg_121_1.time_ - var_124_9) / var_124_10

				if arg_121_1.var_.characterEffect1059ui_story then
					local var_124_12 = Mathf.Lerp(0, 0.5, var_124_11)

					arg_121_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1059ui_story.fillRatio = var_124_12
				end
			end

			if arg_121_1.time_ >= var_124_9 + var_124_10 and arg_121_1.time_ < var_124_9 + var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1059ui_story then
				local var_124_13 = 0.5

				arg_121_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1059ui_story.fillRatio = var_124_13
			end

			local var_124_14 = arg_121_1.actors_["1148ui_story"].transform
			local var_124_15 = 0

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.var_.moveOldPos1148ui_story = var_124_14.localPosition
			end

			local var_124_16 = 0.001

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_16 then
				local var_124_17 = (arg_121_1.time_ - var_124_15) / var_124_16
				local var_124_18 = Vector3.New(0.7, -0.8, -6.2)

				var_124_14.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1148ui_story, var_124_18, var_124_17)

				local var_124_19 = manager.ui.mainCamera.transform.position - var_124_14.position

				var_124_14.forward = Vector3.New(var_124_19.x, var_124_19.y, var_124_19.z)

				local var_124_20 = var_124_14.localEulerAngles

				var_124_20.z = 0
				var_124_20.x = 0
				var_124_14.localEulerAngles = var_124_20
			end

			if arg_121_1.time_ >= var_124_15 + var_124_16 and arg_121_1.time_ < var_124_15 + var_124_16 + arg_124_0 then
				var_124_14.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_124_21 = manager.ui.mainCamera.transform.position - var_124_14.position

				var_124_14.forward = Vector3.New(var_124_21.x, var_124_21.y, var_124_21.z)

				local var_124_22 = var_124_14.localEulerAngles

				var_124_22.z = 0
				var_124_22.x = 0
				var_124_14.localEulerAngles = var_124_22
			end

			local var_124_23 = 0

			if var_124_23 < arg_121_1.time_ and arg_121_1.time_ <= var_124_23 + arg_124_0 then
				arg_121_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action6_1")
			end

			local var_124_24 = 0

			if var_124_24 < arg_121_1.time_ and arg_121_1.time_ <= var_124_24 + arg_124_0 then
				arg_121_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_124_25 = 0
			local var_124_26 = 0.125

			if var_124_25 < arg_121_1.time_ and arg_121_1.time_ <= var_124_25 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_27 = arg_121_1:FormatText(StoryNameCfg[8].name)

				arg_121_1.leftNameTxt_.text = var_124_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_28 = arg_121_1:GetWordFromCfg(103071029)
				local var_124_29 = arg_121_1:FormatText(var_124_28.content)

				arg_121_1.text_.text = var_124_29

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_30 = 5
				local var_124_31 = utf8.len(var_124_29)
				local var_124_32 = var_124_30 <= 0 and var_124_26 or var_124_26 * (var_124_31 / var_124_30)

				if var_124_32 > 0 and var_124_26 < var_124_32 then
					arg_121_1.talkMaxDuration = var_124_32

					if var_124_32 + var_124_25 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_32 + var_124_25
					end
				end

				arg_121_1.text_.text = var_124_29
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071029", "story_v_out_103071.awb") ~= 0 then
					local var_124_33 = manager.audio:GetVoiceLength("story_v_out_103071", "103071029", "story_v_out_103071.awb") / 1000

					if var_124_33 + var_124_25 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_33 + var_124_25
					end

					if var_124_28.prefab_name ~= "" and arg_121_1.actors_[var_124_28.prefab_name] ~= nil then
						local var_124_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_28.prefab_name].transform, "story_v_out_103071", "103071029", "story_v_out_103071.awb")

						arg_121_1:RecordAudio("103071029", var_124_34)
						arg_121_1:RecordAudio("103071029", var_124_34)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_103071", "103071029", "story_v_out_103071.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_103071", "103071029", "story_v_out_103071.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_35 = math.max(var_124_26, arg_121_1.talkMaxDuration)

			if var_124_25 <= arg_121_1.time_ and arg_121_1.time_ < var_124_25 + var_124_35 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_25) / var_124_35

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_25 + var_124_35 and arg_121_1.time_ < var_124_25 + var_124_35 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play103071030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 103071030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play103071031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1148ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1148ui_story == nil then
				arg_125_1.var_.characterEffect1148ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.1

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1148ui_story then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1148ui_story.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1148ui_story then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1148ui_story.fillRatio = var_128_5
			end

			local var_128_6 = arg_125_1.actors_["1059ui_story"].transform
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 then
				arg_125_1.var_.moveOldPos1059ui_story = var_128_6.localPosition
			end

			local var_128_8 = 0.001

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8
				local var_128_10 = Vector3.New(0, 100, 0)

				var_128_6.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1059ui_story, var_128_10, var_128_9)

				local var_128_11 = manager.ui.mainCamera.transform.position - var_128_6.position

				var_128_6.forward = Vector3.New(var_128_11.x, var_128_11.y, var_128_11.z)

				local var_128_12 = var_128_6.localEulerAngles

				var_128_12.z = 0
				var_128_12.x = 0
				var_128_6.localEulerAngles = var_128_12
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 then
				var_128_6.localPosition = Vector3.New(0, 100, 0)

				local var_128_13 = manager.ui.mainCamera.transform.position - var_128_6.position

				var_128_6.forward = Vector3.New(var_128_13.x, var_128_13.y, var_128_13.z)

				local var_128_14 = var_128_6.localEulerAngles

				var_128_14.z = 0
				var_128_14.x = 0
				var_128_6.localEulerAngles = var_128_14
			end

			local var_128_15 = arg_125_1.actors_["1148ui_story"].transform
			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.var_.moveOldPos1148ui_story = var_128_15.localPosition
			end

			local var_128_17 = 0.001

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17
				local var_128_19 = Vector3.New(0, 100, 0)

				var_128_15.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1148ui_story, var_128_19, var_128_18)

				local var_128_20 = manager.ui.mainCamera.transform.position - var_128_15.position

				var_128_15.forward = Vector3.New(var_128_20.x, var_128_20.y, var_128_20.z)

				local var_128_21 = var_128_15.localEulerAngles

				var_128_21.z = 0
				var_128_21.x = 0
				var_128_15.localEulerAngles = var_128_21
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 then
				var_128_15.localPosition = Vector3.New(0, 100, 0)

				local var_128_22 = manager.ui.mainCamera.transform.position - var_128_15.position

				var_128_15.forward = Vector3.New(var_128_22.x, var_128_22.y, var_128_22.z)

				local var_128_23 = var_128_15.localEulerAngles

				var_128_23.z = 0
				var_128_23.x = 0
				var_128_15.localEulerAngles = var_128_23
			end

			local var_128_24 = 0
			local var_128_25 = 1.35

			if var_128_24 < arg_125_1.time_ and arg_125_1.time_ <= var_128_24 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0

				arg_125_1.dialog_:SetActive(true)

				local var_128_26 = LeanTween.value(arg_125_1.dialog_, 0, 1, 0.3)

				var_128_26:setOnUpdate(LuaHelper.FloatAction(function(arg_129_0)
					arg_125_1.dialogCg_.alpha = arg_129_0
				end))
				var_128_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_125_1.dialog_)
					var_128_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_125_1.duration_ = arg_125_1.duration_ + 0.3

				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_27 = arg_125_1:GetWordFromCfg(103071030)
				local var_128_28 = arg_125_1:FormatText(var_128_27.content)

				arg_125_1.text_.text = var_128_28

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_29 = 54
				local var_128_30 = utf8.len(var_128_28)
				local var_128_31 = var_128_29 <= 0 and var_128_25 or var_128_25 * (var_128_30 / var_128_29)

				if var_128_31 > 0 and var_128_25 < var_128_31 then
					arg_125_1.talkMaxDuration = var_128_31
					var_128_24 = var_128_24 + 0.3

					if var_128_31 + var_128_24 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_31 + var_128_24
					end
				end

				arg_125_1.text_.text = var_128_28
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_32 = var_128_24 + 0.3
			local var_128_33 = math.max(var_128_25, arg_125_1.talkMaxDuration)

			if var_128_32 <= arg_125_1.time_ and arg_125_1.time_ < var_128_32 + var_128_33 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_32) / var_128_33

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_32 + var_128_33 and arg_125_1.time_ < var_128_32 + var_128_33 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play103071031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 103071031
		arg_131_1.duration_ = 4.8

		local var_131_0 = {
			ja = 3.4,
			ko = 4.8,
			zh = 3,
			en = 3.2
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
				arg_131_0:Play103071032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1148ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1148ui_story == nil then
				arg_131_1.var_.characterEffect1148ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.1

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1148ui_story then
					arg_131_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1148ui_story then
				arg_131_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_134_4 = arg_131_1.actors_["1148ui_story"].transform
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1.var_.moveOldPos1148ui_story = var_134_4.localPosition
			end

			local var_134_6 = 0.001

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6
				local var_134_8 = Vector3.New(0, 100, 0)

				var_134_4.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1148ui_story, var_134_8, var_134_7)

				local var_134_9 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_9.x, var_134_9.y, var_134_9.z)

				local var_134_10 = var_134_4.localEulerAngles

				var_134_10.z = 0
				var_134_10.x = 0
				var_134_4.localEulerAngles = var_134_10
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 then
				var_134_4.localPosition = Vector3.New(0, 100, 0)

				local var_134_11 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_11.x, var_134_11.y, var_134_11.z)

				local var_134_12 = var_134_4.localEulerAngles

				var_134_12.z = 0
				var_134_12.x = 0
				var_134_4.localEulerAngles = var_134_12
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action8_2")
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_134_15 = 0
			local var_134_16 = 0.225

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_17 = arg_131_1:FormatText(StoryNameCfg[8].name)

				arg_131_1.leftNameTxt_.text = var_134_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_18 = arg_131_1:GetWordFromCfg(103071031)
				local var_134_19 = arg_131_1:FormatText(var_134_18.content)

				arg_131_1.text_.text = var_134_19

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_20 = 9
				local var_134_21 = utf8.len(var_134_19)
				local var_134_22 = var_134_20 <= 0 and var_134_16 or var_134_16 * (var_134_21 / var_134_20)

				if var_134_22 > 0 and var_134_16 < var_134_22 then
					arg_131_1.talkMaxDuration = var_134_22

					if var_134_22 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_22 + var_134_15
					end
				end

				arg_131_1.text_.text = var_134_19
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071031", "story_v_out_103071.awb") ~= 0 then
					local var_134_23 = manager.audio:GetVoiceLength("story_v_out_103071", "103071031", "story_v_out_103071.awb") / 1000

					if var_134_23 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_23 + var_134_15
					end

					if var_134_18.prefab_name ~= "" and arg_131_1.actors_[var_134_18.prefab_name] ~= nil then
						local var_134_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_18.prefab_name].transform, "story_v_out_103071", "103071031", "story_v_out_103071.awb")

						arg_131_1:RecordAudio("103071031", var_134_24)
						arg_131_1:RecordAudio("103071031", var_134_24)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_103071", "103071031", "story_v_out_103071.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_103071", "103071031", "story_v_out_103071.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_25 = math.max(var_134_16, arg_131_1.talkMaxDuration)

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_25 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_15) / var_134_25

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_15 + var_134_25 and arg_131_1.time_ < var_134_15 + var_134_25 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play103071032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 103071032
		arg_135_1.duration_ = 8.7

		local var_135_0 = {
			ja = 8.7,
			ko = 4.3,
			zh = 6.6,
			en = 7.266
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
				arg_135_0:Play103071033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1059ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1059ui_story == nil then
				arg_135_1.var_.characterEffect1059ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.1

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1059ui_story then
					arg_135_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1059ui_story then
				arg_135_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_138_4 = arg_135_1.actors_["1148ui_story"]
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 and arg_135_1.var_.characterEffect1148ui_story == nil then
				arg_135_1.var_.characterEffect1148ui_story = var_138_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_6 = 0.1

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6

				if arg_135_1.var_.characterEffect1148ui_story then
					local var_138_8 = Mathf.Lerp(0, 0.5, var_138_7)

					arg_135_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1148ui_story.fillRatio = var_138_8
				end
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect1148ui_story then
				local var_138_9 = 0.5

				arg_135_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1148ui_story.fillRatio = var_138_9
			end

			local var_138_10 = arg_135_1.actors_["1148ui_story"].transform
			local var_138_11 = 0

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1.var_.moveOldPos1148ui_story = var_138_10.localPosition
			end

			local var_138_12 = 0.001

			if var_138_11 <= arg_135_1.time_ and arg_135_1.time_ < var_138_11 + var_138_12 then
				local var_138_13 = (arg_135_1.time_ - var_138_11) / var_138_12
				local var_138_14 = Vector3.New(0, 100, 0)

				var_138_10.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1148ui_story, var_138_14, var_138_13)

				local var_138_15 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_15.x, var_138_15.y, var_138_15.z)

				local var_138_16 = var_138_10.localEulerAngles

				var_138_16.z = 0
				var_138_16.x = 0
				var_138_10.localEulerAngles = var_138_16
			end

			if arg_135_1.time_ >= var_138_11 + var_138_12 and arg_135_1.time_ < var_138_11 + var_138_12 + arg_138_0 then
				var_138_10.localPosition = Vector3.New(0, 100, 0)

				local var_138_17 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_17.x, var_138_17.y, var_138_17.z)

				local var_138_18 = var_138_10.localEulerAngles

				var_138_18.z = 0
				var_138_18.x = 0
				var_138_10.localEulerAngles = var_138_18
			end

			local var_138_19 = arg_135_1.actors_["1059ui_story"].transform
			local var_138_20 = 0

			if var_138_20 < arg_135_1.time_ and arg_135_1.time_ <= var_138_20 + arg_138_0 then
				arg_135_1.var_.moveOldPos1059ui_story = var_138_19.localPosition
			end

			local var_138_21 = 0.001

			if var_138_20 <= arg_135_1.time_ and arg_135_1.time_ < var_138_20 + var_138_21 then
				local var_138_22 = (arg_135_1.time_ - var_138_20) / var_138_21
				local var_138_23 = Vector3.New(0, -1.05, -6)

				var_138_19.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1059ui_story, var_138_23, var_138_22)

				local var_138_24 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_24.x, var_138_24.y, var_138_24.z)

				local var_138_25 = var_138_19.localEulerAngles

				var_138_25.z = 0
				var_138_25.x = 0
				var_138_19.localEulerAngles = var_138_25
			end

			if arg_135_1.time_ >= var_138_20 + var_138_21 and arg_135_1.time_ < var_138_20 + var_138_21 + arg_138_0 then
				var_138_19.localPosition = Vector3.New(0, -1.05, -6)

				local var_138_26 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_26.x, var_138_26.y, var_138_26.z)

				local var_138_27 = var_138_19.localEulerAngles

				var_138_27.z = 0
				var_138_27.x = 0
				var_138_19.localEulerAngles = var_138_27
			end

			local var_138_28 = 0

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_138_29 = 0

			if var_138_29 < arg_135_1.time_ and arg_135_1.time_ <= var_138_29 + arg_138_0 then
				arg_135_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_138_30 = 0
			local var_138_31 = 0.725

			if var_138_30 < arg_135_1.time_ and arg_135_1.time_ <= var_138_30 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_32 = arg_135_1:FormatText(StoryNameCfg[28].name)

				arg_135_1.leftNameTxt_.text = var_138_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_33 = arg_135_1:GetWordFromCfg(103071032)
				local var_138_34 = arg_135_1:FormatText(var_138_33.content)

				arg_135_1.text_.text = var_138_34

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_35 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071032", "story_v_out_103071.awb") ~= 0 then
					local var_138_38 = manager.audio:GetVoiceLength("story_v_out_103071", "103071032", "story_v_out_103071.awb") / 1000

					if var_138_38 + var_138_30 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_38 + var_138_30
					end

					if var_138_33.prefab_name ~= "" and arg_135_1.actors_[var_138_33.prefab_name] ~= nil then
						local var_138_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_33.prefab_name].transform, "story_v_out_103071", "103071032", "story_v_out_103071.awb")

						arg_135_1:RecordAudio("103071032", var_138_39)
						arg_135_1:RecordAudio("103071032", var_138_39)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_103071", "103071032", "story_v_out_103071.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_103071", "103071032", "story_v_out_103071.awb")
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
	Play103071033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 103071033
		arg_139_1.duration_ = 10.166

		local var_139_0 = {
			ja = 10.166,
			ko = 5.766,
			zh = 5.733,
			en = 6.566
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
				arg_139_0:Play103071034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1148ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1148ui_story == nil then
				arg_139_1.var_.characterEffect1148ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.1

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1148ui_story then
					arg_139_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1148ui_story then
				arg_139_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["1059ui_story"]
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 and arg_139_1.var_.characterEffect1059ui_story == nil then
				arg_139_1.var_.characterEffect1059ui_story = var_142_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_6 = 0.1

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6

				if arg_139_1.var_.characterEffect1059ui_story then
					local var_142_8 = Mathf.Lerp(0, 0.5, var_142_7)

					arg_139_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1059ui_story.fillRatio = var_142_8
				end
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 and arg_139_1.var_.characterEffect1059ui_story then
				local var_142_9 = 0.5

				arg_139_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1059ui_story.fillRatio = var_142_9
			end

			local var_142_10 = arg_139_1.actors_["1059ui_story"].transform
			local var_142_11 = 0.033

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1.var_.moveOldPos1059ui_story = var_142_10.localPosition
			end

			local var_142_12 = 0.5

			if var_142_11 <= arg_139_1.time_ and arg_139_1.time_ < var_142_11 + var_142_12 then
				local var_142_13 = (arg_139_1.time_ - var_142_11) / var_142_12
				local var_142_14 = Vector3.New(-0.7, -1.05, -6)

				var_142_10.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1059ui_story, var_142_14, var_142_13)

				local var_142_15 = manager.ui.mainCamera.transform.position - var_142_10.position

				var_142_10.forward = Vector3.New(var_142_15.x, var_142_15.y, var_142_15.z)

				local var_142_16 = var_142_10.localEulerAngles

				var_142_16.z = 0
				var_142_16.x = 0
				var_142_10.localEulerAngles = var_142_16
			end

			if arg_139_1.time_ >= var_142_11 + var_142_12 and arg_139_1.time_ < var_142_11 + var_142_12 + arg_142_0 then
				var_142_10.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_142_17 = manager.ui.mainCamera.transform.position - var_142_10.position

				var_142_10.forward = Vector3.New(var_142_17.x, var_142_17.y, var_142_17.z)

				local var_142_18 = var_142_10.localEulerAngles

				var_142_18.z = 0
				var_142_18.x = 0
				var_142_10.localEulerAngles = var_142_18
			end

			local var_142_19 = arg_139_1.actors_["1059ui_story"].transform
			local var_142_20 = 0

			if var_142_20 < arg_139_1.time_ and arg_139_1.time_ <= var_142_20 + arg_142_0 then
				arg_139_1.var_.moveOldPos1059ui_story = var_142_19.localPosition
			end

			local var_142_21 = 0.001

			if var_142_20 <= arg_139_1.time_ and arg_139_1.time_ < var_142_20 + var_142_21 then
				local var_142_22 = (arg_139_1.time_ - var_142_20) / var_142_21
				local var_142_23 = Vector3.New(-0.7, -1.05, -6)

				var_142_19.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1059ui_story, var_142_23, var_142_22)

				local var_142_24 = manager.ui.mainCamera.transform.position - var_142_19.position

				var_142_19.forward = Vector3.New(var_142_24.x, var_142_24.y, var_142_24.z)

				local var_142_25 = var_142_19.localEulerAngles

				var_142_25.z = 0
				var_142_25.x = 0
				var_142_19.localEulerAngles = var_142_25
			end

			if arg_139_1.time_ >= var_142_20 + var_142_21 and arg_139_1.time_ < var_142_20 + var_142_21 + arg_142_0 then
				var_142_19.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_142_26 = manager.ui.mainCamera.transform.position - var_142_19.position

				var_142_19.forward = Vector3.New(var_142_26.x, var_142_26.y, var_142_26.z)

				local var_142_27 = var_142_19.localEulerAngles

				var_142_27.z = 0
				var_142_27.x = 0
				var_142_19.localEulerAngles = var_142_27
			end

			local var_142_28 = arg_139_1.actors_["1148ui_story"].transform
			local var_142_29 = 0

			if var_142_29 < arg_139_1.time_ and arg_139_1.time_ <= var_142_29 + arg_142_0 then
				arg_139_1.var_.moveOldPos1148ui_story = var_142_28.localPosition
			end

			local var_142_30 = 0.001

			if var_142_29 <= arg_139_1.time_ and arg_139_1.time_ < var_142_29 + var_142_30 then
				local var_142_31 = (arg_139_1.time_ - var_142_29) / var_142_30
				local var_142_32 = Vector3.New(0.7, -0.8, -6.2)

				var_142_28.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1148ui_story, var_142_32, var_142_31)

				local var_142_33 = manager.ui.mainCamera.transform.position - var_142_28.position

				var_142_28.forward = Vector3.New(var_142_33.x, var_142_33.y, var_142_33.z)

				local var_142_34 = var_142_28.localEulerAngles

				var_142_34.z = 0
				var_142_34.x = 0
				var_142_28.localEulerAngles = var_142_34
			end

			if arg_139_1.time_ >= var_142_29 + var_142_30 and arg_139_1.time_ < var_142_29 + var_142_30 + arg_142_0 then
				var_142_28.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_142_35 = manager.ui.mainCamera.transform.position - var_142_28.position

				var_142_28.forward = Vector3.New(var_142_35.x, var_142_35.y, var_142_35.z)

				local var_142_36 = var_142_28.localEulerAngles

				var_142_36.z = 0
				var_142_36.x = 0
				var_142_28.localEulerAngles = var_142_36
			end

			local var_142_37 = 0

			if var_142_37 < arg_139_1.time_ and arg_139_1.time_ <= var_142_37 + arg_142_0 then
				arg_139_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_142_38 = 0

			if var_142_38 < arg_139_1.time_ and arg_139_1.time_ <= var_142_38 + arg_142_0 then
				arg_139_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_142_39 = 0
			local var_142_40 = 0.8

			if var_142_39 < arg_139_1.time_ and arg_139_1.time_ <= var_142_39 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_41 = arg_139_1:FormatText(StoryNameCfg[8].name)

				arg_139_1.leftNameTxt_.text = var_142_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_42 = arg_139_1:GetWordFromCfg(103071033)
				local var_142_43 = arg_139_1:FormatText(var_142_42.content)

				arg_139_1.text_.text = var_142_43

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_44 = 32
				local var_142_45 = utf8.len(var_142_43)
				local var_142_46 = var_142_44 <= 0 and var_142_40 or var_142_40 * (var_142_45 / var_142_44)

				if var_142_46 > 0 and var_142_40 < var_142_46 then
					arg_139_1.talkMaxDuration = var_142_46

					if var_142_46 + var_142_39 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_46 + var_142_39
					end
				end

				arg_139_1.text_.text = var_142_43
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071033", "story_v_out_103071.awb") ~= 0 then
					local var_142_47 = manager.audio:GetVoiceLength("story_v_out_103071", "103071033", "story_v_out_103071.awb") / 1000

					if var_142_47 + var_142_39 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_47 + var_142_39
					end

					if var_142_42.prefab_name ~= "" and arg_139_1.actors_[var_142_42.prefab_name] ~= nil then
						local var_142_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_42.prefab_name].transform, "story_v_out_103071", "103071033", "story_v_out_103071.awb")

						arg_139_1:RecordAudio("103071033", var_142_48)
						arg_139_1:RecordAudio("103071033", var_142_48)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_103071", "103071033", "story_v_out_103071.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_103071", "103071033", "story_v_out_103071.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_49 = math.max(var_142_40, arg_139_1.talkMaxDuration)

			if var_142_39 <= arg_139_1.time_ and arg_139_1.time_ < var_142_39 + var_142_49 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_39) / var_142_49

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_39 + var_142_49 and arg_139_1.time_ < var_142_39 + var_142_49 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play103071034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 103071034
		arg_143_1.duration_ = 10.5

		local var_143_0 = {
			ja = 10.5,
			ko = 8.733,
			zh = 7.5,
			en = 8.2
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
				arg_143_0:Play103071035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1059ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1059ui_story == nil then
				arg_143_1.var_.characterEffect1059ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.1

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1059ui_story then
					arg_143_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1059ui_story then
				arg_143_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_146_4 = arg_143_1.actors_["1148ui_story"]
			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 and arg_143_1.var_.characterEffect1148ui_story == nil then
				arg_143_1.var_.characterEffect1148ui_story = var_146_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_6 = 0.1

			if var_146_5 <= arg_143_1.time_ and arg_143_1.time_ < var_146_5 + var_146_6 then
				local var_146_7 = (arg_143_1.time_ - var_146_5) / var_146_6

				if arg_143_1.var_.characterEffect1148ui_story then
					local var_146_8 = Mathf.Lerp(0, 0.5, var_146_7)

					arg_143_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1148ui_story.fillRatio = var_146_8
				end
			end

			if arg_143_1.time_ >= var_146_5 + var_146_6 and arg_143_1.time_ < var_146_5 + var_146_6 + arg_146_0 and arg_143_1.var_.characterEffect1148ui_story then
				local var_146_9 = 0.5

				arg_143_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1148ui_story.fillRatio = var_146_9
			end

			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action464")
			end

			local var_146_11 = 0

			if var_146_11 < arg_143_1.time_ and arg_143_1.time_ <= var_146_11 + arg_146_0 then
				arg_143_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_146_12 = 0
			local var_146_13 = 0.925

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_14 = arg_143_1:FormatText(StoryNameCfg[28].name)

				arg_143_1.leftNameTxt_.text = var_146_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(103071034)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 37
				local var_146_18 = utf8.len(var_146_16)
				local var_146_19 = var_146_17 <= 0 and var_146_13 or var_146_13 * (var_146_18 / var_146_17)

				if var_146_19 > 0 and var_146_13 < var_146_19 then
					arg_143_1.talkMaxDuration = var_146_19

					if var_146_19 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_19 + var_146_12
					end
				end

				arg_143_1.text_.text = var_146_16
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071034", "story_v_out_103071.awb") ~= 0 then
					local var_146_20 = manager.audio:GetVoiceLength("story_v_out_103071", "103071034", "story_v_out_103071.awb") / 1000

					if var_146_20 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_12
					end

					if var_146_15.prefab_name ~= "" and arg_143_1.actors_[var_146_15.prefab_name] ~= nil then
						local var_146_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_15.prefab_name].transform, "story_v_out_103071", "103071034", "story_v_out_103071.awb")

						arg_143_1:RecordAudio("103071034", var_146_21)
						arg_143_1:RecordAudio("103071034", var_146_21)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_103071", "103071034", "story_v_out_103071.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_103071", "103071034", "story_v_out_103071.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_22 = math.max(var_146_13, arg_143_1.talkMaxDuration)

			if var_146_12 <= arg_143_1.time_ and arg_143_1.time_ < var_146_12 + var_146_22 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_12) / var_146_22

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_12 + var_146_22 and arg_143_1.time_ < var_146_12 + var_146_22 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play103071035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 103071035
		arg_147_1.duration_ = 8.366

		local var_147_0 = {
			ja = 8.366,
			ko = 7.166,
			zh = 7.4,
			en = 6.8
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
				arg_147_0:Play103071036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1035ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1035ui_story == nil then
				arg_147_1.var_.characterEffect1035ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.1

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1035ui_story then
					arg_147_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1035ui_story then
				arg_147_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_150_4 = arg_147_1.actors_["1059ui_story"].transform
			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1.var_.moveOldPos1059ui_story = var_150_4.localPosition
			end

			local var_150_6 = 0.001

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_6 then
				local var_150_7 = (arg_147_1.time_ - var_150_5) / var_150_6
				local var_150_8 = Vector3.New(0, 100, 0)

				var_150_4.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1059ui_story, var_150_8, var_150_7)

				local var_150_9 = manager.ui.mainCamera.transform.position - var_150_4.position

				var_150_4.forward = Vector3.New(var_150_9.x, var_150_9.y, var_150_9.z)

				local var_150_10 = var_150_4.localEulerAngles

				var_150_10.z = 0
				var_150_10.x = 0
				var_150_4.localEulerAngles = var_150_10
			end

			if arg_147_1.time_ >= var_150_5 + var_150_6 and arg_147_1.time_ < var_150_5 + var_150_6 + arg_150_0 then
				var_150_4.localPosition = Vector3.New(0, 100, 0)

				local var_150_11 = manager.ui.mainCamera.transform.position - var_150_4.position

				var_150_4.forward = Vector3.New(var_150_11.x, var_150_11.y, var_150_11.z)

				local var_150_12 = var_150_4.localEulerAngles

				var_150_12.z = 0
				var_150_12.x = 0
				var_150_4.localEulerAngles = var_150_12
			end

			local var_150_13 = arg_147_1.actors_["1148ui_story"].transform
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1.var_.moveOldPos1148ui_story = var_150_13.localPosition
			end

			local var_150_15 = 0.001

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15
				local var_150_17 = Vector3.New(0, 100, 0)

				var_150_13.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1148ui_story, var_150_17, var_150_16)

				local var_150_18 = manager.ui.mainCamera.transform.position - var_150_13.position

				var_150_13.forward = Vector3.New(var_150_18.x, var_150_18.y, var_150_18.z)

				local var_150_19 = var_150_13.localEulerAngles

				var_150_19.z = 0
				var_150_19.x = 0
				var_150_13.localEulerAngles = var_150_19
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 then
				var_150_13.localPosition = Vector3.New(0, 100, 0)

				local var_150_20 = manager.ui.mainCamera.transform.position - var_150_13.position

				var_150_13.forward = Vector3.New(var_150_20.x, var_150_20.y, var_150_20.z)

				local var_150_21 = var_150_13.localEulerAngles

				var_150_21.z = 0
				var_150_21.x = 0
				var_150_13.localEulerAngles = var_150_21
			end

			local var_150_22 = arg_147_1.actors_["1035ui_story"].transform
			local var_150_23 = 0

			if var_150_23 < arg_147_1.time_ and arg_147_1.time_ <= var_150_23 + arg_150_0 then
				arg_147_1.var_.moveOldPos1035ui_story = var_150_22.localPosition
			end

			local var_150_24 = 0.001

			if var_150_23 <= arg_147_1.time_ and arg_147_1.time_ < var_150_23 + var_150_24 then
				local var_150_25 = (arg_147_1.time_ - var_150_23) / var_150_24
				local var_150_26 = Vector3.New(0, -1.05, -5.6)

				var_150_22.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1035ui_story, var_150_26, var_150_25)

				local var_150_27 = manager.ui.mainCamera.transform.position - var_150_22.position

				var_150_22.forward = Vector3.New(var_150_27.x, var_150_27.y, var_150_27.z)

				local var_150_28 = var_150_22.localEulerAngles

				var_150_28.z = 0
				var_150_28.x = 0
				var_150_22.localEulerAngles = var_150_28
			end

			if arg_147_1.time_ >= var_150_23 + var_150_24 and arg_147_1.time_ < var_150_23 + var_150_24 + arg_150_0 then
				var_150_22.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_150_29 = manager.ui.mainCamera.transform.position - var_150_22.position

				var_150_22.forward = Vector3.New(var_150_29.x, var_150_29.y, var_150_29.z)

				local var_150_30 = var_150_22.localEulerAngles

				var_150_30.z = 0
				var_150_30.x = 0
				var_150_22.localEulerAngles = var_150_30
			end

			local var_150_31 = 0

			if var_150_31 < arg_147_1.time_ and arg_147_1.time_ <= var_150_31 + arg_150_0 then
				arg_147_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action8_1")
			end

			local var_150_32 = 0
			local var_150_33 = 0.825

			if var_150_32 < arg_147_1.time_ and arg_147_1.time_ <= var_150_32 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_34 = arg_147_1:FormatText(StoryNameCfg[21].name)

				arg_147_1.leftNameTxt_.text = var_150_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_35 = arg_147_1:GetWordFromCfg(103071035)
				local var_150_36 = arg_147_1:FormatText(var_150_35.content)

				arg_147_1.text_.text = var_150_36

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_37 = 33
				local var_150_38 = utf8.len(var_150_36)
				local var_150_39 = var_150_37 <= 0 and var_150_33 or var_150_33 * (var_150_38 / var_150_37)

				if var_150_39 > 0 and var_150_33 < var_150_39 then
					arg_147_1.talkMaxDuration = var_150_39

					if var_150_39 + var_150_32 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_39 + var_150_32
					end
				end

				arg_147_1.text_.text = var_150_36
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071035", "story_v_out_103071.awb") ~= 0 then
					local var_150_40 = manager.audio:GetVoiceLength("story_v_out_103071", "103071035", "story_v_out_103071.awb") / 1000

					if var_150_40 + var_150_32 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_40 + var_150_32
					end

					if var_150_35.prefab_name ~= "" and arg_147_1.actors_[var_150_35.prefab_name] ~= nil then
						local var_150_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_35.prefab_name].transform, "story_v_out_103071", "103071035", "story_v_out_103071.awb")

						arg_147_1:RecordAudio("103071035", var_150_41)
						arg_147_1:RecordAudio("103071035", var_150_41)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_103071", "103071035", "story_v_out_103071.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_103071", "103071035", "story_v_out_103071.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_42 = math.max(var_150_33, arg_147_1.talkMaxDuration)

			if var_150_32 <= arg_147_1.time_ and arg_147_1.time_ < var_150_32 + var_150_42 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_32) / var_150_42

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_32 + var_150_42 and arg_147_1.time_ < var_150_32 + var_150_42 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play103071036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 103071036
		arg_151_1.duration_ = 6

		local var_151_0 = {
			ja = 6,
			ko = 3.866,
			zh = 3.866,
			en = 4.4
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
				arg_151_0:Play103071037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1059ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1059ui_story == nil then
				arg_151_1.var_.characterEffect1059ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.1

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1059ui_story then
					arg_151_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1059ui_story then
				arg_151_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_154_4 = arg_151_1.actors_["1059ui_story"].transform
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 then
				arg_151_1.var_.moveOldPos1059ui_story = var_154_4.localPosition
			end

			local var_154_6 = 0.001

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6
				local var_154_8 = Vector3.New(0, -1.05, -6)

				var_154_4.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1059ui_story, var_154_8, var_154_7)

				local var_154_9 = manager.ui.mainCamera.transform.position - var_154_4.position

				var_154_4.forward = Vector3.New(var_154_9.x, var_154_9.y, var_154_9.z)

				local var_154_10 = var_154_4.localEulerAngles

				var_154_10.z = 0
				var_154_10.x = 0
				var_154_4.localEulerAngles = var_154_10
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 then
				var_154_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_154_11 = manager.ui.mainCamera.transform.position - var_154_4.position

				var_154_4.forward = Vector3.New(var_154_11.x, var_154_11.y, var_154_11.z)

				local var_154_12 = var_154_4.localEulerAngles

				var_154_12.z = 0
				var_154_12.x = 0
				var_154_4.localEulerAngles = var_154_12
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_154_14 = arg_151_1.actors_["1035ui_story"].transform
			local var_154_15 = 0

			if var_154_15 < arg_151_1.time_ and arg_151_1.time_ <= var_154_15 + arg_154_0 then
				arg_151_1.var_.moveOldPos1035ui_story = var_154_14.localPosition
			end

			local var_154_16 = 0.001

			if var_154_15 <= arg_151_1.time_ and arg_151_1.time_ < var_154_15 + var_154_16 then
				local var_154_17 = (arg_151_1.time_ - var_154_15) / var_154_16
				local var_154_18 = Vector3.New(0, 100, 0)

				var_154_14.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1035ui_story, var_154_18, var_154_17)

				local var_154_19 = manager.ui.mainCamera.transform.position - var_154_14.position

				var_154_14.forward = Vector3.New(var_154_19.x, var_154_19.y, var_154_19.z)

				local var_154_20 = var_154_14.localEulerAngles

				var_154_20.z = 0
				var_154_20.x = 0
				var_154_14.localEulerAngles = var_154_20
			end

			if arg_151_1.time_ >= var_154_15 + var_154_16 and arg_151_1.time_ < var_154_15 + var_154_16 + arg_154_0 then
				var_154_14.localPosition = Vector3.New(0, 100, 0)

				local var_154_21 = manager.ui.mainCamera.transform.position - var_154_14.position

				var_154_14.forward = Vector3.New(var_154_21.x, var_154_21.y, var_154_21.z)

				local var_154_22 = var_154_14.localEulerAngles

				var_154_22.z = 0
				var_154_22.x = 0
				var_154_14.localEulerAngles = var_154_22
			end

			local var_154_23 = 0

			if var_154_23 < arg_151_1.time_ and arg_151_1.time_ <= var_154_23 + arg_154_0 then
				arg_151_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_154_24 = 0
			local var_154_25 = 0.45

			if var_154_24 < arg_151_1.time_ and arg_151_1.time_ <= var_154_24 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_26 = arg_151_1:FormatText(StoryNameCfg[28].name)

				arg_151_1.leftNameTxt_.text = var_154_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_27 = arg_151_1:GetWordFromCfg(103071036)
				local var_154_28 = arg_151_1:FormatText(var_154_27.content)

				arg_151_1.text_.text = var_154_28

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_29 = 18
				local var_154_30 = utf8.len(var_154_28)
				local var_154_31 = var_154_29 <= 0 and var_154_25 or var_154_25 * (var_154_30 / var_154_29)

				if var_154_31 > 0 and var_154_25 < var_154_31 then
					arg_151_1.talkMaxDuration = var_154_31

					if var_154_31 + var_154_24 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_31 + var_154_24
					end
				end

				arg_151_1.text_.text = var_154_28
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071036", "story_v_out_103071.awb") ~= 0 then
					local var_154_32 = manager.audio:GetVoiceLength("story_v_out_103071", "103071036", "story_v_out_103071.awb") / 1000

					if var_154_32 + var_154_24 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_32 + var_154_24
					end

					if var_154_27.prefab_name ~= "" and arg_151_1.actors_[var_154_27.prefab_name] ~= nil then
						local var_154_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_27.prefab_name].transform, "story_v_out_103071", "103071036", "story_v_out_103071.awb")

						arg_151_1:RecordAudio("103071036", var_154_33)
						arg_151_1:RecordAudio("103071036", var_154_33)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_103071", "103071036", "story_v_out_103071.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_103071", "103071036", "story_v_out_103071.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_34 = math.max(var_154_25, arg_151_1.talkMaxDuration)

			if var_154_24 <= arg_151_1.time_ and arg_151_1.time_ < var_154_24 + var_154_34 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_24) / var_154_34

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_24 + var_154_34 and arg_151_1.time_ < var_154_24 + var_154_34 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play103071037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 103071037
		arg_155_1.duration_ = 4

		local var_155_0 = {
			ja = 4,
			ko = 2.833,
			zh = 2.866,
			en = 2.566
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
			arg_155_1.auto_ = false
		end

		function arg_155_1.playNext_(arg_157_0)
			arg_155_1.onStoryFinished_()
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action423")
			end

			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_158_2 = 0
			local var_158_3 = 0.225

			if var_158_2 < arg_155_1.time_ and arg_155_1.time_ <= var_158_2 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_4 = arg_155_1:FormatText(StoryNameCfg[28].name)

				arg_155_1.leftNameTxt_.text = var_158_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_5 = arg_155_1:GetWordFromCfg(103071037)
				local var_158_6 = arg_155_1:FormatText(var_158_5.content)

				arg_155_1.text_.text = var_158_6

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_7 = 9
				local var_158_8 = utf8.len(var_158_6)
				local var_158_9 = var_158_7 <= 0 and var_158_3 or var_158_3 * (var_158_8 / var_158_7)

				if var_158_9 > 0 and var_158_3 < var_158_9 then
					arg_155_1.talkMaxDuration = var_158_9

					if var_158_9 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_9 + var_158_2
					end
				end

				arg_155_1.text_.text = var_158_6
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103071", "103071037", "story_v_out_103071.awb") ~= 0 then
					local var_158_10 = manager.audio:GetVoiceLength("story_v_out_103071", "103071037", "story_v_out_103071.awb") / 1000

					if var_158_10 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_10 + var_158_2
					end

					if var_158_5.prefab_name ~= "" and arg_155_1.actors_[var_158_5.prefab_name] ~= nil then
						local var_158_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_5.prefab_name].transform, "story_v_out_103071", "103071037", "story_v_out_103071.awb")

						arg_155_1:RecordAudio("103071037", var_158_11)
						arg_155_1:RecordAudio("103071037", var_158_11)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_103071", "103071037", "story_v_out_103071.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_103071", "103071037", "story_v_out_103071.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_12 = math.max(var_158_3, arg_155_1.talkMaxDuration)

			if var_158_2 <= arg_155_1.time_ and arg_155_1.time_ < var_158_2 + var_158_12 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_2) / var_158_12

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_2 + var_158_12 and arg_155_1.time_ < var_158_2 + var_158_12 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B06b"
	},
	voices = {
		"story_v_out_103071.awb"
	}
}
