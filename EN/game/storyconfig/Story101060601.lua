return {
	Play106061001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 106061001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play106061002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "C02b"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = arg_1_1.bgs_.C02b
			local var_4_3 = 0

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				local var_4_4 = var_4_2:GetComponent("SpriteRenderer")

				if var_4_4 then
					var_4_4.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_5 = var_4_4.material
					local var_4_6 = var_4_5:GetColor("_Color")

					arg_1_1.var_.alphaOldValueC02b = var_4_6.a
					arg_1_1.var_.alphaMatValueC02b = var_4_5
				end

				arg_1_1.var_.alphaOldValueC02b = 0
			end

			local var_4_7 = 1.5

			if var_4_3 <= arg_1_1.time_ and arg_1_1.time_ < var_4_3 + var_4_7 then
				local var_4_8 = (arg_1_1.time_ - var_4_3) / var_4_7
				local var_4_9 = Mathf.Lerp(arg_1_1.var_.alphaOldValueC02b, 1, var_4_8)

				if arg_1_1.var_.alphaMatValueC02b then
					local var_4_10 = arg_1_1.var_.alphaMatValueC02b
					local var_4_11 = var_4_10:GetColor("_Color")

					var_4_11.a = var_4_9

					var_4_10:SetColor("_Color", var_4_11)
				end
			end

			if arg_1_1.time_ >= var_4_3 + var_4_7 and arg_1_1.time_ < var_4_3 + var_4_7 + arg_4_0 and arg_1_1.var_.alphaMatValueC02b then
				local var_4_12 = arg_1_1.var_.alphaMatValueC02b
				local var_4_13 = var_4_12:GetColor("_Color")

				var_4_13.a = 1

				var_4_12:SetColor("_Color", var_4_13)
			end

			local var_4_14 = 0

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				local var_4_15 = manager.ui.mainCamera.transform.localPosition
				local var_4_16 = Vector3.New(0, 0, 10) + Vector3.New(var_4_15.x, var_4_15.y, 0)
				local var_4_17 = arg_1_1.bgs_.C02b

				var_4_17.transform.localPosition = var_4_16
				var_4_17.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_18 = var_4_17:GetComponent("SpriteRenderer")

				if var_4_18 and var_4_18.sprite then
					local var_4_19 = (var_4_17.transform.localPosition - var_4_15).z
					local var_4_20 = manager.ui.mainCameraCom_
					local var_4_21 = 2 * var_4_19 * Mathf.Tan(var_4_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_22 = var_4_21 * var_4_20.aspect
					local var_4_23 = var_4_18.sprite.bounds.size.x
					local var_4_24 = var_4_18.sprite.bounds.size.y
					local var_4_25 = var_4_22 / var_4_23
					local var_4_26 = var_4_21 / var_4_24
					local var_4_27 = var_4_26 < var_4_25 and var_4_25 or var_4_26

					var_4_17.transform.localScale = Vector3.New(var_4_27, var_4_27, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "C02b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_28 = 0
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_33 = 1.5

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.2

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

				local var_4_37 = arg_1_1:GetWordFromCfg(106061001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 8
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
	Play106061002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 106061002
		arg_7_1.duration_ = 11.833

		local var_7_0 = {
			ja = 11.833,
			ko = 8.333,
			zh = 8.733,
			en = 9.4
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
				arg_7_0:Play106061003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1093ui_story"

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

			local var_10_4 = arg_7_1.actors_["1093ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1093ui_story == nil then
				arg_7_1.var_.characterEffect1093ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1093ui_story then
					arg_7_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1093ui_story then
				arg_7_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_10_8 = 0

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 then
				arg_7_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_10_9 = arg_7_1.actors_["1093ui_story"].transform
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				arg_7_1.var_.moveOldPos1093ui_story = var_10_9.localPosition

				local var_10_11 = "1093ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_11 .. "Animator"].transform, true)
			end

			local var_10_12 = 0.001

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_10) / var_10_12
				local var_10_14 = Vector3.New(0, -1.11, -5.88)

				var_10_9.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1093ui_story, var_10_14, var_10_13)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_9.position

				var_10_9.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_9.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_9.localEulerAngles = var_10_16
			end

			if arg_7_1.time_ >= var_10_10 + var_10_12 and arg_7_1.time_ < var_10_10 + var_10_12 + arg_10_0 then
				var_10_9.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_9.position

				var_10_9.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_9.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_9.localEulerAngles = var_10_18
			end

			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface9903cva")
			end

			local var_10_20 = 0
			local var_10_21 = 0.925

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_22 = arg_7_1:FormatText(StoryNameCfg[73].name)

				arg_7_1.leftNameTxt_.text = var_10_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_23 = arg_7_1:GetWordFromCfg(106061002)
				local var_10_24 = arg_7_1:FormatText(var_10_23.content)

				arg_7_1.text_.text = var_10_24

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_25 = 37
				local var_10_26 = utf8.len(var_10_24)
				local var_10_27 = var_10_25 <= 0 and var_10_21 or var_10_21 * (var_10_26 / var_10_25)

				if var_10_27 > 0 and var_10_21 < var_10_27 then
					arg_7_1.talkMaxDuration = var_10_27

					if var_10_27 + var_10_20 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_20
					end
				end

				arg_7_1.text_.text = var_10_24
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061002", "story_v_out_106061.awb") ~= 0 then
					local var_10_28 = manager.audio:GetVoiceLength("story_v_out_106061", "106061002", "story_v_out_106061.awb") / 1000

					if var_10_28 + var_10_20 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_28 + var_10_20
					end

					if var_10_23.prefab_name ~= "" and arg_7_1.actors_[var_10_23.prefab_name] ~= nil then
						local var_10_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_23.prefab_name].transform, "story_v_out_106061", "106061002", "story_v_out_106061.awb")

						arg_7_1:RecordAudio("106061002", var_10_29)
						arg_7_1:RecordAudio("106061002", var_10_29)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_106061", "106061002", "story_v_out_106061.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_106061", "106061002", "story_v_out_106061.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_30 = math.max(var_10_21, arg_7_1.talkMaxDuration)

			if var_10_20 <= arg_7_1.time_ and arg_7_1.time_ < var_10_20 + var_10_30 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_20) / var_10_30

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_20 + var_10_30 and arg_7_1.time_ < var_10_20 + var_10_30 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play106061003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 106061003
		arg_11_1.duration_ = 12.6

		local var_11_0 = {
			ja = 12.6,
			ko = 12,
			zh = 8.333,
			en = 9.366
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
				arg_11_0:Play106061004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface9903cva")
			end

			local var_14_1 = 0
			local var_14_2 = 0.85

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_3 = arg_11_1:FormatText(StoryNameCfg[73].name)

				arg_11_1.leftNameTxt_.text = var_14_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_4 = arg_11_1:GetWordFromCfg(106061003)
				local var_14_5 = arg_11_1:FormatText(var_14_4.content)

				arg_11_1.text_.text = var_14_5

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_6 = 34
				local var_14_7 = utf8.len(var_14_5)
				local var_14_8 = var_14_6 <= 0 and var_14_2 or var_14_2 * (var_14_7 / var_14_6)

				if var_14_8 > 0 and var_14_2 < var_14_8 then
					arg_11_1.talkMaxDuration = var_14_8

					if var_14_8 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_1
					end
				end

				arg_11_1.text_.text = var_14_5
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061003", "story_v_out_106061.awb") ~= 0 then
					local var_14_9 = manager.audio:GetVoiceLength("story_v_out_106061", "106061003", "story_v_out_106061.awb") / 1000

					if var_14_9 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_9 + var_14_1
					end

					if var_14_4.prefab_name ~= "" and arg_11_1.actors_[var_14_4.prefab_name] ~= nil then
						local var_14_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_4.prefab_name].transform, "story_v_out_106061", "106061003", "story_v_out_106061.awb")

						arg_11_1:RecordAudio("106061003", var_14_10)
						arg_11_1:RecordAudio("106061003", var_14_10)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_106061", "106061003", "story_v_out_106061.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_106061", "106061003", "story_v_out_106061.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_11 = math.max(var_14_2, arg_11_1.talkMaxDuration)

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_11 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_1) / var_14_11

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_1 + var_14_11 and arg_11_1.time_ < var_14_1 + var_14_11 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play106061004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 106061004
		arg_15_1.duration_ = 8.9

		local var_15_0 = {
			ja = 8.9,
			ko = 5.266,
			zh = 4.6,
			en = 5.266
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
				arg_15_0:Play106061005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action472")
			end

			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_18_2 = 0
			local var_18_3 = 1

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				local var_18_4 = "play"
				local var_18_5 = "effect"

				arg_15_1:AudioAction(var_18_4, var_18_5, "se_story_6", "se_story_6_desheath", "")
			end

			local var_18_6 = 0
			local var_18_7 = 0.475

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[73].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(106061004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 17
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061004", "story_v_out_106061.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_106061", "106061004", "story_v_out_106061.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_106061", "106061004", "story_v_out_106061.awb")

						arg_15_1:RecordAudio("106061004", var_18_15)
						arg_15_1:RecordAudio("106061004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_106061", "106061004", "story_v_out_106061.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_106061", "106061004", "story_v_out_106061.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_16 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_16 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_16

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_16 and arg_15_1.time_ < var_18_6 + var_18_16 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play106061005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 106061005
		arg_19_1.duration_ = 1.633

		local var_19_0 = {
			ja = 0.666,
			ko = 1.633,
			zh = 1.333,
			en = 0.933
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
				arg_19_0:Play106061006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1093ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story == nil then
				arg_19_1.var_.characterEffect1093ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1093ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_5
			end

			local var_22_6 = arg_19_1.actors_["1093ui_story"].transform
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.var_.moveOldPos1093ui_story = var_22_6.localPosition

				local var_22_8 = "1093ui_story"

				arg_19_1:ShowWeapon(arg_19_1.var_[var_22_8 .. "Animator"].transform, true)
			end

			local var_22_9 = 0.001

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_7) / var_22_9
				local var_22_11 = Vector3.New(0, 100, 0)

				var_22_6.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1093ui_story, var_22_11, var_22_10)

				local var_22_12 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_12.x, var_22_12.y, var_22_12.z)

				local var_22_13 = var_22_6.localEulerAngles

				var_22_13.z = 0
				var_22_13.x = 0
				var_22_6.localEulerAngles = var_22_13
			end

			if arg_19_1.time_ >= var_22_7 + var_22_9 and arg_19_1.time_ < var_22_7 + var_22_9 + arg_22_0 then
				var_22_6.localPosition = Vector3.New(0, 100, 0)

				local var_22_14 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_14.x, var_22_14.y, var_22_14.z)

				local var_22_15 = var_22_6.localEulerAngles

				var_22_15.z = 0
				var_22_15.x = 0
				var_22_6.localEulerAngles = var_22_15
			end

			local var_22_16 = manager.ui.mainCamera.transform
			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1.var_.shakeOldPos = var_22_16.localPosition
			end

			local var_22_18 = 0.6

			if var_22_17 <= arg_19_1.time_ and arg_19_1.time_ < var_22_17 + var_22_18 then
				local var_22_19 = (arg_19_1.time_ - var_22_17) / 0.099
				local var_22_20, var_22_21 = math.modf(var_22_19)

				var_22_16.localPosition = Vector3.New(var_22_21 * 0.13, var_22_21 * 0.13, var_22_21 * 0.13) + arg_19_1.var_.shakeOldPos
			end

			if arg_19_1.time_ >= var_22_17 + var_22_18 and arg_19_1.time_ < var_22_17 + var_22_18 + arg_22_0 then
				var_22_16.localPosition = arg_19_1.var_.shakeOldPos
			end

			local var_22_22 = 0
			local var_22_23 = 0.075

			if var_22_22 < arg_19_1.time_ and arg_19_1.time_ <= var_22_22 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_24 = arg_19_1:FormatText(StoryNameCfg[79].name)

				arg_19_1.leftNameTxt_.text = var_22_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2033")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_25 = arg_19_1:GetWordFromCfg(106061005)
				local var_22_26 = arg_19_1:FormatText(var_22_25.content)

				arg_19_1.text_.text = var_22_26

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_27 = 3
				local var_22_28 = utf8.len(var_22_26)
				local var_22_29 = var_22_27 <= 0 and var_22_23 or var_22_23 * (var_22_28 / var_22_27)

				if var_22_29 > 0 and var_22_23 < var_22_29 then
					arg_19_1.talkMaxDuration = var_22_29

					if var_22_29 + var_22_22 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_29 + var_22_22
					end
				end

				arg_19_1.text_.text = var_22_26
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061005", "story_v_out_106061.awb") ~= 0 then
					local var_22_30 = manager.audio:GetVoiceLength("story_v_out_106061", "106061005", "story_v_out_106061.awb") / 1000

					if var_22_30 + var_22_22 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_30 + var_22_22
					end

					if var_22_25.prefab_name ~= "" and arg_19_1.actors_[var_22_25.prefab_name] ~= nil then
						local var_22_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_25.prefab_name].transform, "story_v_out_106061", "106061005", "story_v_out_106061.awb")

						arg_19_1:RecordAudio("106061005", var_22_31)
						arg_19_1:RecordAudio("106061005", var_22_31)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_106061", "106061005", "story_v_out_106061.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_106061", "106061005", "story_v_out_106061.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_32 = math.max(var_22_23, arg_19_1.talkMaxDuration)

			if var_22_22 <= arg_19_1.time_ and arg_19_1.time_ < var_22_22 + var_22_32 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_22) / var_22_32

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_22 + var_22_32 and arg_19_1.time_ < var_22_22 + var_22_32 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play106061006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 106061006
		arg_23_1.duration_ = 7.366

		local var_23_0 = {
			ja = 5.9,
			ko = 3.566,
			zh = 7.366,
			en = 7.1
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
				arg_23_0:Play106061007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1093ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story == nil then
				arg_23_1.var_.characterEffect1093ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1093ui_story then
					arg_23_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story then
				arg_23_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_26_5 = 0
			local var_26_6 = 0.5

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_7 = arg_23_1:FormatText(StoryNameCfg[73].name)

				arg_23_1.leftNameTxt_.text = var_26_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(106061006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 20
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_6 or var_26_6 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_6 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_5 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_5
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061006", "story_v_out_106061.awb") ~= 0 then
					local var_26_13 = manager.audio:GetVoiceLength("story_v_out_106061", "106061006", "story_v_out_106061.awb") / 1000

					if var_26_13 + var_26_5 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_5
					end

					if var_26_8.prefab_name ~= "" and arg_23_1.actors_[var_26_8.prefab_name] ~= nil then
						local var_26_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_8.prefab_name].transform, "story_v_out_106061", "106061006", "story_v_out_106061.awb")

						arg_23_1:RecordAudio("106061006", var_26_14)
						arg_23_1:RecordAudio("106061006", var_26_14)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_106061", "106061006", "story_v_out_106061.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_106061", "106061006", "story_v_out_106061.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_15 = math.max(var_26_6, arg_23_1.talkMaxDuration)

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_15 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_5) / var_26_15

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_5 + var_26_15 and arg_23_1.time_ < var_26_5 + var_26_15 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play106061007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 106061007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play106061008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1093ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1093ui_story == nil then
				arg_27_1.var_.characterEffect1093ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1093ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1093ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1093ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1093ui_story.fillRatio = var_30_5
			end

			local var_30_6 = arg_27_1.actors_["1093ui_story"].transform
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 then
				arg_27_1.var_.moveOldPos1093ui_story = var_30_6.localPosition
			end

			local var_30_8 = 0.001

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8
				local var_30_10 = Vector3.New(0, 100, 0)

				var_30_6.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1093ui_story, var_30_10, var_30_9)

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
			local var_30_16 = 0.85

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

				local var_30_17 = arg_27_1:GetWordFromCfg(106061007)
				local var_30_18 = arg_27_1:FormatText(var_30_17.content)

				arg_27_1.text_.text = var_30_18

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_19 = 34
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
	Play106061008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 106061008
		arg_31_1.duration_ = 2.833

		local var_31_0 = {
			ja = 2.833,
			ko = 2,
			zh = 1.7,
			en = 2.233
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
				arg_31_0:Play106061009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.15

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[79].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2033")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(106061008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 6
				local var_34_6 = utf8.len(var_34_4)
				local var_34_7 = var_34_5 <= 0 and var_34_1 or var_34_1 * (var_34_6 / var_34_5)

				if var_34_7 > 0 and var_34_1 < var_34_7 then
					arg_31_1.talkMaxDuration = var_34_7

					if var_34_7 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_7 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_4
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061008", "story_v_out_106061.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_106061", "106061008", "story_v_out_106061.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_106061", "106061008", "story_v_out_106061.awb")

						arg_31_1:RecordAudio("106061008", var_34_9)
						arg_31_1:RecordAudio("106061008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_106061", "106061008", "story_v_out_106061.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_106061", "106061008", "story_v_out_106061.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play106061009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 106061009
		arg_35_1.duration_ = 4.533

		local var_35_0 = {
			ja = 3.5,
			ko = 3.633,
			zh = 4.533,
			en = 3.366
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
				arg_35_0:Play106061010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1093ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story == nil then
				arg_35_1.var_.characterEffect1093ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1093ui_story then
					arg_35_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story then
				arg_35_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_5 = 0
			local var_38_6 = 0.425

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_7 = arg_35_1:FormatText(StoryNameCfg[73].name)

				arg_35_1.leftNameTxt_.text = var_38_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_8 = arg_35_1:GetWordFromCfg(106061009)
				local var_38_9 = arg_35_1:FormatText(var_38_8.content)

				arg_35_1.text_.text = var_38_9

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_10 = 18
				local var_38_11 = utf8.len(var_38_9)
				local var_38_12 = var_38_10 <= 0 and var_38_6 or var_38_6 * (var_38_11 / var_38_10)

				if var_38_12 > 0 and var_38_6 < var_38_12 then
					arg_35_1.talkMaxDuration = var_38_12

					if var_38_12 + var_38_5 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_5
					end
				end

				arg_35_1.text_.text = var_38_9
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061009", "story_v_out_106061.awb") ~= 0 then
					local var_38_13 = manager.audio:GetVoiceLength("story_v_out_106061", "106061009", "story_v_out_106061.awb") / 1000

					if var_38_13 + var_38_5 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_5
					end

					if var_38_8.prefab_name ~= "" and arg_35_1.actors_[var_38_8.prefab_name] ~= nil then
						local var_38_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_8.prefab_name].transform, "story_v_out_106061", "106061009", "story_v_out_106061.awb")

						arg_35_1:RecordAudio("106061009", var_38_14)
						arg_35_1:RecordAudio("106061009", var_38_14)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_106061", "106061009", "story_v_out_106061.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_106061", "106061009", "story_v_out_106061.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_15 = math.max(var_38_6, arg_35_1.talkMaxDuration)

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_15 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_5) / var_38_15

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_5 + var_38_15 and arg_35_1.time_ < var_38_5 + var_38_15 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play106061010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 106061010
		arg_39_1.duration_ = 4.5

		local var_39_0 = {
			ja = 2.433,
			ko = 2.166,
			zh = 2.166,
			en = 4.5
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
				arg_39_0:Play106061011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1093ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1093ui_story == nil then
				arg_39_1.var_.characterEffect1093ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1093ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1093ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1093ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1093ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.075

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[79].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2033")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(106061010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 3
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061010", "story_v_out_106061.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_106061", "106061010", "story_v_out_106061.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_106061", "106061010", "story_v_out_106061.awb")

						arg_39_1:RecordAudio("106061010", var_42_15)
						arg_39_1:RecordAudio("106061010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_106061", "106061010", "story_v_out_106061.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_106061", "106061010", "story_v_out_106061.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_16 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_16 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_16

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_16 and arg_39_1.time_ < var_42_6 + var_42_16 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play106061011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 106061011
		arg_43_1.duration_ = 3.033

		local var_43_0 = {
			ja = 2.833,
			ko = 2.166,
			zh = 3.033,
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
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play106061012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1093ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1093ui_story == nil then
				arg_43_1.var_.characterEffect1093ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1093ui_story then
					arg_43_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1093ui_story then
				arg_43_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_46_4 = 0

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_46_5 = 0
			local var_46_6 = 0.275

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_7 = arg_43_1:FormatText(StoryNameCfg[73].name)

				arg_43_1.leftNameTxt_.text = var_46_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_8 = arg_43_1:GetWordFromCfg(106061011)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 11
				local var_46_11 = utf8.len(var_46_9)
				local var_46_12 = var_46_10 <= 0 and var_46_6 or var_46_6 * (var_46_11 / var_46_10)

				if var_46_12 > 0 and var_46_6 < var_46_12 then
					arg_43_1.talkMaxDuration = var_46_12

					if var_46_12 + var_46_5 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_5
					end
				end

				arg_43_1.text_.text = var_46_9
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061011", "story_v_out_106061.awb") ~= 0 then
					local var_46_13 = manager.audio:GetVoiceLength("story_v_out_106061", "106061011", "story_v_out_106061.awb") / 1000

					if var_46_13 + var_46_5 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_5
					end

					if var_46_8.prefab_name ~= "" and arg_43_1.actors_[var_46_8.prefab_name] ~= nil then
						local var_46_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_8.prefab_name].transform, "story_v_out_106061", "106061011", "story_v_out_106061.awb")

						arg_43_1:RecordAudio("106061011", var_46_14)
						arg_43_1:RecordAudio("106061011", var_46_14)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_106061", "106061011", "story_v_out_106061.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_106061", "106061011", "story_v_out_106061.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_15 = math.max(var_46_6, arg_43_1.talkMaxDuration)

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_15 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_5) / var_46_15

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_5 + var_46_15 and arg_43_1.time_ < var_46_5 + var_46_15 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play106061012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 106061012
		arg_47_1.duration_ = 2.9

		local var_47_0 = {
			ja = 2.8,
			ko = 2.633,
			zh = 2.7,
			en = 2.9
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
				arg_47_0:Play106061013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1093ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1093ui_story == nil then
				arg_47_1.var_.characterEffect1093ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1093ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1093ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1093ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1093ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 0.125

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[79].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2033")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(106061012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 5
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061012", "story_v_out_106061.awb") ~= 0 then
					local var_50_14 = manager.audio:GetVoiceLength("story_v_out_106061", "106061012", "story_v_out_106061.awb") / 1000

					if var_50_14 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_14 + var_50_6
					end

					if var_50_9.prefab_name ~= "" and arg_47_1.actors_[var_50_9.prefab_name] ~= nil then
						local var_50_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_9.prefab_name].transform, "story_v_out_106061", "106061012", "story_v_out_106061.awb")

						arg_47_1:RecordAudio("106061012", var_50_15)
						arg_47_1:RecordAudio("106061012", var_50_15)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_106061", "106061012", "story_v_out_106061.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_106061", "106061012", "story_v_out_106061.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_16 and arg_47_1.time_ < var_50_6 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play106061013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 106061013
		arg_51_1.duration_ = 1.166

		local var_51_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 1.166,
			en = 1.033
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
				arg_51_0:Play106061014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_54_1 = 0
			local var_54_2 = 0.05

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_3 = arg_51_1:FormatText(StoryNameCfg[73].name)

				arg_51_1.leftNameTxt_.text = var_54_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_4 = arg_51_1:GetWordFromCfg(106061013)
				local var_54_5 = arg_51_1:FormatText(var_54_4.content)

				arg_51_1.text_.text = var_54_5

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_6 = 2
				local var_54_7 = utf8.len(var_54_5)
				local var_54_8 = var_54_6 <= 0 and var_54_2 or var_54_2 * (var_54_7 / var_54_6)

				if var_54_8 > 0 and var_54_2 < var_54_8 then
					arg_51_1.talkMaxDuration = var_54_8

					if var_54_8 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_1
					end
				end

				arg_51_1.text_.text = var_54_5
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061013", "story_v_out_106061.awb") ~= 0 then
					local var_54_9 = manager.audio:GetVoiceLength("story_v_out_106061", "106061013", "story_v_out_106061.awb") / 1000

					if var_54_9 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_9 + var_54_1
					end

					if var_54_4.prefab_name ~= "" and arg_51_1.actors_[var_54_4.prefab_name] ~= nil then
						local var_54_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_4.prefab_name].transform, "story_v_out_106061", "106061013", "story_v_out_106061.awb")

						arg_51_1:RecordAudio("106061013", var_54_10)
						arg_51_1:RecordAudio("106061013", var_54_10)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_106061", "106061013", "story_v_out_106061.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_106061", "106061013", "story_v_out_106061.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_11 = math.max(var_54_2, arg_51_1.talkMaxDuration)

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_11 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_1) / var_54_11

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_1 + var_54_11 and arg_51_1.time_ < var_54_1 + var_54_11 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play106061014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 106061014
		arg_55_1.duration_ = 4.6

		local var_55_0 = {
			ja = 1.766,
			ko = 2.4,
			zh = 2.9,
			en = 4.6
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
				arg_55_0:Play106061015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_2 = "play"
				local var_58_3 = "effect"

				arg_55_1:AudioAction(var_58_2, var_58_3, "se_story_6", "se_story_6_puncture02", "")
			end

			local var_58_4 = 0
			local var_58_5 = 0.2

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_6 = arg_55_1:FormatText(StoryNameCfg[79].name)

				arg_55_1.leftNameTxt_.text = var_58_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2033")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_7 = arg_55_1:GetWordFromCfg(106061014)
				local var_58_8 = arg_55_1:FormatText(var_58_7.content)

				arg_55_1.text_.text = var_58_8

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_9 = 8
				local var_58_10 = utf8.len(var_58_8)
				local var_58_11 = var_58_9 <= 0 and var_58_5 or var_58_5 * (var_58_10 / var_58_9)

				if var_58_11 > 0 and var_58_5 < var_58_11 then
					arg_55_1.talkMaxDuration = var_58_11

					if var_58_11 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_11 + var_58_4
					end
				end

				arg_55_1.text_.text = var_58_8
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061014", "story_v_out_106061.awb") ~= 0 then
					local var_58_12 = manager.audio:GetVoiceLength("story_v_out_106061", "106061014", "story_v_out_106061.awb") / 1000

					if var_58_12 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_4
					end

					if var_58_7.prefab_name ~= "" and arg_55_1.actors_[var_58_7.prefab_name] ~= nil then
						local var_58_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_7.prefab_name].transform, "story_v_out_106061", "106061014", "story_v_out_106061.awb")

						arg_55_1:RecordAudio("106061014", var_58_13)
						arg_55_1:RecordAudio("106061014", var_58_13)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_106061", "106061014", "story_v_out_106061.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_106061", "106061014", "story_v_out_106061.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_14 = math.max(var_58_5, arg_55_1.talkMaxDuration)

			if var_58_4 <= arg_55_1.time_ and arg_55_1.time_ < var_58_4 + var_58_14 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_4) / var_58_14

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_4 + var_58_14 and arg_55_1.time_ < var_58_4 + var_58_14 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play106061015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 106061015
		arg_59_1.duration_ = 2.3

		local var_59_0 = {
			ja = 2.033,
			ko = 1.2,
			zh = 2.3,
			en = 1.966
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
				arg_59_0:Play106061016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1093ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1093ui_story == nil then
				arg_59_1.var_.characterEffect1093ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1093ui_story then
					arg_59_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1093ui_story then
				arg_59_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_62_4 = 0.1

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_5 = 0.5

			if var_62_4 <= arg_59_1.time_ and arg_59_1.time_ < var_62_4 + var_62_5 then
				local var_62_6 = (arg_59_1.time_ - var_62_4) / var_62_5
				local var_62_7 = Color.New(1, 1, 1)

				var_62_7.a = Mathf.Lerp(1, 0, var_62_6)
				arg_59_1.mask_.color = var_62_7
			end

			if arg_59_1.time_ >= var_62_4 + var_62_5 and arg_59_1.time_ < var_62_4 + var_62_5 + arg_62_0 then
				local var_62_8 = Color.New(1, 1, 1)
				local var_62_9 = 0

				arg_59_1.mask_.enabled = false
				var_62_8.a = var_62_9
				arg_59_1.mask_.color = var_62_8
			end

			local var_62_10 = manager.ui.mainCamera.transform
			local var_62_11 = 0.1

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1.var_.shakeOldPos = var_62_10.localPosition
			end

			local var_62_12 = 0.6

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				local var_62_13 = (arg_59_1.time_ - var_62_11) / 0.099
				local var_62_14, var_62_15 = math.modf(var_62_13)

				var_62_10.localPosition = Vector3.New(var_62_15 * 0.13, var_62_15 * 0.13, var_62_15 * 0.13) + arg_59_1.var_.shakeOldPos
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 then
				var_62_10.localPosition = arg_59_1.var_.shakeOldPos
			end

			local var_62_16 = 0
			local var_62_17 = 0.1

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_18 = arg_59_1:FormatText(StoryNameCfg[73].name)

				arg_59_1.leftNameTxt_.text = var_62_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_19 = arg_59_1:GetWordFromCfg(106061015)
				local var_62_20 = arg_59_1:FormatText(var_62_19.content)

				arg_59_1.text_.text = var_62_20

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_21 = 4
				local var_62_22 = utf8.len(var_62_20)
				local var_62_23 = var_62_21 <= 0 and var_62_17 or var_62_17 * (var_62_22 / var_62_21)

				if var_62_23 > 0 and var_62_17 < var_62_23 then
					arg_59_1.talkMaxDuration = var_62_23

					if var_62_23 + var_62_16 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_23 + var_62_16
					end
				end

				arg_59_1.text_.text = var_62_20
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061015", "story_v_out_106061.awb") ~= 0 then
					local var_62_24 = manager.audio:GetVoiceLength("story_v_out_106061", "106061015", "story_v_out_106061.awb") / 1000

					if var_62_24 + var_62_16 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_24 + var_62_16
					end

					if var_62_19.prefab_name ~= "" and arg_59_1.actors_[var_62_19.prefab_name] ~= nil then
						local var_62_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_19.prefab_name].transform, "story_v_out_106061", "106061015", "story_v_out_106061.awb")

						arg_59_1:RecordAudio("106061015", var_62_25)
						arg_59_1:RecordAudio("106061015", var_62_25)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_106061", "106061015", "story_v_out_106061.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_106061", "106061015", "story_v_out_106061.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_26 = math.max(var_62_17, arg_59_1.talkMaxDuration)

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_26 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_16) / var_62_26

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_16 + var_62_26 and arg_59_1.time_ < var_62_16 + var_62_26 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play106061016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 106061016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play106061017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1093ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1093ui_story == nil then
				arg_63_1.var_.characterEffect1093ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1093ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1093ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1093ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1093ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_7 = 0.5

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_7 then
				local var_66_8 = (arg_63_1.time_ - var_66_6) / var_66_7
				local var_66_9 = Color.New(1, 1, 1)

				var_66_9.a = Mathf.Lerp(1, 0, var_66_8)
				arg_63_1.mask_.color = var_66_9
			end

			if arg_63_1.time_ >= var_66_6 + var_66_7 and arg_63_1.time_ < var_66_6 + var_66_7 + arg_66_0 then
				local var_66_10 = Color.New(1, 1, 1)
				local var_66_11 = 0

				arg_63_1.mask_.enabled = false
				var_66_10.a = var_66_11
				arg_63_1.mask_.color = var_66_10
			end

			local var_66_12 = manager.ui.mainCamera.transform
			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1.var_.shakeOldPosMainCamera = var_66_12.localPosition
			end

			local var_66_14 = 0.600000023841858

			if var_66_13 <= arg_63_1.time_ and arg_63_1.time_ < var_66_13 + var_66_14 then
				local var_66_15 = (arg_63_1.time_ - var_66_13) / 0.066
				local var_66_16, var_66_17 = math.modf(var_66_15)

				var_66_12.localPosition = Vector3.New(var_66_17 * 0.13, var_66_17 * 0.13, var_66_17 * 0.13) + arg_63_1.var_.shakeOldPosMainCamera
			end

			if arg_63_1.time_ >= var_66_13 + var_66_14 and arg_63_1.time_ < var_66_13 + var_66_14 + arg_66_0 then
				var_66_12.localPosition = arg_63_1.var_.shakeOldPosMainCamera
			end

			local var_66_18 = 0
			local var_66_19 = 0.875

			if var_66_18 < arg_63_1.time_ and arg_63_1.time_ <= var_66_18 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_20 = arg_63_1:GetWordFromCfg(106061016)
				local var_66_21 = arg_63_1:FormatText(var_66_20.content)

				arg_63_1.text_.text = var_66_21

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_22 = 35
				local var_66_23 = utf8.len(var_66_21)
				local var_66_24 = var_66_22 <= 0 and var_66_19 or var_66_19 * (var_66_23 / var_66_22)

				if var_66_24 > 0 and var_66_19 < var_66_24 then
					arg_63_1.talkMaxDuration = var_66_24

					if var_66_24 + var_66_18 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_24 + var_66_18
					end
				end

				arg_63_1.text_.text = var_66_21
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_25 = math.max(var_66_19, arg_63_1.talkMaxDuration)

			if var_66_18 <= arg_63_1.time_ and arg_63_1.time_ < var_66_18 + var_66_25 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_18) / var_66_25

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_18 + var_66_25 and arg_63_1.time_ < var_66_18 + var_66_25 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play106061017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 106061017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play106061018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.7

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_2 = arg_67_1:GetWordFromCfg(106061017)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 28
				local var_70_5 = utf8.len(var_70_3)
				local var_70_6 = var_70_4 <= 0 and var_70_1 or var_70_1 * (var_70_5 / var_70_4)

				if var_70_6 > 0 and var_70_1 < var_70_6 then
					arg_67_1.talkMaxDuration = var_70_6

					if var_70_6 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_6 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_3
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_7 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_7 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_7

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_7 and arg_67_1.time_ < var_70_0 + var_70_7 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play106061018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 106061018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play106061019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.775

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

				local var_74_2 = arg_71_1:GetWordFromCfg(106061018)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 31
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
	Play106061019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 106061019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play106061020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.825

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(106061019)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 33
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play106061020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 106061020
		arg_79_1.duration_ = 3.566

		local var_79_0 = {
			ja = 3.2,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 3.566
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
				arg_79_0:Play106061021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1093ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story == nil then
				arg_79_1.var_.characterEffect1093ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1093ui_story then
					arg_79_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story then
				arg_79_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["1093ui_story"].transform
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.var_.moveOldPos1093ui_story = var_82_4.localPosition

				local var_82_6 = "1093ui_story"

				arg_79_1:ShowWeapon(arg_79_1.var_[var_82_6 .. "Animator"].transform, true)
			end

			local var_82_7 = 0.001

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_7 then
				local var_82_8 = (arg_79_1.time_ - var_82_5) / var_82_7
				local var_82_9 = Vector3.New(0, -1.11, -5.88)

				var_82_4.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1093ui_story, var_82_9, var_82_8)

				local var_82_10 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_10.x, var_82_10.y, var_82_10.z)

				local var_82_11 = var_82_4.localEulerAngles

				var_82_11.z = 0
				var_82_11.x = 0
				var_82_4.localEulerAngles = var_82_11
			end

			if arg_79_1.time_ >= var_82_5 + var_82_7 and arg_79_1.time_ < var_82_5 + var_82_7 + arg_82_0 then
				var_82_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_82_12 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_12.x, var_82_12.y, var_82_12.z)

				local var_82_13 = var_82_4.localEulerAngles

				var_82_13.z = 0
				var_82_13.x = 0
				var_82_4.localEulerAngles = var_82_13
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action10_2")
			end

			local var_82_15 = 0

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_82_16 = 0
			local var_82_17 = 0.15

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_18 = arg_79_1:FormatText(StoryNameCfg[73].name)

				arg_79_1.leftNameTxt_.text = var_82_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_19 = arg_79_1:GetWordFromCfg(106061020)
				local var_82_20 = arg_79_1:FormatText(var_82_19.content)

				arg_79_1.text_.text = var_82_20

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_21 = 6
				local var_82_22 = utf8.len(var_82_20)
				local var_82_23 = var_82_21 <= 0 and var_82_17 or var_82_17 * (var_82_22 / var_82_21)

				if var_82_23 > 0 and var_82_17 < var_82_23 then
					arg_79_1.talkMaxDuration = var_82_23

					if var_82_23 + var_82_16 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_16
					end
				end

				arg_79_1.text_.text = var_82_20
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061020", "story_v_out_106061.awb") ~= 0 then
					local var_82_24 = manager.audio:GetVoiceLength("story_v_out_106061", "106061020", "story_v_out_106061.awb") / 1000

					if var_82_24 + var_82_16 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_24 + var_82_16
					end

					if var_82_19.prefab_name ~= "" and arg_79_1.actors_[var_82_19.prefab_name] ~= nil then
						local var_82_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_19.prefab_name].transform, "story_v_out_106061", "106061020", "story_v_out_106061.awb")

						arg_79_1:RecordAudio("106061020", var_82_25)
						arg_79_1:RecordAudio("106061020", var_82_25)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_106061", "106061020", "story_v_out_106061.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_106061", "106061020", "story_v_out_106061.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_26 = math.max(var_82_17, arg_79_1.talkMaxDuration)

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_26 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_16) / var_82_26

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_16 + var_82_26 and arg_79_1.time_ < var_82_16 + var_82_26 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play106061021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 106061021
		arg_83_1.duration_ = 8.033

		local var_83_0 = {
			ja = 5.6,
			ko = 8.033,
			zh = 6.6,
			en = 5.933
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
				arg_83_0:Play106061022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = "2033_tpose"

			if arg_83_1.actors_[var_86_0] == nil then
				local var_86_1 = Object.Instantiate(Asset.Load("Char/" .. var_86_0), arg_83_1.stage_.transform)

				var_86_1.name = var_86_0
				var_86_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.actors_[var_86_0] = var_86_1

				local var_86_2 = var_86_1:GetComponentInChildren(typeof(CharacterEffect))

				var_86_2.enabled = true

				local var_86_3 = GameObjectTools.GetOrAddComponent(var_86_1, typeof(DynamicBoneHelper))

				if var_86_3 then
					var_86_3:EnableDynamicBone(false)
				end

				arg_83_1:ShowWeapon(var_86_2.transform, false)

				arg_83_1.var_[var_86_0 .. "Animator"] = var_86_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_83_1.var_[var_86_0 .. "Animator"].applyRootMotion = true
				arg_83_1.var_[var_86_0 .. "LipSync"] = var_86_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_86_4 = arg_83_1.actors_["2033_tpose"]
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 and arg_83_1.var_.characterEffect2033_tpose == nil then
				arg_83_1.var_.characterEffect2033_tpose = var_86_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_6 = 0.1

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6

				if arg_83_1.var_.characterEffect2033_tpose then
					arg_83_1.var_.characterEffect2033_tpose.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 and arg_83_1.var_.characterEffect2033_tpose then
				arg_83_1.var_.characterEffect2033_tpose.fillFlat = false
			end

			local var_86_8 = arg_83_1.actors_["1093ui_story"]
			local var_86_9 = 0

			if var_86_9 < arg_83_1.time_ and arg_83_1.time_ <= var_86_9 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story == nil then
				arg_83_1.var_.characterEffect1093ui_story = var_86_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_10 = 0.1

			if var_86_9 <= arg_83_1.time_ and arg_83_1.time_ < var_86_9 + var_86_10 then
				local var_86_11 = (arg_83_1.time_ - var_86_9) / var_86_10

				if arg_83_1.var_.characterEffect1093ui_story then
					local var_86_12 = Mathf.Lerp(0, 0.5, var_86_11)

					arg_83_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1093ui_story.fillRatio = var_86_12
				end
			end

			if arg_83_1.time_ >= var_86_9 + var_86_10 and arg_83_1.time_ < var_86_9 + var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story then
				local var_86_13 = 0.5

				arg_83_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1093ui_story.fillRatio = var_86_13
			end

			local var_86_14 = arg_83_1.actors_["1093ui_story"].transform
			local var_86_15 = 0

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.var_.moveOldPos1093ui_story = var_86_14.localPosition

				local var_86_16 = "1093ui_story"

				arg_83_1:ShowWeapon(arg_83_1.var_[var_86_16 .. "Animator"].transform, true)
			end

			local var_86_17 = 0.001

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_15) / var_86_17
				local var_86_19 = Vector3.New(0, 100, 0)

				var_86_14.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1093ui_story, var_86_19, var_86_18)

				local var_86_20 = manager.ui.mainCamera.transform.position - var_86_14.position

				var_86_14.forward = Vector3.New(var_86_20.x, var_86_20.y, var_86_20.z)

				local var_86_21 = var_86_14.localEulerAngles

				var_86_21.z = 0
				var_86_21.x = 0
				var_86_14.localEulerAngles = var_86_21
			end

			if arg_83_1.time_ >= var_86_15 + var_86_17 and arg_83_1.time_ < var_86_15 + var_86_17 + arg_86_0 then
				var_86_14.localPosition = Vector3.New(0, 100, 0)

				local var_86_22 = manager.ui.mainCamera.transform.position - var_86_14.position

				var_86_14.forward = Vector3.New(var_86_22.x, var_86_22.y, var_86_22.z)

				local var_86_23 = var_86_14.localEulerAngles

				var_86_23.z = 0
				var_86_23.x = 0
				var_86_14.localEulerAngles = var_86_23
			end

			local var_86_24 = arg_83_1.actors_["2033_tpose"].transform
			local var_86_25 = 0

			if var_86_25 < arg_83_1.time_ and arg_83_1.time_ <= var_86_25 + arg_86_0 then
				arg_83_1.var_.moveOldPos2033_tpose = var_86_24.localPosition
			end

			local var_86_26 = 0.001

			if var_86_25 <= arg_83_1.time_ and arg_83_1.time_ < var_86_25 + var_86_26 then
				local var_86_27 = (arg_83_1.time_ - var_86_25) / var_86_26
				local var_86_28 = Vector3.New(0, -1.37, -4.9)

				var_86_24.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos2033_tpose, var_86_28, var_86_27)

				local var_86_29 = manager.ui.mainCamera.transform.position - var_86_24.position

				var_86_24.forward = Vector3.New(var_86_29.x, var_86_29.y, var_86_29.z)

				local var_86_30 = var_86_24.localEulerAngles

				var_86_30.z = 0
				var_86_30.x = 0
				var_86_24.localEulerAngles = var_86_30
			end

			if arg_83_1.time_ >= var_86_25 + var_86_26 and arg_83_1.time_ < var_86_25 + var_86_26 + arg_86_0 then
				var_86_24.localPosition = Vector3.New(0, -1.37, -4.9)

				local var_86_31 = manager.ui.mainCamera.transform.position - var_86_24.position

				var_86_24.forward = Vector3.New(var_86_31.x, var_86_31.y, var_86_31.z)

				local var_86_32 = var_86_24.localEulerAngles

				var_86_32.z = 0
				var_86_32.x = 0
				var_86_24.localEulerAngles = var_86_32
			end

			local var_86_33 = 0

			if var_86_33 < arg_83_1.time_ and arg_83_1.time_ <= var_86_33 + arg_86_0 then
				arg_83_1:PlayTimeline("2033_tpose", "StoryTimeline/CharAction/story2033/story2033action/2033action1_1")
			end

			local var_86_34 = 0
			local var_86_35 = 0.35

			if var_86_34 < arg_83_1.time_ and arg_83_1.time_ <= var_86_34 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_36 = arg_83_1:FormatText(StoryNameCfg[79].name)

				arg_83_1.leftNameTxt_.text = var_86_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_37 = arg_83_1:GetWordFromCfg(106061021)
				local var_86_38 = arg_83_1:FormatText(var_86_37.content)

				arg_83_1.text_.text = var_86_38

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_39 = 14
				local var_86_40 = utf8.len(var_86_38)
				local var_86_41 = var_86_39 <= 0 and var_86_35 or var_86_35 * (var_86_40 / var_86_39)

				if var_86_41 > 0 and var_86_35 < var_86_41 then
					arg_83_1.talkMaxDuration = var_86_41

					if var_86_41 + var_86_34 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_41 + var_86_34
					end
				end

				arg_83_1.text_.text = var_86_38
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061021", "story_v_out_106061.awb") ~= 0 then
					local var_86_42 = manager.audio:GetVoiceLength("story_v_out_106061", "106061021", "story_v_out_106061.awb") / 1000

					if var_86_42 + var_86_34 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_42 + var_86_34
					end

					if var_86_37.prefab_name ~= "" and arg_83_1.actors_[var_86_37.prefab_name] ~= nil then
						local var_86_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_37.prefab_name].transform, "story_v_out_106061", "106061021", "story_v_out_106061.awb")

						arg_83_1:RecordAudio("106061021", var_86_43)
						arg_83_1:RecordAudio("106061021", var_86_43)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_106061", "106061021", "story_v_out_106061.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_106061", "106061021", "story_v_out_106061.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_44 = math.max(var_86_35, arg_83_1.talkMaxDuration)

			if var_86_34 <= arg_83_1.time_ and arg_83_1.time_ < var_86_34 + var_86_44 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_34) / var_86_44

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_34 + var_86_44 and arg_83_1.time_ < var_86_34 + var_86_44 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play106061022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 106061022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play106061023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["2033_tpose"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect2033_tpose == nil then
				arg_87_1.var_.characterEffect2033_tpose = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect2033_tpose then
					arg_87_1.var_.characterEffect2033_tpose.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect2033_tpose then
				arg_87_1.var_.characterEffect2033_tpose.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["1093ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect1093ui_story == nil then
				arg_87_1.var_.characterEffect1093ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.1

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect1093ui_story then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1093ui_story.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect1093ui_story then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1093ui_story.fillRatio = var_90_9
			end

			local var_90_10 = 0
			local var_90_11 = 1

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				local var_90_12 = "play"
				local var_90_13 = "effect"

				arg_87_1:AudioAction(var_90_12, var_90_13, "se_story_6", "se_story_6_draw_out02", "")
			end

			local var_90_14 = 0
			local var_90_15 = 1.2

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_16 = arg_87_1:GetWordFromCfg(106061022)
				local var_90_17 = arg_87_1:FormatText(var_90_16.content)

				arg_87_1.text_.text = var_90_17

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_18 = 48
				local var_90_19 = utf8.len(var_90_17)
				local var_90_20 = var_90_18 <= 0 and var_90_15 or var_90_15 * (var_90_19 / var_90_18)

				if var_90_20 > 0 and var_90_15 < var_90_20 then
					arg_87_1.talkMaxDuration = var_90_20

					if var_90_20 + var_90_14 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_20 + var_90_14
					end
				end

				arg_87_1.text_.text = var_90_17
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_21 = math.max(var_90_15, arg_87_1.talkMaxDuration)

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_21 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_14) / var_90_21

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_14 + var_90_21 and arg_87_1.time_ < var_90_14 + var_90_21 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play106061023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 106061023
		arg_91_1.duration_ = 5.333

		local var_91_0 = {
			ja = 5.333,
			ko = 1.999999999999,
			zh = 3.266,
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
				arg_91_0:Play106061024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1093ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1093ui_story == nil then
				arg_91_1.var_.characterEffect1093ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.1

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1093ui_story then
					arg_91_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1093ui_story then
				arg_91_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["2033_tpose"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect2033_tpose == nil then
				arg_91_1.var_.characterEffect2033_tpose = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.1

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect2033_tpose then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect2033_tpose.fillFlat = true
					arg_91_1.var_.characterEffect2033_tpose.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect2033_tpose then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect2033_tpose.fillFlat = true
				arg_91_1.var_.characterEffect2033_tpose.fillRatio = var_94_9
			end

			local var_94_10 = arg_91_1.actors_["2033_tpose"].transform
			local var_94_11 = 0

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.var_.moveOldPos2033_tpose = var_94_10.localPosition

				local var_94_12 = "2033_tpose"

				arg_91_1:ShowWeapon(arg_91_1.var_[var_94_12 .. "Animator"].transform, true)
			end

			local var_94_13 = 0.001

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_13 then
				local var_94_14 = (arg_91_1.time_ - var_94_11) / var_94_13
				local var_94_15 = Vector3.New(0, 100, 0)

				var_94_10.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos2033_tpose, var_94_15, var_94_14)

				local var_94_16 = manager.ui.mainCamera.transform.position - var_94_10.position

				var_94_10.forward = Vector3.New(var_94_16.x, var_94_16.y, var_94_16.z)

				local var_94_17 = var_94_10.localEulerAngles

				var_94_17.z = 0
				var_94_17.x = 0
				var_94_10.localEulerAngles = var_94_17
			end

			if arg_91_1.time_ >= var_94_11 + var_94_13 and arg_91_1.time_ < var_94_11 + var_94_13 + arg_94_0 then
				var_94_10.localPosition = Vector3.New(0, 100, 0)

				local var_94_18 = manager.ui.mainCamera.transform.position - var_94_10.position

				var_94_10.forward = Vector3.New(var_94_18.x, var_94_18.y, var_94_18.z)

				local var_94_19 = var_94_10.localEulerAngles

				var_94_19.z = 0
				var_94_19.x = 0
				var_94_10.localEulerAngles = var_94_19
			end

			local var_94_20 = arg_91_1.actors_["1093ui_story"].transform
			local var_94_21 = 0

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 then
				arg_91_1.var_.moveOldPos1093ui_story = var_94_20.localPosition
			end

			local var_94_22 = 0.001

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_22 then
				local var_94_23 = (arg_91_1.time_ - var_94_21) / var_94_22
				local var_94_24 = Vector3.New(0, -1.11, -5.88)

				var_94_20.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1093ui_story, var_94_24, var_94_23)

				local var_94_25 = manager.ui.mainCamera.transform.position - var_94_20.position

				var_94_20.forward = Vector3.New(var_94_25.x, var_94_25.y, var_94_25.z)

				local var_94_26 = var_94_20.localEulerAngles

				var_94_26.z = 0
				var_94_26.x = 0
				var_94_20.localEulerAngles = var_94_26
			end

			if arg_91_1.time_ >= var_94_21 + var_94_22 and arg_91_1.time_ < var_94_21 + var_94_22 + arg_94_0 then
				var_94_20.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_94_27 = manager.ui.mainCamera.transform.position - var_94_20.position

				var_94_20.forward = Vector3.New(var_94_27.x, var_94_27.y, var_94_27.z)

				local var_94_28 = var_94_20.localEulerAngles

				var_94_28.z = 0
				var_94_28.x = 0
				var_94_20.localEulerAngles = var_94_28
			end

			local var_94_29 = 0

			if var_94_29 < arg_91_1.time_ and arg_91_1.time_ <= var_94_29 + arg_94_0 then
				arg_91_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action2_1")
			end

			local var_94_30 = 0

			if var_94_30 < arg_91_1.time_ and arg_91_1.time_ <= var_94_30 + arg_94_0 then
				arg_91_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_94_31 = 0
			local var_94_32 = 0.225

			if var_94_31 < arg_91_1.time_ and arg_91_1.time_ <= var_94_31 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_33 = arg_91_1:FormatText(StoryNameCfg[73].name)

				arg_91_1.leftNameTxt_.text = var_94_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_34 = arg_91_1:GetWordFromCfg(106061023)
				local var_94_35 = arg_91_1:FormatText(var_94_34.content)

				arg_91_1.text_.text = var_94_35

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_36 = 9
				local var_94_37 = utf8.len(var_94_35)
				local var_94_38 = var_94_36 <= 0 and var_94_32 or var_94_32 * (var_94_37 / var_94_36)

				if var_94_38 > 0 and var_94_32 < var_94_38 then
					arg_91_1.talkMaxDuration = var_94_38

					if var_94_38 + var_94_31 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_38 + var_94_31
					end
				end

				arg_91_1.text_.text = var_94_35
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061023", "story_v_out_106061.awb") ~= 0 then
					local var_94_39 = manager.audio:GetVoiceLength("story_v_out_106061", "106061023", "story_v_out_106061.awb") / 1000

					if var_94_39 + var_94_31 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_39 + var_94_31
					end

					if var_94_34.prefab_name ~= "" and arg_91_1.actors_[var_94_34.prefab_name] ~= nil then
						local var_94_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_34.prefab_name].transform, "story_v_out_106061", "106061023", "story_v_out_106061.awb")

						arg_91_1:RecordAudio("106061023", var_94_40)
						arg_91_1:RecordAudio("106061023", var_94_40)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_106061", "106061023", "story_v_out_106061.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_106061", "106061023", "story_v_out_106061.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_41 = math.max(var_94_32, arg_91_1.talkMaxDuration)

			if var_94_31 <= arg_91_1.time_ and arg_91_1.time_ < var_94_31 + var_94_41 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_31) / var_94_41

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_31 + var_94_41 and arg_91_1.time_ < var_94_31 + var_94_41 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play106061024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 106061024
		arg_95_1.duration_ = 3.933

		local var_95_0 = {
			ja = 3.6,
			ko = 3.066,
			zh = 2,
			en = 3.933
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

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_98_1 = 0
			local var_98_2 = 0.225

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_3 = arg_95_1:FormatText(StoryNameCfg[73].name)

				arg_95_1.leftNameTxt_.text = var_98_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_4 = arg_95_1:GetWordFromCfg(106061024)
				local var_98_5 = arg_95_1:FormatText(var_98_4.content)

				arg_95_1.text_.text = var_98_5

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_6 = 9
				local var_98_7 = utf8.len(var_98_5)
				local var_98_8 = var_98_6 <= 0 and var_98_2 or var_98_2 * (var_98_7 / var_98_6)

				if var_98_8 > 0 and var_98_2 < var_98_8 then
					arg_95_1.talkMaxDuration = var_98_8

					if var_98_8 + var_98_1 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_1
					end
				end

				arg_95_1.text_.text = var_98_5
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106061", "106061024", "story_v_out_106061.awb") ~= 0 then
					local var_98_9 = manager.audio:GetVoiceLength("story_v_out_106061", "106061024", "story_v_out_106061.awb") / 1000

					if var_98_9 + var_98_1 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_9 + var_98_1
					end

					if var_98_4.prefab_name ~= "" and arg_95_1.actors_[var_98_4.prefab_name] ~= nil then
						local var_98_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_4.prefab_name].transform, "story_v_out_106061", "106061024", "story_v_out_106061.awb")

						arg_95_1:RecordAudio("106061024", var_98_10)
						arg_95_1:RecordAudio("106061024", var_98_10)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_106061", "106061024", "story_v_out_106061.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_106061", "106061024", "story_v_out_106061.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_11 = math.max(var_98_2, arg_95_1.talkMaxDuration)

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_11 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_1) / var_98_11

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_1 + var_98_11 and arg_95_1.time_ < var_98_1 + var_98_11 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C02b"
	},
	voices = {
		"story_v_out_106061.awb"
	}
}
