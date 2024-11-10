return {
	Play103041001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 103041001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play103041002(arg_1_1)
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

			local var_4_8 = 0
			local var_4_9 = 1

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				local var_4_10 = "play"
				local var_4_11 = "effect"

				arg_1_1:AudioAction(var_4_10, var_4_11, "se_story", "se_story_fight_metal", "")
			end

			local var_4_12 = 0

			if var_4_12 < arg_1_1.time_ and arg_1_1.time_ <= var_4_12 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_13 = 2

			if var_4_12 <= arg_1_1.time_ and arg_1_1.time_ < var_4_12 + var_4_13 then
				local var_4_14 = (arg_1_1.time_ - var_4_12) / var_4_13
				local var_4_15 = Color.New(0, 0, 0)

				var_4_15.a = Mathf.Lerp(1, 0, var_4_14)
				arg_1_1.mask_.color = var_4_15
			end

			if arg_1_1.time_ >= var_4_12 + var_4_13 and arg_1_1.time_ < var_4_12 + var_4_13 + arg_4_0 then
				local var_4_16 = Color.New(0, 0, 0)
				local var_4_17 = 0

				arg_1_1.mask_.enabled = false
				var_4_16.a = var_4_17
				arg_1_1.mask_.color = var_4_16
			end

			local var_4_18 = "B08b"

			if arg_1_1.bgs_[var_4_18] == nil then
				local var_4_19 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_19:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_18)
				var_4_19.name = var_4_18
				var_4_19.transform.parent = arg_1_1.stage_.transform
				var_4_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_18] = var_4_19
			end

			local var_4_20 = 0

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				local var_4_21 = manager.ui.mainCamera.transform.localPosition
				local var_4_22 = Vector3.New(0, 0, 10) + Vector3.New(var_4_21.x, var_4_21.y, 0)
				local var_4_23 = arg_1_1.bgs_.B08b

				var_4_23.transform.localPosition = var_4_22
				var_4_23.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_24 = var_4_23:GetComponent("SpriteRenderer")

				if var_4_24 and var_4_24.sprite then
					local var_4_25 = (var_4_23.transform.localPosition - var_4_21).z
					local var_4_26 = manager.ui.mainCameraCom_
					local var_4_27 = 2 * var_4_25 * Mathf.Tan(var_4_26.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_28 = var_4_27 * var_4_26.aspect
					local var_4_29 = var_4_24.sprite.bounds.size.x
					local var_4_30 = var_4_24.sprite.bounds.size.y
					local var_4_31 = var_4_28 / var_4_29
					local var_4_32 = var_4_27 / var_4_30
					local var_4_33 = var_4_32 < var_4_31 and var_4_31 or var_4_32

					var_4_23.transform.localScale = Vector3.New(var_4_33, var_4_33, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B08b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.3

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(103041001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 11
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play103041002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 103041002
		arg_7_1.duration_ = 2.433

		local var_7_0 = {
			ja = 2.433,
			ko = 2.133,
			zh = 2.433,
			en = 2.4
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
				arg_7_0:Play103041003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "2020_tpose"

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

			local var_10_4 = arg_7_1.actors_["2020_tpose"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect2020_tpose == nil then
				arg_7_1.var_.characterEffect2020_tpose = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect2020_tpose then
					arg_7_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect2020_tpose then
				arg_7_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["2020_tpose"].transform
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.var_.moveOldPos2020_tpose = var_10_8.localPosition
			end

			local var_10_10 = 0.001

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10
				local var_10_12 = Vector3.New(-0.7, -1.2, -4.1)

				var_10_8.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2020_tpose, var_10_12, var_10_11)

				local var_10_13 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_13.x, var_10_13.y, var_10_13.z)

				local var_10_14 = var_10_8.localEulerAngles

				var_10_14.z = 0
				var_10_14.x = 0
				var_10_8.localEulerAngles = var_10_14
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 then
				var_10_8.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_8.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_8.localEulerAngles = var_10_16
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_10_18 = 0
			local var_10_19 = 0.2

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_20 = arg_7_1:FormatText(StoryNameCfg[34].name)

				arg_7_1.leftNameTxt_.text = var_10_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_21 = arg_7_1:GetWordFromCfg(103041002)
				local var_10_22 = arg_7_1:FormatText(var_10_21.content)

				arg_7_1.text_.text = var_10_22

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_23 = 8
				local var_10_24 = utf8.len(var_10_22)
				local var_10_25 = var_10_23 <= 0 and var_10_19 or var_10_19 * (var_10_24 / var_10_23)

				if var_10_25 > 0 and var_10_19 < var_10_25 then
					arg_7_1.talkMaxDuration = var_10_25

					if var_10_25 + var_10_18 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_25 + var_10_18
					end
				end

				arg_7_1.text_.text = var_10_22
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041002", "story_v_out_103041.awb") ~= 0 then
					local var_10_26 = manager.audio:GetVoiceLength("story_v_out_103041", "103041002", "story_v_out_103041.awb") / 1000

					if var_10_26 + var_10_18 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_18
					end

					if var_10_21.prefab_name ~= "" and arg_7_1.actors_[var_10_21.prefab_name] ~= nil then
						local var_10_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_21.prefab_name].transform, "story_v_out_103041", "103041002", "story_v_out_103041.awb")

						arg_7_1:RecordAudio("103041002", var_10_27)
						arg_7_1:RecordAudio("103041002", var_10_27)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_103041", "103041002", "story_v_out_103041.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_103041", "103041002", "story_v_out_103041.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_28 = math.max(var_10_19, arg_7_1.talkMaxDuration)

			if var_10_18 <= arg_7_1.time_ and arg_7_1.time_ < var_10_18 + var_10_28 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_18) / var_10_28

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_18 + var_10_28 and arg_7_1.time_ < var_10_18 + var_10_28 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play103041003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 103041003
		arg_11_1.duration_ = 2.933

		local var_11_0 = {
			ja = 2.933,
			ko = 2.233,
			zh = 2.066,
			en = 2.366
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
				arg_11_0:Play103041004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "2030_tpose"

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

			local var_14_4 = arg_11_1.actors_["2030_tpose"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect2030_tpose == nil then
				arg_11_1.var_.characterEffect2030_tpose = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect2030_tpose then
					arg_11_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect2030_tpose then
				arg_11_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_14_8 = arg_11_1.actors_["2020_tpose"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect2020_tpose == nil then
				arg_11_1.var_.characterEffect2020_tpose = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect2020_tpose then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_11_1.var_.characterEffect2020_tpose.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect2020_tpose then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_11_1.var_.characterEffect2020_tpose.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["2030_tpose"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos2030_tpose = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0.7, -1.2, -4.2)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2030_tpose, var_14_18, var_14_17)

				local var_14_19 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_19.x, var_14_19.y, var_14_19.z)

				local var_14_20 = var_14_14.localEulerAngles

				var_14_20.z = 0
				var_14_20.x = 0
				var_14_14.localEulerAngles = var_14_20
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 then
				var_14_14.localPosition = Vector3.New(0.7, -1.2, -4.2)

				local var_14_21 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_21.x, var_14_21.y, var_14_21.z)

				local var_14_22 = var_14_14.localEulerAngles

				var_14_22.z = 0
				var_14_22.x = 0
				var_14_14.localEulerAngles = var_14_22
			end

			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 then
				arg_11_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_14_24 = 0
			local var_14_25 = 0.15

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_26 = arg_11_1:FormatText(StoryNameCfg[34].name)

				arg_11_1.leftNameTxt_.text = var_14_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_27 = arg_11_1:GetWordFromCfg(103041003)
				local var_14_28 = arg_11_1:FormatText(var_14_27.content)

				arg_11_1.text_.text = var_14_28

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_29 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041003", "story_v_out_103041.awb") ~= 0 then
					local var_14_32 = manager.audio:GetVoiceLength("story_v_out_103041", "103041003", "story_v_out_103041.awb") / 1000

					if var_14_32 + var_14_24 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_32 + var_14_24
					end

					if var_14_27.prefab_name ~= "" and arg_11_1.actors_[var_14_27.prefab_name] ~= nil then
						local var_14_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_27.prefab_name].transform, "story_v_out_103041", "103041003", "story_v_out_103041.awb")

						arg_11_1:RecordAudio("103041003", var_14_33)
						arg_11_1:RecordAudio("103041003", var_14_33)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_103041", "103041003", "story_v_out_103041.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_103041", "103041003", "story_v_out_103041.awb")
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
	Play103041004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103041004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play103041005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["2030_tpose"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect2030_tpose == nil then
				arg_15_1.var_.characterEffect2030_tpose = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect2030_tpose then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_15_1.var_.characterEffect2030_tpose.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect2030_tpose then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_15_1.var_.characterEffect2030_tpose.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["2020_tpose"].transform
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 then
				arg_15_1.var_.moveOldPos2020_tpose = var_18_6.localPosition
			end

			local var_18_8 = 0.001

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8
				local var_18_10 = Vector3.New(0, 100, 0)

				var_18_6.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos2020_tpose, var_18_10, var_18_9)

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

			local var_18_15 = arg_15_1.actors_["2030_tpose"].transform
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.var_.moveOldPos2030_tpose = var_18_15.localPosition
			end

			local var_18_17 = 0.001

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17
				local var_18_19 = Vector3.New(0, 100, 0)

				var_18_15.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos2030_tpose, var_18_19, var_18_18)

				local var_18_20 = manager.ui.mainCamera.transform.position - var_18_15.position

				var_18_15.forward = Vector3.New(var_18_20.x, var_18_20.y, var_18_20.z)

				local var_18_21 = var_18_15.localEulerAngles

				var_18_21.z = 0
				var_18_21.x = 0
				var_18_15.localEulerAngles = var_18_21
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 then
				var_18_15.localPosition = Vector3.New(0, 100, 0)

				local var_18_22 = manager.ui.mainCamera.transform.position - var_18_15.position

				var_18_15.forward = Vector3.New(var_18_22.x, var_18_22.y, var_18_22.z)

				local var_18_23 = var_18_15.localEulerAngles

				var_18_23.z = 0
				var_18_23.x = 0
				var_18_15.localEulerAngles = var_18_23
			end

			local var_18_24 = 0
			local var_18_25 = 0.925

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_26 = arg_15_1:GetWordFromCfg(103041004)
				local var_18_27 = arg_15_1:FormatText(var_18_26.content)

				arg_15_1.text_.text = var_18_27

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_28 = 37
				local var_18_29 = utf8.len(var_18_27)
				local var_18_30 = var_18_28 <= 0 and var_18_25 or var_18_25 * (var_18_29 / var_18_28)

				if var_18_30 > 0 and var_18_25 < var_18_30 then
					arg_15_1.talkMaxDuration = var_18_30

					if var_18_30 + var_18_24 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_30 + var_18_24
					end
				end

				arg_15_1.text_.text = var_18_27
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_31 = math.max(var_18_25, arg_15_1.talkMaxDuration)

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_31 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_24) / var_18_31

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_24 + var_18_31 and arg_15_1.time_ < var_18_24 + var_18_31 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play103041005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103041005
		arg_19_1.duration_ = 7.466

		local var_19_0 = {
			ja = 7.166,
			ko = 6.7,
			zh = 7.466,
			en = 5.566
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
				arg_19_0:Play103041006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "4010ui_story"

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

			local var_22_4 = arg_19_1.actors_["4010ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect4010ui_story == nil then
				arg_19_1.var_.characterEffect4010ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect4010ui_story then
					arg_19_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect4010ui_story then
				arg_19_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_22_8 = arg_19_1.actors_["4010ui_story"].transform
			local var_22_9 = 0

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				arg_19_1.var_.moveOldPos4010ui_story = var_22_8.localPosition
			end

			local var_22_10 = 0.001

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_10 then
				local var_22_11 = (arg_19_1.time_ - var_22_9) / var_22_10
				local var_22_12 = Vector3.New(0, -1.59, -5.2)

				var_22_8.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos4010ui_story, var_22_12, var_22_11)

				local var_22_13 = manager.ui.mainCamera.transform.position - var_22_8.position

				var_22_8.forward = Vector3.New(var_22_13.x, var_22_13.y, var_22_13.z)

				local var_22_14 = var_22_8.localEulerAngles

				var_22_14.z = 0
				var_22_14.x = 0
				var_22_8.localEulerAngles = var_22_14
			end

			if arg_19_1.time_ >= var_22_9 + var_22_10 and arg_19_1.time_ < var_22_9 + var_22_10 + arg_22_0 then
				var_22_8.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_22_15 = manager.ui.mainCamera.transform.position - var_22_8.position

				var_22_8.forward = Vector3.New(var_22_15.x, var_22_15.y, var_22_15.z)

				local var_22_16 = var_22_8.localEulerAngles

				var_22_16.z = 0
				var_22_16.x = 0
				var_22_8.localEulerAngles = var_22_16
			end

			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_22_19 = 0
			local var_22_20 = 0.65

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_21 = arg_19_1:FormatText(StoryNameCfg[42].name)

				arg_19_1.leftNameTxt_.text = var_22_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_22 = arg_19_1:GetWordFromCfg(103041005)
				local var_22_23 = arg_19_1:FormatText(var_22_22.content)

				arg_19_1.text_.text = var_22_23

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_24 = 26
				local var_22_25 = utf8.len(var_22_23)
				local var_22_26 = var_22_24 <= 0 and var_22_20 or var_22_20 * (var_22_25 / var_22_24)

				if var_22_26 > 0 and var_22_20 < var_22_26 then
					arg_19_1.talkMaxDuration = var_22_26

					if var_22_26 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_26 + var_22_19
					end
				end

				arg_19_1.text_.text = var_22_23
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041005", "story_v_out_103041.awb") ~= 0 then
					local var_22_27 = manager.audio:GetVoiceLength("story_v_out_103041", "103041005", "story_v_out_103041.awb") / 1000

					if var_22_27 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_19
					end

					if var_22_22.prefab_name ~= "" and arg_19_1.actors_[var_22_22.prefab_name] ~= nil then
						local var_22_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_22.prefab_name].transform, "story_v_out_103041", "103041005", "story_v_out_103041.awb")

						arg_19_1:RecordAudio("103041005", var_22_28)
						arg_19_1:RecordAudio("103041005", var_22_28)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_103041", "103041005", "story_v_out_103041.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_103041", "103041005", "story_v_out_103041.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_29 = math.max(var_22_20, arg_19_1.talkMaxDuration)

			if var_22_19 <= arg_19_1.time_ and arg_19_1.time_ < var_22_19 + var_22_29 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_19) / var_22_29

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_19 + var_22_29 and arg_19_1.time_ < var_22_19 + var_22_29 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play103041006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 103041006
		arg_23_1.duration_ = 3.566

		local var_23_0 = {
			ja = 3.566,
			ko = 2.2,
			zh = 2.366,
			en = 2.033
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
				arg_23_0:Play103041007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "3009ui_story"

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

			local var_26_4 = arg_23_1.actors_["3009ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect3009ui_story == nil then
				arg_23_1.var_.characterEffect3009ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect3009ui_story then
					arg_23_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect3009ui_story then
				arg_23_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["4010ui_story"]
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect4010ui_story == nil then
				arg_23_1.var_.characterEffect4010ui_story = var_26_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_10 = 0.1

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10

				if arg_23_1.var_.characterEffect4010ui_story then
					local var_26_12 = Mathf.Lerp(0, 0.5, var_26_11)

					arg_23_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_23_1.var_.characterEffect4010ui_story.fillRatio = var_26_12
				end
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect4010ui_story then
				local var_26_13 = 0.5

				arg_23_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_23_1.var_.characterEffect4010ui_story.fillRatio = var_26_13
			end

			local var_26_14 = arg_23_1.actors_["4010ui_story"].transform
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.var_.moveOldPos4010ui_story = var_26_14.localPosition
			end

			local var_26_16 = 0.001

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16
				local var_26_18 = Vector3.New(0, 100, 0)

				var_26_14.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos4010ui_story, var_26_18, var_26_17)

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

			local var_26_23 = arg_23_1.actors_["3009ui_story"].transform
			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.var_.moveOldPos3009ui_story = var_26_23.localPosition

				local var_26_25 = "3009ui_story"

				arg_23_1:ShowWeapon(arg_23_1.var_[var_26_25 .. "Animator"].transform, true)
			end

			local var_26_26 = 0.001

			if var_26_24 <= arg_23_1.time_ and arg_23_1.time_ < var_26_24 + var_26_26 then
				local var_26_27 = (arg_23_1.time_ - var_26_24) / var_26_26
				local var_26_28 = Vector3.New(-0.7, -1.75, -4.8)

				var_26_23.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos3009ui_story, var_26_28, var_26_27)

				local var_26_29 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_29.x, var_26_29.y, var_26_29.z)

				local var_26_30 = var_26_23.localEulerAngles

				var_26_30.z = 0
				var_26_30.x = 0
				var_26_23.localEulerAngles = var_26_30
			end

			if arg_23_1.time_ >= var_26_24 + var_26_26 and arg_23_1.time_ < var_26_24 + var_26_26 + arg_26_0 then
				var_26_23.localPosition = Vector3.New(-0.7, -1.75, -4.8)

				local var_26_31 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_31.x, var_26_31.y, var_26_31.z)

				local var_26_32 = var_26_23.localEulerAngles

				var_26_32.z = 0
				var_26_32.x = 0
				var_26_23.localEulerAngles = var_26_32
			end

			local var_26_33 = 0

			if var_26_33 < arg_23_1.time_ and arg_23_1.time_ <= var_26_33 + arg_26_0 then
				arg_23_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action1_1")
			end

			local var_26_34 = 0

			if var_26_34 < arg_23_1.time_ and arg_23_1.time_ <= var_26_34 + arg_26_0 then
				arg_23_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_26_35 = 0
			local var_26_36 = 0.25

			if var_26_35 < arg_23_1.time_ and arg_23_1.time_ <= var_26_35 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_37 = arg_23_1:FormatText(StoryNameCfg[43].name)

				arg_23_1.leftNameTxt_.text = var_26_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_38 = arg_23_1:GetWordFromCfg(103041006)
				local var_26_39 = arg_23_1:FormatText(var_26_38.content)

				arg_23_1.text_.text = var_26_39

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_40 = 10
				local var_26_41 = utf8.len(var_26_39)
				local var_26_42 = var_26_40 <= 0 and var_26_36 or var_26_36 * (var_26_41 / var_26_40)

				if var_26_42 > 0 and var_26_36 < var_26_42 then
					arg_23_1.talkMaxDuration = var_26_42

					if var_26_42 + var_26_35 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_42 + var_26_35
					end
				end

				arg_23_1.text_.text = var_26_39
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041006", "story_v_out_103041.awb") ~= 0 then
					local var_26_43 = manager.audio:GetVoiceLength("story_v_out_103041", "103041006", "story_v_out_103041.awb") / 1000

					if var_26_43 + var_26_35 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_43 + var_26_35
					end

					if var_26_38.prefab_name ~= "" and arg_23_1.actors_[var_26_38.prefab_name] ~= nil then
						local var_26_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_38.prefab_name].transform, "story_v_out_103041", "103041006", "story_v_out_103041.awb")

						arg_23_1:RecordAudio("103041006", var_26_44)
						arg_23_1:RecordAudio("103041006", var_26_44)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_103041", "103041006", "story_v_out_103041.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_103041", "103041006", "story_v_out_103041.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_45 = math.max(var_26_36, arg_23_1.talkMaxDuration)

			if var_26_35 <= arg_23_1.time_ and arg_23_1.time_ < var_26_35 + var_26_45 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_35) / var_26_45

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_35 + var_26_45 and arg_23_1.time_ < var_26_35 + var_26_45 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play103041007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 103041007
		arg_27_1.duration_ = 2.733

		local var_27_0 = {
			ja = 2.633,
			ko = 2.733,
			zh = 2,
			en = 2.666
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
				arg_27_0:Play103041008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "3008ui_story"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("Char/" .. var_30_0), arg_27_1.stage_.transform)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_0] = var_30_1

				local var_30_2 = var_30_1:GetComponentInChildren(typeof(CharacterEffect))

				var_30_2.enabled = true

				local var_30_3 = GameObjectTools.GetOrAddComponent(var_30_1, typeof(DynamicBoneHelper))

				if var_30_3 then
					var_30_3:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_2.transform, false)

				arg_27_1.var_[var_30_0 .. "Animator"] = var_30_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_0 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_0 .. "LipSync"] = var_30_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
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
					arg_27_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect3008ui_story then
				arg_27_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_30_8 = arg_27_1.actors_["3009ui_story"]
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 and arg_27_1.var_.characterEffect3009ui_story == nil then
				arg_27_1.var_.characterEffect3009ui_story = var_30_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_10 = 0.1

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_10 then
				local var_30_11 = (arg_27_1.time_ - var_30_9) / var_30_10

				if arg_27_1.var_.characterEffect3009ui_story then
					local var_30_12 = Mathf.Lerp(0, 0.5, var_30_11)

					arg_27_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_27_1.var_.characterEffect3009ui_story.fillRatio = var_30_12
				end
			end

			if arg_27_1.time_ >= var_30_9 + var_30_10 and arg_27_1.time_ < var_30_9 + var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect3009ui_story then
				local var_30_13 = 0.5

				arg_27_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_27_1.var_.characterEffect3009ui_story.fillRatio = var_30_13
			end

			local var_30_14 = arg_27_1.actors_["3008ui_story"].transform
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.var_.moveOldPos3008ui_story = var_30_14.localPosition
			end

			local var_30_16 = 0.001

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16
				local var_30_18 = Vector3.New(0.7, -1.51, -4.3)

				var_30_14.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos3008ui_story, var_30_18, var_30_17)

				local var_30_19 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_19.x, var_30_19.y, var_30_19.z)

				local var_30_20 = var_30_14.localEulerAngles

				var_30_20.z = 0
				var_30_20.x = 0
				var_30_14.localEulerAngles = var_30_20
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 then
				var_30_14.localPosition = Vector3.New(0.7, -1.51, -4.3)

				local var_30_21 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_21.x, var_30_21.y, var_30_21.z)

				local var_30_22 = var_30_14.localEulerAngles

				var_30_22.z = 0
				var_30_22.x = 0
				var_30_14.localEulerAngles = var_30_22
			end

			local var_30_23 = 0

			if var_30_23 < arg_27_1.time_ and arg_27_1.time_ <= var_30_23 + arg_30_0 then
				arg_27_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action1_1")
			end

			local var_30_24 = 0

			if var_30_24 < arg_27_1.time_ and arg_27_1.time_ <= var_30_24 + arg_30_0 then
				arg_27_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_30_25 = 0
			local var_30_26 = 0.2

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_27 = arg_27_1:FormatText(StoryNameCfg[20].name)

				arg_27_1.leftNameTxt_.text = var_30_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_28 = arg_27_1:GetWordFromCfg(103041007)
				local var_30_29 = arg_27_1:FormatText(var_30_28.content)

				arg_27_1.text_.text = var_30_29

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_30 = 8
				local var_30_31 = utf8.len(var_30_29)
				local var_30_32 = var_30_30 <= 0 and var_30_26 or var_30_26 * (var_30_31 / var_30_30)

				if var_30_32 > 0 and var_30_26 < var_30_32 then
					arg_27_1.talkMaxDuration = var_30_32

					if var_30_32 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_32 + var_30_25
					end
				end

				arg_27_1.text_.text = var_30_29
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041007", "story_v_out_103041.awb") ~= 0 then
					local var_30_33 = manager.audio:GetVoiceLength("story_v_out_103041", "103041007", "story_v_out_103041.awb") / 1000

					if var_30_33 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_33 + var_30_25
					end

					if var_30_28.prefab_name ~= "" and arg_27_1.actors_[var_30_28.prefab_name] ~= nil then
						local var_30_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_28.prefab_name].transform, "story_v_out_103041", "103041007", "story_v_out_103041.awb")

						arg_27_1:RecordAudio("103041007", var_30_34)
						arg_27_1:RecordAudio("103041007", var_30_34)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_103041", "103041007", "story_v_out_103041.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_103041", "103041007", "story_v_out_103041.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_35 = math.max(var_30_26, arg_27_1.talkMaxDuration)

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_35 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_25) / var_30_35

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_25 + var_30_35 and arg_27_1.time_ < var_30_25 + var_30_35 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play103041008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 103041008
		arg_31_1.duration_ = 8.033

		local var_31_0 = {
			ja = 8.033,
			ko = 5.8,
			zh = 5.366,
			en = 5.566
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
				arg_31_0:Play103041009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["4010ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect4010ui_story == nil then
				arg_31_1.var_.characterEffect4010ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect4010ui_story then
					arg_31_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect4010ui_story then
				arg_31_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["3008ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect3008ui_story == nil then
				arg_31_1.var_.characterEffect3008ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect3008ui_story then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_31_1.var_.characterEffect3008ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect3008ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_31_1.var_.characterEffect3008ui_story.fillRatio = var_34_9
			end

			local var_34_10 = arg_31_1.actors_["3008ui_story"].transform
			local var_34_11 = 0

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.var_.moveOldPos3008ui_story = var_34_10.localPosition
			end

			local var_34_12 = 0.001

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_12 then
				local var_34_13 = (arg_31_1.time_ - var_34_11) / var_34_12
				local var_34_14 = Vector3.New(0, 100, 0)

				var_34_10.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos3008ui_story, var_34_14, var_34_13)

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

			local var_34_19 = arg_31_1.actors_["3009ui_story"].transform
			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1.var_.moveOldPos3009ui_story = var_34_19.localPosition
			end

			local var_34_21 = 0.001

			if var_34_20 <= arg_31_1.time_ and arg_31_1.time_ < var_34_20 + var_34_21 then
				local var_34_22 = (arg_31_1.time_ - var_34_20) / var_34_21
				local var_34_23 = Vector3.New(0, 100, 0)

				var_34_19.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos3009ui_story, var_34_23, var_34_22)

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

			local var_34_28 = arg_31_1.actors_["4010ui_story"].transform
			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.var_.moveOldPos4010ui_story = var_34_28.localPosition
			end

			local var_34_30 = 0.001

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_30 then
				local var_34_31 = (arg_31_1.time_ - var_34_29) / var_34_30
				local var_34_32 = Vector3.New(-0.7, -1.59, -5.2)

				var_34_28.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos4010ui_story, var_34_32, var_34_31)

				local var_34_33 = manager.ui.mainCamera.transform.position - var_34_28.position

				var_34_28.forward = Vector3.New(var_34_33.x, var_34_33.y, var_34_33.z)

				local var_34_34 = var_34_28.localEulerAngles

				var_34_34.z = 0
				var_34_34.x = 0
				var_34_28.localEulerAngles = var_34_34
			end

			if arg_31_1.time_ >= var_34_29 + var_34_30 and arg_31_1.time_ < var_34_29 + var_34_30 + arg_34_0 then
				var_34_28.localPosition = Vector3.New(-0.7, -1.59, -5.2)

				local var_34_35 = manager.ui.mainCamera.transform.position - var_34_28.position

				var_34_28.forward = Vector3.New(var_34_35.x, var_34_35.y, var_34_35.z)

				local var_34_36 = var_34_28.localEulerAngles

				var_34_36.z = 0
				var_34_36.x = 0
				var_34_28.localEulerAngles = var_34_36
			end

			local var_34_37 = 0

			if var_34_37 < arg_31_1.time_ and arg_31_1.time_ <= var_34_37 + arg_34_0 then
				arg_31_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_34_38 = 0

			if var_34_38 < arg_31_1.time_ and arg_31_1.time_ <= var_34_38 + arg_34_0 then
				arg_31_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_34_39 = 0
			local var_34_40 = 0.575

			if var_34_39 < arg_31_1.time_ and arg_31_1.time_ <= var_34_39 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_41 = arg_31_1:FormatText(StoryNameCfg[42].name)

				arg_31_1.leftNameTxt_.text = var_34_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_42 = arg_31_1:GetWordFromCfg(103041008)
				local var_34_43 = arg_31_1:FormatText(var_34_42.content)

				arg_31_1.text_.text = var_34_43

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_44 = 23
				local var_34_45 = utf8.len(var_34_43)
				local var_34_46 = var_34_44 <= 0 and var_34_40 or var_34_40 * (var_34_45 / var_34_44)

				if var_34_46 > 0 and var_34_40 < var_34_46 then
					arg_31_1.talkMaxDuration = var_34_46

					if var_34_46 + var_34_39 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_46 + var_34_39
					end
				end

				arg_31_1.text_.text = var_34_43
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041008", "story_v_out_103041.awb") ~= 0 then
					local var_34_47 = manager.audio:GetVoiceLength("story_v_out_103041", "103041008", "story_v_out_103041.awb") / 1000

					if var_34_47 + var_34_39 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_47 + var_34_39
					end

					if var_34_42.prefab_name ~= "" and arg_31_1.actors_[var_34_42.prefab_name] ~= nil then
						local var_34_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_42.prefab_name].transform, "story_v_out_103041", "103041008", "story_v_out_103041.awb")

						arg_31_1:RecordAudio("103041008", var_34_48)
						arg_31_1:RecordAudio("103041008", var_34_48)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_103041", "103041008", "story_v_out_103041.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_103041", "103041008", "story_v_out_103041.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_49 = math.max(var_34_40, arg_31_1.talkMaxDuration)

			if var_34_39 <= arg_31_1.time_ and arg_31_1.time_ < var_34_39 + var_34_49 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_39) / var_34_49

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_39 + var_34_49 and arg_31_1.time_ < var_34_39 + var_34_49 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play103041009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 103041009
		arg_35_1.duration_ = 4.666

		local var_35_0 = {
			ja = 4.666,
			ko = 3.033,
			zh = 3.366,
			en = 3.066
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
				arg_35_0:Play103041010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "1011ui_story"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("Char/" .. var_38_0), arg_35_1.stage_.transform)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_0] = var_38_1

				local var_38_2 = var_38_1:GetComponentInChildren(typeof(CharacterEffect))

				var_38_2.enabled = true

				local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_1, typeof(DynamicBoneHelper))

				if var_38_3 then
					var_38_3:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_2.transform, false)

				arg_35_1.var_[var_38_0 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_0 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_0 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_4 = arg_35_1.actors_["1011ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1011ui_story == nil then
				arg_35_1.var_.characterEffect1011ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1011ui_story then
					arg_35_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1011ui_story then
				arg_35_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_38_8 = arg_35_1.actors_["4010ui_story"]
			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 and arg_35_1.var_.characterEffect4010ui_story == nil then
				arg_35_1.var_.characterEffect4010ui_story = var_38_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_10 = 0.1

			if var_38_9 <= arg_35_1.time_ and arg_35_1.time_ < var_38_9 + var_38_10 then
				local var_38_11 = (arg_35_1.time_ - var_38_9) / var_38_10

				if arg_35_1.var_.characterEffect4010ui_story then
					local var_38_12 = Mathf.Lerp(0, 0.5, var_38_11)

					arg_35_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_35_1.var_.characterEffect4010ui_story.fillRatio = var_38_12
				end
			end

			if arg_35_1.time_ >= var_38_9 + var_38_10 and arg_35_1.time_ < var_38_9 + var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect4010ui_story then
				local var_38_13 = 0.5

				arg_35_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_35_1.var_.characterEffect4010ui_story.fillRatio = var_38_13
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_38_15 = arg_35_1.actors_["1011ui_story"].transform
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.var_.moveOldPos1011ui_story = var_38_15.localPosition
			end

			local var_38_17 = 0.001

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Vector3.New(0.7, -0.71, -6)

				var_38_15.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1011ui_story, var_38_19, var_38_18)

				local var_38_20 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_20.x, var_38_20.y, var_38_20.z)

				local var_38_21 = var_38_15.localEulerAngles

				var_38_21.z = 0
				var_38_21.x = 0
				var_38_15.localEulerAngles = var_38_21
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				var_38_15.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_38_22 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_22.x, var_38_22.y, var_38_22.z)

				local var_38_23 = var_38_15.localEulerAngles

				var_38_23.z = 0
				var_38_23.x = 0
				var_38_15.localEulerAngles = var_38_23
			end

			local var_38_24 = 0

			if var_38_24 < arg_35_1.time_ and arg_35_1.time_ <= var_38_24 + arg_38_0 then
				arg_35_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_25 = 0
			local var_38_26 = 0.325

			if var_38_25 < arg_35_1.time_ and arg_35_1.time_ <= var_38_25 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_27 = arg_35_1:FormatText(StoryNameCfg[37].name)

				arg_35_1.leftNameTxt_.text = var_38_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_28 = arg_35_1:GetWordFromCfg(103041009)
				local var_38_29 = arg_35_1:FormatText(var_38_28.content)

				arg_35_1.text_.text = var_38_29

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_30 = 13
				local var_38_31 = utf8.len(var_38_29)
				local var_38_32 = var_38_30 <= 0 and var_38_26 or var_38_26 * (var_38_31 / var_38_30)

				if var_38_32 > 0 and var_38_26 < var_38_32 then
					arg_35_1.talkMaxDuration = var_38_32

					if var_38_32 + var_38_25 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_32 + var_38_25
					end
				end

				arg_35_1.text_.text = var_38_29
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041009", "story_v_out_103041.awb") ~= 0 then
					local var_38_33 = manager.audio:GetVoiceLength("story_v_out_103041", "103041009", "story_v_out_103041.awb") / 1000

					if var_38_33 + var_38_25 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_33 + var_38_25
					end

					if var_38_28.prefab_name ~= "" and arg_35_1.actors_[var_38_28.prefab_name] ~= nil then
						local var_38_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_28.prefab_name].transform, "story_v_out_103041", "103041009", "story_v_out_103041.awb")

						arg_35_1:RecordAudio("103041009", var_38_34)
						arg_35_1:RecordAudio("103041009", var_38_34)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_103041", "103041009", "story_v_out_103041.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_103041", "103041009", "story_v_out_103041.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_35 = math.max(var_38_26, arg_35_1.talkMaxDuration)

			if var_38_25 <= arg_35_1.time_ and arg_35_1.time_ < var_38_25 + var_38_35 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_25) / var_38_35

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_25 + var_38_35 and arg_35_1.time_ < var_38_25 + var_38_35 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play103041010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 103041010
		arg_39_1.duration_ = 10.5

		local var_39_0 = {
			ja = 10.5,
			ko = 7.7,
			zh = 7.5,
			en = 6.133
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
				arg_39_0:Play103041011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["4010ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect4010ui_story == nil then
				arg_39_1.var_.characterEffect4010ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect4010ui_story then
					arg_39_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect4010ui_story then
				arg_39_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1011ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1011ui_story == nil then
				arg_39_1.var_.characterEffect1011ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1011ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1011ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1011ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1011ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action2_1")
			end

			local var_42_12 = 0
			local var_42_13 = 0.825

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[42].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(103041010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 33
				local var_42_18 = utf8.len(var_42_16)
				local var_42_19 = var_42_17 <= 0 and var_42_13 or var_42_13 * (var_42_18 / var_42_17)

				if var_42_19 > 0 and var_42_13 < var_42_19 then
					arg_39_1.talkMaxDuration = var_42_19

					if var_42_19 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_12
					end
				end

				arg_39_1.text_.text = var_42_16
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041010", "story_v_out_103041.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_103041", "103041010", "story_v_out_103041.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_103041", "103041010", "story_v_out_103041.awb")

						arg_39_1:RecordAudio("103041010", var_42_21)
						arg_39_1:RecordAudio("103041010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_103041", "103041010", "story_v_out_103041.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_103041", "103041010", "story_v_out_103041.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_13, arg_39_1.talkMaxDuration)

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_12) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_12 + var_42_22 and arg_39_1.time_ < var_42_12 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play103041011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 103041011
		arg_43_1.duration_ = 1.999999999999

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play103041012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = "1019ui_story"

			if arg_43_1.actors_[var_46_0] == nil then
				local var_46_1 = Object.Instantiate(Asset.Load("Char/" .. var_46_0), arg_43_1.stage_.transform)

				var_46_1.name = var_46_0
				var_46_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.actors_[var_46_0] = var_46_1

				local var_46_2 = var_46_1:GetComponentInChildren(typeof(CharacterEffect))

				var_46_2.enabled = true

				local var_46_3 = GameObjectTools.GetOrAddComponent(var_46_1, typeof(DynamicBoneHelper))

				if var_46_3 then
					var_46_3:EnableDynamicBone(false)
				end

				arg_43_1:ShowWeapon(var_46_2.transform, false)

				arg_43_1.var_[var_46_0 .. "Animator"] = var_46_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_43_1.var_[var_46_0 .. "Animator"].applyRootMotion = true
				arg_43_1.var_[var_46_0 .. "LipSync"] = var_46_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
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
					arg_43_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1019ui_story then
				arg_43_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_46_8 = arg_43_1.actors_["4010ui_story"]
			local var_46_9 = 0

			if var_46_9 < arg_43_1.time_ and arg_43_1.time_ <= var_46_9 + arg_46_0 and arg_43_1.var_.characterEffect4010ui_story == nil then
				arg_43_1.var_.characterEffect4010ui_story = var_46_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_10 = 0.1

			if var_46_9 <= arg_43_1.time_ and arg_43_1.time_ < var_46_9 + var_46_10 then
				local var_46_11 = (arg_43_1.time_ - var_46_9) / var_46_10

				if arg_43_1.var_.characterEffect4010ui_story then
					local var_46_12 = Mathf.Lerp(0, 0.5, var_46_11)

					arg_43_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_43_1.var_.characterEffect4010ui_story.fillRatio = var_46_12
				end
			end

			if arg_43_1.time_ >= var_46_9 + var_46_10 and arg_43_1.time_ < var_46_9 + var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect4010ui_story then
				local var_46_13 = 0.5

				arg_43_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_43_1.var_.characterEffect4010ui_story.fillRatio = var_46_13
			end

			local var_46_14 = arg_43_1.actors_["1011ui_story"].transform
			local var_46_15 = 0

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.var_.moveOldPos1011ui_story = var_46_14.localPosition
			end

			local var_46_16 = 0.001

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_16 then
				local var_46_17 = (arg_43_1.time_ - var_46_15) / var_46_16
				local var_46_18 = Vector3.New(0, 100, 0)

				var_46_14.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1011ui_story, var_46_18, var_46_17)

				local var_46_19 = manager.ui.mainCamera.transform.position - var_46_14.position

				var_46_14.forward = Vector3.New(var_46_19.x, var_46_19.y, var_46_19.z)

				local var_46_20 = var_46_14.localEulerAngles

				var_46_20.z = 0
				var_46_20.x = 0
				var_46_14.localEulerAngles = var_46_20
			end

			if arg_43_1.time_ >= var_46_15 + var_46_16 and arg_43_1.time_ < var_46_15 + var_46_16 + arg_46_0 then
				var_46_14.localPosition = Vector3.New(0, 100, 0)

				local var_46_21 = manager.ui.mainCamera.transform.position - var_46_14.position

				var_46_14.forward = Vector3.New(var_46_21.x, var_46_21.y, var_46_21.z)

				local var_46_22 = var_46_14.localEulerAngles

				var_46_22.z = 0
				var_46_22.x = 0
				var_46_14.localEulerAngles = var_46_22
			end

			local var_46_23 = arg_43_1.actors_["1019ui_story"].transform
			local var_46_24 = 0

			if var_46_24 < arg_43_1.time_ and arg_43_1.time_ <= var_46_24 + arg_46_0 then
				arg_43_1.var_.moveOldPos1019ui_story = var_46_23.localPosition
			end

			local var_46_25 = 0.001

			if var_46_24 <= arg_43_1.time_ and arg_43_1.time_ < var_46_24 + var_46_25 then
				local var_46_26 = (arg_43_1.time_ - var_46_24) / var_46_25
				local var_46_27 = Vector3.New(0.7, -1.08, -5.9)

				var_46_23.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1019ui_story, var_46_27, var_46_26)

				local var_46_28 = manager.ui.mainCamera.transform.position - var_46_23.position

				var_46_23.forward = Vector3.New(var_46_28.x, var_46_28.y, var_46_28.z)

				local var_46_29 = var_46_23.localEulerAngles

				var_46_29.z = 0
				var_46_29.x = 0
				var_46_23.localEulerAngles = var_46_29
			end

			if arg_43_1.time_ >= var_46_24 + var_46_25 and arg_43_1.time_ < var_46_24 + var_46_25 + arg_46_0 then
				var_46_23.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_46_30 = manager.ui.mainCamera.transform.position - var_46_23.position

				var_46_23.forward = Vector3.New(var_46_30.x, var_46_30.y, var_46_30.z)

				local var_46_31 = var_46_23.localEulerAngles

				var_46_31.z = 0
				var_46_31.x = 0
				var_46_23.localEulerAngles = var_46_31
			end

			local var_46_32 = 0

			if var_46_32 < arg_43_1.time_ and arg_43_1.time_ <= var_46_32 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_46_33 = 0

			if var_46_33 < arg_43_1.time_ and arg_43_1.time_ <= var_46_33 + arg_46_0 then
				arg_43_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_34 = 0
			local var_46_35 = 0.175

			if var_46_34 < arg_43_1.time_ and arg_43_1.time_ <= var_46_34 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_36 = arg_43_1:FormatText(StoryNameCfg[13].name)

				arg_43_1.leftNameTxt_.text = var_46_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_37 = arg_43_1:GetWordFromCfg(103041011)
				local var_46_38 = arg_43_1:FormatText(var_46_37.content)

				arg_43_1.text_.text = var_46_38

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_39 = 7
				local var_46_40 = utf8.len(var_46_38)
				local var_46_41 = var_46_39 <= 0 and var_46_35 or var_46_35 * (var_46_40 / var_46_39)

				if var_46_41 > 0 and var_46_35 < var_46_41 then
					arg_43_1.talkMaxDuration = var_46_41

					if var_46_41 + var_46_34 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_41 + var_46_34
					end
				end

				arg_43_1.text_.text = var_46_38
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041011", "story_v_out_103041.awb") ~= 0 then
					local var_46_42 = manager.audio:GetVoiceLength("story_v_out_103041", "103041011", "story_v_out_103041.awb") / 1000

					if var_46_42 + var_46_34 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_42 + var_46_34
					end

					if var_46_37.prefab_name ~= "" and arg_43_1.actors_[var_46_37.prefab_name] ~= nil then
						local var_46_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_37.prefab_name].transform, "story_v_out_103041", "103041011", "story_v_out_103041.awb")

						arg_43_1:RecordAudio("103041011", var_46_43)
						arg_43_1:RecordAudio("103041011", var_46_43)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_103041", "103041011", "story_v_out_103041.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_103041", "103041011", "story_v_out_103041.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_44 = math.max(var_46_35, arg_43_1.talkMaxDuration)

			if var_46_34 <= arg_43_1.time_ and arg_43_1.time_ < var_46_34 + var_46_44 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_34) / var_46_44

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_34 + var_46_44 and arg_43_1.time_ < var_46_34 + var_46_44 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play103041012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 103041012
		arg_47_1.duration_ = 4.966

		local var_47_0 = {
			ja = 4.966,
			ko = 3.266,
			zh = 3.6,
			en = 4.5
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
				arg_47_0:Play103041013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["4010ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story == nil then
				arg_47_1.var_.characterEffect4010ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect4010ui_story then
					arg_47_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story then
				arg_47_1.var_.characterEffect4010ui_story.fillFlat = false
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

			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_50_11 = 0
			local var_50_12 = 0.275

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_13 = arg_47_1:FormatText(StoryNameCfg[42].name)

				arg_47_1.leftNameTxt_.text = var_50_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_14 = arg_47_1:GetWordFromCfg(103041012)
				local var_50_15 = arg_47_1:FormatText(var_50_14.content)

				arg_47_1.text_.text = var_50_15

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_16 = 11
				local var_50_17 = utf8.len(var_50_15)
				local var_50_18 = var_50_16 <= 0 and var_50_12 or var_50_12 * (var_50_17 / var_50_16)

				if var_50_18 > 0 and var_50_12 < var_50_18 then
					arg_47_1.talkMaxDuration = var_50_18

					if var_50_18 + var_50_11 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_18 + var_50_11
					end
				end

				arg_47_1.text_.text = var_50_15
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041012", "story_v_out_103041.awb") ~= 0 then
					local var_50_19 = manager.audio:GetVoiceLength("story_v_out_103041", "103041012", "story_v_out_103041.awb") / 1000

					if var_50_19 + var_50_11 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_11
					end

					if var_50_14.prefab_name ~= "" and arg_47_1.actors_[var_50_14.prefab_name] ~= nil then
						local var_50_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_14.prefab_name].transform, "story_v_out_103041", "103041012", "story_v_out_103041.awb")

						arg_47_1:RecordAudio("103041012", var_50_20)
						arg_47_1:RecordAudio("103041012", var_50_20)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_103041", "103041012", "story_v_out_103041.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_103041", "103041012", "story_v_out_103041.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_21 = math.max(var_50_12, arg_47_1.talkMaxDuration)

			if var_50_11 <= arg_47_1.time_ and arg_47_1.time_ < var_50_11 + var_50_21 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_11) / var_50_21

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_11 + var_50_21 and arg_47_1.time_ < var_50_11 + var_50_21 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play103041013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 103041013
		arg_51_1.duration_ = 16.833

		local var_51_0 = {
			ja = 16.566,
			ko = 14.633,
			zh = 15.366,
			en = 16.833
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
				arg_51_0:Play103041014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["4010ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect4010ui_story == nil then
				arg_51_1.var_.characterEffect4010ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect4010ui_story then
					arg_51_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect4010ui_story then
				arg_51_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_54_4 = "1084ui_story"

			if arg_51_1.actors_[var_54_4] == nil then
				local var_54_5 = Object.Instantiate(Asset.Load("Char/" .. var_54_4), arg_51_1.stage_.transform)

				var_54_5.name = var_54_4
				var_54_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.actors_[var_54_4] = var_54_5

				local var_54_6 = var_54_5:GetComponentInChildren(typeof(CharacterEffect))

				var_54_6.enabled = true

				local var_54_7 = GameObjectTools.GetOrAddComponent(var_54_5, typeof(DynamicBoneHelper))

				if var_54_7 then
					var_54_7:EnableDynamicBone(false)
				end

				arg_51_1:ShowWeapon(var_54_6.transform, false)

				arg_51_1.var_[var_54_4 .. "Animator"] = var_54_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_51_1.var_[var_54_4 .. "Animator"].applyRootMotion = true
				arg_51_1.var_[var_54_4 .. "LipSync"] = var_54_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_54_8 = arg_51_1.actors_["1084ui_story"]
			local var_54_9 = 0

			if var_54_9 < arg_51_1.time_ and arg_51_1.time_ <= var_54_9 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story == nil then
				arg_51_1.var_.characterEffect1084ui_story = var_54_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_10 = 0.1

			if var_54_9 <= arg_51_1.time_ and arg_51_1.time_ < var_54_9 + var_54_10 then
				local var_54_11 = (arg_51_1.time_ - var_54_9) / var_54_10

				if arg_51_1.var_.characterEffect1084ui_story then
					local var_54_12 = Mathf.Lerp(0, 0.5, var_54_11)

					arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_12
				end
			end

			if arg_51_1.time_ >= var_54_9 + var_54_10 and arg_51_1.time_ < var_54_9 + var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story then
				local var_54_13 = 0.5

				arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_13
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010actionlink/4010action426")
			end

			local var_54_16 = 0
			local var_54_17 = 1.65

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_18 = arg_51_1:FormatText(StoryNameCfg[42].name)

				arg_51_1.leftNameTxt_.text = var_54_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_19 = arg_51_1:GetWordFromCfg(103041013)
				local var_54_20 = arg_51_1:FormatText(var_54_19.content)

				arg_51_1.text_.text = var_54_20

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_21 = 66
				local var_54_22 = utf8.len(var_54_20)
				local var_54_23 = var_54_21 <= 0 and var_54_17 or var_54_17 * (var_54_22 / var_54_21)

				if var_54_23 > 0 and var_54_17 < var_54_23 then
					arg_51_1.talkMaxDuration = var_54_23

					if var_54_23 + var_54_16 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_16
					end
				end

				arg_51_1.text_.text = var_54_20
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041013", "story_v_out_103041.awb") ~= 0 then
					local var_54_24 = manager.audio:GetVoiceLength("story_v_out_103041", "103041013", "story_v_out_103041.awb") / 1000

					if var_54_24 + var_54_16 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_24 + var_54_16
					end

					if var_54_19.prefab_name ~= "" and arg_51_1.actors_[var_54_19.prefab_name] ~= nil then
						local var_54_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_19.prefab_name].transform, "story_v_out_103041", "103041013", "story_v_out_103041.awb")

						arg_51_1:RecordAudio("103041013", var_54_25)
						arg_51_1:RecordAudio("103041013", var_54_25)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_103041", "103041013", "story_v_out_103041.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_103041", "103041013", "story_v_out_103041.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_26 = math.max(var_54_17, arg_51_1.talkMaxDuration)

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_26 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_16) / var_54_26

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_16 + var_54_26 and arg_51_1.time_ < var_54_16 + var_54_26 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play103041014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 103041014
		arg_55_1.duration_ = 7.1

		local var_55_0 = {
			ja = 7.1,
			ko = 3.666,
			zh = 3.833,
			en = 3.433
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
			arg_55_1.auto_ = false
		end

		function arg_55_1.playNext_(arg_57_0)
			arg_55_1.onStoryFinished_()
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1011ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1011ui_story == nil then
				arg_55_1.var_.characterEffect1011ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1011ui_story then
					arg_55_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1011ui_story then
				arg_55_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["4010ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect4010ui_story == nil then
				arg_55_1.var_.characterEffect4010ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect4010ui_story then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_55_1.var_.characterEffect4010ui_story.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect4010ui_story then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_55_1.var_.characterEffect4010ui_story.fillRatio = var_58_9
			end

			local var_58_10 = arg_55_1.actors_["4010ui_story"].transform
			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1.var_.moveOldPos4010ui_story = var_58_10.localPosition
			end

			local var_58_12 = 0.001

			if var_58_11 <= arg_55_1.time_ and arg_55_1.time_ < var_58_11 + var_58_12 then
				local var_58_13 = (arg_55_1.time_ - var_58_11) / var_58_12
				local var_58_14 = Vector3.New(0, 100, 0)

				var_58_10.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos4010ui_story, var_58_14, var_58_13)

				local var_58_15 = manager.ui.mainCamera.transform.position - var_58_10.position

				var_58_10.forward = Vector3.New(var_58_15.x, var_58_15.y, var_58_15.z)

				local var_58_16 = var_58_10.localEulerAngles

				var_58_16.z = 0
				var_58_16.x = 0
				var_58_10.localEulerAngles = var_58_16
			end

			if arg_55_1.time_ >= var_58_11 + var_58_12 and arg_55_1.time_ < var_58_11 + var_58_12 + arg_58_0 then
				var_58_10.localPosition = Vector3.New(0, 100, 0)

				local var_58_17 = manager.ui.mainCamera.transform.position - var_58_10.position

				var_58_10.forward = Vector3.New(var_58_17.x, var_58_17.y, var_58_17.z)

				local var_58_18 = var_58_10.localEulerAngles

				var_58_18.z = 0
				var_58_18.x = 0
				var_58_10.localEulerAngles = var_58_18
			end

			local var_58_19 = arg_55_1.actors_["1019ui_story"].transform
			local var_58_20 = 0

			if var_58_20 < arg_55_1.time_ and arg_55_1.time_ <= var_58_20 + arg_58_0 then
				arg_55_1.var_.moveOldPos1019ui_story = var_58_19.localPosition
			end

			local var_58_21 = 0.001

			if var_58_20 <= arg_55_1.time_ and arg_55_1.time_ < var_58_20 + var_58_21 then
				local var_58_22 = (arg_55_1.time_ - var_58_20) / var_58_21
				local var_58_23 = Vector3.New(0, 100, 0)

				var_58_19.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1019ui_story, var_58_23, var_58_22)

				local var_58_24 = manager.ui.mainCamera.transform.position - var_58_19.position

				var_58_19.forward = Vector3.New(var_58_24.x, var_58_24.y, var_58_24.z)

				local var_58_25 = var_58_19.localEulerAngles

				var_58_25.z = 0
				var_58_25.x = 0
				var_58_19.localEulerAngles = var_58_25
			end

			if arg_55_1.time_ >= var_58_20 + var_58_21 and arg_55_1.time_ < var_58_20 + var_58_21 + arg_58_0 then
				var_58_19.localPosition = Vector3.New(0, 100, 0)

				local var_58_26 = manager.ui.mainCamera.transform.position - var_58_19.position

				var_58_19.forward = Vector3.New(var_58_26.x, var_58_26.y, var_58_26.z)

				local var_58_27 = var_58_19.localEulerAngles

				var_58_27.z = 0
				var_58_27.x = 0
				var_58_19.localEulerAngles = var_58_27
			end

			local var_58_28 = arg_55_1.actors_["1011ui_story"].transform
			local var_58_29 = 0

			if var_58_29 < arg_55_1.time_ and arg_55_1.time_ <= var_58_29 + arg_58_0 then
				arg_55_1.var_.moveOldPos1011ui_story = var_58_28.localPosition
			end

			local var_58_30 = 0.001

			if var_58_29 <= arg_55_1.time_ and arg_55_1.time_ < var_58_29 + var_58_30 then
				local var_58_31 = (arg_55_1.time_ - var_58_29) / var_58_30
				local var_58_32 = Vector3.New(0, -0.71, -6)

				var_58_28.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1011ui_story, var_58_32, var_58_31)

				local var_58_33 = manager.ui.mainCamera.transform.position - var_58_28.position

				var_58_28.forward = Vector3.New(var_58_33.x, var_58_33.y, var_58_33.z)

				local var_58_34 = var_58_28.localEulerAngles

				var_58_34.z = 0
				var_58_34.x = 0
				var_58_28.localEulerAngles = var_58_34
			end

			if arg_55_1.time_ >= var_58_29 + var_58_30 and arg_55_1.time_ < var_58_29 + var_58_30 + arg_58_0 then
				var_58_28.localPosition = Vector3.New(0, -0.71, -6)

				local var_58_35 = manager.ui.mainCamera.transform.position - var_58_28.position

				var_58_28.forward = Vector3.New(var_58_35.x, var_58_35.y, var_58_35.z)

				local var_58_36 = var_58_28.localEulerAngles

				var_58_36.z = 0
				var_58_36.x = 0
				var_58_28.localEulerAngles = var_58_36
			end

			local var_58_37 = 0

			if var_58_37 < arg_55_1.time_ and arg_55_1.time_ <= var_58_37 + arg_58_0 then
				arg_55_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_58_38 = 0

			if var_58_38 < arg_55_1.time_ and arg_55_1.time_ <= var_58_38 + arg_58_0 then
				arg_55_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_58_39 = 0
			local var_58_40 = 0.425

			if var_58_39 < arg_55_1.time_ and arg_55_1.time_ <= var_58_39 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_41 = arg_55_1:FormatText(StoryNameCfg[37].name)

				arg_55_1.leftNameTxt_.text = var_58_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_42 = arg_55_1:GetWordFromCfg(103041014)
				local var_58_43 = arg_55_1:FormatText(var_58_42.content)

				arg_55_1.text_.text = var_58_43

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_44 = 17
				local var_58_45 = utf8.len(var_58_43)
				local var_58_46 = var_58_44 <= 0 and var_58_40 or var_58_40 * (var_58_45 / var_58_44)

				if var_58_46 > 0 and var_58_40 < var_58_46 then
					arg_55_1.talkMaxDuration = var_58_46

					if var_58_46 + var_58_39 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_46 + var_58_39
					end
				end

				arg_55_1.text_.text = var_58_43
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103041", "103041014", "story_v_out_103041.awb") ~= 0 then
					local var_58_47 = manager.audio:GetVoiceLength("story_v_out_103041", "103041014", "story_v_out_103041.awb") / 1000

					if var_58_47 + var_58_39 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_47 + var_58_39
					end

					if var_58_42.prefab_name ~= "" and arg_55_1.actors_[var_58_42.prefab_name] ~= nil then
						local var_58_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_42.prefab_name].transform, "story_v_out_103041", "103041014", "story_v_out_103041.awb")

						arg_55_1:RecordAudio("103041014", var_58_48)
						arg_55_1:RecordAudio("103041014", var_58_48)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_103041", "103041014", "story_v_out_103041.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_103041", "103041014", "story_v_out_103041.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_49 = math.max(var_58_40, arg_55_1.talkMaxDuration)

			if var_58_39 <= arg_55_1.time_ and arg_55_1.time_ < var_58_39 + var_58_49 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_39) / var_58_49

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_39 + var_58_49 and arg_55_1.time_ < var_58_39 + var_58_49 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B08b"
	},
	voices = {
		"story_v_out_103041.awb"
	}
}
