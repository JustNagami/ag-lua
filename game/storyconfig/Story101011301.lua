return {
	Play101131001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 101131001
		arg_1_1.duration_ = 7.3

		local var_1_0 = {
			ja = 7.3,
			ko = 5.5,
			zh = 7.133,
			en = 4.366
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
				arg_1_0:Play101131002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory.awb")
			end

			local var_4_8 = "2020_tpose"

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

			local var_4_12 = arg_1_1.actors_["2020_tpose"]
			local var_4_13 = 2

			if var_4_13 < arg_1_1.time_ and arg_1_1.time_ <= var_4_13 + arg_4_0 and arg_1_1.var_.characterEffect2020_tpose == nil then
				arg_1_1.var_.characterEffect2020_tpose = var_4_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_14 = 0.1

			if var_4_13 <= arg_1_1.time_ and arg_1_1.time_ < var_4_13 + var_4_14 then
				local var_4_15 = (arg_1_1.time_ - var_4_13) / var_4_14

				if arg_1_1.var_.characterEffect2020_tpose then
					arg_1_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_13 + var_4_14 and arg_1_1.time_ < var_4_13 + var_4_14 + arg_4_0 and arg_1_1.var_.characterEffect2020_tpose then
				arg_1_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_4_16 = "B02f"

			if arg_1_1.bgs_[var_4_16] == nil then
				local var_4_17 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_17:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_16)
				var_4_17.name = var_4_16
				var_4_17.transform.parent = arg_1_1.stage_.transform
				var_4_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_16] = var_4_17
			end

			local var_4_18 = arg_1_1.bgs_.B02f
			local var_4_19 = 0

			if var_4_19 < arg_1_1.time_ and arg_1_1.time_ <= var_4_19 + arg_4_0 then
				local var_4_20 = var_4_18:GetComponent("SpriteRenderer")

				if var_4_20 then
					var_4_20.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_21 = var_4_20.material
					local var_4_22 = var_4_21:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB02f = var_4_22.a
					arg_1_1.var_.alphaMatValueB02f = var_4_21
				end

				arg_1_1.var_.alphaOldValueB02f = 0
			end

			local var_4_23 = 1.5

			if var_4_19 <= arg_1_1.time_ and arg_1_1.time_ < var_4_19 + var_4_23 then
				local var_4_24 = (arg_1_1.time_ - var_4_19) / var_4_23
				local var_4_25 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB02f, 1, var_4_24)

				if arg_1_1.var_.alphaMatValueB02f then
					local var_4_26 = arg_1_1.var_.alphaMatValueB02f
					local var_4_27 = var_4_26:GetColor("_Color")

					var_4_27.a = var_4_25

					var_4_26:SetColor("_Color", var_4_27)
				end
			end

			if arg_1_1.time_ >= var_4_19 + var_4_23 and arg_1_1.time_ < var_4_19 + var_4_23 + arg_4_0 and arg_1_1.var_.alphaMatValueB02f then
				local var_4_28 = arg_1_1.var_.alphaMatValueB02f
				local var_4_29 = var_4_28:GetColor("_Color")

				var_4_29.a = 1

				var_4_28:SetColor("_Color", var_4_29)
			end

			local var_4_30 = 0

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_31 = manager.ui.mainCamera.transform.localPosition
				local var_4_32 = Vector3.New(0, 0, 10) + Vector3.New(var_4_31.x, var_4_31.y, 0)
				local var_4_33 = arg_1_1.bgs_.B02f

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
					if iter_4_0 ~= "B02f" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_44 = arg_1_1.actors_["2020_tpose"].transform
			local var_4_45 = 1.79999995231628

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1.var_.moveOldPos2020_tpose = var_4_44.localPosition
			end

			local var_4_46 = 0.001

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				local var_4_47 = (arg_1_1.time_ - var_4_45) / var_4_46
				local var_4_48 = Vector3.New(0, -1.2, -4.1)

				var_4_44.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos2020_tpose, var_4_48, var_4_47)

				local var_4_49 = manager.ui.mainCamera.transform.position - var_4_44.position

				var_4_44.forward = Vector3.New(var_4_49.x, var_4_49.y, var_4_49.z)

				local var_4_50 = var_4_44.localEulerAngles

				var_4_50.z = 0
				var_4_50.x = 0
				var_4_44.localEulerAngles = var_4_50
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				var_4_44.localPosition = Vector3.New(0, -1.2, -4.1)

				local var_4_51 = manager.ui.mainCamera.transform.position - var_4_44.position

				var_4_44.forward = Vector3.New(var_4_51.x, var_4_51.y, var_4_51.z)

				local var_4_52 = var_4_44.localEulerAngles

				var_4_52.z = 0
				var_4_52.x = 0
				var_4_44.localEulerAngles = var_4_52
			end

			local var_4_53 = 0

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
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
			local var_4_57 = 0.375

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

				local var_4_59 = arg_1_1:FormatText(StoryNameCfg[19].name)

				arg_1_1.leftNameTxt_.text = var_4_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_60 = arg_1_1:GetWordFromCfg(101131001)
				local var_4_61 = arg_1_1:FormatText(var_4_60.content)

				arg_1_1.text_.text = var_4_61

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_62 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131001", "story_v_out_101131.awb") ~= 0 then
					local var_4_65 = manager.audio:GetVoiceLength("story_v_out_101131", "101131001", "story_v_out_101131.awb") / 1000

					if var_4_65 + var_4_56 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_65 + var_4_56
					end

					if var_4_60.prefab_name ~= "" and arg_1_1.actors_[var_4_60.prefab_name] ~= nil then
						local var_4_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_60.prefab_name].transform, "story_v_out_101131", "101131001", "story_v_out_101131.awb")

						arg_1_1:RecordAudio("101131001", var_4_66)
						arg_1_1:RecordAudio("101131001", var_4_66)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_101131", "101131001", "story_v_out_101131.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_101131", "101131001", "story_v_out_101131.awb")
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
	Play101131002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101131002
		arg_7_1.duration_ = 5.3

		local var_7_0 = {
			ja = 5.3,
			ko = 4.2,
			zh = 3,
			en = 3.533
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
				arg_7_0:Play101131003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1084ui_story"

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

			local var_10_4 = arg_7_1.actors_["1084ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["2020_tpose"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect2020_tpose == nil then
				arg_7_1.var_.characterEffect2020_tpose = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect2020_tpose then
					local var_10_12 = Mathf.Lerp(0, 0.5, var_10_11)

					arg_7_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_7_1.var_.characterEffect2020_tpose.fillRatio = var_10_12
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect2020_tpose then
				local var_10_13 = 0.5

				arg_7_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_7_1.var_.characterEffect2020_tpose.fillRatio = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["2020_tpose"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos2020_tpose = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -1.2, -4.1)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2020_tpose, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -1.2, -4.1)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_23.localPosition
			end

			local var_10_25 = 0.001

			if var_10_24 <= arg_7_1.time_ and arg_7_1.time_ < var_10_24 + var_10_25 then
				local var_10_26 = (arg_7_1.time_ - var_10_24) / var_10_25
				local var_10_27 = Vector3.New(-0.7, -0.97, -6)

				var_10_23.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_27, var_10_26)

				local var_10_28 = manager.ui.mainCamera.transform.position - var_10_23.position

				var_10_23.forward = Vector3.New(var_10_28.x, var_10_28.y, var_10_28.z)

				local var_10_29 = var_10_23.localEulerAngles

				var_10_29.z = 0
				var_10_29.x = 0
				var_10_23.localEulerAngles = var_10_29
			end

			if arg_7_1.time_ >= var_10_24 + var_10_25 and arg_7_1.time_ < var_10_24 + var_10_25 + arg_10_0 then
				var_10_23.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_10_30 = manager.ui.mainCamera.transform.position - var_10_23.position

				var_10_23.forward = Vector3.New(var_10_30.x, var_10_30.y, var_10_30.z)

				local var_10_31 = var_10_23.localEulerAngles

				var_10_31.z = 0
				var_10_31.x = 0
				var_10_23.localEulerAngles = var_10_31
			end

			local var_10_32 = 0

			if var_10_32 < arg_7_1.time_ and arg_7_1.time_ <= var_10_32 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_10_33 = 0

			if var_10_33 < arg_7_1.time_ and arg_7_1.time_ <= var_10_33 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_10_34 = 0
			local var_10_35 = 0.35

			if var_10_34 < arg_7_1.time_ and arg_7_1.time_ <= var_10_34 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_36 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_37 = arg_7_1:GetWordFromCfg(101131002)
				local var_10_38 = arg_7_1:FormatText(var_10_37.content)

				arg_7_1.text_.text = var_10_38

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_39 = 12
				local var_10_40 = utf8.len(var_10_38)
				local var_10_41 = var_10_39 <= 0 and var_10_35 or var_10_35 * (var_10_40 / var_10_39)

				if var_10_41 > 0 and var_10_35 < var_10_41 then
					arg_7_1.talkMaxDuration = var_10_41

					if var_10_41 + var_10_34 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_41 + var_10_34
					end
				end

				arg_7_1.text_.text = var_10_38
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131002", "story_v_out_101131.awb") ~= 0 then
					local var_10_42 = manager.audio:GetVoiceLength("story_v_out_101131", "101131002", "story_v_out_101131.awb") / 1000

					if var_10_42 + var_10_34 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_42 + var_10_34
					end

					if var_10_37.prefab_name ~= "" and arg_7_1.actors_[var_10_37.prefab_name] ~= nil then
						local var_10_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_37.prefab_name].transform, "story_v_out_101131", "101131002", "story_v_out_101131.awb")

						arg_7_1:RecordAudio("101131002", var_10_43)
						arg_7_1:RecordAudio("101131002", var_10_43)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_101131", "101131002", "story_v_out_101131.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_101131", "101131002", "story_v_out_101131.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_44 = math.max(var_10_35, arg_7_1.talkMaxDuration)

			if var_10_34 <= arg_7_1.time_ and arg_7_1.time_ < var_10_34 + var_10_44 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_34) / var_10_44

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_34 + var_10_44 and arg_7_1.time_ < var_10_34 + var_10_44 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play101131003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 101131003
		arg_11_1.duration_ = 4.6

		local var_11_0 = {
			ja = 4.6,
			ko = 1.999999999999,
			zh = 2,
			en = 1.999999999999
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
				arg_11_0:Play101131004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["2020_tpose"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect2020_tpose == nil then
				arg_11_1.var_.characterEffect2020_tpose = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.1

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect2020_tpose then
					arg_11_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect2020_tpose then
				arg_11_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_14_4 = arg_11_1.actors_["1084ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect1084ui_story then
					local var_14_8 = Mathf.Lerp(0, 0.5, var_14_7)

					arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_8
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				local var_14_9 = 0.5

				arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_9
			end

			local var_14_10 = arg_11_1.actors_["2020_tpose"].transform
			local var_14_11 = 0

			if var_14_11 < arg_11_1.time_ and arg_11_1.time_ <= var_14_11 + arg_14_0 then
				arg_11_1.var_.moveOldPos2020_tpose = var_14_10.localPosition
			end

			local var_14_12 = 0.001

			if var_14_11 <= arg_11_1.time_ and arg_11_1.time_ < var_14_11 + var_14_12 then
				local var_14_13 = (arg_11_1.time_ - var_14_11) / var_14_12
				local var_14_14 = Vector3.New(0.7, -1.2, -4.1)

				var_14_10.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2020_tpose, var_14_14, var_14_13)

				local var_14_15 = manager.ui.mainCamera.transform.position - var_14_10.position

				var_14_10.forward = Vector3.New(var_14_15.x, var_14_15.y, var_14_15.z)

				local var_14_16 = var_14_10.localEulerAngles

				var_14_16.z = 0
				var_14_16.x = 0
				var_14_10.localEulerAngles = var_14_16
			end

			if arg_11_1.time_ >= var_14_11 + var_14_12 and arg_11_1.time_ < var_14_11 + var_14_12 + arg_14_0 then
				var_14_10.localPosition = Vector3.New(0.7, -1.2, -4.1)

				local var_14_17 = manager.ui.mainCamera.transform.position - var_14_10.position

				var_14_10.forward = Vector3.New(var_14_17.x, var_14_17.y, var_14_17.z)

				local var_14_18 = var_14_10.localEulerAngles

				var_14_18.z = 0
				var_14_18.x = 0
				var_14_10.localEulerAngles = var_14_18
			end

			local var_14_19 = 0

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_14_20 = 0
			local var_14_21 = 0.15

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_22 = arg_11_1:FormatText(StoryNameCfg[19].name)

				arg_11_1.leftNameTxt_.text = var_14_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_23 = arg_11_1:GetWordFromCfg(101131003)
				local var_14_24 = arg_11_1:FormatText(var_14_23.content)

				arg_11_1.text_.text = var_14_24

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_25 = 6
				local var_14_26 = utf8.len(var_14_24)
				local var_14_27 = var_14_25 <= 0 and var_14_21 or var_14_21 * (var_14_26 / var_14_25)

				if var_14_27 > 0 and var_14_21 < var_14_27 then
					arg_11_1.talkMaxDuration = var_14_27

					if var_14_27 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_20
					end
				end

				arg_11_1.text_.text = var_14_24
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131003", "story_v_out_101131.awb") ~= 0 then
					local var_14_28 = manager.audio:GetVoiceLength("story_v_out_101131", "101131003", "story_v_out_101131.awb") / 1000

					if var_14_28 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_20
					end

					if var_14_23.prefab_name ~= "" and arg_11_1.actors_[var_14_23.prefab_name] ~= nil then
						local var_14_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_23.prefab_name].transform, "story_v_out_101131", "101131003", "story_v_out_101131.awb")

						arg_11_1:RecordAudio("101131003", var_14_29)
						arg_11_1:RecordAudio("101131003", var_14_29)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_101131", "101131003", "story_v_out_101131.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_101131", "101131003", "story_v_out_101131.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_30 = math.max(var_14_21, arg_11_1.talkMaxDuration)

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_30 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_20) / var_14_30

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_20 + var_14_30 and arg_11_1.time_ < var_14_20 + var_14_30 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play101131004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 101131004
		arg_15_1.duration_ = 7.5

		local var_15_0 = {
			ja = 7.5,
			ko = 6.566,
			zh = 6.6,
			en = 6.333
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
				arg_15_0:Play101131005(arg_15_1)
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

			local var_18_8 = arg_15_1.actors_["2020_tpose"]
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 and arg_15_1.var_.characterEffect2020_tpose == nil then
				arg_15_1.var_.characterEffect2020_tpose = var_18_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_10 = 0.1

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10

				if arg_15_1.var_.characterEffect2020_tpose then
					local var_18_12 = Mathf.Lerp(0, 0.5, var_18_11)

					arg_15_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_15_1.var_.characterEffect2020_tpose.fillRatio = var_18_12
				end
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect2020_tpose then
				local var_18_13 = 0.5

				arg_15_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_15_1.var_.characterEffect2020_tpose.fillRatio = var_18_13
			end

			local var_18_14 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0, 100, 0)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_18, var_18_17)

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

			local var_18_23 = arg_15_1.actors_["1011ui_story"].transform
			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.var_.moveOldPos1011ui_story = var_18_23.localPosition
			end

			local var_18_25 = 0.001

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_25 then
				local var_18_26 = (arg_15_1.time_ - var_18_24) / var_18_25
				local var_18_27 = Vector3.New(-0.7, -0.71, -6)

				var_18_23.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1011ui_story, var_18_27, var_18_26)

				local var_18_28 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_28.x, var_18_28.y, var_18_28.z)

				local var_18_29 = var_18_23.localEulerAngles

				var_18_29.z = 0
				var_18_29.x = 0
				var_18_23.localEulerAngles = var_18_29
			end

			if arg_15_1.time_ >= var_18_24 + var_18_25 and arg_15_1.time_ < var_18_24 + var_18_25 + arg_18_0 then
				var_18_23.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_18_30 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_30.x, var_18_30.y, var_18_30.z)

				local var_18_31 = var_18_23.localEulerAngles

				var_18_31.z = 0
				var_18_31.x = 0
				var_18_23.localEulerAngles = var_18_31
			end

			local var_18_32 = 0

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 then
				arg_15_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_18_34 = 0
			local var_18_35 = 0.8

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_36 = arg_15_1:FormatText(StoryNameCfg[37].name)

				arg_15_1.leftNameTxt_.text = var_18_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_37 = arg_15_1:GetWordFromCfg(101131004)
				local var_18_38 = arg_15_1:FormatText(var_18_37.content)

				arg_15_1.text_.text = var_18_38

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_39 = 30
				local var_18_40 = utf8.len(var_18_38)
				local var_18_41 = var_18_39 <= 0 and var_18_35 or var_18_35 * (var_18_40 / var_18_39)

				if var_18_41 > 0 and var_18_35 < var_18_41 then
					arg_15_1.talkMaxDuration = var_18_41

					if var_18_41 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_41 + var_18_34
					end
				end

				arg_15_1.text_.text = var_18_38
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131004", "story_v_out_101131.awb") ~= 0 then
					local var_18_42 = manager.audio:GetVoiceLength("story_v_out_101131", "101131004", "story_v_out_101131.awb") / 1000

					if var_18_42 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_34
					end

					if var_18_37.prefab_name ~= "" and arg_15_1.actors_[var_18_37.prefab_name] ~= nil then
						local var_18_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_37.prefab_name].transform, "story_v_out_101131", "101131004", "story_v_out_101131.awb")

						arg_15_1:RecordAudio("101131004", var_18_43)
						arg_15_1:RecordAudio("101131004", var_18_43)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_101131", "101131004", "story_v_out_101131.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_101131", "101131004", "story_v_out_101131.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_44 = math.max(var_18_35, arg_15_1.talkMaxDuration)

			if var_18_34 <= arg_15_1.time_ and arg_15_1.time_ < var_18_34 + var_18_44 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_34) / var_18_44

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_34 + var_18_44 and arg_15_1.time_ < var_18_34 + var_18_44 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play101131005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 101131005
		arg_19_1.duration_ = 6.666

		local var_19_0 = {
			ja = 5.966,
			ko = 5.6,
			zh = 6.466,
			en = 6.666
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
				arg_19_0:Play101131006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1019ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("Char/" .. var_22_0), arg_19_1.stage_.transform)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_0] = var_22_1

				local var_22_2 = var_22_1:GetComponentInChildren(typeof(CharacterEffect))

				var_22_2.enabled = true

				local var_22_3 = GameObjectTools.GetOrAddComponent(var_22_1, typeof(DynamicBoneHelper))

				if var_22_3 then
					var_22_3:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_2.transform, false)

				arg_19_1.var_[var_22_0 .. "Animator"] = var_22_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_4 = arg_19_1.actors_["1019ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story == nil then
				arg_19_1.var_.characterEffect1019ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1019ui_story then
					arg_19_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story then
				arg_19_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_22_8 = arg_19_1.actors_["2020_tpose"]
			local var_22_9 = 0

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 and arg_19_1.var_.characterEffect2020_tpose == nil then
				arg_19_1.var_.characterEffect2020_tpose = var_22_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_10 = 0.1

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_10 then
				local var_22_11 = (arg_19_1.time_ - var_22_9) / var_22_10

				if arg_19_1.var_.characterEffect2020_tpose then
					local var_22_12 = Mathf.Lerp(0, 0.5, var_22_11)

					arg_19_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_19_1.var_.characterEffect2020_tpose.fillRatio = var_22_12
				end
			end

			if arg_19_1.time_ >= var_22_9 + var_22_10 and arg_19_1.time_ < var_22_9 + var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect2020_tpose then
				local var_22_13 = 0.5

				arg_19_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_19_1.var_.characterEffect2020_tpose.fillRatio = var_22_13
			end

			local var_22_14 = arg_19_1.actors_["1011ui_story"].transform
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.var_.moveOldPos1011ui_story = var_22_14.localPosition
			end

			local var_22_16 = 0.001

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_16 then
				local var_22_17 = (arg_19_1.time_ - var_22_15) / var_22_16
				local var_22_18 = Vector3.New(0.7, -0.71, -6)

				var_22_14.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1011ui_story, var_22_18, var_22_17)

				local var_22_19 = manager.ui.mainCamera.transform.position - var_22_14.position

				var_22_14.forward = Vector3.New(var_22_19.x, var_22_19.y, var_22_19.z)

				local var_22_20 = var_22_14.localEulerAngles

				var_22_20.z = 0
				var_22_20.x = 0
				var_22_14.localEulerAngles = var_22_20
			end

			if arg_19_1.time_ >= var_22_15 + var_22_16 and arg_19_1.time_ < var_22_15 + var_22_16 + arg_22_0 then
				var_22_14.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_22_21 = manager.ui.mainCamera.transform.position - var_22_14.position

				var_22_14.forward = Vector3.New(var_22_21.x, var_22_21.y, var_22_21.z)

				local var_22_22 = var_22_14.localEulerAngles

				var_22_22.z = 0
				var_22_22.x = 0
				var_22_14.localEulerAngles = var_22_22
			end

			local var_22_23 = 0

			if var_22_23 < arg_19_1.time_ and arg_19_1.time_ <= var_22_23 + arg_22_0 then
				arg_19_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_22_24 = arg_19_1.actors_["1019ui_story"].transform
			local var_22_25 = 0

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1.var_.moveOldPos1019ui_story = var_22_24.localPosition
			end

			local var_22_26 = 0.001

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_26 then
				local var_22_27 = (arg_19_1.time_ - var_22_25) / var_22_26
				local var_22_28 = Vector3.New(-0.7, -1.08, -5.9)

				var_22_24.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1019ui_story, var_22_28, var_22_27)

				local var_22_29 = manager.ui.mainCamera.transform.position - var_22_24.position

				var_22_24.forward = Vector3.New(var_22_29.x, var_22_29.y, var_22_29.z)

				local var_22_30 = var_22_24.localEulerAngles

				var_22_30.z = 0
				var_22_30.x = 0
				var_22_24.localEulerAngles = var_22_30
			end

			if arg_19_1.time_ >= var_22_25 + var_22_26 and arg_19_1.time_ < var_22_25 + var_22_26 + arg_22_0 then
				var_22_24.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_22_31 = manager.ui.mainCamera.transform.position - var_22_24.position

				var_22_24.forward = Vector3.New(var_22_31.x, var_22_31.y, var_22_31.z)

				local var_22_32 = var_22_24.localEulerAngles

				var_22_32.z = 0
				var_22_32.x = 0
				var_22_24.localEulerAngles = var_22_32
			end

			local var_22_33 = 0

			if var_22_33 < arg_19_1.time_ and arg_19_1.time_ <= var_22_33 + arg_22_0 then
				arg_19_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_22_34 = arg_19_1.actors_["2020_tpose"].transform
			local var_22_35 = 0

			if var_22_35 < arg_19_1.time_ and arg_19_1.time_ <= var_22_35 + arg_22_0 then
				arg_19_1.var_.moveOldPos2020_tpose = var_22_34.localPosition
			end

			local var_22_36 = 0.001

			if var_22_35 <= arg_19_1.time_ and arg_19_1.time_ < var_22_35 + var_22_36 then
				local var_22_37 = (arg_19_1.time_ - var_22_35) / var_22_36
				local var_22_38 = Vector3.New(0, 100, 0)

				var_22_34.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos2020_tpose, var_22_38, var_22_37)

				local var_22_39 = manager.ui.mainCamera.transform.position - var_22_34.position

				var_22_34.forward = Vector3.New(var_22_39.x, var_22_39.y, var_22_39.z)

				local var_22_40 = var_22_34.localEulerAngles

				var_22_40.z = 0
				var_22_40.x = 0
				var_22_34.localEulerAngles = var_22_40
			end

			if arg_19_1.time_ >= var_22_35 + var_22_36 and arg_19_1.time_ < var_22_35 + var_22_36 + arg_22_0 then
				var_22_34.localPosition = Vector3.New(0, 100, 0)

				local var_22_41 = manager.ui.mainCamera.transform.position - var_22_34.position

				var_22_34.forward = Vector3.New(var_22_41.x, var_22_41.y, var_22_41.z)

				local var_22_42 = var_22_34.localEulerAngles

				var_22_42.z = 0
				var_22_42.x = 0
				var_22_34.localEulerAngles = var_22_42
			end

			local var_22_43 = 0
			local var_22_44 = 0.8

			if var_22_43 < arg_19_1.time_ and arg_19_1.time_ <= var_22_43 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_45 = arg_19_1:FormatText(StoryNameCfg[13].name)

				arg_19_1.leftNameTxt_.text = var_22_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_46 = arg_19_1:GetWordFromCfg(101131005)
				local var_22_47 = arg_19_1:FormatText(var_22_46.content)

				arg_19_1.text_.text = var_22_47

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_48 = 32
				local var_22_49 = utf8.len(var_22_47)
				local var_22_50 = var_22_48 <= 0 and var_22_44 or var_22_44 * (var_22_49 / var_22_48)

				if var_22_50 > 0 and var_22_44 < var_22_50 then
					arg_19_1.talkMaxDuration = var_22_50

					if var_22_50 + var_22_43 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_50 + var_22_43
					end
				end

				arg_19_1.text_.text = var_22_47
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131005", "story_v_out_101131.awb") ~= 0 then
					local var_22_51 = manager.audio:GetVoiceLength("story_v_out_101131", "101131005", "story_v_out_101131.awb") / 1000

					if var_22_51 + var_22_43 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_51 + var_22_43
					end

					if var_22_46.prefab_name ~= "" and arg_19_1.actors_[var_22_46.prefab_name] ~= nil then
						local var_22_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_46.prefab_name].transform, "story_v_out_101131", "101131005", "story_v_out_101131.awb")

						arg_19_1:RecordAudio("101131005", var_22_52)
						arg_19_1:RecordAudio("101131005", var_22_52)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_101131", "101131005", "story_v_out_101131.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_101131", "101131005", "story_v_out_101131.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_53 = math.max(var_22_44, arg_19_1.talkMaxDuration)

			if var_22_43 <= arg_19_1.time_ and arg_19_1.time_ < var_22_43 + var_22_53 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_43) / var_22_53

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_43 + var_22_53 and arg_19_1.time_ < var_22_43 + var_22_53 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play101131006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 101131006
		arg_23_1.duration_ = 2.933

		local var_23_0 = {
			ja = 2.933,
			ko = 2.7,
			zh = 2.833,
			en = 2.733
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
				arg_23_0:Play101131007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["2020_tpose"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect2020_tpose == nil then
				arg_23_1.var_.characterEffect2020_tpose = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect2020_tpose then
					arg_23_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect2020_tpose then
				arg_23_1.var_.characterEffect2020_tpose.fillFlat = false
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
					local var_26_8 = Mathf.Lerp(0, 0.5, var_26_7)

					arg_23_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1019ui_story.fillRatio = var_26_8
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				local var_26_9 = 0.5

				arg_23_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1019ui_story.fillRatio = var_26_9
			end

			local var_26_10 = arg_23_1.actors_["2020_tpose"].transform
			local var_26_11 = 0

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				arg_23_1.var_.moveOldPos2020_tpose = var_26_10.localPosition
			end

			local var_26_12 = 0.001

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_12 then
				local var_26_13 = (arg_23_1.time_ - var_26_11) / var_26_12
				local var_26_14 = Vector3.New(0, -1.2, -4.1)

				var_26_10.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos2020_tpose, var_26_14, var_26_13)

				local var_26_15 = manager.ui.mainCamera.transform.position - var_26_10.position

				var_26_10.forward = Vector3.New(var_26_15.x, var_26_15.y, var_26_15.z)

				local var_26_16 = var_26_10.localEulerAngles

				var_26_16.z = 0
				var_26_16.x = 0
				var_26_10.localEulerAngles = var_26_16
			end

			if arg_23_1.time_ >= var_26_11 + var_26_12 and arg_23_1.time_ < var_26_11 + var_26_12 + arg_26_0 then
				var_26_10.localPosition = Vector3.New(0, -1.2, -4.1)

				local var_26_17 = manager.ui.mainCamera.transform.position - var_26_10.position

				var_26_10.forward = Vector3.New(var_26_17.x, var_26_17.y, var_26_17.z)

				local var_26_18 = var_26_10.localEulerAngles

				var_26_18.z = 0
				var_26_18.x = 0
				var_26_10.localEulerAngles = var_26_18
			end

			local var_26_19 = arg_23_1.actors_["1019ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos1019ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(0, 100, 0)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1019ui_story, var_26_23, var_26_22)

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

			local var_26_28 = arg_23_1.actors_["1011ui_story"].transform
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				arg_23_1.var_.moveOldPos1011ui_story = var_26_28.localPosition
			end

			local var_26_30 = 0.001

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_30 then
				local var_26_31 = (arg_23_1.time_ - var_26_29) / var_26_30
				local var_26_32 = Vector3.New(0, 100, 0)

				var_26_28.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1011ui_story, var_26_32, var_26_31)

				local var_26_33 = manager.ui.mainCamera.transform.position - var_26_28.position

				var_26_28.forward = Vector3.New(var_26_33.x, var_26_33.y, var_26_33.z)

				local var_26_34 = var_26_28.localEulerAngles

				var_26_34.z = 0
				var_26_34.x = 0
				var_26_28.localEulerAngles = var_26_34
			end

			if arg_23_1.time_ >= var_26_29 + var_26_30 and arg_23_1.time_ < var_26_29 + var_26_30 + arg_26_0 then
				var_26_28.localPosition = Vector3.New(0, 100, 0)

				local var_26_35 = manager.ui.mainCamera.transform.position - var_26_28.position

				var_26_28.forward = Vector3.New(var_26_35.x, var_26_35.y, var_26_35.z)

				local var_26_36 = var_26_28.localEulerAngles

				var_26_36.z = 0
				var_26_36.x = 0
				var_26_28.localEulerAngles = var_26_36
			end

			local var_26_37 = 0
			local var_26_38 = 0.325

			if var_26_37 < arg_23_1.time_ and arg_23_1.time_ <= var_26_37 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_39 = arg_23_1:FormatText(StoryNameCfg[19].name)

				arg_23_1.leftNameTxt_.text = var_26_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_40 = arg_23_1:GetWordFromCfg(101131006)
				local var_26_41 = arg_23_1:FormatText(var_26_40.content)

				arg_23_1.text_.text = var_26_41

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_42 = 12
				local var_26_43 = utf8.len(var_26_41)
				local var_26_44 = var_26_42 <= 0 and var_26_38 or var_26_38 * (var_26_43 / var_26_42)

				if var_26_44 > 0 and var_26_38 < var_26_44 then
					arg_23_1.talkMaxDuration = var_26_44

					if var_26_44 + var_26_37 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_44 + var_26_37
					end
				end

				arg_23_1.text_.text = var_26_41
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131006", "story_v_out_101131.awb") ~= 0 then
					local var_26_45 = manager.audio:GetVoiceLength("story_v_out_101131", "101131006", "story_v_out_101131.awb") / 1000

					if var_26_45 + var_26_37 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_45 + var_26_37
					end

					if var_26_40.prefab_name ~= "" and arg_23_1.actors_[var_26_40.prefab_name] ~= nil then
						local var_26_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_40.prefab_name].transform, "story_v_out_101131", "101131006", "story_v_out_101131.awb")

						arg_23_1:RecordAudio("101131006", var_26_46)
						arg_23_1:RecordAudio("101131006", var_26_46)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_101131", "101131006", "story_v_out_101131.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_101131", "101131006", "story_v_out_101131.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_47 = math.max(var_26_38, arg_23_1.talkMaxDuration)

			if var_26_37 <= arg_23_1.time_ and arg_23_1.time_ < var_26_37 + var_26_47 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_37) / var_26_47

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_37 + var_26_47 and arg_23_1.time_ < var_26_37 + var_26_47 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play101131007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 101131007
		arg_27_1.duration_ = 7.733

		local var_27_0 = {
			ja = 7.733,
			ko = 6.033,
			zh = 5,
			en = 3.766
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
				arg_27_0:Play101131008(arg_27_1)
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
					arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["2020_tpose"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose == nil then
				arg_27_1.var_.characterEffect2020_tpose = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect2020_tpose then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_27_1.var_.characterEffect2020_tpose.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_27_1.var_.characterEffect2020_tpose.fillRatio = var_30_9
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_30_11 = arg_27_1.actors_["1019ui_story"].transform
			local var_30_12 = 0

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.var_.moveOldPos1019ui_story = var_30_11.localPosition
			end

			local var_30_13 = 0.001

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_13 then
				local var_30_14 = (arg_27_1.time_ - var_30_12) / var_30_13
				local var_30_15 = Vector3.New(-0.7, -1.08, -5.9)

				var_30_11.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1019ui_story, var_30_15, var_30_14)

				local var_30_16 = manager.ui.mainCamera.transform.position - var_30_11.position

				var_30_11.forward = Vector3.New(var_30_16.x, var_30_16.y, var_30_16.z)

				local var_30_17 = var_30_11.localEulerAngles

				var_30_17.z = 0
				var_30_17.x = 0
				var_30_11.localEulerAngles = var_30_17
			end

			if arg_27_1.time_ >= var_30_12 + var_30_13 and arg_27_1.time_ < var_30_12 + var_30_13 + arg_30_0 then
				var_30_11.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_30_18 = manager.ui.mainCamera.transform.position - var_30_11.position

				var_30_11.forward = Vector3.New(var_30_18.x, var_30_18.y, var_30_18.z)

				local var_30_19 = var_30_11.localEulerAngles

				var_30_19.z = 0
				var_30_19.x = 0
				var_30_11.localEulerAngles = var_30_19
			end

			local var_30_20 = arg_27_1.actors_["1011ui_story"].transform
			local var_30_21 = 0

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 then
				arg_27_1.var_.moveOldPos1011ui_story = var_30_20.localPosition
			end

			local var_30_22 = 0.001

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_21) / var_30_22
				local var_30_24 = Vector3.New(0.7, -0.71, -6)

				var_30_20.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1011ui_story, var_30_24, var_30_23)

				local var_30_25 = manager.ui.mainCamera.transform.position - var_30_20.position

				var_30_20.forward = Vector3.New(var_30_25.x, var_30_25.y, var_30_25.z)

				local var_30_26 = var_30_20.localEulerAngles

				var_30_26.z = 0
				var_30_26.x = 0
				var_30_20.localEulerAngles = var_30_26
			end

			if arg_27_1.time_ >= var_30_21 + var_30_22 and arg_27_1.time_ < var_30_21 + var_30_22 + arg_30_0 then
				var_30_20.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_30_27 = manager.ui.mainCamera.transform.position - var_30_20.position

				var_30_20.forward = Vector3.New(var_30_27.x, var_30_27.y, var_30_27.z)

				local var_30_28 = var_30_20.localEulerAngles

				var_30_28.z = 0
				var_30_28.x = 0
				var_30_20.localEulerAngles = var_30_28
			end

			local var_30_29 = arg_27_1.actors_["2020_tpose"].transform
			local var_30_30 = 0

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1.var_.moveOldPos2020_tpose = var_30_29.localPosition
			end

			local var_30_31 = 0.001

			if var_30_30 <= arg_27_1.time_ and arg_27_1.time_ < var_30_30 + var_30_31 then
				local var_30_32 = (arg_27_1.time_ - var_30_30) / var_30_31
				local var_30_33 = Vector3.New(0, 100, 0)

				var_30_29.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos2020_tpose, var_30_33, var_30_32)

				local var_30_34 = manager.ui.mainCamera.transform.position - var_30_29.position

				var_30_29.forward = Vector3.New(var_30_34.x, var_30_34.y, var_30_34.z)

				local var_30_35 = var_30_29.localEulerAngles

				var_30_35.z = 0
				var_30_35.x = 0
				var_30_29.localEulerAngles = var_30_35
			end

			if arg_27_1.time_ >= var_30_30 + var_30_31 and arg_27_1.time_ < var_30_30 + var_30_31 + arg_30_0 then
				var_30_29.localPosition = Vector3.New(0, 100, 0)

				local var_30_36 = manager.ui.mainCamera.transform.position - var_30_29.position

				var_30_29.forward = Vector3.New(var_30_36.x, var_30_36.y, var_30_36.z)

				local var_30_37 = var_30_29.localEulerAngles

				var_30_37.z = 0
				var_30_37.x = 0
				var_30_29.localEulerAngles = var_30_37
			end

			local var_30_38 = 0
			local var_30_39 = 0.725

			if var_30_38 < arg_27_1.time_ and arg_27_1.time_ <= var_30_38 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_40 = arg_27_1:FormatText(StoryNameCfg[13].name)

				arg_27_1.leftNameTxt_.text = var_30_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_41 = arg_27_1:GetWordFromCfg(101131007)
				local var_30_42 = arg_27_1:FormatText(var_30_41.content)

				arg_27_1.text_.text = var_30_42

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_43 = 27
				local var_30_44 = utf8.len(var_30_42)
				local var_30_45 = var_30_43 <= 0 and var_30_39 or var_30_39 * (var_30_44 / var_30_43)

				if var_30_45 > 0 and var_30_39 < var_30_45 then
					arg_27_1.talkMaxDuration = var_30_45

					if var_30_45 + var_30_38 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_45 + var_30_38
					end
				end

				arg_27_1.text_.text = var_30_42
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131007", "story_v_out_101131.awb") ~= 0 then
					local var_30_46 = manager.audio:GetVoiceLength("story_v_out_101131", "101131007", "story_v_out_101131.awb") / 1000

					if var_30_46 + var_30_38 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_46 + var_30_38
					end

					if var_30_41.prefab_name ~= "" and arg_27_1.actors_[var_30_41.prefab_name] ~= nil then
						local var_30_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_41.prefab_name].transform, "story_v_out_101131", "101131007", "story_v_out_101131.awb")

						arg_27_1:RecordAudio("101131007", var_30_47)
						arg_27_1:RecordAudio("101131007", var_30_47)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_101131", "101131007", "story_v_out_101131.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_101131", "101131007", "story_v_out_101131.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_48 = math.max(var_30_39, arg_27_1.talkMaxDuration)

			if var_30_38 <= arg_27_1.time_ and arg_27_1.time_ < var_30_38 + var_30_48 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_38) / var_30_48

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_38 + var_30_48 and arg_27_1.time_ < var_30_38 + var_30_48 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play101131008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 101131008
		arg_31_1.duration_ = 7.633

		local var_31_0 = {
			ja = 5.833,
			ko = 7.633,
			zh = 5.933,
			en = 6.166
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
				arg_31_0:Play101131009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["2020_tpose"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect2020_tpose == nil then
				arg_31_1.var_.characterEffect2020_tpose = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect2020_tpose then
					arg_31_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect2020_tpose then
				arg_31_1.var_.characterEffect2020_tpose.fillFlat = false
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
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_9
			end

			local var_34_10 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_11 = 0

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_10.localPosition
			end

			local var_34_12 = 0.001

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_12 then
				local var_34_13 = (arg_31_1.time_ - var_34_11) / var_34_12
				local var_34_14 = Vector3.New(0, 100, 0)

				var_34_10.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_14, var_34_13)

				local var_34_15 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_15.x, var_34_15.y, var_34_15.z)

				local var_34_16 = var_34_10.localEulerAngles

				var_34_16.z = 0
				var_34_16.x = 0
				var_34_10.localEulerAngles = var_34_16
			end

			if arg_31_1.time_ >= var_34_11 + var_34_12 and arg_31_1.time_ < var_34_11 + var_34_12 + arg_34_0 then
				var_34_10.localPosition = Vector3.New(0, 100, 0)

				local var_34_17 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_17.x, var_34_17.y, var_34_17.z)

				local var_34_18 = var_34_10.localEulerAngles

				var_34_18.z = 0
				var_34_18.x = 0
				var_34_10.localEulerAngles = var_34_18
			end

			local var_34_19 = arg_31_1.actors_["1011ui_story"].transform
			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1.var_.moveOldPos1011ui_story = var_34_19.localPosition
			end

			local var_34_21 = 0.001

			if var_34_20 <= arg_31_1.time_ and arg_31_1.time_ < var_34_20 + var_34_21 then
				local var_34_22 = (arg_31_1.time_ - var_34_20) / var_34_21
				local var_34_23 = Vector3.New(0, 100, 0)

				var_34_19.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1011ui_story, var_34_23, var_34_22)

				local var_34_24 = manager.ui.mainCamera.transform.position - var_34_19.position

				var_34_19.forward = Vector3.New(var_34_24.x, var_34_24.y, var_34_24.z)

				local var_34_25 = var_34_19.localEulerAngles

				var_34_25.z = 0
				var_34_25.x = 0
				var_34_19.localEulerAngles = var_34_25
			end

			if arg_31_1.time_ >= var_34_20 + var_34_21 and arg_31_1.time_ < var_34_20 + var_34_21 + arg_34_0 then
				var_34_19.localPosition = Vector3.New(0, 100, 0)

				local var_34_26 = manager.ui.mainCamera.transform.position - var_34_19.position

				var_34_19.forward = Vector3.New(var_34_26.x, var_34_26.y, var_34_26.z)

				local var_34_27 = var_34_19.localEulerAngles

				var_34_27.z = 0
				var_34_27.x = 0
				var_34_19.localEulerAngles = var_34_27
			end

			local var_34_28 = arg_31_1.actors_["2020_tpose"].transform
			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.var_.moveOldPos2020_tpose = var_34_28.localPosition
			end

			local var_34_30 = 0.001

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_30 then
				local var_34_31 = (arg_31_1.time_ - var_34_29) / var_34_30
				local var_34_32 = Vector3.New(0, -1.2, -4.1)

				var_34_28.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos2020_tpose, var_34_32, var_34_31)

				local var_34_33 = manager.ui.mainCamera.transform.position - var_34_28.position

				var_34_28.forward = Vector3.New(var_34_33.x, var_34_33.y, var_34_33.z)

				local var_34_34 = var_34_28.localEulerAngles

				var_34_34.z = 0
				var_34_34.x = 0
				var_34_28.localEulerAngles = var_34_34
			end

			if arg_31_1.time_ >= var_34_29 + var_34_30 and arg_31_1.time_ < var_34_29 + var_34_30 + arg_34_0 then
				var_34_28.localPosition = Vector3.New(0, -1.2, -4.1)

				local var_34_35 = manager.ui.mainCamera.transform.position - var_34_28.position

				var_34_28.forward = Vector3.New(var_34_35.x, var_34_35.y, var_34_35.z)

				local var_34_36 = var_34_28.localEulerAngles

				var_34_36.z = 0
				var_34_36.x = 0
				var_34_28.localEulerAngles = var_34_36
			end

			local var_34_37 = 0
			local var_34_38 = 0.875

			if var_34_37 < arg_31_1.time_ and arg_31_1.time_ <= var_34_37 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_39 = arg_31_1:FormatText(StoryNameCfg[19].name)

				arg_31_1.leftNameTxt_.text = var_34_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_40 = arg_31_1:GetWordFromCfg(101131008)
				local var_34_41 = arg_31_1:FormatText(var_34_40.content)

				arg_31_1.text_.text = var_34_41

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_42 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131008", "story_v_out_101131.awb") ~= 0 then
					local var_34_45 = manager.audio:GetVoiceLength("story_v_out_101131", "101131008", "story_v_out_101131.awb") / 1000

					if var_34_45 + var_34_37 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_45 + var_34_37
					end

					if var_34_40.prefab_name ~= "" and arg_31_1.actors_[var_34_40.prefab_name] ~= nil then
						local var_34_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_40.prefab_name].transform, "story_v_out_101131", "101131008", "story_v_out_101131.awb")

						arg_31_1:RecordAudio("101131008", var_34_46)
						arg_31_1:RecordAudio("101131008", var_34_46)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_101131", "101131008", "story_v_out_101131.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_101131", "101131008", "story_v_out_101131.awb")
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
	Play101131009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 101131009
		arg_35_1.duration_ = 5

		local var_35_0 = {
			ja = 5,
			ko = 4.166,
			zh = 3.5,
			en = 4.333
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
				arg_35_0:Play101131010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1019ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1019ui_story == nil then
				arg_35_1.var_.characterEffect1019ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1019ui_story then
					arg_35_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1019ui_story then
				arg_35_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["2020_tpose"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose == nil then
				arg_35_1.var_.characterEffect2020_tpose = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect2020_tpose then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_35_1.var_.characterEffect2020_tpose.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_35_1.var_.characterEffect2020_tpose.fillRatio = var_38_9
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_11 = arg_35_1.actors_["1019ui_story"].transform
			local var_38_12 = 0

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				arg_35_1.var_.moveOldPos1019ui_story = var_38_11.localPosition
			end

			local var_38_13 = 0.001

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_13 then
				local var_38_14 = (arg_35_1.time_ - var_38_12) / var_38_13
				local var_38_15 = Vector3.New(-0.7, -1.08, -5.9)

				var_38_11.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1019ui_story, var_38_15, var_38_14)

				local var_38_16 = manager.ui.mainCamera.transform.position - var_38_11.position

				var_38_11.forward = Vector3.New(var_38_16.x, var_38_16.y, var_38_16.z)

				local var_38_17 = var_38_11.localEulerAngles

				var_38_17.z = 0
				var_38_17.x = 0
				var_38_11.localEulerAngles = var_38_17
			end

			if arg_35_1.time_ >= var_38_12 + var_38_13 and arg_35_1.time_ < var_38_12 + var_38_13 + arg_38_0 then
				var_38_11.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_38_18 = manager.ui.mainCamera.transform.position - var_38_11.position

				var_38_11.forward = Vector3.New(var_38_18.x, var_38_18.y, var_38_18.z)

				local var_38_19 = var_38_11.localEulerAngles

				var_38_19.z = 0
				var_38_19.x = 0
				var_38_11.localEulerAngles = var_38_19
			end

			local var_38_20 = arg_35_1.actors_["1011ui_story"].transform
			local var_38_21 = 0

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.var_.moveOldPos1011ui_story = var_38_20.localPosition
			end

			local var_38_22 = 0.001

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22
				local var_38_24 = Vector3.New(0.7, -0.71, -6)

				var_38_20.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1011ui_story, var_38_24, var_38_23)

				local var_38_25 = manager.ui.mainCamera.transform.position - var_38_20.position

				var_38_20.forward = Vector3.New(var_38_25.x, var_38_25.y, var_38_25.z)

				local var_38_26 = var_38_20.localEulerAngles

				var_38_26.z = 0
				var_38_26.x = 0
				var_38_20.localEulerAngles = var_38_26
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 then
				var_38_20.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_38_27 = manager.ui.mainCamera.transform.position - var_38_20.position

				var_38_20.forward = Vector3.New(var_38_27.x, var_38_27.y, var_38_27.z)

				local var_38_28 = var_38_20.localEulerAngles

				var_38_28.z = 0
				var_38_28.x = 0
				var_38_20.localEulerAngles = var_38_28
			end

			local var_38_29 = arg_35_1.actors_["2020_tpose"].transform
			local var_38_30 = 0

			if var_38_30 < arg_35_1.time_ and arg_35_1.time_ <= var_38_30 + arg_38_0 then
				arg_35_1.var_.moveOldPos2020_tpose = var_38_29.localPosition
			end

			local var_38_31 = 0.001

			if var_38_30 <= arg_35_1.time_ and arg_35_1.time_ < var_38_30 + var_38_31 then
				local var_38_32 = (arg_35_1.time_ - var_38_30) / var_38_31
				local var_38_33 = Vector3.New(0, 100, 0)

				var_38_29.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos2020_tpose, var_38_33, var_38_32)

				local var_38_34 = manager.ui.mainCamera.transform.position - var_38_29.position

				var_38_29.forward = Vector3.New(var_38_34.x, var_38_34.y, var_38_34.z)

				local var_38_35 = var_38_29.localEulerAngles

				var_38_35.z = 0
				var_38_35.x = 0
				var_38_29.localEulerAngles = var_38_35
			end

			if arg_35_1.time_ >= var_38_30 + var_38_31 and arg_35_1.time_ < var_38_30 + var_38_31 + arg_38_0 then
				var_38_29.localPosition = Vector3.New(0, 100, 0)

				local var_38_36 = manager.ui.mainCamera.transform.position - var_38_29.position

				var_38_29.forward = Vector3.New(var_38_36.x, var_38_36.y, var_38_36.z)

				local var_38_37 = var_38_29.localEulerAngles

				var_38_37.z = 0
				var_38_37.x = 0
				var_38_29.localEulerAngles = var_38_37
			end

			local var_38_38 = 0
			local var_38_39 = 0.375

			if var_38_38 < arg_35_1.time_ and arg_35_1.time_ <= var_38_38 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_40 = arg_35_1:FormatText(StoryNameCfg[13].name)

				arg_35_1.leftNameTxt_.text = var_38_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_41 = arg_35_1:GetWordFromCfg(101131009)
				local var_38_42 = arg_35_1:FormatText(var_38_41.content)

				arg_35_1.text_.text = var_38_42

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_43 = 15
				local var_38_44 = utf8.len(var_38_42)
				local var_38_45 = var_38_43 <= 0 and var_38_39 or var_38_39 * (var_38_44 / var_38_43)

				if var_38_45 > 0 and var_38_39 < var_38_45 then
					arg_35_1.talkMaxDuration = var_38_45

					if var_38_45 + var_38_38 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_45 + var_38_38
					end
				end

				arg_35_1.text_.text = var_38_42
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131009", "story_v_out_101131.awb") ~= 0 then
					local var_38_46 = manager.audio:GetVoiceLength("story_v_out_101131", "101131009", "story_v_out_101131.awb") / 1000

					if var_38_46 + var_38_38 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_46 + var_38_38
					end

					if var_38_41.prefab_name ~= "" and arg_35_1.actors_[var_38_41.prefab_name] ~= nil then
						local var_38_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_41.prefab_name].transform, "story_v_out_101131", "101131009", "story_v_out_101131.awb")

						arg_35_1:RecordAudio("101131009", var_38_47)
						arg_35_1:RecordAudio("101131009", var_38_47)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_101131", "101131009", "story_v_out_101131.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_101131", "101131009", "story_v_out_101131.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_48 = math.max(var_38_39, arg_35_1.talkMaxDuration)

			if var_38_38 <= arg_35_1.time_ and arg_35_1.time_ < var_38_38 + var_38_48 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_38) / var_38_48

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_38 + var_38_48 and arg_35_1.time_ < var_38_38 + var_38_48 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play101131010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 101131010
		arg_39_1.duration_ = 2.2

		local var_39_0 = {
			ja = 1.766,
			ko = 1.8,
			zh = 1.666,
			en = 2.2
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
				arg_39_0:Play101131011(arg_39_1)
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

			local var_42_4 = arg_39_1.actors_["2020_tpose"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect2020_tpose == nil then
				arg_39_1.var_.characterEffect2020_tpose = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect2020_tpose then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_39_1.var_.characterEffect2020_tpose.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect2020_tpose then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_39_1.var_.characterEffect2020_tpose.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_11 = 0
			local var_42_12 = 0.175

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_13 = arg_39_1:FormatText(StoryNameCfg[13].name)

				arg_39_1.leftNameTxt_.text = var_42_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_14 = arg_39_1:GetWordFromCfg(101131010)
				local var_42_15 = arg_39_1:FormatText(var_42_14.content)

				arg_39_1.text_.text = var_42_15

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_16 = 7
				local var_42_17 = utf8.len(var_42_15)
				local var_42_18 = var_42_16 <= 0 and var_42_12 or var_42_12 * (var_42_17 / var_42_16)

				if var_42_18 > 0 and var_42_12 < var_42_18 then
					arg_39_1.talkMaxDuration = var_42_18

					if var_42_18 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_11
					end
				end

				arg_39_1.text_.text = var_42_15
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131010", "story_v_out_101131.awb") ~= 0 then
					local var_42_19 = manager.audio:GetVoiceLength("story_v_out_101131", "101131010", "story_v_out_101131.awb") / 1000

					if var_42_19 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_11
					end

					if var_42_14.prefab_name ~= "" and arg_39_1.actors_[var_42_14.prefab_name] ~= nil then
						local var_42_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_14.prefab_name].transform, "story_v_out_101131", "101131010", "story_v_out_101131.awb")

						arg_39_1:RecordAudio("101131010", var_42_20)
						arg_39_1:RecordAudio("101131010", var_42_20)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_101131", "101131010", "story_v_out_101131.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_101131", "101131010", "story_v_out_101131.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_21 = math.max(var_42_12, arg_39_1.talkMaxDuration)

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_21 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_11) / var_42_21

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_11 + var_42_21 and arg_39_1.time_ < var_42_11 + var_42_21 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play101131011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 101131011
		arg_43_1.duration_ = 9.233

		local var_43_0 = {
			ja = 9.233,
			ko = 7.966,
			zh = 7.133,
			en = 6.433
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
				arg_43_0:Play101131012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["2020_tpose"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect2020_tpose == nil then
				arg_43_1.var_.characterEffect2020_tpose = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect2020_tpose then
					arg_43_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect2020_tpose then
				arg_43_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1019ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect1019ui_story == nil then
				arg_43_1.var_.characterEffect1019ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1019ui_story then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1019ui_story.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1019ui_story then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1019ui_story.fillRatio = var_46_9
			end

			local var_46_10 = arg_43_1.actors_["1019ui_story"].transform
			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.var_.moveOldPos1019ui_story = var_46_10.localPosition
			end

			local var_46_12 = 0.001

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_11) / var_46_12
				local var_46_14 = Vector3.New(0, 100, 0)

				var_46_10.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1019ui_story, var_46_14, var_46_13)

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

			local var_46_19 = arg_43_1.actors_["1011ui_story"].transform
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.var_.moveOldPos1011ui_story = var_46_19.localPosition
			end

			local var_46_21 = 0.001

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / var_46_21
				local var_46_23 = Vector3.New(0, 100, 0)

				var_46_19.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1011ui_story, var_46_23, var_46_22)

				local var_46_24 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_24.x, var_46_24.y, var_46_24.z)

				local var_46_25 = var_46_19.localEulerAngles

				var_46_25.z = 0
				var_46_25.x = 0
				var_46_19.localEulerAngles = var_46_25
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 then
				var_46_19.localPosition = Vector3.New(0, 100, 0)

				local var_46_26 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_26.x, var_46_26.y, var_46_26.z)

				local var_46_27 = var_46_19.localEulerAngles

				var_46_27.z = 0
				var_46_27.x = 0
				var_46_19.localEulerAngles = var_46_27
			end

			local var_46_28 = arg_43_1.actors_["2020_tpose"].transform
			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1.var_.moveOldPos2020_tpose = var_46_28.localPosition
			end

			local var_46_30 = 0.001

			if var_46_29 <= arg_43_1.time_ and arg_43_1.time_ < var_46_29 + var_46_30 then
				local var_46_31 = (arg_43_1.time_ - var_46_29) / var_46_30
				local var_46_32 = Vector3.New(0, -1.2, -4.1)

				var_46_28.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos2020_tpose, var_46_32, var_46_31)

				local var_46_33 = manager.ui.mainCamera.transform.position - var_46_28.position

				var_46_28.forward = Vector3.New(var_46_33.x, var_46_33.y, var_46_33.z)

				local var_46_34 = var_46_28.localEulerAngles

				var_46_34.z = 0
				var_46_34.x = 0
				var_46_28.localEulerAngles = var_46_34
			end

			if arg_43_1.time_ >= var_46_29 + var_46_30 and arg_43_1.time_ < var_46_29 + var_46_30 + arg_46_0 then
				var_46_28.localPosition = Vector3.New(0, -1.2, -4.1)

				local var_46_35 = manager.ui.mainCamera.transform.position - var_46_28.position

				var_46_28.forward = Vector3.New(var_46_35.x, var_46_35.y, var_46_35.z)

				local var_46_36 = var_46_28.localEulerAngles

				var_46_36.z = 0
				var_46_36.x = 0
				var_46_28.localEulerAngles = var_46_36
			end

			local var_46_37 = 0
			local var_46_38 = 0.75

			if var_46_37 < arg_43_1.time_ and arg_43_1.time_ <= var_46_37 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_39 = arg_43_1:FormatText(StoryNameCfg[19].name)

				arg_43_1.leftNameTxt_.text = var_46_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_40 = arg_43_1:GetWordFromCfg(101131011)
				local var_46_41 = arg_43_1:FormatText(var_46_40.content)

				arg_43_1.text_.text = var_46_41

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_42 = 30
				local var_46_43 = utf8.len(var_46_41)
				local var_46_44 = var_46_42 <= 0 and var_46_38 or var_46_38 * (var_46_43 / var_46_42)

				if var_46_44 > 0 and var_46_38 < var_46_44 then
					arg_43_1.talkMaxDuration = var_46_44

					if var_46_44 + var_46_37 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_44 + var_46_37
					end
				end

				arg_43_1.text_.text = var_46_41
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131011", "story_v_out_101131.awb") ~= 0 then
					local var_46_45 = manager.audio:GetVoiceLength("story_v_out_101131", "101131011", "story_v_out_101131.awb") / 1000

					if var_46_45 + var_46_37 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_45 + var_46_37
					end

					if var_46_40.prefab_name ~= "" and arg_43_1.actors_[var_46_40.prefab_name] ~= nil then
						local var_46_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_40.prefab_name].transform, "story_v_out_101131", "101131011", "story_v_out_101131.awb")

						arg_43_1:RecordAudio("101131011", var_46_46)
						arg_43_1:RecordAudio("101131011", var_46_46)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_101131", "101131011", "story_v_out_101131.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_101131", "101131011", "story_v_out_101131.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_47 = math.max(var_46_38, arg_43_1.talkMaxDuration)

			if var_46_37 <= arg_43_1.time_ and arg_43_1.time_ < var_46_37 + var_46_47 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_37) / var_46_47

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_37 + var_46_47 and arg_43_1.time_ < var_46_37 + var_46_47 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play101131012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 101131012
		arg_47_1.duration_ = 4.3

		local var_47_0 = {
			ja = 4.3,
			ko = 3.8,
			zh = 3.7,
			en = 4.1
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
				arg_47_0:Play101131013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1019ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1019ui_story == nil then
				arg_47_1.var_.characterEffect1019ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1019ui_story then
					arg_47_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1019ui_story then
				arg_47_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1011ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect1011ui_story == nil then
				arg_47_1.var_.characterEffect1011ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.1

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect1011ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1011ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect1011ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1011ui_story.fillRatio = var_50_9
			end

			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_50_11 = arg_47_1.actors_["1019ui_story"].transform
			local var_50_12 = 0

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.var_.moveOldPos1019ui_story = var_50_11.localPosition
			end

			local var_50_13 = 0.001

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_13 then
				local var_50_14 = (arg_47_1.time_ - var_50_12) / var_50_13
				local var_50_15 = Vector3.New(-0.7, -1.08, -5.9)

				var_50_11.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1019ui_story, var_50_15, var_50_14)

				local var_50_16 = manager.ui.mainCamera.transform.position - var_50_11.position

				var_50_11.forward = Vector3.New(var_50_16.x, var_50_16.y, var_50_16.z)

				local var_50_17 = var_50_11.localEulerAngles

				var_50_17.z = 0
				var_50_17.x = 0
				var_50_11.localEulerAngles = var_50_17
			end

			if arg_47_1.time_ >= var_50_12 + var_50_13 and arg_47_1.time_ < var_50_12 + var_50_13 + arg_50_0 then
				var_50_11.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_50_18 = manager.ui.mainCamera.transform.position - var_50_11.position

				var_50_11.forward = Vector3.New(var_50_18.x, var_50_18.y, var_50_18.z)

				local var_50_19 = var_50_11.localEulerAngles

				var_50_19.z = 0
				var_50_19.x = 0
				var_50_11.localEulerAngles = var_50_19
			end

			local var_50_20 = arg_47_1.actors_["1011ui_story"].transform
			local var_50_21 = 0

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.var_.moveOldPos1011ui_story = var_50_20.localPosition
			end

			local var_50_22 = 0.001

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22
				local var_50_24 = Vector3.New(0.7, -0.71, -6)

				var_50_20.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1011ui_story, var_50_24, var_50_23)

				local var_50_25 = manager.ui.mainCamera.transform.position - var_50_20.position

				var_50_20.forward = Vector3.New(var_50_25.x, var_50_25.y, var_50_25.z)

				local var_50_26 = var_50_20.localEulerAngles

				var_50_26.z = 0
				var_50_26.x = 0
				var_50_20.localEulerAngles = var_50_26
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 then
				var_50_20.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_50_27 = manager.ui.mainCamera.transform.position - var_50_20.position

				var_50_20.forward = Vector3.New(var_50_27.x, var_50_27.y, var_50_27.z)

				local var_50_28 = var_50_20.localEulerAngles

				var_50_28.z = 0
				var_50_28.x = 0
				var_50_20.localEulerAngles = var_50_28
			end

			local var_50_29 = arg_47_1.actors_["2020_tpose"].transform
			local var_50_30 = 0

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1.var_.moveOldPos2020_tpose = var_50_29.localPosition
			end

			local var_50_31 = 0.001

			if var_50_30 <= arg_47_1.time_ and arg_47_1.time_ < var_50_30 + var_50_31 then
				local var_50_32 = (arg_47_1.time_ - var_50_30) / var_50_31
				local var_50_33 = Vector3.New(0, 100, 0)

				var_50_29.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos2020_tpose, var_50_33, var_50_32)

				local var_50_34 = manager.ui.mainCamera.transform.position - var_50_29.position

				var_50_29.forward = Vector3.New(var_50_34.x, var_50_34.y, var_50_34.z)

				local var_50_35 = var_50_29.localEulerAngles

				var_50_35.z = 0
				var_50_35.x = 0
				var_50_29.localEulerAngles = var_50_35
			end

			if arg_47_1.time_ >= var_50_30 + var_50_31 and arg_47_1.time_ < var_50_30 + var_50_31 + arg_50_0 then
				var_50_29.localPosition = Vector3.New(0, 100, 0)

				local var_50_36 = manager.ui.mainCamera.transform.position - var_50_29.position

				var_50_29.forward = Vector3.New(var_50_36.x, var_50_36.y, var_50_36.z)

				local var_50_37 = var_50_29.localEulerAngles

				var_50_37.z = 0
				var_50_37.x = 0
				var_50_29.localEulerAngles = var_50_37
			end

			local var_50_38 = 0
			local var_50_39 = 0.55

			if var_50_38 < arg_47_1.time_ and arg_47_1.time_ <= var_50_38 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_40 = arg_47_1:FormatText(StoryNameCfg[13].name)

				arg_47_1.leftNameTxt_.text = var_50_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_41 = arg_47_1:GetWordFromCfg(101131012)
				local var_50_42 = arg_47_1:FormatText(var_50_41.content)

				arg_47_1.text_.text = var_50_42

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_43 = 22
				local var_50_44 = utf8.len(var_50_42)
				local var_50_45 = var_50_43 <= 0 and var_50_39 or var_50_39 * (var_50_44 / var_50_43)

				if var_50_45 > 0 and var_50_39 < var_50_45 then
					arg_47_1.talkMaxDuration = var_50_45

					if var_50_45 + var_50_38 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_45 + var_50_38
					end
				end

				arg_47_1.text_.text = var_50_42
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131012", "story_v_out_101131.awb") ~= 0 then
					local var_50_46 = manager.audio:GetVoiceLength("story_v_out_101131", "101131012", "story_v_out_101131.awb") / 1000

					if var_50_46 + var_50_38 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_46 + var_50_38
					end

					if var_50_41.prefab_name ~= "" and arg_47_1.actors_[var_50_41.prefab_name] ~= nil then
						local var_50_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_41.prefab_name].transform, "story_v_out_101131", "101131012", "story_v_out_101131.awb")

						arg_47_1:RecordAudio("101131012", var_50_47)
						arg_47_1:RecordAudio("101131012", var_50_47)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_101131", "101131012", "story_v_out_101131.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_101131", "101131012", "story_v_out_101131.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_48 = math.max(var_50_39, arg_47_1.talkMaxDuration)

			if var_50_38 <= arg_47_1.time_ and arg_47_1.time_ < var_50_38 + var_50_48 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_38) / var_50_48

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_38 + var_50_48 and arg_47_1.time_ < var_50_38 + var_50_48 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play101131013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 101131013
		arg_51_1.duration_ = 15.233

		local var_51_0 = {
			ja = 15.233,
			ko = 11.566,
			zh = 12.3,
			en = 13.433
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
				arg_51_0:Play101131014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["2020_tpose"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect2020_tpose == nil then
				arg_51_1.var_.characterEffect2020_tpose = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect2020_tpose then
					arg_51_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect2020_tpose then
				arg_51_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["1019ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect1019ui_story == nil then
				arg_51_1.var_.characterEffect1019ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect1019ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1019ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect1019ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1019ui_story.fillRatio = var_54_9
			end

			local var_54_10 = 0
			local var_54_11 = 1.425

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[19].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(101131013)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 57
				local var_54_16 = utf8.len(var_54_14)
				local var_54_17 = var_54_15 <= 0 and var_54_11 or var_54_11 * (var_54_16 / var_54_15)

				if var_54_17 > 0 and var_54_11 < var_54_17 then
					arg_51_1.talkMaxDuration = var_54_17

					if var_54_17 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_10
					end
				end

				arg_51_1.text_.text = var_54_14
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131013", "story_v_out_101131.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_101131", "101131013", "story_v_out_101131.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_101131", "101131013", "story_v_out_101131.awb")

						arg_51_1:RecordAudio("101131013", var_54_19)
						arg_51_1:RecordAudio("101131013", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_101131", "101131013", "story_v_out_101131.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_101131", "101131013", "story_v_out_101131.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_11, arg_51_1.talkMaxDuration)

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_10) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_10 + var_54_20 and arg_51_1.time_ < var_54_10 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play101131014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 101131014
		arg_55_1.duration_ = 15.1

		local var_55_0 = {
			ja = 7.633,
			ko = 14.8,
			zh = 14,
			en = 15.1
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
				arg_55_0:Play101131015(arg_55_1)
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

			local var_58_4 = arg_55_1.actors_["2020_tpose"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect2020_tpose == nil then
				arg_55_1.var_.characterEffect2020_tpose = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect2020_tpose then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_55_1.var_.characterEffect2020_tpose.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect2020_tpose then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_55_1.var_.characterEffect2020_tpose.fillRatio = var_58_9
			end

			local var_58_10 = 0
			local var_58_11 = 1.65

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_12 = arg_55_1:FormatText(StoryNameCfg[19].name)

				arg_55_1.leftNameTxt_.text = var_58_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_13 = arg_55_1:GetWordFromCfg(101131014)
				local var_58_14 = arg_55_1:FormatText(var_58_13.content)

				arg_55_1.text_.text = var_58_14

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_15 = 66
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

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131014", "story_v_out_101131.awb") ~= 0 then
					local var_58_18 = manager.audio:GetVoiceLength("story_v_out_101131", "101131014", "story_v_out_101131.awb") / 1000

					if var_58_18 + var_58_10 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_18 + var_58_10
					end

					if var_58_13.prefab_name ~= "" and arg_55_1.actors_[var_58_13.prefab_name] ~= nil then
						local var_58_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_13.prefab_name].transform, "story_v_out_101131", "101131014", "story_v_out_101131.awb")

						arg_55_1:RecordAudio("101131014", var_58_19)
						arg_55_1:RecordAudio("101131014", var_58_19)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_101131", "101131014", "story_v_out_101131.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_101131", "101131014", "story_v_out_101131.awb")
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
	Play101131015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 101131015
		arg_59_1.duration_ = 2.666

		local var_59_0 = {
			ja = 1.999999999999,
			ko = 2.666,
			zh = 2.033,
			en = 1.999999999999
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
				arg_59_0:Play101131016(arg_59_1)
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

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_62_12 = 0
			local var_62_13 = 0.2

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[13].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(101131015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 8
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131015", "story_v_out_101131.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_101131", "101131015", "story_v_out_101131.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_101131", "101131015", "story_v_out_101131.awb")

						arg_59_1:RecordAudio("101131015", var_62_21)
						arg_59_1:RecordAudio("101131015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_101131", "101131015", "story_v_out_101131.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_101131", "101131015", "story_v_out_101131.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play101131016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 101131016
		arg_63_1.duration_ = 6.133

		local var_63_0 = {
			ja = 6.133,
			ko = 5.333,
			zh = 4.366,
			en = 4.5
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
				arg_63_0:Play101131017(arg_63_1)
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
				local var_66_14 = Vector3.New(-0.7, -1.08, -5.9)

				var_66_10.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1019ui_story, var_66_14, var_66_13)

				local var_66_15 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_15.x, var_66_15.y, var_66_15.z)

				local var_66_16 = var_66_10.localEulerAngles

				var_66_16.z = 0
				var_66_16.x = 0
				var_66_10.localEulerAngles = var_66_16
			end

			if arg_63_1.time_ >= var_66_11 + var_66_12 and arg_63_1.time_ < var_66_11 + var_66_12 + arg_66_0 then
				var_66_10.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_66_17 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_17.x, var_66_17.y, var_66_17.z)

				local var_66_18 = var_66_10.localEulerAngles

				var_66_18.z = 0
				var_66_18.x = 0
				var_66_10.localEulerAngles = var_66_18
			end

			local var_66_19 = 0

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_66_20 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_21 = 0

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_20.localPosition
			end

			local var_66_22 = 0.001

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22
				local var_66_24 = Vector3.New(0.7, -0.97, -6)

				var_66_20.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_24, var_66_23)

				local var_66_25 = manager.ui.mainCamera.transform.position - var_66_20.position

				var_66_20.forward = Vector3.New(var_66_25.x, var_66_25.y, var_66_25.z)

				local var_66_26 = var_66_20.localEulerAngles

				var_66_26.z = 0
				var_66_26.x = 0
				var_66_20.localEulerAngles = var_66_26
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 then
				var_66_20.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_66_27 = manager.ui.mainCamera.transform.position - var_66_20.position

				var_66_20.forward = Vector3.New(var_66_27.x, var_66_27.y, var_66_27.z)

				local var_66_28 = var_66_20.localEulerAngles

				var_66_28.z = 0
				var_66_28.x = 0
				var_66_20.localEulerAngles = var_66_28
			end

			local var_66_29 = 0

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_66_30 = arg_63_1.actors_["1011ui_story"].transform
			local var_66_31 = 0

			if var_66_31 < arg_63_1.time_ and arg_63_1.time_ <= var_66_31 + arg_66_0 then
				arg_63_1.var_.moveOldPos1011ui_story = var_66_30.localPosition
			end

			local var_66_32 = 0.001

			if var_66_31 <= arg_63_1.time_ and arg_63_1.time_ < var_66_31 + var_66_32 then
				local var_66_33 = (arg_63_1.time_ - var_66_31) / var_66_32
				local var_66_34 = Vector3.New(0, 100, 0)

				var_66_30.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1011ui_story, var_66_34, var_66_33)

				local var_66_35 = manager.ui.mainCamera.transform.position - var_66_30.position

				var_66_30.forward = Vector3.New(var_66_35.x, var_66_35.y, var_66_35.z)

				local var_66_36 = var_66_30.localEulerAngles

				var_66_36.z = 0
				var_66_36.x = 0
				var_66_30.localEulerAngles = var_66_36
			end

			if arg_63_1.time_ >= var_66_31 + var_66_32 and arg_63_1.time_ < var_66_31 + var_66_32 + arg_66_0 then
				var_66_30.localPosition = Vector3.New(0, 100, 0)

				local var_66_37 = manager.ui.mainCamera.transform.position - var_66_30.position

				var_66_30.forward = Vector3.New(var_66_37.x, var_66_37.y, var_66_37.z)

				local var_66_38 = var_66_30.localEulerAngles

				var_66_38.z = 0
				var_66_38.x = 0
				var_66_30.localEulerAngles = var_66_38
			end

			local var_66_39 = 0
			local var_66_40 = 0.725

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

				local var_66_42 = arg_63_1:GetWordFromCfg(101131016)
				local var_66_43 = arg_63_1:FormatText(var_66_42.content)

				arg_63_1.text_.text = var_66_43

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_44 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131016", "story_v_out_101131.awb") ~= 0 then
					local var_66_47 = manager.audio:GetVoiceLength("story_v_out_101131", "101131016", "story_v_out_101131.awb") / 1000

					if var_66_47 + var_66_39 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_47 + var_66_39
					end

					if var_66_42.prefab_name ~= "" and arg_63_1.actors_[var_66_42.prefab_name] ~= nil then
						local var_66_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_42.prefab_name].transform, "story_v_out_101131", "101131016", "story_v_out_101131.awb")

						arg_63_1:RecordAudio("101131016", var_66_48)
						arg_63_1:RecordAudio("101131016", var_66_48)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_101131", "101131016", "story_v_out_101131.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_101131", "101131016", "story_v_out_101131.awb")
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
	Play101131017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 101131017
		arg_67_1.duration_ = 4.466

		local var_67_0 = {
			ja = 4.466,
			ko = 2.8,
			zh = 2.5,
			en = 2.666
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
				arg_67_0:Play101131018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "3010_tpose"

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

			local var_70_4 = arg_67_1.actors_["3010_tpose"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect3010_tpose == nil then
				arg_67_1.var_.characterEffect3010_tpose = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect3010_tpose then
					arg_67_1.var_.characterEffect3010_tpose.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect3010_tpose then
				arg_67_1.var_.characterEffect3010_tpose.fillFlat = false
			end

			local var_70_8 = arg_67_1.actors_["1084ui_story"].transform
			local var_70_9 = 0

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.var_.moveOldPos1084ui_story = var_70_8.localPosition
			end

			local var_70_10 = 0.001

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_10 then
				local var_70_11 = (arg_67_1.time_ - var_70_9) / var_70_10
				local var_70_12 = Vector3.New(0, 100, 0)

				var_70_8.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1084ui_story, var_70_12, var_70_11)

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

			local var_70_17 = arg_67_1.actors_["1019ui_story"].transform
			local var_70_18 = 0

			if var_70_18 < arg_67_1.time_ and arg_67_1.time_ <= var_70_18 + arg_70_0 then
				arg_67_1.var_.moveOldPos1019ui_story = var_70_17.localPosition
			end

			local var_70_19 = 0.001

			if var_70_18 <= arg_67_1.time_ and arg_67_1.time_ < var_70_18 + var_70_19 then
				local var_70_20 = (arg_67_1.time_ - var_70_18) / var_70_19
				local var_70_21 = Vector3.New(0, 100, 0)

				var_70_17.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1019ui_story, var_70_21, var_70_20)

				local var_70_22 = manager.ui.mainCamera.transform.position - var_70_17.position

				var_70_17.forward = Vector3.New(var_70_22.x, var_70_22.y, var_70_22.z)

				local var_70_23 = var_70_17.localEulerAngles

				var_70_23.z = 0
				var_70_23.x = 0
				var_70_17.localEulerAngles = var_70_23
			end

			if arg_67_1.time_ >= var_70_18 + var_70_19 and arg_67_1.time_ < var_70_18 + var_70_19 + arg_70_0 then
				var_70_17.localPosition = Vector3.New(0, 100, 0)

				local var_70_24 = manager.ui.mainCamera.transform.position - var_70_17.position

				var_70_17.forward = Vector3.New(var_70_24.x, var_70_24.y, var_70_24.z)

				local var_70_25 = var_70_17.localEulerAngles

				var_70_25.z = 0
				var_70_25.x = 0
				var_70_17.localEulerAngles = var_70_25
			end

			local var_70_26 = arg_67_1.actors_["3010_tpose"].transform
			local var_70_27 = 0

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1.var_.moveOldPos3010_tpose = var_70_26.localPosition
			end

			local var_70_28 = 0.001

			if var_70_27 <= arg_67_1.time_ and arg_67_1.time_ < var_70_27 + var_70_28 then
				local var_70_29 = (arg_67_1.time_ - var_70_27) / var_70_28
				local var_70_30 = Vector3.New(0, -1.59, -1.6)

				var_70_26.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos3010_tpose, var_70_30, var_70_29)

				local var_70_31 = manager.ui.mainCamera.transform.position - var_70_26.position

				var_70_26.forward = Vector3.New(var_70_31.x, var_70_31.y, var_70_31.z)

				local var_70_32 = var_70_26.localEulerAngles

				var_70_32.z = 0
				var_70_32.x = 0
				var_70_26.localEulerAngles = var_70_32
			end

			if arg_67_1.time_ >= var_70_27 + var_70_28 and arg_67_1.time_ < var_70_27 + var_70_28 + arg_70_0 then
				var_70_26.localPosition = Vector3.New(0, -1.59, -1.6)

				local var_70_33 = manager.ui.mainCamera.transform.position - var_70_26.position

				var_70_26.forward = Vector3.New(var_70_33.x, var_70_33.y, var_70_33.z)

				local var_70_34 = var_70_26.localEulerAngles

				var_70_34.z = 0
				var_70_34.x = 0
				var_70_26.localEulerAngles = var_70_34
			end

			local var_70_35 = 0

			if var_70_35 < arg_67_1.time_ and arg_67_1.time_ <= var_70_35 + arg_70_0 then
				arg_67_1:PlayTimeline("3010_tpose", "StoryTimeline/CharAction/story3010/story3010action/3010action1_1")
			end

			local var_70_36 = 0
			local var_70_37 = 0.25

			if var_70_36 < arg_67_1.time_ and arg_67_1.time_ <= var_70_36 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_38 = arg_67_1:FormatText(StoryNameCfg[40].name)

				arg_67_1.leftNameTxt_.text = var_70_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_39 = arg_67_1:GetWordFromCfg(101131017)
				local var_70_40 = arg_67_1:FormatText(var_70_39.content)

				arg_67_1.text_.text = var_70_40

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_41 = 10
				local var_70_42 = utf8.len(var_70_40)
				local var_70_43 = var_70_41 <= 0 and var_70_37 or var_70_37 * (var_70_42 / var_70_41)

				if var_70_43 > 0 and var_70_37 < var_70_43 then
					arg_67_1.talkMaxDuration = var_70_43

					if var_70_43 + var_70_36 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_43 + var_70_36
					end
				end

				arg_67_1.text_.text = var_70_40
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131017", "story_v_out_101131.awb") ~= 0 then
					local var_70_44 = manager.audio:GetVoiceLength("story_v_out_101131", "101131017", "story_v_out_101131.awb") / 1000

					if var_70_44 + var_70_36 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_44 + var_70_36
					end

					if var_70_39.prefab_name ~= "" and arg_67_1.actors_[var_70_39.prefab_name] ~= nil then
						local var_70_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_39.prefab_name].transform, "story_v_out_101131", "101131017", "story_v_out_101131.awb")

						arg_67_1:RecordAudio("101131017", var_70_45)
						arg_67_1:RecordAudio("101131017", var_70_45)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_101131", "101131017", "story_v_out_101131.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_101131", "101131017", "story_v_out_101131.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_46 = math.max(var_70_37, arg_67_1.talkMaxDuration)

			if var_70_36 <= arg_67_1.time_ and arg_67_1.time_ < var_70_36 + var_70_46 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_36) / var_70_46

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_36 + var_70_46 and arg_67_1.time_ < var_70_36 + var_70_46 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play101131018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 101131018
		arg_71_1.duration_ = 3.4

		local var_71_0 = {
			ja = 3.4,
			ko = 1.533,
			zh = 1.8,
			en = 1.633
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
				arg_71_0:Play101131019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["3010_tpose"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect3010_tpose == nil then
				arg_71_1.var_.characterEffect3010_tpose = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.1

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect3010_tpose then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect3010_tpose.fillFlat = true
					arg_71_1.var_.characterEffect3010_tpose.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect3010_tpose then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect3010_tpose.fillFlat = true
				arg_71_1.var_.characterEffect3010_tpose.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.2

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_8 = arg_71_1:FormatText(StoryNameCfg[41].name)

				arg_71_1.leftNameTxt_.text = var_74_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_9 = arg_71_1:GetWordFromCfg(101131018)
				local var_74_10 = arg_71_1:FormatText(var_74_9.content)

				arg_71_1.text_.text = var_74_10

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_11 = 8
				local var_74_12 = utf8.len(var_74_10)
				local var_74_13 = var_74_11 <= 0 and var_74_7 or var_74_7 * (var_74_12 / var_74_11)

				if var_74_13 > 0 and var_74_7 < var_74_13 then
					arg_71_1.talkMaxDuration = var_74_13

					if var_74_13 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_13 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_10
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131018", "story_v_out_101131.awb") ~= 0 then
					local var_74_14 = manager.audio:GetVoiceLength("story_v_out_101131", "101131018", "story_v_out_101131.awb") / 1000

					if var_74_14 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_14 + var_74_6
					end

					if var_74_9.prefab_name ~= "" and arg_71_1.actors_[var_74_9.prefab_name] ~= nil then
						local var_74_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_9.prefab_name].transform, "story_v_out_101131", "101131018", "story_v_out_101131.awb")

						arg_71_1:RecordAudio("101131018", var_74_15)
						arg_71_1:RecordAudio("101131018", var_74_15)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_101131", "101131018", "story_v_out_101131.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_101131", "101131018", "story_v_out_101131.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_16 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_16 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_16

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_16 and arg_71_1.time_ < var_74_6 + var_74_16 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play101131019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 101131019
		arg_75_1.duration_ = 5.8

		local var_75_0 = {
			ja = 5.8,
			ko = 3.6,
			zh = 4.866,
			en = 4.833
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
				arg_75_0:Play101131020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["3010_tpose"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect3010_tpose == nil then
				arg_75_1.var_.characterEffect3010_tpose = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect3010_tpose then
					arg_75_1.var_.characterEffect3010_tpose.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect3010_tpose then
				arg_75_1.var_.characterEffect3010_tpose.fillFlat = false
			end

			local var_78_4 = 0
			local var_78_5 = 0.55

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_6 = arg_75_1:FormatText(StoryNameCfg[40].name)

				arg_75_1.leftNameTxt_.text = var_78_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_7 = arg_75_1:GetWordFromCfg(101131019)
				local var_78_8 = arg_75_1:FormatText(var_78_7.content)

				arg_75_1.text_.text = var_78_8

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_9 = 20
				local var_78_10 = utf8.len(var_78_8)
				local var_78_11 = var_78_9 <= 0 and var_78_5 or var_78_5 * (var_78_10 / var_78_9)

				if var_78_11 > 0 and var_78_5 < var_78_11 then
					arg_75_1.talkMaxDuration = var_78_11

					if var_78_11 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_11 + var_78_4
					end
				end

				arg_75_1.text_.text = var_78_8
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131019", "story_v_out_101131.awb") ~= 0 then
					local var_78_12 = manager.audio:GetVoiceLength("story_v_out_101131", "101131019", "story_v_out_101131.awb") / 1000

					if var_78_12 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_12 + var_78_4
					end

					if var_78_7.prefab_name ~= "" and arg_75_1.actors_[var_78_7.prefab_name] ~= nil then
						local var_78_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_7.prefab_name].transform, "story_v_out_101131", "101131019", "story_v_out_101131.awb")

						arg_75_1:RecordAudio("101131019", var_78_13)
						arg_75_1:RecordAudio("101131019", var_78_13)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_101131", "101131019", "story_v_out_101131.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_101131", "101131019", "story_v_out_101131.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_14 = math.max(var_78_5, arg_75_1.talkMaxDuration)

			if var_78_4 <= arg_75_1.time_ and arg_75_1.time_ < var_78_4 + var_78_14 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_4) / var_78_14

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_4 + var_78_14 and arg_75_1.time_ < var_78_4 + var_78_14 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play101131020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 101131020
		arg_79_1.duration_ = 4.133

		local var_79_0 = {
			ja = 2.933,
			ko = 3.2,
			zh = 3.233,
			en = 4.133
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
				arg_79_0:Play101131021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1011ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1011ui_story == nil then
				arg_79_1.var_.characterEffect1011ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1011ui_story then
					arg_79_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1011ui_story then
				arg_79_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["3010_tpose"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect3010_tpose == nil then
				arg_79_1.var_.characterEffect3010_tpose = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.1

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect3010_tpose then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect3010_tpose.fillFlat = true
					arg_79_1.var_.characterEffect3010_tpose.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect3010_tpose then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect3010_tpose.fillFlat = true
				arg_79_1.var_.characterEffect3010_tpose.fillRatio = var_82_9
			end

			local var_82_10 = arg_79_1.actors_["3010_tpose"].transform
			local var_82_11 = 0

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1.var_.moveOldPos3010_tpose = var_82_10.localPosition
			end

			local var_82_12 = 0.001

			if var_82_11 <= arg_79_1.time_ and arg_79_1.time_ < var_82_11 + var_82_12 then
				local var_82_13 = (arg_79_1.time_ - var_82_11) / var_82_12
				local var_82_14 = Vector3.New(0, 100, 0)

				var_82_10.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos3010_tpose, var_82_14, var_82_13)

				local var_82_15 = manager.ui.mainCamera.transform.position - var_82_10.position

				var_82_10.forward = Vector3.New(var_82_15.x, var_82_15.y, var_82_15.z)

				local var_82_16 = var_82_10.localEulerAngles

				var_82_16.z = 0
				var_82_16.x = 0
				var_82_10.localEulerAngles = var_82_16
			end

			if arg_79_1.time_ >= var_82_11 + var_82_12 and arg_79_1.time_ < var_82_11 + var_82_12 + arg_82_0 then
				var_82_10.localPosition = Vector3.New(0, 100, 0)

				local var_82_17 = manager.ui.mainCamera.transform.position - var_82_10.position

				var_82_10.forward = Vector3.New(var_82_17.x, var_82_17.y, var_82_17.z)

				local var_82_18 = var_82_10.localEulerAngles

				var_82_18.z = 0
				var_82_18.x = 0
				var_82_10.localEulerAngles = var_82_18
			end

			local var_82_19 = 0

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_82_20 = arg_79_1.actors_["1011ui_story"].transform
			local var_82_21 = 0

			if var_82_21 < arg_79_1.time_ and arg_79_1.time_ <= var_82_21 + arg_82_0 then
				arg_79_1.var_.moveOldPos1011ui_story = var_82_20.localPosition
			end

			local var_82_22 = 0.001

			if var_82_21 <= arg_79_1.time_ and arg_79_1.time_ < var_82_21 + var_82_22 then
				local var_82_23 = (arg_79_1.time_ - var_82_21) / var_82_22
				local var_82_24 = Vector3.New(0, -0.71, -6)

				var_82_20.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1011ui_story, var_82_24, var_82_23)

				local var_82_25 = manager.ui.mainCamera.transform.position - var_82_20.position

				var_82_20.forward = Vector3.New(var_82_25.x, var_82_25.y, var_82_25.z)

				local var_82_26 = var_82_20.localEulerAngles

				var_82_26.z = 0
				var_82_26.x = 0
				var_82_20.localEulerAngles = var_82_26
			end

			if arg_79_1.time_ >= var_82_21 + var_82_22 and arg_79_1.time_ < var_82_21 + var_82_22 + arg_82_0 then
				var_82_20.localPosition = Vector3.New(0, -0.71, -6)

				local var_82_27 = manager.ui.mainCamera.transform.position - var_82_20.position

				var_82_20.forward = Vector3.New(var_82_27.x, var_82_27.y, var_82_27.z)

				local var_82_28 = var_82_20.localEulerAngles

				var_82_28.z = 0
				var_82_28.x = 0
				var_82_20.localEulerAngles = var_82_28
			end

			local var_82_29 = 0

			if var_82_29 < arg_79_1.time_ and arg_79_1.time_ <= var_82_29 + arg_82_0 then
				arg_79_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_82_30 = 0
			local var_82_31 = 0.325

			if var_82_30 < arg_79_1.time_ and arg_79_1.time_ <= var_82_30 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_32 = arg_79_1:FormatText(StoryNameCfg[37].name)

				arg_79_1.leftNameTxt_.text = var_82_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_33 = arg_79_1:GetWordFromCfg(101131020)
				local var_82_34 = arg_79_1:FormatText(var_82_33.content)

				arg_79_1.text_.text = var_82_34

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_35 = 13
				local var_82_36 = utf8.len(var_82_34)
				local var_82_37 = var_82_35 <= 0 and var_82_31 or var_82_31 * (var_82_36 / var_82_35)

				if var_82_37 > 0 and var_82_31 < var_82_37 then
					arg_79_1.talkMaxDuration = var_82_37

					if var_82_37 + var_82_30 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_37 + var_82_30
					end
				end

				arg_79_1.text_.text = var_82_34
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131020", "story_v_out_101131.awb") ~= 0 then
					local var_82_38 = manager.audio:GetVoiceLength("story_v_out_101131", "101131020", "story_v_out_101131.awb") / 1000

					if var_82_38 + var_82_30 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_38 + var_82_30
					end

					if var_82_33.prefab_name ~= "" and arg_79_1.actors_[var_82_33.prefab_name] ~= nil then
						local var_82_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_33.prefab_name].transform, "story_v_out_101131", "101131020", "story_v_out_101131.awb")

						arg_79_1:RecordAudio("101131020", var_82_39)
						arg_79_1:RecordAudio("101131020", var_82_39)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_101131", "101131020", "story_v_out_101131.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_101131", "101131020", "story_v_out_101131.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_40 = math.max(var_82_31, arg_79_1.talkMaxDuration)

			if var_82_30 <= arg_79_1.time_ and arg_79_1.time_ < var_82_30 + var_82_40 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_30) / var_82_40

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_30 + var_82_40 and arg_79_1.time_ < var_82_30 + var_82_40 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play101131021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 101131021
		arg_83_1.duration_ = 7.666

		local var_83_0 = {
			ja = 7.566,
			ko = 4.4,
			zh = 7.666,
			en = 5.3
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
				arg_83_0:Play101131022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["3010_tpose"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect3010_tpose == nil then
				arg_83_1.var_.characterEffect3010_tpose = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.1

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect3010_tpose then
					arg_83_1.var_.characterEffect3010_tpose.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect3010_tpose then
				arg_83_1.var_.characterEffect3010_tpose.fillFlat = false
			end

			local var_86_4 = arg_83_1.actors_["1011ui_story"]
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 and arg_83_1.var_.characterEffect1011ui_story == nil then
				arg_83_1.var_.characterEffect1011ui_story = var_86_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_6 = 0.1

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6

				if arg_83_1.var_.characterEffect1011ui_story then
					local var_86_8 = Mathf.Lerp(0, 0.5, var_86_7)

					arg_83_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1011ui_story.fillRatio = var_86_8
				end
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 and arg_83_1.var_.characterEffect1011ui_story then
				local var_86_9 = 0.5

				arg_83_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1011ui_story.fillRatio = var_86_9
			end

			local var_86_10 = arg_83_1.actors_["1011ui_story"].transform
			local var_86_11 = 0

			if var_86_11 < arg_83_1.time_ and arg_83_1.time_ <= var_86_11 + arg_86_0 then
				arg_83_1.var_.moveOldPos1011ui_story = var_86_10.localPosition
			end

			local var_86_12 = 0.001

			if var_86_11 <= arg_83_1.time_ and arg_83_1.time_ < var_86_11 + var_86_12 then
				local var_86_13 = (arg_83_1.time_ - var_86_11) / var_86_12
				local var_86_14 = Vector3.New(0, 100, 0)

				var_86_10.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1011ui_story, var_86_14, var_86_13)

				local var_86_15 = manager.ui.mainCamera.transform.position - var_86_10.position

				var_86_10.forward = Vector3.New(var_86_15.x, var_86_15.y, var_86_15.z)

				local var_86_16 = var_86_10.localEulerAngles

				var_86_16.z = 0
				var_86_16.x = 0
				var_86_10.localEulerAngles = var_86_16
			end

			if arg_83_1.time_ >= var_86_11 + var_86_12 and arg_83_1.time_ < var_86_11 + var_86_12 + arg_86_0 then
				var_86_10.localPosition = Vector3.New(0, 100, 0)

				local var_86_17 = manager.ui.mainCamera.transform.position - var_86_10.position

				var_86_10.forward = Vector3.New(var_86_17.x, var_86_17.y, var_86_17.z)

				local var_86_18 = var_86_10.localEulerAngles

				var_86_18.z = 0
				var_86_18.x = 0
				var_86_10.localEulerAngles = var_86_18
			end

			local var_86_19 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_20 = 0

			if var_86_20 < arg_83_1.time_ and arg_83_1.time_ <= var_86_20 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_19.localPosition
			end

			local var_86_21 = 0.001

			if var_86_20 <= arg_83_1.time_ and arg_83_1.time_ < var_86_20 + var_86_21 then
				local var_86_22 = (arg_83_1.time_ - var_86_20) / var_86_21
				local var_86_23 = Vector3.New(0, 100, 0)

				var_86_19.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_23, var_86_22)

				local var_86_24 = manager.ui.mainCamera.transform.position - var_86_19.position

				var_86_19.forward = Vector3.New(var_86_24.x, var_86_24.y, var_86_24.z)

				local var_86_25 = var_86_19.localEulerAngles

				var_86_25.z = 0
				var_86_25.x = 0
				var_86_19.localEulerAngles = var_86_25
			end

			if arg_83_1.time_ >= var_86_20 + var_86_21 and arg_83_1.time_ < var_86_20 + var_86_21 + arg_86_0 then
				var_86_19.localPosition = Vector3.New(0, 100, 0)

				local var_86_26 = manager.ui.mainCamera.transform.position - var_86_19.position

				var_86_19.forward = Vector3.New(var_86_26.x, var_86_26.y, var_86_26.z)

				local var_86_27 = var_86_19.localEulerAngles

				var_86_27.z = 0
				var_86_27.x = 0
				var_86_19.localEulerAngles = var_86_27
			end

			local var_86_28 = arg_83_1.actors_["3010_tpose"].transform
			local var_86_29 = 0

			if var_86_29 < arg_83_1.time_ and arg_83_1.time_ <= var_86_29 + arg_86_0 then
				arg_83_1.var_.moveOldPos3010_tpose = var_86_28.localPosition
			end

			local var_86_30 = 0.001

			if var_86_29 <= arg_83_1.time_ and arg_83_1.time_ < var_86_29 + var_86_30 then
				local var_86_31 = (arg_83_1.time_ - var_86_29) / var_86_30
				local var_86_32 = Vector3.New(0, -1.59, -1.6)

				var_86_28.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos3010_tpose, var_86_32, var_86_31)

				local var_86_33 = manager.ui.mainCamera.transform.position - var_86_28.position

				var_86_28.forward = Vector3.New(var_86_33.x, var_86_33.y, var_86_33.z)

				local var_86_34 = var_86_28.localEulerAngles

				var_86_34.z = 0
				var_86_34.x = 0
				var_86_28.localEulerAngles = var_86_34
			end

			if arg_83_1.time_ >= var_86_29 + var_86_30 and arg_83_1.time_ < var_86_29 + var_86_30 + arg_86_0 then
				var_86_28.localPosition = Vector3.New(0, -1.59, -1.6)

				local var_86_35 = manager.ui.mainCamera.transform.position - var_86_28.position

				var_86_28.forward = Vector3.New(var_86_35.x, var_86_35.y, var_86_35.z)

				local var_86_36 = var_86_28.localEulerAngles

				var_86_36.z = 0
				var_86_36.x = 0
				var_86_28.localEulerAngles = var_86_36
			end

			local var_86_37 = 0

			if var_86_37 < arg_83_1.time_ and arg_83_1.time_ <= var_86_37 + arg_86_0 then
				arg_83_1:PlayTimeline("3010_tpose", "StoryTimeline/CharAction/story3010/story3010action/3010action1_1")
			end

			local var_86_38 = 0
			local var_86_39 = 0.85

			if var_86_38 < arg_83_1.time_ and arg_83_1.time_ <= var_86_38 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_40 = arg_83_1:FormatText(StoryNameCfg[40].name)

				arg_83_1.leftNameTxt_.text = var_86_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_41 = arg_83_1:GetWordFromCfg(101131021)
				local var_86_42 = arg_83_1:FormatText(var_86_41.content)

				arg_83_1.text_.text = var_86_42

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_43 = 32
				local var_86_44 = utf8.len(var_86_42)
				local var_86_45 = var_86_43 <= 0 and var_86_39 or var_86_39 * (var_86_44 / var_86_43)

				if var_86_45 > 0 and var_86_39 < var_86_45 then
					arg_83_1.talkMaxDuration = var_86_45

					if var_86_45 + var_86_38 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_45 + var_86_38
					end
				end

				arg_83_1.text_.text = var_86_42
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131021", "story_v_out_101131.awb") ~= 0 then
					local var_86_46 = manager.audio:GetVoiceLength("story_v_out_101131", "101131021", "story_v_out_101131.awb") / 1000

					if var_86_46 + var_86_38 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_46 + var_86_38
					end

					if var_86_41.prefab_name ~= "" and arg_83_1.actors_[var_86_41.prefab_name] ~= nil then
						local var_86_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_41.prefab_name].transform, "story_v_out_101131", "101131021", "story_v_out_101131.awb")

						arg_83_1:RecordAudio("101131021", var_86_47)
						arg_83_1:RecordAudio("101131021", var_86_47)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_101131", "101131021", "story_v_out_101131.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_101131", "101131021", "story_v_out_101131.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_48 = math.max(var_86_39, arg_83_1.talkMaxDuration)

			if var_86_38 <= arg_83_1.time_ and arg_83_1.time_ < var_86_38 + var_86_48 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_38) / var_86_48

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_38 + var_86_48 and arg_83_1.time_ < var_86_38 + var_86_48 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play101131022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 101131022
		arg_87_1.duration_ = 3.766

		local var_87_0 = {
			ja = 3.766,
			ko = 2.933,
			zh = 2.833,
			en = 2.933
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
				arg_87_0:Play101131023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["3010_tpose"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect3010_tpose == nil then
				arg_87_1.var_.characterEffect3010_tpose = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect3010_tpose then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect3010_tpose.fillFlat = true
					arg_87_1.var_.characterEffect3010_tpose.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect3010_tpose then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect3010_tpose.fillFlat = true
				arg_87_1.var_.characterEffect3010_tpose.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.35

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[19].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(101131022)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 12
				local var_90_12 = utf8.len(var_90_10)
				local var_90_13 = var_90_11 <= 0 and var_90_7 or var_90_7 * (var_90_12 / var_90_11)

				if var_90_13 > 0 and var_90_7 < var_90_13 then
					arg_87_1.talkMaxDuration = var_90_13

					if var_90_13 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_13 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_10
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131022", "story_v_out_101131.awb") ~= 0 then
					local var_90_14 = manager.audio:GetVoiceLength("story_v_out_101131", "101131022", "story_v_out_101131.awb") / 1000

					if var_90_14 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_14 + var_90_6
					end

					if var_90_9.prefab_name ~= "" and arg_87_1.actors_[var_90_9.prefab_name] ~= nil then
						local var_90_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_9.prefab_name].transform, "story_v_out_101131", "101131022", "story_v_out_101131.awb")

						arg_87_1:RecordAudio("101131022", var_90_15)
						arg_87_1:RecordAudio("101131022", var_90_15)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_101131", "101131022", "story_v_out_101131.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_101131", "101131022", "story_v_out_101131.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_16 and arg_87_1.time_ < var_90_6 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play101131023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 101131023
		arg_91_1.duration_ = 4.366

		local var_91_0 = {
			ja = 4.366,
			ko = 3.233,
			zh = 3.066,
			en = 2.8
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
				arg_91_0:Play101131024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.425

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[33].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20302")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(101131023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 17
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131023", "story_v_out_101131.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_101131", "101131023", "story_v_out_101131.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_101131", "101131023", "story_v_out_101131.awb")

						arg_91_1:RecordAudio("101131023", var_94_9)
						arg_91_1:RecordAudio("101131023", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_101131", "101131023", "story_v_out_101131.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_101131", "101131023", "story_v_out_101131.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play101131024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 101131024
		arg_95_1.duration_ = 4.233

		local var_95_0 = {
			ja = 3.6,
			ko = 3.1,
			zh = 2.8,
			en = 4.233
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
			arg_95_1.auto_ = false
		end

		function arg_95_1.playNext_(arg_97_0)
			arg_95_1.onStoryFinished_()
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				local var_98_2 = "play"
				local var_98_3 = "effect"

				arg_95_1:AudioAction(var_98_2, var_98_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_98_4 = arg_95_1.actors_["1084ui_story"]
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story == nil then
				arg_95_1.var_.characterEffect1084ui_story = var_98_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_6 = 0.1

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6

				if arg_95_1.var_.characterEffect1084ui_story then
					arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story then
				arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_98_8 = arg_95_1.actors_["3010_tpose"].transform
			local var_98_9 = 0

			if var_98_9 < arg_95_1.time_ and arg_95_1.time_ <= var_98_9 + arg_98_0 then
				arg_95_1.var_.moveOldPos3010_tpose = var_98_8.localPosition
			end

			local var_98_10 = 0.001

			if var_98_9 <= arg_95_1.time_ and arg_95_1.time_ < var_98_9 + var_98_10 then
				local var_98_11 = (arg_95_1.time_ - var_98_9) / var_98_10
				local var_98_12 = Vector3.New(0, 100, 0)

				var_98_8.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos3010_tpose, var_98_12, var_98_11)

				local var_98_13 = manager.ui.mainCamera.transform.position - var_98_8.position

				var_98_8.forward = Vector3.New(var_98_13.x, var_98_13.y, var_98_13.z)

				local var_98_14 = var_98_8.localEulerAngles

				var_98_14.z = 0
				var_98_14.x = 0
				var_98_8.localEulerAngles = var_98_14
			end

			if arg_95_1.time_ >= var_98_9 + var_98_10 and arg_95_1.time_ < var_98_9 + var_98_10 + arg_98_0 then
				var_98_8.localPosition = Vector3.New(0, 100, 0)

				local var_98_15 = manager.ui.mainCamera.transform.position - var_98_8.position

				var_98_8.forward = Vector3.New(var_98_15.x, var_98_15.y, var_98_15.z)

				local var_98_16 = var_98_8.localEulerAngles

				var_98_16.z = 0
				var_98_16.x = 0
				var_98_8.localEulerAngles = var_98_16
			end

			local var_98_17 = arg_95_1.actors_["1084ui_story"].transform
			local var_98_18 = 0

			if var_98_18 < arg_95_1.time_ and arg_95_1.time_ <= var_98_18 + arg_98_0 then
				arg_95_1.var_.moveOldPos1084ui_story = var_98_17.localPosition
			end

			local var_98_19 = 0.001

			if var_98_18 <= arg_95_1.time_ and arg_95_1.time_ < var_98_18 + var_98_19 then
				local var_98_20 = (arg_95_1.time_ - var_98_18) / var_98_19
				local var_98_21 = Vector3.New(0, -0.97, -6)

				var_98_17.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1084ui_story, var_98_21, var_98_20)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_17.position

				var_98_17.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_17.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_17.localEulerAngles = var_98_23
			end

			if arg_95_1.time_ >= var_98_18 + var_98_19 and arg_95_1.time_ < var_98_18 + var_98_19 + arg_98_0 then
				var_98_17.localPosition = Vector3.New(0, -0.97, -6)

				local var_98_24 = manager.ui.mainCamera.transform.position - var_98_17.position

				var_98_17.forward = Vector3.New(var_98_24.x, var_98_24.y, var_98_24.z)

				local var_98_25 = var_98_17.localEulerAngles

				var_98_25.z = 0
				var_98_25.x = 0
				var_98_17.localEulerAngles = var_98_25
			end

			local var_98_26 = 0

			if var_98_26 < arg_95_1.time_ and arg_95_1.time_ <= var_98_26 + arg_98_0 then
				arg_95_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_98_27 = 0

			if var_98_27 < arg_95_1.time_ and arg_95_1.time_ <= var_98_27 + arg_98_0 then
				arg_95_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_98_28 = 0
			local var_98_29 = 0.3

			if var_98_28 < arg_95_1.time_ and arg_95_1.time_ <= var_98_28 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_30 = arg_95_1:FormatText(StoryNameCfg[6].name)

				arg_95_1.leftNameTxt_.text = var_98_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_31 = arg_95_1:GetWordFromCfg(101131024)
				local var_98_32 = arg_95_1:FormatText(var_98_31.content)

				arg_95_1.text_.text = var_98_32

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_33 = 12
				local var_98_34 = utf8.len(var_98_32)
				local var_98_35 = var_98_33 <= 0 and var_98_29 or var_98_29 * (var_98_34 / var_98_33)

				if var_98_35 > 0 and var_98_29 < var_98_35 then
					arg_95_1.talkMaxDuration = var_98_35

					if var_98_35 + var_98_28 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_35 + var_98_28
					end
				end

				arg_95_1.text_.text = var_98_32
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101131", "101131024", "story_v_out_101131.awb") ~= 0 then
					local var_98_36 = manager.audio:GetVoiceLength("story_v_out_101131", "101131024", "story_v_out_101131.awb") / 1000

					if var_98_36 + var_98_28 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_36 + var_98_28
					end

					if var_98_31.prefab_name ~= "" and arg_95_1.actors_[var_98_31.prefab_name] ~= nil then
						local var_98_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_31.prefab_name].transform, "story_v_out_101131", "101131024", "story_v_out_101131.awb")

						arg_95_1:RecordAudio("101131024", var_98_37)
						arg_95_1:RecordAudio("101131024", var_98_37)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_101131", "101131024", "story_v_out_101131.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_101131", "101131024", "story_v_out_101131.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_38 = math.max(var_98_29, arg_95_1.talkMaxDuration)

			if var_98_28 <= arg_95_1.time_ and arg_95_1.time_ < var_98_28 + var_98_38 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_28) / var_98_38

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_28 + var_98_38 and arg_95_1.time_ < var_98_28 + var_98_38 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B02f"
	},
	voices = {
		"story_v_out_101131.awb"
	}
}
