return {
	Play101061001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 101061001
		arg_1_1.duration_ = 4.7

		local var_1_0 = {
			ja = 4.3,
			ko = 4.7,
			zh = 4.3,
			en = 4.166
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
				arg_1_0:Play101061002(arg_1_1)
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

			local var_4_44 = arg_1_1.actors_["2020_tpose"].transform
			local var_4_45 = 1.79999995231628

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1.var_.moveOldPos2020_tpose = var_4_44.localPosition
			end

			local var_4_46 = 0.001

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				local var_4_47 = (arg_1_1.time_ - var_4_45) / var_4_46
				local var_4_48 = Vector3.New(-0.7, -1.2, -4.1)

				var_4_44.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos2020_tpose, var_4_48, var_4_47)

				local var_4_49 = manager.ui.mainCamera.transform.position - var_4_44.position

				var_4_44.forward = Vector3.New(var_4_49.x, var_4_49.y, var_4_49.z)

				local var_4_50 = var_4_44.localEulerAngles

				var_4_50.z = 0
				var_4_50.x = 0
				var_4_44.localEulerAngles = var_4_50
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				var_4_44.localPosition = Vector3.New(-0.7, -1.2, -4.1)

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
			local var_4_57 = 0.3

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

				local var_4_60 = arg_1_1:GetWordFromCfg(101061001)
				local var_4_61 = arg_1_1:FormatText(var_4_60.content)

				arg_1_1.text_.text = var_4_61

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_62 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061001", "story_v_out_101061.awb") ~= 0 then
					local var_4_65 = manager.audio:GetVoiceLength("story_v_out_101061", "101061001", "story_v_out_101061.awb") / 1000

					if var_4_65 + var_4_56 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_65 + var_4_56
					end

					if var_4_60.prefab_name ~= "" and arg_1_1.actors_[var_4_60.prefab_name] ~= nil then
						local var_4_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_60.prefab_name].transform, "story_v_out_101061", "101061001", "story_v_out_101061.awb")

						arg_1_1:RecordAudio("101061001", var_4_66)
						arg_1_1:RecordAudio("101061001", var_4_66)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_101061", "101061001", "story_v_out_101061.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_101061", "101061001", "story_v_out_101061.awb")
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
	Play101061002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101061002
		arg_7_1.duration_ = 1.999999999999

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play101061003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "2030_tpose"

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

			local var_10_4 = arg_7_1.actors_["2030_tpose"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect2030_tpose == nil then
				arg_7_1.var_.characterEffect2030_tpose = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect2030_tpose then
					arg_7_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect2030_tpose then
				arg_7_1.var_.characterEffect2030_tpose.fillFlat = false
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

			local var_10_14 = arg_7_1.actors_["2030_tpose"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos2030_tpose = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -1.2, -4.2)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2030_tpose, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -1.2, -4.2)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_10_24 = 0
			local var_10_25 = 0.1

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_26 = arg_7_1:FormatText(StoryNameCfg[33].name)

				arg_7_1.leftNameTxt_.text = var_10_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_27 = arg_7_1:GetWordFromCfg(101061002)
				local var_10_28 = arg_7_1:FormatText(var_10_27.content)

				arg_7_1.text_.text = var_10_28

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_29 = 4
				local var_10_30 = utf8.len(var_10_28)
				local var_10_31 = var_10_29 <= 0 and var_10_25 or var_10_25 * (var_10_30 / var_10_29)

				if var_10_31 > 0 and var_10_25 < var_10_31 then
					arg_7_1.talkMaxDuration = var_10_31

					if var_10_31 + var_10_24 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_31 + var_10_24
					end
				end

				arg_7_1.text_.text = var_10_28
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061002", "story_v_out_101061.awb") ~= 0 then
					local var_10_32 = manager.audio:GetVoiceLength("story_v_out_101061", "101061002", "story_v_out_101061.awb") / 1000

					if var_10_32 + var_10_24 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_32 + var_10_24
					end

					if var_10_27.prefab_name ~= "" and arg_7_1.actors_[var_10_27.prefab_name] ~= nil then
						local var_10_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_27.prefab_name].transform, "story_v_out_101061", "101061002", "story_v_out_101061.awb")

						arg_7_1:RecordAudio("101061002", var_10_33)
						arg_7_1:RecordAudio("101061002", var_10_33)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_101061", "101061002", "story_v_out_101061.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_101061", "101061002", "story_v_out_101061.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_34 = math.max(var_10_25, arg_7_1.talkMaxDuration)

			if var_10_24 <= arg_7_1.time_ and arg_7_1.time_ < var_10_24 + var_10_34 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_24) / var_10_34

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_24 + var_10_34 and arg_7_1.time_ < var_10_24 + var_10_34 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play101061003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 101061003
		arg_11_1.duration_ = 3.1

		local var_11_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 3.1,
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
				arg_11_0:Play101061004(arg_11_1)
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

			local var_14_8 = arg_11_1.actors_["2030_tpose"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect2030_tpose == nil then
				arg_11_1.var_.characterEffect2030_tpose = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect2030_tpose then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_11_1.var_.characterEffect2030_tpose.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect2030_tpose then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_11_1.var_.characterEffect2030_tpose.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["2020_tpose"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos2020_tpose = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0, 100, 0)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2020_tpose, var_14_18, var_14_17)

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

			local var_14_23 = arg_11_1.actors_["2030_tpose"].transform
			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.var_.moveOldPos2030_tpose = var_14_23.localPosition
			end

			local var_14_25 = 0.001

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_25 then
				local var_14_26 = (arg_11_1.time_ - var_14_24) / var_14_25
				local var_14_27 = Vector3.New(0, 100, 0)

				var_14_23.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2030_tpose, var_14_27, var_14_26)

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
				arg_11_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_14_43 = 0
			local var_14_44 = 0.075

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

				local var_14_46 = arg_11_1:GetWordFromCfg(101061003)
				local var_14_47 = arg_11_1:FormatText(var_14_46.content)

				arg_11_1.text_.text = var_14_47

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_48 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061003", "story_v_out_101061.awb") ~= 0 then
					local var_14_51 = manager.audio:GetVoiceLength("story_v_out_101061", "101061003", "story_v_out_101061.awb") / 1000

					if var_14_51 + var_14_43 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_51 + var_14_43
					end

					if var_14_46.prefab_name ~= "" and arg_11_1.actors_[var_14_46.prefab_name] ~= nil then
						local var_14_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_46.prefab_name].transform, "story_v_out_101061", "101061003", "story_v_out_101061.awb")

						arg_11_1:RecordAudio("101061003", var_14_52)
						arg_11_1:RecordAudio("101061003", var_14_52)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_101061", "101061003", "story_v_out_101061.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_101061", "101061003", "story_v_out_101061.awb")
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
	Play101061004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 101061004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play101061005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["3008ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect3008ui_story == nil then
				arg_15_1.var_.characterEffect3008ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect3008ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_15_1.var_.characterEffect3008ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect3008ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_15_1.var_.characterEffect3008ui_story.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["3008ui_story"].transform
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 then
				arg_15_1.var_.moveOldPos3008ui_story = var_18_6.localPosition
			end

			local var_18_8 = 0.001

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8
				local var_18_10 = Vector3.New(0, 100, 0)

				var_18_6.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos3008ui_story, var_18_10, var_18_9)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_6.position

				var_18_6.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_6.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_6.localEulerAngles = var_18_12
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 then
				var_18_6.localPosition = Vector3.New(0, 100, 0)

				local var_18_13 = manager.ui.mainCamera.transform.position - var_18_6.position

				var_18_6.forward = Vector3.New(var_18_13.x, var_18_13.y, var_18_13.z)

				local var_18_14 = var_18_6.localEulerAngles

				var_18_14.z = 0
				var_18_14.x = 0
				var_18_6.localEulerAngles = var_18_14
			end

			local var_18_15 = 0
			local var_18_16 = 0.625

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_17 = arg_15_1:GetWordFromCfg(101061004)
				local var_18_18 = arg_15_1:FormatText(var_18_17.content)

				arg_15_1.text_.text = var_18_18

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_19 = 25
				local var_18_20 = utf8.len(var_18_18)
				local var_18_21 = var_18_19 <= 0 and var_18_16 or var_18_16 * (var_18_20 / var_18_19)

				if var_18_21 > 0 and var_18_16 < var_18_21 then
					arg_15_1.talkMaxDuration = var_18_21

					if var_18_21 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_15
					end
				end

				arg_15_1.text_.text = var_18_18
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_16, arg_15_1.talkMaxDuration)

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_15) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_15 + var_18_22 and arg_15_1.time_ < var_18_15 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play101061005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 101061005
		arg_19_1.duration_ = 7.166

		local var_19_0 = {
			ja = 7.166,
			ko = 5.633,
			zh = 6.7,
			en = 6.1
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
				arg_19_0:Play101061006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["2020_tpose"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect2020_tpose == nil then
				arg_19_1.var_.characterEffect2020_tpose = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect2020_tpose then
					arg_19_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect2020_tpose then
				arg_19_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["2020_tpose"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos2020_tpose = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(-0.7, -1.2, -4.1)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos2020_tpose, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_22_14 = 0
			local var_22_15 = 0.775

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_16 = arg_19_1:FormatText(StoryNameCfg[19].name)

				arg_19_1.leftNameTxt_.text = var_22_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_17 = arg_19_1:GetWordFromCfg(101061005)
				local var_22_18 = arg_19_1:FormatText(var_22_17.content)

				arg_19_1.text_.text = var_22_18

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_19 = 31
				local var_22_20 = utf8.len(var_22_18)
				local var_22_21 = var_22_19 <= 0 and var_22_15 or var_22_15 * (var_22_20 / var_22_19)

				if var_22_21 > 0 and var_22_15 < var_22_21 then
					arg_19_1.talkMaxDuration = var_22_21

					if var_22_21 + var_22_14 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_14
					end
				end

				arg_19_1.text_.text = var_22_18
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061005", "story_v_out_101061.awb") ~= 0 then
					local var_22_22 = manager.audio:GetVoiceLength("story_v_out_101061", "101061005", "story_v_out_101061.awb") / 1000

					if var_22_22 + var_22_14 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_22 + var_22_14
					end

					if var_22_17.prefab_name ~= "" and arg_19_1.actors_[var_22_17.prefab_name] ~= nil then
						local var_22_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_17.prefab_name].transform, "story_v_out_101061", "101061005", "story_v_out_101061.awb")

						arg_19_1:RecordAudio("101061005", var_22_23)
						arg_19_1:RecordAudio("101061005", var_22_23)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_101061", "101061005", "story_v_out_101061.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_101061", "101061005", "story_v_out_101061.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_24 = math.max(var_22_15, arg_19_1.talkMaxDuration)

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_24 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_14) / var_22_24

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_14 + var_22_24 and arg_19_1.time_ < var_22_14 + var_22_24 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play101061006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 101061006
		arg_23_1.duration_ = 13.966

		local var_23_0 = {
			ja = 13.966,
			ko = 6.3,
			zh = 5.766,
			en = 5.166
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
				arg_23_0:Play101061007(arg_23_1)
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
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_23_1.var_.characterEffect2020_tpose.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect2020_tpose then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_23_1.var_.characterEffect2020_tpose.fillRatio = var_26_5
			end

			local var_26_6 = "1035ui_story"

			if arg_23_1.actors_[var_26_6] == nil then
				local var_26_7 = Object.Instantiate(Asset.Load("Char/" .. var_26_6), arg_23_1.stage_.transform)

				var_26_7.name = var_26_6
				var_26_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_6] = var_26_7

				local var_26_8 = var_26_7:GetComponentInChildren(typeof(CharacterEffect))

				var_26_8.enabled = true

				local var_26_9 = GameObjectTools.GetOrAddComponent(var_26_7, typeof(DynamicBoneHelper))

				if var_26_9 then
					var_26_9:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_8.transform, false)

				arg_23_1.var_[var_26_6 .. "Animator"] = var_26_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_6 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_6 .. "LipSync"] = var_26_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_10 = arg_23_1.actors_["1035ui_story"]
			local var_26_11 = 0

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1035ui_story == nil then
				arg_23_1.var_.characterEffect1035ui_story = var_26_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_12 = 0.100000001490116

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_12 then
				local var_26_13 = (arg_23_1.time_ - var_26_11) / var_26_12

				if arg_23_1.var_.characterEffect1035ui_story then
					arg_23_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_11 + var_26_12 and arg_23_1.time_ < var_26_11 + var_26_12 + arg_26_0 and arg_23_1.var_.characterEffect1035ui_story then
				arg_23_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action11_1")
			end

			local var_26_15 = arg_23_1.actors_["1035ui_story"].transform
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.var_.moveOldPos1035ui_story = var_26_15.localPosition
			end

			local var_26_17 = 0.001

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Vector3.New(0.7, -1.05, -5.6)

				var_26_15.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1035ui_story, var_26_19, var_26_18)

				local var_26_20 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_20.x, var_26_20.y, var_26_20.z)

				local var_26_21 = var_26_15.localEulerAngles

				var_26_21.z = 0
				var_26_21.x = 0
				var_26_15.localEulerAngles = var_26_21
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				var_26_15.localPosition = Vector3.New(0.7, -1.05, -5.6)

				local var_26_22 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_22.x, var_26_22.y, var_26_22.z)

				local var_26_23 = var_26_15.localEulerAngles

				var_26_23.z = 0
				var_26_23.x = 0
				var_26_15.localEulerAngles = var_26_23
			end

			local var_26_24 = 0
			local var_26_25 = 0.7

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_26 = arg_23_1:FormatText(StoryNameCfg[21].name)

				arg_23_1.leftNameTxt_.text = var_26_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_27 = arg_23_1:GetWordFromCfg(101061006)
				local var_26_28 = arg_23_1:FormatText(var_26_27.content)

				arg_23_1.text_.text = var_26_28

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_29 = 28
				local var_26_30 = utf8.len(var_26_28)
				local var_26_31 = var_26_29 <= 0 and var_26_25 or var_26_25 * (var_26_30 / var_26_29)

				if var_26_31 > 0 and var_26_25 < var_26_31 then
					arg_23_1.talkMaxDuration = var_26_31

					if var_26_31 + var_26_24 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_31 + var_26_24
					end
				end

				arg_23_1.text_.text = var_26_28
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061006", "story_v_out_101061.awb") ~= 0 then
					local var_26_32 = manager.audio:GetVoiceLength("story_v_out_101061", "101061006", "story_v_out_101061.awb") / 1000

					if var_26_32 + var_26_24 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_32 + var_26_24
					end

					if var_26_27.prefab_name ~= "" and arg_23_1.actors_[var_26_27.prefab_name] ~= nil then
						local var_26_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_27.prefab_name].transform, "story_v_out_101061", "101061006", "story_v_out_101061.awb")

						arg_23_1:RecordAudio("101061006", var_26_33)
						arg_23_1:RecordAudio("101061006", var_26_33)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_101061", "101061006", "story_v_out_101061.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_101061", "101061006", "story_v_out_101061.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_34 = math.max(var_26_25, arg_23_1.talkMaxDuration)

			if var_26_24 <= arg_23_1.time_ and arg_23_1.time_ < var_26_24 + var_26_34 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_24) / var_26_34

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_24 + var_26_34 and arg_23_1.time_ < var_26_24 + var_26_34 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play101061007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 101061007
		arg_27_1.duration_ = 7.966

		local var_27_0 = {
			ja = 7.966,
			ko = 7.466,
			zh = 5.866,
			en = 5.5
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
				arg_27_0:Play101061008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["2020_tpose"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose == nil then
				arg_27_1.var_.characterEffect2020_tpose = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect2020_tpose then
					arg_27_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose then
				arg_27_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["1035ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect1035ui_story == nil then
				arg_27_1.var_.characterEffect1035ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1035ui_story then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect1035ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1035ui_story.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1035ui_story then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect1035ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1035ui_story.fillRatio = var_30_9
			end

			local var_30_10 = 0
			local var_30_11 = 0.75

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_12 = arg_27_1:FormatText(StoryNameCfg[19].name)

				arg_27_1.leftNameTxt_.text = var_30_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_13 = arg_27_1:GetWordFromCfg(101061007)
				local var_30_14 = arg_27_1:FormatText(var_30_13.content)

				arg_27_1.text_.text = var_30_14

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_15 = 30
				local var_30_16 = utf8.len(var_30_14)
				local var_30_17 = var_30_15 <= 0 and var_30_11 or var_30_11 * (var_30_16 / var_30_15)

				if var_30_17 > 0 and var_30_11 < var_30_17 then
					arg_27_1.talkMaxDuration = var_30_17

					if var_30_17 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_17 + var_30_10
					end
				end

				arg_27_1.text_.text = var_30_14
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061007", "story_v_out_101061.awb") ~= 0 then
					local var_30_18 = manager.audio:GetVoiceLength("story_v_out_101061", "101061007", "story_v_out_101061.awb") / 1000

					if var_30_18 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_10
					end

					if var_30_13.prefab_name ~= "" and arg_27_1.actors_[var_30_13.prefab_name] ~= nil then
						local var_30_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_13.prefab_name].transform, "story_v_out_101061", "101061007", "story_v_out_101061.awb")

						arg_27_1:RecordAudio("101061007", var_30_19)
						arg_27_1:RecordAudio("101061007", var_30_19)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_101061", "101061007", "story_v_out_101061.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_101061", "101061007", "story_v_out_101061.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_20 = math.max(var_30_11, arg_27_1.talkMaxDuration)

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_20 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_10) / var_30_20

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_10 + var_30_20 and arg_27_1.time_ < var_30_10 + var_30_20 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play101061008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 101061008
		arg_31_1.duration_ = 6.666

		local var_31_0 = {
			ja = 3.566,
			ko = 6.666,
			zh = 2.7,
			en = 3.266
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
				arg_31_0:Play101061009(arg_31_1)
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
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_31_1.var_.characterEffect2020_tpose.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect2020_tpose then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_31_1.var_.characterEffect2020_tpose.fillRatio = var_34_5
			end

			local var_34_6 = arg_31_1.actors_["1035ui_story"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 and arg_31_1.var_.characterEffect1035ui_story == nil then
				arg_31_1.var_.characterEffect1035ui_story = var_34_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_8 = 0.1

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8

				if arg_31_1.var_.characterEffect1035ui_story then
					arg_31_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 and arg_31_1.var_.characterEffect1035ui_story then
				arg_31_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035actionlink/1035action4118")
			end

			local var_34_11 = 0
			local var_34_12 = 0.3

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_13 = arg_31_1:FormatText(StoryNameCfg[21].name)

				arg_31_1.leftNameTxt_.text = var_34_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_14 = arg_31_1:GetWordFromCfg(101061008)
				local var_34_15 = arg_31_1:FormatText(var_34_14.content)

				arg_31_1.text_.text = var_34_15

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_16 = 12
				local var_34_17 = utf8.len(var_34_15)
				local var_34_18 = var_34_16 <= 0 and var_34_12 or var_34_12 * (var_34_17 / var_34_16)

				if var_34_18 > 0 and var_34_12 < var_34_18 then
					arg_31_1.talkMaxDuration = var_34_18

					if var_34_18 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_11
					end
				end

				arg_31_1.text_.text = var_34_15
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061008", "story_v_out_101061.awb") ~= 0 then
					local var_34_19 = manager.audio:GetVoiceLength("story_v_out_101061", "101061008", "story_v_out_101061.awb") / 1000

					if var_34_19 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_11
					end

					if var_34_14.prefab_name ~= "" and arg_31_1.actors_[var_34_14.prefab_name] ~= nil then
						local var_34_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_14.prefab_name].transform, "story_v_out_101061", "101061008", "story_v_out_101061.awb")

						arg_31_1:RecordAudio("101061008", var_34_20)
						arg_31_1:RecordAudio("101061008", var_34_20)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_101061", "101061008", "story_v_out_101061.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_101061", "101061008", "story_v_out_101061.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_21 = math.max(var_34_12, arg_31_1.talkMaxDuration)

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_21 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_11) / var_34_21

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_11 + var_34_21 and arg_31_1.time_ < var_34_11 + var_34_21 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play101061009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 101061009
		arg_35_1.duration_ = 8.666

		local var_35_0 = {
			ja = 8.666,
			ko = 3.1,
			zh = 5.8,
			en = 5.6
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
				arg_35_0:Play101061010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["2020_tpose"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose == nil then
				arg_35_1.var_.characterEffect2020_tpose = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect2020_tpose then
					arg_35_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose then
				arg_35_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1035ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1035ui_story == nil then
				arg_35_1.var_.characterEffect1035ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1035ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1035ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1035ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1035ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1035ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1035ui_story.fillRatio = var_38_9
			end

			local var_38_10 = 0
			local var_38_11 = 0.675

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_12 = arg_35_1:FormatText(StoryNameCfg[19].name)

				arg_35_1.leftNameTxt_.text = var_38_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_13 = arg_35_1:GetWordFromCfg(101061009)
				local var_38_14 = arg_35_1:FormatText(var_38_13.content)

				arg_35_1.text_.text = var_38_14

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_15 = 27
				local var_38_16 = utf8.len(var_38_14)
				local var_38_17 = var_38_15 <= 0 and var_38_11 or var_38_11 * (var_38_16 / var_38_15)

				if var_38_17 > 0 and var_38_11 < var_38_17 then
					arg_35_1.talkMaxDuration = var_38_17

					if var_38_17 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_17 + var_38_10
					end
				end

				arg_35_1.text_.text = var_38_14
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061009", "story_v_out_101061.awb") ~= 0 then
					local var_38_18 = manager.audio:GetVoiceLength("story_v_out_101061", "101061009", "story_v_out_101061.awb") / 1000

					if var_38_18 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_10
					end

					if var_38_13.prefab_name ~= "" and arg_35_1.actors_[var_38_13.prefab_name] ~= nil then
						local var_38_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_13.prefab_name].transform, "story_v_out_101061", "101061009", "story_v_out_101061.awb")

						arg_35_1:RecordAudio("101061009", var_38_19)
						arg_35_1:RecordAudio("101061009", var_38_19)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_101061", "101061009", "story_v_out_101061.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_101061", "101061009", "story_v_out_101061.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_20 = math.max(var_38_11, arg_35_1.talkMaxDuration)

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_20 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_10) / var_38_20

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_10 + var_38_20 and arg_35_1.time_ < var_38_10 + var_38_20 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play101061010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 101061010
		arg_39_1.duration_ = 7

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play101061011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["2020_tpose"]
			local var_42_1 = 2

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect2020_tpose == nil then
				arg_39_1.var_.characterEffect2020_tpose = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect2020_tpose then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_39_1.var_.characterEffect2020_tpose.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect2020_tpose then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_39_1.var_.characterEffect2020_tpose.fillRatio = var_42_5
			end

			local var_42_6 = arg_39_1.bgs_.B08b
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 then
				local var_42_8 = var_42_6:GetComponent("SpriteRenderer")

				if var_42_8 then
					var_42_8.material = arg_39_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_42_9 = var_42_8.material
					local var_42_10 = var_42_9:GetColor("_Color")

					arg_39_1.var_.alphaOldValueB08b = var_42_10.a
					arg_39_1.var_.alphaMatValueB08b = var_42_9
				end

				arg_39_1.var_.alphaOldValueB08b = 1
			end

			local var_42_11 = 1.5

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_7) / var_42_11
				local var_42_13 = Mathf.Lerp(arg_39_1.var_.alphaOldValueB08b, 0, var_42_12)

				if arg_39_1.var_.alphaMatValueB08b then
					local var_42_14 = arg_39_1.var_.alphaMatValueB08b
					local var_42_15 = var_42_14:GetColor("_Color")

					var_42_15.a = var_42_13

					var_42_14:SetColor("_Color", var_42_15)
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_11 and arg_39_1.time_ < var_42_7 + var_42_11 + arg_42_0 and arg_39_1.var_.alphaMatValueB08b then
				local var_42_16 = arg_39_1.var_.alphaMatValueB08b
				local var_42_17 = var_42_16:GetColor("_Color")

				var_42_17.a = 0

				var_42_16:SetColor("_Color", var_42_17)
			end

			local var_42_18 = arg_39_1.bgs_.B08b.transform
			local var_42_19 = 1.5

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.var_.moveOldPosB08b = var_42_18.localPosition
			end

			local var_42_20 = 0.001

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_20 then
				local var_42_21 = (arg_39_1.time_ - var_42_19) / var_42_20
				local var_42_22 = Vector3.New(0, -100, 10)

				var_42_18.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPosB08b, var_42_22, var_42_21)
			end

			if arg_39_1.time_ >= var_42_19 + var_42_20 and arg_39_1.time_ < var_42_19 + var_42_20 + arg_42_0 then
				var_42_18.localPosition = Vector3.New(0, -100, 10)
			end

			local var_42_23 = "B08c"

			if arg_39_1.bgs_[var_42_23] == nil then
				local var_42_24 = Object.Instantiate(arg_39_1.paintGo_)

				var_42_24:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_42_23)
				var_42_24.name = var_42_23
				var_42_24.transform.parent = arg_39_1.stage_.transform
				var_42_24.transform.localPosition = Vector3.New(0, 100, 0)
				arg_39_1.bgs_[var_42_23] = var_42_24
			end

			local var_42_25 = arg_39_1.bgs_.B08c
			local var_42_26 = 1.5

			if var_42_26 < arg_39_1.time_ and arg_39_1.time_ <= var_42_26 + arg_42_0 then
				local var_42_27 = var_42_25:GetComponent("SpriteRenderer")

				if var_42_27 then
					var_42_27.material = arg_39_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_42_28 = var_42_27.material
					local var_42_29 = var_42_28:GetColor("_Color")

					arg_39_1.var_.alphaOldValueB08c = var_42_29.a
					arg_39_1.var_.alphaMatValueB08c = var_42_28
				end

				arg_39_1.var_.alphaOldValueB08c = 0
			end

			local var_42_30 = 1.5

			if var_42_26 <= arg_39_1.time_ and arg_39_1.time_ < var_42_26 + var_42_30 then
				local var_42_31 = (arg_39_1.time_ - var_42_26) / var_42_30
				local var_42_32 = Mathf.Lerp(arg_39_1.var_.alphaOldValueB08c, 1, var_42_31)

				if arg_39_1.var_.alphaMatValueB08c then
					local var_42_33 = arg_39_1.var_.alphaMatValueB08c
					local var_42_34 = var_42_33:GetColor("_Color")

					var_42_34.a = var_42_32

					var_42_33:SetColor("_Color", var_42_34)
				end
			end

			if arg_39_1.time_ >= var_42_26 + var_42_30 and arg_39_1.time_ < var_42_26 + var_42_30 + arg_42_0 and arg_39_1.var_.alphaMatValueB08c then
				local var_42_35 = arg_39_1.var_.alphaMatValueB08c
				local var_42_36 = var_42_35:GetColor("_Color")

				var_42_36.a = 1

				var_42_35:SetColor("_Color", var_42_36)
			end

			local var_42_37 = 1.5

			if var_42_37 < arg_39_1.time_ and arg_39_1.time_ <= var_42_37 + arg_42_0 then
				local var_42_38 = manager.ui.mainCamera.transform.localPosition
				local var_42_39 = Vector3.New(0, 0, 10) + Vector3.New(var_42_38.x, var_42_38.y, 0)
				local var_42_40 = arg_39_1.bgs_.B08c

				var_42_40.transform.localPosition = var_42_39
				var_42_40.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_41 = var_42_40:GetComponent("SpriteRenderer")

				if var_42_41 and var_42_41.sprite then
					local var_42_42 = (var_42_40.transform.localPosition - var_42_38).z
					local var_42_43 = manager.ui.mainCameraCom_
					local var_42_44 = 2 * var_42_42 * Mathf.Tan(var_42_43.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_45 = var_42_44 * var_42_43.aspect
					local var_42_46 = var_42_41.sprite.bounds.size.x
					local var_42_47 = var_42_41.sprite.bounds.size.y
					local var_42_48 = var_42_45 / var_42_46
					local var_42_49 = var_42_44 / var_42_47
					local var_42_50 = var_42_49 < var_42_48 and var_42_48 or var_42_49

					var_42_40.transform.localScale = Vector3.New(var_42_50, var_42_50, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "B08c" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_42_51 = arg_39_1.actors_["2020_tpose"].transform
			local var_42_52 = 0

			if var_42_52 < arg_39_1.time_ and arg_39_1.time_ <= var_42_52 + arg_42_0 then
				arg_39_1.var_.moveOldPos2020_tpose = var_42_51.localPosition
			end

			local var_42_53 = 0.001

			if var_42_52 <= arg_39_1.time_ and arg_39_1.time_ < var_42_52 + var_42_53 then
				local var_42_54 = (arg_39_1.time_ - var_42_52) / var_42_53
				local var_42_55 = Vector3.New(0, 100, 0)

				var_42_51.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos2020_tpose, var_42_55, var_42_54)

				local var_42_56 = manager.ui.mainCamera.transform.position - var_42_51.position

				var_42_51.forward = Vector3.New(var_42_56.x, var_42_56.y, var_42_56.z)

				local var_42_57 = var_42_51.localEulerAngles

				var_42_57.z = 0
				var_42_57.x = 0
				var_42_51.localEulerAngles = var_42_57
			end

			if arg_39_1.time_ >= var_42_52 + var_42_53 and arg_39_1.time_ < var_42_52 + var_42_53 + arg_42_0 then
				var_42_51.localPosition = Vector3.New(0, 100, 0)

				local var_42_58 = manager.ui.mainCamera.transform.position - var_42_51.position

				var_42_51.forward = Vector3.New(var_42_58.x, var_42_58.y, var_42_58.z)

				local var_42_59 = var_42_51.localEulerAngles

				var_42_59.z = 0
				var_42_59.x = 0
				var_42_51.localEulerAngles = var_42_59
			end

			local var_42_60 = arg_39_1.actors_["1035ui_story"].transform
			local var_42_61 = 0

			if var_42_61 < arg_39_1.time_ and arg_39_1.time_ <= var_42_61 + arg_42_0 then
				arg_39_1.var_.moveOldPos1035ui_story = var_42_60.localPosition
			end

			local var_42_62 = 0.001

			if var_42_61 <= arg_39_1.time_ and arg_39_1.time_ < var_42_61 + var_42_62 then
				local var_42_63 = (arg_39_1.time_ - var_42_61) / var_42_62
				local var_42_64 = Vector3.New(0, 100, 0)

				var_42_60.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1035ui_story, var_42_64, var_42_63)

				local var_42_65 = manager.ui.mainCamera.transform.position - var_42_60.position

				var_42_60.forward = Vector3.New(var_42_65.x, var_42_65.y, var_42_65.z)

				local var_42_66 = var_42_60.localEulerAngles

				var_42_66.z = 0
				var_42_66.x = 0
				var_42_60.localEulerAngles = var_42_66
			end

			if arg_39_1.time_ >= var_42_61 + var_42_62 and arg_39_1.time_ < var_42_61 + var_42_62 + arg_42_0 then
				var_42_60.localPosition = Vector3.New(0, 100, 0)

				local var_42_67 = manager.ui.mainCamera.transform.position - var_42_60.position

				var_42_60.forward = Vector3.New(var_42_67.x, var_42_67.y, var_42_67.z)

				local var_42_68 = var_42_60.localEulerAngles

				var_42_68.z = 0
				var_42_68.x = 0
				var_42_60.localEulerAngles = var_42_68
			end

			local var_42_69 = 0

			if var_42_69 < arg_39_1.time_ and arg_39_1.time_ <= var_42_69 + arg_42_0 then
				arg_39_1.allBtn_.enabled = false
			end

			local var_42_70 = 2

			if arg_39_1.time_ >= var_42_69 + var_42_70 and arg_39_1.time_ < var_42_69 + var_42_70 + arg_42_0 then
				arg_39_1.allBtn_.enabled = true
			end

			if arg_39_1.frameCnt_ <= 1 then
				arg_39_1.dialog_:SetActive(false)
			end

			local var_42_71 = 2
			local var_42_72 = 0.125

			if var_42_71 < arg_39_1.time_ and arg_39_1.time_ <= var_42_71 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_73 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_73:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_73:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_73:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_74 = arg_39_1:GetWordFromCfg(101061010)
				local var_42_75 = arg_39_1:FormatText(var_42_74.content)

				arg_39_1.text_.text = var_42_75

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_76 = 5
				local var_42_77 = utf8.len(var_42_75)
				local var_42_78 = var_42_76 <= 0 and var_42_72 or var_42_72 * (var_42_77 / var_42_76)

				if var_42_78 > 0 and var_42_72 < var_42_78 then
					arg_39_1.talkMaxDuration = var_42_78
					var_42_71 = var_42_71 + 0.3

					if var_42_78 + var_42_71 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_78 + var_42_71
					end
				end

				arg_39_1.text_.text = var_42_75
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_79 = var_42_71 + 0.3
			local var_42_80 = math.max(var_42_72, arg_39_1.talkMaxDuration)

			if var_42_79 <= arg_39_1.time_ and arg_39_1.time_ < var_42_79 + var_42_80 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_79) / var_42_80

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_79 + var_42_80 and arg_39_1.time_ < var_42_79 + var_42_80 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play101061011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 101061011
		arg_45_1.duration_ = 3.166

		local var_45_0 = {
			ja = 2.866,
			ko = 2.033,
			zh = 2.8,
			en = 3.166
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
				arg_45_0:Play101061012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["3008ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect3008ui_story == nil then
				arg_45_1.var_.characterEffect3008ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.1

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect3008ui_story then
					arg_45_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect3008ui_story then
				arg_45_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_48_4 = arg_45_1.actors_["3008ui_story"].transform
			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1.var_.moveOldPos3008ui_story = var_48_4.localPosition
			end

			local var_48_6 = 0.001

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6
				local var_48_8 = Vector3.New(0, -1.51, -4.3)

				var_48_4.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos3008ui_story, var_48_8, var_48_7)

				local var_48_9 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_9.x, var_48_9.y, var_48_9.z)

				local var_48_10 = var_48_4.localEulerAngles

				var_48_10.z = 0
				var_48_10.x = 0
				var_48_4.localEulerAngles = var_48_10
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 then
				var_48_4.localPosition = Vector3.New(0, -1.51, -4.3)

				local var_48_11 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_11.x, var_48_11.y, var_48_11.z)

				local var_48_12 = var_48_4.localEulerAngles

				var_48_12.z = 0
				var_48_12.x = 0
				var_48_4.localEulerAngles = var_48_12
			end

			local var_48_13 = 0

			if var_48_13 < arg_45_1.time_ and arg_45_1.time_ <= var_48_13 + arg_48_0 then
				arg_45_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action6_1")
			end

			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				arg_45_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_48_15 = 0
			local var_48_16 = 0.325

			if var_48_15 < arg_45_1.time_ and arg_45_1.time_ <= var_48_15 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_17 = arg_45_1:FormatText(StoryNameCfg[20].name)

				arg_45_1.leftNameTxt_.text = var_48_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_18 = arg_45_1:GetWordFromCfg(101061011)
				local var_48_19 = arg_45_1:FormatText(var_48_18.content)

				arg_45_1.text_.text = var_48_19

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_20 = 11
				local var_48_21 = utf8.len(var_48_19)
				local var_48_22 = var_48_20 <= 0 and var_48_16 or var_48_16 * (var_48_21 / var_48_20)

				if var_48_22 > 0 and var_48_16 < var_48_22 then
					arg_45_1.talkMaxDuration = var_48_22

					if var_48_22 + var_48_15 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_22 + var_48_15
					end
				end

				arg_45_1.text_.text = var_48_19
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061011", "story_v_out_101061.awb") ~= 0 then
					local var_48_23 = manager.audio:GetVoiceLength("story_v_out_101061", "101061011", "story_v_out_101061.awb") / 1000

					if var_48_23 + var_48_15 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_23 + var_48_15
					end

					if var_48_18.prefab_name ~= "" and arg_45_1.actors_[var_48_18.prefab_name] ~= nil then
						local var_48_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_18.prefab_name].transform, "story_v_out_101061", "101061011", "story_v_out_101061.awb")

						arg_45_1:RecordAudio("101061011", var_48_24)
						arg_45_1:RecordAudio("101061011", var_48_24)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_101061", "101061011", "story_v_out_101061.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_101061", "101061011", "story_v_out_101061.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_25 = math.max(var_48_16, arg_45_1.talkMaxDuration)

			if var_48_15 <= arg_45_1.time_ and arg_45_1.time_ < var_48_15 + var_48_25 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_15) / var_48_25

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_15 + var_48_25 and arg_45_1.time_ < var_48_15 + var_48_25 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play101061012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 101061012
		arg_49_1.duration_ = 5

		local var_49_0 = {
			ja = 5,
			ko = 4.433,
			zh = 4,
			en = 4.8
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
				arg_49_0:Play101061013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["3008ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect3008ui_story == nil then
				arg_49_1.var_.characterEffect3008ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.1

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect3008ui_story then
					local var_52_4 = Mathf.Lerp(0, 0.5, var_52_3)

					arg_49_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_49_1.var_.characterEffect3008ui_story.fillRatio = var_52_4
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect3008ui_story then
				local var_52_5 = 0.5

				arg_49_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_49_1.var_.characterEffect3008ui_story.fillRatio = var_52_5
			end

			local var_52_6 = 0
			local var_52_7 = 0.225

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_8 = arg_49_1:FormatText(StoryNameCfg[34].name)

				arg_49_1.leftNameTxt_.text = var_52_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, true)
				arg_49_1.iconController_:SetSelectedState("hero")

				arg_49_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_9 = arg_49_1:GetWordFromCfg(101061012)
				local var_52_10 = arg_49_1:FormatText(var_52_9.content)

				arg_49_1.text_.text = var_52_10

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_11 = 9
				local var_52_12 = utf8.len(var_52_10)
				local var_52_13 = var_52_11 <= 0 and var_52_7 or var_52_7 * (var_52_12 / var_52_11)

				if var_52_13 > 0 and var_52_7 < var_52_13 then
					arg_49_1.talkMaxDuration = var_52_13

					if var_52_13 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_13 + var_52_6
					end
				end

				arg_49_1.text_.text = var_52_10
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061012", "story_v_out_101061.awb") ~= 0 then
					local var_52_14 = manager.audio:GetVoiceLength("story_v_out_101061", "101061012", "story_v_out_101061.awb") / 1000

					if var_52_14 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_14 + var_52_6
					end

					if var_52_9.prefab_name ~= "" and arg_49_1.actors_[var_52_9.prefab_name] ~= nil then
						local var_52_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_9.prefab_name].transform, "story_v_out_101061", "101061012", "story_v_out_101061.awb")

						arg_49_1:RecordAudio("101061012", var_52_15)
						arg_49_1:RecordAudio("101061012", var_52_15)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_101061", "101061012", "story_v_out_101061.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_101061", "101061012", "story_v_out_101061.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_16 = math.max(var_52_7, arg_49_1.talkMaxDuration)

			if var_52_6 <= arg_49_1.time_ and arg_49_1.time_ < var_52_6 + var_52_16 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_6) / var_52_16

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_6 + var_52_16 and arg_49_1.time_ < var_52_6 + var_52_16 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play101061013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 101061013
		arg_53_1.duration_ = 4.733

		local var_53_0 = {
			ja = 2.833,
			ko = 4.733,
			zh = 4.566,
			en = 4.133
		}
		local var_53_1 = manager.audio:GetLocalizationFlag()

		if var_53_0[var_53_1] ~= nil then
			arg_53_1.duration_ = var_53_0[var_53_1]
		end

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play101061014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["3008ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect3008ui_story == nil then
				arg_53_1.var_.characterEffect3008ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.1

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect3008ui_story then
					arg_53_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect3008ui_story then
				arg_53_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_56_4 = arg_53_1.actors_["3008ui_story"].transform
			local var_56_5 = 0

			if var_56_5 < arg_53_1.time_ and arg_53_1.time_ <= var_56_5 + arg_56_0 then
				arg_53_1.var_.moveOldPos3008ui_story = var_56_4.localPosition
			end

			local var_56_6 = 0.5

			if var_56_5 <= arg_53_1.time_ and arg_53_1.time_ < var_56_5 + var_56_6 then
				local var_56_7 = (arg_53_1.time_ - var_56_5) / var_56_6
				local var_56_8 = Vector3.New(-0.7, -1.51, -4.3)

				var_56_4.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos3008ui_story, var_56_8, var_56_7)

				local var_56_9 = manager.ui.mainCamera.transform.position - var_56_4.position

				var_56_4.forward = Vector3.New(var_56_9.x, var_56_9.y, var_56_9.z)

				local var_56_10 = var_56_4.localEulerAngles

				var_56_10.z = 0
				var_56_10.x = 0
				var_56_4.localEulerAngles = var_56_10
			end

			if arg_53_1.time_ >= var_56_5 + var_56_6 and arg_53_1.time_ < var_56_5 + var_56_6 + arg_56_0 then
				var_56_4.localPosition = Vector3.New(-0.7, -1.51, -4.3)

				local var_56_11 = manager.ui.mainCamera.transform.position - var_56_4.position

				var_56_4.forward = Vector3.New(var_56_11.x, var_56_11.y, var_56_11.z)

				local var_56_12 = var_56_4.localEulerAngles

				var_56_12.z = 0
				var_56_12.x = 0
				var_56_4.localEulerAngles = var_56_12
			end

			local var_56_13 = 0

			if var_56_13 < arg_53_1.time_ and arg_53_1.time_ <= var_56_13 + arg_56_0 then
				arg_53_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_56_14 = 0
			local var_56_15 = 0.55

			if var_56_14 < arg_53_1.time_ and arg_53_1.time_ <= var_56_14 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_16 = arg_53_1:FormatText(StoryNameCfg[20].name)

				arg_53_1.leftNameTxt_.text = var_56_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_17 = arg_53_1:GetWordFromCfg(101061013)
				local var_56_18 = arg_53_1:FormatText(var_56_17.content)

				arg_53_1.text_.text = var_56_18

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_19 = 22
				local var_56_20 = utf8.len(var_56_18)
				local var_56_21 = var_56_19 <= 0 and var_56_15 or var_56_15 * (var_56_20 / var_56_19)

				if var_56_21 > 0 and var_56_15 < var_56_21 then
					arg_53_1.talkMaxDuration = var_56_21

					if var_56_21 + var_56_14 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_21 + var_56_14
					end
				end

				arg_53_1.text_.text = var_56_18
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061013", "story_v_out_101061.awb") ~= 0 then
					local var_56_22 = manager.audio:GetVoiceLength("story_v_out_101061", "101061013", "story_v_out_101061.awb") / 1000

					if var_56_22 + var_56_14 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_22 + var_56_14
					end

					if var_56_17.prefab_name ~= "" and arg_53_1.actors_[var_56_17.prefab_name] ~= nil then
						local var_56_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_17.prefab_name].transform, "story_v_out_101061", "101061013", "story_v_out_101061.awb")

						arg_53_1:RecordAudio("101061013", var_56_23)
						arg_53_1:RecordAudio("101061013", var_56_23)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_101061", "101061013", "story_v_out_101061.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_101061", "101061013", "story_v_out_101061.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_24 = math.max(var_56_15, arg_53_1.talkMaxDuration)

			if var_56_14 <= arg_53_1.time_ and arg_53_1.time_ < var_56_14 + var_56_24 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_14) / var_56_24

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_14 + var_56_24 and arg_53_1.time_ < var_56_14 + var_56_24 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play101061014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 101061014
		arg_57_1.duration_ = 6.866

		local var_57_0 = {
			ja = 6.866,
			ko = 3.666,
			zh = 5.2,
			en = 5.933
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
				arg_57_0:Play101061015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["2020_tpose"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect2020_tpose == nil then
				arg_57_1.var_.characterEffect2020_tpose = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.1

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect2020_tpose then
					arg_57_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect2020_tpose then
				arg_57_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_60_4 = arg_57_1.actors_["3008ui_story"]
			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 and arg_57_1.var_.characterEffect3008ui_story == nil then
				arg_57_1.var_.characterEffect3008ui_story = var_60_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_6 = 0.1

			if var_60_5 <= arg_57_1.time_ and arg_57_1.time_ < var_60_5 + var_60_6 then
				local var_60_7 = (arg_57_1.time_ - var_60_5) / var_60_6

				if arg_57_1.var_.characterEffect3008ui_story then
					local var_60_8 = Mathf.Lerp(0, 0.5, var_60_7)

					arg_57_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_57_1.var_.characterEffect3008ui_story.fillRatio = var_60_8
				end
			end

			if arg_57_1.time_ >= var_60_5 + var_60_6 and arg_57_1.time_ < var_60_5 + var_60_6 + arg_60_0 and arg_57_1.var_.characterEffect3008ui_story then
				local var_60_9 = 0.5

				arg_57_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_57_1.var_.characterEffect3008ui_story.fillRatio = var_60_9
			end

			local var_60_10 = arg_57_1.actors_["2020_tpose"].transform
			local var_60_11 = 0

			if var_60_11 < arg_57_1.time_ and arg_57_1.time_ <= var_60_11 + arg_60_0 then
				arg_57_1.var_.moveOldPos2020_tpose = var_60_10.localPosition
			end

			local var_60_12 = 0.001

			if var_60_11 <= arg_57_1.time_ and arg_57_1.time_ < var_60_11 + var_60_12 then
				local var_60_13 = (arg_57_1.time_ - var_60_11) / var_60_12
				local var_60_14 = Vector3.New(0.7, -1.2, -4.1)

				var_60_10.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos2020_tpose, var_60_14, var_60_13)

				local var_60_15 = manager.ui.mainCamera.transform.position - var_60_10.position

				var_60_10.forward = Vector3.New(var_60_15.x, var_60_15.y, var_60_15.z)

				local var_60_16 = var_60_10.localEulerAngles

				var_60_16.z = 0
				var_60_16.x = 0
				var_60_10.localEulerAngles = var_60_16
			end

			if arg_57_1.time_ >= var_60_11 + var_60_12 and arg_57_1.time_ < var_60_11 + var_60_12 + arg_60_0 then
				var_60_10.localPosition = Vector3.New(0.7, -1.2, -4.1)

				local var_60_17 = manager.ui.mainCamera.transform.position - var_60_10.position

				var_60_10.forward = Vector3.New(var_60_17.x, var_60_17.y, var_60_17.z)

				local var_60_18 = var_60_10.localEulerAngles

				var_60_18.z = 0
				var_60_18.x = 0
				var_60_10.localEulerAngles = var_60_18
			end

			local var_60_19 = 0

			if var_60_19 < arg_57_1.time_ and arg_57_1.time_ <= var_60_19 + arg_60_0 then
				arg_57_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_60_20 = 0
			local var_60_21 = 0.475

			if var_60_20 < arg_57_1.time_ and arg_57_1.time_ <= var_60_20 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_22 = arg_57_1:FormatText(StoryNameCfg[34].name)

				arg_57_1.leftNameTxt_.text = var_60_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_23 = arg_57_1:GetWordFromCfg(101061014)
				local var_60_24 = arg_57_1:FormatText(var_60_23.content)

				arg_57_1.text_.text = var_60_24

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_25 = 19
				local var_60_26 = utf8.len(var_60_24)
				local var_60_27 = var_60_25 <= 0 and var_60_21 or var_60_21 * (var_60_26 / var_60_25)

				if var_60_27 > 0 and var_60_21 < var_60_27 then
					arg_57_1.talkMaxDuration = var_60_27

					if var_60_27 + var_60_20 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_27 + var_60_20
					end
				end

				arg_57_1.text_.text = var_60_24
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061014", "story_v_out_101061.awb") ~= 0 then
					local var_60_28 = manager.audio:GetVoiceLength("story_v_out_101061", "101061014", "story_v_out_101061.awb") / 1000

					if var_60_28 + var_60_20 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_28 + var_60_20
					end

					if var_60_23.prefab_name ~= "" and arg_57_1.actors_[var_60_23.prefab_name] ~= nil then
						local var_60_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_23.prefab_name].transform, "story_v_out_101061", "101061014", "story_v_out_101061.awb")

						arg_57_1:RecordAudio("101061014", var_60_29)
						arg_57_1:RecordAudio("101061014", var_60_29)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_101061", "101061014", "story_v_out_101061.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_101061", "101061014", "story_v_out_101061.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_30 = math.max(var_60_21, arg_57_1.talkMaxDuration)

			if var_60_20 <= arg_57_1.time_ and arg_57_1.time_ < var_60_20 + var_60_30 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_20) / var_60_30

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_20 + var_60_30 and arg_57_1.time_ < var_60_20 + var_60_30 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play101061015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 101061015
		arg_61_1.duration_ = 6.866

		local var_61_0 = {
			ja = 6.866,
			ko = 4.9,
			zh = 3.566,
			en = 4
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
				arg_61_0:Play101061016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["3008ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect3008ui_story == nil then
				arg_61_1.var_.characterEffect3008ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.1

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect3008ui_story then
					arg_61_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect3008ui_story then
				arg_61_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["2020_tpose"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect2020_tpose == nil then
				arg_61_1.var_.characterEffect2020_tpose = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.1

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect2020_tpose then
					local var_64_8 = Mathf.Lerp(0, 0.5, var_64_7)

					arg_61_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_61_1.var_.characterEffect2020_tpose.fillRatio = var_64_8
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect2020_tpose then
				local var_64_9 = 0.5

				arg_61_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_61_1.var_.characterEffect2020_tpose.fillRatio = var_64_9
			end

			local var_64_10 = 0

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_64_11 = 0
			local var_64_12 = 0.425

			if var_64_11 < arg_61_1.time_ and arg_61_1.time_ <= var_64_11 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_13 = arg_61_1:FormatText(StoryNameCfg[20].name)

				arg_61_1.leftNameTxt_.text = var_64_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_14 = arg_61_1:GetWordFromCfg(101061015)
				local var_64_15 = arg_61_1:FormatText(var_64_14.content)

				arg_61_1.text_.text = var_64_15

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_16 = 17
				local var_64_17 = utf8.len(var_64_15)
				local var_64_18 = var_64_16 <= 0 and var_64_12 or var_64_12 * (var_64_17 / var_64_16)

				if var_64_18 > 0 and var_64_12 < var_64_18 then
					arg_61_1.talkMaxDuration = var_64_18

					if var_64_18 + var_64_11 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_18 + var_64_11
					end
				end

				arg_61_1.text_.text = var_64_15
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061015", "story_v_out_101061.awb") ~= 0 then
					local var_64_19 = manager.audio:GetVoiceLength("story_v_out_101061", "101061015", "story_v_out_101061.awb") / 1000

					if var_64_19 + var_64_11 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_19 + var_64_11
					end

					if var_64_14.prefab_name ~= "" and arg_61_1.actors_[var_64_14.prefab_name] ~= nil then
						local var_64_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_14.prefab_name].transform, "story_v_out_101061", "101061015", "story_v_out_101061.awb")

						arg_61_1:RecordAudio("101061015", var_64_20)
						arg_61_1:RecordAudio("101061015", var_64_20)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_101061", "101061015", "story_v_out_101061.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_101061", "101061015", "story_v_out_101061.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_21 = math.max(var_64_12, arg_61_1.talkMaxDuration)

			if var_64_11 <= arg_61_1.time_ and arg_61_1.time_ < var_64_11 + var_64_21 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_11) / var_64_21

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_11 + var_64_21 and arg_61_1.time_ < var_64_11 + var_64_21 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play101061016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 101061016
		arg_65_1.duration_ = 4.533

		local var_65_0 = {
			ja = 4.533,
			ko = 2.833,
			zh = 3,
			en = 3.9
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
				arg_65_0:Play101061017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["2020_tpose"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect2020_tpose == nil then
				arg_65_1.var_.characterEffect2020_tpose = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.1

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect2020_tpose then
					arg_65_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect2020_tpose then
				arg_65_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_68_4 = arg_65_1.actors_["3008ui_story"]
			local var_68_5 = 0

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 and arg_65_1.var_.characterEffect3008ui_story == nil then
				arg_65_1.var_.characterEffect3008ui_story = var_68_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_6 = 0.1

			if var_68_5 <= arg_65_1.time_ and arg_65_1.time_ < var_68_5 + var_68_6 then
				local var_68_7 = (arg_65_1.time_ - var_68_5) / var_68_6

				if arg_65_1.var_.characterEffect3008ui_story then
					local var_68_8 = Mathf.Lerp(0, 0.5, var_68_7)

					arg_65_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_65_1.var_.characterEffect3008ui_story.fillRatio = var_68_8
				end
			end

			if arg_65_1.time_ >= var_68_5 + var_68_6 and arg_65_1.time_ < var_68_5 + var_68_6 + arg_68_0 and arg_65_1.var_.characterEffect3008ui_story then
				local var_68_9 = 0.5

				arg_65_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_65_1.var_.characterEffect3008ui_story.fillRatio = var_68_9
			end

			local var_68_10 = 0
			local var_68_11 = 0.325

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_12 = arg_65_1:FormatText(StoryNameCfg[34].name)

				arg_65_1.leftNameTxt_.text = var_68_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_13 = arg_65_1:GetWordFromCfg(101061016)
				local var_68_14 = arg_65_1:FormatText(var_68_13.content)

				arg_65_1.text_.text = var_68_14

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_15 = 13
				local var_68_16 = utf8.len(var_68_14)
				local var_68_17 = var_68_15 <= 0 and var_68_11 or var_68_11 * (var_68_16 / var_68_15)

				if var_68_17 > 0 and var_68_11 < var_68_17 then
					arg_65_1.talkMaxDuration = var_68_17

					if var_68_17 + var_68_10 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_17 + var_68_10
					end
				end

				arg_65_1.text_.text = var_68_14
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061016", "story_v_out_101061.awb") ~= 0 then
					local var_68_18 = manager.audio:GetVoiceLength("story_v_out_101061", "101061016", "story_v_out_101061.awb") / 1000

					if var_68_18 + var_68_10 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_18 + var_68_10
					end

					if var_68_13.prefab_name ~= "" and arg_65_1.actors_[var_68_13.prefab_name] ~= nil then
						local var_68_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_13.prefab_name].transform, "story_v_out_101061", "101061016", "story_v_out_101061.awb")

						arg_65_1:RecordAudio("101061016", var_68_19)
						arg_65_1:RecordAudio("101061016", var_68_19)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_101061", "101061016", "story_v_out_101061.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_101061", "101061016", "story_v_out_101061.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_20 = math.max(var_68_11, arg_65_1.talkMaxDuration)

			if var_68_10 <= arg_65_1.time_ and arg_65_1.time_ < var_68_10 + var_68_20 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_10) / var_68_20

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_10 + var_68_20 and arg_65_1.time_ < var_68_10 + var_68_20 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play101061017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 101061017
		arg_69_1.duration_ = 5.533

		local var_69_0 = {
			ja = 4.866,
			ko = 5.433,
			zh = 3.933,
			en = 5.533
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
				arg_69_0:Play101061018(arg_69_1)
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

			local var_72_4 = arg_69_1.actors_["2020_tpose"]
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and arg_69_1.var_.characterEffect2020_tpose == nil then
				arg_69_1.var_.characterEffect2020_tpose = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.1

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect2020_tpose then
					local var_72_8 = Mathf.Lerp(0, 0.5, var_72_7)

					arg_69_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_69_1.var_.characterEffect2020_tpose.fillRatio = var_72_8
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and arg_69_1.var_.characterEffect2020_tpose then
				local var_72_9 = 0.5

				arg_69_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_69_1.var_.characterEffect2020_tpose.fillRatio = var_72_9
			end

			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				arg_69_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_72_11 = 0

			if var_72_11 < arg_69_1.time_ and arg_69_1.time_ <= var_72_11 + arg_72_0 then
				arg_69_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action6_2")
			end

			local var_72_12 = 0
			local var_72_13 = 0.55

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

				local var_72_15 = arg_69_1:GetWordFromCfg(101061017)
				local var_72_16 = arg_69_1:FormatText(var_72_15.content)

				arg_69_1.text_.text = var_72_16

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_17 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061017", "story_v_out_101061.awb") ~= 0 then
					local var_72_20 = manager.audio:GetVoiceLength("story_v_out_101061", "101061017", "story_v_out_101061.awb") / 1000

					if var_72_20 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_12
					end

					if var_72_15.prefab_name ~= "" and arg_69_1.actors_[var_72_15.prefab_name] ~= nil then
						local var_72_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_15.prefab_name].transform, "story_v_out_101061", "101061017", "story_v_out_101061.awb")

						arg_69_1:RecordAudio("101061017", var_72_21)
						arg_69_1:RecordAudio("101061017", var_72_21)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_101061", "101061017", "story_v_out_101061.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_101061", "101061017", "story_v_out_101061.awb")
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
	Play101061018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 101061018
		arg_73_1.duration_ = 2.833

		local var_73_0 = {
			ja = 2.566,
			ko = 2.166,
			zh = 2.833,
			en = 2.033
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
				arg_73_0:Play101061019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["2020_tpose"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect2020_tpose == nil then
				arg_73_1.var_.characterEffect2020_tpose = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect2020_tpose then
					arg_73_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect2020_tpose then
				arg_73_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["3008ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and arg_73_1.var_.characterEffect3008ui_story == nil then
				arg_73_1.var_.characterEffect3008ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.1

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect3008ui_story then
					local var_76_8 = Mathf.Lerp(0, 0.5, var_76_7)

					arg_73_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_73_1.var_.characterEffect3008ui_story.fillRatio = var_76_8
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and arg_73_1.var_.characterEffect3008ui_story then
				local var_76_9 = 0.5

				arg_73_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_73_1.var_.characterEffect3008ui_story.fillRatio = var_76_9
			end

			local var_76_10 = 0
			local var_76_11 = 0.225

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_12 = arg_73_1:FormatText(StoryNameCfg[34].name)

				arg_73_1.leftNameTxt_.text = var_76_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_13 = arg_73_1:GetWordFromCfg(101061018)
				local var_76_14 = arg_73_1:FormatText(var_76_13.content)

				arg_73_1.text_.text = var_76_14

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_15 = 9
				local var_76_16 = utf8.len(var_76_14)
				local var_76_17 = var_76_15 <= 0 and var_76_11 or var_76_11 * (var_76_16 / var_76_15)

				if var_76_17 > 0 and var_76_11 < var_76_17 then
					arg_73_1.talkMaxDuration = var_76_17

					if var_76_17 + var_76_10 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_17 + var_76_10
					end
				end

				arg_73_1.text_.text = var_76_14
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061018", "story_v_out_101061.awb") ~= 0 then
					local var_76_18 = manager.audio:GetVoiceLength("story_v_out_101061", "101061018", "story_v_out_101061.awb") / 1000

					if var_76_18 + var_76_10 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_18 + var_76_10
					end

					if var_76_13.prefab_name ~= "" and arg_73_1.actors_[var_76_13.prefab_name] ~= nil then
						local var_76_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_13.prefab_name].transform, "story_v_out_101061", "101061018", "story_v_out_101061.awb")

						arg_73_1:RecordAudio("101061018", var_76_19)
						arg_73_1:RecordAudio("101061018", var_76_19)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_101061", "101061018", "story_v_out_101061.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_101061", "101061018", "story_v_out_101061.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_20 = math.max(var_76_11, arg_73_1.talkMaxDuration)

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_20 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_10) / var_76_20

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_10 + var_76_20 and arg_73_1.time_ < var_76_10 + var_76_20 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play101061019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 101061019
		arg_77_1.duration_ = 6.2

		local var_77_0 = {
			ja = 6.2,
			ko = 4.466,
			zh = 2.4,
			en = 3.2
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
				arg_77_0:Play101061020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["3008ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect3008ui_story == nil then
				arg_77_1.var_.characterEffect3008ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.1

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect3008ui_story then
					arg_77_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect3008ui_story then
				arg_77_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_80_4 = arg_77_1.actors_["2020_tpose"]
			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 and arg_77_1.var_.characterEffect2020_tpose == nil then
				arg_77_1.var_.characterEffect2020_tpose = var_80_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_6 = 0.1

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_6 then
				local var_80_7 = (arg_77_1.time_ - var_80_5) / var_80_6

				if arg_77_1.var_.characterEffect2020_tpose then
					local var_80_8 = Mathf.Lerp(0, 0.5, var_80_7)

					arg_77_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_77_1.var_.characterEffect2020_tpose.fillRatio = var_80_8
				end
			end

			if arg_77_1.time_ >= var_80_5 + var_80_6 and arg_77_1.time_ < var_80_5 + var_80_6 + arg_80_0 and arg_77_1.var_.characterEffect2020_tpose then
				local var_80_9 = 0.5

				arg_77_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_77_1.var_.characterEffect2020_tpose.fillRatio = var_80_9
			end

			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_80_11 = 0
			local var_80_12 = 0.325

			if var_80_11 < arg_77_1.time_ and arg_77_1.time_ <= var_80_11 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_13 = arg_77_1:FormatText(StoryNameCfg[20].name)

				arg_77_1.leftNameTxt_.text = var_80_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_14 = arg_77_1:GetWordFromCfg(101061019)
				local var_80_15 = arg_77_1:FormatText(var_80_14.content)

				arg_77_1.text_.text = var_80_15

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_16 = 13
				local var_80_17 = utf8.len(var_80_15)
				local var_80_18 = var_80_16 <= 0 and var_80_12 or var_80_12 * (var_80_17 / var_80_16)

				if var_80_18 > 0 and var_80_12 < var_80_18 then
					arg_77_1.talkMaxDuration = var_80_18

					if var_80_18 + var_80_11 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_18 + var_80_11
					end
				end

				arg_77_1.text_.text = var_80_15
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061019", "story_v_out_101061.awb") ~= 0 then
					local var_80_19 = manager.audio:GetVoiceLength("story_v_out_101061", "101061019", "story_v_out_101061.awb") / 1000

					if var_80_19 + var_80_11 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_19 + var_80_11
					end

					if var_80_14.prefab_name ~= "" and arg_77_1.actors_[var_80_14.prefab_name] ~= nil then
						local var_80_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_14.prefab_name].transform, "story_v_out_101061", "101061019", "story_v_out_101061.awb")

						arg_77_1:RecordAudio("101061019", var_80_20)
						arg_77_1:RecordAudio("101061019", var_80_20)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_101061", "101061019", "story_v_out_101061.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_101061", "101061019", "story_v_out_101061.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_21 = math.max(var_80_12, arg_77_1.talkMaxDuration)

			if var_80_11 <= arg_77_1.time_ and arg_77_1.time_ < var_80_11 + var_80_21 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_11) / var_80_21

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_11 + var_80_21 and arg_77_1.time_ < var_80_11 + var_80_21 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play101061020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 101061020
		arg_81_1.duration_ = 4.966

		local var_81_0 = {
			ja = 4.966,
			ko = 1.733,
			zh = 2.5,
			en = 4.1
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
				arg_81_0:Play101061021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["2020_tpose"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect2020_tpose == nil then
				arg_81_1.var_.characterEffect2020_tpose = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.1

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect2020_tpose then
					arg_81_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect2020_tpose then
				arg_81_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["3008ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect3008ui_story == nil then
				arg_81_1.var_.characterEffect3008ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.1

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect3008ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_81_1.var_.characterEffect3008ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect3008ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_81_1.var_.characterEffect3008ui_story.fillRatio = var_84_9
			end

			local var_84_10 = 0
			local var_84_11 = 0.25

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_12 = arg_81_1:FormatText(StoryNameCfg[34].name)

				arg_81_1.leftNameTxt_.text = var_84_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_13 = arg_81_1:GetWordFromCfg(101061020)
				local var_84_14 = arg_81_1:FormatText(var_84_13.content)

				arg_81_1.text_.text = var_84_14

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_15 = 10
				local var_84_16 = utf8.len(var_84_14)
				local var_84_17 = var_84_15 <= 0 and var_84_11 or var_84_11 * (var_84_16 / var_84_15)

				if var_84_17 > 0 and var_84_11 < var_84_17 then
					arg_81_1.talkMaxDuration = var_84_17

					if var_84_17 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_17 + var_84_10
					end
				end

				arg_81_1.text_.text = var_84_14
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061020", "story_v_out_101061.awb") ~= 0 then
					local var_84_18 = manager.audio:GetVoiceLength("story_v_out_101061", "101061020", "story_v_out_101061.awb") / 1000

					if var_84_18 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_10
					end

					if var_84_13.prefab_name ~= "" and arg_81_1.actors_[var_84_13.prefab_name] ~= nil then
						local var_84_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_13.prefab_name].transform, "story_v_out_101061", "101061020", "story_v_out_101061.awb")

						arg_81_1:RecordAudio("101061020", var_84_19)
						arg_81_1:RecordAudio("101061020", var_84_19)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_101061", "101061020", "story_v_out_101061.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_101061", "101061020", "story_v_out_101061.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_20 = math.max(var_84_11, arg_81_1.talkMaxDuration)

			if var_84_10 <= arg_81_1.time_ and arg_81_1.time_ < var_84_10 + var_84_20 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_10) / var_84_20

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_10 + var_84_20 and arg_81_1.time_ < var_84_10 + var_84_20 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play101061021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 101061021
		arg_85_1.duration_ = 6.266

		local var_85_0 = {
			ja = 4.5,
			ko = 4.6,
			zh = 3.2,
			en = 6.266
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
				arg_85_0:Play101061022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["3008ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect3008ui_story == nil then
				arg_85_1.var_.characterEffect3008ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.1

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect3008ui_story then
					arg_85_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect3008ui_story then
				arg_85_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_88_4 = arg_85_1.actors_["2020_tpose"]
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 and arg_85_1.var_.characterEffect2020_tpose == nil then
				arg_85_1.var_.characterEffect2020_tpose = var_88_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_6 = 0.1

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6

				if arg_85_1.var_.characterEffect2020_tpose then
					local var_88_8 = Mathf.Lerp(0, 0.5, var_88_7)

					arg_85_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_85_1.var_.characterEffect2020_tpose.fillRatio = var_88_8
				end
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 and arg_85_1.var_.characterEffect2020_tpose then
				local var_88_9 = 0.5

				arg_85_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_85_1.var_.characterEffect2020_tpose.fillRatio = var_88_9
			end

			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 then
				arg_85_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_88_11 = 0

			if var_88_11 < arg_85_1.time_ and arg_85_1.time_ <= var_88_11 + arg_88_0 then
				arg_85_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action2_1")
			end

			local var_88_12 = 0
			local var_88_13 = 0.375

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_14 = arg_85_1:FormatText(StoryNameCfg[20].name)

				arg_85_1.leftNameTxt_.text = var_88_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_15 = arg_85_1:GetWordFromCfg(101061021)
				local var_88_16 = arg_85_1:FormatText(var_88_15.content)

				arg_85_1.text_.text = var_88_16

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_17 = 15
				local var_88_18 = utf8.len(var_88_16)
				local var_88_19 = var_88_17 <= 0 and var_88_13 or var_88_13 * (var_88_18 / var_88_17)

				if var_88_19 > 0 and var_88_13 < var_88_19 then
					arg_85_1.talkMaxDuration = var_88_19

					if var_88_19 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_19 + var_88_12
					end
				end

				arg_85_1.text_.text = var_88_16
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061021", "story_v_out_101061.awb") ~= 0 then
					local var_88_20 = manager.audio:GetVoiceLength("story_v_out_101061", "101061021", "story_v_out_101061.awb") / 1000

					if var_88_20 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_20 + var_88_12
					end

					if var_88_15.prefab_name ~= "" and arg_85_1.actors_[var_88_15.prefab_name] ~= nil then
						local var_88_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_15.prefab_name].transform, "story_v_out_101061", "101061021", "story_v_out_101061.awb")

						arg_85_1:RecordAudio("101061021", var_88_21)
						arg_85_1:RecordAudio("101061021", var_88_21)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_101061", "101061021", "story_v_out_101061.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_101061", "101061021", "story_v_out_101061.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_22 = math.max(var_88_13, arg_85_1.talkMaxDuration)

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_22 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_12) / var_88_22

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_12 + var_88_22 and arg_85_1.time_ < var_88_12 + var_88_22 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play101061022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 101061022
		arg_89_1.duration_ = 7.233

		local var_89_0 = {
			ja = 7.233,
			ko = 5.766,
			zh = 5.7,
			en = 5.366
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
				arg_89_0:Play101061023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["2020_tpose"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect2020_tpose == nil then
				arg_89_1.var_.characterEffect2020_tpose = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.1

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect2020_tpose then
					arg_89_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect2020_tpose then
				arg_89_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_92_4 = arg_89_1.actors_["3008ui_story"]
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 and arg_89_1.var_.characterEffect3008ui_story == nil then
				arg_89_1.var_.characterEffect3008ui_story = var_92_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_6 = 0.1

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6

				if arg_89_1.var_.characterEffect3008ui_story then
					local var_92_8 = Mathf.Lerp(0, 0.5, var_92_7)

					arg_89_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_89_1.var_.characterEffect3008ui_story.fillRatio = var_92_8
				end
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 and arg_89_1.var_.characterEffect3008ui_story then
				local var_92_9 = 0.5

				arg_89_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_89_1.var_.characterEffect3008ui_story.fillRatio = var_92_9
			end

			local var_92_10 = 0
			local var_92_11 = 0.575

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_12 = arg_89_1:FormatText(StoryNameCfg[34].name)

				arg_89_1.leftNameTxt_.text = var_92_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_13 = arg_89_1:GetWordFromCfg(101061022)
				local var_92_14 = arg_89_1:FormatText(var_92_13.content)

				arg_89_1.text_.text = var_92_14

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_15 = 23
				local var_92_16 = utf8.len(var_92_14)
				local var_92_17 = var_92_15 <= 0 and var_92_11 or var_92_11 * (var_92_16 / var_92_15)

				if var_92_17 > 0 and var_92_11 < var_92_17 then
					arg_89_1.talkMaxDuration = var_92_17

					if var_92_17 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_17 + var_92_10
					end
				end

				arg_89_1.text_.text = var_92_14
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061022", "story_v_out_101061.awb") ~= 0 then
					local var_92_18 = manager.audio:GetVoiceLength("story_v_out_101061", "101061022", "story_v_out_101061.awb") / 1000

					if var_92_18 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_18 + var_92_10
					end

					if var_92_13.prefab_name ~= "" and arg_89_1.actors_[var_92_13.prefab_name] ~= nil then
						local var_92_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_13.prefab_name].transform, "story_v_out_101061", "101061022", "story_v_out_101061.awb")

						arg_89_1:RecordAudio("101061022", var_92_19)
						arg_89_1:RecordAudio("101061022", var_92_19)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_101061", "101061022", "story_v_out_101061.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_101061", "101061022", "story_v_out_101061.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_20 = math.max(var_92_11, arg_89_1.talkMaxDuration)

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_20 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_10) / var_92_20

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_10 + var_92_20 and arg_89_1.time_ < var_92_10 + var_92_20 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play101061023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 101061023
		arg_93_1.duration_ = 1.999999999999

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play101061024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["3008ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect3008ui_story == nil then
				arg_93_1.var_.characterEffect3008ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.1

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect3008ui_story then
					arg_93_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect3008ui_story then
				arg_93_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_96_4 = arg_93_1.actors_["2020_tpose"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect2020_tpose == nil then
				arg_93_1.var_.characterEffect2020_tpose = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect2020_tpose then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_93_1.var_.characterEffect2020_tpose.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect2020_tpose then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_93_1.var_.characterEffect2020_tpose.fillRatio = var_96_9
			end

			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 then
				arg_93_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_96_11 = 0
			local var_96_12 = 0.1

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_13 = arg_93_1:FormatText(StoryNameCfg[20].name)

				arg_93_1.leftNameTxt_.text = var_96_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_14 = arg_93_1:GetWordFromCfg(101061023)
				local var_96_15 = arg_93_1:FormatText(var_96_14.content)

				arg_93_1.text_.text = var_96_15

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_16 = 4
				local var_96_17 = utf8.len(var_96_15)
				local var_96_18 = var_96_16 <= 0 and var_96_12 or var_96_12 * (var_96_17 / var_96_16)

				if var_96_18 > 0 and var_96_12 < var_96_18 then
					arg_93_1.talkMaxDuration = var_96_18

					if var_96_18 + var_96_11 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_18 + var_96_11
					end
				end

				arg_93_1.text_.text = var_96_15
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061023", "story_v_out_101061.awb") ~= 0 then
					local var_96_19 = manager.audio:GetVoiceLength("story_v_out_101061", "101061023", "story_v_out_101061.awb") / 1000

					if var_96_19 + var_96_11 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_19 + var_96_11
					end

					if var_96_14.prefab_name ~= "" and arg_93_1.actors_[var_96_14.prefab_name] ~= nil then
						local var_96_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_14.prefab_name].transform, "story_v_out_101061", "101061023", "story_v_out_101061.awb")

						arg_93_1:RecordAudio("101061023", var_96_20)
						arg_93_1:RecordAudio("101061023", var_96_20)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_101061", "101061023", "story_v_out_101061.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_101061", "101061023", "story_v_out_101061.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_21 = math.max(var_96_12, arg_93_1.talkMaxDuration)

			if var_96_11 <= arg_93_1.time_ and arg_93_1.time_ < var_96_11 + var_96_21 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_11) / var_96_21

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_11 + var_96_21 and arg_93_1.time_ < var_96_11 + var_96_21 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play101061024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 101061024
		arg_97_1.duration_ = 12.9

		local var_97_0 = {
			ja = 12.9,
			ko = 8.133,
			zh = 10.833,
			en = 10.266
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
				arg_97_0:Play101061025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.mask_.enabled = true
				arg_97_1.mask_.raycastTarget = true

				arg_97_1:SetGaussion(false)
			end

			local var_100_1 = 2

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_1 then
				local var_100_2 = (arg_97_1.time_ - var_100_0) / var_100_1
				local var_100_3 = Color.New(0, 0, 0)

				var_100_3.a = Mathf.Lerp(0, 1, var_100_2)
				arg_97_1.mask_.color = var_100_3
			end

			if arg_97_1.time_ >= var_100_0 + var_100_1 and arg_97_1.time_ < var_100_0 + var_100_1 + arg_100_0 then
				local var_100_4 = Color.New(0, 0, 0)

				var_100_4.a = 1
				arg_97_1.mask_.color = var_100_4
			end

			local var_100_5 = 2

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.mask_.enabled = true
				arg_97_1.mask_.raycastTarget = true

				arg_97_1:SetGaussion(false)
			end

			local var_100_6 = 2

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6
				local var_100_8 = Color.New(0, 0, 0)

				var_100_8.a = Mathf.Lerp(1, 0, var_100_7)
				arg_97_1.mask_.color = var_100_8
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 then
				local var_100_9 = Color.New(0, 0, 0)
				local var_100_10 = 0

				arg_97_1.mask_.enabled = false
				var_100_9.a = var_100_10
				arg_97_1.mask_.color = var_100_9
			end

			local var_100_11 = "S0105"

			if arg_97_1.bgs_[var_100_11] == nil then
				local var_100_12 = Object.Instantiate(arg_97_1.paintGo_)

				var_100_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_100_11)
				var_100_12.name = var_100_11
				var_100_12.transform.parent = arg_97_1.stage_.transform
				var_100_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.bgs_[var_100_11] = var_100_12
			end

			local var_100_13 = 2

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				local var_100_14 = manager.ui.mainCamera.transform.localPosition
				local var_100_15 = Vector3.New(0, 0, 10) + Vector3.New(var_100_14.x, var_100_14.y, 0)
				local var_100_16 = arg_97_1.bgs_.S0105

				var_100_16.transform.localPosition = var_100_15
				var_100_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_100_17 = var_100_16:GetComponent("SpriteRenderer")

				if var_100_17 and var_100_17.sprite then
					local var_100_18 = (var_100_16.transform.localPosition - var_100_14).z
					local var_100_19 = manager.ui.mainCameraCom_
					local var_100_20 = 2 * var_100_18 * Mathf.Tan(var_100_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_100_21 = var_100_20 * var_100_19.aspect
					local var_100_22 = var_100_17.sprite.bounds.size.x
					local var_100_23 = var_100_17.sprite.bounds.size.y
					local var_100_24 = var_100_21 / var_100_22
					local var_100_25 = var_100_20 / var_100_23
					local var_100_26 = var_100_25 < var_100_24 and var_100_24 or var_100_25

					var_100_16.transform.localScale = Vector3.New(var_100_26, var_100_26, 0)
				end

				for iter_100_0, iter_100_1 in pairs(arg_97_1.bgs_) do
					if iter_100_0 ~= "S0105" then
						iter_100_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_100_27 = arg_97_1.actors_["2020_tpose"].transform
			local var_100_28 = 1.967

			if var_100_28 < arg_97_1.time_ and arg_97_1.time_ <= var_100_28 + arg_100_0 then
				arg_97_1.var_.moveOldPos2020_tpose = var_100_27.localPosition
			end

			local var_100_29 = 0.001

			if var_100_28 <= arg_97_1.time_ and arg_97_1.time_ < var_100_28 + var_100_29 then
				local var_100_30 = (arg_97_1.time_ - var_100_28) / var_100_29
				local var_100_31 = Vector3.New(0, 100, 0)

				var_100_27.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos2020_tpose, var_100_31, var_100_30)

				local var_100_32 = manager.ui.mainCamera.transform.position - var_100_27.position

				var_100_27.forward = Vector3.New(var_100_32.x, var_100_32.y, var_100_32.z)

				local var_100_33 = var_100_27.localEulerAngles

				var_100_33.z = 0
				var_100_33.x = 0
				var_100_27.localEulerAngles = var_100_33
			end

			if arg_97_1.time_ >= var_100_28 + var_100_29 and arg_97_1.time_ < var_100_28 + var_100_29 + arg_100_0 then
				var_100_27.localPosition = Vector3.New(0, 100, 0)

				local var_100_34 = manager.ui.mainCamera.transform.position - var_100_27.position

				var_100_27.forward = Vector3.New(var_100_34.x, var_100_34.y, var_100_34.z)

				local var_100_35 = var_100_27.localEulerAngles

				var_100_35.z = 0
				var_100_35.x = 0
				var_100_27.localEulerAngles = var_100_35
			end

			local var_100_36 = arg_97_1.actors_["3008ui_story"].transform
			local var_100_37 = 1.967

			if var_100_37 < arg_97_1.time_ and arg_97_1.time_ <= var_100_37 + arg_100_0 then
				arg_97_1.var_.moveOldPos3008ui_story = var_100_36.localPosition
			end

			local var_100_38 = 0.001

			if var_100_37 <= arg_97_1.time_ and arg_97_1.time_ < var_100_37 + var_100_38 then
				local var_100_39 = (arg_97_1.time_ - var_100_37) / var_100_38
				local var_100_40 = Vector3.New(0, 100, 0)

				var_100_36.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos3008ui_story, var_100_40, var_100_39)

				local var_100_41 = manager.ui.mainCamera.transform.position - var_100_36.position

				var_100_36.forward = Vector3.New(var_100_41.x, var_100_41.y, var_100_41.z)

				local var_100_42 = var_100_36.localEulerAngles

				var_100_42.z = 0
				var_100_42.x = 0
				var_100_36.localEulerAngles = var_100_42
			end

			if arg_97_1.time_ >= var_100_37 + var_100_38 and arg_97_1.time_ < var_100_37 + var_100_38 + arg_100_0 then
				var_100_36.localPosition = Vector3.New(0, 100, 0)

				local var_100_43 = manager.ui.mainCamera.transform.position - var_100_36.position

				var_100_36.forward = Vector3.New(var_100_43.x, var_100_43.y, var_100_43.z)

				local var_100_44 = var_100_36.localEulerAngles

				var_100_44.z = 0
				var_100_44.x = 0
				var_100_36.localEulerAngles = var_100_44
			end

			if arg_97_1.frameCnt_ <= 1 then
				arg_97_1.dialog_:SetActive(false)
			end

			local var_100_45 = 4
			local var_100_46 = 0.5

			if var_100_45 < arg_97_1.time_ and arg_97_1.time_ <= var_100_45 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0

				arg_97_1.dialog_:SetActive(true)

				local var_100_47 = LeanTween.value(arg_97_1.dialog_, 0, 1, 0.3)

				var_100_47:setOnUpdate(LuaHelper.FloatAction(function(arg_101_0)
					arg_97_1.dialogCg_.alpha = arg_101_0
				end))
				var_100_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_97_1.dialog_)
					var_100_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_97_1.duration_ = arg_97_1.duration_ + 0.3

				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_48 = arg_97_1:FormatText(StoryNameCfg[35].name)

				arg_97_1.leftNameTxt_.text = var_100_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_49 = arg_97_1:GetWordFromCfg(101061024)
				local var_100_50 = arg_97_1:FormatText(var_100_49.content)

				arg_97_1.text_.text = var_100_50

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_51 = 20
				local var_100_52 = utf8.len(var_100_50)
				local var_100_53 = var_100_51 <= 0 and var_100_46 or var_100_46 * (var_100_52 / var_100_51)

				if var_100_53 > 0 and var_100_46 < var_100_53 then
					arg_97_1.talkMaxDuration = var_100_53
					var_100_45 = var_100_45 + 0.3

					if var_100_53 + var_100_45 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_53 + var_100_45
					end
				end

				arg_97_1.text_.text = var_100_50
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061024", "story_v_out_101061.awb") ~= 0 then
					local var_100_54 = manager.audio:GetVoiceLength("story_v_out_101061", "101061024", "story_v_out_101061.awb") / 1000

					if var_100_54 + var_100_45 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_54 + var_100_45
					end

					if var_100_49.prefab_name ~= "" and arg_97_1.actors_[var_100_49.prefab_name] ~= nil then
						local var_100_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_49.prefab_name].transform, "story_v_out_101061", "101061024", "story_v_out_101061.awb")

						arg_97_1:RecordAudio("101061024", var_100_55)
						arg_97_1:RecordAudio("101061024", var_100_55)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_101061", "101061024", "story_v_out_101061.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_101061", "101061024", "story_v_out_101061.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_56 = var_100_45 + 0.3
			local var_100_57 = math.max(var_100_46, arg_97_1.talkMaxDuration)

			if var_100_56 <= arg_97_1.time_ and arg_97_1.time_ < var_100_56 + var_100_57 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_56) / var_100_57

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_56 + var_100_57 and arg_97_1.time_ < var_100_56 + var_100_57 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play101061025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 101061025
		arg_103_1.duration_ = 7.6

		local var_103_0 = {
			ja = 4.133,
			ko = 7.6,
			zh = 5.466,
			en = 5.4
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
				arg_103_0:Play101061026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.55

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[35].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(101061025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061025", "story_v_out_101061.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061025", "story_v_out_101061.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_101061", "101061025", "story_v_out_101061.awb")

						arg_103_1:RecordAudio("101061025", var_106_9)
						arg_103_1:RecordAudio("101061025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_101061", "101061025", "story_v_out_101061.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_101061", "101061025", "story_v_out_101061.awb")
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
	Play101061026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 101061026
		arg_107_1.duration_ = 10.2

		local var_107_0 = {
			ja = 9.233,
			ko = 7.3,
			zh = 6.533,
			en = 10.2
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
				arg_107_0:Play101061027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.825

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[34].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(101061026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061026", "story_v_out_101061.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061026", "story_v_out_101061.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_101061", "101061026", "story_v_out_101061.awb")

						arg_107_1:RecordAudio("101061026", var_110_9)
						arg_107_1:RecordAudio("101061026", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_101061", "101061026", "story_v_out_101061.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_101061", "101061026", "story_v_out_101061.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play101061027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 101061027
		arg_111_1.duration_ = 8.466

		local var_111_0 = {
			ja = 4.366,
			ko = 6.5,
			zh = 5.9,
			en = 8.466
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
				arg_111_0:Play101061028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.675

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[34].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20302")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(101061027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 27
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061027", "story_v_out_101061.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061027", "story_v_out_101061.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_101061", "101061027", "story_v_out_101061.awb")

						arg_111_1:RecordAudio("101061027", var_114_9)
						arg_111_1:RecordAudio("101061027", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_101061", "101061027", "story_v_out_101061.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_101061", "101061027", "story_v_out_101061.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play101061028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 101061028
		arg_115_1.duration_ = 3.3

		local var_115_0 = {
			ja = 3.3,
			ko = 1.133,
			zh = 1.2,
			en = 1.533
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
				arg_115_0:Play101061029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.125

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[20].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, true)
				arg_115_1.iconController_:SetSelectedState("hero")

				arg_115_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(101061028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 5
				local var_118_6 = utf8.len(var_118_4)
				local var_118_7 = var_118_5 <= 0 and var_118_1 or var_118_1 * (var_118_6 / var_118_5)

				if var_118_7 > 0 and var_118_1 < var_118_7 then
					arg_115_1.talkMaxDuration = var_118_7

					if var_118_7 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_7 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_4
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061028", "story_v_out_101061.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061028", "story_v_out_101061.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_101061", "101061028", "story_v_out_101061.awb")

						arg_115_1:RecordAudio("101061028", var_118_9)
						arg_115_1:RecordAudio("101061028", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_101061", "101061028", "story_v_out_101061.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_101061", "101061028", "story_v_out_101061.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_10 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_10 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_10

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_10 and arg_115_1.time_ < var_118_0 + var_118_10 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play101061029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 101061029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play101061030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.525

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_2 = arg_119_1:GetWordFromCfg(101061029)
				local var_122_3 = arg_119_1:FormatText(var_122_2.content)

				arg_119_1.text_.text = var_122_3

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_4 = 21
				local var_122_5 = utf8.len(var_122_3)
				local var_122_6 = var_122_4 <= 0 and var_122_1 or var_122_1 * (var_122_5 / var_122_4)

				if var_122_6 > 0 and var_122_1 < var_122_6 then
					arg_119_1.talkMaxDuration = var_122_6

					if var_122_6 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_6 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_3
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_7 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_7 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_7

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_7 and arg_119_1.time_ < var_122_0 + var_122_7 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play101061030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 101061030
		arg_123_1.duration_ = 8

		local var_123_0 = {
			ja = 8,
			ko = 5,
			zh = 5.1,
			en = 5.7
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
				arg_123_0:Play101061031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.65

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[20].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(101061030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061030", "story_v_out_101061.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061030", "story_v_out_101061.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_101061", "101061030", "story_v_out_101061.awb")

						arg_123_1:RecordAudio("101061030", var_126_9)
						arg_123_1:RecordAudio("101061030", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_101061", "101061030", "story_v_out_101061.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_101061", "101061030", "story_v_out_101061.awb")
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
	Play101061031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 101061031
		arg_127_1.duration_ = 5.7

		local var_127_0 = {
			ja = 5.7,
			ko = 2.666,
			zh = 2.2,
			en = 3.066
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
				arg_127_0:Play101061032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.25

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[20].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(101061031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061031", "story_v_out_101061.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061031", "story_v_out_101061.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_101061", "101061031", "story_v_out_101061.awb")

						arg_127_1:RecordAudio("101061031", var_130_9)
						arg_127_1:RecordAudio("101061031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_101061", "101061031", "story_v_out_101061.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_101061", "101061031", "story_v_out_101061.awb")
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
	Play101061032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 101061032
		arg_131_1.duration_ = 8.566

		local var_131_0 = {
			ja = 8.566,
			ko = 3.633,
			zh = 4.033,
			en = 2.7
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
				arg_131_0:Play101061033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.4

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[35].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(101061032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 16
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061032", "story_v_out_101061.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061032", "story_v_out_101061.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_101061", "101061032", "story_v_out_101061.awb")

						arg_131_1:RecordAudio("101061032", var_134_9)
						arg_131_1:RecordAudio("101061032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_101061", "101061032", "story_v_out_101061.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_101061", "101061032", "story_v_out_101061.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_10 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_10 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_10

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_10 and arg_131_1.time_ < var_134_0 + var_134_10 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play101061033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 101061033
		arg_135_1.duration_ = 9.6

		local var_135_0 = {
			ja = 7.1,
			ko = 9.6,
			zh = 8,
			en = 8.533
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
				arg_135_0:Play101061034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 1.025

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[35].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(101061033)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 41
				local var_138_6 = utf8.len(var_138_4)
				local var_138_7 = var_138_5 <= 0 and var_138_1 or var_138_1 * (var_138_6 / var_138_5)

				if var_138_7 > 0 and var_138_1 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_4
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061033", "story_v_out_101061.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061033", "story_v_out_101061.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_out_101061", "101061033", "story_v_out_101061.awb")

						arg_135_1:RecordAudio("101061033", var_138_9)
						arg_135_1:RecordAudio("101061033", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_101061", "101061033", "story_v_out_101061.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_101061", "101061033", "story_v_out_101061.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_10 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_10 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_10

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_10 and arg_135_1.time_ < var_138_0 + var_138_10 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play101061034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 101061034
		arg_139_1.duration_ = 8.6

		local var_139_0 = {
			ja = 7.9,
			ko = 7.333,
			zh = 7.7,
			en = 8.6
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
				arg_139_0:Play101061035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.925

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[20].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, true)
				arg_139_1.iconController_:SetSelectedState("hero")

				arg_139_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(101061034)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 36
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061034", "story_v_out_101061.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061034", "story_v_out_101061.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_101061", "101061034", "story_v_out_101061.awb")

						arg_139_1:RecordAudio("101061034", var_142_9)
						arg_139_1:RecordAudio("101061034", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_101061", "101061034", "story_v_out_101061.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_101061", "101061034", "story_v_out_101061.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play101061035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 101061035
		arg_143_1.duration_ = 9.433

		local var_143_0 = {
			ja = 9.433,
			ko = 8.4,
			zh = 6.533,
			en = 8.066
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
				arg_143_0:Play101061036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.85

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[35].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(101061035)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061035", "story_v_out_101061.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061035", "story_v_out_101061.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_101061", "101061035", "story_v_out_101061.awb")

						arg_143_1:RecordAudio("101061035", var_146_9)
						arg_143_1:RecordAudio("101061035", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_101061", "101061035", "story_v_out_101061.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_101061", "101061035", "story_v_out_101061.awb")
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
	Play101061036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 101061036
		arg_147_1.duration_ = 4.1

		local var_147_0 = {
			ja = 1.333,
			ko = 3,
			zh = 2.7,
			en = 4.1
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
				arg_147_0:Play101061037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.3

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[20].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, true)
				arg_147_1.iconController_:SetSelectedState("hero")

				arg_147_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(101061036)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 12
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061036", "story_v_out_101061.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061036", "story_v_out_101061.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_101061", "101061036", "story_v_out_101061.awb")

						arg_147_1:RecordAudio("101061036", var_150_9)
						arg_147_1:RecordAudio("101061036", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_101061", "101061036", "story_v_out_101061.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_101061", "101061036", "story_v_out_101061.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play101061037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 101061037
		arg_151_1.duration_ = 8.966

		local var_151_0 = {
			ja = 8.966,
			ko = 3.866,
			zh = 5.9,
			en = 3.2
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
				arg_151_0:Play101061038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.525

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[35].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(101061037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 21
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061037", "story_v_out_101061.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061037", "story_v_out_101061.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_101061", "101061037", "story_v_out_101061.awb")

						arg_151_1:RecordAudio("101061037", var_154_9)
						arg_151_1:RecordAudio("101061037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_101061", "101061037", "story_v_out_101061.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_101061", "101061037", "story_v_out_101061.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play101061038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 101061038
		arg_155_1.duration_ = 3.066

		local var_155_0 = {
			ja = 3.066,
			ko = 2.233,
			zh = 2.366,
			en = 2.166
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
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play101061039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.3

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[34].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, true)
				arg_155_1.iconController_:SetSelectedState("hero")

				arg_155_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(101061038)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 12
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061038", "story_v_out_101061.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061038", "story_v_out_101061.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_101061", "101061038", "story_v_out_101061.awb")

						arg_155_1:RecordAudio("101061038", var_158_9)
						arg_155_1:RecordAudio("101061038", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_101061", "101061038", "story_v_out_101061.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_101061", "101061038", "story_v_out_101061.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play101061039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 101061039
		arg_159_1.duration_ = 11.333

		local var_159_0 = {
			ja = 11.333,
			ko = 9,
			zh = 9.533,
			en = 7.966
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
				arg_159_0:Play101061040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[35].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(101061039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 40
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061039", "story_v_out_101061.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061039", "story_v_out_101061.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_101061", "101061039", "story_v_out_101061.awb")

						arg_159_1:RecordAudio("101061039", var_162_9)
						arg_159_1:RecordAudio("101061039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_101061", "101061039", "story_v_out_101061.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_101061", "101061039", "story_v_out_101061.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play101061040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 101061040
		arg_163_1.duration_ = 2.933

		local var_163_0 = {
			ja = 2.933,
			ko = 1.833,
			zh = 2.166,
			en = 2.366
		}
		local var_163_1 = manager.audio:GetLocalizationFlag()

		if var_163_0[var_163_1] ~= nil then
			arg_163_1.duration_ = var_163_0[var_163_1]
		end

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play101061041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.2

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[20].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, true)
				arg_163_1.iconController_:SetSelectedState("hero")

				arg_163_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(101061040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 8
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061040", "story_v_out_101061.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061040", "story_v_out_101061.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_101061", "101061040", "story_v_out_101061.awb")

						arg_163_1:RecordAudio("101061040", var_166_9)
						arg_163_1:RecordAudio("101061040", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_101061", "101061040", "story_v_out_101061.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_101061", "101061040", "story_v_out_101061.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play101061041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 101061041
		arg_167_1.duration_ = 8.333

		local var_167_0 = {
			ja = 8.333,
			ko = 7.6,
			zh = 6.133,
			en = 7.066
		}
		local var_167_1 = manager.audio:GetLocalizationFlag()

		if var_167_0[var_167_1] ~= nil then
			arg_167_1.duration_ = var_167_0[var_167_1]
		end

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play101061042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.675

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[35].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(101061041)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 27
				local var_170_6 = utf8.len(var_170_4)
				local var_170_7 = var_170_5 <= 0 and var_170_1 or var_170_1 * (var_170_6 / var_170_5)

				if var_170_7 > 0 and var_170_1 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_4
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061041", "story_v_out_101061.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061041", "story_v_out_101061.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_101061", "101061041", "story_v_out_101061.awb")

						arg_167_1:RecordAudio("101061041", var_170_9)
						arg_167_1:RecordAudio("101061041", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_101061", "101061041", "story_v_out_101061.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_101061", "101061041", "story_v_out_101061.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_10 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_10 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_10

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_10 and arg_167_1.time_ < var_170_0 + var_170_10 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play101061042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 101061042
		arg_171_1.duration_ = 7.2

		local var_171_0 = {
			ja = 7.2,
			ko = 4.9,
			zh = 4.866,
			en = 3.366
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
				arg_171_0:Play101061043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.725

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[20].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, true)
				arg_171_1.iconController_:SetSelectedState("hero")

				arg_171_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(101061042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 29
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061042", "story_v_out_101061.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061042", "story_v_out_101061.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_101061", "101061042", "story_v_out_101061.awb")

						arg_171_1:RecordAudio("101061042", var_174_9)
						arg_171_1:RecordAudio("101061042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_101061", "101061042", "story_v_out_101061.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_101061", "101061042", "story_v_out_101061.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_10 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_10 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_10

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_10 and arg_171_1.time_ < var_174_0 + var_174_10 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play101061043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 101061043
		arg_175_1.duration_ = 6.6

		local var_175_0 = {
			ja = 6.6,
			ko = 3.6,
			zh = 3,
			en = 4.166
		}
		local var_175_1 = manager.audio:GetLocalizationFlag()

		if var_175_0[var_175_1] ~= nil then
			arg_175_1.duration_ = var_175_0[var_175_1]
		end

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play101061044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.45

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[20].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, true)
				arg_175_1.iconController_:SetSelectedState("hero")

				arg_175_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(101061043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 18
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061043", "story_v_out_101061.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061043", "story_v_out_101061.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_101061", "101061043", "story_v_out_101061.awb")

						arg_175_1:RecordAudio("101061043", var_178_9)
						arg_175_1:RecordAudio("101061043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_101061", "101061043", "story_v_out_101061.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_101061", "101061043", "story_v_out_101061.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play101061044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 101061044
		arg_179_1.duration_ = 4.133

		local var_179_0 = {
			ja = 3.033,
			ko = 4.133,
			zh = 3.033,
			en = 3.5
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play101061045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.3

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[35].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(101061044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 12
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061044", "story_v_out_101061.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061044", "story_v_out_101061.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_101061", "101061044", "story_v_out_101061.awb")

						arg_179_1:RecordAudio("101061044", var_182_9)
						arg_179_1:RecordAudio("101061044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_101061", "101061044", "story_v_out_101061.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_101061", "101061044", "story_v_out_101061.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play101061045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 101061045
		arg_183_1.duration_ = 5.233

		local var_183_0 = {
			ja = 5.233,
			ko = 4.366,
			zh = 3.3,
			en = 4.233
		}
		local var_183_1 = manager.audio:GetLocalizationFlag()

		if var_183_0[var_183_1] ~= nil then
			arg_183_1.duration_ = var_183_0[var_183_1]
		end

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
			arg_183_1.auto_ = false
		end

		function arg_183_1.playNext_(arg_185_0)
			arg_183_1.onStoryFinished_()
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.4

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[20].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, true)
				arg_183_1.iconController_:SetSelectedState("hero")

				arg_183_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(101061045)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 16
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101061", "101061045", "story_v_out_101061.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_101061", "101061045", "story_v_out_101061.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_101061", "101061045", "story_v_out_101061.awb")

						arg_183_1:RecordAudio("101061045", var_186_9)
						arg_183_1:RecordAudio("101061045", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_101061", "101061045", "story_v_out_101061.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_101061", "101061045", "story_v_out_101061.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B08b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B08c",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0105"
	},
	voices = {
		"story_v_out_101061.awb"
	}
}
