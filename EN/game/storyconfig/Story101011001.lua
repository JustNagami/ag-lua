return {
	Play101101001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 101101001
		arg_1_1.duration_ = 6.633

		local var_1_0 = {
			ja = 5.233,
			ko = 5.633,
			zh = 6.633,
			en = 3.966
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
				arg_1_0:Play101101002(arg_1_1)
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

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story", "se_story_machinegun", "")
			end

			local var_4_8 = "B01b"

			if arg_1_1.bgs_[var_4_8] == nil then
				local var_4_9 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_8)
				var_4_9.name = var_4_8
				var_4_9.transform.parent = arg_1_1.stage_.transform
				var_4_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_8] = var_4_9
			end

			local var_4_10 = arg_1_1.bgs_.B01b
			local var_4_11 = 0

			if var_4_11 < arg_1_1.time_ and arg_1_1.time_ <= var_4_11 + arg_4_0 then
				local var_4_12 = var_4_10:GetComponent("SpriteRenderer")

				if var_4_12 then
					var_4_12.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_13 = var_4_12.material
					local var_4_14 = var_4_13:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB01b = var_4_14.a
					arg_1_1.var_.alphaMatValueB01b = var_4_13
				end

				arg_1_1.var_.alphaOldValueB01b = 0
			end

			local var_4_15 = 1.5

			if var_4_11 <= arg_1_1.time_ and arg_1_1.time_ < var_4_11 + var_4_15 then
				local var_4_16 = (arg_1_1.time_ - var_4_11) / var_4_15
				local var_4_17 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB01b, 1, var_4_16)

				if arg_1_1.var_.alphaMatValueB01b then
					local var_4_18 = arg_1_1.var_.alphaMatValueB01b
					local var_4_19 = var_4_18:GetColor("_Color")

					var_4_19.a = var_4_17

					var_4_18:SetColor("_Color", var_4_19)
				end
			end

			if arg_1_1.time_ >= var_4_11 + var_4_15 and arg_1_1.time_ < var_4_11 + var_4_15 + arg_4_0 and arg_1_1.var_.alphaMatValueB01b then
				local var_4_20 = arg_1_1.var_.alphaMatValueB01b
				local var_4_21 = var_4_20:GetColor("_Color")

				var_4_21.a = 1

				var_4_20:SetColor("_Color", var_4_21)
			end

			local var_4_22 = 0

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_23 = manager.ui.mainCamera.transform.localPosition
				local var_4_24 = Vector3.New(0, 0, 10) + Vector3.New(var_4_23.x, var_4_23.y, 0)
				local var_4_25 = arg_1_1.bgs_.B01b

				var_4_25.transform.localPosition = var_4_24
				var_4_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_26 = var_4_25:GetComponent("SpriteRenderer")

				if var_4_26 and var_4_26.sprite then
					local var_4_27 = (var_4_25.transform.localPosition - var_4_23).z
					local var_4_28 = manager.ui.mainCameraCom_
					local var_4_29 = 2 * var_4_27 * Mathf.Tan(var_4_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_30 = var_4_29 * var_4_28.aspect
					local var_4_31 = var_4_26.sprite.bounds.size.x
					local var_4_32 = var_4_26.sprite.bounds.size.y
					local var_4_33 = var_4_30 / var_4_31
					local var_4_34 = var_4_29 / var_4_32
					local var_4_35 = var_4_34 < var_4_33 and var_4_33 or var_4_34

					var_4_25.transform.localScale = Vector3.New(var_4_35, var_4_35, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B01b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_36 = manager.ui.mainCamera.transform
			local var_4_37 = 1.79999995231628

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				arg_1_1.var_.shakeOldPosMainCamera = var_4_36.localPosition
			end

			local var_4_38 = 0.600000023841858

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / 0.066
				local var_4_40, var_4_41 = math.modf(var_4_39)

				var_4_36.localPosition = Vector3.New(var_4_41 * 0.13, var_4_41 * 0.13, var_4_41 * 0.13) + arg_1_1.var_.shakeOldPosMainCamera
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 then
				var_4_36.localPosition = arg_1_1.var_.shakeOldPosMainCamera
			end

			local var_4_42 = 0

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_43 = 2

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_44 = 2
			local var_4_45 = 0.375

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_46 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_46:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_47 = arg_1_1:FormatText(StoryNameCfg[8].name)

				arg_1_1.leftNameTxt_.text = var_4_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_48 = arg_1_1:GetWordFromCfg(101101001)
				local var_4_49 = arg_1_1:FormatText(var_4_48.content)

				arg_1_1.text_.text = var_4_49

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_50 = 15
				local var_4_51 = utf8.len(var_4_49)
				local var_4_52 = var_4_50 <= 0 and var_4_45 or var_4_45 * (var_4_51 / var_4_50)

				if var_4_52 > 0 and var_4_45 < var_4_52 then
					arg_1_1.talkMaxDuration = var_4_52
					var_4_44 = var_4_44 + 0.3

					if var_4_52 + var_4_44 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_52 + var_4_44
					end
				end

				arg_1_1.text_.text = var_4_49
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101001", "story_v_out_101101.awb") ~= 0 then
					local var_4_53 = manager.audio:GetVoiceLength("story_v_out_101101", "101101001", "story_v_out_101101.awb") / 1000

					if var_4_53 + var_4_44 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_53 + var_4_44
					end

					if var_4_48.prefab_name ~= "" and arg_1_1.actors_[var_4_48.prefab_name] ~= nil then
						local var_4_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_48.prefab_name].transform, "story_v_out_101101", "101101001", "story_v_out_101101.awb")

						arg_1_1:RecordAudio("101101001", var_4_54)
						arg_1_1:RecordAudio("101101001", var_4_54)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_101101", "101101001", "story_v_out_101101.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_101101", "101101001", "story_v_out_101101.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_55 = var_4_44 + 0.3
			local var_4_56 = math.max(var_4_45, arg_1_1.talkMaxDuration)

			if var_4_55 <= arg_1_1.time_ and arg_1_1.time_ < var_4_55 + var_4_56 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_55) / var_4_56

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_55 + var_4_56 and arg_1_1.time_ < var_4_55 + var_4_56 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play101101002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101101002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play101101003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.5

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_2 = arg_7_1:GetWordFromCfg(101101002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 60
				local var_10_5 = utf8.len(var_10_3)
				local var_10_6 = var_10_4 <= 0 and var_10_1 or var_10_1 * (var_10_5 / var_10_4)

				if var_10_6 > 0 and var_10_1 < var_10_6 then
					arg_7_1.talkMaxDuration = var_10_6

					if var_10_6 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_6 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_3
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_7 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_7 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_7

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_7 and arg_7_1.time_ < var_10_0 + var_10_7 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play101101003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 101101003
		arg_11_1.duration_ = 7.833

		local var_11_0 = {
			ja = 7.833,
			ko = 3.3,
			zh = 4.1,
			en = 2.966
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
				arg_11_0:Play101101004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				local var_14_2 = "play"
				local var_14_3 = "effect"

				arg_11_1:AudioAction(var_14_2, var_14_3, "se_story", "se_story_robot_short", "")
			end

			local var_14_4 = "2021_tpose"

			if arg_11_1.actors_[var_14_4] == nil then
				local var_14_5 = Object.Instantiate(Asset.Load("Char/" .. var_14_4), arg_11_1.stage_.transform)

				var_14_5.name = var_14_4
				var_14_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_4] = var_14_5

				local var_14_6 = var_14_5:GetComponentInChildren(typeof(CharacterEffect))

				var_14_6.enabled = true

				local var_14_7 = GameObjectTools.GetOrAddComponent(var_14_5, typeof(DynamicBoneHelper))

				if var_14_7 then
					var_14_7:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_6.transform, false)

				arg_11_1.var_[var_14_4 .. "Animator"] = var_14_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_4 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_4 .. "LipSync"] = var_14_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_8 = arg_11_1.actors_["2021_tpose"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect2021_tpose == nil then
				arg_11_1.var_.characterEffect2021_tpose = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect2021_tpose then
					arg_11_1.var_.characterEffect2021_tpose.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect2021_tpose then
				arg_11_1.var_.characterEffect2021_tpose.fillFlat = false
			end

			local var_14_12 = arg_11_1.actors_["2021_tpose"].transform
			local var_14_13 = 0

			if var_14_13 < arg_11_1.time_ and arg_11_1.time_ <= var_14_13 + arg_14_0 then
				arg_11_1.var_.moveOldPos2021_tpose = var_14_12.localPosition
			end

			local var_14_14 = 0.001

			if var_14_13 <= arg_11_1.time_ and arg_11_1.time_ < var_14_13 + var_14_14 then
				local var_14_15 = (arg_11_1.time_ - var_14_13) / var_14_14
				local var_14_16 = Vector3.New(0, -0.6, 0.2)

				var_14_12.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2021_tpose, var_14_16, var_14_15)

				local var_14_17 = manager.ui.mainCamera.transform.position - var_14_12.position

				var_14_12.forward = Vector3.New(var_14_17.x, var_14_17.y, var_14_17.z)

				local var_14_18 = var_14_12.localEulerAngles

				var_14_18.z = 0
				var_14_18.x = 0
				var_14_12.localEulerAngles = var_14_18
			end

			if arg_11_1.time_ >= var_14_13 + var_14_14 and arg_11_1.time_ < var_14_13 + var_14_14 + arg_14_0 then
				var_14_12.localPosition = Vector3.New(0, -0.6, 0.2)

				local var_14_19 = manager.ui.mainCamera.transform.position - var_14_12.position

				var_14_12.forward = Vector3.New(var_14_19.x, var_14_19.y, var_14_19.z)

				local var_14_20 = var_14_12.localEulerAngles

				var_14_20.z = 0
				var_14_20.x = 0
				var_14_12.localEulerAngles = var_14_20
			end

			local var_14_21 = 0

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1:PlayTimeline("2021_tpose", "StoryTimeline/CharAction/story2021/story2021action/2021action1_1")
			end

			local var_14_22 = 0
			local var_14_23 = 0.325

			if var_14_22 < arg_11_1.time_ and arg_11_1.time_ <= var_14_22 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_24 = arg_11_1:FormatText(StoryNameCfg[29].name)

				arg_11_1.leftNameTxt_.text = var_14_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_25 = arg_11_1:GetWordFromCfg(101101003)
				local var_14_26 = arg_11_1:FormatText(var_14_25.content)

				arg_11_1.text_.text = var_14_26

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_27 = 13
				local var_14_28 = utf8.len(var_14_26)
				local var_14_29 = var_14_27 <= 0 and var_14_23 or var_14_23 * (var_14_28 / var_14_27)

				if var_14_29 > 0 and var_14_23 < var_14_29 then
					arg_11_1.talkMaxDuration = var_14_29

					if var_14_29 + var_14_22 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_29 + var_14_22
					end
				end

				arg_11_1.text_.text = var_14_26
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101003", "story_v_out_101101.awb") ~= 0 then
					local var_14_30 = manager.audio:GetVoiceLength("story_v_out_101101", "101101003", "story_v_out_101101.awb") / 1000

					if var_14_30 + var_14_22 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_30 + var_14_22
					end

					if var_14_25.prefab_name ~= "" and arg_11_1.actors_[var_14_25.prefab_name] ~= nil then
						local var_14_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_25.prefab_name].transform, "story_v_out_101101", "101101003", "story_v_out_101101.awb")

						arg_11_1:RecordAudio("101101003", var_14_31)
						arg_11_1:RecordAudio("101101003", var_14_31)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_101101", "101101003", "story_v_out_101101.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_101101", "101101003", "story_v_out_101101.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_32 = math.max(var_14_23, arg_11_1.talkMaxDuration)

			if var_14_22 <= arg_11_1.time_ and arg_11_1.time_ < var_14_22 + var_14_32 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_22) / var_14_32

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_22 + var_14_32 and arg_11_1.time_ < var_14_22 + var_14_32 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play101101004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 101101004
		arg_15_1.duration_ = 12.5

		local var_15_0 = {
			ja = 12.5,
			ko = 4.266,
			zh = 5,
			en = 5.6
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
				arg_15_0:Play101101005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				local var_18_2 = "play"
				local var_18_3 = "effect"

				arg_15_1:AudioAction(var_18_2, var_18_3, "se_story", "se_story_robot_short", "")
			end

			local var_18_4 = arg_15_1.actors_["2021_tpose"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect2021_tpose == nil then
				arg_15_1.var_.characterEffect2021_tpose = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect2021_tpose then
					arg_15_1.var_.characterEffect2021_tpose.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect2021_tpose then
				arg_15_1.var_.characterEffect2021_tpose.fillFlat = false
			end

			local var_18_8 = 0
			local var_18_9 = 0.45

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_10 = arg_15_1:FormatText(StoryNameCfg[29].name)

				arg_15_1.leftNameTxt_.text = var_18_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_11 = arg_15_1:GetWordFromCfg(101101004)
				local var_18_12 = arg_15_1:FormatText(var_18_11.content)

				arg_15_1.text_.text = var_18_12

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_13 = 18
				local var_18_14 = utf8.len(var_18_12)
				local var_18_15 = var_18_13 <= 0 and var_18_9 or var_18_9 * (var_18_14 / var_18_13)

				if var_18_15 > 0 and var_18_9 < var_18_15 then
					arg_15_1.talkMaxDuration = var_18_15

					if var_18_15 + var_18_8 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_15 + var_18_8
					end
				end

				arg_15_1.text_.text = var_18_12
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101004", "story_v_out_101101.awb") ~= 0 then
					local var_18_16 = manager.audio:GetVoiceLength("story_v_out_101101", "101101004", "story_v_out_101101.awb") / 1000

					if var_18_16 + var_18_8 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_16 + var_18_8
					end

					if var_18_11.prefab_name ~= "" and arg_15_1.actors_[var_18_11.prefab_name] ~= nil then
						local var_18_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_11.prefab_name].transform, "story_v_out_101101", "101101004", "story_v_out_101101.awb")

						arg_15_1:RecordAudio("101101004", var_18_17)
						arg_15_1:RecordAudio("101101004", var_18_17)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_101101", "101101004", "story_v_out_101101.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_101101", "101101004", "story_v_out_101101.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_18 = math.max(var_18_9, arg_15_1.talkMaxDuration)

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_18 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_8) / var_18_18

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_8 + var_18_18 and arg_15_1.time_ < var_18_8 + var_18_18 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play101101005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 101101005
		arg_19_1.duration_ = 9.966

		local var_19_0 = {
			ja = 9.966,
			ko = 5.266,
			zh = 4.566,
			en = 5.8
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
				arg_19_0:Play101101006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1148ui_story"

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

			local var_22_4 = arg_19_1.actors_["1148ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1148ui_story == nil then
				arg_19_1.var_.characterEffect1148ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1148ui_story then
					arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1148ui_story then
				arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_22_8 = "2022_tpose"

			if arg_19_1.actors_[var_22_8] == nil then
				local var_22_9 = Object.Instantiate(Asset.Load("Char/" .. var_22_8), arg_19_1.stage_.transform)

				var_22_9.name = var_22_8
				var_22_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_8] = var_22_9

				local var_22_10 = var_22_9:GetComponentInChildren(typeof(CharacterEffect))

				var_22_10.enabled = true

				local var_22_11 = GameObjectTools.GetOrAddComponent(var_22_9, typeof(DynamicBoneHelper))

				if var_22_11 then
					var_22_11:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_10.transform, false)

				arg_19_1.var_[var_22_8 .. "Animator"] = var_22_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_8 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_8 .. "LipSync"] = var_22_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_12 = arg_19_1.actors_["2022_tpose"]
			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 and arg_19_1.var_.characterEffect2022_tpose == nil then
				arg_19_1.var_.characterEffect2022_tpose = var_22_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_14 = 0.1

			if var_22_13 <= arg_19_1.time_ and arg_19_1.time_ < var_22_13 + var_22_14 then
				local var_22_15 = (arg_19_1.time_ - var_22_13) / var_22_14

				if arg_19_1.var_.characterEffect2022_tpose then
					local var_22_16 = Mathf.Lerp(0, 0.5, var_22_15)

					arg_19_1.var_.characterEffect2022_tpose.fillFlat = true
					arg_19_1.var_.characterEffect2022_tpose.fillRatio = var_22_16
				end
			end

			if arg_19_1.time_ >= var_22_13 + var_22_14 and arg_19_1.time_ < var_22_13 + var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect2022_tpose then
				local var_22_17 = 0.5

				arg_19_1.var_.characterEffect2022_tpose.fillFlat = true
				arg_19_1.var_.characterEffect2022_tpose.fillRatio = var_22_17
			end

			local var_22_18 = arg_19_1.actors_["2021_tpose"].transform
			local var_22_19 = 0

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.var_.moveOldPos2021_tpose = var_22_18.localPosition
			end

			local var_22_20 = 0.001

			if var_22_19 <= arg_19_1.time_ and arg_19_1.time_ < var_22_19 + var_22_20 then
				local var_22_21 = (arg_19_1.time_ - var_22_19) / var_22_20
				local var_22_22 = Vector3.New(0, 100, 0)

				var_22_18.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos2021_tpose, var_22_22, var_22_21)

				local var_22_23 = manager.ui.mainCamera.transform.position - var_22_18.position

				var_22_18.forward = Vector3.New(var_22_23.x, var_22_23.y, var_22_23.z)

				local var_22_24 = var_22_18.localEulerAngles

				var_22_24.z = 0
				var_22_24.x = 0
				var_22_18.localEulerAngles = var_22_24
			end

			if arg_19_1.time_ >= var_22_19 + var_22_20 and arg_19_1.time_ < var_22_19 + var_22_20 + arg_22_0 then
				var_22_18.localPosition = Vector3.New(0, 100, 0)

				local var_22_25 = manager.ui.mainCamera.transform.position - var_22_18.position

				var_22_18.forward = Vector3.New(var_22_25.x, var_22_25.y, var_22_25.z)

				local var_22_26 = var_22_18.localEulerAngles

				var_22_26.z = 0
				var_22_26.x = 0
				var_22_18.localEulerAngles = var_22_26
			end

			local var_22_27 = arg_19_1.actors_["1148ui_story"].transform
			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1.var_.moveOldPos1148ui_story = var_22_27.localPosition
			end

			local var_22_29 = 0.001

			if var_22_28 <= arg_19_1.time_ and arg_19_1.time_ < var_22_28 + var_22_29 then
				local var_22_30 = (arg_19_1.time_ - var_22_28) / var_22_29
				local var_22_31 = Vector3.New(-0.7, -0.8, -6.2)

				var_22_27.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1148ui_story, var_22_31, var_22_30)

				local var_22_32 = manager.ui.mainCamera.transform.position - var_22_27.position

				var_22_27.forward = Vector3.New(var_22_32.x, var_22_32.y, var_22_32.z)

				local var_22_33 = var_22_27.localEulerAngles

				var_22_33.z = 0
				var_22_33.x = 0
				var_22_27.localEulerAngles = var_22_33
			end

			if arg_19_1.time_ >= var_22_28 + var_22_29 and arg_19_1.time_ < var_22_28 + var_22_29 + arg_22_0 then
				var_22_27.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_22_34 = manager.ui.mainCamera.transform.position - var_22_27.position

				var_22_27.forward = Vector3.New(var_22_34.x, var_22_34.y, var_22_34.z)

				local var_22_35 = var_22_27.localEulerAngles

				var_22_35.z = 0
				var_22_35.x = 0
				var_22_27.localEulerAngles = var_22_35
			end

			local var_22_36 = 0

			if var_22_36 < arg_19_1.time_ and arg_19_1.time_ <= var_22_36 + arg_22_0 then
				arg_19_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_22_37 = 0

			if var_22_37 < arg_19_1.time_ and arg_19_1.time_ <= var_22_37 + arg_22_0 then
				arg_19_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_22_38 = 0
			local var_22_39 = 0.55

			if var_22_38 < arg_19_1.time_ and arg_19_1.time_ <= var_22_38 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_40 = arg_19_1:FormatText(StoryNameCfg[8].name)

				arg_19_1.leftNameTxt_.text = var_22_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_41 = arg_19_1:GetWordFromCfg(101101005)
				local var_22_42 = arg_19_1:FormatText(var_22_41.content)

				arg_19_1.text_.text = var_22_42

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_43 = 21
				local var_22_44 = utf8.len(var_22_42)
				local var_22_45 = var_22_43 <= 0 and var_22_39 or var_22_39 * (var_22_44 / var_22_43)

				if var_22_45 > 0 and var_22_39 < var_22_45 then
					arg_19_1.talkMaxDuration = var_22_45

					if var_22_45 + var_22_38 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_45 + var_22_38
					end
				end

				arg_19_1.text_.text = var_22_42
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101005", "story_v_out_101101.awb") ~= 0 then
					local var_22_46 = manager.audio:GetVoiceLength("story_v_out_101101", "101101005", "story_v_out_101101.awb") / 1000

					if var_22_46 + var_22_38 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_46 + var_22_38
					end

					if var_22_41.prefab_name ~= "" and arg_19_1.actors_[var_22_41.prefab_name] ~= nil then
						local var_22_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_41.prefab_name].transform, "story_v_out_101101", "101101005", "story_v_out_101101.awb")

						arg_19_1:RecordAudio("101101005", var_22_47)
						arg_19_1:RecordAudio("101101005", var_22_47)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_101101", "101101005", "story_v_out_101101.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_101101", "101101005", "story_v_out_101101.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_48 = math.max(var_22_39, arg_19_1.talkMaxDuration)

			if var_22_38 <= arg_19_1.time_ and arg_19_1.time_ < var_22_38 + var_22_48 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_38) / var_22_48

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_38 + var_22_48 and arg_19_1.time_ < var_22_38 + var_22_48 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play101101006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 101101006
		arg_23_1.duration_ = 2.266

		local var_23_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2.266,
			en = 1.999999999999
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
				arg_23_0:Play101101007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1059ui_story"

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

			local var_26_4 = arg_23_1.actors_["1059ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1059ui_story == nil then
				arg_23_1.var_.characterEffect1059ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1059ui_story then
					arg_23_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1059ui_story then
				arg_23_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["1148ui_story"]
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect1148ui_story == nil then
				arg_23_1.var_.characterEffect1148ui_story = var_26_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_10 = 0.1

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10

				if arg_23_1.var_.characterEffect1148ui_story then
					local var_26_12 = Mathf.Lerp(0, 0.5, var_26_11)

					arg_23_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1148ui_story.fillRatio = var_26_12
				end
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1148ui_story then
				local var_26_13 = 0.5

				arg_23_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1148ui_story.fillRatio = var_26_13
			end

			local var_26_14 = arg_23_1.actors_["1059ui_story"].transform
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.var_.moveOldPos1059ui_story = var_26_14.localPosition
			end

			local var_26_16 = 0.001

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16
				local var_26_18 = Vector3.New(0.7, -1.05, -6)

				var_26_14.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1059ui_story, var_26_18, var_26_17)

				local var_26_19 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_19.x, var_26_19.y, var_26_19.z)

				local var_26_20 = var_26_14.localEulerAngles

				var_26_20.z = 0
				var_26_20.x = 0
				var_26_14.localEulerAngles = var_26_20
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 then
				var_26_14.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_26_21 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_21.x, var_26_21.y, var_26_21.z)

				local var_26_22 = var_26_14.localEulerAngles

				var_26_22.z = 0
				var_26_22.x = 0
				var_26_14.localEulerAngles = var_26_22
			end

			local var_26_23 = 0

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 then
				arg_23_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_26_25 = 0
			local var_26_26 = 0.15

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_27 = arg_23_1:FormatText(StoryNameCfg[28].name)

				arg_23_1.leftNameTxt_.text = var_26_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_28 = arg_23_1:GetWordFromCfg(101101006)
				local var_26_29 = arg_23_1:FormatText(var_26_28.content)

				arg_23_1.text_.text = var_26_29

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_30 = 6
				local var_26_31 = utf8.len(var_26_29)
				local var_26_32 = var_26_30 <= 0 and var_26_26 or var_26_26 * (var_26_31 / var_26_30)

				if var_26_32 > 0 and var_26_26 < var_26_32 then
					arg_23_1.talkMaxDuration = var_26_32

					if var_26_32 + var_26_25 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_32 + var_26_25
					end
				end

				arg_23_1.text_.text = var_26_29
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101006", "story_v_out_101101.awb") ~= 0 then
					local var_26_33 = manager.audio:GetVoiceLength("story_v_out_101101", "101101006", "story_v_out_101101.awb") / 1000

					if var_26_33 + var_26_25 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_33 + var_26_25
					end

					if var_26_28.prefab_name ~= "" and arg_23_1.actors_[var_26_28.prefab_name] ~= nil then
						local var_26_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_28.prefab_name].transform, "story_v_out_101101", "101101006", "story_v_out_101101.awb")

						arg_23_1:RecordAudio("101101006", var_26_34)
						arg_23_1:RecordAudio("101101006", var_26_34)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_101101", "101101006", "story_v_out_101101.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_101101", "101101006", "story_v_out_101101.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_35 = math.max(var_26_26, arg_23_1.talkMaxDuration)

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_35 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_25) / var_26_35

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_25 + var_26_35 and arg_23_1.time_ < var_26_25 + var_26_35 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play101101007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 101101007
		arg_27_1.duration_ = 7.666

		local var_27_0 = {
			ja = 7.666,
			ko = 4.366,
			zh = 5.4,
			en = 4.633
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
				arg_27_0:Play101101008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action464")
			end

			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_30_2 = 0
			local var_30_3 = 0.45

			if var_30_2 < arg_27_1.time_ and arg_27_1.time_ <= var_30_2 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_4 = arg_27_1:FormatText(StoryNameCfg[28].name)

				arg_27_1.leftNameTxt_.text = var_30_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_5 = arg_27_1:GetWordFromCfg(101101007)
				local var_30_6 = arg_27_1:FormatText(var_30_5.content)

				arg_27_1.text_.text = var_30_6

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_7 = 18
				local var_30_8 = utf8.len(var_30_6)
				local var_30_9 = var_30_7 <= 0 and var_30_3 or var_30_3 * (var_30_8 / var_30_7)

				if var_30_9 > 0 and var_30_3 < var_30_9 then
					arg_27_1.talkMaxDuration = var_30_9

					if var_30_9 + var_30_2 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_9 + var_30_2
					end
				end

				arg_27_1.text_.text = var_30_6
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101007", "story_v_out_101101.awb") ~= 0 then
					local var_30_10 = manager.audio:GetVoiceLength("story_v_out_101101", "101101007", "story_v_out_101101.awb") / 1000

					if var_30_10 + var_30_2 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_10 + var_30_2
					end

					if var_30_5.prefab_name ~= "" and arg_27_1.actors_[var_30_5.prefab_name] ~= nil then
						local var_30_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_5.prefab_name].transform, "story_v_out_101101", "101101007", "story_v_out_101101.awb")

						arg_27_1:RecordAudio("101101007", var_30_11)
						arg_27_1:RecordAudio("101101007", var_30_11)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_101101", "101101007", "story_v_out_101101.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_101101", "101101007", "story_v_out_101101.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_12 = math.max(var_30_3, arg_27_1.talkMaxDuration)

			if var_30_2 <= arg_27_1.time_ and arg_27_1.time_ < var_30_2 + var_30_12 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_2) / var_30_12

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_2 + var_30_12 and arg_27_1.time_ < var_30_2 + var_30_12 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play101101008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 101101008
		arg_31_1.duration_ = 4.9

		local var_31_0 = {
			ja = 4.6,
			ko = 3.233,
			zh = 3.433,
			en = 4.9
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
				arg_31_0:Play101101009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1148ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1148ui_story == nil then
				arg_31_1.var_.characterEffect1148ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1148ui_story then
					arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1148ui_story then
				arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1059ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect1059ui_story == nil then
				arg_31_1.var_.characterEffect1059ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1059ui_story then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1059ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect1059ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1059ui_story.fillRatio = var_34_9
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action459")
			end

			local var_34_11 = 0

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_34_12 = 0
			local var_34_13 = 0.375

			if var_34_12 < arg_31_1.time_ and arg_31_1.time_ <= var_34_12 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_14 = arg_31_1:FormatText(StoryNameCfg[8].name)

				arg_31_1.leftNameTxt_.text = var_34_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_15 = arg_31_1:GetWordFromCfg(101101008)
				local var_34_16 = arg_31_1:FormatText(var_34_15.content)

				arg_31_1.text_.text = var_34_16

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_17 = 15
				local var_34_18 = utf8.len(var_34_16)
				local var_34_19 = var_34_17 <= 0 and var_34_13 or var_34_13 * (var_34_18 / var_34_17)

				if var_34_19 > 0 and var_34_13 < var_34_19 then
					arg_31_1.talkMaxDuration = var_34_19

					if var_34_19 + var_34_12 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_12
					end
				end

				arg_31_1.text_.text = var_34_16
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101008", "story_v_out_101101.awb") ~= 0 then
					local var_34_20 = manager.audio:GetVoiceLength("story_v_out_101101", "101101008", "story_v_out_101101.awb") / 1000

					if var_34_20 + var_34_12 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_20 + var_34_12
					end

					if var_34_15.prefab_name ~= "" and arg_31_1.actors_[var_34_15.prefab_name] ~= nil then
						local var_34_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_15.prefab_name].transform, "story_v_out_101101", "101101008", "story_v_out_101101.awb")

						arg_31_1:RecordAudio("101101008", var_34_21)
						arg_31_1:RecordAudio("101101008", var_34_21)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_101101", "101101008", "story_v_out_101101.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_101101", "101101008", "story_v_out_101101.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_22 = math.max(var_34_13, arg_31_1.talkMaxDuration)

			if var_34_12 <= arg_31_1.time_ and arg_31_1.time_ < var_34_12 + var_34_22 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_12) / var_34_22

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_12 + var_34_22 and arg_31_1.time_ < var_34_12 + var_34_22 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play101101009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 101101009
		arg_35_1.duration_ = 2.6

		local var_35_0 = {
			ja = 2.6,
			ko = 2,
			zh = 2.066,
			en = 2.266
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
				arg_35_0:Play101101010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1059ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1059ui_story == nil then
				arg_35_1.var_.characterEffect1059ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1059ui_story then
					arg_35_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1059ui_story then
				arg_35_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1148ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1148ui_story == nil then
				arg_35_1.var_.characterEffect1148ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1148ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1148ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1148ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1148ui_story.fillRatio = var_38_9
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action442")
			end

			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_38_12 = 0
			local var_38_13 = 0.15

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_14 = arg_35_1:FormatText(StoryNameCfg[28].name)

				arg_35_1.leftNameTxt_.text = var_38_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_15 = arg_35_1:GetWordFromCfg(101101009)
				local var_38_16 = arg_35_1:FormatText(var_38_15.content)

				arg_35_1.text_.text = var_38_16

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_17 = 6
				local var_38_18 = utf8.len(var_38_16)
				local var_38_19 = var_38_17 <= 0 and var_38_13 or var_38_13 * (var_38_18 / var_38_17)

				if var_38_19 > 0 and var_38_13 < var_38_19 then
					arg_35_1.talkMaxDuration = var_38_19

					if var_38_19 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_12
					end
				end

				arg_35_1.text_.text = var_38_16
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101009", "story_v_out_101101.awb") ~= 0 then
					local var_38_20 = manager.audio:GetVoiceLength("story_v_out_101101", "101101009", "story_v_out_101101.awb") / 1000

					if var_38_20 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_20 + var_38_12
					end

					if var_38_15.prefab_name ~= "" and arg_35_1.actors_[var_38_15.prefab_name] ~= nil then
						local var_38_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_15.prefab_name].transform, "story_v_out_101101", "101101009", "story_v_out_101101.awb")

						arg_35_1:RecordAudio("101101009", var_38_21)
						arg_35_1:RecordAudio("101101009", var_38_21)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_101101", "101101009", "story_v_out_101101.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_101101", "101101009", "story_v_out_101101.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_22 = math.max(var_38_13, arg_35_1.talkMaxDuration)

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_22 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_12) / var_38_22

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_12 + var_38_22 and arg_35_1.time_ < var_38_12 + var_38_22 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play101101010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 101101010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play101101011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				local var_42_2 = "play"
				local var_42_3 = "effect"

				arg_39_1:AudioAction(var_42_2, var_42_3, "se_story_1", "se_story_1_apollo_bow", "")
			end

			local var_42_4 = arg_39_1.actors_["1059ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1059ui_story == nil then
				arg_39_1.var_.characterEffect1059ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1059ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1059ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1059ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1059ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = false

				arg_39_1:SetGaussion(false)
			end

			local var_42_11 = 0.5

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11
				local var_42_13 = Color.New(1, 1, 1)

				var_42_13.a = Mathf.Lerp(1, 0, var_42_12)
				arg_39_1.mask_.color = var_42_13
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 then
				local var_42_14 = Color.New(1, 1, 1)
				local var_42_15 = 0

				arg_39_1.mask_.enabled = false
				var_42_14.a = var_42_15
				arg_39_1.mask_.color = var_42_14
			end

			local var_42_16 = arg_39_1.actors_["1059ui_story"].transform
			local var_42_17 = 0

			if var_42_17 < arg_39_1.time_ and arg_39_1.time_ <= var_42_17 + arg_42_0 then
				arg_39_1.var_.moveOldPos1059ui_story = var_42_16.localPosition
			end

			local var_42_18 = 0.001

			if var_42_17 <= arg_39_1.time_ and arg_39_1.time_ < var_42_17 + var_42_18 then
				local var_42_19 = (arg_39_1.time_ - var_42_17) / var_42_18
				local var_42_20 = Vector3.New(0, 100, 0)

				var_42_16.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1059ui_story, var_42_20, var_42_19)

				local var_42_21 = manager.ui.mainCamera.transform.position - var_42_16.position

				var_42_16.forward = Vector3.New(var_42_21.x, var_42_21.y, var_42_21.z)

				local var_42_22 = var_42_16.localEulerAngles

				var_42_22.z = 0
				var_42_22.x = 0
				var_42_16.localEulerAngles = var_42_22
			end

			if arg_39_1.time_ >= var_42_17 + var_42_18 and arg_39_1.time_ < var_42_17 + var_42_18 + arg_42_0 then
				var_42_16.localPosition = Vector3.New(0, 100, 0)

				local var_42_23 = manager.ui.mainCamera.transform.position - var_42_16.position

				var_42_16.forward = Vector3.New(var_42_23.x, var_42_23.y, var_42_23.z)

				local var_42_24 = var_42_16.localEulerAngles

				var_42_24.z = 0
				var_42_24.x = 0
				var_42_16.localEulerAngles = var_42_24
			end

			local var_42_25 = arg_39_1.actors_["1148ui_story"].transform
			local var_42_26 = 0

			if var_42_26 < arg_39_1.time_ and arg_39_1.time_ <= var_42_26 + arg_42_0 then
				arg_39_1.var_.moveOldPos1148ui_story = var_42_25.localPosition
			end

			local var_42_27 = 0.001

			if var_42_26 <= arg_39_1.time_ and arg_39_1.time_ < var_42_26 + var_42_27 then
				local var_42_28 = (arg_39_1.time_ - var_42_26) / var_42_27
				local var_42_29 = Vector3.New(0, 100, 0)

				var_42_25.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1148ui_story, var_42_29, var_42_28)

				local var_42_30 = manager.ui.mainCamera.transform.position - var_42_25.position

				var_42_25.forward = Vector3.New(var_42_30.x, var_42_30.y, var_42_30.z)

				local var_42_31 = var_42_25.localEulerAngles

				var_42_31.z = 0
				var_42_31.x = 0
				var_42_25.localEulerAngles = var_42_31
			end

			if arg_39_1.time_ >= var_42_26 + var_42_27 and arg_39_1.time_ < var_42_26 + var_42_27 + arg_42_0 then
				var_42_25.localPosition = Vector3.New(0, 100, 0)

				local var_42_32 = manager.ui.mainCamera.transform.position - var_42_25.position

				var_42_25.forward = Vector3.New(var_42_32.x, var_42_32.y, var_42_32.z)

				local var_42_33 = var_42_25.localEulerAngles

				var_42_33.z = 0
				var_42_33.x = 0
				var_42_25.localEulerAngles = var_42_33
			end

			local var_42_34 = 0
			local var_42_35 = 0.675

			if var_42_34 < arg_39_1.time_ and arg_39_1.time_ <= var_42_34 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_36 = arg_39_1:GetWordFromCfg(101101010)
				local var_42_37 = arg_39_1:FormatText(var_42_36.content)

				arg_39_1.text_.text = var_42_37

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_38 = 27
				local var_42_39 = utf8.len(var_42_37)
				local var_42_40 = var_42_38 <= 0 and var_42_35 or var_42_35 * (var_42_39 / var_42_38)

				if var_42_40 > 0 and var_42_35 < var_42_40 then
					arg_39_1.talkMaxDuration = var_42_40

					if var_42_40 + var_42_34 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_40 + var_42_34
					end
				end

				arg_39_1.text_.text = var_42_37
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_41 = math.max(var_42_35, arg_39_1.talkMaxDuration)

			if var_42_34 <= arg_39_1.time_ and arg_39_1.time_ < var_42_34 + var_42_41 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_34) / var_42_41

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_34 + var_42_41 and arg_39_1.time_ < var_42_34 + var_42_41 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play101101011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 101101011
		arg_43_1.duration_ = 8.533

		local var_43_0 = {
			ja = 8.533,
			ko = 3.933,
			zh = 5,
			en = 4.033
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
				arg_43_0:Play101101012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1059ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1059ui_story == nil then
				arg_43_1.var_.characterEffect1059ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1059ui_story then
					arg_43_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1059ui_story then
				arg_43_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1059ui_story"].transform
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1.var_.moveOldPos1059ui_story = var_46_4.localPosition
			end

			local var_46_6 = 0.001

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6
				local var_46_8 = Vector3.New(0.7, -1.05, -6)

				var_46_4.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1059ui_story, var_46_8, var_46_7)

				local var_46_9 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_9.x, var_46_9.y, var_46_9.z)

				local var_46_10 = var_46_4.localEulerAngles

				var_46_10.z = 0
				var_46_10.x = 0
				var_46_4.localEulerAngles = var_46_10
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 then
				var_46_4.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_46_11 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_11.x, var_46_11.y, var_46_11.z)

				local var_46_12 = var_46_4.localEulerAngles

				var_46_12.z = 0
				var_46_12.x = 0
				var_46_4.localEulerAngles = var_46_12
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_46_15 = 0

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_46_16 = arg_43_1.actors_["1148ui_story"].transform
			local var_46_17 = 0

			if var_46_17 < arg_43_1.time_ and arg_43_1.time_ <= var_46_17 + arg_46_0 then
				arg_43_1.var_.moveOldPos1148ui_story = var_46_16.localPosition
			end

			local var_46_18 = 0.001

			if var_46_17 <= arg_43_1.time_ and arg_43_1.time_ < var_46_17 + var_46_18 then
				local var_46_19 = (arg_43_1.time_ - var_46_17) / var_46_18
				local var_46_20 = Vector3.New(-0.7, -0.8, -6.2)

				var_46_16.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1148ui_story, var_46_20, var_46_19)

				local var_46_21 = manager.ui.mainCamera.transform.position - var_46_16.position

				var_46_16.forward = Vector3.New(var_46_21.x, var_46_21.y, var_46_21.z)

				local var_46_22 = var_46_16.localEulerAngles

				var_46_22.z = 0
				var_46_22.x = 0
				var_46_16.localEulerAngles = var_46_22
			end

			if arg_43_1.time_ >= var_46_17 + var_46_18 and arg_43_1.time_ < var_46_17 + var_46_18 + arg_46_0 then
				var_46_16.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_46_23 = manager.ui.mainCamera.transform.position - var_46_16.position

				var_46_16.forward = Vector3.New(var_46_23.x, var_46_23.y, var_46_23.z)

				local var_46_24 = var_46_16.localEulerAngles

				var_46_24.z = 0
				var_46_24.x = 0
				var_46_16.localEulerAngles = var_46_24
			end

			local var_46_25 = 0
			local var_46_26 = 0.625

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_27 = arg_43_1:FormatText(StoryNameCfg[28].name)

				arg_43_1.leftNameTxt_.text = var_46_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_28 = arg_43_1:GetWordFromCfg(101101011)
				local var_46_29 = arg_43_1:FormatText(var_46_28.content)

				arg_43_1.text_.text = var_46_29

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_30 = 25
				local var_46_31 = utf8.len(var_46_29)
				local var_46_32 = var_46_30 <= 0 and var_46_26 or var_46_26 * (var_46_31 / var_46_30)

				if var_46_32 > 0 and var_46_26 < var_46_32 then
					arg_43_1.talkMaxDuration = var_46_32

					if var_46_32 + var_46_25 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_32 + var_46_25
					end
				end

				arg_43_1.text_.text = var_46_29
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101011", "story_v_out_101101.awb") ~= 0 then
					local var_46_33 = manager.audio:GetVoiceLength("story_v_out_101101", "101101011", "story_v_out_101101.awb") / 1000

					if var_46_33 + var_46_25 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_33 + var_46_25
					end

					if var_46_28.prefab_name ~= "" and arg_43_1.actors_[var_46_28.prefab_name] ~= nil then
						local var_46_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_28.prefab_name].transform, "story_v_out_101101", "101101011", "story_v_out_101101.awb")

						arg_43_1:RecordAudio("101101011", var_46_34)
						arg_43_1:RecordAudio("101101011", var_46_34)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_101101", "101101011", "story_v_out_101101.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_101101", "101101011", "story_v_out_101101.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_35 = math.max(var_46_26, arg_43_1.talkMaxDuration)

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_35 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_25) / var_46_35

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_25 + var_46_35 and arg_43_1.time_ < var_46_25 + var_46_35 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play101101012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 101101012
		arg_47_1.duration_ = 6.566

		local var_47_0 = {
			ja = 6.566,
			ko = 5.266,
			zh = 3.533,
			en = 3.233
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
				arg_47_0:Play101101013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1148ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1148ui_story == nil then
				arg_47_1.var_.characterEffect1148ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1148ui_story then
					arg_47_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1148ui_story then
				arg_47_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1059ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect1059ui_story == nil then
				arg_47_1.var_.characterEffect1059ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.1

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect1059ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1059ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect1059ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1059ui_story.fillRatio = var_50_9
			end

			local var_50_10 = arg_47_1.actors_["1148ui_story"].transform
			local var_50_11 = 0

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1.var_.moveOldPos1148ui_story = var_50_10.localPosition
			end

			local var_50_12 = 0.001

			if var_50_11 <= arg_47_1.time_ and arg_47_1.time_ < var_50_11 + var_50_12 then
				local var_50_13 = (arg_47_1.time_ - var_50_11) / var_50_12
				local var_50_14 = Vector3.New(-0.7, -0.8, -6.2)

				var_50_10.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1148ui_story, var_50_14, var_50_13)

				local var_50_15 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_15.x, var_50_15.y, var_50_15.z)

				local var_50_16 = var_50_10.localEulerAngles

				var_50_16.z = 0
				var_50_16.x = 0
				var_50_10.localEulerAngles = var_50_16
			end

			if arg_47_1.time_ >= var_50_11 + var_50_12 and arg_47_1.time_ < var_50_11 + var_50_12 + arg_50_0 then
				var_50_10.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_50_17 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_17.x, var_50_17.y, var_50_17.z)

				local var_50_18 = var_50_10.localEulerAngles

				var_50_18.z = 0
				var_50_18.x = 0
				var_50_10.localEulerAngles = var_50_18
			end

			local var_50_19 = 0

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_50_20 = 0
			local var_50_21 = 0.325

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_22 = arg_47_1:FormatText(StoryNameCfg[8].name)

				arg_47_1.leftNameTxt_.text = var_50_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_23 = arg_47_1:GetWordFromCfg(101101012)
				local var_50_24 = arg_47_1:FormatText(var_50_23.content)

				arg_47_1.text_.text = var_50_24

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_25 = 13
				local var_50_26 = utf8.len(var_50_24)
				local var_50_27 = var_50_25 <= 0 and var_50_21 or var_50_21 * (var_50_26 / var_50_25)

				if var_50_27 > 0 and var_50_21 < var_50_27 then
					arg_47_1.talkMaxDuration = var_50_27

					if var_50_27 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_20
					end
				end

				arg_47_1.text_.text = var_50_24
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101012", "story_v_out_101101.awb") ~= 0 then
					local var_50_28 = manager.audio:GetVoiceLength("story_v_out_101101", "101101012", "story_v_out_101101.awb") / 1000

					if var_50_28 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_20
					end

					if var_50_23.prefab_name ~= "" and arg_47_1.actors_[var_50_23.prefab_name] ~= nil then
						local var_50_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_23.prefab_name].transform, "story_v_out_101101", "101101012", "story_v_out_101101.awb")

						arg_47_1:RecordAudio("101101012", var_50_29)
						arg_47_1:RecordAudio("101101012", var_50_29)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_101101", "101101012", "story_v_out_101101.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_101101", "101101012", "story_v_out_101101.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_30 = math.max(var_50_21, arg_47_1.talkMaxDuration)

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_30 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_20) / var_50_30

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_20 + var_50_30 and arg_47_1.time_ < var_50_20 + var_50_30 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play101101013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 101101013
		arg_51_1.duration_ = 8.033

		local var_51_0 = {
			ja = 8.033,
			ko = 2.9,
			zh = 4.466,
			en = 3.566
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
				arg_51_0:Play101101014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1059ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1059ui_story == nil then
				arg_51_1.var_.characterEffect1059ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1059ui_story then
					arg_51_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1059ui_story then
				arg_51_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["1148ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect1148ui_story == nil then
				arg_51_1.var_.characterEffect1148ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect1148ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1148ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect1148ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1148ui_story.fillRatio = var_54_9
			end

			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_54_11 = 0
			local var_54_12 = 0.55

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_13 = arg_51_1:FormatText(StoryNameCfg[28].name)

				arg_51_1.leftNameTxt_.text = var_54_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_14 = arg_51_1:GetWordFromCfg(101101013)
				local var_54_15 = arg_51_1:FormatText(var_54_14.content)

				arg_51_1.text_.text = var_54_15

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_16 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101013", "story_v_out_101101.awb") ~= 0 then
					local var_54_19 = manager.audio:GetVoiceLength("story_v_out_101101", "101101013", "story_v_out_101101.awb") / 1000

					if var_54_19 + var_54_11 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_11
					end

					if var_54_14.prefab_name ~= "" and arg_51_1.actors_[var_54_14.prefab_name] ~= nil then
						local var_54_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_14.prefab_name].transform, "story_v_out_101101", "101101013", "story_v_out_101101.awb")

						arg_51_1:RecordAudio("101101013", var_54_20)
						arg_51_1:RecordAudio("101101013", var_54_20)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_101101", "101101013", "story_v_out_101101.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_101101", "101101013", "story_v_out_101101.awb")
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
	Play101101014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 101101014
		arg_55_1.duration_ = 5.533

		local var_55_0 = {
			ja = 5.533,
			ko = 5.133,
			zh = 4.833,
			en = 4.433
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
				arg_55_0:Play101101015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1148ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1148ui_story == nil then
				arg_55_1.var_.characterEffect1148ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1148ui_story then
					arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1148ui_story then
				arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1059ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect1059ui_story == nil then
				arg_55_1.var_.characterEffect1059ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1059ui_story then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1059ui_story.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect1059ui_story then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1059ui_story.fillRatio = var_58_9
			end

			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action497")
			end

			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_58_12 = 0
			local var_58_13 = 0.575

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[8].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(101101014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101014", "story_v_out_101101.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_101101", "101101014", "story_v_out_101101.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_101101", "101101014", "story_v_out_101101.awb")

						arg_55_1:RecordAudio("101101014", var_58_21)
						arg_55_1:RecordAudio("101101014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_101101", "101101014", "story_v_out_101101.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_101101", "101101014", "story_v_out_101101.awb")
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
	Play101101015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 101101015
		arg_59_1.duration_ = 4.366

		local var_59_0 = {
			ja = 4.366,
			ko = 4,
			zh = 3.4,
			en = 2.9
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
				arg_59_0:Play101101016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1059ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1059ui_story == nil then
				arg_59_1.var_.characterEffect1059ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1059ui_story then
					arg_59_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1059ui_story then
				arg_59_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["1148ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1148ui_story == nil then
				arg_59_1.var_.characterEffect1148ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1148ui_story then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1148ui_story.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1148ui_story then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1148ui_story.fillRatio = var_62_9
			end

			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action464")
			end

			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_62_12 = 0
			local var_62_13 = 0.425

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[28].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(101101015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101015", "story_v_out_101101.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_101101", "101101015", "story_v_out_101101.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_101101", "101101015", "story_v_out_101101.awb")

						arg_59_1:RecordAudio("101101015", var_62_21)
						arg_59_1:RecordAudio("101101015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_101101", "101101015", "story_v_out_101101.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_101101", "101101015", "story_v_out_101101.awb")
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
	Play101101016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 101101016
		arg_63_1.duration_ = 7.333

		local var_63_0 = {
			ja = 6.433,
			ko = 4.966,
			zh = 5.466,
			en = 7.333
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
				arg_63_0:Play101101017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1148ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1148ui_story == nil then
				arg_63_1.var_.characterEffect1148ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1148ui_story then
					arg_63_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1148ui_story then
				arg_63_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1059ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1059ui_story == nil then
				arg_63_1.var_.characterEffect1059ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1059ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1059ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1059ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1059ui_story.fillRatio = var_66_9
			end

			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action479")
			end

			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_66_12 = 0
			local var_66_13 = 0.65

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[8].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(101101016)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 26
				local var_66_18 = utf8.len(var_66_16)
				local var_66_19 = var_66_17 <= 0 and var_66_13 or var_66_13 * (var_66_18 / var_66_17)

				if var_66_19 > 0 and var_66_13 < var_66_19 then
					arg_63_1.talkMaxDuration = var_66_19

					if var_66_19 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_16
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101016", "story_v_out_101101.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_out_101101", "101101016", "story_v_out_101101.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_out_101101", "101101016", "story_v_out_101101.awb")

						arg_63_1:RecordAudio("101101016", var_66_21)
						arg_63_1:RecordAudio("101101016", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_101101", "101101016", "story_v_out_101101.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_101101", "101101016", "story_v_out_101101.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_22 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_22 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_22

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_22 and arg_63_1.time_ < var_66_12 + var_66_22 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play101101017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 101101017
		arg_67_1.duration_ = 7.9

		local var_67_0 = {
			ja = 2.9,
			ko = 7.4,
			zh = 7.9,
			en = 7.266
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
				arg_67_0:Play101101018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1059ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1059ui_story == nil then
				arg_67_1.var_.characterEffect1059ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1059ui_story then
					arg_67_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1059ui_story then
				arg_67_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1148ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect1148ui_story == nil then
				arg_67_1.var_.characterEffect1148ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1148ui_story then
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1148ui_story.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1148ui_story then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1148ui_story.fillRatio = var_70_9
			end

			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action445")
			end

			local var_70_11 = 0

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_70_12 = 0
			local var_70_13 = 0.65

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[28].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(101101017)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 26
				local var_70_18 = utf8.len(var_70_16)
				local var_70_19 = var_70_17 <= 0 and var_70_13 or var_70_13 * (var_70_18 / var_70_17)

				if var_70_19 > 0 and var_70_13 < var_70_19 then
					arg_67_1.talkMaxDuration = var_70_19

					if var_70_19 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_12
					end
				end

				arg_67_1.text_.text = var_70_16
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101017", "story_v_out_101101.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_101101", "101101017", "story_v_out_101101.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_101101", "101101017", "story_v_out_101101.awb")

						arg_67_1:RecordAudio("101101017", var_70_21)
						arg_67_1:RecordAudio("101101017", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_101101", "101101017", "story_v_out_101101.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_101101", "101101017", "story_v_out_101101.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_22 = math.max(var_70_13, arg_67_1.talkMaxDuration)

			if var_70_12 <= arg_67_1.time_ and arg_67_1.time_ < var_70_12 + var_70_22 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_12) / var_70_22

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_12 + var_70_22 and arg_67_1.time_ < var_70_12 + var_70_22 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play101101018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 101101018
		arg_71_1.duration_ = 9.666

		local var_71_0 = {
			ja = 9.666,
			ko = 4.133,
			zh = 3.866,
			en = 4.133
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
				arg_71_0:Play101101019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_74_1 = 0
			local var_74_2 = 0.475

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_3 = arg_71_1:FormatText(StoryNameCfg[28].name)

				arg_71_1.leftNameTxt_.text = var_74_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_4 = arg_71_1:GetWordFromCfg(101101018)
				local var_74_5 = arg_71_1:FormatText(var_74_4.content)

				arg_71_1.text_.text = var_74_5

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_6 = 19
				local var_74_7 = utf8.len(var_74_5)
				local var_74_8 = var_74_6 <= 0 and var_74_2 or var_74_2 * (var_74_7 / var_74_6)

				if var_74_8 > 0 and var_74_2 < var_74_8 then
					arg_71_1.talkMaxDuration = var_74_8

					if var_74_8 + var_74_1 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_1
					end
				end

				arg_71_1.text_.text = var_74_5
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101018", "story_v_out_101101.awb") ~= 0 then
					local var_74_9 = manager.audio:GetVoiceLength("story_v_out_101101", "101101018", "story_v_out_101101.awb") / 1000

					if var_74_9 + var_74_1 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_9 + var_74_1
					end

					if var_74_4.prefab_name ~= "" and arg_71_1.actors_[var_74_4.prefab_name] ~= nil then
						local var_74_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_4.prefab_name].transform, "story_v_out_101101", "101101018", "story_v_out_101101.awb")

						arg_71_1:RecordAudio("101101018", var_74_10)
						arg_71_1:RecordAudio("101101018", var_74_10)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_101101", "101101018", "story_v_out_101101.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_101101", "101101018", "story_v_out_101101.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_11 = math.max(var_74_2, arg_71_1.talkMaxDuration)

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_11 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_1) / var_74_11

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_1 + var_74_11 and arg_71_1.time_ < var_74_1 + var_74_11 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play101101019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 101101019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play101101020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1059ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1059ui_story == nil then
				arg_75_1.var_.characterEffect1059ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1059ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1059ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1059ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1059ui_story.fillRatio = var_78_5
			end

			local var_78_6 = arg_75_1.actors_["1059ui_story"].transform
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 then
				arg_75_1.var_.moveOldPos1059ui_story = var_78_6.localPosition
			end

			local var_78_8 = 0.001

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8
				local var_78_10 = Vector3.New(0, 100, 0)

				var_78_6.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1059ui_story, var_78_10, var_78_9)

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

			local var_78_15 = arg_75_1.actors_["1148ui_story"].transform
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.var_.moveOldPos1148ui_story = var_78_15.localPosition
			end

			local var_78_17 = 0.001

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Vector3.New(0, 100, 0)

				var_78_15.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1148ui_story, var_78_19, var_78_18)

				local var_78_20 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_20.x, var_78_20.y, var_78_20.z)

				local var_78_21 = var_78_15.localEulerAngles

				var_78_21.z = 0
				var_78_21.x = 0
				var_78_15.localEulerAngles = var_78_21
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				var_78_15.localPosition = Vector3.New(0, 100, 0)

				local var_78_22 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_22.x, var_78_22.y, var_78_22.z)

				local var_78_23 = var_78_15.localEulerAngles

				var_78_23.z = 0
				var_78_23.x = 0
				var_78_15.localEulerAngles = var_78_23
			end

			local var_78_24 = 0
			local var_78_25 = 0.075

			if var_78_24 < arg_75_1.time_ and arg_75_1.time_ <= var_78_24 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_26 = arg_75_1:GetWordFromCfg(101101019)
				local var_78_27 = arg_75_1:FormatText(var_78_26.content)

				arg_75_1.text_.text = var_78_27

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_28 = 3
				local var_78_29 = utf8.len(var_78_27)
				local var_78_30 = var_78_28 <= 0 and var_78_25 or var_78_25 * (var_78_29 / var_78_28)

				if var_78_30 > 0 and var_78_25 < var_78_30 then
					arg_75_1.talkMaxDuration = var_78_30

					if var_78_30 + var_78_24 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_30 + var_78_24
					end
				end

				arg_75_1.text_.text = var_78_27
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_31 = math.max(var_78_25, arg_75_1.talkMaxDuration)

			if var_78_24 <= arg_75_1.time_ and arg_75_1.time_ < var_78_24 + var_78_31 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_24) / var_78_31

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_24 + var_78_31 and arg_75_1.time_ < var_78_24 + var_78_31 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play101101020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 101101020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play101101021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 1

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				local var_82_2 = "play"
				local var_82_3 = "effect"

				arg_79_1:AudioAction(var_82_2, var_82_3, "se_story_1", "se_story_1_apollo_bow", "")
			end

			local var_82_4 = 0
			local var_82_5 = 0.7

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_6 = arg_79_1:GetWordFromCfg(101101020)
				local var_82_7 = arg_79_1:FormatText(var_82_6.content)

				arg_79_1.text_.text = var_82_7

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_8 = 28
				local var_82_9 = utf8.len(var_82_7)
				local var_82_10 = var_82_8 <= 0 and var_82_5 or var_82_5 * (var_82_9 / var_82_8)

				if var_82_10 > 0 and var_82_5 < var_82_10 then
					arg_79_1.talkMaxDuration = var_82_10

					if var_82_10 + var_82_4 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_10 + var_82_4
					end
				end

				arg_79_1.text_.text = var_82_7
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_11 = math.max(var_82_5, arg_79_1.talkMaxDuration)

			if var_82_4 <= arg_79_1.time_ and arg_79_1.time_ < var_82_4 + var_82_11 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_4) / var_82_11

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_4 + var_82_11 and arg_79_1.time_ < var_82_4 + var_82_11 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play101101021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 101101021
		arg_83_1.duration_ = 8.8

		local var_83_0 = {
			ja = 8.8,
			ko = 7.766,
			zh = 5,
			en = 4.933
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
				arg_83_0:Play101101022(arg_83_1)
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

			local var_86_4 = arg_83_1.actors_["1148ui_story"].transform
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 then
				arg_83_1.var_.moveOldPos1148ui_story = var_86_4.localPosition
			end

			local var_86_6 = 0.001

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6
				local var_86_8 = Vector3.New(-0.7, -0.8, -6.2)

				var_86_4.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1148ui_story, var_86_8, var_86_7)

				local var_86_9 = manager.ui.mainCamera.transform.position - var_86_4.position

				var_86_4.forward = Vector3.New(var_86_9.x, var_86_9.y, var_86_9.z)

				local var_86_10 = var_86_4.localEulerAngles

				var_86_10.z = 0
				var_86_10.x = 0
				var_86_4.localEulerAngles = var_86_10
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 then
				var_86_4.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_86_11 = manager.ui.mainCamera.transform.position - var_86_4.position

				var_86_4.forward = Vector3.New(var_86_11.x, var_86_11.y, var_86_11.z)

				local var_86_12 = var_86_4.localEulerAngles

				var_86_12.z = 0
				var_86_12.x = 0
				var_86_4.localEulerAngles = var_86_12
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action3_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1302cva")
			end

			local var_86_15 = 0
			local var_86_16 = 0.625

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[8].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(101101021)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101021", "story_v_out_101101.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_101101", "101101021", "story_v_out_101101.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_101101", "101101021", "story_v_out_101101.awb")

						arg_83_1:RecordAudio("101101021", var_86_24)
						arg_83_1:RecordAudio("101101021", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_101101", "101101021", "story_v_out_101101.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_101101", "101101021", "story_v_out_101101.awb")
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
	Play101101022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 101101022
		arg_87_1.duration_ = 1.999999999999

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
			arg_87_1.auto_ = false
		end

		function arg_87_1.playNext_(arg_89_0)
			arg_87_1.onStoryFinished_()
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1059ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1059ui_story == nil then
				arg_87_1.var_.characterEffect1059ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1059ui_story then
					arg_87_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1059ui_story then
				arg_87_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["1148ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect1148ui_story == nil then
				arg_87_1.var_.characterEffect1148ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.1

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect1148ui_story then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1148ui_story.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect1148ui_story then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1148ui_story.fillRatio = var_90_9
			end

			local var_90_10 = arg_87_1.actors_["1059ui_story"].transform
			local var_90_11 = 0

			if var_90_11 < arg_87_1.time_ and arg_87_1.time_ <= var_90_11 + arg_90_0 then
				arg_87_1.var_.moveOldPos1059ui_story = var_90_10.localPosition
			end

			local var_90_12 = 0.001

			if var_90_11 <= arg_87_1.time_ and arg_87_1.time_ < var_90_11 + var_90_12 then
				local var_90_13 = (arg_87_1.time_ - var_90_11) / var_90_12
				local var_90_14 = Vector3.New(0.7, -1.05, -6)

				var_90_10.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1059ui_story, var_90_14, var_90_13)

				local var_90_15 = manager.ui.mainCamera.transform.position - var_90_10.position

				var_90_10.forward = Vector3.New(var_90_15.x, var_90_15.y, var_90_15.z)

				local var_90_16 = var_90_10.localEulerAngles

				var_90_16.z = 0
				var_90_16.x = 0
				var_90_10.localEulerAngles = var_90_16
			end

			if arg_87_1.time_ >= var_90_11 + var_90_12 and arg_87_1.time_ < var_90_11 + var_90_12 + arg_90_0 then
				var_90_10.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_90_17 = manager.ui.mainCamera.transform.position - var_90_10.position

				var_90_10.forward = Vector3.New(var_90_17.x, var_90_17.y, var_90_17.z)

				local var_90_18 = var_90_10.localEulerAngles

				var_90_18.z = 0
				var_90_18.x = 0
				var_90_10.localEulerAngles = var_90_18
			end

			local var_90_19 = 0

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action4_1")
			end

			local var_90_20 = 0

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_90_21 = 0
			local var_90_22 = 0.1

			if var_90_21 < arg_87_1.time_ and arg_87_1.time_ <= var_90_21 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_23 = arg_87_1:FormatText(StoryNameCfg[28].name)

				arg_87_1.leftNameTxt_.text = var_90_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_24 = arg_87_1:GetWordFromCfg(101101022)
				local var_90_25 = arg_87_1:FormatText(var_90_24.content)

				arg_87_1.text_.text = var_90_25

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_26 = 4
				local var_90_27 = utf8.len(var_90_25)
				local var_90_28 = var_90_26 <= 0 and var_90_22 or var_90_22 * (var_90_27 / var_90_26)

				if var_90_28 > 0 and var_90_22 < var_90_28 then
					arg_87_1.talkMaxDuration = var_90_28

					if var_90_28 + var_90_21 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_28 + var_90_21
					end
				end

				arg_87_1.text_.text = var_90_25
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101101", "101101022", "story_v_out_101101.awb") ~= 0 then
					local var_90_29 = manager.audio:GetVoiceLength("story_v_out_101101", "101101022", "story_v_out_101101.awb") / 1000

					if var_90_29 + var_90_21 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_29 + var_90_21
					end

					if var_90_24.prefab_name ~= "" and arg_87_1.actors_[var_90_24.prefab_name] ~= nil then
						local var_90_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_24.prefab_name].transform, "story_v_out_101101", "101101022", "story_v_out_101101.awb")

						arg_87_1:RecordAudio("101101022", var_90_30)
						arg_87_1:RecordAudio("101101022", var_90_30)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_101101", "101101022", "story_v_out_101101.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_101101", "101101022", "story_v_out_101101.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_31 = math.max(var_90_22, arg_87_1.talkMaxDuration)

			if var_90_21 <= arg_87_1.time_ and arg_87_1.time_ < var_90_21 + var_90_31 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_21) / var_90_31

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_21 + var_90_31 and arg_87_1.time_ < var_90_21 + var_90_31 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B01b"
	},
	voices = {
		"story_v_out_101101.awb"
	}
}
