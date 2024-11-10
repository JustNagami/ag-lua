return {
	Play107112001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 107112001
		arg_1_1.duration_ = 7.2

		local var_1_0 = {
			ja = 5.433,
			ko = 5.666,
			zh = 5.6,
			en = 7.2
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
				arg_1_0:Play107112002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "3007_tpose"

			if arg_1_1.actors_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(Asset.Load("Char/" .. var_4_0), arg_1_1.stage_.transform)

				var_4_1.name = var_4_0
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_0] = var_4_1

				local var_4_2 = var_4_1:GetComponentInChildren(typeof(CharacterEffect))

				var_4_2.enabled = true

				local var_4_3 = GameObjectTools.GetOrAddComponent(var_4_1, typeof(DynamicBoneHelper))

				if var_4_3 then
					var_4_3:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_2.transform, false)

				arg_1_1.var_[var_4_0 .. "Animator"] = var_4_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_0 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_0 .. "LipSync"] = var_4_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_4 = arg_1_1.actors_["3007_tpose"]
			local var_4_5 = 0.967

			if var_4_5 < arg_1_1.time_ and arg_1_1.time_ <= var_4_5 + arg_4_0 and arg_1_1.var_.characterEffect3007_tpose == nil then
				arg_1_1.var_.characterEffect3007_tpose = var_4_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_6 = 0.0329999999999998

			if var_4_5 <= arg_1_1.time_ and arg_1_1.time_ < var_4_5 + var_4_6 then
				local var_4_7 = (arg_1_1.time_ - var_4_5) / var_4_6

				if arg_1_1.var_.characterEffect3007_tpose then
					local var_4_8 = Mathf.Lerp(0, 0.5, var_4_7)

					arg_1_1.var_.characterEffect3007_tpose.fillFlat = true
					arg_1_1.var_.characterEffect3007_tpose.fillRatio = var_4_8
				end
			end

			if arg_1_1.time_ >= var_4_5 + var_4_6 and arg_1_1.time_ < var_4_5 + var_4_6 + arg_4_0 and arg_1_1.var_.characterEffect3007_tpose then
				local var_4_9 = 0.5

				arg_1_1.var_.characterEffect3007_tpose.fillFlat = true
				arg_1_1.var_.characterEffect3007_tpose.fillRatio = var_4_9
			end

			local var_4_10 = "C03a"

			if arg_1_1.bgs_[var_4_10] == nil then
				local var_4_11 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_11:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_10)
				var_4_11.name = var_4_10
				var_4_11.transform.parent = arg_1_1.stage_.transform
				var_4_11.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_10] = var_4_11
			end

			local var_4_12 = 0

			if var_4_12 < arg_1_1.time_ and arg_1_1.time_ <= var_4_12 + arg_4_0 then
				local var_4_13 = manager.ui.mainCamera.transform.localPosition
				local var_4_14 = Vector3.New(0, 0, 10) + Vector3.New(var_4_13.x, var_4_13.y, 0)
				local var_4_15 = arg_1_1.bgs_.C03a

				var_4_15.transform.localPosition = var_4_14
				var_4_15.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_16 = var_4_15:GetComponent("SpriteRenderer")

				if var_4_16 and var_4_16.sprite then
					local var_4_17 = (var_4_15.transform.localPosition - var_4_13).z
					local var_4_18 = manager.ui.mainCameraCom_
					local var_4_19 = 2 * var_4_17 * Mathf.Tan(var_4_18.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_20 = var_4_19 * var_4_18.aspect
					local var_4_21 = var_4_16.sprite.bounds.size.x
					local var_4_22 = var_4_16.sprite.bounds.size.y
					local var_4_23 = var_4_20 / var_4_21
					local var_4_24 = var_4_19 / var_4_22
					local var_4_25 = var_4_24 < var_4_23 and var_4_23 or var_4_24

					var_4_15.transform.localScale = Vector3.New(var_4_25, var_4_25, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "C03a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_26 = arg_1_1.actors_["3007_tpose"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos3007_tpose = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, 100, 0)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos3007_tpose, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, 100, 0)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = 1.8

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				arg_1_1:PlayTimeline("3007_tpose", "StoryTimeline/CharAction/story3007/story3007action/3007action1_1")
			end

			local var_4_36 = 0
			local var_4_37 = 1

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "music"

				arg_1_1:AudioAction(var_4_38, var_4_39, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_40 = arg_1_1.bgs_.C03a
			local var_4_41 = 0

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_42 = var_4_40:GetComponent("SpriteRenderer")

				if var_4_42 then
					var_4_42.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_43 = var_4_42.material
					local var_4_44 = var_4_43:GetColor("_Color")

					arg_1_1.var_.alphaOldValueC03a = var_4_44.a
					arg_1_1.var_.alphaMatValueC03a = var_4_43
				end

				arg_1_1.var_.alphaOldValueC03a = 0
			end

			local var_4_45 = 1.5

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_45 then
				local var_4_46 = (arg_1_1.time_ - var_4_41) / var_4_45
				local var_4_47 = Mathf.Lerp(arg_1_1.var_.alphaOldValueC03a, 1, var_4_46)

				if arg_1_1.var_.alphaMatValueC03a then
					local var_4_48 = arg_1_1.var_.alphaMatValueC03a
					local var_4_49 = var_4_48:GetColor("_Color")

					var_4_49.a = var_4_47

					var_4_48:SetColor("_Color", var_4_49)
				end
			end

			if arg_1_1.time_ >= var_4_41 + var_4_45 and arg_1_1.time_ < var_4_41 + var_4_45 + arg_4_0 and arg_1_1.var_.alphaMatValueC03a then
				local var_4_50 = arg_1_1.var_.alphaMatValueC03a
				local var_4_51 = var_4_50:GetColor("_Color")

				var_4_51.a = 1

				var_4_50:SetColor("_Color", var_4_51)
			end

			local var_4_52 = 0

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_53 = 2

			if arg_1_1.time_ >= var_4_52 + var_4_53 and arg_1_1.time_ < var_4_52 + var_4_53 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_54 = 2
			local var_4_55 = 0.35

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_56 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_56:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_57 = arg_1_1:FormatText(StoryNameCfg[94].name)

				arg_1_1.leftNameTxt_.text = var_4_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_58 = arg_1_1:GetWordFromCfg(107112001)
				local var_4_59 = arg_1_1:FormatText(var_4_58.content)

				arg_1_1.text_.text = var_4_59

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_60 = 14
				local var_4_61 = utf8.len(var_4_59)
				local var_4_62 = var_4_60 <= 0 and var_4_55 or var_4_55 * (var_4_61 / var_4_60)

				if var_4_62 > 0 and var_4_55 < var_4_62 then
					arg_1_1.talkMaxDuration = var_4_62
					var_4_54 = var_4_54 + 0.3

					if var_4_62 + var_4_54 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_54
					end
				end

				arg_1_1.text_.text = var_4_59
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112001", "story_v_out_107112.awb") ~= 0 then
					local var_4_63 = manager.audio:GetVoiceLength("story_v_out_107112", "107112001", "story_v_out_107112.awb") / 1000

					if var_4_63 + var_4_54 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_63 + var_4_54
					end

					if var_4_58.prefab_name ~= "" and arg_1_1.actors_[var_4_58.prefab_name] ~= nil then
						local var_4_64 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_58.prefab_name].transform, "story_v_out_107112", "107112001", "story_v_out_107112.awb")

						arg_1_1:RecordAudio("107112001", var_4_64)
						arg_1_1:RecordAudio("107112001", var_4_64)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_107112", "107112001", "story_v_out_107112.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_107112", "107112001", "story_v_out_107112.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_65 = var_4_54 + 0.3
			local var_4_66 = math.max(var_4_55, arg_1_1.talkMaxDuration)

			if var_4_65 <= arg_1_1.time_ and arg_1_1.time_ < var_4_65 + var_4_66 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_65) / var_4_66

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_65 + var_4_66 and arg_1_1.time_ < var_4_65 + var_4_66 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play107112002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 107112002
		arg_7_1.duration_ = 1.666

		local var_7_0 = {
			ja = 1.2,
			ko = 1.666,
			zh = 1.2,
			en = 1.1
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
				arg_7_0:Play107112003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.15

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[99].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10012")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(107112002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 6
				local var_10_6 = utf8.len(var_10_4)
				local var_10_7 = var_10_5 <= 0 and var_10_1 or var_10_1 * (var_10_6 / var_10_5)

				if var_10_7 > 0 and var_10_1 < var_10_7 then
					arg_7_1.talkMaxDuration = var_10_7

					if var_10_7 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_7 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_4
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112002", "story_v_out_107112.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112002", "story_v_out_107112.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_107112", "107112002", "story_v_out_107112.awb")

						arg_7_1:RecordAudio("107112002", var_10_9)
						arg_7_1:RecordAudio("107112002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_107112", "107112002", "story_v_out_107112.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_107112", "107112002", "story_v_out_107112.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_10 and arg_7_1.time_ < var_10_0 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play107112003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 107112003
		arg_11_1.duration_ = 4.9

		local var_11_0 = {
			ja = 4.9,
			ko = 3.466,
			zh = 4.233,
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
				arg_11_0:Play107112004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.bgs_.C03a
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				local var_14_2 = var_14_0:GetComponent("SpriteRenderer")

				if var_14_2 then
					var_14_2.material = arg_11_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_14_3 = var_14_2.material
					local var_14_4 = var_14_3:GetColor("_Color")

					arg_11_1.var_.alphaOldValueC03a = var_14_4.a
					arg_11_1.var_.alphaMatValueC03a = var_14_3
				end

				arg_11_1.var_.alphaOldValueC03a = 1
			end

			local var_14_5 = 1.5

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_5 then
				local var_14_6 = (arg_11_1.time_ - var_14_1) / var_14_5
				local var_14_7 = Mathf.Lerp(arg_11_1.var_.alphaOldValueC03a, 0, var_14_6)

				if arg_11_1.var_.alphaMatValueC03a then
					local var_14_8 = arg_11_1.var_.alphaMatValueC03a
					local var_14_9 = var_14_8:GetColor("_Color")

					var_14_9.a = var_14_7

					var_14_8:SetColor("_Color", var_14_9)
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_5 and arg_11_1.time_ < var_14_1 + var_14_5 + arg_14_0 and arg_11_1.var_.alphaMatValueC03a then
				local var_14_10 = arg_11_1.var_.alphaMatValueC03a
				local var_14_11 = var_14_10:GetColor("_Color")

				var_14_11.a = 0

				var_14_10:SetColor("_Color", var_14_11)
			end

			local var_14_12 = "S0704"

			if arg_11_1.bgs_[var_14_12] == nil then
				local var_14_13 = Object.Instantiate(arg_11_1.paintGo_)

				var_14_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_14_12)
				var_14_13.name = var_14_12
				var_14_13.transform.parent = arg_11_1.stage_.transform
				var_14_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.bgs_[var_14_12] = var_14_13
			end

			local var_14_14 = arg_11_1.bgs_.S0704
			local var_14_15 = 1.5

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				local var_14_16 = var_14_14:GetComponent("SpriteRenderer")

				if var_14_16 then
					var_14_16.material = arg_11_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_14_17 = var_14_16.material
					local var_14_18 = var_14_17:GetColor("_Color")

					arg_11_1.var_.alphaOldValueS0704 = var_14_18.a
					arg_11_1.var_.alphaMatValueS0704 = var_14_17
				end

				arg_11_1.var_.alphaOldValueS0704 = 0
			end

			local var_14_19 = 1.5

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_19 then
				local var_14_20 = (arg_11_1.time_ - var_14_15) / var_14_19
				local var_14_21 = Mathf.Lerp(arg_11_1.var_.alphaOldValueS0704, 1, var_14_20)

				if arg_11_1.var_.alphaMatValueS0704 then
					local var_14_22 = arg_11_1.var_.alphaMatValueS0704
					local var_14_23 = var_14_22:GetColor("_Color")

					var_14_23.a = var_14_21

					var_14_22:SetColor("_Color", var_14_23)
				end
			end

			if arg_11_1.time_ >= var_14_15 + var_14_19 and arg_11_1.time_ < var_14_15 + var_14_19 + arg_14_0 and arg_11_1.var_.alphaMatValueS0704 then
				local var_14_24 = arg_11_1.var_.alphaMatValueS0704
				local var_14_25 = var_14_24:GetColor("_Color")

				var_14_25.a = 1

				var_14_24:SetColor("_Color", var_14_25)
			end

			local var_14_26 = arg_11_1.actors_["3007_tpose"].transform
			local var_14_27 = 0

			if var_14_27 < arg_11_1.time_ and arg_11_1.time_ <= var_14_27 + arg_14_0 then
				arg_11_1.var_.moveOldPos3007_tpose = var_14_26.localPosition
			end

			local var_14_28 = 0.001

			if var_14_27 <= arg_11_1.time_ and arg_11_1.time_ < var_14_27 + var_14_28 then
				local var_14_29 = (arg_11_1.time_ - var_14_27) / var_14_28
				local var_14_30 = Vector3.New(0, 100, 0)

				var_14_26.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos3007_tpose, var_14_30, var_14_29)

				local var_14_31 = manager.ui.mainCamera.transform.position - var_14_26.position

				var_14_26.forward = Vector3.New(var_14_31.x, var_14_31.y, var_14_31.z)

				local var_14_32 = var_14_26.localEulerAngles

				var_14_32.z = 0
				var_14_32.x = 0
				var_14_26.localEulerAngles = var_14_32
			end

			if arg_11_1.time_ >= var_14_27 + var_14_28 and arg_11_1.time_ < var_14_27 + var_14_28 + arg_14_0 then
				var_14_26.localPosition = Vector3.New(0, 100, 0)

				local var_14_33 = manager.ui.mainCamera.transform.position - var_14_26.position

				var_14_26.forward = Vector3.New(var_14_33.x, var_14_33.y, var_14_33.z)

				local var_14_34 = var_14_26.localEulerAngles

				var_14_34.z = 0
				var_14_34.x = 0
				var_14_26.localEulerAngles = var_14_34
			end

			local var_14_35 = 1.5

			if var_14_35 < arg_11_1.time_ and arg_11_1.time_ <= var_14_35 + arg_14_0 then
				local var_14_36 = manager.ui.mainCamera.transform.localPosition
				local var_14_37 = Vector3.New(0, 0, 10) + Vector3.New(var_14_36.x, var_14_36.y, 0)
				local var_14_38 = arg_11_1.bgs_.S0704

				var_14_38.transform.localPosition = var_14_37
				var_14_38.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_14_39 = var_14_38:GetComponent("SpriteRenderer")

				if var_14_39 and var_14_39.sprite then
					local var_14_40 = (var_14_38.transform.localPosition - var_14_36).z
					local var_14_41 = manager.ui.mainCameraCom_
					local var_14_42 = 2 * var_14_40 * Mathf.Tan(var_14_41.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_14_43 = var_14_42 * var_14_41.aspect
					local var_14_44 = var_14_39.sprite.bounds.size.x
					local var_14_45 = var_14_39.sprite.bounds.size.y
					local var_14_46 = var_14_43 / var_14_44
					local var_14_47 = var_14_42 / var_14_45
					local var_14_48 = var_14_47 < var_14_46 and var_14_46 or var_14_47

					var_14_38.transform.localScale = Vector3.New(var_14_48, var_14_48, 0)
				end

				for iter_14_0, iter_14_1 in pairs(arg_11_1.bgs_) do
					if iter_14_0 ~= "S0704" then
						iter_14_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_14_49 = 0

			if var_14_49 < arg_11_1.time_ and arg_11_1.time_ <= var_14_49 + arg_14_0 then
				arg_11_1.allBtn_.enabled = false
			end

			local var_14_50 = 2

			if arg_11_1.time_ >= var_14_49 + var_14_50 and arg_11_1.time_ < var_14_49 + var_14_50 + arg_14_0 then
				arg_11_1.allBtn_.enabled = true
			end

			local var_14_51 = "1038ui_story"

			if arg_11_1.actors_[var_14_51] == nil then
				local var_14_52 = Object.Instantiate(Asset.Load("Char/" .. var_14_51), arg_11_1.stage_.transform)

				var_14_52.name = var_14_51
				var_14_52.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_51] = var_14_52

				local var_14_53 = var_14_52:GetComponentInChildren(typeof(CharacterEffect))

				var_14_53.enabled = true

				local var_14_54 = GameObjectTools.GetOrAddComponent(var_14_52, typeof(DynamicBoneHelper))

				if var_14_54 then
					var_14_54:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_53.transform, false)

				arg_11_1.var_[var_14_51 .. "Animator"] = var_14_53.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_51 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_51 .. "LipSync"] = var_14_53.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_55 = 0

			if var_14_55 < arg_11_1.time_ and arg_11_1.time_ <= var_14_55 + arg_14_0 then
				arg_11_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			if arg_11_1.frameCnt_ <= 1 then
				arg_11_1.dialog_:SetActive(false)
			end

			local var_14_56 = 2
			local var_14_57 = 0.175

			if var_14_56 < arg_11_1.time_ and arg_11_1.time_ <= var_14_56 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_58 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_58:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_59 = arg_11_1:FormatText(StoryNameCfg[94].name)

				arg_11_1.leftNameTxt_.text = var_14_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_60 = arg_11_1:GetWordFromCfg(107112003)
				local var_14_61 = arg_11_1:FormatText(var_14_60.content)

				arg_11_1.text_.text = var_14_61

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_62 = 7
				local var_14_63 = utf8.len(var_14_61)
				local var_14_64 = var_14_62 <= 0 and var_14_57 or var_14_57 * (var_14_63 / var_14_62)

				if var_14_64 > 0 and var_14_57 < var_14_64 then
					arg_11_1.talkMaxDuration = var_14_64
					var_14_56 = var_14_56 + 0.3

					if var_14_64 + var_14_56 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_64 + var_14_56
					end
				end

				arg_11_1.text_.text = var_14_61
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112003", "story_v_out_107112.awb") ~= 0 then
					local var_14_65 = manager.audio:GetVoiceLength("story_v_out_107112", "107112003", "story_v_out_107112.awb") / 1000

					if var_14_65 + var_14_56 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_65 + var_14_56
					end

					if var_14_60.prefab_name ~= "" and arg_11_1.actors_[var_14_60.prefab_name] ~= nil then
						local var_14_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_60.prefab_name].transform, "story_v_out_107112", "107112003", "story_v_out_107112.awb")

						arg_11_1:RecordAudio("107112003", var_14_66)
						arg_11_1:RecordAudio("107112003", var_14_66)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_107112", "107112003", "story_v_out_107112.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_107112", "107112003", "story_v_out_107112.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_67 = var_14_56 + 0.3
			local var_14_68 = math.max(var_14_57, arg_11_1.talkMaxDuration)

			if var_14_67 <= arg_11_1.time_ and arg_11_1.time_ < var_14_67 + var_14_68 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_67) / var_14_68

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_67 + var_14_68 and arg_11_1.time_ < var_14_67 + var_14_68 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play107112004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 107112004
		arg_17_1.duration_ = 4.6

		local var_17_0 = {
			ja = 4,
			ko = 2,
			zh = 4.6,
			en = 4.233
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
				arg_17_0:Play107112005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.1

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_2 = arg_17_1:FormatText(StoryNameCfg[98].name)

				arg_17_1.leftNameTxt_.text = var_20_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3007")

				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_3 = arg_17_1:GetWordFromCfg(107112004)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 4
				local var_20_6 = utf8.len(var_20_4)
				local var_20_7 = var_20_5 <= 0 and var_20_1 or var_20_1 * (var_20_6 / var_20_5)

				if var_20_7 > 0 and var_20_1 < var_20_7 then
					arg_17_1.talkMaxDuration = var_20_7

					if var_20_7 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_7 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_4
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112004", "story_v_out_107112.awb") ~= 0 then
					local var_20_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112004", "story_v_out_107112.awb") / 1000

					if var_20_8 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_8 + var_20_0
					end

					if var_20_3.prefab_name ~= "" and arg_17_1.actors_[var_20_3.prefab_name] ~= nil then
						local var_20_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_3.prefab_name].transform, "story_v_out_107112", "107112004", "story_v_out_107112.awb")

						arg_17_1:RecordAudio("107112004", var_20_9)
						arg_17_1:RecordAudio("107112004", var_20_9)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_107112", "107112004", "story_v_out_107112.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_107112", "107112004", "story_v_out_107112.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_10 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_10 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_10

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_10 and arg_17_1.time_ < var_20_0 + var_20_10 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play107112005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 107112005
		arg_21_1.duration_ = 5.9

		local var_21_0 = {
			ja = 5.9,
			ko = 5.333,
			zh = 4.2,
			en = 5.066
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
				arg_21_0:Play107112006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.475

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[99].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10012")

				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_3 = arg_21_1:GetWordFromCfg(107112005)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 19
				local var_24_6 = utf8.len(var_24_4)
				local var_24_7 = var_24_5 <= 0 and var_24_1 or var_24_1 * (var_24_6 / var_24_5)

				if var_24_7 > 0 and var_24_1 < var_24_7 then
					arg_21_1.talkMaxDuration = var_24_7

					if var_24_7 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_7 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_4
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112005", "story_v_out_107112.awb") ~= 0 then
					local var_24_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112005", "story_v_out_107112.awb") / 1000

					if var_24_8 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_8 + var_24_0
					end

					if var_24_3.prefab_name ~= "" and arg_21_1.actors_[var_24_3.prefab_name] ~= nil then
						local var_24_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_3.prefab_name].transform, "story_v_out_107112", "107112005", "story_v_out_107112.awb")

						arg_21_1:RecordAudio("107112005", var_24_9)
						arg_21_1:RecordAudio("107112005", var_24_9)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_107112", "107112005", "story_v_out_107112.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_107112", "107112005", "story_v_out_107112.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_10 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_10 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_10

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_10 and arg_21_1.time_ < var_24_0 + var_24_10 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play107112006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 107112006
		arg_25_1.duration_ = 5.033

		local var_25_0 = {
			ja = 3.9,
			ko = 3.3,
			zh = 4.9,
			en = 5.033
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
				arg_25_0:Play107112007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["3007_tpose"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.characterEffect3007_tpose == nil then
				arg_25_1.var_.characterEffect3007_tpose = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.1

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect3007_tpose then
					arg_25_1.var_.characterEffect3007_tpose.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.characterEffect3007_tpose then
				arg_25_1.var_.characterEffect3007_tpose.fillFlat = false
			end

			local var_28_4 = 0
			local var_28_5 = 0.15

			if var_28_4 < arg_25_1.time_ and arg_25_1.time_ <= var_28_4 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_6 = arg_25_1:FormatText(StoryNameCfg[98].name)

				arg_25_1.leftNameTxt_.text = var_28_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, true)
				arg_25_1.iconController_:SetSelectedState("hero")

				arg_25_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3007")

				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_7 = arg_25_1:GetWordFromCfg(107112006)
				local var_28_8 = arg_25_1:FormatText(var_28_7.content)

				arg_25_1.text_.text = var_28_8

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_9 = 6
				local var_28_10 = utf8.len(var_28_8)
				local var_28_11 = var_28_9 <= 0 and var_28_5 or var_28_5 * (var_28_10 / var_28_9)

				if var_28_11 > 0 and var_28_5 < var_28_11 then
					arg_25_1.talkMaxDuration = var_28_11

					if var_28_11 + var_28_4 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_11 + var_28_4
					end
				end

				arg_25_1.text_.text = var_28_8
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112006", "story_v_out_107112.awb") ~= 0 then
					local var_28_12 = manager.audio:GetVoiceLength("story_v_out_107112", "107112006", "story_v_out_107112.awb") / 1000

					if var_28_12 + var_28_4 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_12 + var_28_4
					end

					if var_28_7.prefab_name ~= "" and arg_25_1.actors_[var_28_7.prefab_name] ~= nil then
						local var_28_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_7.prefab_name].transform, "story_v_out_107112", "107112006", "story_v_out_107112.awb")

						arg_25_1:RecordAudio("107112006", var_28_13)
						arg_25_1:RecordAudio("107112006", var_28_13)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_107112", "107112006", "story_v_out_107112.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_107112", "107112006", "story_v_out_107112.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_14 = math.max(var_28_5, arg_25_1.talkMaxDuration)

			if var_28_4 <= arg_25_1.time_ and arg_25_1.time_ < var_28_4 + var_28_14 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_4) / var_28_14

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_4 + var_28_14 and arg_25_1.time_ < var_28_4 + var_28_14 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play107112007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 107112007
		arg_29_1.duration_ = 7.033

		local var_29_0 = {
			ja = 7.033,
			ko = 4.433,
			zh = 6.666,
			en = 6.533
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
				arg_29_0:Play107112008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.625

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_2 = arg_29_1:FormatText(StoryNameCfg[99].name)

				arg_29_1.leftNameTxt_.text = var_32_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, true)
				arg_29_1.iconController_:SetSelectedState("hero")

				arg_29_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10012")

				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_3 = arg_29_1:GetWordFromCfg(107112007)
				local var_32_4 = arg_29_1:FormatText(var_32_3.content)

				arg_29_1.text_.text = var_32_4

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_5 = 26
				local var_32_6 = utf8.len(var_32_4)
				local var_32_7 = var_32_5 <= 0 and var_32_1 or var_32_1 * (var_32_6 / var_32_5)

				if var_32_7 > 0 and var_32_1 < var_32_7 then
					arg_29_1.talkMaxDuration = var_32_7

					if var_32_7 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_7 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_4
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112007", "story_v_out_107112.awb") ~= 0 then
					local var_32_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112007", "story_v_out_107112.awb") / 1000

					if var_32_8 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_0
					end

					if var_32_3.prefab_name ~= "" and arg_29_1.actors_[var_32_3.prefab_name] ~= nil then
						local var_32_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_3.prefab_name].transform, "story_v_out_107112", "107112007", "story_v_out_107112.awb")

						arg_29_1:RecordAudio("107112007", var_32_9)
						arg_29_1:RecordAudio("107112007", var_32_9)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_107112", "107112007", "story_v_out_107112.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_107112", "107112007", "story_v_out_107112.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_10 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_10 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_10

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_10 and arg_29_1.time_ < var_32_0 + var_32_10 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play107112008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 107112008
		arg_33_1.duration_ = 5.8

		local var_33_0 = {
			ja = 3.5,
			ko = 4.166,
			zh = 3.9,
			en = 5.8
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
				arg_33_0:Play107112009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.475

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[99].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10012")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(107112008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 18
				local var_36_6 = utf8.len(var_36_4)
				local var_36_7 = var_36_5 <= 0 and var_36_1 or var_36_1 * (var_36_6 / var_36_5)

				if var_36_7 > 0 and var_36_1 < var_36_7 then
					arg_33_1.talkMaxDuration = var_36_7

					if var_36_7 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_7 + var_36_0
					end
				end

				arg_33_1.text_.text = var_36_4
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112008", "story_v_out_107112.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112008", "story_v_out_107112.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_107112", "107112008", "story_v_out_107112.awb")

						arg_33_1:RecordAudio("107112008", var_36_9)
						arg_33_1:RecordAudio("107112008", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_107112", "107112008", "story_v_out_107112.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_107112", "107112008", "story_v_out_107112.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_10 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_10 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_10

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_10 and arg_33_1.time_ < var_36_0 + var_36_10 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play107112009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 107112009
		arg_37_1.duration_ = 4.733

		local var_37_0 = {
			ja = 4.733,
			ko = 4.3,
			zh = 2.266,
			en = 2.2
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
				arg_37_0:Play107112010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.075

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[98].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, true)
				arg_37_1.iconController_:SetSelectedState("hero")

				arg_37_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3007")

				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(107112009)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 3
				local var_40_6 = utf8.len(var_40_4)
				local var_40_7 = var_40_5 <= 0 and var_40_1 or var_40_1 * (var_40_6 / var_40_5)

				if var_40_7 > 0 and var_40_1 < var_40_7 then
					arg_37_1.talkMaxDuration = var_40_7

					if var_40_7 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_7 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_4
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112009", "story_v_out_107112.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112009", "story_v_out_107112.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_out_107112", "107112009", "story_v_out_107112.awb")

						arg_37_1:RecordAudio("107112009", var_40_9)
						arg_37_1:RecordAudio("107112009", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_107112", "107112009", "story_v_out_107112.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_107112", "107112009", "story_v_out_107112.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_10 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_10 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_10

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_10 and arg_37_1.time_ < var_40_0 + var_40_10 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play107112010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 107112010
		arg_41_1.duration_ = 7.133

		local var_41_0 = {
			ja = 6.766,
			ko = 4.3,
			zh = 6.266,
			en = 7.133
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
				arg_41_0:Play107112011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.2

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_2 = arg_41_1:FormatText(StoryNameCfg[98].name)

				arg_41_1.leftNameTxt_.text = var_44_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3007")

				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_3 = arg_41_1:GetWordFromCfg(107112010)
				local var_44_4 = arg_41_1:FormatText(var_44_3.content)

				arg_41_1.text_.text = var_44_4

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_5 = 8
				local var_44_6 = utf8.len(var_44_4)
				local var_44_7 = var_44_5 <= 0 and var_44_1 or var_44_1 * (var_44_6 / var_44_5)

				if var_44_7 > 0 and var_44_1 < var_44_7 then
					arg_41_1.talkMaxDuration = var_44_7

					if var_44_7 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_7 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_4
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112010", "story_v_out_107112.awb") ~= 0 then
					local var_44_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112010", "story_v_out_107112.awb") / 1000

					if var_44_8 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_0
					end

					if var_44_3.prefab_name ~= "" and arg_41_1.actors_[var_44_3.prefab_name] ~= nil then
						local var_44_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_3.prefab_name].transform, "story_v_out_107112", "107112010", "story_v_out_107112.awb")

						arg_41_1:RecordAudio("107112010", var_44_9)
						arg_41_1:RecordAudio("107112010", var_44_9)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_107112", "107112010", "story_v_out_107112.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_107112", "107112010", "story_v_out_107112.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_10 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_10 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_10

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_10 and arg_41_1.time_ < var_44_0 + var_44_10 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play107112011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 107112011
		arg_45_1.duration_ = 6.133

		local var_45_0 = {
			ja = 5.9,
			ko = 5.333,
			zh = 5.8,
			en = 6.133
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
				arg_45_0:Play107112012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = "1084ui_story"

			if arg_45_1.actors_[var_48_0] == nil then
				local var_48_1 = Object.Instantiate(Asset.Load("Char/" .. var_48_0), arg_45_1.stage_.transform)

				var_48_1.name = var_48_0
				var_48_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.actors_[var_48_0] = var_48_1

				local var_48_2 = var_48_1:GetComponentInChildren(typeof(CharacterEffect))

				var_48_2.enabled = true

				local var_48_3 = GameObjectTools.GetOrAddComponent(var_48_1, typeof(DynamicBoneHelper))

				if var_48_3 then
					var_48_3:EnableDynamicBone(false)
				end

				arg_45_1:ShowWeapon(var_48_2.transform, false)

				arg_45_1.var_[var_48_0 .. "Animator"] = var_48_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_45_1.var_[var_48_0 .. "Animator"].applyRootMotion = true
				arg_45_1.var_[var_48_0 .. "LipSync"] = var_48_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_48_4 = arg_45_1.actors_["1084ui_story"]
			local var_48_5 = 3

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 and arg_45_1.var_.characterEffect1084ui_story == nil then
				arg_45_1.var_.characterEffect1084ui_story = var_48_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_6 = 0.1

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6

				if arg_45_1.var_.characterEffect1084ui_story then
					arg_45_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 and arg_45_1.var_.characterEffect1084ui_story then
				arg_45_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_48_8 = arg_45_1.actors_["3007_tpose"]
			local var_48_9 = 3

			if var_48_9 < arg_45_1.time_ and arg_45_1.time_ <= var_48_9 + arg_48_0 and arg_45_1.var_.characterEffect3007_tpose == nil then
				arg_45_1.var_.characterEffect3007_tpose = var_48_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_10 = 0.1

			if var_48_9 <= arg_45_1.time_ and arg_45_1.time_ < var_48_9 + var_48_10 then
				local var_48_11 = (arg_45_1.time_ - var_48_9) / var_48_10

				if arg_45_1.var_.characterEffect3007_tpose then
					local var_48_12 = Mathf.Lerp(0, 0.5, var_48_11)

					arg_45_1.var_.characterEffect3007_tpose.fillFlat = true
					arg_45_1.var_.characterEffect3007_tpose.fillRatio = var_48_12
				end
			end

			if arg_45_1.time_ >= var_48_9 + var_48_10 and arg_45_1.time_ < var_48_9 + var_48_10 + arg_48_0 and arg_45_1.var_.characterEffect3007_tpose then
				local var_48_13 = 0.5

				arg_45_1.var_.characterEffect3007_tpose.fillFlat = true
				arg_45_1.var_.characterEffect3007_tpose.fillRatio = var_48_13
			end

			local var_48_14 = arg_45_1.actors_["3007_tpose"].transform
			local var_48_15 = 3

			if var_48_15 < arg_45_1.time_ and arg_45_1.time_ <= var_48_15 + arg_48_0 then
				arg_45_1.var_.moveOldPos3007_tpose = var_48_14.localPosition
			end

			local var_48_16 = 0.001

			if var_48_15 <= arg_45_1.time_ and arg_45_1.time_ < var_48_15 + var_48_16 then
				local var_48_17 = (arg_45_1.time_ - var_48_15) / var_48_16
				local var_48_18 = Vector3.New(0, 100, 0)

				var_48_14.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos3007_tpose, var_48_18, var_48_17)

				local var_48_19 = manager.ui.mainCamera.transform.position - var_48_14.position

				var_48_14.forward = Vector3.New(var_48_19.x, var_48_19.y, var_48_19.z)

				local var_48_20 = var_48_14.localEulerAngles

				var_48_20.z = 0
				var_48_20.x = 0
				var_48_14.localEulerAngles = var_48_20
			end

			if arg_45_1.time_ >= var_48_15 + var_48_16 and arg_45_1.time_ < var_48_15 + var_48_16 + arg_48_0 then
				var_48_14.localPosition = Vector3.New(0, 100, 0)

				local var_48_21 = manager.ui.mainCamera.transform.position - var_48_14.position

				var_48_14.forward = Vector3.New(var_48_21.x, var_48_21.y, var_48_21.z)

				local var_48_22 = var_48_14.localEulerAngles

				var_48_22.z = 0
				var_48_22.x = 0
				var_48_14.localEulerAngles = var_48_22
			end

			local var_48_23 = arg_45_1.actors_["1084ui_story"].transform
			local var_48_24 = 3

			if var_48_24 < arg_45_1.time_ and arg_45_1.time_ <= var_48_24 + arg_48_0 then
				arg_45_1.var_.moveOldPos1084ui_story = var_48_23.localPosition
			end

			local var_48_25 = 0.001

			if var_48_24 <= arg_45_1.time_ and arg_45_1.time_ < var_48_24 + var_48_25 then
				local var_48_26 = (arg_45_1.time_ - var_48_24) / var_48_25
				local var_48_27 = Vector3.New(-0.7, -0.97, -6)

				var_48_23.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1084ui_story, var_48_27, var_48_26)

				local var_48_28 = manager.ui.mainCamera.transform.position - var_48_23.position

				var_48_23.forward = Vector3.New(var_48_28.x, var_48_28.y, var_48_28.z)

				local var_48_29 = var_48_23.localEulerAngles

				var_48_29.z = 0
				var_48_29.x = 0
				var_48_23.localEulerAngles = var_48_29
			end

			if arg_45_1.time_ >= var_48_24 + var_48_25 and arg_45_1.time_ < var_48_24 + var_48_25 + arg_48_0 then
				var_48_23.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_48_30 = manager.ui.mainCamera.transform.position - var_48_23.position

				var_48_23.forward = Vector3.New(var_48_30.x, var_48_30.y, var_48_30.z)

				local var_48_31 = var_48_23.localEulerAngles

				var_48_31.z = 0
				var_48_31.x = 0
				var_48_23.localEulerAngles = var_48_31
			end

			local var_48_32 = 3

			if var_48_32 < arg_45_1.time_ and arg_45_1.time_ <= var_48_32 + arg_48_0 then
				arg_45_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_48_33 = arg_45_1.bgs_.C03a
			local var_48_34 = 1.5

			if var_48_34 < arg_45_1.time_ and arg_45_1.time_ <= var_48_34 + arg_48_0 then
				local var_48_35 = var_48_33:GetComponent("SpriteRenderer")

				if var_48_35 then
					var_48_35.material = arg_45_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_48_36 = var_48_35.material
					local var_48_37 = var_48_36:GetColor("_Color")

					arg_45_1.var_.alphaOldValueC03a = var_48_37.a
					arg_45_1.var_.alphaMatValueC03a = var_48_36
				end

				arg_45_1.var_.alphaOldValueC03a = 0
			end

			local var_48_38 = 1.5

			if var_48_34 <= arg_45_1.time_ and arg_45_1.time_ < var_48_34 + var_48_38 then
				local var_48_39 = (arg_45_1.time_ - var_48_34) / var_48_38
				local var_48_40 = Mathf.Lerp(arg_45_1.var_.alphaOldValueC03a, 1, var_48_39)

				if arg_45_1.var_.alphaMatValueC03a then
					local var_48_41 = arg_45_1.var_.alphaMatValueC03a
					local var_48_42 = var_48_41:GetColor("_Color")

					var_48_42.a = var_48_40

					var_48_41:SetColor("_Color", var_48_42)
				end
			end

			if arg_45_1.time_ >= var_48_34 + var_48_38 and arg_45_1.time_ < var_48_34 + var_48_38 + arg_48_0 and arg_45_1.var_.alphaMatValueC03a then
				local var_48_43 = arg_45_1.var_.alphaMatValueC03a
				local var_48_44 = var_48_43:GetColor("_Color")

				var_48_44.a = 1

				var_48_43:SetColor("_Color", var_48_44)
			end

			local var_48_45 = arg_45_1.bgs_.S0704
			local var_48_46 = 0

			if var_48_46 < arg_45_1.time_ and arg_45_1.time_ <= var_48_46 + arg_48_0 then
				local var_48_47 = var_48_45:GetComponent("SpriteRenderer")

				if var_48_47 then
					var_48_47.material = arg_45_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_48_48 = var_48_47.material
					local var_48_49 = var_48_48:GetColor("_Color")

					arg_45_1.var_.alphaOldValueS0704 = var_48_49.a
					arg_45_1.var_.alphaMatValueS0704 = var_48_48
				end

				arg_45_1.var_.alphaOldValueS0704 = 1
			end

			local var_48_50 = 1.5

			if var_48_46 <= arg_45_1.time_ and arg_45_1.time_ < var_48_46 + var_48_50 then
				local var_48_51 = (arg_45_1.time_ - var_48_46) / var_48_50
				local var_48_52 = Mathf.Lerp(arg_45_1.var_.alphaOldValueS0704, 0, var_48_51)

				if arg_45_1.var_.alphaMatValueS0704 then
					local var_48_53 = arg_45_1.var_.alphaMatValueS0704
					local var_48_54 = var_48_53:GetColor("_Color")

					var_48_54.a = var_48_52

					var_48_53:SetColor("_Color", var_48_54)
				end
			end

			if arg_45_1.time_ >= var_48_46 + var_48_50 and arg_45_1.time_ < var_48_46 + var_48_50 + arg_48_0 and arg_45_1.var_.alphaMatValueS0704 then
				local var_48_55 = arg_45_1.var_.alphaMatValueS0704
				local var_48_56 = var_48_55:GetColor("_Color")

				var_48_56.a = 0

				var_48_55:SetColor("_Color", var_48_56)
			end

			local var_48_57 = 1.5

			if var_48_57 < arg_45_1.time_ and arg_45_1.time_ <= var_48_57 + arg_48_0 then
				local var_48_58 = manager.ui.mainCamera.transform.localPosition
				local var_48_59 = Vector3.New(0, 0, 10) + Vector3.New(var_48_58.x, var_48_58.y, 0)
				local var_48_60 = arg_45_1.bgs_.C03a

				var_48_60.transform.localPosition = var_48_59
				var_48_60.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_48_61 = var_48_60:GetComponent("SpriteRenderer")

				if var_48_61 and var_48_61.sprite then
					local var_48_62 = (var_48_60.transform.localPosition - var_48_58).z
					local var_48_63 = manager.ui.mainCameraCom_
					local var_48_64 = 2 * var_48_62 * Mathf.Tan(var_48_63.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_48_65 = var_48_64 * var_48_63.aspect
					local var_48_66 = var_48_61.sprite.bounds.size.x
					local var_48_67 = var_48_61.sprite.bounds.size.y
					local var_48_68 = var_48_65 / var_48_66
					local var_48_69 = var_48_64 / var_48_67
					local var_48_70 = var_48_69 < var_48_68 and var_48_68 or var_48_69

					var_48_60.transform.localScale = Vector3.New(var_48_70, var_48_70, 0)
				end

				for iter_48_0, iter_48_1 in pairs(arg_45_1.bgs_) do
					if iter_48_0 ~= "C03a" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_71 = 0

			if var_48_71 < arg_45_1.time_ and arg_45_1.time_ <= var_48_71 + arg_48_0 then
				arg_45_1.allBtn_.enabled = false
			end

			local var_48_72 = 3

			if arg_45_1.time_ >= var_48_71 + var_48_72 and arg_45_1.time_ < var_48_71 + var_48_72 + arg_48_0 then
				arg_45_1.allBtn_.enabled = true
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_73 = 3
			local var_48_74 = 0.35

			if var_48_73 < arg_45_1.time_ and arg_45_1.time_ <= var_48_73 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_75 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_75:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_75:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_75:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_76 = arg_45_1:FormatText(StoryNameCfg[6].name)

				arg_45_1.leftNameTxt_.text = var_48_76

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_77 = arg_45_1:GetWordFromCfg(107112011)
				local var_48_78 = arg_45_1:FormatText(var_48_77.content)

				arg_45_1.text_.text = var_48_78

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_79 = 14
				local var_48_80 = utf8.len(var_48_78)
				local var_48_81 = var_48_79 <= 0 and var_48_74 or var_48_74 * (var_48_80 / var_48_79)

				if var_48_81 > 0 and var_48_74 < var_48_81 then
					arg_45_1.talkMaxDuration = var_48_81
					var_48_73 = var_48_73 + 0.3

					if var_48_81 + var_48_73 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_81 + var_48_73
					end
				end

				arg_45_1.text_.text = var_48_78
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112011", "story_v_out_107112.awb") ~= 0 then
					local var_48_82 = manager.audio:GetVoiceLength("story_v_out_107112", "107112011", "story_v_out_107112.awb") / 1000

					if var_48_82 + var_48_73 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_82 + var_48_73
					end

					if var_48_77.prefab_name ~= "" and arg_45_1.actors_[var_48_77.prefab_name] ~= nil then
						local var_48_83 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_77.prefab_name].transform, "story_v_out_107112", "107112011", "story_v_out_107112.awb")

						arg_45_1:RecordAudio("107112011", var_48_83)
						arg_45_1:RecordAudio("107112011", var_48_83)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_107112", "107112011", "story_v_out_107112.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_107112", "107112011", "story_v_out_107112.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_84 = var_48_73 + 0.3
			local var_48_85 = math.max(var_48_74, arg_45_1.talkMaxDuration)

			if var_48_84 <= arg_45_1.time_ and arg_45_1.time_ < var_48_84 + var_48_85 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_84) / var_48_85

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_84 + var_48_85 and arg_45_1.time_ < var_48_84 + var_48_85 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play107112012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 107112012
		arg_51_1.duration_ = 7.533

		local var_51_0 = {
			ja = 4.6,
			ko = 6.3,
			zh = 7.133,
			en = 7.533
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
				arg_51_0:Play107112013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1084ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story == nil then
				arg_51_1.var_.characterEffect1084ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1084ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.85

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[10].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(107112012)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112012", "story_v_out_107112.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_107112", "107112012", "story_v_out_107112.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_107112", "107112012", "story_v_out_107112.awb")

						arg_51_1:RecordAudio("107112012", var_54_15)
						arg_51_1:RecordAudio("107112012", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_107112", "107112012", "story_v_out_107112.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_107112", "107112012", "story_v_out_107112.awb")
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
	Play107112013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 107112013
		arg_55_1.duration_ = 6.6

		local var_55_0 = {
			ja = 6.6,
			ko = 5.2,
			zh = 3.966,
			en = 4
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
				arg_55_0:Play107112014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1038ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1038ui_story == nil then
				arg_55_1.var_.characterEffect1038ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1038ui_story then
					arg_55_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1038ui_story then
				arg_55_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1038ui_story"].transform
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.var_.moveOldPos1038ui_story = var_58_4.localPosition
			end

			local var_58_6 = 0.001

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6
				local var_58_8 = Vector3.New(0.7, -1.11, -5.9)

				var_58_4.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1038ui_story, var_58_8, var_58_7)

				local var_58_9 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_9.x, var_58_9.y, var_58_9.z)

				local var_58_10 = var_58_4.localEulerAngles

				var_58_10.z = 0
				var_58_10.x = 0
				var_58_4.localEulerAngles = var_58_10
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 then
				var_58_4.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_58_11 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_11.x, var_58_11.y, var_58_11.z)

				local var_58_12 = var_58_4.localEulerAngles

				var_58_12.z = 0
				var_58_12.x = 0
				var_58_4.localEulerAngles = var_58_12
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_58_15 = 0
			local var_58_16 = 0.5

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_17 = arg_55_1:FormatText(StoryNameCfg[94].name)

				arg_55_1.leftNameTxt_.text = var_58_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_18 = arg_55_1:GetWordFromCfg(107112013)
				local var_58_19 = arg_55_1:FormatText(var_58_18.content)

				arg_55_1.text_.text = var_58_19

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_20 = 20
				local var_58_21 = utf8.len(var_58_19)
				local var_58_22 = var_58_20 <= 0 and var_58_16 or var_58_16 * (var_58_21 / var_58_20)

				if var_58_22 > 0 and var_58_16 < var_58_22 then
					arg_55_1.talkMaxDuration = var_58_22

					if var_58_22 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_22 + var_58_15
					end
				end

				arg_55_1.text_.text = var_58_19
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112013", "story_v_out_107112.awb") ~= 0 then
					local var_58_23 = manager.audio:GetVoiceLength("story_v_out_107112", "107112013", "story_v_out_107112.awb") / 1000

					if var_58_23 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_15
					end

					if var_58_18.prefab_name ~= "" and arg_55_1.actors_[var_58_18.prefab_name] ~= nil then
						local var_58_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_18.prefab_name].transform, "story_v_out_107112", "107112013", "story_v_out_107112.awb")

						arg_55_1:RecordAudio("107112013", var_58_24)
						arg_55_1:RecordAudio("107112013", var_58_24)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_107112", "107112013", "story_v_out_107112.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_107112", "107112013", "story_v_out_107112.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_25 = math.max(var_58_16, arg_55_1.talkMaxDuration)

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_25 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_15) / var_58_25

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_15 + var_58_25 and arg_55_1.time_ < var_58_15 + var_58_25 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play107112014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 107112014
		arg_59_1.duration_ = 1.3

		local var_59_0 = {
			ja = 1.266,
			ko = 1.066,
			zh = 1.3,
			en = 1.3
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
				arg_59_0:Play107112015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1038ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1038ui_story == nil then
				arg_59_1.var_.characterEffect1038ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1038ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1038ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1038ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1038ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.05

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[99].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10012")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(107112014)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 2
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112014", "story_v_out_107112.awb") ~= 0 then
					local var_62_14 = manager.audio:GetVoiceLength("story_v_out_107112", "107112014", "story_v_out_107112.awb") / 1000

					if var_62_14 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_14 + var_62_6
					end

					if var_62_9.prefab_name ~= "" and arg_59_1.actors_[var_62_9.prefab_name] ~= nil then
						local var_62_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_9.prefab_name].transform, "story_v_out_107112", "107112014", "story_v_out_107112.awb")

						arg_59_1:RecordAudio("107112014", var_62_15)
						arg_59_1:RecordAudio("107112014", var_62_15)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_107112", "107112014", "story_v_out_107112.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_107112", "107112014", "story_v_out_107112.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_16 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_16 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_16

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_16 and arg_59_1.time_ < var_62_6 + var_62_16 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play107112015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 107112015
		arg_63_1.duration_ = 2.7

		local var_63_0 = {
			ja = 2.6,
			ko = 2.533,
			zh = 2.7,
			en = 2.6
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
				arg_63_0:Play107112016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1038ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1038ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, 100, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1038ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, 100, 0)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_9.localPosition
			end

			local var_66_11 = 0.001

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11
				local var_66_13 = Vector3.New(0, 100, 0)

				var_66_9.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_13, var_66_12)

				local var_66_14 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_14.x, var_66_14.y, var_66_14.z)

				local var_66_15 = var_66_9.localEulerAngles

				var_66_15.z = 0
				var_66_15.x = 0
				var_66_9.localEulerAngles = var_66_15
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 then
				var_66_9.localPosition = Vector3.New(0, 100, 0)

				local var_66_16 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_16.x, var_66_16.y, var_66_16.z)

				local var_66_17 = var_66_9.localEulerAngles

				var_66_17.z = 0
				var_66_17.x = 0
				var_66_9.localEulerAngles = var_66_17
			end

			local var_66_18 = 0
			local var_66_19 = 0.275

			if var_66_18 < arg_63_1.time_ and arg_63_1.time_ <= var_66_18 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_20 = arg_63_1:FormatText(StoryNameCfg[10].name)

				arg_63_1.leftNameTxt_.text = var_66_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_21 = arg_63_1:GetWordFromCfg(107112015)
				local var_66_22 = arg_63_1:FormatText(var_66_21.content)

				arg_63_1.text_.text = var_66_22

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_23 = 11
				local var_66_24 = utf8.len(var_66_22)
				local var_66_25 = var_66_23 <= 0 and var_66_19 or var_66_19 * (var_66_24 / var_66_23)

				if var_66_25 > 0 and var_66_19 < var_66_25 then
					arg_63_1.talkMaxDuration = var_66_25

					if var_66_25 + var_66_18 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_25 + var_66_18
					end
				end

				arg_63_1.text_.text = var_66_22
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112015", "story_v_out_107112.awb") ~= 0 then
					local var_66_26 = manager.audio:GetVoiceLength("story_v_out_107112", "107112015", "story_v_out_107112.awb") / 1000

					if var_66_26 + var_66_18 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_26 + var_66_18
					end

					if var_66_21.prefab_name ~= "" and arg_63_1.actors_[var_66_21.prefab_name] ~= nil then
						local var_66_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_21.prefab_name].transform, "story_v_out_107112", "107112015", "story_v_out_107112.awb")

						arg_63_1:RecordAudio("107112015", var_66_27)
						arg_63_1:RecordAudio("107112015", var_66_27)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_107112", "107112015", "story_v_out_107112.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_107112", "107112015", "story_v_out_107112.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_28 = math.max(var_66_19, arg_63_1.talkMaxDuration)

			if var_66_18 <= arg_63_1.time_ and arg_63_1.time_ < var_66_18 + var_66_28 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_18) / var_66_28

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_18 + var_66_28 and arg_63_1.time_ < var_66_18 + var_66_28 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play107112016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 107112016
		arg_67_1.duration_ = 5.966

		local var_67_0 = {
			ja = 3.666,
			ko = 5,
			zh = 5.966,
			en = 3.966
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
				arg_67_0:Play107112017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.65

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[10].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(107112016)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 26
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112016", "story_v_out_107112.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112016", "story_v_out_107112.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_107112", "107112016", "story_v_out_107112.awb")

						arg_67_1:RecordAudio("107112016", var_70_9)
						arg_67_1:RecordAudio("107112016", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_107112", "107112016", "story_v_out_107112.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_107112", "107112016", "story_v_out_107112.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play107112017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 107112017
		arg_71_1.duration_ = 12.433

		local var_71_0 = {
			ja = 12.2,
			ko = 12.2,
			zh = 10.9,
			en = 12.433
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
				arg_71_0:Play107112018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.25

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[10].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(107112017)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 50
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112017", "story_v_out_107112.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112017", "story_v_out_107112.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_107112", "107112017", "story_v_out_107112.awb")

						arg_71_1:RecordAudio("107112017", var_74_9)
						arg_71_1:RecordAudio("107112017", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_107112", "107112017", "story_v_out_107112.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_107112", "107112017", "story_v_out_107112.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_10 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_10 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_10

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_10 and arg_71_1.time_ < var_74_0 + var_74_10 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play107112018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 107112018
		arg_75_1.duration_ = 5.533

		local var_75_0 = {
			ja = 5.533,
			ko = 3.166,
			zh = 5.033,
			en = 5.233
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
				arg_75_0:Play107112019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1038ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1038ui_story == nil then
				arg_75_1.var_.characterEffect1038ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1038ui_story then
					arg_75_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1038ui_story then
				arg_75_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["1038ui_story"].transform
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 then
				arg_75_1.var_.moveOldPos1038ui_story = var_78_4.localPosition
			end

			local var_78_6 = 0.001

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6
				local var_78_8 = Vector3.New(0, -1.11, -5.9)

				var_78_4.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1038ui_story, var_78_8, var_78_7)

				local var_78_9 = manager.ui.mainCamera.transform.position - var_78_4.position

				var_78_4.forward = Vector3.New(var_78_9.x, var_78_9.y, var_78_9.z)

				local var_78_10 = var_78_4.localEulerAngles

				var_78_10.z = 0
				var_78_10.x = 0
				var_78_4.localEulerAngles = var_78_10
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 then
				var_78_4.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_78_11 = manager.ui.mainCamera.transform.position - var_78_4.position

				var_78_4.forward = Vector3.New(var_78_11.x, var_78_11.y, var_78_11.z)

				local var_78_12 = var_78_4.localEulerAngles

				var_78_12.z = 0
				var_78_12.x = 0
				var_78_4.localEulerAngles = var_78_12
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action3_1")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_78_15 = 0
			local var_78_16 = 0.35

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_17 = arg_75_1:FormatText(StoryNameCfg[94].name)

				arg_75_1.leftNameTxt_.text = var_78_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_18 = arg_75_1:GetWordFromCfg(107112018)
				local var_78_19 = arg_75_1:FormatText(var_78_18.content)

				arg_75_1.text_.text = var_78_19

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_20 = 18
				local var_78_21 = utf8.len(var_78_19)
				local var_78_22 = var_78_20 <= 0 and var_78_16 or var_78_16 * (var_78_21 / var_78_20)

				if var_78_22 > 0 and var_78_16 < var_78_22 then
					arg_75_1.talkMaxDuration = var_78_22

					if var_78_22 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_22 + var_78_15
					end
				end

				arg_75_1.text_.text = var_78_19
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112018", "story_v_out_107112.awb") ~= 0 then
					local var_78_23 = manager.audio:GetVoiceLength("story_v_out_107112", "107112018", "story_v_out_107112.awb") / 1000

					if var_78_23 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_23 + var_78_15
					end

					if var_78_18.prefab_name ~= "" and arg_75_1.actors_[var_78_18.prefab_name] ~= nil then
						local var_78_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_18.prefab_name].transform, "story_v_out_107112", "107112018", "story_v_out_107112.awb")

						arg_75_1:RecordAudio("107112018", var_78_24)
						arg_75_1:RecordAudio("107112018", var_78_24)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_107112", "107112018", "story_v_out_107112.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_107112", "107112018", "story_v_out_107112.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_25 = math.max(var_78_16, arg_75_1.talkMaxDuration)

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_25 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_15) / var_78_25

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_15 + var_78_25 and arg_75_1.time_ < var_78_15 + var_78_25 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play107112019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 107112019
		arg_79_1.duration_ = 9.6

		local var_79_0 = {
			ja = 8.366,
			ko = 7.333,
			zh = 7,
			en = 9.6
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
				arg_79_0:Play107112020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038actionlink/1038action436")
			end

			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_82_2 = 0
			local var_82_3 = 0.9

			if var_82_2 < arg_79_1.time_ and arg_79_1.time_ <= var_82_2 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_4 = arg_79_1:FormatText(StoryNameCfg[94].name)

				arg_79_1.leftNameTxt_.text = var_82_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_5 = arg_79_1:GetWordFromCfg(107112019)
				local var_82_6 = arg_79_1:FormatText(var_82_5.content)

				arg_79_1.text_.text = var_82_6

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_7 = 36
				local var_82_8 = utf8.len(var_82_6)
				local var_82_9 = var_82_7 <= 0 and var_82_3 or var_82_3 * (var_82_8 / var_82_7)

				if var_82_9 > 0 and var_82_3 < var_82_9 then
					arg_79_1.talkMaxDuration = var_82_9

					if var_82_9 + var_82_2 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_9 + var_82_2
					end
				end

				arg_79_1.text_.text = var_82_6
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112019", "story_v_out_107112.awb") ~= 0 then
					local var_82_10 = manager.audio:GetVoiceLength("story_v_out_107112", "107112019", "story_v_out_107112.awb") / 1000

					if var_82_10 + var_82_2 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_10 + var_82_2
					end

					if var_82_5.prefab_name ~= "" and arg_79_1.actors_[var_82_5.prefab_name] ~= nil then
						local var_82_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_5.prefab_name].transform, "story_v_out_107112", "107112019", "story_v_out_107112.awb")

						arg_79_1:RecordAudio("107112019", var_82_11)
						arg_79_1:RecordAudio("107112019", var_82_11)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_107112", "107112019", "story_v_out_107112.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_107112", "107112019", "story_v_out_107112.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_12 = math.max(var_82_3, arg_79_1.talkMaxDuration)

			if var_82_2 <= arg_79_1.time_ and arg_79_1.time_ < var_82_2 + var_82_12 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_2) / var_82_12

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_2 + var_82_12 and arg_79_1.time_ < var_82_2 + var_82_12 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play107112020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 107112020
		arg_83_1.duration_ = 2.666

		local var_83_0 = {
			ja = 2.5,
			ko = 2.6,
			zh = 2.1,
			en = 2.666
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
				arg_83_0:Play107112021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1038ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1038ui_story == nil then
				arg_83_1.var_.characterEffect1038ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.1

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1038ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1038ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1038ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1038ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["1038ui_story"].transform
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 then
				arg_83_1.var_.moveOldPos1038ui_story = var_86_6.localPosition
			end

			local var_86_8 = 0.001

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8
				local var_86_10 = Vector3.New(0, 100, 0)

				var_86_6.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1038ui_story, var_86_10, var_86_9)

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
			local var_86_16 = 0.2

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[99].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10012")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(107112020)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 8
				local var_86_21 = utf8.len(var_86_19)
				local var_86_22 = var_86_20 <= 0 and var_86_16 or var_86_16 * (var_86_21 / var_86_20)

				if var_86_22 > 0 and var_86_16 < var_86_22 then
					arg_83_1.talkMaxDuration = var_86_22

					if var_86_22 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_19
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112020", "story_v_out_107112.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_107112", "107112020", "story_v_out_107112.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_107112", "107112020", "story_v_out_107112.awb")

						arg_83_1:RecordAudio("107112020", var_86_24)
						arg_83_1:RecordAudio("107112020", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_107112", "107112020", "story_v_out_107112.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_107112", "107112020", "story_v_out_107112.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_25 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_25 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_25

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_25 and arg_83_1.time_ < var_86_15 + var_86_25 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play107112021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 107112021
		arg_87_1.duration_ = 4.566

		local var_87_0 = {
			ja = 1.999999999999,
			ko = 2.8,
			zh = 4.566,
			en = 4.366
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
				arg_87_0:Play107112022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["3007_tpose"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect3007_tpose == nil then
				arg_87_1.var_.characterEffect3007_tpose = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect3007_tpose then
					arg_87_1.var_.characterEffect3007_tpose.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect3007_tpose then
				arg_87_1.var_.characterEffect3007_tpose.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["3007_tpose"].transform
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1.var_.moveOldPos3007_tpose = var_90_4.localPosition
			end

			local var_90_6 = 0.001

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6
				local var_90_8 = Vector3.New(0, -2.25, -1.9)

				var_90_4.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos3007_tpose, var_90_8, var_90_7)

				local var_90_9 = manager.ui.mainCamera.transform.position - var_90_4.position

				var_90_4.forward = Vector3.New(var_90_9.x, var_90_9.y, var_90_9.z)

				local var_90_10 = var_90_4.localEulerAngles

				var_90_10.z = 0
				var_90_10.x = 0
				var_90_4.localEulerAngles = var_90_10
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 then
				var_90_4.localPosition = Vector3.New(0, -2.25, -1.9)

				local var_90_11 = manager.ui.mainCamera.transform.position - var_90_4.position

				var_90_4.forward = Vector3.New(var_90_11.x, var_90_11.y, var_90_11.z)

				local var_90_12 = var_90_4.localEulerAngles

				var_90_12.z = 0
				var_90_12.x = 0
				var_90_4.localEulerAngles = var_90_12
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("3007_tpose", "StoryTimeline/CharAction/story3007/story3007action/3007action1_1")
			end

			local var_90_14 = 0
			local var_90_15 = 0.15

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_16 = arg_87_1:FormatText(StoryNameCfg[98].name)

				arg_87_1.leftNameTxt_.text = var_90_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_17 = arg_87_1:GetWordFromCfg(107112021)
				local var_90_18 = arg_87_1:FormatText(var_90_17.content)

				arg_87_1.text_.text = var_90_18

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_19 = 6
				local var_90_20 = utf8.len(var_90_18)
				local var_90_21 = var_90_19 <= 0 and var_90_15 or var_90_15 * (var_90_20 / var_90_19)

				if var_90_21 > 0 and var_90_15 < var_90_21 then
					arg_87_1.talkMaxDuration = var_90_21

					if var_90_21 + var_90_14 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_21 + var_90_14
					end
				end

				arg_87_1.text_.text = var_90_18
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112021", "story_v_out_107112.awb") ~= 0 then
					local var_90_22 = manager.audio:GetVoiceLength("story_v_out_107112", "107112021", "story_v_out_107112.awb") / 1000

					if var_90_22 + var_90_14 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_22 + var_90_14
					end

					if var_90_17.prefab_name ~= "" and arg_87_1.actors_[var_90_17.prefab_name] ~= nil then
						local var_90_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_17.prefab_name].transform, "story_v_out_107112", "107112021", "story_v_out_107112.awb")

						arg_87_1:RecordAudio("107112021", var_90_23)
						arg_87_1:RecordAudio("107112021", var_90_23)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_107112", "107112021", "story_v_out_107112.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_107112", "107112021", "story_v_out_107112.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_24 = math.max(var_90_15, arg_87_1.talkMaxDuration)

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_24 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_14) / var_90_24

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_14 + var_90_24 and arg_87_1.time_ < var_90_14 + var_90_24 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play107112022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 107112022
		arg_91_1.duration_ = 5.833

		local var_91_0 = {
			ja = 5.833,
			ko = 4.966,
			zh = 3.766,
			en = 4.9
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
				arg_91_0:Play107112023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1038ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1038ui_story == nil then
				arg_91_1.var_.characterEffect1038ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.1

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1038ui_story then
					arg_91_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1038ui_story then
				arg_91_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["3007_tpose"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect3007_tpose == nil then
				arg_91_1.var_.characterEffect3007_tpose = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.1

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect3007_tpose then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect3007_tpose.fillFlat = true
					arg_91_1.var_.characterEffect3007_tpose.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect3007_tpose then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect3007_tpose.fillFlat = true
				arg_91_1.var_.characterEffect3007_tpose.fillRatio = var_94_9
			end

			local var_94_10 = arg_91_1.actors_["3007_tpose"].transform
			local var_94_11 = 0

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.var_.moveOldPos3007_tpose = var_94_10.localPosition
			end

			local var_94_12 = 0.001

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_12 then
				local var_94_13 = (arg_91_1.time_ - var_94_11) / var_94_12
				local var_94_14 = Vector3.New(0, 100, 0)

				var_94_10.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos3007_tpose, var_94_14, var_94_13)

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

			local var_94_19 = arg_91_1.actors_["1038ui_story"].transform
			local var_94_20 = 0

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.var_.moveOldPos1038ui_story = var_94_19.localPosition
			end

			local var_94_21 = 0.001

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_21 then
				local var_94_22 = (arg_91_1.time_ - var_94_20) / var_94_21
				local var_94_23 = Vector3.New(0, -1.11, -5.9)

				var_94_19.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1038ui_story, var_94_23, var_94_22)

				local var_94_24 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_24.x, var_94_24.y, var_94_24.z)

				local var_94_25 = var_94_19.localEulerAngles

				var_94_25.z = 0
				var_94_25.x = 0
				var_94_19.localEulerAngles = var_94_25
			end

			if arg_91_1.time_ >= var_94_20 + var_94_21 and arg_91_1.time_ < var_94_20 + var_94_21 + arg_94_0 then
				var_94_19.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_94_26 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_26.x, var_94_26.y, var_94_26.z)

				local var_94_27 = var_94_19.localEulerAngles

				var_94_27.z = 0
				var_94_27.x = 0
				var_94_19.localEulerAngles = var_94_27
			end

			local var_94_28 = 0

			if var_94_28 < arg_91_1.time_ and arg_91_1.time_ <= var_94_28 + arg_94_0 then
				arg_91_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_94_29 = 0

			if var_94_29 < arg_91_1.time_ and arg_91_1.time_ <= var_94_29 + arg_94_0 then
				arg_91_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_94_30 = 0
			local var_94_31 = 0.525

			if var_94_30 < arg_91_1.time_ and arg_91_1.time_ <= var_94_30 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_32 = arg_91_1:FormatText(StoryNameCfg[94].name)

				arg_91_1.leftNameTxt_.text = var_94_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_33 = arg_91_1:GetWordFromCfg(107112022)
				local var_94_34 = arg_91_1:FormatText(var_94_33.content)

				arg_91_1.text_.text = var_94_34

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_35 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112022", "story_v_out_107112.awb") ~= 0 then
					local var_94_38 = manager.audio:GetVoiceLength("story_v_out_107112", "107112022", "story_v_out_107112.awb") / 1000

					if var_94_38 + var_94_30 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_38 + var_94_30
					end

					if var_94_33.prefab_name ~= "" and arg_91_1.actors_[var_94_33.prefab_name] ~= nil then
						local var_94_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_33.prefab_name].transform, "story_v_out_107112", "107112022", "story_v_out_107112.awb")

						arg_91_1:RecordAudio("107112022", var_94_39)
						arg_91_1:RecordAudio("107112022", var_94_39)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_107112", "107112022", "story_v_out_107112.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_107112", "107112022", "story_v_out_107112.awb")
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
	Play107112023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 107112023
		arg_95_1.duration_ = 9.566

		local var_95_0 = {
			ja = 9.566,
			ko = 6.833,
			zh = 6.366,
			en = 6.6
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
				arg_95_0:Play107112024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				local var_98_1 = manager.ui.mainCamera.transform.localPosition
				local var_98_2 = Vector3.New(0, 0, 10) + Vector3.New(var_98_1.x, var_98_1.y, 0)
				local var_98_3 = arg_95_1.bgs_.C03a

				var_98_3.transform.localPosition = var_98_2
				var_98_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_98_4 = var_98_3:GetComponent("SpriteRenderer")

				if var_98_4 and var_98_4.sprite then
					local var_98_5 = (var_98_3.transform.localPosition - var_98_1).z
					local var_98_6 = manager.ui.mainCameraCom_
					local var_98_7 = 2 * var_98_5 * Mathf.Tan(var_98_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_98_8 = var_98_7 * var_98_6.aspect
					local var_98_9 = var_98_4.sprite.bounds.size.x
					local var_98_10 = var_98_4.sprite.bounds.size.y
					local var_98_11 = var_98_8 / var_98_9
					local var_98_12 = var_98_7 / var_98_10
					local var_98_13 = var_98_12 < var_98_11 and var_98_11 or var_98_12

					var_98_3.transform.localScale = Vector3.New(var_98_13, var_98_13, 0)
				end

				for iter_98_0, iter_98_1 in pairs(arg_95_1.bgs_) do
					if iter_98_0 ~= "C03a" then
						iter_98_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_98_15 = 0

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_98_16 = 0
			local var_98_17 = 0.65

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_18 = arg_95_1:FormatText(StoryNameCfg[94].name)

				arg_95_1.leftNameTxt_.text = var_98_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_19 = arg_95_1:GetWordFromCfg(107112023)
				local var_98_20 = arg_95_1:FormatText(var_98_19.content)

				arg_95_1.text_.text = var_98_20

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_21 = 26
				local var_98_22 = utf8.len(var_98_20)
				local var_98_23 = var_98_21 <= 0 and var_98_17 or var_98_17 * (var_98_22 / var_98_21)

				if var_98_23 > 0 and var_98_17 < var_98_23 then
					arg_95_1.talkMaxDuration = var_98_23

					if var_98_23 + var_98_16 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_23 + var_98_16
					end
				end

				arg_95_1.text_.text = var_98_20
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112023", "story_v_out_107112.awb") ~= 0 then
					local var_98_24 = manager.audio:GetVoiceLength("story_v_out_107112", "107112023", "story_v_out_107112.awb") / 1000

					if var_98_24 + var_98_16 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_24 + var_98_16
					end

					if var_98_19.prefab_name ~= "" and arg_95_1.actors_[var_98_19.prefab_name] ~= nil then
						local var_98_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_19.prefab_name].transform, "story_v_out_107112", "107112023", "story_v_out_107112.awb")

						arg_95_1:RecordAudio("107112023", var_98_25)
						arg_95_1:RecordAudio("107112023", var_98_25)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_107112", "107112023", "story_v_out_107112.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_107112", "107112023", "story_v_out_107112.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_26 = math.max(var_98_17, arg_95_1.talkMaxDuration)

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_26 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_16) / var_98_26

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_16 + var_98_26 and arg_95_1.time_ < var_98_16 + var_98_26 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play107112024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 107112024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play107112025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1038ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1038ui_story == nil then
				arg_99_1.var_.characterEffect1038ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.1

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1038ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1038ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1038ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1038ui_story.fillRatio = var_102_5
			end

			local var_102_6 = 0
			local var_102_7 = 0.5

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[7].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(107112024)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 20
				local var_102_12 = utf8.len(var_102_10)
				local var_102_13 = var_102_11 <= 0 and var_102_7 or var_102_7 * (var_102_12 / var_102_11)

				if var_102_13 > 0 and var_102_7 < var_102_13 then
					arg_99_1.talkMaxDuration = var_102_13

					if var_102_13 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_13 + var_102_6
					end
				end

				arg_99_1.text_.text = var_102_10
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_14 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_14 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_14

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_14 and arg_99_1.time_ < var_102_6 + var_102_14 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play107112025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 107112025
		arg_103_1.duration_ = 8

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play107112026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1038ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1038ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 100, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1038ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, 100, 0)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.bgs_.C03a
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				local var_106_11 = var_106_9:GetComponent("SpriteRenderer")

				if var_106_11 then
					var_106_11.material = arg_103_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_106_12 = var_106_11.material
					local var_106_13 = var_106_12:GetColor("_Color")

					arg_103_1.var_.alphaOldValueC03a = var_106_13.a
					arg_103_1.var_.alphaMatValueC03a = var_106_12
				end

				arg_103_1.var_.alphaOldValueC03a = 1
			end

			local var_106_14 = 1.5

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_14 then
				local var_106_15 = (arg_103_1.time_ - var_106_10) / var_106_14
				local var_106_16 = Mathf.Lerp(arg_103_1.var_.alphaOldValueC03a, 0, var_106_15)

				if arg_103_1.var_.alphaMatValueC03a then
					local var_106_17 = arg_103_1.var_.alphaMatValueC03a
					local var_106_18 = var_106_17:GetColor("_Color")

					var_106_18.a = var_106_16

					var_106_17:SetColor("_Color", var_106_18)
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_14 and arg_103_1.time_ < var_106_10 + var_106_14 + arg_106_0 and arg_103_1.var_.alphaMatValueC03a then
				local var_106_19 = arg_103_1.var_.alphaMatValueC03a
				local var_106_20 = var_106_19:GetColor("_Color")

				var_106_20.a = 0

				var_106_19:SetColor("_Color", var_106_20)
			end

			local var_106_21 = "C06b"

			if arg_103_1.bgs_[var_106_21] == nil then
				local var_106_22 = Object.Instantiate(arg_103_1.paintGo_)

				var_106_22:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_106_21)
				var_106_22.name = var_106_21
				var_106_22.transform.parent = arg_103_1.stage_.transform
				var_106_22.transform.localPosition = Vector3.New(0, 100, 0)
				arg_103_1.bgs_[var_106_21] = var_106_22
			end

			local var_106_23 = arg_103_1.bgs_.C06b
			local var_106_24 = 1.5

			if var_106_24 < arg_103_1.time_ and arg_103_1.time_ <= var_106_24 + arg_106_0 then
				local var_106_25 = var_106_23:GetComponent("SpriteRenderer")

				if var_106_25 then
					var_106_25.material = arg_103_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_106_26 = var_106_25.material
					local var_106_27 = var_106_26:GetColor("_Color")

					arg_103_1.var_.alphaOldValueC06b = var_106_27.a
					arg_103_1.var_.alphaMatValueC06b = var_106_26
				end

				arg_103_1.var_.alphaOldValueC06b = 0
			end

			local var_106_28 = 1.5

			if var_106_24 <= arg_103_1.time_ and arg_103_1.time_ < var_106_24 + var_106_28 then
				local var_106_29 = (arg_103_1.time_ - var_106_24) / var_106_28
				local var_106_30 = Mathf.Lerp(arg_103_1.var_.alphaOldValueC06b, 1, var_106_29)

				if arg_103_1.var_.alphaMatValueC06b then
					local var_106_31 = arg_103_1.var_.alphaMatValueC06b
					local var_106_32 = var_106_31:GetColor("_Color")

					var_106_32.a = var_106_30

					var_106_31:SetColor("_Color", var_106_32)
				end
			end

			if arg_103_1.time_ >= var_106_24 + var_106_28 and arg_103_1.time_ < var_106_24 + var_106_28 + arg_106_0 and arg_103_1.var_.alphaMatValueC06b then
				local var_106_33 = arg_103_1.var_.alphaMatValueC06b
				local var_106_34 = var_106_33:GetColor("_Color")

				var_106_34.a = 1

				var_106_33:SetColor("_Color", var_106_34)
			end

			local var_106_35 = 1.5

			if var_106_35 < arg_103_1.time_ and arg_103_1.time_ <= var_106_35 + arg_106_0 then
				local var_106_36 = manager.ui.mainCamera.transform.localPosition
				local var_106_37 = Vector3.New(0, 0, 10) + Vector3.New(var_106_36.x, var_106_36.y, 0)
				local var_106_38 = arg_103_1.bgs_.C06b

				var_106_38.transform.localPosition = var_106_37
				var_106_38.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_106_39 = var_106_38:GetComponent("SpriteRenderer")

				if var_106_39 and var_106_39.sprite then
					local var_106_40 = (var_106_38.transform.localPosition - var_106_36).z
					local var_106_41 = manager.ui.mainCameraCom_
					local var_106_42 = 2 * var_106_40 * Mathf.Tan(var_106_41.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_106_43 = var_106_42 * var_106_41.aspect
					local var_106_44 = var_106_39.sprite.bounds.size.x
					local var_106_45 = var_106_39.sprite.bounds.size.y
					local var_106_46 = var_106_43 / var_106_44
					local var_106_47 = var_106_42 / var_106_45
					local var_106_48 = var_106_47 < var_106_46 and var_106_46 or var_106_47

					var_106_38.transform.localScale = Vector3.New(var_106_48, var_106_48, 0)
				end

				for iter_106_0, iter_106_1 in pairs(arg_103_1.bgs_) do
					if iter_106_0 ~= "C06b" then
						iter_106_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_106_49 = 0

			if var_106_49 < arg_103_1.time_ and arg_103_1.time_ <= var_106_49 + arg_106_0 then
				arg_103_1.allBtn_.enabled = false
			end

			local var_106_50 = 3

			if arg_103_1.time_ >= var_106_49 + var_106_50 and arg_103_1.time_ < var_106_49 + var_106_50 + arg_106_0 then
				arg_103_1.allBtn_.enabled = true
			end

			if arg_103_1.frameCnt_ <= 1 then
				arg_103_1.dialog_:SetActive(false)
			end

			local var_106_51 = 3
			local var_106_52 = 0.75

			if var_106_51 < arg_103_1.time_ and arg_103_1.time_ <= var_106_51 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				arg_103_1.dialog_:SetActive(true)

				local var_106_53 = LeanTween.value(arg_103_1.dialog_, 0, 1, 0.3)

				var_106_53:setOnUpdate(LuaHelper.FloatAction(function(arg_107_0)
					arg_103_1.dialogCg_.alpha = arg_107_0
				end))
				var_106_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_103_1.dialog_)
					var_106_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_103_1.duration_ = arg_103_1.duration_ + 0.3

				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_54 = arg_103_1:GetWordFromCfg(107112025)
				local var_106_55 = arg_103_1:FormatText(var_106_54.content)

				arg_103_1.text_.text = var_106_55

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_56 = 30
				local var_106_57 = utf8.len(var_106_55)
				local var_106_58 = var_106_56 <= 0 and var_106_52 or var_106_52 * (var_106_57 / var_106_56)

				if var_106_58 > 0 and var_106_52 < var_106_58 then
					arg_103_1.talkMaxDuration = var_106_58
					var_106_51 = var_106_51 + 0.3

					if var_106_58 + var_106_51 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_58 + var_106_51
					end
				end

				arg_103_1.text_.text = var_106_55
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_59 = var_106_51 + 0.3
			local var_106_60 = math.max(var_106_52, arg_103_1.talkMaxDuration)

			if var_106_59 <= arg_103_1.time_ and arg_103_1.time_ < var_106_59 + var_106_60 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_59) / var_106_60

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_59 + var_106_60 and arg_103_1.time_ < var_106_59 + var_106_60 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play107112026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 107112026
		arg_109_1.duration_ = 2.966

		local var_109_0 = {
			ja = 2.433,
			ko = 2.366,
			zh = 2.766,
			en = 2.966
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
				arg_109_0:Play107112027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.3

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[93].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(107112026)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 12
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112026", "story_v_out_107112.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_107112", "107112026", "story_v_out_107112.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_107112", "107112026", "story_v_out_107112.awb")

						arg_109_1:RecordAudio("107112026", var_112_9)
						arg_109_1:RecordAudio("107112026", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_107112", "107112026", "story_v_out_107112.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_107112", "107112026", "story_v_out_107112.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play107112027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 107112027
		arg_113_1.duration_ = 8.1

		local var_113_0 = {
			ja = 7.366,
			ko = 6.466,
			zh = 6.833,
			en = 8.1
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
				arg_113_0:Play107112028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = "1058ui_story"

			if arg_113_1.actors_[var_116_0] == nil then
				local var_116_1 = Object.Instantiate(Asset.Load("Char/" .. var_116_0), arg_113_1.stage_.transform)

				var_116_1.name = var_116_0
				var_116_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.actors_[var_116_0] = var_116_1

				local var_116_2 = var_116_1:GetComponentInChildren(typeof(CharacterEffect))

				var_116_2.enabled = true

				local var_116_3 = GameObjectTools.GetOrAddComponent(var_116_1, typeof(DynamicBoneHelper))

				if var_116_3 then
					var_116_3:EnableDynamicBone(false)
				end

				arg_113_1:ShowWeapon(var_116_2.transform, false)

				arg_113_1.var_[var_116_0 .. "Animator"] = var_116_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_113_1.var_[var_116_0 .. "Animator"].applyRootMotion = true
				arg_113_1.var_[var_116_0 .. "LipSync"] = var_116_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_116_4 = arg_113_1.actors_["1058ui_story"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect1058ui_story == nil then
				arg_113_1.var_.characterEffect1058ui_story = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.1

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect1058ui_story then
					arg_113_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect1058ui_story then
				arg_113_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_116_8 = arg_113_1.actors_["1058ui_story"].transform
			local var_116_9 = 0

			if var_116_9 < arg_113_1.time_ and arg_113_1.time_ <= var_116_9 + arg_116_0 then
				arg_113_1.var_.moveOldPos1058ui_story = var_116_8.localPosition
			end

			local var_116_10 = 0.001

			if var_116_9 <= arg_113_1.time_ and arg_113_1.time_ < var_116_9 + var_116_10 then
				local var_116_11 = (arg_113_1.time_ - var_116_9) / var_116_10
				local var_116_12 = Vector3.New(0, -0.95, -5.88)

				var_116_8.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1058ui_story, var_116_12, var_116_11)

				local var_116_13 = manager.ui.mainCamera.transform.position - var_116_8.position

				var_116_8.forward = Vector3.New(var_116_13.x, var_116_13.y, var_116_13.z)

				local var_116_14 = var_116_8.localEulerAngles

				var_116_14.z = 0
				var_116_14.x = 0
				var_116_8.localEulerAngles = var_116_14
			end

			if arg_113_1.time_ >= var_116_9 + var_116_10 and arg_113_1.time_ < var_116_9 + var_116_10 + arg_116_0 then
				var_116_8.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_116_15 = manager.ui.mainCamera.transform.position - var_116_8.position

				var_116_8.forward = Vector3.New(var_116_15.x, var_116_15.y, var_116_15.z)

				local var_116_16 = var_116_8.localEulerAngles

				var_116_16.z = 0
				var_116_16.x = 0
				var_116_8.localEulerAngles = var_116_16
			end

			local var_116_17 = 0

			if var_116_17 < arg_113_1.time_ and arg_113_1.time_ <= var_116_17 + arg_116_0 then
				arg_113_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action4_1")
			end

			local var_116_18 = 0

			if var_116_18 < arg_113_1.time_ and arg_113_1.time_ <= var_116_18 + arg_116_0 then
				arg_113_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_116_19 = 0
			local var_116_20 = 0.8

			if var_116_19 < arg_113_1.time_ and arg_113_1.time_ <= var_116_19 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_21 = arg_113_1:FormatText(StoryNameCfg[92].name)

				arg_113_1.leftNameTxt_.text = var_116_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_22 = arg_113_1:GetWordFromCfg(107112027)
				local var_116_23 = arg_113_1:FormatText(var_116_22.content)

				arg_113_1.text_.text = var_116_23

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_24 = 32
				local var_116_25 = utf8.len(var_116_23)
				local var_116_26 = var_116_24 <= 0 and var_116_20 or var_116_20 * (var_116_25 / var_116_24)

				if var_116_26 > 0 and var_116_20 < var_116_26 then
					arg_113_1.talkMaxDuration = var_116_26

					if var_116_26 + var_116_19 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_26 + var_116_19
					end
				end

				arg_113_1.text_.text = var_116_23
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112027", "story_v_out_107112.awb") ~= 0 then
					local var_116_27 = manager.audio:GetVoiceLength("story_v_out_107112", "107112027", "story_v_out_107112.awb") / 1000

					if var_116_27 + var_116_19 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_27 + var_116_19
					end

					if var_116_22.prefab_name ~= "" and arg_113_1.actors_[var_116_22.prefab_name] ~= nil then
						local var_116_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_22.prefab_name].transform, "story_v_out_107112", "107112027", "story_v_out_107112.awb")

						arg_113_1:RecordAudio("107112027", var_116_28)
						arg_113_1:RecordAudio("107112027", var_116_28)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_107112", "107112027", "story_v_out_107112.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_107112", "107112027", "story_v_out_107112.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_29 = math.max(var_116_20, arg_113_1.talkMaxDuration)

			if var_116_19 <= arg_113_1.time_ and arg_113_1.time_ < var_116_19 + var_116_29 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_19) / var_116_29

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_19 + var_116_29 and arg_113_1.time_ < var_116_19 + var_116_29 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play107112028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 107112028
		arg_117_1.duration_ = 3.9

		local var_117_0 = {
			ja = 3.7,
			ko = 3.9,
			zh = 3.5,
			en = 3.266
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
				arg_117_0:Play107112029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058actionlink/1058action442")
			end

			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_120_2 = 0
			local var_120_3 = 0.525

			if var_120_2 < arg_117_1.time_ and arg_117_1.time_ <= var_120_2 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_4 = arg_117_1:FormatText(StoryNameCfg[92].name)

				arg_117_1.leftNameTxt_.text = var_120_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_5 = arg_117_1:GetWordFromCfg(107112028)
				local var_120_6 = arg_117_1:FormatText(var_120_5.content)

				arg_117_1.text_.text = var_120_6

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_7 = 21
				local var_120_8 = utf8.len(var_120_6)
				local var_120_9 = var_120_7 <= 0 and var_120_3 or var_120_3 * (var_120_8 / var_120_7)

				if var_120_9 > 0 and var_120_3 < var_120_9 then
					arg_117_1.talkMaxDuration = var_120_9

					if var_120_9 + var_120_2 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_9 + var_120_2
					end
				end

				arg_117_1.text_.text = var_120_6
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112028", "story_v_out_107112.awb") ~= 0 then
					local var_120_10 = manager.audio:GetVoiceLength("story_v_out_107112", "107112028", "story_v_out_107112.awb") / 1000

					if var_120_10 + var_120_2 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_10 + var_120_2
					end

					if var_120_5.prefab_name ~= "" and arg_117_1.actors_[var_120_5.prefab_name] ~= nil then
						local var_120_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_5.prefab_name].transform, "story_v_out_107112", "107112028", "story_v_out_107112.awb")

						arg_117_1:RecordAudio("107112028", var_120_11)
						arg_117_1:RecordAudio("107112028", var_120_11)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_107112", "107112028", "story_v_out_107112.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_107112", "107112028", "story_v_out_107112.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_12 = math.max(var_120_3, arg_117_1.talkMaxDuration)

			if var_120_2 <= arg_117_1.time_ and arg_117_1.time_ < var_120_2 + var_120_12 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_2) / var_120_12

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_2 + var_120_12 and arg_117_1.time_ < var_120_2 + var_120_12 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play107112029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 107112029
		arg_121_1.duration_ = 6.666

		local var_121_0 = {
			ja = 3.9,
			ko = 3.066,
			zh = 5.4,
			en = 6.666
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
			arg_121_1.auto_ = false
		end

		function arg_121_1.playNext_(arg_123_0)
			arg_121_1.onStoryFinished_()
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1058ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1058ui_story == nil then
				arg_121_1.var_.characterEffect1058ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.1

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1058ui_story then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1058ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1058ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1058ui_story.fillRatio = var_124_5
			end

			local var_124_6 = 0
			local var_124_7 = 0.45

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_8 = arg_121_1:FormatText(StoryNameCfg[93].name)

				arg_121_1.leftNameTxt_.text = var_124_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_9 = arg_121_1:GetWordFromCfg(107112029)
				local var_124_10 = arg_121_1:FormatText(var_124_9.content)

				arg_121_1.text_.text = var_124_10

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_11 = 18
				local var_124_12 = utf8.len(var_124_10)
				local var_124_13 = var_124_11 <= 0 and var_124_7 or var_124_7 * (var_124_12 / var_124_11)

				if var_124_13 > 0 and var_124_7 < var_124_13 then
					arg_121_1.talkMaxDuration = var_124_13

					if var_124_13 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_13 + var_124_6
					end
				end

				arg_121_1.text_.text = var_124_10
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_107112", "107112029", "story_v_out_107112.awb") ~= 0 then
					local var_124_14 = manager.audio:GetVoiceLength("story_v_out_107112", "107112029", "story_v_out_107112.awb") / 1000

					if var_124_14 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_14 + var_124_6
					end

					if var_124_9.prefab_name ~= "" and arg_121_1.actors_[var_124_9.prefab_name] ~= nil then
						local var_124_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_9.prefab_name].transform, "story_v_out_107112", "107112029", "story_v_out_107112.awb")

						arg_121_1:RecordAudio("107112029", var_124_15)
						arg_121_1:RecordAudio("107112029", var_124_15)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_107112", "107112029", "story_v_out_107112.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_107112", "107112029", "story_v_out_107112.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_16 = math.max(var_124_7, arg_121_1.talkMaxDuration)

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_16 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_6) / var_124_16

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_6 + var_124_16 and arg_121_1.time_ < var_124_6 + var_124_16 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C03a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0704",
		"Assets/UIResources/UI_AB/TextureConfig/Background/C06b"
	},
	voices = {
		"story_v_out_107112.awb"
	}
}
