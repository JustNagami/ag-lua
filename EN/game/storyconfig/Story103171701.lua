return {
	Play317171001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317171001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317171002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K09f"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 0

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.K09f

				var_4_5.transform.localPosition = var_4_4
				var_4_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_6 = var_4_5:GetComponent("SpriteRenderer")

				if var_4_6 and var_4_6.sprite then
					local var_4_7 = (var_4_5.transform.localPosition - var_4_3).z
					local var_4_8 = manager.ui.mainCameraCom_
					local var_4_9 = 2 * var_4_7 * Mathf.Tan(var_4_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_10 = var_4_9 * var_4_8.aspect
					local var_4_11 = var_4_6.sprite.bounds.size.x
					local var_4_12 = var_4_6.sprite.bounds.size.y
					local var_4_13 = var_4_10 / var_4_11
					local var_4_14 = var_4_9 / var_4_12
					local var_4_15 = var_4_14 < var_4_13 and var_4_13 or var_4_14

					var_4_5.transform.localScale = Vector3.New(var_4_15, var_4_15, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "K09f" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_17 = 2

			if var_4_16 <= arg_1_1.time_ and arg_1_1.time_ < var_4_16 + var_4_17 then
				local var_4_18 = (arg_1_1.time_ - var_4_16) / var_4_17
				local var_4_19 = Color.New(0, 0, 0)

				var_4_19.a = Mathf.Lerp(1, 0, var_4_18)
				arg_1_1.mask_.color = var_4_19
			end

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				local var_4_20 = Color.New(0, 0, 0)
				local var_4_21 = 0

				arg_1_1.mask_.enabled = false
				var_4_20.a = var_4_21
				arg_1_1.mask_.color = var_4_20
			end

			local var_4_22 = 0
			local var_4_23 = 0.6

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.733333333333333
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.55

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_32 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_32:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_33 = arg_1_1:GetWordFromCfg(317171001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 22
				local var_4_36 = utf8.len(var_4_34)
				local var_4_37 = var_4_35 <= 0 and var_4_31 or var_4_31 * (var_4_36 / var_4_35)

				if var_4_37 > 0 and var_4_31 < var_4_37 then
					arg_1_1.talkMaxDuration = var_4_37
					var_4_30 = var_4_30 + 0.3

					if var_4_37 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_34
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_38 = var_4_30 + 0.3
			local var_4_39 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_38) / var_4_39

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play317171002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317171002
		arg_7_1.duration_ = 5.1

		local var_7_0 = {
			zh = 5.1,
			ja = 2.766
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
				arg_7_0:Play317171003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "3007_tpose"

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

			local var_10_4 = arg_7_1.actors_["3007_tpose"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos3007_tpose = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -2.25, -1.9)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos3007_tpose, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -2.25, -1.9)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["3007_tpose"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect3007_tpose == nil then
				arg_7_1.var_.characterEffect3007_tpose = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect3007_tpose then
					arg_7_1.var_.characterEffect3007_tpose.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect3007_tpose then
				arg_7_1.var_.characterEffect3007_tpose.fillFlat = false
			end

			local var_10_17 = 0
			local var_10_18 = 0.175

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_19 = arg_7_1:FormatText(StoryNameCfg[560].name)

				arg_7_1.leftNameTxt_.text = var_10_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_20 = arg_7_1:GetWordFromCfg(317171002)
				local var_10_21 = arg_7_1:FormatText(var_10_20.content)

				arg_7_1.text_.text = var_10_21

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_22 = 7
				local var_10_23 = utf8.len(var_10_21)
				local var_10_24 = var_10_22 <= 0 and var_10_18 or var_10_18 * (var_10_23 / var_10_22)

				if var_10_24 > 0 and var_10_18 < var_10_24 then
					arg_7_1.talkMaxDuration = var_10_24

					if var_10_24 + var_10_17 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_24 + var_10_17
					end
				end

				arg_7_1.text_.text = var_10_21
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171002", "story_v_out_317171.awb") ~= 0 then
					local var_10_25 = manager.audio:GetVoiceLength("story_v_out_317171", "317171002", "story_v_out_317171.awb") / 1000

					if var_10_25 + var_10_17 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_25 + var_10_17
					end

					if var_10_20.prefab_name ~= "" and arg_7_1.actors_[var_10_20.prefab_name] ~= nil then
						local var_10_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_20.prefab_name].transform, "story_v_out_317171", "317171002", "story_v_out_317171.awb")

						arg_7_1:RecordAudio("317171002", var_10_26)
						arg_7_1:RecordAudio("317171002", var_10_26)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_317171", "317171002", "story_v_out_317171.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_317171", "317171002", "story_v_out_317171.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_27 = math.max(var_10_18, arg_7_1.talkMaxDuration)

			if var_10_17 <= arg_7_1.time_ and arg_7_1.time_ < var_10_17 + var_10_27 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_17) / var_10_27

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_17 + var_10_27 and arg_7_1.time_ < var_10_17 + var_10_27 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play317171003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317171003
		arg_11_1.duration_ = 4.333

		local var_11_0 = {
			zh = 3.033,
			ja = 4.333
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
				arg_11_0:Play317171004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["3007_tpose"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos3007_tpose = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, 100, 0)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos3007_tpose, var_14_4, var_14_3)

				local var_14_5 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_5.x, var_14_5.y, var_14_5.z)

				local var_14_6 = var_14_0.localEulerAngles

				var_14_6.z = 0
				var_14_6.x = 0
				var_14_0.localEulerAngles = var_14_6
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, 100, 0)

				local var_14_7 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_7.x, var_14_7.y, var_14_7.z)

				local var_14_8 = var_14_0.localEulerAngles

				var_14_8.z = 0
				var_14_8.x = 0
				var_14_0.localEulerAngles = var_14_8
			end

			local var_14_9 = "1199ui_story"

			if arg_11_1.actors_[var_14_9] == nil then
				local var_14_10 = Object.Instantiate(Asset.Load("Char/" .. var_14_9), arg_11_1.stage_.transform)

				var_14_10.name = var_14_9
				var_14_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_9] = var_14_10

				local var_14_11 = var_14_10:GetComponentInChildren(typeof(CharacterEffect))

				var_14_11.enabled = true

				local var_14_12 = GameObjectTools.GetOrAddComponent(var_14_10, typeof(DynamicBoneHelper))

				if var_14_12 then
					var_14_12:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_11.transform, false)

				arg_11_1.var_[var_14_9 .. "Animator"] = var_14_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_9 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_9 .. "LipSync"] = var_14_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_13 = arg_11_1.actors_["1199ui_story"].transform
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1.var_.moveOldPos1199ui_story = var_14_13.localPosition
			end

			local var_14_15 = 0.001

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15
				local var_14_17 = Vector3.New(0, -1.08, -5.9)

				var_14_13.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1199ui_story, var_14_17, var_14_16)

				local var_14_18 = manager.ui.mainCamera.transform.position - var_14_13.position

				var_14_13.forward = Vector3.New(var_14_18.x, var_14_18.y, var_14_18.z)

				local var_14_19 = var_14_13.localEulerAngles

				var_14_19.z = 0
				var_14_19.x = 0
				var_14_13.localEulerAngles = var_14_19
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 then
				var_14_13.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_14_20 = manager.ui.mainCamera.transform.position - var_14_13.position

				var_14_13.forward = Vector3.New(var_14_20.x, var_14_20.y, var_14_20.z)

				local var_14_21 = var_14_13.localEulerAngles

				var_14_21.z = 0
				var_14_21.x = 0
				var_14_13.localEulerAngles = var_14_21
			end

			local var_14_22 = arg_11_1.actors_["1199ui_story"]
			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 and arg_11_1.var_.characterEffect1199ui_story == nil then
				arg_11_1.var_.characterEffect1199ui_story = var_14_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_24 = 0.200000002980232

			if var_14_23 <= arg_11_1.time_ and arg_11_1.time_ < var_14_23 + var_14_24 then
				local var_14_25 = (arg_11_1.time_ - var_14_23) / var_14_24

				if arg_11_1.var_.characterEffect1199ui_story then
					arg_11_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_23 + var_14_24 and arg_11_1.time_ < var_14_23 + var_14_24 + arg_14_0 and arg_11_1.var_.characterEffect1199ui_story then
				arg_11_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_14_26 = 0

			if var_14_26 < arg_11_1.time_ and arg_11_1.time_ <= var_14_26 + arg_14_0 then
				arg_11_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_14_27 = 0

			if var_14_27 < arg_11_1.time_ and arg_11_1.time_ <= var_14_27 + arg_14_0 then
				arg_11_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_14_28 = 0
			local var_14_29 = 0.275

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_30 = arg_11_1:FormatText(StoryNameCfg[84].name)

				arg_11_1.leftNameTxt_.text = var_14_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_31 = arg_11_1:GetWordFromCfg(317171003)
				local var_14_32 = arg_11_1:FormatText(var_14_31.content)

				arg_11_1.text_.text = var_14_32

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_33 = 11
				local var_14_34 = utf8.len(var_14_32)
				local var_14_35 = var_14_33 <= 0 and var_14_29 or var_14_29 * (var_14_34 / var_14_33)

				if var_14_35 > 0 and var_14_29 < var_14_35 then
					arg_11_1.talkMaxDuration = var_14_35

					if var_14_35 + var_14_28 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_35 + var_14_28
					end
				end

				arg_11_1.text_.text = var_14_32
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171003", "story_v_out_317171.awb") ~= 0 then
					local var_14_36 = manager.audio:GetVoiceLength("story_v_out_317171", "317171003", "story_v_out_317171.awb") / 1000

					if var_14_36 + var_14_28 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_36 + var_14_28
					end

					if var_14_31.prefab_name ~= "" and arg_11_1.actors_[var_14_31.prefab_name] ~= nil then
						local var_14_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_31.prefab_name].transform, "story_v_out_317171", "317171003", "story_v_out_317171.awb")

						arg_11_1:RecordAudio("317171003", var_14_37)
						arg_11_1:RecordAudio("317171003", var_14_37)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_317171", "317171003", "story_v_out_317171.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_317171", "317171003", "story_v_out_317171.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_38 = math.max(var_14_29, arg_11_1.talkMaxDuration)

			if var_14_28 <= arg_11_1.time_ and arg_11_1.time_ < var_14_28 + var_14_38 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_28) / var_14_38

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_28 + var_14_38 and arg_11_1.time_ < var_14_28 + var_14_38 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play317171004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317171004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play317171005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1199ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1199ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1199ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, 100, 0)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = 0
			local var_18_10 = 0.6

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 then
				local var_18_11 = "play"
				local var_18_12 = "effect"

				arg_15_1:AudioAction(var_18_11, var_18_12, "se_story_123_01", "se_story_123_01_hit", "")
			end

			local var_18_13 = manager.ui.mainCamera.transform
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				local var_18_15 = arg_15_1.var_.effectF03daoguang1

				if not var_18_15 then
					var_18_15 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_18_15.name = "daoguang1"
					arg_15_1.var_.effectF03daoguang1 = var_18_15
				end

				local var_18_16 = var_18_13:Find("")

				if var_18_16 then
					var_18_15.transform.parent = var_18_16
				else
					var_18_15.transform.parent = var_18_13
				end

				var_18_15.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_18_15.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_18_17 = manager.ui.mainCamera.transform
			local var_18_18 = 0.866666666666668

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				local var_18_19 = arg_15_1.var_.effectF03daoguang1

				if var_18_19 then
					Object.Destroy(var_18_19)

					arg_15_1.var_.effectF03daoguang1 = nil
				end
			end

			local var_18_20 = 0
			local var_18_21 = 1.25

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(317171004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 50
				local var_18_25 = utf8.len(var_18_23)
				local var_18_26 = var_18_24 <= 0 and var_18_21 or var_18_21 * (var_18_25 / var_18_24)

				if var_18_26 > 0 and var_18_21 < var_18_26 then
					arg_15_1.talkMaxDuration = var_18_26

					if var_18_26 + var_18_20 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_26 + var_18_20
					end
				end

				arg_15_1.text_.text = var_18_23
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_27 = math.max(var_18_21, arg_15_1.talkMaxDuration)

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_27 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_20) / var_18_27

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_20 + var_18_27 and arg_15_1.time_ < var_18_20 + var_18_27 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play317171005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317171005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play317171006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.6

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				local var_22_2 = "play"
				local var_22_3 = "effect"

				arg_19_1:AudioAction(var_22_2, var_22_3, "se_story_127", "se_story_127_dart", "")
			end

			local var_22_4 = manager.ui.mainCamera.transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				local var_22_6 = arg_19_1.var_.effectlingli

				if var_22_6 then
					Object.Destroy(var_22_6)

					arg_19_1.var_.effectlingli = nil
				end
			end

			local var_22_7 = 0
			local var_22_8 = 1.125

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(317171005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 45
				local var_22_12 = utf8.len(var_22_10)
				local var_22_13 = var_22_11 <= 0 and var_22_8 or var_22_8 * (var_22_12 / var_22_11)

				if var_22_13 > 0 and var_22_8 < var_22_13 then
					arg_19_1.talkMaxDuration = var_22_13

					if var_22_13 + var_22_7 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_7
					end
				end

				arg_19_1.text_.text = var_22_10
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_8, arg_19_1.talkMaxDuration)

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_7) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_7 + var_22_14 and arg_19_1.time_ < var_22_7 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317171006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317171006
		arg_23_1.duration_ = 1.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play317171007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1199ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1199ui_story == nil then
				arg_23_1.var_.characterEffect1199ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1199ui_story then
					arg_23_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1199ui_story then
				arg_23_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_1")
			end

			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_26_6 = arg_23_1.actors_["1199ui_story"].transform
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 then
				arg_23_1.var_.moveOldPos1199ui_story = var_26_6.localPosition
			end

			local var_26_8 = 0.001

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_8 then
				local var_26_9 = (arg_23_1.time_ - var_26_7) / var_26_8
				local var_26_10 = Vector3.New(0, -1.08, -5.9)

				var_26_6.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1199ui_story, var_26_10, var_26_9)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_6.position

				var_26_6.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_6.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_6.localEulerAngles = var_26_12
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 then
				var_26_6.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_26_13 = manager.ui.mainCamera.transform.position - var_26_6.position

				var_26_6.forward = Vector3.New(var_26_13.x, var_26_13.y, var_26_13.z)

				local var_26_14 = var_26_6.localEulerAngles

				var_26_14.z = 0
				var_26_14.x = 0
				var_26_6.localEulerAngles = var_26_14
			end

			local var_26_15 = 0
			local var_26_16 = 0.075

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_17 = arg_23_1:FormatText(StoryNameCfg[84].name)

				arg_23_1.leftNameTxt_.text = var_26_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_18 = arg_23_1:GetWordFromCfg(317171006)
				local var_26_19 = arg_23_1:FormatText(var_26_18.content)

				arg_23_1.text_.text = var_26_19

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_20 = 3
				local var_26_21 = utf8.len(var_26_19)
				local var_26_22 = var_26_20 <= 0 and var_26_16 or var_26_16 * (var_26_21 / var_26_20)

				if var_26_22 > 0 and var_26_16 < var_26_22 then
					arg_23_1.talkMaxDuration = var_26_22

					if var_26_22 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_22 + var_26_15
					end
				end

				arg_23_1.text_.text = var_26_19
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171006", "story_v_out_317171.awb") ~= 0 then
					local var_26_23 = manager.audio:GetVoiceLength("story_v_out_317171", "317171006", "story_v_out_317171.awb") / 1000

					if var_26_23 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_15
					end

					if var_26_18.prefab_name ~= "" and arg_23_1.actors_[var_26_18.prefab_name] ~= nil then
						local var_26_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_18.prefab_name].transform, "story_v_out_317171", "317171006", "story_v_out_317171.awb")

						arg_23_1:RecordAudio("317171006", var_26_24)
						arg_23_1:RecordAudio("317171006", var_26_24)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_317171", "317171006", "story_v_out_317171.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_317171", "317171006", "story_v_out_317171.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_25 = math.max(var_26_16, arg_23_1.talkMaxDuration)

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_25 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_15) / var_26_25

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_15 + var_26_25 and arg_23_1.time_ < var_26_15 + var_26_25 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play317171007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317171007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play317171008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1199ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1199ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1199ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, 100, 0)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["1199ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1199ui_story == nil then
				arg_27_1.var_.characterEffect1199ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1199ui_story then
					local var_30_13 = Mathf.Lerp(0, 0.5, var_30_12)

					arg_27_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1199ui_story.fillRatio = var_30_13
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1199ui_story then
				local var_30_14 = 0.5

				arg_27_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1199ui_story.fillRatio = var_30_14
			end

			local var_30_15 = 0
			local var_30_16 = 0.6

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				local var_30_17 = "play"
				local var_30_18 = "effect"

				arg_27_1:AudioAction(var_30_17, var_30_18, "se_story_127", "se_story_127_bomb", "")
			end

			local var_30_19 = 0
			local var_30_20 = 0.75

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_21 = arg_27_1:GetWordFromCfg(317171007)
				local var_30_22 = arg_27_1:FormatText(var_30_21.content)

				arg_27_1.text_.text = var_30_22

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_23 = 30
				local var_30_24 = utf8.len(var_30_22)
				local var_30_25 = var_30_23 <= 0 and var_30_20 or var_30_20 * (var_30_24 / var_30_23)

				if var_30_25 > 0 and var_30_20 < var_30_25 then
					arg_27_1.talkMaxDuration = var_30_25

					if var_30_25 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_25 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_22
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_26 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_26 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_26

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_26 and arg_27_1.time_ < var_30_19 + var_30_26 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play317171008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 317171008
		arg_31_1.duration_ = 2.466

		local var_31_0 = {
			zh = 1.433,
			ja = 2.466
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
				arg_31_0:Play317171009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "2033_tpose"

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

			local var_34_4 = arg_31_1.actors_["2033_tpose"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos2033_tpose = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0, -1.37, -4.9)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos2033_tpose, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0, -1.37, -4.9)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = arg_31_1.actors_["2033_tpose"]
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 and arg_31_1.var_.characterEffect2033_tpose == nil then
				arg_31_1.var_.characterEffect2033_tpose = var_34_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_15 = 0.200000002980232

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15

				if arg_31_1.var_.characterEffect2033_tpose then
					arg_31_1.var_.characterEffect2033_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 and arg_31_1.var_.characterEffect2033_tpose then
				arg_31_1.var_.characterEffect2033_tpose.fillFlat = false
			end

			local var_34_17 = 0
			local var_34_18 = 0.1

			if var_34_17 < arg_31_1.time_ and arg_31_1.time_ <= var_34_17 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_19 = arg_31_1:FormatText(StoryNameCfg[79].name)

				arg_31_1.leftNameTxt_.text = var_34_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_20 = arg_31_1:GetWordFromCfg(317171008)
				local var_34_21 = arg_31_1:FormatText(var_34_20.content)

				arg_31_1.text_.text = var_34_21

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_22 = 4
				local var_34_23 = utf8.len(var_34_21)
				local var_34_24 = var_34_22 <= 0 and var_34_18 or var_34_18 * (var_34_23 / var_34_22)

				if var_34_24 > 0 and var_34_18 < var_34_24 then
					arg_31_1.talkMaxDuration = var_34_24

					if var_34_24 + var_34_17 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_24 + var_34_17
					end
				end

				arg_31_1.text_.text = var_34_21
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171008", "story_v_out_317171.awb") ~= 0 then
					local var_34_25 = manager.audio:GetVoiceLength("story_v_out_317171", "317171008", "story_v_out_317171.awb") / 1000

					if var_34_25 + var_34_17 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_25 + var_34_17
					end

					if var_34_20.prefab_name ~= "" and arg_31_1.actors_[var_34_20.prefab_name] ~= nil then
						local var_34_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_20.prefab_name].transform, "story_v_out_317171", "317171008", "story_v_out_317171.awb")

						arg_31_1:RecordAudio("317171008", var_34_26)
						arg_31_1:RecordAudio("317171008", var_34_26)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_317171", "317171008", "story_v_out_317171.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_317171", "317171008", "story_v_out_317171.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_27 = math.max(var_34_18, arg_31_1.talkMaxDuration)

			if var_34_17 <= arg_31_1.time_ and arg_31_1.time_ < var_34_17 + var_34_27 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_17) / var_34_27

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_17 + var_34_27 and arg_31_1.time_ < var_34_17 + var_34_27 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play317171009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317171009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play317171010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["2033_tpose"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos2033_tpose = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, 100, 0)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos2033_tpose, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, 100, 0)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = 0
			local var_38_10 = 0.825

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_11 = arg_35_1:GetWordFromCfg(317171009)
				local var_38_12 = arg_35_1:FormatText(var_38_11.content)

				arg_35_1.text_.text = var_38_12

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_13 = 33
				local var_38_14 = utf8.len(var_38_12)
				local var_38_15 = var_38_13 <= 0 and var_38_10 or var_38_10 * (var_38_14 / var_38_13)

				if var_38_15 > 0 and var_38_10 < var_38_15 then
					arg_35_1.talkMaxDuration = var_38_15

					if var_38_15 + var_38_9 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_15 + var_38_9
					end
				end

				arg_35_1.text_.text = var_38_12
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_16 = math.max(var_38_10, arg_35_1.talkMaxDuration)

			if var_38_9 <= arg_35_1.time_ and arg_35_1.time_ < var_38_9 + var_38_16 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_9) / var_38_16

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_9 + var_38_16 and arg_35_1.time_ < var_38_9 + var_38_16 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play317171010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317171010
		arg_39_1.duration_ = 6.6

		local var_39_0 = {
			zh = 3.6,
			ja = 6.6
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
				arg_39_0:Play317171011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1199ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1199ui_story == nil then
				arg_39_1.var_.characterEffect1199ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1199ui_story then
					arg_39_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1199ui_story then
				arg_39_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_42_6 = arg_39_1.actors_["1199ui_story"].transform
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 then
				arg_39_1.var_.moveOldPos1199ui_story = var_42_6.localPosition
			end

			local var_42_8 = 0.001

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8
				local var_42_10 = Vector3.New(0, -1.08, -5.9)

				var_42_6.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1199ui_story, var_42_10, var_42_9)

				local var_42_11 = manager.ui.mainCamera.transform.position - var_42_6.position

				var_42_6.forward = Vector3.New(var_42_11.x, var_42_11.y, var_42_11.z)

				local var_42_12 = var_42_6.localEulerAngles

				var_42_12.z = 0
				var_42_12.x = 0
				var_42_6.localEulerAngles = var_42_12
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 then
				var_42_6.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_42_13 = manager.ui.mainCamera.transform.position - var_42_6.position

				var_42_6.forward = Vector3.New(var_42_13.x, var_42_13.y, var_42_13.z)

				local var_42_14 = var_42_6.localEulerAngles

				var_42_14.z = 0
				var_42_14.x = 0
				var_42_6.localEulerAngles = var_42_14
			end

			local var_42_15 = 0
			local var_42_16 = 0.45

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_17 = arg_39_1:FormatText(StoryNameCfg[84].name)

				arg_39_1.leftNameTxt_.text = var_42_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_18 = arg_39_1:GetWordFromCfg(317171010)
				local var_42_19 = arg_39_1:FormatText(var_42_18.content)

				arg_39_1.text_.text = var_42_19

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_20 = 18
				local var_42_21 = utf8.len(var_42_19)
				local var_42_22 = var_42_20 <= 0 and var_42_16 or var_42_16 * (var_42_21 / var_42_20)

				if var_42_22 > 0 and var_42_16 < var_42_22 then
					arg_39_1.talkMaxDuration = var_42_22

					if var_42_22 + var_42_15 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_22 + var_42_15
					end
				end

				arg_39_1.text_.text = var_42_19
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171010", "story_v_out_317171.awb") ~= 0 then
					local var_42_23 = manager.audio:GetVoiceLength("story_v_out_317171", "317171010", "story_v_out_317171.awb") / 1000

					if var_42_23 + var_42_15 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_23 + var_42_15
					end

					if var_42_18.prefab_name ~= "" and arg_39_1.actors_[var_42_18.prefab_name] ~= nil then
						local var_42_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_18.prefab_name].transform, "story_v_out_317171", "317171010", "story_v_out_317171.awb")

						arg_39_1:RecordAudio("317171010", var_42_24)
						arg_39_1:RecordAudio("317171010", var_42_24)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_317171", "317171010", "story_v_out_317171.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_317171", "317171010", "story_v_out_317171.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_25 = math.max(var_42_16, arg_39_1.talkMaxDuration)

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_25 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_15) / var_42_25

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_15 + var_42_25 and arg_39_1.time_ < var_42_15 + var_42_25 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play317171011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 317171011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play317171012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1199ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1199ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1199ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, 100, 0)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = 0
			local var_46_10 = 0.6

			if var_46_9 < arg_43_1.time_ and arg_43_1.time_ <= var_46_9 + arg_46_0 then
				local var_46_11 = "play"
				local var_46_12 = "effect"

				arg_43_1:AudioAction(var_46_11, var_46_12, "se_story_123_01", "se_story_123_01_whoosh_draw", "")
			end

			local var_46_13 = manager.ui.mainCamera.transform
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				local var_46_15 = arg_43_1.var_.effectF03daoguang1

				if not var_46_15 then
					var_46_15 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_46_15.name = "daoguang1"
					arg_43_1.var_.effectF03daoguang1 = var_46_15
				end

				local var_46_16 = var_46_13:Find("")

				if var_46_16 then
					var_46_15.transform.parent = var_46_16
				else
					var_46_15.transform.parent = var_46_13
				end

				var_46_15.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_46_15.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_46_17 = manager.ui.mainCamera.transform
			local var_46_18 = 0.866666666666668

			if var_46_18 < arg_43_1.time_ and arg_43_1.time_ <= var_46_18 + arg_46_0 then
				local var_46_19 = arg_43_1.var_.effectF03daoguang1

				if var_46_19 then
					Object.Destroy(var_46_19)

					arg_43_1.var_.effectF03daoguang1 = nil
				end
			end

			local var_46_20 = 0
			local var_46_21 = 1.125

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(317171011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 45
				local var_46_25 = utf8.len(var_46_23)
				local var_46_26 = var_46_24 <= 0 and var_46_21 or var_46_21 * (var_46_25 / var_46_24)

				if var_46_26 > 0 and var_46_21 < var_46_26 then
					arg_43_1.talkMaxDuration = var_46_26

					if var_46_26 + var_46_20 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_26 + var_46_20
					end
				end

				arg_43_1.text_.text = var_46_23
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_27 = math.max(var_46_21, arg_43_1.talkMaxDuration)

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_27 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_20) / var_46_27

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_20 + var_46_27 and arg_43_1.time_ < var_46_20 + var_46_27 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play317171012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 317171012
		arg_47_1.duration_ = 3.033

		local var_47_0 = {
			zh = 3.033,
			ja = 2.866
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
				arg_47_0:Play317171013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "3017_tpose"

			if arg_47_1.actors_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(Asset.Load("Char/" .. var_50_0), arg_47_1.stage_.transform)

				var_50_1.name = var_50_0
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.actors_[var_50_0] = var_50_1

				local var_50_2 = var_50_1:GetComponentInChildren(typeof(CharacterEffect))

				var_50_2.enabled = true

				local var_50_3 = GameObjectTools.GetOrAddComponent(var_50_1, typeof(DynamicBoneHelper))

				if var_50_3 then
					var_50_3:EnableDynamicBone(false)
				end

				arg_47_1:ShowWeapon(var_50_2.transform, false)

				arg_47_1.var_[var_50_0 .. "Animator"] = var_50_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_47_1.var_[var_50_0 .. "Animator"].applyRootMotion = true
				arg_47_1.var_[var_50_0 .. "LipSync"] = var_50_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_50_4 = arg_47_1.actors_["3017_tpose"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos3017_tpose = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(0, -1.73, -4.1)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos3017_tpose, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, -1.73, -4.1)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = arg_47_1.actors_["3017_tpose"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.characterEffect3017_tpose == nil then
				arg_47_1.var_.characterEffect3017_tpose = var_50_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_15 = 0.200000002980232

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.characterEffect3017_tpose then
					arg_47_1.var_.characterEffect3017_tpose.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect3017_tpose then
				arg_47_1.var_.characterEffect3017_tpose.fillFlat = false
			end

			local var_50_17 = 0
			local var_50_18 = 0.2

			if var_50_17 < arg_47_1.time_ and arg_47_1.time_ <= var_50_17 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_19 = arg_47_1:FormatText(StoryNameCfg[561].name)

				arg_47_1.leftNameTxt_.text = var_50_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_20 = arg_47_1:GetWordFromCfg(317171012)
				local var_50_21 = arg_47_1:FormatText(var_50_20.content)

				arg_47_1.text_.text = var_50_21

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_22 = 8
				local var_50_23 = utf8.len(var_50_21)
				local var_50_24 = var_50_22 <= 0 and var_50_18 or var_50_18 * (var_50_23 / var_50_22)

				if var_50_24 > 0 and var_50_18 < var_50_24 then
					arg_47_1.talkMaxDuration = var_50_24

					if var_50_24 + var_50_17 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_24 + var_50_17
					end
				end

				arg_47_1.text_.text = var_50_21
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171012", "story_v_out_317171.awb") ~= 0 then
					local var_50_25 = manager.audio:GetVoiceLength("story_v_out_317171", "317171012", "story_v_out_317171.awb") / 1000

					if var_50_25 + var_50_17 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_25 + var_50_17
					end

					if var_50_20.prefab_name ~= "" and arg_47_1.actors_[var_50_20.prefab_name] ~= nil then
						local var_50_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_20.prefab_name].transform, "story_v_out_317171", "317171012", "story_v_out_317171.awb")

						arg_47_1:RecordAudio("317171012", var_50_26)
						arg_47_1:RecordAudio("317171012", var_50_26)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_317171", "317171012", "story_v_out_317171.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_317171", "317171012", "story_v_out_317171.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_27 = math.max(var_50_18, arg_47_1.talkMaxDuration)

			if var_50_17 <= arg_47_1.time_ and arg_47_1.time_ < var_50_17 + var_50_27 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_17) / var_50_27

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_17 + var_50_27 and arg_47_1.time_ < var_50_17 + var_50_27 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play317171013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317171013
		arg_51_1.duration_ = 8.533

		local var_51_0 = {
			zh = 6.933,
			ja = 8.533
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
				arg_51_0:Play317171014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.75

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[561].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(317171013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 30
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171013", "story_v_out_317171.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_317171", "317171013", "story_v_out_317171.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_317171", "317171013", "story_v_out_317171.awb")

						arg_51_1:RecordAudio("317171013", var_54_9)
						arg_51_1:RecordAudio("317171013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_317171", "317171013", "story_v_out_317171.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_317171", "317171013", "story_v_out_317171.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play317171014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317171014
		arg_55_1.duration_ = 4.466

		local var_55_0 = {
			zh = 2.8,
			ja = 4.466
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
				arg_55_0:Play317171015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["3017_tpose"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos3017_tpose = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, 100, 0)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos3017_tpose, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, 100, 0)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1199ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1199ui_story == nil then
				arg_55_1.var_.characterEffect1199ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1199ui_story then
					arg_55_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1199ui_story then
				arg_55_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_58_15 = arg_55_1.actors_["1199ui_story"].transform
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.var_.moveOldPos1199ui_story = var_58_15.localPosition
			end

			local var_58_17 = 0.001

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Vector3.New(0, -1.08, -5.9)

				var_58_15.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1199ui_story, var_58_19, var_58_18)

				local var_58_20 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_20.x, var_58_20.y, var_58_20.z)

				local var_58_21 = var_58_15.localEulerAngles

				var_58_21.z = 0
				var_58_21.x = 0
				var_58_15.localEulerAngles = var_58_21
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 then
				var_58_15.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_58_22 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_22.x, var_58_22.y, var_58_22.z)

				local var_58_23 = var_58_15.localEulerAngles

				var_58_23.z = 0
				var_58_23.x = 0
				var_58_15.localEulerAngles = var_58_23
			end

			local var_58_24 = 0
			local var_58_25 = 0.225

			if var_58_24 < arg_55_1.time_ and arg_55_1.time_ <= var_58_24 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_26 = arg_55_1:FormatText(StoryNameCfg[84].name)

				arg_55_1.leftNameTxt_.text = var_58_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_27 = arg_55_1:GetWordFromCfg(317171014)
				local var_58_28 = arg_55_1:FormatText(var_58_27.content)

				arg_55_1.text_.text = var_58_28

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_29 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171014", "story_v_out_317171.awb") ~= 0 then
					local var_58_32 = manager.audio:GetVoiceLength("story_v_out_317171", "317171014", "story_v_out_317171.awb") / 1000

					if var_58_32 + var_58_24 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_32 + var_58_24
					end

					if var_58_27.prefab_name ~= "" and arg_55_1.actors_[var_58_27.prefab_name] ~= nil then
						local var_58_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_27.prefab_name].transform, "story_v_out_317171", "317171014", "story_v_out_317171.awb")

						arg_55_1:RecordAudio("317171014", var_58_33)
						arg_55_1:RecordAudio("317171014", var_58_33)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_317171", "317171014", "story_v_out_317171.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_317171", "317171014", "story_v_out_317171.awb")
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
	Play317171015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 317171015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play317171016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1199ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1199ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0, 100, 0)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1199ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0, 100, 0)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = manager.ui.mainCamera.transform
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				local var_62_11 = arg_59_1.var_.effectF03daoguang1

				if not var_62_11 then
					var_62_11 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_62_11.name = "daoguang1"
					arg_59_1.var_.effectF03daoguang1 = var_62_11
				end

				local var_62_12 = var_62_9:Find("")

				if var_62_12 then
					var_62_11.transform.parent = var_62_12
				else
					var_62_11.transform.parent = var_62_9
				end

				var_62_11.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_62_11.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_62_13 = manager.ui.mainCamera.transform
			local var_62_14 = 0.866666666666668

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				local var_62_15 = arg_59_1.var_.effectF03daoguang1

				if var_62_15 then
					Object.Destroy(var_62_15)

					arg_59_1.var_.effectF03daoguang1 = nil
				end
			end

			local var_62_16 = 0
			local var_62_17 = 0.6

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				local var_62_18 = "play"
				local var_62_19 = "music"

				arg_59_1:AudioAction(var_62_18, var_62_19, "se_story_123_02", "se_story_123_02_whoosh", "")
			end

			local var_62_20 = 0.0333333333333333
			local var_62_21 = 0.6

			if var_62_20 < arg_59_1.time_ and arg_59_1.time_ <= var_62_20 + arg_62_0 then
				local var_62_22 = "play"
				local var_62_23 = "effect"

				arg_59_1:AudioAction(var_62_22, var_62_23, "se_story_127", "se_story_127_hit", "")
			end

			local var_62_24 = 0
			local var_62_25 = 1.625

			if var_62_24 < arg_59_1.time_ and arg_59_1.time_ <= var_62_24 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_26 = arg_59_1:GetWordFromCfg(317171015)
				local var_62_27 = arg_59_1:FormatText(var_62_26.content)

				arg_59_1.text_.text = var_62_27

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_28 = 65
				local var_62_29 = utf8.len(var_62_27)
				local var_62_30 = var_62_28 <= 0 and var_62_25 or var_62_25 * (var_62_29 / var_62_28)

				if var_62_30 > 0 and var_62_25 < var_62_30 then
					arg_59_1.talkMaxDuration = var_62_30

					if var_62_30 + var_62_24 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_30 + var_62_24
					end
				end

				arg_59_1.text_.text = var_62_27
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_31 = math.max(var_62_25, arg_59_1.talkMaxDuration)

			if var_62_24 <= arg_59_1.time_ and arg_59_1.time_ < var_62_24 + var_62_31 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_24) / var_62_31

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_24 + var_62_31 and arg_59_1.time_ < var_62_24 + var_62_31 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play317171016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317171016
		arg_63_1.duration_ = 2.533

		local var_63_0 = {
			zh = 1.999999999999,
			ja = 2.533
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
				arg_63_0:Play317171017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1199ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1199ui_story == nil then
				arg_63_1.var_.characterEffect1199ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1199ui_story then
					arg_63_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1199ui_story then
				arg_63_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_66_4 = 0

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_1")
			end

			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_66_6 = arg_63_1.actors_["1199ui_story"].transform
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 then
				arg_63_1.var_.moveOldPos1199ui_story = var_66_6.localPosition
			end

			local var_66_8 = 0.001

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8
				local var_66_10 = Vector3.New(0, -1.08, -5.9)

				var_66_6.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1199ui_story, var_66_10, var_66_9)

				local var_66_11 = manager.ui.mainCamera.transform.position - var_66_6.position

				var_66_6.forward = Vector3.New(var_66_11.x, var_66_11.y, var_66_11.z)

				local var_66_12 = var_66_6.localEulerAngles

				var_66_12.z = 0
				var_66_12.x = 0
				var_66_6.localEulerAngles = var_66_12
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 then
				var_66_6.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_66_13 = manager.ui.mainCamera.transform.position - var_66_6.position

				var_66_6.forward = Vector3.New(var_66_13.x, var_66_13.y, var_66_13.z)

				local var_66_14 = var_66_6.localEulerAngles

				var_66_14.z = 0
				var_66_14.x = 0
				var_66_6.localEulerAngles = var_66_14
			end

			local var_66_15 = 0
			local var_66_16 = 0.15

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_17 = arg_63_1:FormatText(StoryNameCfg[84].name)

				arg_63_1.leftNameTxt_.text = var_66_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_18 = arg_63_1:GetWordFromCfg(317171016)
				local var_66_19 = arg_63_1:FormatText(var_66_18.content)

				arg_63_1.text_.text = var_66_19

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_20 = 6
				local var_66_21 = utf8.len(var_66_19)
				local var_66_22 = var_66_20 <= 0 and var_66_16 or var_66_16 * (var_66_21 / var_66_20)

				if var_66_22 > 0 and var_66_16 < var_66_22 then
					arg_63_1.talkMaxDuration = var_66_22

					if var_66_22 + var_66_15 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_22 + var_66_15
					end
				end

				arg_63_1.text_.text = var_66_19
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171016", "story_v_out_317171.awb") ~= 0 then
					local var_66_23 = manager.audio:GetVoiceLength("story_v_out_317171", "317171016", "story_v_out_317171.awb") / 1000

					if var_66_23 + var_66_15 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_23 + var_66_15
					end

					if var_66_18.prefab_name ~= "" and arg_63_1.actors_[var_66_18.prefab_name] ~= nil then
						local var_66_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_18.prefab_name].transform, "story_v_out_317171", "317171016", "story_v_out_317171.awb")

						arg_63_1:RecordAudio("317171016", var_66_24)
						arg_63_1:RecordAudio("317171016", var_66_24)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317171", "317171016", "story_v_out_317171.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317171", "317171016", "story_v_out_317171.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_25 = math.max(var_66_16, arg_63_1.talkMaxDuration)

			if var_66_15 <= arg_63_1.time_ and arg_63_1.time_ < var_66_15 + var_66_25 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_15) / var_66_25

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_15 + var_66_25 and arg_63_1.time_ < var_66_15 + var_66_25 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play317171017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317171017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play317171018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1199ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1199ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, 100, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1199ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, 100, 0)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = 0
			local var_70_10 = 1.8

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_11 = arg_67_1:GetWordFromCfg(317171017)
				local var_70_12 = arg_67_1:FormatText(var_70_11.content)

				arg_67_1.text_.text = var_70_12

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_13 = 72
				local var_70_14 = utf8.len(var_70_12)
				local var_70_15 = var_70_13 <= 0 and var_70_10 or var_70_10 * (var_70_14 / var_70_13)

				if var_70_15 > 0 and var_70_10 < var_70_15 then
					arg_67_1.talkMaxDuration = var_70_15

					if var_70_15 + var_70_9 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_15 + var_70_9
					end
				end

				arg_67_1.text_.text = var_70_12
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_16 = math.max(var_70_10, arg_67_1.talkMaxDuration)

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_16 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_9) / var_70_16

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_9 + var_70_16 and arg_67_1.time_ < var_70_9 + var_70_16 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317171018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317171018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play317171019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.325

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(317171018)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 53
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317171019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 317171019
		arg_75_1.duration_ = 9.2

		local var_75_0 = {
			zh = 9.2,
			ja = 5.4
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
				arg_75_0:Play317171020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = "3004_tpose"

			if arg_75_1.actors_[var_78_0] == nil then
				local var_78_1 = Object.Instantiate(Asset.Load("Char/" .. var_78_0), arg_75_1.stage_.transform)

				var_78_1.name = var_78_0
				var_78_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.actors_[var_78_0] = var_78_1

				local var_78_2 = var_78_1:GetComponentInChildren(typeof(CharacterEffect))

				var_78_2.enabled = true

				local var_78_3 = GameObjectTools.GetOrAddComponent(var_78_1, typeof(DynamicBoneHelper))

				if var_78_3 then
					var_78_3:EnableDynamicBone(false)
				end

				arg_75_1:ShowWeapon(var_78_2.transform, false)

				arg_75_1.var_[var_78_0 .. "Animator"] = var_78_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_75_1.var_[var_78_0 .. "Animator"].applyRootMotion = true
				arg_75_1.var_[var_78_0 .. "LipSync"] = var_78_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_78_4 = arg_75_1.actors_["3004_tpose"].transform
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 then
				arg_75_1.var_.moveOldPos3004_tpose = var_78_4.localPosition
			end

			local var_78_6 = 0.001

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6
				local var_78_8 = Vector3.New(0, -2.22, -3.1)

				var_78_4.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos3004_tpose, var_78_8, var_78_7)

				local var_78_9 = manager.ui.mainCamera.transform.position - var_78_4.position

				var_78_4.forward = Vector3.New(var_78_9.x, var_78_9.y, var_78_9.z)

				local var_78_10 = var_78_4.localEulerAngles

				var_78_10.z = 0
				var_78_10.x = 0
				var_78_4.localEulerAngles = var_78_10
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 then
				var_78_4.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_78_11 = manager.ui.mainCamera.transform.position - var_78_4.position

				var_78_4.forward = Vector3.New(var_78_11.x, var_78_11.y, var_78_11.z)

				local var_78_12 = var_78_4.localEulerAngles

				var_78_12.z = 0
				var_78_12.x = 0
				var_78_4.localEulerAngles = var_78_12
			end

			local var_78_13 = arg_75_1.actors_["3004_tpose"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.characterEffect3004_tpose == nil then
				arg_75_1.var_.characterEffect3004_tpose = var_78_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_15 = 0.200000002980232

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.characterEffect3004_tpose then
					arg_75_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.characterEffect3004_tpose then
				arg_75_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_78_17 = 0

			if var_78_17 < arg_75_1.time_ and arg_75_1.time_ <= var_78_17 + arg_78_0 then
				arg_75_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_78_18 = 0
			local var_78_19 = 0.525

			if var_78_18 < arg_75_1.time_ and arg_75_1.time_ <= var_78_18 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_20 = arg_75_1:FormatText(StoryNameCfg[82].name)

				arg_75_1.leftNameTxt_.text = var_78_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_21 = arg_75_1:GetWordFromCfg(317171019)
				local var_78_22 = arg_75_1:FormatText(var_78_21.content)

				arg_75_1.text_.text = var_78_22

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_23 = 21
				local var_78_24 = utf8.len(var_78_22)
				local var_78_25 = var_78_23 <= 0 and var_78_19 or var_78_19 * (var_78_24 / var_78_23)

				if var_78_25 > 0 and var_78_19 < var_78_25 then
					arg_75_1.talkMaxDuration = var_78_25

					if var_78_25 + var_78_18 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_25 + var_78_18
					end
				end

				arg_75_1.text_.text = var_78_22
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171019", "story_v_out_317171.awb") ~= 0 then
					local var_78_26 = manager.audio:GetVoiceLength("story_v_out_317171", "317171019", "story_v_out_317171.awb") / 1000

					if var_78_26 + var_78_18 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_26 + var_78_18
					end

					if var_78_21.prefab_name ~= "" and arg_75_1.actors_[var_78_21.prefab_name] ~= nil then
						local var_78_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_21.prefab_name].transform, "story_v_out_317171", "317171019", "story_v_out_317171.awb")

						arg_75_1:RecordAudio("317171019", var_78_27)
						arg_75_1:RecordAudio("317171019", var_78_27)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_317171", "317171019", "story_v_out_317171.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_317171", "317171019", "story_v_out_317171.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_28 = math.max(var_78_19, arg_75_1.talkMaxDuration)

			if var_78_18 <= arg_75_1.time_ and arg_75_1.time_ < var_78_18 + var_78_28 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_18) / var_78_28

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_18 + var_78_28 and arg_75_1.time_ < var_78_18 + var_78_28 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play317171020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317171020
		arg_79_1.duration_ = 7.366

		local var_79_0 = {
			zh = 3.5,
			ja = 7.366
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
				arg_79_0:Play317171021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["3004_tpose"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos3004_tpose = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos3004_tpose, var_82_4, var_82_3)

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

			local var_82_9 = arg_79_1.actors_["1199ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1199ui_story == nil then
				arg_79_1.var_.characterEffect1199ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1199ui_story then
					arg_79_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1199ui_story then
				arg_79_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_82_15 = arg_79_1.actors_["1199ui_story"].transform
			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				arg_79_1.var_.moveOldPos1199ui_story = var_82_15.localPosition
			end

			local var_82_17 = 0.001

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17
				local var_82_19 = Vector3.New(0, -1.08, -5.9)

				var_82_15.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1199ui_story, var_82_19, var_82_18)

				local var_82_20 = manager.ui.mainCamera.transform.position - var_82_15.position

				var_82_15.forward = Vector3.New(var_82_20.x, var_82_20.y, var_82_20.z)

				local var_82_21 = var_82_15.localEulerAngles

				var_82_21.z = 0
				var_82_21.x = 0
				var_82_15.localEulerAngles = var_82_21
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 then
				var_82_15.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_82_22 = manager.ui.mainCamera.transform.position - var_82_15.position

				var_82_15.forward = Vector3.New(var_82_22.x, var_82_22.y, var_82_22.z)

				local var_82_23 = var_82_15.localEulerAngles

				var_82_23.z = 0
				var_82_23.x = 0
				var_82_15.localEulerAngles = var_82_23
			end

			local var_82_24 = 0
			local var_82_25 = 0.375

			if var_82_24 < arg_79_1.time_ and arg_79_1.time_ <= var_82_24 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_26 = arg_79_1:FormatText(StoryNameCfg[84].name)

				arg_79_1.leftNameTxt_.text = var_82_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_27 = arg_79_1:GetWordFromCfg(317171020)
				local var_82_28 = arg_79_1:FormatText(var_82_27.content)

				arg_79_1.text_.text = var_82_28

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_29 = 15
				local var_82_30 = utf8.len(var_82_28)
				local var_82_31 = var_82_29 <= 0 and var_82_25 or var_82_25 * (var_82_30 / var_82_29)

				if var_82_31 > 0 and var_82_25 < var_82_31 then
					arg_79_1.talkMaxDuration = var_82_31

					if var_82_31 + var_82_24 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_31 + var_82_24
					end
				end

				arg_79_1.text_.text = var_82_28
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171020", "story_v_out_317171.awb") ~= 0 then
					local var_82_32 = manager.audio:GetVoiceLength("story_v_out_317171", "317171020", "story_v_out_317171.awb") / 1000

					if var_82_32 + var_82_24 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_32 + var_82_24
					end

					if var_82_27.prefab_name ~= "" and arg_79_1.actors_[var_82_27.prefab_name] ~= nil then
						local var_82_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_27.prefab_name].transform, "story_v_out_317171", "317171020", "story_v_out_317171.awb")

						arg_79_1:RecordAudio("317171020", var_82_33)
						arg_79_1:RecordAudio("317171020", var_82_33)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_317171", "317171020", "story_v_out_317171.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_317171", "317171020", "story_v_out_317171.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_34 = math.max(var_82_25, arg_79_1.talkMaxDuration)

			if var_82_24 <= arg_79_1.time_ and arg_79_1.time_ < var_82_24 + var_82_34 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_24) / var_82_34

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_24 + var_82_34 and arg_79_1.time_ < var_82_24 + var_82_34 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play317171021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 317171021
		arg_83_1.duration_ = 10.8

		local var_83_0 = {
			zh = 10.8,
			ja = 7.6
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
				arg_83_0:Play317171022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1199ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1199ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, 100, 0)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1199ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, 100, 0)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["3004_tpose"].transform
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.var_.moveOldPos3004_tpose = var_86_9.localPosition
			end

			local var_86_11 = 0.001

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11
				local var_86_13 = Vector3.New(0, -2.22, -3.1)

				var_86_9.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos3004_tpose, var_86_13, var_86_12)

				local var_86_14 = manager.ui.mainCamera.transform.position - var_86_9.position

				var_86_9.forward = Vector3.New(var_86_14.x, var_86_14.y, var_86_14.z)

				local var_86_15 = var_86_9.localEulerAngles

				var_86_15.z = 0
				var_86_15.x = 0
				var_86_9.localEulerAngles = var_86_15
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 then
				var_86_9.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_86_16 = manager.ui.mainCamera.transform.position - var_86_9.position

				var_86_9.forward = Vector3.New(var_86_16.x, var_86_16.y, var_86_16.z)

				local var_86_17 = var_86_9.localEulerAngles

				var_86_17.z = 0
				var_86_17.x = 0
				var_86_9.localEulerAngles = var_86_17
			end

			local var_86_18 = arg_83_1.actors_["3004_tpose"]
			local var_86_19 = 0

			if var_86_19 < arg_83_1.time_ and arg_83_1.time_ <= var_86_19 + arg_86_0 and arg_83_1.var_.characterEffect3004_tpose == nil then
				arg_83_1.var_.characterEffect3004_tpose = var_86_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_20 = 0.200000002980232

			if var_86_19 <= arg_83_1.time_ and arg_83_1.time_ < var_86_19 + var_86_20 then
				local var_86_21 = (arg_83_1.time_ - var_86_19) / var_86_20

				if arg_83_1.var_.characterEffect3004_tpose then
					arg_83_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_19 + var_86_20 and arg_83_1.time_ < var_86_19 + var_86_20 + arg_86_0 and arg_83_1.var_.characterEffect3004_tpose then
				arg_83_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_86_22 = 0

			if var_86_22 < arg_83_1.time_ and arg_83_1.time_ <= var_86_22 + arg_86_0 then
				arg_83_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_86_23 = 0
			local var_86_24 = 0.4

			if var_86_23 < arg_83_1.time_ and arg_83_1.time_ <= var_86_23 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_25 = arg_83_1:FormatText(StoryNameCfg[82].name)

				arg_83_1.leftNameTxt_.text = var_86_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_26 = arg_83_1:GetWordFromCfg(317171021)
				local var_86_27 = arg_83_1:FormatText(var_86_26.content)

				arg_83_1.text_.text = var_86_27

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_28 = 16
				local var_86_29 = utf8.len(var_86_27)
				local var_86_30 = var_86_28 <= 0 and var_86_24 or var_86_24 * (var_86_29 / var_86_28)

				if var_86_30 > 0 and var_86_24 < var_86_30 then
					arg_83_1.talkMaxDuration = var_86_30

					if var_86_30 + var_86_23 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_30 + var_86_23
					end
				end

				arg_83_1.text_.text = var_86_27
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171021", "story_v_out_317171.awb") ~= 0 then
					local var_86_31 = manager.audio:GetVoiceLength("story_v_out_317171", "317171021", "story_v_out_317171.awb") / 1000

					if var_86_31 + var_86_23 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_31 + var_86_23
					end

					if var_86_26.prefab_name ~= "" and arg_83_1.actors_[var_86_26.prefab_name] ~= nil then
						local var_86_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_26.prefab_name].transform, "story_v_out_317171", "317171021", "story_v_out_317171.awb")

						arg_83_1:RecordAudio("317171021", var_86_32)
						arg_83_1:RecordAudio("317171021", var_86_32)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_317171", "317171021", "story_v_out_317171.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_317171", "317171021", "story_v_out_317171.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_33 = math.max(var_86_24, arg_83_1.talkMaxDuration)

			if var_86_23 <= arg_83_1.time_ and arg_83_1.time_ < var_86_23 + var_86_33 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_23) / var_86_33

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_23 + var_86_33 and arg_83_1.time_ < var_86_23 + var_86_33 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play317171022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 317171022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play317171023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["3004_tpose"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos3004_tpose = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos3004_tpose, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, 100, 0)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = 0
			local var_90_10 = 0.475

			if var_90_9 < arg_87_1.time_ and arg_87_1.time_ <= var_90_9 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_11 = arg_87_1:GetWordFromCfg(317171022)
				local var_90_12 = arg_87_1:FormatText(var_90_11.content)

				arg_87_1.text_.text = var_90_12

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_13 = 19
				local var_90_14 = utf8.len(var_90_12)
				local var_90_15 = var_90_13 <= 0 and var_90_10 or var_90_10 * (var_90_14 / var_90_13)

				if var_90_15 > 0 and var_90_10 < var_90_15 then
					arg_87_1.talkMaxDuration = var_90_15

					if var_90_15 + var_90_9 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_15 + var_90_9
					end
				end

				arg_87_1.text_.text = var_90_12
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_10, arg_87_1.talkMaxDuration)

			if var_90_9 <= arg_87_1.time_ and arg_87_1.time_ < var_90_9 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_9) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_9 + var_90_16 and arg_87_1.time_ < var_90_9 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play317171023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 317171023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play317171024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1.725

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_2 = arg_91_1:GetWordFromCfg(317171023)
				local var_94_3 = arg_91_1:FormatText(var_94_2.content)

				arg_91_1.text_.text = var_94_3

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_4 = 69
				local var_94_5 = utf8.len(var_94_3)
				local var_94_6 = var_94_4 <= 0 and var_94_1 or var_94_1 * (var_94_5 / var_94_4)

				if var_94_6 > 0 and var_94_1 < var_94_6 then
					arg_91_1.talkMaxDuration = var_94_6

					if var_94_6 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_6 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_3
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_7 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_7 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_7

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_7 and arg_91_1.time_ < var_94_0 + var_94_7 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play317171024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 317171024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play317171025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.55

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_2 = arg_95_1:GetWordFromCfg(317171024)
				local var_98_3 = arg_95_1:FormatText(var_98_2.content)

				arg_95_1.text_.text = var_98_3

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_4 = 62
				local var_98_5 = utf8.len(var_98_3)
				local var_98_6 = var_98_4 <= 0 and var_98_1 or var_98_1 * (var_98_5 / var_98_4)

				if var_98_6 > 0 and var_98_1 < var_98_6 then
					arg_95_1.talkMaxDuration = var_98_6

					if var_98_6 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_6 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_3
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_7 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_7 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_7

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_7 and arg_95_1.time_ < var_98_0 + var_98_7 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play317171025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 317171025
		arg_99_1.duration_ = 5.566

		local var_99_0 = {
			zh = 5.233,
			ja = 5.566
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
				arg_99_0:Play317171026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = "4014_tpose"

			if arg_99_1.actors_[var_102_0] == nil then
				local var_102_1 = Object.Instantiate(Asset.Load("Char/" .. var_102_0), arg_99_1.stage_.transform)

				var_102_1.name = var_102_0
				var_102_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_99_1.actors_[var_102_0] = var_102_1

				local var_102_2 = var_102_1:GetComponentInChildren(typeof(CharacterEffect))

				var_102_2.enabled = true

				local var_102_3 = GameObjectTools.GetOrAddComponent(var_102_1, typeof(DynamicBoneHelper))

				if var_102_3 then
					var_102_3:EnableDynamicBone(false)
				end

				arg_99_1:ShowWeapon(var_102_2.transform, false)

				arg_99_1.var_[var_102_0 .. "Animator"] = var_102_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_99_1.var_[var_102_0 .. "Animator"].applyRootMotion = true
				arg_99_1.var_[var_102_0 .. "LipSync"] = var_102_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_102_4 = arg_99_1.actors_["4014_tpose"].transform
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1.var_.moveOldPos4014_tpose = var_102_4.localPosition
			end

			local var_102_6 = 0.001

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6
				local var_102_8 = Vector3.New(0, -1.95, -4.2)

				var_102_4.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos4014_tpose, var_102_8, var_102_7)

				local var_102_9 = manager.ui.mainCamera.transform.position - var_102_4.position

				var_102_4.forward = Vector3.New(var_102_9.x, var_102_9.y, var_102_9.z)

				local var_102_10 = var_102_4.localEulerAngles

				var_102_10.z = 0
				var_102_10.x = 0
				var_102_4.localEulerAngles = var_102_10
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 then
				var_102_4.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_102_11 = manager.ui.mainCamera.transform.position - var_102_4.position

				var_102_4.forward = Vector3.New(var_102_11.x, var_102_11.y, var_102_11.z)

				local var_102_12 = var_102_4.localEulerAngles

				var_102_12.z = 0
				var_102_12.x = 0
				var_102_4.localEulerAngles = var_102_12
			end

			local var_102_13 = arg_99_1.actors_["4014_tpose"]
			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 and arg_99_1.var_.characterEffect4014_tpose == nil then
				arg_99_1.var_.characterEffect4014_tpose = var_102_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_15 = 0.200000002980232

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_15 then
				local var_102_16 = (arg_99_1.time_ - var_102_14) / var_102_15

				if arg_99_1.var_.characterEffect4014_tpose then
					arg_99_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 and arg_99_1.var_.characterEffect4014_tpose then
				arg_99_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_102_17 = 0

			if var_102_17 < arg_99_1.time_ and arg_99_1.time_ <= var_102_17 + arg_102_0 then
				arg_99_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_102_18 = 0
			local var_102_19 = 0.4

			if var_102_18 < arg_99_1.time_ and arg_99_1.time_ <= var_102_18 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_20 = arg_99_1:FormatText(StoryNameCfg[87].name)

				arg_99_1.leftNameTxt_.text = var_102_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_21 = arg_99_1:GetWordFromCfg(317171025)
				local var_102_22 = arg_99_1:FormatText(var_102_21.content)

				arg_99_1.text_.text = var_102_22

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_23 = 16
				local var_102_24 = utf8.len(var_102_22)
				local var_102_25 = var_102_23 <= 0 and var_102_19 or var_102_19 * (var_102_24 / var_102_23)

				if var_102_25 > 0 and var_102_19 < var_102_25 then
					arg_99_1.talkMaxDuration = var_102_25

					if var_102_25 + var_102_18 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_25 + var_102_18
					end
				end

				arg_99_1.text_.text = var_102_22
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171025", "story_v_out_317171.awb") ~= 0 then
					local var_102_26 = manager.audio:GetVoiceLength("story_v_out_317171", "317171025", "story_v_out_317171.awb") / 1000

					if var_102_26 + var_102_18 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_18
					end

					if var_102_21.prefab_name ~= "" and arg_99_1.actors_[var_102_21.prefab_name] ~= nil then
						local var_102_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_21.prefab_name].transform, "story_v_out_317171", "317171025", "story_v_out_317171.awb")

						arg_99_1:RecordAudio("317171025", var_102_27)
						arg_99_1:RecordAudio("317171025", var_102_27)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_317171", "317171025", "story_v_out_317171.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_317171", "317171025", "story_v_out_317171.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_28 = math.max(var_102_19, arg_99_1.talkMaxDuration)

			if var_102_18 <= arg_99_1.time_ and arg_99_1.time_ < var_102_18 + var_102_28 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_18) / var_102_28

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_18 + var_102_28 and arg_99_1.time_ < var_102_18 + var_102_28 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play317171026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 317171026
		arg_103_1.duration_ = 3.166

		local var_103_0 = {
			zh = 3.166,
			ja = 1.999999999999
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
				arg_103_0:Play317171027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1199ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1199ui_story == nil then
				arg_103_1.var_.characterEffect1199ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1199ui_story then
					arg_103_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1199ui_story then
				arg_103_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_106_4 = 0

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				arg_103_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_1")
			end

			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_106_6 = arg_103_1.actors_["4014_tpose"].transform
			local var_106_7 = 0

			if var_106_7 < arg_103_1.time_ and arg_103_1.time_ <= var_106_7 + arg_106_0 then
				arg_103_1.var_.moveOldPos4014_tpose = var_106_6.localPosition
			end

			local var_106_8 = 0.001

			if var_106_7 <= arg_103_1.time_ and arg_103_1.time_ < var_106_7 + var_106_8 then
				local var_106_9 = (arg_103_1.time_ - var_106_7) / var_106_8
				local var_106_10 = Vector3.New(0, 100, 0)

				var_106_6.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos4014_tpose, var_106_10, var_106_9)

				local var_106_11 = manager.ui.mainCamera.transform.position - var_106_6.position

				var_106_6.forward = Vector3.New(var_106_11.x, var_106_11.y, var_106_11.z)

				local var_106_12 = var_106_6.localEulerAngles

				var_106_12.z = 0
				var_106_12.x = 0
				var_106_6.localEulerAngles = var_106_12
			end

			if arg_103_1.time_ >= var_106_7 + var_106_8 and arg_103_1.time_ < var_106_7 + var_106_8 + arg_106_0 then
				var_106_6.localPosition = Vector3.New(0, 100, 0)

				local var_106_13 = manager.ui.mainCamera.transform.position - var_106_6.position

				var_106_6.forward = Vector3.New(var_106_13.x, var_106_13.y, var_106_13.z)

				local var_106_14 = var_106_6.localEulerAngles

				var_106_14.z = 0
				var_106_14.x = 0
				var_106_6.localEulerAngles = var_106_14
			end

			local var_106_15 = arg_103_1.actors_["1199ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos1199ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0, -1.08, -5.9)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1199ui_story, var_106_19, var_106_18)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_15.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_15.localEulerAngles = var_106_21
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_106_22 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_22.x, var_106_22.y, var_106_22.z)

				local var_106_23 = var_106_15.localEulerAngles

				var_106_23.z = 0
				var_106_23.x = 0
				var_106_15.localEulerAngles = var_106_23
			end

			local var_106_24 = 0
			local var_106_25 = 0.275

			if var_106_24 < arg_103_1.time_ and arg_103_1.time_ <= var_106_24 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_26 = arg_103_1:FormatText(StoryNameCfg[84].name)

				arg_103_1.leftNameTxt_.text = var_106_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_27 = arg_103_1:GetWordFromCfg(317171026)
				local var_106_28 = arg_103_1:FormatText(var_106_27.content)

				arg_103_1.text_.text = var_106_28

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_29 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171026", "story_v_out_317171.awb") ~= 0 then
					local var_106_32 = manager.audio:GetVoiceLength("story_v_out_317171", "317171026", "story_v_out_317171.awb") / 1000

					if var_106_32 + var_106_24 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_32 + var_106_24
					end

					if var_106_27.prefab_name ~= "" and arg_103_1.actors_[var_106_27.prefab_name] ~= nil then
						local var_106_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_27.prefab_name].transform, "story_v_out_317171", "317171026", "story_v_out_317171.awb")

						arg_103_1:RecordAudio("317171026", var_106_33)
						arg_103_1:RecordAudio("317171026", var_106_33)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_317171", "317171026", "story_v_out_317171.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_317171", "317171026", "story_v_out_317171.awb")
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
	Play317171027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 317171027
		arg_107_1.duration_ = 5.9

		local var_107_0 = {
			zh = 5.9,
			ja = 5.433
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
				arg_107_0:Play317171028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.85

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[84].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(317171027)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171027", "story_v_out_317171.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_317171", "317171027", "story_v_out_317171.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_317171", "317171027", "story_v_out_317171.awb")

						arg_107_1:RecordAudio("317171027", var_110_9)
						arg_107_1:RecordAudio("317171027", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_317171", "317171027", "story_v_out_317171.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_317171", "317171027", "story_v_out_317171.awb")
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
	Play317171028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 317171028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play317171029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1199ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1199ui_story == nil then
				arg_111_1.var_.characterEffect1199ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1199ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1199ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1199ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1199ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 0.35

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_8 = arg_111_1:GetWordFromCfg(317171028)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 14
				local var_114_11 = utf8.len(var_114_9)
				local var_114_12 = var_114_10 <= 0 and var_114_7 or var_114_7 * (var_114_11 / var_114_10)

				if var_114_12 > 0 and var_114_7 < var_114_12 then
					arg_111_1.talkMaxDuration = var_114_12

					if var_114_12 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_9
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_13 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_13 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_13

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_13 and arg_111_1.time_ < var_114_6 + var_114_13 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play317171029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 317171029
		arg_115_1.duration_ = 10

		local var_115_0 = {
			zh = 7.233,
			ja = 10
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
				arg_115_0:Play317171030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["4014_tpose"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos4014_tpose = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(0, -1.95, -4.2)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos4014_tpose, var_118_4, var_118_3)

				local var_118_5 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_5.x, var_118_5.y, var_118_5.z)

				local var_118_6 = var_118_0.localEulerAngles

				var_118_6.z = 0
				var_118_6.x = 0
				var_118_0.localEulerAngles = var_118_6
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_118_7 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_7.x, var_118_7.y, var_118_7.z)

				local var_118_8 = var_118_0.localEulerAngles

				var_118_8.z = 0
				var_118_8.x = 0
				var_118_0.localEulerAngles = var_118_8
			end

			local var_118_9 = arg_115_1.actors_["4014_tpose"]
			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 and arg_115_1.var_.characterEffect4014_tpose == nil then
				arg_115_1.var_.characterEffect4014_tpose = var_118_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_11 = 0.200000002980232

			if var_118_10 <= arg_115_1.time_ and arg_115_1.time_ < var_118_10 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_10) / var_118_11

				if arg_115_1.var_.characterEffect4014_tpose then
					arg_115_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_10 + var_118_11 and arg_115_1.time_ < var_118_10 + var_118_11 + arg_118_0 and arg_115_1.var_.characterEffect4014_tpose then
				arg_115_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_118_14 = arg_115_1.actors_["1199ui_story"].transform
			local var_118_15 = 0

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 then
				arg_115_1.var_.moveOldPos1199ui_story = var_118_14.localPosition
			end

			local var_118_16 = 0.001

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_16 then
				local var_118_17 = (arg_115_1.time_ - var_118_15) / var_118_16
				local var_118_18 = Vector3.New(0, 100, 0)

				var_118_14.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1199ui_story, var_118_18, var_118_17)

				local var_118_19 = manager.ui.mainCamera.transform.position - var_118_14.position

				var_118_14.forward = Vector3.New(var_118_19.x, var_118_19.y, var_118_19.z)

				local var_118_20 = var_118_14.localEulerAngles

				var_118_20.z = 0
				var_118_20.x = 0
				var_118_14.localEulerAngles = var_118_20
			end

			if arg_115_1.time_ >= var_118_15 + var_118_16 and arg_115_1.time_ < var_118_15 + var_118_16 + arg_118_0 then
				var_118_14.localPosition = Vector3.New(0, 100, 0)

				local var_118_21 = manager.ui.mainCamera.transform.position - var_118_14.position

				var_118_14.forward = Vector3.New(var_118_21.x, var_118_21.y, var_118_21.z)

				local var_118_22 = var_118_14.localEulerAngles

				var_118_22.z = 0
				var_118_22.x = 0
				var_118_14.localEulerAngles = var_118_22
			end

			local var_118_23 = 0
			local var_118_24 = 0.7

			if var_118_23 < arg_115_1.time_ and arg_115_1.time_ <= var_118_23 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_25 = arg_115_1:FormatText(StoryNameCfg[87].name)

				arg_115_1.leftNameTxt_.text = var_118_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_26 = arg_115_1:GetWordFromCfg(317171029)
				local var_118_27 = arg_115_1:FormatText(var_118_26.content)

				arg_115_1.text_.text = var_118_27

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_28 = 28
				local var_118_29 = utf8.len(var_118_27)
				local var_118_30 = var_118_28 <= 0 and var_118_24 or var_118_24 * (var_118_29 / var_118_28)

				if var_118_30 > 0 and var_118_24 < var_118_30 then
					arg_115_1.talkMaxDuration = var_118_30

					if var_118_30 + var_118_23 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_30 + var_118_23
					end
				end

				arg_115_1.text_.text = var_118_27
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171029", "story_v_out_317171.awb") ~= 0 then
					local var_118_31 = manager.audio:GetVoiceLength("story_v_out_317171", "317171029", "story_v_out_317171.awb") / 1000

					if var_118_31 + var_118_23 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_31 + var_118_23
					end

					if var_118_26.prefab_name ~= "" and arg_115_1.actors_[var_118_26.prefab_name] ~= nil then
						local var_118_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_26.prefab_name].transform, "story_v_out_317171", "317171029", "story_v_out_317171.awb")

						arg_115_1:RecordAudio("317171029", var_118_32)
						arg_115_1:RecordAudio("317171029", var_118_32)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_317171", "317171029", "story_v_out_317171.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_317171", "317171029", "story_v_out_317171.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_33 = math.max(var_118_24, arg_115_1.talkMaxDuration)

			if var_118_23 <= arg_115_1.time_ and arg_115_1.time_ < var_118_23 + var_118_33 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_23) / var_118_33

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_23 + var_118_33 and arg_115_1.time_ < var_118_23 + var_118_33 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play317171030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 317171030
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play317171031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1199ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1199ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, -1.08, -5.9)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1199ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1199ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1199ui_story == nil then
				arg_119_1.var_.characterEffect1199ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.0166666666666667

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1199ui_story then
					local var_122_13 = Mathf.Lerp(0, 0.5, var_122_12)

					arg_119_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1199ui_story.fillRatio = var_122_13
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1199ui_story then
				local var_122_14 = 0.5

				arg_119_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1199ui_story.fillRatio = var_122_14
			end

			local var_122_15 = 0

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_122_16 = arg_119_1.actors_["4014_tpose"].transform
			local var_122_17 = 0

			if var_122_17 < arg_119_1.time_ and arg_119_1.time_ <= var_122_17 + arg_122_0 then
				arg_119_1.var_.moveOldPos4014_tpose = var_122_16.localPosition
			end

			local var_122_18 = 0.001

			if var_122_17 <= arg_119_1.time_ and arg_119_1.time_ < var_122_17 + var_122_18 then
				local var_122_19 = (arg_119_1.time_ - var_122_17) / var_122_18
				local var_122_20 = Vector3.New(0, 100, 0)

				var_122_16.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos4014_tpose, var_122_20, var_122_19)

				local var_122_21 = manager.ui.mainCamera.transform.position - var_122_16.position

				var_122_16.forward = Vector3.New(var_122_21.x, var_122_21.y, var_122_21.z)

				local var_122_22 = var_122_16.localEulerAngles

				var_122_22.z = 0
				var_122_22.x = 0
				var_122_16.localEulerAngles = var_122_22
			end

			if arg_119_1.time_ >= var_122_17 + var_122_18 and arg_119_1.time_ < var_122_17 + var_122_18 + arg_122_0 then
				var_122_16.localPosition = Vector3.New(0, 100, 0)

				local var_122_23 = manager.ui.mainCamera.transform.position - var_122_16.position

				var_122_16.forward = Vector3.New(var_122_23.x, var_122_23.y, var_122_23.z)

				local var_122_24 = var_122_16.localEulerAngles

				var_122_24.z = 0
				var_122_24.x = 0
				var_122_16.localEulerAngles = var_122_24
			end

			local var_122_25 = 0
			local var_122_26 = 0.35

			if var_122_25 < arg_119_1.time_ and arg_119_1.time_ <= var_122_25 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_27 = arg_119_1:GetWordFromCfg(317171030)
				local var_122_28 = arg_119_1:FormatText(var_122_27.content)

				arg_119_1.text_.text = var_122_28

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_29 = 14
				local var_122_30 = utf8.len(var_122_28)
				local var_122_31 = var_122_29 <= 0 and var_122_26 or var_122_26 * (var_122_30 / var_122_29)

				if var_122_31 > 0 and var_122_26 < var_122_31 then
					arg_119_1.talkMaxDuration = var_122_31

					if var_122_31 + var_122_25 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_31 + var_122_25
					end
				end

				arg_119_1.text_.text = var_122_28
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_32 = math.max(var_122_26, arg_119_1.talkMaxDuration)

			if var_122_25 <= arg_119_1.time_ and arg_119_1.time_ < var_122_25 + var_122_32 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_25) / var_122_32

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_25 + var_122_32 and arg_119_1.time_ < var_122_25 + var_122_32 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play317171031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 317171031
		arg_123_1.duration_ = 6

		local var_123_0 = {
			zh = 6,
			ja = 4.866
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
			arg_123_1.auto_ = false
		end

		function arg_123_1.playNext_(arg_125_0)
			arg_123_1.onStoryFinished_()
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1199ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1199ui_story == nil then
				arg_123_1.var_.characterEffect1199ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1199ui_story then
					arg_123_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1199ui_story then
				arg_123_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_126_4 = 0

			if var_126_4 < arg_123_1.time_ and arg_123_1.time_ <= var_126_4 + arg_126_0 then
				arg_123_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action435")
			end

			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 then
				arg_123_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_126_6 = 0
			local var_126_7 = 0.5

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[84].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(317171031)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 20
				local var_126_12 = utf8.len(var_126_10)
				local var_126_13 = var_126_11 <= 0 and var_126_7 or var_126_7 * (var_126_12 / var_126_11)

				if var_126_13 > 0 and var_126_7 < var_126_13 then
					arg_123_1.talkMaxDuration = var_126_13

					if var_126_13 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_10
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317171", "317171031", "story_v_out_317171.awb") ~= 0 then
					local var_126_14 = manager.audio:GetVoiceLength("story_v_out_317171", "317171031", "story_v_out_317171.awb") / 1000

					if var_126_14 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_14 + var_126_6
					end

					if var_126_9.prefab_name ~= "" and arg_123_1.actors_[var_126_9.prefab_name] ~= nil then
						local var_126_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_9.prefab_name].transform, "story_v_out_317171", "317171031", "story_v_out_317171.awb")

						arg_123_1:RecordAudio("317171031", var_126_15)
						arg_123_1:RecordAudio("317171031", var_126_15)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_317171", "317171031", "story_v_out_317171.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_317171", "317171031", "story_v_out_317171.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_16 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_16 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_16

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_16 and arg_123_1.time_ < var_126_6 + var_126_16 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K09f"
	},
	voices = {
		"story_v_out_317171.awb"
	}
}
