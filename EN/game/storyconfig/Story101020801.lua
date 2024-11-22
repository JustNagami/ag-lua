return {
	Play102081001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 102081001
		arg_1_1.duration_ = 8.266

		local var_1_0 = {
			ja = 8.266,
			ko = 5.733,
			zh = 6.333,
			en = 5.533
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
				arg_1_0:Play102081002(arg_1_1)
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

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story", "se_story_robot_short", "")
			end

			local var_4_8 = 0
			local var_4_9 = 1

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				local var_4_10 = "play"
				local var_4_11 = "effect"

				arg_1_1:AudioAction(var_4_10, var_4_11, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_4_12 = "2022_tpose"

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

			local var_4_16 = arg_1_1.actors_["2022_tpose"]
			local var_4_17 = 2

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 and arg_1_1.var_.characterEffect2022_tpose == nil then
				arg_1_1.var_.characterEffect2022_tpose = var_4_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_18 = 0.1

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_18 then
				local var_4_19 = (arg_1_1.time_ - var_4_17) / var_4_18

				if arg_1_1.var_.characterEffect2022_tpose then
					arg_1_1.var_.characterEffect2022_tpose.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_18 and arg_1_1.time_ < var_4_17 + var_4_18 + arg_4_0 and arg_1_1.var_.characterEffect2022_tpose then
				arg_1_1.var_.characterEffect2022_tpose.fillFlat = false
			end

			local var_4_20 = "B02c"

			if arg_1_1.bgs_[var_4_20] == nil then
				local var_4_21 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_21:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_20)
				var_4_21.name = var_4_20
				var_4_21.transform.parent = arg_1_1.stage_.transform
				var_4_21.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_20] = var_4_21
			end

			local var_4_22 = arg_1_1.bgs_.B02c
			local var_4_23 = 0

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				local var_4_24 = var_4_22:GetComponent("SpriteRenderer")

				if var_4_24 then
					var_4_24.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_25 = var_4_24.material
					local var_4_26 = var_4_25:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB02c = var_4_26.a
					arg_1_1.var_.alphaMatValueB02c = var_4_25
				end

				arg_1_1.var_.alphaOldValueB02c = 0
			end

			local var_4_27 = 1.5

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_27 then
				local var_4_28 = (arg_1_1.time_ - var_4_23) / var_4_27
				local var_4_29 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB02c, 1, var_4_28)

				if arg_1_1.var_.alphaMatValueB02c then
					local var_4_30 = arg_1_1.var_.alphaMatValueB02c
					local var_4_31 = var_4_30:GetColor("_Color")

					var_4_31.a = var_4_29

					var_4_30:SetColor("_Color", var_4_31)
				end
			end

			if arg_1_1.time_ >= var_4_23 + var_4_27 and arg_1_1.time_ < var_4_23 + var_4_27 + arg_4_0 and arg_1_1.var_.alphaMatValueB02c then
				local var_4_32 = arg_1_1.var_.alphaMatValueB02c
				local var_4_33 = var_4_32:GetColor("_Color")

				var_4_33.a = 1

				var_4_32:SetColor("_Color", var_4_33)
			end

			local var_4_34 = 0

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_35 = manager.ui.mainCamera.transform.localPosition
				local var_4_36 = Vector3.New(0, 0, 10) + Vector3.New(var_4_35.x, var_4_35.y, 0)
				local var_4_37 = arg_1_1.bgs_.B02c

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
					if iter_4_0 ~= "B02c" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_48 = arg_1_1.actors_["2022_tpose"].transform
			local var_4_49 = 1.79999995231628

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.var_.moveOldPos2022_tpose = var_4_48.localPosition
			end

			local var_4_50 = 0.001

			if var_4_49 <= arg_1_1.time_ and arg_1_1.time_ < var_4_49 + var_4_50 then
				local var_4_51 = (arg_1_1.time_ - var_4_49) / var_4_50
				local var_4_52 = Vector3.New(0, -0.55, -0.3)

				var_4_48.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos2022_tpose, var_4_52, var_4_51)

				local var_4_53 = manager.ui.mainCamera.transform.position - var_4_48.position

				var_4_48.forward = Vector3.New(var_4_53.x, var_4_53.y, var_4_53.z)

				local var_4_54 = var_4_48.localEulerAngles

				var_4_54.z = 0
				var_4_54.x = 0
				var_4_48.localEulerAngles = var_4_54
			end

			if arg_1_1.time_ >= var_4_49 + var_4_50 and arg_1_1.time_ < var_4_49 + var_4_50 + arg_4_0 then
				var_4_48.localPosition = Vector3.New(0, -0.55, -0.3)

				local var_4_55 = manager.ui.mainCamera.transform.position - var_4_48.position

				var_4_48.forward = Vector3.New(var_4_55.x, var_4_55.y, var_4_55.z)

				local var_4_56 = var_4_48.localEulerAngles

				var_4_56.z = 0
				var_4_56.x = 0
				var_4_48.localEulerAngles = var_4_56
			end

			local var_4_57 = 0

			if var_4_57 < arg_1_1.time_ and arg_1_1.time_ <= var_4_57 + arg_4_0 then
				arg_1_1:PlayTimeline("2022_tpose", "StoryTimeline/CharAction/story2022/story2022action/2022action1_1")
			end

			local var_4_58 = 0

			if var_4_58 < arg_1_1.time_ and arg_1_1.time_ <= var_4_58 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_59 = 2

			if arg_1_1.time_ >= var_4_58 + var_4_59 and arg_1_1.time_ < var_4_58 + var_4_59 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_60 = 2
			local var_4_61 = 0.375

			if var_4_60 < arg_1_1.time_ and arg_1_1.time_ <= var_4_60 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_62 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_62:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_63 = arg_1_1:FormatText(StoryNameCfg[29].name)

				arg_1_1.leftNameTxt_.text = var_4_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_64 = arg_1_1:GetWordFromCfg(102081001)
				local var_4_65 = arg_1_1:FormatText(var_4_64.content)

				arg_1_1.text_.text = var_4_65

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_66 = 15
				local var_4_67 = utf8.len(var_4_65)
				local var_4_68 = var_4_66 <= 0 and var_4_61 or var_4_61 * (var_4_67 / var_4_66)

				if var_4_68 > 0 and var_4_61 < var_4_68 then
					arg_1_1.talkMaxDuration = var_4_68
					var_4_60 = var_4_60 + 0.3

					if var_4_68 + var_4_60 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_68 + var_4_60
					end
				end

				arg_1_1.text_.text = var_4_65
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081001", "story_v_out_102081.awb") ~= 0 then
					local var_4_69 = manager.audio:GetVoiceLength("story_v_out_102081", "102081001", "story_v_out_102081.awb") / 1000

					if var_4_69 + var_4_60 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_69 + var_4_60
					end

					if var_4_64.prefab_name ~= "" and arg_1_1.actors_[var_4_64.prefab_name] ~= nil then
						local var_4_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_64.prefab_name].transform, "story_v_out_102081", "102081001", "story_v_out_102081.awb")

						arg_1_1:RecordAudio("102081001", var_4_70)
						arg_1_1:RecordAudio("102081001", var_4_70)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_102081", "102081001", "story_v_out_102081.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_102081", "102081001", "story_v_out_102081.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_71 = var_4_60 + 0.3
			local var_4_72 = math.max(var_4_61, arg_1_1.talkMaxDuration)

			if var_4_71 <= arg_1_1.time_ and arg_1_1.time_ < var_4_71 + var_4_72 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_71) / var_4_72

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_71 + var_4_72 and arg_1_1.time_ < var_4_71 + var_4_72 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play102081002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 102081002
		arg_7_1.duration_ = 5.033

		local var_7_0 = {
			ja = 5.033,
			ko = 3.7,
			zh = 3.5,
			en = 3.666
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
				arg_7_0:Play102081003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "effect"

				arg_7_1:AudioAction(var_10_2, var_10_3, "se_story", "se_story_robot_short", "")
			end

			local var_10_4 = "2018_tpose"

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

			local var_10_8 = arg_7_1.actors_["2018_tpose"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect2018_tpose == nil then
				arg_7_1.var_.characterEffect2018_tpose = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect2018_tpose then
					arg_7_1.var_.characterEffect2018_tpose.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect2018_tpose then
				arg_7_1.var_.characterEffect2018_tpose.fillFlat = false
			end

			local var_10_12 = arg_7_1.actors_["2022_tpose"]
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 and arg_7_1.var_.characterEffect2022_tpose == nil then
				arg_7_1.var_.characterEffect2022_tpose = var_10_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_14 = 0.1

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14

				if arg_7_1.var_.characterEffect2022_tpose then
					local var_10_16 = Mathf.Lerp(0, 0.5, var_10_15)

					arg_7_1.var_.characterEffect2022_tpose.fillFlat = true
					arg_7_1.var_.characterEffect2022_tpose.fillRatio = var_10_16
				end
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect2022_tpose then
				local var_10_17 = 0.5

				arg_7_1.var_.characterEffect2022_tpose.fillFlat = true
				arg_7_1.var_.characterEffect2022_tpose.fillRatio = var_10_17
			end

			local var_10_18 = arg_7_1.actors_["2022_tpose"].transform
			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.var_.moveOldPos2022_tpose = var_10_18.localPosition
			end

			local var_10_20 = 0.001

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_20 then
				local var_10_21 = (arg_7_1.time_ - var_10_19) / var_10_20
				local var_10_22 = Vector3.New(0, 100, 0)

				var_10_18.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2022_tpose, var_10_22, var_10_21)

				local var_10_23 = manager.ui.mainCamera.transform.position - var_10_18.position

				var_10_18.forward = Vector3.New(var_10_23.x, var_10_23.y, var_10_23.z)

				local var_10_24 = var_10_18.localEulerAngles

				var_10_24.z = 0
				var_10_24.x = 0
				var_10_18.localEulerAngles = var_10_24
			end

			if arg_7_1.time_ >= var_10_19 + var_10_20 and arg_7_1.time_ < var_10_19 + var_10_20 + arg_10_0 then
				var_10_18.localPosition = Vector3.New(0, 100, 0)

				local var_10_25 = manager.ui.mainCamera.transform.position - var_10_18.position

				var_10_18.forward = Vector3.New(var_10_25.x, var_10_25.y, var_10_25.z)

				local var_10_26 = var_10_18.localEulerAngles

				var_10_26.z = 0
				var_10_26.x = 0
				var_10_18.localEulerAngles = var_10_26
			end

			local var_10_27 = arg_7_1.actors_["2018_tpose"].transform
			local var_10_28 = 0

			if var_10_28 < arg_7_1.time_ and arg_7_1.time_ <= var_10_28 + arg_10_0 then
				arg_7_1.var_.moveOldPos2018_tpose = var_10_27.localPosition
			end

			local var_10_29 = 0.001

			if var_10_28 <= arg_7_1.time_ and arg_7_1.time_ < var_10_28 + var_10_29 then
				local var_10_30 = (arg_7_1.time_ - var_10_28) / var_10_29
				local var_10_31 = Vector3.New(0, -0.5, -0.7)

				var_10_27.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2018_tpose, var_10_31, var_10_30)

				local var_10_32 = manager.ui.mainCamera.transform.position - var_10_27.position

				var_10_27.forward = Vector3.New(var_10_32.x, var_10_32.y, var_10_32.z)

				local var_10_33 = var_10_27.localEulerAngles

				var_10_33.z = 0
				var_10_33.x = 0
				var_10_27.localEulerAngles = var_10_33
			end

			if arg_7_1.time_ >= var_10_28 + var_10_29 and arg_7_1.time_ < var_10_28 + var_10_29 + arg_10_0 then
				var_10_27.localPosition = Vector3.New(0, -0.5, -0.7)

				local var_10_34 = manager.ui.mainCamera.transform.position - var_10_27.position

				var_10_27.forward = Vector3.New(var_10_34.x, var_10_34.y, var_10_34.z)

				local var_10_35 = var_10_27.localEulerAngles

				var_10_35.z = 0
				var_10_35.x = 0
				var_10_27.localEulerAngles = var_10_35
			end

			local var_10_36 = 0

			if var_10_36 < arg_7_1.time_ and arg_7_1.time_ <= var_10_36 + arg_10_0 then
				arg_7_1:PlayTimeline("2018_tpose", "StoryTimeline/CharAction/story2018/story2018action/2018action1_1")
			end

			local var_10_37 = 0
			local var_10_38 = 0.3

			if var_10_37 < arg_7_1.time_ and arg_7_1.time_ <= var_10_37 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_39 = arg_7_1:FormatText(StoryNameCfg[29].name)

				arg_7_1.leftNameTxt_.text = var_10_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_40 = arg_7_1:GetWordFromCfg(102081002)
				local var_10_41 = arg_7_1:FormatText(var_10_40.content)

				arg_7_1.text_.text = var_10_41

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_42 = 12
				local var_10_43 = utf8.len(var_10_41)
				local var_10_44 = var_10_42 <= 0 and var_10_38 or var_10_38 * (var_10_43 / var_10_42)

				if var_10_44 > 0 and var_10_38 < var_10_44 then
					arg_7_1.talkMaxDuration = var_10_44

					if var_10_44 + var_10_37 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_44 + var_10_37
					end
				end

				arg_7_1.text_.text = var_10_41
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081002", "story_v_out_102081.awb") ~= 0 then
					local var_10_45 = manager.audio:GetVoiceLength("story_v_out_102081", "102081002", "story_v_out_102081.awb") / 1000

					if var_10_45 + var_10_37 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_45 + var_10_37
					end

					if var_10_40.prefab_name ~= "" and arg_7_1.actors_[var_10_40.prefab_name] ~= nil then
						local var_10_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_40.prefab_name].transform, "story_v_out_102081", "102081002", "story_v_out_102081.awb")

						arg_7_1:RecordAudio("102081002", var_10_46)
						arg_7_1:RecordAudio("102081002", var_10_46)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_102081", "102081002", "story_v_out_102081.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_102081", "102081002", "story_v_out_102081.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_47 = math.max(var_10_38, arg_7_1.talkMaxDuration)

			if var_10_37 <= arg_7_1.time_ and arg_7_1.time_ < var_10_37 + var_10_47 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_37) / var_10_47

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_37 + var_10_47 and arg_7_1.time_ < var_10_37 + var_10_47 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play102081003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 102081003
		arg_11_1.duration_ = 1.999999999999

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play102081004(arg_11_1)
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

			local var_14_8 = arg_11_1.actors_["2018_tpose"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect2018_tpose == nil then
				arg_11_1.var_.characterEffect2018_tpose = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect2018_tpose then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect2018_tpose.fillFlat = true
					arg_11_1.var_.characterEffect2018_tpose.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect2018_tpose then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect2018_tpose.fillFlat = true
				arg_11_1.var_.characterEffect2018_tpose.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["2018_tpose"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos2018_tpose = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0, 100, 0)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2018_tpose, var_14_18, var_14_17)

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
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_14_33 = 0

			if var_14_33 < arg_11_1.time_ and arg_11_1.time_ <= var_14_33 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_14_34 = 0
			local var_14_35 = 0.1

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

				local var_14_37 = arg_11_1:GetWordFromCfg(102081003)
				local var_14_38 = arg_11_1:FormatText(var_14_37.content)

				arg_11_1.text_.text = var_14_38

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_39 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081003", "story_v_out_102081.awb") ~= 0 then
					local var_14_42 = manager.audio:GetVoiceLength("story_v_out_102081", "102081003", "story_v_out_102081.awb") / 1000

					if var_14_42 + var_14_34 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_42 + var_14_34
					end

					if var_14_37.prefab_name ~= "" and arg_11_1.actors_[var_14_37.prefab_name] ~= nil then
						local var_14_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_37.prefab_name].transform, "story_v_out_102081", "102081003", "story_v_out_102081.awb")

						arg_11_1:RecordAudio("102081003", var_14_43)
						arg_11_1:RecordAudio("102081003", var_14_43)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_102081", "102081003", "story_v_out_102081.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_102081", "102081003", "story_v_out_102081.awb")
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
	Play102081004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 102081004
		arg_15_1.duration_ = 2.7

		local var_15_0 = {
			ja = 2.2,
			ko = 2.3,
			zh = 2.7,
			en = 2.566
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
				arg_15_0:Play102081005(arg_15_1)
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

			local var_18_14 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0.7, -0.97, -6)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_18, var_18_17)

				local var_18_19 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_19.x, var_18_19.y, var_18_19.z)

				local var_18_20 = var_18_14.localEulerAngles

				var_18_20.z = 0
				var_18_20.x = 0
				var_18_14.localEulerAngles = var_18_20
			end

			if arg_15_1.time_ >= var_18_15 + var_18_16 and arg_15_1.time_ < var_18_15 + var_18_16 + arg_18_0 then
				var_18_14.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_18_21 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_21.x, var_18_21.y, var_18_21.z)

				local var_18_22 = var_18_14.localEulerAngles

				var_18_22.z = 0
				var_18_22.x = 0
				var_18_14.localEulerAngles = var_18_22
			end

			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_18_25 = 0
			local var_18_26 = 0.25

			if var_18_25 < arg_15_1.time_ and arg_15_1.time_ <= var_18_25 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_27 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_28 = arg_15_1:GetWordFromCfg(102081004)
				local var_18_29 = arg_15_1:FormatText(var_18_28.content)

				arg_15_1.text_.text = var_18_29

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_30 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081004", "story_v_out_102081.awb") ~= 0 then
					local var_18_33 = manager.audio:GetVoiceLength("story_v_out_102081", "102081004", "story_v_out_102081.awb") / 1000

					if var_18_33 + var_18_25 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_33 + var_18_25
					end

					if var_18_28.prefab_name ~= "" and arg_15_1.actors_[var_18_28.prefab_name] ~= nil then
						local var_18_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_28.prefab_name].transform, "story_v_out_102081", "102081004", "story_v_out_102081.awb")

						arg_15_1:RecordAudio("102081004", var_18_34)
						arg_15_1:RecordAudio("102081004", var_18_34)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_102081", "102081004", "story_v_out_102081.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_102081", "102081004", "story_v_out_102081.awb")
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
	Play102081005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 102081005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play102081006(arg_19_1)
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
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_5
			end

			local var_22_6 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_6.localPosition
			end

			local var_22_8 = 0.001

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8
				local var_22_10 = Vector3.New(0, 100, 0)

				var_22_6.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_10, var_22_9)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_6.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_6.localEulerAngles = var_22_12
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 then
				var_22_6.localPosition = Vector3.New(0, 100, 0)

				local var_22_13 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_13.x, var_22_13.y, var_22_13.z)

				local var_22_14 = var_22_6.localEulerAngles

				var_22_14.z = 0
				var_22_14.x = 0
				var_22_6.localEulerAngles = var_22_14
			end

			local var_22_15 = arg_19_1.actors_["1011ui_story"].transform
			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.var_.moveOldPos1011ui_story = var_22_15.localPosition
			end

			local var_22_17 = 0.001

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17
				local var_22_19 = Vector3.New(0, 100, 0)

				var_22_15.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1011ui_story, var_22_19, var_22_18)

				local var_22_20 = manager.ui.mainCamera.transform.position - var_22_15.position

				var_22_15.forward = Vector3.New(var_22_20.x, var_22_20.y, var_22_20.z)

				local var_22_21 = var_22_15.localEulerAngles

				var_22_21.z = 0
				var_22_21.x = 0
				var_22_15.localEulerAngles = var_22_21
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				var_22_15.localPosition = Vector3.New(0, 100, 0)

				local var_22_22 = manager.ui.mainCamera.transform.position - var_22_15.position

				var_22_15.forward = Vector3.New(var_22_22.x, var_22_22.y, var_22_22.z)

				local var_22_23 = var_22_15.localEulerAngles

				var_22_23.z = 0
				var_22_23.x = 0
				var_22_15.localEulerAngles = var_22_23
			end

			local var_22_24 = "1019ui_story"

			if arg_19_1.actors_[var_22_24] == nil then
				local var_22_25 = Object.Instantiate(Asset.Load("Char/" .. var_22_24), arg_19_1.stage_.transform)

				var_22_25.name = var_22_24
				var_22_25.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_24] = var_22_25

				local var_22_26 = var_22_25:GetComponentInChildren(typeof(CharacterEffect))

				var_22_26.enabled = true

				local var_22_27 = GameObjectTools.GetOrAddComponent(var_22_25, typeof(DynamicBoneHelper))

				if var_22_27 then
					var_22_27:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_26.transform, false)

				arg_19_1.var_[var_22_24 .. "Animator"] = var_22_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_24 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_24 .. "LipSync"] = var_22_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_22_29 = 0
			local var_22_30 = 1

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_31 = arg_19_1:GetWordFromCfg(102081005)
				local var_22_32 = arg_19_1:FormatText(var_22_31.content)

				arg_19_1.text_.text = var_22_32

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_33 = 40
				local var_22_34 = utf8.len(var_22_32)
				local var_22_35 = var_22_33 <= 0 and var_22_30 or var_22_30 * (var_22_34 / var_22_33)

				if var_22_35 > 0 and var_22_30 < var_22_35 then
					arg_19_1.talkMaxDuration = var_22_35

					if var_22_35 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_35 + var_22_29
					end
				end

				arg_19_1.text_.text = var_22_32
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_36 = math.max(var_22_30, arg_19_1.talkMaxDuration)

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_36 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_29) / var_22_36

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_29 + var_22_36 and arg_19_1.time_ < var_22_29 + var_22_36 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play102081006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 102081006
		arg_23_1.duration_ = 5.2

		local var_23_0 = {
			ja = 5.2,
			ko = 4.1,
			zh = 3.866,
			en = 4.3
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
				arg_23_0:Play102081007(arg_23_1)
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
					arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_26_4 = arg_23_1.actors_["1019ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos1019ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(-0.7, -1.08, -5.9)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1019ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_26_14 = 0
			local var_26_15 = 0.525

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_16 = arg_23_1:FormatText(StoryNameCfg[13].name)

				arg_23_1.leftNameTxt_.text = var_26_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_17 = arg_23_1:GetWordFromCfg(102081006)
				local var_26_18 = arg_23_1:FormatText(var_26_17.content)

				arg_23_1.text_.text = var_26_18

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_19 = 21
				local var_26_20 = utf8.len(var_26_18)
				local var_26_21 = var_26_19 <= 0 and var_26_15 or var_26_15 * (var_26_20 / var_26_19)

				if var_26_21 > 0 and var_26_15 < var_26_21 then
					arg_23_1.talkMaxDuration = var_26_21

					if var_26_21 + var_26_14 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_14
					end
				end

				arg_23_1.text_.text = var_26_18
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081006", "story_v_out_102081.awb") ~= 0 then
					local var_26_22 = manager.audio:GetVoiceLength("story_v_out_102081", "102081006", "story_v_out_102081.awb") / 1000

					if var_26_22 + var_26_14 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_22 + var_26_14
					end

					if var_26_17.prefab_name ~= "" and arg_23_1.actors_[var_26_17.prefab_name] ~= nil then
						local var_26_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_17.prefab_name].transform, "story_v_out_102081", "102081006", "story_v_out_102081.awb")

						arg_23_1:RecordAudio("102081006", var_26_23)
						arg_23_1:RecordAudio("102081006", var_26_23)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_102081", "102081006", "story_v_out_102081.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_102081", "102081006", "story_v_out_102081.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_24 = math.max(var_26_15, arg_23_1.talkMaxDuration)

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_24 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_14) / var_26_24

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_14 + var_26_24 and arg_23_1.time_ < var_26_14 + var_26_24 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play102081007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 102081007
		arg_27_1.duration_ = 3.7

		local var_27_0 = {
			ja = 3.7,
			ko = 1.999999999999,
			zh = 2.333,
			en = 3.3
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
				arg_27_0:Play102081008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1084ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story == nil then
				arg_27_1.var_.characterEffect1084ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1084ui_story then
					arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story then
				arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["1019ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1019ui_story then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_9
			end

			local var_30_10 = arg_27_1.actors_["1084ui_story"].transform
			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.var_.moveOldPos1084ui_story = var_30_10.localPosition
			end

			local var_30_12 = 0.001

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_12 then
				local var_30_13 = (arg_27_1.time_ - var_30_11) / var_30_12
				local var_30_14 = Vector3.New(0.7, -0.97, -6)

				var_30_10.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1084ui_story, var_30_14, var_30_13)

				local var_30_15 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_15.x, var_30_15.y, var_30_15.z)

				local var_30_16 = var_30_10.localEulerAngles

				var_30_16.z = 0
				var_30_16.x = 0
				var_30_10.localEulerAngles = var_30_16
			end

			if arg_27_1.time_ >= var_30_11 + var_30_12 and arg_27_1.time_ < var_30_11 + var_30_12 + arg_30_0 then
				var_30_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_30_17 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_17.x, var_30_17.y, var_30_17.z)

				local var_30_18 = var_30_10.localEulerAngles

				var_30_18.z = 0
				var_30_18.x = 0
				var_30_10.localEulerAngles = var_30_18
			end

			local var_30_19 = 0

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_30_20 = 0

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_21 = 0
			local var_30_22 = 0.175

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_23 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_24 = arg_27_1:GetWordFromCfg(102081007)
				local var_30_25 = arg_27_1:FormatText(var_30_24.content)

				arg_27_1.text_.text = var_30_25

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_26 = 7
				local var_30_27 = utf8.len(var_30_25)
				local var_30_28 = var_30_26 <= 0 and var_30_22 or var_30_22 * (var_30_27 / var_30_26)

				if var_30_28 > 0 and var_30_22 < var_30_28 then
					arg_27_1.talkMaxDuration = var_30_28

					if var_30_28 + var_30_21 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_28 + var_30_21
					end
				end

				arg_27_1.text_.text = var_30_25
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081007", "story_v_out_102081.awb") ~= 0 then
					local var_30_29 = manager.audio:GetVoiceLength("story_v_out_102081", "102081007", "story_v_out_102081.awb") / 1000

					if var_30_29 + var_30_21 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_29 + var_30_21
					end

					if var_30_24.prefab_name ~= "" and arg_27_1.actors_[var_30_24.prefab_name] ~= nil then
						local var_30_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_24.prefab_name].transform, "story_v_out_102081", "102081007", "story_v_out_102081.awb")

						arg_27_1:RecordAudio("102081007", var_30_30)
						arg_27_1:RecordAudio("102081007", var_30_30)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_102081", "102081007", "story_v_out_102081.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_102081", "102081007", "story_v_out_102081.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_31 = math.max(var_30_22, arg_27_1.talkMaxDuration)

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_31 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_21) / var_30_31

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_21 + var_30_31 and arg_27_1.time_ < var_30_21 + var_30_31 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play102081008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 102081008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play102081009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1084ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1084ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1084ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1084ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.975

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(102081008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 39
				local var_34_11 = utf8.len(var_34_9)
				local var_34_12 = var_34_10 <= 0 and var_34_7 or var_34_7 * (var_34_11 / var_34_10)

				if var_34_12 > 0 and var_34_7 < var_34_12 then
					arg_31_1.talkMaxDuration = var_34_12

					if var_34_12 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_9
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_13 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_13 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_13

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_13 and arg_31_1.time_ < var_34_6 + var_34_13 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play102081009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 102081009
		arg_35_1.duration_ = 1.999999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play102081010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				local var_38_2 = "play"
				local var_38_3 = "music"

				arg_35_1:AudioAction(var_38_2, var_38_3, "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin")
			end

			local var_38_4 = "10002_tpose"

			if arg_35_1.actors_[var_38_4] == nil then
				local var_38_5 = Object.Instantiate(Asset.Load("Char/" .. var_38_4), arg_35_1.stage_.transform)

				var_38_5.name = var_38_4
				var_38_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_4] = var_38_5

				local var_38_6 = var_38_5:GetComponentInChildren(typeof(CharacterEffect))

				var_38_6.enabled = true

				local var_38_7 = GameObjectTools.GetOrAddComponent(var_38_5, typeof(DynamicBoneHelper))

				if var_38_7 then
					var_38_7:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_6.transform, false)

				arg_35_1.var_[var_38_4 .. "Animator"] = var_38_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_4 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_4 .. "LipSync"] = var_38_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_8 = arg_35_1.actors_["10002_tpose"]
			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 and arg_35_1.var_.characterEffect10002_tpose == nil then
				arg_35_1.var_.characterEffect10002_tpose = var_38_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_10 = 0.1

			if var_38_9 <= arg_35_1.time_ and arg_35_1.time_ < var_38_9 + var_38_10 then
				local var_38_11 = (arg_35_1.time_ - var_38_9) / var_38_10

				if arg_35_1.var_.characterEffect10002_tpose then
					arg_35_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_9 + var_38_10 and arg_35_1.time_ < var_38_9 + var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect10002_tpose then
				arg_35_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_38_12 = arg_35_1.actors_["1084ui_story"].transform
			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1.var_.moveOldPos1084ui_story = var_38_12.localPosition
			end

			local var_38_14 = 0.001

			if var_38_13 <= arg_35_1.time_ and arg_35_1.time_ < var_38_13 + var_38_14 then
				local var_38_15 = (arg_35_1.time_ - var_38_13) / var_38_14
				local var_38_16 = Vector3.New(0, 100, 0)

				var_38_12.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1084ui_story, var_38_16, var_38_15)

				local var_38_17 = manager.ui.mainCamera.transform.position - var_38_12.position

				var_38_12.forward = Vector3.New(var_38_17.x, var_38_17.y, var_38_17.z)

				local var_38_18 = var_38_12.localEulerAngles

				var_38_18.z = 0
				var_38_18.x = 0
				var_38_12.localEulerAngles = var_38_18
			end

			if arg_35_1.time_ >= var_38_13 + var_38_14 and arg_35_1.time_ < var_38_13 + var_38_14 + arg_38_0 then
				var_38_12.localPosition = Vector3.New(0, 100, 0)

				local var_38_19 = manager.ui.mainCamera.transform.position - var_38_12.position

				var_38_12.forward = Vector3.New(var_38_19.x, var_38_19.y, var_38_19.z)

				local var_38_20 = var_38_12.localEulerAngles

				var_38_20.z = 0
				var_38_20.x = 0
				var_38_12.localEulerAngles = var_38_20
			end

			local var_38_21 = arg_35_1.actors_["1019ui_story"].transform
			local var_38_22 = 0

			if var_38_22 < arg_35_1.time_ and arg_35_1.time_ <= var_38_22 + arg_38_0 then
				arg_35_1.var_.moveOldPos1019ui_story = var_38_21.localPosition
			end

			local var_38_23 = 0.001

			if var_38_22 <= arg_35_1.time_ and arg_35_1.time_ < var_38_22 + var_38_23 then
				local var_38_24 = (arg_35_1.time_ - var_38_22) / var_38_23
				local var_38_25 = Vector3.New(0, 100, 0)

				var_38_21.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1019ui_story, var_38_25, var_38_24)

				local var_38_26 = manager.ui.mainCamera.transform.position - var_38_21.position

				var_38_21.forward = Vector3.New(var_38_26.x, var_38_26.y, var_38_26.z)

				local var_38_27 = var_38_21.localEulerAngles

				var_38_27.z = 0
				var_38_27.x = 0
				var_38_21.localEulerAngles = var_38_27
			end

			if arg_35_1.time_ >= var_38_22 + var_38_23 and arg_35_1.time_ < var_38_22 + var_38_23 + arg_38_0 then
				var_38_21.localPosition = Vector3.New(0, 100, 0)

				local var_38_28 = manager.ui.mainCamera.transform.position - var_38_21.position

				var_38_21.forward = Vector3.New(var_38_28.x, var_38_28.y, var_38_28.z)

				local var_38_29 = var_38_21.localEulerAngles

				var_38_29.z = 0
				var_38_29.x = 0
				var_38_21.localEulerAngles = var_38_29
			end

			local var_38_30 = arg_35_1.actors_["10002_tpose"].transform
			local var_38_31 = 0

			if var_38_31 < arg_35_1.time_ and arg_35_1.time_ <= var_38_31 + arg_38_0 then
				arg_35_1.var_.moveOldPos10002_tpose = var_38_30.localPosition
			end

			local var_38_32 = 0.001

			if var_38_31 <= arg_35_1.time_ and arg_35_1.time_ < var_38_31 + var_38_32 then
				local var_38_33 = (arg_35_1.time_ - var_38_31) / var_38_32
				local var_38_34 = Vector3.New(0, -1.2, -5.8)

				var_38_30.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10002_tpose, var_38_34, var_38_33)

				local var_38_35 = manager.ui.mainCamera.transform.position - var_38_30.position

				var_38_30.forward = Vector3.New(var_38_35.x, var_38_35.y, var_38_35.z)

				local var_38_36 = var_38_30.localEulerAngles

				var_38_36.z = 0
				var_38_36.x = 0
				var_38_30.localEulerAngles = var_38_36
			end

			if arg_35_1.time_ >= var_38_31 + var_38_32 and arg_35_1.time_ < var_38_31 + var_38_32 + arg_38_0 then
				var_38_30.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_38_37 = manager.ui.mainCamera.transform.position - var_38_30.position

				var_38_30.forward = Vector3.New(var_38_37.x, var_38_37.y, var_38_37.z)

				local var_38_38 = var_38_30.localEulerAngles

				var_38_38.z = 0
				var_38_38.x = 0
				var_38_30.localEulerAngles = var_38_38
			end

			local var_38_39 = 0

			if var_38_39 < arg_35_1.time_ and arg_35_1.time_ <= var_38_39 + arg_38_0 then
				arg_35_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_38_40 = 0

			if var_38_40 < arg_35_1.time_ and arg_35_1.time_ <= var_38_40 + arg_38_0 then
				arg_35_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_38_41 = 0
			local var_38_42 = 0.05

			if var_38_41 < arg_35_1.time_ and arg_35_1.time_ <= var_38_41 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_43 = arg_35_1:FormatText(StoryNameCfg[39].name)

				arg_35_1.leftNameTxt_.text = var_38_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_44 = arg_35_1:GetWordFromCfg(102081009)
				local var_38_45 = arg_35_1:FormatText(var_38_44.content)

				arg_35_1.text_.text = var_38_45

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_46 = 2
				local var_38_47 = utf8.len(var_38_45)
				local var_38_48 = var_38_46 <= 0 and var_38_42 or var_38_42 * (var_38_47 / var_38_46)

				if var_38_48 > 0 and var_38_42 < var_38_48 then
					arg_35_1.talkMaxDuration = var_38_48

					if var_38_48 + var_38_41 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_48 + var_38_41
					end
				end

				arg_35_1.text_.text = var_38_45
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081009", "story_v_out_102081.awb") ~= 0 then
					local var_38_49 = manager.audio:GetVoiceLength("story_v_out_102081", "102081009", "story_v_out_102081.awb") / 1000

					if var_38_49 + var_38_41 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_49 + var_38_41
					end

					if var_38_44.prefab_name ~= "" and arg_35_1.actors_[var_38_44.prefab_name] ~= nil then
						local var_38_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_44.prefab_name].transform, "story_v_out_102081", "102081009", "story_v_out_102081.awb")

						arg_35_1:RecordAudio("102081009", var_38_50)
						arg_35_1:RecordAudio("102081009", var_38_50)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_102081", "102081009", "story_v_out_102081.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_102081", "102081009", "story_v_out_102081.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_51 = math.max(var_38_42, arg_35_1.talkMaxDuration)

			if var_38_41 <= arg_35_1.time_ and arg_35_1.time_ < var_38_41 + var_38_51 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_41) / var_38_51

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_41 + var_38_51 and arg_35_1.time_ < var_38_41 + var_38_51 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play102081010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 102081010
		arg_39_1.duration_ = 3.633

		local var_39_0 = {
			ja = 3.633,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_39_0:Play102081011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1084ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1084ui_story then
					arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
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

			local var_42_19 = arg_39_1.actors_["1084ui_story"].transform
			local var_42_20 = 0

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1.var_.moveOldPos1084ui_story = var_42_19.localPosition

				local var_42_21 = "1084ui_story"

				arg_39_1:ShowWeapon(arg_39_1.var_[var_42_21 .. "Animator"].transform, true)
			end

			local var_42_22 = 0.001

			if var_42_20 <= arg_39_1.time_ and arg_39_1.time_ < var_42_20 + var_42_22 then
				local var_42_23 = (arg_39_1.time_ - var_42_20) / var_42_22
				local var_42_24 = Vector3.New(0, -0.97, -6)

				var_42_19.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1084ui_story, var_42_24, var_42_23)

				local var_42_25 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_25.x, var_42_25.y, var_42_25.z)

				local var_42_26 = var_42_19.localEulerAngles

				var_42_26.z = 0
				var_42_26.x = 0
				var_42_19.localEulerAngles = var_42_26
			end

			if arg_39_1.time_ >= var_42_20 + var_42_22 and arg_39_1.time_ < var_42_20 + var_42_22 + arg_42_0 then
				var_42_19.localPosition = Vector3.New(0, -0.97, -6)

				local var_42_27 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_27.x, var_42_27.y, var_42_27.z)

				local var_42_28 = var_42_19.localEulerAngles

				var_42_28.z = 0
				var_42_28.x = 0
				var_42_19.localEulerAngles = var_42_28
			end

			local var_42_29 = 0

			if var_42_29 < arg_39_1.time_ and arg_39_1.time_ <= var_42_29 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_42_30 = 0

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_42_31 = 0
			local var_42_32 = 0.175

			if var_42_31 < arg_39_1.time_ and arg_39_1.time_ <= var_42_31 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_33 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_34 = arg_39_1:GetWordFromCfg(102081010)
				local var_42_35 = arg_39_1:FormatText(var_42_34.content)

				arg_39_1.text_.text = var_42_35

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_36 = 7
				local var_42_37 = utf8.len(var_42_35)
				local var_42_38 = var_42_36 <= 0 and var_42_32 or var_42_32 * (var_42_37 / var_42_36)

				if var_42_38 > 0 and var_42_32 < var_42_38 then
					arg_39_1.talkMaxDuration = var_42_38

					if var_42_38 + var_42_31 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_31
					end
				end

				arg_39_1.text_.text = var_42_35
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081010", "story_v_out_102081.awb") ~= 0 then
					local var_42_39 = manager.audio:GetVoiceLength("story_v_out_102081", "102081010", "story_v_out_102081.awb") / 1000

					if var_42_39 + var_42_31 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_39 + var_42_31
					end

					if var_42_34.prefab_name ~= "" and arg_39_1.actors_[var_42_34.prefab_name] ~= nil then
						local var_42_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_34.prefab_name].transform, "story_v_out_102081", "102081010", "story_v_out_102081.awb")

						arg_39_1:RecordAudio("102081010", var_42_40)
						arg_39_1:RecordAudio("102081010", var_42_40)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_102081", "102081010", "story_v_out_102081.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_102081", "102081010", "story_v_out_102081.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_41 = math.max(var_42_32, arg_39_1.talkMaxDuration)

			if var_42_31 <= arg_39_1.time_ and arg_39_1.time_ < var_42_31 + var_42_41 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_31) / var_42_41

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_31 + var_42_41 and arg_39_1.time_ < var_42_31 + var_42_41 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play102081011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 102081011
		arg_43_1.duration_ = 6.7

		local var_43_0 = {
			ja = 6.7,
			ko = 3.9,
			zh = 3.833,
			en = 5.7
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
				arg_43_0:Play102081012(arg_43_1)
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

			local var_46_10 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_11 = 0.033

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_10.localPosition
			end

			local var_46_12 = 0.5

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_11) / var_46_12
				local var_46_14 = Vector3.New(0.7, -0.97, -6)

				var_46_10.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_14, var_46_13)

				local var_46_15 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_15.x, var_46_15.y, var_46_15.z)

				local var_46_16 = var_46_10.localEulerAngles

				var_46_16.z = 0
				var_46_16.x = 0
				var_46_10.localEulerAngles = var_46_16
			end

			if arg_43_1.time_ >= var_46_11 + var_46_12 and arg_43_1.time_ < var_46_11 + var_46_12 + arg_46_0 then
				var_46_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_46_17 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_17.x, var_46_17.y, var_46_17.z)

				local var_46_18 = var_46_10.localEulerAngles

				var_46_18.z = 0
				var_46_18.x = 0
				var_46_10.localEulerAngles = var_46_18
			end

			local var_46_19 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_19.localPosition
			end

			local var_46_21 = 0.001

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / var_46_21
				local var_46_23 = Vector3.New(0, -0.97, -6)

				var_46_19.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_23, var_46_22)

				local var_46_24 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_24.x, var_46_24.y, var_46_24.z)

				local var_46_25 = var_46_19.localEulerAngles

				var_46_25.z = 0
				var_46_25.x = 0
				var_46_19.localEulerAngles = var_46_25
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 then
				var_46_19.localPosition = Vector3.New(0, -0.97, -6)

				local var_46_26 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_26.x, var_46_26.y, var_46_26.z)

				local var_46_27 = var_46_19.localEulerAngles

				var_46_27.z = 0
				var_46_27.x = 0
				var_46_19.localEulerAngles = var_46_27
			end

			local var_46_28 = 0

			if var_46_28 < arg_43_1.time_ and arg_43_1.time_ <= var_46_28 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_46_29 = arg_43_1.actors_["1019ui_story"].transform
			local var_46_30 = 0

			if var_46_30 < arg_43_1.time_ and arg_43_1.time_ <= var_46_30 + arg_46_0 then
				arg_43_1.var_.moveOldPos1019ui_story = var_46_29.localPosition
			end

			local var_46_31 = 0.001

			if var_46_30 <= arg_43_1.time_ and arg_43_1.time_ < var_46_30 + var_46_31 then
				local var_46_32 = (arg_43_1.time_ - var_46_30) / var_46_31
				local var_46_33 = Vector3.New(-0.7, -1.08, -5.9)

				var_46_29.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1019ui_story, var_46_33, var_46_32)

				local var_46_34 = manager.ui.mainCamera.transform.position - var_46_29.position

				var_46_29.forward = Vector3.New(var_46_34.x, var_46_34.y, var_46_34.z)

				local var_46_35 = var_46_29.localEulerAngles

				var_46_35.z = 0
				var_46_35.x = 0
				var_46_29.localEulerAngles = var_46_35
			end

			if arg_43_1.time_ >= var_46_30 + var_46_31 and arg_43_1.time_ < var_46_30 + var_46_31 + arg_46_0 then
				var_46_29.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_46_36 = manager.ui.mainCamera.transform.position - var_46_29.position

				var_46_29.forward = Vector3.New(var_46_36.x, var_46_36.y, var_46_36.z)

				local var_46_37 = var_46_29.localEulerAngles

				var_46_37.z = 0
				var_46_37.x = 0
				var_46_29.localEulerAngles = var_46_37
			end

			local var_46_38 = 0

			if var_46_38 < arg_43_1.time_ and arg_43_1.time_ <= var_46_38 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_46_39 = 0
			local var_46_40 = 0.5

			if var_46_39 < arg_43_1.time_ and arg_43_1.time_ <= var_46_39 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_41 = arg_43_1:FormatText(StoryNameCfg[13].name)

				arg_43_1.leftNameTxt_.text = var_46_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_42 = arg_43_1:GetWordFromCfg(102081011)
				local var_46_43 = arg_43_1:FormatText(var_46_42.content)

				arg_43_1.text_.text = var_46_43

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_44 = 20
				local var_46_45 = utf8.len(var_46_43)
				local var_46_46 = var_46_44 <= 0 and var_46_40 or var_46_40 * (var_46_45 / var_46_44)

				if var_46_46 > 0 and var_46_40 < var_46_46 then
					arg_43_1.talkMaxDuration = var_46_46

					if var_46_46 + var_46_39 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_46 + var_46_39
					end
				end

				arg_43_1.text_.text = var_46_43
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081011", "story_v_out_102081.awb") ~= 0 then
					local var_46_47 = manager.audio:GetVoiceLength("story_v_out_102081", "102081011", "story_v_out_102081.awb") / 1000

					if var_46_47 + var_46_39 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_47 + var_46_39
					end

					if var_46_42.prefab_name ~= "" and arg_43_1.actors_[var_46_42.prefab_name] ~= nil then
						local var_46_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_42.prefab_name].transform, "story_v_out_102081", "102081011", "story_v_out_102081.awb")

						arg_43_1:RecordAudio("102081011", var_46_48)
						arg_43_1:RecordAudio("102081011", var_46_48)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_102081", "102081011", "story_v_out_102081.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_102081", "102081011", "story_v_out_102081.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_49 = math.max(var_46_40, arg_43_1.talkMaxDuration)

			if var_46_39 <= arg_43_1.time_ and arg_43_1.time_ < var_46_39 + var_46_49 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_39) / var_46_49

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_39 + var_46_49 and arg_43_1.time_ < var_46_39 + var_46_49 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play102081012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 102081012
		arg_47_1.duration_ = 4.066

		local var_47_0 = {
			ja = 2.3,
			ko = 3.9,
			zh = 3.633,
			en = 4.066
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
				arg_47_0:Play102081013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10002_tpose"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10002_tpose == nil then
				arg_47_1.var_.characterEffect10002_tpose = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10002_tpose then
					arg_47_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10002_tpose then
				arg_47_1.var_.characterEffect10002_tpose.fillFlat = false
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

			local var_50_19 = 0

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_2")
			end

			local var_50_20 = arg_47_1.actors_["10002_tpose"].transform
			local var_50_21 = 0

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.var_.moveOldPos10002_tpose = var_50_20.localPosition
			end

			local var_50_22 = 0.001

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22
				local var_50_24 = Vector3.New(0.7, -1.2, -5.8)

				var_50_20.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10002_tpose, var_50_24, var_50_23)

				local var_50_25 = manager.ui.mainCamera.transform.position - var_50_20.position

				var_50_20.forward = Vector3.New(var_50_25.x, var_50_25.y, var_50_25.z)

				local var_50_26 = var_50_20.localEulerAngles

				var_50_26.z = 0
				var_50_26.x = 0
				var_50_20.localEulerAngles = var_50_26
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 then
				var_50_20.localPosition = Vector3.New(0.7, -1.2, -5.8)

				local var_50_27 = manager.ui.mainCamera.transform.position - var_50_20.position

				var_50_20.forward = Vector3.New(var_50_27.x, var_50_27.y, var_50_27.z)

				local var_50_28 = var_50_20.localEulerAngles

				var_50_28.z = 0
				var_50_28.x = 0
				var_50_20.localEulerAngles = var_50_28
			end

			local var_50_29 = 0

			if var_50_29 < arg_47_1.time_ and arg_47_1.time_ <= var_50_29 + arg_50_0 then
				arg_47_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_50_30 = 0

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_50_31 = 0
			local var_50_32 = 0.325

			if var_50_31 < arg_47_1.time_ and arg_47_1.time_ <= var_50_31 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_33 = arg_47_1:FormatText(StoryNameCfg[39].name)

				arg_47_1.leftNameTxt_.text = var_50_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_34 = arg_47_1:GetWordFromCfg(102081012)
				local var_50_35 = arg_47_1:FormatText(var_50_34.content)

				arg_47_1.text_.text = var_50_35

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_36 = 13
				local var_50_37 = utf8.len(var_50_35)
				local var_50_38 = var_50_36 <= 0 and var_50_32 or var_50_32 * (var_50_37 / var_50_36)

				if var_50_38 > 0 and var_50_32 < var_50_38 then
					arg_47_1.talkMaxDuration = var_50_38

					if var_50_38 + var_50_31 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_38 + var_50_31
					end
				end

				arg_47_1.text_.text = var_50_35
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081012", "story_v_out_102081.awb") ~= 0 then
					local var_50_39 = manager.audio:GetVoiceLength("story_v_out_102081", "102081012", "story_v_out_102081.awb") / 1000

					if var_50_39 + var_50_31 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_39 + var_50_31
					end

					if var_50_34.prefab_name ~= "" and arg_47_1.actors_[var_50_34.prefab_name] ~= nil then
						local var_50_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_34.prefab_name].transform, "story_v_out_102081", "102081012", "story_v_out_102081.awb")

						arg_47_1:RecordAudio("102081012", var_50_40)
						arg_47_1:RecordAudio("102081012", var_50_40)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_102081", "102081012", "story_v_out_102081.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_102081", "102081012", "story_v_out_102081.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_41 = math.max(var_50_32, arg_47_1.talkMaxDuration)

			if var_50_31 <= arg_47_1.time_ and arg_47_1.time_ < var_50_31 + var_50_41 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_31) / var_50_41

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_31 + var_50_41 and arg_47_1.time_ < var_50_31 + var_50_41 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play102081013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 102081013
		arg_51_1.duration_ = 1.133

		local var_51_0 = {
			ja = 1.133,
			ko = 0.999999999999,
			zh = 0.999999999999,
			en = 0.999999999999
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
				arg_51_0:Play102081014(arg_51_1)
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

			local var_54_4 = arg_51_1.actors_["10002_tpose"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect10002_tpose == nil then
				arg_51_1.var_.characterEffect10002_tpose = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect10002_tpose then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_51_1.var_.characterEffect10002_tpose.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect10002_tpose then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_51_1.var_.characterEffect10002_tpose.fillRatio = var_54_9
			end

			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_54_11 = 0
			local var_54_12 = 0.05

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_13 = arg_51_1:FormatText(StoryNameCfg[13].name)

				arg_51_1.leftNameTxt_.text = var_54_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_14 = arg_51_1:GetWordFromCfg(102081013)
				local var_54_15 = arg_51_1:FormatText(var_54_14.content)

				arg_51_1.text_.text = var_54_15

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_16 = 2
				local var_54_17 = utf8.len(var_54_15)
				local var_54_18 = var_54_16 <= 0 and var_54_12 or var_54_12 * (var_54_17 / var_54_16)

				if var_54_18 > 0 and var_54_12 < var_54_18 then
					arg_51_1.talkMaxDuration = var_54_18

					if var_54_18 + var_54_11 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_11
					end
				end

				arg_51_1.text_.text = var_54_15
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081013", "story_v_out_102081.awb") ~= 0 then
					local var_54_19 = manager.audio:GetVoiceLength("story_v_out_102081", "102081013", "story_v_out_102081.awb") / 1000

					if var_54_19 + var_54_11 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_11
					end

					if var_54_14.prefab_name ~= "" and arg_51_1.actors_[var_54_14.prefab_name] ~= nil then
						local var_54_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_14.prefab_name].transform, "story_v_out_102081", "102081013", "story_v_out_102081.awb")

						arg_51_1:RecordAudio("102081013", var_54_20)
						arg_51_1:RecordAudio("102081013", var_54_20)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_102081", "102081013", "story_v_out_102081.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_102081", "102081013", "story_v_out_102081.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_21 = math.max(var_54_12, arg_51_1.talkMaxDuration)

			if var_54_11 <= arg_51_1.time_ and arg_51_1.time_ < var_54_11 + var_54_21 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_11) / var_54_21

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_11 + var_54_21 and arg_51_1.time_ < var_54_11 + var_54_21 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play102081014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 102081014
		arg_55_1.duration_ = 7.1

		local var_55_0 = {
			ja = 7.1,
			ko = 6.533,
			zh = 5.333,
			en = 5.933
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
				arg_55_0:Play102081015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10002_tpose"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect10002_tpose == nil then
				arg_55_1.var_.characterEffect10002_tpose = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect10002_tpose then
					arg_55_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect10002_tpose then
				arg_55_1.var_.characterEffect10002_tpose.fillFlat = false
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

			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_58_12 = 0
			local var_58_13 = 0.725

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[39].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(102081014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 29
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081014", "story_v_out_102081.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_102081", "102081014", "story_v_out_102081.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_102081", "102081014", "story_v_out_102081.awb")

						arg_55_1:RecordAudio("102081014", var_58_21)
						arg_55_1:RecordAudio("102081014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_102081", "102081014", "story_v_out_102081.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_102081", "102081014", "story_v_out_102081.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play102081015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 102081015
		arg_59_1.duration_ = 6.914190599693

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play102081016(arg_59_1)
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

			local var_62_4 = arg_59_1.actors_["10002_tpose"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect10002_tpose == nil then
				arg_59_1.var_.characterEffect10002_tpose = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect10002_tpose then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_59_1.var_.characterEffect10002_tpose.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect10002_tpose then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_59_1.var_.characterEffect10002_tpose.fillRatio = var_62_9
			end

			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action425")
			end

			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_12 = 0
			local var_62_13 = 0.5

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

				local var_62_15 = arg_59_1:GetWordFromCfg(102081015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081015", "story_v_out_102081.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_102081", "102081015", "story_v_out_102081.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_102081", "102081015", "story_v_out_102081.awb")

						arg_59_1:RecordAudio("102081015", var_62_21)
						arg_59_1:RecordAudio("102081015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_102081", "102081015", "story_v_out_102081.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_102081", "102081015", "story_v_out_102081.awb")
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
	Play102081016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 102081016
		arg_63_1.duration_ = 11.966

		local var_63_0 = {
			ja = 9.966,
			ko = 8.966,
			zh = 10.433,
			en = 11.966
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
				arg_63_0:Play102081017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10002_tpose"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect10002_tpose == nil then
				arg_63_1.var_.characterEffect10002_tpose = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect10002_tpose then
					arg_63_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect10002_tpose then
				arg_63_1.var_.characterEffect10002_tpose.fillFlat = false
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

			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_66_11 = 0
			local var_66_12 = 1.075

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_13 = arg_63_1:FormatText(StoryNameCfg[39].name)

				arg_63_1.leftNameTxt_.text = var_66_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_14 = arg_63_1:GetWordFromCfg(102081016)
				local var_66_15 = arg_63_1:FormatText(var_66_14.content)

				arg_63_1.text_.text = var_66_15

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_16 = 43
				local var_66_17 = utf8.len(var_66_15)
				local var_66_18 = var_66_16 <= 0 and var_66_12 or var_66_12 * (var_66_17 / var_66_16)

				if var_66_18 > 0 and var_66_12 < var_66_18 then
					arg_63_1.talkMaxDuration = var_66_18

					if var_66_18 + var_66_11 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_11
					end
				end

				arg_63_1.text_.text = var_66_15
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081016", "story_v_out_102081.awb") ~= 0 then
					local var_66_19 = manager.audio:GetVoiceLength("story_v_out_102081", "102081016", "story_v_out_102081.awb") / 1000

					if var_66_19 + var_66_11 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_11
					end

					if var_66_14.prefab_name ~= "" and arg_63_1.actors_[var_66_14.prefab_name] ~= nil then
						local var_66_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_14.prefab_name].transform, "story_v_out_102081", "102081016", "story_v_out_102081.awb")

						arg_63_1:RecordAudio("102081016", var_66_20)
						arg_63_1:RecordAudio("102081016", var_66_20)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_102081", "102081016", "story_v_out_102081.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_102081", "102081016", "story_v_out_102081.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_21 = math.max(var_66_12, arg_63_1.talkMaxDuration)

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_21 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_11) / var_66_21

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_11 + var_66_21 and arg_63_1.time_ < var_66_11 + var_66_21 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play102081017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 102081017
		arg_67_1.duration_ = 11.3

		local var_67_0 = {
			ja = 9.433,
			ko = 7.333,
			zh = 6.366,
			en = 11.3
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
				arg_67_0:Play102081018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1019ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1019ui_story == nil then
				arg_67_1.var_.characterEffect1019ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1019ui_story then
					arg_67_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1019ui_story then
				arg_67_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["10002_tpose"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect10002_tpose == nil then
				arg_67_1.var_.characterEffect10002_tpose = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect10002_tpose then
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_67_1.var_.characterEffect10002_tpose.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect10002_tpose then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_67_1.var_.characterEffect10002_tpose.fillRatio = var_70_9
			end

			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_70_11 = 0
			local var_70_12 = 0.725

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_13 = arg_67_1:FormatText(StoryNameCfg[13].name)

				arg_67_1.leftNameTxt_.text = var_70_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_14 = arg_67_1:GetWordFromCfg(102081017)
				local var_70_15 = arg_67_1:FormatText(var_70_14.content)

				arg_67_1.text_.text = var_70_15

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_16 = 29
				local var_70_17 = utf8.len(var_70_15)
				local var_70_18 = var_70_16 <= 0 and var_70_12 or var_70_12 * (var_70_17 / var_70_16)

				if var_70_18 > 0 and var_70_12 < var_70_18 then
					arg_67_1.talkMaxDuration = var_70_18

					if var_70_18 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_11
					end
				end

				arg_67_1.text_.text = var_70_15
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081017", "story_v_out_102081.awb") ~= 0 then
					local var_70_19 = manager.audio:GetVoiceLength("story_v_out_102081", "102081017", "story_v_out_102081.awb") / 1000

					if var_70_19 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_11
					end

					if var_70_14.prefab_name ~= "" and arg_67_1.actors_[var_70_14.prefab_name] ~= nil then
						local var_70_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_14.prefab_name].transform, "story_v_out_102081", "102081017", "story_v_out_102081.awb")

						arg_67_1:RecordAudio("102081017", var_70_20)
						arg_67_1:RecordAudio("102081017", var_70_20)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_102081", "102081017", "story_v_out_102081.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_102081", "102081017", "story_v_out_102081.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_21 = math.max(var_70_12, arg_67_1.talkMaxDuration)

			if var_70_11 <= arg_67_1.time_ and arg_67_1.time_ < var_70_11 + var_70_21 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_11) / var_70_21

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_11 + var_70_21 and arg_67_1.time_ < var_70_11 + var_70_21 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play102081018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 102081018
		arg_71_1.duration_ = 13.2

		local var_71_0 = {
			ja = 13.2,
			ko = 7.266,
			zh = 6.8,
			en = 9
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
				arg_71_0:Play102081019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_74_2 = 0
			local var_74_3 = 0.9

			if var_74_2 < arg_71_1.time_ and arg_71_1.time_ <= var_74_2 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_4 = arg_71_1:FormatText(StoryNameCfg[13].name)

				arg_71_1.leftNameTxt_.text = var_74_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_5 = arg_71_1:GetWordFromCfg(102081018)
				local var_74_6 = arg_71_1:FormatText(var_74_5.content)

				arg_71_1.text_.text = var_74_6

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_7 = 36
				local var_74_8 = utf8.len(var_74_6)
				local var_74_9 = var_74_7 <= 0 and var_74_3 or var_74_3 * (var_74_8 / var_74_7)

				if var_74_9 > 0 and var_74_3 < var_74_9 then
					arg_71_1.talkMaxDuration = var_74_9

					if var_74_9 + var_74_2 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_9 + var_74_2
					end
				end

				arg_71_1.text_.text = var_74_6
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081018", "story_v_out_102081.awb") ~= 0 then
					local var_74_10 = manager.audio:GetVoiceLength("story_v_out_102081", "102081018", "story_v_out_102081.awb") / 1000

					if var_74_10 + var_74_2 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_10 + var_74_2
					end

					if var_74_5.prefab_name ~= "" and arg_71_1.actors_[var_74_5.prefab_name] ~= nil then
						local var_74_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_5.prefab_name].transform, "story_v_out_102081", "102081018", "story_v_out_102081.awb")

						arg_71_1:RecordAudio("102081018", var_74_11)
						arg_71_1:RecordAudio("102081018", var_74_11)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_102081", "102081018", "story_v_out_102081.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_102081", "102081018", "story_v_out_102081.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_12 = math.max(var_74_3, arg_71_1.talkMaxDuration)

			if var_74_2 <= arg_71_1.time_ and arg_71_1.time_ < var_74_2 + var_74_12 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_2) / var_74_12

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_2 + var_74_12 and arg_71_1.time_ < var_74_2 + var_74_12 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play102081019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 102081019
		arg_75_1.duration_ = 5.933

		local var_75_0 = {
			ja = 4.766,
			ko = 5.933,
			zh = 4.166,
			en = 4.9
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
				arg_75_0:Play102081020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10002_tpose"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect10002_tpose == nil then
				arg_75_1.var_.characterEffect10002_tpose = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect10002_tpose then
					arg_75_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect10002_tpose then
				arg_75_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["1019ui_story"]
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 and arg_75_1.var_.characterEffect1019ui_story == nil then
				arg_75_1.var_.characterEffect1019ui_story = var_78_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_6 = 0.1

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6

				if arg_75_1.var_.characterEffect1019ui_story then
					local var_78_8 = Mathf.Lerp(0, 0.5, var_78_7)

					arg_75_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1019ui_story.fillRatio = var_78_8
				end
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect1019ui_story then
				local var_78_9 = 0.5

				arg_75_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1019ui_story.fillRatio = var_78_9
			end

			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_78_11 = 0
			local var_78_12 = 0.375

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_13 = arg_75_1:FormatText(StoryNameCfg[39].name)

				arg_75_1.leftNameTxt_.text = var_78_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_14 = arg_75_1:GetWordFromCfg(102081019)
				local var_78_15 = arg_75_1:FormatText(var_78_14.content)

				arg_75_1.text_.text = var_78_15

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_16 = 15
				local var_78_17 = utf8.len(var_78_15)
				local var_78_18 = var_78_16 <= 0 and var_78_12 or var_78_12 * (var_78_17 / var_78_16)

				if var_78_18 > 0 and var_78_12 < var_78_18 then
					arg_75_1.talkMaxDuration = var_78_18

					if var_78_18 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_18 + var_78_11
					end
				end

				arg_75_1.text_.text = var_78_15
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081019", "story_v_out_102081.awb") ~= 0 then
					local var_78_19 = manager.audio:GetVoiceLength("story_v_out_102081", "102081019", "story_v_out_102081.awb") / 1000

					if var_78_19 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_11
					end

					if var_78_14.prefab_name ~= "" and arg_75_1.actors_[var_78_14.prefab_name] ~= nil then
						local var_78_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_14.prefab_name].transform, "story_v_out_102081", "102081019", "story_v_out_102081.awb")

						arg_75_1:RecordAudio("102081019", var_78_20)
						arg_75_1:RecordAudio("102081019", var_78_20)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_102081", "102081019", "story_v_out_102081.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_102081", "102081019", "story_v_out_102081.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_21 = math.max(var_78_12, arg_75_1.talkMaxDuration)

			if var_78_11 <= arg_75_1.time_ and arg_75_1.time_ < var_78_11 + var_78_21 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_11) / var_78_21

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_11 + var_78_21 and arg_75_1.time_ < var_78_11 + var_78_21 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play102081020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 102081020
		arg_79_1.duration_ = 4.766

		local var_79_0 = {
			ja = 4.766,
			ko = 4.2,
			zh = 3.966,
			en = 2.9
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
				arg_79_0:Play102081021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1019ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1019ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1019ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, 100, 0)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["10002_tpose"].transform
			local var_82_10 = 0.033

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1.var_.moveOldPos10002_tpose = var_82_9.localPosition
			end

			local var_82_11 = 0.5

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11
				local var_82_13 = Vector3.New(0, -1.2, -5.8)

				var_82_9.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10002_tpose, var_82_13, var_82_12)

				local var_82_14 = manager.ui.mainCamera.transform.position - var_82_9.position

				var_82_9.forward = Vector3.New(var_82_14.x, var_82_14.y, var_82_14.z)

				local var_82_15 = var_82_9.localEulerAngles

				var_82_15.z = 0
				var_82_15.x = 0
				var_82_9.localEulerAngles = var_82_15
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 then
				var_82_9.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_82_16 = manager.ui.mainCamera.transform.position - var_82_9.position

				var_82_9.forward = Vector3.New(var_82_16.x, var_82_16.y, var_82_16.z)

				local var_82_17 = var_82_9.localEulerAngles

				var_82_17.z = 0
				var_82_17.x = 0
				var_82_9.localEulerAngles = var_82_17
			end

			local var_82_18 = arg_79_1.actors_["10002_tpose"].transform
			local var_82_19 = 0

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.var_.moveOldPos10002_tpose = var_82_18.localPosition
			end

			local var_82_20 = 0.001

			if var_82_19 <= arg_79_1.time_ and arg_79_1.time_ < var_82_19 + var_82_20 then
				local var_82_21 = (arg_79_1.time_ - var_82_19) / var_82_20
				local var_82_22 = Vector3.New(0.7, -1.2, -5.8)

				var_82_18.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10002_tpose, var_82_22, var_82_21)

				local var_82_23 = manager.ui.mainCamera.transform.position - var_82_18.position

				var_82_18.forward = Vector3.New(var_82_23.x, var_82_23.y, var_82_23.z)

				local var_82_24 = var_82_18.localEulerAngles

				var_82_24.z = 0
				var_82_24.x = 0
				var_82_18.localEulerAngles = var_82_24
			end

			if arg_79_1.time_ >= var_82_19 + var_82_20 and arg_79_1.time_ < var_82_19 + var_82_20 + arg_82_0 then
				var_82_18.localPosition = Vector3.New(0.7, -1.2, -5.8)

				local var_82_25 = manager.ui.mainCamera.transform.position - var_82_18.position

				var_82_18.forward = Vector3.New(var_82_25.x, var_82_25.y, var_82_25.z)

				local var_82_26 = var_82_18.localEulerAngles

				var_82_26.z = 0
				var_82_26.x = 0
				var_82_18.localEulerAngles = var_82_26
			end

			local var_82_27 = 0

			if var_82_27 < arg_79_1.time_ and arg_79_1.time_ <= var_82_27 + arg_82_0 then
				arg_79_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_82_28 = 0
			local var_82_29 = 0.275

			if var_82_28 < arg_79_1.time_ and arg_79_1.time_ <= var_82_28 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_30 = arg_79_1:FormatText(StoryNameCfg[39].name)

				arg_79_1.leftNameTxt_.text = var_82_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_31 = arg_79_1:GetWordFromCfg(102081020)
				local var_82_32 = arg_79_1:FormatText(var_82_31.content)

				arg_79_1.text_.text = var_82_32

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_33 = 11
				local var_82_34 = utf8.len(var_82_32)
				local var_82_35 = var_82_33 <= 0 and var_82_29 or var_82_29 * (var_82_34 / var_82_33)

				if var_82_35 > 0 and var_82_29 < var_82_35 then
					arg_79_1.talkMaxDuration = var_82_35

					if var_82_35 + var_82_28 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_35 + var_82_28
					end
				end

				arg_79_1.text_.text = var_82_32
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081020", "story_v_out_102081.awb") ~= 0 then
					local var_82_36 = manager.audio:GetVoiceLength("story_v_out_102081", "102081020", "story_v_out_102081.awb") / 1000

					if var_82_36 + var_82_28 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_36 + var_82_28
					end

					if var_82_31.prefab_name ~= "" and arg_79_1.actors_[var_82_31.prefab_name] ~= nil then
						local var_82_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_31.prefab_name].transform, "story_v_out_102081", "102081020", "story_v_out_102081.awb")

						arg_79_1:RecordAudio("102081020", var_82_37)
						arg_79_1:RecordAudio("102081020", var_82_37)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_102081", "102081020", "story_v_out_102081.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_102081", "102081020", "story_v_out_102081.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_38 = math.max(var_82_29, arg_79_1.talkMaxDuration)

			if var_82_28 <= arg_79_1.time_ and arg_79_1.time_ < var_82_28 + var_82_38 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_28) / var_82_38

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_28 + var_82_38 and arg_79_1.time_ < var_82_28 + var_82_38 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play102081021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 102081021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play102081022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10002_tpose"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect10002_tpose == nil then
				arg_83_1.var_.characterEffect10002_tpose = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.1

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect10002_tpose then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_83_1.var_.characterEffect10002_tpose.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect10002_tpose then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_83_1.var_.characterEffect10002_tpose.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.625

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_8 = arg_83_1:GetWordFromCfg(102081021)
				local var_86_9 = arg_83_1:FormatText(var_86_8.content)

				arg_83_1.text_.text = var_86_9

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_10 = 25
				local var_86_11 = utf8.len(var_86_9)
				local var_86_12 = var_86_10 <= 0 and var_86_7 or var_86_7 * (var_86_11 / var_86_10)

				if var_86_12 > 0 and var_86_7 < var_86_12 then
					arg_83_1.talkMaxDuration = var_86_12

					if var_86_12 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_12 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_9
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_13 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_13 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_13

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_13 and arg_83_1.time_ < var_86_6 + var_86_13 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play102081022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 102081022
		arg_87_1.duration_ = 9.266

		local var_87_0 = {
			ja = 6.833,
			ko = 9.266,
			zh = 8.066,
			en = 8.9
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
				arg_87_0:Play102081023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10002_tpose"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect10002_tpose == nil then
				arg_87_1.var_.characterEffect10002_tpose = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect10002_tpose then
					arg_87_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect10002_tpose then
				arg_87_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_90_4 = 0

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_90_5 = 0
			local var_90_6 = 0.775

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_7 = arg_87_1:FormatText(StoryNameCfg[39].name)

				arg_87_1.leftNameTxt_.text = var_90_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_8 = arg_87_1:GetWordFromCfg(102081022)
				local var_90_9 = arg_87_1:FormatText(var_90_8.content)

				arg_87_1.text_.text = var_90_9

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_10 = 31
				local var_90_11 = utf8.len(var_90_9)
				local var_90_12 = var_90_10 <= 0 and var_90_6 or var_90_6 * (var_90_11 / var_90_10)

				if var_90_12 > 0 and var_90_6 < var_90_12 then
					arg_87_1.talkMaxDuration = var_90_12

					if var_90_12 + var_90_5 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_12 + var_90_5
					end
				end

				arg_87_1.text_.text = var_90_9
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081022", "story_v_out_102081.awb") ~= 0 then
					local var_90_13 = manager.audio:GetVoiceLength("story_v_out_102081", "102081022", "story_v_out_102081.awb") / 1000

					if var_90_13 + var_90_5 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_13 + var_90_5
					end

					if var_90_8.prefab_name ~= "" and arg_87_1.actors_[var_90_8.prefab_name] ~= nil then
						local var_90_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_8.prefab_name].transform, "story_v_out_102081", "102081022", "story_v_out_102081.awb")

						arg_87_1:RecordAudio("102081022", var_90_14)
						arg_87_1:RecordAudio("102081022", var_90_14)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_102081", "102081022", "story_v_out_102081.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_102081", "102081022", "story_v_out_102081.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_15 = math.max(var_90_6, arg_87_1.talkMaxDuration)

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_15 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_5) / var_90_15

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_5 + var_90_15 and arg_87_1.time_ < var_90_5 + var_90_15 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play102081023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 102081023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play102081024(arg_91_1)
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
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_91_1.var_.characterEffect10002_tpose.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect10002_tpose then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_91_1.var_.characterEffect10002_tpose.fillRatio = var_94_5
			end

			local var_94_6 = arg_91_1.actors_["10002_tpose"].transform
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 then
				arg_91_1.var_.moveOldPos10002_tpose = var_94_6.localPosition
			end

			local var_94_8 = 0.001

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_7) / var_94_8
				local var_94_10 = Vector3.New(0, 100, 0)

				var_94_6.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10002_tpose, var_94_10, var_94_9)

				local var_94_11 = manager.ui.mainCamera.transform.position - var_94_6.position

				var_94_6.forward = Vector3.New(var_94_11.x, var_94_11.y, var_94_11.z)

				local var_94_12 = var_94_6.localEulerAngles

				var_94_12.z = 0
				var_94_12.x = 0
				var_94_6.localEulerAngles = var_94_12
			end

			if arg_91_1.time_ >= var_94_7 + var_94_8 and arg_91_1.time_ < var_94_7 + var_94_8 + arg_94_0 then
				var_94_6.localPosition = Vector3.New(0, 100, 0)

				local var_94_13 = manager.ui.mainCamera.transform.position - var_94_6.position

				var_94_6.forward = Vector3.New(var_94_13.x, var_94_13.y, var_94_13.z)

				local var_94_14 = var_94_6.localEulerAngles

				var_94_14.z = 0
				var_94_14.x = 0
				var_94_6.localEulerAngles = var_94_14
			end

			local var_94_15 = 0
			local var_94_16 = 0.625

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_17 = arg_91_1:GetWordFromCfg(102081023)
				local var_94_18 = arg_91_1:FormatText(var_94_17.content)

				arg_91_1.text_.text = var_94_18

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_19 = 25
				local var_94_20 = utf8.len(var_94_18)
				local var_94_21 = var_94_19 <= 0 and var_94_16 or var_94_16 * (var_94_20 / var_94_19)

				if var_94_21 > 0 and var_94_16 < var_94_21 then
					arg_91_1.talkMaxDuration = var_94_21

					if var_94_21 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_15
					end
				end

				arg_91_1.text_.text = var_94_18
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_22 = math.max(var_94_16, arg_91_1.talkMaxDuration)

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_22 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_15) / var_94_22

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_15 + var_94_22 and arg_91_1.time_ < var_94_15 + var_94_22 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play102081024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 102081024
		arg_95_1.duration_ = 12.566

		local var_95_0 = {
			ja = 11.833,
			ko = 12.566,
			zh = 8.233,
			en = 10.033
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
				arg_95_0:Play102081025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10002_tpose"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect10002_tpose == nil then
				arg_95_1.var_.characterEffect10002_tpose = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.1

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect10002_tpose then
					arg_95_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect10002_tpose then
				arg_95_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_98_4 = arg_95_1.actors_["10002_tpose"].transform
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 then
				arg_95_1.var_.moveOldPos10002_tpose = var_98_4.localPosition
			end

			local var_98_6 = 0.001

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6
				local var_98_8 = Vector3.New(0, -1.2, -5.8)

				var_98_4.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10002_tpose, var_98_8, var_98_7)

				local var_98_9 = manager.ui.mainCamera.transform.position - var_98_4.position

				var_98_4.forward = Vector3.New(var_98_9.x, var_98_9.y, var_98_9.z)

				local var_98_10 = var_98_4.localEulerAngles

				var_98_10.z = 0
				var_98_10.x = 0
				var_98_4.localEulerAngles = var_98_10
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 then
				var_98_4.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_98_11 = manager.ui.mainCamera.transform.position - var_98_4.position

				var_98_4.forward = Vector3.New(var_98_11.x, var_98_11.y, var_98_11.z)

				local var_98_12 = var_98_4.localEulerAngles

				var_98_12.z = 0
				var_98_12.x = 0
				var_98_4.localEulerAngles = var_98_12
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_15 = 0
			local var_98_16 = 1

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_17 = arg_95_1:FormatText(StoryNameCfg[39].name)

				arg_95_1.leftNameTxt_.text = var_98_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_18 = arg_95_1:GetWordFromCfg(102081024)
				local var_98_19 = arg_95_1:FormatText(var_98_18.content)

				arg_95_1.text_.text = var_98_19

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_20 = 40
				local var_98_21 = utf8.len(var_98_19)
				local var_98_22 = var_98_20 <= 0 and var_98_16 or var_98_16 * (var_98_21 / var_98_20)

				if var_98_22 > 0 and var_98_16 < var_98_22 then
					arg_95_1.talkMaxDuration = var_98_22

					if var_98_22 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_22 + var_98_15
					end
				end

				arg_95_1.text_.text = var_98_19
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081024", "story_v_out_102081.awb") ~= 0 then
					local var_98_23 = manager.audio:GetVoiceLength("story_v_out_102081", "102081024", "story_v_out_102081.awb") / 1000

					if var_98_23 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_23 + var_98_15
					end

					if var_98_18.prefab_name ~= "" and arg_95_1.actors_[var_98_18.prefab_name] ~= nil then
						local var_98_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_18.prefab_name].transform, "story_v_out_102081", "102081024", "story_v_out_102081.awb")

						arg_95_1:RecordAudio("102081024", var_98_24)
						arg_95_1:RecordAudio("102081024", var_98_24)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_102081", "102081024", "story_v_out_102081.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_102081", "102081024", "story_v_out_102081.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_25 = math.max(var_98_16, arg_95_1.talkMaxDuration)

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_25 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_15) / var_98_25

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_15 + var_98_25 and arg_95_1.time_ < var_98_15 + var_98_25 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play102081025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 102081025
		arg_99_1.duration_ = 5.733

		local var_99_0 = {
			ja = 4.3,
			ko = 5.733,
			zh = 3.566,
			en = 3.766
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
				arg_99_0:Play102081026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1019ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1019ui_story == nil then
				arg_99_1.var_.characterEffect1019ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.1

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1019ui_story then
					arg_99_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1019ui_story then
				arg_99_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["10002_tpose"]
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 and arg_99_1.var_.characterEffect10002_tpose == nil then
				arg_99_1.var_.characterEffect10002_tpose = var_102_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_6 = 0.1

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6

				if arg_99_1.var_.characterEffect10002_tpose then
					local var_102_8 = Mathf.Lerp(0, 0.5, var_102_7)

					arg_99_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_99_1.var_.characterEffect10002_tpose.fillRatio = var_102_8
				end
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 and arg_99_1.var_.characterEffect10002_tpose then
				local var_102_9 = 0.5

				arg_99_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_99_1.var_.characterEffect10002_tpose.fillRatio = var_102_9
			end

			local var_102_10 = arg_99_1.actors_["10002_tpose"].transform
			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1.var_.moveOldPos10002_tpose = var_102_10.localPosition
			end

			local var_102_12 = 0.001

			if var_102_11 <= arg_99_1.time_ and arg_99_1.time_ < var_102_11 + var_102_12 then
				local var_102_13 = (arg_99_1.time_ - var_102_11) / var_102_12
				local var_102_14 = Vector3.New(0, 100, 0)

				var_102_10.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10002_tpose, var_102_14, var_102_13)

				local var_102_15 = manager.ui.mainCamera.transform.position - var_102_10.position

				var_102_10.forward = Vector3.New(var_102_15.x, var_102_15.y, var_102_15.z)

				local var_102_16 = var_102_10.localEulerAngles

				var_102_16.z = 0
				var_102_16.x = 0
				var_102_10.localEulerAngles = var_102_16
			end

			if arg_99_1.time_ >= var_102_11 + var_102_12 and arg_99_1.time_ < var_102_11 + var_102_12 + arg_102_0 then
				var_102_10.localPosition = Vector3.New(0, 100, 0)

				local var_102_17 = manager.ui.mainCamera.transform.position - var_102_10.position

				var_102_10.forward = Vector3.New(var_102_17.x, var_102_17.y, var_102_17.z)

				local var_102_18 = var_102_10.localEulerAngles

				var_102_18.z = 0
				var_102_18.x = 0
				var_102_10.localEulerAngles = var_102_18
			end

			local var_102_19 = arg_99_1.actors_["1019ui_story"].transform
			local var_102_20 = 0

			if var_102_20 < arg_99_1.time_ and arg_99_1.time_ <= var_102_20 + arg_102_0 then
				arg_99_1.var_.moveOldPos1019ui_story = var_102_19.localPosition
			end

			local var_102_21 = 0.001

			if var_102_20 <= arg_99_1.time_ and arg_99_1.time_ < var_102_20 + var_102_21 then
				local var_102_22 = (arg_99_1.time_ - var_102_20) / var_102_21
				local var_102_23 = Vector3.New(0, -1.08, -5.9)

				var_102_19.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1019ui_story, var_102_23, var_102_22)

				local var_102_24 = manager.ui.mainCamera.transform.position - var_102_19.position

				var_102_19.forward = Vector3.New(var_102_24.x, var_102_24.y, var_102_24.z)

				local var_102_25 = var_102_19.localEulerAngles

				var_102_25.z = 0
				var_102_25.x = 0
				var_102_19.localEulerAngles = var_102_25
			end

			if arg_99_1.time_ >= var_102_20 + var_102_21 and arg_99_1.time_ < var_102_20 + var_102_21 + arg_102_0 then
				var_102_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_102_26 = manager.ui.mainCamera.transform.position - var_102_19.position

				var_102_19.forward = Vector3.New(var_102_26.x, var_102_26.y, var_102_26.z)

				local var_102_27 = var_102_19.localEulerAngles

				var_102_27.z = 0
				var_102_27.x = 0
				var_102_19.localEulerAngles = var_102_27
			end

			local var_102_28 = 0

			if var_102_28 < arg_99_1.time_ and arg_99_1.time_ <= var_102_28 + arg_102_0 then
				arg_99_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_102_29 = 0

			if var_102_29 < arg_99_1.time_ and arg_99_1.time_ <= var_102_29 + arg_102_0 then
				arg_99_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_30 = 0
			local var_102_31 = 0.425

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_32 = arg_99_1:FormatText(StoryNameCfg[13].name)

				arg_99_1.leftNameTxt_.text = var_102_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_33 = arg_99_1:GetWordFromCfg(102081025)
				local var_102_34 = arg_99_1:FormatText(var_102_33.content)

				arg_99_1.text_.text = var_102_34

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_35 = 17
				local var_102_36 = utf8.len(var_102_34)
				local var_102_37 = var_102_35 <= 0 and var_102_31 or var_102_31 * (var_102_36 / var_102_35)

				if var_102_37 > 0 and var_102_31 < var_102_37 then
					arg_99_1.talkMaxDuration = var_102_37

					if var_102_37 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_37 + var_102_30
					end
				end

				arg_99_1.text_.text = var_102_34
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081025", "story_v_out_102081.awb") ~= 0 then
					local var_102_38 = manager.audio:GetVoiceLength("story_v_out_102081", "102081025", "story_v_out_102081.awb") / 1000

					if var_102_38 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_38 + var_102_30
					end

					if var_102_33.prefab_name ~= "" and arg_99_1.actors_[var_102_33.prefab_name] ~= nil then
						local var_102_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_33.prefab_name].transform, "story_v_out_102081", "102081025", "story_v_out_102081.awb")

						arg_99_1:RecordAudio("102081025", var_102_39)
						arg_99_1:RecordAudio("102081025", var_102_39)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_102081", "102081025", "story_v_out_102081.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_102081", "102081025", "story_v_out_102081.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_40 = math.max(var_102_31, arg_99_1.talkMaxDuration)

			if var_102_30 <= arg_99_1.time_ and arg_99_1.time_ < var_102_30 + var_102_40 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_30) / var_102_40

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_30 + var_102_40 and arg_99_1.time_ < var_102_30 + var_102_40 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play102081026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 102081026
		arg_103_1.duration_ = 3.2

		local var_103_0 = {
			ja = 1.666,
			ko = 2.266,
			zh = 3.2,
			en = 1.499999999999
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
				arg_103_0:Play102081027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10002_tpose"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect10002_tpose == nil then
				arg_103_1.var_.characterEffect10002_tpose = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.1

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect10002_tpose then
					arg_103_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect10002_tpose then
				arg_103_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["1019ui_story"].transform
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1.var_.moveOldPos1019ui_story = var_106_4.localPosition
			end

			local var_106_6 = 0.001

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6
				local var_106_8 = Vector3.New(0, 100, 0)

				var_106_4.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1019ui_story, var_106_8, var_106_7)

				local var_106_9 = manager.ui.mainCamera.transform.position - var_106_4.position

				var_106_4.forward = Vector3.New(var_106_9.x, var_106_9.y, var_106_9.z)

				local var_106_10 = var_106_4.localEulerAngles

				var_106_10.z = 0
				var_106_10.x = 0
				var_106_4.localEulerAngles = var_106_10
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 then
				var_106_4.localPosition = Vector3.New(0, 100, 0)

				local var_106_11 = manager.ui.mainCamera.transform.position - var_106_4.position

				var_106_4.forward = Vector3.New(var_106_11.x, var_106_11.y, var_106_11.z)

				local var_106_12 = var_106_4.localEulerAngles

				var_106_12.z = 0
				var_106_12.x = 0
				var_106_4.localEulerAngles = var_106_12
			end

			local var_106_13 = arg_103_1.actors_["10002_tpose"].transform
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1.var_.moveOldPos10002_tpose = var_106_13.localPosition
			end

			local var_106_15 = 0.001

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15
				local var_106_17 = Vector3.New(0, -1.2, -5.8)

				var_106_13.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10002_tpose, var_106_17, var_106_16)

				local var_106_18 = manager.ui.mainCamera.transform.position - var_106_13.position

				var_106_13.forward = Vector3.New(var_106_18.x, var_106_18.y, var_106_18.z)

				local var_106_19 = var_106_13.localEulerAngles

				var_106_19.z = 0
				var_106_19.x = 0
				var_106_13.localEulerAngles = var_106_19
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 then
				var_106_13.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_13.position

				var_106_13.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_13.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_13.localEulerAngles = var_106_21
			end

			local var_106_22 = 0

			if var_106_22 < arg_103_1.time_ and arg_103_1.time_ <= var_106_22 + arg_106_0 then
				arg_103_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_106_23 = 0

			if var_106_23 < arg_103_1.time_ and arg_103_1.time_ <= var_106_23 + arg_106_0 then
				arg_103_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_106_24 = 0
			local var_106_25 = 0.05

			if var_106_24 < arg_103_1.time_ and arg_103_1.time_ <= var_106_24 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_26 = arg_103_1:FormatText(StoryNameCfg[39].name)

				arg_103_1.leftNameTxt_.text = var_106_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_27 = arg_103_1:GetWordFromCfg(102081026)
				local var_106_28 = arg_103_1:FormatText(var_106_27.content)

				arg_103_1.text_.text = var_106_28

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_29 = 2
				local var_106_30 = utf8.len(var_106_28)
				local var_106_31 = var_106_29 <= 0 and var_106_25 or var_106_25 * (var_106_30 / var_106_29)

				if var_106_31 > 0 and var_106_25 < var_106_31 then
					arg_103_1.talkMaxDuration = var_106_31

					if var_106_31 + var_106_24 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_31 + var_106_24
					end
				end

				arg_103_1.text_.text = var_106_28
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081026", "story_v_out_102081.awb") ~= 0 then
					local var_106_32 = manager.audio:GetVoiceLength("story_v_out_102081", "102081026", "story_v_out_102081.awb") / 1000

					if var_106_32 + var_106_24 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_32 + var_106_24
					end

					if var_106_27.prefab_name ~= "" and arg_103_1.actors_[var_106_27.prefab_name] ~= nil then
						local var_106_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_27.prefab_name].transform, "story_v_out_102081", "102081026", "story_v_out_102081.awb")

						arg_103_1:RecordAudio("102081026", var_106_33)
						arg_103_1:RecordAudio("102081026", var_106_33)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_102081", "102081026", "story_v_out_102081.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_102081", "102081026", "story_v_out_102081.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_34 = math.max(var_106_25, arg_103_1.talkMaxDuration)

			if var_106_24 <= arg_103_1.time_ and arg_103_1.time_ < var_106_24 + var_106_34 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_24) / var_106_34

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_24 + var_106_34 and arg_103_1.time_ < var_106_24 + var_106_34 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play102081027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 102081027
		arg_107_1.duration_ = 7.2

		local var_107_0 = {
			ja = 7.2,
			ko = 3.766,
			zh = 4.433,
			en = 4.2
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
				arg_107_0:Play102081028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1011ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1011ui_story == nil then
				arg_107_1.var_.characterEffect1011ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1011ui_story then
					arg_107_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1011ui_story then
				arg_107_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_110_4 = arg_107_1.actors_["10002_tpose"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect10002_tpose == nil then
				arg_107_1.var_.characterEffect10002_tpose = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.1

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect10002_tpose then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_107_1.var_.characterEffect10002_tpose.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect10002_tpose then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_107_1.var_.characterEffect10002_tpose.fillRatio = var_110_9
			end

			local var_110_10 = arg_107_1.actors_["10002_tpose"].transform
			local var_110_11 = 0

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.var_.moveOldPos10002_tpose = var_110_10.localPosition
			end

			local var_110_12 = 0.001

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_12 then
				local var_110_13 = (arg_107_1.time_ - var_110_11) / var_110_12
				local var_110_14 = Vector3.New(0, 100, 0)

				var_110_10.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10002_tpose, var_110_14, var_110_13)

				local var_110_15 = manager.ui.mainCamera.transform.position - var_110_10.position

				var_110_10.forward = Vector3.New(var_110_15.x, var_110_15.y, var_110_15.z)

				local var_110_16 = var_110_10.localEulerAngles

				var_110_16.z = 0
				var_110_16.x = 0
				var_110_10.localEulerAngles = var_110_16
			end

			if arg_107_1.time_ >= var_110_11 + var_110_12 and arg_107_1.time_ < var_110_11 + var_110_12 + arg_110_0 then
				var_110_10.localPosition = Vector3.New(0, 100, 0)

				local var_110_17 = manager.ui.mainCamera.transform.position - var_110_10.position

				var_110_10.forward = Vector3.New(var_110_17.x, var_110_17.y, var_110_17.z)

				local var_110_18 = var_110_10.localEulerAngles

				var_110_18.z = 0
				var_110_18.x = 0
				var_110_10.localEulerAngles = var_110_18
			end

			local var_110_19 = arg_107_1.actors_["1011ui_story"].transform
			local var_110_20 = 0

			if var_110_20 < arg_107_1.time_ and arg_107_1.time_ <= var_110_20 + arg_110_0 then
				arg_107_1.var_.moveOldPos1011ui_story = var_110_19.localPosition
			end

			local var_110_21 = 0.001

			if var_110_20 <= arg_107_1.time_ and arg_107_1.time_ < var_110_20 + var_110_21 then
				local var_110_22 = (arg_107_1.time_ - var_110_20) / var_110_21
				local var_110_23 = Vector3.New(0, -0.71, -6)

				var_110_19.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1011ui_story, var_110_23, var_110_22)

				local var_110_24 = manager.ui.mainCamera.transform.position - var_110_19.position

				var_110_19.forward = Vector3.New(var_110_24.x, var_110_24.y, var_110_24.z)

				local var_110_25 = var_110_19.localEulerAngles

				var_110_25.z = 0
				var_110_25.x = 0
				var_110_19.localEulerAngles = var_110_25
			end

			if arg_107_1.time_ >= var_110_20 + var_110_21 and arg_107_1.time_ < var_110_20 + var_110_21 + arg_110_0 then
				var_110_19.localPosition = Vector3.New(0, -0.71, -6)

				local var_110_26 = manager.ui.mainCamera.transform.position - var_110_19.position

				var_110_19.forward = Vector3.New(var_110_26.x, var_110_26.y, var_110_26.z)

				local var_110_27 = var_110_19.localEulerAngles

				var_110_27.z = 0
				var_110_27.x = 0
				var_110_19.localEulerAngles = var_110_27
			end

			local var_110_28 = 0

			if var_110_28 < arg_107_1.time_ and arg_107_1.time_ <= var_110_28 + arg_110_0 then
				arg_107_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_110_29 = 0

			if var_110_29 < arg_107_1.time_ and arg_107_1.time_ <= var_110_29 + arg_110_0 then
				arg_107_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_110_30 = 0
			local var_110_31 = 0.4

			if var_110_30 < arg_107_1.time_ and arg_107_1.time_ <= var_110_30 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_32 = arg_107_1:FormatText(StoryNameCfg[37].name)

				arg_107_1.leftNameTxt_.text = var_110_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_33 = arg_107_1:GetWordFromCfg(102081027)
				local var_110_34 = arg_107_1:FormatText(var_110_33.content)

				arg_107_1.text_.text = var_110_34

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_35 = 16
				local var_110_36 = utf8.len(var_110_34)
				local var_110_37 = var_110_35 <= 0 and var_110_31 or var_110_31 * (var_110_36 / var_110_35)

				if var_110_37 > 0 and var_110_31 < var_110_37 then
					arg_107_1.talkMaxDuration = var_110_37

					if var_110_37 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_37 + var_110_30
					end
				end

				arg_107_1.text_.text = var_110_34
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081027", "story_v_out_102081.awb") ~= 0 then
					local var_110_38 = manager.audio:GetVoiceLength("story_v_out_102081", "102081027", "story_v_out_102081.awb") / 1000

					if var_110_38 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_38 + var_110_30
					end

					if var_110_33.prefab_name ~= "" and arg_107_1.actors_[var_110_33.prefab_name] ~= nil then
						local var_110_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_33.prefab_name].transform, "story_v_out_102081", "102081027", "story_v_out_102081.awb")

						arg_107_1:RecordAudio("102081027", var_110_39)
						arg_107_1:RecordAudio("102081027", var_110_39)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_102081", "102081027", "story_v_out_102081.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_102081", "102081027", "story_v_out_102081.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_40 = math.max(var_110_31, arg_107_1.talkMaxDuration)

			if var_110_30 <= arg_107_1.time_ and arg_107_1.time_ < var_110_30 + var_110_40 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_30) / var_110_40

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_30 + var_110_40 and arg_107_1.time_ < var_110_30 + var_110_40 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play102081028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 102081028
		arg_111_1.duration_ = 9.3

		local var_111_0 = {
			ja = 9.3,
			ko = 4.066,
			zh = 4.633,
			en = 3.666
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
				arg_111_0:Play102081029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				local var_114_2 = "play"
				local var_114_3 = "music"

				arg_111_1:AudioAction(var_114_2, var_114_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1")
			end

			local var_114_4 = 0
			local var_114_5 = 1

			if var_114_4 < arg_111_1.time_ and arg_111_1.time_ <= var_114_4 + arg_114_0 then
				local var_114_6 = "play"
				local var_114_7 = "effect"

				arg_111_1:AudioAction(var_114_6, var_114_7, "se_story", "se_story_robot_long", "")
			end

			local var_114_8 = arg_111_1.actors_["1011ui_story"]
			local var_114_9 = 0

			if var_114_9 < arg_111_1.time_ and arg_111_1.time_ <= var_114_9 + arg_114_0 and arg_111_1.var_.characterEffect1011ui_story == nil then
				arg_111_1.var_.characterEffect1011ui_story = var_114_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_10 = 0.1

			if var_114_9 <= arg_111_1.time_ and arg_111_1.time_ < var_114_9 + var_114_10 then
				local var_114_11 = (arg_111_1.time_ - var_114_9) / var_114_10

				if arg_111_1.var_.characterEffect1011ui_story then
					local var_114_12 = Mathf.Lerp(0, 0.5, var_114_11)

					arg_111_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1011ui_story.fillRatio = var_114_12
				end
			end

			if arg_111_1.time_ >= var_114_9 + var_114_10 and arg_111_1.time_ < var_114_9 + var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1011ui_story then
				local var_114_13 = 0.5

				arg_111_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1011ui_story.fillRatio = var_114_13
			end

			local var_114_14 = arg_111_1.actors_["1011ui_story"].transform
			local var_114_15 = 0

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 then
				arg_111_1.var_.moveOldPos1011ui_story = var_114_14.localPosition
			end

			local var_114_16 = 0.001

			if var_114_15 <= arg_111_1.time_ and arg_111_1.time_ < var_114_15 + var_114_16 then
				local var_114_17 = (arg_111_1.time_ - var_114_15) / var_114_16
				local var_114_18 = Vector3.New(0, 100, 0)

				var_114_14.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1011ui_story, var_114_18, var_114_17)

				local var_114_19 = manager.ui.mainCamera.transform.position - var_114_14.position

				var_114_14.forward = Vector3.New(var_114_19.x, var_114_19.y, var_114_19.z)

				local var_114_20 = var_114_14.localEulerAngles

				var_114_20.z = 0
				var_114_20.x = 0
				var_114_14.localEulerAngles = var_114_20
			end

			if arg_111_1.time_ >= var_114_15 + var_114_16 and arg_111_1.time_ < var_114_15 + var_114_16 + arg_114_0 then
				var_114_14.localPosition = Vector3.New(0, 100, 0)

				local var_114_21 = manager.ui.mainCamera.transform.position - var_114_14.position

				var_114_14.forward = Vector3.New(var_114_21.x, var_114_21.y, var_114_21.z)

				local var_114_22 = var_114_14.localEulerAngles

				var_114_22.z = 0
				var_114_22.x = 0
				var_114_14.localEulerAngles = var_114_22
			end

			local var_114_23 = 0
			local var_114_24 = 0.375

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_25 = arg_111_1:FormatText(StoryNameCfg[29].name)

				arg_111_1.leftNameTxt_.text = var_114_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2018")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_26 = arg_111_1:GetWordFromCfg(102081028)
				local var_114_27 = arg_111_1:FormatText(var_114_26.content)

				arg_111_1.text_.text = var_114_27

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_28 = 15
				local var_114_29 = utf8.len(var_114_27)
				local var_114_30 = var_114_28 <= 0 and var_114_24 or var_114_24 * (var_114_29 / var_114_28)

				if var_114_30 > 0 and var_114_24 < var_114_30 then
					arg_111_1.talkMaxDuration = var_114_30

					if var_114_30 + var_114_23 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_30 + var_114_23
					end
				end

				arg_111_1.text_.text = var_114_27
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081028", "story_v_out_102081.awb") ~= 0 then
					local var_114_31 = manager.audio:GetVoiceLength("story_v_out_102081", "102081028", "story_v_out_102081.awb") / 1000

					if var_114_31 + var_114_23 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_31 + var_114_23
					end

					if var_114_26.prefab_name ~= "" and arg_111_1.actors_[var_114_26.prefab_name] ~= nil then
						local var_114_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_26.prefab_name].transform, "story_v_out_102081", "102081028", "story_v_out_102081.awb")

						arg_111_1:RecordAudio("102081028", var_114_32)
						arg_111_1:RecordAudio("102081028", var_114_32)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_102081", "102081028", "story_v_out_102081.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_102081", "102081028", "story_v_out_102081.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_33 = math.max(var_114_24, arg_111_1.talkMaxDuration)

			if var_114_23 <= arg_111_1.time_ and arg_111_1.time_ < var_114_23 + var_114_33 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_23) / var_114_33

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_23 + var_114_33 and arg_111_1.time_ < var_114_23 + var_114_33 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play102081029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 102081029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play102081030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.525

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[7].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(102081029)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 21
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
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_8 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_8 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_8

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_8 and arg_115_1.time_ < var_118_0 + var_118_8 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play102081030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 102081030
		arg_119_1.duration_ = 3.666

		local var_119_0 = {
			ja = 2.9,
			ko = 2.733,
			zh = 2.966,
			en = 3.666
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
				arg_119_0:Play102081031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10002_tpose"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect10002_tpose == nil then
				arg_119_1.var_.characterEffect10002_tpose = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.1

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect10002_tpose then
					arg_119_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect10002_tpose then
				arg_119_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_122_4 = 0

			if var_122_4 < arg_119_1.time_ and arg_119_1.time_ <= var_122_4 + arg_122_0 then
				arg_119_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_122_5 = arg_119_1.actors_["10002_tpose"].transform
			local var_122_6 = 0

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.var_.moveOldPos10002_tpose = var_122_5.localPosition
			end

			local var_122_7 = 0.001

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_7 then
				local var_122_8 = (arg_119_1.time_ - var_122_6) / var_122_7
				local var_122_9 = Vector3.New(0, -1.2, -5.8)

				var_122_5.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10002_tpose, var_122_9, var_122_8)

				local var_122_10 = manager.ui.mainCamera.transform.position - var_122_5.position

				var_122_5.forward = Vector3.New(var_122_10.x, var_122_10.y, var_122_10.z)

				local var_122_11 = var_122_5.localEulerAngles

				var_122_11.z = 0
				var_122_11.x = 0
				var_122_5.localEulerAngles = var_122_11
			end

			if arg_119_1.time_ >= var_122_6 + var_122_7 and arg_119_1.time_ < var_122_6 + var_122_7 + arg_122_0 then
				var_122_5.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_122_12 = manager.ui.mainCamera.transform.position - var_122_5.position

				var_122_5.forward = Vector3.New(var_122_12.x, var_122_12.y, var_122_12.z)

				local var_122_13 = var_122_5.localEulerAngles

				var_122_13.z = 0
				var_122_13.x = 0
				var_122_5.localEulerAngles = var_122_13
			end

			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_122_15 = 0
			local var_122_16 = 0.375

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_17 = arg_119_1:FormatText(StoryNameCfg[39].name)

				arg_119_1.leftNameTxt_.text = var_122_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_18 = arg_119_1:GetWordFromCfg(102081030)
				local var_122_19 = arg_119_1:FormatText(var_122_18.content)

				arg_119_1.text_.text = var_122_19

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_20 = 15
				local var_122_21 = utf8.len(var_122_19)
				local var_122_22 = var_122_20 <= 0 and var_122_16 or var_122_16 * (var_122_21 / var_122_20)

				if var_122_22 > 0 and var_122_16 < var_122_22 then
					arg_119_1.talkMaxDuration = var_122_22

					if var_122_22 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_22 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_19
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081030", "story_v_out_102081.awb") ~= 0 then
					local var_122_23 = manager.audio:GetVoiceLength("story_v_out_102081", "102081030", "story_v_out_102081.awb") / 1000

					if var_122_23 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_15
					end

					if var_122_18.prefab_name ~= "" and arg_119_1.actors_[var_122_18.prefab_name] ~= nil then
						local var_122_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_18.prefab_name].transform, "story_v_out_102081", "102081030", "story_v_out_102081.awb")

						arg_119_1:RecordAudio("102081030", var_122_24)
						arg_119_1:RecordAudio("102081030", var_122_24)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_102081", "102081030", "story_v_out_102081.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_102081", "102081030", "story_v_out_102081.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_25 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_25 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_25

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_25 and arg_119_1.time_ < var_122_15 + var_122_25 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play102081031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 102081031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play102081032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10002_tpose"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect10002_tpose == nil then
				arg_123_1.var_.characterEffect10002_tpose = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.1

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect10002_tpose then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_123_1.var_.characterEffect10002_tpose.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect10002_tpose then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_123_1.var_.characterEffect10002_tpose.fillRatio = var_126_5
			end

			local var_126_6 = arg_123_1.actors_["10002_tpose"].transform
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 then
				arg_123_1.var_.moveOldPos10002_tpose = var_126_6.localPosition
			end

			local var_126_8 = 0.001

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8
				local var_126_10 = Vector3.New(0, 100, 0)

				var_126_6.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10002_tpose, var_126_10, var_126_9)

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
			local var_126_16 = 1.175

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_17 = arg_123_1:GetWordFromCfg(102081031)
				local var_126_18 = arg_123_1:FormatText(var_126_17.content)

				arg_123_1.text_.text = var_126_18

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_19 = 47
				local var_126_20 = utf8.len(var_126_18)
				local var_126_21 = var_126_19 <= 0 and var_126_16 or var_126_16 * (var_126_20 / var_126_19)

				if var_126_21 > 0 and var_126_16 < var_126_21 then
					arg_123_1.talkMaxDuration = var_126_21

					if var_126_21 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_21 + var_126_15
					end
				end

				arg_123_1.text_.text = var_126_18
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_22 = math.max(var_126_16, arg_123_1.talkMaxDuration)

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_22 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_15) / var_126_22

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_15 + var_126_22 and arg_123_1.time_ < var_126_15 + var_126_22 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play102081032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 102081032
		arg_127_1.duration_ = 3.566

		local var_127_0 = {
			ja = 3.033,
			ko = 3.566,
			zh = 2.3,
			en = 3.2
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
				arg_127_0:Play102081033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1084ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story == nil then
				arg_127_1.var_.characterEffect1084ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.1

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1084ui_story then
					arg_127_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story then
				arg_127_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_130_4 = arg_127_1.actors_["1084ui_story"].transform
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 then
				arg_127_1.var_.moveOldPos1084ui_story = var_130_4.localPosition

				local var_130_6 = "1084ui_story"

				arg_127_1:ShowWeapon(arg_127_1.var_[var_130_6 .. "Animator"].transform, false)
			end

			local var_130_7 = 0.001

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_7 then
				local var_130_8 = (arg_127_1.time_ - var_130_5) / var_130_7
				local var_130_9 = Vector3.New(0, -0.97, -6)

				var_130_4.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1084ui_story, var_130_9, var_130_8)

				local var_130_10 = manager.ui.mainCamera.transform.position - var_130_4.position

				var_130_4.forward = Vector3.New(var_130_10.x, var_130_10.y, var_130_10.z)

				local var_130_11 = var_130_4.localEulerAngles

				var_130_11.z = 0
				var_130_11.x = 0
				var_130_4.localEulerAngles = var_130_11
			end

			if arg_127_1.time_ >= var_130_5 + var_130_7 and arg_127_1.time_ < var_130_5 + var_130_7 + arg_130_0 then
				var_130_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_130_12 = manager.ui.mainCamera.transform.position - var_130_4.position

				var_130_4.forward = Vector3.New(var_130_12.x, var_130_12.y, var_130_12.z)

				local var_130_13 = var_130_4.localEulerAngles

				var_130_13.z = 0
				var_130_13.x = 0
				var_130_4.localEulerAngles = var_130_13
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_130_15 = 0

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_130_16 = 0
			local var_130_17 = 0.3

			if var_130_16 < arg_127_1.time_ and arg_127_1.time_ <= var_130_16 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_18 = arg_127_1:FormatText(StoryNameCfg[6].name)

				arg_127_1.leftNameTxt_.text = var_130_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_19 = arg_127_1:GetWordFromCfg(102081032)
				local var_130_20 = arg_127_1:FormatText(var_130_19.content)

				arg_127_1.text_.text = var_130_20

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_21 = 12
				local var_130_22 = utf8.len(var_130_20)
				local var_130_23 = var_130_21 <= 0 and var_130_17 or var_130_17 * (var_130_22 / var_130_21)

				if var_130_23 > 0 and var_130_17 < var_130_23 then
					arg_127_1.talkMaxDuration = var_130_23

					if var_130_23 + var_130_16 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_23 + var_130_16
					end
				end

				arg_127_1.text_.text = var_130_20
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081032", "story_v_out_102081.awb") ~= 0 then
					local var_130_24 = manager.audio:GetVoiceLength("story_v_out_102081", "102081032", "story_v_out_102081.awb") / 1000

					if var_130_24 + var_130_16 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_24 + var_130_16
					end

					if var_130_19.prefab_name ~= "" and arg_127_1.actors_[var_130_19.prefab_name] ~= nil then
						local var_130_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_19.prefab_name].transform, "story_v_out_102081", "102081032", "story_v_out_102081.awb")

						arg_127_1:RecordAudio("102081032", var_130_25)
						arg_127_1:RecordAudio("102081032", var_130_25)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_102081", "102081032", "story_v_out_102081.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_102081", "102081032", "story_v_out_102081.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_26 = math.max(var_130_17, arg_127_1.talkMaxDuration)

			if var_130_16 <= arg_127_1.time_ and arg_127_1.time_ < var_130_16 + var_130_26 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_16) / var_130_26

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_16 + var_130_26 and arg_127_1.time_ < var_130_16 + var_130_26 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play102081033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 102081033
		arg_131_1.duration_ = 9.566

		local var_131_0 = {
			ja = 9.566,
			ko = 4.4,
			zh = 6.233,
			en = 4.366
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
				arg_131_0:Play102081034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				local var_134_2 = "play"
				local var_134_3 = "effect"

				arg_131_1:AudioAction(var_134_2, var_134_3, "se_story", "se_story_robot_long", "")
			end

			local var_134_4 = arg_131_1.actors_["2022_tpose"]
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 and arg_131_1.var_.characterEffect2022_tpose == nil then
				arg_131_1.var_.characterEffect2022_tpose = var_134_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_6 = 0.1

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6

				if arg_131_1.var_.characterEffect2022_tpose then
					arg_131_1.var_.characterEffect2022_tpose.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 and arg_131_1.var_.characterEffect2022_tpose then
				arg_131_1.var_.characterEffect2022_tpose.fillFlat = false
			end

			local var_134_8 = "2021_tpose"

			if arg_131_1.actors_[var_134_8] == nil then
				local var_134_9 = Object.Instantiate(Asset.Load("Char/" .. var_134_8), arg_131_1.stage_.transform)

				var_134_9.name = var_134_8
				var_134_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.actors_[var_134_8] = var_134_9

				local var_134_10 = var_134_9:GetComponentInChildren(typeof(CharacterEffect))

				var_134_10.enabled = true

				local var_134_11 = GameObjectTools.GetOrAddComponent(var_134_9, typeof(DynamicBoneHelper))

				if var_134_11 then
					var_134_11:EnableDynamicBone(false)
				end

				arg_131_1:ShowWeapon(var_134_10.transform, false)

				arg_131_1.var_[var_134_8 .. "Animator"] = var_134_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_131_1.var_[var_134_8 .. "Animator"].applyRootMotion = true
				arg_131_1.var_[var_134_8 .. "LipSync"] = var_134_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_134_12 = arg_131_1.actors_["2021_tpose"]
			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 and arg_131_1.var_.characterEffect2021_tpose == nil then
				arg_131_1.var_.characterEffect2021_tpose = var_134_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_14 = 0.1

			if var_134_13 <= arg_131_1.time_ and arg_131_1.time_ < var_134_13 + var_134_14 then
				local var_134_15 = (arg_131_1.time_ - var_134_13) / var_134_14

				if arg_131_1.var_.characterEffect2021_tpose then
					arg_131_1.var_.characterEffect2021_tpose.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_13 + var_134_14 and arg_131_1.time_ < var_134_13 + var_134_14 + arg_134_0 and arg_131_1.var_.characterEffect2021_tpose then
				arg_131_1.var_.characterEffect2021_tpose.fillFlat = false
			end

			local var_134_16 = arg_131_1.actors_["1084ui_story"]
			local var_134_17 = 0

			if var_134_17 < arg_131_1.time_ and arg_131_1.time_ <= var_134_17 + arg_134_0 and arg_131_1.var_.characterEffect1084ui_story == nil then
				arg_131_1.var_.characterEffect1084ui_story = var_134_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_18 = 0.1

			if var_134_17 <= arg_131_1.time_ and arg_131_1.time_ < var_134_17 + var_134_18 then
				local var_134_19 = (arg_131_1.time_ - var_134_17) / var_134_18

				if arg_131_1.var_.characterEffect1084ui_story then
					local var_134_20 = Mathf.Lerp(0, 0.5, var_134_19)

					arg_131_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1084ui_story.fillRatio = var_134_20
				end
			end

			if arg_131_1.time_ >= var_134_17 + var_134_18 and arg_131_1.time_ < var_134_17 + var_134_18 + arg_134_0 and arg_131_1.var_.characterEffect1084ui_story then
				local var_134_21 = 0.5

				arg_131_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1084ui_story.fillRatio = var_134_21
			end

			local var_134_22 = arg_131_1.actors_["1084ui_story"].transform
			local var_134_23 = 0

			if var_134_23 < arg_131_1.time_ and arg_131_1.time_ <= var_134_23 + arg_134_0 then
				arg_131_1.var_.moveOldPos1084ui_story = var_134_22.localPosition
			end

			local var_134_24 = 0.001

			if var_134_23 <= arg_131_1.time_ and arg_131_1.time_ < var_134_23 + var_134_24 then
				local var_134_25 = (arg_131_1.time_ - var_134_23) / var_134_24
				local var_134_26 = Vector3.New(0, 100, 0)

				var_134_22.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1084ui_story, var_134_26, var_134_25)

				local var_134_27 = manager.ui.mainCamera.transform.position - var_134_22.position

				var_134_22.forward = Vector3.New(var_134_27.x, var_134_27.y, var_134_27.z)

				local var_134_28 = var_134_22.localEulerAngles

				var_134_28.z = 0
				var_134_28.x = 0
				var_134_22.localEulerAngles = var_134_28
			end

			if arg_131_1.time_ >= var_134_23 + var_134_24 and arg_131_1.time_ < var_134_23 + var_134_24 + arg_134_0 then
				var_134_22.localPosition = Vector3.New(0, 100, 0)

				local var_134_29 = manager.ui.mainCamera.transform.position - var_134_22.position

				var_134_22.forward = Vector3.New(var_134_29.x, var_134_29.y, var_134_29.z)

				local var_134_30 = var_134_22.localEulerAngles

				var_134_30.z = 0
				var_134_30.x = 0
				var_134_22.localEulerAngles = var_134_30
			end

			local var_134_31 = arg_131_1.actors_["2021_tpose"].transform
			local var_134_32 = 0

			if var_134_32 < arg_131_1.time_ and arg_131_1.time_ <= var_134_32 + arg_134_0 then
				arg_131_1.var_.moveOldPos2021_tpose = var_134_31.localPosition
			end

			local var_134_33 = 0.001

			if var_134_32 <= arg_131_1.time_ and arg_131_1.time_ < var_134_32 + var_134_33 then
				local var_134_34 = (arg_131_1.time_ - var_134_32) / var_134_33
				local var_134_35 = Vector3.New(-1.92, -0.6, 0.2)

				var_134_31.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos2021_tpose, var_134_35, var_134_34)

				local var_134_36 = manager.ui.mainCamera.transform.position - var_134_31.position

				var_134_31.forward = Vector3.New(var_134_36.x, var_134_36.y, var_134_36.z)

				local var_134_37 = var_134_31.localEulerAngles

				var_134_37.z = 0
				var_134_37.x = 0
				var_134_31.localEulerAngles = var_134_37
			end

			if arg_131_1.time_ >= var_134_32 + var_134_33 and arg_131_1.time_ < var_134_32 + var_134_33 + arg_134_0 then
				var_134_31.localPosition = Vector3.New(-1.92, -0.6, 0.2)

				local var_134_38 = manager.ui.mainCamera.transform.position - var_134_31.position

				var_134_31.forward = Vector3.New(var_134_38.x, var_134_38.y, var_134_38.z)

				local var_134_39 = var_134_31.localEulerAngles

				var_134_39.z = 0
				var_134_39.x = 0
				var_134_31.localEulerAngles = var_134_39
			end

			local var_134_40 = 0

			if var_134_40 < arg_131_1.time_ and arg_131_1.time_ <= var_134_40 + arg_134_0 then
				arg_131_1:PlayTimeline("2021_tpose", "StoryTimeline/CharAction/story2021/story2021action/2021action1_1")
			end

			local var_134_41 = arg_131_1.actors_["2022_tpose"].transform
			local var_134_42 = 0

			if var_134_42 < arg_131_1.time_ and arg_131_1.time_ <= var_134_42 + arg_134_0 then
				arg_131_1.var_.moveOldPos2022_tpose = var_134_41.localPosition
			end

			local var_134_43 = 0.001

			if var_134_42 <= arg_131_1.time_ and arg_131_1.time_ < var_134_42 + var_134_43 then
				local var_134_44 = (arg_131_1.time_ - var_134_42) / var_134_43
				local var_134_45 = Vector3.New(0.7, -0.55, -0.3)

				var_134_41.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos2022_tpose, var_134_45, var_134_44)

				local var_134_46 = manager.ui.mainCamera.transform.position - var_134_41.position

				var_134_41.forward = Vector3.New(var_134_46.x, var_134_46.y, var_134_46.z)

				local var_134_47 = var_134_41.localEulerAngles

				var_134_47.z = 0
				var_134_47.x = 0
				var_134_41.localEulerAngles = var_134_47
			end

			if arg_131_1.time_ >= var_134_42 + var_134_43 and arg_131_1.time_ < var_134_42 + var_134_43 + arg_134_0 then
				var_134_41.localPosition = Vector3.New(0.7, -0.55, -0.3)

				local var_134_48 = manager.ui.mainCamera.transform.position - var_134_41.position

				var_134_41.forward = Vector3.New(var_134_48.x, var_134_48.y, var_134_48.z)

				local var_134_49 = var_134_41.localEulerAngles

				var_134_49.z = 0
				var_134_49.x = 0
				var_134_41.localEulerAngles = var_134_49
			end

			local var_134_50 = 0

			if var_134_50 < arg_131_1.time_ and arg_131_1.time_ <= var_134_50 + arg_134_0 then
				arg_131_1:PlayTimeline("2022_tpose", "StoryTimeline/CharAction/story2022/story2022action/2022action1_1")
			end

			local var_134_51 = 0
			local var_134_52 = 0.45

			if var_134_51 < arg_131_1.time_ and arg_131_1.time_ <= var_134_51 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_53 = arg_131_1:FormatText(StoryNameCfg[29].name)

				arg_131_1.leftNameTxt_.text = var_134_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_54 = arg_131_1:GetWordFromCfg(102081033)
				local var_134_55 = arg_131_1:FormatText(var_134_54.content)

				arg_131_1.text_.text = var_134_55

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_56 = 18
				local var_134_57 = utf8.len(var_134_55)
				local var_134_58 = var_134_56 <= 0 and var_134_52 or var_134_52 * (var_134_57 / var_134_56)

				if var_134_58 > 0 and var_134_52 < var_134_58 then
					arg_131_1.talkMaxDuration = var_134_58

					if var_134_58 + var_134_51 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_58 + var_134_51
					end
				end

				arg_131_1.text_.text = var_134_55
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081033", "story_v_out_102081.awb") ~= 0 then
					local var_134_59 = manager.audio:GetVoiceLength("story_v_out_102081", "102081033", "story_v_out_102081.awb") / 1000

					if var_134_59 + var_134_51 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_59 + var_134_51
					end

					if var_134_54.prefab_name ~= "" and arg_131_1.actors_[var_134_54.prefab_name] ~= nil then
						local var_134_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_54.prefab_name].transform, "story_v_out_102081", "102081033", "story_v_out_102081.awb")

						arg_131_1:RecordAudio("102081033", var_134_60)
						arg_131_1:RecordAudio("102081033", var_134_60)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_102081", "102081033", "story_v_out_102081.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_102081", "102081033", "story_v_out_102081.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_61 = math.max(var_134_52, arg_131_1.talkMaxDuration)

			if var_134_51 <= arg_131_1.time_ and arg_131_1.time_ < var_134_51 + var_134_61 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_51) / var_134_61

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_51 + var_134_61 and arg_131_1.time_ < var_134_51 + var_134_61 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play102081034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 102081034
		arg_135_1.duration_ = 3.533

		local var_135_0 = {
			ja = 3.466,
			ko = 3.133,
			zh = 3.433,
			en = 3.533
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
				arg_135_0:Play102081035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1019ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1019ui_story == nil then
				arg_135_1.var_.characterEffect1019ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.1

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1019ui_story then
					arg_135_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1019ui_story then
				arg_135_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_138_4 = arg_135_1.actors_["2022_tpose"]
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 and arg_135_1.var_.characterEffect2022_tpose == nil then
				arg_135_1.var_.characterEffect2022_tpose = var_138_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_6 = 0.1

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6

				if arg_135_1.var_.characterEffect2022_tpose then
					local var_138_8 = Mathf.Lerp(0, 0.5, var_138_7)

					arg_135_1.var_.characterEffect2022_tpose.fillFlat = true
					arg_135_1.var_.characterEffect2022_tpose.fillRatio = var_138_8
				end
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect2022_tpose then
				local var_138_9 = 0.5

				arg_135_1.var_.characterEffect2022_tpose.fillFlat = true
				arg_135_1.var_.characterEffect2022_tpose.fillRatio = var_138_9
			end

			local var_138_10 = arg_135_1.actors_["2021_tpose"]
			local var_138_11 = 0

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect2021_tpose == nil then
				arg_135_1.var_.characterEffect2021_tpose = var_138_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_12 = 0.1

			if var_138_11 <= arg_135_1.time_ and arg_135_1.time_ < var_138_11 + var_138_12 then
				local var_138_13 = (arg_135_1.time_ - var_138_11) / var_138_12

				if arg_135_1.var_.characterEffect2021_tpose then
					local var_138_14 = Mathf.Lerp(0, 0.5, var_138_13)

					arg_135_1.var_.characterEffect2021_tpose.fillFlat = true
					arg_135_1.var_.characterEffect2021_tpose.fillRatio = var_138_14
				end
			end

			if arg_135_1.time_ >= var_138_11 + var_138_12 and arg_135_1.time_ < var_138_11 + var_138_12 + arg_138_0 and arg_135_1.var_.characterEffect2021_tpose then
				local var_138_15 = 0.5

				arg_135_1.var_.characterEffect2021_tpose.fillFlat = true
				arg_135_1.var_.characterEffect2021_tpose.fillRatio = var_138_15
			end

			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				arg_135_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_138_17 = 0
			local var_138_18 = 0.45

			if var_138_17 < arg_135_1.time_ and arg_135_1.time_ <= var_138_17 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_19 = arg_135_1:FormatText(StoryNameCfg[13].name)

				arg_135_1.leftNameTxt_.text = var_138_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, true)
				arg_135_1.iconController_:SetSelectedState("hero")

				arg_135_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_20 = arg_135_1:GetWordFromCfg(102081034)
				local var_138_21 = arg_135_1:FormatText(var_138_20.content)

				arg_135_1.text_.text = var_138_21

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_22 = 18
				local var_138_23 = utf8.len(var_138_21)
				local var_138_24 = var_138_22 <= 0 and var_138_18 or var_138_18 * (var_138_23 / var_138_22)

				if var_138_24 > 0 and var_138_18 < var_138_24 then
					arg_135_1.talkMaxDuration = var_138_24

					if var_138_24 + var_138_17 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_24 + var_138_17
					end
				end

				arg_135_1.text_.text = var_138_21
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081034", "story_v_out_102081.awb") ~= 0 then
					local var_138_25 = manager.audio:GetVoiceLength("story_v_out_102081", "102081034", "story_v_out_102081.awb") / 1000

					if var_138_25 + var_138_17 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_25 + var_138_17
					end

					if var_138_20.prefab_name ~= "" and arg_135_1.actors_[var_138_20.prefab_name] ~= nil then
						local var_138_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_20.prefab_name].transform, "story_v_out_102081", "102081034", "story_v_out_102081.awb")

						arg_135_1:RecordAudio("102081034", var_138_26)
						arg_135_1:RecordAudio("102081034", var_138_26)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_102081", "102081034", "story_v_out_102081.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_102081", "102081034", "story_v_out_102081.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_27 = math.max(var_138_18, arg_135_1.talkMaxDuration)

			if var_138_17 <= arg_135_1.time_ and arg_135_1.time_ < var_138_17 + var_138_27 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_17) / var_138_27

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_17 + var_138_27 and arg_135_1.time_ < var_138_17 + var_138_27 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play102081035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 102081035
		arg_139_1.duration_ = 6

		local var_139_0 = {
			ja = 3.566,
			ko = 4,
			zh = 6,
			en = 3.433
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
			arg_139_1.auto_ = false
		end

		function arg_139_1.playNext_(arg_141_0)
			arg_139_1.onStoryFinished_()
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10002_tpose"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect10002_tpose == nil then
				arg_139_1.var_.characterEffect10002_tpose = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.1

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect10002_tpose then
					arg_139_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect10002_tpose then
				arg_139_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["2021_tpose"].transform
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 then
				arg_139_1.var_.moveOldPos2021_tpose = var_142_4.localPosition
			end

			local var_142_6 = 0.001

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6
				local var_142_8 = Vector3.New(10, -0.6, 0.2)

				var_142_4.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos2021_tpose, var_142_8, var_142_7)

				local var_142_9 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_9.x, var_142_9.y, var_142_9.z)

				local var_142_10 = var_142_4.localEulerAngles

				var_142_10.z = 0
				var_142_10.x = 0
				var_142_4.localEulerAngles = var_142_10
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 then
				var_142_4.localPosition = Vector3.New(10, -0.6, 0.2)

				local var_142_11 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_11.x, var_142_11.y, var_142_11.z)

				local var_142_12 = var_142_4.localEulerAngles

				var_142_12.z = 0
				var_142_12.x = 0
				var_142_4.localEulerAngles = var_142_12
			end

			local var_142_13 = arg_139_1.actors_["2022_tpose"].transform
			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1.var_.moveOldPos2022_tpose = var_142_13.localPosition
			end

			local var_142_15 = 0.001

			if var_142_14 <= arg_139_1.time_ and arg_139_1.time_ < var_142_14 + var_142_15 then
				local var_142_16 = (arg_139_1.time_ - var_142_14) / var_142_15
				local var_142_17 = Vector3.New(0, 100, 0)

				var_142_13.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos2022_tpose, var_142_17, var_142_16)

				local var_142_18 = manager.ui.mainCamera.transform.position - var_142_13.position

				var_142_13.forward = Vector3.New(var_142_18.x, var_142_18.y, var_142_18.z)

				local var_142_19 = var_142_13.localEulerAngles

				var_142_19.z = 0
				var_142_19.x = 0
				var_142_13.localEulerAngles = var_142_19
			end

			if arg_139_1.time_ >= var_142_14 + var_142_15 and arg_139_1.time_ < var_142_14 + var_142_15 + arg_142_0 then
				var_142_13.localPosition = Vector3.New(0, 100, 0)

				local var_142_20 = manager.ui.mainCamera.transform.position - var_142_13.position

				var_142_13.forward = Vector3.New(var_142_20.x, var_142_20.y, var_142_20.z)

				local var_142_21 = var_142_13.localEulerAngles

				var_142_21.z = 0
				var_142_21.x = 0
				var_142_13.localEulerAngles = var_142_21
			end

			local var_142_22 = arg_139_1.actors_["10002_tpose"].transform
			local var_142_23 = 0

			if var_142_23 < arg_139_1.time_ and arg_139_1.time_ <= var_142_23 + arg_142_0 then
				arg_139_1.var_.moveOldPos10002_tpose = var_142_22.localPosition
			end

			local var_142_24 = 0.001

			if var_142_23 <= arg_139_1.time_ and arg_139_1.time_ < var_142_23 + var_142_24 then
				local var_142_25 = (arg_139_1.time_ - var_142_23) / var_142_24
				local var_142_26 = Vector3.New(0, -1.2, -5.8)

				var_142_22.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10002_tpose, var_142_26, var_142_25)

				local var_142_27 = manager.ui.mainCamera.transform.position - var_142_22.position

				var_142_22.forward = Vector3.New(var_142_27.x, var_142_27.y, var_142_27.z)

				local var_142_28 = var_142_22.localEulerAngles

				var_142_28.z = 0
				var_142_28.x = 0
				var_142_22.localEulerAngles = var_142_28
			end

			if arg_139_1.time_ >= var_142_23 + var_142_24 and arg_139_1.time_ < var_142_23 + var_142_24 + arg_142_0 then
				var_142_22.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_142_29 = manager.ui.mainCamera.transform.position - var_142_22.position

				var_142_22.forward = Vector3.New(var_142_29.x, var_142_29.y, var_142_29.z)

				local var_142_30 = var_142_22.localEulerAngles

				var_142_30.z = 0
				var_142_30.x = 0
				var_142_22.localEulerAngles = var_142_30
			end

			local var_142_31 = 0

			if var_142_31 < arg_139_1.time_ and arg_139_1.time_ <= var_142_31 + arg_142_0 then
				arg_139_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_142_32 = 0

			if var_142_32 < arg_139_1.time_ and arg_139_1.time_ <= var_142_32 + arg_142_0 then
				arg_139_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_142_33 = 0
			local var_142_34 = 0.475

			if var_142_33 < arg_139_1.time_ and arg_139_1.time_ <= var_142_33 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_35 = arg_139_1:FormatText(StoryNameCfg[39].name)

				arg_139_1.leftNameTxt_.text = var_142_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_36 = arg_139_1:GetWordFromCfg(102081035)
				local var_142_37 = arg_139_1:FormatText(var_142_36.content)

				arg_139_1.text_.text = var_142_37

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_38 = 19
				local var_142_39 = utf8.len(var_142_37)
				local var_142_40 = var_142_38 <= 0 and var_142_34 or var_142_34 * (var_142_39 / var_142_38)

				if var_142_40 > 0 and var_142_34 < var_142_40 then
					arg_139_1.talkMaxDuration = var_142_40

					if var_142_40 + var_142_33 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_40 + var_142_33
					end
				end

				arg_139_1.text_.text = var_142_37
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_102081", "102081035", "story_v_out_102081.awb") ~= 0 then
					local var_142_41 = manager.audio:GetVoiceLength("story_v_out_102081", "102081035", "story_v_out_102081.awb") / 1000

					if var_142_41 + var_142_33 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_41 + var_142_33
					end

					if var_142_36.prefab_name ~= "" and arg_139_1.actors_[var_142_36.prefab_name] ~= nil then
						local var_142_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_36.prefab_name].transform, "story_v_out_102081", "102081035", "story_v_out_102081.awb")

						arg_139_1:RecordAudio("102081035", var_142_42)
						arg_139_1:RecordAudio("102081035", var_142_42)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_102081", "102081035", "story_v_out_102081.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_102081", "102081035", "story_v_out_102081.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_43 = math.max(var_142_34, arg_139_1.talkMaxDuration)

			if var_142_33 <= arg_139_1.time_ and arg_139_1.time_ < var_142_33 + var_142_43 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_33) / var_142_43

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_33 + var_142_43 and arg_139_1.time_ < var_142_33 + var_142_43 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B02c"
	},
	voices = {
		"story_v_out_102081.awb"
	}
}
